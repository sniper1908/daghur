-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: db_daghur
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `db_admin_log`
--

DROP TABLE IF EXISTS `db_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'db_admin_user表主键id',
  `log_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '日志类型 1-添加 2-编辑 3-删除 4-软删除 5-批量删除 6-批量软删除 7-登陆 8-退出',
  `log_info` varchar(255) NOT NULL DEFAULT '' COMMENT '日志内容',
  `admin_ip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志软删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_admin_log`
--

LOCK TABLES `db_admin_log` WRITE;
/*!40000 ALTER TABLE `db_admin_log` DISABLE KEYS */;
INSERT INTO `db_admin_log` VALUES (1,1,7,'管理员登陆成功，管理员id=1|AdminUser','0.0.0.0',1552103327,0),(2,1,7,'管理员登陆成功，管理员id=1|AdminUser','0.0.0.0',1552110748,0);
/*!40000 ALTER TABLE `db_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_admin_user`
--

DROP TABLE IF EXISTS `db_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `admin_pass_word` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_salt` varchar(10) NOT NULL DEFAULT '' COMMENT '登陆附加字符？',
  `admin_email` varchar(60) NOT NULL DEFAULT '' COMMENT '管理员邮箱',
  `admin_ip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '管理员最后登陆ip',
  `role_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员所属的角色，db_role的主键id',
  `is_lock` tinyint(4) NOT NULL DEFAULT '0' COMMENT '管理员是否被锁定 0-否 1-是',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员最后登陆时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加管理员时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '软删除管理员时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_admin_user`
--

LOCK TABLES `db_admin_user` WRITE;
/*!40000 ALTER TABLE `db_admin_user` DISABLE KEYS */;
INSERT INTO `db_admin_user` VALUES (1,'admin','f7d62da4cd607fa437d35df4e1151d94','wsadmin','1908838632@qq.com','0.0.0.0',0,0,1552110747,1550715517,0);
/*!40000 ALTER TABLE `db_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_modular`
--

DROP TABLE IF EXISTS `db_modular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_modular` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modular_name` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `modular_name_code` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称代码',
  `modular_icon` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称前图标',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `modular_controller` varchar(30) NOT NULL DEFAULT '' COMMENT '模块控制器',
  `modular_action` varchar(30) NOT NULL DEFAULT '' COMMENT '模块方法',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模块显示顺序',
  `permission_code` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理权限代码id',
  `show_in_nav` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模块是否显示在菜单上 0-否 1-是',
  `is_lock` tinyint(4) NOT NULL DEFAULT '0' COMMENT '模块是否停用 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='网站模块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_modular`
--

LOCK TABLES `db_modular` WRITE;
/*!40000 ALTER TABLE `db_modular` DISABLE KEYS */;
INSERT INTO `db_modular` VALUES (1,'权限管理','Rbac','fa fa-cog',0,'','',1,1,1,0),(2,'模块管理','Modular','fa fa-table',0,'','',2,2,0,0),(3,'网站设置','WebsiteSet','fa fa-pencil',0,'','',3,3,1,0),(5,'内容管理','Articles','fa fa-bars',0,'','',6,4,1,0),(6,'报表统计','Charts','fa fa-bar-chart',0,'','',13,6,1,0),(7,'权限列表','','',1,'permission','index',1,9,1,0),(8,'添加权限','','',1,'permission','add',2,9,1,0),(9,'角色列表','','',1,'role','index',6,11,1,0),(10,'添加角色','','',1,'role','add',7,11,1,0),(11,'管理员列表','','',1,'admin','index',11,7,1,0),(12,'添加管理员','','',1,'admin','add',12,7,1,0),(13,'模块列表','','',2,'modular','index',1,16,1,0),(14,'添加模块','','',2,'modular','add',2,16,1,0),(15,'网站设置','','',3,'shopSet','index',2,1,1,0),(16,'邮件服务器设置','','',3,'smtpManage','index',5,1,1,0),(17,'地区列表','','',3,'areaManage','index',6,1,1,0),(18,'自定义导航栏','','',3,'navManage','index',8,1,1,0),(19,'网站配置','','',3,'shopConfig','index',1,0,1,0),(20,'友情链接','','',3,'friendlinkManage','index',9,0,1,0),(23,'文章分类','','',5,'articleCat','index',1,25,1,0),(24,'文章列表','','',5,'article','index',2,26,1,0);
/*!40000 ALTER TABLE `db_modular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_navigator`
--

DROP TABLE IF EXISTS `db_navigator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(30) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(100) NOT NULL DEFAULT '' COMMENT '导航链接地址',
  `if_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `open_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在新页面打开',
  `nav_type` varchar(20) NOT NULL COMMENT '导航类型，top-头部导航 middle-中间导航 bottom-底部导航',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站导航栏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_navigator`
--

LOCK TABLES `db_navigator` WRITE;
/*!40000 ALTER TABLE `db_navigator` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_navigator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_permission`
--

DROP TABLE IF EXISTS `db_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_permission` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_name_code` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称代码',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='网站权限列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_permission`
--

LOCK TABLES `db_permission` WRITE;
/*!40000 ALTER TABLE `db_permission` DISABLE KEYS */;
INSERT INTO `db_permission` VALUES (1,'权限管理','permission_manage',0,1),(2,'模块管理','modular_manage',0,2),(3,'网站设置','system_set',0,3),(4,'内容管理','article_manage',0,4),(5,'模板管理','template_manage',0,5),(6,'报表统计','chart_manage',0,6),(7,'管理员添加/编辑','admin_add_edit',1,6),(8,'删除管理员','admin_remove_back',1,7),(9,'权限添加/编辑','permission_add_edit',1,1),(10,'权限删除','permission_remove_back',1,2),(11,'角色添加/编辑','role_add_edit',1,3),(12,'角色删除','role_remove_back',1,4),(13,'分配权限','role_permission',1,5),(14,'管理日志列表','adminlog_list',1,9),(15,'管理日志删除','adminlog_remove',1,7),(16,'模块添加/编辑','modular_add_edit',2,1),(17,'模块删除','modular_remove_back',2,2),(18,'网站设置','shop_config_set',3,1),(19,'邮件服务器设置','email_smtp_set',3,4),(20,'地区列表管理','area_list_manage',3,5),(21,'友情链接管理','friend_link_manage',3,6),(22,'数据备份','data_backup_manage',3,8),(23,'数据恢复','data_return_manage',3,9),(24,'自定义导航栏','custom_nav_bar',3,11),(25,'文章分类管理','article_cat_manage',4,1),(26,'文章内容管理','article_content_manage',4,2),(27,'文章自动发布','article_auto_publish',4,3);
/*!40000 ALTER TABLE `db_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_role`
--

DROP TABLE IF EXISTS `db_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '角色描述',
  `role_permission` text COMMENT '角色具有的权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_role`
--

LOCK TABLES `db_role` WRITE;
/*!40000 ALTER TABLE `db_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_shop_config`
--

DROP TABLE IF EXISTS `db_shop_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='管理网店设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_shop_config`
--

LOCK TABLES `db_shop_config` WRITE;
/*!40000 ALTER TABLE `db_shop_config` DISABLE KEYS */;
INSERT INTO `db_shop_config` VALUES (1,0,'网站信息','website_info0','','','group0','',1,1,''),(2,1,'网站名称','website_name','达斡尔语教程网','','text','',1,1,''),(3,1,'网站标题','website_title','达斡尔语教程网','网站的标题将显示在浏览器的标题栏','text','',2,1,''),(4,1,'网站描述','website_desc','达斡尔语，达斡尔语教程','','textarea','',4,1,''),(5,1,'网站关键字','website_keywords','达斡尔语，达斡尔语教学，达斡尔语教程','','textarea','',3,1,''),(6,1,'网站邮件地址','service_email_address','1908838632@qq.com，815010946@qq.com','如果您有多个客服邮箱地址，请在每个号码之间使用半角逗号（,）分隔。','text','',5,1,''),(7,1,'客服电话','service_phone','','','text','',6,1,''),(8,1,'暂时关闭网站','website_closed','0','','text','0::否|1::是',7,1,''),(9,1,'关闭网店的原因','close_comment','','','textarea','',8,1,''),(10,1,'网站LOGO','website_logo','','请在上传前将图片的文件名命名为logo.gif','file','',9,1,'images'),(11,1,'用户中心公告','user_notice','用户中心公告！','该信息将在用户中心欢迎页面显示','textarea','',10,1,''),(12,1,'网站公告','website_notice','','以上内容将显示在首页商店公告中,注意控制公告内容长度不要超过公告显示区域大小。','textarea','',11,1,''),(13,1,'是否关闭注册','website_reg_closed','0','','radio','1::是|0::否',12,1,''),(14,0,'基本设置','basic0','','','group0','',2,1,''),(15,14,'系统语言','lang','zh_cn','','select','en_us::en_us|zh_cn::zh_cn|zh_tw::zh_tw',1,1,''),(16,14,'ICP证书或ICP备案证书号','icp_number','','','text','',2,1,''),(17,14,'ICP备案证书文件','icp_file','','','file','',3,1,'cert'),(18,14,'水印文件','watermark','','水印文件须为gif/png格式才可支持透明度设置。','file','',4,1,'images'),(19,14,'水印位置','watermark_place','1','','radio','0::无|1::左上|2::右上|3::居中|4::左下|5::右下',5,1,''),(20,14,'水印透明度','watermark_alpha','65','水印的透明度，可选值为0-100。当设置为100时则为不透明。','text','',6,1,''),(21,14,'URL重写','rewrite','0','URL重写是一种搜索引擎优化技术，可以将动态的地址模拟成静态的HTML文件。需要Apache的支持。','radio','0::禁用|1::简单重写|2::复杂重写',7,1,''),(22,14,'用户评论是否需要审核','comment_check','1','','radio','0::不需要审核|1::需要审核',8,1,''),(23,14,'商品的默认图片','no_picture','','','file','',9,1,'images'),(24,14,'统计代码','stats_code','','您可以将其他访问统计服务商提供的代码添加到每一个页面。','textarea','',10,1,''),(25,14,'附件上传大小','upload_size_limit','64','','select','-1::服务器默认设置|0::0KB|64::64KB|128::128KB|256::256KB|512::512KB|1024::1MB|2048::2MB|4096::4MB',11,1,''),(26,14,'站点访问统计','visit_stats','on','','radio','on::开启|off::关闭',12,1,''),(27,0,'显示设置','display0','','','group0','',3,1,''),(28,27,'缩略图宽度','thumb_width','100','','text','',1,1,''),(29,27,'缩略图高度','thumb_height','100','','text','',2,1,''),(30,27,'商品图片宽度','image_width','230','','text','',3,1,''),(31,27,'商品图片高度','image_height','230','','text','',4,1,''),(32,27,'分类页列表的数量','page_size','10','','text','',5,1,''),(33,27,'分类页默认显示方式','show_order_type','1','','radio','0::列表显示|1::表格显示|2::文本显示',6,1,''),(34,27,'详情页相册图片数量','goods_gallery_number','5','','text','',7,1,''),(35,27,'首页搜索的关键字','search_keywords','','首页显示的搜索关键字,请用半角逗号(,)分隔多个关键字','text','',8,1,''),(36,27,'文章分类页列表的数量','article_page_size','10','','text','',9,1,''),(37,14,'权限开启','permission_open','1','后台管理权限是否开启，0-不开启，1-开启','radio','0::否|1::是',7,1,'');
/*!40000 ALTER TABLE `db_shop_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 22:01:46
