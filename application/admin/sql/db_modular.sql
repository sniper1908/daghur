CREATE TABLE `db_modular` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modular_name` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `modular_name_code` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称代码',
  `modular_icon` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称前图标',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `modular_controller` varchar(30) NOT NULL DEFAULT '' COMMENT '模块控制器',
  `modular_action` varchar(30) NOT NULL DEFAULT '' COMMENT '模块方法',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模块显示顺序',
  `permission_code` smallint(5) unsigned NOT NULL DEFAULT '0',
  `show_in_nav` tinyint(4) NOT NULL DEFAULT '1',
  `is_lock` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='网站模块';

INSERT INTO `db_modular` VALUES 
(1,'权限管理','Rbac','fa fa-cog',0,'','',1,1,1,0),
(2,'模块管理','Modular','fa fa-table',0,'','',2,2,0,0),
(3,'网站设置','WebsiteSet','fa fa-pencil',0,'','',3,3,1,0),
(5,'内容管理','Articles','fa fa-bars',0,'','',6,4,1,0),
(6,'报表统计','Charts','fa fa-bar-chart',0,'','',13,6,1,0),

(7,'权限列表','','',1,'permission','index',1,9,1,0),
(8,'添加权限','','',1,'permission','add',2,9,1,0),
(9,'角色列表','','',1,'role','index',6,11,1,0),
(10,'添加角色','','',1,'role','add',7,11,1,0),
(11,'管理员列表','','',1,'admin','index',11,7,1,0),
(12,'添加管理员','','',1,'admin','add',12,7,1,0),

(13,'模块列表','','',2,'modular','index',1,16,1,0),
(14,'添加模块','','',2,'modular','add',2,16,1,0),

(15,'网站设置','','',3,'shopSet','index',2,1,1,0),
(16,'邮件服务器设置','','',3,'smtpManage','index',5,1,1,0),
(17,'地区列表','','',3,'areaManage','index',6,1,1,0),
(18,'自定义导航栏','','',3,'navManage','index',8,1,1,0),
(19,'网站配置','','',3,'shopConfig','index',1,0,1,0),
(20,'友情链接','','',3,'friendlinkManage','index',9,1,1,0),

(23,'文章分类','','',5,'articleCat','index',1,25,1,0),
(24,'文章列表','','',5,'article','index',2,26,1,0);

