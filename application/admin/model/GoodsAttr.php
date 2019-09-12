<?php
namespace app\admin\model;

use think\Model;

class GoodsAttr extends Model
{
	public function getGoodsAttr($goods_id)
	{
		$attributeList = $this
					->field('a.*,ga.id ga_id,ga.goods_id,ga.attr_id,ga.attr_value,ga.attr_price')
		            ->alias('ga')
		            ->join('attribute a','ga.attr_id=a.id')
		            ->where(['ga.goods_id'=>$goods_id])
		            ->select();

		return $attributeList;
	}

	public function getGoodsAttrTypeForGroup($goods_id)
	{
		$res = [];
		$list = $this->field('a.*,ga.id ga_id,ga.goods_id,ga.attr_id,ga.attr_value,ga.attr_price')
		            ->alias('ga')
		            ->join('attribute a','ga.attr_id=a.id')
		            ->where(['ga.goods_id'=>$goods_id,'a.attr_type'=>['in',[1,2]]])
		            ->group('a.id')
		            ->select();
		if (!empty($list)) {
			# 找到ga_id
			foreach ($list as $key => $value) {
				$res[] = $value['ga_id'];
			}
		}
		return $res;
	}
}