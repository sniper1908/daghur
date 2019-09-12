<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Category as CategoryModel;
use app\admin\model\GoodsType as GoodsTypeModel;
use app\admin\model\Attribute as AttributeModel;

class GoodsCategory extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品分类列表'
		]
	];

	public function index()
	{
		// 检查权限
		// $this->checkPermissionForMsg('goodscat_add_edit');
		
		# 标题
		$title = '商品分类列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree();

		$this->assign('catTree',$catTree);
		// dump($catTree);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加商品分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('filterAttrCount',0);
		$this->assign('actionName','insert');

		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree2();
		$goodsTypeList = GoodsTypeModel::where('is_enable',1)->select();

		$this->assign('catTree',$catTree);
		$this->assign('goodsTypeList',$goodsTypeList);
		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑商品分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree2();
		$goodsTypeList = GoodsTypeModel::where('is_enable',1)->select();

		$this->assign('catTree',$catTree);
		$this->assign('goodsTypeList',$goodsTypeList);

		$id = input('id');
		$editData = $CategoryModel->find($id);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		$filterAttrCount = 0;
		if ($editData['filter_attr']) {
			$filterAttrListStr = $editData['filter_attr'];
			$filterAttrList = explode(',',$filterAttrListStr);
			$filterAttrCount = count($filterAttrList);

			$goodsTypeArr = [];
			foreach ($filterAttrList as $key => $value) {
				$arr = AttributeModel::field('cat_id')->find($value);
				$goodsTypeArr[$key]['cat_id'] = $arr['cat_id'];
				$goodsTypeArr[$key]['id'] = $value;
				$goodsTypeArr[$key]['attr'] = AttributeModel::field('id,cat_id,attr_name')->where('cat_id',$arr['cat_id'])->select();
			}
			$this->assign('goodsTypeArr',$goodsTypeArr);
			// dump($goodsTypeArr);
		}
		
		$this->assign('filterAttrCount',$filterAttrCount);

		return $this->fetch('add');
	}

	public function insert()
	{
		# 检察权限
		$this->checkPermissionForMsg('goodscat_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		$filter = $postData['filter'];

		if (!empty($filter)) {
			$data['filter_attr'] = implode(',', $filter);
		}
		// 添加文章分类数据
		$id = CategoryModel::insertGetId($data);
		// 添加管理日志
		$log_info = '添加商品分类成功，商品分类id='.$id.'|Category';
		$this->addAdminLog($log_info,1);

		if ($id) {
			return $this->success('商品分类添加成功！','index');
		}
		return $this->error('商品分类添加失败！');
	}

	public function update()
	{
		#检查权限
		$this->checkPermissionForMsg('goodscat_add_edit');

		$postData = input('post.');
		$data = $postData['data'];
		$filter = $postData['filter'];

		if (!empty($filter)) {
			$data['filter_attr'] = implode(',', $filter);
		}
		// 编辑分类
		$CategoryModel = new CategoryModel;
		$res = $CategoryModel->save($data,['id'=>$postData['id']]);
		// 添加管理日志
		$log_info = '编辑商品分类成功，商品分类id='.$postData['id'].'|Category';
		$this->addAdminLog($log_info,2);

		if ($res) {
			return $this->success('编辑商品分类成功！','index');
		}
		return $this->error('编辑商品分类失败！');
	}

	public function del()
	{
		# 检查权限
		$this->checkPermissionForMsg('goodscat_change_remove');
		
		$id = input('id');
		$CategoryModel = new CategoryModel;
		$data = $CategoryModel->where(['parent_id'=>$id])->find();
		if (!empty($data)) {
			# 该分类有子分类
			return $this->error('该分类下存在子分类，请删除子分类后再删除');
		}
		# 该分类下如果有商品也不能删除
		$GoodsModel = new GoodsModel;
		$count = $GoodsModel->where(['cat_id'=>$id])->count();
		if ($count>0) {
			return $this->error('该分类下存在商品，请清空商品后再删除');
		}

		# 删除分类
		$res = $CategoryModel::destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}