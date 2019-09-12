<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\PaperLevel as PaperLevelModel;

class PaperLevel extends AdminPlatform
{
	# 试卷管理权限
	protected $permissionName = 'test_paper_level_manage';
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '试卷难度列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		# 标题
		$title = '试卷难度列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$Model = new PaperLevelModel;
		$listData = $Model->select();

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加试卷难度';
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
		# 标题
		$title = '编辑试卷难度';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$Model = new PaperLevelModel;

		$id = input('id');
		$editData = $Model->find($id);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		# 检察权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];

		// 添加分类数据
		$id = PaperLevelModel::insertGetId($data);
		// 添加管理日志
		$log_info = '添加试卷难度成功，分类id='.$id.'|PaperLevel';
		// $this->addAdminLog($log_info,1);

		if ($id) {
			return $this->success('添加成功！','index');
		}
		return $this->error('添加失败！');
	}

	public function update()
	{
		#检查权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];

		// 编辑分类
		$Model = new PaperLevelModel;
		$res = $Model->save($data,['id'=>$postData['id']]);
		// 添加管理日志
		$log_info = '编辑试卷难度成功，试卷类型id='.$postData['id'].'|PaperLevel';
		// $this->addAdminLog($log_info,2);

		if ($res) {
			return $this->success('编辑成功！','index');
		}
		return $this->error('编辑失败！');
	}

	public function del()
	{
		# 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		$id = input('id');
		$Model = new PaperLevelModel;

		# 删除分类
		$res = $Model::destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}