<?php
namespace app\admin\controller;

use think\Controller;
use think\captcha\Captcha;
use think\Request;
use think\Session;
use app\admin\model\AdminUser;
use app\admin\model\AdminLog;

class Login extends Controller
{
	public function _initialize()
	{
		# code...
	}

	public function index()
	{
		$title = '后台登陆页';
		$this->assign('title',$title);
		return $this->fetch('login');
	}

	public function checkLogin()
	{
		# 获取post提交的数据
		$post_data = input('post.');
		$admin = $post_data['admin'];
		$captcha = $post_data['captcha_admin_login'];

		# 验证验证码输入是否正确
		if (!captcha_check($captcha)) {
			# 验证码输入有误
			return $this->error('验证码输入有误，请返回重新输入');
		}

		# 验证用户名和密码
		$AdminUser = new AdminUser;
		$res = $AdminUser->checkLogin($admin['admin_user_name'],$admin['admin_pass_word']);

		if ($res['code'] == 200) {
			# 验证通过
			# 设置session
			Session::set('admin',[
				'admin_username' => $res['admin_username'],
				'admin_uid' => $res['admin_id'],
				# 权限
				'admin_permission' => $res['admin_permission']
			]);
			// print_r(session('admin'));
			// 修改最后登陆时间
			$data = [];
			$data['last_time'] = time();
			$data['admin_ip'] = request()->ip();
			$saveRes = $AdminUser->save($data,['id'=>$res['admin_id']]);
			// 记录管理日志
			$log_info = '管理员登陆成功，管理员id='.$res['admin_id'].'|AdminUser';
			// 如果需要记住密码，则记录cookie
			// 7 - 登陆
			$this->addAdminLog($res['admin_id'],$log_info,7);
			
			return $this->success($res['msg'],'index/index');
		}

		return $this->error($res['msg']);
	}

	public function forgetPass()
	{
		# 忘记密码
		$title = '忘记密码';
		return $this->fetch();
	}

	public function findPwd()
	{
		# 获取post提交的数据
		$postData = input('post.');
		$admin = $postData['admin'];
		$captcha = $postData['captcha_admin_login'];

		# 验证验证码输入是否正确
		if (!captcha_check($captcha)) {
			# 验证码输入有误
			return $this->error('验证码输入有误，请返回重新输入');
		}

		# 验证用户名和预留加密串
		$AdminUser = new AdminUser;
		$adminData = $AdminUser->where(['admin_user_name'=>$admin['admin_user_name']])->find()->toArray();
		
		if (!$admin['admin_salt'] || ($admin['admin_salt']!=$adminData['admin_salt'])) {
			return $this->error('预留加密串输入有误');
		}
		# 修改用户密码，并将密码发送给用户
		# 修改的密码为1234567
		$newPass = '1234567';
		$res = $AdminUser->updatePassword($adminData['id'],$admin['admin_salt'],$newPass);
		if ($res) {
			$msg = '您的新密码为'.$newPass.',请妥善保管新密码并重新登录';
			return $this->success($msg,'index','',10);
		}
		return $this->error('更新密码失败，请重新尝试');
	}

	public function logout()
	{
		$session = session('admin');
		$admin_id = $session['admin_uid'];
		# 退出
		if (Session::has('admin')) {
			# 如果SESSION中存在admin
			Session::delete('admin');
		}

		// 记录管理日志
		$log_info = '管理员退出登陆成功，管理员id='.$admin_id.'|AdminUser';
		// 8 - 退出登陆
		$this->addAdminLog($admin_id,$log_info,8);

		// 退出 跳到前台首页
		$this->success('感谢您的辛苦工作！','index/index/index');
	}

	/**
	 * [添加管理日志]
	 * @param [string]  $log_info [日志内容]
	 * @param integer $log_type [日志类型 1-添加 2-编辑 3-删除 4-软删除 5-批量删除 6-批量软删除 7-登陆 8-退出]
	 */
	protected function addAdminLog($admin_id,$log_info,$log_type=1)
	{
		$AdminLogModel = new AdminLog;
		$AdminLogModel->admin_id = $admin_id;
		$AdminLogModel->log_type = $log_type;
		$AdminLogModel->log_info = $log_info;
		$AdminLogModel->admin_ip = request()->ip();
		$AdminLogModel->save();
	}
}
?>