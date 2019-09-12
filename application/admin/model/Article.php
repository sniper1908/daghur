<?php
namespace app\admin\model;

use think\Model;
use app\admin\model\ArticleCat as ArticleCatModel;

class Article extends Model
{
	protected $autoWriteTimestamp = true;

	public function getUpdateTimeAttr($value='')
	{
		return $value ? date('Y-m-d H:i:s',$value) : '--';
	}

	// public function getCatIdAttr($cat_id=0)
	// {
	// 	$res = ArticleCatModel::where(['id'=>$cat_id])->field('cat_name')->find()->toArray();
	// 	return $res['cat_name'];
	// }

	protected function getCatName($cat_id)
	{
		$res = ArticleCatModel::where(['id'=>$cat_id])->field('cat_name')->find()->toArray();
		return $res['cat_name'];
	}

	public function getCurrentPageData($where='',$paginate=2)
	{
		$listData = $this
			->field('id,article_title,article_title_color,is_top,is_show,cat_id,update_time')
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