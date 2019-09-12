<?php
namespace app\admin\model;

use think\Model;

class PaperQuestions extends Model
{
	public function getName1()
	{
		return $this->hasOne('Questions1','id','question_id')->field('question_title');
	}

	public function getName2()
	{
		return $this->hasOne('Questions2','id','question_id')->field('question_title');
	}

	public function getName3()
	{
		return $this->hasOne('Questions3','id','question_id')->field('question_title');
	}

	public function getName4()
	{
		return $this->hasOne('Questions4','id','question_id')->field('question_title');
	}

	public function getName5()
	{
		return $this->hasOne('Questions5','id','question_id')->field('question_title');
	}
}