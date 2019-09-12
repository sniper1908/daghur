<?php
namespace app\admin\model;

use think\Model;

class Questions extends Model
{
	public function getLevel()
	{
		return $this->hasOne('PaperLevel','id','level_id')->field('level_name');
	}

	public function getCat()
	{
		return $this->hasOne('PaperCategory','id','cat_id')->field('cat_name');
	}
}