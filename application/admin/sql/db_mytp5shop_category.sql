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

