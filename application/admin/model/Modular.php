<?php 
namespace app\admin\model;

use think\Model;

class Modular extends Model
{
	public function getTree($type='page',$limit=1)
	{
		# 获取主模块
		// $data = $this
		// 	->where(['parent_id'=>0,'is_lock'=>0])
		// 	->order('sort_order asc,id asc')
		// 	->paginate($limit);
		$data = $this->getTreeData($type,$limit);

		if (!empty($data)) {
			foreach ($data as $key => $value) {
				$value->parent_name = '根模块';
				# 将子模块添加到children中
				$children = $this
					->where(['parent_id'=>$value['id'],'is_lock'=>0])
					->order('sort_order asc,id asc')
					->select();
				if (!empty($children)) {
					foreach ($children as $k => $v) {
						$v->parent_name = $value['modular_name'];
					}
					$value->children = $children;
				} else {
					$value->children = '';
				}
			}
		}

		return $data;
	}

	protected function getTreeData($type='page',$limit=1)
	{
		if ($type=='page') {
			$data = $this
				->where(['parent_id'=>0,'is_lock'=>0])
				->order('sort_order asc,id asc')
				->paginate($limit);
		} else {
			$data = $this
				->where(['parent_id'=>0,'is_lock'=>0])
				->order('sort_order asc,id asc')
				->select();
		}

		return $data;
	}

	public function getTreeForPermission()
	{
		# 获取主模块
		$data = $this
			->where(['parent_id'=>0,'is_lock'=>0])
			->order('sort_order asc,id asc')
			->select();

		if (!empty($data)) {
			foreach ($data as $key => $value) {
				$value->parent_name = '根模块';
				# 将子模块添加到children中
				$children = $this
					->where(['parent_id'=>$value['id'],'is_lock'=>0])
					->order('sort_order asc,id asc')
					->select();
				if (!empty($children)) {
					foreach ($children as $k => $v) {
						$v->parent_name = $value['modular_name'];
					}
					$value->children = $children;
				} else {
					$value->children = '';
				}
			}
		}

		return $data;
	}
}