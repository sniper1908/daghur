<?php
namespace app\admin\controller;

use \think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\PaperCategory as PaperCategoryModel;
use app\admin\model\PaperLevel as PaperLevelModel;
use app\admin\model\QuestionTag as QuestionTagModel;
use app\admin\model\QuestionGallery as QuestionGalleryModel;
use app\admin\model\PaperQuestionType as PaperQuestionTypeModel;
use app\admin\model\Questions1 as Questions1Model;
use app\admin\model\Questions2 as Questions2Model;
use app\admin\model\Questions3 as Questions3Model;
use app\admin\model\Questions4 as Questions4Model;
use app\admin\model\Questions5 as Questions5Model;
use app\admin\model\QuestionLimbs1 as Limbs1Model;
use app\admin\model\QuestionLimbs2 as Limbs2Model;

class Questions extends AdminPlatform
{
	# 管理权限
	protected $permissionName = 'test_paper_questions_manage';
	# 题型 默认是单选题
	protected $type_id = 1;
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '题库列表'
		]
	];
	# 题目类型
	protected $typeListArr = [
		1 => '单选题',
		2 => '多选题',
		3 => '填空题',
		4 => '判断题',
		5 => '主观题',
	];
	protected $typeList = [
		[
			'id' => 1,
			'type_name' => '单选题'
		],
		[
			'id' => 2,
			'type_name' => '多选题'
		],
		[
			'id' => 3,
			'type_name' => '填空题'
		],
		[
			'id' => 4,
			'type_name' => '判断题'
		],
		[
			'id' => 5,
			'type_name' => '主观题'
		]
	];

	# ABCD选项
	protected $answerArr = [
		1 => 'A',
		2 => 'B',
		3 => 'C',
		4 => 'D'
	];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		# 科目列表
		$catList = PaperCategoryModel::select();
		$this->assign('catList',$catList);
		# 难度列表
		$levelList = PaperLevelModel::select();
		$this->assign('levelList',$levelList);
		# 知识点列表
		$tagList = QuestionTagModel::select();
		$this->assign('tagList',$tagList);
		$typeList = PaperQuestionTypeModel::select();
		if (!empty($typeList)) {
			// foreach ($typeList as $key => $value) {
			// 	$this->typeList[$key] = $value['type_name'];
			// }
			$this->assign('typeList',$this->typeList);
		} else {
			$this->assign('typeList',$this->typeList);
		}
		$this->assign('typeListArr',$this->typeListArr);
		# 答案选项
		$this->assign('answerArr',$this->answerArr);

		# 当前题库类型 默认为1-单选题
		$type_id = input('type_id');
		$type_id = isset($type_id) && $type_id ? $type_id : 1;
		if ($type_id<1 || $type_id>5) {
			$type_id = 1;
		}
		$this->type_id = $type_id;
		$this->assign('type_id',$type_id);
		$this->assign('typeName',$this->typeListArr[$type_id]);
	}

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		# 标题
		$title = '题库列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$where = [];
			$QuestionsModel = $this->getQuestionModel($data['type_id']);
			$where['type_id'] = ['in',$data['type_id']];
			if ($data['cat_id']) {
				$where['cat_id'] = ['in',$data['cat_id']];
			}
			if ($data['level_id']) {
				$where['level_id'] = ['in',$data['level_id']];
			}
			if ($data['keywords']) {
				$where['question_title'] = ['like','%'.$data['keywords'].'%'];
				// $where['analysis'] = ['like','%'.$data['keywords'].'%'];
			}
			if (!empty($where)) {
				$this->assign('searchList',$data);
			}
			$listData = $QuestionsModel->where($where)->order('id desc')->paginate($this->paginate);
			$this->assign('type_id',$data['type_id']);
		} else {
			$QuestionsModel = $this->getQuestionModel($this->type_id);
			$listData = $QuestionsModel->order('id desc')->paginate($this->paginate);
		}
		// dump($listData);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加题库数据';
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
		$title = '编辑题库数据';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$id = input('id');
		$type_id = input('type_id');
		$QuestionsModel = $this->getQuestionModel($type_id);
		$editData = $QuestionsModel->find($id);
		$editLimbsData = [];
		if ($type_id==1 || $type_id==2) {
			$LimbsModel = $this->getLimbsModel($type_id);
			$editLimbsData = $LimbsModel->where(['question_id'=>$id])->find();
		}
		$GalleryModel = new QuestionGalleryModel;
		$galleryData = $GalleryModel->where(['question_id'=>$id])->find();
		if (!empty($galleryData)) {
			$editData['goods_img'] = $galleryData['goods_img'];
		}
		$this->assign('editData',$editData);
		$this->assign('editLimbsData',$editLimbsData);
		$this->assign('id',$id);

		return $this->fetch('add');
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

	protected function getLimbsModel($type_id)
	{
		switch ($type_id) {
			case '1':
				$model = new Limbs1Model;
				break;
			case '2':
				$model = new Limbs2Model;
				break;
		}

		return $model;
	}

	public function insert()
	{
		# 检察权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];
		$type_id = $data['type_id'];
		$time = time();
		$data['addtime'] = $time;
		$data['updatetime'] = $time;

		// 上传图片
		$fileList = request()->file();
		// $file = request()->file('upfile');
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','questions',1,[300,150],[400,300]);
				if (!empty($imgArr)) {
					$gallery['original_img'] = $imgArr['file_original_url'];
					$gallery['goods_img'] = $imgArr['file_url'];
					$gallery['goods_thumb'] = $imgArr['file_thumb_url'];
					$gallery['type_id'] = $data['type_id'];
					# 此处还需要一个question_id
				}
			}
		}

		// 处理答案
		if ($type_id==2) {
			# 多选
			$data['question_answer'] = implode(',',$postData['answer2']);
		} else if ($type_id==3) {
			$data['question_answer'] = str_replace('，',',',$data['question_answer']);
		}

		$QuestionsModel = $this->getQuestionModel($type_id);

		// 开启事物
		$QuestionsModel->startTrans();
		// 添加数据
		$id = $QuestionsModel->insertGetId($data);
		// 添加图片
		$gallery_res = 1;
		if (isset($gallery) && !empty($gallery)) {
			$gallery['question_id'] = $id;
			$gallery_res = QuestionGalleryModel::insert($gallery);
		}
		// 添加题肢
		$limb_res = 1;
		if ($type_id==1 || $type_id==2) {		
			$postData['limbs']['question_id'] = $id;
			$LimbsModel = $this->getLimbsModel($type_id);
			$limb_res = $LimbsModel->insert($postData['limbs']);
		}
		// 添加管理日志
		// $log_info = '添加题库数据成功，分类id='.$id.'|QuestionTag';
		// $this->addAdminLog($log_info,1);

		if ($id && $gallery_res && $limb_res) {
			# 提交
			$res = 1;
			$QuestionsModel->commit();
		} else {
			# 回滚
			$res = 0;
			$QuestionsModel->rollback();
		}

		if ($res) {
			return $this->success('数据添加成功！','index?type_id='.$data['type_id']);
		}
		
		if (isset($gallery) && !empty($gallery)) {
			@unlink(__DIR__.'/../../../public/'.$gallery['original_img']);
			@unlink(__DIR__.'/../../../public/'.$gallery['goods_img']);
			@unlink(__DIR__.'/../../../public/'.$gallery['goods_thumb']);
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		#检查权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];
		$type_id = $data['type_id'];
		$id = $postData['id'];
		$time = time();
		$data['updatetime'] = $time;

		// 上传图片
		$fileList = request()->file();
		// $file = request()->file('upfile');
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','questions',1,[300,150],[400,300]);
				if (!empty($imgArr)) {
					$gallery['original_img'] = $imgArr['file_original_url'];
					$gallery['goods_img'] = $imgArr['file_url'];
					$gallery['goods_thumb'] = $imgArr['file_thumb_url'];
					$gallery['type_id'] = $data['type_id'];
					# 此处还需要一个question_id
				}
			}
		}

		$QuestionsModel = $this->getQuestionModel($type_id);
		// 开启事物
		$QuestionsModel->startTrans();
		// 编辑分类
		$q_res = $QuestionsModel->save($data,['id'=>$postData['id']]);
		// 处理图片
		$gallery_res = 1;
		if (isset($gallery) && !empty($gallery)) {
			$QuestionGalleryModel = new QuestionGalleryModel;
			$galleryData = $QuestionGalleryModel->where(['question_id'=>$id])->find()->toArray();
			if (!empty($galleryData)) {
				# 更新
				$gallery_res = $QuestionGalleryModel->save($gallery,['id'=>$galleryData['id']]);
			} else {
				$gallery['question_id'] = $id;
				$gallery_res = QuestionGalleryModel::insert($gallery);
			}
		}
		// 处理题肢
		$limb_res = 1;
		if ($type_id==1 || $type_id==2) {
			$LimbsModel = $this->getLimbsModel($type_id);
			$limbsData = $LimbsModel->where(['question_id'=>$id])->find()->toArray();
			if (!empty($limbsData)) {
				$limbs = $postData['limbs'];
				$up_limb = 0;
				if ($limbs['limb_1']!=$limbsData['limb_1']) {
					$up_limb = 1;
				}
				if ($limbs['limb_2']!=$limbsData['limb_2']) {
					$up_limb = 1;
				}
				if ($limbs['limb_3']!=$limbsData['limb_3']) {
					$up_limb = 1;
				}
				if ($limbs['limb_4']!=$limbsData['limb_4']) {
					$up_limb = 1;
				}
				if ($up_limb ==1) {
					# 需要更新题肢
					$limb_res = $LimbsModel->save($postData['limbs'],['id'=>$limbsData['id']]);
				}
			} else {
				# 需要增加题肢
				$postData['limbs']['question_id'] = $id;
				$limb_res = $LimbsModel->insert($postData['limbs']);
			}
		}
		// 添加管理日志
		// $log_info = '编辑题库数据成功，题库标签id='.$postData['id'].'|QuestionTag';
		// $this->addAdminLog($log_info,2);

		if ($q_res && $gallery_res && $limb_res) {
			# 提交
			$res = 1;
			$QuestionsModel->commit();
		} else {
			$res = 0;
			$QuestionsModel->rollback();
		}

		if($res==1){
			# 如果有旧图片就删除旧图片
			if (!empty($galleryData)) {
				@unlink(__DIR__.'/../../../public/'.$galleryData['original_img']);
				@unlink(__DIR__.'/../../../public/'.$galleryData['goods_img']);
				@unlink(__DIR__.'/../../../public/'.$galleryData['goods_thumb']);
			}
			return $this->success('编辑数据成功！','index?type_id='.$data['type_id']);
		}

		if (isset($gallery) && !empty($gallery)) {
			@unlink(__DIR__.'/../../../public/'.$gallery['original_img']);
			@unlink(__DIR__.'/../../../public/'.$gallery['goods_img']);
			@unlink(__DIR__.'/../../../public/'.$gallery['goods_thumb']);
		}
		return $this->error('编辑数据失败！');
	}

	public function del()
	{
		# 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		$id = input('id');
		$type_id = input('type_id');

		$res = $this->delOne($id,$type_id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		$postData = input('post.');
		$ids = $postData['delId'];
		$type_id = $postData['type_id'];

		if (!empty($ids)) {
			# 删除数据
			foreach ($ids as $id) {
				$this->delOne($id,$type_id);
			}
			return $this->success('删除完成','index?type_id='.$type_id);
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	# 删除一条数据
	protected function delOne($id,$type_id)
	{
		$QuestionsModel = $this->getQuestionModel($type_id);
		# 开启事物
		$QuestionsModel->startTrans();
		# 删除照片
		$gallery_res = 1;
		$galleryData = QuestionGalleryModel::where(['question_id'=>$id])->find();
		if (!empty($galleryData)) {
			$gallery_res = QuestionGalleryModel::where(['id'=>$galleryData['id']])->delete();
		}
		# 删除题肢
		$limb_res = 1;
		if ($type_id==1 || $type_id==2) {
			$LimbsModel = $this->getLimbsModel($type_id);
			$limb_res = $LimbsModel->where(['question_id'=>$id])->delete();
		}
		# 删除数据
		$q_res = $QuestionsModel->where(['id'=>$id])->delete();
		if ($q_res && $gallery_res && $limb_res) {
			$res = 1;
			$QuestionsModel->commit();
		} else {
			$res = 0;
			$QuestionsModel->rollback();
		}

		if ($res && !empty($galleryData)) {
			@unlink(__DIR__.'/../../../public/'.$galleryData['original_img']);
			@unlink(__DIR__.'/../../../public/'.$galleryData['goods_img']);
			@unlink(__DIR__.'/../../../public/'.$galleryData['goods_thumb']);
		}

		return $res;
	}
}