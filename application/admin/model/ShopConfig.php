<?php
namespace app\admin\model;

use think\Model;

class ShopConfig extends Model
{
	/**
	 * [获取网站配置信息]
	 * @param  string  $type  [list-获取全部数据 其他的获取分页的数据]
	 * @param  integer $limit [分页获取的条目数]
	 * @return [array]         [配置信息数组]
	 */
	public function getList($type='list',$limit=1)
	{
		// $res = $this->where(['parent_id'=>0])->select();
		$res = $this->getTreeData($type,$limit);

		if (!empty($res)) {
			foreach ($res as $key => $value) {
				// $value = $value->toArray();
				$value['parent_name'] = '--';
				$res[$key] = $value;
				$children = $this->where(['parent_id'=>$value['id']])->select();
				if (!empty($children)) {
					foreach ($children as $k => $v) {
						// $v = $v->toArray();
						$v['parent_name'] = $value['input_name'];
						$children[$k] = $v;
					}
				}
				$res[$key]['children'] = $children;
			}
		}

		return $res;
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
	 * 获取配置信息数组 key-value 形式
	 * @return [array] [字段名-字段值形式]
	 */
	public function getAttrValue()
	{
		$res = [];
		$data = $this->where("input_value<>''")->select();

		if ($data) {
			foreach ($data as $key => $value) {
				$k = $value['input_attribute'];
				$res["$k"] = $value['input_value'];
			}
		}

		return $res;
	}
}