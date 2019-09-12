<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Advertising as AdvertisingModel;
use app\admin\model\Ad as AdModel;

class Advertising extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '广告位列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('adv_add_edit');
		
		# 标题
		$title = '广告位列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$AdvertisingModel = new AdvertisingModel;
		$listData = $AdvertisingModel->select();

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加广告位';

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
		$title = '编辑广告位';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$AdvertisingModel = new AdvertisingModel;
		
		$id = input('id');
		$editData = $AdvertisingModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('adv_add_edit');

		$postData = input('post.');
		$data = $postData['data'];

		// 添加数据
		$_id = AdvertisingModel::insertGetId($data);

		if ($_id) {
			return $this->success('数据添加成功！','index');
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('adv_add_edit');

		$postData = input('post.');
		$data = $postData['data'];

		$AdvertisingModel = new AdvertisingModel;

		// 编辑数据
		$res = $AdvertisingModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('数据编辑成功！','index');
		}
		return $this->error('数据编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('adv_add_edit');

		$id = input('id');
		$AdvertisingModel = new AdvertisingModel;

		# 查看当前广告位下是否有广告，有则不能删除
		$AdModel = new AdModel;
		$count = $AdModel->where('adv_id',$id)->count();
		if ($count) {
			$this->error('该广告位下有广告，请删除广告后再删除！');
		}

		# 删除
		$res = $AdvertisingModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}