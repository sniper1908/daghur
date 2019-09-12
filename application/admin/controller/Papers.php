<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Papers as PapersModel;
use app\admin\model\PaperCategory as PaperCategoryModel;
use app\admin\model\PaperLevel as PaperLevelModel;
use app\admin\model\PaperType as PaperTypeModel;
use app\admin\model\PaperQuestions as PaperQuestionsModel;

class Papers extends AdminPlatform
{
	# 管理权限
	protected $permissionName = 'test_paper_manage';
	# 题型 默认是单选题
	protected $type_id = 1;
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '试卷列表'
		]
	];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		# 科目列表
		$catList = PaperCategoryModel::select();
		$this->assign('catList',$catList);
		# 类型列表
		$typeList = PaperTypeModel::select();
		$this->assign('typeList',$typeList);
		# 难度列表
		$levelList = PaperLevelModel::select();
		$this->assign('levelList',$levelList);
	}

	public function index()
	{
		# 标题
		$title = '试卷列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$listData = PapersModel::order('id desc')->paginate($this->paginate);
		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加试卷';
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
		$title = '编辑试卷';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$id = input('id');
		$Model = new PapersModel();
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
		$time = time();
		$data['addtime'] = $time;
		$data['updatetime'] = $time;
		$data['is_del'] = 0;

		// 添加分类数据
		$id = PapersModel::insertGetId($data);
		// 添加管理日志
		// $log_info = '添加试卷类型成功，分类id='.$id.'|PaperType';
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
		$Model = new PapersModel;
		$res = $Model->save($data,['id'=>$postData['id']]);
		// 添加管理日志
		// $log_info = '编辑试卷类型成功，试卷类型id='.$postData['id'].'|PaperType';
		// $this->addAdminLog($log_info,2);

		if ($res) {
			return $this->success('编辑成功！','index');
		}
		return $this->error('编辑失败！');
	}

	public function del()
	{
		$id = input('id');
		$PapersModel = new PapersModel;
		$PapersModel->startTrans();
		$p_res = $PapersModel->where(['id'=>$id])->delete();
		$PaperQuestionsModel = new PaperQuestionsModel;
		$q_res = $PaperQuestionsModel->where(['paper_id'=>$id])->delete();

		if ($p_res && $q_res) {
			$res = 1;
			$PapersModel->commit();
		} else {
			$res = 0;
			$PapersModel->rollback();
		}

		if ($res) {
			$this->success('删除完毕','index');
		}
		$this->error('删除失败');
	}
}