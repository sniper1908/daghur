-- ----------------------------
-- Table structure for `db_shop_config`
-- ----------------------------
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

