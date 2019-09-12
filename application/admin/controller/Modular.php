<?php 
namespace app\admin\controller;

// 软删除
// use traits\model\SoftDelete;
use app\admin\controller\AdminPlatform;
use app\admin\model\Modular as ModularModel;
use app\admin\model\Permission as PermissionModel;

class Modular extends AdminPlatform
{
	# 软删除
	// use SoftDelete;
	
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '模块列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('modular_add_edit');
		
		# 标题
		$title = '模块列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$ModularModel = new ModularModel;
		$page = input('page');
		$page = (int)$page;
		$page = $page ? $page : 1;
		$this->assign('page',$page);
		
		$limit = 1;
		$listData = $ModularModel->getTree('page',$limit);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function getPermissionChildrenData($parent_id=0)
	{
		$PermissionModel = new PermissionModel;
		$permissionChildrenData = [];
		$permissionChildrenData = $PermissionModel->where('parent_id',$parent_id)->order('sort_order asc')->select();
		if (!empty($permissionChildrenData)) {
			foreach ($permissionChildrenData as $key => $value) {
				$permissionChildrenData[$key] = $value->toArray();
			}
		}
		$res = json_encode($permissionChildrenData);
		echo $res;
		exit;
	}

	public function add()
	{
		$title = '添加模块';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');

		$ModularModel = new ModularModel;
		$tree = $ModularModel
			->field('id,modular_name')
		    ->where(['parent_id'=>0])
		    ->select();

		$this->assign('tree',$tree);
		$this->assign('editData',[]);
		$this->assign('id',0);

		$PermissionModel = new PermissionModel;
		$permissionParentData = $PermissionModel->where('parent_id',0)->order('sort_order asc')->select();
		$permissionChildrenData = $PermissionModel->where('parent_id',$permissionParentData[0]['id'])->order('sort_order asc')->select();

		$this->assign('permissionParentData',$permissionParentData);
		$this->assign('permissionChildrenData',$permissionChildrenData);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑模块';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$ModularModel = new ModularModel;
		$tree = $ModularModel
			->field('id,modular_name')
		    ->where(['parent_id'=>0])
		    ->select();
		
		$id = input('id');
		$editData = $ModularModel->find($id);

		$this->assign('tree',$tree);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		# 权限
		$PermissionModel = new PermissionModel;
		# 根权限列表
		$permissionParentData = $PermissionModel->where('parent_id',0)->order('sort_order asc')->select();
		# 模块所属权限的根权限id值
		$permissionParentInfo = $PermissionModel->getParentInfo($editData['permission_code']);
		// print_r($permissionParentInfo);
		// $permissionChildrenData = $PermissionModel->where('parent_id',$permissionParentData[0]['id'])->order('sort_order asc')->select();
		$permission_parent_id = $editData['permission_code'];
		if ($permissionParentInfo['parent_id']) {
			$permission_parent_id = $permissionParentInfo['parent_id'];
		}
		$permissionChildrenData = $PermissionModel->where('parent_id',$permission_parent_id)->order('sort_order asc')->select();

		$this->assign('permissionParentData',$permissionParentData);
		$this->assign('permissionParentId',$permissionParentInfo['parent_id']);
		$this->assign('permissionChildrenData',$permissionChildrenData);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('modular_add_edit');
		
		$postData = input('post.');
		$data = $postData['data'];
		$permission = $postData['permission'];
		if (!empty($permission)) {
			$permission_parent_id = $permission['permission_parent_id'];
			$permission_child_id = $permission['permission_child_id'];
			if ($permission_parent_id && !$permission_child_id) {	
				$data['permission_code'] = $permission_parent_id;
			} else if (!$permission_parent_id && $permission_child_id) {
				$data['permission_code'] = $permission_child_id;
			}
		}
		// 添加数据
		$_id = ModularModel::insertGetId($data);

		if ($_id) {
			return $this->success('模块添加成功！','index');
		}
		return $this->error('模块添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('modular_add_edit');
		
		$postData = input('post.');
		$data = $postData['data'];
		$permission = $postData['permission'];
		if (!empty($permission)) {
			$permission_parent_id = $permission['permission_parent_id'];
			$permission_child_id = $permission['permission_child_id'];
			if ($permission_parent_id && !$permission_child_id) {	
				$data['permission_code'] = $permission_parent_id;
			} else if ($permission_parent_id && $permission_child_id) {
				$data['permission_code'] = $permission_child_id;
			}
		}
		// 编辑数据
		$ModularModel = new ModularModel;
		$res = $ModularModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('模块编辑成功！','index');
		}
		return $this->error('模块编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('modular_remove_back');
		
		$id = input('id');
		$ModularModel = new ModularModel;
		$data = $ModularModel->where(['parent_id'=>$id])->find();
		if (!empty($data)) {
			# 该模块有子模块
			return $this->error('该模块下存在子模块，请删除子模块后再删除');
		}

		# 删除模块
		$res = $ModularModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('modular_remove_back');
		
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$ModularModel = new ModularModel;
			$res = $ModularModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}
}