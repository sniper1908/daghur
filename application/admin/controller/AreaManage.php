<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\Region as RegionModel;

class AreaManage extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '地区列表'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('area_list_manage');
		
		# 标题
		$title = '地区列表';

		$this->assign('title',$title);

		$page = input('page');
		$page = $page ? $page : 1;
		$this->assign('page',$page);

		$parent_id = input('parent_id');
		$parent_id = $parent_id ? $parent_id : 0;
		$this->assign('parent_id',$parent_id);

		$region_type = input('region_type');
		$region_type = $region_type ? $region_type : 0;
		$this->assign('region_type',$region_type);

		$RegionModel = new RegionModel;
		$curData = $RegionModel->find($parent_id);
		$prevRegionType = $region_type-1;
		$prevRegionType = $prevRegionType<0 ? 0 : $prevRegionType;

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index?parent_id='.$curData['parent_id'].'&region_type='.$prevRegionType;
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $curData['region_name'];
		$this->assign('breadcrumb',$this->breadcrumb);

		$listData = $RegionModel->where(['parent_id'=>$parent_id,'region_type'=>$region_type])->select();
		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function insert()
	{
		// 检查权限
		$this->checkPermissionForMsg('area_list_manage');

		$postData = input('post.');
		$data = $postData['data'];
		if (!$data['region_name']) {
			$this->error('请输入地区名称');
		}

		$RegionModel = new RegionModel;
		$res = $RegionModel->insertGetId($data);
		if (!$res) {
			$this->error('地区数据添加失败');
		}
		$this->success('地区数据添加成功!','index?parent_id='.$data['parent_id'].'&region_type='.$data['region_type']);
	}

	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('area_list_manage');

		$id = input('id');
		$parent_id = input('parent_id');
		$region_type = input('region_type');

		$RegionModel = new RegionModel;

		if ($region_type==3) {
			# 区县，没有下级地区，直接删除
			$res = $RegionModel->destroy($id);
			$log_info = '删除地区数据，数据id='.$id;
		} else {
			$ids = $this->getChildrenId($parent_id);
			// print_r($ids);
			$res = $RegionModel->where(['id'=>['in',$ids]])->delete();
			$log_info = '批量删除地区列表，数据id='.implode(',',$ids);
		}

		if ($res) {
			$log_info .= '成功|Region';
			addAdminLog($log_info,5);
			$this->success('数据删除成功！','index');
		} else {
			$this->error('删除数据失败！');
		}
	}

	protected function getChildrenId($parent_id)
	{
		$ids = [$parent_id];
		$RegionModel = new RegionModel;
		$childrenData = $RegionModel->field('id')->where(['parent_id'=>$parent_id])->select();
		if (!empty($childrenData)) {
			foreach ($childrenData as $key => $value) {
				$ids[] = $value['id'];
				$c = $this->getChildrenId($value['id']);
				if (!empty($c)) {
					foreach ($c as $k2 => $v2) {
						$ids[] = $v2;
					}
				}
			}
		}

		$ids = array_unique($ids);

		return $ids;
	}
}
