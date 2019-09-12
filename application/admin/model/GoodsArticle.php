<?php
namespace app\admin\model;

use think\Model;

class GoodsArticle extends Model
{
	public function getList($id=0)
	{
		# 如果id为0，则获取全部与商品有关的文章列表
		# 否则获取与该商品关联的文章列表
		if ($id) {
			# select db_article.id,db_article.article_title from db_goods_article join db_article on db_goods_article.article_id=db_article.id where db_goods_article.goods_id=$id;
			$res = $this
				->field('a.id,a.article_title,ga.id gaid')
				->alias('ga')
				->join('article a','ga.article_id=a.id')
				->where(['ga.goods_id'=>$id])
				->select();
		} else {
			$res = $this
				->field('a.id,a.article_title,ga.id gaid')
				->alias('ga')
				->join('article a','ga.article_id=a.id')
				->select();
		}
		return $res;
	}
}