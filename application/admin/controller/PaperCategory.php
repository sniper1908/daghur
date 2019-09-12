<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\PaperCategory as PaperCategoryModel;

class PaperCategory extends AdminPlatform
{
	# 试卷管理权限
	protected $permissionName = 'test_paper_category_manage';
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '试卷分类列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		# 标题
		$title = '试卷分类列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$CategoryModel = new PaperCategoryModel;
		$listData = $CategoryModel->select();

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加试卷分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('filterAttrCount',0);
		$this->assign('actionName','insert');

		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑试卷分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$CategoryModel = new PaperCategoryModel;

		$id = input('id');
		$editData = $CategoryModel->find($id);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		# 检察权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];

		// 添加分类数据
		$id = PaperCategoryModel::insertGetId($data);
		// 添加管理日志
		$log_info = '添加试卷分类成功，分类id='.$id.'|PaperCategory';
		// $this->addAdminLog($log_info,1);

		if ($id) {
			return $this->success('试卷分类添加成功！','index');
		}
		return $this->error('试卷分类添加失败！');
	}

	public function update()
	{
		#检查权限
		$this->checkPermissionForMsg($this->permissionName);

		$postData = input('post.');
		$data = $postData['data'];

		// 编辑分类
		$CategoryModel = new PaperCategoryModel;
		$res = $CategoryModel->save($data,['id'=>$postData['id']]);
		// 添加管理日志
		$log_info = '编辑试卷分类成功，试卷分类id='.$postData['id'].'|PaperCategory';
		// $this->addAdminLog($log_info,2);

		if ($res) {
			return $this->success('编辑分类成功！','index');
		}
		return $this->error('编辑分类失败！');
	}

	public function del()
	{
		# 检查权限
		$this->checkPermissionForMsg($this->permissionName);
		
		$id = input('id');
		$CategoryModel = new PaperCategoryModel;
		# 该分类下如果有试卷也不能删除
		// $GoodsModel = new GoodsModel;
		// $count = $GoodsModel->where(['cat_id'=>$id])->count();
		// if ($count>0) {
		// 	return $this->error('该分类下存在试卷，请清空数据后再删除');
		// }

		# 删除分类
		$res = $CategoryModel::destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}