
CREATE TABLE `db_permission` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_name_code` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称代码',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='网站权限列表';

INSERT INTO `db_permission` VALUES 
(1,'商品管理','goods_manage',0,5),
(2,'内容管理','article_manage',0,5),
(3,'会员管理','users_manage',0,4),
(4,'权限管理','permission_manage',0,1),
(5,'网站设置','system_set',0,3),
(6,'订单管理','order_manage',0,11),
(7,'促销管理','promotion_manage',0,8),
(8,'广告管理','ad_manage',0,7),
(9,'微信管理','wechat_manage',0,10),
(10,'模板管理','template_manage',0,12),
(11,'报表统计','chart_manage',0,13),
(12,'管理员添加/编辑','admin_add_edit',4,6),
(13,'删除管理员','admin_remove_back',4,7),
(14,'权限添加/编辑','permission_add_edit',4,1),
(15,'权限删除','permission_remove_back',4,2),
(16,'角色添加/编辑','role_add_edit',4,3),
(17,'角色删除','role_remove_back',4,4),
(18,'分配权限','role_permission',4,5),
(19,'管理日志列表','adminlog_list',4,8),
(20,'管理日志删除','adminlog_remove',4,9),
(21,'商品添加/编辑','goods_add_edit',1,1),
(22,'商品删除/恢复','goods_remove_back',1,2),
(23,'分类添加/编辑','goodscat_add_edit',1,3),
(24,'分类转移/删除','goodscat_change_remove',1,4),
(25,'商品属性管理','goods_attr_manage',1,5),
(26,'商品品牌管理','goods_brand_manage',1,6),
(27,'文章分类管理','article_cat_manage',2,1),
(28,'文章内容管理','article_content_manage',2,2),
(29,'文章自动发布','article_auto_publish',2,3),
(30,'模块管理','modular_manage',0,2),
(31,'模块添加/编辑','modular_add_edit',30,1),
(32,'模块删除','modular_remove_back',30,2),
(33,'会员添加/编辑','users_add_edit',3,1),
(34,'会员删除','users_remove_back',3,2),
(35,'广告列表','ad_add_edit',8,1),
(36,'广告位置','adv_add_edit',8,2),
(37,'商店设置','shop_config_set',5,1),
(38,'支付方式管理','payment_way_manage',5,3),
(39,'配送方式管理','shipping_way_manage',5,2),
(40,'邮件服务器设置','email_smtp_set',5,4),
(41,'地区列表管理','area_list_manage',5,5),
(42,'配送区域管理','shipping_area_manage',5,4),
(43,'友情链接管理','friend_link_manage',5,6),
(44,'数据备份','data_backup_manage',5,8),
(45,'数据恢复','data_return_manage',5,9),
(46,'首页主广告管理','index_ad_manage',5,10),
(47,'自定义导航栏','custom_nav_bar',5,11),
(48,'会员等级管理','user_rank_manage',3,3),
(49,'会员留言管理','user_comment_manage',3,4),
(50,'用户评论管理','goods_comment_manage',1,7),
(51,'商品类型','goods_type',1,8),
(52,'标签管理','goods_tag_manage',1,9),
(53,'商品自动上下架','goods_auto_shelf',1,10),
(54,'图片批量处理','goods_img_batch',1,11),
(55,'编辑订单状态','order_status_edit',6,1),
(56,'编辑付款状态','order_payment_status_edit',6,2),
(57,'编辑发货状态','order_send_status_edit',6,3),
(58,'添加编辑订单','order_add_edit',6,4),
(59,'查看未完成订单','order_unfinished_view',6,5),
(60,'查看已完成订单','order_finished_view',6,6),
(61,'退款申请管理','refund_application_manage',6,7),
(62,'缺货登记管理','short_supply_manage',6,8),
(63,'查看发货单','order_invoice_view',6,9),
(64,'查看退货单','order_return_view',6,10),
(65,'商品回收站','goods_remove_back',1,6);
