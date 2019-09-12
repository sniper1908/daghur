<?php
namespace app\admin\model;

use think\Model;

class GoodsLink extends Model
{
	public function getList($id=0)
	{
		# 如果id为0，则获取全部有关联商品的商品列表
		# 否则获取与该商品关联的商品列表
		if ($id) {
			# select db_goods.id gid,db_goods.goods_name from db_goods_link join db_goods on db_goods_link.link_goods_id=db_goods.id where db_goods_link.goods_id=$id;
			$res = $this
				->field('g.id,g.goods_name,gl.id glid,gl.is_double')
				->alias('gl')
				->join('goods g','gl.link_goods_id=g.id')
				->where(['gl.goods_id'=>$id])
				->select();
		} else {
			$res = $this
				->field('g.id,g.goods_name,gl.id glid,gl.is_double')
				->alias('gl')
				->join('goods g','gl.link_goods_id=g.id')
				->select();
		}
		return $res;
	}
}