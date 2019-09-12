<?php
namespace app\admin\model;

use think\Model;
use app\admin\model\ProductCat as ProductCatModel;

class Product extends Model
{
	// protected $autoWriteTimestamp = true;

	public function getUpdateTimeAttr($value='')
	{
		return $value ? date('Y-m-d H:i:s',$value) : '--';
	}

	protected function getCatName($cat_id)
	{
		$res = ProductCatModel::where(['id'=>$cat_id])->field('cat_name')->find()->toArray();
		return $res['cat_name'];
	}

	public function getCurrentPageData($where='',$paginate=2)
	{
		$listData = $this
			->field('id,goods_name,goods_name_style,goods_thumb,is_show,cat_id,last_update,click_count')
			->where($where)
			->order('id desc')
			->paginate($paginate);

		if (!empty($listData)) {
			foreach ($listData as $key => $value) {
				$listData[$key]['cat_name'] = $this->getCatName($value['cat_id']);
			}
		}

		return $listData;
	}
}
?>