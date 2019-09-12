<?php
namespace app\admin\controller;

use \think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\ProductCat as ProductCatModel;
use app\admin\model\Product as ProductModel;
use app\admin\model\ProductGallery as ProductGalleryModel;


class Product extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '产品列表'
		]
	];

	public function index()
	{
		# 标题
		$title = $this->breadcrumb[0]['name'];

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('hasScript',1);

		# 分类树
		$ProductCatModel = new ProductCatModel;
		$catTree = $ProductCatModel->getTree2();
		$this->assign('catTree',$catTree);

		$ProductModel = new ProductModel;
		$paginate = 10;
		# 如果是搜索则按照条件查询商品列表
		# 否则查询全部商品
		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$where = [];
			$where['is_delete'] = 0;
			if (isset($data['cat_id']) && $data['cat_id']) {
				// $where['cat_id'] = ['eq',$data['cat_id']];
				$search_cat_id = $ProductCatModel->getChildrenIdAndSelf($data['cat_id']);
				// print_r($search_cat_id);
				$where['cat_id'] = ['in',$search_cat_id];
			}
			if (isset($data['keywords']) && trim($data['keywords'])) {
				$where['goods_name'] = ['like','%'.$data['keywords'].'%'];
			}
			if (!empty($where)) {
				$this->assign('searchList',$data);
			}
			// dump($where);
			$listData = $ProductModel->getCurrentPageData($where,4);
		} else {
			$where = [];
			$where['is_delete'] = 0;
			// $listData = $ProductModel::where($where)->order('id desc')->paginate($paginate);
			$listData = $ProductModel->getCurrentPageData($where,4);
		}

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加商品';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','insert');

		# 分类树
		$ProductCatModel = new ProductCatModel;
		$catTree = $ProductCatModel->getTree2();
		$this->assign('catTree',$catTree);

		# 获取session
		$session = session('admin');
		$admin_id = $session['admin_uid'];

		$this->assign('editData',[]);
		$this->assign('galleryList',[]);
		$this->assign('galleryImgNumber',0);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑产品';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','update');

		$ProductCatModel = new ProductCatModel;
		$catTree = $ProductCatModel->getTree2();
		// dump($catTree);
		$ProductModel = new ProductModel;
		$id = input('id');
		$editData = $ProductModel->find($id);

		// 获取商品相册图片
		$galleryList = ProductGalleryModel::where('goods_id',$id)->select();
		$galleryImgNumber = count($galleryList);

		$this->assign('catTree',$catTree);
		$this->assign('editData',$editData);
		$this->assign('id',$id);		
		$this->assign('galleryList',$galleryList);
		$this->assign('galleryImgNumber',$galleryImgNumber);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('product_content_manage');

		$postData = input('post.');
		// 商品数据
		$data = $postData['data'];

		// 上传图片
		$fileList = request()->file();
		// $file = request()->file('upfile');
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','image',1,[300,150],[400,300]);
				if (!empty($imgArr)) {
					$data['original_img'] = $imgArr['file_original_url'];
					$data['goods_img'] = $imgArr['file_url'];
					$data['goods_thumb'] = $imgArr['file_thumb_url'];
				}
			}
		}

		$create_time = time();
		$data['add_time'] = $create_time;
		$data['last_update'] = $create_time;

		$ProductModel = new ProductModel;
		$trans_result = true;
		// 启动事务
		$ProductModel::startTrans();
		try{
		    // 添加商品数据
			$id = $ProductModel::insertGetId($data);
			// echo 'id='.$id.'<br>';
			// 添加相册图片
			// $galleryFileArr = request()->file('imgFile');
			$galleryFileArr = $fileList['imgFile'];
			if (!empty($galleryFileArr)) {
		       	$gallery = [];
		       	foreach ($galleryFileArr as $key => $value) {
		       		$gallery[$key] = $this->upFile($value,'image','gallery',1,[300,150]);
		       		$galleryArr = [];
		       		$galleryArr['goods_id'] = $id;
		       		$galleryArr['img_original'] = $gallery[$key]['file_original_url'];
		       		$galleryArr['img_url'] = $gallery[$key]['file_url'];
		       		$galleryArr['thumb_url'] = $gallery[$key]['file_thumb_url'];
					$gid = ProductGalleryModel::insert($galleryArr);
					// echo 'gid='.$gid.'<br>';
		       	}
	       	}

	       	$session = session('admin');
		    // 提交事务
		    $ProductModel::commit();
		} catch (\Exception $e) {
		    $trans_result = false;
		    // 回滚事务
		    $ProductModel::rollback();		    
		}
		if ($trans_result) {
		    // 管理日志
			$log_info = '产品添加成功，产品id='.$id.'|Product';
			$this->addAdminLog($log_info,1);
			// 跳转
			return $this->success('产品添加成功！','index');
		} else {
			# 删除商品图片
			if (isset($data['original_img']) && $data['original_img']) {
				@unlink(__DIR__.'/../../../public/'.$data['original_img']);
				@unlink(__DIR__.'/../../../public/'.$data['goods_img']);
				@unlink(__DIR__.'/../../../public/'.$data['goods_thumb']);
			}
			# 删除相册图片
		    if (!empty($gallery)) {
		    	foreach ($gallery as $key => $value) {
		    		@unlink(__DIR__.'/../../../public/'.$value);

		    	}
		    }
			return $this->error('产品添加失败！');
		}
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('product_content_manage');

		$postData = input('post.');
		// 商品数据
		$data = $postData['data'];
		// 商品id
		$id = $postData['id'];
		// 商品模型
		$ProductModel = new ProductModel;

		// 上传图片
		$fileList = request()->file();
		// dump($fileList);exit;
		// 商品图片，非相册图片
		$file = isset($fileList['upfile']) ? $fileList['upfile'] : [];
		$imgArr = [];
		if (!empty($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','image',1,[300,150],[400,300]);
			if (!empty($imgArr)) {
				$data['original_img'] = $imgArr['file_original_url'];
				$data['goods_img'] = $imgArr['file_url'];
				$data['goods_thumb'] = $imgArr['file_thumb_url'];
			}
		}

		$update_time = time();
		$data['last_update'] = $update_time;

		$trans_result = true;
		# 商品数据
		$editData = $ProductModel->find($id);

		// 启动事务
		$ProductModel::startTrans();
		try {
			// 编辑数据
			$res = $ProductModel->save($data,['id'=>$id]);
			// 添加相册图片
			// $galleryFileArr = request()->file('imgFile');
			$galleryFileArr = isset($fileList['imgFile']) ? $fileList['imgFile'] : [];
			if (!empty($galleryFileArr)) {
		       	$gallery = [];
		       	foreach ($galleryFileArr as $key => $value) {
		       		$gallery[$key] = $this->upFile($value,'image','gallery',1,[300,150]);
		       		$galleryArr = [];
		       		$galleryArr['goods_id'] = $id;
		       		$galleryArr['img_original'] = $gallery[$key]['file_original_url'];
		       		$galleryArr['img_url'] = $gallery[$key]['file_url'];
		       		$galleryArr['thumb_url'] = $gallery[$key]['file_thumb_url'];
					$gid = ProductGalleryModel::insert($galleryArr);
					// echo 'gid='.$gid.'<br>';
		       	}
	       	}
	       	// 管理日志
			$log_info = '产品数据编辑成功，商品id='.$id.'|Product';
			$this->addAdminLog($log_info,1);
			# 如果更新了商品图片，则删除旧图片
			if (isset($data['original_img']) && $data['original_img'] && isset($editData['original_img']) && $editData['original_img']) {
				@unlink(__DIR__.'/../../../public/'.$editData['original_img']);
				@unlink(__DIR__.'/../../../public/'.$editData['goods_img']);
				@unlink(__DIR__.'/../../../public/'.$editData['goods_thumb']);
			}
			// 提交事务
			$ProductModel->commit();
		} catch (Exception $e) {
			$trans_result = false;
		    // 回滚事务
		    $ProductModel::rollback();		
		}

		// 跳转
		return $this->success('产品数据编辑成功！','index');
	}

	// 将商品放入回收站
	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('product_content_manage');

		$id = input('id');
		$ProductModel = new ProductModel;
		$data = [];
		$data['is_delete'] = 1;
		$res = $ProductModel->save($data,['id'=>$id]);

		if ($res) {
			return $this->success('数据放入回收站成功');
		}
		return $this->error('数据放入回收站失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('product_content_manage');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$saveData = [];
			foreach ($ids as $k=>$id) {
				# 放到回收站
				$saveData[$k]['id'] = $id;
				$saveData[$k]['is_delete'] = 1;
			}
			$res = $ProductModel->saveAll($saveData);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	public function changeType()
	{
		$postData = input('post.');
		$data = $postData['data'];
		$type = $data['changeType'];
		$goodsId = $postData['goodsId'];
		$flag = 0;
		if (isset($type) && $type) {
			if (!empty($goodsId)) {
				$where = [];
				switch ($type) {
					case 'trash':
						$where['is_delete'] = 1;
						break;
					case 'move_to':
						if (isset($data['changeCatId']) && $data['changeCatId']) {
							$where['cat_id'] = $data['changeCatId'];
						} else {
							$flag = 1;
						}
						break;
				}
				if ($flag==1) {
					return $this->error('请选择要改变的分类');
				}
				$ProductModel = new ProductModel;
				foreach ($goodsId as $gid) {
					ProductModel::where(['id'=>$gid])->update($where);
					// echo $GoodsModel->getLastSql();
				}
			}
			return $this->success('数据更新成功');
		}
		return $this->error('请选择要执行的操作');
	}

	public function deleteGalleryForAjax()
	{
		// 获取传递过来的key值，即goods_gallery表的主键id值
		$id = input('key');
		// $id = 11;
		$ProductGalleryModel = new ProductGalleryModel;
		$data = $ProductGalleryModel->find($id);
		$res = $ProductGalleryModel->where(['id'=>$id])->delete();
		if ($res) {
			# 删除相册图片
			@unlink(__DIR__.'/../../../public/'.$data['img_original']);
			@unlink(__DIR__.'/../../../public/'.$data['img_url']);
			@unlink(__DIR__.'/../../../public/'.$data['thumb_url']);
		}
		return 1;
	}
}
?>