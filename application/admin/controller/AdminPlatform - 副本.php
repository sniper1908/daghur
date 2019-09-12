<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Image;
use app\admin\model\AdminUser;
use app\admin\model\AdminLog;
use app\admin\model\Modular as ModularModel;
use app\admin\model\Permission as PermissionModel;

class AdminPlatform extends Controller
{
	protected $paginate = 10;
	
	public function _initialize()
	{
		// 默认不是表单提交页面
		$this->assign('isForm',0);
		# menu 左侧导航列表
		$this->assign('menu',$this->getNav());
	}
	
	protected $beforeActionList = [
		'checkAdminLogin' => [
			'except' => 'login/*'
		] 
	];

	# 检查用户是否登陆
	public function checkAdminLogin()
	{
		# 查找session
		$session_admin = session('admin');

		if (empty($session_admin)) {
			# session 中不存在admin
			return $this->error('您尚未登陆，请登陆后再执行操作','login/index');
		}
	}

	/**
	 * [添加管理日志]
	 * @param [string]  $log_info [日志内容]
	 * @param integer $log_type [日志类型 1-添加 2-编辑 3-删除 4-软删除 5-批量删除 6-批量软删除 7-登陆 8-退出]
	 */
	protected function addAdminLog($log_info,$log_type=1)
	{
		$AdminLogModel = new AdminLog;
		$session = session('admin');
		$AdminLogModel->admin_id = $session['admin_uid'];
		$AdminLogModel->log_type = $log_type;
		$AdminLogModel->log_info = $log_info;
		$AdminLogModel->admin_ip = request()->ip();
		$AdminLogModel->save();
	}

	/**
	 * [获取菜单列表]
	 * @return [array] [左侧菜单列表]
	 */
	public function getNav()
	{
		$ModularModel = new ModularModel;
		$tree = $ModularModel->getTree('list');

		$session = Session('admin');
		// print_r($session);

		if (empty($tree)) {
			return $tree;
		}
		if ($session['admin_uid']!=1) {
			if (empty($session['admin_permission'])) {
				$tree = [];
				return $tree;
			}
			
			$permission_parent_id_arr = array_keys($session['admin_permission']);
			foreach ($tree as $key => $value) {
				$value = $value->toArray();
				# 如果菜单项存在于权限列表中，则将第一级模块放入菜单项中
				if (in_array($value['permission_code'], $permission_parent_id_arr)) {
					// print_r($value);
					foreach ($value as $k2 => $v2) {
						if ($k2!='children') {
							$menu[$key][$k2] = $v2;
						} else {
							$controller_name_arr = [];
							foreach ($value['children'] as $k3 => $v3) {
								if (in_array($v3['permission_code'],$session['admin_permission'][$value['permission_code']])) {
									$menu[$key]['children'][$k3] = $v3;
									$controller_name_arr[] = ucfirst($v3['modular_controller']);
									$controller_name_arr = array_unique($controller_name_arr);
								}
							}
							$menu[$key]['controller_name_str'] = implode(',',$controller_name_arr);
						}
					}
				}
			}
		} else {
			$menu = $tree;
			foreach ($menu as $key => $value) {
				$value = $value->toArray();
				$menu[$key] = $value;
				$controller_name_arr = [];
				if (isset($value['children']) && !empty($value['children'])) {
					foreach ($value['children'] as $k2 => $v2) {
						$controller_name_arr[] = ucfirst($v2['modular_controller']);
						$controller_name_arr = array_unique($controller_name_arr);
					}
				}
				$menu[$key]['controller_name_str'] = implode(',',$controller_name_arr);
				// echo $menu[$key]['controller_name_str'].'=============<br/>';
			}
		}

		$menu = isset($menu) ? $menu : [];
		// print_r($menu);

		return $menu;
	}

	/**
	 * [检查管理员是否具有给定的权限，admin_uid=1的管理员默认有全部的权限]
	 * @param  [string] 	$permission_code 	[权限代码]
	 * @return [Boolean]                  		[是否具有对应的权限]
	 */
	protected function checkPermission($permission_code)
	{
		$res = false;

		// 管理员权限
		$session = Session('admin');
		// 如果管理员是admin，则拥有全部的权限
		if ($session['admin_uid'] == 1) {
			return true;
		}
		$admin_permission = $session['admin_permission'];
		// 如果管理员权限为空，则返回false
		if (empty($admin_permission)) {
			return false;
		}

		$PermissionModel = new PermissionModel;
		$data = $PermissionModel->where('permission_name_code',$permission_code)->find();

		// 如果检查的权限在数据库中不存在，则返回false
		if (empty($data)) {
			return false;
		}

		foreach ($admin_permission as $key => $value) {
			if ($key == $data['id']) {
				$res = true;
				return true;
			}
			if (in_array($data['id'],$value)) {
				$res = true;
				return true;
			}
		}

		return $res;		
	}

	/**
	 * [检查管理员是否有操作权限]
	 * @param  [string] $permission_code [操作权限字符串]
	 * @return [mix]                  [如果有操作权限则继续执行代码，如果没有权限则提示错误信息]
	 */
	protected function checkPermissionForMsg($permission_code)
	{
		// 检查权限
		$hasPermission = $this->checkPermission($permission_code);
		if (!$hasPermission) {
			$this->error('对不起，您没有该操作权限！');
		}
	}

	/**
	 * [上传文件]
	 * @param  [array] $file     [上传文件数组]
	 * @param  string $fileType [文件保存类型]
	 * @param [number] $if_thumb [是否生成缩略图 -1表示不生成 1-生成]
	 * @param [array] $[thumbSize] [缩略图信息 0-宽度 1-高度 2-缩略方式]
	 * @param [array] $[imageSize] [大图信息 0-宽度 1-高度 2-缩略方式]
	 * @return [array]           [文件存放位置]
	 */
	protected function upFile($file,$fileType='image',$dir_name='image',$if_thumb=-1,$thumbSize=[300,300,Image::THUMB_CENTER],$imageSize=[0,0,Image::THUMB_CENTER])
	{
		// dump($file);
		$fileInfo = $file->getInfo();
		$fileNameArr = explode('.', $fileInfo['name']);
		$fileName = date('YmdHis').mt_rand(1,99999);
		// $dirName = 'upload/'.$fileType.'/'.date('Ymd');
		$dirName = 'upload/'.$dir_name.'/'.date('Ymd');
		if (!file_exists($dirName)) {
			mkdir($dirName,0777,true);
			chmod($dirName, 0777);
		}
		// 原图名称
		$fileOriginalUrl = $dirName.'/'.$fileName.'_original.'.$fileNameArr[1];
		// 大图名称
		$fileUrl = $dirName.'/'.$fileName.'.'.$fileNameArr[1];
		// 缩略图名称
		if ($fileType=='image' && $if_thumb!=-1) {
			$fileThumbUrl = $dirName.'/'.$fileName.'_thumb.'.$fileNameArr[1];
		}
		// echo $fileUrl;//exit;
		$file->move($dirName,$fileName.'.'.$fileNameArr[1]);
		// 生成大图
		if ($fileType=='image' && !empty($imageSize)) {
			$images = Image::open($fileUrl);
			// $images->thumb(300,300)->save($fileThumbUrl);
			$imageSize[2] = isset($imageSize[2])&& $imageSize[2] ? $imageSize[2] : Image::THUMB_CENTER;
			$images->thumb($imageSize[0],$imageSize[1],$imageSize[2])->save($fileThumbUrl);
		}
		// 生成缩略图
		if ($fileType=='image' && $if_thumb!=-1) {
			$images = Image::open($fileUrl);
			// $images->thumb(300,300)->save($fileThumbUrl);
			$thumbSize[2] = isset($thumbSize[2])&& $thumbSize[2] ? $thumbSize[2] : Image::THUMB_CENTER;
			$images->thumb($thumbSize[0],$thumbSize[1],$thumbSize[2])->save($fileThumbUrl);
		}
		// dump($images);
		$res = [];
		$res['file_url'] = $fileUrl;
		if ($fileType=='image' && $if_thumb!=-1) {
			$res['file_thumb_url'] = $fileThumbUrl;
		}

		return $res;
	}
}