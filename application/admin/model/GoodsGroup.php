<?php
namespace app\admin\model;

use think\Model;

class GoodsGroup extends Model
{
	public function getList($id=0)
	{
		# 如果id为0，则获取全部配件的商品列表
		# 否则获取与该商品关联的商品配件列表
		if ($id) {
			# select db_goods.id gid,db_goods.goods_name from db_goods_group join db_goods on db_goods_group.goods_id=db_goods.id where db_goods_group.parent_id=$id;
			$res = $this
				->field('g.id,g.goods_name,gg.id ggid')
				->alias('gg')
				->join('goods g','gg.goods_id=g.id')
				->where(['gg.parent_id'=>$id])
				->select();
		} else {
			$res = $this
				->field('g.id,g.goods_name,gg.id ggid')
				->alias('gg')
				->join('goods g','gg.goods_id=g.id')
				->select();
		}
		return $res;
	}
}