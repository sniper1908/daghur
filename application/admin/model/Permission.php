<?php
namespace app\admin\model;

use think\Model;

class Permission extends Model
{
	public function getTree($type='page',$limit=1)
	{
		# 获取主模块
		// $data = $this
		// 	->where(['parent_id'=>0])
		// 	->order('sort_order asc,id asc')
		// 	->paginate($limit);
		$data = $this->getTreeData($type,$limit);

		if (!empty($data)) {
			foreach ($data as $key => $value) {
				$value->parent_name = '根权限';
				# 将子模块添加到children中
				$children = $this
					->where(['parent_id'=>$value['id']])
					->order('sort_order asc,id asc')
					->select();
				if (!empty($children)) {
					foreach ($children as $k => $v) {
						$v->parent_name = $value['permission_name'];
					}
					$value->children = $children;
				} else {
					$value->children = '';
				}
			}
		}

		return $data;
	}

	protected function getTreeData($type='list',$limit=1)
	{
		$data = [];
		if ($type == 'list') {
			$data = $this
				->where(['parent_id'=>0])
				->order('sort_order asc,id asc')
				->select();
		} else {
			$data = $this
				->where(['parent_id'=>0])
				->order('sort_order asc,id asc')
				->paginate($limit);
		}

		return $data;
	}

	/**
	 * [获取上级分类id，以及是否有上级分类]
	 * @param  [int] $id [模块id]
	 * @return [array]     [父id值+是否有上级分类]
	 */
	public function getParentInfo($id)
	{
		# 获取父id
		$parentInfo = $this->field('parent_id')->find($id);
		$parent_id = $parentInfo['parent_id'];
		$has_parent = 0;
		if ($parent_id) {
			# 获取父id2
			// $parentInfo = $this->field('parent_id')->find($parent_id);
			// $parent_id = $parentInfo['parent_id'];
			$has_parent = 1;
		}
		$res = [];
		$res['parent_id'] = $has_parent ? $parent_id : $id;
		$res['has_parent'] = $has_parent;

		return $res;
	}
}