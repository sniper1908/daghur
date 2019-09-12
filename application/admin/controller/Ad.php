<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Ad as AdModel;
use app\admin\model\Advertising as AdvertisingModel;

class Ad extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '广告列表'
		]
	];

	# 广告类型 0-图片 1-flash 2-代码 3-文字
	protected $adType = [
		0 => '图片',
		// 1 => 'flash',
		// 2 => '代码',
		// 3 => '文字'
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('ad_add_edit');
		
		# 标题
		$title = '广告列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$AdModel = new AdModel;
		$paginate = 10;
		$listData = $AdModel->order('adv_id asc,ad_type asc,is_show asc,id asc')->paginate($paginate);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加广告';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');
		$this->assign('editData',[]);
		$this->assign('adType',$this->adType);
		$this->assign('id',0);

		$AdvertisingModel = new AdvertisingModel;
		$advList = $AdvertisingModel->where('is_show',1)->select();
		$this->assign('advList',$advList);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑广告';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$AdvertisingModel = new AdvertisingModel;
		$advList = $AdvertisingModel->where('is_show',1)->select();
		$this->assign('advList',$advList);

		$AdModel = new AdModel;
		
		$id = input('id');
		$editData = $AdModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('adType',$this->adType);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('ad_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		$data['start_time'] = strtotime($data['start_time']);
		$data['end_time'] = strtotime($data['end_time']);
		if ($data['end_time']<=$date['start_time']) {
			$this->error('结束时间不能小于开始时间');
		}

		// 上传图片
		$file = request()->file('upfile');
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','ad');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$data['ad_code'] = $imgArr['file_url'];
			}
		}

		// 添加数据
		$_id = AdModel::insertGetId($data);

		if ($_id) {
			return $this->success('数据添加成功！','index');
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('ad_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		$data['start_time'] = strtotime($data['start_time']);
		$data['end_time'] = strtotime($data['end_time']);
		if ($data['end_time']<=$date['start_time']) {
			$this->error('结束时间不能小于开始时间');
		}

		$AdModel = new AdModel;

		// 上传图片
		$file = request()->file('upfile');
		// dump($file);
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','ad');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$data['ad_code'] = $imgArr['file_url'];
				# 如果曾经上传过图片
				$old_img_arr = $AdModel->field('ad_code')->where(['id'=>$postData['id']])->find()->toArray();
			}
		}

		// 编辑数据
		$res = $AdModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			// 删除原图片
			if (!empty($old_img_arr) && isset($old_img_arr['ad_code']) && $old_img_arr['ad_code']) {
				@unlink(dirname(__FILE__).'/../../../public/'.$old_img_arr['ad_code']);
			}
			return $this->success('数据编辑成功！','index');
		}
		return $this->error('数据编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('ad_add_edit');

		$id = input('id');
		$AdModel = new AdModel;
		$data = $AdModel->field('ad_code')->where(['id'=>$id])->find();

		# 删除
		$res = $AdModel->destroy($id);

		if ($res) {
			@unlink($data['ad_code']);
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('ad_add_edit');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$AdModel = new AdModel;
			# 查找图片
			$listData = $AdModel->field('id,ad_name,ad_code')->where('id','in',$ids)->where('ad_type',0)->select();
			
			$res = $AdModel->destroy($ids);
			if ($res) {
				if (!empty($listData)) {
					foreach ($listData as $value) {
						@unlink($value['ad_code']);
					}
				}
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}
}
