<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Attribute as AttributeModel;
use app\admin\model\GoodsType as GoodsTypeModel;

class Attribute extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '属性列表'
		]
	];

	# 属性是否能检索 0不需要检索; 1关键字检索; 2范围检索
	# 不需要该属性成为检索商品条件的情况请选择不需要检索，
	# 需要该属性进行关键字检索商品时选择关键字检索，
	# 如果该属性检索时希望是指定某个范围时，选择范围检索。
	# 该属性应该是如果检索的话,可以通过该属性找到有该属性的商品
	protected $attrIndex = [
		0 => '不需要检索',
		1 => '关键字检索',
		2 => '范围检索'
	];

	# 商品属性是否可选
	protected $attrType = [
		0 => '唯一属性',
		1 => '单选属性',
		2 => '复选属性'
	];

	# 录入方式 0-手功输入;1-选择输入;2-多行文本输入
	protected $inputType = [
		0 => '手功输入',
		1 => '列表中选择',
		2 => '多行文本输入'
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_attr_manage');
		
		# 标题
		$title = '属性列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('inputType',$this->inputType);

		$type_id = input('type_id');
		$this->assign('type_id',$type_id);
		$GoodsTypeModel = new GoodsTypeModel;
		$type_name = $GoodsTypeModel->field('cat_name')->find($type_id);
		$this->assign('type_name',$type_name['cat_name']);

		$AttributeModel = new AttributeModel;
		$paginate = 10;
		$listData = $AttributeModel->where('cat_id',$type_id)->order('sort_order asc,id asc')->paginate($paginate);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加属性';

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
		// 是否需要检索
		$this->assign('attrIndex',$this->attrIndex);
		// 录入方式
		$this->assign('inputType',$this->inputType);
		// 属性是否可选
		$this->assign('attrType',$this->attrType);

		$type_id = input('type_id');
		$this->assign('type_id',$type_id);

		// 商品类型列表
		$GoodsTypeModel = new GoodsTypeModel;
		$goodsTypeList = $GoodsTypeModel->field('id,cat_name')->where('is_enable',1)->select();
		$this->assign('goodsTypeList',$goodsTypeList);
		// 商品类型的属性分组
		$attrGroupList = $GoodsTypeModel->field('attr_group')->find($type_id);
		$attrGroupList = $attrGroupList['attr_group'];
		if (!empty($attrGroupList)) {
			$attrGroupList = explode(',', $attrGroupList);
		}
		$this->assign('attrGroupList',$attrGroupList);

		return $this->fetch();
	}

	public function edit()
	{
		$title = '编辑属性';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		// 是否需要检索
		$this->assign('attrIndex',$this->attrIndex);
		// 录入方式
		$this->assign('inputType',$this->inputType);
		// 属性是否可选
		$this->assign('attrType',$this->attrType);

		$type_id = input('type_id');
		$this->assign('type_id',$type_id);

		// 商品类型列表
		$GoodsTypeModel = new GoodsTypeModel;
		$goodsTypeList = $GoodsTypeModel->field('id,cat_name')->where('is_enable',1)->select();
		$this->assign('goodsTypeList',$goodsTypeList);
		// 商品类型的属性分组
		$attrGroupList = $GoodsTypeModel->field('attr_group')->find($type_id);
		$attrGroupList = $attrGroupList['attr_group'];
		if (!empty($attrGroupList)) {
			$attrGroupList = explode(',', $attrGroupList);
		}
		$this->assign('attrGroupList',$attrGroupList);

		$AttributeModel = new AttributeModel;
		
		$id = input('id');
		$editData = $AttributeModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_attr_manage');

		$postData = input('post.');
		$data = $postData['data'];

		// if ($data['attr_input_type']==1) {
		// 	if (isset($data['attr_values']) && $data['attr_values']) {
		// 		$data['attr_values'] = str_replace('，', ',', $data['attr_values']);
		// 	} else {
		// 		$data['attr_values'] = '';
		// 	}
		// } else {
		// 	$data['attr_values'] = '';
		// }
		
		// if ($data['attr_input_type']!=1) {
		// 	$data['attr_input_type'] = '';
		// }

		// 添加数据
		$_id = AttributeModel::insertGetId($data);

		if ($_id) {
			return $this->success('数据添加成功！','index?type_id='.$data['cat_id']);
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_attr_manage');

		$postData = input('post.');
		$data = $postData['data'];
		
		// if ($data['attr_input_type']==1) {
		// 	if (isset($data['attr_values']) && $data['attr_values']) {
		// 		$data['attr_values'] = str_replace('，', ',', $data['attr_values']);
		// 	} else {
		// 		$data['attr_values'] = '';
		// 	}
		// } else {
		// 	$data['attr_values'] = '';
		// }
		
		// if ($data['attr_input_type']!=1) {
		// 	$data['attr_input_type'] = '';
		// }

		$AttributeModel = new AttributeModel;

		// 编辑数据
		$res = $AttributeModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			return $this->success('数据编辑成功！','index?type_id='.$data['cat_id']);
		}
		return $this->error('数据编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_attr_manage');

		$id = input('id');
		$AttributeModel = new AttributeModel;

		# 删除
		$res = $AttributeModel->destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_attr_manage');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$AttributeModel = new AttributeModel;
			$res = $AttributeModel->destroy($ids);
			if ($res) {
				return $this->success('删除成功');
			}
			return $this->error('删除失败');
		} else {
			return $this->error('请选择要删除的数据');
		}
	}

	# ajax方式获得某个商品类型下的属性列表
	public function getAttrListForAjax()
	{
		$postData = input('post.');
		$cat_id = $postData['type_id'];
		// $listData = AttributeModel::field('id,attr_name')->where('cat_id',$cat_id)->select();
		$listData = AttributeModel::where('cat_id',$cat_id)->select();
		$res = json_encode($listData);
		echo $res;
		die();
	}
}