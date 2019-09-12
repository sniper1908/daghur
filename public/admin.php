<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
// static下的vendor（bootstrap,jquery等的源码）目录
define('APP_STATIC_VENDOR','../static/vendor');
// bootstrap 目录
define('APP_BOOTSTRAP',APP_STATIC_VENDOR.'/bootstrap');
// jquery 目录
define('APP_JQUERY',APP_STATIC_VENDOR.'/jquery');
// 后台静态文件（css,js,img）存放目录
define('APP_STATIC_ADMIN', '../static/admin');
define('APP_STATIC_ADMIN_CSS', APP_STATIC_ADMIN.'/css');
define('APP_STATIC_ADMIN_JS', APP_STATIC_ADMIN.'/js');
define('APP_STATIC_ADMIN_IMG', APP_STATIC_ADMIN.'/img');

// 绑定admin模块 使用admin.php方式打开后台
define('BIND_MODULE','admin');

// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
