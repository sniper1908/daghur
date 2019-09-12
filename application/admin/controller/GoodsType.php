<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\GoodsType as GoodsTypeModel;

class GoodsType extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品类型列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_type');
		
		# 标题
		$title = '商品类型列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$GoodsTypeModel = new GoodsTypeModel;
		$paginate = 10;
		$listData = $GoodsTypeModel->paginate($paginate);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加商品类型';

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
		$title = '编辑商品类型';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$GoodsTypeModel = new GoodsTypeModel;
		
		$id = input('id');
		$editData = $GoodsTypeModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_type');

		$postData = input('post.');
		$data = $postData['data'];
		$data['attr_group'] = str_replace('，', ',', $data['attr_group']);

		// 添加数据
		$_id = GoodsTypeModel::insertGetId($data);

		if ($_id) {
			return $this->success('数据添加成功！','index');
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_type');

		$postData = input('post.');
		$data = $postData['data'];
		$data['attr_group'] = str_replace('，', ',', $data['attr_group']);

		$GoodsTypeModel = new GoodsTypeModel;

		// 编辑数据
		$res = $GoodsTypeModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('数据编辑成功！','index');
		}
		return $this->error('数据编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_type');

		$id = input('id');
		$GoodsTypeModel = new GoodsTypeModel;

		# 查看当前类型下是否有属性，有则不能删除
		$AttributeModel = new AttributeModel;
		$count = $AttributeModel->where('cat_id',$id)->count();
		if ($count) {
			$this->error('该类型下有属性，请删除属性后再删除！');
		}

		# 删除
		$res = $GoodsTypeModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}