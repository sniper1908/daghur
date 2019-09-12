<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Navigator as NavigatorModel;

class NavManage extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '自定义导航栏列表'
		]
	];

	# 导航位置
	protected $navType = [
		'top' => '头部',
		'middle' => '中间',
		'bottom' => '底部'
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('custom_nav_bar');
		
		# 标题
		$title = '自定义导航栏列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$NavigatorModel = new NavigatorModel;
		$top = $NavigatorModel->where(['nav_type'=>'top'])->order('if_show desc,sort_order asc,id asc')->select();
		$midle = $NavigatorModel->where(['nav_type'=>'midle'])->order('if_show desc,sort_order asc,id asc')->select();
		$bottom = $NavigatorModel->where(['nav_type'=>'bottom'])->order('if_show desc,sort_order asc,id asc')->select();

		$this->assign('top',$top);
		$this->assign('midle',$midle);
		$this->assign('bottom',$bottom);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加自定义导航';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');
		$this->assign('editData',[]);
		$this->assign('navType',$this->navType);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑自定义导航';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');
		$this->assign('navType',$this->navType);

		$NavigatorModel = new NavigatorModel;
		
		$id = input('id');
		$editData = $NavigatorModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('custom_nav_bar');

		$postData = input('post.');
		$data = $postData['data'];
		// 添加数据
		$_id = NavigatorModel::insertGetId($data);

		if ($_id) {
			return $this->success('自定义导航添加成功！','index');
		}
		return $this->error('自定义导航添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('custom_nav_bar');

		$postData = input('post.');
		$data = $postData['data'];
		// 编辑数据
		$NavigatorModel = new NavigatorModel;
		$res = $NavigatorModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('自定义导航编辑成功！','index');
		}
		return $this->error('自定义导航编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('custom_nav_bar');

		$id = input('id');
		$NavigatorModel = new NavigatorModel;

		# 删除
		$res = $NavigatorModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('custom_nav_bar');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$NavigatorModel = new NavigatorModel;
			$res = $NavigatorModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}
}