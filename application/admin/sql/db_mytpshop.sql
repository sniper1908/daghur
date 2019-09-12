/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : db_mytpshop

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-09-13 16:07:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `db_admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `db_admin_action`;
CREATE TABLE `db_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned DEFAULT '0',
  `action_code` varchar(20) DEFAULT '',
  `relevance` varchar(20) DEFAULT '',
  `action_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='管理权限属性';

-- ----------------------------
-- Records of db_admin_action
-- ----------------------------
INSERT INTO `db_admin_action` VALUES ('1', '0', 'goods', '', '商品管理');
INSERT INTO `db_admin_action` VALUES ('2', '0', 'cms_manage', '', '文章管理');
INSERT INTO `db_admin_action` VALUES ('3', '0', 'users_manage', '', '会员管理');
INSERT INTO `db_admin_action` VALUES ('4', '0', 'priv_manage', '', '权限管理');
INSERT INTO `db_admin_action` VALUES ('5', '0', 'sys_manage', '', '系统设置');
INSERT INTO `db_admin_action` VALUES ('6', '0', 'order_manage', '', '订单管理');
INSERT INTO `db_admin_action` VALUES ('7', '0', 'promotion', '', '促销管理');
INSERT INTO `db_admin_action` VALUES ('8', '0', 'email', '', '邮件管理');
INSERT INTO `db_admin_action` VALUES ('9', '0', 'templates_manage', '', '模板管理');
INSERT INTO `db_admin_action` VALUES ('10', '0', 'db_manage', '', '数据库管理');
INSERT INTO `db_admin_action` VALUES ('11', '0', 'sms_manage', '', '短息管理');
INSERT INTO `db_admin_action` VALUES ('12', '1', 'goods_manage', '', '商品添加/编辑');
INSERT INTO `db_admin_action` VALUES ('13', '1', 'remove_back', '', '商品删除/恢复');
INSERT INTO `db_admin_action` VALUES ('14', '1', 'cat_manage', '', '分类添加/编辑');
INSERT INTO `db_admin_action` VALUES ('15', '1', 'cat_drop', 'cat_manage', '分类转移/删除');
INSERT INTO `db_admin_action` VALUES ('16', '1', 'attr_manage', '', '商品属性管理');
INSERT INTO `db_admin_action` VALUES ('17', '1', 'brand_manage', '', '商品品牌管理');
INSERT INTO `db_admin_action` VALUES ('18', '1', 'comment_priv', '', '用户评论管理');
INSERT INTO `db_admin_action` VALUES ('19', '1', 'tag_manage', '', '标签管理');
INSERT INTO `db_admin_action` VALUES ('20', '1', 'goods_type', '', '商品类型');
INSERT INTO `db_admin_action` VALUES ('21', '1', 'goods_auto', '', '商品自动上下架');
INSERT INTO `db_admin_action` VALUES ('22', '1', 'virualcard', '', '虚拟卡管理');
INSERT INTO `db_admin_action` VALUES ('23', '1', 'picture_batch', '', '图片批量处理');
INSERT INTO `db_admin_action` VALUES ('24', '1', 'goods_export', '', '商品批量导出');
INSERT INTO `db_admin_action` VALUES ('25', '1', 'goods_batch', '', '商品批量上传/修改');
INSERT INTO `db_admin_action` VALUES ('26', '1', 'gen_goods_script', '', '生成商品代码');
INSERT INTO `db_admin_action` VALUES ('27', '2', 'article_cat', '', '文章分类管理');
INSERT INTO `db_admin_action` VALUES ('28', '2', 'article_manage', '', '文章内容管理');
INSERT INTO `db_admin_action` VALUES ('29', '2', 'shopinfo_manage', '', '网店信息管理');
INSERT INTO `db_admin_action` VALUES ('30', '2', 'shophelp_manage', '', '网店帮助管理');
INSERT INTO `db_admin_action` VALUES ('31', '2', 'vote_priv', '', '在线调查管理');
INSERT INTO `db_admin_action` VALUES ('32', '2', 'article_auto', '', '文章自动发布');
INSERT INTO `db_admin_action` VALUES ('33', '3', 'feedback_priv', '', '会员留言管理');
INSERT INTO `db_admin_action` VALUES ('34', '3', 'integrate_users', '', '会员数据整合');
INSERT INTO `db_admin_action` VALUES ('35', '3', 'sync_users', 'integrate_users', '同步会员数据');
INSERT INTO `db_admin_action` VALUES ('36', '3', 'users_manage', '', '会员添加/编辑');
INSERT INTO `db_admin_action` VALUES ('37', '3', 'users_drop', 'users_manage', '会员删除');
INSERT INTO `db_admin_action` VALUES ('38', '3', 'user_rank', '', '会员等级管理');
INSERT INTO `db_admin_action` VALUES ('39', '3', 'surplus_manage', 'account_manage', '会员余额管理');
INSERT INTO `db_admin_action` VALUES ('40', '3', 'account_manage', '', '会员账户管理');
INSERT INTO `db_admin_action` VALUES ('41', '4', 'template_manage', '', '模板管理');
INSERT INTO `db_admin_action` VALUES ('42', '4', 'admin_,manage', '', '管理员添加/编辑');
INSERT INTO `db_admin_action` VALUES ('43', '4', 'admin_drop', 'admin_manage', '删除管理员');
INSERT INTO `db_admin_action` VALUES ('44', '4', 'allot_priv', 'admin_manage', '分派权限');
INSERT INTO `db_admin_action` VALUES ('45', '4', 'logs_manage', '', '管理日志列表');
INSERT INTO `db_admin_action` VALUES ('46', '4', 'logs_drop', 'logs_manage', '删除管理日志');
INSERT INTO `db_admin_action` VALUES ('47', '4', 'agency_manage', '', '办事处管理');
INSERT INTO `db_admin_action` VALUES ('48', '4', 'suppliers_manage', '', '供货商管理');
INSERT INTO `db_admin_action` VALUES ('49', '4', 'role_manage', '', '角色管理');
INSERT INTO `db_admin_action` VALUES ('50', '5', 'shop_config', '', '商店设置');
INSERT INTO `db_admin_action` VALUES ('51', '5', 'shop_manage', '', '配送方式管理');
INSERT INTO `db_admin_action` VALUES ('52', '5', 'payment', '', '支付方式管理');
INSERT INTO `db_admin_action` VALUES ('53', '5', 'shoparea_manage', '', '配送方式管理');
INSERT INTO `db_admin_action` VALUES ('54', '5', 'area_manage', '', '地区列表管理');
INSERT INTO `db_admin_action` VALUES ('55', '5', 'friendlink', '', '友情链接管理');
INSERT INTO `db_admin_action` VALUES ('56', '5', 'db_backup', '', '数据库备份');
INSERT INTO `db_admin_action` VALUES ('57', '5', 'db_renew', 'db_backup', '数据库恢复');
INSERT INTO `db_admin_action` VALUES ('58', '5', 'flash_manage', '', '首页主广告管理');
INSERT INTO `db_admin_action` VALUES ('59', '5', 'navigator', '', '自定义导航栏');
INSERT INTO `db_admin_action` VALUES ('60', '5', 'cron', '', '计划任务');
INSERT INTO `db_admin_action` VALUES ('61', '5', 'affiliate', '', '推荐设置');
INSERT INTO `db_admin_action` VALUES ('62', '5', 'affiliate_ck', '', '分成管理');
INSERT INTO `db_admin_action` VALUES ('63', '5', 'sitemap', '', '站点地图管理');
INSERT INTO `db_admin_action` VALUES ('64', '5', 'file_priv', '', '文件权限检验');
INSERT INTO `db_admin_action` VALUES ('65', '5', 'file_check', '', '文件效验');
INSERT INTO `db_admin_action` VALUES ('66', '5', 'reg_fields', '', '会员注册项管理');
INSERT INTO `db_admin_action` VALUES ('67', '5', 'shop_authorized', '', '授权证书');
INSERT INTO `db_admin_action` VALUES ('68', '5', 'webcollect_manage', '', '网罗天下管理');
INSERT INTO `db_admin_action` VALUES ('69', '6', 'order_os_edit', '', '编辑订单状态');
INSERT INTO `db_admin_action` VALUES ('70', '6', 'order_ps_edit', 'order_os_edit', '编辑付款状态');
INSERT INTO `db_admin_action` VALUES ('71', '6', 'order_ss_edit', 'order_os_edit', '编辑发货状态');
INSERT INTO `db_admin_action` VALUES ('72', '6', 'order_edit', 'order_os_edit', '添加编辑订单');
INSERT INTO `db_admin_action` VALUES ('73', '6', 'order_view', '', '查看未完成订单');
INSERT INTO `db_admin_action` VALUES ('74', '6', 'order_view_finished', '', '查看已完成订单');
INSERT INTO `db_admin_action` VALUES ('75', '6', 'repay_manage', '', '退款申请管理');
INSERT INTO `db_admin_action` VALUES ('76', '6', 'booking', '', '缺货等级管理');
INSERT INTO `db_admin_action` VALUES ('77', '6', 'sale_order_stats', '', '订单销售统计');
INSERT INTO `db_admin_action` VALUES ('78', '6', 'client_flow_stats', '', '客户流量统计');
INSERT INTO `db_admin_action` VALUES ('79', '6', 'delivery_view', '', '查看发货单');
INSERT INTO `db_admin_action` VALUES ('80', '6', 'back_view', '', '查看退货单');
INSERT INTO `db_admin_action` VALUES ('81', '1', 'topic_manage', '', '专题管理');
INSERT INTO `db_admin_action` VALUES ('82', '7', 'snatch_manage', '', '夺宝奇兵');
INSERT INTO `db_admin_action` VALUES ('83', '7', 'ad_manage', '', '广告管理');
INSERT INTO `db_admin_action` VALUES ('84', '7', 'gift_manage', '', '赠品管理');
INSERT INTO `db_admin_action` VALUES ('85', '7', 'card_manage', '', '祝福贺卡');
INSERT INTO `db_admin_action` VALUES ('86', '7', 'pack', '', '商品包装');
INSERT INTO `db_admin_action` VALUES ('87', '7', 'bonus_manage', '', '红包管理');
INSERT INTO `db_admin_action` VALUES ('88', '7', 'auction', '', '拍卖活动');
INSERT INTO `db_admin_action` VALUES ('89', '7', 'group_by', '', '团购活动');
INSERT INTO `db_admin_action` VALUES ('90', '7', 'favourable', '', '优惠活动');
INSERT INTO `db_admin_action` VALUES ('91', '7', 'whole_sale', '', '批发管理');
INSERT INTO `db_admin_action` VALUES ('92', '7', 'package_manage', '', '超值礼包');
INSERT INTO `db_admin_action` VALUES ('93', '7', 'exchange_goods', '', '积分商城商品');
INSERT INTO `db_admin_action` VALUES ('94', '8', 'attention_list', '', '关注管理');
INSERT INTO `db_admin_action` VALUES ('95', '8', 'email_list', '', '邮件订阅管理');
INSERT INTO `db_admin_action` VALUES ('96', '8', 'magazine_list', '', '杂志管理');
INSERT INTO `db_admin_action` VALUES ('97', '8', 'view_sendlist', '', '邮件队列管理');
INSERT INTO `db_admin_action` VALUES ('98', '9', 'template_select', '', '模板选择');
INSERT INTO `db_admin_action` VALUES ('99', '9', 'template_setup', '', '模板设置');
INSERT INTO `db_admin_action` VALUES ('100', '9', 'library_manage', '', '库项目管理');
INSERT INTO `db_admin_action` VALUES ('101', '9', 'lang_edit', '', '语言项编辑');
INSERT INTO `db_admin_action` VALUES ('102', '9', 'backup_setting', '', '模板设置备份');
INSERT INTO `db_admin_action` VALUES ('103', '9', 'mail_template', '', '邮件模板管理');
INSERT INTO `db_admin_action` VALUES ('104', '10', 'db_backup', '', '数据备份');
INSERT INTO `db_admin_action` VALUES ('105', '10', 'db_renew', '', '数据恢复');
INSERT INTO `db_admin_action` VALUES ('106', '10', 'db_optimize', '', '数据表优化');
INSERT INTO `db_admin_action` VALUES ('107', '10', 'sql_query', '', 'SQL查询');
INSERT INTO `db_admin_action` VALUES ('108', '10', 'convert', '', '转换数据');
INSERT INTO `db_admin_action` VALUES ('109', '11', 'my_info', '', '账号信息');
INSERT INTO `db_admin_action` VALUES ('110', '11', 'sms_send', '', '发送短信');
INSERT INTO `db_admin_action` VALUES ('111', '11', 'sms_charge', '', '短信充值');
INSERT INTO `db_admin_action` VALUES ('112', '11', 'send_history', '', '发送记录');
INSERT INTO `db_admin_action` VALUES ('113', '11', 'charge_history', '', '充值记录');
INSERT INTO `db_admin_action` VALUES ('114', '1', 'suppliers_goods', '', '供货商商品管理');

-- ----------------------------
-- Table structure for `db_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `db_admin_log`;
CREATE TABLE `db_admin_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `admin_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理日志';

-- ----------------------------
-- Records of db_admin_log
-- ----------------------------
INSERT INTO `db_admin_log` VALUES ('1', '1', '操作成功！注：29条日志全部删除成功！', '0.0.0.0', '1535530345');
INSERT INTO `db_admin_log` VALUES ('2', '1', '操作成功！注：登录成功！', '0.0.0.0', '1536825522');

-- ----------------------------
-- Table structure for `db_admin_log_copy`
-- ----------------------------
DROP TABLE IF EXISTS `db_admin_log_copy`;
CREATE TABLE `db_admin_log_copy` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `admin_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='管理日志';

-- ----------------------------
-- Records of db_admin_log_copy
-- ----------------------------
INSERT INTO `db_admin_log_copy` VALUES ('1', '1', '操作成功！注：40条日志全部删除成功！', '0.0.0.0', '1499046476');
INSERT INTO `db_admin_log_copy` VALUES ('2', '1', '操作成功！注：我的导航栏设置成功！', '0.0.0.0', '1499051277');
INSERT INTO `db_admin_log_copy` VALUES ('3', '1', '操作成功！注：我的导航栏设置成功！', '0.0.0.0', '1499051302');
INSERT INTO `db_admin_log_copy` VALUES ('4', '1', '登录成功！', '0.0.0.0', '1499157373');
INSERT INTO `db_admin_log_copy` VALUES ('5', '1', '登录成功！', '0.0.0.0', '1499473310');
INSERT INTO `db_admin_log_copy` VALUES ('6', '1', '登录成功！', '0.0.0.0', '1499533428');
INSERT INTO `db_admin_log_copy` VALUES ('7', '1', '登录成功！', '0.0.0.0', '1500168103');
INSERT INTO `db_admin_log_copy` VALUES ('8', '1', '登录成功！', '0.0.0.0', '1500355089');
INSERT INTO `db_admin_log_copy` VALUES ('9', '1', '登录成功！', '0.0.0.0', '1500776019');
INSERT INTO `db_admin_log_copy` VALUES ('10', '1', '登录成功！', '0.0.0.0', '1500776087');
INSERT INTO `db_admin_log_copy` VALUES ('11', '1', '登录成功！', '0.0.0.0', '1500780275');
INSERT INTO `db_admin_log_copy` VALUES ('12', '1', '登录成功！', '0.0.0.0', '1500784326');
INSERT INTO `db_admin_log_copy` VALUES ('13', '1', '登录成功！', '0.0.0.0', '1500784350');
INSERT INTO `db_admin_log_copy` VALUES ('14', '1', '登录成功！', '0.0.0.0', '1500793436');
INSERT INTO `db_admin_log_copy` VALUES ('15', '1', '登录成功！', '0.0.0.0', '1500793671');
INSERT INTO `db_admin_log_copy` VALUES ('16', '1', '登录成功！', '0.0.0.0', '1500838846');
INSERT INTO `db_admin_log_copy` VALUES ('17', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500850428');
INSERT INTO `db_admin_log_copy` VALUES ('18', '1', '登录成功！', '0.0.0.0', '1500850674');
INSERT INTO `db_admin_log_copy` VALUES ('19', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500850777');
INSERT INTO `db_admin_log_copy` VALUES ('20', '1', '登录成功！', '0.0.0.0', '1500850854');
INSERT INTO `db_admin_log_copy` VALUES ('21', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500850858');
INSERT INTO `db_admin_log_copy` VALUES ('22', '1', '登录成功！', '0.0.0.0', '1500850984');
INSERT INTO `db_admin_log_copy` VALUES ('23', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500850991');
INSERT INTO `db_admin_log_copy` VALUES ('24', '1', '登录成功！', '0.0.0.0', '1500851023');
INSERT INTO `db_admin_log_copy` VALUES ('25', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500851149');
INSERT INTO `db_admin_log_copy` VALUES ('26', '1', '登录成功！', '0.0.0.0', '1500851182');
INSERT INTO `db_admin_log_copy` VALUES ('27', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500851185');
INSERT INTO `db_admin_log_copy` VALUES ('28', '1', '登录成功！', '0.0.0.0', '1500851221');
INSERT INTO `db_admin_log_copy` VALUES ('29', '1', '安全退出系统！注：退出系统并跳转到前台首页！', '0.0.0.0', '1500851225');
INSERT INTO `db_admin_log_copy` VALUES ('30', '1', '登录成功！', '0.0.0.0', '1500851247');
INSERT INTO `db_admin_log_copy` VALUES ('200', '1', '操作成功！注：2条日志多选删除成功！', '0.0.0.0', '1534493671');
INSERT INTO `db_admin_log_copy` VALUES ('204', '1', '操作成功！注：5条日志多选删除成功！', '0.0.0.0', '1534493813');
INSERT INTO `db_admin_log_copy` VALUES ('201', '1', '操作成功！注：2条日志多选删除成功！', '0.0.0.0', '1534493785');
INSERT INTO `db_admin_log_copy` VALUES ('198', '1', '操作成功！注：2条日志多选删除成功！', '0.0.0.0', '1534489372');
INSERT INTO `db_admin_log_copy` VALUES ('199', '1', '操作成功！注：登录成功！', '0.0.0.0', '1534492704');
INSERT INTO `db_admin_log_copy` VALUES ('202', '1', '操作成功！注：3条日志多选删除成功！', '0.0.0.0', '1534493793');
INSERT INTO `db_admin_log_copy` VALUES ('203', '1', '操作成功！注：4条日志多选删除成功！', '0.0.0.0', '1534493803');
INSERT INTO `db_admin_log_copy` VALUES ('197', '1', '操作失败！注：18条日志多选删除失败！', '0.0.0.0', '1534489241');
INSERT INTO `db_admin_log_copy` VALUES ('50', '1', '操作成功！注：ID为2的管理员确定锁定成功！', '0.0.0.0', '1500855787');

-- ----------------------------
-- Table structure for `db_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `db_admin_user`;
CREATE TABLE `db_admin_user` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_name` varchar(20) NOT NULL DEFAULT '',
  `admin_pass_word` varchar(32) NOT NULL DEFAULT '',
  `admin_salt` varchar(10) DEFAULT NULL,
  `admin_email` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `role_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `admin_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `last_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`admin_user_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='管理管理员';

-- ----------------------------
-- Records of db_admin_user
-- ----------------------------
INSERT INTO `db_admin_user` VALUES ('1', 'admin', 'ed915ebed0729aa40d8acbe3d33190b6', '1872', '397875457@qq.com', 'all', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', '0', '0', '0', null, '0.0.0.0', '0', '1536825522', '1490356800');
INSERT INTO `db_admin_user` VALUES ('2', 'admin1', '2c864a42c843b8c2b09dec106d187ad9', '1688', '111111111@qq.com', 'delivery_view,back_view', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', '0', '4', '0', null, '0.0.0.0', '0', '0', '1490356800');
INSERT INTO `db_admin_user` VALUES ('7', 'admin5', 'b79ee91a53a086f13eb5ba52298951dd', '4807', '555555555@qq.com', 'delivery_view,back_view', '权限管理|Admin/index', '', '0', '0', '1', null, '0.0.0.0', '0', '0', '1490356800');
INSERT INTO `db_admin_user` VALUES ('8', 'admin6', 'e42a62322922d5941fd631cf0a8e55fa', '7933', '666666666@qq.com', 'goods_manage,remove_back,cat_manage,cat_drop,attr_manage,brand_manage,comment_priv,tag_manage,goods_type,goods_auto,virualcard,picture_batch,goods_export,goods_batch,gen_goods_script,topic_manage,suppliers_goods,article_cat,article_manage,shopinfo_manage,shophelp_manage,vote_priv,article_auto,feedback_priv,integrate_users,sync_users,users_manage,users_drop,user_rank,surplus_manage,account_manage,template_manage,admin_,manage,admin_drop,allot_priv,logs_manage,logs_drop,agency_manage,suppliers_manage,role_manage,shop_config,shop_manage,payment,shoparea_manage,area_manage,friendlink,db_backup,db_renew,flash_manage,navigator,cron,affiliate,affiliate_ck,sitemap,file_priv,file_check,reg_fields,shop_authorized,webcollect_manage,order_os_edit,order_ps_edit,order_ss_edit,order_edit,order_view,order_view_finished,repay_manage,booking,sale_order_stats,client_flow_stats,delivery_view,back_view,snatch_manage,ad_manage,gift_manage,card_manage,pack,bonus_manage,auction,group_by,favourable,whole_sale,package_manage,exchange_goods,attention_list,email_list,magazine_list,view_sendlist,template_select,template_setup,library_manage,lang_edit,backup_setting,mail_template,db_backup,db_renew,db_optimize,sql_query,convert,my_info,sms_send,sms_charge,send_history,charge_history', '权限管理|Admin/index', '', '0', '0', '1', null, '0.0.0.0', '0', '0', '1490356800');

-- ----------------------------
-- Table structure for `db_agency`
-- ----------------------------
DROP TABLE IF EXISTS `db_agency`;
CREATE TABLE `db_agency` (
  `agency_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(60) NOT NULL,
  `agency_describe` text NOT NULL,
  PRIMARY KEY (`agency_id`),
  KEY `agency_name` (`agency_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理办事处';

-- ----------------------------
-- Records of db_agency
-- ----------------------------
INSERT INTO `db_agency` VALUES ('1', '深圳办事处', '深圳办事处描述');
INSERT INTO `db_agency` VALUES ('2', '广州办事处', '广州办事处描述');

-- ----------------------------
-- Table structure for `db_article`
-- ----------------------------
DROP TABLE IF EXISTS `db_article`;
CREATE TABLE `db_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `article_title` varchar(150) NOT NULL DEFAULT '',
  `article_title_color` varchar(10) DEFAULT NULL,
  `article_keywords` varchar(255) NOT NULL,
  `article_description` varchar(255) DEFAULT NULL,
  `article_author` varchar(30) NOT NULL,
  `article_author_email` varchar(60) NOT NULL,
  `article_img` varchar(255) DEFAULT NULL,
  `article_content` longtext NOT NULL,
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `article_link` varchar(255) NOT NULL DEFAULT '',
  `hit_count` mediumint(8) unsigned DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='管理文章';

-- ----------------------------
-- Records of db_article
-- ----------------------------
INSERT INTO `db_article` VALUES ('1', '2', '免责条款', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('2', '2', '隐私保护', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('3', '2', '咨询热点', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('4', '2', '联系我们', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('5', '2', '公司简介', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('6', '-1', '用户协议', null, '', null, 'admin', '', null, '', '0', '1', '0', '', '', '0', '1490866907');
INSERT INTO `db_article` VALUES ('7', '4', '三星电子宣布将在中国发布15款3G手机', null, '', null, 'admin', '', null, '<p>全球领先的电子产品及第二大移动通信终端制造商三星电子今天在北京宣布，为全面支持中国开展3G移动通信业务，将在3G服务正式商用之际，向中国市场推出 15款3G手机。这些产品分别支持中国三大无线运营商的各种3G服务，并已经得到运营商的合作认可。凭借在电子和通信领域的整体技术实力和对消费者的准确 把握，三星电子已经开始全面发力中国的3G移动通信市场。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;2009年1月，中国政府宣布正式启动3G移动通信服务。并根据中国的实际情况，决定由三大运营商分别采用全部三种3G网络制式，&nbsp;即以中国自主知识产权为核心的TD-SCDMA，以欧洲为主要市场的WCDMA和源自北美的CDMA2000技术。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;多 年来，三星电子秉承&ldquo;做中国人民喜爱的企业，贡献于中国社会的企业&rdquo;的企业理念，准确地把握了中国社会的发展和市场的需求，推出了一系列深受中国消费者喜 爱的电子产品。为了配合中国推进具有自主知识产权的3G移动通信标准TD-SCDMA，&nbsp;三星电子从2000年开始在中国设立了通信技术研究院，&nbsp;开始进 行TD-SCDMA技术的研究。作为最早承诺支持中国3G标准的手机制造企业，三星电子已经先后投入了上亿元的研究费用，&nbsp;组建了几百人的研发团队。推出 的TD-SCDMA制式的产品，不仅通过了各级权威部门的试验和检测，也经历了2008年北京奥运会的现场考验。此次为中国移动定制的TD-SCDMA手 机，包括了满足高端商务需求的双待产品B7702C，以及数字电视手机、多媒体手机和时尚手机。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为世界第二大手机制造企业，三 星电子已经在全球3G市场积累了多年的技术和市场经验。最新的统计表明，在完全采用WCDMA标准的欧洲，三星电子的市场份额已经排名第二。在为中国联通 准备的产品中，不仅包括能够支持HSDPA的高端多媒体手机S7520U，也涵盖了能够支持高速上网、在线电影、在线音乐等适合不同消费需求的各种产品。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;而 在主要采用CDMA2000技术的北美市场，三星电子也取得了市场份额的第一名。即将陆续上市的支持中国电信3G服务的EVDO产品，有高端商务手机 W709。该机能够支持EVDO/GSM的双网双待功能，含800万像素拍摄系统。其他产品还包括音乐手机M609，双模手机W239，以及时尚设计的 F539等。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为世界上少数能够提供支持三种3G标准的终端厂商，三星电子正利用其在通信、半导体、显示器以及数字多媒体等方面 的优势，加快产品数字融合的进程。除上述3G手机产品外，三星电子也于近期推出了用于3G网络的上网卡和网络笔记本电脑。三星电子专务、无线事业部大中华 区高级副总裁卢基学先生说，&ldquo;上述15款新品，&nbsp;只是我们二季度新产品的一部分。随着中国3G移动通信市场的不断扩大，三星还将推出更多适合中国市场的终 端产品，以满足消费者对于通信和数字产品的不同需求。三星也将积极配合运营商业务的发展计划，加快技术和应用的研发。中国3G的移动通信市场前景将是非常 明亮的。&rdquo;</p>', '0', '1', '0', '', 'http://', '0', '1241426864');
INSERT INTO `db_article` VALUES ('8', '4', '诺基亚牵手移动 5款热门TD手机机型推荐', null, '', null, 'admin', '', null, '<table width=\"100%\" cellspacing=\"0\" cellpadding=\"4\" align=\"center\" class=\"tableborder\">\r\n<tbody>\r\n<tr>\r\n<td width=\"180\" valign=\"top\" class=\"altbg4\">&nbsp;</td>\r\n<td height=\"100%\" valign=\"top\" class=\"altbg3\">\r\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"padding: 5px; table-layout: fixed; width: 973px; height: 2195px;\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"top\">\r\n<div class=\"bbs_content clearfix\">随着5月17日电信日的来临，自从09年初网民对于3G方面关注越来越多，目前国内3G网络主要有中国移动TD-SCDMA，中国联通WCDMA以及 中国电信的CDMA2000这三种制式。到底是哪一种网络制式能让消费者满意，相信好多消费者都难以判断。<br />\r\n<br />\r\n而作为3G网络最主要的组 成部分-手持终端（手机） ，相信也是好多消费者关注的焦点。目前，中国移动TD-SCDMA手机机型频频爆出，其中不乏亮点产品，像联想联想 Ophone、诺基亚、多普达 Magic等，下面就让笔者与大家一起来了解TD-SCDMA网络制式下的几款强势机型吧。<br />\r\n<br />\r\n诺基亚TD-SCDMA手机　型号：待定　参考报价：尚未上市<br />\r\n<br />\r\n随着国内3G网络发展速度加快及众多手机厂商纷纷跟进，诺基亚终于推出TD-SCDMA手机，这款诺基亚的首台TD-SCDMA测试手机型号目前仍无法 得知，但从键盘及菜单设计来看，我们可以是知道其并没有采用S60操作系统，只是配备了S40系统，机身直板造型与早期热卖的6300有几分相像。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812278/1.jpg\" style=\"display: block;\" /></p>\r\n<br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n虽然没有更多的参数资料，但是从曝光的图片我们可以知道这款诺基亚TD-SCDMA手机必定配备了QVGA分辨率的屏幕以及320万像素的摄像头，而标准的MP3以及蓝牙等功能自然不会缺少，在功能方面不会比以往的S40手机逊色。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812279/2.jpg\" style=\"display: block;\" /></p>\r\n<br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n这款诺基亚的TD手机最大的卖点便是提供了对TD-HSDPA技术的支持，最大的功能特色便是该技术被看为是TD网络下一步的演进技术，能够同时适用于 WCDMA和TD-SCDMA两种不同的网络支持，能够很好的支持非对称的数据业务，也就是说这款诺基亚手机的用户即便在全球漫游都能够使用到3G网络。 而其机身前置的摄像头也更是证实了其3G手机的身份。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812280/3.jpg\" style=\"display: block;\" /></p>\r\n<p><br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n从目前曝光的测试情况来看，通过这款诺基亚TD手机连接网络，其下载速度能够稳定在1.3Mbps左右，不过根据国内有些媒体的报道，诺基亚官方已经证实将于今天下半年配合运营商中国移动对出自己的第一款TD-SCDMA制式的S60手机，大家要拭目以待了。</p>\r\n<p>&nbsp;</p>\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n最后较为耐人寻味的便是目前有业内人士指出目前曝光的的诺基亚TD手机其实是去年夏季就出现过的 TD测试手机，但是随着诺基亚拥有部分股份的TD芯片厂商&ldquo;凯明&rdquo;的倒闭，这款机型也就被取消了。尽管对于目前这款诺基亚的TD测试手机的身份尚无官方的 消息，但是诺基亚将推出TD手机遗失毫无悬念的事情了，相信大家也希望在TD制式下能够有更多的手机可以选择。</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', '0', '1', '0', '', 'http://', '0', '1241427051');
INSERT INTO `db_article` VALUES ('9', '5', '售后流程', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242576700');
INSERT INTO `db_article` VALUES ('10', '5', '购物流程', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242576717');
INSERT INTO `db_article` VALUES ('11', '5', '订购方式', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242576727');
INSERT INTO `db_article` VALUES ('12', '6', '如何分辨原装电池', null, '', null, 'admin', '', null, '<p><font size=\"2\">一般在购买时主要是依靠观察外观特征的方法来鉴别电池，而原装电池一般应具有以下一些特征：&nbsp;<br />\n<br />\n1、 电池外观整齐，外表面有一定的粗糙度且手感舒适，内表面手感光滑，灯光下能看见细密的纵向划痕&nbsp;<br />\n<br />\n2、 生产厂家字样应该轮廓清晰，且防伪标志亮度高，看上去有立体感，电池标贴 字迹清晰，有与电池类型相一致的电池件号<br />\n3、 电池标贴采用二次印刷技术，在一定光线下从斜面看，条形码部分的颜色比其他部分要黑，且用手触摸有凹凸感<br />\n<br />\n4、 原装电池电极与手机电池片宽度相等，电池电极下方标有&ldquo; + &rdquo;、&ldquo; - &rdquo;标志，电池电极片之间的隔离材料与外壳材料一致，但不是一体<br />\n<br />\n5、 原装电池装入手机时手感舒适，安装自如，电池按压部分卡位适当而且牢固<br />\n<br />\n6、 原装电池的金属触点采用优质的铜片，只有在正面看时才会有反光，而从其它角度看的话，都是比较暗淡的</font></p>', '1', '1', '0', '', 'http://', '0', '1242576826');
INSERT INTO `db_article` VALUES ('15', '7', '货到付款区域', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577023');
INSERT INTO `db_article` VALUES ('16', '7', '配送支付智能查询 ', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577032');
INSERT INTO `db_article` VALUES ('17', '7', '支付方式说明', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577041');
INSERT INTO `db_article` VALUES ('18', '10', '资金管理', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'user.php?act=account_log', '0', '1242577127');
INSERT INTO `db_article` VALUES ('19', '10', '我的收藏', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'user.php?act=collection_list', '0', '1242577178');
INSERT INTO `db_article` VALUES ('20', '10', '我的订单', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'user.php?act=order_list', '0', '1242577199');
INSERT INTO `db_article` VALUES ('21', '8', '退换货原则', null, '服务', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577293');
INSERT INTO `db_article` VALUES ('22', '8', '售后服务保证 ', null, '售后', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577308');
INSERT INTO `db_article` VALUES ('23', '8', '产品质量保证 ', null, '质量', null, 'admin', '', null, '', '1', '1', '0', '', 'http://', '0', '1242577326');
INSERT INTO `db_article` VALUES ('24', '9', '网站故障报告', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577432');
INSERT INTO `db_article` VALUES ('25', '9', '选机咨询 ', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577448');
INSERT INTO `db_article` VALUES ('26', '9', '投诉与建议 ', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242577459');
INSERT INTO `db_article` VALUES ('27', '4', '800万像素超强拍照机 LG Viewty Smart再曝光', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://news.imobile.com.cn/index-a-view-id-66790.html', '0', '1242577702');
INSERT INTO `db_article` VALUES ('28', '11', '飞利浦9@9促销', null, '', null, 'admin', '', null, '<p>&nbsp;</p>\r\n<div class=\"boxCenterList RelaArticle\" id=\"com_v\">\r\n<p align=\"left\">作为一款性价比极高的入门级<font size=\"3\" color=\"#ff0000\"><strong>商务手机</strong></font>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size=\"3\" color=\"#ff0000\">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size=\"3\"><strong><font color=\"#ff0000\">别</font><font color=\"#ff0000\">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">此款手机采用<strong><font size=\"3\" color=\"#ff0000\">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size=\"3\" color=\"#ff0000\">记事提醒</font></strong>，让商务应用更加随意。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;作为入门级为数不多支持<strong><font size=\"3\" color=\"#ff0000\">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;</p>\r\n</div>\r\n<p>&nbsp;</p>', '0', '1', '0', '', 'http://', '0', '1242578199');
INSERT INTO `db_article` VALUES ('29', '11', '诺基亚5320 促销', null, '', null, 'admin', '', null, '<p>&nbsp;</p>\r\n<div id=\"com_v\" class=\"boxCenterList RelaArticle\">\r\n<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<p>&nbsp;</p>', '1', '1', '0', '', 'http://', '0', '1242578676');
INSERT INTO `db_article` VALUES ('30', '11', '促销诺基亚N96', null, '', null, 'admin', '', null, '<p>&nbsp;</p>\r\n<div class=\"boxCenterList RelaArticle\" id=\"com_v\">\r\n<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>', '1', '1', '0', '', 'http://', '0', '1242578826');
INSERT INTO `db_article` VALUES ('13', '6', '如何分辨水货手机 ', null, '', null, 'admin', '', null, '<p>\n<div class=\"artibody\">\n<p><font size=\"2\"><strong>1、&nbsp;什么是水货？</strong><br />\n提及水货手机，按照行业内的说法，可以将水货手机分成三类：A类、B类和C类。 </font></p>\n<p><font size=\"2\">A类水货手机是指由国外、港澳台等地区在没有经过正常海关渠道的情况下进入国内市场的产品，就是我们常说的走私货， 与行货的主要差异是在输入法上，这类手机都是英文输入法或者是港澳台地区的繁体中文输入法。这类手机其最主要的目的是为了逃避国家关税或者因为该种产品曾 经过不正当改装而不能够通过正常渠道入关，质量一般没有大的问题。但由于逃避关税本身就是违法的，所以购买这类手机的用户根本得不到任何售后保障服务； </font></p>\n<p><font size=\"2\">B类水货手机就是走私者将手机的系统软件由英文版升级至中文版后，偷运到内地，然后贴上非法渠道购买的入网标志，作为行货手机充数。 </font></p>\n<p><font size=\"2\">C类水货手机则是那些由其他型号机改装、更换芯片等等方法做假&ldquo;生产&rdquo;出来的，或者就是从各地购买手机的部件，自己组装然后再贴上非法购买的入网标志。 </font></p>\n<p><font size=\"2\">水货手机虽然不排除它是原厂正货的可能，但通过市场调研发现，绝大多数水货手机都是改版的次货，而且产品基本没有受国内厂商的保修许可。</font></p>\n<p><font size=\"2\"><strong>2、水货有哪些？</strong>水货有两种，一种俗称港行，也称作水行，这种产品原本是在香港 及周边地区销售的，但是经过非法途径进入大陆地区销售。另一种是欧版水改机，也称作欧版，水改等，此种产品以英文改版机为主，通过刷改机内软件达到英文改 中文的目的，原来这类产品是销往欧美地区的，由于和大陆地区有相当大的价格差，所以通过走私进入中国市场。</font></p>\n<p><font size=\"2\"><strong>3、水货手机的危害</strong><br />\n1、售后服务无保障 <br />\n手机作为精密类电子产品，软件、硬件方面都有可能产生不同的问题。购买正规渠道的手机，一旦出现问题，只要将问题反映给厂商客户服务中心并静候佳音就 可以了。大多数走私手机的贩卖点规模较小，根本没有资金和技术能力建立起自己的维修网点，因此他们往往制定非常苛刻的保修条件，将国家明令的一年保修期缩 短为三个月，并加入完全对走私手机经销商有利的诸如&ldquo;认为摔打&rdquo;等概念难以界定的排除条件(众所周知，手机很有可能发生摔撞事件)，是确确实实的霸王条 款。规定时间内手机出了故障，走私手机经销商会通过曲解条款尽可能地开脱保修责任。即使他们愿意承担保修服务，也需将手机发往广州、深圳等地，委托他人维 修。一来路途漫长，二来经手人繁多，小问题&ldquo;修&rdquo;成了大问题。最终走私手机经销商会以无法维修为由劝客户自行去当地正规客服维修。至于维修费用，他们自然 也不愿意出了。<br />\n<br />\n2、产品本身质量不过关<br />\n&nbsp;&nbsp;&nbsp; 现在很多奸商为了谋取暴利，经常使用C类的翻修或者组装手机冒充A类水货手机进行销售。作为消费者来说面对和正规行货之间巨大的价格差异，他们无法分辨想要购买的手机是否象销售商说的那样质量过硬，在销售商的巧舌如簧下只能眼看自己的钱包&ldquo;减肥&rdquo;。 </font></p>\n<p><font size=\"2\">但是这类翻修或者组装的水货手机往往为了降低成本，其采用的配件往往也是不合格产品，甚至也是伪劣产品，可以想象由这样产品组装起来的手机的质量究竟可以好到那里去。目前在经常看到手机电池爆炸伤人的事件的报道，究其原因也是消费者购买了这些组装的水货手机。</font></p>\n<p><font size=\"2\">而且不光这类手机硬件存在问题，包括手机使用的软件。由于组装的水货硬件规格根本无法保证和原场产品一致，手机使用的软件也会造成和手机硬件的冲突。频繁死机就是家常便饭，更有甚者会造成经常性的电话本丢失，无法联系到好友。</font></p>\n<p><br />\n<font size=\"2\"><strong>4、如何分辨行、水货手机？</strong><br />\n1、看手机上是否贴有信息产业部&ldquo;进网许可&rdquo;标志。水货与正品的入网标志稍微有一点不同：真的入网标志一般都是针式打印机打印的，数字清晰，颜色较浅，仔细看有针打的凹痕；假的入网标志一般是普通喷墨打印机打印的，数字不很清晰，颜色较深，没有凹痕。 </font></p>\n<p><font size=\"2\">2、检查手机的配置，包括中文说明书、电池、充电器等，如果是厂家原配，一般均贴有厂家的激光防伪标志。原厂配置的 中文说明书通常印刷精美，并与其他语言的说明书及相关产品资料的印刷质量、格式、风格等保持一致。不是原厂家配置的中文说明书通常印刷质量低劣，常出现错 别字，甚至字迹模糊。正品手机的包装盒中均附带有原厂合格证、原厂条码卡、原厂保修卡，而水货则没有。 </font></p>\n<p><font size=\"2\">3、确认经销商的保修条例是否与厂家一致，在购买手机时应索要发票和保修卡。 </font></p>\n<p><font size=\"2\">4、电子串号是否一致也是验证是否水货手机的重要途径。首先在手机上按&ldquo;*#06#&rdquo;，一般会在手机上显示15个数 字，这就是本手机的IMEI码。然后打开手机的电池盖，在手机里有一张贴纸，上面也有一个IMEI码，这个码应该同手机上显示的IMEI码完全一致。然后 再检查手机的外包装盒上的贴纸，上面也应该有一个IMEI码，这个码也应该同手机上显示的IMEI码完全一致。如果此三个码有不一致的地方，这个手机就有 问题。</font></p>\n</div>\n<p>&nbsp;</p>\n</p>', '0', '1', '0', '', 'http://', '0', '1242576911');
INSERT INTO `db_article` VALUES ('14', '6', '如何享受全国联保', null, '', null, 'admin', '', null, '', '0', '1', '0', '', 'http://', '0', '1242576927');
INSERT INTO `db_article` VALUES ('31', '12', '诺基亚6681手机广告欣赏', null, '', null, 'admin', '', null, '<object>\n<param value=\"always\" name=\"allowScriptAccess\" />\n<param value=\"transparent\" name=\"wmode\" />\n<param value=\"http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ\" name=\"movie\" /><embed width=\"480\" height=\"385\" src=\"http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ\" allowscriptaccess=\"always\" wmode=\"transparent\" type=\"application/x-shockwave-flash\"></embed></object>', '0', '1', '0', '', 'http://', '0', '1242579069');
INSERT INTO `db_article` VALUES ('32', '12', '手机游戏下载', null, '', null, 'admin', '', null, '<p>三星SGHU308说明书下载，点击相关链接下载</p>', '1', '1', '0', '', 'http://soft.imobile.com.cn/index-a-list_softs-cid-1.html', '0', '1242579189');
INSERT INTO `db_article` VALUES ('33', '12', '三星SGHU308说明书下载', null, '', null, 'admin', '', null, '<p>三星SGHU308说明书下载</p>', '1', '1', '2', 'data/article/1245043292228851198.rar', 'http://', '0', '1242579559');
INSERT INTO `db_article` VALUES ('34', '12', '3G知识普及', null, '', null, 'admin', '', null, '<p>\n<h2>3G知识普及</h2>\n<div class=\"t_msgfont\" id=\"postmessage_8792145\"><font color=\"black\">3G，全称为3rd Generation，中文含义就是指第三代数字通信。<br />\n</font><br />\n<font color=\"black\">　　1995年问世的第一代<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C4%A3%C4%E2\">模拟</span>制式<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CA%D6%BB%FA\">手机</span>（1G）只能进行<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D3%EF%D2%F4\">语音</span>通话；<br />\n</font><br />\n<font color=\"black\">　　1996到1997年出现的第二代GSM、TDMA等数字制式手机（2G）便增加了接收数据的功能，如接收电子邮件或网页；<br />\n</font><br />\n<font color=\"black\">　　3G不是2009年诞生的，它是上个世纪的产物，而早在2007年国外就已经产生4G了，而<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA\">中国</span>也于2008年成功开发出<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA\">中国</span>4G，其网络传输的速度可达到每秒钟2G，也就相当于下一部电影只要一秒钟。在上世纪90年末的日韩电影如《我的野蛮女友》中，女主角使用的可以让对方看见自己的视频<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%B5%E7%BB%B0\">电话</span>，就是属于3G技术的重要运用之一。日韩等国3G的运用是上世纪末期的事。而目前国外有些地区已经试运行3.5G甚至4G网络。<br />\n</font><br />\n<font color=\"black\">　 </font><font color=\"black\">（以下为误导）2009年问世的第三代（3G）与 前两代的主要区别是在传输声音和数据的速度上的提升，它能够在全球范围内更好地实现无缝漫游，并处理图像、音乐、视频流等多种媒体形式，提供包括网页浏 览、电话会议、电子商务等多种信息服务，同时也要考虑与已有第二代系统的良好兼容性。为了提供这种服务，无线网络必须能够支持不同的数据传输速度，也就是 说在室内、室外和行车的环境中能够分别支持至少2Mbps（兆比特／每秒）、384kbps（千比特／每秒）以及144kbps的传输速度。（此数值根据 网络环境会发生变化)。<br />\n</font><br />\n<font color=\"black\">　　3G标准，国际电信联盟(ITU)目前一共确定了全球四大3G标准，它们分别是WCDMA、CDMA2000和TD-SCDMA和WiMAX。</font><br />\n<br />\n<font color=\"black\">3G标准　　国际电信联盟（ITU）在2000年5月确定W-CDMA、CDMA2000、TD-SCDMA以 及WiMAX四大主流无线接口标准，写入3G技术指导性文件《2000年国际移动通讯计划》（简称IMT&mdash;2000）。 CDMA是Code Division Multiple Access (码分多址)的缩写，是第三代移动通信系统的技术基础。第一代移动通信系统采用频分多址(FDMA)的模拟调制方式，这种系统的主要缺点是频谱利用率低， 信令干扰话音业务。第二代移动通信系统主要采用时分多址(TDMA)的数字调制方式，提高了系统容量，并采用独立信道传送信令，使系统性能大大改善，但 TDMA的系统容量仍然有限，越区切换性能仍不完善。CDMA系统以其频率规划简单、系统容量大、频率复用系数高、抗多径能力强、通信质量好、软容量、软 切换等特点显示出巨大的发展潜力。下面分别介绍一下3G的几种标准：<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(1) W-CDMA</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　也称为WCDMA，全称为Wideband CDMA，也称为CDMA Direct Spread，意为宽频分码多重存取，这是基于GSM网发展出来的3G技术规范，是欧洲提出的宽带CDMA技术，它与日本提出的宽带CDMA技术基本相 同，目前正在进一步融合。W-CDMA的支持者主要是以GSM系统为主的欧洲厂商，日本公司也或多或少参与其中，包括欧美的爱立信、阿尔卡特、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C5%B5%BB%F9%D1%C7\">诺基亚</span>、 朗讯、北电，以及日本的NTT、富士通、夏普等厂商。 该标准提出了GSM(2G)-GPRS-EDGE-WCDMA(3G)的演进策略。这套系统能够架设在现有的GSM网络上，对于系统提供商而言可以较轻易 地过渡，但是GSM系统相当普及的亚洲对这套新技术的接受度预料会相当高。因此W-CDMA具有先天的市场优势。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(2)CDMA2000</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　CDMA2000是由窄带CDMA(CDMA IS95)技术发展而来的宽带CDMA技术，也称为CDMA Multi-Carrier，它是由美国高通北美公司为主导提出，<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C4%A6%CD%D0%C2%DE%C0%AD\">摩托罗拉</span>、Lucent 和后来加入的韩国三星都有参与，韩国现在成为该标准的主导者。这套系统是从窄频CDMAOne数字标准衍生出来的，可以从原有的CDMAOne结构直接升 级到3G，建设成本低廉。但目前使用CDMA的地区只有日、韩和北美，所以CDMA2000的支持者不如W-CDMA多。不过CDMA2000的研发技术 却是目前各标准中进度最快的，许多3G手机已经率先面世。该标准提出了从CDMA IS95(2G)-CDMA20001x-CDMA20003x(3G)的演进策略。CDMA20001x被称为2.5代移动通信技术。 CDMA20003x与CDMA20001x的主要区别在于应用了多路载波技术，通过采用三载波使带宽提高。目前<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA%B5%E7%D0%C5\">中国电信</span>正在采用这一方案向3G过渡，并已建成了CDMA IS95网络。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(3)TD-SCDMA</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　全称为Time Division - Synchronous CDMA(时分<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CD%AC%B2%BD\">同步</span>CDMA)，该标准是由中国大陆独自制定的3G标准，1999年6月29日，中国原邮电部电信科学技术研究院（大唐电信）向ITU提出。该标准将智能无线、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CD%AC%B2%BD\">同步</span>CDMA和<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C8%ED%BC%FE\">软件</span>无 线电等当今国际领先技术融于其中，在频谱利用率、对业务支持具有灵活性、频率灵活性及成本等方面的独特优势。另外，由于中国内的庞大的市场，该标准受到各 大主要电信设备厂商的重视，全球一半以上的设备厂商都宣布可以支持TD&mdash;SCDMA标准。 该标准提出不经过2.5代的中间环节，直接向3G过渡，非常适用于GSM系统向3G升级。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(4)WiMAX</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　WiMAX 的全名是微波存取全球互通(Worldwide Interoperability for Microwave Access)，又称为802&middot;16无线城域网，是又一种为企业和家庭用户提供&ldquo;最后一英里&rdquo;的宽带无线连接方案。将此技术与需要授权或免授权的微波设备 相结合之后，由于成本较低，将扩大宽带无线市场，改善企业与服务供应商的认知度。2007年10月19日，国际电信联盟在日内瓦举行的无线通信全体会议 上，经过多数国家投票通过，WiMAX正式被批准成为继WCDMA、CDMA2000和TD-SCDMA之后的第四个全球3G标准。</font></div>\n</p>', '0', '1', '0', '', 'http://', '0', '1242580013');
INSERT INTO `db_article` VALUES ('35', '4', '“沃”的世界我做主', '#FF0000', '', null, 'admin', '', null, '<p><strong>导语：<br />\n<br />\n</strong>&nbsp;&nbsp;&nbsp;&nbsp;今年5月17日，是每年一度的世界电信日。同时，也是值得中国人民高兴的日子。昨天，中国联通企业品牌下的全品牌业务&ldquo;沃&rdquo;开始试商用，这也就意味着继中国移动、中国电信之后，国内第三种3G网络将要走入我们的生活，为我们带来更加快速便捷的通信服务。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;沃，意味着此品牌将为用户提供一个丰盈的平台，为个人客户、家庭客户、集团客户和企业服务提供全面的支撑，它代表着中国联通全新的服务理念和创新的品牌精神，在3G时代，为客户提供精彩的信息化服务。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;下面小编为各位介绍几款各大手机品牌专为&ldquo;沃&rdquo;打造的定制机型，为您迎接&ldquo;沃&rdquo;的到来做好充分准备。</p>\n<p><strong>诺基亚6210si<br />\n<br />\n</strong>&nbsp;&nbsp;&nbsp;&nbsp;诺基亚6210s大家肯定不陌生，经典的滑盖导航手机。其实6210si 与6210s外观、参数、硬件配置几乎完全一样，只不过在6210s的基础上，增加了对WCDMA网络的支持，成为中国联通定制手机。6210si采用诺 基亚经典的滑盖机身设计，机身面板为钢琴烤漆材质，高贵优雅。机身背板则为磨砂外观工程塑料材质，美观的同时增加了手机与手掌间的摩擦系数，防止使用中手 机滑落。</p>\n<p><strong>摩托罗拉A3100<br />\n</strong><br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为摩托罗拉旗下为中国联通定制的A3100，它有着经典的鹅卵石造型， 大气稳重。从最初的U6，到U9再到A3100，鹅卵石的辉煌依旧。A3100有着高贵的血统，钢琴烤漆黑色面板，金属拉丝机身以及 Windows&nbsp;Mobile&nbsp;6.1&nbsp;Professional操作系统，都告诉我们它绝对是一部不可多得的好手机。</p>\n<p><br />\n<strong>三星S7520U<br />\n</strong><br />\n&nbsp;&nbsp;&nbsp;&nbsp;三星S7520U外观造型时尚，镜面设计以及超薄的 98.4&times;55&times;11.6mm金属机身，更适合女性朋友使用。通观机身，最显眼的就要数这3.0英寸的超大触摸屏幕了，400x240的WQGVA级别分 辨率，能够比QVGA级别屏幕显示更为细腻，细节表现力更强。500万像素摄像头说明了该机还是一名拍照能手，捕捉精彩瞬间不在话下。</p>', '0', '1', '0', '', 'http://', '0', '1242974613');

-- ----------------------------
-- Table structure for `db_article_cat`
-- ----------------------------
DROP TABLE IF EXISTS `db_article_cat`;
CREATE TABLE `db_article_cat` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_describe` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_in_nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='管理文章分类';

-- ----------------------------
-- Records of db_article_cat
-- ----------------------------
INSERT INTO `db_article_cat` VALUES ('1', '0', '系统分类', '', '系统保留分类', '2', '0', '50');
INSERT INTO `db_article_cat` VALUES ('2', '1', '网店信息', '', '网店信息分类', '3', '0', '50');
INSERT INTO `db_article_cat` VALUES ('3', '1', '网店帮助分类', '', '网店帮助分类', '4', '0', '50');
INSERT INTO `db_article_cat` VALUES ('4', '0', '3G资讯', '', '', '1', '0', '50');
INSERT INTO `db_article_cat` VALUES ('5', '3', '新手上路 ', '', '', '5', '1', '50');
INSERT INTO `db_article_cat` VALUES ('6', '3', '手机常识 ', '手机常识 ', '手机常识 ', '5', '0', '50');
INSERT INTO `db_article_cat` VALUES ('7', '3', '配送与支付 ', '', '配送与支付 ', '5', '0', '50');
INSERT INTO `db_article_cat` VALUES ('8', '3', '服务保证 ', '', '', '5', '0', '50');
INSERT INTO `db_article_cat` VALUES ('9', '3', '联系我们 ', '', '联系我们 ', '5', '0', '50');
INSERT INTO `db_article_cat` VALUES ('10', '3', '会员中心', '', '', '5', '0', '50');
INSERT INTO `db_article_cat` VALUES ('11', '0', '手机促销', '', '', '1', '0', '50');
INSERT INTO `db_article_cat` VALUES ('12', '0', '站内快讯', '', '', '1', '1', '50');

-- ----------------------------
-- Table structure for `db_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `db_attribute`;
CREATE TABLE `db_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='管理商品属性';

-- ----------------------------
-- Records of db_attribute
-- ----------------------------
INSERT INTO `db_attribute` VALUES ('1', '1', '作者', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('2', '1', '出版社', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('3', '1', '图书书号/ISBN', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('4', '1', '出版日期', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('5', '1', '开本', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('6', '1', '图书页数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('7', '1', '图书装订', '1', '0', '平装\r\n黑白', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('8', '1', '图书规格', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('9', '1', '版次', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('10', '1', '印张', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('11', '1', '字数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('12', '1', '所属分类', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('13', '2', '中文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('14', '2', '英文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('15', '2', '商品别名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('16', '2', '介质/格式', '1', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD\r\nCD\r\nTAPE\r\nLP', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('17', '2', '片装数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('18', '2', '国家地区', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('19', '2', '语种', '1', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('20', '2', '导演/指挥', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('21', '2', '主唱', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('22', '2', '所属类别', '1', '0', '古典\r\n流行\r\n摇滚\r\n乡村\r\n民谣\r\n爵士\r\n蓝调\r\n电子\r\n舞曲\r\n国乐\r\n民族\r\n怀旧\r\n经典\r\n人声\r\n合唱\r\n发烧\r\n试音\r\n儿童\r\n胎教\r\n轻音乐\r\n世界音乐\r\n庆典音乐\r\n影视音乐\r\n新世纪音乐\r\n大自然音乐', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('23', '2', '长度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('24', '2', '歌词', '1', '0', '有\r\n无', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('25', '2', '碟片代码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('26', '2', 'ISRC码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('27', '2', '发行公司', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('28', '2', '出版', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('29', '2', '出版号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('30', '2', '引进号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('31', '2', '版权号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('32', '3', '中文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('33', '3', '英文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('34', '3', '商品别名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('35', '3', '介质/格式', '1', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('36', '3', '碟片类型', '1', '0', '单面\r\n双层', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('37', '3', '片装数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('38', '3', '国家地区', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('39', '3', '语种/配音', '1', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('40', '3', '字幕', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('41', '3', '色彩', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('42', '3', '中文字幕', '1', '0', '有\r\n无', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('43', '3', '导演', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('44', '3', '表演者', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('45', '3', '所属类别', '1', '0', '爱情\r\n偶像\r\n生活\r\n社会\r\n科幻\r\n神话\r\n武侠\r\n动作\r\n惊险\r\n恐怖\r\n传奇\r\n人物\r\n侦探\r\n警匪\r\n历史\r\n军事\r\n戏剧\r\n舞台\r\n经典\r\n名著\r\n喜剧\r\n情景\r\n动漫\r\n卡通\r\n儿童\r\n伦理激情', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('46', '3', '年份', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('47', '3', '音频格式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('48', '3', '区码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('49', '3', '碟片代码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('50', '3', 'ISRC码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('51', '3', '发行公司', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('52', '3', '出版 ', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('53', '3', '出版号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('54', '3', '引进号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('55', '3', '版权号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('56', '4', '网络制式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('57', '4', '支持频率/网络频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('58', '4', '尺寸体积', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('59', '4', '外观样式/手机类型', '1', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('60', '4', '主屏参数/内屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('61', '4', '副屏参数/外屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('62', '4', '清晰度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('63', '4', '色数/灰度', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('64', '4', '长度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('65', '4', '宽度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('66', '4', '厚度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('67', '4', '屏幕材质', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('68', '4', '内存容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('69', '4', '操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('70', '4', '通话时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('71', '4', '待机时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('72', '4', '标准配置', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('73', '4', 'WAP上网', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('74', '4', '数据业务', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('75', '4', '天线位置', '1', '0', '内置\r\n外置', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('76', '4', '随机配件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('77', '4', '铃声', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('78', '4', '摄像头', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('79', '4', '彩信/彩e', '1', '0', '支持\r\n不支持', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('80', '4', '红外/蓝牙', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('81', '4', '价格等级', '1', '0', '高价机\r\n中价机\r\n低价机', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('82', '5', '型号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('83', '5', '详细规格', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('84', '5', '笔记本尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('85', '5', '处理器类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('86', '5', '处理器最高主频', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('87', '5', '二级缓存', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('88', '5', '系统总线', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('89', '5', '主板芯片组', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('90', '5', '内存容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('91', '5', '内存类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('92', '5', '硬盘', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('93', '5', '屏幕尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('94', '5', '显示芯片', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('95', '5', '标称频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('96', '5', '显卡显存', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('97', '5', '显卡类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('98', '5', '光驱类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('99', '5', '电池容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('100', '5', '其他配置', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('101', '6', '类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('102', '6', '最大像素/总像素  ', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('103', '6', '有效像素', '1', '0', '  ', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('104', '6', '光学变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('105', '6', '数字变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('106', '6', '操作模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('107', '6', '显示屏类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('108', '6', '显示屏尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('109', '6', '感光器件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('110', '6', '感光器件尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('111', '6', '最高分辨率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('112', '6', '图像分辨率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('113', '6', '传感器类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('114', '6', '传感器尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('115', '6', '镜头', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('116', '6', '光圈', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('117', '6', '焦距', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('118', '6', '旋转液晶屏', '1', '0', '支持\r\n不支持', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('119', '6', '存储介质', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('120', '6', '存储卡', '1', '0', '  记录媒体\r\n存储卡容量', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('121', '6', '影像格式', '1', '0', '    静像\r\n动画', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('122', '6', '曝光控制', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('123', '6', '曝光模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('124', '6', '曝光补偿', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('125', '6', '白平衡', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('126', '6', '连拍', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('127', '6', '快门速度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('128', '6', '闪光灯', '1', '0', '内置\r\n外置', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('129', '6', '拍摄范围', '1', '0', '  ', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('130', '6', '自拍定时器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('131', '6', 'ISO感光度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('132', '6', '测光模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('133', '6', '场景模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('134', '6', '短片拍摄', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('135', '6', '外接接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('136', '6', '电源', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('137', '6', '电池使用时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('138', '6', '外形尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('139', '6', '标配软件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('140', '6', '标准配件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('141', '6', '兼容操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('142', '7', '编号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('143', '7', '类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('144', '7', '外型尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('145', '7', '最大像素数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('146', '7', '光学变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('147', '7', '数字变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('148', '7', '显示屏尺寸及类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('149', '7', '感光器件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('150', '7', '感光器件尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('151', '7', '感光器件数量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('152', '7', '像素范围', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('153', '7', '传感器数量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('154', '7', '传感器尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('155', '7', '水平清晰度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('156', '7', '取景器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('157', '7', '数码效果', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('158', '7', '镜头性能', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('159', '7', '对焦方式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('160', '7', '曝光控制', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('161', '7', '其他接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('162', '7', '随机存储', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('163', '7', '电池类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('164', '7', '电池供电时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('165', '8', '产地', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('166', '8', '产品规格/容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('167', '8', '主要原料', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('168', '8', '所属类别', '1', '0', '彩妆\r\n化妆工具\r\n护肤品\r\n香水', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('169', '8', '使用部位', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('170', '8', '适合肤质', '1', '0', '油性\r\n中性\r\n干性', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('171', '8', '适用人群', '1', '0', '女性\r\n男性', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('172', '9', '上市日期', '1', '0', '2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月\r\n2008年07月\r\n2008年08月\r\n2008年09月\r\n2008年10月\r\n2008年11月\r\n2008年12月\r\n2007年01月\r\n2007年02月\r\n2007年03月\r\n2007年04月\r\n2007年05月\r\n2007年06月\r\n2007年07月\r\n2007年08月\r\n2007年09月\r\n2007年10月\r\n2007年11月\r\n2007年12月', '1', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('173', '9', '手机制式', '1', '0', 'GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )', '1', '1', '1', '0');
INSERT INTO `db_attribute` VALUES ('174', '9', '理论通话时间', '0', '0', '', '0', '2', '0', '0');
INSERT INTO `db_attribute` VALUES ('175', '9', '理论待机时间', '0', '0', '', '0', '3', '0', '0');
INSERT INTO `db_attribute` VALUES ('176', '9', '铃声', '0', '0', '', '0', '4', '0', '0');
INSERT INTO `db_attribute` VALUES ('177', '9', '铃声格式', '0', '0', '', '0', '5', '0', '0');
INSERT INTO `db_attribute` VALUES ('178', '9', '外观样式', '1', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠', '1', '6', '1', '0');
INSERT INTO `db_attribute` VALUES ('179', '9', '中文短消息', '0', '0', '', '0', '7', '0', '0');
INSERT INTO `db_attribute` VALUES ('180', '9', '存储卡格式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('181', '9', '内存容量', '0', '0', '', '2', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('182', '9', '操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('183', '9', 'K-JAVA', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('184', '9', '尺寸体积', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('185', '9', '颜色', '1', '1', '黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色', '1', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('186', '9', '屏幕颜色', '1', '0', '1600万\r\n262144万', '1', '0', '1', '1');
INSERT INTO `db_attribute` VALUES ('187', '9', '屏幕材质', '1', '0', 'TFT', '0', '0', '0', '1');
INSERT INTO `db_attribute` VALUES ('188', '9', '屏幕分辨率', '1', '0', '320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素', '1', '0', '0', '1');
INSERT INTO `db_attribute` VALUES ('189', '9', '屏幕大小', '0', '0', '', '0', '0', '0', '1');
INSERT INTO `db_attribute` VALUES ('190', '9', '中文输入法', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('191', '9', '情景模式', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('192', '9', '网络链接', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('193', '9', '蓝牙接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('194', '9', '数据线接口', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('195', '9', '电子邮件', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('196', '9', '闹钟', '0', '0', '', '0', '35', '0', '4');
INSERT INTO `db_attribute` VALUES ('197', '9', '办公功能', '0', '0', '', '0', '0', '0', '4');
INSERT INTO `db_attribute` VALUES ('198', '9', '数码相机', '0', '0', '', '1', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('199', '9', '像素', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('200', '9', '传感器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('201', '9', '变焦模式', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('202', '9', '视频拍摄', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('203', '9', 'MP3播放器', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('204', '9', '视频播放', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('205', '9', 'CPU频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `db_attribute` VALUES ('206', '9', '收音机', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('207', '9', '耳机接口', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('208', '9', '闪光灯', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `db_attribute` VALUES ('209', '9', '浏览器', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `db_attribute` VALUES ('210', '9', '配件', '1', '2', '线控耳机\r\n蓝牙耳机\r\n数据线', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `db_back_order`
-- ----------------------------
DROP TABLE IF EXISTS `db_back_order`;
CREATE TABLE `db_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `return_time` int(10) unsigned DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_back_order
-- ----------------------------
INSERT INTO `db_back_order` VALUES ('1', '20090615054961769', '2009061585887', '15', '2009061585884', '1245044533', '3', '', '1', 'admin', '刘先生', '海兴大厦', '1', '2', '52', '502', '', 'ecshop@ecshop.com', '', '010-25851234', '13986765412', '', '', '等待所有商品备齐后再发', '0.00', '10.00', '1245044964', '2', '0', '1245045515', '0');
INSERT INTO `db_back_order` VALUES ('2', '20090615055104671', '2009061585887', '15', '20090615', '1245044533', '3', '', '1', 'admin', '刘先生', '海兴大厦', '1', '2', '52', '502', '', 'ecshop@ecshop.com', '', '010-25851234', '13986765412', '', '', '等待所有商品备齐后再发', '0.00', '10.00', '1245045061', '1', '0', '1245045515', '0');

-- ----------------------------
-- Table structure for `db_category`
-- ----------------------------
DROP TABLE IF EXISTS `db_category`;
CREATE TABLE `db_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `cat_keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_describe` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(2) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned DEFAULT '0',
  `is_new` tinyint(1) unsigned DEFAULT '0',
  `is_hot` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='管理商品分类';

-- ----------------------------
-- Records of db_category
-- ----------------------------
INSERT INTO `db_category` VALUES ('1', '0', '手机类型', '', '', '50', '', '', '0', '', '1', '5', '172,185,178', '0', '0', '0');
INSERT INTO `db_category` VALUES ('2', '1', 'CDMA手机', '', '', '50', '', '', '0', '', '1', '0', '6', '0', '0', '0');
INSERT INTO `db_category` VALUES ('3', '1', 'GSM手机', '', '', '50', '', '台', '1', '', '1', '4', '185,189,173,178', '0', '0', '0');
INSERT INTO `db_category` VALUES ('4', '1', '3G手机', '', '', '50', '', '', '1', '', '1', '0', '28', '0', '0', '0');
INSERT INTO `db_category` VALUES ('5', '1', '双模手机', '', '', '50', '', '', '0', '', '1', '5', '18', '0', '0', '0');
INSERT INTO `db_category` VALUES ('6', '0', '手机配件', '', '', '50', '', '', '1', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('7', '6', '充电器', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('8', '6', '耳机', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('9', '6', '电池', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('11', '6', '读卡器和内存卡', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('12', '0', '充值卡', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('13', '12', '小灵通/固话充值卡', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('14', '12', '移动手机充值卡', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `db_category` VALUES ('15', '12', '联通手机充值卡', '', '', '50', '', '', '0', '', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `db_delivery_order`
-- ----------------------------
DROP TABLE IF EXISTS `db_delivery_order`;
CREATE TABLE `db_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_delivery_order
-- ----------------------------
INSERT INTO `db_delivery_order` VALUES ('1', '20090615054961769', '2009061585887', '15', '2009061585884', '1245044533', '3', '城际快递', '1', 'admin', '刘先生', '海兴大厦', '1', '2', '52', '502', '', 'ecshop@ecshop.com', '', '010-25851234', '13986765412', '', '', '等待所有商品备齐后再发', '0.00', '10.00', '1245044964', '2', '1', '0');
INSERT INTO `db_delivery_order` VALUES ('2', '20090615055104671', '2009061585887', '15', '20090615', '1245044533', '3', '城际快递', '1', 'admin', '刘先生', '海兴大厦', '1', '2', '52', '502', '', 'ecshop@ecshop.com', '', '010-25851234', '13986765412', '', '', '等待所有商品备齐后再发', '0.00', '10.00', '1245045061', '1', '1', '0');

-- ----------------------------
-- Table structure for `db_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `db_friend_link`;
CREATE TABLE `db_friend_link` (
  `f_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(60) NOT NULL,
  `f_url` varchar(255) NOT NULL,
  `f_logo` varchar(255) NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned DEFAULT '0',
  `hit_count` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`f_id`),
  KEY `show_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理友情链接';

-- ----------------------------
-- Records of db_friend_link
-- ----------------------------
INSERT INTO `db_friend_link` VALUES ('1', 'RCX-ECSHOP管理系统', 'http://www.greenzn.com', '', '50', '1', '0');
INSERT INTO `db_friend_link` VALUES ('2', '荣创新网络', 'http://www.greenzn.com', '', '50', '1', '0');
INSERT INTO `db_friend_link` VALUES ('3', '寰宇网络', 'http://www.greenzn.com', '', '50', '1', '0');

-- ----------------------------
-- Table structure for `db_goods`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods`;
CREATE TABLE `db_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='管理商品';

-- ----------------------------
-- Records of db_goods
-- ----------------------------
INSERT INTO `db_goods` VALUES ('1', '4', 'ECS000000', 'KD876', '+', '7', '8', '', '1', '0.110', '1665.60', '1388.00', '0.00', '0', '0', '1', 'LG 3g 876 支持 双模 2008年04月 灰色 GSM,850,900,1800,1900', '', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多朋友都已经抢先体验了3G网络的可视通话、高速上网等功能。LG KD876手机<span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\"><strong>支持TD-SCDMA/GSM双模单待</strong></span></span>，便于测试初期GSM网络和TD网络之间的切换和共享。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876手机整体采用银色塑料材质，<strong><span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\">特殊的旋转屏设计是本机的亮点</span></span></strong>，而机身背部的300万像素摄像头也是首发的六款TD-SCDMA手机中配置最高的。LG KD876手机屏幕下方设置有外键盘，该键盘由左/右软键、通话/挂机键、返回键、五维摇杆组成，摇杆灵敏度很高，定位准确。KD876的内键盘由标准12个电话键和三个功能键、一个内置摄像头组成。三个功能键分别为视频通话、MP3、和菜单键，所有按键的手感都比较一般，键程适中，当由于按键排列过于紧密，快速发短信时很容易误按，用户在使用时一定要多加注意。LG KD876手机机身周边的接口设计非常简洁，手机的厚度主要来自屏幕旋转轴的长度，如果舍弃旋屏设计的话，估计<span style=\"font-size: x-large;\"><strong><span style=\"color: rgb(255, 0, 0);\">厚度可以做到10mm以下</span></strong></span>。</p>', 'images/200905/thumb_img/1_thumb_G_1240902890710.jpg', 'images/200905/goods_img/1_G_1240902890755.jpg', 'images/200905/source_img/1_G_1240902890895.gif', '1', '', '1', '1', '0', '13', '1240902890', '100', '0', '1', '1', '1', '0', '0', '1269589545', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('4', '8', 'ECS000004', '诺基亚N85原装充电器', '+', '0', '1', '', '17', '0.000', '69.60', '58.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/4_thumb_G_1241422402467.jpg', 'images/200905/goods_img/4_G_1241422402722.jpg', 'images/200905/source_img/4_G_1241422402919.jpg', '1', '', '1', '0', '0', '0', '1241422402', '100', '0', '0', '0', '0', '0', '0', '1242110662', '6', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('3', '8', 'ECS000002', '诺基亚原装5800耳机', '+', '3', '1', '', '24', '0.000', '81.60', '68.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/3_thumb_G_1241422082679.jpg', 'images/200905/goods_img/3_G_1241422082168.jpg', 'images/200905/source_img/3_G_1241422082367.jpg', '1', '', '1', '1', '0', '0', '1241422082', '100', '0', '0', '0', '0', '0', '0', '1241972255', '6', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('5', '11', 'ECS000005', '索爱原装M2卡读卡器', '+', '3', '7', '', '8', '0.000', '24.00', '20.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/5_thumb_G_1241422518886.jpg', 'images/200905/goods_img/5_G_1241422518773.jpg', 'images/200905/source_img/5_G_1241422518470.jpg', '1', '', '1', '1', '0', '0', '1241422518', '100', '0', '1', '1', '0', '0', '0', '1241972241', '2', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('6', '11', 'ECS000006', '胜创KINGMAX内存卡', '+', '0', '0', '', '15', '0.000', '50.40', '42.00', '0.00', '0', '0', '1', '', '', '', '', '', '', '1', '', '1', '0', '0', '0', '1241422573', '100', '0', '0', '0', '0', '0', '0', '1241972238', '6', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('7', '8', 'ECS000007', '诺基亚N85原装立体声耳机HS-82', '+', '0', '1', '', '20', '0.000', '120.00', '100.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/7_thumb_G_1241422785492.jpg', 'images/200905/goods_img/7_G_1241422785856.jpg', 'images/200905/source_img/7_G_1241422785657.jpg', '1', '', '1', '1', '0', '1', '1241422785', '100', '0', '0', '0', '0', '0', '0', '1241972232', '2', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('8', '3', 'ECS000008', '飞利浦9@9v', '+', '10', '4', '', '1', '0.075', '478.79', '399.00', '385.00', '1241366400', '1417276800', '1', '双模 2008年春 黑色 直板 中低档', '', '<p align=\"left\">作为一款性价比极高的入门级<font size=\"3\" color=\"#ff0000\"><strong>商务手机</strong></font>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size=\"3\" color=\"#ff0000\">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size=\"3\"><strong><font color=\"#ff0000\">别</font><font color=\"#ff0000\">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">此款手机采用<strong><font size=\"3\" color=\"#ff0000\">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size=\"3\" color=\"#ff0000\">记事提醒</font></strong>，让商务应用更加随意。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;作为入门级为数不多支持<strong><font size=\"3\" color=\"#ff0000\">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;</p>', 'images/200905/thumb_img/8_thumb_G_1241425513488.jpg', 'images/200905/goods_img/8_G_1241425513055.jpg', 'images/200905/source_img/8_G_1241425513518.jpg', '1', '', '1', '1', '0', '3', '1241425512', '100', '0', '1', '1', '1', '1', '0', '1269589533', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('9', '3', 'ECS000009', '诺基亚E66', '+', '20', '1', '', '4', '0.121', '2757.60', '2298.00', '0.00', '0', '0', '1', 'SMS EMS MMS 短消息群发 语音 阅读器 SMS,EMS,MMS,短消息群发语音合成信息阅读器 黑色 白色 滑盖', '', '<p>在机身材质方面，诺基亚E66大量采用金属材质，刨光的金属表面光泽动人，背面的点状效果规则却又不失变化，时尚感总是在不经意间诠释出来，并被人们所感知。E66机身尺寸为<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>107.5&times;49.5&times;13.6毫米，重量为121克</strong></span></span>，滑盖的造型竟然比E71还要轻一些。</p>\r\n<p>&nbsp;</p>\r\n<div>诺基亚E66机身正面是<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>一块2.4英寸1600万色QVGA分辨率（240&times;320像素）液晶显示屏</strong></span></span>。屏幕上方拥有光线感应元件，能够自适应周 围环境光调节屏幕亮度；屏幕下方是方向功能键区。打开滑盖，可以看到传统的数字键盘，按键的大小、手感、间隔以及键程适中，手感非常舒适。</div>\r\n<div>&nbsp;</div>\r\n<div>诺基亚为E66配备了一颗320万像素自动对焦摄像头，带有LED 闪光灯，支持多种拍照尺寸选择。</div>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/9_thumb_G_1241511871555.jpg', 'images/200905/goods_img/9_G_1241511871574.jpg', 'images/200905/source_img/9_G_1241511871550.jpg', '1', '', '1', '1', '0', '22', '1241511871', '100', '0', '1', '1', '1', '0', '0', '1492051076', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('10', '3', 'ECS000010', '索爱C702c', '+', '11', '7', '', '7', '0.000', '1593.60', '1328.00', '1250.00', '1243785600', '1277827200', '1', '2008年05月 GSM,850,900,1800,1900 直板', '', '<p>C702可以说是一种在外观上复古的产物，不仅延续T系列早期的直板造型，而且在屏幕和键盘的组合分布上都继承了前辈的精髓。C702的机身尺寸为106&times;48&times;15.5毫米，重量为105克。此外索尼爱立信为C702融入了<font size=\"3\" color=\"#ff0000\"><strong>三防特性，即防尘、防滑和防水溅</strong></font>，这款新的C702搭载了索尼爱立信经典A200平台，界面布局与W908c、K858c一致，典型的特征就是配备左右软键、中央确定键和通话/挂机键。</p>\r\n<p>索尼爱立信C702配备一块<strong><font size=\"3\" color=\"#ff0000\">2.2英寸26万色TFT液晶显示屏</font></strong>，分辨率为240&times;320像素(QVGA)，显示效果属于目前主流水准。C702可以说是索尼爱立信首批<strong><font size=\"3\" color=\"#ff0000\">内置GPS模块</font></strong>的 手机产品之一，C702的搜星、定位一气呵成，十分精准，误差大约在10米之内。基本上定位后可以将有效卫星数量控制在4&mdash;6颗，可以说可以满足我们的需 要了。C702还提供了&ldquo;影像定位&rdquo;功能，配合内置的AGPS全球定位辅助系统，只须启动Geo-Tagging智能影像定位功能，便可将拍摄地点记录在 照片内，方便用户随时查询。</p>\r\n<p>&nbsp;</p>\r\n<p>作为一款Cyber-shot系列影像手机，索尼爱立信C702在拍照功能方面同样有不俗的表现。并且手机内置的<strong><font size=\"3\" color=\"#ff0000\">320万像素摄像头</font></strong>也 同样在拍照功能上也不错的表现。不仅支持自动聚焦和双LED闪光功能，而且还拥有2倍数码变焦、防红眼、Photo fix优画及场景模式等功能。索尼爱立信C702除了配备的是最大光圈为F3.2的4.2毫米镜头之外，该机也如同门中的旗舰C902一样增加了对脸部有 先自动聚焦功能的支持。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/10_thumb_G_1242973436403.jpg', 'images/200905/goods_img/10_G_1242973436141.jpg', 'images/200905/source_img/10_G_1242973436172.jpg', '1', '', '1', '1', '0', '13', '1241965622', '100', '0', '0', '0', '1', '1', '0', '1245290333', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('11', '3', 'ECS000011', '索爱C702c', '+', '0', '7', '', '1', '0.000', '0.00', '1300.00', '0.00', '0', '0', '1', '直板', '', '', '', '', '', '1', '', '0', '1', '0', '0', '1241966951', '100', '1', '0', '0', '0', '0', '0', '1241966960', '7', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('12', '3', 'ECS000012', '摩托罗拉A810', '+', '13', '2', '', '8', '0.000', '1179.60', '983.00', '960.00', '1241107200', '1255104000', '1', 'SMS EMS MMS pda 摄像 智能 音乐 SMS,EMS,MMS', '', '<p>全机使用的材质除去电池盖部分采用了金属以外，其它均使用了ABS工程塑料作为主材，这款手机的三围是105&times;51&times;14毫米，有着100克的轻量级重量，拿在手中的感觉还是非常不错的。A810手机作为一款<strong><font size=\"3\" color=\"#ff0000\">PDA手机</font></strong>在设计的时候取消了键盘配置，一切数字键都要依靠手机内提供的虚拟键盘进行操作，在手机的左上侧是一个<strong><font size=\"3\" color=\"#ff0000\">3.5mm的标准耳机插口</font></strong>，这种设计可以让用户使用自己习惯或者喜欢的耳机去欣赏音乐。</p>\r\n<p>&nbsp;</p>\r\n<p>这款摩托罗拉A810手机配置了一块<font size=\"3\" color=\"#ff0000\"><strong>26万色的2.2英寸TFT全触摸屏幕</strong></font>，其分辨率达到了主流的QVGA水平（240&times;320像素），摩托罗拉A810采用了内部核心为2.6.10的<strong><font size=\"3\" color=\"#ff0000\">LINUX操作系统</font></strong>，菜单上依然采用传统的9宫格的显示方式，一般手机的名片式电话本只能支持诸如电话、邮件、传真、公司等一些基本信息，而A810手机的电话本除了这些还支持公司地址，配偶信息、子女姓名、上司名称、助手等等，对于一款手机来说，电话本不可谓不强大。A810的<strong><font size=\"3\" color=\"#ff0000\">手写识别能力相当的惊人</font></strong>，对连笔、草书和倒插笔的识别率都相当的高，同时还为左右手设置了不同的书写习惯选择，并支持手写速度的调节。</p>\r\n<p>这款A810手机<strong><font size=\"3\" color=\"#ff0000\">内置的音乐播放功能</font></strong>可以支持MP3、WAV、AMR、AAC等格式的音乐播放，<font size=\"3\" color=\"#ff0000\"><strong>支持后台播放</strong></font>。视频方面，这款A810支持MP4、3GP、H.263格式的播放，视频播放器同样简约，操作方便，这款摩托罗拉A810还内置了6款游戏，每一款都有很高的耐玩性，而且都是支持触摸屏操作的，同时这款手机还内置了<strong><font size=\"3\" color=\"#ff0000\">FM收音机</font></strong>，支持自动搜索，并提供了20个频道供用户存储，不过收音机并不支持后台播放。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/12_thumb_G_1241965978410.jpg', 'images/200905/goods_img/12_G_1241965978209.jpg', 'images/200905/source_img/12_G_1241965978878.jpg', '1', '', '1', '1', '0', '9', '1245297652', '100', '0', '0', '1', '0', '1', '0', '1245297670', '3', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('13', '3', 'ECS000013', '诺基亚5320 XpressMusic', '+', '13', '1', '', '8', '0.000', '1573.20', '1311.00', '0.00', '0', '0', '1', '摄像 智能 音乐 蓝色 红色 舒适 直板 中档 2008年07月 黑色 GSM,850,900,1800,1900', '', '<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/13_thumb_G_1241968002527.jpg', 'images/200905/goods_img/13_G_1241968002233.jpg', 'images/200905/source_img/13_G_1241968002732.jpg', '1', '', '1', '1', '0', '13', '1241967762', '100', '0', '0', '0', '1', '0', '0', '1269589198', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('14', '4', 'ECS000014', '诺基亚5800XM', '+', '6', '1', '', '1', '0.000', '3150.00', '2625.00', '0.00', '0', '0', '1', 'GSM 64和弦 2009年2月 320万摄像头 GPS 直板 工程塑料 支持 2008年10月 黑色', '', '', 'images/200905/thumb_img/14_thumb_G_1241968492116.jpg', 'images/200905/goods_img/14_G_1241968492932.jpg', 'images/200905/source_img/14_G_1241968492305.jpg', '1', '', '1', '1', '0', '26', '1241968492', '100', '0', '0', '0', '1', '0', '0', '1269589186', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('15', '3', 'ECS000015', '摩托罗拉A810', '+', '8', '2', '', '3', '0.000', '945.60', '788.00', '0.00', '0', '0', '1', '600 直板 工程塑料 蓝牙 视频拍摄 音乐 黑色 白色', '', '', 'images/200905/thumb_img/15_thumb_G_1242973362970.jpg', 'images/200905/goods_img/15_G_1242973362318.jpg', 'images/200905/source_img/15_G_1242973362751.jpg', '1', '', '1', '1', '0', '5', '1241968703', '100', '1', '0', '1', '1', '0', '0', '1245297631', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('16', '2', 'ECS000016', '恒基伟业G101', '+', '3', '11', '', '0', '0.000', '988.00', '823.33', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/16_thumb_G_1241968949103.jpg', 'images/200905/goods_img/16_G_1241968949002.jpg', 'images/200905/source_img/16_G_1241968949402.jpg', '1', '', '0', '1', '0', '8', '1241968949', '100', '0', '0', '0', '0', '0', '0', '1245290562', '2', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('17', '3', 'ECS000017', '夏新N7', '+', '2', '5', '', '1', '0.000', '2760.00', '2300.00', '0.00', '0', '0', '1', '2008年01月 GSM,900,1800,1900,2100 直板 262144万 240×400 像素 SMS,EMS,MMS,超长信息发送,短消息群发 黑色 CDMA', '', '', 'images/200905/thumb_img/17_thumb_G_1241969394587.jpg', 'images/200905/goods_img/17_G_1241969394677.jpg', 'images/200905/source_img/17_G_1241969394844.jpg', '1', '', '1', '1', '0', '23', '1241969394', '100', '0', '1', '0', '1', '0', '0', '1269589169', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('18', '4', 'ECS000018', '夏新T5', '+', '0', '5', '', '1', '0.000', '3453.60', '2878.00', '0.00', '0', '0', '1', '2008年04月 3G(GSM,900,1800,1900,TD-SCDMA ) 直板 262144万 320×240 像素 是 银色', '', '<p>&nbsp;  TD-SCDMA/GSM两种模式任意切换，中国3G手机先驱，支持大陆特有3G网络，轻松实现可视电话、视频留言、视频会议功能，2.6英寸Q屏，手写、键盘双输入，内置移动证券，支持手机邮箱、手机地图、无驱U盘</p>', '', '', '', '1', '', '1', '1', '0', '28', '1241969533', '100', '1', '0', '0', '0', '0', '0', '1241969533', '2', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('19', '3', 'ECS000019', '三星SGH-F258', '+', '7', '6', '', '12', '0.000', '1029.60', '858.00', '0.00', '0', '0', '1', '滑盖 GSM 258 时尚 蓝牙 黑色 金色 白色', '从整体来看，三星SGH-F258比较时尚可爱，三围尺寸为94×46×17.5mm，重量为96克，曲线柔和具有玲珑美感\r\n', '<p>从整体来看，三星SGH-F258比较<font size=\"3\" color=\"#ff0000\"><strong>时尚</strong></font>可爱，三围尺寸为94&times;46&times;17.5mm，重量为96克，曲线柔和具有玲珑美感。</p>\r\n<p>&nbsp;</p>\r\n<p>三星F258的前面板整体应用<strong><font size=\"3\" color=\"#ff0000\">镜面效果</font></strong>，2.0英寸显示屏幕略显窄小，导航键与功能键在滑盖滑开之前是前面板的全部控制键，没有挂断和接听键，不过，五向键有<font size=\"3\"><strong><font color=\"#ff0000\">音乐操</font><font color=\"#ff0000\">作</font></strong></font>功能，明确显示了F258音乐手机的定位。</p>\r\n<p>&nbsp;</p>\r\n<p>F258的数字键键区采用了极具金属质感的平板式设计，每颗按键的面积足够大，按键与按键之间的间隔明显，操作起来手感舒适。</p>', 'images/200905/thumb_img/19_thumb_G_1241970175208.jpg', 'images/200905/goods_img/19_G_1241970175091.jpg', 'images/200905/source_img/19_G_1241970175549.jpg', '1', '', '1', '1', '0', '8', '1241970139', '100', '0', '1', '1', '1', '0', '0', '1269589154', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('20', '3', 'ECS000020', '三星BC01', '+', '14', '6', '', '12', '0.000', '336.00', '280.00', '238.00', '1241884800', '1251648000', '1', 'GSM 直板 40和弦 金属材质 2008年07月 黑色 GSM,900,1800,1900,2100', '', '', 'images/200905/thumb_img/20_thumb_G_1242106490058.jpg', 'images/200905/goods_img/20_G_1242106490663.jpg', 'images/200905/source_img/20_G_1242106490922.jpg', '1', '', '1', '1', '0', '2', '1241970417', '100', '0', '1', '1', '1', '1', '0', '1269589110', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('21', '3', 'ECS000021', '金立 A30', '+', '4', '10', '', '40', '0.000', '2400.00', '2000.00', '0.00', '0', '0', '1', '2008年03月 GSM,900,1800,1900,2100 直板 1600万 240×400 像素 2007年12月 200万摄像头 黑色', '', '<p>&nbsp;</p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">输入法: 中文输入法</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">短信功能: 支持短信300条和彩信100条</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通话记录：支持电话录音,恢复/静音,双音多频,免提</font></span></p>\r\n<p>&nbsp;</p>\r\n<p><font size=\"3\">高级功能</font></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">内置游戏:智能拼图</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</font></span></p>\r\n<p><span style=\"font-size: medium;\"><font size=\"3\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</font></span></p>', 'images/200905/thumb_img/21_thumb_G_1242109298150.jpg', 'images/200905/goods_img/21_G_1242109298873.jpg', 'images/200905/source_img/21_G_1242109298831.jpg', '1', '', '1', '1', '0', '20', '1241970634', '100', '0', '0', '0', '0', '0', '0', '1269589102', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('22', '3', 'ECS000022', '多普达Touch HD', '+', '15', '3', '', '1', '0.000', '7198.80', '5999.00', '0.00', '0', '0', '1', '500万摄像头 蓝牙 手写 GPS 办公应用 语音拨号 2008年12月 黑色 GSM,850,900,1800,1900 直板', '', '<p><img src=\"http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://www.ouku.com/upimg/ouku/Image/002(1).jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/22_thumb_G_1241971076803.jpg', 'images/200905/goods_img/22_G_1241971076358.jpg', 'images/200905/source_img/22_G_1241971076130.jpg', '1', '', '1', '1', '0', '59', '1241971076', '100', '0', '1', '1', '0', '0', '0', '1269589090', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('23', '5', 'ECS000023', '诺基亚N96', '+', '17', '1', '', '8', '0.000', '4440.00', '3700.00', '0.00', '0', '0', '1', '500万摄像头 microSD 工程塑料 蓝牙 数码相机 内置游戏 滑盖 高档 2008年09月 320×240 像素 黑色', '', '<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p><img alt=\"\" src=\"file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p><img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/23_thumb_G_1241971556399.jpg', 'images/200905/goods_img/23_G_1241971556855.jpg', 'images/200905/source_img/23_G_1241971556256.jpg', '1', '', '1', '1', '0', '37', '1241971488', '100', '0', '1', '1', '0', '0', '0', '1269589078', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('24', '3', 'ECS000024', 'P806', '+', '35', '9', '', '100', '0.000', '2400.00', '2000.00', '1850.00', '1243785600', '1277827200', '1', '旅行充电器 图形菜单 Wap 上网 红外接口 移动 MSN 支持 2008年06月 灰色', '', '<div>\r\n<div>\r\n<div><font size=\"4\">规格参数</font></div>\r\n<p><font size=\"4\"><span>上市时间：</span><span>2008年06月</span></font></p>\r\n<p><font size=\"4\"><span>网络频率：</span><span>GSM/GPRS；900/1800MHz</span></font></p>\r\n<p><font size=\"4\"><span>重　量　：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>尺寸/体积：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>可选颜色：</span><span>银色</span></font></p>\r\n<p><font size=\"4\"><span>屏幕参数：</span><span>26万色TFT彩色屏幕；</span></font></p>\r\n<p><font size=\"4\"><span>WAP上网：</span><span>支持飞笺</span></font></p>\r\n<p><font size=\"4\"><span>基本配置:<em><strong><font size=\"5\" color=\"#ff00ff\">二电(1760毫安) 一充 数据线 耳机 手写笔 512M内存卡</font></strong></em></span></font></p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n<div><font size=\"4\">基本功能</font></div>\r\n<p><font size=\"4\"><span>『时钟』</span><span>『内置振动』</span><span>『录音』</span><span>『可选铃声』</span></font></p>\r\n<p><font size=\"4\"><span>『和弦铃声』</span><span>『MP3铃声』</span><span>『来电铃声识别』</span><span>『来电图片识别』</span></font></p>\r\n<p><font size=\"4\"><span>『情景模式』</span><span>『待机图片』</span><span>『图形菜单』</span><span>『触摸屏』</span></font></p>\r\n<p><span><font size=\"4\">『手写输入』</font></span></p>\r\n<div><font size=\"4\">通信功能</font></div>\r\n<p><font size=\"4\"><span>『双卡双待』</span><span>『内置天线』</span><span>『输入法』</span><span>『中文短信』</span></font></p>\r\n<p><font size=\"4\"><span>『短信群发』</span><span>『多媒体短信』</span><span>『话机通讯录』</span><span>『通话记录』</span></font></p>\r\n<p><font size=\"4\"><span>『免提通话』</span><span>『飞行模式』</span></font></p>\r\n<div><font size=\"4\">多媒体娱乐 :支持3GP、MP4文件播放</font></div>\r\n<p><font size=\"4\"><span>『视频播放』</span><span>『MP3播放器』</span></font></p>\r\n<p><font size=\"4\"><span>多媒体卡扩展：</span><span>支持microSD卡扩展&nbsp;</span></font></p>\r\n<p><font size=\"4\"><span>摄像头：</span><span>内置</span></font></p>\r\n<p><font size=\"4\"><span>摄像头像素：</span><span>30万像素</span></font></p>\r\n<p><font size=\"4\"><span>传感器类型：</span><span>CMOS</span></font></p>\r\n<p><font size=\"4\"><span>变焦模式：</span><span>数码变焦</span></font></p>\r\n<p><font size=\"4\"><span>照片分辨率：</span><span>多种照片分辨率选择</span></font></p>\r\n<p><font size=\"4\"><span>拍摄模式：</span><span>多种拍摄模式选择</span></font></p>\r\n<p><font size=\"4\"><span>照片质量：</span><span>多种照片质量选择</span></font></p>\r\n<p><font size=\"4\"><span>视频拍摄：</span><span>有声视频拍摄</span></font></p>\r\n<div><font size=\"4\">数据传输</font></div>\r\n<p><font size=\"4\"><span>『WAP浏览器』</span><span>『数据线接口』</span></font></p>\r\n<div><font size=\"4\">个人助理</font></div>\r\n<p><font size=\"4\"><span>『闹钟』</span><span>『日历』</span><span>『计算器』</span></font></p>', 'images/200905/thumb_img/24_thumb_G_1241971981429.jpg', 'images/200905/goods_img/24_G_1241971981284.jpg', 'images/200905/source_img/24_G_1241971981107.jpg', '1', '', '1', '1', '0', '20', '1241971981', '100', '0', '1', '1', '1', '1', '0', '1269589064', '9', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('25', '13', 'ECS000025', '小灵通/固话50元充值卡', '+', '0', '0', '', '2', '0.000', '57.59', '48.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/25_thumb_G_1241972709885.jpg', 'images/200905/goods_img/25_G_1241972709544.jpg', 'images/200905/source_img/25_G_1241972709750.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241972709', '100', '0', '1', '0', '1', '0', '0', '1245047546', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('26', '13', 'ECS000026', '小灵通/固话20元充值卡', '+', '0', '0', '', '2', '0.000', '22.80', '19.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/26_thumb_G_1241972789393.jpg', 'images/200905/goods_img/26_G_1241972789293.jpg', 'images/200905/source_img/26_G_1241972789353.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241972789', '100', '0', '0', '0', '1', '0', '0', '1245047540', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('27', '15', 'ECS000027', '联通100元充值卡', '+', '0', '0', '', '2', '0.000', '100.00', '95.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/27_thumb_G_1241972894068.jpg', 'images/200905/goods_img/27_G_1241972894061.jpg', 'images/200905/source_img/27_G_1241972894069.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241972894', '100', '0', '1', '1', '1', '0', '0', '1245047557', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('28', '15', 'ECS000028', '联通50元充值卡', '+', '0', '0', '', '0', '0.000', '50.00', '45.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/28_thumb_G_1241972976986.jpg', 'images/200905/goods_img/28_G_1241972976313.jpg', 'images/200905/source_img/28_G_1241972976695.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241972976', '100', '0', '0', '0', '1', '0', '0', '1245047542', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('29', '14', 'ECS000029', '移动100元充值卡', '+', '0', '0', '', '0', '0.000', '0.00', '90.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/29_thumb_G_1241973022239.jpg', 'images/200905/goods_img/29_G_1241973022206.jpg', 'images/200905/source_img/29_G_1241973022514.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241973022', '100', '0', '1', '0', '1', '0', '0', '1245047543', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('30', '14', 'ECS000030', '移动20元充值卡', '+', '1', '0', '', '9', '0.000', '21.00', '18.00', '0.00', '0', '0', '1', '', '', '', 'images/200905/thumb_img/30_thumb_G_1241973114800.jpg', 'images/200905/goods_img/30_G_1241973114234.jpg', 'images/200905/source_img/30_G_1241973114587.jpg', '0', 'virtual_card', '1', '1', '0', '0', '1241973114', '100', '0', '1', '0', '1', '0', '0', '1245047549', '0', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('31', '3', 'ECS000031', '摩托罗拉E8 ', '+', '5', '2', '', '1', '0.000', '1604.39', '1337.00', '0.00', '0', '0', '1', '直板', '', '', 'images/200905/thumb_img/31_thumb_G_1242110412996.jpg', 'images/200905/goods_img/31_G_1242110412332.jpg', 'images/200905/source_img/31_G_1242110412519.jpg', '1', '', '0', '1', '0', '13', '1242110412', '100', '0', '0', '0', '0', '0', '0', '1242140652', '7', '', '-1', '-1', null, null);
INSERT INTO `db_goods` VALUES ('32', '3', 'ECS000032', '诺基亚N85', '+', '9', '1', '', '4', '0.000', '3612.00', '3010.00', '2750.00', '1243785600', '1417276800', '1', '2008年10月 GSM,850,900,1800,1900 黑色', '', '<p>诺基亚N85参数</p>\r\n<div>&nbsp;</div>\r\n<div>\r\n<table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n    <tbody>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本参数</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机昵称</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">N85</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">上市日期</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2008年10月</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机类型</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">3G手机；拍照手机；智能手机</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机制式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">支持频段</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM850/900/1800/1900MHz</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据传输</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GPRS、EDGE</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕材质</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">AMOLED</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕色彩</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1600万色</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2.6英寸</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏参数</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">QVGA 320&times;240像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">铃音描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">可选MP3、WAV、AAC或和弦Midi铃声等格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">操作系统</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">Symbian OS v9.3操作系统与S60 v3.2平台的组合</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">机身内存</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">74MB 内部动态存储空间<br />\r\n            78MB 内置NAND闪存</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">存储卡</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持MicroSD(T-Flash)卡扩展最大至8GB</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">电池规格</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1200毫安时锂电池</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">标配</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">诺基亚 N85<br />\r\n            诺基亚电池（BL-5K）<br />\r\n            诺基亚旅行充电器（AC-10）<br />\r\n            诺基亚视频数据线（CA-75U）<br />\r\n            诺基亚数据线（CA-101）<br />\r\n            诺基亚音乐耳机（HS-45、AD-54）<br />\r\n            诺基亚 8 GB microSD 卡（MU-43）<br />\r\n            《用户手册》<br />\r\n            《快速入门》</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论通话时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">6.9 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论待机时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">363 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>产品外形</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">外观设计</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双向滑盖</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">103&times;50&times;16mm<br />\r\n            体积：76 立方厘米</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机重量</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">128克</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品天线</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>拍照功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">定时器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头像素</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">500万像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">连拍功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">LED闪光灯</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双LED 闪光灯</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数码变焦</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">20 倍数码变焦</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍摄模式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">静止、连拍、自动定时器、摄像</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">照片特效</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">正常、怀旧、黑白、负片、逼真</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍照描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持最大2592&times;1944分辨率照片拍摄<br />\r\n            支持JPEG、Exif格式<br />\r\n            白平衡模式：自动、阳光、阴天、白炽灯、荧光灯<br />\r\n            感光度模式：高、中、低、自动</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频拍摄</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">最高支持640 x 480 像素（VGA）、30 帧/秒</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>娱乐功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">收音机</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">TV-OUT</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">录音功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子书</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置RealPlayer播放器, 支持MPEG4、H.264/AVC、H.263/3GP、RealVideo等视频格式全屏播放</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">音乐播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置播放器, 支持mp3、.wma、.aac、eAAC、eAAC+格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">游戏</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Java功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持Java MIDP 2.0 CLDC 1.1</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Flash功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">第3.0版Flash lite播放器</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>数据功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">蓝牙功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据线接口</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">USB数据线 3.5mm立体声耳机插孔</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">短信(SMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">彩信(MMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">免提通话</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">情景模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">闹钟功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日历功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">输入方式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">键盘</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通话记录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">未接来电+已接来电+已拨电话记录</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通讯录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">S60标准化名片式通讯录</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>网络功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子邮件</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WWW浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WAP浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>商务功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">飞行模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">语音拨号</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">备忘录</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日程表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">世界时间</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>其他功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">GPS功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子词典</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">待机图片</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">计算器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电铃声识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电图片识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电防火墙</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">动画屏保</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">图形菜单</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">秒表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">单位换算</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" align=\"middle\" style=\"padding: 2px; float: none;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/32_thumb_G_1242110760196.jpg', 'images/200905/goods_img/32_G_1242110760868.jpg', 'images/200905/source_img/32_G_1242110760437.jpg', '1', '', '1', '1', '0', '30', '1242110760', '100', '0', '0', '1', '1', '1', '0', '1269589051', '9', '', '-1', '-1', null, null);

-- ----------------------------
-- Table structure for `db_goods_activity`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods_activity`;
CREATE TABLE `db_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_goods_activity
-- ----------------------------
INSERT INTO `db_goods_activity` VALUES ('1', '夺宝奇兵之诺基亚N96', '新一轮的夺宝开始了\n本期是 诺基亚n96', '0', '23', '0', '诺基亚N96', '1242107580', '1242193980', '0', 'a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}');
INSERT INTO `db_goods_activity` VALUES ('2', '夺宝奇兵之夏新N7', '本期的夺宝奖品是 夏新N7', '0', '17', '0', '夏新N7', '1242107820', '1250661420', '0', 'a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}');
INSERT INTO `db_goods_activity` VALUES ('3', 'P806', '本期团购活动——联想新品P806\n团购买的多优惠多', '1', '24', '0', 'P806', '1241971200', '1242403200', '3', 'a:4:{s:12:\"price_ladder\";a:3:{i:0;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:1850;}i:1;a:2:{s:6:\"amount\";i:15;s:5:\"price\";d:1800;}i:2;a:2:{s:6:\"amount\";i:20;s:5:\"price\";d:1780;}}s:15:\"restrict_amount\";i:0;s:13:\"gift_integral\";i:0;s:7:\"deposit\";d:1000;}');
INSERT INTO `db_goods_activity` VALUES ('4', '拍卖活动——索爱C702c', '', '2', '10', '0', '索爱C702c', '1242144000', '1242403200', '0', 'a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:20;s:6:\"no_top\";i:1;}');
INSERT INTO `db_goods_activity` VALUES ('5', '摩托罗拉E8 大礼包', '礼包大优惠', '4', '31', '0', '摩托罗拉E8 ', '1242110400', '1252046400', '0', 'a:1:{s:13:\"package_price\";s:4:\"1430\";}');
INSERT INTO `db_goods_activity` VALUES ('6', '诺基亚N85大礼包', '诺基亚N85超值大礼包', '4', '32', '0', '诺基亚N85', '1242110760', '1248936360', '0', 'a:1:{s:13:\"package_price\";s:4:\"3150\";}');
INSERT INTO `db_goods_activity` VALUES ('7', '拍卖活动——索爱C702c(第2期)', '拍卖活动————索爱C702c （第2期）', '2', '10', '0', '索爱C702c', '1241712000', '1274803200', '0', 'a:5:{s:7:\"deposit\";d:50;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:50;s:6:\"no_top\";i:1;}');
INSERT INTO `db_goods_activity` VALUES ('8', 'P806', '团购第2期', '1', '24', '0', 'P806', '1242316800', '1274803200', '0', 'a:4:{s:12:\"price_ladder\";a:2:{i:0;a:2:{s:6:\"amount\";i:5;s:5:\"price\";d:1910;}i:1;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:1860;}}s:15:\"restrict_amount\";i:0;s:13:\"gift_integral\";i:0;s:7:\"deposit\";d:1000;}');

-- ----------------------------
-- Table structure for `db_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods_attr`;
CREATE TABLE `db_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='管理商品属性';

-- ----------------------------
-- Records of db_goods_attr
-- ----------------------------
INSERT INTO `db_goods_attr` VALUES ('238', '1', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `db_goods_attr` VALUES ('237', '1', '185', '灰色', '');
INSERT INTO `db_goods_attr` VALUES ('236', '1', '191', '支持', '0');
INSERT INTO `db_goods_attr` VALUES ('235', '1', '190', '支持', '0');
INSERT INTO `db_goods_attr` VALUES ('234', '1', '189', '2.4英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('233', '1', '172', '2008年04月', '0');
INSERT INTO `db_goods_attr` VALUES ('228', '9', '178', '滑盖', '0');
INSERT INTO `db_goods_attr` VALUES ('227', '9', '185', '白色', '0');
INSERT INTO `db_goods_attr` VALUES ('226', '9', '185', '黑色', '10');
INSERT INTO `db_goods_attr` VALUES ('232', '8', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('231', '8', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('230', '8', '190', '支持', '0');
INSERT INTO `db_goods_attr` VALUES ('229', '8', '189', '1.75英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('217', '13', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('216', '13', '189', '2.0英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('215', '13', '172', '2008年07月', '0');
INSERT INTO `db_goods_attr` VALUES ('225', '10', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('221', '13', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('222', '10', '172', '2008年05月', '0');
INSERT INTO `db_goods_attr` VALUES ('223', '10', '189', '2.2英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('224', '10', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `db_goods_attr` VALUES ('220', '13', '175', '300小时', '0');
INSERT INTO `db_goods_attr` VALUES ('219', '13', '174', '4小时', '0');
INSERT INTO `db_goods_attr` VALUES ('212', '14', '172', '2008年10月', '0');
INSERT INTO `db_goods_attr` VALUES ('213', '14', '185', '黑色', '0');
INSERT INTO `db_goods_attr` VALUES ('214', '14', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('218', '13', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `db_goods_attr` VALUES ('211', '15', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('210', '15', '210', '线控耳机', '50');
INSERT INTO `db_goods_attr` VALUES ('200', '17', '189', '2.8英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('201', '17', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('202', '17', '173', 'CDMA', '0');
INSERT INTO `db_goods_attr` VALUES ('203', '17', '174', '8小时', '0');
INSERT INTO `db_goods_attr` VALUES ('204', '17', '175', '300小时', '0');
INSERT INTO `db_goods_attr` VALUES ('205', '17', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('206', '15', '189', '2.2英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('207', '15', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('208', '15', '185', '白色', '20');
INSERT INTO `db_goods_attr` VALUES ('209', '15', '210', '数据线', '20');
INSERT INTO `db_goods_attr` VALUES ('196', '19', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('197', '19', '185', '金色', '10');
INSERT INTO `db_goods_attr` VALUES ('198', '19', '185', '白色', '20');
INSERT INTO `db_goods_attr` VALUES ('199', '19', '178', '滑盖', '0');
INSERT INTO `db_goods_attr` VALUES ('195', '20', '173', 'GSM,900,1800,1900,2100', '0');
INSERT INTO `db_goods_attr` VALUES ('193', '20', '172', '2008年07月', '0');
INSERT INTO `db_goods_attr` VALUES ('194', '20', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('187', '21', '180', 'T-Flash', '0');
INSERT INTO `db_goods_attr` VALUES ('189', '21', '210', '线控耳机', '50');
INSERT INTO `db_goods_attr` VALUES ('188', '21', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('186', '22', '178', '直板', '0');
INSERT INTO `db_goods_attr` VALUES ('182', '22', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('183', '22', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `db_goods_attr` VALUES ('184', '22', '174', '6.5小时', '0');
INSERT INTO `db_goods_attr` VALUES ('185', '22', '175', '450小时', '0');
INSERT INTO `db_goods_attr` VALUES ('181', '22', '181', '288MB', '0');
INSERT INTO `db_goods_attr` VALUES ('180', '22', '180', 'microSD', '0');
INSERT INTO `db_goods_attr` VALUES ('179', '22', '172', '2008年12月', '0');
INSERT INTO `db_goods_attr` VALUES ('192', '21', '175', '100小时', '0');
INSERT INTO `db_goods_attr` VALUES ('191', '21', '174', '2.5小时', '0');
INSERT INTO `db_goods_attr` VALUES ('178', '23', '178', '滑盖', '0');
INSERT INTO `db_goods_attr` VALUES ('190', '21', '210', '数据线', '20');
INSERT INTO `db_goods_attr` VALUES ('176', '23', '174', '2.5小时', '0');
INSERT INTO `db_goods_attr` VALUES ('177', '23', '175', '200小时', '0');
INSERT INTO `db_goods_attr` VALUES ('173', '23', '188', '320×240 像素', '0');
INSERT INTO `db_goods_attr` VALUES ('174', '23', '189', '2.8英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('175', '23', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('172', '23', '182', 'Symbian OS 9.3操作系统', '0');
INSERT INTO `db_goods_attr` VALUES ('171', '23', '181', '256MB', '0');
INSERT INTO `db_goods_attr` VALUES ('170', '23', '172', '2008年09月', '0');
INSERT INTO `db_goods_attr` VALUES ('169', '24', '179', 'SMS', '0');
INSERT INTO `db_goods_attr` VALUES ('166', '24', '190', '支持', '0');
INSERT INTO `db_goods_attr` VALUES ('167', '24', '185', '灰色', '');
INSERT INTO `db_goods_attr` VALUES ('168', '24', '210', '数据线', '20');
INSERT INTO `db_goods_attr` VALUES ('165', '24', '183', '支持', '0');
INSERT INTO `db_goods_attr` VALUES ('164', '24', '172', '2008年06月', '0');
INSERT INTO `db_goods_attr` VALUES ('152', '32', '172', '2008年10月', '0');
INSERT INTO `db_goods_attr` VALUES ('153', '32', '180', 'MicroSD', '0');
INSERT INTO `db_goods_attr` VALUES ('154', '32', '181', '78MB', '0');
INSERT INTO `db_goods_attr` VALUES ('155', '32', '182', 'Symbian OS v9.3', '0');
INSERT INTO `db_goods_attr` VALUES ('156', '32', '189', '2.6英寸', '0');
INSERT INTO `db_goods_attr` VALUES ('157', '32', '210', '线控耳机', '50');
INSERT INTO `db_goods_attr` VALUES ('158', '32', '210', '蓝牙耳机', '100');
INSERT INTO `db_goods_attr` VALUES ('159', '32', '210', '数据线', '12');
INSERT INTO `db_goods_attr` VALUES ('160', '32', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `db_goods_attr` VALUES ('161', '32', '174', '6.9 小时', '0');
INSERT INTO `db_goods_attr` VALUES ('162', '32', '175', '363 小时', '0');
INSERT INTO `db_goods_attr` VALUES ('163', '32', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('239', '10', '185', '黑色', '');
INSERT INTO `db_goods_attr` VALUES ('240', '10', '185', '白色', '');

-- ----------------------------
-- Table structure for `db_goods_cat`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods_cat`;
CREATE TABLE `db_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_goods_cat
-- ----------------------------
INSERT INTO `db_goods_cat` VALUES ('8', '2');
INSERT INTO `db_goods_cat` VALUES ('8', '5');
INSERT INTO `db_goods_cat` VALUES ('16', '3');
INSERT INTO `db_goods_cat` VALUES ('16', '5');

-- ----------------------------
-- Table structure for `db_goods_gallery`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods_gallery`;
CREATE TABLE `db_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_goods_gallery
-- ----------------------------
INSERT INTO `db_goods_gallery` VALUES ('1', '1', 'images/200905/goods_img/1_P_1240902890730.gif', '', 'images/200905/thumb_img/1_thumb_P_1240902890139.jpg', 'images/200905/source_img/1_P_1240902890193.gif');
INSERT INTO `db_goods_gallery` VALUES ('2', '1', 'images/200905/goods_img/1_P_1240904370445.jpg', '', 'images/200905/thumb_img/1_thumb_P_1240904370846.jpg', 'images/200905/source_img/1_P_1240904370647.jpg');
INSERT INTO `db_goods_gallery` VALUES ('3', '1', 'images/200905/goods_img/1_P_1240904371414.jpg', '', 'images/200905/thumb_img/1_thumb_P_1240904371539.jpg', 'images/200905/source_img/1_P_1240904371019.jpg');
INSERT INTO `db_goods_gallery` VALUES ('4', '1', 'images/200905/goods_img/1_P_1240904371355.jpg', '', 'images/200905/thumb_img/1_thumb_P_1240904371335.jpg', 'images/200905/source_img/1_P_1240904371118.jpg');
INSERT INTO `db_goods_gallery` VALUES ('5', '1', 'images/200905/goods_img/1_P_1240904371252.jpg', '', 'images/200905/thumb_img/1_thumb_P_1240904371430.jpg', 'images/200905/source_img/1_P_1240904371758.jpg');
INSERT INTO `db_goods_gallery` VALUES ('6', '3', 'images/200905/goods_img/3_P_1241422082461.jpg', '', 'images/200905/thumb_img/3_thumb_P_1241422082160.jpg', 'images/200905/source_img/3_P_1241422082816.jpg');
INSERT INTO `db_goods_gallery` VALUES ('7', '4', 'images/200905/goods_img/4_P_1241422402169.jpg', '', 'images/200905/thumb_img/4_thumb_P_1241422402909.jpg', 'images/200905/source_img/4_P_1241422402362.jpg');
INSERT INTO `db_goods_gallery` VALUES ('8', '5', 'images/200905/goods_img/5_P_1241422518168.jpg', '', 'images/200905/thumb_img/5_thumb_P_1241422518416.jpg', 'images/200905/source_img/5_P_1241422518314.jpg');
INSERT INTO `db_goods_gallery` VALUES ('9', '7', 'images/200905/goods_img/7_P_1241422785926.jpg', '', 'images/200905/thumb_img/7_thumb_P_1241422785889.jpg', 'images/200905/source_img/7_P_1241422785172.jpg');
INSERT INTO `db_goods_gallery` VALUES ('10', '8', 'images/200905/goods_img/8_P_1241425513388.jpg', '', 'images/200905/thumb_img/8_thumb_P_1241425513834.jpg', 'images/200905/source_img/8_P_1241425513810.jpg');
INSERT INTO `db_goods_gallery` VALUES ('11', '8', 'images/200905/goods_img/8_P_1241425891781.JPG', '正面', 'images/200905/thumb_img/8_thumb_P_1241425891460.jpg', 'images/200905/source_img/8_P_1241425891321.JPG');
INSERT INTO `db_goods_gallery` VALUES ('12', '8', 'images/200905/goods_img/8_P_1241425891193.jpg', '背面', 'images/200905/thumb_img/8_thumb_P_1241425892547.jpg', 'images/200905/source_img/8_P_1241425891588.jpg');
INSERT INTO `db_goods_gallery` VALUES ('13', '8', 'images/200905/goods_img/8_P_1241425892941.JPG', '侧面', 'images/200905/thumb_img/8_thumb_P_1241425892356.jpg', 'images/200905/source_img/8_P_1241425892999.JPG');
INSERT INTO `db_goods_gallery` VALUES ('14', '9', 'images/200905/goods_img/9_P_1241511871575.jpg', '', 'images/200905/thumb_img/9_thumb_P_1241511871787.jpg', 'images/200905/source_img/9_P_1241511871749.jpg');
INSERT INTO `db_goods_gallery` VALUES ('15', '12', 'images/200905/goods_img/12_P_1241965978060.jpg', '', 'images/200905/thumb_img/12_thumb_P_1241965978845.jpg', 'images/200905/source_img/12_P_1241965978333.jpg');
INSERT INTO `db_goods_gallery` VALUES ('16', '12', 'images/200905/goods_img/12_P_1241966218046.jpg', '', 'images/200905/thumb_img/12_thumb_P_1241966218835.jpg', 'images/200905/source_img/12_P_1241966218225.jpg');
INSERT INTO `db_goods_gallery` VALUES ('17', '12', 'images/200905/goods_img/12_P_1241966218391.jpg', '', 'images/200905/thumb_img/12_thumb_P_1241966218843.jpg', 'images/200905/source_img/12_P_1241966218859.jpg');
INSERT INTO `db_goods_gallery` VALUES ('18', '13', 'images/200905/goods_img/13_P_1241967762510.jpg', '', 'images/200905/thumb_img/13_thumb_P_1241967762510.jpg', 'images/200905/source_img/13_P_1241967762358.jpg');
INSERT INTO `db_goods_gallery` VALUES ('19', '13', 'images/200905/goods_img/13_P_1241968002659.jpg', '', 'images/200905/thumb_img/13_thumb_P_1241968002193.jpg', 'images/200905/source_img/13_P_1241968002709.jpg');
INSERT INTO `db_goods_gallery` VALUES ('20', '14', 'images/200905/goods_img/14_P_1241968492774.jpg', '', 'images/200905/thumb_img/14_thumb_P_1241968492168.jpg', 'images/200905/source_img/14_P_1241968492973.jpg');
INSERT INTO `db_goods_gallery` VALUES ('21', '14', 'images/200905/goods_img/14_P_1241968492721.jpg', '', 'images/200905/thumb_img/14_thumb_P_1241968492995.jpg', 'images/200905/source_img/14_P_1241968492307.jpg');
INSERT INTO `db_goods_gallery` VALUES ('22', '14', 'images/200905/goods_img/14_P_1241968492279.jpg', '', 'images/200905/thumb_img/14_thumb_P_1241968492674.jpg', 'images/200905/source_img/14_P_1241968492392.jpg');
INSERT INTO `db_goods_gallery` VALUES ('23', '16', 'images/200905/goods_img/16_P_1241968949498.jpg', '', 'images/200905/thumb_img/16_thumb_P_1241968949965.jpg', 'images/200905/source_img/16_P_1241968949069.jpg');
INSERT INTO `db_goods_gallery` VALUES ('24', '17', 'images/200905/goods_img/17_P_1241969394354.jpg', '', 'images/200905/thumb_img/17_thumb_P_1241969394537.jpg', 'images/200905/source_img/17_P_1241969394369.jpg');
INSERT INTO `db_goods_gallery` VALUES ('25', '19', 'images/200905/goods_img/19_P_1241970140820.jpg', '', 'images/200905/thumb_img/19_thumb_P_1241970140527.jpg', 'images/200905/source_img/19_P_1241970139925.jpg');
INSERT INTO `db_goods_gallery` VALUES ('26', '19', 'images/200905/goods_img/19_P_1241970140600.jpg', '', 'images/200905/thumb_img/19_thumb_P_1241970140229.jpg', 'images/200905/source_img/19_P_1241970140187.jpg');
INSERT INTO `db_goods_gallery` VALUES ('27', '19', 'images/200905/goods_img/19_P_1241970175007.jpg', '', 'images/200905/thumb_img/19_thumb_P_1241970175086.jpg', 'images/200905/source_img/19_P_1241970175028.jpg');
INSERT INTO `db_goods_gallery` VALUES ('28', '22', 'images/200905/goods_img/22_P_1241971076061.jpg', '', 'images/200905/thumb_img/22_thumb_P_1241971076595.jpg', 'images/200905/source_img/22_P_1241971076696.jpg');
INSERT INTO `db_goods_gallery` VALUES ('29', '23', 'images/200905/goods_img/23_P_1241971556661.jpg', '', 'images/200905/thumb_img/23_thumb_P_1241971556920.jpg', 'images/200905/source_img/23_P_1241971556122.jpg');
INSERT INTO `db_goods_gallery` VALUES ('30', '24', 'images/200905/goods_img/24_P_1241971981420.jpg', '', 'images/200905/thumb_img/24_thumb_P_1241971981834.jpg', 'images/200905/source_img/24_P_1241971981824.jpg');
INSERT INTO `db_goods_gallery` VALUES ('31', '25', 'images/200905/goods_img/25_P_1241972709888.jpg', '', 'images/200905/thumb_img/25_thumb_P_1241972709070.jpg', 'images/200905/source_img/25_P_1241972709222.jpg');
INSERT INTO `db_goods_gallery` VALUES ('32', '26', 'images/200905/goods_img/26_P_1241972789025.jpg', '', 'images/200905/thumb_img/26_thumb_P_1241972789061.jpg', 'images/200905/source_img/26_P_1241972789731.jpg');
INSERT INTO `db_goods_gallery` VALUES ('33', '27', 'images/200905/goods_img/27_P_1241972894128.jpg', '', 'images/200905/thumb_img/27_thumb_P_1241972894915.jpg', 'images/200905/source_img/27_P_1241972894886.jpg');
INSERT INTO `db_goods_gallery` VALUES ('34', '28', 'images/200905/goods_img/28_P_1241972976099.jpg', '', 'images/200905/thumb_img/28_thumb_P_1241972976277.jpg', 'images/200905/source_img/28_P_1241972976150.jpg');
INSERT INTO `db_goods_gallery` VALUES ('35', '29', 'images/200905/goods_img/29_P_1241973022876.jpg', '', 'images/200905/thumb_img/29_thumb_P_1241973022886.jpg', 'images/200905/source_img/29_P_1241973022880.jpg');
INSERT INTO `db_goods_gallery` VALUES ('36', '30', 'images/200905/goods_img/30_P_1241973114554.jpg', '', 'images/200905/thumb_img/30_thumb_P_1241973114166.jpg', 'images/200905/source_img/30_P_1241973114795.jpg');
INSERT INTO `db_goods_gallery` VALUES ('38', '20', 'images/200905/goods_img/20_P_1242106490582.jpg', '', 'images/200905/thumb_img/20_thumb_P_1242106490836.jpg', 'images/200905/source_img/20_P_1242106490796.jpg');
INSERT INTO `db_goods_gallery` VALUES ('39', '21', 'images/200905/goods_img/21_P_1242109298519.jpg', '', 'images/200905/thumb_img/21_thumb_P_1242109298525.jpg', 'images/200905/source_img/21_P_1242109298459.jpg');
INSERT INTO `db_goods_gallery` VALUES ('40', '31', 'images/200905/goods_img/31_P_1242110412503.jpg', '', 'images/200905/thumb_img/31_thumb_P_1242110412614.jpg', 'images/200905/source_img/31_P_1242110412152.jpg');
INSERT INTO `db_goods_gallery` VALUES ('41', '32', 'images/200905/goods_img/32_P_1242110760641.jpg', '', 'images/200905/thumb_img/32_thumb_P_1242110760997.jpg', 'images/200905/source_img/32_P_1242110760203.jpg');
INSERT INTO `db_goods_gallery` VALUES ('42', '15', 'images/200905/goods_img/15_P_1242973362276.jpg', '', 'images/200905/thumb_img/15_thumb_P_1242973362611.jpg', 'images/200905/source_img/15_P_1242973362172.jpg');
INSERT INTO `db_goods_gallery` VALUES ('43', '10', 'images/200905/goods_img/10_P_1242973436620.jpg', '', 'images/200905/thumb_img/10_thumb_P_1242973436219.jpg', 'images/200905/source_img/10_P_1242973436898.jpg');

-- ----------------------------
-- Table structure for `db_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `db_goods_type`;
CREATE TABLE `db_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `is_enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理商品类型';

-- ----------------------------
-- Records of db_goods_type
-- ----------------------------
INSERT INTO `db_goods_type` VALUES ('1', '书', '1', '1\r\n2');
INSERT INTO `db_goods_type` VALUES ('2', '音乐', '1', '');
INSERT INTO `db_goods_type` VALUES ('3', '电影', '1', '');
INSERT INTO `db_goods_type` VALUES ('4', '手机', '1', '');
INSERT INTO `db_goods_type` VALUES ('5', '笔记本电脑', '1', '');
INSERT INTO `db_goods_type` VALUES ('6', '数码相机', '1', '');
INSERT INTO `db_goods_type` VALUES ('7', '数码摄像机', '1', '');
INSERT INTO `db_goods_type` VALUES ('8', '化妆品', '1', '');
INSERT INTO `db_goods_type` VALUES ('9', '精品手机', '1', '');

-- ----------------------------
-- Table structure for `db_group_goods`
-- ----------------------------
DROP TABLE IF EXISTS `db_group_goods`;
CREATE TABLE `db_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_group_goods
-- ----------------------------
INSERT INTO `db_group_goods` VALUES ('9', '4', '58.00', '1');
INSERT INTO `db_group_goods` VALUES ('9', '3', '68.00', '1');
INSERT INTO `db_group_goods` VALUES ('9', '7', '100.00', '1');
INSERT INTO `db_group_goods` VALUES ('14', '5', '20.00', '1');
INSERT INTO `db_group_goods` VALUES ('14', '6', '42.00', '1');
INSERT INTO `db_group_goods` VALUES ('14', '7', '100.00', '1');

-- ----------------------------
-- Table structure for `db_navigator`
-- ----------------------------
DROP TABLE IF EXISTS `db_navigator`;
CREATE TABLE `db_navigator` (
  `nav_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cat_id` smallint(5) unsigned DEFAULT NULL,
  `nav_name` varchar(60) NOT NULL,
  `nav_url` varchar(255) NOT NULL,
  `view_order` tinyint(2) NOT NULL DEFAULT '50',
  `if_show` tinyint(1) NOT NULL DEFAULT '0',
  `open_new` tinyint(1) NOT NULL DEFAULT '0',
  `nav_type` varchar(20) NOT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`),
  KEY `type` (`nav_type`),
  KEY `ifshow` (`if_show`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='管理导航栏';

-- ----------------------------
-- Records of db_navigator
-- ----------------------------
INSERT INTO `db_navigator` VALUES ('1', 'f', null, '查看购物车', 'flow.php', '50', '1', '0', 'top', '0');
INSERT INTO `db_navigator` VALUES ('2', 'f', null, '选购中心', 'pick_out.php', '50', '1', '0', 'top', '0');
INSERT INTO `db_navigator` VALUES ('3', 'f', null, '团购商品', 'group_buy.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('4', 'f', null, '夺宝奇兵', 'snatch.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('5', 'f', null, '标签云', 'tag_cloud.php', '50', '1', '0', 'top', '0');
INSERT INTO `db_navigator` VALUES ('6', 'f', null, '用户中心', 'user.php', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('7', 'f', null, '批发方案', 'wholesale.php', '50', '1', '0', 'bottom', '0');
INSERT INTO `db_navigator` VALUES ('8', 'f', null, '优惠活动', 'activity.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('9', 'f', null, '配送方式', 'myship.php', '50', '1', '0', 'bottom', '0');
INSERT INTO `db_navigator` VALUES ('10', 'f', null, '留言板', 'message.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('11', 'f', null, '报价单', 'quotation.php', '50', '1', '0', 'top', '0');
INSERT INTO `db_navigator` VALUES ('12', 'f', null, '拍卖活动', 'auction.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('13', 'f', null, '积分商城', 'exchange.php', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('14', 'o', null, '论坛', 'http://www.greenzn.com', '50', '0', '1', 'middle', '1');
INSERT INTO `db_navigator` VALUES ('15', 'o', null, '官网', 'http://www.greenzn.com', '50', '0', '1', 'middle', '1');
INSERT INTO `db_navigator` VALUES ('16', 'a', '1', '系统分类', 'article_cat.php?cat_id=1', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('17', 'a', '2', '网店信息', 'article_cat.php?cat_id=2', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('18', 'a', '3', '网店帮助分类', 'article_cat.php?cat_id=3', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('19', 'a', '4', '3G资讯', 'article_cat.php?cat_id=4', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('20', 'a', '5', '新手上路', 'article_cat.php?cat_id=5', '50', '1', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('21', 'a', '6', '手机常识', 'article_cat.php?cat_id=6', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('22', 'a', '7', '配送与支付', 'article_cat.php?cat_id=7', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('23', 'a', '8', '服务保证', 'article_cat.php?cat_id=8', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('24', 'a', '9', '联系我们', 'article_cat.php?cat_id=9', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('25', 'a', '10', '会员中心', 'article_cat.php?cat_id=10', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('26', 'a', '11', '手机促销', 'article_cat.php?cat_id=11', '50', '0', '0', 'middle', '0');
INSERT INTO `db_navigator` VALUES ('27', 'a', '12', '站内快讯', 'article_cat.php?cat_id=12', '50', '1', '0', 'middle', '0');

-- ----------------------------
-- Table structure for `db_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `db_order_info`;
CREATE TABLE `db_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_order_info
-- ----------------------------
INSERT INTO `db_order_info` VALUES ('1', '2009051298180', '1', '1', '2', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '法院', '', '5', '申通快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '385.00', '15.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1242142274', '1242142274', '1242142274', '1242142432', '0', '0', '0', '122', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('2', '2009051255518', '1', '4', '0', '0', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '法院', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '精品包装', '祝福贺卡', '晚来的祝福', '', '', '960.00', '10.00', '0.00', '0.00', '0.00', '5.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1242142324', '1242142324', '1242142324', '1242142389', '1', '1', '0', '111', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('3', '2009051267570', '1', '4', '0', '0', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '法院', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '2300.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1242142549', '1242142549', '1242142549', '1242142589', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('4', '2009051230249', '1', '1', '0', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '法院', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '5999.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5989.00', '0', '0.00', '20.00', '0.00', '0', '本站', '1242142681', '1242142681', '1242142681', '0', '0', '0', '1', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('5', '2009051276258', '1', '1', '3', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '法院', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '8600.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8610.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1242142808', '1242142808', '1242142808', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('6', '2009051217221', '3', '3', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '', '', '5', '申通快递', '2', '银行汇款/转帐', '等待所有商品备齐后再发', '', '', '', '', '', '', '20.00', '15.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '35.00', '0', '', '1242143292', '0', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('7', '2009051227085', '3', '1', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '', '', '5', '申通快递', '2', '银行汇款/转帐', '等待所有商品备齐后再发', '', '', '', '', '', '', '2298.00', '15.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '0', '0.00', '0.00', '1198.10', '0', '', '1242143383', '1242143454', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '114.90');
INSERT INTO `db_order_info` VALUES ('8', '2009051299732', '3', '0', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '', '', '5', '申通快递', '2', '银行汇款/转帐', '等待所有商品备齐后再发', '', '', '', '', '', '', '623.00', '15.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '638.00', '0', '', '1242143444', '0', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('9', '2009051210718', '3', '0', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '', '', '5', '申通快递', '2', '银行汇款/转帐', '等待所有商品备齐后再发', '', '', '', '', '', '', '2000.00', '15.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2015.00', '0', '', '1242143732', '0', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('10', '2009051268194', '1', '1', '0', '2', '刘先生', '1', '2', '52', '500', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10.00', '17000', '0.00', '0.00', '0.00', '0', '', '1242143920', '1242143920', '1242143920', '0', '0', '0', '0', '', 'exchange_goods', '24', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('11', '2009051264945', '0', '1', '0', '0', '林小姐', '1', '2', '52', '500', '中关村海兴大厦', '', '135474510', '', 'linzi@116.com', '', '', '', '3', '城际快递', '2', '银行汇款/转帐', '', '', '', '', '', '', '', '3800.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '3810.00', '0', '管理员添加', '1242144250', '1242144363', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('12', '2009051712919', '1', '2', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '3', '货到付款', '等待所有商品备齐后再发', '', '', '', '', '', '', '238.00', '10.00', '0.00', '5.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '253.00', '0', '本站', '1242576304', '0', '0', '0', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('13', '2009051719232', '1', '1', '1', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '3', '货到付款', '等待所有商品备齐后再发', '', '', '', '', '', '', '960.00', '10.00', '0.00', '5.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '975.00', '0', '本站', '1242576341', '1242576445', '0', '1242576445', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('14', '2009052224892', '1', '1', '1', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '14045.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '13806.60', '0', '0.00', '5.00', '0.00', '0', '本站', '1242976699', '1242976699', '1242976699', '1242976740', '0', '0', '2', '1123344', '', '0', '', '', '0', '', '0.00', '0', '0', '243.40');
INSERT INTO `db_order_info` VALUES ('15', '2009061585887', '1', '4', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '2', '银行汇款/转帐', '等待所有商品备齐后再发', '', '', '', '', '', '', '17044.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '17054.00', '0', '本站', '1245044533', '1245044587', '1245044644', '1245045443', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('16', '2009061525429', '1', '1', '4', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '3186.30', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3196.30', '0', '0.00', '0.00', '0.00', '0', '本站', '1245045672', '1245045672', '1245045672', '1245045723', '0', '0', '0', '2009061525121', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('17', '2009061503335', '1', '4', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '1900.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1245047978', '1245047978', '1245047978', '1245048189', '0', '0', '0', '', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('18', '2009061510313', '1', '1', '0', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '500.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500.00', '0', '0.00', '0.00', '0.00', '0', '本站', '1245048585', '1245048585', '1245048585', '0', '0', '0', '0', '', 'group_buy', '8', '', '', '0', '', '0.00', '0', '0', '0.00');
INSERT INTO `db_order_info` VALUES ('19', '2009061909851', '1', '1', '1', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '', '', '3', '城际快递', '1', '余额支付', '等待所有商品备齐后再发', '', '', '', '', '', '', '5567.70', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5577.70', '0', '0.00', '0.00', '0.00', '0', '本站', '1245384008', '1245384008', '1245384008', '1245384049', '0', '0', '0', '232421', '', '0', '', '', '0', '', '0.00', '0', '0', '0.00');

-- ----------------------------
-- Table structure for `db_region`
-- ----------------------------
DROP TABLE IF EXISTS `db_region`;
CREATE TABLE `db_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='管理地区';

-- ----------------------------
-- Records of db_region
-- ----------------------------
INSERT INTO `db_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `db_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `db_region` VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO `db_region` VALUES ('4', '1', '福建', '1', '0');
INSERT INTO `db_region` VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO `db_region` VALUES ('6', '1', '广东', '1', '0');
INSERT INTO `db_region` VALUES ('7', '1', '广西', '1', '0');
INSERT INTO `db_region` VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO `db_region` VALUES ('9', '1', '海南', '1', '0');
INSERT INTO `db_region` VALUES ('10', '1', '河北', '1', '0');
INSERT INTO `db_region` VALUES ('11', '1', '河南', '1', '0');
INSERT INTO `db_region` VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO `db_region` VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO `db_region` VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO `db_region` VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO `db_region` VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO `db_region` VALUES ('17', '1', '江西', '1', '0');
INSERT INTO `db_region` VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO `db_region` VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO `db_region` VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO `db_region` VALUES ('21', '1', '青海', '1', '0');
INSERT INTO `db_region` VALUES ('22', '1', '山东', '1', '0');
INSERT INTO `db_region` VALUES ('23', '1', '山西', '1', '0');
INSERT INTO `db_region` VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO `db_region` VALUES ('25', '1', '上海', '1', '0');
INSERT INTO `db_region` VALUES ('26', '1', '四川', '1', '0');
INSERT INTO `db_region` VALUES ('27', '1', '天津', '1', '0');
INSERT INTO `db_region` VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO `db_region` VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO `db_region` VALUES ('30', '1', '云南', '1', '0');
INSERT INTO `db_region` VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO `db_region` VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO `db_region` VALUES ('33', '1', '香港', '1', '0');
INSERT INTO `db_region` VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO `db_region` VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO `db_region` VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO `db_region` VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO `db_region` VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO `db_region` VALUES ('39', '3', '池州', '2', '0');
INSERT INTO `db_region` VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO `db_region` VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO `db_region` VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO `db_region` VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO `db_region` VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO `db_region` VALUES ('45', '3', '六安', '2', '0');
INSERT INTO `db_region` VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO `db_region` VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO `db_region` VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO `db_region` VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO `db_region` VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO `db_region` VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO `db_region` VALUES ('52', '2', '北京', '2', '0');
INSERT INTO `db_region` VALUES ('53', '4', '福州', '2', '0');
INSERT INTO `db_region` VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO `db_region` VALUES ('55', '4', '南平', '2', '0');
INSERT INTO `db_region` VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO `db_region` VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO `db_region` VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO `db_region` VALUES ('59', '4', '三明', '2', '0');
INSERT INTO `db_region` VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO `db_region` VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO `db_region` VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO `db_region` VALUES ('63', '5', '白银', '2', '0');
INSERT INTO `db_region` VALUES ('64', '5', '定西', '2', '0');
INSERT INTO `db_region` VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO `db_region` VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO `db_region` VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO `db_region` VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO `db_region` VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO `db_region` VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO `db_region` VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO `db_region` VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO `db_region` VALUES ('73', '5', '天水', '2', '0');
INSERT INTO `db_region` VALUES ('74', '5', '武威', '2', '0');
INSERT INTO `db_region` VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO `db_region` VALUES ('76', '6', '广州', '2', '0');
INSERT INTO `db_region` VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO `db_region` VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO `db_region` VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO `db_region` VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO `db_region` VALUES ('81', '6', '河源', '2', '0');
INSERT INTO `db_region` VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO `db_region` VALUES ('83', '6', '江门', '2', '0');
INSERT INTO `db_region` VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO `db_region` VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO `db_region` VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO `db_region` VALUES ('87', '6', '清远', '2', '0');
INSERT INTO `db_region` VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO `db_region` VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO `db_region` VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO `db_region` VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO `db_region` VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO `db_region` VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO `db_region` VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO `db_region` VALUES ('95', '6', '中山', '2', '0');
INSERT INTO `db_region` VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO `db_region` VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO `db_region` VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO `db_region` VALUES ('99', '7', '百色', '2', '0');
INSERT INTO `db_region` VALUES ('100', '7', '北海', '2', '0');
INSERT INTO `db_region` VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO `db_region` VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO `db_region` VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO `db_region` VALUES ('104', '7', '河池', '2', '0');
INSERT INTO `db_region` VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO `db_region` VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO `db_region` VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO `db_region` VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO `db_region` VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO `db_region` VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO `db_region` VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO `db_region` VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO `db_region` VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO `db_region` VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO `db_region` VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO `db_region` VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO `db_region` VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO `db_region` VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO `db_region` VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO `db_region` VALUES ('120', '9', '海口', '2', '0');
INSERT INTO `db_region` VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO `db_region` VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO `db_region` VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO `db_region` VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO `db_region` VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO `db_region` VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO `db_region` VALUES ('127', '9', '东方', '2', '0');
INSERT INTO `db_region` VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO `db_region` VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO `db_region` VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO `db_region` VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO `db_region` VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO `db_region` VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO `db_region` VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO `db_region` VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO `db_region` VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO `db_region` VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO `db_region` VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO `db_region` VALUES ('139', '10', '保定', '2', '0');
INSERT INTO `db_region` VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO `db_region` VALUES ('141', '10', '承德', '2', '0');
INSERT INTO `db_region` VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO `db_region` VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO `db_region` VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO `db_region` VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO `db_region` VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO `db_region` VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO `db_region` VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO `db_region` VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO `db_region` VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO `db_region` VALUES ('151', '11', '开封', '2', '0');
INSERT INTO `db_region` VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO `db_region` VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO `db_region` VALUES ('154', '11', '济源', '2', '0');
INSERT INTO `db_region` VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO `db_region` VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO `db_region` VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO `db_region` VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO `db_region` VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO `db_region` VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO `db_region` VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO `db_region` VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO `db_region` VALUES ('163', '11', '周口', '2', '0');
INSERT INTO `db_region` VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO `db_region` VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO `db_region` VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO `db_region` VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO `db_region` VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO `db_region` VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO `db_region` VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO `db_region` VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO `db_region` VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO `db_region` VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO `db_region` VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO `db_region` VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO `db_region` VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO `db_region` VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO `db_region` VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO `db_region` VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO `db_region` VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO `db_region` VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO `db_region` VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO `db_region` VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO `db_region` VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO `db_region` VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO `db_region` VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO `db_region` VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO `db_region` VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO `db_region` VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO `db_region` VALUES ('190', '13', '随州', '2', '0');
INSERT INTO `db_region` VALUES ('191', '13', '天门', '2', '0');
INSERT INTO `db_region` VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO `db_region` VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO `db_region` VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO `db_region` VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO `db_region` VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO `db_region` VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO `db_region` VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO `db_region` VALUES ('199', '14', '常德', '2', '0');
INSERT INTO `db_region` VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO `db_region` VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO `db_region` VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO `db_region` VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO `db_region` VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO `db_region` VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO `db_region` VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO `db_region` VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO `db_region` VALUES ('208', '14', '永州', '2', '0');
INSERT INTO `db_region` VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO `db_region` VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO `db_region` VALUES ('211', '15', '长春', '2', '0');
INSERT INTO `db_region` VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO `db_region` VALUES ('213', '15', '白城', '2', '0');
INSERT INTO `db_region` VALUES ('214', '15', '白山', '2', '0');
INSERT INTO `db_region` VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO `db_region` VALUES ('216', '15', '四平', '2', '0');
INSERT INTO `db_region` VALUES ('217', '15', '松原', '2', '0');
INSERT INTO `db_region` VALUES ('218', '15', '通化', '2', '0');
INSERT INTO `db_region` VALUES ('219', '15', '延边', '2', '0');
INSERT INTO `db_region` VALUES ('220', '16', '南京', '2', '0');
INSERT INTO `db_region` VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO `db_region` VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO `db_region` VALUES ('223', '16', '常州', '2', '0');
INSERT INTO `db_region` VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO `db_region` VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO `db_region` VALUES ('226', '16', '南通', '2', '0');
INSERT INTO `db_region` VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO `db_region` VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO `db_region` VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO `db_region` VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO `db_region` VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO `db_region` VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO `db_region` VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO `db_region` VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO `db_region` VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO `db_region` VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO `db_region` VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO `db_region` VALUES ('238', '17', '九江', '2', '0');
INSERT INTO `db_region` VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO `db_region` VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO `db_region` VALUES ('241', '17', '新余', '2', '0');
INSERT INTO `db_region` VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO `db_region` VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO `db_region` VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO `db_region` VALUES ('245', '18', '大连', '2', '0');
INSERT INTO `db_region` VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO `db_region` VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO `db_region` VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO `db_region` VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO `db_region` VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO `db_region` VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO `db_region` VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO `db_region` VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO `db_region` VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO `db_region` VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO `db_region` VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO `db_region` VALUES ('257', '18', '营口', '2', '0');
INSERT INTO `db_region` VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO `db_region` VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO `db_region` VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO `db_region` VALUES ('261', '19', '包头', '2', '0');
INSERT INTO `db_region` VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO `db_region` VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO `db_region` VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO `db_region` VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO `db_region` VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO `db_region` VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO `db_region` VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO `db_region` VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO `db_region` VALUES ('270', '20', '银川', '2', '0');
INSERT INTO `db_region` VALUES ('271', '20', '固原', '2', '0');
INSERT INTO `db_region` VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO `db_region` VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO `db_region` VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO `db_region` VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO `db_region` VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO `db_region` VALUES ('277', '21', '海北', '2', '0');
INSERT INTO `db_region` VALUES ('278', '21', '海东', '2', '0');
INSERT INTO `db_region` VALUES ('279', '21', '海南', '2', '0');
INSERT INTO `db_region` VALUES ('280', '21', '海西', '2', '0');
INSERT INTO `db_region` VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO `db_region` VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO `db_region` VALUES ('283', '22', '济南', '2', '0');
INSERT INTO `db_region` VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO `db_region` VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO `db_region` VALUES ('286', '22', '德州', '2', '0');
INSERT INTO `db_region` VALUES ('287', '22', '东营', '2', '0');
INSERT INTO `db_region` VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO `db_region` VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO `db_region` VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO `db_region` VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO `db_region` VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO `db_region` VALUES ('293', '22', '日照', '2', '0');
INSERT INTO `db_region` VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO `db_region` VALUES ('295', '22', '威海', '2', '0');
INSERT INTO `db_region` VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO `db_region` VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO `db_region` VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO `db_region` VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO `db_region` VALUES ('300', '23', '太原', '2', '0');
INSERT INTO `db_region` VALUES ('301', '23', '长治', '2', '0');
INSERT INTO `db_region` VALUES ('302', '23', '大同', '2', '0');
INSERT INTO `db_region` VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO `db_region` VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO `db_region` VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO `db_region` VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO `db_region` VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO `db_region` VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO `db_region` VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO `db_region` VALUES ('310', '23', '运城', '2', '0');
INSERT INTO `db_region` VALUES ('311', '24', '西安', '2', '0');
INSERT INTO `db_region` VALUES ('312', '24', '安康', '2', '0');
INSERT INTO `db_region` VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO `db_region` VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO `db_region` VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO `db_region` VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO `db_region` VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO `db_region` VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO `db_region` VALUES ('319', '24', '延安', '2', '0');
INSERT INTO `db_region` VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO `db_region` VALUES ('321', '25', '上海', '2', '0');
INSERT INTO `db_region` VALUES ('322', '26', '成都', '2', '0');
INSERT INTO `db_region` VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO `db_region` VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO `db_region` VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO `db_region` VALUES ('326', '26', '达州', '2', '0');
INSERT INTO `db_region` VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO `db_region` VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO `db_region` VALUES ('329', '26', '广安', '2', '0');
INSERT INTO `db_region` VALUES ('330', '26', '广元', '2', '0');
INSERT INTO `db_region` VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO `db_region` VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO `db_region` VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO `db_region` VALUES ('334', '26', '南充', '2', '0');
INSERT INTO `db_region` VALUES ('335', '26', '内江', '2', '0');
INSERT INTO `db_region` VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO `db_region` VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO `db_region` VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO `db_region` VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO `db_region` VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO `db_region` VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO `db_region` VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO `db_region` VALUES ('343', '27', '天津', '2', '0');
INSERT INTO `db_region` VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO `db_region` VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO `db_region` VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO `db_region` VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO `db_region` VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO `db_region` VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO `db_region` VALUES ('350', '28', '山南', '2', '0');
INSERT INTO `db_region` VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO `db_region` VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO `db_region` VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO `db_region` VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO `db_region` VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO `db_region` VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO `db_region` VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO `db_region` VALUES ('358', '29', '和田', '2', '0');
INSERT INTO `db_region` VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO `db_region` VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO `db_region` VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO `db_region` VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO `db_region` VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO `db_region` VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO `db_region` VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO `db_region` VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO `db_region` VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO `db_region` VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO `db_region` VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO `db_region` VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO `db_region` VALUES ('371', '30', '保山', '2', '0');
INSERT INTO `db_region` VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO `db_region` VALUES ('373', '30', '大理', '2', '0');
INSERT INTO `db_region` VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO `db_region` VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO `db_region` VALUES ('376', '30', '红河', '2', '0');
INSERT INTO `db_region` VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO `db_region` VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO `db_region` VALUES ('379', '30', '文山', '2', '0');
INSERT INTO `db_region` VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO `db_region` VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO `db_region` VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO `db_region` VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO `db_region` VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO `db_region` VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO `db_region` VALUES ('386', '31', '金华', '2', '0');
INSERT INTO `db_region` VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO `db_region` VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO `db_region` VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO `db_region` VALUES ('390', '31', '台州', '2', '0');
INSERT INTO `db_region` VALUES ('391', '31', '温州', '2', '0');
INSERT INTO `db_region` VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO `db_region` VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO `db_region` VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO `db_region` VALUES ('395', '33', '香港', '2', '0');
INSERT INTO `db_region` VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO `db_region` VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO `db_region` VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO `db_region` VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO `db_region` VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO `db_region` VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO `db_region` VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO `db_region` VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO `db_region` VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO `db_region` VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO `db_region` VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO `db_region` VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO `db_region` VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO `db_region` VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO `db_region` VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO `db_region` VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO `db_region` VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO `db_region` VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO `db_region` VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO `db_region` VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO `db_region` VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO `db_region` VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO `db_region` VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO `db_region` VALUES ('420', '38', '和县', '3', '0');
INSERT INTO `db_region` VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO `db_region` VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO `db_region` VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO `db_region` VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO `db_region` VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO `db_region` VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO `db_region` VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO `db_region` VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO `db_region` VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO `db_region` VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO `db_region` VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO `db_region` VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO `db_region` VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO `db_region` VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO `db_region` VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO `db_region` VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO `db_region` VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO `db_region` VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO `db_region` VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO `db_region` VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO `db_region` VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO `db_region` VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO `db_region` VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO `db_region` VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO `db_region` VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO `db_region` VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO `db_region` VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO `db_region` VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO `db_region` VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO `db_region` VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO `db_region` VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO `db_region` VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO `db_region` VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO `db_region` VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO `db_region` VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO `db_region` VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO `db_region` VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO `db_region` VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO `db_region` VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO `db_region` VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO `db_region` VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO `db_region` VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO `db_region` VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO `db_region` VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO `db_region` VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO `db_region` VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO `db_region` VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO `db_region` VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO `db_region` VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO `db_region` VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO `db_region` VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO `db_region` VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO `db_region` VALUES ('473', '47', '埇桥区', '3', '0');
INSERT INTO `db_region` VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO `db_region` VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO `db_region` VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO `db_region` VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO `db_region` VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO `db_region` VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO `db_region` VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO `db_region` VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO `db_region` VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO `db_region` VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO `db_region` VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO `db_region` VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO `db_region` VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO `db_region` VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO `db_region` VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO `db_region` VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO `db_region` VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO `db_region` VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO `db_region` VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO `db_region` VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO `db_region` VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO `db_region` VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO `db_region` VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO `db_region` VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO `db_region` VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO `db_region` VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO `db_region` VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO `db_region` VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO `db_region` VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO `db_region` VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO `db_region` VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO `db_region` VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO `db_region` VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO `db_region` VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO `db_region` VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO `db_region` VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO `db_region` VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO `db_region` VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO `db_region` VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO `db_region` VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO `db_region` VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO `db_region` VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO `db_region` VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO `db_region` VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO `db_region` VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO `db_region` VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO `db_region` VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO `db_region` VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO `db_region` VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO `db_region` VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO `db_region` VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO `db_region` VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO `db_region` VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO `db_region` VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO `db_region` VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO `db_region` VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO `db_region` VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO `db_region` VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO `db_region` VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO `db_region` VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO `db_region` VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO `db_region` VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO `db_region` VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO `db_region` VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO `db_region` VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO `db_region` VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO `db_region` VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO `db_region` VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO `db_region` VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO `db_region` VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO `db_region` VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO `db_region` VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO `db_region` VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO `db_region` VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO `db_region` VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO `db_region` VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO `db_region` VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO `db_region` VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO `db_region` VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO `db_region` VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO `db_region` VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO `db_region` VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO `db_region` VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO `db_region` VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO `db_region` VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO `db_region` VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO `db_region` VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO `db_region` VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO `db_region` VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO `db_region` VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO `db_region` VALUES ('565', '58', '清濛开发区', '3', '0');
INSERT INTO `db_region` VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO `db_region` VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO `db_region` VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO `db_region` VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO `db_region` VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO `db_region` VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO `db_region` VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO `db_region` VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO `db_region` VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO `db_region` VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO `db_region` VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO `db_region` VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO `db_region` VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO `db_region` VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO `db_region` VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO `db_region` VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO `db_region` VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO `db_region` VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO `db_region` VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO `db_region` VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO `db_region` VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO `db_region` VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO `db_region` VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO `db_region` VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO `db_region` VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO `db_region` VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO `db_region` VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO `db_region` VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO `db_region` VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO `db_region` VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO `db_region` VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO `db_region` VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO `db_region` VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO `db_region` VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO `db_region` VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO `db_region` VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO `db_region` VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO `db_region` VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO `db_region` VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO `db_region` VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO `db_region` VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO `db_region` VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO `db_region` VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO `db_region` VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO `db_region` VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO `db_region` VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO `db_region` VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO `db_region` VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO `db_region` VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO `db_region` VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO `db_region` VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO `db_region` VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO `db_region` VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO `db_region` VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO `db_region` VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO `db_region` VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO `db_region` VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO `db_region` VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO `db_region` VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO `db_region` VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO `db_region` VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO `db_region` VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO `db_region` VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO `db_region` VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO `db_region` VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO `db_region` VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO `db_region` VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO `db_region` VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO `db_region` VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO `db_region` VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO `db_region` VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO `db_region` VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO `db_region` VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO `db_region` VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO `db_region` VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO `db_region` VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO `db_region` VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO `db_region` VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO `db_region` VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO `db_region` VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO `db_region` VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO `db_region` VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO `db_region` VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO `db_region` VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO `db_region` VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO `db_region` VALUES ('651', '70', '成县', '3', '0');
INSERT INTO `db_region` VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO `db_region` VALUES ('653', '70', '康县', '3', '0');
INSERT INTO `db_region` VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO `db_region` VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO `db_region` VALUES ('656', '70', '文县', '3', '0');
INSERT INTO `db_region` VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO `db_region` VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO `db_region` VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO `db_region` VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO `db_region` VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO `db_region` VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO `db_region` VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO `db_region` VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO `db_region` VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO `db_region` VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO `db_region` VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO `db_region` VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO `db_region` VALUES ('669', '72', '环县', '3', '0');
INSERT INTO `db_region` VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO `db_region` VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO `db_region` VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO `db_region` VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO `db_region` VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO `db_region` VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO `db_region` VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO `db_region` VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO `db_region` VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO `db_region` VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO `db_region` VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO `db_region` VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO `db_region` VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO `db_region` VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO `db_region` VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO `db_region` VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO `db_region` VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO `db_region` VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO `db_region` VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO `db_region` VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO `db_region` VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO `db_region` VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO `db_region` VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO `db_region` VALUES ('693', '76', '天河区', '3', '2');
INSERT INTO `db_region` VALUES ('694', '76', '东山区', '3', '2');
INSERT INTO `db_region` VALUES ('695', '76', '白云区', '3', '2');
INSERT INTO `db_region` VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO `db_region` VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO `db_region` VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO `db_region` VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO `db_region` VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO `db_region` VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO `db_region` VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO `db_region` VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO `db_region` VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO `db_region` VALUES ('705', '77', '福田区', '3', '1');
INSERT INTO `db_region` VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO `db_region` VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO `db_region` VALUES ('708', '77', '宝安区', '3', '1');
INSERT INTO `db_region` VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO `db_region` VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO `db_region` VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO `db_region` VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO `db_region` VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO `db_region` VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO `db_region` VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO `db_region` VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO `db_region` VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO `db_region` VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO `db_region` VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO `db_region` VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO `db_region` VALUES ('721', '79', '道滘镇', '3', '0');
INSERT INTO `db_region` VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO `db_region` VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO `db_region` VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO `db_region` VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO `db_region` VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO `db_region` VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO `db_region` VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO `db_region` VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO `db_region` VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO `db_region` VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO `db_region` VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO `db_region` VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO `db_region` VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO `db_region` VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO `db_region` VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO `db_region` VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO `db_region` VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO `db_region` VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO `db_region` VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO `db_region` VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO `db_region` VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO `db_region` VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO `db_region` VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO `db_region` VALUES ('745', '79', '高埗镇', '3', '0');
INSERT INTO `db_region` VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO `db_region` VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO `db_region` VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO `db_region` VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO `db_region` VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO `db_region` VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO `db_region` VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO `db_region` VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO `db_region` VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO `db_region` VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO `db_region` VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO `db_region` VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO `db_region` VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO `db_region` VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO `db_region` VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO `db_region` VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO `db_region` VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO `db_region` VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO `db_region` VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO `db_region` VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO `db_region` VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO `db_region` VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO `db_region` VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO `db_region` VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO `db_region` VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO `db_region` VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO `db_region` VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO `db_region` VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO `db_region` VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO `db_region` VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO `db_region` VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO `db_region` VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO `db_region` VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO `db_region` VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO `db_region` VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO `db_region` VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO `db_region` VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO `db_region` VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO `db_region` VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO `db_region` VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO `db_region` VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO `db_region` VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO `db_region` VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO `db_region` VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO `db_region` VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO `db_region` VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO `db_region` VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO `db_region` VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO `db_region` VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO `db_region` VALUES ('795', '87', '连山', '3', '0');
INSERT INTO `db_region` VALUES ('796', '87', '连南', '3', '0');
INSERT INTO `db_region` VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO `db_region` VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO `db_region` VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO `db_region` VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO `db_region` VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO `db_region` VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO `db_region` VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO `db_region` VALUES ('804', '89', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO `db_region` VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO `db_region` VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO `db_region` VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO `db_region` VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO `db_region` VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO `db_region` VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO `db_region` VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO `db_region` VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO `db_region` VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO `db_region` VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO `db_region` VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO `db_region` VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO `db_region` VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO `db_region` VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO `db_region` VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO `db_region` VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO `db_region` VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO `db_region` VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO `db_region` VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO `db_region` VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO `db_region` VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO `db_region` VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO `db_region` VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO `db_region` VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO `db_region` VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO `db_region` VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO `db_region` VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO `db_region` VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO `db_region` VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO `db_region` VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO `db_region` VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO `db_region` VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO `db_region` VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO `db_region` VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO `db_region` VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO `db_region` VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO `db_region` VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO `db_region` VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO `db_region` VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO `db_region` VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO `db_region` VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO `db_region` VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO `db_region` VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO `db_region` VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO `db_region` VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO `db_region` VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO `db_region` VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO `db_region` VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO `db_region` VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO `db_region` VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO `db_region` VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO `db_region` VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO `db_region` VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO `db_region` VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO `db_region` VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO `db_region` VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO `db_region` VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO `db_region` VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO `db_region` VALUES ('864', '97', '横县', '3', '0');
INSERT INTO `db_region` VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO `db_region` VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO `db_region` VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO `db_region` VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO `db_region` VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO `db_region` VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO `db_region` VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO `db_region` VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO `db_region` VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO `db_region` VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO `db_region` VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO `db_region` VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO `db_region` VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO `db_region` VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO `db_region` VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO `db_region` VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO `db_region` VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO `db_region` VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO `db_region` VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO `db_region` VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO `db_region` VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO `db_region` VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO `db_region` VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO `db_region` VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO `db_region` VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO `db_region` VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO `db_region` VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO `db_region` VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO `db_region` VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO `db_region` VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO `db_region` VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO `db_region` VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO `db_region` VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO `db_region` VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO `db_region` VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO `db_region` VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO `db_region` VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO `db_region` VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO `db_region` VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO `db_region` VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO `db_region` VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO `db_region` VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO `db_region` VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO `db_region` VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO `db_region` VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO `db_region` VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO `db_region` VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO `db_region` VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO `db_region` VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO `db_region` VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO `db_region` VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO `db_region` VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO `db_region` VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO `db_region` VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO `db_region` VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO `db_region` VALUES ('920', '104', '都安', '3', '0');
INSERT INTO `db_region` VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO `db_region` VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO `db_region` VALUES ('923', '104', '环江', '3', '0');
INSERT INTO `db_region` VALUES ('924', '104', '大化', '3', '0');
INSERT INTO `db_region` VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO `db_region` VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO `db_region` VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO `db_region` VALUES ('928', '105', '富川', '3', '0');
INSERT INTO `db_region` VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO `db_region` VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO `db_region` VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO `db_region` VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO `db_region` VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO `db_region` VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO `db_region` VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO `db_region` VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO `db_region` VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO `db_region` VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO `db_region` VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO `db_region` VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO `db_region` VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO `db_region` VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO `db_region` VALUES ('943', '107', '融水', '3', '0');
INSERT INTO `db_region` VALUES ('944', '107', '三江', '3', '0');
INSERT INTO `db_region` VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO `db_region` VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO `db_region` VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO `db_region` VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO `db_region` VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO `db_region` VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO `db_region` VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO `db_region` VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO `db_region` VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO `db_region` VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO `db_region` VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO `db_region` VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO `db_region` VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO `db_region` VALUES ('958', '110', '容县', '3', '0');
INSERT INTO `db_region` VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO `db_region` VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO `db_region` VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO `db_region` VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO `db_region` VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO `db_region` VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO `db_region` VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO `db_region` VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO `db_region` VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO `db_region` VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO `db_region` VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO `db_region` VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO `db_region` VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO `db_region` VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO `db_region` VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO `db_region` VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO `db_region` VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO `db_region` VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO `db_region` VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO `db_region` VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO `db_region` VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO `db_region` VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO `db_region` VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO `db_region` VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO `db_region` VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO `db_region` VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO `db_region` VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO `db_region` VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO `db_region` VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO `db_region` VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO `db_region` VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO `db_region` VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO `db_region` VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO `db_region` VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO `db_region` VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO `db_region` VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO `db_region` VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO `db_region` VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO `db_region` VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO `db_region` VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO `db_region` VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO `db_region` VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO `db_region` VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO `db_region` VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO `db_region` VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO `db_region` VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO `db_region` VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO `db_region` VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO `db_region` VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO `db_region` VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO `db_region` VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO `db_region` VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO `db_region` VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO `db_region` VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO `db_region` VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO `db_region` VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO `db_region` VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO `db_region` VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO `db_region` VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO `db_region` VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO `db_region` VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO `db_region` VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO `db_region` VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO `db_region` VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO `db_region` VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO `db_region` VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO `db_region` VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO `db_region` VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO `db_region` VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO `db_region` VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO `db_region` VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO `db_region` VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO `db_region` VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO `db_region` VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO `db_region` VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO `db_region` VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO `db_region` VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO `db_region` VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO `db_region` VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO `db_region` VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO `db_region` VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO `db_region` VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO `db_region` VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO `db_region` VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO `db_region` VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO `db_region` VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO `db_region` VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO `db_region` VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO `db_region` VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO `db_region` VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO `db_region` VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO `db_region` VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO `db_region` VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO `db_region` VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO `db_region` VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO `db_region` VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO `db_region` VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO `db_region` VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO `db_region` VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO `db_region` VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO `db_region` VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO `db_region` VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO `db_region` VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO `db_region` VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO `db_region` VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO `db_region` VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO `db_region` VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO `db_region` VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO `db_region` VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO `db_region` VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO `db_region` VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO `db_region` VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO `db_region` VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO `db_region` VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO `db_region` VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO `db_region` VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO `db_region` VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO `db_region` VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO `db_region` VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO `db_region` VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO `db_region` VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO `db_region` VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO `db_region` VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO `db_region` VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO `db_region` VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO `db_region` VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO `db_region` VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO `db_region` VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO `db_region` VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO `db_region` VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO `db_region` VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO `db_region` VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO `db_region` VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO `db_region` VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO `db_region` VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO `db_region` VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO `db_region` VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO `db_region` VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO `db_region` VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO `db_region` VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO `db_region` VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO `db_region` VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO `db_region` VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO `db_region` VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO `db_region` VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO `db_region` VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO `db_region` VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO `db_region` VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO `db_region` VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO `db_region` VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO `db_region` VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO `db_region` VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO `db_region` VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO `db_region` VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO `db_region` VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO `db_region` VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO `db_region` VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO `db_region` VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO `db_region` VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO `db_region` VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO `db_region` VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO `db_region` VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO `db_region` VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO `db_region` VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO `db_region` VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO `db_region` VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO `db_region` VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO `db_region` VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO `db_region` VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO `db_region` VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO `db_region` VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO `db_region` VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO `db_region` VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO `db_region` VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO `db_region` VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO `db_region` VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO `db_region` VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO `db_region` VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO `db_region` VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO `db_region` VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO `db_region` VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO `db_region` VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO `db_region` VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO `db_region` VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO `db_region` VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO `db_region` VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO `db_region` VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO `db_region` VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO `db_region` VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO `db_region` VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO `db_region` VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO `db_region` VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO `db_region` VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO `db_region` VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO `db_region` VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO `db_region` VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO `db_region` VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO `db_region` VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO `db_region` VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO `db_region` VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO `db_region` VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO `db_region` VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO `db_region` VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO `db_region` VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO `db_region` VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO `db_region` VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO `db_region` VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO `db_region` VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO `db_region` VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO `db_region` VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO `db_region` VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO `db_region` VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO `db_region` VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO `db_region` VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO `db_region` VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO `db_region` VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO `db_region` VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO `db_region` VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO `db_region` VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO `db_region` VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO `db_region` VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO `db_region` VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO `db_region` VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO `db_region` VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO `db_region` VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO `db_region` VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO `db_region` VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO `db_region` VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO `db_region` VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO `db_region` VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO `db_region` VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO `db_region` VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO `db_region` VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO `db_region` VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO `db_region` VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO `db_region` VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO `db_region` VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO `db_region` VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO `db_region` VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO `db_region` VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO `db_region` VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO `db_region` VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO `db_region` VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO `db_region` VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO `db_region` VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO `db_region` VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO `db_region` VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO `db_region` VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO `db_region` VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO `db_region` VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO `db_region` VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO `db_region` VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO `db_region` VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO `db_region` VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO `db_region` VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO `db_region` VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO `db_region` VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO `db_region` VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO `db_region` VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO `db_region` VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO `db_region` VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO `db_region` VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO `db_region` VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO `db_region` VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO `db_region` VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO `db_region` VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO `db_region` VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO `db_region` VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO `db_region` VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO `db_region` VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO `db_region` VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO `db_region` VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO `db_region` VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO `db_region` VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO `db_region` VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO `db_region` VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO `db_region` VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO `db_region` VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO `db_region` VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO `db_region` VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO `db_region` VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO `db_region` VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO `db_region` VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO `db_region` VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO `db_region` VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO `db_region` VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO `db_region` VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO `db_region` VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO `db_region` VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO `db_region` VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO `db_region` VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO `db_region` VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO `db_region` VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO `db_region` VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO `db_region` VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO `db_region` VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO `db_region` VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO `db_region` VALUES ('1271', '150', '瀍河回族区', '3', '0');
INSERT INTO `db_region` VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO `db_region` VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO `db_region` VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO `db_region` VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO `db_region` VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO `db_region` VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO `db_region` VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO `db_region` VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO `db_region` VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO `db_region` VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO `db_region` VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO `db_region` VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO `db_region` VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO `db_region` VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO `db_region` VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO `db_region` VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO `db_region` VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO `db_region` VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO `db_region` VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO `db_region` VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO `db_region` VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO `db_region` VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO `db_region` VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO `db_region` VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO `db_region` VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO `db_region` VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO `db_region` VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO `db_region` VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO `db_region` VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO `db_region` VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO `db_region` VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO `db_region` VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO `db_region` VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO `db_region` VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO `db_region` VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO `db_region` VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO `db_region` VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO `db_region` VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO `db_region` VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO `db_region` VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO `db_region` VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO `db_region` VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO `db_region` VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO `db_region` VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO `db_region` VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO `db_region` VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO `db_region` VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO `db_region` VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO `db_region` VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO `db_region` VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO `db_region` VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO `db_region` VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO `db_region` VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO `db_region` VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO `db_region` VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO `db_region` VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO `db_region` VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO `db_region` VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO `db_region` VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO `db_region` VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO `db_region` VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO `db_region` VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO `db_region` VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO `db_region` VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO `db_region` VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO `db_region` VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO `db_region` VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO `db_region` VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO `db_region` VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO `db_region` VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO `db_region` VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO `db_region` VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO `db_region` VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO `db_region` VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO `db_region` VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO `db_region` VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO `db_region` VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO `db_region` VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO `db_region` VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO `db_region` VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO `db_region` VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO `db_region` VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO `db_region` VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO `db_region` VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO `db_region` VALUES ('1368', '161', '浉河区', '3', '0');
INSERT INTO `db_region` VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO `db_region` VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO `db_region` VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO `db_region` VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO `db_region` VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO `db_region` VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO `db_region` VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO `db_region` VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO `db_region` VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO `db_region` VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO `db_region` VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO `db_region` VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO `db_region` VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO `db_region` VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO `db_region` VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO `db_region` VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO `db_region` VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO `db_region` VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO `db_region` VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO `db_region` VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO `db_region` VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO `db_region` VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO `db_region` VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO `db_region` VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO `db_region` VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO `db_region` VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO `db_region` VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO `db_region` VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO `db_region` VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO `db_region` VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO `db_region` VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO `db_region` VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO `db_region` VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO `db_region` VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO `db_region` VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO `db_region` VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO `db_region` VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO `db_region` VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO `db_region` VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO `db_region` VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO `db_region` VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO `db_region` VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO `db_region` VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO `db_region` VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO `db_region` VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO `db_region` VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO `db_region` VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO `db_region` VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO `db_region` VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO `db_region` VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO `db_region` VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO `db_region` VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO `db_region` VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO `db_region` VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO `db_region` VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO `db_region` VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO `db_region` VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO `db_region` VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO `db_region` VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO `db_region` VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO `db_region` VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO `db_region` VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO `db_region` VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO `db_region` VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO `db_region` VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO `db_region` VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO `db_region` VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO `db_region` VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO `db_region` VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO `db_region` VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO `db_region` VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO `db_region` VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO `db_region` VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO `db_region` VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO `db_region` VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO `db_region` VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO `db_region` VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO `db_region` VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO `db_region` VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO `db_region` VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO `db_region` VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO `db_region` VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO `db_region` VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO `db_region` VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO `db_region` VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO `db_region` VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO `db_region` VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO `db_region` VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO `db_region` VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO `db_region` VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO `db_region` VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO `db_region` VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO `db_region` VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO `db_region` VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO `db_region` VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO `db_region` VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO `db_region` VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO `db_region` VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO `db_region` VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO `db_region` VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO `db_region` VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO `db_region` VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO `db_region` VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO `db_region` VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO `db_region` VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO `db_region` VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO `db_region` VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO `db_region` VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO `db_region` VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO `db_region` VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO `db_region` VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO `db_region` VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO `db_region` VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO `db_region` VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO `db_region` VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO `db_region` VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO `db_region` VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO `db_region` VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO `db_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO `db_region` VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO `db_region` VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO `db_region` VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO `db_region` VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO `db_region` VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO `db_region` VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO `db_region` VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO `db_region` VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO `db_region` VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO `db_region` VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO `db_region` VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO `db_region` VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO `db_region` VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO `db_region` VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO `db_region` VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO `db_region` VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO `db_region` VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO `db_region` VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO `db_region` VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO `db_region` VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO `db_region` VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO `db_region` VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO `db_region` VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO `db_region` VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO `db_region` VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO `db_region` VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO `db_region` VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO `db_region` VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO `db_region` VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO `db_region` VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO `db_region` VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO `db_region` VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO `db_region` VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO `db_region` VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO `db_region` VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO `db_region` VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO `db_region` VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO `db_region` VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO `db_region` VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO `db_region` VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO `db_region` VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO `db_region` VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO `db_region` VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO `db_region` VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO `db_region` VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO `db_region` VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO `db_region` VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO `db_region` VALUES ('1547', '180', '硚口区', '3', '0');
INSERT INTO `db_region` VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO `db_region` VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO `db_region` VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO `db_region` VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO `db_region` VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO `db_region` VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO `db_region` VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO `db_region` VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO `db_region` VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO `db_region` VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO `db_region` VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO `db_region` VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO `db_region` VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO `db_region` VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO `db_region` VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO `db_region` VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO `db_region` VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO `db_region` VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO `db_region` VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO `db_region` VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO `db_region` VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO `db_region` VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO `db_region` VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO `db_region` VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO `db_region` VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO `db_region` VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO `db_region` VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO `db_region` VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO `db_region` VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO `db_region` VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO `db_region` VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO `db_region` VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO `db_region` VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO `db_region` VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO `db_region` VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO `db_region` VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO `db_region` VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO `db_region` VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO `db_region` VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO `db_region` VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO `db_region` VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO `db_region` VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO `db_region` VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO `db_region` VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO `db_region` VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO `db_region` VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO `db_region` VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO `db_region` VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO `db_region` VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO `db_region` VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO `db_region` VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO `db_region` VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO `db_region` VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO `db_region` VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO `db_region` VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO `db_region` VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO `db_region` VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO `db_region` VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO `db_region` VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO `db_region` VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO `db_region` VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO `db_region` VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO `db_region` VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO `db_region` VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO `db_region` VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO `db_region` VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO `db_region` VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO `db_region` VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO `db_region` VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO `db_region` VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO `db_region` VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO `db_region` VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO `db_region` VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO `db_region` VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO `db_region` VALUES ('1631', '195', '猇亭区', '3', '0');
INSERT INTO `db_region` VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO `db_region` VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO `db_region` VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO `db_region` VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO `db_region` VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO `db_region` VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO `db_region` VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO `db_region` VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO `db_region` VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO `db_region` VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO `db_region` VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO `db_region` VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO `db_region` VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO `db_region` VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO `db_region` VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO `db_region` VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO `db_region` VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO `db_region` VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO `db_region` VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO `db_region` VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO `db_region` VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO `db_region` VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO `db_region` VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO `db_region` VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO `db_region` VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO `db_region` VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO `db_region` VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO `db_region` VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO `db_region` VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO `db_region` VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO `db_region` VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO `db_region` VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO `db_region` VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO `db_region` VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO `db_region` VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO `db_region` VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO `db_region` VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO `db_region` VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO `db_region` VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO `db_region` VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO `db_region` VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO `db_region` VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO `db_region` VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO `db_region` VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO `db_region` VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO `db_region` VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO `db_region` VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO `db_region` VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO `db_region` VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO `db_region` VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO `db_region` VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO `db_region` VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO `db_region` VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO `db_region` VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO `db_region` VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO `db_region` VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO `db_region` VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO `db_region` VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO `db_region` VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO `db_region` VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO `db_region` VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO `db_region` VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO `db_region` VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO `db_region` VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO `db_region` VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO `db_region` VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO `db_region` VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO `db_region` VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO `db_region` VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO `db_region` VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO `db_region` VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO `db_region` VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO `db_region` VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO `db_region` VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO `db_region` VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO `db_region` VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO `db_region` VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO `db_region` VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO `db_region` VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO `db_region` VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO `db_region` VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO `db_region` VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO `db_region` VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO `db_region` VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO `db_region` VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO `db_region` VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO `db_region` VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO `db_region` VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO `db_region` VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO `db_region` VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO `db_region` VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO `db_region` VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO `db_region` VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO `db_region` VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO `db_region` VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO `db_region` VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO `db_region` VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO `db_region` VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO `db_region` VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO `db_region` VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO `db_region` VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO `db_region` VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO `db_region` VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO `db_region` VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO `db_region` VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO `db_region` VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO `db_region` VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO `db_region` VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO `db_region` VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO `db_region` VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO `db_region` VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO `db_region` VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO `db_region` VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO `db_region` VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO `db_region` VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO `db_region` VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO `db_region` VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO `db_region` VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO `db_region` VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO `db_region` VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO `db_region` VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO `db_region` VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO `db_region` VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO `db_region` VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO `db_region` VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO `db_region` VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO `db_region` VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO `db_region` VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO `db_region` VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO `db_region` VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO `db_region` VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO `db_region` VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO `db_region` VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO `db_region` VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO `db_region` VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO `db_region` VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO `db_region` VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO `db_region` VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO `db_region` VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO `db_region` VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO `db_region` VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO `db_region` VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO `db_region` VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO `db_region` VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO `db_region` VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO `db_region` VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO `db_region` VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO `db_region` VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO `db_region` VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO `db_region` VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO `db_region` VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO `db_region` VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO `db_region` VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO `db_region` VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO `db_region` VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO `db_region` VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO `db_region` VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO `db_region` VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO `db_region` VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO `db_region` VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO `db_region` VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO `db_region` VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO `db_region` VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO `db_region` VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO `db_region` VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO `db_region` VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO `db_region` VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO `db_region` VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO `db_region` VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO `db_region` VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO `db_region` VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO `db_region` VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO `db_region` VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO `db_region` VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO `db_region` VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO `db_region` VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO `db_region` VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO `db_region` VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO `db_region` VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO `db_region` VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO `db_region` VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO `db_region` VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO `db_region` VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO `db_region` VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO `db_region` VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO `db_region` VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO `db_region` VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO `db_region` VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO `db_region` VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO `db_region` VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO `db_region` VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO `db_region` VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO `db_region` VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO `db_region` VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO `db_region` VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO `db_region` VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO `db_region` VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO `db_region` VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO `db_region` VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO `db_region` VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO `db_region` VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO `db_region` VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO `db_region` VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO `db_region` VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO `db_region` VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO `db_region` VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO `db_region` VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO `db_region` VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO `db_region` VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO `db_region` VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO `db_region` VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO `db_region` VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO `db_region` VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO `db_region` VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO `db_region` VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO `db_region` VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO `db_region` VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO `db_region` VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO `db_region` VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO `db_region` VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO `db_region` VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO `db_region` VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO `db_region` VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO `db_region` VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO `db_region` VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO `db_region` VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO `db_region` VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO `db_region` VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO `db_region` VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO `db_region` VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO `db_region` VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO `db_region` VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO `db_region` VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO `db_region` VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO `db_region` VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO `db_region` VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO `db_region` VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO `db_region` VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO `db_region` VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO `db_region` VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO `db_region` VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO `db_region` VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO `db_region` VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO `db_region` VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO `db_region` VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO `db_region` VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO `db_region` VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO `db_region` VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO `db_region` VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO `db_region` VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO `db_region` VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO `db_region` VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO `db_region` VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO `db_region` VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO `db_region` VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO `db_region` VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO `db_region` VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO `db_region` VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO `db_region` VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO `db_region` VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO `db_region` VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO `db_region` VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO `db_region` VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO `db_region` VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO `db_region` VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO `db_region` VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO `db_region` VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO `db_region` VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO `db_region` VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO `db_region` VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO `db_region` VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO `db_region` VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO `db_region` VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO `db_region` VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO `db_region` VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO `db_region` VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO `db_region` VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO `db_region` VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO `db_region` VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO `db_region` VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO `db_region` VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO `db_region` VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO `db_region` VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO `db_region` VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO `db_region` VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO `db_region` VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO `db_region` VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO `db_region` VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO `db_region` VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO `db_region` VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO `db_region` VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO `db_region` VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO `db_region` VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO `db_region` VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO `db_region` VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO `db_region` VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO `db_region` VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO `db_region` VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO `db_region` VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO `db_region` VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO `db_region` VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO `db_region` VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO `db_region` VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO `db_region` VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO `db_region` VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO `db_region` VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO `db_region` VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO `db_region` VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO `db_region` VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO `db_region` VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO `db_region` VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO `db_region` VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO `db_region` VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO `db_region` VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO `db_region` VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO `db_region` VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO `db_region` VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO `db_region` VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO `db_region` VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO `db_region` VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO `db_region` VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO `db_region` VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO `db_region` VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO `db_region` VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO `db_region` VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO `db_region` VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO `db_region` VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO `db_region` VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO `db_region` VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO `db_region` VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO `db_region` VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO `db_region` VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO `db_region` VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO `db_region` VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO `db_region` VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO `db_region` VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO `db_region` VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO `db_region` VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO `db_region` VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO `db_region` VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO `db_region` VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO `db_region` VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO `db_region` VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO `db_region` VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO `db_region` VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO `db_region` VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO `db_region` VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO `db_region` VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO `db_region` VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO `db_region` VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO `db_region` VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO `db_region` VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO `db_region` VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO `db_region` VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO `db_region` VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO `db_region` VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO `db_region` VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO `db_region` VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO `db_region` VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO `db_region` VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO `db_region` VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO `db_region` VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO `db_region` VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO `db_region` VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO `db_region` VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO `db_region` VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO `db_region` VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO `db_region` VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO `db_region` VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO `db_region` VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO `db_region` VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO `db_region` VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO `db_region` VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO `db_region` VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO `db_region` VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO `db_region` VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO `db_region` VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO `db_region` VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO `db_region` VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO `db_region` VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO `db_region` VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO `db_region` VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO `db_region` VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO `db_region` VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO `db_region` VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO `db_region` VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO `db_region` VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO `db_region` VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO `db_region` VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO `db_region` VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO `db_region` VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO `db_region` VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO `db_region` VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO `db_region` VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO `db_region` VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO `db_region` VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO `db_region` VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO `db_region` VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO `db_region` VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO `db_region` VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO `db_region` VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO `db_region` VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO `db_region` VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO `db_region` VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO `db_region` VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO `db_region` VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO `db_region` VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO `db_region` VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO `db_region` VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO `db_region` VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO `db_region` VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO `db_region` VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO `db_region` VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO `db_region` VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO `db_region` VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO `db_region` VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO `db_region` VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO `db_region` VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO `db_region` VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO `db_region` VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO `db_region` VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO `db_region` VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO `db_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `db_region` VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO `db_region` VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO `db_region` VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO `db_region` VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO `db_region` VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO `db_region` VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO `db_region` VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO `db_region` VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO `db_region` VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO `db_region` VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO `db_region` VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO `db_region` VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO `db_region` VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO `db_region` VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO `db_region` VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO `db_region` VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO `db_region` VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO `db_region` VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO `db_region` VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO `db_region` VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO `db_region` VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO `db_region` VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO `db_region` VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO `db_region` VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO `db_region` VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO `db_region` VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO `db_region` VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO `db_region` VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO `db_region` VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO `db_region` VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO `db_region` VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO `db_region` VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO `db_region` VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO `db_region` VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO `db_region` VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO `db_region` VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO `db_region` VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO `db_region` VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO `db_region` VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO `db_region` VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO `db_region` VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO `db_region` VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO `db_region` VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO `db_region` VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO `db_region` VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO `db_region` VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO `db_region` VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO `db_region` VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO `db_region` VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO `db_region` VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO `db_region` VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO `db_region` VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO `db_region` VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO `db_region` VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO `db_region` VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO `db_region` VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO `db_region` VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO `db_region` VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO `db_region` VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO `db_region` VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO `db_region` VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO `db_region` VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO `db_region` VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO `db_region` VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO `db_region` VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO `db_region` VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO `db_region` VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO `db_region` VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO `db_region` VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO `db_region` VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO `db_region` VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO `db_region` VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO `db_region` VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO `db_region` VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO `db_region` VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO `db_region` VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO `db_region` VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO `db_region` VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO `db_region` VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO `db_region` VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO `db_region` VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO `db_region` VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO `db_region` VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO `db_region` VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO `db_region` VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO `db_region` VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `db_region` VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO `db_region` VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO `db_region` VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO `db_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `db_region` VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO `db_region` VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO `db_region` VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO `db_region` VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO `db_region` VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO `db_region` VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO `db_region` VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO `db_region` VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO `db_region` VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO `db_region` VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO `db_region` VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO `db_region` VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO `db_region` VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO `db_region` VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO `db_region` VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO `db_region` VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO `db_region` VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO `db_region` VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO `db_region` VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO `db_region` VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO `db_region` VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO `db_region` VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO `db_region` VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO `db_region` VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO `db_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO `db_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO `db_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO `db_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO `db_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO `db_region` VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO `db_region` VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO `db_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO `db_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO `db_region` VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO `db_region` VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO `db_region` VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO `db_region` VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO `db_region` VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO `db_region` VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO `db_region` VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO `db_region` VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO `db_region` VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO `db_region` VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO `db_region` VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO `db_region` VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO `db_region` VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO `db_region` VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO `db_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO `db_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO `db_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO `db_region` VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO `db_region` VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO `db_region` VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO `db_region` VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO `db_region` VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO `db_region` VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO `db_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO `db_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO `db_region` VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO `db_region` VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO `db_region` VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO `db_region` VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO `db_region` VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO `db_region` VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO `db_region` VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO `db_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO `db_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO `db_region` VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO `db_region` VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO `db_region` VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO `db_region` VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO `db_region` VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO `db_region` VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO `db_region` VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO `db_region` VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO `db_region` VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO `db_region` VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO `db_region` VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO `db_region` VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO `db_region` VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO `db_region` VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO `db_region` VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO `db_region` VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO `db_region` VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO `db_region` VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO `db_region` VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO `db_region` VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO `db_region` VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO `db_region` VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO `db_region` VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO `db_region` VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO `db_region` VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO `db_region` VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO `db_region` VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO `db_region` VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO `db_region` VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO `db_region` VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO `db_region` VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO `db_region` VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO `db_region` VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO `db_region` VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO `db_region` VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO `db_region` VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO `db_region` VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO `db_region` VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO `db_region` VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO `db_region` VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO `db_region` VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO `db_region` VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO `db_region` VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO `db_region` VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO `db_region` VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO `db_region` VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO `db_region` VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO `db_region` VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO `db_region` VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO `db_region` VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO `db_region` VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO `db_region` VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO `db_region` VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO `db_region` VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO `db_region` VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO `db_region` VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO `db_region` VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO `db_region` VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO `db_region` VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO `db_region` VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO `db_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO `db_region` VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO `db_region` VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO `db_region` VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO `db_region` VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO `db_region` VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO `db_region` VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO `db_region` VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO `db_region` VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO `db_region` VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO `db_region` VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO `db_region` VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO `db_region` VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO `db_region` VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO `db_region` VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO `db_region` VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO `db_region` VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO `db_region` VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO `db_region` VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO `db_region` VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO `db_region` VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO `db_region` VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO `db_region` VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO `db_region` VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO `db_region` VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO `db_region` VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO `db_region` VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO `db_region` VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO `db_region` VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO `db_region` VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO `db_region` VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO `db_region` VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO `db_region` VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO `db_region` VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO `db_region` VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO `db_region` VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO `db_region` VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO `db_region` VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO `db_region` VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO `db_region` VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO `db_region` VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO `db_region` VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO `db_region` VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO `db_region` VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO `db_region` VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO `db_region` VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO `db_region` VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO `db_region` VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO `db_region` VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO `db_region` VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO `db_region` VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO `db_region` VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO `db_region` VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO `db_region` VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO `db_region` VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO `db_region` VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO `db_region` VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO `db_region` VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO `db_region` VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO `db_region` VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO `db_region` VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO `db_region` VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO `db_region` VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO `db_region` VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO `db_region` VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO `db_region` VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO `db_region` VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO `db_region` VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO `db_region` VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO `db_region` VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO `db_region` VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO `db_region` VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO `db_region` VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO `db_region` VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO `db_region` VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO `db_region` VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO `db_region` VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO `db_region` VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO `db_region` VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO `db_region` VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO `db_region` VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO `db_region` VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO `db_region` VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO `db_region` VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO `db_region` VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO `db_region` VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO `db_region` VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO `db_region` VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO `db_region` VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO `db_region` VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO `db_region` VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO `db_region` VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO `db_region` VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO `db_region` VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO `db_region` VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO `db_region` VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO `db_region` VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO `db_region` VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO `db_region` VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO `db_region` VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO `db_region` VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO `db_region` VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO `db_region` VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO `db_region` VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO `db_region` VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO `db_region` VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO `db_region` VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO `db_region` VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO `db_region` VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO `db_region` VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO `db_region` VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO `db_region` VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO `db_region` VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO `db_region` VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO `db_region` VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO `db_region` VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO `db_region` VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO `db_region` VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO `db_region` VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO `db_region` VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO `db_region` VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO `db_region` VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO `db_region` VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO `db_region` VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO `db_region` VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO `db_region` VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO `db_region` VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO `db_region` VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO `db_region` VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO `db_region` VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO `db_region` VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO `db_region` VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO `db_region` VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO `db_region` VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO `db_region` VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO `db_region` VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO `db_region` VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO `db_region` VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO `db_region` VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO `db_region` VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO `db_region` VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO `db_region` VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO `db_region` VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO `db_region` VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO `db_region` VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO `db_region` VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO `db_region` VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO `db_region` VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO `db_region` VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO `db_region` VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO `db_region` VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO `db_region` VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO `db_region` VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO `db_region` VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO `db_region` VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO `db_region` VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO `db_region` VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO `db_region` VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO `db_region` VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO `db_region` VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO `db_region` VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO `db_region` VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO `db_region` VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO `db_region` VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO `db_region` VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO `db_region` VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO `db_region` VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO `db_region` VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO `db_region` VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO `db_region` VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO `db_region` VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO `db_region` VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO `db_region` VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO `db_region` VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO `db_region` VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO `db_region` VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO `db_region` VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO `db_region` VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO `db_region` VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO `db_region` VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO `db_region` VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO `db_region` VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO `db_region` VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO `db_region` VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO `db_region` VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO `db_region` VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO `db_region` VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO `db_region` VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO `db_region` VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO `db_region` VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO `db_region` VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO `db_region` VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO `db_region` VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO `db_region` VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO `db_region` VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO `db_region` VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO `db_region` VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO `db_region` VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO `db_region` VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO `db_region` VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO `db_region` VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO `db_region` VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO `db_region` VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO `db_region` VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO `db_region` VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO `db_region` VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO `db_region` VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO `db_region` VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO `db_region` VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO `db_region` VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO `db_region` VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO `db_region` VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO `db_region` VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO `db_region` VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO `db_region` VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO `db_region` VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO `db_region` VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO `db_region` VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO `db_region` VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO `db_region` VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO `db_region` VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO `db_region` VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO `db_region` VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO `db_region` VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO `db_region` VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO `db_region` VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO `db_region` VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO `db_region` VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO `db_region` VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO `db_region` VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO `db_region` VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO `db_region` VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO `db_region` VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO `db_region` VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO `db_region` VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO `db_region` VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO `db_region` VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO `db_region` VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO `db_region` VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO `db_region` VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO `db_region` VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO `db_region` VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO `db_region` VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO `db_region` VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO `db_region` VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO `db_region` VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO `db_region` VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO `db_region` VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO `db_region` VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO `db_region` VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO `db_region` VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO `db_region` VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO `db_region` VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO `db_region` VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO `db_region` VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO `db_region` VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO `db_region` VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO `db_region` VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO `db_region` VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO `db_region` VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO `db_region` VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO `db_region` VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO `db_region` VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO `db_region` VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO `db_region` VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO `db_region` VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO `db_region` VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO `db_region` VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO `db_region` VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO `db_region` VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO `db_region` VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO `db_region` VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO `db_region` VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO `db_region` VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO `db_region` VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO `db_region` VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO `db_region` VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO `db_region` VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO `db_region` VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO `db_region` VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO `db_region` VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO `db_region` VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO `db_region` VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO `db_region` VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO `db_region` VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO `db_region` VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO `db_region` VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO `db_region` VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO `db_region` VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO `db_region` VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO `db_region` VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO `db_region` VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO `db_region` VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO `db_region` VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO `db_region` VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO `db_region` VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO `db_region` VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO `db_region` VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO `db_region` VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO `db_region` VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO `db_region` VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO `db_region` VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO `db_region` VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO `db_region` VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO `db_region` VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO `db_region` VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO `db_region` VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO `db_region` VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO `db_region` VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO `db_region` VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO `db_region` VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO `db_region` VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO `db_region` VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO `db_region` VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO `db_region` VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO `db_region` VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO `db_region` VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO `db_region` VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO `db_region` VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO `db_region` VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO `db_region` VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO `db_region` VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO `db_region` VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO `db_region` VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO `db_region` VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO `db_region` VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO `db_region` VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO `db_region` VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO `db_region` VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO `db_region` VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO `db_region` VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO `db_region` VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO `db_region` VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO `db_region` VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO `db_region` VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO `db_region` VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO `db_region` VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO `db_region` VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO `db_region` VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO `db_region` VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO `db_region` VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO `db_region` VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO `db_region` VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO `db_region` VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO `db_region` VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO `db_region` VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO `db_region` VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO `db_region` VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO `db_region` VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO `db_region` VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO `db_region` VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO `db_region` VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO `db_region` VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO `db_region` VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO `db_region` VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO `db_region` VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO `db_region` VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO `db_region` VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO `db_region` VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO `db_region` VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO `db_region` VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO `db_region` VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO `db_region` VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO `db_region` VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO `db_region` VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO `db_region` VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO `db_region` VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO `db_region` VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO `db_region` VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO `db_region` VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO `db_region` VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO `db_region` VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO `db_region` VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO `db_region` VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO `db_region` VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO `db_region` VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO `db_region` VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO `db_region` VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO `db_region` VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO `db_region` VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO `db_region` VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO `db_region` VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO `db_region` VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO `db_region` VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO `db_region` VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO `db_region` VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO `db_region` VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO `db_region` VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO `db_region` VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO `db_region` VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO `db_region` VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO `db_region` VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO `db_region` VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO `db_region` VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO `db_region` VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO `db_region` VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO `db_region` VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO `db_region` VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO `db_region` VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO `db_region` VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO `db_region` VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO `db_region` VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO `db_region` VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO `db_region` VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO `db_region` VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO `db_region` VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO `db_region` VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO `db_region` VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO `db_region` VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO `db_region` VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO `db_region` VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO `db_region` VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO `db_region` VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO `db_region` VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO `db_region` VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO `db_region` VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO `db_region` VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO `db_region` VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO `db_region` VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO `db_region` VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO `db_region` VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO `db_region` VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO `db_region` VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO `db_region` VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO `db_region` VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO `db_region` VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO `db_region` VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO `db_region` VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO `db_region` VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO `db_region` VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO `db_region` VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO `db_region` VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO `db_region` VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO `db_region` VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO `db_region` VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO `db_region` VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO `db_region` VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO `db_region` VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO `db_region` VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO `db_region` VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO `db_region` VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO `db_region` VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO `db_region` VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO `db_region` VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO `db_region` VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO `db_region` VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO `db_region` VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO `db_region` VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO `db_region` VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO `db_region` VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO `db_region` VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO `db_region` VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO `db_region` VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO `db_region` VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO `db_region` VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO `db_region` VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO `db_region` VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO `db_region` VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO `db_region` VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO `db_region` VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO `db_region` VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO `db_region` VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO `db_region` VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO `db_region` VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO `db_region` VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO `db_region` VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO `db_region` VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO `db_region` VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO `db_region` VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO `db_region` VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO `db_region` VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO `db_region` VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO `db_region` VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO `db_region` VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO `db_region` VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO `db_region` VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO `db_region` VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO `db_region` VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO `db_region` VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO `db_region` VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO `db_region` VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO `db_region` VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO `db_region` VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO `db_region` VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO `db_region` VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO `db_region` VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO `db_region` VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO `db_region` VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO `db_region` VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO `db_region` VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO `db_region` VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO `db_region` VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO `db_region` VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO `db_region` VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO `db_region` VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO `db_region` VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO `db_region` VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO `db_region` VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO `db_region` VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO `db_region` VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO `db_region` VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO `db_region` VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO `db_region` VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO `db_region` VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO `db_region` VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO `db_region` VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO `db_region` VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO `db_region` VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO `db_region` VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO `db_region` VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO `db_region` VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO `db_region` VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO `db_region` VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO `db_region` VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO `db_region` VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO `db_region` VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO `db_region` VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO `db_region` VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO `db_region` VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO `db_region` VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO `db_region` VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO `db_region` VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO `db_region` VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO `db_region` VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO `db_region` VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO `db_region` VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO `db_region` VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO `db_region` VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO `db_region` VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO `db_region` VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO `db_region` VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO `db_region` VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO `db_region` VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO `db_region` VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO `db_region` VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO `db_region` VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO `db_region` VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO `db_region` VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO `db_region` VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO `db_region` VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO `db_region` VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO `db_region` VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO `db_region` VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO `db_region` VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO `db_region` VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO `db_region` VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO `db_region` VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO `db_region` VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO `db_region` VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO `db_region` VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO `db_region` VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO `db_region` VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO `db_region` VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO `db_region` VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO `db_region` VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO `db_region` VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO `db_region` VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO `db_region` VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO `db_region` VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO `db_region` VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO `db_region` VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO `db_region` VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO `db_region` VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO `db_region` VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO `db_region` VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO `db_region` VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO `db_region` VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO `db_region` VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO `db_region` VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO `db_region` VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO `db_region` VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO `db_region` VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO `db_region` VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO `db_region` VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO `db_region` VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO `db_region` VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO `db_region` VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO `db_region` VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO `db_region` VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO `db_region` VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO `db_region` VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO `db_region` VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO `db_region` VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO `db_region` VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO `db_region` VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO `db_region` VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO `db_region` VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO `db_region` VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO `db_region` VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO `db_region` VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO `db_region` VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO `db_region` VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO `db_region` VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO `db_region` VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO `db_region` VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO `db_region` VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO `db_region` VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO `db_region` VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO `db_region` VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO `db_region` VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO `db_region` VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO `db_region` VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO `db_region` VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO `db_region` VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO `db_region` VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO `db_region` VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO `db_region` VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO `db_region` VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO `db_region` VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO `db_region` VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO `db_region` VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO `db_region` VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO `db_region` VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO `db_region` VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO `db_region` VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO `db_region` VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO `db_region` VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO `db_region` VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO `db_region` VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO `db_region` VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO `db_region` VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO `db_region` VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO `db_region` VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO `db_region` VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO `db_region` VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO `db_region` VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO `db_region` VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO `db_region` VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO `db_region` VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO `db_region` VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO `db_region` VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO `db_region` VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO `db_region` VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO `db_region` VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO `db_region` VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO `db_region` VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO `db_region` VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO `db_region` VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO `db_region` VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO `db_region` VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO `db_region` VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO `db_region` VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO `db_region` VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO `db_region` VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO `db_region` VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO `db_region` VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO `db_region` VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO `db_region` VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO `db_region` VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO `db_region` VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO `db_region` VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO `db_region` VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO `db_region` VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO `db_region` VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO `db_region` VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO `db_region` VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO `db_region` VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO `db_region` VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO `db_region` VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO `db_region` VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO `db_region` VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO `db_region` VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO `db_region` VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO `db_region` VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO `db_region` VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO `db_region` VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO `db_region` VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO `db_region` VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO `db_region` VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO `db_region` VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO `db_region` VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO `db_region` VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO `db_region` VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO `db_region` VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO `db_region` VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO `db_region` VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO `db_region` VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO `db_region` VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO `db_region` VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO `db_region` VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO `db_region` VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO `db_region` VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO `db_region` VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO `db_region` VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO `db_region` VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO `db_region` VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO `db_region` VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO `db_region` VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO `db_region` VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO `db_region` VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO `db_region` VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO `db_region` VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO `db_region` VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO `db_region` VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO `db_region` VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO `db_region` VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO `db_region` VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO `db_region` VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO `db_region` VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO `db_region` VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO `db_region` VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO `db_region` VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO `db_region` VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO `db_region` VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO `db_region` VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO `db_region` VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO `db_region` VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO `db_region` VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO `db_region` VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO `db_region` VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO `db_region` VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO `db_region` VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO `db_region` VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO `db_region` VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO `db_region` VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO `db_region` VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO `db_region` VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO `db_region` VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO `db_region` VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO `db_region` VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO `db_region` VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO `db_region` VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO `db_region` VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO `db_region` VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO `db_region` VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO `db_region` VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO `db_region` VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO `db_region` VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO `db_region` VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO `db_region` VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO `db_region` VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO `db_region` VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO `db_region` VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO `db_region` VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO `db_region` VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO `db_region` VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO `db_region` VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO `db_region` VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO `db_region` VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO `db_region` VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO `db_region` VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO `db_region` VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO `db_region` VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO `db_region` VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO `db_region` VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO `db_region` VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO `db_region` VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO `db_region` VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO `db_region` VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO `db_region` VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO `db_region` VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO `db_region` VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO `db_region` VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO `db_region` VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO `db_region` VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO `db_region` VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO `db_region` VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO `db_region` VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO `db_region` VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO `db_region` VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO `db_region` VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO `db_region` VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO `db_region` VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO `db_region` VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO `db_region` VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO `db_region` VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO `db_region` VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO `db_region` VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO `db_region` VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO `db_region` VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO `db_region` VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO `db_region` VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO `db_region` VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO `db_region` VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO `db_region` VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO `db_region` VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO `db_region` VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO `db_region` VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO `db_region` VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO `db_region` VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO `db_region` VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO `db_region` VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO `db_region` VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO `db_region` VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO `db_region` VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO `db_region` VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO `db_region` VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO `db_region` VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO `db_region` VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO `db_region` VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO `db_region` VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO `db_region` VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO `db_region` VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO `db_region` VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO `db_region` VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO `db_region` VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO `db_region` VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO `db_region` VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO `db_region` VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO `db_region` VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO `db_region` VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO `db_region` VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO `db_region` VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO `db_region` VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO `db_region` VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO `db_region` VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO `db_region` VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO `db_region` VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO `db_region` VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO `db_region` VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO `db_region` VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO `db_region` VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO `db_region` VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO `db_region` VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO `db_region` VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO `db_region` VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO `db_region` VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO `db_region` VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO `db_region` VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO `db_region` VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO `db_region` VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO `db_region` VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO `db_region` VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO `db_region` VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO `db_region` VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO `db_region` VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO `db_region` VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO `db_region` VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO `db_region` VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO `db_region` VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO `db_region` VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO `db_region` VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO `db_region` VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO `db_region` VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO `db_region` VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO `db_region` VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO `db_region` VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO `db_region` VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO `db_region` VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO `db_region` VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO `db_region` VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO `db_region` VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO `db_region` VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO `db_region` VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO `db_region` VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO `db_region` VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO `db_region` VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO `db_region` VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO `db_region` VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO `db_region` VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO `db_region` VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO `db_region` VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO `db_region` VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO `db_region` VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO `db_region` VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO `db_region` VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO `db_region` VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO `db_region` VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO `db_region` VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO `db_region` VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO `db_region` VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO `db_region` VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO `db_region` VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO `db_region` VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO `db_region` VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO `db_region` VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO `db_region` VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO `db_region` VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO `db_region` VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO `db_region` VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO `db_region` VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO `db_region` VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO `db_region` VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO `db_region` VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO `db_region` VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO `db_region` VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO `db_region` VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO `db_region` VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO `db_region` VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO `db_region` VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO `db_region` VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO `db_region` VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO `db_region` VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO `db_region` VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO `db_region` VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO `db_region` VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO `db_region` VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO `db_region` VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO `db_region` VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO `db_region` VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO `db_region` VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO `db_region` VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO `db_region` VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO `db_region` VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO `db_region` VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO `db_region` VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO `db_region` VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO `db_region` VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO `db_region` VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO `db_region` VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO `db_region` VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO `db_region` VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO `db_region` VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO `db_region` VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO `db_region` VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO `db_region` VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO `db_region` VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO `db_region` VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO `db_region` VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO `db_region` VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO `db_region` VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO `db_region` VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO `db_region` VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO `db_region` VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO `db_region` VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO `db_region` VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO `db_region` VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO `db_region` VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO `db_region` VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO `db_region` VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO `db_region` VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO `db_region` VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO `db_region` VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO `db_region` VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO `db_region` VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO `db_region` VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO `db_region` VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO `db_region` VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO `db_region` VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO `db_region` VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO `db_region` VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO `db_region` VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO `db_region` VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO `db_region` VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO `db_region` VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO `db_region` VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO `db_region` VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO `db_region` VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO `db_region` VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO `db_region` VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO `db_region` VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO `db_region` VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO `db_region` VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO `db_region` VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO `db_region` VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO `db_region` VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO `db_region` VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO `db_region` VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO `db_region` VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO `db_region` VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO `db_region` VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO `db_region` VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO `db_region` VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO `db_region` VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO `db_region` VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO `db_region` VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO `db_region` VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO `db_region` VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO `db_region` VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO `db_region` VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO `db_region` VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO `db_region` VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO `db_region` VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO `db_region` VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO `db_region` VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO `db_region` VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO `db_region` VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO `db_region` VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO `db_region` VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO `db_region` VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO `db_region` VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO `db_region` VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO `db_region` VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO `db_region` VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO `db_region` VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO `db_region` VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO `db_region` VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO `db_region` VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO `db_region` VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO `db_region` VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO `db_region` VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO `db_region` VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO `db_region` VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO `db_region` VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO `db_region` VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO `db_region` VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO `db_region` VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO `db_region` VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO `db_region` VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO `db_region` VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO `db_region` VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO `db_region` VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO `db_region` VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO `db_region` VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO `db_region` VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO `db_region` VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO `db_region` VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO `db_region` VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO `db_region` VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO `db_region` VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO `db_region` VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO `db_region` VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO `db_region` VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO `db_region` VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO `db_region` VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO `db_region` VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO `db_region` VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO `db_region` VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO `db_region` VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO `db_region` VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO `db_region` VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO `db_region` VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO `db_region` VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO `db_region` VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO `db_region` VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO `db_region` VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO `db_region` VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO `db_region` VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO `db_region` VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO `db_region` VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO `db_region` VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO `db_region` VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO `db_region` VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO `db_region` VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO `db_region` VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO `db_region` VALUES ('3373', '395', '深水埗区', '3', '0');
INSERT INTO `db_region` VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO `db_region` VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO `db_region` VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO `db_region` VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO `db_region` VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO `db_region` VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO `db_region` VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO `db_region` VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO `db_region` VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO `db_region` VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO `db_region` VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO `db_region` VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO `db_region` VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO `db_region` VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO `db_region` VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO `db_region` VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO `db_region` VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO `db_region` VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO `db_region` VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO `db_region` VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO `db_region` VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO `db_region` VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO `db_region` VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO `db_region` VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO `db_region` VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO `db_region` VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO `db_region` VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO `db_region` VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO `db_region` VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO `db_region` VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO `db_region` VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO `db_region` VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO `db_region` VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO `db_region` VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO `db_region` VALUES ('3408', '3401', '肥西县', '3', '0');

-- ----------------------------
-- Table structure for `db_role`
-- ----------------------------
DROP TABLE IF EXISTS `db_role`;
CREATE TABLE `db_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) DEFAULT '',
  `role_describe` text,
  `action_list` text NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `admin_user_name` (`role_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='管理角色';

-- ----------------------------
-- Records of db_role
-- ----------------------------
INSERT INTO `db_role` VALUES ('1', '第一个角色名称', '第一个角色的描述', 'goods_manage,remove_back,cat_manage,cat_drop,attr_manage,brand_manage,comment_priv,tag_manage,goods_type,goods_auto,virualcard,picture_batch,goods_export,goods_batch,gen_goods_script,topic_manage,suppliers_goods,article_cat,article_manage,shopinfo_manage,shophelp_manage,vote_priv,article_auto,feedback_priv,integrate_users,sync_users,users_manage,users_drop,user_rank,surplus_manage,account_manage,template_manage,admin_,manage,admin_drop,allot_priv,logs_manage,logs_drop,agency_manage,suppliers_manage,role_manage,shop_config,shop_manage,payment,shoparea_manage,area_manage,friendlink,db_backup,db_renew,flash_manage,navigator,cron,affiliate,affiliate_ck,sitemap,file_priv,file_check,reg_fields,shop_authorized,webcollect_manage,order_os_edit,order_ps_edit,order_ss_edit,order_edit,order_view,order_view_finished,repay_manage,booking,sale_order_stats,client_flow_stats,delivery_view,back_view,snatch_manage,ad_manage,gift_manage,card_manage,pack,bonus_manage,auction,group_by,favourable,whole_sale,package_manage,exchange_goods,attention_list,email_list,magazine_list,view_sendlist,template_select,template_setup,library_manage,lang_edit,backup_setting,mail_template,db_backup,db_renew,db_optimize,sql_query,convert,my_info,sms_send,sms_charge,send_history,charge_history');
INSERT INTO `db_role` VALUES ('2', '第二个角色名称', '第二个角色的描述', 'goods_manage,remove_back,cat_manage,cat_drop,attr_manage,brand_manage,comment_priv,tag_manage,goods_type,goods_auto,virualcard,picture_batch,goods_export,goods_batch,gen_goods_script,topic_manage,suppliers_goods,article_cat,article_manage,shopinfo_manage,shophelp_manage,vote_priv,article_auto,feedback_priv,integrate_users,sync_users,users_manage,users_drop,user_rank,surplus_manage,account_manage,template_manage,admin_,manage,admin_drop,allot_priv,logs_manage,logs_drop,agency_manage,suppliers_manage,role_manage,shop_config,shop_manage,payment,shoparea_manage,area_manage,friendlink,db_backup,db_renew,flash_manage,navigator,cron,affiliate,affiliate_ck,sitemap,file_priv,file_check,reg_fields,shop_authorized,webcollect_manage,order_os_edit,order_ps_edit,order_ss_edit,order_edit,order_view,order_view_finished,repay_manage,booking,sale_order_stats,client_flow_stats,delivery_view,back_view,snatch_manage,ad_manage,gift_manage,card_manage,pack,bonus_manage,auction,group_by,favourable,whole_sale,package_manage,exchange_goods,attention_list,email_list,magazine_list,view_sendlist,template_select,template_setup,library_manage,lang_edit,backup_setting,mail_template,db_backup,db_renew,db_optimize,sql_query,convert,my_info,sms_send,sms_charge,send_history,charge_history');

-- ----------------------------
-- Table structure for `db_shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `db_shop_config`;
CREATE TABLE `db_shop_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `input_name` varchar(255) DEFAULT NULL,
  `input_attribute` varchar(30) NOT NULL DEFAULT '',
  `input_value` text NOT NULL,
  `input_description` varchar(255) DEFAULT NULL,
  `input_type` varchar(10) NOT NULL DEFAULT '',
  `input_range` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `is_show` tinyint(1) DEFAULT NULL,
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `input_attribute` (`input_attribute`) USING BTREE,
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=904 DEFAULT CHARSET=utf8 COMMENT='管理网店设置';

-- ----------------------------
-- Records of db_shop_config
-- ----------------------------
INSERT INTO `db_shop_config` VALUES ('1', '0', '网店信息', 'shop_info0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('2', '0', '基本设置', 'basic0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('3', '0', '显示设置', 'display0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('4', '0', '购物流程', 'shopping_flow0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('5', '0', '邮件服务器设置', 'smtp0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('6', '0', '隐藏设置', 'hidden0', '', null, 'hidden0', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('7', '0', '商品显示设置', 'goods0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('8', '0', '短信设置', 'sms0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('9', '0', 'WAP设置', 'wap0', '', null, 'group0', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('101', '1', '商品名称', 'shop_name', 'ECSHOP', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('102', '1', '商店标题', 'shop_title', 'ECSHOP演示站', '商店的标题将显示在浏览器的标题栏', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('103', '1', '商店描述', 'shop_desc', 'ECSHOP演示站', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('104', '1', '商店关键字', 'shop_keywords', 'ECSHOP演示站', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('105', '1', '所在国家', 'shop_country', '1', null, 'select', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('106', '1', '所在省份', 'shop_province', '2', null, 'select', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('107', '1', '所在城市', 'shop_city', '52', null, 'select', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('108', '1', '详细地址', 'shop_address', '', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('109', '1', '客服QQ号码', 'qq', '', '如果您有多个客服的QQ号码，请在每个号码之间使用半角逗号（,）分隔。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('110', '1', '淘宝旺旺', 'ww', '', '如果您有多个客服的淘宝旺旺号码，请在每个号码之间使用半角逗号（,）分隔。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('111', '1', 'Skype', 'skype', '', '如果您有多个客服的Skype号码，请在每个号码之间使用半角逗号（,）分隔。提示：你需要在你的Skype隐私设置中启用状态显示功能', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('112', '1', 'Yahoo Messenger', 'ym', '', '如果您有多个客服的 Yahoo Messenger 号码，请在每个号码之间使用半角逗号（,）分隔。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('113', '1', 'MSN Messenger', 'msn', '', '如果您有多个客服的MSN号码，请在每个号码之间使用半角逗号（,）分隔。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('114', '1', '客服邮件地址', 'service_email', '', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('115', '1', '客服电话', 'service_phone', '', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('116', '1', '暂时关闭网站', 'shop_closed', '0', null, 'radio', '0::否|1::是', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('117', '1', '关闭网店的原因', 'close_comment', '', null, 'textarea', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('118', '1', '商店 Logo', 'shop_logo', '', '请在上传前将图片的文件名命名为logo.gif', 'file', '', '1', '1', '../themes/{$template}/images/');
INSERT INTO `db_shop_config` VALUES ('119', '1', '是否显示 Licensed', 'licensed', '1', null, 'radio', '0::否|1::是', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('120', '1', '用户中心公告', 'user_notice', '用户中心公告！', '该信息将在用户中心欢迎页面显示', 'textarea', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('121', '1', '商店公告', 'shop_notice', '欢迎光临手机网,我们的宗旨：诚信经营、服务客户！\r\n<MARQUEE onmouseover=this.stop() onmouseout=this.start() \r\nscrollAmount=3><U><FONT color=red>\r\n<P>咨询电话010-10124444  010-21252454 8465544</P></FONT></U></MARQUEE>', '以上内容将显示在首页商店公告中,注意控制公告内容长度不要超过公告显示区域大小。', 'textarea', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('122', '1', '是否关闭注册', 'shop_reg_closed', '0', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('201', '2', '系统语言', 'lang', 'zh_cn', null, 'select', 'en_us::en_us|zh_cn::zh_cn|zh_tw::zh_tw', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('202', '2', 'ICP证书或ICP备案证书号', 'icp_number', '', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('203', '2', 'ICP备案证书文件', 'icp_file', '', null, 'file', '', '1', '1', '../cert/');
INSERT INTO `db_shop_config` VALUES ('204', '2', '水印文件', 'watermark', '', '水印文件须为gif格式才可支持透明度设置。', 'file', '', '1', '1', '../images/');
INSERT INTO `db_shop_config` VALUES ('205', '2', '水印位置', 'watermark_place', '1', null, 'radio', '0::无|1::左上|2::右上|3::居中|4::左下|5::右下', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('206', '2', '水印透明度', 'watermark_alpha', '65', '水印的透明度，可选值为0-100。当设置为100时则为不透明。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('207', '2', '是否启用库存管理', 'use_storage', '1', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('208', '2', '市场价格比例', 'market_price_rate', '1.2', '输入商品售价时将自动根据该比例计算市场价格', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('209', '2', 'URL重写', 'rewrite', '0', 'URL重写是一种搜索引擎优化技术，可以将动态的地址模拟成静态的HTML文件。需要Apache的支持。', 'radio', '0::禁用|1::简单重写|2::复杂重写', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('210', '2', '消费积分名称', 'integral_name', '积分', '您可以将消费积分重新命名。例如：烧币', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('211', '2', '积分换算比例', 'integral_scale', '1', '每100积分可抵多少元现金', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('212', '2', '积分支付比例', 'integral_percent', '1', '每100元商品最多可以使用多少元积分', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('213', '2', '商品货号前缀', 'sn_prefix', 'ECS', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('214', '2', '用户评论是否需要审核', 'comment_check', '1', null, 'radio', '0::不需要审核|1::需要审核', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('215', '2', '商品的默认图片', 'no_picture', '', null, 'file', '', '1', '1', '../images/');
INSERT INTO `db_shop_config` VALUES ('218', '2', '统计代码', 'stats_code', '', '您可以将其他访问统计服务商提供的代码添加到每一个页面。', 'textarea', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('219', '2', '缓存存活时间', 'cache_time', '3600', '前台页面缓存的存活时间，以秒为单位。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('220', '2', '会员注册赠送积分', 'register_points', '0', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('221', '2', '是否启用Gzip模式', 'enable_gzip', '0', '启用Gzip模式可压缩发送页面大小，加快网页传输。需要php支持Gzip。如果已经用Apache等对页面进行Gzip压缩，请禁止该功能。', 'radio', '0::禁用|1::启用', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('222', '2', '排行统计的时间', 'top10_time', '0', null, 'radio', '0::所有|1::一年|2::半年|3::三个月|4::一个月', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('223', '2', '默认时区', 'timezone', '8', null, 'select', '-12::(GMT -12:00) Eniwetok, Kwajalein|-11::(GMT -11:00) Midway Island, Samoa|-10::(GMT -10:00) Hawaii|-9::(GMT -09:00) Alaska|-8::(GMT -08:00) Pacific Time (US &amp; Canada), Tijuana|-7::(GMT -07:00) Mountain Time (US &amp; Canada), Arizona|-6::(GMT -06:00) Central Time (US &amp; Canada), Mexico City|-5::(GMT -05:00) Eastern Time (US &amp; Canada), Bogota, Lima, Quito|-4::(GMT -04:00) Atlantic Time (Canada), Caracas, La Paz|-3.5::(GMT -03:30) Newfoundland|-3::(GMT -03:00) Brassila, Buenos Aires, Georgetown, Falkland Is|-2::(GMT -02:00) Mid-Atlantic, Ascension Is., St. Helena|-1::(GMT -01:00) Azores, Cape Verde Islands|0::(GMT) Casablanca, Dublin, Edinburgh, London, Lisbon, Monrovia|1::(GMT +01:00) Amsterdam, Berlin, Brussels, Madrid, Paris, Rome|2::(GMT +02:00) Cairo, Helsinki, Kaliningrad, South Africa|3::(GMT +03:00) Baghdad, Riyadh, Moscow, Nairobi|3.5::(GMT +03:30) Tehran|4::(GMT +04:00) Abu Dhabi, Baku, Muscat, Tbilisi|4.5::(GMT +04:30) Kabul|5::(GMT +05:00) Ekaterinburg, Islamabad, Karachi, Tashkent|5.5::(GMT +05:30) Bombay, Calcutta, Madras, New Delhi|5.75::(GMT +05:45) Katmandu|6::(GMT +06:00) Almaty, Colombo, Dhaka, Novosibirsk|6.5::(GMT +06:30) Rangoon|7::(GMT +07:00) Bangkok, Hanoi, Jakarta|8::(GMT +08:00) Beijing, Hong Kong, Perth, Singapore, Taipei|9::(GMT +09:00) Osaka, Sapporo, Seoul, Tokyo, Yakutsk|9.5::(GMT +09:30) Adelaide, Darwin|10::(GMT +10:00) Canberra, Guam, Melbourne, Sydney, Vladivostok|11::(GMT +11:00) Magadan, New Caledonia, Solomon Islands|12::(GMT +12:00) Auckland, Wellington, Fiji, Marshall Island', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('224', '2', '附件上传大小', 'upload_size_limit', '64', null, 'select', '-1::服务器默认设置|0::0KB|64::64KB|128::128KB|256::256KB|512::512KB|1024::1MB|2048::2MB|4096::4MB', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('226', '2', '是否开启命令行调用计划任务', 'cron_method', '0', null, 'radio', '0::否|1::是', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('227', '2', '商品评论的条件', 'comment_factor', '0', '选取较高的评论条件可以有效的减少垃圾评论的产生。只有用户订单完成后才认为该用户有购买行为', 'radio', '0::所有用户|1::仅登录用户|2::有过一次以上购买行为用户|3::仅购买过该商品用户', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('228', '2', '是否开启订单提醒', 'enable_order_check', '1', null, 'radio', '0::否|1::是', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('229', '2', '默认库存', 'default_storage', '1', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('230', '2', '缩略图背景色', 'bgcolor', '#FFFFFF', '颜色请以#FFFFFF格式填写', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('231', '2', '站点访问统计', 'visit_stats', 'on', null, 'radio', 'on::开启|off::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('232', '2', '是否开启自动发送邮件', 'send_mail_on', 'off', '启用该选项登录后台时，会自动发送邮件队列中尚未发送的邮件', 'radio', 'on::开启|off::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('233', '2', '上传商品是否自动生成相册图', 'auto_generate_gallery', '1', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('234', '2', '上传商品是否保留原图', 'retain_original_img', '1', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('235', '2', '是否开启会员邮件验证', 'member_email_validate', '1', null, 'radio', '1::开启|0::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('236', '2', '是否开启留言板功能', 'message_board', '1', null, 'radio', '1::开启|0::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('239', '2', '', 'certificate_id', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('240', '2', null, 'token', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('241', '2', null, 'certi', 'http://service.shopex.cn/openapi/api.php', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('242', '2', '用户注册时自动发送验证邮件', 'send_verify_email', '0', '“是否开启会员邮件验证”设为开启时才可使用此功能', 'radio', '1::开启|0::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('243', '2', null, 'ent_id', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('244', '2', null, 'ent_ac', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('245', '2', null, 'ent_sign', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('246', '2', null, 'ent_email', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('301', '3', '', 'date_format', 'Y-m-d', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('302', '3', '时间格式', 'time_format', 'Y-m-d H:i:s', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('303', '3', '货币格式', 'currency_format', '￥%s元', '显示商品价格的格式，%s将被替换为相应的价格数字。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('304', '3', '缩略图宽度', 'thumb_width', '100', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('305', '3', '缩略图高度', 'thumb_height', '100', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('306', '3', '商品图片宽度', 'image_width', '230', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('307', '3', '商品图片高度', 'image_height', '230', '如果您的服务器支持GD，在您上传商品图片的时候将自动将图片缩小到指定的尺寸。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('312', '3', '销量排行数量', 'top_number', '10', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('313', '3', '浏览历史数量', 'history_number', '5', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('314', '3', '评论数量', 'comments_number', '5', '显示在商品详情页的用户评论数量。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('315', '3', '相关商品数量', 'bought_goods', '3', '显示多少个购买此商品的人还买过哪些商品', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('316', '3', '最新文章显示数量', 'article_number', '8', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('317', '3', '商品名称的长度', 'goods_name_length', '7', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('318', '3', '商品价格显示规则', 'price_format', '5', null, 'radio', '0::不处理|1::保留不为0的尾数|2::不四舍五入，保留一位小数|3::不四舍五入，不保留小数|4::先四舍五入，保留一位小数|5::先四舍五入，不保留小数', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('319', '3', '商品分类页列表的数量', 'page_size', '10', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('320', '3', '商品分类页默认排序类型', 'sort_order_type', '0', null, 'radio', '0::按上架时间|1::按商品价格|2::按最后更新时间', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('321', '3', '商品分类页默认排序方式', 'sort_order_method', '0', null, 'radio', '0::降序排列|1::升序排列', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('322', '3', '商品分类页默认显示方式', 'show_order_type', '1', null, 'radio', '0::列表显示|1::表格显示|2::文本显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('323', '3', '属性关联的商品数量', 'attr_related_number', '5', '在商品详情页面显示多少个属性关联的商品。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('324', '3', '商品详情页相册图片数量', 'goods_gallery_number', '5', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('325', '3', '文章标题长度', 'article_title_length', '16', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('326', '3', '一级配送区域名称', 'name_of_region_1', '国家', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('327', '3', '二级配送区域名称', 'name_of_region_2', '省', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('328', '3', '三级配送区域名称', 'name_of_region_3', '市', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('329', '3', '四级配送区域名称', 'name_of_region_4', '区', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('330', '3', '首页搜索的关键字', 'search_keywords', '', '首页显示的搜索关键字,请用半角逗号(,)分隔多个关键字', 'text', '', '0', '1', '');
INSERT INTO `db_shop_config` VALUES ('332', '3', '关联商品显示数量', 'related_goods_number', '4', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('333', '3', '用户帮助是否打开', 'help_open', '1', null, 'radio', '0::关闭|1::打开', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('334', '3', '文章分类页列表的数量', 'article_page_size', '10', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('335', '3', '分页样式', 'page_style', '1', null, 'radio', '0::默认经典|1::流行页码', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('336', '3', '推荐商品排序', 'recommend_order', '0', '推荐排序适合少量推荐，随机显示大量推荐', 'radio', '0::推荐排序|1::随机显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('337', '3', null, 'index_ad', 'sys', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('401', '4', '能否开发票', 'can_invoice', '1', null, 'radio', '1::能|0::不能', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('402', '4', '是否使用积分', 'use_integral', '1', null, 'radio', '1::使用|0::不使用', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('403', '4', '是否使用红包', 'use_bonus', '1', null, 'radio', '1::使用|0::不使用', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('404', '4', '是否使用余额', 'use_surplus', '1', null, 'radio', '1::使用|0::不适用', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('405', '4', '是否使用缺货处理', 'use_how_oos', '1', '使用缺货处理时前台订单确认页面允许用户选择缺货时处理方法。', 'radio', '1::使用|0::不使用', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('406', '4', '确认订单时', 'send_confirm_email', '0', null, 'radio', '1::发送邮件|0::不发送邮件', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('407', '4', '发货时', 'send_ship_email', '0', null, 'radio', '1::发送邮件|0::不发送邮件', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('408', '4', '取消订单时', 'send_cancel_email', '0', null, 'radio', '1::发送邮件|0::不发送邮件', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('409', '4', '把订单设为无效时', 'send_invalid_email', '0', null, 'radio', '1::发送邮件|0::不发送邮件', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('410', '4', '设置订单为“已付款”时', 'order_pay_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('411', '4', '设置订单为“未付款”时', 'order_unpay_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('412', '4', '设置订单为“已发货”时', 'order_ship_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('413', '4', '设置订单为“收货确认”时', 'order_receive_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('414', '4', '设置订单为“未发货”时', 'order_unship_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('415', '4', '退货时', 'order_return_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('416', '4', '把订单设为无效时', 'order_invalid_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('417', '4', '取消订单时', 'order_cancel_note', '1', null, 'radio', '1::必须填写备注|0::无需填写备注', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('418', '4', '发票内容', 'invoice_content', '', '客户要求开发票时可以选择的内容。例如：办公用品。每一行代表一个选项。', 'textarea', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('419', '4', '是否允未许登录用户购物', 'anonymous_buy', '1', null, 'radio', '1::允许|0::不允许', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('420', '4', '最小购物金额', 'min_goods_amount', '0', '达到此购物金额，才能提交订单。', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('421', '4', '是否一步购物', 'one_step_buy', '0', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('422', '4', '发票类型及税率', 'invoice_type', 'a:2:{s:4:\"type\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}s:4:\"rate\";a:3:{i:0;d:1;i:1;d:1.5;i:2;d:0;}}', null, 'manual', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('423', '4', '减库存的时机', 'stock_dec_time', '0', null, 'radio', '1::下订单时|0::发货时', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('424', '4', '购物车确定提示', 'cart_confirm', '3', '允许您设置用户点击“加入购物车”后是否提示以及随后的动作。', 'select', '1::提示用户，点击“确定”进购物车|2::提示用户，点击“取消”进购物车|3::直接进入购物车|4::不提示并停留在当前页面', '0', '1', '');
INSERT INTO `db_shop_config` VALUES ('425', '4', '下单时是否给客服发邮件', 'send_service_email', '0', '网店信息中的客服邮件地址不为空时，该选项有效。', 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('426', '4', '购物车里显示商品方式', 'show_goods_in_cart', '3', null, 'radio', '1::只显示文字|2::只显示图片|3::显示文字与图片', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('427', '4', '购物车里是否显示商品属性', 'show_attr_in_cart', '1', null, 'radio', '1::是|0::否', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('501', '5', '发送邮件服务器地址(SMTP)', 'smtp_host', 'localhost', '邮件服务器主机地址。如果本机可以发送邮件则设置为localhost', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('502', '5', '服务器端口', 'smtp_port', '25', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('503', '5', '邮件发送账号', 'smtp_user', '', '发送邮件所需的认证帐号，如果没有就为空着', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('504', '5', '邮件密码', 'smtp_pass', '', '', 'password', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('505', '5', '邮件回复地址', 'smtp_mail', '', null, 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('506', '5', '邮件编码', 'mail_charset', 'UTF8', null, 'radio', 'UTF8::国际化编码(utf8)|GB2312::简体中文|BIG5::繁体中文', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('507', '5', '邮件服务', 'mail_service', '0', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容。', 'radio', '0::采用服务器内置的 Mail 服务|1::采用其他的 SMTP 函数', '0', '1', '');
INSERT INTO `db_shop_config` VALUES ('508', '5', '邮件服务器是否要求加密链接(SSL)', 'smtp_ssl', '0', null, 'radio', '0::否|1::是', '0', '1', '');
INSERT INTO `db_shop_config` VALUES ('601', '6', null, 'integrate_code', 'ecshop', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('602', '6', null, 'integrate_config', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('603', '6', null, 'hash_code', '31693422540744c0a6b6da635b7a5a93', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('604', '6', null, 'template', 'default', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('605', '6', null, 'install_date', '1490866915', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('606', '6', null, 'ecs_version', 'v2.7.3', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('607', '6', null, 'sms_user_name', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('608', '6', null, 'sms_password', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('609', '6', null, 'sms_auth_str', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('610', '6', null, 'sms_domain', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('611', '6', null, 'sms_count', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('612', '6', null, 'sms_total_money', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('613', '6', null, 'sms_balance', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('614', '6', null, 'sms_last_request', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('616', '6', null, 'affiliate', 'a:3:{s:6:\"config\";a:7:{s:6:\"expire\";d:24;s:11:\"expire_unit\";s:4:\"hour\";s:11:\"separate_by\";i:0;s:15:\"level_point_all\";s:2:\"5%\";s:15:\"level_money_all\";s:2:\"1%\";s:18:\"level_register_all\";i:2;s:17:\"level_register_up\";i:60;}s:4:\"item\";a:4:{i:0;a:2:{s:11:\"level_point\";s:3:\"60%\";s:11:\"level_money\";s:3:\"60%\";}i:1;a:2:{s:11:\"level_point\";s:3:\"30%\";s:11:\"level_money\";s:3:\"30%\";}i:2;a:2:{s:11:\"level_point\";s:2:\"7%\";s:11:\"level_money\";s:2:\"7%\";}i:3;a:2:{s:11:\"level_point\";s:2:\"3%\";s:11:\"level_money\";s:2:\"3%\";}}s:2:\"on\";i:1;}', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('617', '6', null, 'captcha', '12', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('618', '6', null, 'captcha_width', '100', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('619', '6', null, 'captcha_height', '20', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('620', '6', null, 'sitemap', 'a:6:{s:19:\"homepage_changefreq\";s:6:\"hourly\";s:17:\"homepage_priority\";s:3:\"0.9\";s:19:\"category_changefreq\";s:6:\"hourly\";s:17:\"category_priority\";s:3:\"0.8\";s:18:\"content_changefreq\";s:6:\"weekly\";s:16:\"content_priority\";s:3:\"0.7\";}', null, 'hidden', '', '0', '0', '');
INSERT INTO `db_shop_config` VALUES ('621', '6', null, 'points_rule', '', null, 'hidden', '', '0', '0', '');
INSERT INTO `db_shop_config` VALUES ('622', '6', null, 'flash_theme', 'dynfocus', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('623', '6', null, 'stylename', '', null, 'hidden', '', '1', '0', '');
INSERT INTO `db_shop_config` VALUES ('701', '7', '是否显示货号', 'show_goodssn', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('702', '7', '是否显示品牌', 'show_brand', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('703', '7', '是否显示重量', 'show_goodsweight', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('704', '7', '是否显示库存', 'show_goodsnumber', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('705', '7', '是否显示上架时间', 'show_addtime', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('706', '7', '商品属性显示样式', 'goodsattr_style', '1', null, 'radio', '1::单选按钮|0::下拉列表', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('707', '7', '是否显示市场价格', 'show_marketprice', '1', null, 'radio', '1::显示|0::不显示', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('801', '8', '商家的手机号码', 'sms_shop_mobile', '', '请先注册手机短信服务再填写手机号码', 'text', '', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('802', '8', '客户下订单时是否给商家发短信', 'sms_order_placed', '0', null, 'radio', '1::发短信|0::不发短信', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('803', '8', '客户付款时是否给商家发短信', 'sms_order_payed', '0', null, 'radio', '1::发短信|0::不发短信', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('804', '8', '商家发货时是否给客户发短信', 'sms_order_shipped', '0', null, 'radio', '1::发短信|0::不发短信', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('901', '9', '是否使用WAP功能', 'wap_config', '0', '此功能只支持简体中文且只在中国大陆区有效', 'radio', '1::开启|0::关闭', '1', '1', '');
INSERT INTO `db_shop_config` VALUES ('902', '9', 'WAP LOGO上传', 'wap_logo', '', '为了更好地兼容各种手机类型，LOGO 最好为png图片', 'file', '', '1', '1', '../images/');
INSERT INTO `db_shop_config` VALUES ('903', '2', '用户留言是否需要审核', 'message_check', '1', null, 'radio', '1::需要审核|0::不需要审核', '1', '1', '');

-- ----------------------------
-- Table structure for `db_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `db_suppliers`;
CREATE TABLE `db_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_name` varchar(60) DEFAULT NULL,
  `suppliers_describe` text,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='管理供货商';

-- ----------------------------
-- Records of db_suppliers
-- ----------------------------
INSERT INTO `db_suppliers` VALUES ('1', '北京供货商', '北京供货商信息', '1');
INSERT INTO `db_suppliers` VALUES ('2', '上海供货商', '上海供货商信息', '1');

-- ----------------------------
-- Table structure for `db_vote`
-- ----------------------------
DROP TABLE IF EXISTS `db_vote`;
CREATE TABLE `db_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理投票调查';

-- ----------------------------
-- Records of db_vote
-- ----------------------------
INSERT INTO `db_vote` VALUES ('1', '您从哪里知道我们的网站', '1491926400', '1493136000', '0', '0');

-- ----------------------------
-- Table structure for `db_vote_log`
-- ----------------------------
DROP TABLE IF EXISTS `db_vote_log`;
CREATE TABLE `db_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理投票记录';

-- ----------------------------
-- Records of db_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for `db_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `db_vote_option`;
CREATE TABLE `db_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(255) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理投票选项';

-- ----------------------------
-- Records of db_vote_option
-- ----------------------------
INSERT INTO `db_vote_option` VALUES ('1', '1', '论坛', '0', '100');
INSERT INTO `db_vote_option` VALUES ('2', '1', '朋友', '0', '100');
INSERT INTO `db_vote_option` VALUES ('3', '1', '友情链接', '0', '100');
INSERT INTO `db_vote_option` VALUES ('4', '1', '同学', '0', '100');
