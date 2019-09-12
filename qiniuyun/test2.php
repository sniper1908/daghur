<?php
include "./autoload.php";
// 引入鉴权类
use Qiniu\Auth;
// 引入上传类
use Qiniu\Storage\UploadManager;
// 需要填写你的 Access Key 和 Secret Key
$bucket = 'forzainter1908';
$accessKey = 'YyPdTDcMEHq__XyhumjNkKrHThoum71gRZDayb-8';
$secretKey = 'xc0vnfJn-RzRhkbfdvUtTTdESC0fQKbW_6xXlt6g';
// 构建鉴权对象
$auth = new Auth($accessKey, $secretKey);
// 生成上传 Token
$token = $auth->uploadToken($bucket);
// 要上传文件的本地路径
$filePath = './111.jpg';
// 上传到七牛后保存的文件名
$key = 'my-11.jpg';
// 初始化 UploadManager 对象并进行文件的上传。
$uploadMgr = new UploadManager();
// 调用 UploadManager 的 putFile 方法进行文件的上传。
list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
echo "\n====> putFile result: \n";
if ($err !== null) {
    var_dump($err);
} else {
    var_dump($ret);
}

// 图片地址
$img_url = 'http://powhrj58k.bkt.clouddn.com/my-11.jpg';

?>