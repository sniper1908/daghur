<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\GoodsGroup as GoodsGroupModel;

class GoodsGroup extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品配件列表'
		]
	];

	public function index()
	{
		echo 'test';
	}

	// 添加商品配件数据
	// 添加商品时，goods_id=0 
	public function addItemForAjax()
	{
		$postData = input('post.');
		$GoodsGroupModel = new GoodsGroupModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$res = $GoodsGroupModel->insert($postData);
		echo $res;
		exit;
	}

	public function delItemForAjax()
	{
		$postData = input('post.');
		$GoodsGroupModel = new GoodsGroupModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$where = [];
		$where['admin_id'] = $session['admin_uid'];
		$where['goods_id'] = $postData['goods_id'];
		$where['parent_id'] = $postData['parent_id'];
		$res = $GoodsGroupModel->where($where)->delete();
		echo $res;
		exit;
	}
}
?>