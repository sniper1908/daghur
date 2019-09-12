<?php
namespace app\admin\model;

use think\Model;

class Papers extends Model
{
	public function getLevel()
	{
		return $this->hasOne('PaperLevel','id','level_id')->field('level_name');
	}

	public function getPaperType()
	{
		return $this->hasOne('PaperType','id','type_id')->field('type_name');
	}

	public function getPaperCat()
	{
		return $this->hasOne('PaperCategory','id','cat_id')->field('cat_name');
	}
}