<?php
namespace app\admin\controller;

// 软删除
use traits\model\SoftDelete;
use app\admin\controller\AdminPlatform;
use app\admin\model\AdminUser as AdminModel;
use app\admin\model\AdminLog;
use app\admin\model\Role as RoleModel;

class Admin extends AdminPlatform
{
	// 软删除
	use SoftDelete;
	
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '管理管理员'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('admin_add_edit');

		# 标题
		$title = '管理员列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$AdminModel = new AdminModel;
		$listData = $AdminModel->select();

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加管理员';
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

		$RoleModel = new RoleModel;
		$roleData = $RoleModel->select();
		$this->assign('roleData',$roleData);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑管理员';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$RoleModel = new RoleModel;
		$roleData = $RoleModel->select();
		$this->assign('roleData',$roleData);
		
		$AdminModel = new AdminModel;
		$id = input('id');
		$editData = $AdminModel->find($id)->toArray();

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('admin_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		$AdminModel = new AdminModel;
		$data['admin_pass_word'] = $AdminModel->setPassword($data['admin_pass_word'],$data['admin_salt']);
		$curTime =  time();
		$data['create_time'] = $curTime;
		// 添加数据
		$_id = $AdminModel::insertGetId($data);

		if ($_id) {
			return $this->success('管理员添加成功！','index');
		}
		return $this->error('管理员添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('admin_add_edit');

		$AdminModel = new AdminModel;
		$postData = input('post.');
		$data = $postData['data'];
		if ($data['admin_pass_word']) {
			$data['admin_pass_word'] = $AdminModel->setPassword($data['admin_pass_word'],$data['admin_salt']);
		} else {
			# 没有修改密码
			unset($data['admin_pass_word']);
		}
		// 编辑数据
		$res = $AdminModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('管理员编辑成功！','index');
		}
		return $this->error('管理员编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('admin_remove_back');

		$id = input('id');
		$AdminModel = new AdminModel;

		# 删除管理员 软删除
		$res = $AdminModel->destroy($id);
		# 真实删除
		// $res = $AdminModel->destroy($id,true);

		if ($res) {
			# 删除管理员添加的商品，如果有字段需要用到管理员id，则需要删除
			# 删除管理员日志
			$AdminLogModel = new AdminLogModel;
			$AdminLogModel->where(['admin_id'=>$id])->destroy();
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}