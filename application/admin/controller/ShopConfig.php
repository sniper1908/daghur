<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\ShopConfig as ShopConfigModel;

class ShopConfig extends AdminPlatform
{
	protected $typeList = ['text','password','textarea','radio','select','options','manual','file','hidden','hidden0','group0'];

	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '网站配置'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		# 标题
		$title = '网站设置';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$ShopConfigModel = new ShopConfigModel;
		$listData = $ShopConfigModel->getList('page');
		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加配置信息';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		
		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$this->assign('actionName','insert');
		$this->assign('editData',[]);
		$this->assign('id',0);
		$this->assign('typeList',$this->typeList);

		$ShopConfigModel = new ShopConfigModel;
		$tree = $ShopConfigModel->where(['parent_id'=>0])->order('sort_order asc')->select();
		$this->assign('tree',$tree);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑配置信息';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		
		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$ShopConfigModel = new ShopConfigModel;
		
		$id = input('id');
		$editData = $ShopConfigModel->find($id);

		$this->assign('actionName','update');
		$this->assign('editData',$editData);
		$this->assign('id',$id);
		$this->assign('typeList',$this->typeList);

		$ShopConfigModel = new ShopConfigModel;
		$tree = $ShopConfigModel->where(['parent_id'=>0])->order('sort_order asc')->select();
		$this->assign('tree',$tree);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		$postData = input('post.');
		$data = $postData['data'];
		// 添加数据
		$_id = ShopConfigModel::insertGetId($data);
		$page = input('page');
		$page = $page ? $page : 1;

		if ($_id) {
			return $this->success('配置信息添加成功！',url('index').'?page='.$page);
		}
		return $this->error('配置信息添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		$postData = input('post.');
		$data = $postData['data'];
		// 编辑数据
		$ShopConfigModel = new ShopConfigModel;
		$res = $ShopConfigModel->save($data,['id'=>$postData['id']]);
		$page = input('page');
		$page = $page ? $page : 1;

		if ($res) {
			return $this->success('配置信息编辑成功！',url('index').'?page='.$page);
		}
		return $this->error('配置信息编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		$id = input('id');
		$ShopConfigModel = new ShopConfigModel;

		# 删除数据
		$res = $ShopConfigModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$ShopConfigModel = new ShopConfigModel;
			$res = $ShopConfigModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}
}