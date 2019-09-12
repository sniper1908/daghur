<?php
namespace app\admin\controller;

use think\Controller;
use app\admin\controller\AdminPlatform;
use app\admin\model\GoodsGallery as GoodsGalleryModel;

class Test extends AdminPlatform
{
	// public function _initialize()
	// {
	// 	# code...
	// }

	public function index()
	{
		// 密码明码
		$pwd = '1234567abc';
		// sha1加密明码
		$sha1str = sha1($pwd);
		// 预留加密串
		$salt = 'wsadmin';
		// sha1加密加密串
		$salt = sha1($salt);
		// 连接sha1加密的明码+sha1加密的加密串
		$str = $sha1str.$salt;
		// 将连接的加密串全部大写
		$str = strtoupper($str);
		// md5加密大写的加密串
		$md5str = md5($str);
		echo $md5str;
	}

	public function add()
	{
		$title = '测试上传图片';

		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;
		// print_r($this->breadcrumb);

		$this->assign('title',$title);
		// $this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','insert');

		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function insert3()
	{
		if(IS_AJAX)  
        {  
        	$images_name = '';  
            $img_name = time();  
            foreach($_FILES['imgFile']['tmp_name'] as $k=>$v)  
            {  
                move_uploaded_file($v,$img_path.$img_name.$k.'.jpg');  
                $images_name  .=  $img_name.$k.'.jpg'.',';  
            }  
        }  
        return 1; //这个返回值必须要  
	}

	public function insert()
	{
		// $fp = fopen('test.txt', 'a+');
		// foreach($_FILES["imgFile"]["name"] as $key=>$data){
  //           $img_name[] = $data;
  //           // fwrite($fp, $data);
  //           // fwrite($fp,"\r\n");
           
  //       }
  //       foreach($_FILES['imgFile']['tmp_name'] as $k=>$v) {
  //           $img_url[]=$v;
  //           // fwrite($fp, $v);
  //           // fwrite($fp,"\r\n");
 
  //       }
  //       for($i=0;$i<count($img_name);$i++){
  //           $path = './upload/' . $img_name[$i];
  //           $v=$img_url[$i];
  //           // fwrite($fp,$path);
  //           // fwrite($fp,"\r\n");
  //           move_uploaded_file($v,$path);
  //       }
  //       return 1;
       	
       	$listData = [];
       	// if (!empty($_FILES['imgFile'])) {
       	// 	$i = 0;
       	// 	$arr = [];
       	// 	$c = count($_FILES['imgFile']['name']);
       	// 	for ($i=0; $i <$c ; $i++) {
       	// 		if (!$_FILES['imgFile']['error'][$i]) {
	       // 			$arr[$i]['name'] = $_FILES['imgFile']['name'][$i];
	       // 			$arr[$i]['type'] = $_FILES['imgFile']['type'][$i];
	       // 			$arr[$i]['size'] = $_FILES['imgFile']['size'][$i];
	       // 			$arr[$i]['tmp_name'] = $_FILES['imgFile']['tmp_name'][$i];
	       // 			$arr[$i]['error'] = $_FILES['imgFile']['error'][$i];
       	// 		}
       	// 	}
       	// 	if (!empty($arr)) {
       	// 		foreach ($arr as $key => $value) {
	       // 			$listData[] = $this->upFile($value,'image','gallery',1);
       	// 		}
       	// 	}
       	// }
       	
       	$fileArr = request()->file('imgFile');
       	foreach ($fileArr as $key => $value) {
       		$listData[$key] = $this->upFile($value,'image','gallery',1,[300,150]);
       		$data = [];
       		$data['goods_id'] = 3;
       		$data['img_original'] = $listData[$key]['file_original_url'];
       		$data['img_url'] = $listData[$key]['file_url'];
       		$data['thumb_url'] = $listData[$key]['file_thumb_url'];
       		GoodsGalleryModel::insert($data);
       	}
       	return 1;
        // @fclose($fp);

       	return json_encode($listData);
        // return 1; //这个返回值必须要
	}


}