<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\GoodsLink as GoodsLinkModel;

class GoodsLink extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品关联列表'
		]
	];

	public function index()
	{
		echo 'test';
	}

	// 添加商品关联数据
	// 添加商品时，goods_id=0 
	public function addItemForAjax()
	{
		$postData = input('post.');
		$GoodsLinkModel = new GoodsLinkModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$res = $GoodsLinkModel->insert($postData);
		echo $res;
		exit;
	}

	public function delItemForAjax()
	{
		$postData = input('post.');
		$GoodsLinkModel = new GoodsLinkModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$where = [];
		$where['admin_id'] = $session['admin_uid'];
		$where['goods_id'] = $postData['goods_id'];
		$where['link_goods_id'] = $postData['link_goods_id'];
		$res = $GoodsLinkModel->where($where)->delete();
		echo $res;
		exit;
	}
}
?>