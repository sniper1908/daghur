<?php
namespace app\admin\controller;

use think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\Papers as PapersModel;
use app\admin\model\PaperCategory as PaperCategoryModel;
use app\admin\model\PaperLevel as PaperLevelModel;
use app\admin\model\PaperType as PaperTypeModel;
use app\admin\model\PaperQuestions as PaperQuestionsModel;
use app\admin\model\QuestionTag as QuestionTagModel;
use app\admin\model\Questions1 as Questions1Model;
use app\admin\model\Questions2 as Questions2Model;
use app\admin\model\Questions3 as Questions3Model;
use app\admin\model\Questions4 as Questions4Model;
use app\admin\model\Questions5 as Questions5Model;

class PaperQuestions extends AdminPlatform
{
	# 管理权限
	protected $permissionName = 'test_paper_manage';
	# 题型 默认是单选题
	protected $type_id = 1;
	# 题目类型
	protected $typeListArr = [
		1 => '单选题',
		2 => '多选题',
		3 => '填空题',
		4 => '判断题',
		5 => '主观题',
	];
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '试卷题目列表'
		]
	];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		# 题目类型列表
		$this->assign('typeListArr',$this->typeListArr);
		# 科目列表
		$catList = PaperCategoryModel::select();
		$this->assign('catList',$catList);
		# 类型列表
		$typeList = PaperTypeModel::select();
		$this->assign('typeList',$typeList);
		# 难度列表
		$levelList = PaperLevelModel::select();
		$this->assign('levelList',$levelList);
		# 标签列表
		$tagList = QuestionTagModel::select();
		$this->assign('tagList',$tagList);
	}

	public function index()
	{
		# 标题
		$title = '试卷题目列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$paper_id = input('paper_id');
		$this->assign('paper_id',$paper_id);

		$listData = PaperQuestionsModel::order('q_type_id asc,id desc')->paginate($this->paginate);
		$this->assign('listData',$listData);

		return $this->fetch();
	}

	protected function getQuestionModel($type_id)
	{
		switch ($type_id) {
			case '1':
				$model = new Questions1Model;
				break;
			case '2':
				$model = new Questions2Model;
				break;
			case '3':
				$model = new Questions3Model;
				break;
			case '4':
				$model = new Questions4Model;
				break;
			case '5':
				$model = new Questions5Model;
				break;
		}

		return $model;
	}

	protected function getQuestionsListData($isPost=0,$data=[],$type_id=1)
	{
		$listData = [];
		if ($isPost==1) {
			$where = [];
			$where['type_id'] = ['in',$data['type_id']];
			if ($data['cat_id']) {
				$where['cat_id'] = ['in',$data['cat_id']];
			}
			if ($data['level_id']) {
				$where['level_id'] = ['in',$data['level_id']];
			}
			if ($data['tag_id']) {
				$where['tag_id'] = ['in',$data['tag_id']];
			}
			if (!empty($where)) {
				$this->assign('searchList',$data);
			}
		} else {
			$where = [];
			$where['type_id'] = ['in',$type_id];
		}

		$QuestionsModel = $this->getQuestionModel($type_id);
		$listData = $QuestionsModel->where($where)->field('id,question_title')->paginate(50);
		$this->assign('listData',$listData);
		// dump($listData);
	}

	public function add()
	{
		# 标题
		$title = '添加试卷题目';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');
		$this->assign('searchAction','add');

		$this->assign('editData',[]);
		$this->assign('id',0);
		$type_id = input('type_id');
		$this->assign('type_id',$type_id);
		$paper_id = input('paper_id');
		$this->assign('paper_id',$paper_id);

		$listData = [];
		// if (Request::instance()->isPost()) {
		// 	$postData = input('post.');
		// 	$data = $postData['data'];
		// 	$where = [];
		// 	$where['type_id'] = ['in',$data['type_id']];
		// 	if ($data['cat_id']) {
		// 		$where['cat_id'] = ['in',$data['cat_id']];
		// 	}
		// 	if ($data['level_id']) {
		// 		$where['level_id'] = ['in',$data['level_id']];
		// 	}
		// 	if ($data['tag_id']) {
		// 		$where['tag_id'] = ['in',$data['tag_id']];
		// 	}
		// 	if (!empty($where)) {
		// 		$this->assign('searchList',$data);
		// 	}
		// 	$QuestionsModel = $this->getQuestionModel($data['type_id']);
		// 	$listData = $QuestionsModel->where($where)->field('id,question_title')->paginate(50);
		// }
		// $this->assign('listData',$listData);
		// 获取该搜索项下的全部数据
		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$this->getQuestionsListData(1,$data,$data['type_id']);
		}

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑试卷题目';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');
		$this->assign('searchAction','edit');

		$id = input('id');
		$this->assign('id',$id);
		$type_id = input('type_id');
		$this->assign('type_id',$type_id);
		$paper_id = input('paper_id');
		$this->assign('paper_id',$paper_id);

		// 获取该搜索项下的全部数据
		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$this->getQuestionsListData(1,$data,$data['type_id']);
		} else {
			$this->getQuestionsListData(0,[],$type_id);
		}
		// 获取该试卷下的某个题型下的全部数据
		$questionsList = PaperQuestionsModel::where(['paper_id'=>$paper_id,'q_type_id'=>$type_id])->field('question_id')->select();
		$questionsId = [];
		if (!empty($questionsList)) {
			foreach ($questionsList as $key=>$value) {
				$questionsId[$key] = $value['question_id'];
			}
		}
		$this->assign('questionsId',$questionsId);

		return $this->fetch('add');
	}

	public function insert()
	{
		# 检察权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];

		if (!empty($postData['question_id'])) {
			foreach ($postData['question_id'] as $question_id) {
				$arr = [];
				$arr['question_id'] = $question_id;
				$arr['paper_id'] = $data['paper_id'];
				$arr['q_type_id'] = $data['q_type_id'];
				$res = PaperQuestionsModel::insertGetId($arr);
			}
			return $this->success('添加完成！','index');
		}
		return $this->error('请选择数据！');
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
		$paper_id = input('paper_id');
		$type_id = input('type_id');
		$res = PaperQuestionsModel::where(['id'=>$id])->delete();

		if ($res) {
			return $this->success('删除完毕','index?paper_id='.$paper_id);
		}
		return $this->error('删除失败');
	}
}