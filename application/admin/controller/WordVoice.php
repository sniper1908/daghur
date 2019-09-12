<?php
namespace app\admin\controller;

use think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\Dictionary as DictionaryModel;
use app\admin\model\WordVoice as WordVoiceModel;

class WordVoice extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '词典语音列表'
		]
	];

	# 方言
	protected $dialect = [1=>'齐齐哈尔',2=>'莫旗',3=>'海拉尔',4=>'塔城'];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg('article_dictionary_manage');
		$this->assign('dialect',$this->dialect);
	}

	public function index()
	{
		# 标题
		$title = $this->breadcrumb[0]['name'];

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',0);
		$this->assign('dialect',$this->dialect);

		$DictionaryModel = new DictionaryModel;
		$WordVoiceModel = new WordVoiceModel;
		$paginate = 10;
		$dict_id = input('dict_id');
		$this->assign('dict_id',$dict_id);
		$word_name = $DictionaryModel->where(['id'=>$dict_id])->column('word_name');
		$this->assign('word_name',$word_name);

		$listData = $WordVoiceModel->where(['dict_id'=>$dict_id])->paginate($paginate);

		$this->assign('listData',$listData);
		// @unlink(__DIR__.'/../../../public/upload/voice/20190313/test.jpg');

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加音频';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','insert');
		$dict_id = input('dict_id');
		$this->assign('dict_id',$dict_id);

		# 获取session
		$session = session('admin');
		$admin_id = $session['admin_uid'];

		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑音频';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','update');
		$dict_id = input('dict_id');
		$this->assign('dict_id',$dict_id);

		# 获取session
		$session = session('admin');
		$admin_id = $session['admin_uid'];

		$WordVoiceModel = new WordVoiceModel;
		$id = input('id');
		$editData = $WordVoiceModel->find($id);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		$WordVoiceModel = new WordVoiceModel;
		$postData = input('post.');
		$data = $postData['data'];
		$listData = $WordVoiceModel->where(['dict_id'=>$data['dict_id']])->select();
		$dialectArr = [];
		if (!empty($listData)) {
			foreach ($listData as $key => $value) {
				array_push($dialectArr,$value['dialect']);
			}
		}
		if (empty($listData) || (!empty($listData) && !in_array($data['dialect'],$dialectArr))) {
			// 上传图片
			$fileList = request()->file();
			if (isset($fileList['upfile'])) {
				$file = $fileList['upfile'];
				$imgArr = [];
				if (!empty($file)) {
					# 有图片上传
					$imgArr = $this->upFile($file,'file','voice',-1);
					if (!empty($imgArr)) {
						$data['word_voice'] = $imgArr['file_url'];
					}
				}
				// 添加数据
				$id = $WordVoiceModel->insertGetId($data);
				if ($id) {
					return $this->success('数据添加成功','index?dict_id='.$data['dict_id']);
				}
				// 删除上传文件
				if (isset($data['word_voice']) && $data['word_voice']) {
					@unlink(__DIR__.'/../../../public/'.$data['word_voice']);
				}
				return $this->error('数据添加失败');
			}
		}
		return $this->error('数据有误，请返回重新添加');
	}

	public function update()
	{
		$WordVoiceModel = new WordVoiceModel;
		$postData = input('post.');
		$data = $postData['data'];

		# 如果提交的数据没有方言选项，则返回
		if (!$data['dialect']) {
			return $this->error('请选择方言类型');
		}
		$id = $postData['id'];
		$editData = $WordVoiceModel->find($id);
		$fileList = request()->file();
		$file = isset($fileList['upfile']) ? $fileList['upfile'] : [];
		// dump($file);exit;

		if ($editData['dialect'] == $data['dialect']) {
			# 如果方言选项未做改变
			if (empty($file)) {
				# 没有任何改变
				return $this->error('您未做任何改变');
			}
			$res = false;
			# 重新上传了文件
			$imgArr = [];
			$fileInfo = !empty($file) ? $file->getInfo() : [];
			if (!empty($file) && !$fileInfo['error']) {
				# 有图片上传
				$imgArr = $this->upFile($file,'file','voice',-1);
				if (!empty($imgArr)) {
					$data['word_voice'] = $imgArr['file_url'];
					$res = $WordVoiceModel->save($data,['id'=>$id]);
				}
			}
			if ($res) {
				if (isset($data['word_voice']) && $data['word_voice'] && $editData['word_voice']) {
					@unlink(__DIR__.'/../../../public/'.$editData['word_voice']);
				}
				return $this->success('数据更新成功','index?dict_id='.$data['dict_id']);
			}
			# 更新失败，删除上传的文件
			if (isset($data['word_voice']) && $data['word_voice']) {
				@unlink(__DIR__.'/../../../public/'.$data['word_voice']);
			}
			return $this->error('数据更新失败');
		} else {
			# 查找数据库中是否存在修改方言后的数据
			$tmpArr = $WordVoiceModel->where(['dict_id'=>$data['dict_id'],'dialect'=>$data['dialect']])->select();
			if (empty($tmpArr)) {
				$res = false;
				# 如果方言选项是新的，则只做更新数据操作
				# 重新上传了文件
				$imgArr = [];
				if (!empty($file)) {
					# 有图片上传
					$imgArr = $this->upFile($file,'file','voice',-1);
					if (!empty($imgArr)) {
						$data['word_voice'] = $imgArr['file_url'];
					}
				}
				$res = $WordVoiceModel->save($data,['id'=>$id]);
				if ($res) {
					if (isset($data['word_voice']) && $data['word_voice'] && $editData['word_voice']) {
						@unlink(__DIR__.'/../../../public/'.$editData['word_voice']);
					}
					return $this->success('数据更新成功','index?dict_id='.$data['dict_id']);
				}
				if (isset($data['word_voice']) && $data['word_voice']) {
					@unlink(__DIR__.'/../../../public/'.$data['word_voice']);
				}
				return $this->error('数据更新失败');
			} else {
				# 方言选项做了改变，但是数据库中有该方言的数据，则返回
				return $this->error('该方言已存在相关数据，请删除后再执行更新操作');
			}
		}
	}

	public function del()
	{
		$id = input('id');
		$WordVoiceModel = new WordVoiceModel;
		$editData = $WordVoiceModel->find($id);
		$res = $WordVoiceModel->where(['id'=>$id])->delete();
		if ($res) {
			@unlink(__DIR__.'/../../../public/'.$editData['word_voice']);
			return $this->success('数据删除成功','index?dict_id='.$editData['dict_id']);
		}
		return $this->error('数据删除失败');
	}

	public function delall()
	{
		$postData = input('post.');
		$ids = $postData['delId'];
		$WordVoiceModel = new WordVoiceModel;
		if (!empty($ids)) {
			# 删除数据
			foreach ($ids as $id) {
				$editData = $WordVoiceModel->find($id);
				$res = $WordVoiceModel->where(['id'=>$id])->delete();
				if ($res) {
					@unlink(__DIR__.'/../../../public/'.$editData['word_voice']);
				}
			}
			return $this->success('删除成功');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	public function delWordVoiceForAjax()
	{
		$data['msg'] = '数据删除失败';
		$data['num'] = 0;

		$postData = input('post.');
		$id = $postData['id'];
		$delType = $postData['del'];
		$WordVoiceModel = new WordVoiceModel;
		$editData = $WordVoiceModel->find($id);
		$res = $WordVoiceModel->where(['id'=>$id])->delete();

		if ($res) {
			@unlink(__DIR__.'/../../../public/'.$editData['word_voice']);
			$data['msg'] = '数据删除成功';
			$data['num'] = 1;
		}
		echo json_encode($data);
	}
}
?>