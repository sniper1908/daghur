<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Brand as BrandModel;

class Brand extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '商品品牌列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_brand_manage');
		
		# 标题
		$title = '商品品牌列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);

		$BrandModel = new BrandModel;
		$listData = $BrandModel->order('is_show desc,sort_order asc,id asc')->paginate($this->paginate);

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		$title = '添加商品品牌';

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
		$title = '编辑商品品牌';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$BrandModel = new BrandModel;
		
		$id = input('id');
		$editData = $BrandModel->find($id);

		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_brand_manage');

		$postData = input('post.');
		$data = $postData['data'];

		// 上传图片
		$file = request()->file('upfile');
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','brand');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$data['brand_logo'] = $imgArr['file_url'];
			}
		}

		// 添加数据
		$_id = BrandModel::insertGetId($data);

		if ($_id) {
			return $this->success('数据添加成功！','index');
		}
		return $this->error('数据添加失败！');
	}

	public function update()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_brand_manage');

		$postData = input('post.');
		$data = $postData['data'];

		$BrandModel = new BrandModel;

		// 上传图片
		$file = request()->file('upfile');
		// dump($file);
		$imgArr = [];
		if (!is_null($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','brand');
			if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
				$data['brand_logo'] = $imgArr['file_url'];
				# 如果曾经上传过图片
				$old_img_arr = $BrandModel->field('brand_logo')->where(['id'=>$postData['id']])->find()->toArray();
			}
		}

		// 编辑数据
		$res = $BrandModel->save($data,['id'=>$postData['id']]);

		if ($res) {
			// 删除原图片
			if (!empty($old_img_arr) && isset($old_img_arr['brand_logo']) && $old_img_arr['brand_logo']) {
				@unlink(dirname(__FILE__).'/../../../public/'.$old_img_arr['brand_logo']);
			}
			return $this->success('数据编辑成功！','index');
		}
		return $this->error('数据编辑失败！');
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_brand_manage');

		$id = input('id');
		$BrandModel = new BrandModel;
		$data = $BrandModel->field('brand_logo')->where(['id'=>$id])->find();

		# 删除
		$res = $BrandModel->destroy($id);

		if ($res) {
			@unlink($data['brand_logo']);
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}

	public function delall()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_brand_manage');

		$postData = input('post.');
		$ids = $postData['delId'];
		if (!empty($ids)) {
			# 删除数据
			$BrandModel = new BrandModel;
			# 查找logo图片
			$listData = $BrandModel->field('id,brand_name,brand_logo')->where('id','in',$ids)->select();
			
			$res = $BrandModel->destroy($ids);
			if ($res) {
				if (!empty($listData)) {
					foreach ($listData as $value) {
						@unlink($value['brand_logo']);
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