<?php 
namespace app\admin\controller;

use think\Image;
use app\admin\controller\AdminPlatform;
use app\admin\model\ArticleCat as ArticleCatModel;
use app\admin\model\Article as ArticleModel;
use app\admin\model\AdminLog;

class Article extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '文章列表'
		]
	];

	public function index()
	{
		# 标题
		$title = '文章列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$cat_id = (int)input('cat_id');
		$where = $this->getListCondition($cat_id);
		$ArticleModel = new ArticleModel;
		$listData = $ArticleModel
			->field('id,article_title,article_title_color,is_top,is_show,cat_id,update_time')
			->where($where)
			->order('id desc')
			->paginate(2);

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
		// 上传图片
		$file = request()->file('upfile');
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file);
		}

		$session = session('admin');
		// dump(input('post.'));
		$postData = input('post.');
		$artData = $postData['art'];
		// $artData['article_img'] = $imgArr['img_url'];
		if (!empty($imgArr) && isset($imgArr['img_url']) && $imgArr['img_url']) {
			$artData['article_img'] = $imgArr['img_url'];
		}
		$create_time = time();
		$artData['create_time'] = $create_time;
		$artData['update_time'] = $create_time;
		// 添加文章数据
		$ArticleModel = new ArticleModel;
		$id = $ArticleModel::insertGetId($artData);
		// 添加管理日志
		// $AdminLogModel = new AdminLog;
		// $AdminLogModel->admin_id = $session['admin_uid'];
		// $AdminLogModel->log_type = 1;
		// $AdminLogModel->log_info = '添加文章成功，文章id='.$id.'|Article';
		// $AdminLogModel->admin_ip = request()->ip();
		// $AdminLogModel->save();
		

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
		// 上传图片
		$file = request()->file('upfile');
		// dump($file);
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file);
		}

		$session = session('admin');
		$postData = input('post.');
		$artData = $postData['art'];
		$update_time = time();
		$artData['update_time'] = $update_time;

		if (!empty($imgArr) && isset($imgArr['img_url']) && $imgArr['img_url']) {
			$artData['article_img'] = $imgArr['img_url'];
		}
		// 编辑文章数据
		$ArticleModel = new ArticleModel;
		if (!empty($imgArr) && isset($imgArr['img_url']) && $imgArr['img_url']) {
			# 如果曾经上传过图片
			$ArticleModel = new ArticleModel;
			$old_img_arr = $ArticleModel->field('article_img')->where(['id'=>$postData['id']])->find()->toArray();
		}
		$res = $ArticleModel->save($artData,['id'=>$postData['id']]);
		

		if ($res) {
			// 删除原图片
			@unlink('../'.$old_img_arr['article_img']);

			// 管理日志
			$log_info = '编辑文章成功，文章id='.$postData['id'].'|Article';
			$this->addAdminLog($log_info,2);

			return $this->success('文章编辑成功！','index');
		}
		return $this->error('文章编辑失败！');
	}


	protected function upFile($file,$fileType='image')
	{
		// dump($file);
		$fileInfo = $file->getInfo();
		$fileNameArr = explode('.', $fileInfo['name']);
		$fileName = date('YmdHis').mt_rand(1,99999);
		$dirName = 'upload/'.$fileType.'/'.date('Ymd');
		if (!file_exists($dirName)) {
			mkdir($dirName);
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
		$session = session('admin');
		$id = input('id');
		$ArticleModel = new ArticleModel;
		$old_img_arr = $ArticleModel->field('article_img')->where(['id'=>$id])->find()->toArray();
		$res = $ArticleModel::destroy($id);

		if ($res) {
			@unlink($old_img_arr['article_img']);

			$log_info = '删除文章成功，文章id='.$id.'|Article';
			$this->addAdminLog($log_info,3);

			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		$postData = input('post.');
		$idList = $postData['delId'];
		$idListStr = implode(',',$idList);
		// dump($idList);
		if (!empty($idList)) {
			# 删除数据
			$ArticleModel = new ArticleModel;
			$res = $ArticleModel->destroy($idList);
			if ($res) {
				# 管理日志
				$log_info = '批量删除文章成功，文章id为 '.$idListStr.' |Article';
				$this->addAdminLog($log_info,5);
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	protected function addAdminLog($log_info,$log_type=1)
	{
		$AdminLogModel = new AdminLog;
		$session = session('admin');
		$AdminLogModel->admin_id = $session['admin_uid'];
		$AdminLogModel->log_type = $log_type;
		$AdminLogModel->log_info = $log_info;
		$AdminLogModel->admin_ip = request()->ip();
		$AdminLogModel->save();
	}
}

?>