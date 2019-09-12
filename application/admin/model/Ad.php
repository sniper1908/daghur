<?php
namespace app\admin\model;

use think\Model;
use app\admin\model\Advertising;

class Ad extends Model
{
	public function getAdvNameAttr($adv_id)
	{
		$data = Advertising::field('adv_name')->find($adv_id);

		return $data['adv_name'];
	}
}