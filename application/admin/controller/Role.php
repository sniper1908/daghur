<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Role as RoleModel;
use app\admin\model\Permission as PermissionModel;

class Role extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '角色列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_add_edit');

		# 标题
		$title = '角色列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$RoleModel = new RoleModel;
		$listData = $RoleModel->select();

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加角色';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');
		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑角色';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$RoleModel = new RoleModel;
		
		$id = input('id');
		$editData = $RoleModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		// 添加数据
		$_id = RoleModel::insertGetId($data);

		if ($_id) {
			return $this->success('角色添加成功！','index');
		}
		return $this->error('角色添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		// 编辑数据
		$RoleModel = new RoleModel;
		$res = $RoleModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('角色编辑成功！','index');
		}
		return $this->error('角色编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_remove_back');

		$id = input('id');
		$RoleModel = new RoleModel;

		# 删除模块
		$res = $RoleModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_remove_back');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$RoleModel = new RoleModel;
			$res = $RoleModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	public function permission()
	{
		$title = '编辑角色权限';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','updatePermission');

		$RoleModel = new RoleModel;
		
		$id = input('id');
		$editData = $RoleModel->find($id);
		if ($editData['role_permission']) {
			$editData['role_permission'] = unserialize($editData['role_permission']);
		}
		// print_r($editData['role_permission']);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		$PermissionModel = new PermissionModel;
		$tree = $PermissionModel->getTree('list');
		// dump($tree);

		$this->assign('tree',$tree);

		return $this->fetch();
	}

	public function updatePermission()
	{
		// 检查权限
		$this->checkPermissionForMsg('role_permission');

		$postData = input('post.');
		$id = $postData['id'];
		$data = $postData['data'];
		// echo $id;
		// echo '<hr/>';
		// print_r($data);
		$permission = [];
		$permission['role_permission'] = serialize($data);
		// 编辑数据
		$RoleModel = new RoleModel;
		$res = $RoleModel->save($permission,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('角色权限分配成功！','index');
		}
		return $this->error('角色权限分配失败！');
	}
}