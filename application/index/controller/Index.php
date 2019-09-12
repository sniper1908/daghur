<?php
namespace app\index\controller;

use think\Controller;
use think\Route;
use think\Url;
use think\captcha\Captcha;
use think\Image;

class Index extends Controller
{
    public function index()
    {
        return '<style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> ThinkPHP V5<br/><span style="font-size:30px">十年磨一剑 - 为API开发设计的高性能框架</span></p><span style="font-size:22px;">[ V5.0 版本由 <a href="http://www.qiniu.com" target="qiniu">七牛云</a> 独家赞助发布 ]</span></div><script type="text/javascript" src="https://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script><script type="text/javascript" src="https://e.topthink.com/Public/static/client.js"></script><think id="ad_bd568ce7058a1091"></think>';
    }

    public function yzm()
    {
    	return $this->fetch();
    }

    public function checkyzm()
    {
    	$verify = input('post.verify');

    	if (captcha_check($verify)) {
    		echo '验证通过，你的验证码是：'.$verify;
    	}
    	else {
    		echo '验证码有问题，你输入的验证码是：'.$verify;
    	}
    }

    // 图片处理
    public function img()
    {
    	# 打开图片
    	$images = Image::open('./static/img/test.jpg');
    	dump($images);
    	// 获取图片基本信息
    	$width = $images->width();
    	$height = $images->height();
    	$type = $images->type();
    	$mime = $images->mime();
    	$size = $images->size();

    	// 图片裁剪
    	// 默认从顶点开始裁剪
    	// $images->crop(300,300)->save('./static/img/test_crop.jpg');
    	# 设置裁剪位置
    	# 从坐标（100,150）位置开始裁剪，裁剪大小为宽300高200的图片
    	# 不设置，则默认从0,0开始裁剪
    	// $images->crop(300,200,100,150)->save('./static/img/test_crop_place.jpg');

    	// 图片缩放
    	// 等比例变化，数值小于设定的300，则等比例后可能会小于300
    	// $images->thumb(300,300)->save('./static/img/test_thumb.jpg');
    	
    	# 不同方式的缩放效果
    	# 常量，标识缩略图等比例缩放类型，默认为1
    	# const?THUMB_SCALING???=?1;?
    	// $images->thumb(300,300)->save('./static/img/test_thumb.jpg');
    	# 常量，标识缩略图缩放后填充类型
    	# const?THUMB_FILLED???=?2;?
    	# 常量，标识缩略图居中裁剪类型
    	# const?THUMB_CENTER???=?3;?
    	# 常量，标识缩略图左上角裁剪类型
    	# const?THUMB_NORTHWEST???=?4;?
    	# 常量，标识缩略图右下角裁剪类型
    	# const?THUMB_SOUTHEAST???=?5;?
    	# 常量，标识缩略图固定尺寸缩放类型
    	# const?THUMB_FIXED???=?6;?
    	// $images->thumb(300,300,6)->save('./static/img/test_thumb_type.jpg');
    	
    	// 图片翻转
    	// $images->flip()->save('./static/img/test_flip.jpg');
    	// 图片旋转
    	// $images->rotate()->save('./static/img/test_rotate.jpg');
    	// $images->rotate(120)->save('./static/img/test_rotate_120.jpg');
    	
    	// 添加水印 默认右下角
    	// $images->water('./static/img/logo.png')->save('./static/img/test_water.jpg');
    	// 常量，标识左上角水印
    	// const WATER_NORTHWEST = 1;
    	// 常量，标识上居中水印
    	// const WATER_NORTH = 2;
    	// 常量，标识右上角水印
    	// const WATER_NORTHEAST = 3;
    	// 常量，标识左居中水印
    	// const WATER_WEST = 4;
    	// 常量，标识居中水印
    	// const WATER_CENTER = 5;
    	// 常量，标识右居中水印
    	// const WATER_EAST = 6;
    	// 常量，标识左下角水印
    	// const WATER_SOUTHWEST = 7;
    	// 常量，标识下居中水印
    	// const WATER_SOUTH = 8;
    	// 常量，标识右下角水印
    	// const WATER_SOUTHEAST = 9;
    	// $images->water('./static/img/logo.png',1)->save('./static/img/test_water_1.jpg');
    	
    	// 文字水印
    	// $images->text('云之梦-只为有梦想的人','HYQimgKongTiJ.ttf',20,'#ffffff')->save('./static/img/test_water_text.jpg');
    	// $images->text('云之梦-只为有梦想的人','./static/img/1.ttf',20,'#ffffff')->save('./static/img/test_water_text.jpg');
    	// text 	添加的文字 					不能为空
    	// font 	字体文件路径 				不能为空
    	// size 	字号，单位像素 				不能为空
    	// color 	文字颜色 					#000000
    	// locate 	文字写入位置 				WATER_SOUTHEAST 
    	// offset 	文字相对当前位置的偏移量 	0
    	// angle 	文字倾斜角度 				0
    	$images->text('云之梦-只为有梦想的人','./static/img/1.ttf',20,'#cccccc',3,20,90)->save('./static/img/test_water_text_param.jpg');
    }
}
