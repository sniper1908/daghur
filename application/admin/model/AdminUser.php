<?php
namespace app\admin\model;

use think\Model;
use app\admin\model\Role as RoleModel;

class AdminUser extends Model
{
	// protected $autoWriteTimestamp = true;
	// protected $updateTime = 'last_time';

	public function checkLogin($username,$pwd)
	{
		$res = [];
		$res['code'] = '200';
		$res['msg'] = '登陆成功';

		$username = trim($username);
		$pwd = trim($pwd);

		# 用户名或密码不能为空
		if (!$username || !$pwd) {
			$res['code'] = '1';
			$res['msg'] = '用户名或密码不能为空';
			return $res;
		}

		# 查找该用户
		$data = self::where('admin_user_name',$username)->find()->toArray();

		# 数据库中没有该用户
		if (empty($data)) {
			$res['code'] = 2;
			$res['msg'] = '用户名错误';
			return $res;
		}

		# 对比密码
		$md5_pwd = $this->setPassword($pwd,$data['admin_salt']);
		if ($md5_pwd != $data['admin_pass_word']) {
			$res['code'] = 3;
			$res['msg'] = '密码错误';
			return $res;
		}

		########################################################
		// 此处还应该查询数据库后台用户权限表，是否有登陆的权限
		########################################################
		$RoleModel = new RoleModel;
		$rolePermission = $RoleModel->field('role_permission')->find($data['role_id']);
		if ($data['id']!=1 && empty($rolePermission)) {
			# 没有权限
			$res['code'] = 4;
			$res['msg'] = '您没有操作权限';
			return $res;
		}
		$rolePermission = unserialize($rolePermission['role_permission']);
		

		$res['admin_id'] = $data['id'];
		$res['admin_username'] = $data['admin_user_name'];
		# 管理员具有的权限id数组
		$res['admin_permission'] = $rolePermission;
		
		return $res;
	}

	/**
	 * [设置登录密码]
	 * @param string $pwd  [密码-明码]
	 * @param string $salt [加密串]
	 * @return string      [加密后的字符串]
	 */
	public function setPassword($pwd,$salt)
	{
		# sha1加密密码明码
		$sha1_pwd = sha1($pwd);
		# sha1加密加密串
		$sha1_salt = sha1($salt);
		# 连接2个sha1加密串
		$sha1_str = $sha1_pwd . $sha1_salt;
		#$sha1_str = $sha1_pwd;
		# 大写连接后的加密串
		$sha1_str_toupper = strtoupper($sha1_str);
		# md5加密得到最终的密码
		$md5_str = md5($sha1_str_toupper);
		# 返回加密后的密码
		return $md5_str;
	}

	public function updatePassword($uid,$salt,$pwd)
	{
		$newPass = $this->setPassword($pwd,$salt);
		if (!$newPass) {
			return 0;
		}
		// 更新数据库
		$data = [];
		$data['admin_pass_word'] = $newPass;
		$res = $this->save($data,['id'=>$uid]);
		return $res;
	}
}