<?php 
include "./autoload.php";
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;


$bucket = 'forzainter1908';
$accessKey = 'YyPdTDcMEHq__XyhumjNkKrHThoum71gRZDayb-8';
$secretKey = 'xc0vnfJn-RzRhkbfdvUtTTdESC0fQKbW_6xXlt6g';

$expires = 6000;
$auth = new Auth($accessKey, $secretKey);


$policy = array(
    //'callbackUrl' => 'http://micuer.com/qiniuyun/examples/upload_verify_callback.php',
    'callbackBody' => 'key=$(key)&hash=$(etag)&bucket=$(bucket)&fsize=$(fsize)&name=$(x:name)',
    'callbackBodyType' => 'application/json'
);
$token = $auth->uploadToken($bucket, null, $expires, $policy, true);
// 构建 UploadManager 对象
$uploadMgr = new UploadManager();

 ?>


<form method="post" action="testup.php" enctype="multipart/form-data">
    <input name="token" type="hidden" value="<?php echo $token;?>">
    <input name="file" type="file" />
    <input type="submit" value="上传"/>
</form>







