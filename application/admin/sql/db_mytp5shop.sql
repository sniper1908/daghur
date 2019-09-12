-- create database db_xxx default charset utf8 collate utf8_general_ci;
-- datatabase db_mytp5shop
-- charset utf8

-- 后台管理员日志
drop table if exists `db_admin_log`;
create table `db_admin_log` (
	`id` int unsigned not null auto_increment,
	`admin_id` int unsigned not null default 0 comment 'db_admin_user表主键id',
	`log_type` tinyint unsigned not null default 0 comment '日志类型 1-添加 2-编辑 3-删除 4-软删除 5-批量删除 6-批量软删除 7-登陆 8-退出',
	`log_info` varchar(255) not null default '' comment '日志内容',
	`admin_ip` char(15) not null default '0.0.0.0' comment '管理员ip',
	`create_time` int unsigned not null default 0 comment '日志创建时间',
	`delete_time` int unsigned not null default 0 comment '日志软删除时间',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理员日志';

-- 后台管理员
drop table if exists `db_admin_user`;
create table `db_admin_user` (
	`id` smallint unsigned not null auto_increment,
	`admin_user_name` varchar(20) not null default '' comment '管理员名称',
	`admin_pass_word` char(32) not null default '' comment '管理员密码',
	`admin_salt` varchar(10) not null default '' comment '登陆附加字符？',
	`admin_email` varchar(60) not null default '' comment '管理员邮箱',
	`admin_ip` char(15) not null default '0.0.0.0' comment '管理员最后登陆ip',
	`role_id` smallint unsigned not null default 0 comment '管理员所属的角色，db_role的主键id',
	`is_lock` tinyint not null default 0 comment '管理员是否被锁定 0-否 1-是',
	`last_time` int unsigned not null default 0 comment '管理员最后登陆时间',
	`create_time` int unsigned not null default 0 comment '添加管理员时间',
	`delete_time` int unsigned not null default 0 comment '软删除管理员时间',
	primary key(`id`)
) engine=innodb default charset=utf8 comment='管理管理员';

-- 密码 1234567abc
insert into `db_admin_user` values (1,'admin','f7d62da4cd607fa437d35df4e1151d94','wsadmin','1908838632@qq.com','127.0.0.1',0,0,unix_timestamp(),unix_timestamp(),0);

-- 广告
drop table if exists `db_ad`;
create table `db_ad` (
	`id` smallint unsigned not null auto_increment,
	`ad_name` varchar(50) not null default '' comment '广告名称',
	`adv_id` tinyint unsigned not null default 0 comment '广告位id，表db_advertising主键id，如果是0则表示是站外广告',
	`ad_type` tinyint not null default 0 comment '广告类型，0-图片 1-flash 2-代码 3-文字',
	`ad_link` varchar(255) not null default '' comment '广告链接地址',
	`ad_code` text comment '广告链接的表现,文字广告就是文字；图片和flash就是它们的地址；站外广告就是它的代码',
	`start_time` int unsigned not null default 0 comment '广告开始时间',
	`end_time` int unsigned not null default 0 comment '广告结束时间',
	`link_man` varchar(50) not null default '' comment '广告联系人',
	`link_phone` varchar(50) not null default '' comment '广告联系人电话',
	`link_email` varchar(100) not null default '' comment '广告联系人Email',
	`click_count` mediumint unsigned not null default 0 comment '广告点击量',
	`is_show` tinyint not null default 0 comment '是否显示 0-否 1-是',
	primary key(`id`)
) engine=innodb default charset=utf8 comment='管理广告';

-- 广告位
drop table if exists `db_advertising`;
create table `db_advertising` (
	`id` tinyint unsigned not null auto_increment,
	`adv_name` varchar(50) not null default '' comment '广告位名称',
	`adv_desc` varchar(255) not null default '' comment '广告位描述',
	`adv_width` smallint unsigned not null default 0 comment '广告位宽度',
	`adv_height` smallint unsigned not null default 0 comment '广告位高度',
	`is_show` tinyint not null default 0 comment '是否显示 0-否 1-是',
	primary key(`id`)
) engine=innodb default charset=utf8 comment='管理广告位';

-- 文章
drop table if exists `db_article`;
create table `db_article` (
	`id` mediumint unsigned not null auto_increment,
	`cat_id` smallint unsigned not null default 0 comment 'db_article_cat主键id',
	`article_title` varchar(150) not null default '' comment '文章标题',
	`article_title_color` varchar(20) not null default '' comment '文章标题颜色',
	`article_keywords` varchar(255) not null default '' comment '文章关键字',
	`article_description` varchar(255) not null default '' comment '文章描述',
	`article_author` varchar(30) not null default '' comment '作者',
	`article_author_email` varchar(60) not null default '' comment '文章作者Email',
	`article_img` varchar(255) not null default '' comment '文章图片',
	`article_content` longtext comment '文章内容',
	`is_top` tinyint not null default 0 comment '是否置顶 0-否 1-是',
	`is_show` tinyint not null default 0 comment '是否显示 0-否 1-是',
	`open_type` tinyint unsigned not null default 0 comment '0,正常; 当该字段为1或2时,会在文章最后添加一个链接《相关下载》,连接地址等于file_url的值',
	`file_url` varchar(255) not null default '' comment '上传文件或外部文件的url', 
	`article_link` varchar(255) not null default '' comment '该文章标题所引用的连接,如果该项有值将不能显示文章内容,即该表中content的值',
	`hit_count` mediumint unsigned not null default 0 comment '',
	`create_time` int unsigned not null default 0 comment '添加时间',
	`update_time` int unsigned not null default 0 comment '最后更新时间',
	`delete_time` int unsigned not null default 0 comment '软删除时间',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理文章';

-- 文章分类
drop table if exists `db_article_cat`;
create table `db_article_cat` (
	`id` smallint unsigned not null auto_increment,
	`parent_id` smallint unsigned not null default 0 comment '分类父id',
	`cat_name` varchar(100) not null default '' comment '分类名称',
	`cat_keywords` varchar(255) not null default '' comment '分类关键字',
	`cat_describe` varchar(255) not null default '' comment '分类描述',
	`cat_type` tinyint unsigned not null default 1 comment '分类类型 1-普通分类 2-系统分类 3-网店信息 4-帮助分类 5-网店帮助',
	`show_in_nav` tinyint unsigned not null default 0 comment '是否显示在导航栏',
	`sort_order` tinyint unsigned not null default 0 comment '分类显示顺序',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理文章分类';

-- 商品属性列表
DROP TABLE IF EXISTS `db_attribute`;
CREATE TABLE `db_attribute` (
	`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
	`cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' comment '所属商品类型，db_goods_type的主键id',
	`attr_name` varchar(60) NOT NULL DEFAULT '' comment '属性名称',
	`attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1' comment '当添加商品时,该属性的添加类别; 0-手功输入;1-选择输入;2-多行文本输入',
	`attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1' comment '属性是否多选; 0否; 1是 如果可以多选,则可以自定义属性,并且可以根据值的不同定不同的价',
	`attr_values` text NOT NULL comment '选择输入,则attr_name对应的值的取值就是该这字段值',
	`attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' comment '属性是否可以检索;0不需要检索; 1关键字检索; 2范围检索,该属性应该是如果检索的话,可以通过该属性找到有该属性的商品',
	`sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' comment '属性显示的顺序,数字越大越靠前,如果数字一样则按id顺序',
	`is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0' comment '是否关联,0 不关联 1关联; 如果关联, 那么用户在购买该商品时,具有有该属性相同的商品将被推荐给用户',
	`attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0' comment '属性分组,相同的为一个属性组应该取自goods_type的attr_group的值的顺序',
	PRIMARY KEY (`id`),
	KEY `cat_id` (`cat_id`)
) ENGINE=innodb AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='管理商品属性';

-- 商品品牌
drop table if exists `db_brand`;
create table `db_brand` (
	`id` smallint unsigned not null auto_increment,
	`brand_name` varchar(40) not null default '' comment '商品品牌名称',
	`site_url` varchar(100) not null default '' comment '品牌网址',
	`brand_logo` varchar(100) not null default '' comment '品牌logo',
	`brand_desc` varchar(255) not null default '' comment '品牌描述',
	`sort_order` tinyint unsigned not null default 0 comment '显示顺序',
	`is_show` tinyint(1) unsigned DEFAULT '0' comment '是否显示',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理商品品牌';

-- 词典
drop table if exists `db_dictionary`;
create table `db_dictionary` (
	`id` mediumint unsigned not null auto_increment,
	`word_name` varchar(100) not null default '' comment '标音',
	`word_index` char(1) not null default '' comment '首字母',
	`word_eng_symbol` varchar(100) not null default '' comment '英语辅助音标',
	`word_meaning` varchar(100) not null default '' comment '汉译',
	`part_of_speech` tinyint not null default 0 comment '词性',
	`word_img` varchar(250) not null default '' comment '图片链接地址',
	`example_sentence` varchar(250) not null default '' comment '例句',
	`example_sentence_voice` varchar(250) not null default '' comment '例句音频地址',
	`word_related` varchar(250) not null default '' comment '关联词',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理词典';

-- 词典单词音频
drop table if exists `db_word_voice`;
create table `db_word_voice` (
	`id` mediumint unsigned not null auto_increment,
	`dict_id` mediumint unsigned not null default 0 comment '词典单词id，db_dictionary主键id',
	`dialect` tinyint not null default 1 comment '所属方言 1-齐齐哈尔 2-莫旗 3-海拉尔 4-塔城',
	`word_voice` varchar(250) not null default '' comment '音频链接地址',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理词典单词音频';

-- 网站友情链接
drop table if exists `db_friendlink`;
create table `db_friendlink` (
	`id` smallint unsigned not null auto_increment,
	`f_name` varchar(60) not null default '' comment '友链名称',
	`f_url` varchar(100) not null default '' comment '友链地址',
	`f_logo` varchar(100) not null default '' comment '友链logo地址',
	`sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50' comment '显示顺序',
	`is_show` tinyint(1) unsigned DEFAULT '0' comment '是否显示',
	`f_type` tinyint(1) unsigned DEFAULT '0' comment '友链类型 1-图片 0-文字',
	`hit_count` mediumint(8) DEFAULT '0' comment '点击量',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理友情链接';

-- 产品表
DROP TABLE IF EXISTS `db_product`;
CREATE TABLE `db_product` (
	`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
	`cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' comment '分类id，db_product_cat主键id',
	`goods_name` varchar(120) NOT NULL DEFAULT '' comment '商品名称',
	`goods_name_style` varchar(60) NOT NULL DEFAULT '+' comment '商品名称样式',
	`click_count` int(10) unsigned NOT NULL DEFAULT '0' comment '点击量',
	`keywords` varchar(255) NOT NULL DEFAULT '' comment '商品关键字',
	`goods_brief` varchar(255) NOT NULL DEFAULT '' comment '商品简短描述',
	`goods_desc` text NOT NULL comment '商品详细描述',
	`goods_thumb` varchar(255) NOT NULL DEFAULT '' comment '商品缩略图',
	`goods_img` varchar(255) NOT NULL DEFAULT '' comment '商品图片',
	`original_img` varchar(255) NOT NULL DEFAULT '' comment '商品图片原图',
	`sort_order` smallint(4) unsigned NOT NULL DEFAULT '100' comment '排序数字',
	`is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' comment '是否已删除',
	`add_time` int(10) unsigned NOT NULL DEFAULT '0' comment '添加时间',
	`last_update` int(10) unsigned NOT NULL DEFAULT '0' comment '最近一次更新商品配置的时间',
	`is_show` tinyint(1) unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `cat_id` (`cat_id`),
	KEY `last_update` (`last_update`),
	KEY `sort_order` (`sort_order`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='管理产品';

-- 产品分类
create table `db_product_cat` (
	`id` smallint unsigned not null auto_increment,
	`parent_id` smallint unsigned not null default 0 comment '分类父id',
	`cat_name` varchar(100) not null default '' comment '分类名称',
	`cat_keywords` varchar(255) not null default '' comment '分类关键字',
	`cat_describe` varchar(255) not null default '' comment '分类描述',
	`show_in_nav` tinyint unsigned not null default 0 comment '是否显示在导航栏',
	`sort_order` tinyint unsigned not null default 0 comment '分类显示顺序',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '管理产品分类';

-- 商品相册
DROP TABLE IF EXISTS `db_product_gallery`;
CREATE TABLE `db_product_gallery` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '' comment '图片地址',
  `img_desc` varchar(255) NOT NULL DEFAULT '' comment '图片描述',
  `thumb_url` varchar(255) NOT NULL DEFAULT '' comment '缩略图地址',
  `img_original` varchar(255) NOT NULL DEFAULT '' comment '原图地址',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 网站模块 -- 菜单
drop table if exists `db_modular`;
create table `db_modular` (
	`id` smallint unsigned not null auto_increment,
	`modular_name` varchar(30) not null default '' comment '模块名称',
	`modular_name_code` varchar(30) not null default '' comment '模块名称代码',
	`modular_icon` varchar(30) not null default '' comment '模块名称前图标',
	`parent_id` smallint unsigned not null default 0 comment '父级id',
	`modular_controller` varchar(30) not null default '' comment '模块控制器',
	`modular_action` varchar(30) not null default '' comment '模块方法',
	`sort_order` tinyint unsigned not null default 0 comment '模块显示顺序',
	`permission_code` smallint unsigned not null default 0 comment '管理权限代码id',
	`show_in_nav` tinyint not null default 1 comment '模块是否显示在菜单上 0-否 1-是',
	`is_lock` tinyint not null default 0 comment '模块是否停用 0-否 1-是',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '网站模块';

-- 网站导航栏
drop table if exists `db_navigator`;
create table `db_navigator` (
	`id` smallint unsigned not null auto_increment,
	`nav_name` varchar(30) not null default '' comment '导航名称',
	`nav_url` varchar(100) not null default '' comment '导航链接地址',
	`if_show` tinyint(1) NOT NULL DEFAULT '0' comment '是否显示',
	`open_new` tinyint(1) NOT NULL DEFAULT '0' comment '是否在新页面打开',
	`nav_type` varchar(20) NOT NULL comment '导航类型，top-头部导航 middle-中间导航 bottom-底部导航',
	`sort_order` tinyint unsigned NOT NULL DEFAULT '0' comment '显示顺序',
	`is_del` tinyint(1) NOT NULL DEFAULT '0',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '网站导航栏';

-- 网站权限
drop table if exists `db_permission`;
create table `db_permission` (
	`id` smallint unsigned not null auto_increment,
	`permission_name` varchar(30) not null default '' comment '权限名称',
	`permission_name_code` varchar(30) not null default '' comment '权限名称代码',
	`parent_id` smallint unsigned not null default 0 comment '父级id',
	`sort_order` tinyint unsigned not null default 0 comment '显示顺序',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '网站权限列表';

-- 地区列表
DROP TABLE IF EXISTS `db_region`;
CREATE TABLE `db_region` (
	`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  	`parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' comment '上一级地区id',
  	`region_name` varchar(120) NOT NULL DEFAULT '' comment '地区名',
  	`region_type` tinyint(1) NOT NULL DEFAULT '2' comment '地区类型 1-省/直辖市 2-市 3-区县',
  	`agency_id` smallint(5) unsigned NOT NULL DEFAULT '0' comment '办事处id',
  	PRIMARY KEY (`id`),
	KEY `parent_id` (`parent_id`),
	KEY `region_type` (`region_type`),
	KEY `agency_id` (`agency_id`)
) ENGINE=innodb AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='管理地区';

-- 角色
drop table if exists `db_role`;
create table `db_role` (
	`id` smallint unsigned not null auto_increment,
	`role_name` varchar(30) not null default '' comment '角色名称',
	`role_desc` varchar(200) not null default '' comment '角色描述',
	`role_permission` text comment '角色具有的权限',
	primary key (`id`)
) engine=innodb default charset=utf8 comment '角色表';

-- 网站配置
DROP TABLE IF EXISTS `db_shop_config`;
CREATE TABLE `db_shop_config` (
	`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
	`parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
	`input_name` varchar(255) DEFAULT NULL COMMENT '表单字段中文名称',
	`input_attribute` varchar(30) NOT NULL DEFAULT '' COMMENT '表单字段英文名',
	`input_value` text NOT NULL COMMENT '表单字段值',
	`input_description` varchar(255) DEFAULT NULL COMMENT '表单字段提示信息',
	`input_type` varchar(10) NOT NULL DEFAULT '' COMMENT '表单字段类型 text|select|radio|checkbox|textarea|file|hidden',
	`input_range` text NOT NULL COMMENT 'input_type类型为select，radio，checkbox等时的选项值',
	`sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序数字',
  	`is_show` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  	`store_dir` varchar(255) NOT NULL DEFAULT '' COMMENT 'input_type为file时，文件上传后保存的目录',
  	PRIMARY KEY (`id`),
  	UNIQUE KEY `input_attribute` (`input_attribute`) USING BTREE,
  	KEY `parent_id` (`parent_id`)
) ENGINE=innodb AUTO_INCREMENT=904 DEFAULT CHARSET=utf8 COMMENT='管理网店设置';

-- 网站邮件服务器配置
DROP TABLE IF EXISTS `db_smtp_config`;
CREATE TABLE `db_smtp_config` (
	`id` tinyint(5) unsigned NOT NULL AUTO_INCREMENT,
	`is_smtp` tinyint not null default 1 comment '是否采用SMTP配置 0-服务器内置Mail配置，1-其他SMTP配置',
	`is_ssl` tinyint not null default 0 comment '邮件服务器是否要求加密连接(SSL) 0-不加密 1-加密',
	`server_address` varchar(80) not null default '' comment '发送邮件服务器地址(SMTP)',
	`server_port` smallint unsigned not null default 25 comment '服务器端口号，默认25',
	`email_account` varchar(100) not null default '' comment '邮件发送账号',
	`email_account_password` varchar(50) not null default '' comment '邮件发送账号密码',
	`email_reply_address` varchar(80) not null default '' comment '邮件回复地址',
	`email_charset` varchar(20) not null default 'utf8' comment '邮件编码',
  	PRIMARY KEY (`id`)
) ENGINE=innodb DEFAULT CHARSET=utf8 COMMENT='管理邮件服务器配置';



