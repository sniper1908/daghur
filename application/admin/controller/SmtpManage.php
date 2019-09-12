<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\SmtpConfig as SmtpManageModel;


class SmtpManage extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '邮件服务器设置'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('email_smtp_set');
		
		# 标题
		$title = '邮件服务器设置';
		$this->assign('title',$title);

		$SmtpManageModel = new SmtpManageModel;
		$data = $SmtpManageModel->find();
		$id = empty($data) ? 0 : $data['id'];

		$this->assign('id',$id);
		$this->assign('editData',$data);

		$charsetData = [
			'utf8' => '国际化编码(utf8)',
			'gb2312' => '中文简体',
			'gbk' => '中文繁体'
		];

		$this->assign('charsetData',$charsetData);

		return $this->fetch();
	}

	public function change()
	{
		// 检查权限
		$this->checkPermissionForMsg('email_smtp_set');

		$postData = input('post.');
		$data = $postData['data'];

		$SmtpManageModel = new SmtpManageModel;
		$id = $postData['id'];

		if ($id) {
			# 编辑数据
			$res = $SmtpManageModel->save($data,['id'=>$id]);
		} else {
			# 添加数据
			$res = $SmtpManageModel->insertGetId($data);
		}

		if ($res) {
			$this->success('数据添加成功！','index');
		} else {
			$this->error('数据编辑失败！');
		}
	}
}

?>