<?php
namespace app\admin\controller;

use app\admin\controller\AdminPlatform;
use app\admin\model\ShopConfig as ShopConfigModel;

/**
* 
*/
class ShopSet extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '网站设置'
		]
	];

	public function index()
	{
		// 检查权限
		$this->checkPermissionForMsg('shop_config_set');
		
		# 标题
		$title = '网站设置';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('actionName','update');

		$this->assign('catTree',[]);

		$ShopConfigModel = new ShopConfigModel;
		$configData = $ShopConfigModel->getList();
		$this->assign('configParentCount',count($configData));
		// dump($configData);
		$this->assign('configData',$configData);

		return $this->fetch();
	}

	// 更新配置信息
	public function update()
	{
		$postData = input('post.');
		// 普通的信息
		$data = $postData['data'];
		// 上传的文件
		$fileData = request()->file();
		// 上传文件的保存目录
		$fileName = $postData['fileName'];
		// 上传文件的id数组
		$fileIdArr = $postData['file'];
		// dump($postData);
		// dump($fileData);
		// dump($_FILES);
		if (!is_null($fileData)) {
			// 获取数据库中保存数据
			$ShopConfigModel = new ShopConfigModel;
			$imgType = ['jpg','jpeg','gif','png'];
			foreach ($fileData as $key => $file) {
				$upInfo = $file->getInfo();
				if (!$upInfo['error']) {
					# 上传
					$fileTypeArr = explode('/',$upInfo['type']);
					$fileType = in_array($fileTypeArr[1],$imgType) ? 'image' : 'attachment';
					$imgArr = $this->upFile($file,$fileType,$fileName["$key"],-1);

					if (!empty($imgArr) && isset($imgArr['file_url']) && $imgArr['file_url']) {
						$fileId = $fileIdArr[$key]['id'];
						$data["$fileId"] = $imgArr['file_url'];
						# 如果曾经上传过图片
						$editData = $ShopConfigModel->find($fileId);
						$old_img_arr["$key"] = $editData["input_value"];
					}
				}
			}
		}

		// 编辑数据
		if (!empty($data)) {
			// 编辑普通数据
			foreach ($data as $id => $value) {
				$ShopConfigModel->save(['input_value'=>$value],['id'=>$id]);
			}
			# 删除旧文件
			if (!empty($old_img_arr)) {
				foreach ($old_img_arr as $key => $value) {
					$tmp = explode('.',$value);
					@unlink($value);
					@unlink($tmp[0].'_original.'.$tmp[1]);
				}
			}
		}
		return $this->success('设置成功');
	}
	
}