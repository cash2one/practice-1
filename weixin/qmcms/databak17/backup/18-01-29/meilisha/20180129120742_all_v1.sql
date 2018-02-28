--
-- MySQL database dump
-- Created by wifiguanjia class, Power By quanmei. 
-- http://www.wifiguanjia.com 
--
-- 主机: 127.0.0.1
-- 生成日期: 2018 年  01 月 29 日 12:07
-- MySQL版本: 5.5.53
-- PHP 版本: 5.4.45

--
-- 数据库: `meilisha`
--

-- -------------------------------------------------------

--
-- 表的结构#cn_member
--

DROP TABLE IF EXISTS `#cn_member`;
CREATE TABLE `#cn_member` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tjid` bigint(10) DEFAULT '0' COMMENT '推荐用户ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名（手机号）',
  `class` int(2) DEFAULT '0' COMMENT '会员级别',
  `phone` varchar(255) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `isbind` smallint(1) DEFAULT '0' COMMENT '是否绑定',
  `isbind_time` bigint(10) DEFAULT '0' COMMENT '绑定时间',
  `photo` varchar(250) DEFAULT '',
  `qq` varchar(20) DEFAULT '',
  `password` varchar(250) DEFAULT '',
  `time` bigint(11) DEFAULT '0',
  `state` smallint(1) DEFAULT '1',
  `truename` varchar(250) DEFAULT '',
  `nc` varchar(255) DEFAULT '' COMMENT '昵称',
  `onc` varchar(255) DEFAULT '',
  `area` varchar(250) DEFAULT '',
  `address` varchar(250) DEFAULT '',
  `birthday` varchar(50) DEFAULT '',
  `now_address` varchar(100) DEFAULT '' COMMENT '现居地',
  `third_num` varchar(50) DEFAULT '' COMMENT '第三方id',
  `third_name` varchar(50) DEFAULT '' COMMENT '第三方昵称',
  `openid` varchar(100) DEFAULT '' COMMENT '第三方唯一标识opendid',
  `subscribe` smallint(6) DEFAULT '0' COMMENT '是否关注',
  `wx_photo` varchar(200) DEFAULT '' COMMENT '微信头像',
  `unsubscribe_time` bigint(11) DEFAULT '0',
  `wx_address` varchar(200) DEFAULT '' COMMENT '微信地址',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `wx_sex` varchar(10) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `del` smallint(1) DEFAULT '0',
  `piclist` varchar(555) DEFAULT '',
  `about` varchar(2255) DEFAULT '' COMMENT '个人介绍',
  `cookrnd` varchar(100) DEFAULT '' COMMENT 'cookie随机码 当会员登录启用cookie随机生成',
  `logintime` bigint(11) DEFAULT '0' COMMENT '最后登录时间',
  `wxh` varchar(100) DEFAULT '' COMMENT '微信号',
  `htime` bigint(11) DEFAULT '0' COMMENT '微信最后一次互动时间',
  `location_x` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置x坐标',
  `location_y` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置Y坐标',
  `onc2` varchar(255) DEFAULT '',
  `province` varchar(50) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `county` varchar(50) DEFAULT '',
  `wrnd` varchar(500) DEFAULT '',
  `zjf` int(8) DEFAULT '0' COMMENT '累计积分',
  `jf` int(8) DEFAULT '0' COMMENT '用户剩余积分',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='微信端用户表 即会员表';

--
-- 转存表中的数据 #cn_member
--

--
-- 表的结构#cn_user
--

DROP TABLE IF EXISTS `#cn_user`;
CREATE TABLE `#cn_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0' COMMENT '只有微信端才会涉及到会员',
  `wrnd` varchar(100) NOT NULL DEFAULT '' COMMENT 'cookie name',
  `cook` varchar(200) NOT NULL DEFAULT '' COMMENT 'cook值',
  `ip` varchar(30) DEFAULT '',
  `url` varchar(200) DEFAULT '' COMMENT '第一次访问的页面',
  `date` date NOT NULL COMMENT '日期',
  `time` bigint(10) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '1' COMMENT '有效用户 0表示黑名单用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='访问者记录表';

--
-- 转存表中的数据 #cn_user
--

--
-- 表的结构cn_ad
--

DROP TABLE IF EXISTS `cn_ad`;
CREATE TABLE `cn_ad` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(250) DEFAULT '',
  `img` varchar(250) DEFAULT '',
  `width` varchar(50) DEFAULT '',
  `height` varchar(50) DEFAULT '',
  `url` varchar(250) DEFAULT '',
  `ids_bz1` varchar(250) DEFAULT '',
  `ids_bz2` varchar(250) DEFAULT '',
  `ids_bz3` varchar(200) DEFAULT '',
  `audit` tinyint(1) DEFAULT '1',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_ad
--

INSERT INTO `cn_ad` VALUES('1','默认内页banner','/Comm/images/img_6.png','639','300','','banner','','','1','0');
INSERT INTO `cn_ad` VALUES('2','身体基本护理','/Comm/images/ho1_1.png','65','74','/stjbhl/','身体基本护理','','','1','0');
INSERT INTO `cn_ad` VALUES('3','面部基础护理','/Comm/images/ho1_2.png','65','74','/mbjchl/','面部基础护理','','','1','0');
INSERT INTO `cn_ad` VALUES('4','高端仪器类','/Comm/images/ho1_3.png','65','74','/gdyql','高端仪器类','','','1','0');
INSERT INTO `cn_ad` VALUES('5','问题肌肤','/Comm/images/ho1_4.png','65','74','/wtjf','问题肌肤','','','1','0');
--
-- 表的结构cn_admin
--

DROP TABLE IF EXISTS `cn_admin`;
CREATE TABLE `cn_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `Grade` tinyint(1) DEFAULT '1',
  `Lock` tinyint(1) DEFAULT '0',
  `Issue` varchar(255) DEFAULT '',
  `Answer` varchar(255) DEFAULT '',
  `LastTime` datetime DEFAULT NULL,
  `LastIP` varchar(50) DEFAULT '',
  `logins` bigint(11) DEFAULT '0',
  `cookie` varchar(255) DEFAULT '',
  `flag1` varchar(255) DEFAULT '',
  `flag2` varchar(255) DEFAULT '',
  `flag3` varchar(255) DEFAULT '',
  `s1` bigint(10) DEFAULT '0',
  `s2` bigint(10) DEFAULT '0',
  `cityname` varchar(100) DEFAULT '',
  `truename` varchar(100) DEFAULT '' COMMENT '联系人',
  `tel` varchar(100) DEFAULT '' COMMENT '联系人电话',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `del` tinyint(1) DEFAULT '0',
  `role_id` int(5) DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_admin
--

INSERT INTO `cn_admin` VALUES('1','qmadmin','c5358a6db37949d725ae280082a99a4a','9','0','','','2018-01-29 19:26:56','182.150.133.15','767','01ebcab5bde4691766028d2998a1a7b6','','','','0','0','主站','','','','0','0');
INSERT INTO `cn_admin` VALUES('2','mytest','6197e352b2eb102fca1062eb8da54e82','1','0','','','2017-11-14 10:54:54','127.0.0.1','3','30b3fd9887d9a20be87b3f4728aecc5b','','','','0','0','mytest','mytest','mytest','','0','1');
--
-- 表的结构cn_admin_check
--

DROP TABLE IF EXISTS `cn_admin_check`;
CREATE TABLE `cn_admin_check` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `sort` int(4) DEFAULT '0' COMMENT '排序 默认降序',
  `type` tinyint(2) DEFAULT '1' COMMENT '权限分类 1模块 2操作权限（添加 删除 修改 导出）',
  `cntitle` varchar(100) DEFAULT '' COMMENT '权限说明',
  `flag` varchar(50) DEFAULT '' COMMENT '权限标识',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_admin_check
--

INSERT INTO `cn_admin_check` VALUES('1','0','1','网站设置','system','1','0');
INSERT INTO `cn_admin_check` VALUES('2','0','1','栏目设置','lm','1','0');
INSERT INTO `cn_admin_check` VALUES('3','0','1','属性设置','attr','1','1');
INSERT INTO `cn_admin_check` VALUES('4','0','1','网站内容','lists','1','0');
INSERT INTO `cn_admin_check` VALUES('5','0','1','广告管理','ad','1','0');
INSERT INTO `cn_admin_check` VALUES('6','0','1','留言报名','msg','1','0');
INSERT INTO `cn_admin_check` VALUES('7','0','1','数据备份','dbak','1','0');
INSERT INTO `cn_admin_check` VALUES('8','0','2','添加','add','1','0');
INSERT INTO `cn_admin_check` VALUES('9','0','2','修改','edit','1','0');
INSERT INTO `cn_admin_check` VALUES('10','0','2','删除','del','1','0');
INSERT INTO `cn_admin_check` VALUES('11','0','2','导出','export','1','1');
INSERT INTO `cn_admin_check` VALUES('12','0','1','订单管理','order','1','0');
INSERT INTO `cn_admin_check` VALUES('13','0','1','预约管理','yuyue','1','0');
INSERT INTO `cn_admin_check` VALUES('14','0','1','会员管理','user','1','0');
INSERT INTO `cn_admin_check` VALUES('22','0','1','优惠券管理','youhuiquan','1','0');
--
-- 表的结构cn_admin_role
--

DROP TABLE IF EXISTS `cn_admin_role`;
CREATE TABLE `cn_admin_role` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '角色名称',
  `flag1` varchar(400) DEFAULT '' COMMENT '模块权限',
  `flag2` varchar(100) DEFAULT '' COMMENT '操作权限',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否审核或启用',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='role 管理员角色表';

--
-- 转存表中的数据 cn_admin_role
--

--
-- 表的结构cn_attr
--

DROP TABLE IF EXISTS `cn_attr`;
CREATE TABLE `cn_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) DEFAULT '',
  `entitle` varchar(255) DEFAULT '',
  `fid` int(7) DEFAULT NULL,
  `fidpath` varchar(255) DEFAULT '',
  `sort` int(7) DEFAULT '0',
  `img` varchar(255) DEFAULT '',
  `isshow` tinyint(1) DEFAULT NULL,
  `ty` tinyint(1) DEFAULT NULL,
  `content` longtext,
  `kdel` tinyint(1) DEFAULT '0',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_attr
--

INSERT INTO `cn_attr` VALUES('1','普通用户','','0',',0','1','','1','0','','1','0');
INSERT INTO `cn_attr` VALUES('2','VIP用户','','0',',0','2','','1','0','','1','0');
--
-- 表的结构cn_cart
--

DROP TABLE IF EXISTS `cn_cart`;
CREATE TABLE `cn_cart` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `pid` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `cntitle` varchar(200) DEFAULT '' COMMENT '产品名称',
  `price` double(9,2) DEFAULT '0.00' COMMENT '产品价格',
  `num` int(5) unsigned DEFAULT '0' COMMENT '数量',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否生效',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `time` bigint(10) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='购物车清单表';

--
-- 转存表中的数据 cn_cart
--

INSERT INTO `cn_cart` VALUES('1','1','10','精油推背','388.00','1','1','0','1516171208');
INSERT INTO `cn_cart` VALUES('2','1','13','精油推背2','388.00','2','1','0','1516846379');
INSERT INTO `cn_cart` VALUES('3','6','13','精油推背2','388.00','2','1','0','1516846991');
INSERT INTO `cn_cart` VALUES('4','7','10','精油推背','388.00','10','1','0','1516848806');
INSERT INTO `cn_cart` VALUES('5','7','13','精油推背2','388.00','11','1','0','1516848800');
--
-- 表的结构cn_color
--

DROP TABLE IF EXISTS `cn_color`;
CREATE TABLE `cn_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(55) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_color
--

INSERT INTO `cn_color` VALUES('1','#FFFFFF');
INSERT INTO `cn_color` VALUES('2','#FF0000');
INSERT INTO `cn_color` VALUES('3','#FFFF00');
INSERT INTO `cn_color` VALUES('4','#FF00FF');
INSERT INTO `cn_color` VALUES('5','#0000FF');
INSERT INTO `cn_color` VALUES('6','#00FFFF');
INSERT INTO `cn_color` VALUES('7','#00FF00');
INSERT INTO `cn_color` VALUES('8','#CCCCCC');
INSERT INTO `cn_color` VALUES('9','#000000');
INSERT INTO `cn_color` VALUES('10','#666666');
--
-- 表的结构cn_comment
--

DROP TABLE IF EXISTS `cn_comment`;
CREATE TABLE `cn_comment` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `sid` bigint(11) DEFAULT '0' COMMENT '商家id',
  `ty` smallint(1) DEFAULT '1' COMMENT '评论类型 1产品评论 2会员评论',
  `uid` bigint(12) DEFAULT '0' COMMENT '会员编号',
  `pid` bigint(12) DEFAULT '0' COMMENT '产品或者会员编号',
  `hid` bigint(12) DEFAULT '0' COMMENT '回复id',
  `ip` varchar(100) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `title` varchar(200) DEFAULT '' COMMENT '评论标题',
  `content` varchar(2000) DEFAULT '' COMMENT '评论内容',
  `repay` varchar(2000) DEFAULT '' COMMENT '评论回复',
  `nc` varchar(100) DEFAULT '' COMMENT '评论昵称',
  `fidpath` varchar(1000) DEFAULT '' COMMENT '评论层级',
  `s1` int(4) DEFAULT '0' COMMENT '评论层级',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `audit` smallint(1) DEFAULT '1' COMMENT '是否审核',
  `orderid` varchar(100) DEFAULT '',
  `repaytime` bigint(11) DEFAULT '0',
  `s2` smallint(6) DEFAULT '5',
  `s3` smallint(6) DEFAULT '5',
  `s4` smallint(6) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_comment
--

--
-- 表的结构cn_config
--

DROP TABLE IF EXISTS `cn_config`;
CREATE TABLE `cn_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varname` varchar(255) DEFAULT '',
  `info` varchar(255) DEFAULT '',
  `gid` tinyint(3) DEFAULT '0',
  `type` varchar(255) DEFAULT '',
  `value` longtext,
  `sort` int(7) DEFAULT '1',
  `audit` int(7) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_config
--

INSERT INTO `cn_config` VALUES('1','cfg_webname','网站标题','1','1','美丽莎皮肤管理中心','0','0');
INSERT INTO `cn_config` VALUES('2','cfg_keywords','关键字','1','1','美丽莎皮肤管理中心','0','0');
INSERT INTO `cn_config` VALUES('3','cfg_searchtitle','搜索关键字','1','1','','0','1');
INSERT INTO `cn_config` VALUES('4','cfg_description','网站描述','1','2','美丽莎皮肤管理中心','0','0');
INSERT INTO `cn_config` VALUES('18','cfg_beian','网站备案号','1','1','','0','1');
INSERT INTO `cn_config` VALUES('5','cfg_copyright','底部版权','1','2','','0','1');
INSERT INTO `cn_config` VALUES('6','cfg_name','网站名称','1','1','美丽莎皮肤管理中心','0','0');
INSERT INTO `cn_config` VALUES('7','cfg_head','Head前代码','1','2','','0','0');
INSERT INTO `cn_config` VALUES('8','cfg_body','Body前代码','1','2','','0','0');
INSERT INTO `cn_config` VALUES('9','cfg_f0','顶部欢迎语','1','1','','1','1');
INSERT INTO `cn_config` VALUES('10','cfg_f1','服务热线','1','1','028-86259635','1','0');
INSERT INTO `cn_config` VALUES('11','cfg_f2','400电话','1','1','','1','1');
INSERT INTO `cn_config` VALUES('12','cfg_f3','联系邮箱','1','1','','1','1');
INSERT INTO `cn_config` VALUES('13','cfg_f4','在线QQ','1','1','','1','1');
INSERT INTO `cn_config` VALUES('14','cfg_f5','咨询链接','1','1','','1','1');
INSERT INTO `cn_config` VALUES('19','cfg_f9','活动默认说明','1','2','','1','1');
INSERT INTO `cn_config` VALUES('15','cfg_f6','赠送积分百分比','1','1','10','1','0');
INSERT INTO `cn_config` VALUES('16','cfg_f7','公司地址','1','1','','1','1');
INSERT INTO `cn_config` VALUES('17','cfg_f8','预约时间段','1','17','18,19,20,21,22,23,24,28,29,30,31,32,33,34,35','1','0');
--
-- 表的结构cn_content
--

DROP TABLE IF EXISTS `cn_content`;
CREATE TABLE `cn_content` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `fid` tinyint(1) DEFAULT '1' COMMENT '1宴会大厅 2宴会菜单',
  `pid` bigint(11) DEFAULT '0' COMMENT '关联info表ID',
  `cntitle` varchar(200) DEFAULT '',
  `img` varchar(200) DEFAULT '',
  `bz1` varchar(2000) DEFAULT '',
  `bz2` varchar(2000) DEFAULT '',
  `bz3` varchar(2000) DEFAULT '',
  `bz4` varchar(2000) DEFAULT '',
  `bz5` varchar(2000) DEFAULT '',
  `s1` bigint(11) DEFAULT '0' COMMENT '得票数',
  `content` text,
  `audit` tinyint(1) DEFAULT '1',
  `sort` bigint(11) DEFAULT '0',
  `time` bigint(10) DEFAULT '0',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票对象表';

--
-- 转存表中的数据 cn_content
--

--
-- 表的结构cn_flag
--

DROP TABLE IF EXISTS `cn_flag`;
CREATE TABLE `cn_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att` varchar(255) DEFAULT '',
  `attname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_flag
--

INSERT INTO `cn_flag` VALUES('1','1','人气套餐');
INSERT INTO `cn_flag` VALUES('2','2','美容养颜');
INSERT INTO `cn_flag` VALUES('3','3','养生美体');
INSERT INTO `cn_flag` VALUES('4','4','最新活动');
--
-- 表的结构cn_info
--

DROP TABLE IF EXISTS `cn_info`;
CREATE TABLE `cn_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
  `cntitle` varchar(255) NOT NULL DEFAULT '',
  `entitle` varchar(255) DEFAULT '',
  `cid` int(7) DEFAULT '0',
  `share` tinyint(1) DEFAULT '0',
  `fid` int(7) DEFAULT '0',
  `fidpath` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `content` longtext,
  `title` varchar(300) DEFAULT '',
  `keywords` varchar(300) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `sort` int(11) DEFAULT '9999',
  `hit` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT '',
  `simg` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `color` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `kdel` tinyint(1) DEFAULT '0',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `settop` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '1',
  `audit2` tinyint(1) DEFAULT '1',
  `vouch` tinyint(1) DEFAULT '0',
  `addtime2` datetime DEFAULT NULL,
  `bz1` varchar(500) DEFAULT '',
  `bz2` varchar(500) DEFAULT '',
  `bz3` varchar(500) DEFAULT '',
  `bz4` varchar(500) DEFAULT '',
  `bz5` varchar(1000) DEFAULT '',
  `bz6` varchar(500) DEFAULT '',
  `bz7` varchar(500) DEFAULT '',
  `bz8` varchar(500) DEFAULT '',
  `bz9` varchar(100) DEFAULT '',
  `bz10` varchar(100) DEFAULT '',
  `s1` bigint(10) DEFAULT '0',
  `s2` double(8,1) DEFAULT '0.0',
  `s3` bigint(10) DEFAULT '0',
  `s4` int(7) DEFAULT '0',
  `s5` int(7) DEFAULT '0',
  `s6` int(7) DEFAULT '0',
  `s7` bigint(11) DEFAULT '0',
  `s8` bigint(11) DEFAULT '0',
  `s9` double(12,2) DEFAULT '0.00' COMMENT '活动费用',
  `sd` int(7) DEFAULT '0' COMMENT '是否开放评论',
  `z1` longtext,
  `z2` longtext,
  `z3` longtext,
  `z4` longtext,
  `z5` longtext,
  `ktime` date DEFAULT NULL,
  `uid` bigint(11) DEFAULT '0',
  `weburl` varchar(500) DEFAULT '',
  `del` tinyint(1) DEFAULT '0',
  `settop_time` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_info
--

INSERT INTO `cn_info` VALUES('1','0','企业简介','','','0','10',',0,1,10,10','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，与皮肤科学相结合，采用高科技光、电设备与专业美容手法相结合，拥有国际尖端的医疗美容设备、皮肤科学专家团队、专业管理技师团队、先进的皮肤护理理念，致力于各类皮肤问题管理、咨询、检测、治疗、护理，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','3','16','2017-12-18 18:17:57','','','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/about/list-10/1.html','0','0');
INSERT INTO `cn_info` VALUES('2','0','发展理念','','','0','11',',0,1,11,11','','<p>\r\n	坚持以“让女人更加年轻，自信和美丽”为企业使命，以“走时尚之路，创行业先锋”为公司愿景，倡导“精于求精，止于至善”的经营理念，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>','','','','2','1','2017-12-18 18:18:22','','','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/about/list-11/2.html','0','0');
INSERT INTO `cn_info` VALUES('3','0','公司业务','','','0','12',',0,1,12,12','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，致力于各类皮肤问题管理，如：色素沉积、红血丝、痘痘痤疮、瘢痕、皱纹、产后修复、脱毛及皮肤的抗衰等的咨询、检测、治疗、护理，皮肤管理师根据不同皮肤状态，选择适用的产品，结合皮肤管理仪器以及正确的皮肤管理手法，对皮肤针对性治疗、调理，以达到改善皮肤问题、拥有优质皮肤的效果。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','1','1','2017-12-18 18:18:43','','','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/about/list-12/3.html','0','0');
INSERT INTO `cn_info` VALUES('4','0','梅老师','','','0','2',',0,2,2','美容护理师','<p>\r\n	服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。\r\n</p>','','','','4','16','2017-12-18 18:29:34','/Comm/images/img_5.png','/Comm/images/img_5_th.png','','','','0','','0','1','1','0','','10年','精油推背，全身SPA，养生按摩','获得美容高级技师证、获得美容高级技师证、获得美容高级技师证','13642567189','','','10,13','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','/pub/qm/p/image/171224/095832_431.jpg,/pub/qm/p/image/171224/095832_862.jpg,/pub/qm/p/image/171224/095832_873.jpg,/pub/qm/p/image/171224/095832_638.jpg,/pub/qm/p/image/171224/095832_235.jpg,/pub/qm/p/image/171224/095832_793.jpg','','','','0','/team/4.html','0','0');
INSERT INTO `cn_info` VALUES('5','0','小苏打去黑头','','','0','6',',0,4,6,6','','<p>\r\n	<br />\r\n</p>','','','','2','6','2017-12-18 18:33:03','','','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','清洁脸部的时候，在洗面奶中加入适量的苏打粉，洗面奶的泡沫会变得非常的细腻而且富有弹性。洗过之后会感觉毛孔会非常的清爽。黑头会明显的减少了，还能细致毛孔。','','','','','','0','/mrys/5.html','0','0');
INSERT INTO `cn_info` VALUES('6','0','ladies','','','0','5',',0,4,5,5','','<p>\r\n	美容一词，最早源于古希腊的“kosmetikos”，意为“装饰”。无论怎样命名，美容的活动在古代早已存在。考古学家从那一时期发掘的文物中考证，在当时，染料和香水已异地交换使用。到公元前5000年，黑锑粉末被用作描眉和染眉，铅被用来画眼线，绿孔雀石被用来画眼影等，令人惊奇的是，古代妇女化妆与现代妇女有着惊人的相似之处，如染指、趾甲，涂唇，描眉，染发等。\r\n</p>\r\n<p>\r\n	埃及古代时期，人们为了滋润皮肤和防止日晒，在皮肤涂抹各种药剂和油膏。古埃及妇女喜欢用黑颜料来描眼的轮廓，孔雀石粉制成的绿颜料涂在眼皮上，用黑灰色的锑粉把眉毛描得像柳叶一样细长，用乳白色的油脂抹在身上，使用红颜料涂抹嘴唇和脸颊，甚至在手、脚的指甲上都要染上橘红色，非常惹人注目。\r\n</p>\r\n<p>\r\n	美容在欧洲中世纪非常流行，到了文艺复兴时期，美容艺术大大发展。19世纪80年代，西方始出现了近代美容院。在中国殷商时期，人们已用燕地红蓝花叶捣汁凝成脂来饰面。\r\n</p>\r\n<p>\r\n	根据记载，春秋时周郑之女，用白粉敷面，用青黑颜料画眉。在汉代以后，开始出现妆点、扮妆、妆饰等字词。唐代出现了面膜美容。现代的女性对于美容养颜这一块需求非常高，层次也相对不一样。\r\n</p>\r\n<p>\r\n	初谈\r\n</p>\r\n<p>\r\n	《简易经》里记载：“简之矩只容能存之，易之规只美能化之。容则容物亦可护物，物之附表也。美其表、愚蠢目、健其本、乐而可为也。\r\n</p>\r\n<p>\r\n	”在三皇伏羲时期，大家就知道了美容的基本意义。那时候就把容字当做事物的外表，可以保护实质的东西，“美其表”就是美其容的意思。把外表美容一下，可以愚弄蠢笨的眼睛，使对方心中提高对本物的价值观点。美容一下还可以增强其本质的东西，对看家和对本物都有益处。\r\n</p>\r\n<p>\r\n	发展\r\n</p>\r\n<p>\r\n	美容产业迅速发展的驱动力主要在于：首先，中国近几年来居民的需求结构升级、社会的产业结构调整以及农村城市化和城市社区化为中国美容经济的兴起创造了大好机遇。\r\n</p>\r\n<p>\r\n	其次，中国经济持续、高速增长是中国美容经济兴起的根本原因，城乡居民收入的持续增长使美容消费支出的扩大由可能变为现实(10年间增长150%以上)，而中国居民消费结构的变迁直接促进了美容经济的兴起，国民健康意识和生活质量意识的提升更成为美容经济兴起的重要诱因\r\n</p>\r\n<p>\r\n	再者，美容产业所具有的集中性、广泛性、示范性、主导性和阶段性等特点，使美容成为当前中国居民的一大消费热点。\r\n</p>\r\n<p>\r\n	当一个国家的人均收入超过2000美元，即进入中等发达的小康社会后，对医疗整形美容行业的需求会增加10%左右，并每年以这个速度递增。2010年我国美容产业总产值已突破4000亿元，预计未来5年还将翻一番。庞大的市场需要更多的监管，尤其是医疗整形美容。\r\n</p>\r\n<p>\r\n	据《2013-2017年中国美容机构行业深度调研与投资战略规划分析报告》部分数据统计，2009年我国从事医疗整形美容的专业技术人员和相关人员达20余万人，以开展医疗整形美容诊疗业务为主的医疗机构如医疗整形美容医院、诊所和科室超过5万余所(个)，年总营业收入超过150亿元，不包括没有资质而从事美容行业人员，仅仅接受过医疗整形美容服务的人员就累计达到300万人次左右。\r\n</p>\r\n<p>\r\n	但当前的医疗整形美容行业存在服务资源分布不均、机构良莠不齐、存在不正当竞争、医疗事故频发等问题。卫生部门对医疗整形美容行业发展的支持力度不大，在“个别地方监管工作薄弱”，也是造成医疗整形美容行业混乱的原因。医疗整形美容行业存在的问题已引起政府有关部门的高度重视，《医疗整形美容行业发展规划纲要》即将出台。已有越来越多的美容专业机构通过连锁加盟形式，逐步扩散辐射面积抢占市场，行业发展业态初步呈现。从经营项目方面看，传统医学美容医院单一的服务已越来越无法满足市场需求，医学美容与生活美容综合经营，是中国美容产业未来5年的发展趋势及走向。\r\n</p>\r\n<p>\r\n	分类\r\n</p>\r\n<p>\r\n	美容起源于人类的祖先。自从有了人类，就有了美容。美容即是美化人们的容貌。随着社会的发展与科技的提升，美容从内容到形式上都有着不断的变化和提升。根据美容内涵的不同，现代美容可分为生活美容和医学美容两大部分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、生活美容是指专业人士使用专业的护肤化妆品和专业的美容仪器，运用专业的护肤方法和按摩手法，对人体的肌肤进行全面的护理和保养。生活美容可分为护理美容和修饰美容两大类。\r\n</p>\r\n<p>\r\n	2、医学美容是指运用一系列侵入皮肤内的医学手段，对人体的容貌与身体各部位进行维护、修复和再塑。\r\n</p>','','','','1','2','2017-12-18 18:36:34','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','美容一词可以从两个角度来理解。首选是\"容\"这个字，其次是\"美\"。\"容\"包括脸、仪态、和修饰三层意思。','','','','','','0','/mlbd/list-5/6.html','0','0');
INSERT INTO `cn_info` VALUES('7','0','公司总部','','','0','8',',0,8,8','','','','','','1','32','2017-12-19 13:33:14','','','','','','0','','0','1','1','0','','四川省成都市成华区和韵路286号附一','028-86259635','30.626280,104.158577','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/contact/7.html','0','0');
INSERT INTO `cn_info` VALUES('8','0','banner','','','0','15',',0,14,15,15','','','','','','2','1','2017-12-19 16:11:30','/Comm/images/ban_1.jpg','/Comm/images/ban_1_th.jpg','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/qita/list-15/8.html','0','0');
INSERT INTO `cn_info` VALUES('9','0','《美丽莎会员使用协议》','','','0','20',',0,14,20,20','','<p>\r\n	美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议\r\n</p>','','','','1','10','2017-12-19 16:34:00','','','','','','0','','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','','','','','','','0','/xieyi/9.html','0','0');
INSERT INTO `cn_info` VALUES('10','0','精油推背','','','0','16',',0,13,16,16','玫瑰花香，纤纤玉颈','','','','','2','36','2017-12-19 16:52:12','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','1,2,3,4','0','1','1','0','','适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。','','028-86259635','小萌','','14,12,4','','','admin','美丽莎皮肤管理中心','388','1.5','90','0','20','0','0','0','0.00','0','精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。','','/pub/qm/p/image/180125/022752_444.jpg,/pub/qm/p/image/180125/022805_251.jpg,/pub/qm/p/image/180125/022816_250.jpg','','','','0','/stjbhl/10.html','0','0');
INSERT INTO `cn_info` VALUES('11','0','何老师','','','0','2',',0,2,2','美容护理师','','','','','3','1','2018-01-17 09:37:40','/Comm/images/img_5.png','/Comm/images/img_5_th.png','','','','0','','0','1','1','0','','10','精油推背，全身SPA，养生按摩','获得美容高级技师证、获得美容高级技师证、获得美容高级技师证、','13642567189','','','','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。','','/pub/qm/p/image/180117/014138_622.jpg,/pub/qm/p/image/180117/014138_558.jpg,/pub/qm/p/image/180117/014138_803.jpg','','','','0','/team/11.html','0','0');
INSERT INTO `cn_info` VALUES('12','0','王老师','','','0','2',',0,2,2','按摩师','','','','','2','16','2018-01-17 09:41:55','/Comm/images/img_5.png','/Comm/images/img_5_th.png','','','','0','','0','1','1','0','','8','精油推背，全身SPA，养生按摩','获得美容高级技师证、获得美容高级技师证、获得美容高级技师证','13642567188','','','10','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。','','/pub/qm/p/image/180117/014319_832.jpg,/pub/qm/p/image/180117/014319_410.jpg,/pub/qm/p/image/180117/014319_574.jpg','','','','0','/team/12.html','0','0');
INSERT INTO `cn_info` VALUES('13','0','精油推背2','','','0','16',',0,13,16,16','玫瑰花香，纤纤玉颈','','','','','1','53','2017-12-19 16:52:12','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','1,2,3,4','0','1','1','0','','适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。','','028-86259635','小萌','','14,4','','','admin','美丽莎皮肤管理中心','388','2.0','120','0','20','0','0','0','0.00','0','精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。','','/pub/qm/p/image/180125/022440_865.jpg,/pub/qm/p/image/180125/022453_931.jpg,/pub/qm/p/image/180125/022507_148.jpg','','','','0','/stjbhl/13.html','0','0');
INSERT INTO `cn_info` VALUES('14','0','刘小智','','','0','2',',0,2,2','客户主管','专家级管理师专家级管理师专家级管理师专家级管理师','','','','1','15','2018-01-25 10:14:56','/pub/qm/p/image/180125/021642_860.png','/pub/qm/p/image/180125/021642_860_th.png','','','','0','','0','1','1','0','','8年','皮肤诊疗','','','','','13,10','','admin','美丽莎皮肤管理中心','','0.0','0','0','0','0','0','0','0.00','0','专家级管理师','','/pub/qm/p/image/180125/021737_431.jpg,/pub/qm/p/image/180125/021928_346.jpg','','','','0','/team/14.html','0','0');
--
-- 表的结构cn_info_copy
--

DROP TABLE IF EXISTS `cn_info_copy`;
CREATE TABLE `cn_info_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) NOT NULL DEFAULT '',
  `entitle` varchar(255) DEFAULT '',
  `cid` int(7) DEFAULT '0',
  `share` tinyint(1) DEFAULT '0',
  `fid` int(7) DEFAULT '0',
  `fidpath` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `content` longtext,
  `title` varchar(300) DEFAULT '',
  `keywords` varchar(300) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `sort` int(11) DEFAULT '9999',
  `hit` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT '',
  `simg` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `color` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `kdel` tinyint(1) DEFAULT '0',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `settop` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '1',
  `audit2` tinyint(1) DEFAULT '1',
  `vouch` tinyint(1) DEFAULT '0',
  `addtime2` datetime DEFAULT NULL,
  `bz1` varchar(500) DEFAULT '',
  `bz2` varchar(500) DEFAULT '',
  `bz3` varchar(500) DEFAULT '',
  `bz4` varchar(500) DEFAULT '',
  `bz5` varchar(1000) DEFAULT '',
  `bz6` varchar(500) DEFAULT '',
  `bz7` varchar(500) DEFAULT '',
  `bz8` varchar(500) DEFAULT '',
  `bz9` varchar(100) DEFAULT '',
  `bz10` varchar(100) DEFAULT '',
  `s1` bigint(10) DEFAULT '0',
  `s2` bigint(10) DEFAULT '0',
  `s3` bigint(10) DEFAULT '0',
  `s4` int(7) DEFAULT '0',
  `s5` int(7) DEFAULT '0',
  `s6` int(7) DEFAULT '0',
  `s7` bigint(11) DEFAULT '0',
  `s8` bigint(11) DEFAULT '0',
  `s9` double(12,2) DEFAULT '0.00' COMMENT '活动费用',
  `sd` int(7) DEFAULT '0' COMMENT '是否开放评论',
  `z1` longtext,
  `z2` longtext,
  `z3` longtext,
  `z4` longtext,
  `z5` longtext,
  `ktime` date DEFAULT NULL,
  `uid` bigint(11) DEFAULT '0',
  `weburl` varchar(500) DEFAULT '',
  `del` tinyint(1) DEFAULT '0',
  `settop_time` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_info_copy
--

INSERT INTO `cn_info_copy` VALUES('1','企业简介','','0','0','10',',0,1,10,10','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，与皮肤科学相结合，采用高科技光、电设备与专业美容手法相结合，拥有国际尖端的医疗美容设备、皮肤科学专家团队、专业管理技师团队、先进的皮肤护理理念，致力于各类皮肤问题管理、咨询、检测、治疗、护理，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','3','21','2017-12-18 18:17:57','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-10/1.html','0','0');
INSERT INTO `cn_info_copy` VALUES('2','发展理念','','0','0','11',',0,1,11,11','','<p>\r\n	坚持以“让女人更加年轻，自信和美丽”为企业使命，以“走时尚之路，创行业先锋”为公司愿景，倡导“源于品质，臻于完美！”的经营理念，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>','','','','2','1','2017-12-18 18:18:22','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-11/2.html','0','0');
INSERT INTO `cn_info_copy` VALUES('3','公司业务','','0','0','12',',0,1,12,12','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，致力于各类皮肤问题管理，如：色素沉积、红血丝、痘痘痤疮、瘢痕、皱纹、产后修复、脱毛及皮肤的抗衰等的咨询、检测、治疗、护理，皮肤管理师根据不同皮肤状态，选择适用的产品，结合皮肤管理仪器以及正确的皮肤管理手法，对皮肤针对性治疗、调理，以达到改善皮肤问题、拥有优质皮肤的效果。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','1','1','2017-12-18 18:18:43','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-12/3.html','0','0');
INSERT INTO `cn_info_copy` VALUES('4','梅老师','','0','0','2',',0,2,2','美容护理师','<p>\r\n	服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。\r\n</p>','','','','1','28','2017-12-18 18:29:34','/Comm/images/img_5.png','/Comm/images/img_5_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','10年','精油推背，全身SPA，养生按摩','获得美容高级技师证、获得美容高级技师证、获得美容高级技师证','13642567189','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','/pub/qm/p/image/171224/095832_431.jpg,/pub/qm/p/image/171224/095832_862.jpg,/pub/qm/p/image/171224/095832_873.jpg,/pub/qm/p/image/171224/095832_638.jpg,/pub/qm/p/image/171224/095832_235.jpg,/pub/qm/p/image/171224/095832_793.jpg','','','0000-00-00','0','/team/4.html','0','0');
INSERT INTO `cn_info_copy` VALUES('5','小苏打去黑头','','0','0','6',',0,4,6,6','','<p>\r\n	<br />\r\n</p>','','','','2','8','2017-12-18 18:33:03','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','清洁脸部的时候，在洗面奶中加入适量的苏打粉，洗面奶的泡沫会变得非常的细腻而且富有弹性。洗过之后会感觉毛孔会非常的清爽。黑头会明显的减少了，还能细致毛孔。','','','','','0000-00-00','0','/mrys/5.html','0','0');
INSERT INTO `cn_info_copy` VALUES('6','美容释义','','0','0','6',',0,4,6,6','','<p>\r\n	美容一词，最早源于古希腊的“kosmetikos”，意为“装饰”。无论怎样命名，美容的活动在古代早已存在。考古学家从那一时期发掘的文物中考证，在当时，染料和香水已异地交换使用。到公元前5000年，黑锑粉末被用作描眉和染眉，铅被用来画眼线，绿孔雀石被用来画眼影等，令人惊奇的是，古代妇女化妆与现代妇女有着惊人的相似之处，如染指、趾甲，涂唇，描眉，染发等。\r\n</p>\r\n<p>\r\n	埃及古代时期，人们为了滋润皮肤和防止日晒，在皮肤涂抹各种药剂和油膏。古埃及妇女喜欢用黑颜料来描眼的轮廓，孔雀石粉制成的绿颜料涂在眼皮上，用黑灰色的锑粉把眉毛描得像柳叶一样细长，用乳白色的油脂抹在身上，使用红颜料涂抹嘴唇和脸颊，甚至在手、脚的指甲上都要染上橘红色，非常惹人注目。\r\n</p>\r\n<p>\r\n	美容在欧洲中世纪非常流行，到了文艺复兴时期，美容艺术大大发展。19世纪80年代，西方始出现了近代美容院。在中国殷商时期，人们已用燕地红蓝花叶捣汁凝成脂来饰面。\r\n</p>\r\n<p>\r\n	根据记载，春秋时周郑之女，用白粉敷面，用青黑颜料画眉。在汉代以后，开始出现妆点、扮妆、妆饰等字词。唐代出现了面膜美容。现代的女性对于美容养颜这一块需求非常高，层次也相对不一样。\r\n</p>\r\n<p>\r\n	初谈\r\n</p>\r\n<p>\r\n	《简易经》里记载：“简之矩只容能存之，易之规只美能化之。容则容物亦可护物，物之附表也。美其表、愚蠢目、健其本、乐而可为也。\r\n</p>\r\n<p>\r\n	”在三皇伏羲时期，大家就知道了美容的基本意义。那时候就把容字当做事物的外表，可以保护实质的东西，“美其表”就是美其容的意思。把外表美容一下，可以愚弄蠢笨的眼睛，使对方心中提高对本物的价值观点。美容一下还可以增强其本质的东西，对看家和对本物都有益处。\r\n</p>\r\n<p>\r\n	发展\r\n</p>\r\n<p>\r\n	美容产业迅速发展的驱动力主要在于：首先，中国近几年来居民的需求结构升级、社会的产业结构调整以及农村城市化和城市社区化为中国美容经济的兴起创造了大好机遇。\r\n</p>\r\n<p>\r\n	其次，中国经济持续、高速增长是中国美容经济兴起的根本原因，城乡居民收入的持续增长使美容消费支出的扩大由可能变为现实(10年间增长150%以上)，而中国居民消费结构的变迁直接促进了美容经济的兴起，国民健康意识和生活质量意识的提升更成为美容经济兴起的重要诱因\r\n</p>\r\n<p>\r\n	再者，美容产业所具有的集中性、广泛性、示范性、主导性和阶段性等特点，使美容成为当前中国居民的一大消费热点。\r\n</p>\r\n<p>\r\n	当一个国家的人均收入超过2000美元，即进入中等发达的小康社会后，对医疗整形美容行业的需求会增加10%左右，并每年以这个速度递增。2010年我国美容产业总产值已突破4000亿元，预计未来5年还将翻一番。庞大的市场需要更多的监管，尤其是医疗整形美容。\r\n</p>\r\n<p>\r\n	据《2013-2017年中国美容机构行业深度调研与投资战略规划分析报告》部分数据统计，2009年我国从事医疗整形美容的专业技术人员和相关人员达20余万人，以开展医疗整形美容诊疗业务为主的医疗机构如医疗整形美容医院、诊所和科室超过5万余所(个)，年总营业收入超过150亿元，不包括没有资质而从事美容行业人员，仅仅接受过医疗整形美容服务的人员就累计达到300万人次左右。\r\n</p>\r\n<p>\r\n	但当前的医疗整形美容行业存在服务资源分布不均、机构良莠不齐、存在不正当竞争、医疗事故频发等问题。卫生部门对医疗整形美容行业发展的支持力度不大，在“个别地方监管工作薄弱”，也是造成医疗整形美容行业混乱的原因。医疗整形美容行业存在的问题已引起政府有关部门的高度重视，《医疗整形美容行业发展规划纲要》即将出台。已有越来越多的美容专业机构通过连锁加盟形式，逐步扩散辐射面积抢占市场，行业发展业态初步呈现。从经营项目方面看，传统医学美容医院单一的服务已越来越无法满足市场需求，医学美容与生活美容综合经营，是中国美容产业未来5年的发展趋势及走向。\r\n</p>\r\n<p>\r\n	分类\r\n</p>\r\n<p>\r\n	美容起源于人类的祖先。自从有了人类，就有了美容。美容即是美化人们的容貌。随着社会的发展与科技的提升，美容从内容到形式上都有着不断的变化和提升。根据美容内涵的不同，现代美容可分为生活美容和医学美容两大部分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、生活美容是指专业人士使用专业的护肤化妆品和专业的美容仪器，运用专业的护肤方法和按摩手法，对人体的肌肤进行全面的护理和保养。生活美容可分为护理美容和修饰美容两大类。\r\n</p>\r\n<p>\r\n	2、医学美容是指运用一系列侵入皮肤内的医学手段，对人体的容貌与身体各部位进行维护、修复和再塑。\r\n</p>','','','','1','5','2017-12-18 18:36:34','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','','0','0','0','0','0','0','0','0.00','0','美容一词可以从两个角度来理解。首选是\"容\"这个字，其次是\"美\"。\"容\"包括脸、仪态、和修饰三层意思。','','','','','0000-00-00','0','/mrys/6.html','0','0');
INSERT INTO `cn_info_copy` VALUES('7','公司总部','','0','0','8',',0,8,8','','','','','','1','45','2017-12-19 13:33:14','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','四川省成都市成华区和韵路286号附一','028-86259635','30.626308,104.158708','','','','','','admin','美丽莎皮肤管理中心','','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/contact/7.html','0','0');
INSERT INTO `cn_info_copy` VALUES('8','banner','','0','0','15',',0,14,15,15','','','','','','2','1','2017-12-19 16:11:30','/Comm/images/ban_1.jpg','/Comm/images/ban_1_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/qita/list-15/8.html','0','0');
INSERT INTO `cn_info_copy` VALUES('9','《美丽莎会员使用协议》','','0','0','20',',0,14,20,20','','<p>\r\n	美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议\r\n</p>','','','','1','16','2017-12-19 16:34:00','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/xieyi/9.html','0','0');
INSERT INTO `cn_info_copy` VALUES('10','精油推背','','0','0','16',',0,13,16,16','玫瑰花香，纤纤玉颈','','','','','1','59','2017-12-19 16:52:12','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','1,2,3,4','0','1','1','0','0000-00-00 00:00:00','适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。','','028-44446666','小萌','','','','','admin','美丽莎皮肤管理中心','1','0','4','0','20','0','0','0','0.00','0','精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。','','/pub/qm/p/image/171224/100607_251.jpg,/pub/qm/p/image/171224/100607_460.jpg,/pub/qm/p/image/171224/100607_880.jpg','','','0000-00-00','0','/stjbhl/10.html','0','0');
INSERT INTO `cn_info_copy` VALUES('11','超微小气泡','','','0','3',',0,3,3','','<p>\r\n	撒点粉撒点粉 阿什顿飞暗室逢灯\r\n</p>\r\n<p>\r\n	<img alt=\\\"\\\" src=\\\"/pub/qm/p/image/180105/022028_341.jpg\\\">\r\n</p>','','','','1','1','2018-01-05 10:19:05','/pub/qm/p/image/180105/021944_901.jpg','/pub/qm/p/image/180105/021944_901_th.jpg','','','','0','4','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0','0','0','0','0','0','0','0.00','0','超微小气泡是通过真空负压形成真空回路，将超微小气泡和营养液充分结合，通过特殊设计的小螺旋形吸头直接作用于皮肤，且能保持小气泡长时间接触皮肤，促进剥离作用，韩国进口超微小气泡与吸附作用相结合，在安全没有疼痛的状态下，能深层洁面，祛除老化角质细胞，祛除皮脂，彻底清除毛囊漏斗部的各种杂质，螨虫及油脂残留物，同时使毛囊漏斗部充满营养物质，为皮肤提供持久的营养，使皮肤湿润细腻有光泽。','','','','','','0','/shop/11.html','0','0');
--
-- 表的结构cn_lm
--

DROP TABLE IF EXISTS `cn_lm`;
CREATE TABLE `cn_lm` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `fid` int(7) DEFAULT NULL,
  `fidpath` varchar(255) DEFAULT NULL,
  `dir` varchar(255) DEFAULT '',
  `sort` int(7) DEFAULT '1',
  `title` varchar(255) DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `isshow` tinyint(1) DEFAULT '1',
  `ty` tinyint(2) DEFAULT '3',
  `content` longtext,
  `kdel` tinyint(1) DEFAULT '1',
  `url` varchar(255) DEFAULT '',
  `weburl` varchar(255) DEFAULT '',
  `urlpath` varchar(255) DEFAULT '',
  `Additional` longtext,
  `hit` bigint(11) DEFAULT '0',
  `mty` tinyint(3) DEFAULT '0',
  `dtitle` varchar(200) DEFAULT '',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_lm
--

INSERT INTO `cn_lm` VALUES('1','关于我们','','0',',0','','1','','','','','1','3','','1','','/about/','/about/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('2','团队介绍','','0',',0','','2','','','','','1','2','','1','','/team/','/team/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('3','美丽商城','','0',',0','','3','','','','','1','4','','1','','/shop/','/shop/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('4','美丽宝典','','0',',0','','4','','','','','1','2','','1','','/mlbd/','/mlbd/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('5','优品驾到','','4',',0,4','','1','','','','','1','2','','0','','/mlbd/list-5/','/mlbd/list-5/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('6','美容养生','','4',',0,4','','2','','','','','1','2','','0','','/mrys/','/mrys/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('7','时尚前线','','4',',0,4','','3','','','','','1','2','','0','','/mlbd/list-7/','/mlbd/list-7/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('8','联系我们','','0',',0','','5','','','','','1','3','','1','','/contact/','/contact/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('9','美丽预约','','0',',0','','6','','','','','1','4','','1','','/mlyy/','/mlyy/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('10','企业简介','CORPORATE PROFILE','1',',0,1','','1','','','','/Comm/images/ab_bg1.jpg','1','3','','1','','/about/list-10/','/about/list-10/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('11','发展理念','DEVELOPMENT PHILOSOPHY','1',',0,1','','2','','','','/Comm/images/ab_bg2.jpg','1','3','','1','','/about/list-11/','/about/list-11/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('12','公司业务','COMPANY BUSINESS','1',',0,1','','3','','','','/Comm/images/ab_bg3.jpg','1','3','','1','','/about/list-12/','/about/list-12/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('13','服务分类','','0',',0','','7','','','','','1','2','','1','','/fwfl/','/fwfl/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('14','其它','','0',',0','','8','','','','','1','3','','1','','/qita/','/qita/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('15','banner','','14',',0,14','','1','','','','','1','3','','1','','/qita/list-15/','/qita/list-15/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('16','身体基本护理','','13',',0,13','','1','','','','','1','2','','1','','/stjbhl/','/stjbhl/','/Comm/images/f1.png','0','0','美容与养颜是密不可分的','0');
INSERT INTO `cn_lm` VALUES('17','面部基础护理','','13',',0,13','','2','','','','','1','2','','1','','/mbjchl/','/mbjchl/','/Comm/images/f2.png','0','0','后天的保养才能拥有完美健康的肌肤','0');
INSERT INTO `cn_lm` VALUES('18','高端仪器类','','13',',0,13','','3','','','','','1','2','','1','','/gdyql/','/gdyql/','/Comm/images/f1.png','0','0','美容与养颜是密不可分的','0');
INSERT INTO `cn_lm` VALUES('19','问题肌肤','','13',',0,13','','4','','','','','1','2','','1','','/wtjf/','/wtjf/','/Comm/images/f2.png','0','0','后天的保养才能拥有完美健康的肌肤','0');
INSERT INTO `cn_lm` VALUES('20','《美丽莎会员使用协议》','','14',',0,14','','2','','','','','1','3','','1','','/xieyi/','/xieyi/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('21','常见问题','','0',',0','','9','','','','','1','1','','1','','/question/','/question/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('22','怎样获取更多优惠券?','','0',',0','','10','','','','','1','4','','1','','/getmore/','/getmore/','','0','0','','1');
INSERT INTO `cn_lm` VALUES('23','预约服务','','9',',0,9','','1','','','','','1','4','','1','','/yyservice/','/yyservice/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('24','技师预约','','9',',0,9','','2','','','','','1','4','','1','','/jsyy/','/jsyy/','','0','0','','0');
INSERT INTO `cn_lm` VALUES('25','预约记录','','9',',0,9','','3','','','','','1','4','','1','','/mlyy/list-25/','/mlyy/list-25/','','0','0','','0');
--
-- 表的结构cn_log
--

DROP TABLE IF EXISTS `cn_log`;
CREATE TABLE `cn_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `lm` int(6) DEFAULT '0',
  `pid` int(7) DEFAULT '0',
  `cook` varchar(100) NOT NULL DEFAULT '' COMMENT '用户cookie',
  `ip` varchar(30) DEFAULT '',
  `from_url` varchar(300) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `date` date NOT NULL,
  `time` bigint(10) DEFAULT NULL,
  `wrnd` varchar(100) DEFAULT '' COMMENT '加密参数 访问和投票的加密参数不一样',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_log
--

INSERT INTO `cn_log` VALUES('1','6','0','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-22','1513915046','c708xbWvFbUbEtj/X+AYP131dlp52IoCovX+FOzKu8+Cs7z2wBjyVik/27OHOB9GvXlg1qrj0H7O3m1IZ7X2HNppTx21d7FyGQ','0');
INSERT INTO `cn_log` VALUES('2','6','13','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/user/index','http://mls.net/fwfl/','2017-12-22','1513915084','549dTLhd1BrLHcrJ+Vp7fnPfq3ZxHMiV1E7Le2isRM4hLj+n1W/5Qh7K3R4OUAeDEVYqsulwRYgGC6aSlsL/T85bzKLfx0NjaNA','0');
INSERT INTO `cn_log` VALUES('3','6','16','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/fwfl/','http://mls.net/stjbhl/','2017-12-22','1513915087','024aG7Xgl3dv2EZjZfErw1lOhX29FVxKafuQSy9h5Hx6Kb7jq2CudQ7Y7qxJy7GP/cYwtfMXV2L5wv5i37ekKFCVGVO4MzL8P8s','0');
INSERT INTO `cn_log` VALUES('4','6','0','10','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-22','1513915090','9aa2lcUIuDbdWY6UxdokBkBcSzmMJggBMK9aDH6ncFPcP05cJM7RwZXkCeVLehVFEG/sP5zLjFEqPRHYqi3Wm6aUDScagGo3tms','0');
INSERT INTO `cn_log` VALUES('5','6','0','10','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-22','1513915139','6520t2xvbSQHupWNQTh6l93nw+3utZTG+5QLOO/va123gS4WR4Q9YD9tt2MW3eHNo6It+v0JiUe0iGLW1EZViuLIEAUamXm51sc','0');
INSERT INTO `cn_log` VALUES('6','6','0','10','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-22','1513915172','74709Qk52bHAsoCFeizSVzi3XEuOGuWLRS1vCPEL4CfAjKDwgtdNDNjQ31Do2FejcsGrMnwQbedqSNjYrL+y2ws47PB/HvhfV0M','0');
INSERT INTO `cn_log` VALUES('7','6','0','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','','http://mls.net/','2017-12-22','1513921798','62bdm4YSjflxvG8ZAr/NI+tfRb8ERToKxY84+EORcSM67Q610GzgDQwu9hL6YmaMLOUNrI7LE+k3XjPydRR0jO8A964gBnnXZw','0');
INSERT INTO `cn_log` VALUES('8','6','0','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/user/info','http://mls.net/','2017-12-22','1513923345','3963ka/ifxHHtVczcPdbIwsSSYJ6e7kTFpkm7VG2/sLlD6q6m7b26gOEu/+krP6/SVBPSawqD9cpqsT/GI0bZ+FQflABUSWbcA','0');
INSERT INTO `cn_log` VALUES('9','6','13','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/','http://mls.net/fwfl/','2017-12-22','1513923347','b8bf/beA6YH3DqJliK/uxe2PKG0dYS1DRopR7owhfemfQAiPdP7buYZOSjD/5dTXUZG5f344ahLJi/AHjOGR2wgkht+nRMHCngA','0');
INSERT INTO `cn_log` VALUES('10','6','18','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/fwfl/','http://mls.net/gdyql/','2017-12-22','1513923352','33c0WPVazegi+EG6GCrbPFMDnnCd+vuY5P78cqXkLVwQAjR1/ud+ye28nUaoL0KjPj7mefRc1S6Drr7vA4Dg8eF0RsDycQ1TZTY','0');
INSERT INTO `cn_log` VALUES('11','6','13','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/','http://mls.net/fwfl/','2017-12-22','1513923356','0bd1ZXHnNkpuGB/tFdBHm3uhQoLUo8CJs3dlHChHLOTIvcqxRPg0hIordefF9ftETTdacHdhj8TdgZvZW0eWmBSWMOcbYKff7aI','0');
INSERT INTO `cn_log` VALUES('12','6','16','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/fwfl/','http://mls.net/stjbhl/','2017-12-22','1513923360','1214IpOeW6dydf4VnuZMK13wMlCvs8Ym8fgL9Thj0tfOgL93PvSBD28jJpJ149IY28+/ugmMui7vWUIHbKK6F61UQbgfjJPYPBE','0');
INSERT INTO `cn_log` VALUES('13','6','0','10','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-22','1513923362','46e7T/BV/O68GFPW3LeAKwTvSUr6vjwKPGx24byKdRbAUo7ByLNcSwQjA+nea44QPmER6e6Q3OBAomRhtbb49rMRdAjgIlbyzwE','0');
INSERT INTO `cn_log` VALUES('14','6','0','0','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','http://mls.net/user/info','http://mls.net/','2017-12-22','1513939989','b1faTk1e8PrR4Jz5z3iXnp9cZOMEc1ZQNWPMmhaMeFKCU7223CftbpzqysTz2oPa34mZIKyBm6t/QHytkZYJ2RRhQUWUU1BTeA','0');
INSERT INTO `cn_log` VALUES('15','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/','2017-12-23','1514013990','304d3riluhsxu408ScqAtwIN/Zh9cTAqYrsBHc4KL5ibWA9re06ETtDuVmbYg3L2kqoaoqHEyG5qdQ/ccIdNiQXbn+TnhKAtkQ','0');
INSERT INTO `cn_log` VALUES('16','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/','2017-12-23','1514014307','93ccSd+QRGGA9tx4d3EW91YSRQCIkKCT9qn3FPIFHMTYAzy69AECcRnMRDwZC7lm0/g+TBww4yr1rKN1YWCVZc2AqfWqv3t4Xw','0');
INSERT INTO `cn_log` VALUES('17','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/','2017-12-23','1514014371','03bbLI+Sa66Di7pPGLG361pSaS+OqN8JilFAldVYtT8OOa+IqsieW9oROvuQeHv1MIuoZpqehYZLy1Jn7YT1hpWABHeAmmtmJQ','0');
INSERT INTO `cn_log` VALUES('18','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/','2017-12-23','1514014564','40648/FsMkGEfHMVaOsBl5Q5cbLZLSyCN1snPhnlkP53wXgnXaaJGboOmaJVl6n3gBIUsNQ9hrleI59yWhVi5j04+AO0Zk5Pnw','0');
INSERT INTO `cn_log` VALUES('19','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/','2017-12-23','1514014624','bf78kMI7nRcIVnRJTzKk3ODicbk7FW+ZB/WLYLBDu7Zv3aHuaNOpceoKOFMRQb8haDcliEs/mDiZdkexmBu3VvwHGQa0krycgw','0');
INSERT INTO `cn_log` VALUES('20','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/stjbhl/10.html','2017-12-23','1514014687','7e7baH+iipHihZ5egfWE7XPzF8b9Rj39eC3iRd4n+jO51LshkFvntGCp/B4O8ROGkLDUH8mO7Qa2mYnEmqaWpxKjF3VUL6OTL9E','0');
INSERT INTO `cn_log` VALUES('21','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/stjbhl/10.html','2017-12-23','1514014737','d76ez1PJaY5Ifx8+OWnTyKUqY+Qg50nRI7rf2PXQCEAFXteFcUkD5GWAxYsLEjOj9dFl8wd35o0eflkodQvw8b9kSpV6oXYQUIw','0');
INSERT INTO `cn_log` VALUES('22','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/10.html','http://mls.net/','2017-12-23','1514014739','8810ZjOXuyFHcLBk6mBAQmDJo7etNFyFDfIsPwsZPJsSi5TFA1R88doqj+9A7FdHMzovskGvhU+4jtRRLb3YnoYLWInoXmqJJA','0');
INSERT INTO `cn_log` VALUES('23','8','13','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/fwfl/?k=精油','2017-12-23','1514014797','adff95dPEklsE1OHnfanGa2KlCMpH3n0/CXFvKIHoZMTGtrGhLIpxBpWh25pcwN9p0So9EPh/kCPW2tnbTtDRBt6b1tCBHi1pvU','0');
INSERT INTO `cn_log` VALUES('24','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/?k=精油','http://mls.net/','2017-12-23','1514016393','830dkM4xFC6wvN4edagbS+ptSjK8GFgAOIVZnrFQc9inOKqKNpBsXDMPDjfnLk4bpT8+actns1/mubDIEITc0gzoK5sPrxYQxQ','0');
INSERT INTO `cn_log` VALUES('25','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/?k=精油','http://mls.net/','2017-12-23','1514016431','b2ddfRlk5P0m8oABHX90h/f0oIvDQJL4jkPXGNhmcqk00BFmyhjT6Y/j5tH8cH1hNDu+I9uvjkznI14VaL95H4BLvoTcaPpojA','0');
INSERT INTO `cn_log` VALUES('26','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/?k=精油','http://mls.net/','2017-12-23','1514016439','5e05YrELpTHu7l5FBu74qVcj24zU51mxrG1o4D179HdlQKw/rI80r9Lr780CprbzjjNr6sjWFBRmRgWVbAREJyMvx43ouxDftg','0');
INSERT INTO `cn_log` VALUES('27','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/?k=精油','http://mls.net/','2017-12-23','1514016469','2b63EDjyCJxBkXLYuc997ezAJqpd+tlfr9dfNsgeRJ1oTEZRPIYjqRr5Z2GJy2X3I9ppnnXuZzc0b29zK9EIMaQjeIwAhMj7zA','0');
INSERT INTO `cn_log` VALUES('28','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/','2017-12-23','1514016471','c798JTp5nm/epWIXYz+7iVXCsKXSDjXFa9DmvjHqJ0VwAEGf6ZM5k/b9sAn78c5GZpqq2PK0GD9ViCh1re5MqwDXQZzFTqDeoA','0');
INSERT INTO `cn_log` VALUES('29','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/','2017-12-23','1514016480','49af2aboy4crKy5YYzAJWyx9ag7I/S9DptJd+8mr/tBotPVu15J/B1bSK+pj2f1luZw2Rgs6T6avit3nDsPfr+D8AODWUulxKw','0');
INSERT INTO `cn_log` VALUES('30','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/','2017-12-23','1514016553','436aFODqLCiOIw0JfSEESOcmSiP/DpjDEK1herdoeyp11f0+kms4Y6tcvzYhb9jiybmKMys2fAcjLz5uXb5DqDMDF7+C/yfAqw','0');
INSERT INTO `cn_log` VALUES('31','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/','http://mls.net/#no','2017-12-23','1514016584','a21bqn3fSMEjK7llqvIi1jaiEAjU20HHRabkUPSG/3ypH5sftbKMvs0K/FH6dDvdEGKBN10EcYJNtONLutXnuw3kCUUpGLkK7w','0');
INSERT INTO `cn_log` VALUES('32','8','13','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/user/buy','http://mls.net/fwfl/','2017-12-23','1514016634','62d3+o4oFUJpu07nf9BT/6qbCEnyH+j18EP16l6CkrDmNTWhhBbVIybMzeq6kb/uXQLQxT94V0GEg53Nt34s5Xdib5LOWIncAus','0');
INSERT INTO `cn_log` VALUES('33','8','16','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/','http://mls.net/stjbhl/','2017-12-23','1514016635','b26adSJQg8P2Q3gOMtgviXro21NksZOzhTstsjiC5+tpApi342vuAHxUGucZPCz15jEtfBlLa47cmFD2wZHYCLGAYCKVC1EtUpo','0');
INSERT INTO `cn_log` VALUES('34','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016637','2531JfakJfuh1SInBLF7eDcDC2GOz+2u3+MHyRsSv5Vi5a5c5NoCpd44J2xXc7HU6qKDGE4cYQynnOfU9MJLrSYCYke24L/T4N0','0');
INSERT INTO `cn_log` VALUES('35','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016644','3dabPyx82ujzyG98awkgJgYVkKHk8NStGV2ktxSFk1YjPQIBBEumYazbXOHWgAxXstzsRmgRrZCgZG+M8Rwhcw5ExMth8I2BMls','0');
INSERT INTO `cn_log` VALUES('36','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016662','41d17LWrMDrhMwqucOJ+L48YmxYf87i5TO/O55xCGxl7pXPVRR3KD2RYX4r0siMyHBvMGgfxp4iptui+UbiA079vyHMFgTuQDOw','0');
INSERT INTO `cn_log` VALUES('37','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016664','95f7FqB6gRMQLA3vDvs49cMQFLfJUg6zlD2uAZTHOqrLHTu0rw1TIj4Jx/mUOnemJ61rcKaiDOs0ZDTB+3zY/m/cHnuBNT8bz1A','0');
INSERT INTO `cn_log` VALUES('38','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016676','95337qgLgBbL32JH3FnZ9C2EuBHCJB2tn5T+1OLWvN/W6afWlcZMlzrsgFukJ9Rp3K1IT54rlSONiaTPCgJwigGM9wfZgzwWKhE','0');
INSERT INTO `cn_log` VALUES('39','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016738','a2265LM+m5AfLTgyj3pXCZCGs8rYsZGOs1uRuyTeSScwv1hhk/sZZuxOUusd6mW4o78Kcgv7TCH+p1plSf9PUQQbYi16cl2yFVc','0');
INSERT INTO `cn_log` VALUES('40','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016750','dcfdbWpIS/PrnbM0LyETr2DCiQx0zxfmGFeKVgCo8McV3m/RTjiu5Q/nGHKCirHrxhSEh1Mey6W8vYiEfwkt0OwZN469ERdzMaY','0');
INSERT INTO `cn_log` VALUES('41','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016751','f51fBBEci6uya65WNMi7VdyKFbI3GmOnHegR3sTKxrU04L3s5g4yrTelSWN4KoycY9cX8IcSEfNsBNQ0AruYfG1DRoqRUbU34mQ','0');
INSERT INTO `cn_log` VALUES('42','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016775','ca07ND+NWiHfEWYsjflj7EMY43n98cZsAeHMUJyUW+LfmNSObPTDP2dAwWGovWslO9t8jQzR7L/eohNzppl4JkTg8HnmfIJYtP0','0');
INSERT INTO `cn_log` VALUES('43','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514016851','f6d0gFG2msiXzRqf3DsQcTWzJJI8G8eshpfklgVbs/xuZDZ4EaEBPfewbgEnfOuwDEdKamVCF28l7n40fKYy0QXhOHbUoGFJtRw','0');
INSERT INTO `cn_log` VALUES('44','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-23','1514039743','470fwTuo5SXxQ+qWMVhxv7HObM54Xhgkcp0DdeXNpV/SDWQlfZKVdN8RAM8qt+0rTzbLm7YZGU/kI6br4K9SNGcAw0yLpRrpnQ','0');
INSERT INTO `cn_log` VALUES('45','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-23','1514039751','3cf860/oJl0vfY2bjIHOPgcJS9XjqzGSOCySBPEQ1e345n+xiOe3kldLOk/2pk7C/eB08uBvWLT5VVFBxxfu5HJUODjVG5sZVw','0');
INSERT INTO `cn_log` VALUES('46','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-23','1514040132','40e447qGTH2cvnK5KeovJ3jRr9AFuD9bd2+MwJKo7GQz0IvMk5ZYNP3Bd+vuNyYUXU5AIo4OpBmatlZkxYAC2nuan+hXRdidmg','0');
INSERT INTO `cn_log` VALUES('47','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-23','1514042653','28e7YBYAasmL6lzCLtNd254GzqGX877oO8IfT53rZ0YECJuIF01VOm2D/sBhUzzpsRaWi1kMadA/nmiazKO9tzVKo3lfyWmwbw','0');
INSERT INTO `cn_log` VALUES('48','8','13','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/user/kaquan','http://mls.net/fwfl/','2017-12-23','1514043740','d626SfyW4ymswFVXHudPften58gbe6p86MjshSP1lJZHzZHVxnu8G9RUV/Ux8I5mHunnTjGpfpaNPIV0JafSl8dZ4DaFTvFU4Cs','0');
INSERT INTO `cn_log` VALUES('49','8','16','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/fwfl/','http://mls.net/stjbhl/','2017-12-23','1514043752','0a1cxewEI4sHKZ3Qjn7sdk+A7+Km3qwtCPiCmJOX8EVYj7T1DrM4BnpKcrB7pliVvp/vQDkmg0TDWTiTww9oYMTXR11JoJ8QXBo','0');
INSERT INTO `cn_log` VALUES('50','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514043755','9d6bb9XCsdzxkXvd9jXks0Nx3Og4mCw4jEmfcqlV9cNUrtgHMkJxtw8VRep8wpRdABm1DXG8FvaNJLkIZlYC823RlWaGgdIaOKE','0');
INSERT INTO `cn_log` VALUES('51','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514044327','da4a7KM7VX6VNXUkTpdhfZaBetQUc702V8Y6hkiu/uQafq42ttz9AaWa8XkRrYD4j0Ica+RYFgtT+GpA6UqY+t+pflP+wJVIlVU','0');
INSERT INTO `cn_log` VALUES('52','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514044402','3ab5IUVNB/9I9uyPuOMWOBeF9VUndvoNmsh1K3j3Bjy/H12cOe6Fpr+aiBdlvO3/LIGxAltyV8MZ6GrJkifs4jp1jYqnOoOB+9c','0');
INSERT INTO `cn_log` VALUES('53','8','0','10','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/stjbhl/','http://mls.net/stjbhl/10.html','2017-12-23','1514044451','bd018t3A7Np22k2/JUdkoeOkq+BSV2aBhho9WJ9k43RCTIvFt9pZmexKAbsHZwPzO4vrEgr24cY5FA7ln6maKRxPVtMKLi++q5w','0');
INSERT INTO `cn_log` VALUES('54','8','0','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/user/pay/1-20171224120745','http://mls.net/?ef','2017-12-24','1514045268','9fbaRW1VUr7c4AQRxy8IafKZRDp/4iCsWNpPKx2HWGyk2DkQEURMRb4i5LsRdGE0alnm7+p1AY0MtryJ175brQ5Mef0U5w2YHA','0');
INSERT INTO `cn_log` VALUES('55','8','9','0','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','http://mls.net/?ef','http://mls.net/mlyy/','2017-12-24','1514046736','480206GYElg0gfh6Spu7vvGNrPkS1KWPzKPi9ec0wl5tfQEqQqMMaZqtWm+L38kym1RvOsuNftfdAB/L+Jau6EEi5of+UfjSAw','0');
INSERT INTO `cn_log` VALUES('56','17','0','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-24','1514102864','1acdqZXbgnkbVRE8aSodfikTrmScwVBs1tTU5j00i+lUo/wC/bz5pGYrH558NAlpQzP+8lBzfjaLpU9DivX8VUfXOZDzBr6DgA','0');
INSERT INTO `cn_log` VALUES('57','17','0','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-24','1514102871','e732Pq2ljW15Ze7D7ik85Xezk90233wt/XSByvKsN3hPuq4Q/nc8tV9ifIx0ZWpzs6sA4s51VJLK9WMUXwzfTv+Lc3+ljRt2+A','0');
INSERT INTO `cn_log` VALUES('58','17','0','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-24','1514102884','bd0eYTeT2JcM2ZVb/SC8Ksm+xMMoi9o/uiT1GYg59bNEw1n95OGPftcWdV+PC9vRljhI99VS21tCd0EHXGypA3FO8RtI48p4Xg','0');
INSERT INTO `cn_log` VALUES('59','17','0','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-24','1514102886','310aXgfnGlL+QuLSXv6HAYp9E2dEdC7ZNpnDqMmDk1NPeYz99SMAI2UcjeW1S/fBpe4xD+rjV0LfT8fkVlzb7dccC5NG6XDHqg','0');
INSERT INTO `cn_log` VALUES('60','17','0','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-24','1514106202','fdd8GBXRxCqkYWAK/i58xWHNIfbdbx4SovlGaHNsTJS8fp1EdVwW4mpnrwL0La1gGkQlcnPCg8F7CyWFKgmIg/vCK3b8Y42ljQ','0');
INSERT INTO `cn_log` VALUES('61','17','9','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/user/buy','http://mls.net/mlyy/','2017-12-24','1514106309','be97kJPsInGOwtcWdRPvtBc8E56tfJ+PTvQf62Hnqh/ulPivREWeNJV4S5WQfrW3zQmd04R7ClKv4w0jeK4yO8C41p6TDgNLiQ','0');
INSERT INTO `cn_log` VALUES('62','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2017-12-24','1514106322','b09cAYfdNcfAF5ckN1JFqwhNt1Uy4Nl/H36cxUW+Xp8Qiq6yzkRP64ZXJCImNjyKjC5o297NvSFreT/Hy0uBCCl8SXHluY0SRho','0');
INSERT INTO `cn_log` VALUES('63','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/yyservice/','2017-12-24','1514106324','6f23F2op0XnHF7j+TeK2CqYAg7sbAZnJ8kGc/ecimbLvvjsqpWpVz/MAkgEJLQ6qyFZay4c0B+hHc9O4mMK0tBCic2fvgUt0hC0','0');
INSERT INTO `cn_log` VALUES('64','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514106894','d39eQ3fgnx6M3M6bz6O5fvUu8aPlCU+vmD7kZ8XlbbDruEnJGaJ578IXLoqFXYpnNEMc84wDzX1VYu93S7jViv6wqk03MVg+j50','0');
INSERT INTO `cn_log` VALUES('65','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514106904','3773HIFSvNtOHrBXLBMOq63IBo3oPf2+yo7xtGk0skLSFPShh9MxF3MWtZW7ShmR3G5JNElRwu373wnvJJbmY1iDHmDdbuTnpq4','0');
INSERT INTO `cn_log` VALUES('66','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514106916','9ef2Ge/c7e6upl7TRoO+IRk73TLy1WpmtyNbLNgPbLfQE0/B9EafqExnuUiy6KJRQuoAut62gf42Hdtj/W7hHk0rIWG3CyG55Zk','0');
INSERT INTO `cn_log` VALUES('67','17','2','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/','2017-12-24','1514106946','53b7wLsFLkvJzGFsrJ71T9bniZNetj9wNNDifOR2Cl7iTuA1kW1Xvn6z5P1gNVnGw8Ql47Stl7pbuJ4IO+yi6EbqM4ULgn9Ibg','0');
INSERT INTO `cn_log` VALUES('68','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514106954','7be7XnxXm+fhdXLZMdq7P/npvgJBfEyCzyTZZBFVN9APYY7piz69BiCJzNA09kyqJvgfzpPLApBARZdi++3Tdk25py27qh9msMM','0');
INSERT INTO `cn_log` VALUES('69','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514106957','5eb5fQIqr6zi3UQnER1vmQCW6NHY1pkw/Y5XsmsllB8HooJh2LZE5B1QchieLFYTjB4uEWqrGRCziu5RfNKjn/JNTfWL1PFBSNw','0');
INSERT INTO `cn_log` VALUES('70','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2017-12-24','1514107242','151ffRhrhUFIM/x1XNtjFS8lxbTeW7z2O9DyIEKWxcwE9IdxsavTjs6VZ+mUWSjNfOrB2IMUnBDrk8RRfmAob0lWYnxN77V0X1w','0');
INSERT INTO `cn_log` VALUES('71','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/jsyy/?k=归属感','2017-12-24','1514107250','93190NF9pNGuSUOBXIcl4SRdmBBJp9wthQ4eqsZYnG3SUp6bpKu/NHwvB8WQ2ZL6acRSGURP2KfLfA9vmNrq0TymTZgfPgXOQWo','0');
INSERT INTO `cn_log` VALUES('72','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=归属感','http://mls.net/jsyy/?k=老师','2017-12-24','1514107255','77aemqG4zkZg2s4WEhSbOlXp5xtFPXy50XVPfDG/qTsZ2zM3COgx3yamifF1n0Yf7eUnEJ32nL5evUy511oiELxZyTXuRRrLFUo','0');
INSERT INTO `cn_log` VALUES('73','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107527','c551Od20hiiv485m+hyaylgbIovdqB4g7yqVbWj9ZRQ7sHDMQAipy9f2qUPSHrmDvoHQnCBQk8swtgiQthPrd8zU6Ljj5hAHyOM','0');
INSERT INTO `cn_log` VALUES('74','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107574','569beItA/mfw8btA6LopKEbISVaSYsm7M5R9uScGb4l+85+9ZZyKOmQMDz4os6dtfyZrNG1i26rVCQ0xRlYaUY2/aUFS0YQH+QI','0');
INSERT INTO `cn_log` VALUES('75','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107638','e9ffR8YL/X1hufMpUQajhlqha86LDgeSI36xLYxViMFc/Czkj/1EQkBNHx5REMGs96J0K2qV8maODmUmiXaGn0c6EpLqZcNqyWo','0');
INSERT INTO `cn_log` VALUES('76','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107650','1c871ZYjOX/nhVOvwDKblWiCtzq7T8oWDQ3khabe6pqudvu+H56m3K6WZNr/FE+4qsNlc00i9UfhYoKki3YdXk3SanqV5vdBP3k','0');
INSERT INTO `cn_log` VALUES('77','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107659','8190/l6cI4hzoFlq6QSgM+ZnsCi0bdms5pZEWiIlCJ0jNmE9jzonz7Vc2hEIB5jEmcbAi9FqA6R6OCgg/PolIu7GZ2Bgdykjuog','0');
INSERT INTO `cn_log` VALUES('78','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107680','d430oX5VXSKPtmq26+p90E+4TBRjTVMyCXnkx1kpi1QkxcWG5u+XsvdK5dwyTZcDcTsBUiUvQ2j2KeZ8EJPW8O3CgN+CubtRqpM','0');
INSERT INTO `cn_log` VALUES('79','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107731','274f4TxWpjRop1vRcP0eNz0pTRI5OVckUihBdJ/7sinKrc5DVuoSK3mo3W/CJii4Kn4doH6CTJxIudFUQspy3rn6oeb1Z3vsiOI','0');
INSERT INTO `cn_log` VALUES('80','17','23','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/yyservice/','2017-12-24','1514107737','b70c0jZH2VoI+6/rZtfOCCzsSSziKLbr4+JQT7iz1oDGge2VBMw5yCiWzIKHf1wQX/Ed9V7K98O8fs07xaGeZIn2yuCM2ckfXUs','0');
INSERT INTO `cn_log` VALUES('81','17','2','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/yyservice/','http://mls.net/team/','2017-12-24','1514107926','c1bdc7PVnZYJQWGxT2Y5nSDCWiDhpd2FRH764FrfCaiMSlzunP8y7aeX9wYAsGrkqUzw01TZ1CIPomIh7NrwpxDTdYy09lovTg','0');
INSERT INTO `cn_log` VALUES('82','17','13','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/team/','http://mls.net/fwfl/','2017-12-24','1514108159','a785LkP6nzZFQSJfQl3Xho1secprJsuSco+ymFaJOl0swBctgSsRGjGUdNBSotI6pEYGB6vZzciSqMCt7gjLiMrKniR03c3NhRo','0');
INSERT INTO `cn_log` VALUES('83','17','9','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/fwfl/','http://mls.net/mlyy/','2017-12-24','1514108161','d85asp5tMKRNEmKQ9s4/GHsdY0wqUqPjymLI++dKyWtexY0xIdVHfujQnmR1w6MoMdS6T49ynYjjzL3MJc4MFMPBZtVzwy/qQw','0');
INSERT INTO `cn_log` VALUES('84','17','9','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/user/yyfw?id=2','http://mls.net/mlyy/','2017-12-24','1514108227','8166hFkHxMF2vSIXhD9dvSf5P6eM0LB13R7atDPHcpVi1sL8P1WAPS6WyTU2Qo/MlozA4gmKx2fZpDL0hl0j9jQuGuL2GWdtHQ','0');
INSERT INTO `cn_log` VALUES('85','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2017-12-24','1514108229','b460Kku8atfxt3aEFc3d6WiuBPtGgnh+RqBEJaios7iVjtIxtLwZ0z6Q7Yq6dlJnttP29kg2o50R9SGqUClq+s0w9zOU0GVlxR4','0');
INSERT INTO `cn_log` VALUES('86','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514108232','ce2auM1g/507HsbfxyuithPaNA149f9yjmrQxZ1f1Q9puivx4+54CONcssLwS5yPx/vIN7BGEntG9KPuwSy7/uyEtchB+4R1MQ','0');
INSERT INTO `cn_log` VALUES('87','17','9','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/team/4.html','http://mls.net/mlyy/','2017-12-24','1514108317','8fddFk9DPI8kp8jlAA5GTUadL1ZsKgGHfGHxBvcqnlCMEkAFWuCF+8eslwB6TFJgB0qWdsZ6Q9FyJnDPRqbNRWNz6RN82cyZKg','0');
INSERT INTO `cn_log` VALUES('88','17','25','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/mlyy/','http://mls.net/mlyy/list-25/','2017-12-24','1514108319','ca2f3LzpRtnL6I9dghGq6RL90ee7ZVFxRxIRee5v/Y5cRcAvArZAKxHrOxEwaUXS6yPhl1IMDH4cHucJ71cjeWFViW5FxRGBT14','0');
INSERT INTO `cn_log` VALUES('89','17','24','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2017-12-24','1514108384','5982Wn4RdsVyS/mBS5Y0BWnSH2aHe2GJr5tW2Beiv8kRNNlud5k9z8zL9K3AWkf8zhqcmKImWqzTNER49BfMDCxdAClvZP+kRqg','0');
INSERT INTO `cn_log` VALUES('90','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514108387','c4c8Ec3H+oa7cwPFq5f3Cu82XHl5rmZbia1lyEs3G3i56EKHQE9FHWOgjtmvAr4zNB3gz5mSQbFbV9oevDm3+GB1fp4ZPQHVrw','0');
INSERT INTO `cn_log` VALUES('91','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514108390','900aJddIUCkOgJmcOm4gnGrlAkl0KSvhEC15ZpSf317552aN7c6EpkFwlN9+OlsaIwwoCnJm9yAoX/T6cqdrdetEoMiCw0kMMg','0');
INSERT INTO `cn_log` VALUES('92','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514108401','0770f1iAQ2XM1mz8XouhowmsglOYfvHx5DyYLrH7fQTtdtZx/5VADIuIaPBt2HTx9IESHi+oRdtpDHoUiFFPkPaRI1nBGr4Vaw','0');
INSERT INTO `cn_log` VALUES('93','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514109475','3f40WwmWTLC3Wsd2a9F3jJiP0OFGwdjOd/N29HWenwjZaTHc0LoRDBfdWlrrc0Z9SrlgzOxYYdTsCcyJcMI89017+YPKLnKKtQ','0');
INSERT INTO `cn_log` VALUES('94','17','0','4','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-24','1514109550','99c8y6aSt6rqNrXY0vyDOrIKjOUCxFyN4LEm8cnA313is430rKGO2G22SeDbJHJ0FBB658OdEkQPfFEmA8wHZDhmTeJLXesX7A','0');
INSERT INTO `cn_log` VALUES('95','17','9','0','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','http://mls.net/team/4.html','http://mls.net/mlyy/','2017-12-24','1514109784','5196oLaQ/QsBwiWKH3sO6JVxXN8zKPPi6gRvGsFV0RWK5Z92ebl4yNMRC8iiE/oBySlAdKYPHtedCI4ZEXa21CqviIeN5Zl2IQ','0');
INSERT INTO `cn_log` VALUES('96','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','','http://mls.net/','2017-12-25','1514163527','4820YStlLPf52bo5MNYM3ujf3FBNDLFqHS4oMiRUET3GLVAUzfaBs1HyaYur3Jf2VTtn/cqi6ILjdkwXMuFU9Bb8mDD1LnIrbQ','0');
INSERT INTO `cn_log` VALUES('97','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2017-12-25','1514163546','b8daVf8M//f0Q6DCftlnG4Ir7/aA4igRVEOzrCqPDycwpZiDUZAkJxSADGBTfZO1kfQGFHA2wSz4UWzA55ayXARQfDtQldiecQ','0');
INSERT INTO `cn_log` VALUES('98','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-25','1514163553','8f200m7Sc9MGEX4sfy1AlOYGCSzFybNoVbad8L9zNW+udYdKuPYT1mgU7+BRVqLVHaaCzDd7UsiJa8m2OqfMHJCf6CsTfO7rug','0');
INSERT INTO `cn_log` VALUES('99','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','','http://mls.net/?wrnd=qm','2017-12-25','1514163555','8adaOr1LSEfb+FAPazqsFU1q29aub/IkCc4hdrB2Up/5LBE7kpF9AnG9Btewb795yBpztiehyGB8kTKxmd2NqYUBJvoftAIvLg','0');
INSERT INTO `cn_log` VALUES('100','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/?wrnd=qm','http://mls.net/','2017-12-25','1514181566','5506Q0oBe8T6XRI7SNY0mYQ/qJqTFfmYLli302TEVak9uIgPPAE0kBySj1YgGzo1iZAz9lmLDgdZKIuCFfeGZSR/KAfGcltWMg','0');
INSERT INTO `cn_log` VALUES('101','19','9','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/','http://mls.net/mlyy/','2017-12-25','1514181742','e0aerEaKdbudccRAFfKL+rxbEZNKAMl8n5LUJy3smC5xNnUEPwU48AQCJOVXkLDpHL+IGRbYAl4GVELF/4IUnm0s/FCD1tMM7w','0');
INSERT INTO `cn_log` VALUES('102','19','24','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2017-12-25','1514181745','371dHUQ8vcs/UFEArhkqcMQaPAXvEFaXZcYqstWPUE+lYSjUAnDFXm4sG8agUU2H8dmQdr/eipxHp0DmFb04O5rNFvuaE5OnJEM','0');
INSERT INTO `cn_log` VALUES('103','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514181749','a1fe6Ya+At+/dlRcIhAA1rCZlxDihcLAQg7QW4H5yA7IgVlC1wo+PjN0xIMJ0hMHQ55cPtSalOpzWwxaDqgy0HNn1FjBkw3zcA','0');
INSERT INTO `cn_log` VALUES('104','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514182112','6a42MqHUOgn2bMMNEONtteMZ8TOJMOnS0rcN3TdKPhkB5LzjmjLrrI6gJUaMWlP45Hc0d5uQmLPsM8bLuIFSehxx/3mtS3UWfg','0');
INSERT INTO `cn_log` VALUES('105','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514182178','94b0ZEyqtC3mPeaAT64TUNlztJN4YlA/O1IrdQUE68+dBj2PcqybA3SbQSVaTKfmfOhUjlss+znvR+j4LXCeGLPmsgianzV1sA','0');
INSERT INTO `cn_log` VALUES('106','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514182193','0522KSgaJfnJds5l8EHgVst71kQOxc7eA2gJqH834MFKQuYfOPUdDBoBOpOxcb2FQdSCxKaqfYQ2j6wi9W6izsBSy9WAg/EZFQ','0');
INSERT INTO `cn_log` VALUES('107','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514183603','c25arlZ/Q5Pnl8BwAodpsV4so/oqECsrW/87LtdNMCqupxTTNoCyIe3KaXPFmogmZhuu4hi63gIzEyqGwgJZZv0FRvbZ3gEJkQ','0');
INSERT INTO `cn_log` VALUES('108','19','8','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/team/4.html','http://mls.net/contact/','2017-12-25','1514183668','6cf4wcVvkkU82B8Ab4IXFctbWwsW09quA4ASdZHy45+6gMJD2l/0XtD2xfgF9XOVSZf6vY6HLUeFXHdWJDNYXTLkvxJchJLD+w','0');
INSERT INTO `cn_log` VALUES('109','19','9','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/buy','http://mls.net/mlyy/','2017-12-25','1514183760','5a7eBx+DOXBxBt1Ben1PYRSMc8h7um+LJx8DDjIyQCiO6KgiRb6TiL6myOCJrhWZRTuv9qhJcd85grmTYyQRfaWzFbTljVb0iA','0');
INSERT INTO `cn_log` VALUES('110','19','9','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/buy','http://mls.net/mlyy/','2017-12-25','1514183823','86d4DQNJ3t3nTSpbW6xDiXwKT3GHuF6rkS1GvWuDR5qpmoADCiTOUFiCHg0ng1gQ8rdrYeUPCK5ps5z6rMGgs9o6gaoIIYp1Hw','0');
INSERT INTO `cn_log` VALUES('111','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/yyfw2?id=2','http://mls.net/?ef','2017-12-25','1514184725','202aKb9xGdXytHcm2s/cw3BrmLhu8ACpJpuGv9HbDcnq/MyYhrR7a2NULu3Fedi3R6PbMWxyQsImeptniwqUZ9DTCQ4+HMST5A','0');
INSERT INTO `cn_log` VALUES('112','19','9','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/yyfw?id=2','http://mls.net/mlyy/','2017-12-25','1514185339','6540iqZQbtDoBk2BnepaDwonWfS5hXhzmZ9PcUVecLygYqEQe34ci7ptd4g1Malm1Wq4JRN7SpkE9U/YmKVif6PHH2MsC3Ffrg','0');
INSERT INTO `cn_log` VALUES('113','19','25','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/','http://mls.net/mlyy/list-25/','2017-12-25','1514185341','ace9SwCHes3BtjUHWIc559v1fLoDnRuqbFgGG80xSC3Yqyv8qajOev5eN9eFAoEMS1p0YzviWs+XBa7Ur/bhhRGjIwNWvyWlwuM','0');
INSERT INTO `cn_log` VALUES('114','19','23','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2017-12-25','1514185570','0e64wAInZuwY7AJ8PcxvvqlwtmlEz21qLZvGJO/uJ6vAlzLwj8iTtCsoSossSB4DYuiZjKqnIAlzwisOG/c1KxssELEble0TgEI','0');
INSERT INTO `cn_log` VALUES('115','19','25','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/yyfw?id=2','http://mls.net/mlyy/list-25/','2017-12-25','1514185592','f3edKCrsSdqFwl7l6/se7ZtZvNTkZryt7hqptUagrp9hYWsKEynPdUzWSNEBpf3nN0TH3PHnY+KhRCUzMFKxiMc67TPkS7KPSKI','0');
INSERT INTO `cn_log` VALUES('116','19','23','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2017-12-25','1514185706','f2f865Y6BDDe+Hofg5upr2XwxPqcCMfWHCNyJkvM3flC5BBUkvQgJYI04klh3nvD1uBNmk8idSEMDwj4YlUfYit2U4yaIQZWBSY','0');
INSERT INTO `cn_log` VALUES('117','19','25','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/user/yyfw?id=2','http://mls.net/mlyy/list-25/','2017-12-25','1514185734','049dQfr27hVFhvnkMBZTfkAA3diNZq1e5fw2zomyo1XuoSRm8m74tuxJ0SMLXbXLHRcjbzIueSUCpQFZaPFb2yY+YmUT+eIalLg','0');
INSERT INTO `cn_log` VALUES('118','19','24','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2017-12-25','1514185925','cd74t75fYCCUUQesq8tG0fmuEGqM6guFC5qLk37ewjleG4bjI6iP6Fg4OOsbtHiqm5/DkTpD/KfMFXQpF/YlgD+9oFPZ2x2SHfM','0');
INSERT INTO `cn_log` VALUES('119','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514185929','3949AYPPOMEIDXlVY/VEZGyU+ciGlQLmwMcTSge5FEvkfsof+ZSjEtlkpXUcKNIIBqMAQ2WUtPqthmEESPyFIxp3jZ/hkZfhxw','0');
INSERT INTO `cn_log` VALUES('120','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514186336','f64chXN9jBoG5NZzWE3Kz9OLpIU5a1T2baCvD2hkTf4HbDx6JuxztL8mI7kAYrBqqvXjZq7SHO1hB+Zp4QZtCzC7tyx/0g9ZDQ','0');
INSERT INTO `cn_log` VALUES('121','19','25','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/team/4.html','http://mls.net/mlyy/list-25/','2017-12-25','1514186345','7cebp1kv9imL1RXEgLsntavP0ikUpRcTjNsSkBCceVj9CzP7CukbCCudpTRcgGJ0uxeVroWlct55+SIrXHJlY2B2dnl8gc5ytHw','0');
INSERT INTO `cn_log` VALUES('122','19','24','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2017-12-25','1514186541','11c2fIa6DHAV+bSUO8zAMOUinJgUQKqGf1vWsY2KNkfU9ZdKI/2WmWxJi/eVS8LsDRylCpFfH+d+xvdpKWQVqjcpgCMw3uQbAHI','0');
INSERT INTO `cn_log` VALUES('123','19','0','4','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2017-12-25','1514186544','1c15oasdbQcxmGhrOsKCU03JEtA3xMkNiPFLDFvBC5llFl8GXnXL3Uw2cwf3p7BdNQYOYKTOFsjdgzKnSHgO8ydHAwtZoXS6yA','0');
INSERT INTO `cn_log` VALUES('124','19','0','0','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','http://mls.net/admin/yuyue.qm','http://mls.net/?ec','2017-12-25','1514188803','45c7XLjFT3aulo+nS1h6Age/jfUfl2Dp2J6ijvygGKSWTVzXNP2nNjzJ6c7Hbboz2U/Z86nGfnbV0PDo8PsTXr8sdNbPX+L/CA','0');
INSERT INTO `cn_log` VALUES('125','20','0','0','6eeea0bc26347a7b279cc177233d3288c4498c9f','127.0.0.1','','http://mls.net/','2017-12-26','1514249752','1308RzwnHhSzuXELxMGhZpaVMu3xpR8CoPT7dFdeDqf6WMiEXGVW7sDXdARwR0VwwDKLm/6M3Yp2KD0WtqHj+ctWLy13/uNgTw','0');
INSERT INTO `cn_log` VALUES('126','20','0','0','6eeea0bc26347a7b279cc177233d3288c4498c9f','127.0.0.1','','http://mls.net/','2017-12-26','1514249752','5ff7gZCeiSqr6xqesdx2f8rE3SK8E0ehoPTt94VVBdl/JY9nBVl2C2EtT83J5gsReGk9itP0fmytH7GdTv64NrWktmubcq4BAw','0');
INSERT INTO `cn_log` VALUES('127','21','0','0','e55d899a70e2716a817234f1fc470df8275b51c5','127.0.0.1','','http://mls.net/','2017-12-28','1514422802','d039TPN+LZIbA4W3O9AX0gSwG0KR//PD8JVFwnoYl/OnSGqS2pg7zi7tcQfNKW/dDrW4HZVQeXG1U7oH5FUmpKE1gcUJPHRn/A','0');
INSERT INTO `cn_log` VALUES('128','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','','http://mls.net/','2018-01-02','1514853598','bf4bHQ3XdoAWr6xI8gRYl2FygbIP8p2tvlXwcOOrHJiRaYsuEnBx5+gz6+VWzr98XKfPKCtzKMx3MDIIWR+HEtauds4TyvUNwA','0');
INSERT INTO `cn_log` VALUES('129','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/admin/index.qm?index','http://mls.net/?V=7','2018-01-02','1514882299','a795ugvShPPpvXVSrYmwICbK8xKlBiGRJC2TtbQviu6KGk1zqQ9NR3ueX2pEgn2tZDcmyBUYUGI+qAILzM6K5RBU36t5fOxLaQ','0');
INSERT INTO `cn_log` VALUES('130','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-02','1514882302','fcbdqRY9crpS6pJZVf4m9XcaUE7T5ujQ2/aSyDgXy5YZzMbRcg/v25W6Z6Z500A2UApZKgnSiZ+lxq8x9YcbMPJqvLIc1X7sdA','0');
INSERT INTO `cn_log` VALUES('131','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-02','1514882318','f1e1/bqZTKBDsZo8km/VicVaPdzZ8EvUj8Om87UCUWQmAmzNSvRKuf9NE5R5J4ctcg+EkLd7bN/uGkOuTLseuYBEvAQKSkQZaw','0');
INSERT INTO `cn_log` VALUES('132','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-02','1514882320','839e0oRJ7JK20SzhaoxlLB98zP3cxZSCD65etyX4oynJsYBl4LLVGDxXmRTX+Rhuk6wfwr2F1ByHj0LMB9si9cVJ0vMIe+6nig','0');
INSERT INTO `cn_log` VALUES('133','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/admin/order.qm','http://mls.net/?ec','2018-01-02','1514886377','3b4eDgpCITx7xyUMpEE7U7jYCM4udDnrp2OwU71C0spB/15Bt7jfGdkGChOofkT1PE20fMth4xHiBZkr2jSDVJBtY6qcqJJu4Q','0');
INSERT INTO `cn_log` VALUES('134','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/user/paymoney/1-20171223064449','http://mls.net/?ef','2018-01-02','1514886454','b3d1LXJzdSX/Ip/2fCcX1B1UiMuqNiq00esWIXMe9XnqsqqKIKU6crGzLMvg+4fVehTUujbbmcLhpaSZ5DIrdCj8dAO216Z9xw','0');
INSERT INTO `cn_log` VALUES('135','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/admin/index.qm','http://mls.net/?V=7','2018-01-02','1514886494','afc8DNjQik3gNLSJc03yoXUbh+eDf2+YT4/jPAVwX5cjmN9Te2ikCEHyFSwdeQ/F+p83HuJSCH0ITGIxpdSH3khrkRWYLM9T3g','0');
INSERT INTO `cn_log` VALUES('136','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/pay','http://mls.net/?ec','2018-01-02','1514886577','1bf21TLU8dS/GJ0kry9Q/e8SWJBbGPAITIgtZQjQkj/7xYLAYeiNHcoO84agWHBCA2+1d5eRTH18rVTM6qoOjmH5Bkutxkne3A','0');
INSERT INTO `cn_log` VALUES('137','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/pay','http://mls.net/?ec','2018-01-02','1514886628','0f51AIGaPxwhJYhnuPlWZwBqOY9ENzrbFpJ+f1E1BFf813dHs6OFT8BawBG/vOReQ+1/Da3Rszv1x5If4iIRGtkR+1JS92ZD6w','0');
INSERT INTO `cn_log` VALUES('138','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/pay','http://mls.net/?ec','2018-01-02','1514886649','3f68/GIGHdJfsk7iqeVgM3oUdUgW7FFo+9a0qLg3xjIgvw09AwWy+6lgpeENxrvBOzCul/WIjhWKQyWShVb7nMa32aY2fxcdKg','0');
INSERT INTO `cn_log` VALUES('139','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/pay','http://mls.net/?ec','2018-01-02','1514886672','3f9fi2rc4LMdNdzA1hlRMh3n1bN9YvLt+AZmWKmfNgXxxwpBOaB9evpz6oHPTss62yrml83n74LRvSr7uZwOVBlMtw+ArkFl3Q','0');
INSERT INTO `cn_log` VALUES('140','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/index','http://mls.net/?ec','2018-01-02','1514886728','60ff5TyvtY+5FZoEp/H4CpVWq/GdNOmgE+X8+Q11miANNlDMSJKnAgKB5Q9qGEnwdCa1q3KTRTH6YXhLMlbjBvJkJkB5ubkF8w','0');
INSERT INTO `cn_log` VALUES('141','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/index','http://mls.net/?ec','2018-01-02','1514886767','f015gG4lDA51i61O/aMNlBrtnqqcv/fEbGxZSQPs8AL5jW1WcO19puAIvHspBeWox0odJCqBWOX8KoM4KUZhQDlcRbBzAOWW4g','0');
INSERT INTO `cn_log` VALUES('142','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/api/api/pay','http://mls.net/?em','2018-01-02','1514886873','793dS3MqZzcwOpTWFH9BcLp4dej36I5sjIt74DhneFQC6PmYDDgRz4sxenGejjwKgTdDDdyDPYFKtDxvg0YU+CN//lMOO8NVJQ','0');
INSERT INTO `cn_log` VALUES('143','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/index.php/index/api/pay','http://mls.net/?ef','2018-01-02','1514886919','40absYJUyv2qe02NrZ+k+xobu+79l10FjPhipI4/bBINdz5LSM+CnjHhFdHFg2dcDng49ZomE35/8oPskfrPTKtZ7vtNmwZF8Q','0');
INSERT INTO `cn_log` VALUES('144','22','0','0','176ece5a21f3ca65191a842eac7ee86e605a8c6f','127.0.0.1','http://mls.net/admin/index.qm','http://mls.net/?V=7','2018-01-02','1514886946','5958QxzcSiMu7a3tNZFPqZ5WaUH3sb5HlAatZjP/st6adOg2i3ybwP2jDwJjTQFSA2oaEWcCZmpK+bZ3FmuFah943MitELmBgQ','0');
INSERT INTO `cn_log` VALUES('145','28','0','0','f05caa17fdd4c8a1a256aeb6a10cc4df29eccc6a','127.0.0.1','http://mls.net/admin/index.qm','http://mls.net/?V=7','2018-01-03','1514940899','7542vfri3uW158ZD6qXZPyy7J6dlPecHC++JJx9EjfrPz+RlGUSCiIDxHpBlkstlRHSHls/mN4i3Z0ineNj/tBcRlfHiZoMCfw','0');
INSERT INTO `cn_log` VALUES('146','28','0','0','f05caa17fdd4c8a1a256aeb6a10cc4df29eccc6a','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-03','1514940905','7aabvucQlvi+Oi3wIAyDfyzYdaShhbSj5AwnB6HnBxCsC0m0VX6LpG1Uc4froCHr2nN3iFhTDIxoK02XCVtmECq0nI1rYNy33Q','0');
INSERT INTO `cn_log` VALUES('147','33','0','0','789b10da2a4b778526d10632e52331e2fcec5238','127.0.0.1','','http://mls.net/','2018-01-05','1515135058','1412QJzzYZ10fPyQxgIx1MOtVwyqKucW9lVJR/vBhgbZcRTyTxJFRstDjNO3sBp7ID/WJuqYPyS+y8mRlM9j3tg9NjchLH5WZg','0');
INSERT INTO `cn_log` VALUES('148','33','0','0','789b10da2a4b778526d10632e52331e2fcec5238','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-05','1515135064','5123CEYLLaxPJvtbCqdc5zyg6ZBkmSuJkxviP078LpmuSFykHcEULyEtWHFrvBH3Ix8RB7ZsJcxIFfSXRsXox39mChgmZqJ5tA','0');
INSERT INTO `cn_log` VALUES('149','33','9','0','789b10da2a4b778526d10632e52331e2fcec5238','127.0.0.1','http://mls.net/user/info','http://mls.net/mlyy/','2018-01-05','1515135703','dc82Fe0kDLjTBQ18ID70yCHHyuIPvKyLT67dl1VWmlGG6bJVnAhGYJRPxsXgazyfHUcm/1sh2IiRx6rZ1iTCu1fn5JE3eqw0Wg','0');
INSERT INTO `cn_log` VALUES('150','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/admin/Lists/add.qm?fid=2','http://mls.net/?V=7','2018-01-17','1516153106','7b3dh+yEbPIG4VJhu0Ogn0BBGrOqaGN6y755XmfR//MjZLrCn1XvLCs7cMnsDRPyUpw0WCex4jGfQa24bqSZxq1Rbn5iA5SQJw','0');
INSERT INTO `cn_log` VALUES('151','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-17','1516153112','5f0cJ2IoHriEmDzWhO5itxPYDv2yYITQMNsNCkfk1mMFSXxAPpsEqV0YWJ7tqOO371GfRUGwekbZ5uX61x9X5rsNzc6sFzS87w','0');
INSERT INTO `cn_log` VALUES('152','51','2','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/?wrnd=qm','http://mls.net/team/','2018-01-17','1516153123','67560pP+lPPnSMu5eYbeU3VGgFEbB4jSlJ1C8zBZigffRyaXDLC1odg7cHNGEIJD66YZGdWdbcxPSD6IA18Nk3iRzw1oZplk5g','0');
INSERT INTO `cn_log` VALUES('153','51','13','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/','http://mls.net/fwfl/','2018-01-17','1516153206','c8edqFMfSWXcZwXvIAy26E+6VTDTmqxKkDrvJfN0UBcRBPRxGhcukZes4NN4xs6bYe2vqmxcqhyJ+YZ7qUnyW94+P1yHwUc1S6w','0');
INSERT INTO `cn_log` VALUES('154','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/fwfl/','http://mls.net/mlyy/','2018-01-17','1516153208','78ddJrlGs1zmgS0Fs3j17dPLn+UquK6EOQ97SaQl5f+8lzVnbf+64/H2mg/HV1Y3CIlI5ITPoImhdVRsD9o/wasTqiOJNxjgmg','0');
INSERT INTO `cn_log` VALUES('155','51','24','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2018-01-17','1516153211','366bBVcj3xVrYxdhDK6TXdgNmSjkNIXDcnLYmnkPlpVAcuXJ/RfBb66k6eYKgOJlcaprTgUaT28qeeXsxPkSedjmlFOVS614L00','0');
INSERT INTO `cn_log` VALUES('156','51','0','4','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/4.html','2018-01-17','1516153216','ef4bS5Fs3wHiGoxoc1vCtvqM8bAf2I/iKXIQnyAj3ktS/tOTRQdVTa3kioWs/d0nJgg7fxNyQ2DCUjuhkIT2BuWfG0hHZHEkQg','0');
INSERT INTO `cn_log` VALUES('157','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/4.html','http://mls.net/','2018-01-17','1516155944','5d22MtF97lVXz6YulJ1TnnkmAWIfrkEKFTmcsvbDJ7C+X6jA6mw7LSVpVd7roigWtzOLMX3h21WWA2r+hvgjEJDicnlIM8icCQ','0');
INSERT INTO `cn_log` VALUES('158','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/4.html','http://mls.net/','2018-01-17','1516158787','7ca9AGO2pTAM5dgxtdCnrjBdU0rZ/oUOlRMMZ/EM0WLVexAdSbHhimt0G1lOwLOIv3wfFwI6qCmUtF9++DSJ7cw5v8CTaxvktA','0');
INSERT INTO `cn_log` VALUES('159','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/4.html','http://mls.net/','2018-01-17','1516158789','8562EXvsyFqUnz9C9T/p31qxZhh/9InylH6pvRk2WiZQl9M/elhksCR0QLiZApEeyhhdoRCk7kYllpu/S9HWybT43Zy64TGzYw','0');
INSERT INTO `cn_log` VALUES('160','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/4.html','http://mls.net/','2018-01-17','1516158803','de73iF6VqAt44fYWk6ewOvQctVkawNJXhIWdGsf3w+96qKG5USoZvykQHyE4r+tTO0HD4cqC6u5K8W94WEI6c+f7wMTd4Nt+PQ','0');
INSERT INTO `cn_log` VALUES('161','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/index','http://mls.net/','2018-01-17','1516158870','bf1eeXYbTu+JSCS/nIxSIxeb8YK6oTnuiADIUT2V+CrPiKQjzff7YmjiHlL05cUcDcHb8B46l+/a7UTQvwVnTbtmyqMQt69ITA','0');
INSERT INTO `cn_log` VALUES('162','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/index','http://mls.net/','2018-01-17','1516158875','688aj4VnmU+s6SNZikUDZx5eAWzIOseggutchO+WoOJIqktjzQewiccZatXXki+j9irujk0Fd8XB4pkjjdJem8SsBSzDPXllLw','0');
INSERT INTO `cn_log` VALUES('163','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/kaquan?ty=1','http://mls.net/','2018-01-17','1516171193','e090Vr1S7PJ+3QdcRZvI4bd6ZVOjM6pxqHJMxB4qoR8SZ/uwWGEwGq+wIz/9XpklEFqRVBTiHbuvA8vBUMi1U/gNMJXdMIeQbQ','0');
INSERT INTO `cn_log` VALUES('164','51','0','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','','http://mls.net/','2018-01-17','1516171244','0fb3tGghDftuKDRXOnA6Wjo6G2Pt34/rkhmMpPvVQGyhhnwYFHPouT+h0GxnrJ8gV8DL8ko5wtdKuqAVTWkKIWGdYekEht3b8A','0');
INSERT INTO `cn_log` VALUES('165','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/order','http://mls.net/mlyy/','2018-01-17','1516175162','c7bc29iQGML6JJ/ahgee+ErVjXlM6V0RS/w5k3RIttnQVndktOA0SckniV2fIMiKjkT3n2YYxPE7OjqhmX2IcEKEwG/gSjqDug','0');
INSERT INTO `cn_log` VALUES('166','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/order','http://mls.net/mlyy/','2018-01-17','1516176957','162feovZNNh+HINXmdnt/FNeTbAdv+bmmug28JLjS3vo9BTvGspUflO682pafH4+R8hlrZQX1nRn0sq4dtz0yVG4z3ehfsqdxA','0');
INSERT INTO `cn_log` VALUES('167','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/order','http://mls.net/mlyy/','2018-01-17','1516177088','354da3I8JjF03vqsCKXFtnwNY0knV/FpcS7xdHc9Nz8iqsGjEFW8hy7WH92hTrQs8MHC2I98oTNWommBIhYwUNn2gr30y3cVrw','0');
INSERT INTO `cn_log` VALUES('168','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/order','http://mls.net/mlyy/','2018-01-17','1516178526','0df83zYLGD26o3vcpNz9GZpxD1Zm/5oDixrYrqGcuyDYWLCWtyjPtMcQJNJTYgvx+tbUwvfCgfTwUXugcrC9XseAQQz7CmWfcw','0');
INSERT INTO `cn_log` VALUES('169','51','24','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2018-01-17','1516178530','b2815260jqJDT8a3f8DF+tYlPy5zr2k2vMLjeKpwlFYVr6AP9uD8LYeBcyYggG6n46eJC+5MclAtiqu3UXFkRC1sdoQk4iFDvug','0');
INSERT INTO `cn_log` VALUES('170','51','25','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/','http://mls.net/mlyy/list-25/','2018-01-17','1516178540','5928U5txYHHN8qo9B36ghgf2T4x80k9a52os57rRHpMnZF8WB5NyfndjL/cXWq5QwcSHJ4fKUb9b22F5hkhJhWNPjNjVpEWEUwc','0');
INSERT INTO `cn_log` VALUES('171','51','24','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2018-01-17','1516178543','ac3cw7ZoGMRg9tmQ6XDN+H/JHxBVZvjEBafnVX++OXog1WhHtM+evsrrFL7ivK9vmozLPooKIKLrhgZyoWfAWZDLS3bFVvArBbw','0');
INSERT INTO `cn_log` VALUES('172','51','24','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/','http://mls.net/jsyy/?k=老师','2018-01-17','1516180026','d66cixfIZzn7wYyWgfD2PRQoXDapEvcDGZinRfptvLJ5K1aDyiKJTD3U9jMUFmYdCi/lQqNMZCIBBB0u6xQJjH+O5RY7iv+Ide4','0');
INSERT INTO `cn_log` VALUES('173','51','24','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=老师','http://mls.net/jsyy/?k=王老师','2018-01-17','1516180031','e957vk3NqCbAwhpAizE3r6DgeNpV8w1Eqx7WOMi8Eww/a2pqWk0SBPyziNWElHkTLZiSNJAQtsxyL+nZPV2Z7HMUgjIZ+rr8QCI','0');
INSERT INTO `cn_log` VALUES('174','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516183055','cbf4naYmfOdDZKya9nNb9v+3IS3d5xPVZ0AyB5Dqeqg+zfoEDPxAn8e8nWcYNp2WMGXxoB1meJxx1u6QI0/tz0epboXs3B0zPVQ','0');
INSERT INTO `cn_log` VALUES('175','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184826','d8f95aSdZQ/eaeRwtVMDuQga17Rhyqo/yZY01pFEntX3o6PRaIwlNszzMRgpv543t4q/PQg6kbgO+vKjPKNVmq2r1zqtUtfari0','0');
INSERT INTO `cn_log` VALUES('176','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184857','6c52t8nucQjorxtZMWm7f90HjY8y9GfGV4nObzI1k4QTalWCeuUxkaZOiiibI/hkg+qO16q1GX6lJQ/sq7mNUxAcdRcakE6z9os','0');
INSERT INTO `cn_log` VALUES('177','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184904','89c543TVvXpwNccTfcEiyx/eho+1BsuzRFXiBrgo3hlxCrmXXkS+ReEd94PJ6f0kDdBubELUtTc8JVVSjL/Qesa5KN3Vu+xY/o0','0');
INSERT INTO `cn_log` VALUES('178','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184927','0a9cft1JTnQWModFvC6FQkdv7P/Y7jeKNvlEqHv6ejGCRMMTHwZi07rKcKkCFO6IRqDT/w3nl7jr8zVURNTAX8Sar/yPpIHefcM','0');
INSERT INTO `cn_log` VALUES('179','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184976','c5be5QT2M3ZA+fiNMhV0Z91sfy4mI91qnP1eHRW6h7TOsgtvbbYeL1AgCKbZ+GAAaaorDgTZIeanPSi/KZU+tswWBCTUCTZmsq0','0');
INSERT INTO `cn_log` VALUES('180','51','0','12','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/jsyy/?k=王老师','http://mls.net/team/12.html','2018-01-17','1516184998','5e389k+yQwUw+O4ghBf+s36FZF1NwqYxdIDY0+4+hDn7Do1s4R+B04mZiWfjqt23WlFMGXeXxfHvO6VxsgG0w+5ZjN7uYNZUnUU','0');
INSERT INTO `cn_log` VALUES('181','51','9','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/','2018-01-17','1516185123','a504jkMriJ8vQXcBgcqKCFHOAh21Ze6NdaQumGuTecZ76VJjCWL7U6NjFMnHWaZbYwsUftZvhIIkbYU/Sl8T5GOgERo2vBpQZA','0');
INSERT INTO `cn_log` VALUES('182','51','8','0','2b80fefda843989d48f81f0390af9ff72e00a1e5','127.0.0.1','http://mls.net/user/yyfw?id=4','http://mls.net/contact/','2018-01-17','1516185997','90d7o7OXRQDG8pzXnAir1Q9ypNwndZ/6UwZjq4QxsJajfttGdm/sigVojDWsqdPoFo4snEZ2s0DKeSV7lmK6G/KITmAJ0x+HPg','0');
INSERT INTO `cn_log` VALUES('183','54','0','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-18','1516237388','20ffaZ8K9904gO1ENKlpbqHtBwmuohQvOt3Ge3jvhYylcQYpTj3r67JxzPdmQrh8VgtGUZUAxeAXle3Rp/xc+jJbCNZaUGaMAg','0');
INSERT INTO `cn_log` VALUES('184','54','0','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-18','1516237392','288b/6yb6p69N6K+w3sGxUg/4z+gI5hEoJMyNtsHRyQ8k5J+xEZm/8FLFQwYBFPkUuoce+xeRjzKGCf8eroR0kfx2wkJEr63lw','0');
INSERT INTO `cn_log` VALUES('185','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/?wrnd=qm','http://mls.net/mlyy/','2018-01-18','1516237419','9977FpXCvS42fX9vXIYAnJeMr+HYs0/7bOWK9I8kVSUjjABnc+X9phf4k5NH4M2dvofxvttUjQhQmQj5kXlAUbRPkY0JnuGG2A','0');
INSERT INTO `cn_log` VALUES('186','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/?wrnd=qm','http://mls.net/mlyy/','2018-01-18','1516238678','a9d44x+abdPBUDS32eoEFeGp0cawuvibdmSbVJg/7KLID0ub+7JOZf0QWywoEz5bfiModd21TT+NSYnHCuxKgbJXZqfgVT8PPg','0');
INSERT INTO `cn_log` VALUES('187','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2018-01-18','1516238683','bb656WaCyDyYNMlSZWu9SpG+JanKCeC1p2PoSCZTyYLyXRH0IYF4q+d5Y9HCVwbkWDyMrNHBZ70diZFNB4vmqlw64sPTt7sy8v0','0');
INSERT INTO `cn_log` VALUES('188','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516238685','17dfAwrPZKmXDAK6muLRC9GYp9RekDP5rvY7K3JnlfJ3MZdGQshO5L6YnlpvzdvjvCmzDhjUQzjtPNJv4xN4iAQ1Q0X95YSfDFA','0');
INSERT INTO `cn_log` VALUES('189','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516238900','b449UPVz4MTBW0uHs3t+0UrSEgJF2LTOesN8HZ+xq7Pum024yP3P7Ofq7pD3hTfAUo3nyPuksGH85f/LjhiKTS59DC+VXAfFz34','0');
INSERT INTO `cn_log` VALUES('190','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516239192','8d50Zrb5yUUUvpNjBa3kVsar6Wo7c0IgMTD8e8+4QaDdHyVIR+5c0BqP89s0X/3rvNEsK5Jhu/rXMXHxEJ4cR1vNQIb88PbOjuY','0');
INSERT INTO `cn_log` VALUES('191','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516259876','2417uCNy13gfAqWcmfwwNiSFN1lTZw4/+pxKTEl5lb56UWp9pgReTJqzWCa3aijWGu0myI2n/M/I9y2SI46c5caitjkEYZ4IbDM','0');
INSERT INTO `cn_log` VALUES('192','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516260407','92f2wepQ2NcQNF5NrzdhL1YpBv9xX2CA12sImu4nVyNnisdX+yb471zWG/7W5A2tr8C8hXVaX51GXx8y/NvJywygPfmPPuL64bY','0');
INSERT INTO `cn_log` VALUES('193','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516260489','b33fe7XOB+kyrdQ0aZWaC5XjQYMVGNO6issVcVd4kfSD4IviNJMbxDvMrW3qBvOIyQgLs1+TvGhV0bq2uKSB6+KI44NAHTcHs8k','0');
INSERT INTO `cn_log` VALUES('194','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516262250','74d6har6+be56nDWx3cWHd4viWgWvS/J/xZ27ATpa7htHupJ6zodgoo8TduD95eYg+OTf5xrFxaIksheTgMnwGrdOIASTdlY2k0','0');
INSERT INTO `cn_log` VALUES('195','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262254','bfed3kzOFFkJiWi8f8RtcdjfsMaVr8C5CZLETj/V5takHn2h+T91AT4GensPuDr/9SnHuhKcr/zhV7uzdwWVaq8xd5a5WwJaTGk','0');
INSERT INTO `cn_log` VALUES('196','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw?id=4','http://mls.net/mlyy/list-25/','2018-01-18','1516262491','97c46Isu/Cni7xWRLYcRkTtWkrjRXNiBHiF1Dr1VHmNZoKNRGl0FiT7hxXaKhb2T/Ior+DjpvdcSPZwAYiVlZYwFkRK6YxHOrBA','0');
INSERT INTO `cn_log` VALUES('197','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262523','0a26NYVYByzN6ytZYENiCfW1fbzZ59bWgsN+k9e3eN4dsi42Z9KjaZ4LbiNgSBbt6LFN/3S6o98+h0zF86T+9kQv+CPXNvtiS/Y','0');
INSERT INTO `cn_log` VALUES('198','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262792','542dW4fPNnx8d0CFZ1YKgs5Nxky6FcV/tdCV+0vuYQFfI0wbWZvntbZ+4iNJtn7rg2jMKYaFRUEvoLr6tm6PDWx0OpBDsP7WtWY','0');
INSERT INTO `cn_log` VALUES('199','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262861','8478XwOwJs0QJJI6dg/lg64ZWtQrHIqJUJtJknuRLAxONDVZsTqze/l/BqMsCllahfOaskJWo5qxTQ+yDhSehf13Oat2N7LtSfk','0');
INSERT INTO `cn_log` VALUES('200','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262906','1671XuZs1WUPvWDWzM7IIXBlgwI5Pu1Li4bNB9/oOokkrGHxRt57NswioD0TjgAGZCdc+plVzcydJK6K1+RX5pfaradn7J0IHsU','0');
INSERT INTO `cn_log` VALUES('201','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516262931','24d5E5TQxxWfzXkzuyYFDJ/tB4AAxBpbXqS01DIEZrjNPCzk8oinPD9y0ui0kWa+V93SiDdmKhBZEdLZQRG50dPVjFjil3g9R/w','0');
INSERT INTO `cn_log` VALUES('202','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2018-01-18','1516263044','d2adBzwXbNe7xXDBCJZdRd2snaYm63pGkMY6FUqfD2f5IadSFn7XNvcVMsfUM4MlP+UKJfI+cSl0uLw5SMtqJYa/F8cowcqBWR0','0');
INSERT INTO `cn_log` VALUES('203','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/yyservice/','2018-01-18','1516263049','53e35DBGHpPMFdDzn9WjyO7TGkSNdgys+xb8UHgvQi51yhkt8gT9y+cKAJa7B8PzAay/VlQphqr4sqATrg1rWohup1Jwvpz/F+c','0');
INSERT INTO `cn_log` VALUES('204','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/yyservice/','2018-01-18','1516263336','9a62DvA8B8BOXLIW1CIQVZRuCxq2b+lHDhwziefIOVSfNJFPnKUmRoRqQaqZWd7LhhheDjoGqIG7djIQNy2J8kzmjgQ7WOoo3Bc','0');
INSERT INTO `cn_log` VALUES('205','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/yyservice/','2018-01-18','1516263378','00fcHDUMinqwO2UHn9p+7/x2riDBmwwq8xY1dnXVu4OzrZ/6uzqrBIIy5q2VOVzxhN6Htq7IqVwgfrYnSFtXsd/i7FCEnu4Q79g','0');
INSERT INTO `cn_log` VALUES('206','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2018-01-18','1516263381','0e87rhDd7Djmf+wIT1EHv2JB6vGwTKBV7XPECrLlI28bSt+BOCeB9p9tq0m/jYYK0LBeLYtVZEcDXDL+/QQA2SVrqTLnAHLuKiM','0');
INSERT INTO `cn_log` VALUES('207','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/mlyy/list-25/','2018-01-18','1516263391','ffc2uGNgJRGQaTqF8XEdIzUEbiV2AooPlCu3ZrfPqlyZaw9FazbbO3/erg1iOwr/b0cjzgh+p0J7GL/52hwMrnGfjCN9F9oU84Q','0');
INSERT INTO `cn_log` VALUES('208','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516263563','2493BmOGNTI9cwOjFqlUa5aCFSPt/YUrrbwA21Zn7mJNKK5jrkVseHycm7oVP/lDx9Ut358kBcxlq/CUEnf3YXizjRUcwrkdvLw','0');
INSERT INTO `cn_log` VALUES('209','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/yyservice/','http://mls.net/jsyy/','2018-01-18','1516263605','12e8T3yIjBfPpEFubWWY+1VeRUNI2OpH4KqzfRUJr6xFgHoX7u37Tosxw5QT46MaJFb57zu05jrXH9MvlXJ/7GpDVHdcvX1G6ck','0');
INSERT INTO `cn_log` VALUES('210','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/mlyy/list-25/','2018-01-18','1516263613','7537Vu5tCBoWcbZezoPDrxaFJUx18WmtMsm3b7H78qgrAvqq8QtD5L4NIUk/vV7jNahpB6NjDFxb8bsY7qTGNIcdBZlXm09FtcE','0');
INSERT INTO `cn_log` VALUES('211','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516263622','9beablmlJxgKDMtEY5e5n3N8CKajcMi+45pMVqCO8rYyMJ48SWIvqjorrhvGgzDeHaVdWM7pcNB1dFTux2ldx50LUPaG8HVEPzY','0');
INSERT INTO `cn_log` VALUES('212','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/yyservice/','http://mls.net/mlyy/list-25/','2018-01-18','1516263628','1565RZexB/k+fO7b6OeJZ2M9Sst4/TYDPpmPwIamIjD86ntv7VmwtuThAkNNhrob15VJxQ78AjvFO5dUrGeJsDCCFdLWRF492iE','0');
INSERT INTO `cn_log` VALUES('213','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/yyservice/','http://mls.net/mlyy/list-25/','2018-01-18','1516263703','b46eLLHYRdfVHX/jDJ9WNwCN7YfefU2+gK5FdvBCLxpsK2f1sn6STGAwUOAFXgOe/Tlod+V8NmdmOs1yxX9qH3Wfw/eqM024Qp4','0');
INSERT INTO `cn_log` VALUES('214','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516263705','4f7bGtveCYuWbfaLcMlDZidUHkAoPav7mnJ16rDe18mC4RuMuWkKTyYqR1ajf9bdrLhpvMTCn+LKccoE9YGeDbwMaBRgrrg8ems','0');
INSERT INTO `cn_log` VALUES('215','54','23','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/yyservice/','2018-01-18','1516263900','9a0d+g1xgzNkBHRxrOH1RwR9P7Eub+Tt8ZRtDS3GYV7wvDnkL9eB+evdW5dtT1uDFxbhdM/GUB3udAwFIPfsLKdgb43Uc/NCGzg','0');
INSERT INTO `cn_log` VALUES('216','54','0','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw2?id=4','http://mls.net/?ef','2018-01-18','1516263905','49dcc9Rfe/LdE5WfVXg2iGD0gSWRo5pv5Zf5JH0FkqzHFApI/wCtan5B0imj079mTAYs3d2tRxx+YQ/r26bubmQwmR1YKAZaAA','0');
INSERT INTO `cn_log` VALUES('217','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/?ef','http://mls.net/mlyy/','2018-01-18','1516264100','99f6zCCvDi+Z9qn6EEMMmlXgv8DaooNZKEHSjXixO1veDUxJw18k73LedcDX/Lk4bkzKtvunYL5UYB9d8TmgGJHqU7FHnuxFNQ','0');
INSERT INTO `cn_log` VALUES('218','54','0','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','','http://mls.net/?wrnd=qm','2018-01-18','1516264356','0e8eJz7Oze7Tqo8QOrKGQOIDUC8j+kDVvPOHAQdkrd3YatVddMdSoq0Zq+hWwEcF7BF2FO3hFWX7kF6pN+8XxJGUwCan1tW2Og','0');
INSERT INTO `cn_log` VALUES('219','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/?wrnd=qm','http://mls.net/mlyy/','2018-01-18','1516264359','f3d61Wn8Ib0EGxNm/Gxk/FcieK47lfCk5LqTx3aDdCL69Lk7nztXsCXWbyF9JbMxxBDdYfT3lDNY81oJKwRzsuVRoUegN/Th8A','0');
INSERT INTO `cn_log` VALUES('220','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw2?id=4','http://mls.net/mlyy/','2018-01-18','1516265377','fb1aKyFPXEeamP0C+uLVr7uGPhcGt76y/pbCpTfca8B49ntpQayQpZRQp2qwlWOi4UE4gDOmgBIFjTzbh62ZsponLeiSHfFj3Q','0');
INSERT INTO `cn_log` VALUES('221','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw2?id=4','http://mls.net/mlyy/','2018-01-18','1516265465','15724/RspVdFFb4drjDZhAsP8NJ5sJvmtuzQlNFWgbAPkcnx6XU7opwBPw9eSAPVXJBQH1R2tUTu19olgkTYqtAEhCfls1ZSFA','0');
INSERT INTO `cn_log` VALUES('222','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw2?id=4','http://mls.net/mlyy/','2018-01-18','1516265584','9f428ZgX0lyl3aGFRex9jEovB/z2fcCk7XYNpOy9LnZdu5FbDli2BuhFhVwmAllLWtWMNeV2BegAfkjqTDIWrY7DbWB6rA2Afw','0');
INSERT INTO `cn_log` VALUES('223','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw?id=4','http://mls.net/mlyy/list-25/','2018-01-18','1516265702','6cd7yFehQnu3fvqVT7au5ar2zZKrC368TLk8qF0d7uitS+sJe6fKv/NG/CK5DmMji1rwZw59CaGZghd62wR9UAxDrOpb3Wao/oI','0');
INSERT INTO `cn_log` VALUES('224','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yyfw?id=4','http://mls.net/mlyy/list-25/','2018-01-18','1516265753','2c28zvqgksSkqFDQ2mpVVHIPaE5hf+mA286RfCnEzgAvllXL0pPs2uXjBp2hC5uHzXmPA+CeAPRYsZtg2daHlsfY5Hn3eMWuTOQ','0');
INSERT INTO `cn_log` VALUES('225','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/yuyue','http://mls.net/mlyy/','2018-01-18','1516265847','e7906SD3v4tAQKCw4Kfn45xX2sNPWmwexN1m7ssCNKUFnBYpCYpaP/NzBYl6zBSAfMlZwz7VOp4AYaVjAOxv/LE2r3MDzGtStA','0');
INSERT INTO `cn_log` VALUES('226','54','9','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/user/order','http://mls.net/mlyy/','2018-01-18','1516268092','ecd8E2gZkIanDPtyUP/efy6rqZ8wv/wUH7n2RZKVce/kudPaeibs/PtrbJR0n3jqP4Ss/dNPrxA32P7VRPgU3twTfQr3A0xRjA','0');
INSERT INTO `cn_log` VALUES('227','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/','http://mls.net/jsyy/','2018-01-18','1516268113','68700SFu5OB/KiHsdA9Ikg2e/GEyxiP1TToxeAdG1Q6ArU0JUq3lfh6DbKO/80K94MJm62bQqBSn4CTApXwtUqE8Bz0VQcKRjxE','0');
INSERT INTO `cn_log` VALUES('228','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516268118','0ede7M6+nQ5bekH7sLM01Uey/JZesKOU37KwK4zEEDw0nDRrdZekLtn/3znEhzgiTXh4pvtCoZpdgdaZquaX93qKJ4LFmh1xGx4','0');
INSERT INTO `cn_log` VALUES('229','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516268261','51c8vZ0WDNq3x8Dhi8Fp0LRbbXsJukxGaFw6RrL4OYLWL1Zr4dgBVcpvEGBGAYPYy09pYSdcxCB6ZY7CVMZTslHnV0kb9db/G3c','0');
INSERT INTO `cn_log` VALUES('230','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516268315','64bd4ID+8yqmhOOMsurEm6kS9z5byNwAVkL8Ec9o0iQBj3zFSOKziwwbF/Eb8NI4+bvHxNmvnCzQcEk2KGpTwOV+W/y6Q9ZA1MQ','0');
INSERT INTO `cn_log` VALUES('231','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2018-01-18','1516268321','f8dbgiSzpfdrqEJHYh/xiJHOinmpBzV9w9vRLkL37N9VPqoGDw15EU3D6eyaVgTHKz6SHd0j7MALFtDy4hVgrr/KGILo6U3/+xc','0');
INSERT INTO `cn_log` VALUES('232','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516268325','94275V/W/D6zKyiQ+5Yw12QfJu28lUpsq776mB+x1pigBFIS1HEkr/qcK8vMKNJxkvihj2vKANyTmQ+DwwpDkfkTCA3erMKUQ+k','0');
INSERT INTO `cn_log` VALUES('233','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516268469','522cVCkOBHyW2K4FiDm+6Wpwj4WkAV3BBXErpIyVDBMjRqyNEbW295HlHDysB+x1G8x6Hg6lCSL1pxRpBEKIH5rm/VPtSyZrNRY','0');
INSERT INTO `cn_log` VALUES('234','54','25','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/mlyy/list-25/','2018-01-18','1516269051','dd4fCTJwt5AVItDuukY1gSZvLlXkmbGxUHD/5tO/BAUQbieCoS+enjmv0YKIbFI8znBpJgtvTtEzpPhLob2tZxniPUxkAMMJj3E','0');
INSERT INTO `cn_log` VALUES('235','54','24','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/mlyy/list-25/','http://mls.net/jsyy/','2018-01-18','1516269062','14b47w4+Ls8HdJM6NhLVnHNwJafOJdIX0VIEOexG8PEhr6m0GvLHnl3aSyBPpMCpArG4JToMyVACEqgOS0etqvwUeW3mP2+q0Tg','0');
INSERT INTO `cn_log` VALUES('236','54','0','12','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/jsyy/','http://mls.net/team/12.html','2018-01-18','1516269069','06a3BAeUu1UqyVnaZmdHA9T4WVTkdx8/VXDg5DBHnvMXt/dJ+HjA/VXItX4yleNPajnliT1yYp3h/NNPv6I/QX4em7iNcOyd5H4','0');
INSERT INTO `cn_log` VALUES('237','54','8','0','7af2d56291837981c6bc24edd666b662341cffe2','127.0.0.1','http://mls.net/team/12.html','http://mls.net/contact/','2018-01-18','1516269072','46bawiEPD7uaHoTgvGxno14o/LVA+stToXLT2I89DSaEHtja1Yudpwc4UfexS4dB9zHe21uy5yM8NzmU+drOZPzcHdge58rniQ','0');
INSERT INTO `cn_log` VALUES('238','557','0','13','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516846323','8690v3o/nYDQaxMI7uHYKuxDVmDbzwA8DGOXo2o4MFwldKvj1LgxtDtnYe1c21Uyz2T6mcAixvdNRzA0TU/SY2TaDg7IER8376I','0');
INSERT INTO `cn_log` VALUES('239','557','0','13','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516846329','eaddNUgFKl35aqebumcbMYo74cfCAMN2RY0v2ZVMV0Sw6nyl0O8ANHrg8u+F/UcmcEb98xc2s5ROSyqjjXiUVhWFmsEdmnaqQFI','0');
INSERT INTO `cn_log` VALUES('240','555','0','0','85e409f6ad7757532fb28b3dcc74a8e99a18eb09','110.184.220.84','','http://mls.keqxz.com/?wrnd=qm','2018-01-25','1516846334','043clEfFVyof03ezQE47bF4adTYRIQrusqRUvIzoqs0DvEy24vAV0erQznl6WWhodcGhmNucKouRC+jnYP66RVJWGWEdEYuytA','0');
INSERT INTO `cn_log` VALUES('241','555','0','13','85e409f6ad7757532fb28b3dcc74a8e99a18eb09','110.184.220.84','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516846339','62c9ulDQ0phxrW075XXbzQi2b4i+twQxmm+y0IwIDThjVNOMSlmt2ZR3mDzPhD92b03IH3iAUNSuBheEd7lEm6xBXR0dHX6ndCE','0');
INSERT INTO `cn_log` VALUES('242','555','0','13','85e409f6ad7757532fb28b3dcc74a8e99a18eb09','110.184.220.84','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516846379','11a8VgBtifUepRnLHprTeSms57r0wB+Sz88fqaeyPBGOnsba9fQQVdb8U4OqJrIWlplTQ6NaZ5MIevN5S+jeiNzZMAgzrLtbE3A','0');
INSERT INTO `cn_log` VALUES('243','557','0','0','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','','http://mls.keqxz.com/','2018-01-25','1516846986','edc1j4R+VROs7XBZV/NkRR98aowchsEwn/xnRvywObziJ10Ycv8edDhM8UPHNbxznJxTdb+IHw0EwDLfbtzIV8Jrf9J9AkGDpA','0');
INSERT INTO `cn_log` VALUES('244','557','13','0','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-25','1516846988','cdb7y/8Rf+oRm1mx7Sd4GtiBqSqYWC/TwY5xKXeYwhX2rAKCp7sXoRpOM6lXc9eMzrLngBL+u9XdNfMdXW5uw6zxwh1ncliosG4','0');
INSERT INTO `cn_log` VALUES('245','557','16','0','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-25','1516846989','2445hSPeWHRCUIeea2EkvAQsWzfXPlxI4Pb1kzrxgFFFchp3YQnrdUhFUPMe6UsyZKyNnG9YeSk3TEazJ0GPQfNMb6c+La6u9xo','0');
INSERT INTO `cn_log` VALUES('246','557','0','13','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516846990','ef2daMnMmDl8MsBLVLvCM0qKIs7OVNnyQOLC1BSSNRUhWUX4aXotbYDUZDtE3AjA3TjHVQspHEaRxKdoes8DJ1MWNjj+Xys8X6E','0');
INSERT INTO `cn_log` VALUES('247','540','0','10','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-25','1516848129','fa43adjyZ7sPBV16EYszQEZzN0NuWVv3g3Vsw16ikSFQgCiWDwPPBQ1MX3LU4pF9+xH9/ZgKAJvsCZyFRHPpJdBj0fMMLsbU3ik','0');
INSERT INTO `cn_log` VALUES('248','540','13','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','','http://mls.keqxz.com/fwfl/','2018-01-25','1516848190','1f59uWt4vL4kw2+XZ1JBF+5xBCzHfS3t25RgiSGqRzuNNB2pcUfAf4Ff4uaGzjmaGZpL/dSOLYb4dMAiReebXKE/I+uvhGvd680','0');
INSERT INTO `cn_log` VALUES('249','540','13','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','','http://mls.keqxz.com/fwfl/','2018-01-25','1516848321','1c47MWS9fOG1weY9438eiAptpEwHgcwo26XkmgGecWMkbxwODi5AuIRlfbjOdvoSN20J95L/7+v74+uf7n8/NYXg46KWcnPcDqY','0');
INSERT INTO `cn_log` VALUES('250','540','16','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-25','1516848323','6d52zrKK17ftJaUBDnzQYoaBIDMvk+B0vQH8JiTdiP+6rI+/HlGzfNUJB7FtA+bWSVFVMU3qPRCQPAg6UeY+xspoFL79N6rfhys','0');
INSERT INTO `cn_log` VALUES('251','540','0','13','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516848325','4f0eJG0x9SVyN67RLL2ys9OZJlxth2NpQC0TxNYFsxjbqFnzvhmKehUewPw9Q3j2dpTcraX6pYQQrGkX8EwxUw+F4siMDDkV1jI','0');
INSERT INTO `cn_log` VALUES('252','572','0','13','3fb93e35bc298ebef81efb8262d3342ccc7ae327','123.151.148.55','','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516848356','1014Ohx3EjCE7WBLOKDqoNcSCFM6WI5h0fvQDVkFEwUQx6CSDyxrYHb8DagKYqF18pCg6EcHrOwDt3cOMDtrgQWTSP2XxOPlY7c','0');
INSERT INTO `cn_log` VALUES('253','540','13','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','','http://mls.keqxz.com/fwfl/','2018-01-25','1516848369','f942V42D9Y+llK9gH63p3ldIPh3ZGTQAGYG9OsUpgf8rqUrKO7EfkInCchc/ovFVtNzNFSvTFQbNPN7lRHOC7iY6dGsQC439vx0','0');
INSERT INTO `cn_log` VALUES('254','540','16','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-25','1516848372','5fbdVXf5VDmSGMvqv6ge/wWOk8a9WIK7gbQd6wuR7mLT/T2F4g6oGa7ka5BeFji6IC/GUHte+FZLCjw7Qv6vzJk1S2GrT2xSFmo','0');
INSERT INTO `cn_log` VALUES('255','540','16','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-25','1516848377','ae2d4l7haJbqsaOIDRwRBKgQuAUfDZbZFIyiPy7t05c7vs+RYgfmntYh4sClQJpXH6RqZnKK1KCBTMJ10JC5/R+AIw2l2UIP5M0','0');
INSERT INTO `cn_log` VALUES('256','540','0','10','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-25','1516848379','08fdbIDvSG9+dcF8MHhljVjkYmTQ7dh16dB/Ng3zU14t1qQV0O5hOlGB/CSDGqJNIpP3AVMyhJ77hRFKo3w0QbcWC9M+e98vqus','0');
INSERT INTO `cn_log` VALUES('257','540','0','10','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-25','1516848383','2be9IQaZytIJmVua7ZkCJ4MtxfmsjHra6uZqJRXZ7x0Dy9Bl/A/80GY8U5/VeRc/If/fhUZXZzY/zyTJiwti4NJE/z+JwiBTABA','0');
INSERT INTO `cn_log` VALUES('258','540','13','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','','http://mls.keqxz.com/fwfl/','2018-01-25','1516848793','a7257s0qUt6gTHRjzVOFQ40l/G7x/h83hxnEXulmavTL+oUltaDyfGkq5kjc+FH1GUzhT+HT5FJyic3dgJ1pCTMyFPaksjoE69c','0');
INSERT INTO `cn_log` VALUES('259','540','16','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-25','1516848795','50db73F9HH+K8qSFAyMztPLqNRfDOuMpZXBWkvuzO1Zc2s4jGa3zBlW3qjH2GVEgW43n0Iyn0bctDR+IwPD9O8bJHVKxThY5g1Y','0');
INSERT INTO `cn_log` VALUES('260','540','0','13','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516848798','d53bXoqiTz/KcFTeJRuk5Vv2EJIC24khmFpgx7vT0EN7ChU+NWwhc/Yg5NfEXlQovtf1STogPNbEyTqhPMun8mziARJeBkKPw88','0');
INSERT INTO `cn_log` VALUES('261','540','9','0','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-25','1516848864','12848u44rOST6pbxxPP287CZqOr0Jj/k7IgMWq7tWJ54shEKhjVIAkBooJZLFTVuki6tSisw1hb1yJNbETyGboPgCwykMJVROg','0');
INSERT INTO `cn_log` VALUES('262','584','0','13','7c74e564b8fc17d4b6ad068138ae3ae9fbb80153','123.151.148.55','','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516849119','5c20cnIdsblMjm9pCRcGTS3SxYWOPCiHUr4Et+thvQkOly/fmbMR0DpKwJdX0Tla45hvDaixGIvmttOny6FIqGtBkuXN0+Kd8xU','0');
INSERT INTO `cn_log` VALUES('263','585','0','13','5a710806192ecd408e710b8f2825b94b4569c9d5','123.151.148.56','','http://mls.keqxz.com/stjbhl/13.html','2018-01-25','1516849124','0b07QRhiJO3yZ6JCs1veYmRlRhzvdJUvY+87CJWjoFIX5zSASesXESAxnwyQjctnco4bk9KCegN0tFBRvut2s6rFNFkfj/olC9k','0');
INSERT INTO `cn_log` VALUES('264','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516935524','4340OJKdJcIQ7IZoxRXzzkNZvB1n2n34U3o/OQ59iNxqKRhzUV0nyVgc89mWQGnObuEmpMx5U1biKYLZMqNonwzO1AQE37oja8g','0');
INSERT INTO `cn_log` VALUES('265','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516935532','aba35MYIJax3v49J+tsaPv1NGcZL6y0+kUK4o1AaihoK+z4g+Zij/QzWfGIA9zWf8IfxwNwQ1FhDdRxm+ZL9uD68vq1k4WifCw','0');
INSERT INTO `cn_log` VALUES('266','596','8','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=12','http://mls.keqxz.com/contact/','2018-01-26','1516935550','0712Q8qqlKq/lLoYvOtvsBvfjJAqPRAuQo5V3PDgvoO0an+lNbpTwU8GTiqeEyimzeiuIIJwRWC8zmsd+VGCXZnSKHCB6L2h7Q','0');
INSERT INTO `cn_log` VALUES('267','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=12','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516935626','366aU1EF0mAy2q7dSnVdNt/iUsyMp5YC1xVSGNFk84rvc2dl6IopbTo+3xJjCHlX26B0iDIGwKg4zmSPtgbGFkTX6Jz2XAqpFQQ','0');
INSERT INTO `cn_log` VALUES('268','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516935632','27f8trV6U1gdU74uOLVdxw0qr01tu9mU3RdhMYBw+ulTnG50enMWoYRFkdvzli1c6Pmjd9C1mkRke7MQ/wWTZTfA5ga0YrQC0/o','0');
INSERT INTO `cn_log` VALUES('269','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/jsyy/','2018-01-26','1516935635','9c6fIkdEwZwvTTEEiwA1YF3CmdfM0rw4Wo0k8nfa2UOtP7B3FjH0CDgtB1guyvz1KhHdHrWdt7PIu7vVOmoPrHz3SvgizK0jdC0','0');
INSERT INTO `cn_log` VALUES('270','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516935688','c0ddcLX7Ug2zrCoEqXXxO6krQmQiuLthjwz/qfcyhsq44cGXa3qi3gz9ex9aWjaLxlby0cPdV8/VfhjWV59BS3AfZoSvE1WcBwg','0');
INSERT INTO `cn_log` VALUES('271','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516935749','b3245FUY+7Mm0njW4YYmSPV9YEYNPurbK5YDu1TAIUiBF0lSpu4lfPZaDslP1/MBrYWJJPor1miyig79CqEVKdJAZyrUztegdQ','0');
INSERT INTO `cn_log` VALUES('272','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-26','1516935751','f882YnKUA68+zXratOa81hWEf85zjmQqCmsX3G4WEEHZLOz8k1btTyzr1AzUYxVes3h+z+Y0TIRpFcktsWikzvlwVj8KEtdBEqE','0');
INSERT INTO `cn_log` VALUES('273','596','0','14','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-26','1516935756','8926WSo1Vl/nKAOR9xmGFSwgNPfz7aIcR8fOB/05qMKqY17f6bNIHt/ndGYAsYGeO9YWQMjSKB2MIJD5ExmoBVNaP4owp5+2F3c','0');
INSERT INTO `cn_log` VALUES('274','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516935809','e759ai9L4y40189YoSeSMXOUS4AAy8JU4aXc2IpAFQfpIsBzdrADymRmBYfTJtyGw1GqJnpSvt0jiW4cm4Di6D1/jSDCH+MMum0','0');
INSERT INTO `cn_log` VALUES('275','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516935853','f165sLNQUYtLxzg1aJCWjxOuWgPgwQgxhBOO4JvpZ5bS+xtiUIeKE981PQZpuvLhuP1zLrMPgCJw9kLKNKRXxxxH2W+xiOWERO8','0');
INSERT INTO `cn_log` VALUES('276','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516936269','8f9fll/QfJe2h0hJ8cuEmHqUEwLLNsflYM8HJV37/tjYlk8g/+ajuMt5E091C2MSRYlHDusZeu1K9vmAJ3ouGiot4/xIDqFjFt4','0');
INSERT INTO `cn_log` VALUES('277','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516936272','0876Y0MZ/Z+uxKUhKGbD1B2hGnv0W+XHNnz2k9USr1HOmURBd6iZ9CoyrSTDxMWWeqjsLenWrhl1sEZvfmHEk/rJjOB5WSnEwg','0');
INSERT INTO `cn_log` VALUES('278','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-26','1516936282','ea53qZrbHwoFrG74+lrNWGIGyANYNOZhquEcwE9FIl8kfg3SmLqCW37zsJxWY6URI06shFlwYTuoP9iaGu7iaYX66tWeHTL4tc8','0');
INSERT INTO `cn_log` VALUES('279','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-26','1516936284','6becUIoduFXEREwZFev7vjobw7bgx0UfXYqcXcpLSpH+keR3cULRHnQhSHKrmS5UI3wEcOj4w9ck8Z/WL1NIjCECPiFFzwufNjQ','0');
INSERT INTO `cn_log` VALUES('280','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=12','http://mls.keqxz.com/mlyy/','2018-01-26','1516936316','6a12zaTxqvyYtbVkQmugNQp/ZClPBzUCwATIQ7dLrIE+nrapx7FA9u6z7aJlNr+/dXVFZDSDsIJM0CbpfqvFbYg3d/BCG0oZVw','0');
INSERT INTO `cn_log` VALUES('281','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-26','1516936319','23aerMrKAuAsAJiWSWIrY+F+4N64VkqhSOIbGhYLEN49utE8Pn9VDNLc1PR1Il9bwP1fDSdaNrFf3xQIM45FzQwaOlO9H5hI2gU','0');
INSERT INTO `cn_log` VALUES('282','596','0','14','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-26','1516936322','39ffzehRHz7SpYC6rHPnWImJ1mdjuZB/9JXZIMe3F8ePf8EyFPpZH8HqcChVjxb6D4xDAbsz3VzJuB7Wy+db5zl5KmhE8gXmz/I','0');
INSERT INTO `cn_log` VALUES('283','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516936337','5b8fYBMUDqQmo8EXb4avMYIGBuXy+af+GCWLQDI+kgC9f8vXa69nkLsQYmetOnmOFLhsL8mCFEp5SZiU0pw0XHbA4qsWFSr0dP8','0');
INSERT INTO `cn_log` VALUES('284','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516936357','876cIGE72Z/o4AmqYeQCVo4/nrQr3goFlj0mCweJYD8OB3ZwB+pw5POt2onjc9tmiEMh8o4Fo27I6F5b+RHGh/U5dPExbbYMMQA','0');
INSERT INTO `cn_log` VALUES('285','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516936400','d6b7CevvLfhtIPCzvgZpYgIUHi80TJSBbhGar2/IRcKPj5hAXIK8gcuB7MvqYKUgeCkfHSw2w1tHN3dwm+Jjeu1mKhIbGLwj19g','0');
INSERT INTO `cn_log` VALUES('286','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516936402','d8256MbKtvyBygjtkHUnjj4MKF/pK1Kw79S55UxkPj321M4KGmnsM1Tle9ZV03mebDflSLLwagY5OU5dmF1u2Qfn+PJjE6HaVA','0');
INSERT INTO `cn_log` VALUES('287','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-26','1516936404','327b4ptsGt720cz0tETB6mHLqrtiH5xjH+ohknUPiinN6ApLg1Dqfk8qECn71Xs8ZLtWYSFcycQgS5CoDGVV7iuduheJWls8a/A','0');
INSERT INTO `cn_log` VALUES('288','596','0','14','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-26','1516936407','0f5bfXbebuW4v36WYDX4QtGH+CpLvUIhrsI4AefuQgAKt0EuvTk0NcfY5+Ivlq9rvMM9mruby1hZRGFDDUP0weNrTQptYIgO/XU','0');
INSERT INTO `cn_log` VALUES('289','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516936422','970dPxtTTFnLN5POL6X2i9KPmLTtRudUQmXsTrhptkgSyq32S2ycx/PbE5X5HobJMJ4s+krRcltZF0C7QtSJEgj1d5QJWzxmSo8','0');
INSERT INTO `cn_log` VALUES('290','596','0','14','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-26','1516936831','6dafUjjbQqYiT+yMJmXMEZ3R6vg8WuVXcUrzzchxzQ/m6eAiAHZpLYZ09UAF5IcgWx8Mb/hSu/iBp6PzVDbdbq84MICaJyhrTZg','0');
INSERT INTO `cn_log` VALUES('291','596','24','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-26','1516936833','bc741leB0nn522D+XVvGVzBSFMd5gb+XDeq8RruLOWFRtDlfgJLKBC+y+fV7J2p6/VPL9BVlS8FhL70Pr2r+UcQOw+DHOauiNvs','0');
INSERT INTO `cn_log` VALUES('292','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516936837','c2587ePaVn8jWvpuveCbCkvhf2H1VbFC2nZzT4JSRZhZQEl5cHwjkubH/ngNw2qkyGSHG7UyOAP265x/UsTCVHn3kFj7OoBuJg','0');
INSERT INTO `cn_log` VALUES('293','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516936838','16d7u02fg6zAzSRMTPtOwq2xa46IEXVB+ne5Ky2B/pYLVH7Cz+TCs7dsdU+8oNG8r3MWIYB0B95VHLu40v+EyXLOPpsmfQsnBbo','0');
INSERT INTO `cn_log` VALUES('294','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516936841','fab4CFIvdLetupAViNykjWrZrqSBwGNlhiZgIFPdXPGNhYy2vWZuM9Yk7r4FNMv9JQB3h3uq0DHSoJ8lC1QEcv3Rmtl8YGEBMA','0');
INSERT INTO `cn_log` VALUES('295','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516936864','0b4fxTbKr7jlEFZvRySDB6/dKlzGjigJ0ULJNrrEmPpkkw7UtX3RKDO8DzyAxpOeT05BmvIF+jajHoflkOEercn7ZUgPJI53oi0','0');
INSERT INTO `cn_log` VALUES('296','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516936868','3e4515Vt3EHsOG9g2ZsbbjPLbvt4ilEt0b0SGSzvS04u7xg51bMEmxVfFrcjxfmATGaUMkjeMIiVRMtRqNsv2w7zwR/7IW3tAxc','0');
INSERT INTO `cn_log` VALUES('297','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516936877','af76uFBXDviNuM3+5LjM07z1C0WYxVse02/GwLFG4VWIFkpba1qu88lLE8r2mortjvVyVNQoWpLrYM3HIgbXbmyD1ie4sUEZ19o','0');
INSERT INTO `cn_log` VALUES('298','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516936906','2d75T4JPvE7QwW5qvRVpD+B94QmqTV5nlpYBB3dE395r5vjjaz2JBpXQGpuutO+OAlfInxRsTnhj4ok5ur5BsrOldpUYvJuXoBQ','0');
INSERT INTO `cn_log` VALUES('299','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516936909','35d9BmmoAbTDWNOwpLotfrUwL7RyvwQ8IJ3O2Ez7oS7uwYdY7sMxjp7NCOcyCLf7n+/DU54xGLwUmPVSRbuSMlP0q3mPzpTTjRc','0');
INSERT INTO `cn_log` VALUES('300','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516937082','1a0ePQ+XKWHmNeL1p1sOhL1AxbILqfrIQAPwZh5WfDghvmTSzVV8e6wRNnlGh+DumzPxjMGdZbjiG15EfyQS1sr7QRN+Y8lUkXA','0');
INSERT INTO `cn_log` VALUES('301','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516937088','6df4AncfFnfMgc3jsHgJA0uUFFs5tRcRCwlg4/kDOaWgHcOKJlwYw6/oMaisjQc9jet0V9ebsE4amhzpGtr41VqAS4XcLYjrAdQ','0');
INSERT INTO `cn_log` VALUES('302','596','23','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-26','1516937091','085a+2nToljk1kY2f/2kaxzqzHDGz4ChPWtZqs/cS1PwCgmhuiza+FwOnjwcoIItCU1bEKIthSwBxDL9zCEK/KK0bpEtHdBhrIU','0');
INSERT INTO `cn_log` VALUES('303','596','25','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-26','1516937092','dc05eU+k/zqALQJ/J9QAyJlLdOYt177mhCATpi6iRmqIln4NYwmwXdM5ztujNP3KQ5e6aUP1iYoCI0erEMvsD2RqkPE9/xyDSfw','0');
INSERT INTO `cn_log` VALUES('304','596','9','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-26','1516937093','c384rI1gMj22UnN4HHKOJxpEZNKMlbYZh1DvhhG/6zhelPGfUdz2ETeRdN92/LvJhy6oW7n14am/gC6eiV9nCXverqMdgqUf1Q','0');
INSERT INTO `cn_log` VALUES('305','596','13','0','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','','http://mls.keqxz.com/fwfl/','2018-01-26','1516937094','5c3aXhCKfRaxcjWf7uEj9zDfaAD+3npNyfzlo9blKriuv7T8eOodh1BIjfRorMG5biFH8yUBu8CM2CVWG0t4xiwrnjr6I37lQWQ','0');
INSERT INTO `cn_log` VALUES('306','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','','http://mls.keqxz.com/','2018-01-29','1517187407','7e9dWQ+9UuEPM+WKqRJ9VdX92wM+6+Fs9tReHdtrNSx2UIm/fPjgr9fxqnmq7A+BTYOmyBUxZRVq4+yhY1bXvQ5mgKIaAgnx6w','0');
INSERT INTO `cn_log` VALUES('307','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/admin/yuyue.qm','http://mls.keqxz.com/?V=7','2018-01-29','1517189378','626dlQYB5G/LvS2u3Et9nmBYtXy9ie1/bpjt/3NuqmYTU5bTYgau6/BAOACgkmpoMWDeTYQtrQ2D+s2W3NVe9P2vhJlPhNEzSQ','0');
INSERT INTO `cn_log` VALUES('308','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','','http://mls.keqxz.com/?wrnd=qm','2018-01-29','1517189383','4e84Id9bOiyj/zOyWy3CpZpSrFYxkIbfXn1haePpkEuqQ50lv6/bfuEwGJElrKbOcaJA36dpr9RbR0V7ZCQ8ZccibqdMcRUy/Q','0');
INSERT INTO `cn_log` VALUES('309','605','13','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/fwfl/','2018-01-29','1517189387','ca8dlbpadypG3mmgMHcdTweZwL1DPZjTJlP4LZ7icW5PjgCV1mE1ZBxGIfc/y208fo2m57+kWYLvpTzBCae3l6W+PXDGsiXO/wQ','0');
INSERT INTO `cn_log` VALUES('310','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/admin/system.qm','http://mls.keqxz.com/?V=7','2018-01-29','1517208362','94353lTq9lcRFO6sjZhyuYNUkMbQM21UMCfjv62QDxsD+Xa8RTdO1Vje6iIG2db0vQH2sk0P6AOJdEIISE6evadESQsr0z8JhQ','0');
INSERT INTO `cn_log` VALUES('311','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','','http://mls.keqxz.com/?wrnd=qm','2018-01-29','1517208367','6071EEIwgk+CThR+PHznAvzWjh9oeMI0C9Dazvwt2Av7SdYxrjgzAlsy2O8VVPS6UTDVhCJEtYweaNbnMWA1UiW46+oLiEDMFw','0');
INSERT INTO `cn_log` VALUES('312','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','','http://mls.keqxz.com/?wrnd=qm','2018-01-29','1517208374','d56dXZtS83tjX7LA/p3WPZIkexJC2dQVEkMYkt/bmSz//qJt27pPiS3DOJgDQ5vhBdB0nUDgJ3PBlPkLrXjXd7XUV5nB3s5uHw','0');
INSERT INTO `cn_log` VALUES('313','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/mlyy/','2018-01-29','1517208409','1f16J9SoGegmi4wYGYwq48pqRhm9cXLzzjIMQ7rFClalB8A0Rk/aMX/KJlP4AlImckTOCyeYkQJCxRcwtMEoBmxCl4ymg2BH+Q','0');
INSERT INTO `cn_log` VALUES('314','615','13','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','','http://mls.keqxz.com/fwfl/','2018-01-29','1517208460','5d2dUK8784frlyGUJ9KyYvzmly5xDtGAzBAhREBsPfjwoTKnYdVIn4FDYH1x4AAplZ2X92JOxh10IOgt2LtApN2UIC1t8XbNkTI','0');
INSERT INTO `cn_log` VALUES('315','615','13','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','','http://mls.keqxz.com/fwfl/','2018-01-29','1517208466','2391JQkFuwj0znkZH9P4QsF+VJ8rr7JbCnWTf8Mbb0ycCXZ7nURkmKog0tR+dF+eF4CAg9/KWVyAeFONlLwRJM2flPTSKar9ewo','0');
INSERT INTO `cn_log` VALUES('316','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-29','1517208477','94a2EKu59WjyXEMVkx9PIlK6jm/hvPTIDIUgKTdlNcvO1gZ+/tgtmKBBtQTQkt3gJcoHsFSY5ZvKjoOlsXTuhQ4NbBo/GefLeA','0');
INSERT INTO `cn_log` VALUES('317','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208498','bd3ej6Ii+lzqeHrqB+ROM76+kpHbLj89B0x2Kd9Mp2karcT17hZGGMNLicyzKZlywF4GS1JgjSd1oWtRIbiyFmuR3ToZwqH/VdY','0');
INSERT INTO `cn_log` VALUES('318','619','4','0','16e5956e1f9e4aa77a8c4748e4d1fff95b8850f9','222.211.203.95','','http://mls.keqxz.com/mlbd/','2018-01-29','1517208564','94f7kqni7VtVHDpqRAydIsDW9otda4bcV8BBCW6/sLpX2xRP9mRuUkQ8X/yPWe18DgRTrpJvIYH0ikqvlE26uKGOnXA0xx79Ew','0');
INSERT INTO `cn_log` VALUES('319','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208582','5574Fpts1ActEIzd3bqd7dhJz7/fvGabDRaRUm+wmXaKh1aY/+klMvdbG3PWt+/GhgWRgyPXUBCswMH7VB+RCrfdD3B66FAxGd0','0');
INSERT INTO `cn_log` VALUES('320','619','4','0','16e5956e1f9e4aa77a8c4748e4d1fff95b8850f9','222.211.203.95','','http://mls.keqxz.com/mlbd/','2018-01-29','1517208583','f216wXhFnlmWglU97DW8Lwf2R6fEoUW3SbYukW7+O020cVrZchOEnVh1iEUSpmUAz5Oed5gxO9p+zcZajXiP+6J5CumvkPB/KQ','0');
INSERT INTO `cn_log` VALUES('321','619','13','0','16e5956e1f9e4aa77a8c4748e4d1fff95b8850f9','222.211.203.95','','http://mls.keqxz.com/fwfl/','2018-01-29','1517208593','6a2atoR1r+Xr8J/VIp5Pd7HlaXpehePRLig0WWEEKzmRZ45oYbKgI0GQMlEPRJpsN2f+1nIEyBbZxPirADLGYhL/7NKnU2WsBBw','0');
INSERT INTO `cn_log` VALUES('322','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208605','c58eVOKodNYVrAVq/wBcWFQZZcgMz0RVDriNx4dK+r7+1YJEo3pwvdqU0k0x6ONeEzUtoeVovJjkA2IU9QMpkYB03/qzQe5FO3g','0');
INSERT INTO `cn_log` VALUES('323','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-29','1517208609','8dde6tnKt508XvMWrfyuBJuzv4eE5tTmvQcNgckv92C/QpMKp7ZPlReRhBH7uZ4aNxQfpmcxSZXspKy57ht/K56ZtXZHGPo6Dg','0');
INSERT INTO `cn_log` VALUES('324','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208619','eb3f9DqAMS2oYFu0rkff9v2GRgaXaHd53aKqlsmwGRzlEqNHhI4Z5V397zilyDmGU+TNgcVW+SVRl57paL/ud1R/s4yzfeNek1M','0');
INSERT INTO `cn_log` VALUES('325','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208672','8dc4OjNzw+3yKBTWqw6gG/yIntxDydwBgotklJMoaRaAIY1X0Ys5OPHMZ4Pw73CWZ/rGuot5TbNStuQwrtZbw4vKotf87I5/9T0','0');
INSERT INTO `cn_log` VALUES('326','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208704','def7g/Teh7GAYR1GFE0akibPdjfjc7c6eVOJGhvHJUoQ4THbAD12fsHpuVHjhXCYyoPhs7Dl188/dymRmhJoA8tr+JalPijmuNs','0');
INSERT INTO `cn_log` VALUES('327','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208726','bf5eoVEF67UCwvZy5Drj4VPpRE2X68KOfkOTu8PM5sIo2pD0Pzp5Dad4XvE9CU8rrxfH8ZsCZQlq1QGOoXaW9lTITNuhemDxKP4','0');
INSERT INTO `cn_log` VALUES('328','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208729','628cCEKf9NULHFnRstaHYhQHNzBcqXgN1qY1A63ZO7pUPKkUQLowwVf1E1nEIjy3l9gj0vb67nlD6cLmM3uIKLsZKbDVyR3MJY0','0');
INSERT INTO `cn_log` VALUES('329','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208737','b9fc4mRSHbLnBfT91uIWkixC46u9s1jkls2iN/Znf9Lcxhqk0aAldVSehSfqfWnGUIqmjFjPB0gIUnQ1equq2OK1ooLSYHU8XAQ','0');
INSERT INTO `cn_log` VALUES('330','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208771','43e56rSXEeIhApZBkOz0k2eIscbHl66smtStEleEL942NEj/f5F16d1Rb3WefSAeapnVMQILqoEdfFunLG8j6rzc/B5NiyzqWHo','0');
INSERT INTO `cn_log` VALUES('331','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517208777','79fdFOwwQs4cfZLHKIjVA2iIz/dWXC6m7exLwyyOQmUxwtKnz3k/kMCAH19xIzrbc3JayeFzZtyxCA9Qi42eRqQiU5s33Y01krg','0');
INSERT INTO `cn_log` VALUES('332','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-29','1517208795','84db+p2TydhWt5TVAtBeN/Od510Za6kb/tdZv9pHRiB7Ue27XdzV+7rKc6Yz6iS0kpzTQjLtd9uyvwmMghgN1RQ3jMOdlOgdpw','0');
INSERT INTO `cn_log` VALUES('333','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517208800','1483ck2DbNdptxuy1WXfXCGnSxSiU7iytQhxxdZlzRpWXbJim2Kl2Kb4bazBm3T6kX1pAflZSR758V/Y4qJ54fmuYOymB5ADrws','0');
INSERT INTO `cn_log` VALUES('334','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517208806','be76wxGcvX776N24RmkiH3xUYHjjSMjB2VctURttJ0jmPDAjdi0v84YtjI/0wGc1HPEA12EOjScSCg92jT3jQ6eK9OniOCRwDzY','0');
INSERT INTO `cn_log` VALUES('335','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/','2018-01-29','1517209601','1fd6gBDIgekNspA89HstvYgeSPzk0SPZ6iP7zx2FV09ElgZ2WeQqioUcl064b+ionewSQ5FYKEGvJYRKxXWBd3Klcmr4aLjVcg','0');
INSERT INTO `cn_log` VALUES('336','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517209605','b3cdAsSUkJr+Vr4WydsTEXpo8vjxv4ipMuI1ISuamfp26WtP46Sbz3Zcft95bd9znIpwg2SVtHIClzp7Lnn4meY53Sw8nLuZDKo','0');
INSERT INTO `cn_log` VALUES('337','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517209661','e6a6thj02eXHGVjtXI5Nk4bUWGMvUIhFD9W7mFEr7Srg5jlk2Ir8jnMIcaEKDb7KWcSjn6xTIrmLBynG/6FBo/tx8MNFlWieMwA','0');
INSERT INTO `cn_log` VALUES('338','615','13','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','','http://mls.keqxz.com/fwfl/','2018-01-29','1517209676','89443Ha357xtSK99fKLa4sluMt2Tmq/bW4rTZjuCcbMkhKllUuUN3Zky7LaaqFxdn+y7JIoKoUhFY2Fab3PSn7XtW1iky3LKjG0','0');
INSERT INTO `cn_log` VALUES('339','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-29','1517209679','8022gAKr35OjaSM0CBR+AAbHWZMbgURMHIFemHvF5JHdUrpVAmZkkAH5uwhkm4ja433XEKRvVIoDTZTl8RBqzzAkKv8Bi3MEkA','0');
INSERT INTO `cn_log` VALUES('340','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-29','1517209689','5c4a7tC7vi0FUHDf1H01tUKNkWs+5Vy1gIS9tWQSDh6QUFVJu/IwUlMUP3qYvmLkyZ2imBa83w3PdMEQT3nECIYkK2rY7x9q3A','0');
INSERT INTO `cn_log` VALUES('341','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517209755','f84eooqld23tJJFRi0D28TzAOVu6nIP3MqJXLjVQryWR6DF+u5YQQXSrzxdjJNpfhKzzIyKEwhveN0nVq8kwKPndIIBhT/jfH0s','0');
INSERT INTO `cn_log` VALUES('342','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517209800','8cc8vBdQ3Falkj2Hv/1DKH0XgJhGGtR5gsgO14O9r6vz35bzzfGsYXGRImm5FlDozXlLg0EbTYmCgvf3Pa0lQb8OhJsyo068RT0','0');
INSERT INTO `cn_log` VALUES('343','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517209833','0d837oz1DmASCHYM2qo2oL5Zb0ujbcYJ+4BpL4QYdkwhYAHC1DxPzUiCw+XoSJleGMQ1lTwmU6JsPkU9QbYAHnMPQ/YUV9VMcvs','0');
INSERT INTO `cn_log` VALUES('344','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw2?id=12','http://mls.keqxz.com/mlyy/','2018-01-29','1517209880','0a1e9+R3RvpojRc/CTexxsQwd0Ta7puJTvRGodaglC3siXFX3KsMztfCKL3WKVzfIvLvfyK/vNKqZYwBlJI5/TiAkF8CresdXQ','0');
INSERT INTO `cn_log` VALUES('345','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517209881','cb0baoixytH5iPZXQAXjbApUdPorEUcEWU+FfwRHb8dJNQ+XLzxv+dcEUnG+zuFJuSs6BjovzBJkjGq8eXKS1peSEB2BQI/U1LM','0');
INSERT INTO `cn_log` VALUES('346','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517209908','a50by1gddhW4vyGRowiZqUnUixwr4bnVTTgJq979bSl9Bwmy41WNCitobf8YwsMt4sDClCWGpoJiIUD/OAsOvy+41fPy2VYWIbw','0');
INSERT INTO `cn_log` VALUES('347','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517209911','e423juU9hEUxpcE8EZxjrEn8wbkK1raQPtMbNjIqZpMT+WTx/NrKo4hZJRjiz9OGJxsUSQK9bCxsbyLho1S6DP38Cb/G8mWyYVs','0');
INSERT INTO `cn_log` VALUES('348','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517209912','a6ab6EfSZfEsy7v5L47CzM34KV0NT5UqPzFCNFsrbXuWZGdxzFOUSdEVSCn3QK3MxrsGnlse8x/69Ilh0TnVIx1b8sUh4K/Q8cU','0');
INSERT INTO `cn_log` VALUES('349','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw2?id=12','http://mls.keqxz.com/mlyy/','2018-01-29','1517209942','4dd4rn1pt5sHaJZCAdd2rkvKOnXKBRKxrXASMXpIFilHx1WanQFUAMKnRWGCDzDI9sdOQ6qxXztsuqFRq+x5WYDSvk3q/hnWag','0');
INSERT INTO `cn_log` VALUES('350','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw2?id=12','http://mls.keqxz.com/mlyy/','2018-01-29','1517209959','85d8nY5LJ1Ym3CFBGcjMR+vAgWe1mActxynMrYvpl0dKmtzhI26ED4DU3nIFUUz6CzP22+IDC48Sd5ashb+sDdzYZQRyYKihNg','0');
INSERT INTO `cn_log` VALUES('351','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw2?id=12','http://mls.keqxz.com/mlyy/','2018-01-29','1517209970','3319RX6TR4oPMZx6NFsAJMsyeyMAeZY7/jq/IDuM4CWqzeKo6vRqC4tzpRIvq7VQBF29NE30AplFWyFrLDhKbf/aawnx4XP1SQ','0');
INSERT INTO `cn_log` VALUES('352','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517209975','f20cP1cb2D1FcYpK0DlfSdmq4cyy0XUumjaB1lfTN+I65x97fidxUULXCVlhpHel3ZGQyxGEjC5FJBxKyfoLPEnmP1gNJerNOlg','0');
INSERT INTO `cn_log` VALUES('353','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517209984','613e/mDZeVGfWhadyhgozzThBChiTSwwjc+BgrMb9tGvx/CNanJ3BhiLYh3bt/yld7qpQN0ySFH1xfm/2XIq4j91Ihk6oVFSXGQ','0');
INSERT INTO `cn_log` VALUES('354','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517209997','097b7bVFQB4Uct9QRKxO+MISJ4yl/ukWfF3KwD5KJys7cZQiwx3mxt26gJPli7Iy1aUcFAF9NqMfcgA8kKEcKY21IjrG6IfKocQ','0');
INSERT INTO `cn_log` VALUES('355','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517210008','836c2t4kxOy3rg/+fi/Kmz1OKCJXbwyT6GzbyHnh9JusM5GKPF4PCb0iPL/0yvbWdlJzN1CTVvpCEyfGbnwihdoWG+ES/W/U+b0','0');
INSERT INTO `cn_log` VALUES('356','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210015','9814JRIeCfZn/MYjAx6kh88ew+uoLhHZYpUHidym2QMZmtAkoGh7+sxNcqpE9jquLyPXqQwXgrttySFRixuPTS/wkGP5QsvLAF0','0');
INSERT INTO `cn_log` VALUES('357','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210024','e4a8bK8kWp5LfEV6XeBJ5i7iotMRGiY60Ef9eC2sS1Nf9Rg5DPaw12PCmKivLq/pUjCCYLbgibdKh4/d0xQ3cFQ2B5fKqarposk','0');
INSERT INTO `cn_log` VALUES('358','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517210026','48c0fH23dnAJ+lbUJ+LD5OnBxYXudrBCANnmt/tyvhZNuMCOSEd4wYV6GIwY4FAoFTT4iGn8KA01ctrr5/toKEfEzFYCYVokFFE','0');
INSERT INTO `cn_log` VALUES('359','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210027','9262ZEidg6l7dvdEjeaIDNghXdSW5BBwvQroiRtKIwjz7H0gDXZ7DshSDDGAnNeJdhRH9vK4BkG67CwU55UhWvEcQTpPrvooqVQ','0');
INSERT INTO `cn_log` VALUES('360','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210028','9c709OevZNcUcZ/vDgd2QvAFj4sQ+KjYzV0Hw4S1ii1fkly+kwd7nOd4gjLvceoX0T7N6/gGqrMhB8/7Lm+iWLRFU+HyETHLxQo','0');
INSERT INTO `cn_log` VALUES('361','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517210032','d1ed6OLLyAorXXjl/FHRT9Yqeh4CQ/SuBEJyi5yCTZE3aiCYWUNEm03tx+Da/cCZPUgdGE+1Xor2dRxtLCPCNTigjrEYsuY0ZJQ','0');
INSERT INTO `cn_log` VALUES('362','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210091','8902z0CBoQ8EkTnSWv+HYoe9jz7sbAg+8zHCOA2vUKCX48FE7x6PVAYIw18RX0aqOD122VmIFGgSHHrKx+PmcZlTS+74kbrSeZ4','0');
INSERT INTO `cn_log` VALUES('363','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517210094','989elQPQTNv6KERY0rqckOmMDqvigKJEWZWd5dw+9aOpwluMSkSOzhrv0ESf35cqm5yfe2OHgnHb1lgzyTYi7EfvE9P/8/UXpm0','0');
INSERT INTO `cn_log` VALUES('364','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=14','http://mls.keqxz.com/mlyy/','2018-01-29','1517210126','55c1cKZ70FvmXMaI82Jy61SNhKz3HkRWFSa7+RwPjcwFOiDPySlQHdLTAjou+2DEIEFcK65r55GIIUfuDopqKF4yTmJz3mi69g','0');
INSERT INTO `cn_log` VALUES('365','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210127','2243gmoID2ZpciL7VIGTFRtJNsPrCEMLYx8HEIEVKT914vttPK+5/WIJsgWw2JWW9RGRQolYDhNEJ1XHJ4AqapxMRFNxHTNHHU4','0');
INSERT INTO `cn_log` VALUES('366','615','0','14','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517210130','ca18zlmcntjZJbncnlRIN3e78pM6hztgqiHe9A8/JA2ccidC+CqgTYWPAKg13hKY3ml+AoEYmKCb9Oy72y6U00Q7i+XcCeBmyYE','0');
INSERT INTO `cn_log` VALUES('367','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210155','31c3a75Wmqp4jVftM+chbF/x8xkmrmGbVWiNzxmZJ+g7Jd9qn6IDyNMMsTt4ICDFiwFageTVJgIFqMggLiB8F62pMI00tTfnYKA','0');
INSERT INTO `cn_log` VALUES('368','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/','2018-01-29','1517210158','2b83f3cHuSTbsaTvUjjKxBF8ThIhMGz4sHEVmJGVGSUTORDvgPQXKqARuJsLzd4htHgOqamPQeecrkV1/SlmUVQSUgwkzXyDWw','0');
INSERT INTO `cn_log` VALUES('369','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=14','http://mls.keqxz.com/mlyy/','2018-01-29','1517210170','3686iWKcaFKCszLTNpU5gMMyRlSAOruyhCx28+BmqDzgPOpKGvU0hi71hPRG9j/4sN9Y5b1zPm4yBnU1yYvBUrhXvriDnESE1g','0');
INSERT INTO `cn_log` VALUES('370','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210172','4a53f/fAXcNCWxi/1Ys+74ndjQm4xdgdQXbTazSoumEM8DrWTZ4LY0RnbAEUgbuj7GnkcQc+AZmyxivYeMREphOLyUWy28VHD9k','0');
INSERT INTO `cn_log` VALUES('371','615','0','14','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517210175','3a2eEfy+kPcQcQNHaiYg2TRB1gY8I1jmBsAXHYCTDRxFU70uNiyAm0eF7nHfZmzH2Qp4hrxZAMD89w9PYlf1ePgASHYRWCU82gw','0');
INSERT INTO `cn_log` VALUES('372','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210204','81147AVFib6GFQrJDiD8aD0gfu1LT/xsT0VnRaaW9vK8reoW9J9QPN8Zlsuqi9u9n+aRXZzLr63xlVAW59VAOSNeV/1yko5c40I','0');
INSERT INTO `cn_log` VALUES('373','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210265','8bb0E27Uc1yfW9QGZ8qmFMYEU20jJbSO3icGQewq+qr6l6m8nDPihEsdHkaP91OsDH5yKWRzcQj2dwdAkw4YKPRR5r503oclVg8','0');
INSERT INTO `cn_log` VALUES('374','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517210268','352bgY8YW9LV6Vt8RnSx2t1jbfb7Us+406YcNuvadwOi82zECa4U8+39IOmIDfjs5twZd1B5tHfo1++XDh6l+oIa/89ANt8PiL0','0');
INSERT INTO `cn_log` VALUES('375','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=14','http://mls.keqxz.com/mlyy/','2018-01-29','1517210332','7b483Dyqt3pYct73quJoxgcDX9ontMKOwZPNIzOMomjk9C0UpzEBbJMQdsm9d9irWVuPHLIra7EM6QHpJ1TkDdjZ85hRymTlhA','0');
INSERT INTO `cn_log` VALUES('376','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/','2018-01-29','1517210789','c6f8jFGpsMSwgPbqDna7Ywo+1aB9/x5r3+vOYMv6CIWzyMc0/aHe/DoMNmJXSvWYh2qaP/6Md9zymioyWX9v+VdoxBtAoKsWvg','0');
INSERT INTO `cn_log` VALUES('377','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210791','37b0vXPsWwiUJ8g6q5Pd98Y6FBaQKzM1H9IgCJM283LvO2oD+1pKKwqWWUEtB7d7Q7MCPP6TGByTpnUt+WCCJNusuY6aX64Cj9k','0');
INSERT INTO `cn_log` VALUES('378','615','13','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','','http://mls.keqxz.com/fwfl/','2018-01-29','1517210912','9373/jFcU8euOSHQMZSaSBRMpFfCU5cRtS9gzInBAdSs21GhT1RapljgSkHLvYK3WsCd+AJkC9wR4m/TBpwCeZ25hKzb4YfgqTY','0');
INSERT INTO `cn_log` VALUES('379','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-29','1517210914','abd51apqKRBml5CwAZXr+TVTqiL+ZSfsVS9mQz6e/17cKUd2PUYQjG3LHFYCpi658UFlKy4vPcYoGZyFoqnoZ0hD1TIzKg4h2g','0');
INSERT INTO `cn_log` VALUES('380','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210916','1a08THZAJF6lKPTCHZzt3gaM9++m10SzxTrueJSpCbVpotmviB2rA2x/0hcN+l1EUohzMifW6bTbJeefKRHRfCLoOxflbFRHsjY','0');
INSERT INTO `cn_log` VALUES('381','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517210960','d875Lrhbrc/DUwDGIGte0aInEZTgDSR3gJweTGkUGcNwUpFZ6eeIZxubLwD0ly3QctQvhqny2YfJVFqy7CgiXLmElfa02OH0u1U','0');
INSERT INTO `cn_log` VALUES('382','615','25','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517210999','fc590SevAH3pJb7yKjaS2k+2KcRLzZhW5TebeGC8JNjWp70hyN0YIh9w/IRkgkADEhO4pIDm6qSQiisCAfjKd6e39C8b5Yxqs9c','0');
INSERT INTO `cn_log` VALUES('383','615','23','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517211086','fd20iIyQ/lLbi3hV9/FsxQbrLhE5K4D7zEHmJXvEh1reTohmLLSxD9VUXdAAH7j2Z47ua3ZTva1H3M1sUcIkH1XqJdXSnM3FSvQ','0');
INSERT INTO `cn_log` VALUES('384','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/yyfw?id=11','http://mls.keqxz.com/mlyy/','2018-01-29','1517211145','31e4yjumsJwyyj5Kx969tcQs+hf2awa+XESRH7bJcUB7+mdyz8UGnFewAI0yUBtQURxzMaEitRZX7h6R5Kw3nggjj3ik3YktKQ','0');
INSERT INTO `cn_log` VALUES('385','615','24','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517211151','949aZXxUsUkz20JqTVmufy98gbAjNMRKBJPl2N/yVzPYLcVkBaqOMWcxp/qau1n70/XTr9v3yCbBZUscjiE6MTMfe7EfWON5UNY','0');
INSERT INTO `cn_log` VALUES('386','615','9','0','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-29','1517211241','3fd08jvQFDjKPPaXl470xDnjmra7tLJsmd7eHA/sWdkAD0hyrAkomFDCthhnmvqTuNWpihXHNzZqB4OezaSmkUHx3iNxfq1bOw','0');
INSERT INTO `cn_log` VALUES('387','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517213650','08c9aTvJNedR9/0tp/6xR0BoPDaitq9dLlQsclR/Iy8upQNUGeYws8k/fAAGOK7g6I8nHXZIDzW47uBmkyKSYBGtwvDRKLhWDBM','0');
INSERT INTO `cn_log` VALUES('388','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-29','1517213733','91a5mW+C56lvz6HJwowaQ/Xm0keDY1AYzQlb22IE1lqMhwRTxzr8Tyx6fG3oMmTxVDfq4mHPWzo23LNjqy+0nqKhhgVTlobfs0k','0');
INSERT INTO `cn_log` VALUES('389','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/jsyy/','2018-01-29','1517213745','a1a163aIlF1k/9SoatQdaWnwK0ZzAn63WTd1sOrh+PeaBkh612MZiJg9vFLZczJ4fK+yW+gvpbIYbrn0KoYNZOHgZmJREvP+eok','0');
INSERT INTO `cn_log` VALUES('390','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517213756','1a8cEY+WaMhyWYaSDwWOoBwstXM3+GnZe8Yi7ArhImLW+BTskHdYNeNTLxgbdxBCBhwbnfTQqYi4ezuj6ukBqZ9SqvWMsH7i6C4','0');
INSERT INTO `cn_log` VALUES('391','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517214200','13cf3lwLfMGyGukfgtC9ePwz3HgRBSDkSQd/HJl6LLqR8/PYjh9I6XCOCJbPQ9rV5Mho4o8LRzYBxzk6jqWpNlL8wFnzmJEz0Sc','0');
INSERT INTO `cn_log` VALUES('392','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517214223','a758gjuRdhjRBZ38AqUkKhfbY779bHMkMokERWlsPMh27TvXAKSQLwJ8tMPkOqy1dI5cSjvXmShahUeOx6jWm1SnhvXETUSH1g4','0');
INSERT INTO `cn_log` VALUES('393','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517216167','1f30UV6BOHP3LH402njY3Lin6ObUaKSRxU1E5ZVIlsRltUjUAt26DppGk3KWdTVv5K15iWNs02jWk3ed76ZZ0gb1EFZPwS2RHiI','0');
INSERT INTO `cn_log` VALUES('394','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517216179','af58QWPHrhTiksAS9CD7172bFv63fnq5KdRFfWBUb2vXnBPdtCRGyDrcrpGWQtNLT9PLmRgYhw8iie6kabHzU8E1L0/DuGyfBbs','0');
INSERT INTO `cn_log` VALUES('395','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517216444','22a4y+Q2GCpZLnZZIbPAdfDruE7pOwP5IGS3d9cKKTatF41qbYsUwAyc0SF81Vt1bqQZ51Cz9rJKaVIS+u8obFq0NV8VBMvcDvY','0');
INSERT INTO `cn_log` VALUES('396','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/','2018-01-29','1517216456','aad1n8MB/N2Bxb3C+MXPGVejWTelsb3XRNBiHK4+s7+rVATabzl8UjlloPdMAuUzRQsZO64SpQ2mv4+vJT0XY5q8WRAFGkQgrA','0');
INSERT INTO `cn_log` VALUES('397','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/','2018-01-29','1517216799','9c1aRRPDhFW4d9mcxu34kLNOAMfXAOYC0TjlO1h8vazuMC7looyt7Lk5K2XNgCqk7g49qr59x69kpOrM9tqEMdl6uhcI5e/ebA','0');
INSERT INTO `cn_log` VALUES('398','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-29','1517216801','300fcPEGujm3W5bOYSoWh+uDsNfKuNl1KMTPzs21B/VlX2I+qaJ6LHfIW1Y3v9a7JwXmLidDG5TJLqdzyK6a15jYTDd022bBrE4','0');
INSERT INTO `cn_log` VALUES('399','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517216804','c05fzAIi9O21gLXsF3YD2M4u8ruuYiXfdkQsBK5ol85cSuWGjNfA5Fonzx6JbQfyIf0DFh5f8Y1iK3RTCzUoAYTIfE6Nbmw5GcQ','0');
INSERT INTO `cn_log` VALUES('400','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517216927','ce59Y/WEMX7jk+14VAtbvCQqTYbZ2aCPJ1K5fLDNew+zk076COnQ0mcXTrkkM0yNtTOUk8mrO9+xEqH4sK7/P4TlS/AUS7fXNpY','0');
INSERT INTO `cn_log` VALUES('401','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517217436','bc51IvpgMhAWy2PZaBbm5J8VJEIwKZO1hthg55lnrkBrKIk9axJzq15jzsWkMSgcq00SCpa5vUY71mttiPMQRQY/5Gq8xr0Pl20','0');
INSERT INTO `cn_log` VALUES('402','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517217455','5c84S0QD/BH6FB3QuqUhYK6piLVgKPiNemZ1UWuOuak1yTmrg90382Zn+HylUl57k0LjgRS5pVLq/9vdTg3ezzWI3txXjtUM2po','0');
INSERT INTO `cn_log` VALUES('403','605','0','14','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/14.html','2018-01-29','1517217490','bfdau6UO28HXEjupYnivNeKdGMtEH3/0x5EwbDOlZyioJG22hgDkPDYtDd6CVutjxyr7yY0mcsLJZUWQTSeFAR1U0zxarOejx4U','0');
INSERT INTO `cn_log` VALUES('404','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/team/14.html','http://mls.keqxz.com/mlyy/','2018-01-29','1517218363','7402OxxtUuCcvAnMtChpnQ63FG+M3xt1QNb/jnfJloACstSYa2tcShBOIsylHWLjfJ5ZLA7w5lARHuFlG0GtSCVTe8ZFb7RNLw','0');
INSERT INTO `cn_log` VALUES('405','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218382','ee3eOHngwXI6bKo2cAaq9uwQjezC3P3ysj5Jz2BWle7wDPsi2RZlRn4LvNuLwMMfMOp2omkEvqj7hWPOeTxrX8M04bcltAA6aAY','0');
INSERT INTO `cn_log` VALUES('406','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218464','52a27zGhUmYgR1kTU1KrqwwAnWqIs2dXcwc761TAsV8wflrEqjucoNh6yLB9fOdSoxfp6fkMFbsiRX8zRXuvtcxkbMONNK+HnRw','0');
INSERT INTO `cn_log` VALUES('407','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517218481','ff29eznTzYEgOy4lhrlCDVMGsOWut34KU7FueF2P9V0QOzbfD+DBF2PKcESXnlOYJV+ZS3RgMaBKNkuKU+dd96Aj/114CnA6ctY','0');
INSERT INTO `cn_log` VALUES('408','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517218520','5125XBzpwRohyu3BO3Vs+RJh23dSN/xBTolxzRt5h847pOOC+ITemfn1yRR8l8Hfh1obuJNJ0MpAS6yU43Cm3KiOm/joz98EvFk','0');
INSERT INTO `cn_log` VALUES('409','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218522','b217aakbUhw44qNPHRRvBgo4Qth2w3iYE9EJq1JuX5m6KRdsSxaxGIUR7Gosu/vh7tK7z5Ja2XPrGhCiC4pGhfnhpAervSIrw7I','0');
INSERT INTO `cn_log` VALUES('410','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218565','316fUo+jzbUX6nypgzSN6ebT+e9W0eRHGykXefpdkeWreht7c6b0bd/fZyw3coOmXPZCyyWzGyRlBLyB6eId+9ac8OkJVT/uS1U','0');
INSERT INTO `cn_log` VALUES('411','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218603','da4eeEDhLDmz9LAlFmK99LmHxYJU0fhP90HXuA1oYZ0+2S7cZlH5sSc656SyP01vVQCLqVd6Zk8KYOUgZ9b+cVQL/HBCteWDjIY','0');
INSERT INTO `cn_log` VALUES('412','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218623','40f1thTMStJFzu+sWtE1m/zyY2byNaw//ONeNQ1JZ2urbnNgkAFoAEp0CdeDhgYzyLfXYAPjR9QYl4DhfLQaJWw/owbxgPFFyoY','0');
INSERT INTO `cn_log` VALUES('413','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218631','089dqF3dB1G/bNeuRtTyh9iOG2gQiOslwp4pDCX+eERpyTK1ProD30Sz7rzDwvMBqJDuC2KwJaIqU1hXJUBzJ9qXzV81KKwl19M','0');
INSERT INTO `cn_log` VALUES('414','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218642','00160fu68pfLsPSW3PEZZeJJ0FOpAymrTcODpfFEhNXiyoGK/5/i4qQMxFu/eUtkcytkjwW+d0H797QR8nhmhQSLISmYViTj0XM','0');
INSERT INTO `cn_log` VALUES('415','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218647','60bfRW12vv4tMYQTIZjnjWTXs4IVTeH8wA8s/Ayeg6iGwfnbbDTzZbdHHMs6kPAxht+5vXBi7Zpbefwt8nWtbPj2pSgEX6fEya8','0');
INSERT INTO `cn_log` VALUES('416','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218649','5d5ea6ozaH2edUKz/8/05sSBFZqIl4uh5SvrFeQ/sUYmNcZK6wahGz10wPFjJQMDOzs9w/qJh0d8jBn38DDIaehec8uFFEeMsjE','0');
INSERT INTO `cn_log` VALUES('417','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218671','ddd0618S7I8VKOgjejSvdd6ISw2BrV9dzn404DN/xNEZh4FD2Fd/H6WoQj4wSN5u+8Sdn6M5wF+WwHtWKU5l1XDvthLCbk4+r7w','0');
INSERT INTO `cn_log` VALUES('418','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218704','ed9eWGuf5RoS4h4sEnqpUHckVg6z7b3ZY9uS7UjiQXU5W+mDm/reVIrXhqHwR8N3nyT6it/7o76RJ3GVR9Y8HhDeTL58GUNwtG4','0');
INSERT INTO `cn_log` VALUES('419','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218713','8423izPPaoPg+lN40fFyORzqTuSMcm/gMwWBoSBW2FLmog/FNoGLZmpubmvFiuvCVkjFlkRnpfSu8EFGBgBjiu1nnJ/bTP+eCZg','0');
INSERT INTO `cn_log` VALUES('420','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218787','20beVoVloeVYRSwdJr2Z9pfSBQfEGtd3qjOhfhLe/cbCKIx4JNKT5rxGNPihoN9UMZJ6Sxt9LBBIMf5kv19D7DM7kqlOK2GpV3s','0');
INSERT INTO `cn_log` VALUES('421','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218819','d6a4TC95XNWyWNLVszHayAtq92gjsMqVr45f9OB0IJGwoVNKTtLEczHGxsfRatmzq7Ab4kav4ZG0S3qmCH8laGdTtOQn5zXVQSk','0');
INSERT INTO `cn_log` VALUES('422','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517218863','87b0k7Tn6+pdruiT8Ql1G30BpOFIize1ReNJLObIq09DrgQ6h+/0Qw5FVaYZguqH3LWwGz90DBEOS8MbqbzxYHM2TEtj35hDY2g','0');
INSERT INTO `cn_log` VALUES('423','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517219862','c3e6YU3JF1lu86m+nRfldMB3Hzv/GUH74UWwf6tW0ymrPnH7MjzAL8ToJymb1DbNkdGRzmjffDk3dh8xdVMU1u318erVQoObiow','0');
INSERT INTO `cn_log` VALUES('424','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/?k=梅老师','2018-01-29','1517219887','75c8l69vL6KCXgELDg8nwuyGymjbJleSqAHFn5jPmOjbeDpGNbSmIuSTI+32xIs39JfOXkD20s/od1BQb5zUP1LO1VgCSOtxNw0','0');
INSERT INTO `cn_log` VALUES('425','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/?k=梅老师','2018-01-29','1517219949','6fa3G50UOoVy3m/wHr2FYl3rLcQTFUILHn+hlAa/EhnuW4vdhWF6GTLyW+Nobnwt19UfPyAnXPnO2KlbuIdHhxLfBnD3zq3bcxA','0');
INSERT INTO `cn_log` VALUES('426','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/?k=梅老师','2018-01-29','1517220004','01dcDQ0jCbkEdAr4r1aGbo1shuYXBKUF0G/TEMACqbQ/nCwIIw9He7gml7TQW9/8ArsuyMKp7iVU1xkcxvZHzVbn0CqpwSUWKyI','0');
INSERT INTO `cn_log` VALUES('427','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=12','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222310','712f7kH2b+o4U5ASsVuaXhfKDQVhYfSkNcPEUn4O7p9cwSbQAJd7QmVdeqg9Jo71rR5NM0Mo6QpZOQr7IJ3yYMqARztIuILh5eU','0');
INSERT INTO `cn_log` VALUES('428','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=12','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222327','fbcbe/0y0I2CWXqqdkFbwOEiGWjTaMAk85NV851UN+TRlKpwJwklp7gEOmeHvxVENUhAW+hGAzx/U8yyI4Crd/OLm/HuhMaH/WU','0');
INSERT INTO `cn_log` VALUES('429','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=12','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222359','e301LK4BXIHBjwUPMITNMYoR3Wz8jIZZBqhLX/zn0RWS+eTqHXmEkmR5q2++81l0UBF5Xj6ggW+JSTmPbiwDoiFZ2IKi0qWtF1M','0');
INSERT INTO `cn_log` VALUES('430','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=12','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222360','cb67F36fvi+bUp6OADpySe3YkqDsflE1lhXBgwk6HEsZ57URw9i/z7Grni0rOUM5EBPNkxbWVKNHjO2qEYQQPdVypwHf3W7z58o','0');
INSERT INTO `cn_log` VALUES('431','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=11','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222474','d3d9XyMG+LjSbIibIx0WlNgJ+x7YC7hbwY29fIZEgXiikxvQRaQj4/5zUS2wMhKw1zNhJucgVxmJFq5bpAfNdzSE+oj+RqxN+2Q','0');
INSERT INTO `cn_log` VALUES('432','605','9','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/user/yyfw2?edid=12','http://mls.keqxz.com/mlyy/','2018-01-29','1517222508','cc46UKFad24m7Qh/gHc2iuZFz7EJ8KLEzjfVDlbPq36mmAc+0XADS5U6qgp2xD5RPo5kRq2FdZAIda+fL+Q7pD1yxUD0HDRm8w','0');
INSERT INTO `cn_log` VALUES('433','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222511','66fcba2NDJjGwAEm2KS97wbdqf6Kc/dNSrCUN/T7L3kD/TYMPnZuwQr5FYG7aJNexrt/ZBDSGEb0iXxsOUDiCw7TBlgsSucZVPY','0');
INSERT INTO `cn_log` VALUES('434','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222629','8a64qn5PlQ1QR5T43fZvhErcA2H0HVz6uTqg3ZKF6VK4HfBSRWXFlXF7YtWBxxUesF2ARySLwRsnuF9z4i6oiCOD3Ya4nxZ4AyU','0');
INSERT INTO `cn_log` VALUES('435','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222652','32b4wX1lZDVxchtXtvn/qDfgrT7xXd/PPRuKwv9ywINl1lXi0bvAdERZhq/QL2aepWbPAn08h51DPCv9etqA0weoEL/NUIxQRWc','0');
INSERT INTO `cn_log` VALUES('436','605','25','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-29','1517222677','8ee6AXWSwXp0/MVvVMKWEWy6GDRIjdHpy6RBA6I2mgMlIeDLkCEov4pKZ8GX1RqTqBeZjGb6CKxyxWEeS8RWARviNPXka7R+MYo','0');
INSERT INTO `cn_log` VALUES('437','605','24','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-29','1517222689','6003r9+jvA7Gp9Q3vJ9iocs9Wz1hFnGPl+EaIayhYKmkru+znVW+iA17d7KeB6HgYBA5W03RN+6BUhBaRI0QkRbGvL4DX0jmEhM','0');
INSERT INTO `cn_log` VALUES('438','605','23','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-29','1517222693','68136qtHTTtSFnWwgfBxc/jR/B42vAQ8lvg3USFHJuzi3cBSUpwIyZ+Nc0eaHwlJoyBr48hpNif1Mwj4l7wxN60EUNk1GH3QJNE','0');
INSERT INTO `cn_log` VALUES('439','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/admin/class.qm','http://mls.keqxz.com/?ec','2018-01-29','1517222779','4c84XZHXw/wMY8FZcz/bdlelEGac56WWNSwDCy0WFULA5HY1oaqxw4Uk46GQIm6aoKbiZ1xfwSzFupR1tXPHNd94cn1yyRhyBA','0');
INSERT INTO `cn_log` VALUES('440','605','0','0','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','http://mls.keqxz.com/admin/user.qm','http://mls.keqxz.com/?ef','2018-01-29','1517223027','fd35lrsfoeQB1ILzsEobL1lVdFCHNPTD/px6EvScfpGXEWTjBIRRPCBax5akH7QIqpPYM+jF17wJcf3cnEy6n3IP9KZ2z+6TFA','0');
--
-- 表的结构cn_member
--

DROP TABLE IF EXISTS `cn_member`;
CREATE TABLE `cn_member` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tjid` bigint(10) DEFAULT '0' COMMENT '推荐用户ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名（手机号）',
  `class` int(2) DEFAULT '0' COMMENT '会员级别',
  `phone` varchar(255) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `isbind` smallint(1) DEFAULT '0' COMMENT '是否绑定',
  `isbind_time` bigint(10) DEFAULT '0' COMMENT '绑定时间',
  `photo` varchar(250) DEFAULT '',
  `qq` varchar(20) DEFAULT '',
  `password` varchar(250) DEFAULT '',
  `time` bigint(11) DEFAULT '0',
  `state` smallint(1) DEFAULT '1',
  `truename` varchar(250) DEFAULT '',
  `nc` varchar(255) DEFAULT '' COMMENT '昵称',
  `onc` varchar(255) DEFAULT '',
  `area` varchar(250) DEFAULT '',
  `address` varchar(250) DEFAULT '',
  `birthday` varchar(50) DEFAULT '',
  `now_address` varchar(100) DEFAULT '' COMMENT '现居地',
  `third_num` varchar(50) DEFAULT '' COMMENT '第三方id',
  `third_name` varchar(50) DEFAULT '' COMMENT '第三方昵称',
  `openid` varchar(100) DEFAULT '' COMMENT '第三方唯一标识opendid',
  `subscribe` smallint(6) DEFAULT '0' COMMENT '是否关注',
  `wx_photo` varchar(200) DEFAULT '' COMMENT '微信头像',
  `unsubscribe_time` bigint(11) DEFAULT '0',
  `wx_address` varchar(200) DEFAULT '' COMMENT '微信地址',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `wx_sex` varchar(10) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `del` smallint(1) DEFAULT '0',
  `piclist` varchar(555) DEFAULT '',
  `about` varchar(2255) DEFAULT '' COMMENT '个人介绍',
  `cookrnd` varchar(100) DEFAULT '' COMMENT 'cookie随机码 当会员登录启用cookie随机生成',
  `logintime` bigint(11) DEFAULT '0' COMMENT '最后登录时间',
  `wxh` varchar(100) DEFAULT '' COMMENT '微信号',
  `htime` bigint(11) DEFAULT '0' COMMENT '微信最后一次互动时间',
  `location_x` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置x坐标',
  `location_y` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置Y坐标',
  `onc2` varchar(255) DEFAULT '',
  `province` varchar(50) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `county` varchar(50) DEFAULT '',
  `wrnd` varchar(500) DEFAULT '',
  `zjf` int(8) DEFAULT '0' COMMENT '累计积分',
  `jf` int(8) DEFAULT '0' COMMENT '用户剩余积分',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='微信端用户表 即会员表';

--
-- 转存表中的数据 cn_member
--

INSERT INTO `cn_member` VALUES('1','0','13594333241','2','13594333241','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','','40753e71591badf5751ad5847fea81e9','1511165911','1','管家','WiFi管家','','四川 广安','这里是详细的地址2','2017-11-12','','3','WiFi管家','o32l3wDjRU0ALmBRwHhgqsGowVI0','0','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','0','','男','女','117.136.62.79','0','','备注备注备注备注备注备注备注','','1511433311','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('6','0','13594333242','1','13594333242','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIM0PIibaNPEsvKrpkH9uyGeA/0','','fd1b36acb8b4f4fa21eb4d9126b720b8','1514948993','1','管家2','WiFi管家','','四川 广安','','','','3','WiFi管家','oLCgv0rbnPRKGZXNa8mBPbvIJYu8','0','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIuzoGicRDDZHMWHSvgGlneUg/132','0','','女','女','118.113.40.159','0','','','','1516846130','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('7','0','18081029908','1','18081029908','','1','1515139149','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/0','','13ed46c1bb9365f1c611871dafaffa74','1515118059','1','','羽毛','','四川 成都','','','','3','羽毛','oLCgv0g_pELowJK4srRzJfphpAvo','0','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/132','0','','男','男','118.113.56.65','0','','','','1517208452','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('8','0','15928373167','1','15928373167','','1','1515136632','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','','815385d061174fc9042e51c7f8b23277','1515119126','1','','yeahaa','','四川 内江','','','','3','yeahaa','oLCgv0rbtIo3N0og5-tgkufE_KEs','0','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','0','','女','女','117.136.62.41','0','','','','1515142628','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('9','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','','ab7d82e734e70a5b6b87720a8d3b8da4','1515119905','1','','知更鸟','','四川 成都','','','','3','知更鸟','oLCgv0kb2hPr08avL2rQ1jdX3eV8','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','0','','男','男','118.113.56.65','0','','','','1515119905','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('10','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/0','','374b6d9a0ec6da00fe9ff688feff340c','1515119907','1','','习惯','','四川 成都','','','','3','习惯','oLCgv0lHdkTWy6-mTDNSKJELYP4Y','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/132','0','','女','女','139.207.55.15','0','','','','1517208560','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('11','0','15828974773','1','15828974773','','1','1515561637','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/0','','d378420532880e98af3658e35ba986d6','1515121177','1','','义博云天','','四川 遂宁','海上海','','','3','义博云天','oLCgv0qMB56RRvhf7GSz-qX50Xnk','0','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/132','0','','女','女','118.113.56.65','0','','','','1516246620','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('12','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/0','','90b324e12fcb9e8e74b76b8f13ceaaad','1515132652','1','','两个人流浪','','四川 成都','','','','3','两个人流浪','oLCgv0ikzGe4dyd2Y013l-wd8aAw','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/132','0','','男','男','171.210.212.10','0','','','','1515570408','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('13','0','del_','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','','baea7b6502f3740ffd388d8c9ea094ad','1515151210','1','','小智','','四川 成都','','','','3','小智','oLCgv0h-sP_zHY9-XKT-tCBRZeCU','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','0','','女','女','139.207.177.131','1','','','','1515562601','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('14','0','18908099505','1','18908099505','','1','1515557318','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/0','','6d802a6730eeaaf40c8fa72caa8b008e','1515153700','1','','黄丽','','四川 成都','','','','3','黄丽','oLCgv0qcxBDMVhvgGbyvImuu4TGs','0','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/132','0','','女','女','139.207.93.125','0','','','','1515577298','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('15','0','18116619416','1','18116619416','','1','1515561658','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/0','','2c1a409eed4cbeefdf00b61af8880f04','1515162938','1','','0   0','','四川 成都','','','','3','0   0','oLCgv0rE_ZbAsm6F9L9_m_1fUoLs','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/132','0','','女','女','118.116.92.52','0','','','','1516268266','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('16','0','18908073896','1','18908073896','','1','1515561816','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/0','','5ff3e17008091ea59bfba1ba570ac8a0','1515209807','1','','游傅英','','重庆 ','','','','3','游傅英','oLCgv0paPDQxcgMOJqeH1JQECGzA','0','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/132','0','','女','女','118.113.56.65','0','','','','1516597829','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('17','0','13880180472','1','13880180472','','1','1515561674','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/0','','3eab13e6c8ac736de78ce6bc4c9d5eda','1515557150','1','','余笙','','四川 成都','海上海','11.27','','3','余笙','oLCgv0tuaS11r-ifAZXCu8_cqM80','0','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/132','0','','女','女','117.136.62.48','0','','','','1515813402','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('18','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','','a14034da61cc63c57f959ff195c5f5e4','1515557754','1','','花','','四川 成都','','','','3','花','oLCgv0rtb5kHkW-yh5X2AhLbmz1Q','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','0','','女','女','118.112.185.236','0','','','','1515557754','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('19','0','18781702377','1','18781702377','','1','1515561618','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','','beadbefe5579f90af70f9eac5f216ef9','1515561536','1','','南风过境','','四川 南充','','','','3','南风过境','oLCgv0lUlD6rcEWhJAF0rSmV5Ra0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','0','','女','女','118.116.89.102','0','','','','1515561536','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('20','0','13880545078','1','13880545078','','1','1515826160','http://wx.qlogo.cn/mmopen/vi_32/0QEoQxWDakUsmazBMUdIPPzNwUHVbeaSia0pjocAdqIDKavKF0q2PbfUSIJFKjibUmAFnCsBjunjIoQPGcsvQ7lg/132','','92e2952e868097467b6eccbf31a451a6','1515826103','1','','飘雪','','四川 成都','','','','3','飘雪','oLCgv0pQk4msvBAgs0GMb43UT6RE','0','http://wx.qlogo.cn/mmopen/vi_32/0QEoQxWDakUsmazBMUdIPPzNwUHVbeaSia0pjocAdqIDKavKF0q2PbfUSIJFKjibUmAFnCsBjunjIoQPGcsvQ7lg/132','0','','女','女','139.207.84.169','0','','','','1515826103','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('21','0','15328089948','1','15328089948','','1','1515827220','http://wx.qlogo.cn/mmopen/vi_32/YNzQ3CrxqpjXADQOPrnuJ2JONR9NO0Qlt6ZGpjjaicWXLLSRXlNCgVTZFgvIfy2nflia2AxDq7Hia0eL8AiaZ2M9Yg/132','','5c8c435fcead8f7683649b8c7e54dd90','1515827165','1','','开心就好','',' ','','','','3','开心就好','oLCgv0sjaMlHfNXKnlXqAUfOJbE4','0','http://wx.qlogo.cn/mmopen/vi_32/YNzQ3CrxqpjXADQOPrnuJ2JONR9NO0Qlt6ZGpjjaicWXLLSRXlNCgVTZFgvIfy2nflia2AxDq7Hia0eL8AiaZ2M9Yg/132','0','','未知','未知','171.210.205.143','0','','','','1515827165','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('22','0','13699017005','1','13699017005','','1','1515827960','http://wx.qlogo.cn/mmopen/vi_32/RYYSnY4mhWsNUSia0PkzX7mwQeT0FiblNGcZoSY0xGkwYXsIpcUNOqv4x63474u5ZUQFZCu1pribCS8NwjHib2pibSg/132','','415734d8040abdeda597713c4ca29b0c','1515827932','1','','嘿，嘛扎嘿','','四川 绵阳','','','','3','嘿，嘛扎嘿','oLCgv0rH4XJP8zh7Wwnz6xu2zy1M','0','http://wx.qlogo.cn/mmopen/vi_32/RYYSnY4mhWsNUSia0PkzX7mwQeT0FiblNGcZoSY0xGkwYXsIpcUNOqv4x63474u5ZUQFZCu1pribCS8NwjHib2pibSg/132','0','','女','女','117.136.70.57','0','','','','1515827932','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('23','0','15908184689','1','15908184689','','1','1515831992','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6GDzk8uia5Vr7ibwBXVZyDmTp5qsPLib5zLcFIbJj1xd9l9yas8dncdZSricuwdbSy7vmGofmD8ZfIg/132','','dc01ad39f3c647f5e72c3016147ebd7c','1515831954','1','','风轻轻','','四川 成都','','','','3','风轻轻','oLCgv0nyuSRLz1RrgoYNLC4OxH60','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6GDzk8uia5Vr7ibwBXVZyDmTp5qsPLib5zLcFIbJj1xd9l9yas8dncdZSricuwdbSy7vmGofmD8ZfIg/132','0','','女','女','117.136.70.35','0','','','','1515831954','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('24','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTDpbCdjVNe6CiaQTmoPBzmc56iaKQGzpdvrrTjkmnYQTqxFTbYtn3ibg27AvvgqgtibvwIMcyT4n8pA/132','','e81f71907df4027e63012a079a9a0948','1515833934','1','','虹','','四川 绵阳','','','','3','虹','oLCgv0jMU73wd-yHPC1gOKBUZ6So','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTDpbCdjVNe6CiaQTmoPBzmc56iaKQGzpdvrrTjkmnYQTqxFTbYtn3ibg27AvvgqgtibvwIMcyT4n8pA/132','0','','女','女','117.136.70.48','0','','','','1515833934','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('25','0','18081036608','1','18081036608','','1','1515850685','http://wx.qlogo.cn/mmopen/vi_32/Mp7LOnopozCe7Up5Jab8Bm5mia22Viasan82IlrxpTXJUiaQYd2mSYSgs1Yv0oKFbjsEhkG3gvfdaayibfjsfjFJ6g/132','','682ce1dc8c302bad538c1ea6ab532131','1515850392','1','','史永梅 Melissa','','四川 成都','','','','3','史永梅 Melissa','oLCgv0oGIvQ2LHKfIoldRICchKKk','0','http://wx.qlogo.cn/mmopen/vi_32/Mp7LOnopozCe7Up5Jab8Bm5mia22Viasan82IlrxpTXJUiaQYd2mSYSgs1Yv0oKFbjsEhkG3gvfdaayibfjsfjFJ6g/132','0','','女','女','182.149.160.234','0','','','','1515850392','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('26','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/tlbrFvT1PkTYwu7V5kUzEkjOJMfQHHSGscNicVWvytkYkEkGmPVp3Yf8ssL0rsw02CYicENLDIXPAOiakSNT2Jfrw/132','','c3f5255b7050b824719ad825da6e401e','1516154416','1','','美克拉Bait','','广东 深圳','','','','3','美克拉Bait','oLCgv0vRTc4OoiXwQ0aXOGJU6iD0','0','http://wx.qlogo.cn/mmopen/vi_32/tlbrFvT1PkTYwu7V5kUzEkjOJMfQHHSGscNicVWvytkYkEkGmPVp3Yf8ssL0rsw02CYicENLDIXPAOiakSNT2Jfrw/132','0','','女','女','116.30.222.112','0','','','','1516154416','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('27','0','13618029227','1','13618029227','','1','1516344909','http://wx.qlogo.cn/mmopen/vi_32/UWpN1EIAJibicBcot7Wb69wnXMjhd5SiaXDlR7Rj3M8YvWKcIibAwvk5EOib0vT8R8JdE6lvCZ1JAOxpvJpO9GHEBjg/132','','67e9c40a4300a1234738177b04abbee8','1516344870','1','','Angela','','四川 成都','','','','3','Angela','oLCgv0jT2ItKM7C4v67AedqLyaEU','0','http://wx.qlogo.cn/mmopen/vi_32/UWpN1EIAJibicBcot7Wb69wnXMjhd5SiaXDlR7Rj3M8YvWKcIibAwvk5EOib0vT8R8JdE6lvCZ1JAOxpvJpO9GHEBjg/132','0','','女','女','117.136.63.176','0','','','','1516344870','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('28','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwI4IGxVZ258RgXUB4d6uOKmj2CfglvxQ1S0yeFXKRJ4kWN318VYy4rbnxjiafibOeUKboIOBcricdA/132','','e48a35e7d8407290bbf984d8b45ba798','1516435870','1','','林东炫15610083977','',' ','','','','3','林东炫15610083977','oLCgv0ru7GvsIsQuifWfiznafLYo','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwI4IGxVZ258RgXUB4d6uOKmj2CfglvxQ1S0yeFXKRJ4kWN318VYy4rbnxjiafibOeUKboIOBcricdA/132','0','','男','男','112.226.250.219','0','','','','1516435870','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('29','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/iapvK7pd7fj41vjsMMmqycYRcd6ENPNEjq8RAzW2d64J3CLszNZB6JpoYDgbRocbslI4YX6XFfwzROJZnQtV3Aw/132','','2fc632f9c4ddd1279899f82f1cc2c729','1516515750','1','','媛媛','','四川 成都','','','','3','媛媛','oLCgv0ui5xbSD_g68wYjdujZxxoo','0','http://wx.qlogo.cn/mmopen/vi_32/iapvK7pd7fj41vjsMMmqycYRcd6ENPNEjq8RAzW2d64J3CLszNZB6JpoYDgbRocbslI4YX6XFfwzROJZnQtV3Aw/132','0','','女','女','119.6.107.88','0','','','','1516515750','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
--
-- 表的结构cn_member_copy
--

DROP TABLE IF EXISTS `cn_member_copy`;
CREATE TABLE `cn_member_copy` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tjid` bigint(10) DEFAULT '0' COMMENT '推荐用户ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名（手机号）',
  `class` int(2) DEFAULT '0' COMMENT '会员级别',
  `phone` varchar(255) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `isbind` smallint(1) DEFAULT '0' COMMENT '是否绑定',
  `isbind_time` bigint(10) DEFAULT '0' COMMENT '绑定时间',
  `photo` varchar(250) DEFAULT '',
  `qq` varchar(20) DEFAULT '',
  `password` varchar(250) DEFAULT '',
  `time` bigint(11) DEFAULT '0',
  `state` smallint(1) DEFAULT '1',
  `truename` varchar(250) DEFAULT '',
  `nc` varchar(255) DEFAULT '' COMMENT '昵称',
  `onc` varchar(255) DEFAULT '',
  `area` varchar(250) DEFAULT '',
  `address` varchar(250) DEFAULT '',
  `birthday` varchar(50) DEFAULT '',
  `now_address` varchar(100) DEFAULT '' COMMENT '现居地',
  `third_num` varchar(50) DEFAULT '' COMMENT '第三方id',
  `third_name` varchar(50) DEFAULT '' COMMENT '第三方昵称',
  `openid` varchar(100) DEFAULT '' COMMENT '第三方唯一标识opendid',
  `subscribe` smallint(6) DEFAULT '0' COMMENT '是否关注',
  `wx_photo` varchar(200) DEFAULT '' COMMENT '微信头像',
  `unsubscribe_time` bigint(11) DEFAULT '0',
  `wx_address` varchar(200) DEFAULT '' COMMENT '微信地址',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `wx_sex` varchar(10) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `del` smallint(1) DEFAULT '0',
  `piclist` varchar(555) DEFAULT '',
  `about` varchar(2255) DEFAULT '' COMMENT '个人介绍',
  `cookrnd` varchar(100) DEFAULT '' COMMENT 'cookie随机码 当会员登录启用cookie随机生成',
  `logintime` bigint(11) DEFAULT '0' COMMENT '最后登录时间',
  `wxh` varchar(100) DEFAULT '' COMMENT '微信号',
  `htime` bigint(11) DEFAULT '0' COMMENT '微信最后一次互动时间',
  `location_x` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置x坐标',
  `location_y` double(20,13) DEFAULT '0.0000000000000' COMMENT '地理位置Y坐标',
  `onc2` varchar(255) DEFAULT '',
  `province` varchar(50) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `county` varchar(50) DEFAULT '',
  `wrnd` varchar(500) DEFAULT '',
  `zjf` int(8) DEFAULT '0' COMMENT '累计积分',
  `jf` int(8) DEFAULT '0' COMMENT '用户剩余积分',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='微信端用户表 即会员表';

--
-- 转存表中的数据 cn_member_copy
--

INSERT INTO `cn_member_copy` VALUES('1','0','13594333241','1','13594333241','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','','40753e71591badf5751ad5847fea81e9','1511165911','1','管家','WiFi管家','','四川 广安','这里是详细的地址','2017-11-11','','3','WiFi管家','o32l3wDjRU0ALmBRwHhgqsGowVI0','0','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','0','','男','女','117.136.62.79','0','','备注备注备注备注备注备注备注备注备注','','1511433311','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('6','0','13594333242','1','13594333242','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIM0PIibaNPEsvKrpkH9uyGeA/0','','fd1b36acb8b4f4fa21eb4d9126b720b8','1514948993','1','管家2','WiFi管家','','四川 广安','','','','3','WiFi管家','oLCgv0rbnPRKGZXNa8mBPbvIJYu8','0','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIuzoGicRDDZHMWHSvgGlneUg/132','0','','女','女','118.113.40.159','0','','','','1516846130','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('7','0','18081029908','1','18081029908','','1','1515139149','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/0','','13ed46c1bb9365f1c611871dafaffa74','1515118059','1','','羽毛','','四川 成都','','','','3','羽毛','oLCgv0g_pELowJK4srRzJfphpAvo','0','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/132','0','','男','男','118.113.56.65','0','','','','1517208452','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('8','0','15928373167','1','15928373167','','1','1515136632','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','','815385d061174fc9042e51c7f8b23277','1515119126','1','','yeahaa','','四川 内江','','','','3','yeahaa','oLCgv0rbtIo3N0og5-tgkufE_KEs','0','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','0','','女','女','117.136.62.41','0','','','','1515142628','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('9','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','','ab7d82e734e70a5b6b87720a8d3b8da4','1515119905','1','','知更鸟','','四川 成都','','','','3','知更鸟','oLCgv0kb2hPr08avL2rQ1jdX3eV8','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','0','','男','男','118.113.56.65','0','','','','1515119905','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('10','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/0','','374b6d9a0ec6da00fe9ff688feff340c','1515119907','1','','习惯','','四川 成都','','','','3','习惯','oLCgv0lHdkTWy6-mTDNSKJELYP4Y','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/132','0','','女','女','139.207.55.15','0','','','','1517208560','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('11','0','15828974773','1','15828974773','','1','1515561637','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/0','','d378420532880e98af3658e35ba986d6','1515121177','1','','义博云天','','四川 遂宁','海上海','','','3','义博云天','oLCgv0qMB56RRvhf7GSz-qX50Xnk','0','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/132','0','','女','女','118.113.56.65','0','','','','1516246620','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('12','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/0','','90b324e12fcb9e8e74b76b8f13ceaaad','1515132652','1','','两个人流浪','','四川 成都','','','','3','两个人流浪','oLCgv0ikzGe4dyd2Y013l-wd8aAw','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/132','0','','男','男','171.210.212.10','0','','','','1515570408','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('13','0','del_','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','','baea7b6502f3740ffd388d8c9ea094ad','1515151210','1','','小智','','四川 成都','','','','3','小智','oLCgv0h-sP_zHY9-XKT-tCBRZeCU','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','0','','女','女','139.207.177.131','1','','','','1515562601','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('14','0','18908099505','1','18908099505','','1','1515557318','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/0','','6d802a6730eeaaf40c8fa72caa8b008e','1515153700','1','','黄丽','','四川 成都','','','','3','黄丽','oLCgv0qcxBDMVhvgGbyvImuu4TGs','0','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/132','0','','女','女','139.207.93.125','0','','','','1515577298','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('15','0','18116619416','1','18116619416','','1','1515561658','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/0','','2c1a409eed4cbeefdf00b61af8880f04','1515162938','1','','0   0','','四川 成都','','','','3','0   0','oLCgv0rE_ZbAsm6F9L9_m_1fUoLs','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/132','0','','女','女','118.116.92.52','0','','','','1516268266','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('16','0','18908073896','1','18908073896','','1','1515561816','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/0','','5ff3e17008091ea59bfba1ba570ac8a0','1515209807','1','','游傅英','','重庆 ','','','','3','游傅英','oLCgv0paPDQxcgMOJqeH1JQECGzA','0','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/132','0','','女','女','118.113.56.65','0','','','','1516597829','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('17','0','13880180472','1','13880180472','','1','1515561674','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/0','','3eab13e6c8ac736de78ce6bc4c9d5eda','1515557150','1','','余笙','','四川 成都','海上海','11.27','','3','余笙','oLCgv0tuaS11r-ifAZXCu8_cqM80','0','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/132','0','','女','女','117.136.62.48','0','','','','1515813402','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('18','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','','a14034da61cc63c57f959ff195c5f5e4','1515557754','1','','花','','四川 成都','','','','3','花','oLCgv0rtb5kHkW-yh5X2AhLbmz1Q','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','0','','女','女','118.112.185.236','0','','','','1515557754','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('19','0','18781702377','1','18781702377','','1','1515561618','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','','beadbefe5579f90af70f9eac5f216ef9','1515561536','1','','南风过境','','四川 南充','','','','3','南风过境','oLCgv0lUlD6rcEWhJAF0rSmV5Ra0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','0','','女','女','118.116.89.102','0','','','','1515561536','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('20','0','13880545078','1','13880545078','','1','1515826160','http://wx.qlogo.cn/mmopen/vi_32/0QEoQxWDakUsmazBMUdIPPzNwUHVbeaSia0pjocAdqIDKavKF0q2PbfUSIJFKjibUmAFnCsBjunjIoQPGcsvQ7lg/132','','92e2952e868097467b6eccbf31a451a6','1515826103','1','','飘雪','','四川 成都','','','','3','飘雪','oLCgv0pQk4msvBAgs0GMb43UT6RE','0','http://wx.qlogo.cn/mmopen/vi_32/0QEoQxWDakUsmazBMUdIPPzNwUHVbeaSia0pjocAdqIDKavKF0q2PbfUSIJFKjibUmAFnCsBjunjIoQPGcsvQ7lg/132','0','','女','女','139.207.84.169','0','','','','1515826103','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('21','0','15328089948','1','15328089948','','1','1515827220','http://wx.qlogo.cn/mmopen/vi_32/YNzQ3CrxqpjXADQOPrnuJ2JONR9NO0Qlt6ZGpjjaicWXLLSRXlNCgVTZFgvIfy2nflia2AxDq7Hia0eL8AiaZ2M9Yg/132','','5c8c435fcead8f7683649b8c7e54dd90','1515827165','1','','开心就好','',' ','','','','3','开心就好','oLCgv0sjaMlHfNXKnlXqAUfOJbE4','0','http://wx.qlogo.cn/mmopen/vi_32/YNzQ3CrxqpjXADQOPrnuJ2JONR9NO0Qlt6ZGpjjaicWXLLSRXlNCgVTZFgvIfy2nflia2AxDq7Hia0eL8AiaZ2M9Yg/132','0','','未知','未知','171.210.205.143','0','','','','1515827165','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('22','0','13699017005','1','13699017005','','1','1515827960','http://wx.qlogo.cn/mmopen/vi_32/RYYSnY4mhWsNUSia0PkzX7mwQeT0FiblNGcZoSY0xGkwYXsIpcUNOqv4x63474u5ZUQFZCu1pribCS8NwjHib2pibSg/132','','415734d8040abdeda597713c4ca29b0c','1515827932','1','','嘿，嘛扎嘿','','四川 绵阳','','','','3','嘿，嘛扎嘿','oLCgv0rH4XJP8zh7Wwnz6xu2zy1M','0','http://wx.qlogo.cn/mmopen/vi_32/RYYSnY4mhWsNUSia0PkzX7mwQeT0FiblNGcZoSY0xGkwYXsIpcUNOqv4x63474u5ZUQFZCu1pribCS8NwjHib2pibSg/132','0','','女','女','117.136.70.57','0','','','','1515827932','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('23','0','15908184689','1','15908184689','','1','1515831992','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6GDzk8uia5Vr7ibwBXVZyDmTp5qsPLib5zLcFIbJj1xd9l9yas8dncdZSricuwdbSy7vmGofmD8ZfIg/132','','dc01ad39f3c647f5e72c3016147ebd7c','1515831954','1','','风轻轻','','四川 成都','','','','3','风轻轻','oLCgv0nyuSRLz1RrgoYNLC4OxH60','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6GDzk8uia5Vr7ibwBXVZyDmTp5qsPLib5zLcFIbJj1xd9l9yas8dncdZSricuwdbSy7vmGofmD8ZfIg/132','0','','女','女','117.136.70.35','0','','','','1515831954','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('24','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTDpbCdjVNe6CiaQTmoPBzmc56iaKQGzpdvrrTjkmnYQTqxFTbYtn3ibg27AvvgqgtibvwIMcyT4n8pA/132','','e81f71907df4027e63012a079a9a0948','1515833934','1','','虹','','四川 绵阳','','','','3','虹','oLCgv0jMU73wd-yHPC1gOKBUZ6So','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTDpbCdjVNe6CiaQTmoPBzmc56iaKQGzpdvrrTjkmnYQTqxFTbYtn3ibg27AvvgqgtibvwIMcyT4n8pA/132','0','','女','女','117.136.70.48','0','','','','1515833934','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('25','0','18081036608','1','18081036608','','1','1515850685','http://wx.qlogo.cn/mmopen/vi_32/Mp7LOnopozCe7Up5Jab8Bm5mia22Viasan82IlrxpTXJUiaQYd2mSYSgs1Yv0oKFbjsEhkG3gvfdaayibfjsfjFJ6g/132','','682ce1dc8c302bad538c1ea6ab532131','1515850392','1','','史永梅 Melissa','','四川 成都','','','','3','史永梅 Melissa','oLCgv0oGIvQ2LHKfIoldRICchKKk','0','http://wx.qlogo.cn/mmopen/vi_32/Mp7LOnopozCe7Up5Jab8Bm5mia22Viasan82IlrxpTXJUiaQYd2mSYSgs1Yv0oKFbjsEhkG3gvfdaayibfjsfjFJ6g/132','0','','女','女','182.149.160.234','0','','','','1515850392','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('26','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/tlbrFvT1PkTYwu7V5kUzEkjOJMfQHHSGscNicVWvytkYkEkGmPVp3Yf8ssL0rsw02CYicENLDIXPAOiakSNT2Jfrw/132','','c3f5255b7050b824719ad825da6e401e','1516154416','1','','美克拉Bait','','广东 深圳','','','','3','美克拉Bait','oLCgv0vRTc4OoiXwQ0aXOGJU6iD0','0','http://wx.qlogo.cn/mmopen/vi_32/tlbrFvT1PkTYwu7V5kUzEkjOJMfQHHSGscNicVWvytkYkEkGmPVp3Yf8ssL0rsw02CYicENLDIXPAOiakSNT2Jfrw/132','0','','女','女','116.30.222.112','0','','','','1516154416','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('27','0','13618029227','1','13618029227','','1','1516344909','http://wx.qlogo.cn/mmopen/vi_32/UWpN1EIAJibicBcot7Wb69wnXMjhd5SiaXDlR7Rj3M8YvWKcIibAwvk5EOib0vT8R8JdE6lvCZ1JAOxpvJpO9GHEBjg/132','','67e9c40a4300a1234738177b04abbee8','1516344870','1','','Angela','','四川 成都','','','','3','Angela','oLCgv0jT2ItKM7C4v67AedqLyaEU','0','http://wx.qlogo.cn/mmopen/vi_32/UWpN1EIAJibicBcot7Wb69wnXMjhd5SiaXDlR7Rj3M8YvWKcIibAwvk5EOib0vT8R8JdE6lvCZ1JAOxpvJpO9GHEBjg/132','0','','女','女','117.136.63.176','0','','','','1516344870','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('28','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwI4IGxVZ258RgXUB4d6uOKmj2CfglvxQ1S0yeFXKRJ4kWN318VYy4rbnxjiafibOeUKboIOBcricdA/132','','e48a35e7d8407290bbf984d8b45ba798','1516435870','1','','林东炫15610083977','',' ','','','','3','林东炫15610083977','oLCgv0ru7GvsIsQuifWfiznafLYo','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwI4IGxVZ258RgXUB4d6uOKmj2CfglvxQ1S0yeFXKRJ4kWN318VYy4rbnxjiafibOeUKboIOBcricdA/132','0','','男','男','112.226.250.219','0','','','','1516435870','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member_copy` VALUES('29','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/iapvK7pd7fj41vjsMMmqycYRcd6ENPNEjq8RAzW2d64J3CLszNZB6JpoYDgbRocbslI4YX6XFfwzROJZnQtV3Aw/132','','2fc632f9c4ddd1279899f82f1cc2c729','1516515750','1','','媛媛','','四川 成都','','','','3','媛媛','oLCgv0ui5xbSD_g68wYjdujZxxoo','0','http://wx.qlogo.cn/mmopen/vi_32/iapvK7pd7fj41vjsMMmqycYRcd6ENPNEjq8RAzW2d64J3CLszNZB6JpoYDgbRocbslI4YX6XFfwzROJZnQtV3Aw/132','0','','女','女','119.6.107.88','0','','','','1516515750','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
--
-- 表的结构cn_msg
--

DROP TABLE IF EXISTS `cn_msg`;
CREATE TABLE `cn_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `z1` varchar(200) DEFAULT '',
  `z2` varchar(200) DEFAULT '',
  `z3` varchar(200) DEFAULT '',
  `z4` varchar(200) DEFAULT '',
  `z5` varchar(200) DEFAULT '',
  `z6` varchar(200) DEFAULT '',
  `z7` varchar(200) DEFAULT '',
  `z8` varchar(200) DEFAULT '',
  `z9` varchar(200) DEFAULT '',
  `z10` varchar(200) DEFAULT '',
  `content` varchar(2000) DEFAULT '',
  `addtime` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0',
  `ip` varchar(55) DEFAULT '',
  `Qcontent` varchar(1000) DEFAULT '',
  `Qtime` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_msg
--

--
-- 表的结构cn_msg2
--

DROP TABLE IF EXISTS `cn_msg2`;
CREATE TABLE `cn_msg2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `z1` varchar(200) DEFAULT '',
  `z2` varchar(200) DEFAULT '',
  `z3` varchar(200) DEFAULT '',
  `z4` varchar(200) DEFAULT '',
  `z5` varchar(200) DEFAULT '',
  `z6` varchar(200) DEFAULT '',
  `z7` varchar(200) DEFAULT '',
  `z8` varchar(200) DEFAULT '',
  `z9` varchar(200) DEFAULT '',
  `z10` varchar(200) DEFAULT '',
  `content` varchar(2000) DEFAULT '',
  `addtime` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0',
  `ip` varchar(55) DEFAULT '',
  `Qcontent` varchar(1000) DEFAULT '',
  `Qtime` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_msg2
--

--
-- 表的结构cn_msg3
--

DROP TABLE IF EXISTS `cn_msg3`;
CREATE TABLE `cn_msg3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `z1` varchar(200) DEFAULT '',
  `z2` varchar(200) DEFAULT '',
  `z3` varchar(200) DEFAULT '',
  `z4` varchar(200) DEFAULT '',
  `z5` varchar(200) DEFAULT '',
  `z6` varchar(200) DEFAULT '',
  `z7` varchar(200) DEFAULT '',
  `z8` varchar(200) DEFAULT '',
  `z9` varchar(200) DEFAULT '',
  `z10` varchar(200) DEFAULT '',
  `content` varchar(2000) DEFAULT '',
  `addtime` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0',
  `ip` varchar(55) DEFAULT '',
  `Qcontent` varchar(1000) DEFAULT '',
  `Qtime` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_msg3
--

--
-- 表的结构cn_order
--

DROP TABLE IF EXISTS `cn_order`;
CREATE TABLE `cn_order` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '分店ID',
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
  `cty` tinyint(1) DEFAULT '0' COMMENT '是否是后台录入',
  `ty` tinyint(1) DEFAULT '0' COMMENT '订单类型1购买产品或服务项目',
  `uid` bigint(11) DEFAULT '0' COMMENT '用户ID',
  `orderid` varchar(30) DEFAULT '' COMMENT '订单编号',
  `num` int(7) DEFAULT '0' COMMENT '订单累计产品或服务数量',
  `snum` int(7) DEFAULT '0' COMMENT '剩余次数 即未消费使用的次数',
  `money` double(10,2) DEFAULT '0.00' COMMENT '应支付金额',
  `yh_id` bigint(11) DEFAULT '0' COMMENT '优惠券编号',
  `yh_money` double(6,2) DEFAULT '0.00' COMMENT '优惠金额',
  `paymoney` double(10,2) DEFAULT '0.00' COMMENT '实际支付金额',
  `payjf` int(7) DEFAULT '0' COMMENT '抵扣积分',
  `jf` int(7) DEFAULT '0' COMMENT '购买获取积分值',
  `time` bigint(10) DEFAULT '0' COMMENT '下单时间',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否审核',
  `paytime` bigint(10) DEFAULT '0' COMMENT '支付时间',
  `pay_openid` varchar(100) DEFAULT '' COMMENT '支付微信openid 判断是否是自己支付的',
  `bz` varchar(800) DEFAULT '' COMMENT '订单备注',
  `gbz` varchar(500) DEFAULT '' COMMENT '管理员备注',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `del_time` bigint(10) DEFAULT '0' COMMENT '删除时间',
  `truename` varchar(30) DEFAULT '',
  `phone` varchar(30) DEFAULT '',
  `zt` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单记录表';

--
-- 转存表中的数据 cn_order
--

INSERT INTO `cn_order` VALUES('1','0','0','1','1','1-20171223064449','8','8','3104.00','0','0.00','3104.00','0','0','1514025889','1','0','','订单备注订单备注订单备注订单备注订单备注订单备注','','0','0','','','0');
INSERT INTO `cn_order` VALUES('2','0','0','1','1','1-20171224120745','2','2','776.00','1','50.00','726.00','0','0','1514045265','1','0','','订单备注 优惠50元','','0','0','','','0');
INSERT INTO `cn_order` VALUES('3','0','0','1','1','1-20180117024029','2','1','776.00','0','0.00','776.00','0','0','1516171229','1','1516171229','','购买2个产品测试','','0','0','管家','13594333241','0');
INSERT INTO `cn_order` VALUES('4','0','0','1','6','6-20180125102318','2','2','776.00','0','0.00','776.00','0','0','1516846998','1','0','','','','0','0','管家2','13594333242','0');
INSERT INTO `cn_order` VALUES('5','0','0','1','7','7-20180125104254','4','4','1552.00','0','0.00','1552.00','0','0','1516848174','1','0','','','','0','0','','18081029908','0');
INSERT INTO `cn_order` VALUES('6','0','0','1','7','7-20180125104549','20','20','7760.00','0','0.00','7760.00','0','0','1516848349','1','0','','','','0','0','','18081029908','0');
INSERT INTO `cn_order` VALUES('7','0','0','1','7','7-20180125104655','20','20','7760.00','0','0.00','7760.00','0','0','1516848415','1','0','','','','0','0','','18081029908','0');
INSERT INTO `cn_order` VALUES('8','0','0','1','7','7-20180125105352','21','18','8148.00','0','0.00','8148.00','0','0','1516848832','1','1516859904','','','','0','0','','18081029908','0');
INSERT INTO `cn_order` VALUES('9','0','0','1','7','7-20180129024936','21','21','8148.00','0','0.00','8148.00','0','0','1517208576','1','1517219649','','','','0','0','','18081029908','0');
--
-- 表的结构cn_order_goods
--

DROP TABLE IF EXISTS `cn_order_goods`;
CREATE TABLE `cn_order_goods` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
  `ty` tinyint(1) DEFAULT '1' COMMENT '订单类型 1服务 2预约技师',
  `uid` bigint(11) DEFAULT '0' COMMENT '用户ID',
  `orderid` varchar(30) DEFAULT '' COMMENT '订单编号ID',
  `pid` bigint(11) DEFAULT '0' COMMENT '产品ID',
  `price` double(10,2) DEFAULT '0.00' COMMENT '产品价格',
  `num` int(5) unsigned DEFAULT '0' COMMENT '购买次数',
  `snum` int(5) DEFAULT '0' COMMENT '剩余使用次数',
  `cntitle` varchar(100) DEFAULT '' COMMENT '产品名称',
  `img` varchar(200) DEFAULT '' COMMENT '产品图片',
  `fid` int(6) DEFAULT '0' COMMENT '产品分类ID',
  `fidpath` varchar(100) DEFAULT '' COMMENT '产品层级树',
  `time` bigint(10) DEFAULT '0' COMMENT '写入时间',
  `zt` tinyint(1) DEFAULT '0' COMMENT '订单状态',
  `paytime` bigint(10) DEFAULT '0' COMMENT '支付时间',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单下单明细表';

--
-- 转存表中的数据 cn_order_goods
--

INSERT INTO `cn_order_goods` VALUES('1','0','1','1','1-20171223064449','10','388.00','8','8','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1514025889','0','0','0');
INSERT INTO `cn_order_goods` VALUES('2','0','1','1','1-20171224120745','10','388.00','2','2','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1514045265','0','0','0');
INSERT INTO `cn_order_goods` VALUES('3','0','1','1','1-20180117024029','10','388.00','1','0','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1516171229','0','1516171229','0');
INSERT INTO `cn_order_goods` VALUES('4','0','1','1','1-20180117024029','13','388.00','1','1','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1516171229','0','1516171229','0');
INSERT INTO `cn_order_goods` VALUES('5','0','1','6','6-20180125102318','13','388.00','2','2','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1516846998','0','0','0');
INSERT INTO `cn_order_goods` VALUES('6','0','1','7','7-20180125104254','10','388.00','4','4','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1516848174','0','0','0');
INSERT INTO `cn_order_goods` VALUES('7','0','1','7','7-20180125104549','10','388.00','10','10','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1516848349','0','0','0');
INSERT INTO `cn_order_goods` VALUES('8','0','1','7','7-20180125104549','13','388.00','10','10','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1516848349','0','0','0');
INSERT INTO `cn_order_goods` VALUES('9','0','1','7','7-20180125104655','10','388.00','10','10','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1516848415','0','0','0');
INSERT INTO `cn_order_goods` VALUES('10','0','1','7','7-20180125104655','13','388.00','10','10','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1516848415','0','0','0');
INSERT INTO `cn_order_goods` VALUES('11','0','1','7','7-20180125105352','10','388.00','10','10','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1516848832','0','1516859904','0');
INSERT INTO `cn_order_goods` VALUES('12','0','1','7','7-20180125105352','13','388.00','11','8','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1516848832','0','1516859904','0');
INSERT INTO `cn_order_goods` VALUES('13','0','1','7','7-20180129024936','10','388.00','10','10','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1517208576','0','1517219649','0');
INSERT INTO `cn_order_goods` VALUES('14','0','1','7','7-20180129024936','13','388.00','11','11','精油推背2','/Comm/images/img_6.png','16',',0,13,16,16','1517208576','0','1517219649','0');
--
-- 表的结构cn_order_use
--

DROP TABLE IF EXISTS `cn_order_use`;
CREATE TABLE `cn_order_use` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
  `uid` bigint(11) DEFAULT '0' COMMENT '用户ID',
  `orderid` varchar(30) DEFAULT '' COMMENT '订单编号ID',
  `yyid` bigint(12) DEFAULT '0' COMMENT '预约ID 0表示未预约',
  `pid` bigint(10) DEFAULT '0' COMMENT '产品ID',
  `truename` varchar(100) DEFAULT '' COMMENT '使用者姓名',
  `num` int(5) DEFAULT '0' COMMENT '使用次数',
  `yytime` datetime DEFAULT NULL COMMENT '预约时间',
  `time` bigint(10) DEFAULT '0' COMMENT '提交时间',
  `audit` tinyint(1) DEFAULT '1',
  `del` tinyint(1) DEFAULT '0',
  `bz` varchar(500) DEFAULT '' COMMENT '使用备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单消费使用明细表';

--
-- 转存表中的数据 cn_order_use
--

--
-- 表的结构cn_order_yuyue
--

DROP TABLE IF EXISTS `cn_order_yuyue`;
CREATE TABLE `cn_order_yuyue` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
  `uid` bigint(11) DEFAULT '0' COMMENT '用户ID',
  `orderid` varchar(30) DEFAULT '' COMMENT '订单编号ID',
  `pid` bigint(10) DEFAULT '0' COMMENT '预约产品ID',
  `truename` varchar(100) DEFAULT '' COMMENT '使用者姓名',
  `num` int(5) DEFAULT '0' COMMENT '预约使用次数',
  `yytime` bigint(10) DEFAULT '0' COMMENT '预约时间',
  `yy_teacher_id` int(8) DEFAULT '0',
  `yy_teacher_name` varchar(30) DEFAULT '' COMMENT '预约技师姓名',
  `time` bigint(10) DEFAULT '0' COMMENT '提交时间',
  `audit` tinyint(1) DEFAULT '0' COMMENT '是否生效',
  `del` tinyint(1) DEFAULT '0',
  `bz` varchar(500) DEFAULT '' COMMENT '预约备注',
  `cntitle` varchar(100) DEFAULT '' COMMENT '预约名称',
  `phone` varchar(20) DEFAULT '' COMMENT '手机号',
  `usetime` bigint(10) DEFAULT '0' COMMENT '使用日期',
  `yytimeint` int(3) DEFAULT '0' COMMENT '预约开始时间 比如1表示00：30  18表示09:00',
  `timeint` int(3) DEFAULT '0' COMMENT '预约服务时间比如0.5小时 1小时 1.5小时',
  `yytimeint2` int(3) DEFAULT '0' COMMENT '预约截止时间段 比如20表示10点 21表示10:30',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单购买产品预约表和预约技师记录表';

--
-- 转存表中的数据 cn_order_yuyue
--

INSERT INTO `cn_order_yuyue` VALUES('1','0','1','1-20180117024029','13','管家','1','1516327200','4','梅老师','1516262489','-1','1','','精油推背2','13594333241','0','21','1','22');
INSERT INTO `cn_order_yuyue` VALUES('2','0','1','1-20180117024029','13','管家','1','1516327200','4','梅老师','1516265700','0','0','','精油推背2','13594333241','0','21','1','22');
INSERT INTO `cn_order_yuyue` VALUES('4','0','1','1-20180117024029','10','管家','1','1516345200','12','王老师','1516264867','1','0','','精油推背','13594333241','1516934225','31','5','36');
INSERT INTO `cn_order_yuyue` VALUES('5','0','7','7-20180125105352','13','','1','1517014800','120','','1516935624','0','0','','精油推背2','18081029908','0','19','4','23');
INSERT INTO `cn_order_yuyue` VALUES('6','0','7','7-20180125105352','13','','1','1517014800','14','刘小智','1516932207','0','0','','精油推背2','18081029908','0','18','4','22');
INSERT INTO `cn_order_yuyue` VALUES('7','0','7','7-20180125105352','13','','1','1517014800','14','刘小智','1516932735','1','0','','精油推背2','18081029908','1516936488','18','4','22');
INSERT INTO `cn_order_yuyue` VALUES('8','0','7','7-20180125105352','13','','1','1517014800','14','刘小智','1516932820','1','0','','精油推背2','18081029908','1516936488','18','4','22');
INSERT INTO `cn_order_yuyue` VALUES('9','0','7','7-20180125105352','10','','1','1517014800','90','','1516936862','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('10','0','7','7-20180125105352','10','','1','1517014800','90','','1516936904','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('11','0','1','1-20180117024029','13','管家','1','1517295600','4','梅老师','1517222472','0','0','','精油推背2','13594333241','0','31','4','35');
INSERT INTO `cn_order_yuyue` VALUES('12','0','1','1-20180117024029','13','管家','1','1517385600','4','梅老师','1517222308','-1','0','','精油推背2','13594333241','0','32','4','36');
INSERT INTO `cn_order_yuyue` VALUES('13','0','7','7-20180125105352','10','','1','1517274000','14','刘小智','1517208670','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('14','0','7','7-20180125105352','10','','1','1517274000','4','梅老师','1517208724','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('15','0','7','7-20180125105352','10','','1','1517360400','4','梅老师','1517209753','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('16','0','7','7-20180125105352','10','','1','1517360400','12','王老师','1517210089','0','0','','精油推背','18081029908','0','18','3','21');
INSERT INTO `cn_order_yuyue` VALUES('17','0','7','7-20180125105352','10','','1','1517360400','14','刘小智','1517206602','0','0','','精油推背','18081029908','0','18','3','21');
--
-- 表的结构cn_rsms
--

DROP TABLE IF EXISTS `cn_rsms`;
CREATE TABLE `cn_rsms` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `x1` varchar(50) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `ip` varchar(50) DEFAULT '',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `rs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_rsms
--

INSERT INTO `cn_rsms` VALUES('1','1','13594333241','00476','1513920848','127.0.0.1','0','');
INSERT INTO `cn_rsms` VALUES('2','1','13594333241','16611','1513920874','127.0.0.1','0','0');
INSERT INTO `cn_rsms` VALUES('3','1','13594333241','48165','1513920875','127.0.0.1','0','0');
INSERT INTO `cn_rsms` VALUES('4','1','13594333241','94153','1513920877','127.0.0.1','1','0');
INSERT INTO `cn_rsms` VALUES('5','1','13594333241','02103','1513921432','127.0.0.1','1','0');
INSERT INTO `cn_rsms` VALUES('6','1','13594333241','97531','1515135143','127.0.0.1','1','1');
INSERT INTO `cn_rsms` VALUES('7','27','13618029227','98232','1516344882','117.136.63.176','0','1');
INSERT INTO `cn_rsms` VALUES('8','27','13618029227','32626','1516344883','117.136.63.176','1','1');
--
-- 表的结构cn_user
--

DROP TABLE IF EXISTS `cn_user`;
CREATE TABLE `cn_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0' COMMENT '只有微信端才会涉及到会员',
  `wrnd` varchar(100) NOT NULL DEFAULT '' COMMENT 'cookie name',
  `cook` varchar(200) NOT NULL DEFAULT '' COMMENT 'cook值',
  `ip` varchar(30) DEFAULT '',
  `url` varchar(200) DEFAULT '' COMMENT '第一次访问的页面',
  `date` date NOT NULL COMMENT '日期',
  `time` bigint(10) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '1' COMMENT '有效用户 0表示黑名单用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=674 DEFAULT CHARSET=utf8 COMMENT='访问者记录表';

--
-- 转存表中的数据 cn_user
--

INSERT INTO `cn_user` VALUES('1','0','4e105fb97ef3113f79858c0b31f3273f','de1dc989e0dbc409bebf25ccf26a3867e151c8fc','127.0.0.1','/comm/images/img_1.jpg','2017-12-19','1513646529','1');
INSERT INTO `cn_user` VALUES('2','0','4e105fb97ef3113f79858c0b31f3273f','de1dc989e0dbc409bebf25ccf26a3867e151c8fc','127.0.0.1','/comm/images/logo.png','2017-12-19','1513646529','1');
INSERT INTO `cn_user` VALUES('3','0','4e105fb97ef3113f79858c0b31f3273f','de1dc989e0dbc409bebf25ccf26a3867e151c8fc','127.0.0.1','/comm/images/logo2.png','2017-12-19','1513646529','1');
INSERT INTO `cn_user` VALUES('4','0','4e105fb97ef3113f79858c0b31f3273f','de1dc989e0dbc409bebf25ccf26a3867e151c8fc','127.0.0.1','/favicon.ico','2017-12-19','1513646529','1');
INSERT INTO `cn_user` VALUES('5','0','4e105fb97ef3113f79858c0b31f3273f','de1dc989e0dbc409bebf25ccf26a3867e151c8fc','127.0.0.1','/whome/index/logs','2017-12-19','1513646529','1');
INSERT INTO `cn_user` VALUES('6','0','9c462674ab79e4a5f7b9deb6d0081e24','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','/','2017-12-22','1513914624','1');
INSERT INTO `cn_user` VALUES('7','0','9c462674ab79e4a5f7b9deb6d0081e24','112e8aab2e759f4290ebac28f7e93903c868c9a5','127.0.0.1','/','2017-12-22','1513914624','1');
INSERT INTO `cn_user` VALUES('8','1','ba87ffb54a7110b6d015fbb85afe3c79','8be2200028030bbde5d6c73d3255ec5524b779d6','127.0.0.1','/','2017-12-23','1514013063','1');
INSERT INTO `cn_user` VALUES('9','0','ba87ffb54a7110b6d015fbb85afe3c79','26c3ea3a9bed56f86154253bece442aca8ac7643','127.0.0.1','/index.php','2017-12-23','1514013991','1');
INSERT INTO `cn_user` VALUES('10','0','ba87ffb54a7110b6d015fbb85afe3c79','a60bdcdc16e2f6972d7c5ef6857f8621ac299d3f','127.0.0.1','/index.php','2017-12-23','1514018890','1');
INSERT INTO `cn_user` VALUES('11','0','ba87ffb54a7110b6d015fbb85afe3c79','4c9a63fbdbe2db4f195ecfb27271cf3d2e160931','127.0.0.1','/index.php','2017-12-23','1514023850','1');
INSERT INTO `cn_user` VALUES('12','0','ba87ffb54a7110b6d015fbb85afe3c79','6125f6851d0786444fafa8d904622d7ce3b879d3','127.0.0.1','/index.php','2017-12-23','1514042654','1');
INSERT INTO `cn_user` VALUES('13','0','ba87ffb54a7110b6d015fbb85afe3c79','d23dd7e38084861ecf28e1b8ffdeb214afe41604','127.0.0.1','/index.php','2017-12-23','1514044311','1');
INSERT INTO `cn_user` VALUES('14','0','ba87ffb54a7110b6d015fbb85afe3c79','3978fec6f57a7402f132b7e56267c5858d29451f','127.0.0.1','/index.php','2017-12-24','1514049699','1');
INSERT INTO `cn_user` VALUES('15','0','408b39e454ca6e750d714c6d5eff36c7','1db30dcae3c5b2f5a1d6dd73c736856ed97a85cc','127.0.0.1','/favicon.ico','2017-12-24','1514102245','1');
INSERT INTO `cn_user` VALUES('16','0','408b39e454ca6e750d714c6d5eff36c7','cf1ae0201b2bd8c50a76387cd54a8a4630746d8c','127.0.0.1','/favicon.ico','2017-12-24','1514102857','1');
INSERT INTO `cn_user` VALUES('17','0','408b39e454ca6e750d714c6d5eff36c7','ba900707a8093c5e11837c86cc71fde1edef5084','127.0.0.1','/?v=7','2017-12-24','1514102863','1');
INSERT INTO `cn_user` VALUES('18','0','408b39e454ca6e750d714c6d5eff36c7','7c335517f8e8315b43bbb12c6d1304e417e3691a','127.0.0.1','/index.php','2017-12-24','1514106206','1');
INSERT INTO `cn_user` VALUES('19','0','74bcc8c2afc1c2a2d734cb4749702c41','268e7bba1151a8d46f38b6680b0659be41515421','127.0.0.1','/','2017-12-25','1514163525','1');
INSERT INTO `cn_user` VALUES('20','0','da78ea63dd5b3ff3de2fb2f9325f2751','8e4d9eab6c43e519b90896c3f4124f89c81308a0','106.11.226.119','/','2017-12-26','1514246769','1');
INSERT INTO `cn_user` VALUES('21','0','da78ea63dd5b3ff3de2fb2f9325f2751','0c3f12e880901756a8783a2c4412c37961491313','140.205.225.185','/index.php?m=member&c=index&a=register&siteid=1','2017-12-26','1514288838','1');
INSERT INTO `cn_user` VALUES('22','0','da78ea63dd5b3ff3de2fb2f9325f2751','d585ee7750c8d43e26ed8426269866af2af8662b','140.205.225.185','/index.php?m=wap&a=index&siteid=1','2017-12-26','1514289140','1');
INSERT INTO `cn_user` VALUES('23','0','ae2e222be4a6bc7e66f69ec350d24410','8d7aaef9a15571c95c29253de2e134ef230c94fa','106.11.227.136','/','2017-12-27','1514332064','1');
INSERT INTO `cn_user` VALUES('24','0','d067ecaf378dce882957205a69d2c04e','b473cba86606c934346f1a96edcc861353c5ebb8','106.11.242.38','/','2017-12-28','1514419197','1');
INSERT INTO `cn_user` VALUES('25','0','d067ecaf378dce882957205a69d2c04e','15136bd4285ca7c058d447aa624f6d5fe4195bf4','140.205.225.187','/index.php?m=member&c=index&a=register&siteid=1','2017-12-28','1514436858','1');
INSERT INTO `cn_user` VALUES('26','0','d067ecaf378dce882957205a69d2c04e','ec5033553b61c159bab1e4be1293b65005bbf28c','140.205.225.187','/index.php?m=wap&a=index&siteid=1','2017-12-28','1514436860','1');
INSERT INTO `cn_user` VALUES('27','0','ff8ecbe828351518371df4f960a50eed','54f3c0cc99f00e5ecb5a88fc0eb437e96811c2a1','106.11.227.77','/','2017-12-29','1514505891','1');
INSERT INTO `cn_user` VALUES('28','0','ff8ecbe828351518371df4f960a50eed','4ed516df677879104c25bf892cc4d40b3a4cdb33','106.11.230.133','/index.php?m=member&c=index&a=register&siteid=1','2017-12-29','1514549123','1');
INSERT INTO `cn_user` VALUES('29','0','ff8ecbe828351518371df4f960a50eed','0065eb10192472571fc7c54f3475738a26fdb4e3','106.11.231.100','/index.php?m=wap&a=index&siteid=1','2017-12-29','1514549123','1');
INSERT INTO `cn_user` VALUES('30','0','c969bbc1cfb7203616d1e9ab4088267c','e87ab9c9c2935bf7156d8e50d4348f48820f0249','106.11.226.109','/','2017-12-30','1514593996','1');
INSERT INTO `cn_user` VALUES('31','0','6b1963b61c89e55c6147ea09bd45c533','62176297596a20bbf463c3d66882249f835c003b','106.11.242.240','/','2017-12-31','1514680004','1');
INSERT INTO `cn_user` VALUES('32','0','05da7a37bc5173f1fe69250987e10a28','954445c246be7b2130e32e08b5f861ec343bb3a8','106.11.225.74','/','2018-01-01','1514767525','1');
INSERT INTO `cn_user` VALUES('33','0','40a8216490419b047831bb331c25edd4','12c3246c66c2aa9d62914b7483ac3480e1409ff3','106.11.226.84','/','2018-01-02','1514853479','1');
INSERT INTO `cn_user` VALUES('34','0','40a8216490419b047831bb331c25edd4','c18d459d4943298d1535603dbc886b43d8ae8744','118.113.40.159','/favicon.ico','2018-01-02','1514882397','1');
INSERT INTO `cn_user` VALUES('35','0','40a8216490419b047831bb331c25edd4','98a60b35272178c491d100ce70971553dfa76aed','118.113.40.159','/favicon.ico','2018-01-02','1514882420','1');
INSERT INTO `cn_user` VALUES('36','0','40a8216490419b047831bb331c25edd4','3ac0cf86d2a6094ad624513a8dd4787634d2323a','118.113.40.159','/index.php/index/api/paymoney','2018-01-02','1514893413','1');
INSERT INTO `cn_user` VALUES('37','0','b4473f71c8dee05c2252eadf301d4d51','649e3874f841e61d5d0a58c39f367f9df3d50cb1','106.11.225.211','/','2018-01-03','1514939440','1');
INSERT INTO `cn_user` VALUES('38','0','b4473f71c8dee05c2252eadf301d4d51','4818e3af4b3e6a3d34aa2f2efccf2b45905ddbd7','118.113.40.159','/favicon.ico','2018-01-03','1514941003','1');
INSERT INTO `cn_user` VALUES('39','0','b4473f71c8dee05c2252eadf301d4d51','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','/index.php/index/api/paymoney','2018-01-03','1514941533','1');
INSERT INTO `cn_user` VALUES('40','0','b4473f71c8dee05c2252eadf301d4d51','f52da0dafa10e38535d0f45a4244a9ab81bb0f66','120.204.17.67','/index.php/index/api/wxpayjsapi','2018-01-03','1514943411','1');
INSERT INTO `cn_user` VALUES('41','0','b4473f71c8dee05c2252eadf301d4d51','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','/index.php/index/api/wxpayjsapi','2018-01-03','1514948249','1');
INSERT INTO `cn_user` VALUES('42','0','b4473f71c8dee05c2252eadf301d4d51','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','/','2018-01-03','1514949205','1');
INSERT INTO `cn_user` VALUES('43','0','b4473f71c8dee05c2252eadf301d4d51','69e35c059ed776d178113503b4f66e9f8f9e8667','140.207.54.75','/index/api/notify/id/1','2018-01-03','1514949781','1');
INSERT INTO `cn_user` VALUES('44','0','b4473f71c8dee05c2252eadf301d4d51','7488a3a4cf796f541df9b7a794e48cfc33a8a22f','140.207.54.76','/index/api/notify/id/1','2018-01-03','1514949798','1');
INSERT INTO `cn_user` VALUES('45','0','b4473f71c8dee05c2252eadf301d4d51','7ec65c6ebc309bed9001fb9788ef31877b091ea2','140.207.54.74','/index/api/notify/id/1','2018-01-03','1514949815','1');
INSERT INTO `cn_user` VALUES('46','0','b4473f71c8dee05c2252eadf301d4d51','3ea3a092a2749f468cd228f3e162d2532bebd965','101.226.103.69','/index/api/notify/id/1','2018-01-03','1514949848','1');
INSERT INTO `cn_user` VALUES('47','0','b4473f71c8dee05c2252eadf301d4d51','b81f2355fb4fa4b3b030fda6e7102cc586021d46','58.251.80.45','/index/api/notify/id/1','2018-01-03','1514950030','1');
INSERT INTO `cn_user` VALUES('48','0','b4473f71c8dee05c2252eadf301d4d51','1956abb7e0f74a7736af8cc2dc47a7257578140b','101.226.225.85','/api/notify/id/1','2018-01-03','1514950092','1');
INSERT INTO `cn_user` VALUES('49','0','b4473f71c8dee05c2252eadf301d4d51','9b090966d62cd31f88fdc593f687283db050c04b','140.207.54.74','/api/notify/id/1','2018-01-03','1514950258','1');
INSERT INTO `cn_user` VALUES('50','0','b4473f71c8dee05c2252eadf301d4d51','c71b10b33f2f9cf303e3d32ba63ee9a247340073','183.3.234.51','/api/notify/id/1','2018-01-03','1514950268','1');
INSERT INTO `cn_user` VALUES('51','0','b4473f71c8dee05c2252eadf301d4d51','ee18c1d052ebd76b8042b66d8ed930dbd95bbe0e','140.207.54.74','/api/notify/id/1','2018-01-03','1514950285','1');
INSERT INTO `cn_user` VALUES('52','0','b4473f71c8dee05c2252eadf301d4d51','421bce42c1c141caf8b6ad173acad84be8fec196','101.226.103.62','/api/notify/id/1','2018-01-03','1514950317','1');
INSERT INTO `cn_user` VALUES('53','0','b4473f71c8dee05c2252eadf301d4d51','a7c184ee8e564278ee91a9e7101faa3692b7ec25','140.207.54.76','/api/notify/id/1','2018-01-03','1514950500','1');
INSERT INTO `cn_user` VALUES('54','0','b4473f71c8dee05c2252eadf301d4d51','106190c97c1f44ba695065f7e4b0db07d005d1a0','101.226.33.240','/api/notify/id/1','2018-01-03','1514950649','1');
INSERT INTO `cn_user` VALUES('55','6','b4473f71c8dee05c2252eadf301d4d51','bf074b1ca6010d71582df51170d820439c3eeeb3','140.207.54.74','/index/api/notify/id/1','2018-01-03','1514951831','1');
INSERT INTO `cn_user` VALUES('56','0','b4473f71c8dee05c2252eadf301d4d51','697096b0fb3682809d1ab17d1ee1c2df035b5f7d','101.226.103.69','/api/notify/id/1','2018-01-03','1514952302','1');
INSERT INTO `cn_user` VALUES('57','0','b4473f71c8dee05c2252eadf301d4d51','b59ef0797a2cdf1d468eac70283d23ce9523b0dc','140.207.54.74','/index/api/notify/id/1','2018-01-03','1514953633','1');
INSERT INTO `cn_user` VALUES('58','0','b4473f71c8dee05c2252eadf301d4d51','c8cca4faa0245159ff756cada27484e1aa9a5176','140.207.54.75','/api/notify/id/1','2018-01-03','1514954104','1');
INSERT INTO `cn_user` VALUES('59','0','b4473f71c8dee05c2252eadf301d4d51','ba31a2d1f5f91f6e4c72a13a105ace48b2e4c1e3','183.192.201.97','/stjbhl','2018-01-03','1514954281','1');
INSERT INTO `cn_user` VALUES('60','0','b4473f71c8dee05c2252eadf301d4d51','f2f884be8912cdb4dbe77d9302ec1c14dae542f8','120.204.17.73','/stjbhl/10.html','2018-01-03','1514954283','1');
INSERT INTO `cn_user` VALUES('61','0','b4473f71c8dee05c2252eadf301d4d51','0680f49a9ed90e0005b9c58e844f8fdbcf26d6da','183.61.51.57','/api/wxpayjsapi','2018-01-03','1514954520','1');
INSERT INTO `cn_user` VALUES('62','0','b4473f71c8dee05c2252eadf301d4d51','aea4eac8061c21092e76a4a20fb96576ce9783b5','140.207.54.74','/index/api/notify/id/1','2018-01-03','1514955436','1');
INSERT INTO `cn_user` VALUES('63','0','b4473f71c8dee05c2252eadf301d4d51','ba8ca50151656139a814e9aaf0661b1e300e1490','101.226.103.69','/api/notify/id/1','2018-01-03','1514955906','1');
INSERT INTO `cn_user` VALUES('64','0','b4473f71c8dee05c2252eadf301d4d51','ae24ef74db42f323520c2e81cd65f866740a2275','140.207.54.74','/index/api/notify/id/1','2018-01-03','1514957238','1');
INSERT INTO `cn_user` VALUES('65','0','b4473f71c8dee05c2252eadf301d4d51','1fc27001810298995e7aef5898ae7c9a821bdeab','140.207.54.76','/api/notify/id/1','2018-01-03','1514957707','1');
INSERT INTO `cn_user` VALUES('66','0','b4473f71c8dee05c2252eadf301d4d51','caf316a7a3adfa3f81fe2130ad482f0c66e84fc2','120.204.17.68','/index.php/index/api/wxpayqrcode','2018-01-03','1514958412','1');
INSERT INTO `cn_user` VALUES('67','0','b4473f71c8dee05c2252eadf301d4d51','b53a6a5061d0c11593399d2d32d71e4ce75c12f9','120.204.17.67','/index.php/index/api/wxpayqrcode/id/3','2018-01-03','1514958477','1');
INSERT INTO `cn_user` VALUES('68','0','b4473f71c8dee05c2252eadf301d4d51','59a4a1f91e1e9ed3a4fe2ad36ce366b9b8f15741','61.151.179.84','/index.php/index/api/wxpayqrcode/id/3?orderid=6-20180103123807','2018-01-03','1514958477','1');
INSERT INTO `cn_user` VALUES('69','0','b4473f71c8dee05c2252eadf301d4d51','a16f1e83c5f64f0c5bd8773154502a2ab7e13a70','120.204.17.67','/index.php/index/api/wxpayqrcode/id/3?id=6-20180103123807','2018-01-03','1514958691','1');
INSERT INTO `cn_user` VALUES('70','0','b4473f71c8dee05c2252eadf301d4d51','68382b1e3117d0ebb48c947f0aa3ff5744b900a9','120.204.17.68','/index.php/index/api/qrcode/id/6-20180103123807','2018-01-03','1514959830','1');
INSERT INTO `cn_user` VALUES('71','0','b4473f71c8dee05c2252eadf301d4d51','4d4cf18499f69cd474a3f6e342a18bd18e9b2b15','118.113.40.159','/index.php/index/api/wxpayqrcode/id/6-20180103123807','2018-01-03','1514959852','1');
INSERT INTO `cn_user` VALUES('72','0','b4473f71c8dee05c2252eadf301d4d51','6d698bd37d71b5021213022015c4bb8cd14833b3','120.204.17.68','/index.php/index/api/wxpayqrcode/id/6-20180103123807','2018-01-03','1514960203','1');
INSERT INTO `cn_user` VALUES('73','0','b4473f71c8dee05c2252eadf301d4d51','1e2ee73836e62a3bf64f7b079f0f3984444b1e27','101.226.103.62','/index/api/notify/id/1','2018-01-03','1514960840','1');
INSERT INTO `cn_user` VALUES('74','0','b4473f71c8dee05c2252eadf301d4d51','30f48ee7b16c401deecb0b17a3c236539264fe47','140.207.54.74','/index/index/notify/id/6-20180103123809','2018-01-03','1514961188','1');
INSERT INTO `cn_user` VALUES('75','0','b4473f71c8dee05c2252eadf301d4d51','117c65710f5c03cc7064bcbf21565ce2fb5e356d','58.251.80.52','/index/index/notify/id/6-20180103123809','2018-01-03','1514961203','1');
INSERT INTO `cn_user` VALUES('76','0','b4473f71c8dee05c2252eadf301d4d51','a2814572aca2e5d444a536aec01dd1762c93e77d','183.3.234.51','/index/index/notify/id/6-20180103123809','2018-01-03','1514961219','1');
INSERT INTO `cn_user` VALUES('77','0','b4473f71c8dee05c2252eadf301d4d51','844bf931b7a9d7fb6a0a6d20d9fa80a5c39f8d61','140.207.54.74','/index/index/notify/id/6-20180103123809','2018-01-03','1514961251','1');
INSERT INTO `cn_user` VALUES('78','0','b4473f71c8dee05c2252eadf301d4d51','9a692603c21200d5e1d734382c3b270e20ef0c38','58.251.80.59','/api/notify/id/1','2018-01-03','1514961309','1');
INSERT INTO `cn_user` VALUES('79','0','b4473f71c8dee05c2252eadf301d4d51','ba40060d310c0707dd2b85cfaeb1b8fd667835ff','58.251.80.59','/index/index/notify/id/6-20180103123809','2018-01-03','1514961433','1');
INSERT INTO `cn_user` VALUES('80','0','b4473f71c8dee05c2252eadf301d4d51','02c2caa29c020f006ca67b7f5484ae6a87838c57','140.207.54.76','/index/index/notify/id/6-20180103123802','2018-01-03','1514961487','1');
INSERT INTO `cn_user` VALUES('81','0','b4473f71c8dee05c2252eadf301d4d51','2783c00d2621701d902a0be3f037307692ade741','101.226.103.63','/index/index/notify/id/6-20180103123802','2018-01-03','1514961498','1');
INSERT INTO `cn_user` VALUES('82','0','b4473f71c8dee05c2252eadf301d4d51','abfde885a8d49b859f2e75bb3c0ec2e3418679db','58.251.80.56','/index/index/notify/id/6-20180103123802','2018-01-03','1514961515','1');
INSERT INTO `cn_user` VALUES('83','0','b4473f71c8dee05c2252eadf301d4d51','8701d6abcafd254b849cf13cb8e14d76fe2bc12b','183.3.234.51','/index/index/notify/id/6-20180103123802','2018-01-03','1514961547','1');
INSERT INTO `cn_user` VALUES('84','0','b4473f71c8dee05c2252eadf301d4d51','fcfe9e207a7712384b04c3514bea4bb21986c934','183.3.234.61','/api/notify/id/6-20180103123803','2018-01-03','1514961600','1');
INSERT INTO `cn_user` VALUES('85','0','b4473f71c8dee05c2252eadf301d4d51','fa74a56d2a200e4903c7c0d72ecee0b1bec79917','101.226.103.62','/api/notify/id/6-20180103123803','2018-01-03','1514961610','1');
INSERT INTO `cn_user` VALUES('86','0','b4473f71c8dee05c2252eadf301d4d51','a0a0c1931b7a8280d241914a692ca1962a525083','183.3.234.46','/api/notify/id/6-20180103123803','2018-01-03','1514961627','1');
INSERT INTO `cn_user` VALUES('87','0','b4473f71c8dee05c2252eadf301d4d51','a14f5ffea98f19e0be6ad928fa72b61e9162b1a7','101.226.103.69','/api/notify/id/6-20180103123803','2018-01-03','1514961659','1');
INSERT INTO `cn_user` VALUES('88','0','b4473f71c8dee05c2252eadf301d4d51','573637d50695d1ecd1f0e92353c98ac332f03d85','183.3.234.51','/index/index/notify/id/6-20180103123802','2018-01-03','1514961729','1');
INSERT INTO `cn_user` VALUES('89','0','b4473f71c8dee05c2252eadf301d4d51','e0977519dada05edf0789fea7a4a5ead231baad8','101.226.103.69','/api/notify/id/6-20180103123803','2018-01-03','1514961841','1');
INSERT INTO `cn_user` VALUES('90','0','b4473f71c8dee05c2252eadf301d4d51','f9e082eb64d3f5110c69b869d80ca63caf92df6a','101.226.33.239','/?wrnd=qm','2018-01-03','1514962143','1');
INSERT INTO `cn_user` VALUES('91','0','b4473f71c8dee05c2252eadf301d4d51','8753510567327b0387a15f09c75bad81be129a46','61.151.178.166','/hit/?id=10','2018-01-03','1514962158','1');
INSERT INTO `cn_user` VALUES('92','0','b4473f71c8dee05c2252eadf301d4d51','d53082b0f97221f198e1c29fe389b4e12834e053','140.207.54.76','/index/index/notify/id/6-20180103123809','2018-01-03','1514963235','1');
INSERT INTO `cn_user` VALUES('93','0','b4473f71c8dee05c2252eadf301d4d51','3fadffa3df734ef9b9107f24c481c61e7011e8cd','101.226.103.69','/index/index/notify/id/6-20180103123802','2018-01-03','1514963532','1');
INSERT INTO `cn_user` VALUES('94','0','b4473f71c8dee05c2252eadf301d4d51','57bb787fcd90297ae9055c229d265cedf9fc0866','140.207.54.74','/api/notify/id/6-20180103123803','2018-01-03','1514963644','1');
INSERT INTO `cn_user` VALUES('95','0','b4473f71c8dee05c2252eadf301d4d51','1961f65853277a9e26a9bf5cf33f1cab4470a912','140.207.54.76','/index/index/notify/id/6-20180103123809','2018-01-03','1514965037','1');
INSERT INTO `cn_user` VALUES('96','0','b4473f71c8dee05c2252eadf301d4d51','7e26e45fef07ab5b783d355d13336aaf8594f6d2','58.251.80.44','/index/index/notify/id/6-20180103123802','2018-01-03','1514965334','1');
INSERT INTO `cn_user` VALUES('97','0','b4473f71c8dee05c2252eadf301d4d51','b10d4d768dab80cc7ad7a23fb4b3f39cadc14069','183.3.234.51','/api/notify/id/6-20180103123803','2018-01-03','1514965446','1');
INSERT INTO `cn_user` VALUES('98','0','b4473f71c8dee05c2252eadf301d4d51','929c5cc8fd3c82fca1e72c0fd7a2a625e9df26fa','140.207.54.75','/index/index/notify/id/6-20180103123809','2018-01-03','1514966840','1');
INSERT INTO `cn_user` VALUES('99','0','b4473f71c8dee05c2252eadf301d4d51','9a1a476827210f7c7852c9ddabdd7f1b5c3a7c25','140.207.54.74','/index/index/notify/id/6-20180103123802','2018-01-03','1514967136','1');
INSERT INTO `cn_user` VALUES('100','0','b4473f71c8dee05c2252eadf301d4d51','0dd2bd9f4d920a0f05acd934f844ab86723e74c3','101.226.103.70','/api/notify/id/6-20180103123803','2018-01-03','1514967248','1');
INSERT INTO `cn_user` VALUES('101','0','b4473f71c8dee05c2252eadf301d4d51','16a30db344e2f8ec7ac8d0861e9ac4b360d14e88','101.226.103.62','/index/index/notify/id/6-20180103123809','2018-01-03','1514968643','1');
INSERT INTO `cn_user` VALUES('102','0','b4473f71c8dee05c2252eadf301d4d51','d6bd24fab6c11310d5dad7b8d61f796a25630115','183.3.234.61','/index/index/notify/id/6-20180103123802','2018-01-03','1514968939','1');
INSERT INTO `cn_user` VALUES('103','0','b4473f71c8dee05c2252eadf301d4d51','9994a0d6e822e1e53461ae96275fad5e394cde34','101.226.103.70','/api/notify/id/6-20180103123803','2018-01-03','1514969052','1');
INSERT INTO `cn_user` VALUES('104','0','b4473f71c8dee05c2252eadf301d4d51','41944f49e9022bf05841a26f20b380ac7520e0f3','101.226.103.69','/index/index/notify/id/6-20180103123809','2018-01-03','1514972244','1');
INSERT INTO `cn_user` VALUES('105','0','b4473f71c8dee05c2252eadf301d4d51','759c009e5487d3b744aa4e79c0c4c6ef8f576dbb','140.207.54.74','/index/index/notify/id/6-20180103123802','2018-01-03','1514972542','1');
INSERT INTO `cn_user` VALUES('106','0','b4473f71c8dee05c2252eadf301d4d51','bde5a8dc43e4dbffbc4c04d35450a0f0a9ed059a','140.207.54.74','/api/notify/id/6-20180103123803','2018-01-03','1514972655','1');
INSERT INTO `cn_user` VALUES('107','0','b4473f71c8dee05c2252eadf301d4d51','8bac3ba86cbdac964c9e48cf2ee537c194278ea6','101.226.33.208','/?wrnd=qm','2018-01-03','1514977610','1');
INSERT INTO `cn_user` VALUES('108','0','b4473f71c8dee05c2252eadf301d4d51','2b92e4d9b21edc89dd232ef599b27fa804567d69','61.151.178.171','/mlyy','2018-01-03','1514977615','1');
INSERT INTO `cn_user` VALUES('109','0','b4473f71c8dee05c2252eadf301d4d51','347ee7d0e05a426c22360446f693784cd999675d','101.226.226.221','/jsyy','2018-01-03','1514977619','1');
INSERT INTO `cn_user` VALUES('110','0','b4473f71c8dee05c2252eadf301d4d51','ca8864bbe9418fb9fc9e47575f8ae661d404946a','101.226.33.221','/mlyy/list-25','2018-01-03','1514977623','1');
INSERT INTO `cn_user` VALUES('111','0','b4473f71c8dee05c2252eadf301d4d51','22383bb8fed2685ae105147eb3f58d794a20f418','140.207.54.76','/api/notify/id/','2018-01-03','1514979498','1');
INSERT INTO `cn_user` VALUES('112','0','b4473f71c8dee05c2252eadf301d4d51','118bbef73e20b264ca14c3d89f0cb958eeedf560','58.251.80.62','/api/notify/id/','2018-01-03','1514979510','1');
INSERT INTO `cn_user` VALUES('113','0','b4473f71c8dee05c2252eadf301d4d51','fa77563aabb44745fbbe97f8caf82eb610790b57','183.3.234.51','/api/notify/id/','2018-01-03','1514979527','1');
INSERT INTO `cn_user` VALUES('114','0','b4473f71c8dee05c2252eadf301d4d51','2ff0e1bde3c9114068c128a4b61d9d136e132c06','101.226.103.70','/api/notify/id/','2018-01-03','1514979560','1');
INSERT INTO `cn_user` VALUES('115','0','b4473f71c8dee05c2252eadf301d4d51','55082331f89ae8f580a3dfbc1ce49e1e493bb6f3','140.207.54.74','/api/notify/id/6-20180103073411','2018-01-03','1514979621','1');
INSERT INTO `cn_user` VALUES('116','0','b4473f71c8dee05c2252eadf301d4d51','f082416fa89f9eb5a69b81bb8bf2f7b6cde04a99','140.207.54.74','/api/notify/id/6-20180103073411','2018-01-03','1514979638','1');
INSERT INTO `cn_user` VALUES('117','0','b4473f71c8dee05c2252eadf301d4d51','b6a86e59e326390df2f0bb9be010da34f42660dd','140.207.54.76','/api/notify/id/6-20180103073411','2018-01-03','1514979655','1');
INSERT INTO `cn_user` VALUES('118','0','b4473f71c8dee05c2252eadf301d4d51','effc8bdd7a16adbdd3de22343654d64887d24229','120.204.17.46','/user/paymoney/6-20180103073411.html','2018-01-03','1514979672','1');
INSERT INTO `cn_user` VALUES('119','0','b4473f71c8dee05c2252eadf301d4d51','2482bff03d319cd46817bb7fc00af1ddda951175','140.207.54.76','/api/notify/id/6-20180103073411','2018-01-03','1514979688','1');
INSERT INTO `cn_user` VALUES('120','0','b4473f71c8dee05c2252eadf301d4d51','4ef333ad3d985516b253233e877beec51a1dc5a6','140.207.54.74','/api/notify/id/','2018-01-03','1514979744','1');
INSERT INTO `cn_user` VALUES('121','0','b4473f71c8dee05c2252eadf301d4d51','6a14b339d0ca4179c3feee5d125a3242494a1a97','58.251.80.59','/api/notify/id/6-20180103073411','2018-01-03','1514979870','1');
INSERT INTO `cn_user` VALUES('122','0','b4473f71c8dee05c2252eadf301d4d51','c9374f2f0ad8b606d3b7145473718292395018c1','140.207.54.76','/api/notify/id/','2018-01-03','1514981545','1');
INSERT INTO `cn_user` VALUES('123','0','b4473f71c8dee05c2252eadf301d4d51','defcf02e5be4cfcc490a4bf620fda0ae481270e9','58.251.80.56','/api/notify/id/6-20180103073411','2018-01-03','1514981673','1');
INSERT INTO `cn_user` VALUES('124','0','b4473f71c8dee05c2252eadf301d4d51','8f886f14d09f33780fffac3d1e258635e72bdcf1','140.207.54.74','/api/notify/id/','2018-01-03','1514983347','1');
INSERT INTO `cn_user` VALUES('125','0','b4473f71c8dee05c2252eadf301d4d51','6d4e56e6ea6177aab461c42c94f9d8cebae5c558','58.251.80.59','/api/notify/id/6-20180103073411','2018-01-03','1514983474','1');
INSERT INTO `cn_user` VALUES('126','0','b4473f71c8dee05c2252eadf301d4d51','dd417e3eb923e74df2daac97266892d7e5ab60c4','58.251.80.56','/api/notify/id/','2018-01-03','1514985150','1');
INSERT INTO `cn_user` VALUES('127','0','b4473f71c8dee05c2252eadf301d4d51','c4248571c173cc9084d9723830b94e9946bbb67a','140.207.54.74','/api/notify/id/6-20180103073411','2018-01-03','1514985275','1');
INSERT INTO `cn_user` VALUES('128','0','b4473f71c8dee05c2252eadf301d4d51','908e4149a24272d8829f3fa2424202c296c73de3','58.251.80.61','/api/notify/id/','2018-01-03','1514986952','1');
INSERT INTO `cn_user` VALUES('129','0','b4473f71c8dee05c2252eadf301d4d51','87e2a26efe0f5113c7b8050acdde8e2aa6e788a8','183.3.234.55','/api/notify/id/6-20180103073411','2018-01-03','1514987077','1');
INSERT INTO `cn_user` VALUES('130','0','b4473f71c8dee05c2252eadf301d4d51','d51e5b7b49f998aa0d4f3736116d4d96b20b68cf','118.113.139.42','/favicon.ico','2018-01-03','1514988334','1');
INSERT INTO `cn_user` VALUES('131','0','b4473f71c8dee05c2252eadf301d4d51','88970bb7d97783bb9cc3a891e5bf72327577ef68','183.3.234.55','/api/notify/id/','2018-01-03','1514990555','1');
INSERT INTO `cn_user` VALUES('132','0','b4473f71c8dee05c2252eadf301d4d51','90657d5db60631ab7e999fa323feaa6cb2f8da2a','140.207.54.75','/api/notify/id/6-20180103073411','2018-01-03','1514990680','1');
INSERT INTO `cn_user` VALUES('133','0','cbf28d9c6975bc698385562c22abb3e5','6d152bd9c72efb7b8d731d629f83c277c40424f1','106.11.226.175','/','2018-01-04','1515027519','1');
INSERT INTO `cn_user` VALUES('134','0','cbf28d9c6975bc698385562c22abb3e5','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','/mlyy/list-25/','2018-01-04','1515027820','1');
INSERT INTO `cn_user` VALUES('135','0','cbf28d9c6975bc698385562c22abb3e5','3000ae9edbcc64ec0b6208f5531fe2f5d3c987cb','61.151.180.39','/mlyy/list-25/?wrnd=qm','2018-01-04','1515027981','1');
INSERT INTO `cn_user` VALUES('136','0','cbf28d9c6975bc698385562c22abb3e5','232b9e6d1ab932c870e3b35986941949022fac94','120.78.194.163','/index.php','2018-01-04','1515030510','1');
INSERT INTO `cn_user` VALUES('137','0','cbf28d9c6975bc698385562c22abb3e5','12bff75eb89cb9f40b7b5a577c3ad53534695aef','61.129.8.199','/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032161','1');
INSERT INTO `cn_user` VALUES('138','0','cbf28d9c6975bc698385562c22abb3e5','1d5d4ba5356527778c96c7e18722389ec8c11e5c','61.129.6.114','/mlyy/list-25/?k=2018-01-02','2018-01-04','1515032166','1');
INSERT INTO `cn_user` VALUES('139','0','cbf28d9c6975bc698385562c22abb3e5','4d51547b61fa16d50629f44e82826b30d170c357','61.151.179.83','/?ef','2018-01-04','1515034632','1');
INSERT INTO `cn_user` VALUES('140','0','cbf28d9c6975bc698385562c22abb3e5','2cb195c9f043feb393ad3995d396814634243e1d','101.226.225.86','/yyservice','2018-01-04','1515035791','1');
INSERT INTO `cn_user` VALUES('141','0','cbf28d9c6975bc698385562c22abb3e5','b018c55e7848e9637cbd1aa439071c26ef7b0e46','118.113.40.159','/favicon.ico','2018-01-04','1515036780','1');
INSERT INTO `cn_user` VALUES('142','0','cbf28d9c6975bc698385562c22abb3e5','92b0da1a88652be6f37ee2df5018d91dbdeaa4ad','120.78.194.163','/index.php','2018-01-04','1515044579','1');
INSERT INTO `cn_user` VALUES('143','0','cbf28d9c6975bc698385562c22abb3e5','b261ecccd234a2b3c79ee4e6ad14f0ca62744384','101.226.33.201','/contact','2018-01-04','1515047516','1');
INSERT INTO `cn_user` VALUES('144','0','cbf28d9c6975bc698385562c22abb3e5','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','/','2018-01-04','1515048097','1');
INSERT INTO `cn_user` VALUES('145','0','cbf28d9c6975bc698385562c22abb3e5','c5362b683dfcbb6c00c6b92c83a4a71c647eab02','111.30.143.27','/','2018-01-04','1515048640','1');
INSERT INTO `cn_user` VALUES('146','0','cbf28d9c6975bc698385562c22abb3e5','163066c29da74841de0da89b0d57906a9ed72e0a','125.39.132.58','/','2018-01-04','1515048640','1');
INSERT INTO `cn_user` VALUES('147','0','cbf28d9c6975bc698385562c22abb3e5','5ad8910bf5d4992d9ec91adefd55d907c897865c','140.207.54.74','/api/notify/id/6-20180104025406','2018-01-04','1515048903','1');
INSERT INTO `cn_user` VALUES('148','0','cbf28d9c6975bc698385562c22abb3e5','aa8ed311c06afa670a792d1f7719b526562a3670','140.207.54.75','/api/notify/id/6-20180104025406','2018-01-04','1515048917','1');
INSERT INTO `cn_user` VALUES('149','0','cbf28d9c6975bc698385562c22abb3e5','946848b026673e7938325cf62cde11288c469870','140.207.54.76','/api/notify/id/6-20180104025406','2018-01-04','1515048934','1');
INSERT INTO `cn_user` VALUES('150','0','cbf28d9c6975bc698385562c22abb3e5','08f8105fb5ec729a8c897f0f5f8504e20fa81723','140.207.54.76','/api/notify/id/6-20180104025406','2018-01-04','1515048966','1');
INSERT INTO `cn_user` VALUES('151','0','cbf28d9c6975bc698385562c22abb3e5','c1b533c4b8326e364108a1242467bc6b3b12c628','140.207.54.74','/api/notify/id/6-20180104025406','2018-01-04','1515049148','1');
INSERT INTO `cn_user` VALUES('152','0','cbf28d9c6975bc698385562c22abb3e5','35a7300e150baea4db321e25a7949e0149f03284','140.207.54.76','/api/notify/id/6-20180104025406','2018-01-04','1515050950','1');
INSERT INTO `cn_user` VALUES('153','0','cbf28d9c6975bc698385562c22abb3e5','cbbf706a33d493d632471cbf850eac009d739c77','140.207.54.76','/api/notify/id/6-20180104025406','2018-01-04','1515052752','1');
INSERT INTO `cn_user` VALUES('154','0','cbf28d9c6975bc698385562c22abb3e5','63bf06cc6f1a0b56b293eaaf5fe60e117b54c76b','140.207.54.74','/api/notify/id/6-20180104025406','2018-01-04','1515054555','1');
INSERT INTO `cn_user` VALUES('155','0','cbf28d9c6975bc698385562c22abb3e5','12b693e2bc929c512f68a6a4d8cea388a695f58d','140.207.54.76','/api/notify/id/6-20180104025406','2018-01-04','1515056357','1');
INSERT INTO `cn_user` VALUES('156','0','cbf28d9c6975bc698385562c22abb3e5','16e9ddf10502ccfc463077f6fdd0db451574ba74','140.207.54.74','/api/notify/id/6-20180104025406','2018-01-04','1515059959','1');
INSERT INTO `cn_user` VALUES('157','0','cbf28d9c6975bc698385562c22abb3e5','3a4727466e92bf7a8d87f7c5e65ba272f315c7ae','118.113.40.159','/','2018-01-04','1515062805','1');
INSERT INTO `cn_user` VALUES('158','0','cbf28d9c6975bc698385562c22abb3e5','57e52f8be1d83da7ee24e18f07b93337b2a4e4a6','140.207.54.74','/api/notify/id/6-20180104065134','2018-01-04','1515063106','1');
INSERT INTO `cn_user` VALUES('159','0','cbf28d9c6975bc698385562c22abb3e5','b82b36de74addf8c917bfa32c0b8e720dc5def30','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515063121','1');
INSERT INTO `cn_user` VALUES('160','0','cbf28d9c6975bc698385562c22abb3e5','4526305b1bbd565122539c5cc3be693c2dfb0472','140.207.54.73','/api/notify/id/6-20180104065134','2018-01-04','1515063138','1');
INSERT INTO `cn_user` VALUES('161','0','cbf28d9c6975bc698385562c22abb3e5','ffa05c64ae02aba457d2304e6248d1063b99372d','120.204.17.71','/user/paymoney/6-20180104065134.html','2018-01-04','1515063154','1');
INSERT INTO `cn_user` VALUES('162','0','cbf28d9c6975bc698385562c22abb3e5','caacc6d23a294e1d2583a2bf91912d482eb8ad08','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515063171','1');
INSERT INTO `cn_user` VALUES('163','0','cbf28d9c6975bc698385562c22abb3e5','63445a21f6303fbc382e2e7eb6f77c7cff7bd656','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515063355','1');
INSERT INTO `cn_user` VALUES('164','0','cbf28d9c6975bc698385562c22abb3e5','d7116ef0182d6c93cc15794bf5cde3cc8a0dcfc2','61.151.178.180','/jsyy','2018-01-04','1515063523','1');
INSERT INTO `cn_user` VALUES('165','0','cbf28d9c6975bc698385562c22abb3e5','bfe1b65b36d244f13b34f33f1e5d3abc058bbe16','101.226.225.85','/team/4.html','2018-01-04','1515063527','1');
INSERT INTO `cn_user` VALUES('166','0','cbf28d9c6975bc698385562c22abb3e5','80a500c36d8e435b1f969b1855ff48ea61c04f9a','61.151.179.84','/hit/?id=4','2018-01-04','1515063528','1');
INSERT INTO `cn_user` VALUES('167','0','cbf28d9c6975bc698385562c22abb3e5','fcb0cd76913ffd16472d7ed8512a46d8c81d9956','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515065157','1');
INSERT INTO `cn_user` VALUES('168','0','cbf28d9c6975bc698385562c22abb3e5','8729c87aab29ac70b7bcd0d0f633447e00eef439','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515066959','1');
INSERT INTO `cn_user` VALUES('169','0','cbf28d9c6975bc698385562c22abb3e5','4d66527bb72be1915c9b002ed6e2e820b50ed7b7','140.207.54.74','/api/notify/id/6-20180104065134','2018-01-04','1515068762','1');
INSERT INTO `cn_user` VALUES('170','0','cbf28d9c6975bc698385562c22abb3e5','7cd0e23f89465b8b7c4ac2a41942fb9a1385aeb3','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515070563','1');
INSERT INTO `cn_user` VALUES('171','0','cbf28d9c6975bc698385562c22abb3e5','b93f0132881b20bd6487257d5bdc55ca0546d166','140.207.54.76','/api/notify/id/6-20180104065134','2018-01-04','1515074165','1');
INSERT INTO `cn_user` VALUES('172','0','8624254c454179a5764b1486044ac3ce','70c36422d15b0c0a5a50836f9671f22dfbd359d0','106.11.226.180','/','2018-01-05','1515112846','1');
INSERT INTO `cn_user` VALUES('173','0','8624254c454179a5764b1486044ac3ce','4c340dfb03fafd8ed5e1e9e1965e7ea6c776230b','118.113.56.65','/favicon.ico','2018-01-05','1515117883','1');
INSERT INTO `cn_user` VALUES('174','0','8624254c454179a5764b1486044ac3ce','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','/?v=7','2018-01-05','1515117910','1');
INSERT INTO `cn_user` VALUES('175','0','8624254c454179a5764b1486044ac3ce','66e7359e30903760f624db7272515cfbc18f871b','118.113.56.65','/favicon.ico','2018-01-05','1515118032','1');
INSERT INTO `cn_user` VALUES('176','0','8624254c454179a5764b1486044ac3ce','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','/','2018-01-05','1515118052','1');
INSERT INTO `cn_user` VALUES('177','0','8624254c454179a5764b1486044ac3ce','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','/','2018-01-05','1515119123','1');
INSERT INTO `cn_user` VALUES('178','0','8624254c454179a5764b1486044ac3ce','066ebc4db3f43a9434487b0a1237228b0116833b','124.161.23.11','/','2018-01-05','1515119126','1');
INSERT INTO `cn_user` VALUES('179','0','8624254c454179a5764b1486044ac3ce','ef1aca74130521a8e959581ac1b61ec1cd328784','223.85.132.24','/','2018-01-05','1515119126','1');
INSERT INTO `cn_user` VALUES('180','0','8624254c454179a5764b1486044ac3ce','c9c2f422945d24bc66596f03243462f304b4c661','223.85.132.24','/','2018-01-05','1515119127','1');
INSERT INTO `cn_user` VALUES('181','0','8624254c454179a5764b1486044ac3ce','f4b87b662b5787d95056fa8eea23234c4a42dd32','124.161.23.60','/','2018-01-05','1515119127','1');
INSERT INTO `cn_user` VALUES('182','0','8624254c454179a5764b1486044ac3ce','f4b87b662b5787d95056fa8eea23234c4a42dd32','124.161.23.60','/','2018-01-05','1515119127','1');
INSERT INTO `cn_user` VALUES('183','0','8624254c454179a5764b1486044ac3ce','f4b87b662b5787d95056fa8eea23234c4a42dd32','124.161.23.60','/','2018-01-05','1515119127','1');
INSERT INTO `cn_user` VALUES('184','0','8624254c454179a5764b1486044ac3ce','49de17f6a451b7278ce366eba829aee78449b2db','117.175.88.49','/','2018-01-05','1515119127','1');
INSERT INTO `cn_user` VALUES('185','0','8624254c454179a5764b1486044ac3ce','0d0f8e89010ad777ea3003c043ebb8564243b55b','117.175.88.49','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('186','0','8624254c454179a5764b1486044ac3ce','bd795877090d8a335fae3f65ec8eac98bb5c1fee','124.161.23.11','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('187','0','8624254c454179a5764b1486044ac3ce','bd795877090d8a335fae3f65ec8eac98bb5c1fee','124.161.23.11','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('188','0','8624254c454179a5764b1486044ac3ce','bd795877090d8a335fae3f65ec8eac98bb5c1fee','124.161.23.11','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('189','0','8624254c454179a5764b1486044ac3ce','0d0f8e89010ad777ea3003c043ebb8564243b55b','117.175.88.49','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('190','0','8624254c454179a5764b1486044ac3ce','546417c046a8517c2dd6fee9109b46def289cf8f','124.161.23.60','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('191','0','8624254c454179a5764b1486044ac3ce','c8d9d5921cb5be5a9d8d071349420584177cb7c0','223.85.132.24','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('192','0','8624254c454179a5764b1486044ac3ce','c8d9d5921cb5be5a9d8d071349420584177cb7c0','223.85.132.24','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('193','0','8624254c454179a5764b1486044ac3ce','546417c046a8517c2dd6fee9109b46def289cf8f','124.161.23.60','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('194','0','8624254c454179a5764b1486044ac3ce','c8d9d5921cb5be5a9d8d071349420584177cb7c0','223.85.132.24','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('195','0','8624254c454179a5764b1486044ac3ce','c8d9d5921cb5be5a9d8d071349420584177cb7c0','223.85.132.24','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('196','0','8624254c454179a5764b1486044ac3ce','3b29f344841995cf771c2c8eaf72f81591f467bc','223.85.132.35','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('197','0','8624254c454179a5764b1486044ac3ce','c8d9d5921cb5be5a9d8d071349420584177cb7c0','223.85.132.24','/','2018-01-05','1515119128','1');
INSERT INTO `cn_user` VALUES('198','0','8624254c454179a5764b1486044ac3ce','db272f674be6f691624385ca4707510cb2804db5','117.175.88.49','/','2018-01-05','1515119156','1');
INSERT INTO `cn_user` VALUES('199','0','8624254c454179a5764b1486044ac3ce','6f525cfa5d96801a19bf6bc8d6eed70b2077649f','223.85.132.24','/','2018-01-05','1515119157','1');
INSERT INTO `cn_user` VALUES('200','0','8624254c454179a5764b1486044ac3ce','bb8c66db38cc73e7d2a5c7a5424cf5d29cf491ce','223.85.132.24','/','2018-01-05','1515119160','1');
INSERT INTO `cn_user` VALUES('201','0','8624254c454179a5764b1486044ac3ce','73f65a0804929e3e4acde77186df0b83430ac04f','223.85.132.24','/','2018-01-05','1515119161','1');
INSERT INTO `cn_user` VALUES('202','0','8624254c454179a5764b1486044ac3ce','896cc0ee54dd4a17518860ea59c136a9316f1de9','125.39.132.58','/','2018-01-05','1515119264','1');
INSERT INTO `cn_user` VALUES('203','0','8624254c454179a5764b1486044ac3ce','6d40b884dfef2e6a822f4612a23cc80046924338','111.30.143.27','/','2018-01-05','1515119264','1');
INSERT INTO `cn_user` VALUES('204','0','8624254c454179a5764b1486044ac3ce','203b8925fa6a157fd88d5eb6347a852f08b6e8a6','123.151.148.58','/fwfl/','2018-01-05','1515119545','1');
INSERT INTO `cn_user` VALUES('205','0','8624254c454179a5764b1486044ac3ce','19a869ea577f19549640a5f666791d87ccf99fb2','118.113.56.65','/','2018-01-05','1515119901','1');
INSERT INTO `cn_user` VALUES('206','0','8624254c454179a5764b1486044ac3ce','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','139.207.55.15','/','2018-01-05','1515119903','1');
INSERT INTO `cn_user` VALUES('207','0','8624254c454179a5764b1486044ac3ce','fa69b968ac19318acf2fb4e0da3912247536fbff','183.61.51.67','/','2018-01-05','1515121016','1');
INSERT INTO `cn_user` VALUES('208','0','8624254c454179a5764b1486044ac3ce','7b3a0f18c4bc9803c706abdea0940602d75e3c23','118.113.56.65','/','2018-01-05','1515121174','1');
INSERT INTO `cn_user` VALUES('209','0','8624254c454179a5764b1486044ac3ce','1c1243ac652ba7a774e6741ea9fade2c280fbd67','118.113.40.159','/favicon.ico','2018-01-05','1515131369','1');
INSERT INTO `cn_user` VALUES('210','0','8624254c454179a5764b1486044ac3ce','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','/','2018-01-05','1515132646','1');
INSERT INTO `cn_user` VALUES('211','0','8624254c454179a5764b1486044ac3ce','7473b88f99fc7175c0fcf25d01404140e1080b07','120.204.17.68','/mlyy','2018-01-05','1515139221','1');
INSERT INTO `cn_user` VALUES('212','0','8624254c454179a5764b1486044ac3ce','f7359ba9184fe397db97c6990cec429e4da4a1e7','120.204.17.69','/jsyy','2018-01-05','1515139232','1');
INSERT INTO `cn_user` VALUES('213','0','8624254c454179a5764b1486044ac3ce','4d98c0339fa013ed15469cd1805f2b82deb2036e','120.204.17.68','/stjbhl/10.html','2018-01-05','1515142716','1');
INSERT INTO `cn_user` VALUES('214','0','8624254c454179a5764b1486044ac3ce','9ba168d6171894040de38774c9adf11c3009781c','123.151.148.58','/user/paymoney/8-20180105045902.html','2018-01-05','1515142788','1');
INSERT INTO `cn_user` VALUES('215','0','8624254c454179a5764b1486044ac3ce','b9a3240b7d6ee139ea11a0a3c6dab3c760ebfffb','182.144.38.144','/','2018-01-05','1515151095','1');
INSERT INTO `cn_user` VALUES('216','0','8624254c454179a5764b1486044ac3ce','988c4e1b40809ba2f2e1983f7a88da4fdce15d4f','139.207.177.131','/','2018-01-05','1515151206','1');
INSERT INTO `cn_user` VALUES('217','0','8624254c454179a5764b1486044ac3ce','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','/','2018-01-05','1515153693','1');
INSERT INTO `cn_user` VALUES('218','0','8624254c454179a5764b1486044ac3ce','18a29f7a9e78f15396cd41172a6415e02891c523','120.78.194.163','/index.php','2018-01-05','1515153740','1');
INSERT INTO `cn_user` VALUES('219','0','8624254c454179a5764b1486044ac3ce','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','/','2018-01-05','1515162935','1');
INSERT INTO `cn_user` VALUES('220','0','ed9e54f01f0b0177a0faeb09f9335d55','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','/','2018-01-06','1515195289','1');
INSERT INTO `cn_user` VALUES('221','0','ed9e54f01f0b0177a0faeb09f9335d55','9b9305a5024f47a3c1bdb87130121511845e2f8f','223.85.132.35','/','2018-01-06','1515195289','1');
INSERT INTO `cn_user` VALUES('222','0','ed9e54f01f0b0177a0faeb09f9335d55','081bfef1718ebbf3b0c057dfde5f9d97ddd3e37a','124.161.23.11','/','2018-01-06','1515195289','1');
INSERT INTO `cn_user` VALUES('223','0','ed9e54f01f0b0177a0faeb09f9335d55','4fc68ad691dbfe5a24cfaa68805c4456237d8538','120.78.194.163','/index.php','2018-01-06','1515195290','1');
INSERT INTO `cn_user` VALUES('224','0','ed9e54f01f0b0177a0faeb09f9335d55','95f8ff2693a90bd05841c0ec6979ace36cf0a949','120.204.17.46','/wtjf','2018-01-06','1515195414','1');
INSERT INTO `cn_user` VALUES('225','0','ed9e54f01f0b0177a0faeb09f9335d55','9ffcc864a0951fe325a570f08eacb701a8dfcb6b','106.11.227.210','/','2018-01-06','1515198955','1');
INSERT INTO `cn_user` VALUES('226','0','ed9e54f01f0b0177a0faeb09f9335d55','55cd48b0b53cee0114ee1d86697bf20b5046c534','118.113.56.65','/','2018-01-06','1515201266','1');
INSERT INTO `cn_user` VALUES('227','0','ed9e54f01f0b0177a0faeb09f9335d55','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','/','2018-01-06','1515209804','1');
INSERT INTO `cn_user` VALUES('228','0','ed9e54f01f0b0177a0faeb09f9335d55','f7817d29ff4f3900ccaae473dc3d43cbc06668c2','106.120.160.119','/','2018-01-06','1515232096','1');
INSERT INTO `cn_user` VALUES('229','0','ed9e54f01f0b0177a0faeb09f9335d55','575b63878a78b9500463ec683db36b1686095fef','101.199.108.54','/','2018-01-06','1515241657','1');
INSERT INTO `cn_user` VALUES('230','0','235a3e5072b3a2324f2a3cdb53e246ac','f1f4fbf8c6302b71e77b347845ef0a964ee30488','106.11.227.247','/','2018-01-07','1515285116','1');
INSERT INTO `cn_user` VALUES('231','0','72c1e9fcfabf4909e6e18d2286898b93','5e8a205edfba1c9494d8d4377706b62d6c9976e4','106.11.242.46','/','2018-01-08','1515367941','1');
INSERT INTO `cn_user` VALUES('232','0','238c4cfd389d2a42eb77677eb9672a96','0e0d44f6eb0d6f37db27761ebd210a1870d70706','106.11.226.153','/','2018-01-09','1515453471','1');
INSERT INTO `cn_user` VALUES('233','0','042b9de2ff26ea18c04efa78590250f8','0a1ab9c555392f81d4b4989edebca8a9fafd4b4d','106.11.226.2','/','2018-01-10','1515541118','1');
INSERT INTO `cn_user` VALUES('234','0','042b9de2ff26ea18c04efa78590250f8','067d6c36d46e0f69c0c2ba2a4e6f830316dccc3b','110.184.221.139','/favicon.ico','2018-01-10','1515553217','1');
INSERT INTO `cn_user` VALUES('235','0','042b9de2ff26ea18c04efa78590250f8','05df1cff9fa2decac2a9c63f2fe10e96696c10ab','110.184.221.139','/favicon.ico','2018-01-10','1515553224','1');
INSERT INTO `cn_user` VALUES('236','0','042b9de2ff26ea18c04efa78590250f8','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','/?v=7','2018-01-10','1515553227','1');
INSERT INTO `cn_user` VALUES('237','0','042b9de2ff26ea18c04efa78590250f8','0cfecd916f6c9c16e62a891984c0063170518dd9','101.226.33.223','/?v=7','2018-01-10','1515553287','1');
INSERT INTO `cn_user` VALUES('238','0','042b9de2ff26ea18c04efa78590250f8','b509d5861225766fa3a133a3c05f34c198153eb5','61.151.178.168','/comm/css/bootstrap.css.map','2018-01-10','1515553291','1');
INSERT INTO `cn_user` VALUES('239','0','042b9de2ff26ea18c04efa78590250f8','41a753e39ec00d77d835d3499fc976f397e47daf','61.129.6.151','/?wrnd=qm','2018-01-10','1515553294','1');
INSERT INTO `cn_user` VALUES('240','0','042b9de2ff26ea18c04efa78590250f8','ee2d0ab6828618cbc2e4509eafc611d013b2991e','61.129.6.113','/mlyy','2018-01-10','1515553546','1');
INSERT INTO `cn_user` VALUES('241','0','042b9de2ff26ea18c04efa78590250f8','3b69b99fa394b3a5b1947dc9c306161a6ed18b92','61.151.178.164','/jsyy','2018-01-10','1515553549','1');
INSERT INTO `cn_user` VALUES('242','0','042b9de2ff26ea18c04efa78590250f8','6d0cae93341ff52e55e08bd086a569626be75904','120.204.17.67','/mlyy/list-25','2018-01-10','1515553552','1');
INSERT INTO `cn_user` VALUES('243','0','042b9de2ff26ea18c04efa78590250f8','13d2aa2b03724a59513e17754c869e3545a6d14a','101.226.33.223','/contact','2018-01-10','1515553569','1');
INSERT INTO `cn_user` VALUES('244','0','042b9de2ff26ea18c04efa78590250f8','93838f6f57f3a9acf9766ca9f2dc0cd8864807a2','61.129.6.151','/stjbhl','2018-01-10','1515554011','1');
INSERT INTO `cn_user` VALUES('245','0','042b9de2ff26ea18c04efa78590250f8','d97fe6de7ba04449d0b7dfe32673cff78f5c9927','101.226.66.191','/hit/?id=10','2018-01-10','1515554054','1');
INSERT INTO `cn_user` VALUES('246','0','042b9de2ff26ea18c04efa78590250f8','c5f3e8efe01225fd2f35f2e180e822be09727600','101.226.33.206','/mlbd','2018-01-10','1515555271','1');
INSERT INTO `cn_user` VALUES('247','0','042b9de2ff26ea18c04efa78590250f8','522e06312f977f74e2026cc65f4933886d397a5b','101.226.33.237','/mlbd/list-5','2018-01-10','1515555284','1');
INSERT INTO `cn_user` VALUES('248','0','042b9de2ff26ea18c04efa78590250f8','0a9bd44c96d28ff7be7b80d18bb484708f8d4f28','120.204.17.69','/mlbd/list-5/6.html','2018-01-10','1515555341','1');
INSERT INTO `cn_user` VALUES('249','0','042b9de2ff26ea18c04efa78590250f8','b09aaf5d9920848df9b7ad908083500eeb87561d','61.151.178.165','/hit/?id=6','2018-01-10','1515555342','1');
INSERT INTO `cn_user` VALUES('250','0','042b9de2ff26ea18c04efa78590250f8','1b329af71101e650e28d47d7882234b594f64792','101.226.33.237','/','2018-01-10','1515556293','1');
INSERT INTO `cn_user` VALUES('251','0','042b9de2ff26ea18c04efa78590250f8','a7c670af7af3ea1f84d99f65e0a271639517cad9','120.78.194.163','/index.php','2018-01-10','1515556516','1');
INSERT INTO `cn_user` VALUES('252','0','042b9de2ff26ea18c04efa78590250f8','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','/fwfl/','2018-01-10','1515556679','1');
INSERT INTO `cn_user` VALUES('253','0','042b9de2ff26ea18c04efa78590250f8','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','/','2018-01-10','1515556697','1');
INSERT INTO `cn_user` VALUES('254','0','042b9de2ff26ea18c04efa78590250f8','23dab86f57dd1fddca4615847d1ee1e037f8d5f7','120.204.17.67','/','2018-01-10','1515556802','1');
INSERT INTO `cn_user` VALUES('255','0','042b9de2ff26ea18c04efa78590250f8','71aeb9a9e149543c2c08d202a7cbb517da471bbd','183.61.51.57','/mlbd/','2018-01-10','1515557049','1');
INSERT INTO `cn_user` VALUES('256','0','042b9de2ff26ea18c04efa78590250f8','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','/fwfl/','2018-01-10','1515557084','1');
INSERT INTO `cn_user` VALUES('257','0','042b9de2ff26ea18c04efa78590250f8','852d54326ee077622d51c314a7a49a70f6b2781f','117.136.62.48','/','2018-01-10','1515557147','1');
INSERT INTO `cn_user` VALUES('258','0','042b9de2ff26ea18c04efa78590250f8','2cca4a4e4afbdcb9869659bd0a9197a616278b0e','124.161.23.11','/','2018-01-10','1515557150','1');
INSERT INTO `cn_user` VALUES('259','0','042b9de2ff26ea18c04efa78590250f8','efe658545dcfc682555043f57579f3f9c1804077','223.85.132.24','/','2018-01-10','1515557150','1');
INSERT INTO `cn_user` VALUES('260','0','042b9de2ff26ea18c04efa78590250f8','9fa7617234b53ca7e843b45a0b6ff610d76b99b3','223.85.132.35','/','2018-01-10','1515557164','1');
INSERT INTO `cn_user` VALUES('261','0','042b9de2ff26ea18c04efa78590250f8','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','/','2018-01-10','1515557174','1');
INSERT INTO `cn_user` VALUES('262','0','042b9de2ff26ea18c04efa78590250f8','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','/fwfl/','2018-01-10','1515557178','1');
INSERT INTO `cn_user` VALUES('263','0','042b9de2ff26ea18c04efa78590250f8','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','/fwfl/','2018-01-10','1515557201','1');
INSERT INTO `cn_user` VALUES('264','0','042b9de2ff26ea18c04efa78590250f8','9655b1aee10c3a6c7d52d543db19dffb62cbf6b0','123.151.148.55','/gdyql/','2018-01-10','1515557206','1');
INSERT INTO `cn_user` VALUES('265','0','042b9de2ff26ea18c04efa78590250f8','d7c497a41a42ea2a4bc66da231a471844c524ae4','120.204.17.67','/wtjf','2018-01-10','1515557349','1');
INSERT INTO `cn_user` VALUES('266','0','042b9de2ff26ea18c04efa78590250f8','de936a5683c56e8593eaa1290995ccafe0145570','118.112.185.236','/','2018-01-10','1515557745','1');
INSERT INTO `cn_user` VALUES('267','0','042b9de2ff26ea18c04efa78590250f8','a2925ce57506157f030b9e6eb73c49b2b6ba973a','120.204.17.67','/stjbhl','2018-01-10','1515558247','1');
INSERT INTO `cn_user` VALUES('268','0','042b9de2ff26ea18c04efa78590250f8','2424d6f85e9e9b97631be2c8860ba6f56b01ce44','120.204.17.69','/stjbhl/10.html','2018-01-10','1515558248','1');
INSERT INTO `cn_user` VALUES('269','0','042b9de2ff26ea18c04efa78590250f8','ddde6711179a789e001c8d86526e74903084abd9','120.204.17.69','/api/wxpayjsapi','2018-01-10','1515558305','1');
INSERT INTO `cn_user` VALUES('270','0','042b9de2ff26ea18c04efa78590250f8','743ee8b4df77462b03471dbc937116d871f0cfdb','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515558408','1');
INSERT INTO `cn_user` VALUES('271','0','042b9de2ff26ea18c04efa78590250f8','0d52315b786430ad4a28b65f6bfcd89d90927cb1','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515558422','1');
INSERT INTO `cn_user` VALUES('272','0','042b9de2ff26ea18c04efa78590250f8','53b1fa019e85cd392e01e9e35367fad5f06d09fd','111.30.143.27','/','2018-01-10','1515558428','1');
INSERT INTO `cn_user` VALUES('273','0','042b9de2ff26ea18c04efa78590250f8','c603730116eb3e199397b66cd82c4722e91cfa04','123.151.148.58','/mlyy/','2018-01-10','1515558428','1');
INSERT INTO `cn_user` VALUES('274','0','042b9de2ff26ea18c04efa78590250f8','c34e1242c05d9b533e4258d1c4ef4b665de3feb2','125.39.132.52','/','2018-01-10','1515558428','1');
INSERT INTO `cn_user` VALUES('275','0','042b9de2ff26ea18c04efa78590250f8','b1a385d1463a5c6224bfe86c688e6103f112f5e5','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515558439','1');
INSERT INTO `cn_user` VALUES('276','0','042b9de2ff26ea18c04efa78590250f8','b15507273995845a1e22cd2a10ee62fb0ee5994c','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515558472','1');
INSERT INTO `cn_user` VALUES('277','0','042b9de2ff26ea18c04efa78590250f8','350bd99672e52ccc0a63451a07673f72acc34621','123.151.148.57','/fwfl/','2018-01-10','1515558650','1');
INSERT INTO `cn_user` VALUES('278','0','042b9de2ff26ea18c04efa78590250f8','47e173a8a902153975e8b38c5b723e935b9c6ee4','140.207.54.75','/api/notify/id/7-20180110122627','2018-01-10','1515558654','1');
INSERT INTO `cn_user` VALUES('279','0','042b9de2ff26ea18c04efa78590250f8','dbfcb0a3e534cf0d2ff8d7c8a7f182acfc3a2d7d','123.151.148.57','/','2018-01-10','1515558659','1');
INSERT INTO `cn_user` VALUES('280','0','042b9de2ff26ea18c04efa78590250f8','e0c20cc49c17a2e5363cac5c00c681a7c29afdb4','140.207.54.75','/api/notify/id/7-20180110122627','2018-01-10','1515560456','1');
INSERT INTO `cn_user` VALUES('281','0','042b9de2ff26ea18c04efa78590250f8','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','/fwfl/','2018-01-10','1515561526','1');
INSERT INTO `cn_user` VALUES('282','0','042b9de2ff26ea18c04efa78590250f8','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','/fwfl/','2018-01-10','1515561534','1');
INSERT INTO `cn_user` VALUES('283','0','042b9de2ff26ea18c04efa78590250f8','b31debec44ecb07da0b5c26000daafc29da4c070','123.151.148.58','/team/4.html','2018-01-10','1515561680','1');
INSERT INTO `cn_user` VALUES('284','0','042b9de2ff26ea18c04efa78590250f8','a69dabd0008672c8762487f7a8e316258648c322','111.30.143.27','/','2018-01-10','1515561680','1');
INSERT INTO `cn_user` VALUES('285','0','042b9de2ff26ea18c04efa78590250f8','246f95f45eb322b3f4a18b04d405bce931c2bc39','125.39.132.58','/','2018-01-10','1515561680','1');
INSERT INTO `cn_user` VALUES('286','0','042b9de2ff26ea18c04efa78590250f8','2a2051befcc19879a64b065eb0f3609fb341be9e','120.204.17.69','/yyservice','2018-01-10','1515561728','1');
INSERT INTO `cn_user` VALUES('287','0','042b9de2ff26ea18c04efa78590250f8','fb09298fb3e2aaecb5b8bab177f367315f43c12c','183.192.201.97','/gdyql','2018-01-10','1515561747','1');
INSERT INTO `cn_user` VALUES('288','0','042b9de2ff26ea18c04efa78590250f8','aff872f8ad9bdda57922a7ede25a3d1246c756d7','123.151.148.58','/','2018-01-10','1515561770','1');
INSERT INTO `cn_user` VALUES('289','0','042b9de2ff26ea18c04efa78590250f8','19a8aeb92a249e5a41bf28e478947ce01a0212a9','123.151.148.58','/jsyy/','2018-01-10','1515561792','1');
INSERT INTO `cn_user` VALUES('290','0','042b9de2ff26ea18c04efa78590250f8','b14165395ba94d87f007397247dcc3d50f8ec29f','120.204.17.69','/about','2018-01-10','1515561840','1');
INSERT INTO `cn_user` VALUES('291','0','042b9de2ff26ea18c04efa78590250f8','b27d8cf2fec782cea1498dc1a0564a6d220c4b5b','123.151.148.55','/mlyy/','2018-01-10','1515561963','1');
INSERT INTO `cn_user` VALUES('292','0','042b9de2ff26ea18c04efa78590250f8','69a092c3226f72a03dcab86227eb7c13da30b352','123.151.153.120','/mlyy/','2018-01-10','1515561967','1');
INSERT INTO `cn_user` VALUES('293','0','042b9de2ff26ea18c04efa78590250f8','ab3b6f547602e7139441b879da2eb6f70d75d191','101.227.139.173','/','2018-01-10','1515561977','1');
INSERT INTO `cn_user` VALUES('294','0','042b9de2ff26ea18c04efa78590250f8','d574f7823648ce6a8a5095b8b9482e3472b3ee9a','121.51.32.144','/yyservice/?k=%e8%82%a9%e9%a2%88','2018-01-10','1515562057','1');
INSERT INTO `cn_user` VALUES('295','0','042b9de2ff26ea18c04efa78590250f8','8301864352502c811eb015ee08f1d363b3f677c5','101.227.139.173','/','2018-01-10','1515562137','1');
INSERT INTO `cn_user` VALUES('296','0','042b9de2ff26ea18c04efa78590250f8','b3c8e62fc8c0614c6fb1a8681295a7266d3a9e32','112.193.147.40','/?from=timeline&isappinstalled=0','2018-01-10','1515562142','1');
INSERT INTO `cn_user` VALUES('297','0','042b9de2ff26ea18c04efa78590250f8','6ea079cf574d668a6da3f96e2694c3879d02709d','117.136.63.162','/?from=timeline','2018-01-10','1515562152','1');
INSERT INTO `cn_user` VALUES('298','0','042b9de2ff26ea18c04efa78590250f8','1401264b6420ccf89d04c6baa50f236c0d48d067','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515562259','1');
INSERT INTO `cn_user` VALUES('299','0','042b9de2ff26ea18c04efa78590250f8','2b578367e2d6e721f6b59e15c9f3a6e49d460176','183.61.51.57','/?from=timeline','2018-01-10','1515562325','1');
INSERT INTO `cn_user` VALUES('300','0','042b9de2ff26ea18c04efa78590250f8','92ea2289eb4f8610cbd0a122fa83b67e23189d80','118.116.89.102','/?from=timeline&isappinstalled=0','2018-01-10','1515562600','1');
INSERT INTO `cn_user` VALUES('301','0','042b9de2ff26ea18c04efa78590250f8','8c028a254988b102f0618388469d2256f4855bf0','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515564061','1');
INSERT INTO `cn_user` VALUES('302','0','042b9de2ff26ea18c04efa78590250f8','00d9c86720f6cbe55b80b92d94469fb38055c971','119.4.253.145','/?from=timeline&isappinstalled=0','2018-01-10','1515565066','1');
INSERT INTO `cn_user` VALUES('303','0','042b9de2ff26ea18c04efa78590250f8','5f98d1f2cfff7b815c6888302e7fb804c5860dbd','140.207.54.74','/api/notify/id/7-20180110122627','2018-01-10','1515565863','1');
INSERT INTO `cn_user` VALUES('304','0','042b9de2ff26ea18c04efa78590250f8','7375967bc4509f4590b4d60be98616409443fce4','140.207.54.76','/api/notify/id/7-20180110122627','2018-01-10','1515569465','1');
INSERT INTO `cn_user` VALUES('305','0','042b9de2ff26ea18c04efa78590250f8','ee5c18850a6ccc95c9b45d718de7226e81914202','117.174.94.25','/?from=timeline&isappinstalled=0','2018-01-10','1515570400','1');
INSERT INTO `cn_user` VALUES('306','0','042b9de2ff26ea18c04efa78590250f8','752c4557abf49d759651ebfceb286bffa4fd915a','183.192.201.97','/?from=timeline&isappinstalled=0','2018-01-10','1515570459','1');
INSERT INTO `cn_user` VALUES('307','0','042b9de2ff26ea18c04efa78590250f8','ed32f0eff1b876380b09cc9b6d3436994d7c05ae','61.151.178.164','/comm/css/bootstrap.css.map','2018-01-10','1515572687','1');
INSERT INTO `cn_user` VALUES('308','0','042b9de2ff26ea18c04efa78590250f8','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','/','2018-01-10','1515577848','1');
INSERT INTO `cn_user` VALUES('309','0','042b9de2ff26ea18c04efa78590250f8','5786636db7a31f9bf862588453b106399a506e4d','123.151.148.55','/','2018-01-10','1515577849','1');
INSERT INTO `cn_user` VALUES('310','0','042b9de2ff26ea18c04efa78590250f8','eab1aac6beb53882e1a7733727b2170304ebf6a4','111.30.143.27','/','2018-01-10','1515577849','1');
INSERT INTO `cn_user` VALUES('311','0','042b9de2ff26ea18c04efa78590250f8','8c07f80a8bab7a6f9172e3dc1e832ee73159d958','125.39.132.58','/','2018-01-10','1515577849','1');
INSERT INTO `cn_user` VALUES('312','0','042b9de2ff26ea18c04efa78590250f8','5969a41dff354fdeb825bfe3d0e9582f9a0e8a08','123.151.148.55','/','2018-01-10','1515577851','1');
INSERT INTO `cn_user` VALUES('313','0','042b9de2ff26ea18c04efa78590250f8','f6fb389323788e2d09e0adf48e881cfda7bbab81','120.204.17.46','/about','2018-01-10','1515577930','1');
INSERT INTO `cn_user` VALUES('314','0','042b9de2ff26ea18c04efa78590250f8','76ee473fb1f75f1c58bab0dc6ec76f69ba7011f5','140.205.201.30','/index.php?m=member&c=index&a=register&siteid=1','2018-01-10','1515578657','1');
INSERT INTO `cn_user` VALUES('315','0','042b9de2ff26ea18c04efa78590250f8','f7da1cfd452de94852328314f0dbf602efee82d5','140.205.201.30','/index.php?m=wap&a=index&siteid=1','2018-01-10','1515578877','1');
INSERT INTO `cn_user` VALUES('316','0','a5c6e355d1bac02c0ab89e2d6a1cee84','261ef05d68154673c48d19d0d8415e726c279be0','106.11.225.143','/','2018-01-11','1515628039','1');
INSERT INTO `cn_user` VALUES('317','0','a5c6e355d1bac02c0ab89e2d6a1cee84','90947f800a7dd522fd7fa3e3d4cdf2d056e68b79','118.116.89.102','/','2018-01-11','1515639562','1');
INSERT INTO `cn_user` VALUES('318','0','a5c6e355d1bac02c0ab89e2d6a1cee84','f5073ee9da812ba785644a7281c24c2508e28c14','121.51.32.144','/fwfl/?k=%e6%b0%b4%e5%85%89','2018-01-11','1515639632','1');
INSERT INTO `cn_user` VALUES('319','0','a5c6e355d1bac02c0ab89e2d6a1cee84','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','/?wrnd=qm','2018-01-11','1515656015','1');
INSERT INTO `cn_user` VALUES('320','0','a5c6e355d1bac02c0ab89e2d6a1cee84','14e11dc6331b69f3ddaf0b556d3f2565950898bf','101.226.225.84','/stjbhl/10.html','2018-01-11','1515656099','1');
INSERT INTO `cn_user` VALUES('321','0','a5c6e355d1bac02c0ab89e2d6a1cee84','b56bda002937c181376f4b8ee0b992d4fdfcd046','125.71.74.130','/favicon.ico','2018-01-11','1515677650','1');
INSERT INTO `cn_user` VALUES('322','0','49c600867cef170378d4bd9a3e75dd7f','c7fb51a8d6df8e4cd7409419f7f2e0560e13d69f','106.11.242.170','/','2018-01-12','1515714147','1');
INSERT INTO `cn_user` VALUES('323','0','49c600867cef170378d4bd9a3e75dd7f','0f294b4d5deebfd5fbba6d893c8c171ffbc10bb0','118.113.41.81','/favicon.ico','2018-01-12','1515730326','1');
INSERT INTO `cn_user` VALUES('324','0','49c600867cef170378d4bd9a3e75dd7f','cdb36f02295f5d78f185e016fe2939d588bcbedd','118.113.41.81','/favicon.ico','2018-01-12','1515730335','1');
INSERT INTO `cn_user` VALUES('325','0','49c600867cef170378d4bd9a3e75dd7f','37ea17df8e85561ffa30dad8fe1425ea37c34cac','118.113.41.81','/favicon.ico','2018-01-12','1515730342','1');
INSERT INTO `cn_user` VALUES('326','0','49c600867cef170378d4bd9a3e75dd7f','53bcb35353898da42ed90dd086088498aaaf2366','118.113.41.81','/favicon.ico','2018-01-12','1515730344','1');
INSERT INTO `cn_user` VALUES('327','0','49c600867cef170378d4bd9a3e75dd7f','9cb429e828c521d85095389e3f8e1e0c1dbba82e','118.113.41.81','/favicon.ico','2018-01-12','1515730347','1');
INSERT INTO `cn_user` VALUES('328','0','49c600867cef170378d4bd9a3e75dd7f','7d5097a5743c0026e931a70a5104a4b45e10bebe','118.113.41.81','/favicon.ico','2018-01-12','1515730468','1');
INSERT INTO `cn_user` VALUES('329','0','49c600867cef170378d4bd9a3e75dd7f','ed5ef5585524e7c756b8c622d75041116143f971','118.113.41.81','/favicon.ico','2018-01-12','1515730470','1');
INSERT INTO `cn_user` VALUES('330','0','49c600867cef170378d4bd9a3e75dd7f','66470a8f0b110005cf668635efd619b4a83565f7','118.113.41.81','/favicon.ico','2018-01-12','1515730472','1');
INSERT INTO `cn_user` VALUES('331','0','49c600867cef170378d4bd9a3e75dd7f','c82851645d0b86590079ed1e4226576b20d6d317','118.113.41.81','/favicon.ico','2018-01-12','1515730475','1');
INSERT INTO `cn_user` VALUES('332','0','49c600867cef170378d4bd9a3e75dd7f','0c5ef86a418b539662fc3abea1aa5cf916a76c73','118.113.41.81','/favicon.ico','2018-01-12','1515730477','1');
INSERT INTO `cn_user` VALUES('333','0','49c600867cef170378d4bd9a3e75dd7f','4dfe63710693c5d1dd39ae3000a8af072c604d24','120.204.17.73','/contact','2018-01-12','1515738466','1');
INSERT INTO `cn_user` VALUES('334','0','49c600867cef170378d4bd9a3e75dd7f','37b857d62c1a72b1ba15871d48da7888f9eb1ba5','121.51.32.144','/fwfl','2018-01-12','1515738476','1');
INSERT INTO `cn_user` VALUES('335','0','49c600867cef170378d4bd9a3e75dd7f','7c1de0483b37ec26cadb5346d21bb6360cb93882','171.210.146.136','/contact/','2018-01-12','1515745390','1');
INSERT INTO `cn_user` VALUES('336','0','49c600867cef170378d4bd9a3e75dd7f','d5ad21a4f73f7a8ca5f19655064b3e9c1d3326ec','120.204.17.68','/','2018-01-12','1515754968','1');
INSERT INTO `cn_user` VALUES('337','0','49c600867cef170378d4bd9a3e75dd7f','f1b1db22e2856b06396757a867de668aa35e8bd1','118.116.89.102','/','2018-01-12','1515756808','1');
INSERT INTO `cn_user` VALUES('338','0','49c600867cef170378d4bd9a3e75dd7f','709fad7973496caaeaf1ae60777c8105527247fd','118.116.92.48','/','2018-01-12','1515756855','1');
INSERT INTO `cn_user` VALUES('339','0','49c600867cef170378d4bd9a3e75dd7f','88f57cf74098a21d96191158efe68378d2e13963','120.204.17.67','/fwfl','2018-01-12','1515756914','1');
INSERT INTO `cn_user` VALUES('340','0','49c600867cef170378d4bd9a3e75dd7f','2b98010bf8f7f402a926ee91e576068df7c02c66','120.204.17.46','/api/wxpayjsapi','2018-01-12','1515756961','1');
INSERT INTO `cn_user` VALUES('341','0','49c600867cef170378d4bd9a3e75dd7f','e08fc79a182448120a2bf5921ef43ca9594d79fc','58.247.212.98','/user/paymoney/7-20180112073500.html','2018-01-12','1515756961','1');
INSERT INTO `cn_user` VALUES('342','0','176456aac20d4db769f767df381e139d','550755b39df2f4c2a586e38299e9fc96f1619e24','106.11.242.139','/','2018-01-13','1515802392','1');
INSERT INTO `cn_user` VALUES('343','0','176456aac20d4db769f767df381e139d','009a6be5856d6816d41cf2d7e51cf559b6ae9e4e','118.116.91.97','/','2018-01-13','1515812779','1');
INSERT INTO `cn_user` VALUES('344','0','176456aac20d4db769f767df381e139d','f8e9ec1e0f340dc1e049b031aad0da8c5a60cb8e','121.51.32.144','/favicon.ico','2018-01-13','1515812842','1');
INSERT INTO `cn_user` VALUES('345','0','176456aac20d4db769f767df381e139d','3ea5b429fd92d1cb6587058389e02505567e2767','118.116.91.97','/fwfl/','2018-01-13','1515813400','1');
INSERT INTO `cn_user` VALUES('346','0','176456aac20d4db769f767df381e139d','67b9cac767e071cd47585acbdb476ac8a73ada36','123.151.148.55','/','2018-01-13','1515813403','1');
INSERT INTO `cn_user` VALUES('347','0','176456aac20d4db769f767df381e139d','05ad2c625493c2c072e6bce12ac605a544efebea','120.204.17.67','/gdyql','2018-01-13','1515813499','1');
INSERT INTO `cn_user` VALUES('348','0','176456aac20d4db769f767df381e139d','f235e91d7d2b20cb48e76778ed369bf5988f3caf','183.192.201.97','/mlyy','2018-01-13','1515813520','1');
INSERT INTO `cn_user` VALUES('349','0','176456aac20d4db769f767df381e139d','98874844d59a0e0b1d72506e870b3d2fe34c02f8','121.51.32.144','/mbjchl','2018-01-13','1515813575','1');
INSERT INTO `cn_user` VALUES('350','0','176456aac20d4db769f767df381e139d','cb14ba873fef2be1fc2e9ae1d3e41bc940cc2420','118.116.91.97','/','2018-01-13','1515814658','1');
INSERT INTO `cn_user` VALUES('351','0','176456aac20d4db769f767df381e139d','e7fbfe055b63934626c99b648591206c10ba316d','118.116.91.97','/favicon.ico','2018-01-13','1515814659','1');
INSERT INTO `cn_user` VALUES('352','0','176456aac20d4db769f767df381e139d','2e3c64c81895127a62dad36978dc6acbe3e7bff4','61.129.6.147','/admin','2018-01-13','1515814737','1');
INSERT INTO `cn_user` VALUES('353','0','176456aac20d4db769f767df381e139d','ed4fcd93a3d6e056db67a3bd828f2657d309e43c','61.151.207.252','/admin.qm','2018-01-13','1515814746','1');
INSERT INTO `cn_user` VALUES('354','0','176456aac20d4db769f767df381e139d','671aefadc0764a2d73f67e31a4ab6e627cb19915','118.116.91.97','/?v=7','2018-01-13','1515814987','1');
INSERT INTO `cn_user` VALUES('355','0','176456aac20d4db769f767df381e139d','e1543c9c9c53ba3b749f008dc0ee3fa53b3f094c','118.116.91.97','/','2018-01-13','1515815459','1');
INSERT INTO `cn_user` VALUES('356','0','176456aac20d4db769f767df381e139d','2f08727f6ffb735c8246f1055a5c96695cc5c0f3','180.153.160.61','/?v=7','2018-01-13','1515816396','1');
INSERT INTO `cn_user` VALUES('357','0','176456aac20d4db769f767df381e139d','02f8e9bfc89785edfcb9ea60aee45f4d92ab7b1d','101.226.33.223','/?v=7','2018-01-13','1515816446','1');
INSERT INTO `cn_user` VALUES('358','0','176456aac20d4db769f767df381e139d','6044865d3e8ecca7c84bcecae9cfa98b5c77dd16','61.129.8.250','/mlbd','2018-01-13','1515817782','1');
INSERT INTO `cn_user` VALUES('359','0','176456aac20d4db769f767df381e139d','4a0d4d7a50c2418f34685e8dcad31f784b2e708d','61.129.8.203','/mlbd/list-5','2018-01-13','1515817785','1');
INSERT INTO `cn_user` VALUES('360','0','176456aac20d4db769f767df381e139d','60009f26f76e333480a95beead7de7a46006d855','101.226.102.97','/mrys','2018-01-13','1515817788','1');
INSERT INTO `cn_user` VALUES('361','0','176456aac20d4db769f767df381e139d','460807389b6cead0e4907522cda8380d55d606f3','101.226.102.97','/mlbd/list-7','2018-01-13','1515817790','1');
INSERT INTO `cn_user` VALUES('362','0','176456aac20d4db769f767df381e139d','951117d9a3f9b9a5e1120109ac0f1d9266741b1f','58.247.212.98','/fwfl','2018-01-13','1515817943','1');
INSERT INTO `cn_user` VALUES('363','0','176456aac20d4db769f767df381e139d','4dab0416992a41f3684587dfcca2a11771d397af','120.204.17.67','/contact','2018-01-13','1515817943','1');
INSERT INTO `cn_user` VALUES('364','0','176456aac20d4db769f767df381e139d','0177394585737fd410b25dc2c4af7f0c4961cd58','121.51.32.144','/mlbd','2018-01-13','1515818090','1');
INSERT INTO `cn_user` VALUES('365','0','176456aac20d4db769f767df381e139d','c0e1f41c1afc675db2e64da3102e0bbe9d9ca76d','183.192.201.97','/mlbd','2018-01-13','1515818226','1');
INSERT INTO `cn_user` VALUES('366','0','176456aac20d4db769f767df381e139d','1ab75ac98a45366eee8c376e17342a02b2a9950e','120.204.17.71','/contact','2018-01-13','1515818466','1');
INSERT INTO `cn_user` VALUES('367','0','176456aac20d4db769f767df381e139d','71f5fdcf9138f8611c8cb9d4acc82b7e9116d075','118.116.91.97','/mlbd/','2018-01-13','1515818511','1');
INSERT INTO `cn_user` VALUES('368','0','176456aac20d4db769f767df381e139d','694f2a28ee49a962b2d2a1b2ac6f825967cc05f0','123.151.148.55','/','2018-01-13','1515818537','1');
INSERT INTO `cn_user` VALUES('369','0','176456aac20d4db769f767df381e139d','5b97dba81da1719c01595945c5cded3b29b7e5ae','111.30.141.103','/','2018-01-13','1515818537','1');
INSERT INTO `cn_user` VALUES('370','0','176456aac20d4db769f767df381e139d','f9cdf493dcca1e101235d852cf63e63d625d5e4e','125.39.132.58','/','2018-01-13','1515818537','1');
INSERT INTO `cn_user` VALUES('371','0','176456aac20d4db769f767df381e139d','19c62b762ff82440a80ab457d3bac735315581f8','123.151.153.120','/','2018-01-13','1515818551','1');
INSERT INTO `cn_user` VALUES('372','0','176456aac20d4db769f767df381e139d','be443762519c58298d64a5d307e2b407d59cb9e6','120.204.17.71','/about','2018-01-13','1515818562','1');
INSERT INTO `cn_user` VALUES('373','0','176456aac20d4db769f767df381e139d','cd63eefdba52af205a380c1beb837de9fcb5fae3','123.151.153.120','/','2018-01-13','1515818565','1');
INSERT INTO `cn_user` VALUES('374','0','176456aac20d4db769f767df381e139d','7511e938e3c6e5f82ec118186a8741c50a0bc628','183.192.201.97','/fwfl','2018-01-13','1515818743','1');
INSERT INTO `cn_user` VALUES('375','0','176456aac20d4db769f767df381e139d','384bed42ee20ee545cf4ca826ea91cdcbfb939f8','139.207.84.169','/fwfl/','2018-01-13','1515826101','1');
INSERT INTO `cn_user` VALUES('376','0','176456aac20d4db769f767df381e139d','88d90c3785298fe9f840a6a544fd46e20984d10b','139.207.35.111','/','2018-01-13','1515826139','1');
INSERT INTO `cn_user` VALUES('377','0','176456aac20d4db769f767df381e139d','578080d218f5b710e6b7c83a13015f9e8937fd2d','171.210.205.143','/mlbd/','2018-01-13','1515827163','1');
INSERT INTO `cn_user` VALUES('378','0','176456aac20d4db769f767df381e139d','cf1c9ce5766849976ad4ce370e49c7bf0168eb24','120.204.17.46','/xieyi','2018-01-13','1515827231','1');
INSERT INTO `cn_user` VALUES('379','0','176456aac20d4db769f767df381e139d','42ca897a1aca74eee6dc28d6bb98d179c278dca7','111.30.143.27','/','2018-01-13','1515827261','1');
INSERT INTO `cn_user` VALUES('380','0','176456aac20d4db769f767df381e139d','c6fa497ad3dff5e941b6682df01da913084d00bf','125.39.132.58','/','2018-01-13','1515827261','1');
INSERT INTO `cn_user` VALUES('381','0','176456aac20d4db769f767df381e139d','b77845da2bfc665d47e33d227fe262d354679925','123.151.153.120','/mlbd/','2018-01-13','1515827263','1');
INSERT INTO `cn_user` VALUES('382','0','176456aac20d4db769f767df381e139d','15f42b9030fecc271d1b864199996d3646ce2617','117.136.70.57','/mlbd/','2018-01-13','1515827930','1');
INSERT INTO `cn_user` VALUES('383','0','176456aac20d4db769f767df381e139d','056998982aa64b27aff85b26ea840dfa86717604','124.161.23.60','/','2018-01-13','1515827932','1');
INSERT INTO `cn_user` VALUES('384','0','176456aac20d4db769f767df381e139d','8c9cad7fd37f3150315d6b39a177e74a835995fe','117.175.88.49','/','2018-01-13','1515827932','1');
INSERT INTO `cn_user` VALUES('385','0','176456aac20d4db769f767df381e139d','ea89692b921a4f8f1ad43d74b1ea720e9bcac43d','124.161.23.60','/','2018-01-13','1515827933','1');
INSERT INTO `cn_user` VALUES('386','0','176456aac20d4db769f767df381e139d','2a37fd531af51d33dc5b3b561d2087011edcf489','223.85.132.24','/','2018-01-13','1515827933','1');
INSERT INTO `cn_user` VALUES('387','0','176456aac20d4db769f767df381e139d','04e97ad9cda361cc288b7d96cb917d10e42f59cd','117.175.88.49','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('388','0','176456aac20d4db769f767df381e139d','3189f920d20f2182921de38feea38920ffaf84b5','223.85.132.35','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('389','0','176456aac20d4db769f767df381e139d','9d645355b9c24a328ed6c2af4fc2fff22030e73d','124.161.23.60','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('390','0','176456aac20d4db769f767df381e139d','0e1683c6b8e8bed98d3ac106904aaf055d6ca9e4','223.85.132.24','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('391','0','176456aac20d4db769f767df381e139d','9d645355b9c24a328ed6c2af4fc2fff22030e73d','124.161.23.60','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('392','0','176456aac20d4db769f767df381e139d','3189f920d20f2182921de38feea38920ffaf84b5','223.85.132.35','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('393','0','176456aac20d4db769f767df381e139d','fbda9fd02ca97751313b6c9c408fee1a06500099','124.161.23.11','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('394','0','176456aac20d4db769f767df381e139d','9d645355b9c24a328ed6c2af4fc2fff22030e73d','124.161.23.60','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('395','0','176456aac20d4db769f767df381e139d','3189f920d20f2182921de38feea38920ffaf84b5','223.85.132.35','/','2018-01-13','1515827934','1');
INSERT INTO `cn_user` VALUES('396','0','176456aac20d4db769f767df381e139d','6895d843425dfb92e89cea9efb101c5ff7c7620b','124.161.23.60','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('397','0','176456aac20d4db769f767df381e139d','3e39cb18d0b277d55fba243d53741f4021d4e7d3','124.161.23.11','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('398','0','176456aac20d4db769f767df381e139d','e55e19d28b50489c3f5e43365d3bb3d6adb77956','223.85.132.35','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('399','0','176456aac20d4db769f767df381e139d','3e39cb18d0b277d55fba243d53741f4021d4e7d3','124.161.23.11','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('400','0','176456aac20d4db769f767df381e139d','3e39cb18d0b277d55fba243d53741f4021d4e7d3','124.161.23.11','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('401','0','176456aac20d4db769f767df381e139d','e55e19d28b50489c3f5e43365d3bb3d6adb77956','223.85.132.35','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('402','0','176456aac20d4db769f767df381e139d','4c991cbba06e098279cf22fade96e311bffae5dc','117.175.88.49','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('403','0','176456aac20d4db769f767df381e139d','4c991cbba06e098279cf22fade96e311bffae5dc','117.175.88.49','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('404','0','176456aac20d4db769f767df381e139d','6895d843425dfb92e89cea9efb101c5ff7c7620b','124.161.23.60','/','2018-01-13','1515827935','1');
INSERT INTO `cn_user` VALUES('405','0','176456aac20d4db769f767df381e139d','b0ae10e3766a986fdc89de7c6d37e06a5ec0c93e','183.61.51.69','/about/','2018-01-13','1515829252','1');
INSERT INTO `cn_user` VALUES('406','0','176456aac20d4db769f767df381e139d','1c89ec85673c38bfbdf79d854d7715bc5c768f75','117.136.70.35','/mlbd/','2018-01-13','1515831952','1');
INSERT INTO `cn_user` VALUES('407','0','176456aac20d4db769f767df381e139d','0524df1e4b06b535e732866e4553f9c8ab0433ba','223.85.132.24','/','2018-01-13','1515833932','1');
INSERT INTO `cn_user` VALUES('408','0','176456aac20d4db769f767df381e139d','3d040d6ebaccc71ff5ad273aa57dee771c0b73eb','124.161.23.60','/','2018-01-13','1515833932','1');
INSERT INTO `cn_user` VALUES('409','0','176456aac20d4db769f767df381e139d','dadb5b5c600b06c4232e78e23b79a95d863765c1','117.136.70.48','/fwfl/','2018-01-13','1515833932','1');
INSERT INTO `cn_user` VALUES('410','0','176456aac20d4db769f767df381e139d','3f1e0d5147471519d590b4e9adf0e2b31e146ff0','117.175.88.49','/','2018-01-13','1515837062','1');
INSERT INTO `cn_user` VALUES('411','0','176456aac20d4db769f767df381e139d','26f37681fbd8fd617f608649ad46ebb9a874b588','124.161.23.11','/','2018-01-13','1515837062','1');
INSERT INTO `cn_user` VALUES('412','0','176456aac20d4db769f767df381e139d','ca56a492070adaf061188ecd34381fbf7f6e084b','182.149.160.234','/contact/','2018-01-13','1515850389','1');
INSERT INTO `cn_user` VALUES('413','0','176456aac20d4db769f767df381e139d','acf28b3aaf4089f7a8c4f92d04d8c4146f6e7398','182.149.160.234','/mlbd/','2018-01-13','1515851123','1');
INSERT INTO `cn_user` VALUES('414','0','b3c3e649f36f418525aea4406942bd9a','5542aa06cee0821e75d715057339f52a36c04ee0','106.11.242.40','/','2018-01-14','1515888632','1');
INSERT INTO `cn_user` VALUES('415','0','116669213dfe3f646eb5be3664440769','9071b66064b8e4d3ca3b94ce34a050ead859df29','106.11.227.190','/','2018-01-15','1515975153','1');
INSERT INTO `cn_user` VALUES('416','0','116669213dfe3f646eb5be3664440769','9d2f309aa4ea5ce8f1b34668ddb49924d17349a8','110.184.4.165','/?wrnd=qm','2018-01-15','1515985011','1');
INSERT INTO `cn_user` VALUES('417','0','116669213dfe3f646eb5be3664440769','ba16f076c893ab02fba55add9aa2f2715f7ad523','113.108.10.15','/?wrnd=qm','2018-01-15','1515985023','1');
INSERT INTO `cn_user` VALUES('418','0','116669213dfe3f646eb5be3664440769','d4b8fdb4190e3f6bb366f07f9386da618340da84','110.184.4.165','/?wrnd=qm','2018-01-15','1515985027','1');
INSERT INTO `cn_user` VALUES('419','0','116669213dfe3f646eb5be3664440769','d5beefe46d46468f67b40b94ac4f5db368d226b6','61.151.207.252','/?wrnd=qm','2018-01-15','1515985070','1');
INSERT INTO `cn_user` VALUES('420','0','116669213dfe3f646eb5be3664440769','a9239be125507aee03118431809528d25d755f19','61.151.178.171','/mlyy','2018-01-15','1515985239','1');
INSERT INTO `cn_user` VALUES('421','0','116669213dfe3f646eb5be3664440769','8b56841bfea45a7e955da6b82396ff9bff9f3b89','61.151.178.177','/fwfl','2018-01-15','1515985241','1');
INSERT INTO `cn_user` VALUES('422','0','116669213dfe3f646eb5be3664440769','348983c4d47911dffc3ade867482a1ac7c797def','61.151.207.252','/mlyy','2018-01-15','1515985244','1');
INSERT INTO `cn_user` VALUES('423','0','116669213dfe3f646eb5be3664440769','1fe1cc6799b97367d9ceec6fdd698bff5a654790','120.78.194.163','/index.php','2018-01-15','1515985248','1');
INSERT INTO `cn_user` VALUES('424','0','116669213dfe3f646eb5be3664440769','cf686c54266c96f971d6706ffec77ba3b3fc381f','101.226.33.200','/?wrnd=qm','2018-01-15','1515985540','1');
INSERT INTO `cn_user` VALUES('425','0','98e358c11cc14f50d827664dbc51670a','363bf5b33deee426979e2e8151a7d08f40c8619b','106.11.227.115','/','2018-01-16','1516061900','1');
INSERT INTO `cn_user` VALUES('426','0','824682af0618de64188db473954c1281','e581dfed661c91c1a370a87e95fe32599a936b29','106.11.242.33','/','2018-01-17','1516148097','1');
INSERT INTO `cn_user` VALUES('427','0','824682af0618de64188db473954c1281','895dabc9174ecfb34f2a8b7fc19c485d9ff5c766','118.113.40.32','/favicon.ico','2018-01-17','1516152842','1');
INSERT INTO `cn_user` VALUES('428','0','824682af0618de64188db473954c1281','b46ee6176d86a7404df9bd7cd9d217967af4194b','116.30.222.112','/contact/','2018-01-17','1516154415','1');
INSERT INTO `cn_user` VALUES('429','0','824682af0618de64188db473954c1281','8040f8fc0b69f9dc27d67610c1fa06a24856ab81','118.113.40.32','/?wrnd=qm','2018-01-17','1516167544','1');
INSERT INTO `cn_user` VALUES('430','0','824682af0618de64188db473954c1281','d4f63220d10d2a48ad2af431776d49f330bf7b31','61.151.218.119','/?wrnd=qm','2018-01-17','1516167604','1');
INSERT INTO `cn_user` VALUES('431','0','824682af0618de64188db473954c1281','077a2d94b898e7a84b2bf2abbdfd9f66c54788c8','101.226.33.219','/comm/css/bootstrap.css.map','2018-01-17','1516171130','1');
INSERT INTO `cn_user` VALUES('432','0','824682af0618de64188db473954c1281','bad84e650a84ca875507458bff2548c429cc0099','61.129.7.254','/mlyy','2018-01-17','1516175297','1');
INSERT INTO `cn_user` VALUES('433','0','824682af0618de64188db473954c1281','6d3e77ca579cd3f5eb5107d34f849d99401f4840','101.226.225.86','/?wrnd=qm','2018-01-17','1516175302','1');
INSERT INTO `cn_user` VALUES('434','0','824682af0618de64188db473954c1281','cec17c14a45a2285d610f6b56480eceb586203ea','106.11.230.133','/index.php?m=wap&a=index&siteid=1','2018-01-17','1516182912','1');
INSERT INTO `cn_user` VALUES('435','0','824682af0618de64188db473954c1281','4b876cfe95797614cf9d54c67f4f6e16bca1460c','106.11.228.222','/index.php?m=member&c=index&a=register&siteid=1','2018-01-17','1516182912','1');
INSERT INTO `cn_user` VALUES('436','0','03e68bb82e5c837879c64402e5bed214','a16faff71d1b0114e18432b114b22c11b48eafec','106.11.242.246','/','2018-01-18','1516233550','1');
INSERT INTO `cn_user` VALUES('437','0','03e68bb82e5c837879c64402e5bed214','bb9cca105a9edcf8f566ea53896dbfc9e0fc1d06','118.116.91.97','/fwfl/','2018-01-18','1516246618','1');
INSERT INTO `cn_user` VALUES('438','0','03e68bb82e5c837879c64402e5bed214','874b951d8fb2a628135c77c0a5b97d5edd9cd61f','123.151.153.120','/fwfl/','2018-01-18','1516246619','1');
INSERT INTO `cn_user` VALUES('439','0','03e68bb82e5c837879c64402e5bed214','0a080121be08f93b5a150417d36cb5374d596260','118.116.91.97','/_vti_bin/owssvr.dll?ul=1&act=4&build=4518&strmver=4&capreq=0','2018-01-18','1516246650','1');
INSERT INTO `cn_user` VALUES('440','0','03e68bb82e5c837879c64402e5bed214','e116eff809684d626f83cdfe481841af248e64b1','120.78.194.163','/index.php','2018-01-18','1516247355','1');
INSERT INTO `cn_user` VALUES('441','0','03e68bb82e5c837879c64402e5bed214','4f8ad1749d1eec13280f51bd08bf7b09b60e3baf','118.116.91.97','/mlbd/','2018-01-18','1516268265','1');
INSERT INTO `cn_user` VALUES('442','0','03e68bb82e5c837879c64402e5bed214','a122ad92023ab9d2f29e3cc6483595df81023867','183.192.201.97','/mlbd','2018-01-18','1516268324','1');
INSERT INTO `cn_user` VALUES('443','0','03e68bb82e5c837879c64402e5bed214','ede31af196a81ea4d00bb899a009a26c1d84975a','120.204.17.71','/mlbd/list-5','2018-01-18','1516268338','1');
INSERT INTO `cn_user` VALUES('444','0','03e68bb82e5c837879c64402e5bed214','51b771704525e9acd2210aa3559b9718bc73a831','121.51.32.144','/mrys','2018-01-18','1516268344','1');
INSERT INTO `cn_user` VALUES('445','0','03e68bb82e5c837879c64402e5bed214','6cd210323432596f1d097c48a7811b88abc5cf53','120.204.17.73','/fwfl','2018-01-18','1516268575','1');
INSERT INTO `cn_user` VALUES('446','0','03e68bb82e5c837879c64402e5bed214','246df8c049fa1a8e0e66cf93223fea5e0b6d2569','121.51.32.144','/gdyql','2018-01-18','1516268582','1');
INSERT INTO `cn_user` VALUES('447','0','03e68bb82e5c837879c64402e5bed214','4011a8868232b0fe814ea2ad4fcedc2c862f2eed','120.204.17.67','/about','2018-01-18','1516268592','1');
INSERT INTO `cn_user` VALUES('448','0','03e68bb82e5c837879c64402e5bed214','7f1d8768dfc05101105c4d1aa0d8be39ce584839','61.129.8.179','/stjbhl','2018-01-18','1516268668','1');
INSERT INTO `cn_user` VALUES('449','0','03e68bb82e5c837879c64402e5bed214','762c0f9552716bdfec93676287bbb3efe88367fa','101.226.225.86','/stjbhl/10.html','2018-01-18','1516268673','1');
INSERT INTO `cn_user` VALUES('450','0','03e68bb82e5c837879c64402e5bed214','299cc6df7a35f705bea386b6fa22a3e2a3abc29f','120.204.17.69','/mbjchl','2018-01-18','1516268826','1');
INSERT INTO `cn_user` VALUES('451','0','03e68bb82e5c837879c64402e5bed214','5d3a755bfb4acf1b371fa1e1106e8a1c0ec164a3','101.226.33.202','/?v=7','2018-01-18','1516268972','1');
INSERT INTO `cn_user` VALUES('452','0','03e68bb82e5c837879c64402e5bed214','d99b8d144860074edd7f3aa7f1e57fb900bac491','110.184.221.28','/favicon.ico','2018-01-18','1516269369','1');
INSERT INTO `cn_user` VALUES('453','0','03e68bb82e5c837879c64402e5bed214','bd65dcfca08f78645925aa470fbcad18924e3df8','110.184.221.28','/favicon.ico','2018-01-18','1516269377','1');
INSERT INTO `cn_user` VALUES('454','0','03e68bb82e5c837879c64402e5bed214','930c3044f3eca4adf624273826df5ce8eed241c6','110.184.221.28','/favicon.ico','2018-01-18','1516269382','1');
INSERT INTO `cn_user` VALUES('455','0','03e68bb82e5c837879c64402e5bed214','dd3609ff469aec2b4aeaad8887fc395c5ffaa1f0','110.184.221.28','/favicon.ico','2018-01-18','1516269385','1');
INSERT INTO `cn_user` VALUES('456','0','03e68bb82e5c837879c64402e5bed214','89c50da23f906a6fb1bde6748a18811b025e445a','110.184.221.28','/favicon.ico','2018-01-18','1516269390','1');
INSERT INTO `cn_user` VALUES('457','0','03e68bb82e5c837879c64402e5bed214','9429474060815c440626580cdd004334792f185a','110.184.221.28','/favicon.ico','2018-01-18','1516269392','1');
INSERT INTO `cn_user` VALUES('458','0','03e68bb82e5c837879c64402e5bed214','1937aff2f766f6a4d334376da27a308dee539136','110.184.221.28','/favicon.ico','2018-01-18','1516269419','1');
INSERT INTO `cn_user` VALUES('459','0','03e68bb82e5c837879c64402e5bed214','1fc4c4130610e3160806e89eb23e037b39eac152','110.184.221.28','/favicon.ico','2018-01-18','1516269425','1');
INSERT INTO `cn_user` VALUES('460','0','03e68bb82e5c837879c64402e5bed214','c5db8ee5f6d9fdd25929bd2e321faef692e57a51','110.184.221.28','/favicon.ico','2018-01-18','1516269432','1');
INSERT INTO `cn_user` VALUES('461','0','03e68bb82e5c837879c64402e5bed214','822e202cd515046ea2bb711f0765e74a7c940076','110.184.221.28','/favicon.ico','2018-01-18','1516269435','1');
INSERT INTO `cn_user` VALUES('462','0','03e68bb82e5c837879c64402e5bed214','8629099ea8ae1e5e9e59d780d4ab36992e22254f','110.184.221.28','/favicon.ico','2018-01-18','1516269440','1');
INSERT INTO `cn_user` VALUES('463','0','03e68bb82e5c837879c64402e5bed214','25b66e1a4626d8dc8334f8c95c735dc961735804','110.184.221.28','/favicon.ico','2018-01-18','1516269443','1');
INSERT INTO `cn_user` VALUES('464','0','03e68bb82e5c837879c64402e5bed214','7117e6f0cbe7f8479f3674885f254e14ac0de488','110.184.221.28','/favicon.ico','2018-01-18','1516269447','1');
INSERT INTO `cn_user` VALUES('465','0','03e68bb82e5c837879c64402e5bed214','e2d3138bfbdb96db4ef82ad189725b8578293955','110.184.221.28','/favicon.ico','2018-01-18','1516269450','1');
INSERT INTO `cn_user` VALUES('466','0','03e68bb82e5c837879c64402e5bed214','b820b0ab74b7288a1ea1317987f7bb6eebbd8087','110.184.221.28','/favicon.ico','2018-01-18','1516269453','1');
INSERT INTO `cn_user` VALUES('467','0','03e68bb82e5c837879c64402e5bed214','01c673ac3a5ee445dca6321ca6ed1fc4e14234f6','110.184.221.28','/favicon.ico','2018-01-18','1516269464','1');
INSERT INTO `cn_user` VALUES('468','0','03e68bb82e5c837879c64402e5bed214','983172ef2c9267a90bc97974d5c201e3097ab516','110.184.221.28','/favicon.ico','2018-01-18','1516269476','1');
INSERT INTO `cn_user` VALUES('469','0','03e68bb82e5c837879c64402e5bed214','1eb37244e7f48e4812e355c8b13eb14e7c8bac6c','110.184.221.28','/favicon.ico','2018-01-18','1516269488','1');
INSERT INTO `cn_user` VALUES('470','0','03e68bb82e5c837879c64402e5bed214','255085df78d193f05d40639a1b7a5b3f66cc30ca','110.184.221.28','/favicon.ico','2018-01-18','1516269500','1');
INSERT INTO `cn_user` VALUES('471','0','03e68bb82e5c837879c64402e5bed214','d3367ac7106583073916220c2aaffb1e1d0580fe','110.184.221.28','/favicon.ico','2018-01-18','1516269502','1');
INSERT INTO `cn_user` VALUES('472','0','03e68bb82e5c837879c64402e5bed214','5c2b9c665bb4f48082d93e14689e00536f113d18','110.184.221.28','/favicon.ico','2018-01-18','1516269509','1');
INSERT INTO `cn_user` VALUES('473','0','03e68bb82e5c837879c64402e5bed214','53853181a9c381c55214a843f4539005e6df1892','110.184.221.28','/favicon.ico','2018-01-18','1516269514','1');
INSERT INTO `cn_user` VALUES('474','0','03e68bb82e5c837879c64402e5bed214','422f6470ab954141293a3803dbf5de397a7aef7d','110.184.221.28','/favicon.ico','2018-01-18','1516269516','1');
INSERT INTO `cn_user` VALUES('475','0','03e68bb82e5c837879c64402e5bed214','fe9db718974bc62475c58ec56e70d729dd87f268','110.184.221.28','/favicon.ico','2018-01-18','1516269526','1');
INSERT INTO `cn_user` VALUES('476','0','03e68bb82e5c837879c64402e5bed214','a191b646612fdfdb1a241469c35b6624eef6857d','110.184.221.28','/favicon.ico','2018-01-18','1516269528','1');
INSERT INTO `cn_user` VALUES('477','0','03e68bb82e5c837879c64402e5bed214','41a19c1795f4e1c2765824ad1b8f2d48a4b238ae','110.184.221.28','/favicon.ico','2018-01-18','1516269687','1');
INSERT INTO `cn_user` VALUES('478','0','03e68bb82e5c837879c64402e5bed214','aa6f2b57e891874808093e5fee1c73bd21913ac6','110.184.221.28','/favicon.ico','2018-01-18','1516269690','1');
INSERT INTO `cn_user` VALUES('479','0','03e68bb82e5c837879c64402e5bed214','7254d8f743bf59d0442022a4e1bc5d7c5f05b16a','110.184.221.28','/favicon.ico','2018-01-18','1516270213','1');
INSERT INTO `cn_user` VALUES('480','0','03e68bb82e5c837879c64402e5bed214','63756b3ee589f4a88ba2fe99798dc393f0155166','110.184.221.28','/favicon.ico','2018-01-18','1516270232','1');
INSERT INTO `cn_user` VALUES('481','0','03e68bb82e5c837879c64402e5bed214','cad42b7c6d690f68a0bff714951e52d806c625c8','110.184.221.28','/favicon.ico','2018-01-18','1516270236','1');
INSERT INTO `cn_user` VALUES('482','0','03e68bb82e5c837879c64402e5bed214','ff514cf67ab2ed5fd355a0d18bb432c81cdede55','110.184.221.28','/favicon.ico','2018-01-18','1516270253','1');
INSERT INTO `cn_user` VALUES('483','0','03e68bb82e5c837879c64402e5bed214','08827410dc7174b4315b892f4c1b70afe4c79487','110.184.221.28','/favicon.ico','2018-01-18','1516271059','1');
INSERT INTO `cn_user` VALUES('484','0','03e68bb82e5c837879c64402e5bed214','c5d811f3cd4287086e9ea041e2c648eae5a969c3','110.184.221.28','/favicon.ico','2018-01-18','1516271062','1');
INSERT INTO `cn_user` VALUES('485','0','03e68bb82e5c837879c64402e5bed214','930fe72a2b421dc262b1219104520a0af34305bc','110.184.221.28','/favicon.ico','2018-01-18','1516271065','1');
INSERT INTO `cn_user` VALUES('486','0','03e68bb82e5c837879c64402e5bed214','7c44b90f42110de6dbce20918b9b4a85f0967849','110.184.221.28','/favicon.ico','2018-01-18','1516271095','1');
INSERT INTO `cn_user` VALUES('487','0','03e68bb82e5c837879c64402e5bed214','7d93502a2a5f323d6868699ce3af961568c59cf0','110.184.221.28','/favicon.ico','2018-01-18','1516271102','1');
INSERT INTO `cn_user` VALUES('488','0','03e68bb82e5c837879c64402e5bed214','cc2a71c9bb054f722d21827e0d1f1ab737a41186','110.184.221.28','/favicon.ico','2018-01-18','1516271105','1');
INSERT INTO `cn_user` VALUES('489','0','03e68bb82e5c837879c64402e5bed214','e6d00ab09ca14e2e4a5c1305af43c3f03dcc48e6','110.184.221.28','/favicon.ico','2018-01-18','1516271125','1');
INSERT INTO `cn_user` VALUES('490','0','03e68bb82e5c837879c64402e5bed214','9ac68b042c11c85f4111568b21b332ab6b6ea53b','110.184.221.28','/favicon.ico','2018-01-18','1516271126','1');
INSERT INTO `cn_user` VALUES('491','0','03e68bb82e5c837879c64402e5bed214','71c67ce87ab092010cb84e2f3decb085f3247206','110.184.221.28','/favicon.ico','2018-01-18','1516271128','1');
INSERT INTO `cn_user` VALUES('492','0','03e68bb82e5c837879c64402e5bed214','119f28ad3e3f7df086c2778a297fe107a63e6f3d','110.184.221.28','/favicon.ico','2018-01-18','1516271186','1');
INSERT INTO `cn_user` VALUES('493','0','03e68bb82e5c837879c64402e5bed214','1b08206a37a800ff87813d50529eefd40ed0d538','110.184.221.28','/favicon.ico','2018-01-18','1516271231','1');
INSERT INTO `cn_user` VALUES('494','0','19b18f54551c9c070faa558cca0c8c27','0db7aef28a58061b54b58bce74a6a0d97e6b6513','106.11.242.192','/','2018-01-19','1516318315','1');
INSERT INTO `cn_user` VALUES('495','0','19b18f54551c9c070faa558cca0c8c27','db58bd00ab9a3d69e8159b694b190db504943ced','139.207.5.240','/mlbd/','2018-01-19','1516334773','1');
INSERT INTO `cn_user` VALUES('496','0','19b18f54551c9c070faa558cca0c8c27','baa85aba0e90802b105fa3ab41a1a6cacb8ca334','123.151.148.55','/about/','2018-01-19','1516334856','1');
INSERT INTO `cn_user` VALUES('497','0','19b18f54551c9c070faa558cca0c8c27','b2a6a57895e0159b2910d3aaf73998fed81af037','123.151.153.120','/fwfl/','2018-01-19','1516334894','1');
INSERT INTO `cn_user` VALUES('498','0','19b18f54551c9c070faa558cca0c8c27','1a2dd9945cd34ad09a066ea1c554c447d580580b','111.30.143.27','/','2018-01-19','1516334894','1');
INSERT INTO `cn_user` VALUES('499','0','19b18f54551c9c070faa558cca0c8c27','c6cfea340b0cd76f06037ef745df4488f5fafd79','125.39.132.52','/','2018-01-19','1516334894','1');
INSERT INTO `cn_user` VALUES('500','0','19b18f54551c9c070faa558cca0c8c27','cfa862991ba183d5dcc03b9b8e9e56a4e15e5c0f','120.204.17.67','/fwfl','2018-01-19','1516334908','1');
INSERT INTO `cn_user` VALUES('501','0','19b18f54551c9c070faa558cca0c8c27','9a04e10aaadafc4ae15deac11f3af590b87f38aa','117.136.63.176','/contact/','2018-01-19','1516344868','1');
INSERT INTO `cn_user` VALUES('502','0','19b18f54551c9c070faa558cca0c8c27','c76c12caff86fdd73da2907dcf9c6a5024aa3fd5','118.116.93.114','/_vti_bin/owssvr.dll?ul=1&act=4&build=4518&strmver=4&capreq=0','2018-01-19','1516358340','1');
INSERT INTO `cn_user` VALUES('503','0','ec508e5608d53cbeb3d9825443958266','585a38c597e1953e6d83e513103bdbfed4daf85a','106.11.227.212','/','2018-01-20','1516405133','1');
INSERT INTO `cn_user` VALUES('504','0','ec508e5608d53cbeb3d9825443958266','68f2123c2d6f0d1c5a5032d759577ac39b935071','112.226.250.219','/contact/','2018-01-20','1516435868','1');
INSERT INTO `cn_user` VALUES('505','0','ec508e5608d53cbeb3d9825443958266','48223d17c53785a69bf9d5a8af832f66f115a620','223.167.152.125','/','2018-01-20','1516435869','1');
INSERT INTO `cn_user` VALUES('506','0','ec508e5608d53cbeb3d9825443958266','5342f5cba7fc08877c1a741e148c6f54e7e62929','223.167.152.124','/','2018-01-20','1516435870','1');
INSERT INTO `cn_user` VALUES('507','0','ec508e5608d53cbeb3d9825443958266','d333441b2c734e8b7ad68aff0e351b58248c981b','120.204.17.46','/','2018-01-20','1516435879','1');
INSERT INTO `cn_user` VALUES('508','0','ec508e5608d53cbeb3d9825443958266','62964e9ba02bbbb10516a9b77c6dd12c02bc741c','183.192.201.97','/','2018-01-20','1516435880','1');
INSERT INTO `cn_user` VALUES('509','0','ec508e5608d53cbeb3d9825443958266','62964e9ba02bbbb10516a9b77c6dd12c02bc741c','183.192.201.97','/','2018-01-20','1516435880','1');
INSERT INTO `cn_user` VALUES('510','0','ec508e5608d53cbeb3d9825443958266','0064cd6bc000517b3906fe965dc3b06107e08c0f','120.204.17.73','/','2018-01-20','1516435880','1');
INSERT INTO `cn_user` VALUES('511','0','ec508e5608d53cbeb3d9825443958266','0064cd6bc000517b3906fe965dc3b06107e08c0f','120.204.17.73','/','2018-01-20','1516435880','1');
INSERT INTO `cn_user` VALUES('512','0','ec508e5608d53cbeb3d9825443958266','62964e9ba02bbbb10516a9b77c6dd12c02bc741c','183.192.201.97','/','2018-01-20','1516435880','1');
INSERT INTO `cn_user` VALUES('513','0','ec508e5608d53cbeb3d9825443958266','1a41b2c46f3a93e96d689c6fa95928c349deb758','120.204.17.46','/','2018-01-20','1516435881','1');
INSERT INTO `cn_user` VALUES('514','0','ec508e5608d53cbeb3d9825443958266','8e28bdea5b11406d4200360cc4a48d0bb51d4d46','120.204.17.69','/','2018-01-20','1516435890','1');
INSERT INTO `cn_user` VALUES('515','0','ec508e5608d53cbeb3d9825443958266','8e28bdea5b11406d4200360cc4a48d0bb51d4d46','120.204.17.69','/','2018-01-20','1516435890','1');
INSERT INTO `cn_user` VALUES('516','0','ec508e5608d53cbeb3d9825443958266','8a965aee397ab4ccb9a39e91ef441e7fb10ddeae','120.204.17.69','/mlbd','2018-01-20','1516435944','1');
INSERT INTO `cn_user` VALUES('517','0','0eab23a7d12a605f7ff26e27f6f7173f','a279ff747c3bef7cc5d3e733d335c539e7459227','106.11.226.157','/','2018-01-21','1516490235','1');
INSERT INTO `cn_user` VALUES('518','0','0eab23a7d12a605f7ff26e27f6f7173f','77a80c42f601cd26962281834774f90e7e0871c7','119.6.107.88','/about/','2018-01-21','1516515747','1');
INSERT INTO `cn_user` VALUES('519','0','5cb7188f4d5d2c27b3838dae2dd1af1e','dc95b3d1febba90ba9651976996e7a1e49c90cfb','106.11.226.82','/','2018-01-22','1516579044','1');
INSERT INTO `cn_user` VALUES('520','0','5cb7188f4d5d2c27b3838dae2dd1af1e','d654272feac638dfb3d6c52b02f9d88bee626355','110.184.220.84','/favicon.ico','2018-01-22','1516588584','1');
INSERT INTO `cn_user` VALUES('521','0','5cb7188f4d5d2c27b3838dae2dd1af1e','f374a864a308a5ec66b4f02394097fc535e5f101','118.116.93.114','/about/','2018-01-22','1516597783','1');
INSERT INTO `cn_user` VALUES('522','0','5cb7188f4d5d2c27b3838dae2dd1af1e','dd5a88cd02213513e67cb4061a6ce878981abb0a','123.151.148.55','/','2018-01-22','1516597786','1');
INSERT INTO `cn_user` VALUES('523','0','5cb7188f4d5d2c27b3838dae2dd1af1e','93d0fb8b460ad78a06ba81ff61e4f65f6ea6a26e','118.116.93.114','/about/','2018-01-22','1516597827','1');
INSERT INTO `cn_user` VALUES('524','0','5cb7188f4d5d2c27b3838dae2dd1af1e','b8c56efc94da0422f8d2448b41ff883f7e67ff13','125.39.132.58','/','2018-01-22','1516597829','1');
INSERT INTO `cn_user` VALUES('525','0','5cb7188f4d5d2c27b3838dae2dd1af1e','b8c56efc94da0422f8d2448b41ff883f7e67ff13','125.39.132.58','/','2018-01-22','1516597829','1');
INSERT INTO `cn_user` VALUES('526','0','5cb7188f4d5d2c27b3838dae2dd1af1e','672b651215ab8af263edf362b414889ff51aa6fb','111.30.143.27','/','2018-01-22','1516597830','1');
INSERT INTO `cn_user` VALUES('527','0','5cb7188f4d5d2c27b3838dae2dd1af1e','672b651215ab8af263edf362b414889ff51aa6fb','111.30.143.27','/','2018-01-22','1516597830','1');
INSERT INTO `cn_user` VALUES('528','0','5cb7188f4d5d2c27b3838dae2dd1af1e','208785ea3ca7f3399c41a193c892bcf14aab4915','123.151.148.58','/','2018-01-22','1516597830','1');
INSERT INTO `cn_user` VALUES('529','0','5cb7188f4d5d2c27b3838dae2dd1af1e','cead4f6c36a0796b2b1c35a2e8ca5b82af17dc18','123.151.153.120','/','2018-01-22','1516597830','1');
INSERT INTO `cn_user` VALUES('530','0','5cb7188f4d5d2c27b3838dae2dd1af1e','3c876ca9e9fed97087778ac67e7b83f3767f9a5d','120.204.17.68','/about','2018-01-22','1516597842','1');
INSERT INTO `cn_user` VALUES('531','0','5cb7188f4d5d2c27b3838dae2dd1af1e','c14a75f05f35a6691460dfd6ae1516596e4da1aa','120.204.17.69','/contact','2018-01-22','1516597899','1');
INSERT INTO `cn_user` VALUES('532','0','a795d3951214ac1a096c7582e71487fa','f4c27a09a07ef032606b32ec0434f4ef1b044601','106.11.226.164','/','2018-01-23','1516668108','1');
INSERT INTO `cn_user` VALUES('533','0','64491f7c02855a18d8304107b3a104f1','4bd685d5d4bed02ff50a85b4f52a6ef1f950f4b0','106.11.226.77','/','2018-01-24','1516755085','1');
INSERT INTO `cn_user` VALUES('534','0','64491f7c02855a18d8304107b3a104f1','dd1860e147175415b69261e8821079ba19565742','125.69.45.221','/?v=7','2018-01-24','1516797260','1');
INSERT INTO `cn_user` VALUES('535','0','64491f7c02855a18d8304107b3a104f1','4866431183dfda81810022a3a1d2aacea82189cd','125.69.45.221','/contact/','2018-01-24','1516797390','1');
INSERT INTO `cn_user` VALUES('536','0','64491f7c02855a18d8304107b3a104f1','474ca6878c8946542ba43e7590b12610dc0e46b2','58.247.212.98','/contact','2018-01-24','1516797450','1');
INSERT INTO `cn_user` VALUES('537','0','64491f7c02855a18d8304107b3a104f1','b8c68593a9bc838d117ed38b222e50c1bf3a69b2','101.226.65.107','/about','2018-01-24','1516797453','1');
INSERT INTO `cn_user` VALUES('538','0','64491f7c02855a18d8304107b3a104f1','385cc7f33dff3cccf17db10a8d82251af76d52e3','120.204.17.73','/about','2018-01-24','1516797502','1');
INSERT INTO `cn_user` VALUES('539','0','64491f7c02855a18d8304107b3a104f1','926538084a245a00138f1a6e36777aade08977d3','139.207.38.188','/mlbd/','2018-01-24','1516798229','1');
INSERT INTO `cn_user` VALUES('540','0','d068ba6632155b9ef021ec3fd50d9df4','402b83b753376f474c9c598f9978c3ad61c86898','171.210.247.22','/contact/','2018-01-25','1516845464','1');
INSERT INTO `cn_user` VALUES('541','0','d068ba6632155b9ef021ec3fd50d9df4','f3bba6ec23d8e5511acdf7472ec7a679b652298e','123.151.153.120','/fwfl/','2018-01-25','1516845474','1');
INSERT INTO `cn_user` VALUES('542','0','d068ba6632155b9ef021ec3fd50d9df4','0d35ce93f2abede8692546e1eee8e23f7eed83dd','120.204.17.69','/contact','2018-01-25','1516845523','1');
INSERT INTO `cn_user` VALUES('543','0','d068ba6632155b9ef021ec3fd50d9df4','0c995e75022941804de2fd65044b5c9eb74fe790','121.51.32.144','/fwfl','2018-01-25','1516845533','1');
INSERT INTO `cn_user` VALUES('544','0','d068ba6632155b9ef021ec3fd50d9df4','571f72e32aa5ae67da38fd31c386e8fa0899d2e8','120.204.17.73','/stjbhl','2018-01-25','1516845536','1');
INSERT INTO `cn_user` VALUES('545','0','d068ba6632155b9ef021ec3fd50d9df4','0c9ea04cee21270ea65113c9cf620f01b34f5c61','120.204.17.46','/mbjchl','2018-01-25','1516845541','1');
INSERT INTO `cn_user` VALUES('546','0','d068ba6632155b9ef021ec3fd50d9df4','6c7f4eef5b31331adb50a0ca4c04a103db79c624','120.204.17.67','/stjbhl/13.html','2018-01-25','1516845548','1');
INSERT INTO `cn_user` VALUES('547','0','d068ba6632155b9ef021ec3fd50d9df4','84a27e1bff0483faa2ec0997bc5e9a7b41a43ca3','120.204.17.68','/','2018-01-25','1516845563','1');
INSERT INTO `cn_user` VALUES('548','0','d068ba6632155b9ef021ec3fd50d9df4','f3e83003422201e933754ec4a8cc0e4568393026','125.39.132.52','/','2018-01-25','1516845580','1');
INSERT INTO `cn_user` VALUES('549','0','d068ba6632155b9ef021ec3fd50d9df4','9af6cba2231577364bad49fc8f80c08ed2bdfc6f','123.151.148.55','/','2018-01-25','1516845580','1');
INSERT INTO `cn_user` VALUES('550','0','d068ba6632155b9ef021ec3fd50d9df4','3ff056ecb1ba78a0e47dd0ee5abc732e1b2fc058','111.30.143.27','/','2018-01-25','1516845580','1');
INSERT INTO `cn_user` VALUES('551','0','d068ba6632155b9ef021ec3fd50d9df4','5790f082f5c0ed408250a9181a130c282947c6d8','110.184.220.84','/fwfl/','2018-01-25','1516846043','1');
INSERT INTO `cn_user` VALUES('552','0','d068ba6632155b9ef021ec3fd50d9df4','cb0179fdec6935368e101e9a1bf703c1b8d8796a','118.116.95.201','/_vti_bin/owssvr.dll?ul=1&act=4&build=4518&strmver=4&capreq=0','2018-01-25','1516846085','1');
INSERT INTO `cn_user` VALUES('553','0','d068ba6632155b9ef021ec3fd50d9df4','bd7ff363994c71740623deac46b09f1d288311cd','183.192.201.97','/fwfl','2018-01-25','1516846102','1');
INSERT INTO `cn_user` VALUES('554','0','d068ba6632155b9ef021ec3fd50d9df4','437c0b2483da57c50a4a109a0ab5684f94a5b02f','120.204.17.71','/favicon.ico','2018-01-25','1516846106','1');
INSERT INTO `cn_user` VALUES('555','0','d068ba6632155b9ef021ec3fd50d9df4','85e409f6ad7757532fb28b3dcc74a8e99a18eb09','110.184.220.84','/favicon.ico','2018-01-25','1516846116','1');
INSERT INTO `cn_user` VALUES('556','0','d068ba6632155b9ef021ec3fd50d9df4','85e409f6ad7757532fb28b3dcc74a8e99a18eb09','110.184.220.84','/','2018-01-25','1516846116','1');
INSERT INTO `cn_user` VALUES('557','0','d068ba6632155b9ef021ec3fd50d9df4','682c2c40b60336b10deeda5de25db5d68c5a3e4a','110.184.220.84','/','2018-01-25','1516846127','1');
INSERT INTO `cn_user` VALUES('558','0','d068ba6632155b9ef021ec3fd50d9df4','5ee14a1ca1727c6906ce37e8a6a917c4e954298d','120.204.17.69','/','2018-01-25','1516846176','1');
INSERT INTO `cn_user` VALUES('559','0','d068ba6632155b9ef021ec3fd50d9df4','55bc12d048752d352b3a123f94bf2751be0da534','61.129.6.148','/hit/?id=13','2018-01-25','1516846213','1');
INSERT INTO `cn_user` VALUES('560','0','d068ba6632155b9ef021ec3fd50d9df4','875e73f2e81f9e184a434d8fecc0c4e0186c70ea','101.226.33.224','/?wrnd=qm','2018-01-25','1516846218','1');
INSERT INTO `cn_user` VALUES('561','0','d068ba6632155b9ef021ec3fd50d9df4','7b6e05dc65c0ee1243018688a804b3594428ace8','120.204.17.69','/mlbd/list-5','2018-01-25','1516846458','1');
INSERT INTO `cn_user` VALUES('562','0','d068ba6632155b9ef021ec3fd50d9df4','043b09b9fac5498ac3335346686f35215bbda9b9','120.204.17.67','/mlbd/list-7','2018-01-25','1516846460','1');
INSERT INTO `cn_user` VALUES('563','0','d068ba6632155b9ef021ec3fd50d9df4','de9666ef7054a199d4061938751090f2fc80167d','120.204.17.69','/about','2018-01-25','1516846468','1');
INSERT INTO `cn_user` VALUES('564','0','d068ba6632155b9ef021ec3fd50d9df4','d259d191b014001b093d522aef6aa2ab2ad94470','120.204.17.68','/team','2018-01-25','1516846472','1');
INSERT INTO `cn_user` VALUES('565','0','d068ba6632155b9ef021ec3fd50d9df4','340ea1515054e6bdc4dd763826df3873eb24b510','120.204.17.68','/api/wxpayjsapi','2018-01-25','1516847059','1');
INSERT INTO `cn_user` VALUES('566','0','d068ba6632155b9ef021ec3fd50d9df4','c08548444c2cdf509d4590e9116417b9f0bffc31','121.51.32.144','/user/paymoney/6-20180125102318.html','2018-01-25','1516847059','1');
INSERT INTO `cn_user` VALUES('567','0','d068ba6632155b9ef021ec3fd50d9df4','ff3327333a6fa1a0af71361f1dc9ef37aaebe32d','120.204.17.68','/stjbhl/10.html','2018-01-25','1516847254','1');
INSERT INTO `cn_user` VALUES('568','0','d068ba6632155b9ef021ec3fd50d9df4','5fa7559e055067a6835b86c76950aaf72874a606','125.39.132.52','/','2018-01-25','1516847493','1');
INSERT INTO `cn_user` VALUES('569','0','d068ba6632155b9ef021ec3fd50d9df4','53773cb636a4ba8ef51d1c793872e5d00a8bfbc6','111.30.143.27','/','2018-01-25','1516847493','1');
INSERT INTO `cn_user` VALUES('570','0','d068ba6632155b9ef021ec3fd50d9df4','05ffe283f4811bd047b21169ef7f51dd082a13a0','120.204.17.69','/stjbhl','2018-01-25','1516848172','1');
INSERT INTO `cn_user` VALUES('571','0','d068ba6632155b9ef021ec3fd50d9df4','0e2221ed2909aab01de85309ff60c0d859852e2f','120.204.17.73','/user/paymoney/7-20180125104254.html','2018-01-25','1516848235','1');
INSERT INTO `cn_user` VALUES('572','0','d068ba6632155b9ef021ec3fd50d9df4','3fb93e35bc298ebef81efb8262d3342ccc7ae327','123.151.148.55','/stjbhl/13.html','2018-01-25','1516848325','1');
INSERT INTO `cn_user` VALUES('573','0','d068ba6632155b9ef021ec3fd50d9df4','bb5954ac0b860c68c2f621088738903d05682e55','183.192.201.97','/fwfl','2018-01-25','1516848380','1');
INSERT INTO `cn_user` VALUES('574','0','d068ba6632155b9ef021ec3fd50d9df4','102093e164543a07fc933eb5576a176847f6fa5d','120.204.17.68','/user/paymoney/7-20180125104549.html','2018-01-25','1516848410','1');
INSERT INTO `cn_user` VALUES('575','0','d068ba6632155b9ef021ec3fd50d9df4','4714ebe61e140d7b2adfef6b4f4ae1353dc86c6c','120.204.17.67','/stjbhl/10.html','2018-01-25','1516848438','1');
INSERT INTO `cn_user` VALUES('576','0','d068ba6632155b9ef021ec3fd50d9df4','fe610edbbb3c23180fd02c09a271558e89bf9072','183.192.201.97','/api/wxpayjsapi','2018-01-25','1516848477','1');
INSERT INTO `cn_user` VALUES('577','0','d068ba6632155b9ef021ec3fd50d9df4','529e9113f14b6f8dc56d0b9169edf01a3d37204f','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516848849','1');
INSERT INTO `cn_user` VALUES('578','0','d068ba6632155b9ef021ec3fd50d9df4','d95248d538308261a4af41b9dc8b1ddea150da08','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516848862','1');
INSERT INTO `cn_user` VALUES('579','0','d068ba6632155b9ef021ec3fd50d9df4','6a0f4a022b6369ac39504c7e8219b3f0e5ec225f','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516848879','1');
INSERT INTO `cn_user` VALUES('580','0','d068ba6632155b9ef021ec3fd50d9df4','d527b8ba73de4cce5a589d3c381205791340c872','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516848911','1');
INSERT INTO `cn_user` VALUES('581','0','d068ba6632155b9ef021ec3fd50d9df4','785842c4e815eaef447f5dc08af706566e6caa35','111.30.143.27','/','2018-01-25','1516849083','1');
INSERT INTO `cn_user` VALUES('582','0','d068ba6632155b9ef021ec3fd50d9df4','c147a3c2ced176834dc95c064d65e8c0ded75269','125.39.132.52','/','2018-01-25','1516849083','1');
INSERT INTO `cn_user` VALUES('583','0','d068ba6632155b9ef021ec3fd50d9df4','d9e358ee9b738e269663cd2ecc852e528bcefc12','140.207.54.74','/api/notify/id/7-20180125105352','2018-01-25','1516849093','1');
INSERT INTO `cn_user` VALUES('584','0','d068ba6632155b9ef021ec3fd50d9df4','7c74e564b8fc17d4b6ad068138ae3ae9fbb80153','123.151.148.55','/stjbhl/13.html','2018-01-25','1516849115','1');
INSERT INTO `cn_user` VALUES('585','0','d068ba6632155b9ef021ec3fd50d9df4','5a710806192ecd408e710b8f2825b94b4569c9d5','123.151.148.55','/stjbhl/13.html','2018-01-25','1516849123','1');
INSERT INTO `cn_user` VALUES('586','0','d068ba6632155b9ef021ec3fd50d9df4','1ec8425992b794073aa34ce7612c30d5e9254271','106.11.225.95','/','2018-01-25','1516849998','1');
INSERT INTO `cn_user` VALUES('587','0','d068ba6632155b9ef021ec3fd50d9df4','a53bd6573e327d9eba7ec2d64eb1fe1f4b1de96e','140.207.54.75','/api/notify/id/7-20180125105352','2018-01-25','1516850895','1');
INSERT INTO `cn_user` VALUES('588','0','d068ba6632155b9ef021ec3fd50d9df4','71a90a452e0a2356a2a969d69d6fc8b9e0c36b77','140.207.54.74','/api/notify/id/7-20180125105352','2018-01-25','1516852697','1');
INSERT INTO `cn_user` VALUES('589','0','d068ba6632155b9ef021ec3fd50d9df4','b62429b9d3b03fcccd4c55097745dc07b32881b5','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516854500','1');
INSERT INTO `cn_user` VALUES('590','0','d068ba6632155b9ef021ec3fd50d9df4','62a6bd65a04d543d3d8b656ec6c72ffceb2f9093','140.207.54.73','/api/notify/id/7-20180125105352','2018-01-25','1516856303','1');
INSERT INTO `cn_user` VALUES('591','0','d068ba6632155b9ef021ec3fd50d9df4','9093ddb1058d4c4fc48855cf8a4003984f9eae3b','140.207.54.76','/api/notify/id/7-20180125105352','2018-01-25','1516859904','1');
INSERT INTO `cn_user` VALUES('592','0','d068ba6632155b9ef021ec3fd50d9df4','acc2d18af8e3bf332ab37225e23b3000780282b1','140.205.225.200','/index.php?m=member&c=index&a=register&siteid=1','2018-01-25','1516867467','1');
INSERT INTO `cn_user` VALUES('593','0','d068ba6632155b9ef021ec3fd50d9df4','d763c98e8c27a4ff728dd11ffeaf56f74a22589e','140.205.225.200','/index.php?m=wap&a=index&siteid=1','2018-01-25','1516867574','1');
INSERT INTO `cn_user` VALUES('594','0','394d4fbd0cae61516e1d9b0a644a4a8e','37c0698290e178bc60324162721c33850abf351a','118.116.95.201','/_vti_bin/owssvr.dll?ul=1&act=4&build=4518&strmver=4&capreq=0','2018-01-26','1516932045','1');
INSERT INTO `cn_user` VALUES('595','0','394d4fbd0cae61516e1d9b0a644a4a8e','b46a78e1ba533e75deae6e0eb6f3631c9ac43ae6','118.116.95.201','/favicon.ico','2018-01-26','1516932046','1');
INSERT INTO `cn_user` VALUES('596','0','394d4fbd0cae61516e1d9b0a644a4a8e','feb5f7c473256c1fab694ef63b4f3fccc80a98e4','171.210.234.126','/fwfl/','2018-01-26','1516935520','1');
INSERT INTO `cn_user` VALUES('597','0','394d4fbd0cae61516e1d9b0a644a4a8e','2d860471991866e8040936a65759e0ba156b9d39','120.204.17.67','/mlyy/list-25','2018-01-26','1516935686','1');
INSERT INTO `cn_user` VALUES('598','0','394d4fbd0cae61516e1d9b0a644a4a8e','a57e0d29438a01fec0c5e0cf76ceb3bc6a28a1a6','120.204.17.73','/yyservice','2018-01-26','1516935692','1');
INSERT INTO `cn_user` VALUES('599','0','394d4fbd0cae61516e1d9b0a644a4a8e','d194a68fc7cbdb0e99c810357f6e38db95b9d7dc','120.204.17.69','/jsyy','2018-01-26','1516935693','1');
INSERT INTO `cn_user` VALUES('600','0','394d4fbd0cae61516e1d9b0a644a4a8e','022ad3918c72cb725727c52b1dc63650c8fa0b88','120.204.17.67','/team/14.html','2018-01-26','1516935815','1');
INSERT INTO `cn_user` VALUES('601','0','394d4fbd0cae61516e1d9b0a644a4a8e','9b562fb153c6694cdc1720cc7ecc5a7e0638ed37','120.204.17.71','/mlyy/list-25','2018-01-26','1516936396','1');
INSERT INTO `cn_user` VALUES('602','0','394d4fbd0cae61516e1d9b0a644a4a8e','81f611c16c90acdd433d3700671c6f60f5e5a383','106.11.242.38','/','2018-01-26','1516937299','1');
INSERT INTO `cn_user` VALUES('603','0','5f3479b98f4296fadc6cef78efdd0c01','3d15a1a4ea3d20f58849a139e96a960919ac5ee1','106.11.242.75','/','2018-01-27','1517023564','1');
INSERT INTO `cn_user` VALUES('604','0','20cf33ea92070c97ded204543a9a4c32','bb26d4bbf349613004eaa023265874fefa288305','106.11.225.197','/','2018-01-28','1517102210','1');
INSERT INTO `cn_user` VALUES('605','0','48910a8d14cb2fa0a3d3b4548b553607','adafe3b385e94e398a885a6f346b61583fc5f28e','182.150.133.15','/','2018-01-29','1517187406','1');
INSERT INTO `cn_user` VALUES('606','0','48910a8d14cb2fa0a3d3b4548b553607','3eec98e8feecd1106f36c9cf4a7650e874e85d32','120.204.17.68','/','2018-01-29','1517187465','1');
INSERT INTO `cn_user` VALUES('607','0','48910a8d14cb2fa0a3d3b4548b553607','90833209c84654f378421af65017e20f22abcac4','106.11.227.80','/','2018-01-29','1517188316','1');
INSERT INTO `cn_user` VALUES('608','0','48910a8d14cb2fa0a3d3b4548b553607','80a14cb2f695aaa8b61aa572d64267c7c92d7e01','101.226.225.85','/?v=7','2018-01-29','1517189435','1');
INSERT INTO `cn_user` VALUES('609','0','48910a8d14cb2fa0a3d3b4548b553607','bf8a2962191196105fca47d7d4caeccb74afa932','101.226.33.200','/comm/css/bootstrap.css.map','2018-01-29','1517189438','1');
INSERT INTO `cn_user` VALUES('610','0','48910a8d14cb2fa0a3d3b4548b553607','5565c99816d75a3d704c138daeb66d3ec5245cf9','101.226.33.225','/?wrnd=qm','2018-01-29','1517189442','1');
INSERT INTO `cn_user` VALUES('611','0','48910a8d14cb2fa0a3d3b4548b553607','f1d126dc8d30123781bc31f9d97f8b6e6237ec00','101.226.33.206','/fwfl','2018-01-29','1517189445','1');
INSERT INTO `cn_user` VALUES('612','0','48910a8d14cb2fa0a3d3b4548b553607','ca0ff7049b02bd2740d181991d8d024ce243e25b','101.226.33.226','/?v=7','2018-01-29','1517208421','1');
INSERT INTO `cn_user` VALUES('613','0','48910a8d14cb2fa0a3d3b4548b553607','bbbd0b06a8df1350cefe1f04dccd75595767dbea','120.204.17.71','/','2018-01-29','1517208422','1');
INSERT INTO `cn_user` VALUES('614','0','48910a8d14cb2fa0a3d3b4548b553607','6d51d12afdc121aeb2bd7d5f8cb9982a8ca61555','61.129.8.179','/comm/css/bootstrap.css.map','2018-01-29','1517208427','1');
INSERT INTO `cn_user` VALUES('615','0','48910a8d14cb2fa0a3d3b4548b553607','1a2c5e77add76e1b6a897492fd7536c24e351e86','171.210.209.110','/fwfl/','2018-01-29','1517208450','1');
INSERT INTO `cn_user` VALUES('616','0','48910a8d14cb2fa0a3d3b4548b553607','70edde8b01e0238525db96b8b4f310335fbd3d85','61.151.178.176','/mlyy','2018-01-29','1517208467','1');
INSERT INTO `cn_user` VALUES('617','0','48910a8d14cb2fa0a3d3b4548b553607','44eb59eacbfaea80817438a6460ea05496e21242','58.247.212.98','/favicon.ico','2018-01-29','1517208513','1');
INSERT INTO `cn_user` VALUES('618','0','48910a8d14cb2fa0a3d3b4548b553607','eb756db4d0a0c9621fd458dd74c880a6b86ed2bd','183.192.201.97','/mlyy/list-25','2018-01-29','1517208557','1');
INSERT INTO `cn_user` VALUES('619','0','48910a8d14cb2fa0a3d3b4548b553607','16e5956e1f9e4aa77a8c4748e4d1fff95b8850f9','222.211.203.95','/mlbd/','2018-01-29','1517208558','1');
INSERT INTO `cn_user` VALUES('620','0','48910a8d14cb2fa0a3d3b4548b553607','6f2e2e35c93347cd528df7ee95c1df2817924cbf','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517208587','1');
INSERT INTO `cn_user` VALUES('621','0','48910a8d14cb2fa0a3d3b4548b553607','55d5c5df30c63ecfdafbb80c0276298607d65841','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517208610','1');
INSERT INTO `cn_user` VALUES('622','0','48910a8d14cb2fa0a3d3b4548b553607','ab0c90b2ed4bdfd210e75fe27f043af04f909079','121.51.32.144','/mlbd','2018-01-29','1517208619','1');
INSERT INTO `cn_user` VALUES('623','0','48910a8d14cb2fa0a3d3b4548b553607','4cfaea7956f6e9a831a3fb75b85ab248addf1f58','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517208626','1');
INSERT INTO `cn_user` VALUES('624','0','48910a8d14cb2fa0a3d3b4548b553607','626331d417339541651f6a5f29b26d7f22e6c079','120.204.17.73','/api/wxpayjsapi','2018-01-29','1517208638','1');
INSERT INTO `cn_user` VALUES('625','0','48910a8d14cb2fa0a3d3b4548b553607','4195d8416d4135e0c9720cf064eba7222e55994a','120.204.17.46','/user/paymoney/7-20180129024936.html','2018-01-29','1517208638','1');
INSERT INTO `cn_user` VALUES('626','0','48910a8d14cb2fa0a3d3b4548b553607','8fdb533fbf59debca56dbb546489fd4d64fbea26','140.207.54.75','/api/notify/id/7-20180129024936','2018-01-29','1517208657','1');
INSERT INTO `cn_user` VALUES('627','0','48910a8d14cb2fa0a3d3b4548b553607','725a809134d80b5a6c539725b37361a071ffa688','183.192.201.97','/yyservice','2018-01-29','1517208664','1');
INSERT INTO `cn_user` VALUES('628','0','48910a8d14cb2fa0a3d3b4548b553607','4b559ed11c7635efe267ec70f4e163a430f053d6','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517208838','1');
INSERT INTO `cn_user` VALUES('629','0','48910a8d14cb2fa0a3d3b4548b553607','91af96d2aa93a522d014c5798aa5a523c2c8cf08','101.226.33.219','/jsyy','2018-01-29','1517208859','1');
INSERT INTO `cn_user` VALUES('630','0','48910a8d14cb2fa0a3d3b4548b553607','87c1815804e9c755651675e6f7d7c75b034b4650','58.247.212.98','/fwfl','2018-01-29','1517209735','1');
INSERT INTO `cn_user` VALUES('631','0','48910a8d14cb2fa0a3d3b4548b553607','621b9035396a206d3826e93880d49b564d71864a','120.204.17.73','/mlyy','2018-01-29','1517209738','1');
INSERT INTO `cn_user` VALUES('632','0','48910a8d14cb2fa0a3d3b4548b553607','6a061c9d6b081e79a2f75a665b158a97a39a86af','120.204.17.68','/yyservice','2018-01-29','1517209859','1');
INSERT INTO `cn_user` VALUES('633','0','48910a8d14cb2fa0a3d3b4548b553607','e64deac1b9fd9147d9e30c048a3fce2cc91d9282','58.247.212.98','/team/14.html','2018-01-29','1517210189','1');
INSERT INTO `cn_user` VALUES('634','0','48910a8d14cb2fa0a3d3b4548b553607','d7e67f22ea5a281adbcee06d86569b280b613d8b','140.207.54.74','/api/notify/id/7-20180129024936','2018-01-29','1517210640','1');
INSERT INTO `cn_user` VALUES('635','0','48910a8d14cb2fa0a3d3b4548b553607','3c8fef9142e609cba15eb332a73baffa7a57d2bf','101.226.33.204','/mlyy','2018-01-29','1517210848','1');
INSERT INTO `cn_user` VALUES('636','0','48910a8d14cb2fa0a3d3b4548b553607','533cb33c6bf16b2befc053dac85c74ca0d9636b2','121.51.32.144','/jsyy','2018-01-29','1517211050','1');
INSERT INTO `cn_user` VALUES('637','0','48910a8d14cb2fa0a3d3b4548b553607','7ba7f16ded153553d605667aeeaba67cd92ccf52','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517212441','1');
INSERT INTO `cn_user` VALUES('638','0','48910a8d14cb2fa0a3d3b4548b553607','9e3e13b1cfd2220bf4d89e0b71b7e3844d72a145','101.226.33.239','/mlyy/list-25','2018-01-29','1517213815','1');
INSERT INTO `cn_user` VALUES('639','0','48910a8d14cb2fa0a3d3b4548b553607','1f1ad262c31f81a54db14e2558b0e1f326cc52ef','140.207.54.76','/api/notify/id/7-20180129024936','2018-01-29','1517214243','1');
INSERT INTO `cn_user` VALUES('640','0','48910a8d14cb2fa0a3d3b4548b553607','242827671906bc45f4baf41d86b53320910f790b','140.207.54.74','/api/notify/id/7-20180129024936','2018-01-29','1517216046','1');
INSERT INTO `cn_user` VALUES('641','0','48910a8d14cb2fa0a3d3b4548b553607','05b30df3c1fb107568529e17ca14967616614d21','101.226.33.221','/team/14.html','2018-01-29','1517216237','1');
INSERT INTO `cn_user` VALUES('642','0','48910a8d14cb2fa0a3d3b4548b553607','d68b6a7c95050e83e611510cc0a785fbf3c50396','101.226.66.181','/hit/?id=14','2018-01-29','1517216238','1');
INSERT INTO `cn_user` VALUES('643','0','48910a8d14cb2fa0a3d3b4548b553607','ec43dd41a3c313168f1a84afe76890e159c9524a','61.151.179.83','/team/14.html','2018-01-29','1517217514','1');
INSERT INTO `cn_user` VALUES('644','0','48910a8d14cb2fa0a3d3b4548b553607','df4261b5815927b82f10188ba99882990d0fe698','140.207.54.74','/api/notify/id/7-20180129024936','2018-01-29','1517219649','1');
INSERT INTO `cn_user` VALUES('645','0','48910a8d14cb2fa0a3d3b4548b553607','4c8de60a76da64a7b21f4cf04e064f0e087d8810','101.226.225.59','/mlyy/list-25/?k=?','2018-01-29','1517219946','1');
INSERT INTO `cn_user` VALUES('646','0','48910a8d14cb2fa0a3d3b4548b553607','8942d9c149ec98a06a6799c7f4743e805265daff','101.226.33.225','/mlyy/list-25/?k=%e6%a2%85%e8%80%81%e5%b8%88','2018-01-29','1517219946','1');
INSERT INTO `cn_user` VALUES('647','0','48910a8d14cb2fa0a3d3b4548b553607','8b7a6787334df3f4107a86da9c5596b5d739a8a2','61.129.8.179','/?ec','2018-01-29','1517222838','1');
INSERT INTO `cn_user` VALUES('648','0','48910a8d14cb2fa0a3d3b4548b553607','8534ea0de92deb04b9b4113fe4ed2880ae4f0893','182.150.133.15','/favicon.ico','2018-01-29','1517225208','1');
INSERT INTO `cn_user` VALUES('649','0','48910a8d14cb2fa0a3d3b4548b553607','831bfef760cd4ee4f4b79abc725b6738d9e51936','182.150.133.15','/favicon.ico','2018-01-29','1517225217','1');
INSERT INTO `cn_user` VALUES('650','0','48910a8d14cb2fa0a3d3b4548b553607','ad767b5b2d5cc47fdbe83f363efe0ebaa9c8967a','182.150.133.15','/favicon.ico','2018-01-29','1517225219','1');
INSERT INTO `cn_user` VALUES('651','0','48910a8d14cb2fa0a3d3b4548b553607','81941d54aeae06e98d9b14f9f2a8835775640ce1','182.150.133.15','/favicon.ico','2018-01-29','1517225223','1');
INSERT INTO `cn_user` VALUES('652','0','48910a8d14cb2fa0a3d3b4548b553607','0221ff4e40d75761a756d18d4366c84af39593f3','182.150.133.15','/favicon.ico','2018-01-29','1517225286','1');
INSERT INTO `cn_user` VALUES('653','0','48910a8d14cb2fa0a3d3b4548b553607','6477908290d8cbc4d00c2e2a94d4b17cf8a4e127','182.150.133.15','/favicon.ico','2018-01-29','1517225293','1');
INSERT INTO `cn_user` VALUES('654','0','48910a8d14cb2fa0a3d3b4548b553607','673bb514183a526d248d53adf230275bc6bdffe9','182.150.133.15','/favicon.ico','2018-01-29','1517225332','1');
INSERT INTO `cn_user` VALUES('655','0','48910a8d14cb2fa0a3d3b4548b553607','b7eea6b8f29a21d9f5f1ee082a1ad442383f040b','182.150.133.15','/favicon.ico','2018-01-29','1517225334','1');
INSERT INTO `cn_user` VALUES('656','0','48910a8d14cb2fa0a3d3b4548b553607','2f7a121e9d7d21015d5172ad8287ec0b13ccf5f3','182.150.133.15','/favicon.ico','2018-01-29','1517225338','1');
INSERT INTO `cn_user` VALUES('657','0','48910a8d14cb2fa0a3d3b4548b553607','7f8d1f02cb28c9cad36908d387ed0c5dd582fa09','182.150.133.15','/favicon.ico','2018-01-29','1517225704','1');
INSERT INTO `cn_user` VALUES('658','0','48910a8d14cb2fa0a3d3b4548b553607','61c3141e8e839e5cbbcc829c1096b887b84a27c1','182.150.133.15','/favicon.ico','2018-01-29','1517225752','1');
INSERT INTO `cn_user` VALUES('659','0','48910a8d14cb2fa0a3d3b4548b553607','d477e3a76890753114a05cc3d54ecf0a8499729e','182.150.133.15','/favicon.ico','2018-01-29','1517225797','1');
INSERT INTO `cn_user` VALUES('660','0','48910a8d14cb2fa0a3d3b4548b553607','4e1ed345f5b4b1917cd10bfa816bfed967d5e502','182.150.133.15','/favicon.ico','2018-01-29','1517226284','1');
INSERT INTO `cn_user` VALUES('661','0','48910a8d14cb2fa0a3d3b4548b553607','b8e69edf24f8211f70d5d160a57ee81813d23bf8','182.150.133.15','/favicon.ico','2018-01-29','1517226288','1');
INSERT INTO `cn_user` VALUES('662','0','48910a8d14cb2fa0a3d3b4548b553607','0bdbf49e7eeed3ffd18e8f8d7d0d8fcb432e0763','182.150.133.15','/favicon.ico','2018-01-29','1517226296','1');
INSERT INTO `cn_user` VALUES('663','0','48910a8d14cb2fa0a3d3b4548b553607','8655b4ab44c70cd62b6f232304f30e2acf89e931','182.150.133.15','/favicon.ico','2018-01-29','1517226299','1');
INSERT INTO `cn_user` VALUES('664','0','48910a8d14cb2fa0a3d3b4548b553607','2f2d9d25bd0e8d8d7fce18862550642b33b13323','182.150.133.15','/favicon.ico','2018-01-29','1517226311','1');
INSERT INTO `cn_user` VALUES('665','0','48910a8d14cb2fa0a3d3b4548b553607','7ebd3bfe43ff2b1142f5a3ef56b64c3cb6a0b581','182.150.133.15','/favicon.ico','2018-01-29','1517226314','1');
INSERT INTO `cn_user` VALUES('666','0','48910a8d14cb2fa0a3d3b4548b553607','c054d1749ea23737feeda38498c2e4cb6ffb60f4','182.150.133.15','/favicon.ico','2018-01-29','1517226362','1');
INSERT INTO `cn_user` VALUES('667','0','48910a8d14cb2fa0a3d3b4548b553607','0b6573e824396cd554ac21f3adcffd3e2ab6adde','182.150.133.15','/favicon.ico','2018-01-29','1517226363','1');
INSERT INTO `cn_user` VALUES('668','0','48910a8d14cb2fa0a3d3b4548b553607','4669b58a97bffd7cfb247ad3a0be564081c9b08b','182.150.133.15','/favicon.ico','2018-01-29','1517226379','1');
INSERT INTO `cn_user` VALUES('669','0','48910a8d14cb2fa0a3d3b4548b553607','0eab34a4794a6b6063d2cf6a4683f0b6e59f1740','182.150.133.15','/favicon.ico','2018-01-29','1517226381','1');
INSERT INTO `cn_user` VALUES('670','0','48910a8d14cb2fa0a3d3b4548b553607','9ddc07adbce783b8978914a4ce3025e5b328a6c9','182.150.133.15','/favicon.ico','2018-01-29','1517226604','1');
INSERT INTO `cn_user` VALUES('671','0','48910a8d14cb2fa0a3d3b4548b553607','ca44ee5a5078148936b878782a9db66e57e5ec09','182.150.133.15','/favicon.ico','2018-01-29','1517226669','1');
INSERT INTO `cn_user` VALUES('672','0','48910a8d14cb2fa0a3d3b4548b553607','3cb58ef70e62dc79dbb6545902ac7acf3c373c1a','182.150.133.15','/favicon.ico','2018-01-29','1517226672','1');
INSERT INTO `cn_user` VALUES('673','0','48910a8d14cb2fa0a3d3b4548b553607','e4ce473ce16ddff9eb406456a38ae45490d69d58','182.150.133.15','/favicon.ico','2018-01-29','1517227662','1');
--
-- 表的结构cn_user_jf
--

DROP TABLE IF EXISTS `cn_user_jf`;
CREATE TABLE `cn_user_jf` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `ty` tinyint(1) DEFAULT '0' COMMENT '积分类型 1收入 2消耗',
  `uid` bigint(9) DEFAULT '0' COMMENT '用户ID',
  `num` int(7) DEFAULT '0' COMMENT '获得积分或抵扣积分值',
  `orderid` varchar(30) DEFAULT '' COMMENT '订单编号',
  `time` bigint(10) DEFAULT '0' COMMENT '写入时间',
  `audit` tinyint(1) DEFAULT '1',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户积分记录明细表';

--
-- 转存表中的数据 cn_user_jf
--

--
-- 表的结构cn_user_yh
--

DROP TABLE IF EXISTS `cn_user_yh`;
CREATE TABLE `cn_user_yh` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `ty` tinyint(1) DEFAULT '0' COMMENT '1关注成为新会员，领取50元优惠券2推送给5个朋友关注成为新会员可以领取一张30元优惠券',
  `pid` bigint(9) DEFAULT '0' COMMENT '优惠ID',
  `uid` bigint(9) DEFAULT NULL,
  `usemoney` int(8) DEFAULT '0' COMMENT '订单最低金额 在商城购买服务，满599可以使用一张50元的优惠券，满399可以使用一张30元的优惠券；优惠券不可叠加使用',
  `money` int(5) DEFAULT '0' COMMENT '优惠金额',
  `audit` tinyint(1) DEFAULT '0' COMMENT '是否使用',
  `usetime` bigint(10) DEFAULT '0' COMMENT '使用时间',
  `useorderid` varchar(30) DEFAULT '' COMMENT '使用对应的订单编号',
  `time` bigint(10) DEFAULT '0' COMMENT '领取时间',
  `start_time` bigint(10) DEFAULT '0' COMMENT '优惠券开始使用日期范围',
  `endtime` bigint(10) DEFAULT '0' COMMENT '优惠券截止使用时间',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户优惠券信息';

--
-- 转存表中的数据 cn_user_yh
--

INSERT INTO `cn_user_yh` VALUES('1','1','0','1','599','50','1','1514045265','1-20171224120745','1514042780','0','1545494400','0');
--
-- 表的结构cn_youhuiquan
--

DROP TABLE IF EXISTS `cn_youhuiquan`;
CREATE TABLE `cn_youhuiquan` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(6) DEFAULT '0' COMMENT '分店id',
  `cntitle` varchar(100) DEFAULT '' COMMENT '优惠券名称',
  `maxmoney` int(6) DEFAULT '0' COMMENT '消费满多少金额',
  `dkmoney` int(5) DEFAULT '0' COMMENT '抵扣金额',
  `time_start` bigint(10) DEFAULT '0' COMMENT '有效期开始时间',
  `time_end` bigint(10) DEFAULT '0' COMMENT '有效期截止时间',
  `time` bigint(10) DEFAULT '0' COMMENT '录入时间',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否审核',
  `s1` bigint(9) DEFAULT '0' COMMENT '领取次数',
  `s2` bigint(9) DEFAULT '0' COMMENT '使用次数',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

--
-- 转存表中的数据 cn_youhuiquan
--

INSERT INTO `cn_youhuiquan` VALUES('1','0','新年优惠活动','500','200','1516118400','1522339200','1516160280','1','0','0','0');
