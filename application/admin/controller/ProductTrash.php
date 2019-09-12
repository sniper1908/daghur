<?php
namespace app\admin\controller;

use think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\Product as ProductModel;
use app\admin\model\ProductCat as ProductCatModel;
use app\admin\model\ProductGallery as ProductGalleryModel;

class ProductTrash extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '产品回收站列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('product_content_manage');
		
		# 标题
		$title = $this->breadcrumb[0]['name'];

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('hasScript',1);

		# 分类树
		// $CategoryModel = new CategoryModel;
		// $catTree = $CategoryModel->getTree2();
		// $this->assign('catTree',$catTree);

		$ProductModel = new ProductModel;
		$paginate = 10;
		# 如果是搜索则按照条件查询商品列表
		# 否则查询全部商品
		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$where = [];
			$where['is_delete'] = 1;
			if (isset($data['keywords']) && trim($data['keywords'])) {
				$where['goods_name'] = ['like','%'.$data['keywords'].'%'];
			}
			if (!empty($where)) {
				$this->assign('searchList',$data);
			}
			// dump($where);
			$listData = $ProductModel->getCurrentPageData($where,4);
			// echo $GoodsModel->getLastSql();
		} else {
			$where = [];
			$where['is_delete'] = 1;
			$listData = $ProductModel->getCurrentPageData($where,4);
		}

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	// 还原商品数据
	public function edit()
	{
		$id = input('id');
		$res = $this->editOneGoods($id);
		if ($res['flag']) {
			return $this->success($res['msg']);
		}
		return $this->error($res['msg']);
	}

	// 删除商品数据
	public function del()
	{
		$id = input('id');
		$res = $this->delOneGoods($id);
		if ($res['flag']) {
			return $this->success($res['msg']);
		}
		return $this->error($res['msg']);
	}

	public function delall()
	{
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$res = $this->batchDelGoods($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	public function batchOper()
	{
		$postData = input('post.');
		$data = $postData['data'];
		# 操作
		$changeType = isset($data['changeType']) && $data['changeType'] ? $data['changeType'] : '';
		# id数组
		$ids = $postData['goodsId'];
		if (!empty($ids) && $changeType) {
			if ($changeType == 'back') {
				# 还原
				foreach ($ids as $key => $id) {
					$this->editOneGoods($id);
				}
			} else if ($changeType == 'drop') {
				# 删除
				foreach ($ids as $key => $id) {
					$this->delOneGoods($id);
				}
			}
			return $this->success('操作完成');
		}
		return $this->error('操作失败');
	}

	protected function editOneGoods($id)
	{
		$res = [];

		if ($id) {
			$bol = ProductModel::where(['id'=>$id])->update(['is_delete'=>0]);
			if ($bol) {
				$res['flag'] = true;
				$res['msg'] = '产品数据还原成功！';
				// return $this->success('商品数据还原成功！');
				# 管理员日志
				$log_info = '产品数据还原成功，商品id='.$id.'|Product';
				$this->addAdminLog($log_info,1);
			} else {
				$res['flag'] = false;
				$res['msg'] = '产品数据还原失败！';
				// return $this->error('商品数据还原失败！');
			}
		} else {
			$res['flag'] = false;
			$res['msg'] = '缺少产品数据！';
			// return $this->error('缺少商品数据！');
		}
		return $res;
	}

	protected function delOneGoods($id)
	{
		$res = [];

		if ($id) {
			# 商品图片
			$goodsData = ProductModel::field('original_img,goods_img,goods_thumb')->where(['id'=>$id])->select();
			# 商品相册
			$galleryData = ProductGalleryModel::where(['goods_id'=>$id])->select();
			
			# 开启事务
			ProductModel::startTrans();
			$flag = false;
			try {
				$where = [];
				$where['goods_id'] = ['eq',$id];
				# 删除商品相册表数据
				ProductGalleryModel::where($where)->delete();
				# 删除商品数据
				ProductModel::where(['id'=>$id])->delete();
				$flag = true;
				# 提交
				ProductModel::commit();
			} catch (\Exception $e) {
				ProductModel::rollback();
			}
			if ($flag) {
				# 删除成功，则删除商品图片和相册图片
				# 删除商品图片
				if (!empty($goodsData)) {
					foreach ($goodsData as $key => $value) {
						@unlink(__DIR__.'/../../../public/'.$value['original_img']);
						@unlink(__DIR__.'/../../../public/'.$value['goods_img']);
						@unlink(__DIR__.'/../../../public/'.$value['goods_thumb']);
					}
				}
				# 删除相册图片
				if (!empty($galleryData)) {
					foreach ($galleryData as $key => $value) {
						@unlink(__DIR__.'/../../../public/'.$value['img_original']);
						@unlink(__DIR__.'/../../../public/'.$value['img_url']);
						@unlink(__DIR__.'/../../../public/'.$value['thumb_url']);
					}
				}
				$res['flag'] = true;
				$res['msg'] = '数据删除成功！';
				$log_info = '商品数据删除成功，商品id='.$id.'|Goods';
				$this->addAdminLog($log_info,3);
				// return $this->success('数据删除成功！');
			} else {
				$res['flag'] = false;
				$res['msg'] = '数据删除失败，请重新删除！';
				// return $this->error('数据删除失败，请重新删除！');
			}
		} else {
			$res['flag'] = false;
			$res['msg'] = '数据信息不完整，请重新删除！';
		}
		return $res;
	}
}