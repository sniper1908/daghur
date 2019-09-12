<?php
// admin后台配置文件
return [
	// 模板配置
	'template' => [
		// 开启layout_on
		'layout_on' => 'on',
		// layout目录位置
		'layout_name' => 'layout/layout',
		// 布局替换变量
		'layout_item' => '{__CONTENT__}',
	],
	// 页面内容替换
	'view_replace_str' => [
		'__APP_STATIC_VENDOR__' => APP_STATIC_VENDOR,
        '__APP_BOOTSTRAP__' => APP_BOOTSTRAP,
        '__APP_JQUERY__' => APP_JQUERY,
        '__APP_STATIC_ADMIN_CSS__' => APP_STATIC_ADMIN_CSS,
        '__APP_STATIC_ADMIN_JS__' => APP_STATIC_ADMIN_JS,
        '__APP_STATIC_ADMIN_IMG__' => APP_STATIC_ADMIN_IMG,
	],
	// 后台信息
	'admin_system' => [
		// 后台系统名称
		'name' => '我的后台管理系统',
		// 后台系统版本
		'version' => 'SUPER ADMIN 1.01',
		// 分类类型 1-普通分类 2-系统分类 3-网店信息 4-帮助分类 5-网店帮助
		'cat_type' => [
			1 => '普通分类',
			2 => '系统分类',
			3 => '网店信息',
			4 => '帮助分类',
			5 => '网店帮助',
		],
		// 是否上传附件
		'attachment_open_type' => [
			0 => '否',
			1 => '本地上传',
			2 => '外部链接'
		]
	],
];