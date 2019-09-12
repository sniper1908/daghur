-- MySQL dump 10.13  Distrib 5.5.47, for Win32 (x86)
--
-- Host: localhost    Database: db_daghur
-- ------------------------------------------------------
-- Server version	5.5.47

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

-- Dump completed on 2019-09-11 10:53:38
