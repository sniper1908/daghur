<?php
namespace app\admin\model;

use think\Model;

class Category extends Model
{
	/**
	 * [获取分类树]
	 * @param  integer $pid         [分类父id]
	 * @param  integer $level       [分类等级，根分类为1级，向下子分类为上一级分类+1]
	 * @param  string  $parent_name [父分类名称]
	 * @return [type]               [分类数组，子分类数组为父分类的children元素]
	 */
	public function getTree($pid=0,$level=1,$parent_name='根分类')
	{
		if ($level==1) {
			# code...	
			$res = $this->where(['parent_id'=>$pid])->order('sort_order asc,id asc')->paginate(5);
		} else {
			$res = $this->where(['parent_id'=>$pid])->order('sort_order asc,id asc')->select();
		}
		if (!empty($res)) {
			foreach ($res as $key => $val) {
				// $val = $value->toArray();
				if (!empty($val)) {
					// $data[$val['id']] = $val;
					// $data[$val['id']]['level'] = $level;
					// $data[$val['id']]['parent_name'] = $parent_name;
					// $data[$val['id']]['children'] = $this->getTree($val['id'],$level+1,$val['cat_name']);
					$res[$key]['level'] = $level;
					$res[$key]['parent_name'] = $parent_name;
					$res[$key]['children'] = $this->getTree($val['id'],$level+1,$val['cat_name']);
				}
			}
			return $res;
		}
	}

	/**
	 * [获取分类树2]
	 * @param  integer $pid   [分类父id]
	 * @param  integer $level [分类等级，根分类为1级，向下子分类为上一级分类+1]
	 * @return [type]         [分类数组，子分类与父分类为同级关系，排在父分类的后面]
	 */
	public function getTree2($pid=0,$level=1)
	{
		$res = $this->where(['parent_id'=>$pid])->order('sort_order asc,id asc')->select();
		if (!empty($res)) {
			foreach ($res as $key => $value) {
				$val = $value->toArray();
				if (!empty($val)) {
					$val['level'] = $level;
					$data[] = $val;
					$arr = $this->getTree2($val['id'],$level+1);
					if (!empty($arr)) {
						foreach ($arr as $k2 => $v2) {
							$data[] = $v2;
						}
					}
				}
			}
			return $data;
		}
	}

	// 获取该分类下的子分类
	public function getChildrenId($pid=0)
	{
		$children = $this->field('id')->where(['parent_id'=>$pid])->select();
		if (!empty($children)) {
			foreach ($children as $value) {
				$val = $value->toArray();
				if (!empty($val)) {
					$data[] = $val['id'];
					$res = $this->getChildrenId($val['id']);
					if (!empty($res)) {
						foreach ($res as $v2) {
							$data[] = $v2;
						}
					}
				}
			}
			return $data;
		}
	}

	// 获取该分类下子分类并且包含该分类本身的id
	public function getChildrenIdAndSelf($pid=0)
	{
		$data = $this->getChildrenId($pid);
		$data = is_array($data) ? $data : [];
		array_unshift($data, $pid);
		return $data;
	}
}