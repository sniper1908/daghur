<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\GoodsArticle as GoodsArticleModel;

class GoodsArticle extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品关联文章列表'
		]
	];

	public function index()
	{
		echo 'test';
	}

	// 添加商品关联文章数据
	// 添加商品时，goods_id=0 
	public function addItemForAjax()
	{
		$postData = input('post.');
		$GoodsArticleModel = new GoodsArticleModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$res = $GoodsArticleModel->insert($postData);
		echo $res;
		exit;
	}

	public function delItemForAjax()
	{
		$postData = input('post.');
		$GoodsArticleModel = new GoodsArticleModel;
		$session = session('admin');
		$postData['admin_id'] = $session['admin_uid'];
		$where = [];
		$where['admin_id'] = $session['admin_uid'];
		$where['goods_id'] = $postData['goods_id'];
		$where['article_id'] = $postData['article_id'];
		$res = $GoodsArticleModel->where($where)->delete();
		echo $res;
		exit;
	}
}
?>