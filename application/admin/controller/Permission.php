<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Permission as PermissionModel;

class Permission extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '权限列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('permission_add_edit');
		
		# 标题
		$title = '权限列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);


		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$PermissionModel = new PermissionModel;
		$listData = $PermissionModel->getTree('page',1);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加权限';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		
		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$this->assign('actionName','insert');
		$this->assign('editData',[]);
		$this->assign('id',0);

		$PermissionModel = new PermissionModel;
		$tree = $PermissionModel->where(['parent_id'=>0])->order('sort_order asc')->select();
		$this->assign('tree',$tree);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑权限';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);

		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$this->assign('actionName','update');

		$PermissionModel = new PermissionModel;
		
		$id = input('id');
		$editData = $PermissionModel->find($id);

		$tree = $PermissionModel->where(['parent_id'=>0])->order('sort_order asc')->select();
		$this->assign('tree',$tree);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('permission_add_edit');
		
		$postData = input('post.');
		$data = $postData['data'];
		// 添加数据
		$_id = PermissionModel::insertGetId($data);
		$page = input('page');
		$page = $page ? $page : 1;

		if ($_id) {
			return $this->success('权限添加成功！',url('index').'?page='.$page);
		}
		return $this->error('权限添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('permission_add_edit');
		
		$postData = input('post.');
		$data = $postData['data'];
		// 编辑数据
		$PermissionModel = new PermissionModel;
		$res = $PermissionModel->save($data,['id'=>$postData['id']]);
		$page = input('page');
		$page = $page ? $page : 1;

		if ($res) {
			return $this->success('权限编辑成功！',url('index').'?page='.$page);
		}
		return $this->error('权限编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('permission_remove_back');
		
		$id = input('id');
		$PermissionModel = new PermissionModel;

		# 删除数据
		$res = $PermissionModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('permission_remove_back');
		
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$PermissionModel = new PermissionModel;
			$res = $PermissionModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}
}