<?php

namespace app\admin\controller;

use app\admin\controller\AdminPlatform;

class Index extends AdminPlatform
{
	public function index()
	{
		// dump( config('view_replace_str') );
		$title = '后台首页';
		$this->assign('title',$title);
		$this->assign('breadcrumb',[]);
		return $this->fetch();
	}

	public function test()
	{
		$this->assign('title','test');
		return $this->fetch();
	}
}