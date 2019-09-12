<?php
namespace app\admin\controller;

use think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\Dictionary as DictionaryModel;
use app\admin\model\WordVoice as WordVoiceModel;

class Dictionary extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '词典列表'
		]
	];

	# 英文字母
	protected $wordIndex = [1=>'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

	# 词性
	protected $partOfSpeech = [1=>'名词','形容词','数词','时位词','代词','动词','副词','情态词','后置词','连接词','语气词','摹拟词','感叹词'];

	# 方言
	protected $dialect = [1=>'齐齐哈尔',2=>'莫旗',3=>'海拉尔',4=>'塔城'];

	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg('article_dictionary_manage');
		$this->assign('wordIndex',$this->wordIndex);
		$this->assign('partOfSpeech',$this->partOfSpeech);
		$this->assign('dialect',$this->dialect);
	}

	public function index()
	{
		# 标题
		$title = $this->breadcrumb[0]['name'];

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',0);

		$DictionaryModel = new DictionaryModel;
		$paginate = 10;

		# 如果有查询条件
		if (Request::instance()->isPost()) {
			# 条件查询
			$postData = input('post.');
			$data = $postData['data'];
			$where = [];
			if (isset($data['word_index']) && $data['word_index']) {
				$where['word_index'] = ['eq',$data['word_index']];
			}

			if (isset($data['word_name']) && trim($data['word_name'])) {
				$where['word_name'] = ['like','%'.$data['word_name'].'%'];
			}

			if (isset($data['word_meaning']) && trim($data['word_meaning'])) {
				$where['word_meaning'] = ['like','%'.$data['word_meaning'].'%'];
			}

			if (!empty($where)) {
				$this->assign('searchList',$data);
			}

			$listData = $DictionaryModel->where($where)->order('id desc,word_index desc')->paginate($paginate);
		} else {
			$listData = $DictionaryModel->order('id desc,word_index desc')->paginate($paginate);
		}

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加词汇';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','insert');

		# 获取session
		$session = session('admin');
		$admin_id = $session['admin_uid'];

		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑词汇';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','update');

		$DictionaryModel = new DictionaryModel;
		$id = input('id');
		$editData = $DictionaryModel->find($id);
		// print_r($editData);

		// 获取词汇的语音
		$voiceList = WordVoiceModel::where('dict_id',$id)->select();
		$voiceNumber = count($voiceList);

		$this->assign('editData',$editData);
		$this->assign('id',$id);		
		$this->assign('voiceList',$voiceList);
		$this->assign('voiceNumber',$voiceNumber);

		return $this->fetch('add');
	}

	public function insert()
	{
		$postData = input('post.');
		$data = $postData['data'];

		// 上传图片
		$fileList = request()->file();
		// $file = request()->file('upfile');
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','dictionary',-1);
				if (!empty($imgArr)) {
					$data['word_img'] = $imgArr['file_url'];
				}
			}
		}

		// 上传例句语音
		if (isset($fileList['attachSentence'])) {
			$attachSentence = $fileList['attachSentence'];
			$sentenceArr = [];
			if (!empty($attachSentence)) {
				# 有图片上传
				$sentenceArr = $this->upFile($attachSentence,'file','sentence',-1);
				if (!empty($sentenceArr)) {
					$data['example_sentence_voice'] = $sentenceArr['file_url'];
				}
			}
		}

		$DictionaryModel = new DictionaryModel;
		$DictionaryModel::startTrans();		
		$WordVoiceModel = new WordVoiceModel;

		try {
			$id = $DictionaryModel->insertGetId($data);
			// 上传单词语音
			if (isset($fileList['voiceFile'])) {
				foreach ($fileList['voiceFile'] as $key => $value) {
					$info = $value->getInfo();
					if (!$info['error'] && isset($dialect[$key]) && $dialect[$key]) {
						# 上传成功
						$voiceArr = $this->upFile($value,'file','voice',-1);
						if (!empty($voiceArr)) {	
							$voiceList[][] = $voiceArr['file_url'];
							$voice[$key]['dict_id'] = $id;
							$voice[$key]['dialect'] = $dialect[$key];
							$voice[$key]['word_voice'] = $voiceArr['file_url'];
							$WordVoiceModel::insert($voice);
						}
					}
				}
			}
			$trans_result = true;
			$DictionaryModel::commit();
		} catch (Exception $e) {
			$trans_result = false;
		    // 回滚事务
		    $DictionaryModel::rollback();		
		}

		if ($trans_result) {
			// 管理日志
			$log_info = '词汇添加成功，词汇id='.$id.'|Dictionary';
			$this->addAdminLog($log_info,1);
			// 跳转
			return $this->success('词汇添加成功！','index');
		} else {
			# 删除图片
			if (isset($data['word_img']) && $data['word_img']) {
				@unlink(__DIR__.'/../../../public/'.$data['word_img']);
			}
			# 删除例句语音
			if (isset($data['example_sentence_voice']) && $data['example_sentence_voice']) {
				@unlink(__DIR__.'/../../../public/'.$data['example_sentence_voice']);
			}
			# 删除语音
		    if (!empty($voiceList)) {
		    	foreach ($voiceList as $key => $value) {
		    		@unlink(__DIR__.'/../../../public/'.$value);

		    	}
		    }
			return $this->error('语音添加失败！');
		}	
	}

	/**
	 * 更新数据
	 * 此处存在一个bug 
	 * 如果上传语音时，改变了方言id，则曾经上传的文件不会被删除
	 * 但是会删除更新后的方言id原来上传的文件
	 * 此处需要添加一个change事件，如果改变方言id，并且有文件上传，则删除旧文件
	 * @return [type] [description]
	 */
	public function update()
	{
		$postData = input('post.');
		$data = $postData['data'];
		$id = $postData['id'];

		$DictionaryModel = new DictionaryModel;
		$WordVoiceModel = new WordVoiceModel;
		$editData = $DictionaryModel->find($id);
		# 该词汇的语音列表
		$wordVoiceList = $WordVoiceModel->where(['dict_id'=>$id])->select();

		// 上传图片
		$fileList = request()->file();
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','dictionary',-1);
				if (!empty($imgArr)) {
					$data['word_img'] = $imgArr['file_url'];
				}
			}
		}

		// 上传例句语音
		if (isset($fileList['attachSentence'])) {
			$attachSentence = $fileList['attachSentence'];
			$sentenceArr = [];
			if (!empty($attachSentence)) {
				# 有图片上传
				$sentenceArr = $this->upFile($attachSentence,'file','sentence',-1);
				if (!empty($sentenceArr)) {
					$data['example_sentence_voice'] = $sentenceArr['file_url'];
				}
			}
		}

		$DictionaryModel::startTrans();		

		try {
			$res = $DictionaryModel->save($data,['id'=>$id]);
			// 上传单词语音
			if (isset($fileList['voiceFile'])) {
				// 上传成功的语音方言id数组
				$successVoiceFileId = [];
				// 提交的方言id数组
				$dialect = $postData['dialect'];
				foreach ($fileList['voiceFile'] as $key => $value) {
					$info = $value->getInfo();
					// 如果上传成功并且存在方言id
					if (!$info['error'] && isset($dialect[$key]) && $dialect[$key]) {
						# 上传成功
						$voiceArr = $this->upFile($value,'file','voice',-1);
						if (!empty($voiceArr)) {	
							// 该条数据的方言id
							$dialect_id = $dialect[$key];
							// $successVoiceFileId[] = $dialect_id;
							// 成功上传文件的方言id数组
							array_push($successVoiceFileId, $dialect_id);
							// 成功上传文件的文件数组
							$voiceList[$dialect_id][] = $voiceArr['file_url'];
							$voice['dict_id'] = $id;
							$voice['dialect'] = $dialect[$key];
							$voice['word_voice'] = $voiceArr['file_url'];
							// 如果该词汇的方言存在，则更新，否则添加
							$wordVoiceDialectIdArr = [];
							if (!empty($wordVoiceList)) {
								foreach ($wordVoiceList as $k => $v) {
									array_push($wordVoiceDialectIdArr,$v->dialect);
								}
								if (in_array($dialect_id,$wordVoiceDialectIdArr)) {
									# 如果存在数组中，就更新
									$res2 = $WordVoiceModel->save($voice,['id'=>$v->id]);
								} else {
									$res2 = $WordVoiceModel::insert($voice);
								}
							} else {
								// 添加数据
								$res2 = $WordVoiceModel::insert($voice);
							}
						}
					}
				}
			}
			$trans_result = true;
			$DictionaryModel::commit();
		} catch (Exception $e) {
			$trans_result = false;
		    // 回滚事务
		    $DictionaryModel::rollback();		
		}

		if ($trans_result) {
			// 如果有新图片上传，删除旧图片
			if (isset($data['word_img']) && $data['word_img']) {
				@unlink(__DIR__.'../../../public/'.$editData['word_img']);
			}

			// 如果有新例句语音上传，删除旧例句语音
			if (isset($data['example_sentence_voice']) && $data['example_sentence_voice']) {
				@unlink(__DIR__.'../../../public/'.$editData['example_sentence_voice']);
			}

			// 如果有新语音音频上传，删除旧音频
			if (isset($successVoiceFileId) && !empty($successVoiceFileId) && !empty($wordVoiceList)) {
				foreach ($wordVoiceList as $key => $value) {
					if (in_array($value->dialect, $successVoiceFileId)) {
						@unlink(__DIR__.'/../../../public/'.$value['word_voice']);
					}
				}
			}

			// 管理日志
			$log_info = '词汇编辑成功，词汇id='.$id.'|Dictionary';
			$this->addAdminLog($log_info,2);
			// 跳转
			return $this->success('词汇编辑成功！','index');
		} else {
			# 删除图片
			if (isset($data['word_img']) && $data['word_img']) {
				@unlink(__DIR__.'/../../../public/'.$data['word_img']);
			}
			# 删除例句语音
			if (isset($data['example_sentence_voice']) && $data['example_sentence_voice']) {
				@unlink(__DIR__.'/../../../public/'.$data['example_sentence_voice']);
			}
			# 删除语音
		    if (!empty($voiceList)) {
		    	foreach ($voiceList as $key => $value) {
		    		@unlink(__DIR__.'/../../../public/'.$value);

		    	}
		    }
			return $this->error('语音编辑失败！');
		}	
	}

	public function del()
	{
		$id = input('id');
		$res = $this->delOneData($id);
		if ($res) {
			return $this->success('删除成功','index');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			foreach ($ids as $id) {
				$this->delOneData($id);
			}
			return $this->success('删除完成','index');
		}
		return $this->error('请选择要删除的数据');
	}

	protected function delOneData($id)
	{
		$DictionaryModel = new DictionaryModel;
		$editData = $DictionaryModel->find($id);
		$WordVoiceModel = new WordVoiceModel;
		$wordVoiceList = $WordVoiceModel->where(['dict_id'=>$id])->select();
		$delVoice = [];
		$delVoiceFlag = true;
		$trans_result = false;
		
		$DictionaryModel->startTrans();

		try {
			# 删除词汇数据
			$res = $DictionaryModel->where(['id'=>$id])->delete();
			# 删除语音数据
			if (!empty($wordVoiceList)) {
				# 有语音文件存在
				foreach ($wordVoiceList as $key => $value) {
					$delVoice[$key] = $value['word_voice'];
					$t = $WordVoiceModel->where(['id'=>$value['id']])->delete();
					if (!$t) {
						$delVoiceFlag = false;
					}
				}
			}
			if ($res && $delVoiceFlag) {
				$trans_result = true;
				$DictionaryModel->commit();
			}
		} catch (Exception $e) {
			$trans_result = false;
			$DictionaryModel->rollback();
		}
		if ($trans_result) {
			@unlink(__DIR__.'/../../../public/'.$editData['word_img']);
			@unlink(__DIR__.'/../../../public/'.$editData['example_sentence_voice']);
			if (!empty($delVoice)) {
				foreach ($delVoice as $key => $value) {
					@unlink(__DIR__.'/../../../public/'.$value);
				}
			}
			return true;
		} else {
			return false;
		}
	}
}
