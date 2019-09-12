<?php 
namespace app\admin\controller;

// 软删除
use traits\model\SoftDelete;
use think\Image;
use app\admin\controller\AdminPlatform;
use app\admin\model\ArticleCat as ArticleCatModel;
use app\admin\model\Article as ArticleModel;
use app\admin\model\AdminLog;

class Article extends AdminPlatform
{
	# 软删除
	use SoftDelete;

	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '文章列表'
		]
	];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg('article_content_manage');
	}

	public function index()
	{
		# 标题
		$title = '文章列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',0);

		$cat_id = (int)input('cat_id');
		$where = $this->getListCondition($cat_id);
		$ArticleModel = new ArticleModel;
		$listData = $ArticleModel->getCurrentPageData($where,4);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	/**
	 * [获取文章列表页的分类id]
	 * @param  string $pid [该列表页的分类id]
	 * @return [type]      [where条件语句]
	 */
	protected function getListCondition($pid='0')
	{
		if (!$pid) {
			# 如果没有分类id，则查询的是全部文章
			$where = '1=1';
		} else {
			$ArticleCatModel = new ArticleCatModel;
			$idList = $ArticleCatModel->getChildrenId($pid);
			if (!empty($idList)) {
				# 如果存在子分类，则查找子分类的全部文章
				# 如果该分类下有文章，也查出来
				$idListStr = implode(',',$idList);
				$where = "`cat_id`=".$pid." or `cat_id` in ($idListStr)";
			} else {
				# 没有子分类，查找该分类的全部文章
				$where = "`cat_id`='".$pid."'";
			}
		}

		return $where;
	}

	public function add()
	{
		$title = '添加文章';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');

		$ArticleCatModel = new ArticleCatModel;
		$catTree = $ArticleCatModel->getTree2();

		$this->assign('catTree',$catTree);
		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑文章';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$ArticleCatModel = new ArticleCatModel;
		$catTree = $ArticleCatModel->getTree2();
		// dump($catTree);
		$ArticleModel = new ArticleModel;
		$id = input('id');
		$editData = $ArticleModel->find($id);

		$this->assign('catTree',$catTree);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		$session = session('admin');
		// dump(input('post.'));
		$postData = input('post.');
		$artData = $postData['art'];
		// $artData['article_img'] = $imgArr['img_url'];
		
		// 上传图片
		$file = request()->file('upfile');
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','image');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$artData['article_img'] = $imgArr['file_url'];
			}
		}

		// 上传附件
		if (isset($artData['open_type']) && $artData['open_type']) {
			switch ($artData['open_type']) {
				case '1':
					# 上传附件
					$attach = request()->file('attach');
					if (!is_null($attach)) {
						# 有附件上传
						$attachArr = $this->upFile($attach,'attachment','attachment');
						if (!empty($attachArr) && isset($attachArr['file_url']) && $attachArr['file_url']) {
							$artData['file_url'] = $attachArr['file_url'];
						}
					}
					break;
				case '2':
					# 外部链接
					break;
				
				default:
					# 默认没有附件
					$artData['file_url'] = '';
					break;
			}
		}

		$create_time = time();
		$artData['create_time'] = $create_time;
		$artData['update_time'] = $create_time;
		// 添加文章数据
		$ArticleModel = new ArticleModel;
		$id = $ArticleModel::insertGetId($artData);		

		if ($id) {
			// 管理日志
			$log_info = '添加文章成功，文章id='.$id.'|Article';
			$this->addAdminLog($log_info,1);
			
			return $this->success('文章添加成功！','index');
		}
		return $this->error('文章添加失败！');
	}

	public function update()
	{

		$session = session('admin');
		$postData = input('post.');
		$artData = $postData['art'];
		$update_time = time();
		$artData['update_time'] = $update_time;
		$old_img_arr = $old_attach_arr = [];

		$ArticleModel = new ArticleModel;

		// 上传图片
		$file = request()->file('upfile');
		// dump($file);
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','image');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$artData['article_img'] = $imgArr['file_url'];
				# 如果曾经上传过图片
				$old_img_arr = $ArticleModel->field('article_img')->where(['id'=>$postData['id']])->find()->toArray();
			}
		}

		// 上传附件
		$isDelOldAttach = false; // 是否删除旧的附件
		if (isset($artData['open_type']) && $artData['open_type']) {
			switch ($artData['open_type']) {
				case '1':
					# 上传附件
					$attach = request()->file('attach');
					if (!is_null($attach)) {
						# 有附件上传
						$attachArr = $this->upFile($attach,'attachment','attachment');
						if (!empty($attachArr) && isset($attachArr['file_url']) && $attachArr['file_url']) {
							$artData['file_url'] = $attachArr['file_url'];
							$isDelOldAttach = true;
						}
					}
					break;
				case '2':
					# 外部链接
					$isDelOldAttach = true;
					break;
				
				default:
					# 默认没有附件
					$artData['file_url'] = '';
					$isDelOldAttach = true;
					break;
			}
		}
		

		// 查找旧附件
		if ($isDelOldAttach) {
			# 查找旧附件
			$old_attach_arr = $ArticleModel->field('file_url')->where(['id'=>$postData['id']])->find()->toArray();
		}

		// 编辑文章数据
		$res = $ArticleModel->save($artData,['id'=>$postData['id']]);		

		if ($res) {
			// 删除原图片
			if (!empty($old_img_arr) && isset($old_img_arr['article_img']) && $old_img_arr['article_img']) {
				@unlink(dirname(__FILE__).'/../../../public/'.$old_img_arr['article_img']);
			}
			// 删除原附件
			if (!empty($old_attach_arr) && isset($old_attach_arr['file_url']) && $old_attach_arr['file_url']) {
				@unlink(dirname(__FILE__).'/../../../public/'.$old_attach_arr['file_url']);
			}

			// 管理日志
			$log_info = '编辑文章成功，文章id='.$postData['id'].'|Article';
			$this->addAdminLog($log_info,2);

			return $this->success('文章编辑成功！','index');
		}
		return $this->error('文章编辑失败！');
	}

	protected function upFile2($file,$fileType='image')
	{
		// dump($file);
		$fileInfo = $file->getInfo();
		$fileNameArr = explode('.', $fileInfo['name']);
		$fileName = date('YmdHis').mt_rand(1,99999);
		$dirName = 'upload/'.$fileType.'/'.date('Ymd');
		if (!file_exists($dirName)) {
			mkdir($dirName,0777,true);
			chmod($dirName, 0777);
		}
		$fileUrl = $dirName.'/'.$fileName.'.'.$fileNameArr[1];
		if ($fileType=='image') {
			$fileThumbUrl = $dirName.'/'.$fileName.'_thumb.'.$fileNameArr[1];
		}
		// echo $fileUrl;//exit;
		$file->move($dirName,$fileName.'.'.$fileNameArr[1]);
		if ($fileType=='image') {
			$images = Image::open($fileUrl);
			$images->thumb(300,300)->save($fileThumbUrl);
		}
		// dump($images);
		$res = [];
		$res['file_url'] = $fileUrl;
		if ($fileType=='image') {
			$res['file_thumb_url'] = $fileThumbUrl;
		}

		return $res;
	}

	protected function upFileBackup($file,$fileType='image')
	{
		// dump($file);
		$fileInfo = $file->getInfo();
		$fileNameArr = explode('.', $fileInfo['name']);
		$fileName = date('YmdHis').mt_rand(1,99999);
		$dirName = 'upload/'.date('Ymd');
		if (!file_exists($dirName)) {
			mkdir($dirName);
			chmod($dirName, 0777);
		}
		$fileUrl = $dirName.'/'.$fileName.'.'.$fileNameArr[1];
		$fileThumbUrl = $dirName.'/'.$fileName.'_thumb.'.$fileNameArr[1];
		// echo $fileUrl;//exit;
		$file->move($dirName,$fileName.'.'.$fileNameArr[1]);
		$images = Image::open($fileUrl);
		$images->thumb(300,300)->save($fileThumbUrl);
		// dump($images);
		$res = [];
		$res['img_url'] = $fileUrl;
		$res['img_thumb_url'] = $fileThumbUrl;

		return $res;
	}

	public function del()
	{
		$id = input('id');
		$res = $this->delOneArticle($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$res = $this->batchDelArticle($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	/**
	 * [删除某篇文章]
	 * @param  [integer] $id [文章id]
	 * @return [Boolean]     [删除成功/失败]
	 */
	public function delOneArticle($id)
	{
		$ArticleModel = new ArticleModel;
		$old_file_arr = $ArticleModel->field('article_img,file_url')->where(['id'=>$id])->find()->toArray();
		$isDel = $ArticleModel->destroy($id);
		$res = $isDel;

		if ($isDel) {
			# 删除上传的图片、附件
			@unlink($old_file_arr['article_img']);
			@unlink($old_file_arr['file_url']);
			$log_info = '删除文章成功，文章id='.$id.'|Article';
			$this->addAdminLog($log_info,3);
		}

		return $res;
	}

	/**
	 * [批量删除某个分类下的文章]
	 * @param  [array/null] $ids [某个分类id]
	 * @return [Boolean]      [删除成功/失败]
	 */
	public function batchDelArticle($ids)
	{
		$ArticleModel = new ArticleModel;

		$res = 0;

		if (!empty($ids)) {
			$old_file_arr = [];
			foreach ($ids as $id) {
				$old_file_arr[$id] = $ArticleModel->field('article_img,file_url')->where(['id'=>$id])->find()->toArray();
			}
			$res = $ArticleModel->destroy($ids);
			if ($res) {
				# 管理日志
				$idsStr = implode(',',$ids);
				$log_info = '批量删除文章成功，文章id为 '.$idsStr.' |Article';
				$this->addAdminLog($log_info,5);
				# 删除上传的图片、附件
				foreach ($old_file_arr as $value) {
					@unlink($value['article_img']);
					@unlink($value['file_url']);
				}
			}
		}

		return $res;
	}

	/**
	 * [删除分类下的全部文章]
	 * @param  [array] $cat_ids [分类id数组，如果为空，则删除全部文章]
	 * @return [array]          [提示信息数组]
	 */
	public function batchDelArticleForCat($cat_ids=[])
	{
		$ArticleModel = new ArticleModel;
		$ArticleCatModel = new ArticleCatModel;
		$res = $msg = [];
		$res['error_no'] = 0;
		$res['msg'] = '批量删除文章成功';
		# 如果存在cat_ids 则删除该分类下全部文章
		# 如果不存在cat_ids，则删除全部文章
		if (empty($cat_ids)) {
			# 获取分类id
			$cat_ids = $ArticleCatModel->field('id')->select();
			if (!empty($cat_ids)) {
				foreach ($cat_ids as $key=>$value) {
					$value_arr = $value->toArray();
					$cat_ids[$key] = $value_arr['id'];
				}
			}
		}
		# 
		if (!empty($cat_ids)) {
			foreach ($cat_ids as $cat_id) {
				$ids = [];
				# 根据分类id，查找文章id列表
				$ids[$cat_id] = $ArticleModel->field('id')->where(['cat_id'=>$cat_id])->select();
				if (!empty($ids)) {
					foreach ($ids as $k=>$value) {
						$value_arr = $value->toArray();
						$ids[] = $value_arr['id'];
					}
					$is_del = $this->batchDelArticle($ids);
					if (!$is_del) {
						# 批量删除失败
						$error_cat_id[] = $cat_id;
						$res['error_no'] = 1;
					}
				}
			}
		}

		if (!empty($msg)) {
			# 如果批量删除失败，则把删除失败的分类id返回
			$error_cat_id_str = implode(',',$error_cat_id);
			$res['msg'] = '分类id='.$error_cat_id_str.'的文章批量删除失败';
		}

		return $res;
	}

	// 在添加/编辑商品时查询关联的文章列表
	public function searchLinkArticleForAjax()
	{
		$postData = input('post.');
		$ArticleModel = new ArticleModel;
		$where = [];
		if (isset($postData['keywords']) && $postData['keywords']) {
			$where['article_title'] = ['like','%'.$postData['keywords'].'%'];
		}
		if (isset($postData['cat_id']) && $postData['cat_id']) {
			$where['cat_id'] = ['eq',$postData['cat_id']];
		}
		// echo json_encode($where);exit;
		if (!empty($where)) {
			$res = $ArticleModel->field('id,article_title')->where($where)->select();
		} else {
			$res = $ArticleModel->field('id,article_title')->select();
		}
		echo json_encode($res);
		exit;
	}
}

?>