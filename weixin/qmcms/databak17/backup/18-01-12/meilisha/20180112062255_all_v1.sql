--
-- MySQL database dump
-- Created by wifiguanjia class, Power By quanmei. 
-- http://www.wifiguanjia.com 
--
-- 主机: 127.0.0.1
-- 生成日期: 2018 年  01 月 12 日 06:22
-- MySQL版本: 5.5.53
-- PHP 版本: 5.4.45

--
-- 数据库: `meilisha`
--

-- -------------------------------------------------------

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

INSERT INTO `cn_admin` VALUES('1','qmadmin','c5358a6db37949d725ae280082a99a4a','9','0','','','2018-01-12 13:56:05','139.207.62.231','768','01ebcab5bde4691766028d2998a1a7b6','','','','0','0','主站','','','','0','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_attr
--

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='购物车清单表';

--
-- 转存表中的数据 cn_cart
--

INSERT INTO `cn_cart` VALUES('1','1','10','精油推背','1.00','6','1','0','1515656046');
INSERT INTO `cn_cart` VALUES('2','6','10','精油推背','388.00','4','1','0','1515062984');
INSERT INTO `cn_cart` VALUES('3','8','10','精油推背','0.00','1','1','0','1515142830');
INSERT INTO `cn_cart` VALUES('4','15','10','精油推背','0.00','1','1','0','1515162969');
INSERT INTO `cn_cart` VALUES('5','7','10','精油推背','1.00','4','1','0','1515558380');
INSERT INTO `cn_cart` VALUES('6','14','10','精油推背','1.00','1','1','0','1515561774');
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
INSERT INTO `cn_config` VALUES('17','cfg_f8','QQ多客服','1','7','','1','1');
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
-- 转存表中的数据 cn_info
--

INSERT INTO `cn_info` VALUES('1','企业简介','','0','0','10',',0,1,10,10','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，与皮肤科学相结合，采用高科技光、电设备与专业美容手法相结合，拥有国际尖端的医疗美容设备、皮肤科学专家团队、专业管理技师团队、先进的皮肤护理理念，致力于各类皮肤问题管理、咨询、检测、治疗、护理，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','3','11','2017-12-18 18:17:57','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-10/1.html','0','0');
INSERT INTO `cn_info` VALUES('2','发展理念','','0','0','11',',0,1,11,11','','<p>\r\n	坚持以“让女人更加年轻，自信和美丽”为企业使命，以“走时尚之路，创行业先锋”为公司愿景，倡导“精于求精，止于至善”的经营理念，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>','','','','2','1','2017-12-18 18:18:22','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-11/2.html','0','0');
INSERT INTO `cn_info` VALUES('3','公司业务','','0','0','12',',0,1,12,12','','<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，致力于各类皮肤问题管理，如：色素沉积、红血丝、痘痘痤疮、瘢痕、皱纹、产后修复、脱毛及皮肤的抗衰等的咨询、检测、治疗、护理，皮肤管理师根据不同皮肤状态，选择适用的产品，结合皮肤管理仪器以及正确的皮肤管理手法，对皮肤针对性治疗、调理，以达到改善皮肤问题、拥有优质皮肤的效果。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','','1','1','2017-12-18 18:18:43','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/about/list-12/3.html','0','0');
INSERT INTO `cn_info` VALUES('4','梅老师','','0','0','2',',0,2,2','美容护理师','<p>\r\n	服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。\r\n</p>','','','','1','28','2017-12-18 18:29:34','/Comm/images/img_5.png','/Comm/images/img_5_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','10年','精油推背，全身SPA，养生按摩','获得美容高级技师证、获得美容高级技师证、获得美容高级技师证','13642567189','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','/pub/qm/p/image/171224/095832_431.jpg,/pub/qm/p/image/171224/095832_862.jpg,/pub/qm/p/image/171224/095832_873.jpg,/pub/qm/p/image/171224/095832_638.jpg,/pub/qm/p/image/171224/095832_235.jpg,/pub/qm/p/image/171224/095832_793.jpg','','','0000-00-00','0','/team/4.html','0','0');
INSERT INTO `cn_info` VALUES('5','小苏打去黑头','','0','0','6',',0,4,6,6','','<p>\r\n	<br />\r\n</p>','','','','2','6','2017-12-18 18:33:03','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','清洁脸部的时候，在洗面奶中加入适量的苏打粉，洗面奶的泡沫会变得非常的细腻而且富有弹性。洗过之后会感觉毛孔会非常的清爽。黑头会明显的减少了，还能细致毛孔。','','','','','0000-00-00','0','/mrys/5.html','0','0');
INSERT INTO `cn_info` VALUES('6','ladies','','0','0','5',',0,4,5,5','','<p>\r\n	美容一词，最早源于古希腊的“kosmetikos”，意为“装饰”。无论怎样命名，美容的活动在古代早已存在。考古学家从那一时期发掘的文物中考证，在当时，染料和香水已异地交换使用。到公元前5000年，黑锑粉末被用作描眉和染眉，铅被用来画眼线，绿孔雀石被用来画眼影等，令人惊奇的是，古代妇女化妆与现代妇女有着惊人的相似之处，如染指、趾甲，涂唇，描眉，染发等。\r\n</p>\r\n<p>\r\n	埃及古代时期，人们为了滋润皮肤和防止日晒，在皮肤涂抹各种药剂和油膏。古埃及妇女喜欢用黑颜料来描眼的轮廓，孔雀石粉制成的绿颜料涂在眼皮上，用黑灰色的锑粉把眉毛描得像柳叶一样细长，用乳白色的油脂抹在身上，使用红颜料涂抹嘴唇和脸颊，甚至在手、脚的指甲上都要染上橘红色，非常惹人注目。\r\n</p>\r\n<p>\r\n	美容在欧洲中世纪非常流行，到了文艺复兴时期，美容艺术大大发展。19世纪80年代，西方始出现了近代美容院。在中国殷商时期，人们已用燕地红蓝花叶捣汁凝成脂来饰面。\r\n</p>\r\n<p>\r\n	根据记载，春秋时周郑之女，用白粉敷面，用青黑颜料画眉。在汉代以后，开始出现妆点、扮妆、妆饰等字词。唐代出现了面膜美容。现代的女性对于美容养颜这一块需求非常高，层次也相对不一样。\r\n</p>\r\n<p>\r\n	初谈\r\n</p>\r\n<p>\r\n	《简易经》里记载：“简之矩只容能存之，易之规只美能化之。容则容物亦可护物，物之附表也。美其表、愚蠢目、健其本、乐而可为也。\r\n</p>\r\n<p>\r\n	”在三皇伏羲时期，大家就知道了美容的基本意义。那时候就把容字当做事物的外表，可以保护实质的东西，“美其表”就是美其容的意思。把外表美容一下，可以愚弄蠢笨的眼睛，使对方心中提高对本物的价值观点。美容一下还可以增强其本质的东西，对看家和对本物都有益处。\r\n</p>\r\n<p>\r\n	发展\r\n</p>\r\n<p>\r\n	美容产业迅速发展的驱动力主要在于：首先，中国近几年来居民的需求结构升级、社会的产业结构调整以及农村城市化和城市社区化为中国美容经济的兴起创造了大好机遇。\r\n</p>\r\n<p>\r\n	其次，中国经济持续、高速增长是中国美容经济兴起的根本原因，城乡居民收入的持续增长使美容消费支出的扩大由可能变为现实(10年间增长150%以上)，而中国居民消费结构的变迁直接促进了美容经济的兴起，国民健康意识和生活质量意识的提升更成为美容经济兴起的重要诱因\r\n</p>\r\n<p>\r\n	再者，美容产业所具有的集中性、广泛性、示范性、主导性和阶段性等特点，使美容成为当前中国居民的一大消费热点。\r\n</p>\r\n<p>\r\n	当一个国家的人均收入超过2000美元，即进入中等发达的小康社会后，对医疗整形美容行业的需求会增加10%左右，并每年以这个速度递增。2010年我国美容产业总产值已突破4000亿元，预计未来5年还将翻一番。庞大的市场需要更多的监管，尤其是医疗整形美容。\r\n</p>\r\n<p>\r\n	据《2013-2017年中国美容机构行业深度调研与投资战略规划分析报告》部分数据统计，2009年我国从事医疗整形美容的专业技术人员和相关人员达20余万人，以开展医疗整形美容诊疗业务为主的医疗机构如医疗整形美容医院、诊所和科室超过5万余所(个)，年总营业收入超过150亿元，不包括没有资质而从事美容行业人员，仅仅接受过医疗整形美容服务的人员就累计达到300万人次左右。\r\n</p>\r\n<p>\r\n	但当前的医疗整形美容行业存在服务资源分布不均、机构良莠不齐、存在不正当竞争、医疗事故频发等问题。卫生部门对医疗整形美容行业发展的支持力度不大，在“个别地方监管工作薄弱”，也是造成医疗整形美容行业混乱的原因。医疗整形美容行业存在的问题已引起政府有关部门的高度重视，《医疗整形美容行业发展规划纲要》即将出台。已有越来越多的美容专业机构通过连锁加盟形式，逐步扩散辐射面积抢占市场，行业发展业态初步呈现。从经营项目方面看，传统医学美容医院单一的服务已越来越无法满足市场需求，医学美容与生活美容综合经营，是中国美容产业未来5年的发展趋势及走向。\r\n</p>\r\n<p>\r\n	分类\r\n</p>\r\n<p>\r\n	美容起源于人类的祖先。自从有了人类，就有了美容。美容即是美化人们的容貌。随着社会的发展与科技的提升，美容从内容到形式上都有着不断的变化和提升。根据美容内涵的不同，现代美容可分为生活美容和医学美容两大部分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、生活美容是指专业人士使用专业的护肤化妆品和专业的美容仪器，运用专业的护肤方法和按摩手法，对人体的肌肤进行全面的护理和保养。生活美容可分为护理美容和修饰美容两大类。\r\n</p>\r\n<p>\r\n	2、医学美容是指运用一系列侵入皮肤内的医学手段，对人体的容貌与身体各部位进行维护、修复和再塑。\r\n</p>','','','','1','4','2017-12-18 18:36:34','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','美容一词可以从两个角度来理解。首选是\"容\"这个字，其次是\"美\"。\"容\"包括脸、仪态、和修饰三层意思。','','','','','0000-00-00','0','/mlbd/list-5/6.html','0','0');
INSERT INTO `cn_info` VALUES('7','公司总部','','0','0','8',',0,8,8','','','','','','1','27','2017-12-19 13:33:14','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','四川省成都市成华区双林路87','0832-44446666','30.656120,104.106310','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/contact/7.html','0','0');
INSERT INTO `cn_info` VALUES('8','banner','','0','0','15',',0,14,15,15','','','','','','2','1','2017-12-19 16:11:30','/Comm/images/ban_1.jpg','/Comm/images/ban_1_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/qita/list-15/8.html','0','0');
INSERT INTO `cn_info` VALUES('9','《美丽莎会员使用协议》','','0','0','20',',0,14,20,20','','<p>\r\n	美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议\r\n</p>','','','','1','12','2017-12-19 16:34:00','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','admin','美丽莎皮肤管理中心','0','0','0','0','0','0','0','0','0.00','0','','','','','','0000-00-00','0','/xieyi/9.html','0','0');
INSERT INTO `cn_info` VALUES('10','精油推背','','0','0','16',',0,13,16,16','玫瑰花香，纤纤玉颈','','','','','1','56','2017-12-19 16:52:12','/Comm/images/img_6.png','/Comm/images/img_6_th.png','','','','0','1,2,3,4','0','1','1','0','0000-00-00 00:00:00','适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。','','028-44446666','小萌','','','','','admin','美丽莎皮肤管理中心','1','0','4','0','20','0','0','0','0.00','0','精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。','','/pub/qm/p/image/171224/100607_251.jpg,/pub/qm/p/image/171224/100607_460.jpg,/pub/qm/p/image/171224/100607_880.jpg','','','0000-00-00','0','/stjbhl/10.html','0','0');
INSERT INTO `cn_info` VALUES('11','超微小气泡','','','0','3',',0,3,3','','<p>\r\n	撒点粉撒点粉&nbsp;阿什顿飞暗室逢灯\r\n</p>\r\n<p>\r\n	<img alt=\\\"\\\" src=\\\"/pub/qm/p/image/180105/022028_341.jpg\\\">\r\n</p>','','','','1','1','2018-01-05 10:19:05','/pub/qm/p/image/180105/021944_901.jpg','/pub/qm/p/image/180105/021944_901_th.jpg','','','','0','4','0','1','1','0','','','','','','','','','','admin','美丽莎皮肤管理中心','','0','0','0','0','0','0','0','0.00','0','adsfasdfasdasfd','','','','','','0','/shop/11.html','0','0');
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
-- 表的结构cn_lm_
--

DROP TABLE IF EXISTS `cn_lm_`;
CREATE TABLE `cn_lm_` (
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
-- 转存表中的数据 cn_lm_
--

INSERT INTO `cn_lm_` VALUES('1','关于我们','','0',',0','','1','','','','','1','3','','1','','/about/','/about/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('2','团队介绍','','0',',0','','2','','','','','1','2','','1','','/team/','/team/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('4','美丽宝典','','0',',0','','4','','','','','1','2','','1','','/mlbd/','/mlbd/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('5','优品驾到','','4',',0,4','','1','','','','','1','2','','0','','/mlbd/list-5/','/mlbd/list-5/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('6','美容养生','','4',',0,4','','2','','','','','1','2','','0','','/mrys/','/mrys/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('7','时尚前线','','4',',0,4','','3','','','','','1','2','','0','','/mlbd/list-7/','/mlbd/list-7/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('8','联系我们','','0',',0','','5','','','','','1','3','','1','','/contact/','/contact/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('9','美丽预约','','0',',0','','6','','','','','1','4','','1','','/mlyy/','/mlyy/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('10','企业简介','CORPORATE PROFILE','1',',0,1','','1','','','','/Comm/images/ab_bg1.jpg','1','3','','1','','/about/list-10/','/about/list-10/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('11','发展理念','DEVELOPMENT PHILOSOPHY','1',',0,1','','2','','','','/Comm/images/ab_bg2.jpg','1','3','','1','','/about/list-11/','/about/list-11/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('12','公司业务','COMPANY BUSINESS','1',',0,1','','3','','','','/Comm/images/ab_bg3.jpg','1','3','','1','','/about/list-12/','/about/list-12/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('13','服务分类','','0',',0','','7','','','','','1','2','','1','','/fwfl/','/fwfl/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('14','其它','','0',',0','','8','','','','','1','3','','1','','/qita/','/qita/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('15','banner','','14',',0,14','','1','','','','','1','3','','1','','/qita/list-15/','/qita/list-15/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('16','身体基本护理','','13',',0,13','','1','','','','','1','2','','1','','/stjbhl/','/stjbhl/','/Comm/images/f1.png','0','0','美容与养颜是密不可分的','0');
INSERT INTO `cn_lm_` VALUES('17','面部基础护理','','13',',0,13','','2','','','','','1','2','','1','','/mbjchl/','/mbjchl/','/Comm/images/f2.png','0','0','后天的保养才能拥有完美健康的肌肤','0');
INSERT INTO `cn_lm_` VALUES('18','高端仪器类','','13',',0,13','','3','','','','','1','2','','1','','/gdyql/','/gdyql/','/Comm/images/f1.png','0','0','美容与养颜是密不可分的','0');
INSERT INTO `cn_lm_` VALUES('19','问题肌肤','','13',',0,13','','4','','','','','1','2','','1','','/wtjf/','/wtjf/','/Comm/images/f2.png','0','0','后天的保养才能拥有完美健康的肌肤','0');
INSERT INTO `cn_lm_` VALUES('20','《美丽莎会员使用协议》','','14',',0,14','','2','','','','','1','3','','1','','/xieyi/','/xieyi/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('21','常见问题','','0',',0','','9','','','','','1','1','','1','','/question/','/question/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('22','怎样获取更多优惠券','','0',',0','','10','','','','','1','3','','1','','/getmore/','/getmore/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('23','预约服务','','9',',0,9','','1','','','','','1','4','','1','','/yyservice/','/yyservice/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('24','技师预约','','9',',0,9','','2','','','','','1','4','','1','','/jsyy/','/jsyy/','','0','0','','0');
INSERT INTO `cn_lm_` VALUES('25','预约记录','','9',',0,9','','3','','','','','1','4','','1','','/mlyy/list-25/','/mlyy/list-25/','','0','0','','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=737 DEFAULT CHARSET=utf8;

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
INSERT INTO `cn_log` VALUES('125','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=071Uxnf30CWqyC1bw5e30uxpf30UxnfR','http://mls.keqxz.com/','2018-01-03','1514948994','4d8fqJu/AFNlamg3yRtVFgSOesWoZwD9v5JPgG/G8G0LKVJjjMjT1zio1nPQgGYiKJoymmo6HPqyvIrVf82ZXEUUaGQ+xG+9GQ','0');
INSERT INTO `cn_log` VALUES('126','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514949215','7510CzCiN7i1G/pwWmUx7S0t8g3JjqcSdn3B/Erxf9wQ1+UNzQ17+EH9xV2IdW4dHBaAuB8a/mC7X4ngXofT7NN4PPKviYzTcQ','0');
INSERT INTO `cn_log` VALUES('127','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=071Uxnf30CWqyC1bw5e30uxpf30UxnfR','http://mls.keqxz.com/','2018-01-03','1514951857','a37bbmKj8A7Ns8vUrLrBcvSQxGoautyJWtUnPkc5RBWspJoOtJP6eQ4TC/n7WbBYdrwC8K49lJahixewuhUdO8DZ+ZHoKR5gPA','0');
INSERT INTO `cn_log` VALUES('128','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514951964','692727Md0ry6EHhwJSDa6WZ8wvlaepKzx3DWpn95lx3TyzLLKULr8PhUsEP8pYYjvWnn5JYWnc9L35G4X8mSIpE2d8L3+uUgng','0');
INSERT INTO `cn_log` VALUES('129','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514951977','82afQXwduTMr6M4m47MH5RKfB4ldGWJp4SM1bti/VF2ISyFHdW4mx7+eijI+40JJAA43oAalqusB7ynUB9Hie2v53UUoVpNVBw','0');
INSERT INTO `cn_log` VALUES('130','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514952234','f449a61KvUuW2jLA9ZWqi1MAQNRIUEEB3OUNEvr9sdNzf9t4Wq0IhaqCgRnBEbstau05bHgG4zYxYykmH5iSYcFWsz81pl4eXw','0');
INSERT INTO `cn_log` VALUES('131','39','9','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-03','1514952240','3e89RW17oSnCjhnIzRugtGFAcWAwBf5r87AxVwtLOFHCtpJIfGsODmSmlv2KacKg1qKtoYS5LF7gvJCz3iBB3KNF9zHy+mqNGA','0');
INSERT INTO `cn_log` VALUES('132','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514954206','1583SF0ed7q6XIAalPzbTC+DKGLsY4sR3lbiz3HD9bB0k6fA+7ToWyHtO/7zoVtvatzMusSXBx78xvXJxMyIA0d0BGAhQHXRQA','0');
INSERT INTO `cn_log` VALUES('133','42','13','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-03','1514954220','5b4dUU1of6OM9mNpovThzi0HrCUeAeUx/Oh4ynB0cBUZmfhVK8bVZ75LK9yumrlginjHIbgzadbMXjPx+Ynz80MbL7czbwnQBl8','0');
INSERT INTO `cn_log` VALUES('134','42','16','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-03','1514954222','21b5s8r22gzLfuAgJfX8yrQGJAypsPkEnUK6n2c6SQP9z7cOr3W7f3AfaYaddOUf6XClLySkt/Vw2/Ys3vz3BKmQOGZ3Y9XKPgU','0');
INSERT INTO `cn_log` VALUES('135','42','0','10','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514954224','7077kkdxYBIw9MwfHn39b1gmAJV8nhVqA1zL2w7KExg2UwiyGi99n7OIq3cIMSrQfMUBwmUoWe+Ojz2r5YTG4Gg5wNvU62C2GME','0');
INSERT INTO `cn_log` VALUES('136','42','0','10','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514954271','dd51YxptbrJ8wDjZDl9wOmr8sxJ1XriVT0ZGL2/N+WN455JEsMR4kH/AJYeTVFlZAGff6JFQZVQmnXEx2ubdS6KiDRlk1uayUno','0');
INSERT INTO `cn_log` VALUES('137','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/user/pay/6-20180103123807','http://mls.keqxz.com/?ef','2018-01-03','1514954290','cc70Oi41Pvd9cCXt0WIn5c8eXYr2H0/JFpnoKEr89JLY02CgAnfkShoVN8OLA3+NHZr/t0lpJ37PXL7eC6TZwlaXszTOhEnaow','0');
INSERT INTO `cn_log` VALUES('138','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/user/paymoney/6-20180103123807','http://mls.keqxz.com/?ef','2018-01-03','1514954300','eae2XcbjNlXxj/8vfH2lWHUgzRWRxLUjpHY567Kt9npI0UGglxpaUfm6peke5NKoQsuCBbwC5A3QXt1LV5wMpWD+/uSl3LwoUQ','0');
INSERT INTO `cn_log` VALUES('139','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/user/paymoney/6-20180103123807.html','http://mls.keqxz.com/?ef','2018-01-03','1514954366','df5872aX6QRkHVNwAP1IlfMk3TmKMcZQ9L3wWSXWhZv45LYW0UYFHhA/OZ5eMgpZIuiCUdaxwoZU/jq4R1F+897N2b/Ud2gDrQ','0');
INSERT INTO `cn_log` VALUES('140','41','0','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/admin/user.qm','http://mls.keqxz.com/?V=7','2018-01-03','1514958295','d015kcMDQ1D058XGlOFnCJ/CW1FyaHw+Sd8YQXU7tgCBY2u1Ldz6+W8z0/+/evRAQtMyKHa9YUMksgwqmll3d3xdYNJW6tCG6w','0');
INSERT INTO `cn_log` VALUES('141','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514961969','6190nyiU5u4iqn5l3yFxmz4BZBrReyd41T+PRwtG7y4FExmb8H9KifoYXEmwg+MR4nK/X3snt4FtfiCa8Lv3W4vSgeBtr5X6kg','0');
INSERT INTO `cn_log` VALUES('142','39','0','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514961985','a208msaFSCODkdFDoEmmsXdCgpApKGJNq48YAEco4R6wObny/zsHtElYgTprIi4qpJmbzwMZh+JbuEwZKpGVL6m4yUNuZmdWTw','0');
INSERT INTO `cn_log` VALUES('143','39','13','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-03','1514961989','c964vii4I/sa/d8UBAIkxgcprcE1XXY148gInJ+WHKrn6144zhO2+cUjxO/lI5J4QyNV2RjxzQ7x/2ww3fpDPVC9C1Ui3YMlYTA','0');
INSERT INTO `cn_log` VALUES('144','39','16','0','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-03','1514961990','eab4it/JoXEdB8RpgwxzRKE+YEuRzd0xYNy2MQWBUWEUN0OtaU2NIXSYMeGfLaCNPJXXrK/nlRt4DRPXH8ImOtyJRcBpkfUs48Q','0');
INSERT INTO `cn_log` VALUES('145','39','0','10','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514961992','7066gbFhGEqzAvnpyxHODtz9UHYIR1E/Sx1X0bIMvrXdHU+Btl2WEV5Kknl46+3DTqWZUT9HhMi+n1fRU8QRiHuW4IBAiRhvQ8c','0');
INSERT INTO `cn_log` VALUES('146','39','0','10','d2d168c1b5ab9b15206483b9ed08f76a1b187927','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514962001','0decZkBmlzLpJMrOnlR+hcL7dz+hBivqrDWIX+WHVoZ7c1mYV+x9kUNXHHdBGiB2/JbGz+VPCfJZCVS6ciGoSc4N7a7JxPj7j/U','0');
INSERT INTO `cn_log` VALUES('147','41','0','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514962073','9194MnlcYpEFGG4OiH/V3j9s/0VTZhcrDREBB7Kj9axMD1uTU/Ddx0ZYXMBEnbV1eaDsJahKT/lL/rciMoQA3fMQXHjdxf4m2A','0');
INSERT INTO `cn_log` VALUES('148','41','0','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','','http://mls.keqxz.com/?wrnd=qm','2018-01-03','1514962085','5c5fjKvL0pPZV5xnO/EIodr0WsSzqFIKHh0kXz+rtKecdBdRAUrL8dWPo2BkU+FmClrcqOroCC00y64Yu975f51622a9VsFg9A','0');
INSERT INTO `cn_log` VALUES('149','41','13','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/user/info','http://mls.keqxz.com/fwfl/','2018-01-03','1514962095','06681b5ahTdf9s8hf4GZcDFcWW+fnOFF8FleKcCYm440WvRpWalSG57n14TU5JSlUmqb3EKCju/ca5LhtrW5MjInu39K1HNDQwA','0');
INSERT INTO `cn_log` VALUES('150','41','16','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-03','1514962097','77abFfvWKReK14qIh4EUckuPXAJ/OIBZPxdaiI0fnbXtbWc3LMNzinPNBulrSy47N84x7SkJjtT4J/3448cApXWQbj2kMlLl+DQ','0');
INSERT INTO `cn_log` VALUES('151','41','0','10','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514962099','b456BPs8dJedAxHvEBy7lFic5xBcXc6CUV6axehdQEEDRnygxgZEe0I0uPpw9B+97ZLYqrfAhLztHGzoz6waMA58pzPOzQoFnqY','0');
INSERT INTO `cn_log` VALUES('152','41','0','10','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514962129','9705rn2zmLs1b+ssL3s/2DjpK0Cb78Cz5K1/NiTkcDReR/++Rp0b0+zath77noYKajbQ26twMOdMFc2psBhzw3BaC6DeaTL584k','0');
INSERT INTO `cn_log` VALUES('153','41','13','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/fwfl/','2018-01-03','1514963091','6bf7LbYVENxx38RVj6bw1lpXYcGzDRoXSgYn17YfLZeTcRWwAQ3Grp77LWDvMlOb98AO5Dpi6cJAcspoB5UAB80mBu0XJbDAoqg','0');
INSERT INTO `cn_log` VALUES('154','41','16','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-03','1514963092','a544l3vVwi0XS4AU8eSTzKFJHr7tsJunpn5iixbROsTF6WtNwLs6a6el/LXQwdv59SW5jX/ViTtJQEkVIUTtw7TBuMseL1uPtO8','0');
INSERT INTO `cn_log` VALUES('155','41','0','10','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514963094','4f67whLCUpu+apZ50hLTsLpJ7YmgZNRtC4KnZ6v9bfpHBgwykF/3P6gsToRimmb3NULK4AqGnozrAj0qRBoUHF2yh82G6h/xLOQ','0');
INSERT INTO `cn_log` VALUES('156','41','0','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','','http://mls.keqxz.com/?wrnd=qm','2018-01-03','1514977551','0346GxkJSIYEI8d++tC03rKIPp0rXlbRv1V8F+vfWvPEi5jQoxBLkWefVh7uv1vCkCVl3nqXzQrUtoS6XBYUI8j5/hSEebNb2g','0');
INSERT INTO `cn_log` VALUES('157','41','9','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-03','1514977555','ff412qDIFbz6SrPMOvtlNrru7nyqER1apEutL8AqTG0KAH8KQrOfHjtDQNMyXl2oeAwooUlKTtbSCxZFwkzBqfqenrL7rKfeSA','0');
INSERT INTO `cn_log` VALUES('158','41','24','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-03','1514977560','382fHi7CAZAvWi2Gw0VErFtjynp9ia9RKo29kIO5KmL0qT4vrDa9y8ZE5uJBcSYUxcw3SPGAVJQiUYmPOW5imLnrc/x72ysQd5I','0');
INSERT INTO `cn_log` VALUES('159','41','25','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-03','1514977563','b88aHH930SpHJsY4UHQtBpC3HmpfcJMT+Js1KAwfPBL9SU8nFKWksRV5EnvEyLZf5W3OxI0byuEzo6L4AoI/eLguhdazkK+gR6A','0');
INSERT INTO `cn_log` VALUES('160','41','25','0','41c4e6e74bd828043e9b2f123873b46606d216d1','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-03','1514979028','1352RRtMbvfmfvjLXhGcHSCaQCwld2k9ohJHRvxAyollr80GSrFY70yPSv/y+482rgZsMYVVn9zw9B5T60zR8S9o3vwz7oHGyVs','0');
INSERT INTO `cn_log` VALUES('161','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=001c8i0l2M4z7H0NqG2l201n0l2c8i0M','http://mls.keqxz.com/','2018-01-03','1514979204','4a2fM6dcGAVE9Lhbu2cRrAeOFvqgGlC5Jvbl5GryKzlif21nHlIvHYZuKLxo+PxANQjbaIdTirnhOSKdYG9FxVTRO9j8+jBwTg','0');
INSERT INTO `cn_log` VALUES('162','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=061IaeV22jjGLY03dCT22lMfV22IaeVt','http://mls.keqxz.com/','2018-01-03','1514979204','59719UywMjjhllp0vwtcyvuPU/Cvxw/fDUdhEFRpqaxGkZouzgfFy1x0KDjEP74lvbXgRn2AMmq/omenZnC6GmBoK4zBQcqSSA','0');
INSERT INTO `cn_log` VALUES('163','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=001aroA02WPsx11DHuz02gOIA02aroAm','http://mls.keqxz.com/','2018-01-03','1514979204','bc66zScxngyfTWgxTeuR9j0GdD+f7CZdBP/DovdxxlLwHo1u8a3ehw8jo2G5+6+3zPtOJx9ZDu/dvccifBDE+sez0MEIZ9QqFw','0');
INSERT INTO `cn_log` VALUES('164','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/api/wxpayJSAPI','http://mls.keqxz.com/','2018-01-03','1514979310','ded8UMlq+hQTUOBT4Ft+4RVtVLmvG9gnxOu63tkL1pTxLTKr57BPJGd7DoptoXC/PmBqDVL53w12HcaNUqoKOdKoDhrZBC3Ngg','0');
INSERT INTO `cn_log` VALUES('165','42','0','0','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','','http://mls.keqxz.com/','2018-01-03','1514979478','2809tZg4VUeB+m/C4UB4ueDkjCk9Az6WPzW7pm02fOxfwxMS2MrxuDt/PSOV0+0KmbAUaZu25lTrF4BWHKFJP57bRYgn4/rGUw','0');
INSERT INTO `cn_log` VALUES('166','42','0','10','267e914c9fcef007855c3aba203b2417d19367bc','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/stjbhl/10.html','2018-01-03','1514979636','005bo2obrkTTKkseD/5+Kq49LSfXQs+UrMg2cdXkM16SGjagTB0+Byfbyzg2+DyJ0Y+aKgK7wNAFMHy4A69yxHjrKsNFxNF0svU','0');
INSERT INTO `cn_log` VALUES('167','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515027820','37840cks798jVK3I2Y1dmRSvm9zCG4zEaGJv/+mTOZ8Ir/OPA7mhm2RqmCryHo2zAGhKMR5CC9xH4CgWp9fgB8alWDHe2V0fMBA','0');
INSERT INTO `cn_log` VALUES('168','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','','http://mls.keqxz.com/mlyy/list-25/?wrnd=qm','2018-01-04','1515027922','ce61mdEXLxcDu/qKbPgQBCZVjSkOPn3HtSL7SCqPlR6XZgZDCZmjKxzeck/mQlttna0SPYVkZUNTvckJZyRUtvXfhp/w7Kp80/8','0');
INSERT INTO `cn_log` VALUES('169','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/admin/yuyue.qm','http://mls.keqxz.com/?V=7','2018-01-04','1515030581','f24bTIplYmEUAQssrjr0UUUAiWsO7E2dyoi7Xdt1U5uR8KO8U6LfIbreKITgtucdlIbVoVo3q2cGpTI0qVK39NQnNcN0q97+5A','0');
INSERT INTO `cn_log` VALUES('170','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-04','1515030589','f88coD230t3KlIU3vGzGKtTQV9bTPpFgJr9zimW6y0Ly1wsdbI4N08dMZ7rKvj4zkq9JbpRTdopuUMifD6gSrhiqZYPepaxNQQ','0');
INSERT INTO `cn_log` VALUES('171','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-04','1515030610','7ba38svd3tlYyQN1c6phTsFMiIZnqT6zu7XqpLOrY79t5uAILtjlQ+pzGz93VeJk1baXGmQUWWmLUD0iiTleuy8HlKLKUWeOHw','0');
INSERT INTO `cn_log` VALUES('172','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515030711','2cd7CECf2VA2dOGdNMx153FS4VrS5G31Etwf53rN7MLI20zLlPi3+V+CYC68y+vnnXYCd5UJF/SQSnfPCNqxrq0gFIvw36mVcwc','0');
INSERT INTO `cn_log` VALUES('173','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515031034','a6feJQF93B43U83U17N+8IvahUOIlT5yBmJqdolgrPob1TAKP3PvhANAJ86Ec4oPOVfhbo2OSjmzlu5g+CYcJIsSLT3R+7okGhY','0');
INSERT INTO `cn_log` VALUES('174','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515031080','0f8dNLokpA06Ei0/BAXaq2fEsYGrH2dtZRJoJo93uja3cfbTlu3TWmpdzFzHnEr3t+f0Cr4XTLDBL+sIK02AfW2rjZcUPllWXB0','0');
INSERT INTO `cn_log` VALUES('175','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515031105','bd59CnmpxTWCeRP/NFzkz0YJ23IOnOoGGfMn3BWAxmALLSUCgf2Uhiee12u22oAaoBKFcZwpFqnAnJqXAzIULdKxsJ6czkld9t4','0');
INSERT INTO `cn_log` VALUES('176','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515031444','c2b6IIuc8i+DOJRq8nslrJG/ZU/jbKyDgCJH3IN8PiFz2z63UbzW6XRbpK4LdArMmhMOGjaUmsmAHMiA8TYgxhsY+w2Oo5A2T9g','0');
INSERT INTO `cn_log` VALUES('177','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515031522','7ff701i/K71SSMqL/82UFoVdHjX+/Qq5p8aByjXM6RVd2fatXqmch6QeNgRxLznNn1RY8lHjoES6dxFDoc6s+CIfQCK13GIy8R8','0');
INSERT INTO `cn_log` VALUES('178','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515032051','4a09HpQnFgt3zdkYJz5Jm/xNARvbr8mLfNal5ODCM7m5qh5jOzgjlD184NU4zt30TjRkEOGx3M3cDF+zYyZZD7yd1b3QolORvDI','0');
INSERT INTO `cn_log` VALUES('179','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/?','2018-01-04','1515032061','83eb9oADlcB/2gWRa4KJSttIv6Gf8dd6ESE75Ar6bNOF/nk4abG99h69faJnKzEkvPFSPrGBLRliZT2nKzjDT01smolbGe7rTXk','0');
INSERT INTO `cn_log` VALUES('180','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/?','2018-01-04','1515032099','d89fxmLabRKjJ0ROG5aVneUbu9wbx9pEzALbAKKK2NkC374M74+kK6LjRY0+FZCUkOfhX2hwL1RJ3J9CV1afJyEJfDUyPXuBuVA','0');
INSERT INTO `cn_log` VALUES('181','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032102','6ff840pwAhoGI7HI5aRNc+JEnXMJseEZQ8rF8keOOCPgzc8RM8Qo8xCkiXSYRIPDjlZ4w00Oqi28vIlUBT3/LOGzRvlyR7tKHWc','0');
INSERT INTO `cn_log` VALUES('182','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-02','2018-01-04','1515032107','787c5rtG70sTjjxY51P0j5dHHHAfFy250FQcTv8R75WdHTV+LR3mLUq2GZ3mugj+aLlHAdvN3K7BXLG+kFaYvy7lwPWy/5wnpuw','0');
INSERT INTO `cn_log` VALUES('183','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-02','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032109','fba65XBVCNYB9whJ9y/BV8h9mt8/oaaoBMV1ybHw1UMvE4evx7pU48HgaZdKMY6/0X5Fcn9ryjZYG6KFDyskFrtNJdT752bNUW8','0');
INSERT INTO `cn_log` VALUES('184','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-02','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032181','4d6b/OEJj8gtF6t/+g8v86mAgIxWlpskjnqE2KyypjCy12hRKyPS6Ffwj4JmIwS0LLMa3fRqv/aVZu9l9Vx8w5j3XA1tIS1By2M','0');
INSERT INTO `cn_log` VALUES('185','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-02','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032326','9d82EYIaW/k6P6yKQL6B9WXbp8AkiYtTGk9Ld/DrU619n4TNhzFbQG9mPqVMHAbH9xnScezgSCuaMyb78tUPw0oP7CxsDr10WFk','0');
INSERT INTO `cn_log` VALUES('186','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-02','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','2018-01-04','1515032330','6f228Ap+eq7s5Q310pS7plWH6krduK8yRNmesMjL75BUsCMouVmhzIo/Arr6GBwuzXN5rQvuLwch0aB13p7e9LDovm1fzyHeTIA','0');
INSERT INTO `cn_log` VALUES('187','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/?k=2018-01-06','http://mls.keqxz.com/mlyy/','2018-01-04','1515032338','7efcxY69G5YitYLUwcm5YeybnvmA+xgs6clUkGzZpMhPbFeVnDTwpDdbaog9jw42dF8lQ1e/1lqFRXps2hV8uBD8ocleOWZ1EA','0');
INSERT INTO `cn_log` VALUES('188','134','24','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-04','1515032344','81dbtfco6MU6CwCMBjZU7a1GLtA2wqGB84qlhxKz3elGnHzdh4t8gu9bJtlMXhrsh+qhdKjUAcAX0fX4AVM/Uc4841NSMKRq4sg','0');
INSERT INTO `cn_log` VALUES('189','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515032346','49cd5GmDFU5pBY8nvmv7GXJIU34iGDokdqtnn6ePymAzWC5T0cJE2TnvwJkQX0jkFpy1ljo+fcZU6X8mqRri9sBqw8m098XrL5E','0');
INSERT INTO `cn_log` VALUES('190','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/admin/Order/view.qm?id=1','http://mls.keqxz.com/?ef','2018-01-04','1515034572','56cci2K7Y61Q4jVRDfRztg65evNw1sZETvlphQqw7lhsWfDjk2+BcU1Sthi5tXzsx67kZvL3AP+XkbvRdVujRWU8ElbQWh4m9w','0');
INSERT INTO `cn_log` VALUES('191','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-04','1515035680','0318vApD6tQfJ4ER3gHK0Do/O1ILZ67ACTmAbEf0hX5gUHVobSlt5FaQwbhqrYbs93NqnYBX7+tVWFuqREsoK9MIQ38J2ubJjg','0');
INSERT INTO `cn_log` VALUES('192','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=1','http://mls.keqxz.com/mlyy/','2018-01-04','1515035725','c5556DFAm6uToan+ZCzeylEL2w8jjyds6pvBerzHcbDocVdXhQmr6L+WvkLDgFzWSOZNN2qHcSUXXm21ovSAI2aZg1aYVFkCIw','0');
INSERT INTO `cn_log` VALUES('193','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515035727','6900PSDoOdf3zfwRAqHTzoWu2tCwUL6jK3jk9CN23/D1tAmVBmbeB7hhTYwWX6ZkykX9rb/U6320tJRTpRkHswIfQX31a6DFNQo','0');
INSERT INTO `cn_log` VALUES('194','134','23','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-04','1515035733','4fabg5Vh/EoGzNYe1+Al1i0dS5bGRCqxJujovxOg4GTsxePOyq8pIqeCCCGFfgNX89ejF8a9uGaGAxM+nOwAKvTq1NRfgSjzq3E','0');
INSERT INTO `cn_log` VALUES('195','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/admin/Order/view.qm?id=1','http://mls.keqxz.com/?ef','2018-01-04','1515044161','f2094BuS+KqmKE9mTAC2Ephv9/WDkbfzsNNN8WQxHHBBHpaWJaccpfdIb6i4r3d9m11POhDl5PUI2xzycxmsXmq1vJ4MvBPhtw','0');
INSERT INTO `cn_log` VALUES('196','134','8','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/contact/','2018-01-04','1515047457','b853m0In9WjYD9QgeAptYvbKTyYSy+h+OGN51KumDXRzVMD5bYCeWc2vKMkC04Y9wfwiCkMY7afSnyr5a/DvfR5M8aE9N504WQ','0');
INSERT INTO `cn_log` VALUES('197','134','1','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/contact/','http://mls.keqxz.com/about/','2018-01-04','1515047474','0231mtbO/7RrNrveZMO34iHXF5hF3QrWmM+jxnIuQPqYGHg/Zlcd+8jKq7Hju/HsWbCgACGLqBZHQtL5TcOv8XNkApTWxl+arA','0');
INSERT INTO `cn_log` VALUES('198','144','0','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=011n3Sk50QzhRJ1XF1n508cJk50n3Sk4','http://mls.keqxz.com/','2018-01-04','1515048108','e56cSqMmQLeqvFupOQVpv8E4pZ8z/KYT+9fwR5Eq99Hp5Fs1OEA2gmiBA687mJV5OOGGC1fVj2m5zVeKHaalVR6S+L+18qCyJg','0');
INSERT INTO `cn_log` VALUES('199','144','13','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-04','1515048122','027dnmltjS4Wb+DpLcgWIh8aPKCc59xntjfaKOfAO7vQozxqbJCKpRONUaqTJAjTuTw+LvXs7J2ctF+tw1QV/hb+J9+UJFKc2OE','0');
INSERT INTO `cn_log` VALUES('200','144','16','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515048124','aaf6t7V/xlXwOhdvm154Yf2/ijfVm3T7EeX8tJGZ/9ZawVB5U1aMrrE2XQoy/U3EuFkkCs3kD2U7ri/bGIpI+Y5Nb8jbUqI4vbM','0');
INSERT INTO `cn_log` VALUES('201','144','0','10','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-04','1515048127','9451anTELZD8I0x4NRQ2Og2Ky+94cY/U2RIr8G1P7VucpWNguVbGNTeneZxjj8n+cm/VdPm2aSEUvo3y2KRrODsz//UVPlFqgq0','0');
INSERT INTO `cn_log` VALUES('202','144','13','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/fwfl/','2018-01-04','1515048152','f210MJtXagaoveiTwt2jefv7k6gP68lQlUvI3CppCYJ5cqG3E26gxGjTXxuzFmSvTXEQrNfWRNHyPrbqsBk4nJZHajfNiFf6HJM','0');
INSERT INTO `cn_log` VALUES('203','144','16','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515048155','3f81vycaBq76pV1cvUhNDbnVZf6x54gSsBRilJV31pNm9Ugp4sL5Xv+Z0dgnR2RcwCpDaSfWVQEHbxIQdOc/qYrCBstFx1Ty8Ak','0');
INSERT INTO `cn_log` VALUES('204','144','16','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515048163','a0531PAqrOvW3rqWxBQ853JIWIhhZ68bSnlNlHcqsVxggBjqC4SXIgunRT4zxnv8jLuohdgcAR0wttrcgB+VYWAaw/N5Sbm3cKk','0');
INSERT INTO `cn_log` VALUES('205','144','0','10','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-04','1515048166','e3ddNCsPcMktzUvTJS/vZvH+bBfYMUgpQy0nOgfiTFSzVLdSrX/qGRw/asdHh+i+AlQVS0gjCQKvMEYun4jGjOT4K7R+Q5p0sMo','0');
INSERT INTO `cn_log` VALUES('206','144','13','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/fwfl/','2018-01-04','1515048448','5c32nl1npjJyTayw0m0/VQ7L2iQ110UpSUrvfWK+op48Qz5iwFX82IOE0+9mXX2eFNbzLRRoj+/SxBxbyYGJDjW62gErbQi5jrw','0');
INSERT INTO `cn_log` VALUES('207','144','16','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515048455','c2a5wKl0IhPv72OcUg8u5Xp6HYQwgUXE8nbAY1ZbPzCwTLHcwrN5+g0//reh0H4SKO5KpU5MzZlBhf1iTIotQvCYLP9OiiGKEi0','0');
INSERT INTO `cn_log` VALUES('208','144','0','10','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-04','1515048464','eedb5XNoyuSbz3Jn5NmpxZ+cpt2s9tVlf5eEI23DaOitHyfP/AmKZPbOEA8muB7PI3hbyl8/3zmVQ3NfnS90M7zDIFJpjYF+OEA','0');
INSERT INTO `cn_log` VALUES('209','144','9','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-04','1515049140','6c99Rp3EkVDOJFKKxaGKF725wndhItLPNq6fbjN5coh9eEGRY0V5OIwbkRlL9v9BpCqbsLfOJezoop+BfI0qMbyDOsvs5jI15w','0');
INSERT INTO `cn_log` VALUES('210','141','0','0','b018c55e7848e9637cbd1aa439071c26ef7b0e46','118.113.40.159','http://mls.keqxz.com/admin/index.qm?index','http://mls.keqxz.com/?V=7','2018-01-04','1515061935','861a8VVoSBiRyPGgH5nY7oyJfZGUO5VOKLRVOisJs457PBYMGqXVd9CMXyXZ/8LQH9PH5JgvgnxMrSVkyKtlRESVfnY630PvxQ','0');
INSERT INTO `cn_log` VALUES('211','141','13','0','b018c55e7848e9637cbd1aa439071c26ef7b0e46','118.113.40.159','http://mls.keqxz.com/?V=7','http://mls.keqxz.com/fwfl/','2018-01-04','1515061959','e44c+SoDcVGAuA3S+I/2Vb34D67WFiafyIwlHTKVg03qBfIRZOROp2+1MKP69RN0kOM/+jjqcs8T4nfpdMrOpj+jSMx/Xxe8MUM','0');
INSERT INTO `cn_log` VALUES('212','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/admin/index.qm','http://mls.keqxz.com/?V=7','2018-01-04','1515062706','fa1aeMIaqJ/A0UIp272guqNNGNo/ohVrmeUTqB62ShdJn9CtXEU5alGC2E0BHcUMUKYJsFkAJPlSAnrUsjE21mkuxk6uZCEQNw','0');
INSERT INTO `cn_log` VALUES('213','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','','http://mls.keqxz.com/?wrnd=qm','2018-01-04','1515062738','a614MM6qmIaUM0d6azrIko7M8NoJssZa2/Ru9ati5wNl9ac7RooH8bK6wfn35tPxDwkYeeyGSvAWEWMq8Cd7dHdDG/VmB39Ghg','0');
INSERT INTO `cn_log` VALUES('214','134','13','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/fwfl/','2018-01-04','1515062742','ce9af6waKErHynBWNAw5CpRRpM9VkBRFajs2TOQmHjRsiYKnJSDMuosVxM0oPZ0mDpPUqk1CFwOT65bOrDk71UcCi8sstqkCQTw','0');
INSERT INTO `cn_log` VALUES('215','134','16','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515062744','5705HjaM4kaPH/NhMrNqDpIyd8velvEmyNBmM2M1bqbNRGhNzkfEX1Z3TWR9cbgLYzdSBeNh4guGarykXwQuezkmS4SDh0dqNEg','0');
INSERT INTO `cn_log` VALUES('216','134','0','10','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-04','1515062746','23ddPIaHqjZSyXiAs+L6VFKXUurt7m2TbARRZDlr0zJg3fu8XmhUbfwW7q1ps4lNVVS43sUdsNwszaKNaZ4lX1vqKqINms1RKII','0');
INSERT INTO `cn_log` VALUES('217','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-04','1515062777','b23fGFWwhthn2QL7dKVXmcB7hlbr+3KJ61VB07Qt+Pb5oxll6wbfR1MS8XBOgYo7TKMXVC9CgjhRN1pUUpbVDvgVSxh/Wdh9Lw','0');
INSERT INTO `cn_log` VALUES('218','157','0','0','3a4727466e92bf7a8d87f7c5e65ba272f315c7ae','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=001EvUU91vnTMQ1RYuW91a11V91EvUUY','http://mls.keqxz.com/','2018-01-04','1515062809','0652cQi7oi9N0hMW3wtzKz1QFmaKWaH7HkGCxV66SXTJoHGuJS0mxSlRAnm9lgkJaVPt82R/ej4X1o8vYKzI22H9NII1eU91pw','0');
INSERT INTO `cn_log` VALUES('219','157','9','0','3a4727466e92bf7a8d87f7c5e65ba272f315c7ae','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-04','1515062813','74ddI5rqyw582Kigt0mb7C/8uSwCBGjdhuGfn8QVdpxPwEQUAvRya46+gDWYUQ6PGl/4iqZ8uQFsGkWLgofG2+NmXX+YmO4Ing','0');
INSERT INTO `cn_log` VALUES('220','144','0','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','','http://mls.keqxz.com/','2018-01-04','1515062957','6eefeKerL/n7NfozViQLBAAVfLaLAUnTEA6DKKMX7tB/OXIio2h0zgTC26io9OExDfgpxAF/QvvqOpt/XErYSfKvZsZw6wCFUQ','0');
INSERT INTO `cn_log` VALUES('221','144','13','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-04','1515062968','8ab5nZDX0gRht2nTxt5iAH16UrpUDusR1K7oHVT9fGduSIWeVim4HH1XL+KbN9D0eIHPdxSikkF80f99ufO0oOJxxUrygQzTrX4','0');
INSERT INTO `cn_log` VALUES('222','144','16','0','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-04','1515062980','6dccUOgW7/jIzDaYm52Xga9VatrJuFZQILwtvBVfc/GEyBXIA8kGA9cs1N6ExuIntfewyPI9uhMjjkMYmE21TpRJH+StNbPQxy8','0');
INSERT INTO `cn_log` VALUES('223','144','0','10','cb2308daff1b5e815c37220a18ae88851574aa50','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-04','1515062982','b418vadKBpNMwohNo+Qu5k7oPv0Hqsx4tfmCRn9bqe8oZHY3zLFG28O1GsiNPX+Q30/IFVPBZ/bCNvQHD3ANTorJJOa27xhza1o','0');
INSERT INTO `cn_log` VALUES('224','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-04','1515063200','e206SjQzG0a745ift4nxVH+f7DmguiLNeaN7/yYAN42Au1Mhi2qQGgdfqdGObfs900fXAW7tsit/xdx83TMNYxnsqEsz8Vtx3A','0');
INSERT INTO `cn_log` VALUES('225','134','0','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/','2018-01-04','1515063423','1ab7nfFU8gHUJFI38oWFv7j67pA9W3alYzjpJ3wqq6pt4haEwJT0v9UKwaTwFNs6moUfNhPBqYc7jYwugXAUs63YcykTzAkFYw','0');
INSERT INTO `cn_log` VALUES('226','134','9','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-04','1515063460','b815zQmLuNY/AeCN0jnbj9fHBQtuO2hI2R0IOp0kAy6shUwNjHHQzFAN3dTfvtxAcWDx0mJSj6ixHRvfn7RqxDa4G7VKk9W29w','0');
INSERT INTO `cn_log` VALUES('227','134','24','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-04','1515063465','c380Tcu71FTjaY6OD0jtQPX5J1q/0LcaLRupZRCTLpo0t1mGxZep9vrWDfS4swUYkDWtJgBxRlzPLxLA6grQvL+GOxiFEABcyMc','0');
INSERT INTO `cn_log` VALUES('228','134','0','4','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-04','1515063469','1672tbLNxxeL/lVgI/N8UKnV9E/qeZl9kZxZ7rpsO28zu/KeDdRHdE3bi5CiqoM+PICA8rCrD2++3cY8sj5QxQ7JmKiuRkSnmw','0');
INSERT INTO `cn_log` VALUES('229','134','24','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-04','1515063482','beb3oNKwhkLxKQORwYm5OPNlC+HxI6mOpmKH2dlYH8+DojsGinNy29JykG9XY3KXarJV8EGKzO9fbkqQHOjzXS2KS/KwcBjNFlY','0');
INSERT INTO `cn_log` VALUES('230','134','25','0','e7fa4a48632aa6f355ab3068a6cccc1ff3244187','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-04','1515063485','ac1an++aIXd/zWlXE6QvZMhfIUGt900oaGJEw4TycurP9+UWiv3GOrJBZ1CRXyTpNaUM0XOmiJq+dDG60Ph2+KKwmhOPyXDNPLM','0');
INSERT INTO `cn_log` VALUES('231','174','0','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/admin/index.qm?index','http://mls.keqxz.com/?V=7','2018-01-05','1515117911','47f2UWYLCvhQbXhdJh5u9h3OSfGEp1nVX7sHGjLIKCkWmU0bkXWedLg37HGeFISJ6W3j+uSha7Q79yXxxERcrp1qIwvA3zjUjg','0');
INSERT INTO `cn_log` VALUES('232','174','16','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/?V=7','http://mls.keqxz.com/stjbhl/','2018-01-05','1515117924','a3cbVef3irx7JmPKPhhnsSMBftvw1ArqLPu14DUlDZ+aWXCGWDIHbFG9xcGmr5FoqI7S1AWZiur2ycbP4tRrPgBAUlVHpo78GDw','0');
INSERT INTO `cn_log` VALUES('233','174','13','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515117938','750fvBqJU0VWzMhKYDojzWDggT9kI6VpQJ5uedQfN2aPVJV3G1YZCATuRA4SstH+MbWfVA4fM3mziynprOPNxdB4MYDo073y2N0','0');
INSERT INTO `cn_log` VALUES('234','174','16','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515117942','7810nBC9CVWVBqqVZqcRNDotXgMb1xI+GKc+Fbw0XGF+b7aUnWPZzTVugiX+zj4/JdIF2xuDLr1cjBJsBLqoRXkf23I62htX1UQ','0');
INSERT INTO `cn_log` VALUES('235','174','13','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515117944','1c48u2TaiFRWGVEIgH4G/alMcGHkzjzkDbYRwY41v0aPIfG/2nKEX2A/nmu8NFsR4ObTn7Z4UyRI6grxeFjFy3C8tIvH/14ha3c','0');
INSERT INTO `cn_log` VALUES('236','174','17','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-05','1515117946','1140OnlBoexF4TcTZKEfjNJ0tgcCqwM2gMCuOuA5GUsz/qb9V331UsU1uRXMRVn2CVmE1CqWiAEyM4U0uVxgiDfvhLozHQMYgpI','0');
INSERT INTO `cn_log` VALUES('237','174','13','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515117950','55f2KoSmEIzBFnD6DC25ozG4E2HFkXCWFOjKTgpmv5BUYC8eC+g8rwOlYNTCLevhRksrvmTD8vwxnWzD+3r2pTptYtnK1D3rh5M','0');
INSERT INTO `cn_log` VALUES('238','174','19','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-05','1515117953','5a0e/2bEJCHCSR1Ap9Q/JYd8K2qogjIDga3d4ux/hHG2zo9T2aUr/3xfI5GsY9PrX2wHNjumNTRARTcKgDiZJOizlcgKYC0hn0s','0');
INSERT INTO `cn_log` VALUES('239','174','13','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515117955','9fcaulVovq6A+UNZwBr1FlufwkVcKVdObrrTHZYPNy7NBVOrRqIIFOxEBCBVTRBn6SMx1ffaOGZlLJc42cxOhxlBROpOPD/13mw','0');
INSERT INTO `cn_log` VALUES('240','174','18','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-05','1515117957','f313hm6IGz621VLJCxW8rSCPzBhfb9lPAeAqX6bpYJVSWeOJfPhKvQBPHE5aXxX96xRmZLnbFjVfaveayI9yhKTqBF8eakmIFwA','0');
INSERT INTO `cn_log` VALUES('241','174','13','0','920ec287c73f8f00af4552a883c2b2641ca60a7b','118.113.56.65','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515117959','17b0itqOI6WzPq+/gMLfYhvu4Fs48xNtW9Ni0rIynNsN14OrGNAu+yeM93Y6OOo1D1P5NGrghUvrC0p7DzWvWFIuCnXOm6Kbml4','0');
INSERT INTO `cn_log` VALUES('242','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/whome/user/get_winfo?code=071NKuPh0TBBCz1nwCQh0r3BPh0NKuP0','http://mls.keqxz.com/','2018-01-05','1515118060','64c1u9lw8aber/8qVhDt6jTnXWXLfdGuc3UyGj067AFoYw9OTQ4kp+zPbKecd3iWyR5u69t3zhZD2Pjq48K9itOL33kRSf3Hjw','0');
INSERT INTO `cn_log` VALUES('243','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515118080','58caii4BF6SLYdLGHwFjM6+AAk7sgmRh8SBAXgVrgrwEwTMJPVEJLxgYor11cnIIkqx5dwARkyhvcAK6FsnXa1s8MkZDb4ESCQ','0');
INSERT INTO `cn_log` VALUES('244','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515118089','bd6aIoZgl8nTunZjIf68ua5BMEIusvfFnV7oNEGyYwW4+MttmrjMastnSXymQQ+b96bWHsSRfifHY3N3DVNzOE8gPhxXmJZPHA','0');
INSERT INTO `cn_log` VALUES('245','176','13','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515118091','dc68U7f1LF3HBdl/rz2V3Y44b4sqbtdhaoGKEYNZtvZhBMfb3YoUuWcD3M28AT9+SPzCYtUdOY0dYs3xJ7sU3KKpwO2Zy4kc5hY','0');
INSERT INTO `cn_log` VALUES('246','176','13','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515118174','cc206ENkd6YYpMVCoUDsW7GB0XlgqZBEWp1M15UQxYxl0/Zrjlcjxb91PMKjToZItAAtK2OrHqSnciammBh7SGoTv/CEH7LUguk','0');
INSERT INTO `cn_log` VALUES('247','176','13','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515118186','c213TluJ0PMGP81+7EbMQOGSNSGoD5s030KUKoMNdFpegOdo4urIvDTXMIIJnMSCYRYpqfaJUwPwKSiiLumrkir93dENFYWTeyI','0');
INSERT INTO `cn_log` VALUES('248','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','','http://mls.keqxz.com/','2018-01-05','1515119123','00c85QgqrHhIjG+cYXJdcF18rMbE4LbDtWo8AHlzFqMLIKWd0LB2cLMsVyGk8GxFRtokSOHDRF84MkdHNIsc7mfYfrDHMTGk1A','0');
INSERT INTO `cn_log` VALUES('249','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/whome/user/get_winfo?code=011iCtYa1Mtozt0DbVYa1VBiYa1iCtYE','http://mls.keqxz.com/','2018-01-05','1515119128','1875LIm+LUTaj8xlZB8JvJVlmd7x13xPsYqdCPW0AAAARLzwbrISp1ql3wey6QF8mAHagqlm5GX66UWbc974L9b1gcr5+MnrrA','0');
INSERT INTO `cn_log` VALUES('250','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119157','0d55GAikjFrtnVYcJVBeTbVelleh+36/U8tncUM+hoeU8veJo2MgmoHPLQG5StBuNFguXHHZ4OiLHPYsehRyexsqLvkXWsuUfxM','0');
INSERT INTO `cn_log` VALUES('251','177','16','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515119161','840aanoyRJ1nbi0RcCf5N7FYXCaFxFP0wGaw/Vtx5T5eophXQQ70N9G5WH2mO3ofkqWcbuOlFn3ItP3wnGAOg44dakV5xZHTy+w','0');
INSERT INTO `cn_log` VALUES('252','177','16','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515119166','69bbL8ZGjJdqcb6mARqHsJ8c2PK9gcBkmH7OUoxYgYykS73JfqGd0F2ZDot22q3juKq3kPk9udbALERzJ2VOIvb1DyFLqb4VONg','0');
INSERT INTO `cn_log` VALUES('253','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/','2018-01-05','1515119167','3424BJEi/iHg8TPb93PEYYYf/rUKGK9yW7zOHfMr9XCvjg7ClKQO/l/uvaF+kTDFPQyQjyOoxh3u6vgEg7seKNB2aWkHVWEQIQ','0');
INSERT INTO `cn_log` VALUES('254','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515119168','513bjuua9FU6so2SfnTRxl4r2rgonpm8B2DLnhpbos1BPk5YMyAweQOTKdXgTkz9MuSwlzXBe/Z7gYPA8V6zje2DhX3Ou5JFeg','0');
INSERT INTO `cn_log` VALUES('255','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119224','f0090zW1zD7PrieAjuT3wsGY3ZMQiMVgE7p6oRdA8kfBs7W7ilpra4z/m6j5rb5Cfd/Rd2OL5If4Sphsx7+lcAWCnI8MDKYEUNg','0');
INSERT INTO `cn_log` VALUES('256','177','20','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/user/index','http://mls.keqxz.com/xieyi/','2018-01-05','1515119255','ceceeqxZKS1Xu3dinA3M30qY2D28QvsnDoluQVmmXnXytdiG7TnOLclKNfmFiRDiKkU3X67bcU/v8vhaZI61JNQKZakZhN1Q4Vc','0');
INSERT INTO `cn_log` VALUES('257','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119259','fb5avzjEdKyASEk4V1qr9dpmn5s256AZp5z1lW+m7vvz2AURXXbbY2PwgqcSLvqTR6byKDY7oMR5sn2dbiGon9xvag9Eh9Y5YRA','0');
INSERT INTO `cn_log` VALUES('258','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119265','7f60RtrUzBxtgK2Cdszhly1SFe4rRPpok0ZcGcwziAWZOSJmWSGDOjaTaz68zaR00Um2YMcwQGOCE5apJaDxzq71k389Q69R/4k','0');
INSERT INTO `cn_log` VALUES('259','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','','http://mls.keqxz.com/','2018-01-05','1515119512','4a98anZ1XDPtOtsRP5dFnOJjUnf8l+anBB2gibwMgxl/BnWPOglPFkGWUPhoeQ3Q1djdWPfh1jAHK8yHXFf/xI92TEbqephl7w','0');
INSERT INTO `cn_log` VALUES('260','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119545','6b10v2ZqGFWr2C8KM6zfzba2YHfP+7Pb1dBmZtbznZ/i+vfCScj4oZWoGJGz0hFu0jA5nNEqER4DARp9EJLNM47eg3ABa/4gkio','0');
INSERT INTO `cn_log` VALUES('261','204','13','0','203b8925fa6a157fd88d5eb6347a852f08b6e8a6','123.151.148.55','','http://mls.keqxz.com/fwfl/','2018-01-05','1515119546','5bacqQkohbx4hjsuiPiNHeWnK8F9CZgmqUdETu8Xd6olv2z/AsdwDkgY8yC/ghu7Y8oFF0n3QnMPYgIDtqMoWmLmDmwg1FBrMkM','0');
INSERT INTO `cn_log` VALUES('262','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','117.136.62.41','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515119553','c08cq1aWBT06p4cRFHj/+DcWHtA6QYq8dCi6o40ZIOyXEOGrikeg/hO12jWrZ9FOJQ0HMOk3TmQ4DrX80lr8laZtnnHAubz9NyQ','0');
INSERT INTO `cn_log` VALUES('263','205','0','0','19a869ea577f19549640a5f666791d87ccf99fb2','118.113.56.65','http://mls.keqxz.com/whome/user/get_winfo?code=071RnXh50XDuKJ1rGjj50DKNh50RnXhu','http://mls.keqxz.com/','2018-01-05','1515119907','5b7a5Bz9QZXjZ+tvOn6bLe98+j3Lui+mCymkAkojJlV5jvclBQoFraTHHjSDxDD18wNNvZH6VXvTc92oOEp2zuOV3TzhETfm0A','0');
INSERT INTO `cn_log` VALUES('264','205','0','0','19a869ea577f19549640a5f666791d87ccf99fb2','118.113.56.65','','http://mls.keqxz.com/','2018-01-05','1515119910','773c3fuJUAifWdK6uqz20Mf8ptQWFS5kcxyuRZxzwe0iznXn4dr5EiflhnaMZWzaNR62Q6Y0VRcFM6ylcuS9mJSKs6mwsfzO/w','0');
INSERT INTO `cn_log` VALUES('265','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','139.207.55.15','http://mls.keqxz.com/whome/user/get_winfo?code=061l6sv31bVkxP173Hw31GVjv31l6svf','http://mls.keqxz.com/','2018-01-05','1515119910','39059EP0gwxsr9BAduaiGu1FpBldUu4t80iKLXD/Nwr3zTyTFK3mlmPPo2Fwv1RGt4Fue4JZ2WVVL67uHDeoYxv+cdgVb5JQDg','0');
INSERT INTO `cn_log` VALUES('266','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','139.207.55.15','','http://mls.keqxz.com/','2018-01-05','1515119920','d017OCuTPeEXs+kFHIYs80DMcR+omXVKEfuzpgZZhS7kZoAT0upc+j4aa+RuS0/1aL7/92aQyuGOc1ih3v7rej5VNXbyfSWATQ','0');
INSERT INTO `cn_log` VALUES('267','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','139.207.55.15','','http://mls.keqxz.com/','2018-01-05','1515119940','4acdi5oj6sKNI3bjx6XgXebuejCZw52l8s/hHbq/brm91df8TaXXNGkQpBNKfXvcZD3zlJCh6nQCRfXgv453Z1UjVSQalfGZUg','0');
INSERT INTO `cn_log` VALUES('268','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','139.207.55.15','','http://mls.keqxz.com/','2018-01-05','1515120025','dc4aoeQXdQaiRkYYfdi+tWOG/GsuJKZAYe39KkjLbU6vpbYmTjrRdrZpN7ku+oe+7ABdA2epBruNxU5laGya2ZsdO4K3YYm9fQ','0');
INSERT INTO `cn_log` VALUES('269','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','118.113.56.65','','http://mls.keqxz.com/','2018-01-05','1515121061','4bedoUTxQNP8Y6r6YPRlJpfPSR55Z6i+uS2yIrD0j/ih4LihDzrv9Bj2gm8uEw1v4tAKVKODT4PGTMQ/WaEWZJVa1RhJooBcIw','0');
INSERT INTO `cn_log` VALUES('270','208','0','0','7b3a0f18c4bc9803c706abdea0940602d75e3c23','118.113.56.65','','http://mls.keqxz.com/','2018-01-05','1515121191','8cd3npfXoiI/Hrr6kFDrq1qK+GM+YagvWU02Lxg+hR3FkbqrC+fbWRi5Rytjkp9wQkI/k1EXQS4XtdMB833+fMEg82onmSEFCg','0');
INSERT INTO `cn_log` VALUES('271','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/whome/user/get_winfo?code=071BsMWB0tZeOf2M1UUB0HRbXB0BsMW1','http://mls.keqxz.com/','2018-01-05','1515124762','2130p6zLX1nry1UO3OoslcXP7AREwcwFkHr0TmTCdZFFiJ2tWqblYF16lCMwXdmVcVC1Dhd97qSS6DraCQddnAUtreRcM1Kyew','0');
INSERT INTO `cn_log` VALUES('272','206','13','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515124769','7f10PYwd9CAVO1y5R2aBg2YtNxOcTsj+wXFv2dbJKEZo1REyyft1d7RnYzIx0WM0U5s9VwFfl/771oYg6fIOFw7WI6aZbkQhdA4','0');
INSERT INTO `cn_log` VALUES('273','206','17','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-05','1515124774','9c60D6x4hroLMcJMbQ79MbPIHuiE1SpGlhhwwe5p5Q3r8KXqClqWy8HlgmcpH9AbhUYXRxu5KeM84gfKXeulW4loXjkl6B/Tzqg','0');
INSERT INTO `cn_log` VALUES('274','206','13','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515124780','d832k/StApcAZggB4kbocQHS3M6ojwJ6Yd7Mf1fqYwmIEkaJLI53GVLmjIuUgvu1bIThm+IM4+gC+4J+Y09Emghrsjzjp8LrLEA','0');
INSERT INTO `cn_log` VALUES('275','206','1','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/about/','2018-01-05','1515124800','4b14PQAOH9vBJ+y9gmt88cbnxldDUoYU+G0DwLHuIUP2PdliKWcxLeSrge26jDb3ixYtjzn4e0y/39g6S6bAS9VIqOdZj61fvQ','0');
INSERT INTO `cn_log` VALUES('276','206','2','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/about/','http://mls.keqxz.com/team/','2018-01-05','1515124814','1bd3n8TfZPKR7jF5VNRDBS4LWU1P4Iw2SvCNEVb3XJt69QjeqH+viPjhRBP9T0JMpEHgGNuCY5usk/e40IOpNlvy4DVozmau2Q','0');
INSERT INTO `cn_log` VALUES('277','206','13','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/team/','http://mls.keqxz.com/fwfl/','2018-01-05','1515124828','b12aZE/D+bAhyKNm3bjsa3OmLfxNiiIgEvW0kYgfAgTJcl0nl8dfZC/Km700bo9Vvr8KJ7JTBirr8RvowH6yINZ6ywcAv8okr7Y','0');
INSERT INTO `cn_log` VALUES('278','206','8','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/contact/','2018-01-05','1515124831','25e0AEYOC7gr4I0XaDC6zMTu97LefEQ7ggwR9HIWuhQ6RPc2mcK/Z7yHqlw00Wc2HxqyrZONh/ozs3X2K1+x8EA689z6XIngNw','0');
INSERT INTO `cn_log` VALUES('279','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','','http://mls.keqxz.com/','2018-01-05','1515124850','5e1cgxfcXdTbAK9zXQ1EFTkhX8fBoh9/r6RMZqd53x1l7YDg7XFWww9w297XtsCzBWjGRiKL+RvJweKAdJfL0GxnLP5KNf71yQ','0');
INSERT INTO `cn_log` VALUES('280','206','2','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/','http://mls.keqxz.com/team/','2018-01-05','1515124860','3ce2hRgeYQXm0VnD9FUjHsgWzW3MINT9LtziowvDqtPTxmUvb+boHSgKZQUhfd2CV+vbu2yurtD7t/H9+3HbYAw2/Pr2lQL+KA','0');
INSERT INTO `cn_log` VALUES('281','206','13','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/team/','http://mls.keqxz.com/fwfl/','2018-01-05','1515124869','3355pP2hc2JhfTNlIkMhnxt40UhAT3qjxi7m9t9Ud2NHh8SSP5vSBpwPIDyWswCsCGOrsu1eyW5hO5TMvZaJXnMC9w0liqUBciA','0');
INSERT INTO `cn_log` VALUES('282','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-05','1515124876','935apTvLSaDggUdblAEgwW3Ic9+QGRmOUNpdCBeoP12D6laSRyVtHDhdUhhW3iKmwkGWHsaAF5GYsh+eu1nFELFSrQjbH95pEQ','0');
INSERT INTO `cn_log` VALUES('283','206','18','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-05','1515124890','071eGsjMGzslYlrIxwzjsDSsEPyTC7U5kTwS9hWnpOxN/cE8Wr0JWp6zMK06XBf9qqMkLfK9Bu8MNrqm8ESZDxk5ykqt4IEnrm8','0');
INSERT INTO `cn_log` VALUES('284','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-05','1515124896','fa5e67K5cpjNgKn2iCWvK+EEra5WYOrghGrvR+kdbXnWoxwceTD4bBvq6frKcNf7Gxy14qoNQZlwUoYckBfBnjSPgDwi0Jz+bA','0');
INSERT INTO `cn_log` VALUES('285','206','13','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/team/','http://mls.keqxz.com/fwfl/','2018-01-05','1515124908','2d0bNpW5v81arxKRntSbwDwMy8CWRqaPh1Uov8vEYNh/wCjvOzlhVrN5KT4r2y3j5qmnqqF0+jIU/4WaUBTcg0R3UbDbTA2awJ4','0');
INSERT INTO `cn_log` VALUES('286','206','2','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','http://mls.keqxz.com/','http://mls.keqxz.com/team/','2018-01-05','1515124910','18921YqkyvVMl70H09T3ILJro9nzVnyojyAug46LaH1x0TN2V+gRMv4PCqbyGJBLx7ZfokjIbdrvNGyq6X5wmLyeAvaa640BWg','0');
INSERT INTO `cn_log` VALUES('287','206','0','0','86cdf2a1691a7b497342cc850f8d575f8cbf6f06','222.209.52.193','','http://mls.keqxz.com/','2018-01-05','1515124911','7488rav5Ns1XQ50P5j31+H5hc7ljH9vn3xqNUknz/bRZUttFUZvaA6CzFg/d2toUNTp/geBx0HxsDusTWiunqtdpQVcwBliOOQ','0');
INSERT INTO `cn_log` VALUES('288','210','0','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/whome/user/get_winfo?code=071IU9xl1xtrym0IcIzl1z0dxl1IU9x3','http://mls.keqxz.com/','2018-01-05','1515132654','bb4fBw7irArf+le7mPaicDGMV2AV1VRl7srVgtNECyDs+2/ZsjX8gLMiYHkjXNuWh5d/mhv9WAVIi8Eo9BJr78yEPyHWTUdQ1g','0');
INSERT INTO `cn_log` VALUES('289','210','0','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515132689','8239A46s97tWNc6Boae5t6AFA4me8svyLFaxKkb88KBf6yui+fJE9UKAIG/xdm0CmQPoqbi5PAAOpOa37pzRNhGeBKqNgjwDmw','0');
INSERT INTO `cn_log` VALUES('290','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132691','100fAemLWLeOcTm7gH0ZuGMOexcsqbQaNNJDQq3HgmwxWRdPYyb8fYE5tFuozB2sA7d13vHhW5t+0e6ESDzZZckBKajwyj5UTcw','0');
INSERT INTO `cn_log` VALUES('291','210','18','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-05','1515132697','ac68R3a50tHXBnXDE+vMuPLXQncyAoTgKyP0ZFmS2hKyxAku8jX6SdUkf2geuEslPOrcCBnhVLxJIdmFsDr0Cy7GCfN/B3x8SVs','0');
INSERT INTO `cn_log` VALUES('292','210','18','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-05','1515132706','e8e67J5jhE+Efd6g9/jtTXfssbQq8vGfaImWpYocN1ckokAOBeOfxrKJLCA+bWaKZQVdDJmpewHoSANmr/iemFYdImKwUqIsk+E','0');
INSERT INTO `cn_log` VALUES('293','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132709','3e0aF7QCiMF0s/XGQMnAuzr232mf5U1l85evRwHovctZp72cpmgD2Hg+RzX5jICUqTvC1/nmueFKrQ8Da+Ze6TYNRXc/t0p9iqc','0');
INSERT INTO `cn_log` VALUES('294','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132719','93eeJXPxf4uGsibLziedYYy/+SukLt11Fr5PIF1wRDjp2ZnqJ5Cr9d/GRPcxVzrUMPXGvVzUnr7ExA3arT1+By4iAyKmN9ulB8o','0');
INSERT INTO `cn_log` VALUES('295','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132724','ffe2OCIsWQzYDo+XZ9ihmPLpuqgKTbgBBkK4scfS0XKaLZ3tn0uK7FWp28tJpl75q8W4NJ+UxWbpOI0JAs8IKoewFM1NKHpGfZ0','0');
INSERT INTO `cn_log` VALUES('296','210','2','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/team/','2018-01-05','1515132733','7b29keUJB3LiceexlIbO/GCB8p62nGT2PCJ7SKsY5oAgcCiK6bEB07sT1NMryeOh5kfzhJq4lgrk6iSbTcPvK54IU0Is916iVA','0');
INSERT INTO `cn_log` VALUES('297','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/team/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132748','4886hmwX81m+iNxes+ZL8zTkeoYkl7DAgCmDWAkbVujgfp1J8iupLH5lvbZVJiMUPoJ4gzFs2hbMl4qdvyy0gXpmeV/e17YnKTU','0');
INSERT INTO `cn_log` VALUES('298','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132750','1149slS+PzgQhZZxF7sINoCvLn+PYLhHR93YgffiNiJxwns5cChVa4cjEXUSI6FxJqz0SC401oXSnxKioG3CxKz4QUjFIaMs+50','0');
INSERT INTO `cn_log` VALUES('299','210','13','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/fwfl/','2018-01-05','1515132755','750fvBqJU0ZewcZMYz9ym2bmgz1rcPZvQJk7LIAfN2aPVM8gEgsfAl7hQg1A4tH+NLWaBg1JZHnmgyTi+rWXk9AtYYa50Lyr3ow','0');
INSERT INTO `cn_log` VALUES('300','210','8','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/contact/','2018-01-05','1515132762','5a8c1KKypG2pAlJYMo/4y4mq8hRt/og4AFFTM/aehhmzW6MFHyu9eI9FQsrip2BltYUs8ms2Wiktm2ZBqCmYRmFnf/3uoVQtwQ','0');
INSERT INTO `cn_log` VALUES('301','210','8','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/contact/','http://mls.keqxz.com/contact/','2018-01-05','1515132810','8c881Px87FInxL6IX01VpnG0JdSYyaLaOn1CPbJtndzgQk7OW2GeHjuZ09+dQLr/z++SvTwXdowzeyVLbpiaWNTrQZaGjduUlQ','0');
INSERT INTO `cn_log` VALUES('302','210','0','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/contact/','http://mls.keqxz.com/','2018-01-05','1515132815','307est/Fl2/YkBr0Y42TDdDbFwXxL6r6Ql+Anmfcrd7d+aN8cCPstm0zwpEaq/TSGf0yJCYGntHMGxFSAb9gSCcqJ2AxfRNgGg','0');
INSERT INTO `cn_log` VALUES('303','210','17','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-05','1515132820','10e3OqN7CLUIeMWWyIj8vE1Y2bxIodsr5lKRJXTPIXhkBWW2pTdE2DBSdEKDgeB8PWbYyHarY8blV7ej1GqKuWnT0F4tnyYZt6A','0');
INSERT INTO `cn_log` VALUES('304','210','0','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-05','1515132825','ef63ZiSvv6nEymw6EArI5K2GdjdzhH+AjVQmrjWSnmY3E5ifsLzsAR7Tym1w1yMThn/dpoI2tZHFXfLdEvaB23WJCvkiBu5lYg','0');
INSERT INTO `cn_log` VALUES('305','210','18','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-05','1515132827','74e5TY0h97gumxXw+sxX7DwzLIqDaCkC2HUxMCNk3bBlRaLXgZGwygaWeSDljhM7p8SI7xZgHwJHRTtk68rYCDfA9W+OOpFm1BQ','0');
INSERT INTO `cn_log` VALUES('306','210','0','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/','2018-01-05','1515132840','8fd9YzROgmqLNLi5mZlHC3OZmhz/Dx1qA42O1AOjcPgj1oFGadl3Iwf8Bhm3rEkIwTdHi6a11wVrmm/thcrhc4/IL+HrPCJ0xw','0');
INSERT INTO `cn_log` VALUES('307','210','16','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515132842','36a8hmN3fxtVnqXRaLqa0W5F7G1ur/NO18xHksQWKOeDZEiojMGI4cWB8nE0XV3K5V5QoknI0rjSSOQ5whowuFXh4UNi+wWNbZY','0');
INSERT INTO `cn_log` VALUES('308','210','0','10','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515132846','2c06iTbZ0hjzNeX4UwoTNmiVGIgasKmYDJA+QxStC7OPXEyr/W+MSX/GrcPErAIkczvU+sKkSr2e17/oQamaq5im8aSyM3TFCRs','0');
INSERT INTO `cn_log` VALUES('309','210','16','0','ce98e8b8e4a68f50d47cb240585d8d6aae051813','171.210.212.10','http://mls.keqxz.com/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515132860','d78bpMwnsmuXzAkL4LsNiq3POWsgRzy2BxLXSA6TrAW0htBrtTD9UFkJMmSM6ZUUKbYShMaHYxbDnvG52QZkB3/saNgjRT3+q+E','0');
INSERT INTO `cn_log` VALUES('310','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=021cc6f11HBuS02lhpf11hnXe11cc6fr','http://mls.keqxz.com/','2018-01-05','1515136560','c8aau0LsZgJHRy3T7JFH+vWJw23nMS3xcwSkycdZfn+4dBDTUEp34Egv4K0M2IinPBhWyR4o2lyj7etoNJvlU9B+ZgT8DNoewA','0');
INSERT INTO `cn_log` VALUES('311','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/whome/user/get_winfo?code=081Bmzq51zDwkM15ais51ZpMq51Bmzq3','http://mls.keqxz.com/','2018-01-05','1515139124','50896RHX5KoUPXBm+BkSjfXHgf288Wpj43aJyrFQ3GLGPoOIS5onlvgJMwtGcjog+D/VNSmMO5Yr6ahu1cF++LThvi8dARJdKA','0');
INSERT INTO `cn_log` VALUES('312','176','9','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-05','1515139162','4eefwhw+xDfQBVLKE5H/lB3NSWsrIV5vA/JSl9oq5ssUV7n+L6bvgttJ9YmrKtIg6GihkaX2Eb+tIjjgoMzWe6kLgQyUZYLGAg','0');
INSERT INTO `cn_log` VALUES('313','176','24','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-05','1515139172','bf15b4Kj1g5BxsofWHGGNS5EN7xtpmyznrG1AnXdLaYqMuapAWfMSGd9ic/blolv7qtWzXIi4RTM9GRycrHpLKUQ8V/ZvjhFwYs','0');
INSERT INTO `cn_log` VALUES('314','176','0','4','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-05','1515139178','b590ikTo7hOGlQ2MJiFxPCR1nhCNeVwMxSjuWziHBkGYTrUtDqxfYgPiRrIJF5wLVMEl8AwB39De3seVPgdKQ0dZOd/YSLbdYg','0');
INSERT INTO `cn_log` VALUES('315','176','2','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/team/','2018-01-05','1515139202','9d79/SApVA0VU7gt12LwLj2RwUydmvbbGbBZtemUiGm+VQQzwoPJmWoACDhilCLK5R5/ayib3np5pJTDzAWRqw3K9zkoi+1VyQ','0');
INSERT INTO `cn_log` VALUES('316','176','4','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/team/','http://mls.keqxz.com/mlbd/','2018-01-05','1515139208','ba4dUOVOkaWhpsR46/3t7TF7G+qRcpRgMaDWgux1gI/+5q/2JiuDiCAszMMEuH2sl7y0gJ85LhRvlrMB5Llm4AdP3CgYlwIJKg','0');
INSERT INTO `cn_log` VALUES('317','176','13','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/mlbd/','http://mls.keqxz.com/fwfl/','2018-01-05','1515139212','869cbNnhRPigPh65m3xyAJ2T+TASTnOYy/+LjCgqJirR/XDZo4gjOTtK8TMDRabXSxjDA3a+n2rpn/1JHfDIRh3SoeagNcVDyMM','0');
INSERT INTO `cn_log` VALUES('318','176','0','0','898f9c60470ce76eb993bb58940177a1a175df0c','139.207.178.125','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-05','1515139222','fbe3UmaYT9ZLPqhyFie9j2/VkJ1jpJhRL1wrGB1jYLLiuq/uUKUjLqNzmNjuqFmSnywRvvrI2+eRUKsTYcU+JI8KF0wKIycoeg','0');
INSERT INTO `cn_log` VALUES('319','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/whome/user/get_winfo?code=061DrHVe00vnfB10lSXe0EXVVe0DrHVs','http://mls.keqxz.com/','2018-01-05','1515142630','8199gGAXC1CaMaECDQBpn70Oszo2pbAAM+kJp94bI922N9GkI7+QlLqey0oE6oZrCXG4yudj4E52lTFptAwONm9r1BfeKU3tBg','0');
INSERT INTO `cn_log` VALUES('320','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/','2018-01-05','1515142652','e533JGFE36ogjiRyOuihnMBaM8yQos/tqG+kVju99IYefwQYRp0c8irjR5/rAZf14r4CBNCgcbWkSL2wUF2/AyT/vx3AMc6Qbg','0');
INSERT INTO `cn_log` VALUES('321','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515142653','e3c4y3i5ku21JDoTo8LzzwMI7KwlmiXt4l7pWNda+qM9vrP6nFfyZeAV6vAQ4/PwxnlKtASLQVvJx6BumC+CpDgYeictvgFAA7k','0');
INSERT INTO `cn_log` VALUES('322','177','16','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515142655','e6e2gKUALR8hcPxk/EBPl+Op9ExWytH8Mm0TAcJDEoK+J1mTOCDDImMEipqTOfU/rB3+dYRQUhoTmxsmUuAHkZlmptmHQUENi9I','0');
INSERT INTO `cn_log` VALUES('323','177','0','10','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515142656','db54Trn2OmVSobJmX873sfm9PWg+jvBeUsGp4tsKt9V0+uRl4QD5JOmhXNdqv08Wp8u81C8E+17B+hrVQNJaQcOOBAzak68hQQc','0');
INSERT INTO `cn_log` VALUES('324','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/','2018-01-05','1515142717','cf06WbcCsh0HDj8QnYLM8Us6xKMbRf6PebhTqi/PzDXGzLEaloH11J7Tqbpb3wJn802cipifq9eKcvslMljRtLwZEXbDTA1PAQ','0');
INSERT INTO `cn_log` VALUES('325','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515142719','f45cRfgCiRezXJkWTRrBYL/2CNHhkbz5Bs0jclUa4YTeSdiuWInU4okx7ktcC/ovoMRFgpZ6+O3JcMk9zYAqHCtgTtc7MCz4vvw','0');
INSERT INTO `cn_log` VALUES('326','177','16','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515142720','beaa1KMu9zrPh5UqjnBrN2Ij9t3lUSndBGeivndAsdYCDtdKssp/4q/vtqbPUxew8MfpzBBy3IrupjBgZvzWcPNCykTReGTmQ5I','0');
INSERT INTO `cn_log` VALUES('327','177','0','10','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515142722','21bdBkY/1aQY3D7WOT+q/+4Qi6mxHeFlUVEGNitbVWsfcO4fNU/bn9otKU9WUMsBsLpqt79Lcl7T0stSuqeAZjIpohEQ1Y+1+FA','0');
INSERT INTO `cn_log` VALUES('328','177','13','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/fwfl/','2018-01-05','1515142821','cdffhFwaDeERXxbd4CWFBbgz+Qr4tNs14cx5q3jLzYxihfUYcMzj3PqPHpFUdsnFnV2WhXV1v9oEnuvCOHiaks70eFZ451XxKeY','0');
INSERT INTO `cn_log` VALUES('329','177','16','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515142822','c0b8thePz0WBnKFVai9aauYM/uCPvzJ40uZBQvZywwchrHsRnY1WeHPmMGgAdqC/FGgkLVKQeg/UwW4QHYGwl44GuPiHaohVVz0','0');
INSERT INTO `cn_log` VALUES('330','177','0','10','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515142824','38ce1KpPbiS4C1vCQDmjF+AicyCKtC3UndVgA43QiNLzJ/rIZuITdwCnKhFI0V5GpK9CHPNoY7lDEwi4+CtMOjxmfz/Zes4jE/s','0');
INSERT INTO `cn_log` VALUES('331','177','9','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-05','1515142844','7c51TDWA638/0aNFWL7bMNRpmPPLNEmF0crCb1501V8ZkRK+hgNi2anTfpSyBW56LBA/dpwnrLYY0Xrg0lb0jz9PbrSjJznOKg','0');
INSERT INTO `cn_log` VALUES('332','177','25','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/yyfw?id=2','http://mls.keqxz.com/mlyy/list-25/','2018-01-05','1515142870','882bwyL9bK9mlRFe0tl3LzvalR2s50BHCBQSE5uX8eUyqU5+prgRyrcnjIl5VXERQfcUPNGAjYv/d16qP1S4V+Vb7M7ixG/EPB4','0');
INSERT INTO `cn_log` VALUES('333','177','9','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-05','1515142938','8f4fYCwqHJtcAfsr2AzNHxsb9AcjpJ6pygfSDQpMwRLFHQQfxNuuYB9NrQoJf4hbvBSozyFaUtXxHAN7/2wqUz8gsktbptgPog','0');
INSERT INTO `cn_log` VALUES('334','177','25','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-05','1515142941','eac7o8DuEY5cTlFNssXWMhcko1WkeFrcgG1S6wZJqVPiWepdYNXpU++AuyeZ8Bxu1H5O1fHqSYOwLQXVS0MVetAGj7Kh14q9qQQ','0');
INSERT INTO `cn_log` VALUES('335','177','24','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-05','1515142945','97288ljMyYbdk/KMMp4cPTHC3w+I/Ps5NnhCedr/ZPTpWks7Wr1bqWjY5tsSyM5nY04f1Xk3r98A5NWCSoCxs2Fqseq6ZU/mSwg','0');
INSERT INTO `cn_log` VALUES('336','177','25','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-05','1515142948','3623A4Hl/cS+GsvKjSAi43neKtkj6w1+kTYLqYH32ERgacSmAiGnvsAKA6MlmYE2IJcrzhr6k44K4xjxBVxBqYXijJ/N9dfVNUc','0');
INSERT INTO `cn_log` VALUES('337','177','23','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-05','1515142950','fca8IoP85pXDYz7wRMplDd8E3bnVwfZKZFxSmuQCaeii1VLOUvWyua1Jh83h+SlS99GnANagH3eDZOokJtFq/cc/4DTOrD17ZFk','0');
INSERT INTO `cn_log` VALUES('338','177','25','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/mlyy/list-25/','2018-01-05','1515142951','d1c4XObdAq3tydpJ+NUNsd1xC83pJajdwbl+vw5CQAGIa4scAZGdcmqVtEfGoFNYyek6gt/jLl0HEag7oDyVXUGLVnlDHcf/PoY','0');
INSERT INTO `cn_log` VALUES('339','177','25','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/list-25/','2018-01-05','1515142962','b23bJupCFXPAEb56uBd8EGbgYwfoBwBo7zorNyUSBKocQdPhu27oNuJ1eH1w6D2N0yZOF+wLtQFRBkMDoWLVqgaoWALJEGbq8P4','0');
INSERT INTO `cn_log` VALUES('340','177','0','10','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','http://mls.keqxz.com/user/order','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515142974','3294iFFk79qDsVO1DGUmLoNqg2c02WI/YN68zJlrFF6bvbi3w6smMm1suvrKRAfy4PRI/k/IjfdkO84k6mx1Ky8MK40alOxgzxA','0');
INSERT INTO `cn_log` VALUES('341','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','','http://mls.keqxz.com/','2018-01-05','1515143264','f44c6Ob3DBcHaMtR+LXB3ItkdDAKFI72k7qxd0UcsbtZQW18wV0N7HeWJBt13Qk0C6WAbGUwdA/oMXfA+pII6xA/U9RrUUUZjw','0');
INSERT INTO `cn_log` VALUES('342','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','','http://mls.keqxz.com/','2018-01-05','1515143344','3cba3LIGXh9PIAxqFDQCRDbxe72t1aTUjDvL0fofnC186o+ABfI063OMv2ObzStat1Y0PXWyhWBAlFdsv2iRU3aCLovN+l41mQ','0');
INSERT INTO `cn_log` VALUES('343','177','0','0','5ee74701bffdcf9aab3fe34dc840dba79a22b4ad','118.113.40.159','','http://mls.keqxz.com/','2018-01-05','1515143481','f66flReSVCbr0V2aIOvl+7kbhY//PTnCLe1dCGAAipzElaec6++PeD30Q4bQpOFTISZdnME+k+lKMyey9ImF8QRyl517hNpfqA','0');
INSERT INTO `cn_log` VALUES('344','216','0','0','988c4e1b40809ba2f2e1983f7a88da4fdce15d4f','139.207.177.131','http://mls.keqxz.com/whome/user/get_winfo?code=021rN2pN0O6Sc5221ZqN0Y3PoN0rN2pM','http://mls.keqxz.com/','2018-01-05','1515151212','5b80XWDKu65in6Sqs2nkQQzGyVWcPwd0jmCZa7gNlhWEABAbjcIWpSOvmswEHJbtC/GLT8znOWB0RPtiJaO9p7VWjvubQaXHZw','0');
INSERT INTO `cn_log` VALUES('345','216','0','0','988c4e1b40809ba2f2e1983f7a88da4fdce15d4f','139.207.177.131','','http://mls.keqxz.com/','2018-01-05','1515153379','17ebfminP35il+z+bImYiP26PG0+6EWuS86n46aS8O3vJAhuaDLeIUYR4R7/CG6+2lBWWYAJRgr4drMRt3dhxDI5pmZ3pNnXZg','0');
INSERT INTO `cn_log` VALUES('346','216','13','0','988c4e1b40809ba2f2e1983f7a88da4fdce15d4f','139.207.177.131','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515153403','c60dEOL3JF7rBmE8hQgEmsI4YONcCrHS0mXelrtR6A72aYvSK/CG879Uxx135K6NPwT1aR7Iv55VSDRGPq1cSFkB3mz+IUEFDrA','0');
INSERT INTO `cn_log` VALUES('347','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/whome/user/get_winfo?code=001pEIj61K56gS15jNh61onuj61pEIjv','http://mls.keqxz.com/','2018-01-05','1515153702','ad55Sv6bAUpJCk+i4//WXLD34qK6lQlhPdrnKqnq7zHB/TGuQwvf02fdY/6uJAJ+d7QxiHRJIxNV1HJJVc47ni5E8DXkSy15vg','0');
INSERT INTO `cn_log` VALUES('348','217','0','10','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515153722','d9189IPwBcCXaNq/iEV8Q7txe0SP5heOkZqbTjKubGWusIhhjG+kO9nIO/WxZtQzFXPYCaASLwtKrgvAAnOIaRwwcMCZ9ia6F7Y','0');
INSERT INTO `cn_log` VALUES('349','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/whome/user/get_winfo?code=001pEIj61K56gS15jNh61onuj61pEIjv','http://mls.keqxz.com/','2018-01-05','1515153739','65fegiRr6n4DevktmLTXuKLyyKQdCmbUNHi9y7QmnhgeSk2rsxqSykanIW2IQaJSpTfvw89fgBdiqp5LJk4VrY8WVWyyc+ZeeQ','0');
INSERT INTO `cn_log` VALUES('350','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/whome/user/get_winfo?code=001pEIj61K56gS15jNh61onuj61pEIjv','http://mls.keqxz.com/','2018-01-05','1515153761','a1a8i9m2zyifJL7Wv8r27KV7PLAbZIcwN7RKc92oNO9kzxjL4yk8yHk9D68E1EaHlttNy0LgNDmeTn7aeZIaiBHCHryipxBWtw','0');
INSERT INTO `cn_log` VALUES('351','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515153763','eb1ds2WzbhCmSwCZp0viDLhXZRRVB/D+GnREoAAl7He8fxSKOx4MB09NBFyD2tS1xgjggguDogE/WVb0HBLlQUS0ttNU10CXfA','0');
INSERT INTO `cn_log` VALUES('352','217','18','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-05','1515153766','65dbIynYINahDKfDhMNF6dgPKERfaBUWHrGavWG83XVqrafd2CmRga3DZ263z2ArksvcIZXDQ8ZsPD8ekPcsCErgIi1hwCeFG74','0');
INSERT INTO `cn_log` VALUES('353','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/','2018-01-05','1515153771','2d385uG73Kh+Sjq9mMUiNxKJWHRumqdNH/fMbAmvi6/9V1uG4NBd+R+z5zwe/mLWpqfH7eP38Sk24RIxDot7bdni6WP0pxMxJQ','0');
INSERT INTO `cn_log` VALUES('354','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/','2018-01-05','1515153774','191bdAKyjt0o1erGCjZP5al/mtamBdFxaMcl2I+yFZnpEXUeT3Ip2c8qmK10iIbH/XzPsQwyypJ1LhEvEjPS50UR4kq2Em9rfA','0');
INSERT INTO `cn_log` VALUES('355','217','13','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/fwfl/','2018-01-05','1515153778','b166CmGrssv7XI+BsBnaUzf2KrcuLAfSBxfYESKe7y2DEi8xHNMOWitSvWE791fPcWv3toe13mA5a3riKAUmGFaJwN790cOE5Uw','0');
INSERT INTO `cn_log` VALUES('356','217','0','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-05','1515153783','4259K0IdATbs5+2ft2F/b4zMIyJmfc48SdQ+IgojUDt++RofG7nrejOGuyGppVWfo+IHn15SXPKLY58eO9wiCOxE4RhPVLORWQ','0');
INSERT INTO `cn_log` VALUES('357','217','13','0','780f684039838006c035df6775dc9abc7dddb220','139.207.93.125','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/fwfl/','2018-01-05','1515153787','1254b/nBNccA7z4USAkVdrJDxL9BSKtAoeW+1Vdb4jWetR8x5HJR1+vZ0fEuxSLk4+sATtOQUD+TLDApxez3CFcfIRnqjYCqsPk','0');
INSERT INTO `cn_log` VALUES('358','219','0','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/whome/user/get_winfo?code=021zQGp01yX2rZ1ScJo01Y13q01zQGpD','http://mls.keqxz.com/','2018-01-05','1515162940','a8331SK/5Qz9n+1LplcVol+CXrhojILoTH8iSRjBzLBmzmZh+8JgZyjVe9X9ODacX1XZeCWTJt1x94J3ellU8/ozc0jt3BvbSg','0');
INSERT INTO `cn_log` VALUES('359','219','0','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515162995','826ecfoDkWo4dZBVTIleMHhp3Irn58BtNvvpIZhmUns1nqtoHlRl0SaUOQc9UEw8uT86LIqtk0GhcpxvNAb1Mk5dVfBhvAeTcg','0');
INSERT INTO `cn_log` VALUES('360','219','17','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-05','1515162998','3e002P49QF395g43EbNHNnUQIN0Nx3+NCUcU4/3QfiyO2+TizRXkM0+5YnC8wK6qNoKFVdbZsdU0Ogtqk6vlZLtNztB2VgDDCp8','0');
INSERT INTO `cn_log` VALUES('361','219','13','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-05','1515163023','1b55IOE+kY6Fjulmm61emqNL2q81KsdNR6RxaOE/2ygqBz2e793LQgersbVw2ZRnM+ArHMsVGq8mFYfYifgWeFFLVXcBULHaS5M','0');
INSERT INTO `cn_log` VALUES('362','219','16','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-05','1515163077','4b5cBizi4IHFaBvuLOkBfbnwJ2jz0Z1yH4WeKw7ZHRNjvYJkLotH65gNx4ap/C9Q1rz+GCQaWZ8Bq+4ff2lCvb8S/M0mqP7mzew','0');
INSERT INTO `cn_log` VALUES('363','219','0','10','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-05','1515163079','f919VD8iQpwBoudEcjtjStrmZ14wYwTdASYd+y3rni9i6CqMrT/ZDnnhjely/MCSnt8rO5ivaB0JtuVNq79d3K1SM9fMoouNjaQ','0');
INSERT INTO `cn_log` VALUES('364','219','0','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-05','1515163109','9ae61qQgU2Wl0aSn0se9kVqNprqAazD5bUJeKa02vIckRysXF1uQsIiY1CWiwo1LtYfDWuNIjqHzsUM72pVZbRN6kqfiRc92pg','0');
INSERT INTO `cn_log` VALUES('365','219','0','0','55238e2a8b0393831371a0d3bd860fabaf2556ff','118.116.92.52','','http://mls.keqxz.com/','2018-01-05','1515163110','f20fj3YNFHqTbaGHEJgsf1Kbz7PvlfGNHkkset9ncZ/fL49JHZv6O3cV2Ap+xXlLNZR53EykNrt7LSZ4mLMuVZF4z+OvQGobNQ','0');
INSERT INTO `cn_log` VALUES('366','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','http://mls.keqxz.com/whome/user/get_winfo?code=0614SXu41OKcRL1HkAw41sPRu414SXud','http://mls.keqxz.com/','2018-01-06','1515195293','1958MKMLV6L4dL5RLmP8wV2TTltEkb/oRHcpQ98VIadb6vzcWAH5c431Ab923ltftVlnRnrfZqiLcqf5tH1Taxz6x79Y/Zsekg','0');
INSERT INTO `cn_log` VALUES('367','220','17','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-06','1515195338','e0272034/tPBMPTUOUXuhouJEe6Hc1fCQF/fpLsQEXsP39ZjGyDKNVl6mmw2g/5Hjncp+7G2Z/X+zn6sI/H+W1z0h6o71eUjLRU','0');
INSERT INTO `cn_log` VALUES('368','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','','http://mls.keqxz.com/','2018-01-06','1515195352','bef3oyggmL5c7nChW16gWJwWYb1vTzWE0hTmmhFUJuQuqrPICaVoGHGanE9/G0oTL8brRMcTYCz7x6o0XpIVL6NoDWIr1sgVeg','0');
INSERT INTO `cn_log` VALUES('369','220','19','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','http://mls.keqxz.com/','http://mls.keqxz.com/wtjf','2018-01-06','1515195355','0554Bt+iVEDVXqIZMZ79MLfD7vn42oofAY1tx1I94YU1ItQFBcX1hlZesfItk0ztfm3waIy8PILlNuSvasIwZGVDP80n960OGPs','0');
INSERT INTO `cn_log` VALUES('370','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','','http://mls.keqxz.com/','2018-01-06','1515195359','b649K4a65gV/PtitP3iLnnqBbn9/znloV34Uj2Cl2rg/NAmQLZ8QMbRE53xBfFeXl/9PIZSmtjKNEc3ZqTzKpSEhhUfpVxzDGw','0');
INSERT INTO `cn_log` VALUES('371','220','18','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-06','1515195361','5583JOpbzOihg19EdHwAcnhK3c+7cPaB5vFVKFAOWbWW9KJbcwm0xTs908d6B+hVF4H4ra7q7P2ckP/VezRSdZaXMWG+gvwo04w','0');
INSERT INTO `cn_log` VALUES('372','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','','http://mls.keqxz.com/','2018-01-06','1515195365','20cdhmEq8pWtrgemM24K/ERl6Vdjlnw6M+ufQlCPaZWDWVlEo37k8uojioi9MYDtvfCzugNcjoIE7v5phrBbD51fZUGEuAiEjw','0');
INSERT INTO `cn_log` VALUES('373','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-06','1515195371','6b6duYKCo3umPtyPbOle/HkRnB6EyLc98pQVr1hrAaW3lQYlf6oYjKzhuoVWMkP2QVpWof/vFnhrVsUxa8EGot4phvdedxrZ6A','0');
INSERT INTO `cn_log` VALUES('374','220','0','0','4f66077851b8349caa7b3103d67cd1742aae3b07','113.194.58.13','','http://mls.keqxz.com/','2018-01-06','1515195394','13ccR+N5J3XYBUKoKzDXzSar8hjNJb3mueDbkrUepuAZGejoh253pO8JXzKIc2bHG3FiBG7FosDBVqxAFy3Dth1aA2E81bxraQ','0');
INSERT INTO `cn_log` VALUES('375','226','0','0','55cd48b0b53cee0114ee1d86697bf20b5046c534','118.113.56.65','http://mls.keqxz.com/whome/user/get_winfo?code=0214UKWv1fMI8a08pVWv1R9GWv14UKWu','http://mls.keqxz.com/','2018-01-06','1515201272','8f1eqBqf4InqDrq12Oc9JJDXUP63QaIx2xz1lbVCzyMFTVPVNTRp1BoNqlMrb1A4MPZtUaGRoYpQOo2Fyf68KhoKrOlE3ey+Qg','0');
INSERT INTO `cn_log` VALUES('376','227','0','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','http://mls.keqxz.com/whome/user/get_winfo?code=021BFWaw05Duvh1SODcw0PoMaw0BFWar','http://mls.keqxz.com/','2018-01-06','1515209809','df9cxqmJvu1krI5T/43zE8CfjjrpAOHqSWBgII2jLob6Q3+n6078mh6UQDrbrcboFHse1JZsP2fwf2gLB3z6culok3TmhmCA4Q','0');
INSERT INTO `cn_log` VALUES('377','227','0','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-06','1515209902','0834XnBt9mbPoXO0juzuzAMnlkEkJjvM/yCPiWHMQS1L0w+rY4kwCXgknYFIyZQHBlYueztEW0N8yCvSewbrQnpVgCklL+XK0A','0');
INSERT INTO `cn_log` VALUES('378','227','0','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','','http://mls.keqxz.com/','2018-01-06','1515214339','2695gESb63RP5CzuEJ1OtYGFLKXkDRnVK+ujK44cLoGUCDOrrn0vi8PhbOfP1RWNqZ88zFTHIsgVYCDOn/WwxHStauk0K2DYQg','0');
INSERT INTO `cn_log` VALUES('379','227','13','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-06','1515214367','05c8Gi+COeI3YKSIc7h+QrNYVI5hQKXkvz/jDzyd6oqNf9iaLgBHNNkCGeX3RNAwPcT4EOYTLEU+tYB9+yW2+zbwGmhBNOtxCoc','0');
INSERT INTO `cn_log` VALUES('380','227','18','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-06','1515214382','82ee2zBwq5mNIiN3b+7ysDt+oYGPkrN5dWbg1L0djKN+Qk4d2gsgcM/bpu1LNDXDp3KuPdUqSZHT7aOmlIrHamAN6l3JD/jX/Lw','0');
INSERT INTO `cn_log` VALUES('381','227','13','0','665b61dc5f2f9b6fd2ea1ce3cbe9f89094943cf3','118.113.56.65','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/fwfl/?k=基础','2018-01-06','1515214398','ed4cU91LTVMU2vtdFBJicAUKHSJ2JLndXaQvURSS7ESPUVd8AOrQsfwxxhmwvWLZgeJ+quQ+ljlxObNAc48RajC7rpZlt9i8Kro','0');
INSERT INTO `cn_log` VALUES('382','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/admin/index.qm?index','http://mls.keqxz.com/?V=7','2018-01-10','1515553228','7142P7bBzntvslXwJs/W/GMn7sYZW6fbI25UsRgd+pBT78bAg9aJROYhji5rr8pXPqlg1c3gM152/gXWYR/WoMvErMfkxL5zcQ','0');
INSERT INTO `cn_log` VALUES('383','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','','http://mls.keqxz.com/?wrnd=qm','2018-01-10','1515553235','72b5b0StlSoZ2ckoLXLrdz5wfSY5BH9d89PY9JVOeYM5nqHHXU2eIY6Mq9EcZb7Lk/Fa2hiLoSsClilzHRf+mJbmT/k4Jbg/Jg','0');
INSERT INTO `cn_log` VALUES('384','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/','2018-01-10','1515553239','b2dctrTwf6DFD/Zj1STnNsQQIHCCLxtDVWY8lZjgzIUoyjlJQMOk9MfsawRl88o6kmRnPCwd3KvgskfrXzdewSr+Oo3DoYO7wA','0');
INSERT INTO `cn_log` VALUES('385','236','13','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515553245','7320i/EshWLtXSYbCzc1Dghzs+X5NQnyEGEHJ3ukCTgmljS6kbaGT/B7Fxe0z9qe5RxwPKhGssBHrsQiqRIqNCoCtXMAlx9uo6o','0');
INSERT INTO `cn_log` VALUES('386','236','9','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515553487','5f87Diry9aMqMhBaFzJo3eokOIRYBhqYsjAVlpQUTI9exgjw2rUp5bQ/D2SveEJr3Oi4aZ+cTIuqyrI+aEWwWIP78KKYHfjPeg','0');
INSERT INTO `cn_log` VALUES('387','236','24','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515553491','b2b7fhoqyPgugmLv1LBbS6oM+wiHDxd+IptJmNndDTKYC6ICk8Dftn5/WRbSEOdcdl7UUS4av4TQCztpQDfW9ODk8hxLOiGy5gI','0');
INSERT INTO `cn_log` VALUES('388','236','25','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515553493','6795WcyMMmOG62IiQpGPaJUiO4CJTXIkGIwai8++TreLXsYW4MjAyhtWFt7wvFxZgjvB2Wny7Woh4zFlJGedJLxEmHU//pzsu1o','0');
INSERT INTO `cn_log` VALUES('389','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/','2018-01-10','1515553508','2849yjbBD67YGcOw/fY7yHnLut7nNTLUdXZ04i/fRCur7zRE3xRZwovHjXJAM2qY/ddypRBRzZINCrN+zd+ZNszydTbAsiRPjw','0');
INSERT INTO `cn_log` VALUES('390','236','8','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/','http://mls.keqxz.com/contact/','2018-01-10','1515553510','404760bg4YWU1oyyx68JgWfu23uaSi/DB4RzD9kzhZJM6R5RC+b4V1+kk0e6oP6iLE3VA918LqTnleH9rd+DNkNrJKa2RQzIKQ','0');
INSERT INTO `cn_log` VALUES('391','236','13','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-10','1515553914','43e4M22Gf+njQuozYsnLwgX7/aYVdpA3HzS5shWZt34SKs4misX9BkO+Gy0PfXOc9g+bYrrHKG0uLxAK29s7uqacD/wHcK48Dzc','0');
INSERT INTO `cn_log` VALUES('392','236','16','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515553953','f18bBeBLFs42BU5Nji59n4LCfwaCUZfdIkHiwtwbxgppP7rvZgbdrxJaikrS5b147ZbFBt1jUx47svDfwLhixn5Hm+hKR3Q/4wI','0');
INSERT INTO `cn_log` VALUES('393','236','0','10','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515553994','d553YN9nPtoWyPqMwW24K1aEcm2kQCaSFERKHLhu/LBnqKz40dNQCjXVhKY1Vxw0jeCAOWeWsEJduVOKrMo0yz1q6rRUZ3RGCHI','0');
INSERT INTO `cn_log` VALUES('394','236','2','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/team/','2018-01-10','1515554093','157aX4ol1znx6oD8pABYxc0GlU/uE+cxcUo0K3ab35m0hB5Pxcv08/4q2lLC9kKGov2eLXZvX7kDbmDDkX6iawHKtjt9sZXVlQ','0');
INSERT INTO `cn_log` VALUES('395','236','13','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/team/','http://mls.keqxz.com/fwfl/','2018-01-10','1515554202','d93bWY3dU01a0EdNupskJzTXF84bXbq7yvIrMPL5QcxjC0jSRyfN3eE62IUV9c76RzM409sK3cUcyGrYulRHQ2LfHSr9uCx4dtk','0');
INSERT INTO `cn_log` VALUES('396','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515554926','4875gwF7Wbf9tcxOMcQ1mR+FEnpzJuyt6jSwkRBNhet/KBYK0V6Id54Qq/r8ksYmD58JuPlcgIQYuq6Wxdk3Jf2boovVEorqGw','0');
INSERT INTO `cn_log` VALUES('397','236','4','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/','http://mls.keqxz.com/mlbd/','2018-01-10','1515555212','19dcx9ztmnckRHv50tzBj32RHLeztwYYdarWo0OPqBx2h03rPKlL0urJn2MHR6L/2Mcd6UxyXoEeX5sEoDFnWYdlOPwZXezmfg','0');
INSERT INTO `cn_log` VALUES('398','236','5','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/mlbd/','http://mls.keqxz.com/mlbd/list-5/','2018-01-10','1515555225','dc3dbniGIHMDTfHHHbvp7cEdrRTrqMngLcr4AB8QWLyxPFp5Bb2J7Ucdn1fTwanUxFdoz5kJ2aXRoKZQfIN140xmUph43N2+rA','0');
INSERT INTO `cn_log` VALUES('399','236','0','6','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/mlbd/list-5/','http://mls.keqxz.com/mlbd/list-5/6.html','2018-01-10','1515555283','91d4b8kOymLgWNhlXZ0sB+v5FVt/nMdQ9Dc1qwUTah+XiVWLzUuX4MNREhcLdu90o/HfvRCCkJRccnyRwBZwNhyOIn9PYv3paA','0');
INSERT INTO `cn_log` VALUES('400','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','','http://mls.keqxz.com/','2018-01-10','1515556235','c1d3SzCpJe1pWWBbsy49pGHLZN65YGGUzVwpXZtqIY093WIkgjgWqeBD77i/vnbtzX7X/ftWy+rJwJf4vb1CAzH4LPEGCs+wZw','0');
INSERT INTO `cn_log` VALUES('401','236','13','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515556516','1281fXnZ5b9rkAtQ9La9pEknx+df2wKCzGAC3miJsVyoxZ353SJqGE5p7MaHdfq1LwqJy1v9vK09E2/Y9poNdfDIPtEagNMgo9M','0');
INSERT INTO `cn_log` VALUES('402','236','8','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/contact/','2018-01-10','1515556540','2aed9cSWqmy2wkoMzj1FwXwGV9bWQMP3RvH0xTG8imJRA3UBeYM/JZ+kRRPLKFGr8o0md9vN4nbGv/RPlCsjCjvEv0mSj1FjXA','0');
INSERT INTO `cn_log` VALUES('403','252','13','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/fwfl/','2018-01-10','1515556683','fcf2F7rprds3DW2X0nBvByMZNIol6eCCsE1FDyHIk9hLS7V4Y9v6drBacsmRZi3rsOFP1LQVsyAXufAVeaR24dTacaBlmwjgkVs','0');
INSERT INTO `cn_log` VALUES('404','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515556689','e7aaSwLkGnHcbiNs4ymTgmnMwpfmjsydfEFb9TF+KK0spZA77nsOEroPThuvWhqkQVTKpTiQxXE4+y9PpDHoD1fbC382D2nsiA','0');
INSERT INTO `cn_log` VALUES('405','253','8','0','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','','http://mls.keqxz.com/contact/','2018-01-10','1515556716','c71d1VVTbcj4sActglqWlXMhX2Wemeyc98Zb1fJARaJ7yaOEymbKfVei4XSnSgkqI+BrSapwclua1t/Ogd/97VhwPMe7DytaGA','0');
INSERT INTO `cn_log` VALUES('406','253','13','0','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','','http://mls.keqxz.com/fwfl/','2018-01-10','1515556821','00d5xRNc3CMbquP5fGj9TXUZqiuzerAxvUpXD3pEjQp6bGnJXDRMDmL54xSbsZBuJTdtgIbQAjplpHGoV0cGhWX6Wr0Ct42n/Nk','0');
INSERT INTO `cn_log` VALUES('407','253','8','0','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','','http://mls.keqxz.com/contact/','2018-01-10','1515557029','06bc9kgYfm7/mBXOLp1kwz/WpHtdbVBaawSJu9iUdQuCbxIxf8jYDrGRJ3lbzeP17dgWDvfWZuLsgFl0bVIdclGEntQLRCNejQ','0');
INSERT INTO `cn_log` VALUES('408','253','4','0','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','http://mls.keqxz.com/contact/','http://mls.keqxz.com/mlbd/','2018-01-10','1515557039','cb25IMcrJphqAUhm7k7PTAUfZb/QElp9HdPLH3Q6ms3CQdsNH9u62oDlq1iN03PBOh+PELtDC6NGYompDC93V37Ih4Msb6dZ4w','0');
INSERT INTO `cn_log` VALUES('409','256','13','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557096','d882ZuO7XS9DOP/xbOBjbqUP+VJin7Dt2T9AQgtmQeANgUzkxb7e93IaMLF6Ocb6C1Xa8xWiB9wUtBB18ejeHmC6l8TZjxj7SRI','0');
INSERT INTO `cn_log` VALUES('410','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515557105','6d5fBoNC5OE38ODjxljRxTlAboiAHTuFBiMngmAhMtw34s7XKSR2Yl7utbgUF0F3Jp20mrGOTFo5lT+Im4cPnjPgJaC8R8m5DQ','0');
INSERT INTO `cn_log` VALUES('411','256','13','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557123','1740meOZpRHxsISzxq5TcXG1Ow/V0l9CofzBcQO0pedhoyWe2cNtwCovPavwrJC4NaLFw8Tbr+mOA9UxRyqBYb9LthVJRy0GhGE','0');
INSERT INTO `cn_log` VALUES('412','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515557136','ad19JzkVVoAtSbjDZXAsoV4qGBEf1z7hJH1wlYle3Yg3FwAjoi6V8jEPiTrWVB46uwQ4YHCICrO8Q5gsxs6cOcTh9u/LX0bbUg','0');
INSERT INTO `cn_log` VALUES('413','256','13','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557136','14cd5YlOKdeUCLD/FQrUWOvbUdVuUUjZEKNPAYjADnSIUZAzmJl6CSkZtRenb1guDK0eF7JowVfWB+milte5DrunXco45Nocu3k','0');
INSERT INTO `cn_log` VALUES('414','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','117.136.62.48','','http://mls.keqxz.com/','2018-01-10','1515557166','f1ebGRVrcxcJgKKy9LQwlZTZep01oS2m5YVXC+6TxDHg7eXGXCbzevgGXNIZpq/i823ke7nqmCeeuYGSQUZqeOb28W+KnIuUaA','0');
INSERT INTO `cn_log` VALUES('415','261','0','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=001Exh8L1SlKb41lHZ6L1bTC8L1Exh8I','http://mls.keqxz.com/','2018-01-10','1515557177','8031R6xAdTT0p2H7vczQa6d+CdjblVxojCLzG0SmD22wSRqL2zgHSWtMeOjq8852SFLplVzfCkPYCnNKAuhNf39dnDbXbwMV/w','0');
INSERT INTO `cn_log` VALUES('416','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557181','41f3cKVz7WHva78FRYfoB3Ryz7DpuhRtxOpI2nn38VYPD8+894yYUqCfhTvyovu98bhUTDqshhbUFczV8XB1OMPeRRlVKVaQMVo','0');
INSERT INTO `cn_log` VALUES('417','261','17','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515557182','d659+oRU3D/IqkmYMDbz2hTAHJoBPS0VPIYM/pNOr6Hc0eQN4Ak5Or2Et/KeT/F3rCh3UUzvEgEyA/nVjE1YIaVn85fGZc/chOo','0');
INSERT INTO `cn_log` VALUES('418','257','13','0','852d54326ee077622d51c314a7a49a70f6b2781f','117.136.62.48','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515557191','5326W6aLK0e8f6rgeG/5s5KvAUbNc6sc/vf2FkkX43HG/bI3SKUIL7AX7TToyFGtqWmt8Wpz8Lgp0AXFrYqolOstLgPui48BZrE','0');
INSERT INTO `cn_log` VALUES('419','261','0','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-10','1515557203','a01foBE8jFhFncPiJSHtz/CzNX5tEiUW9B/Z7ko9zC7q03rlfx/EV0/iZDPgBz9HhOo/se9DXlKT2HNm9uOifDMSX6Ub/kp6Xg','0');
INSERT INTO `cn_log` VALUES('420','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557206','bd7d18dbczozDRF/81Tw/1Y+sodP4p390oeGRZiEtXYSA/ElVCy+cOdOeZhGU9642rjn95/JNScRh983jXiXEK+EkvHdRGxp43U','0');
INSERT INTO `cn_log` VALUES('421','257','13','0','852d54326ee077622d51c314a7a49a70f6b2781f','117.136.62.48','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515557206','dc3dbniGIHMDQ/HFHLnt6JEa/UC7qcXgJs31UxgUNNPeAAEqB72P7hccyFfUlK3Uy1U/z85Z3PfYpP4CKtZ+4R5mVsgo3Ym2+EQ','0');
INSERT INTO `cn_log` VALUES('422','262','18','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-10','1515557207','7521XxQcHlgFO+g5j7bonPUN3cCYJWGMML0UHPiiJ2ftjqGV7QzPf9cBd39GSn8/rU8Aae5tkLQrog9C/spWAaFEkTkVuOiitdA','0');
INSERT INTO `cn_log` VALUES('423','264','18','0','9655b1aee10c3a6c7d52d543db19dffb62cbf6b0','123.151.148.58','','http://mls.keqxz.com/gdyql/','2018-01-10','1515557207','9cb8XaI3/OlsgxzVWXG6Z44adgXXkgID8NcJWblhpa2ck6WFyz7y99M6UURvW4it8JEesX3bQwpDU5f/euvYS/aWdZh8b015jaI','0');
INSERT INTO `cn_log` VALUES('424','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','117.136.62.48','','http://mls.keqxz.com/','2018-01-10','1515557207','151fDczp7x51CJrCRieVTB+8n++IcgntxYalCuKsZTu+cbPxwn8tszZ0MGuDkVR04eVWwOMU/Oxc9yEBBnYMfsZsrOdxwIWrCQ','0');
INSERT INTO `cn_log` VALUES('425','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/','2018-01-10','1515557213','6ceeFreUf9RiVz1+AkdLi7S3zErveSSH6nU6HQfl7fW2h/9ZEb/5s9L/NAgWMHHWa0eoWTEAq8+K47kFOuOC+LbCOL8Xx1lpvA','0');
INSERT INTO `cn_log` VALUES('426','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557213','84edFaSxXi+ReHIWcPIkT0ar2wkF/z/SfEwXXFqLl4dr2Soc3WnWnCPnpfmmnDLlXcDXB8goXVhMuq3BMNXn9X0g6bkXPcOh4xM','0');
INSERT INTO `cn_log` VALUES('427','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557216','0990u761cvGN6yL1QSa+sSYC3D8QxVO4RCQbjZHVHWlTk0xJhQX8/+ulWOQvRs0uBSh2KBVVPvmTS1YU/Jfk/Z95a8IPfecaf2E','0');
INSERT INTO `cn_log` VALUES('428','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557219','b87e1Cl/0b+kZqlw4AUaPIxP5MWJnRogajCrJqtMk4pmr1Y/k2HORblTkfHYm3xe/mKMt/toNXks23FZqcNCy3CM/oaQ66uSqz4','0');
INSERT INTO `cn_log` VALUES('429','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557221','5bcaQEcigNiG+AECLoC81CWxDV4xPau9Fpub/XqSwzzGHtzNqwtvUP3v29fFAFHvkDGG06NDhbhpt2x3i7H4wZYATsysawdUqjc','0');
INSERT INTO `cn_log` VALUES('430','261','13','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515557234','6739ZkgRHBzArafFF5kaJIO1tpTiKzkvPHAlHVIB5ATIMJafabnyxk7Pnno5XmzqCAWdiVxdIleWhmNXy6ZGrjx1zDEyrF0z95Y','0');
INSERT INTO `cn_log` VALUES('431','263','0','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515557236','1c3fO3EoqZe+VGHH3pBxhQbRIAJ5syq/vrLBXBKeCj4x+wEHBD1Cw/If3nTwHMe8gwXnqXXmxH5/lVs1I7qULl3b5Cj4aWvTVw','0');
INSERT INTO `cn_log` VALUES('432','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515557251','a02epeCbz5rkLY/Gzl0nDHu5+M05i4y+ffANMdBm0oEb0+ZETbpVnNpnE9dOVMrm0T2cfuYTIA32HRnrZaWSmBdbKcDIw6LnsG0','0');
INSERT INTO `cn_log` VALUES('433','261','13','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557254','246e2aeSpVoKZ7NwDjSbfOKHMTT0Bx75mSpTzSQApeR4Gfkdxl+cje+G6JLepJ15DWloQORLFZQr+ru/Rx0qycrCwtPEL7GYDqo','0');
INSERT INTO `cn_log` VALUES('434','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-10','1515557257','0e41AHmeJSkayFvnso5T36m7fLEsgDypDrAM+ro/SDERr/Za/imEbeHfnfbpa3UwiLt6N2u10Yj0DO8qoSRDTV0eyaVOsBwSXw','0');
INSERT INTO `cn_log` VALUES('435','262','19','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/wtjf','2018-01-10','1515557259','cddf9BEEuKMWEeSZEjpWie6HMkXfWcS7xRd6UoTRynpUV/vTS6m1VL6TszREZYRsOiJKfbNsb/3bbHkBtuET61bYoSUHnFo5cX8','0');
INSERT INTO `cn_log` VALUES('436','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515557261','c435sbRIek/rc8H4yos9fqybBBlmg0FgwAVZwig/yVz40PV22FbgTGFIdc5sbUTd7f/ux5+ZJEj6JhJsaLn41IZIrMMOgzVwA7A','0');
INSERT INTO `cn_log` VALUES('437','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-10','1515557266','4508GuxKA/XEqO/HMaWLuOoF9/X14l74OsqlcL14YBIaWDQZU/G3Boi3UOBpfA52qUVmu7CRTGXfQJqAQFl/hapLNM5TpjDMCQ','0');
INSERT INTO `cn_log` VALUES('438','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/','2018-01-10','1515557268','0516G9SAf2W/+ACHDhrLa7iYMMXAP8Y1M7FsBWYUOClHlW8FaLwjKj5CQkMvkR0NwbxPjVSUzZjV1x/zQWlyOfALHQJy5QthSw','0');
INSERT INTO `cn_log` VALUES('439','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557281','44a7ow/1P+kk3LUxXNgR6x91cjOp1Lce70CC33HQOKCYaZ+6Nr702sqPhFMHkvKKCTvHB26i+TMV9+JqXfN/pV8bYvMcK2e+yjY','0');
INSERT INTO `cn_log` VALUES('440','262','19','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515557290','3a71PWN6vSUXm0Pwm8VzXX7k1M3o4EMeZgBnQmGKBI1DSNXeWUnevMDe4uBa7dA8cGCAy6SomAyKzgINacswgnMRO1aIWJU/mPQ','0');
INSERT INTO `cn_log` VALUES('441','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557293','ea72sSYhUqVckBZDD5lkntFNPt1SXx2TlxaJoaWzfx5SR0UP5/IQTrPDQOq+3JcMmFqQk5TV57tM95/jTShdDFN+lNlL2gLb2Ok','0');
INSERT INTO `cn_log` VALUES('442','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557328','503ftpsFkx4KgN6f5qB6LvEKkdCP1XcZPWTyf23PaLnYOzR/wx7uTh7nXY/V1eXEh+2OS3eT9JZAH92fkJe8aJ3BI5g/qnDgNZ4','0');
INSERT INTO `cn_log` VALUES('443','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557340','1772BmMdWCvj3Vq8RuBRlPQ427nuHux/7LP3iIsTkx4TcD9Lf2+bwRKtiH/AI2ZfRwpJpM5X0GuX8g+TMwOnz6TngoVUrfVKSHE','0');
INSERT INTO `cn_log` VALUES('444','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515557343','b9f0h6UmqcpOq5r41BlGk/Osd5mlDhJe1BydPBVYIMwxOGtICJRdhyqOF7oL/o5nqvBQAhIGJxuTehABxfxOjxhx+HrCnqi4SQ','0');
INSERT INTO `cn_log` VALUES('445','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557354','a883vJlSFEIUVGVx53fo47969r6Jd8u4DbsnWQdXMWf+YrFH6MmVw2MePgiJvqSl8rg8bSK2PQ3XBiIyu7yQ9vrbsz+j0LB0Sn4','0');
INSERT INTO `cn_log` VALUES('446','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557359','c362wUf+E1c0xUiSMKitXKkMlIVvmFmDFcxr0/+9J0NiEmBLpdY1czElnSX0/frIBF/UKzxojxN2i0L1bpJWwzOzs+nN+gF/9k4','0');
INSERT INTO `cn_log` VALUES('447','266','13','0','de936a5683c56e8593eaa1290995ccafe0145570','118.112.185.236','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557758','08aelwgFBWPomoBiPP4IW5eYeCk1V+2UQUpL3Mi9IUa5ERwKGh1ZTVaa1SdaPjiL5HF4NeF+HOs68fAXsrmUAseBhv2MJK/tscg','0');
INSERT INTO `cn_log` VALUES('448','266','13','0','de936a5683c56e8593eaa1290995ccafe0145570','118.112.185.236','','http://mls.keqxz.com/fwfl/','2018-01-10','1515557767','1c5c5NIBNYlHpAWKRi0LdLcf01u4wJE8qDnHBM6bweXzxuSs2SBiSuNKCCByUf0xuRbh5I7xzLteJ7hbwsFGhOLgTzK6dEEJPxs','0');
INSERT INTO `cn_log` VALUES('449','253','8','0','2a01ad374e4e5afd22ddde67567136068d9cc296','110.184.221.139','','http://mls.keqxz.com/contact/','2018-01-10','1515557921','25b3jWWo1hTDUVfxmCmM+IngrlPP2B08YgGXaF9yW+5Ha1XrEqfksNj1ywpfXOFL5h598wuFu/RByENmMOumVTyxNaVi7u79sg','0');
INSERT INTO `cn_log` VALUES('450','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558113','0cc0fK1XSoGHb32Ef6UUF2KAJMS+MJt5rCcDrJVeLtDnqbT9euxgcFbAdcIGOD//qDWJlWdyeOegh6UpLGtS+EWWVIYkYexw6w','0');
INSERT INTO `cn_log` VALUES('451','252','9','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515558116','cec1iElpU34/JYaRhQfyp+PArd0+ITCFK9WPzO7KoLflJW4TbM+80dve33+RlGChEPzI9O1NwTGOdCPYBDXCV5DAsmikG1jDxA','0');
INSERT INTO `cn_log` VALUES('452','252','24','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515558126','2a18Mgxc6TDlAxUVEpzuZY9VTDAmcf2ktU5Uv047fI/tWMKiyRYhWKOi0szUGYr/qVKJQPwweN+9ivxAWcuKgipinYcwRkmiMVw','0');
INSERT INTO `cn_log` VALUES('453','252','23','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515558130','0c54kDtXRUS73lU2l9MgY81jSZb3te2W1x4UoGaifnO+pAnzdfxvC/1lrViIi96Tb2AnXgf8OAaQYdxHA5GY4gp6SiRJ86nX3kM','0');
INSERT INTO `cn_log` VALUES('454','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558146','d381HRwXAqKVkqogCTmqARq8KPhTGM3D2VP9U0pJBXFBNzuvmNT8xbSo5z6F26qetYlLOW4f2RUb1Tq6g6u1QMcjY+3M8Xk0mg','0');
INSERT INTO `cn_log` VALUES('455','252','17','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515558149','0c70wtecDHTy9iGk4eqLZTNk70rhJ/9wTEDLtfWCudmKgWflz29FxbXGVwUfOKkIdnya2PXjHzOwcBkrGNt75Kb+AeXeUhQG6gE','0');
INSERT INTO `cn_log` VALUES('456','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558155','81000gUXynB73ManTJQpl7o9h82wQIy5opd9n7DWfJ5RBjCCirwuQ2uTAlbiINijWXC6wK64i6Ly6fbx05dOmDVlwaEO1JICmQ','0');
INSERT INTO `cn_log` VALUES('457','252','13','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515558185','4e10TkrVtVB3GinRvhoIXCqdyKzuO1+qgAnPRmKHfYCZLgQKpytO0j4EUCeMIPlNxKRF8gNt7MTYoYtBqVjDUlWWSr5rccHZQVg','0');
INSERT INTO `cn_log` VALUES('458','252','16','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515558188','26b80+/DXNkTJtFjETE1dE0cX4yd47enf8MHNu+oQVwbO/HDlcAiUfnKh9o92jehPa+LY59bszNZgW6bshhZZAXOnY8a5v5EWuM','0');
INSERT INTO `cn_log` VALUES('459','252','0','10','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515558189','f1fcY8wAHT3bLmfHhcDsInPp7sYSkA+Eys6XIadD3ieg9NoiNqBavq6ojs+6elowtJuSyXCK6u1a9EbsPm/ml1zpkhebOh8eUTw','0');
INSERT INTO `cn_log` VALUES('460','252','0','10','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515558218','4255sgXNl661YtYicyvg4Vgo9jnxpTY/ww0hYGL0cW5UDye2/IJch6HfniTQ3Gk+asbRHbePsXA5GeXdIc311RY9/uR2AP2aDZU','0');
INSERT INTO `cn_log` VALUES('461','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558263','3474XSwe9SLILa56U/Wfr8Hu9ZY3MWK7BKCoF53Zeq93RsIqBBsT966kezmqD+cB1FBPPXQ+v4CDN4Ed/sYqO/Rly9wLrJXpsQ','0');
INSERT INTO `cn_log` VALUES('462','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558353','0061Nr3oRGkZ+6zavyIKySKGqFyiFLT+cQiUo50/VnVpVNuPNgqUQpCEAyh55tWfdUq/ktpStzfFV3N2WLYjJJmm5L1uUqiGtg','0');
INSERT INTO `cn_log` VALUES('463','252','9','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-10','1515558428','99b8vMrxK0SlyZKeqVHgPGWsxKWAWSTKA1ysW4j+OXkdLZIu8rysOc+REeWUGPLYhMPV2AEkXBKCJaflu+kaw+KmxdiI1FHRtw','0');
INSERT INTO `cn_log` VALUES('464','252','25','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515558486','c71f0ZyCS62XSDrTNO4IHmYa5i1mcI+3eoOkjd4LBBSMZkX8WHftEMJ2VWDEVfAxox5W5czU3UYJVQXy8I8QyCGoy6fSiezd/iY','0');
INSERT INTO `cn_log` VALUES('465','252','24','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515558494','7b118wRqOTyGXHHF0e6qazYWC4xnI5MlC+EP9B9/myZFd/eArMXYSmbUU6zTz+T+qBIn5beSqNLTv2kDiw0ZVZomzgdbBNIau1c','0');
INSERT INTO `cn_log` VALUES('466','252','0','4','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515558502','4401mp4IZXKpg0X15H7Oy8u8ak6LMiS+EvbQmJy4upMxUm1sspTJF6MOmQ6Hebh5Od7lck+9YleKO9MOksNJoNo+L+iAHEuDTQ','0');
INSERT INTO `cn_log` VALUES('467','252','24','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515558541','81aeb0Z+l1zVpLGApToMpDBkt9BF8d9+o0YlL6wnCEfcYPqlNra/gPZREHH4iBdGz1NR7UslBDPSJKqh1MNP8JGgPLDl9Ks47a8','0');
INSERT INTO `cn_log` VALUES('468','252','24','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515558579','3c6f8dwd2uKPz6lPsdpHaWx6SkFAAAqLmDm5CmqvqbMMohkOjKa+ikGI2pfH2T/UMMhrFt4ZaH70RTqWz3ZA9oiJc+S2YK1LOX0','0');
INSERT INTO `cn_log` VALUES('469','252','25','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/user/yyfw?id=4','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515558580','21fc4Obs1t500xmbI4Ohwy9oDnU9J2nAMnA+XkiweEmk+XYVWZYabfCvp0B36Exq5j+d90zxSW45lUZ8LsK1UmFlGeWt6FkqcXk','0');
INSERT INTO `cn_log` VALUES('470','252','9','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/user/order','http://mls.keqxz.com/mlyy/','2018-01-10','1515558581','3066fIzZEfbfbB+qQvVOYv8oJgB9Qx8XJ91ZJQtt+ycToVYPBlLWhPVBl7MjLGmM2dBCrKO5MNnYCJoyf1pZGFvBECc4tdBOPQ','0');
INSERT INTO `cn_log` VALUES('471','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558623','f1af9/POsowVJhxSvW5JjtTZVcqGXgb/c4ZAyX9EHLrot/MHESx+UPpyh58xWZpFpdJAY0LKE1S7Kf8ljXz3vba4GhaIRQPhuA','0');
INSERT INTO `cn_log` VALUES('472','252','0','10','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515558648','29cdrrCASO01jmizuVa3x55gIASHeLe0wwyuIMIwQwDLMzL2m9L7B2umV9tN/7NEUUuTweUUZCebgv/s9OwDEx2K9V68zCl0/4g','0');
INSERT INTO `cn_log` VALUES('473','252','16','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515558649','17dfbinbfszL19U7A6ptg1VEfPh4sWchWFoPrWcqoYeiSkV5vKNU9VDzaYwADHc0KYYjANd/Vi0ve4/neJ3vt0BdZIgvMmBKjVk','0');
INSERT INTO `cn_log` VALUES('474','252','13','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515558650','5f53UtRMmL4YxXt8vjTSXaHNXAMLwwKLYlb1Y4XZEzhGsu0jA13zKs2rbjpaAj9SrQoOUkUjf/tZ5dA3GSAcjYkBwVQnzCfvq3Q','0');
INSERT INTO `cn_log` VALUES('475','277','13','0','350bd99672e52ccc0a63451a07673f72acc34621','123.151.148.55','','http://mls.keqxz.com/fwfl/','2018-01-10','1515558650','92236GhhCUaotvKywWJftwpzVZqCToJSvXsap3s8TcvoHVVwU8z5zV+/gsiJD5ryDvEMpS1c+wOxuzrm2P15c8/n8NKWzqqMELU','0');
INSERT INTO `cn_log` VALUES('476','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558651','4e2dRdQWIqStqhqZy5emOzxWKrBpCMl35CR1NGy9DX434kj5JlzUX+IA7xE9oew2xQcr1vb9kI7L9UsCnxeGbYJj317IfI6ZGw','0');
INSERT INTO `cn_log` VALUES('477','252','17','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515558651','6da4bNOxazSxZhRzoY4lKDS3x3LOKXDBn6coB1FbTr/hmAOH33+DAg0yyfXeRrH507w6eVTpRk7JyzgU5GKQgunjE9+xIv9+pME','0');
INSERT INTO `cn_log` VALUES('478','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558653','e4ddHn+7ON5waoNEemucYF9HlDsnXUFn15hCEc5Kj07m+k7ZxfmIZ26x6aGb9HMeSICrpJiAJ2B/J+q2shNuc8xBjJlxX91dOA','0');
INSERT INTO `cn_log` VALUES('479','252','23','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515558654','947c9LNxpYOxTGC+MI8hI0aKrMMAhYOV5MVZtM6BLl+bTU9flLcEfg+r8xFciA+mAmtp6Q1ZErA3u0rxhfYGKQviCDdPOzBegMc','0');
INSERT INTO `cn_log` VALUES('480','252','24','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515558655','0f0ffUuIgdAtaHJaYe9v4BfLvn5YQzNKOHN9No5uxgcu2z9cMJ05E0Fx91zs09/nNooIUkLc5ntFL7g+m09Qf4FPNVbPlIIHHME','0');
INSERT INTO `cn_log` VALUES('481','252','9','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515558658','151dIc76B5Zz3ZiZ24mSRs2qu6mxL2kD4vJfYoGp5vk2yn7KycVX797zZ/RGGoGZ00gjRDnVApMl+y4sAA6k8yQ37WhmU/YgyQ','0');
INSERT INTO `cn_log` VALUES('482','252','0','0','538d05a89021c3cf7a15d88ea4898fb3dff67bbf','139.207.93.76','','http://mls.keqxz.com/','2018-01-10','1515558659','ccacBBXT8Lu6dqSfgG37RbQJ6l33voufg3jtkWxn4qf+md6g1NQsLQst7kWiscPRi8WDaiDH0Gv+mZonOMGAxDaBao6rYVEX0g','0');
INSERT INTO `cn_log` VALUES('483','279','0','0','dbfcb0a3e534cf0d2ff8d7c8a7f182acfc3a2d7d','123.151.148.58','','http://mls.keqxz.com/','2018-01-10','1515558659','21b3RvMz/2vIE0Q10P70xAt0FOLIChaE4l8iJf+kbCjxaAhmjDhcGWtsyol/c11/iLIPNVHW95byj3NbnRkYYUZ049sNHYlVFA','0');
INSERT INTO `cn_log` VALUES('484','261','0','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=081OrDOj1vy0Qk0P8zMj1mKGOj1OrDOJ','http://mls.keqxz.com/','2018-01-10','1515561509','afdcN/6dOmgqaxwgB7O1BcCYY6+juREJ/UYIlTp3D4gmL8zTQALs+viRO98EjLw8TWhzGHhDaYLL3ZrgMdISE1JY7K6Ay4Zc/Q','0');
INSERT INTO `cn_log` VALUES('485','261','13','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561519','9dc4VR/2vRT/ZNJFgPSV6EwWLrnyFh2tuH9LMO0BJPLSxsVeb/qhINRDRURsJT7c1tfCH61z+fKdGlJC4q3UbwHcqIDslmhGAu4','0');
INSERT INTO `cn_log` VALUES('486','261','0','0','49f912cf8af3615ca93a1430abc47366038e31ec','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561524','fbccyuvc9KF5uvlbu8Fy7pDQDM3XdjVuzUURPmuJpsknmzvUkJ7O8T2SjKoZivI7Ucjs/FaMrqIx6vPPNlQ19e0WstLgthBkHA','0');
INSERT INTO `cn_log` VALUES('487','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=061AV1PU1mNFQV0M7uQU13oaPU1AV1PI','http://mls.keqxz.com/fwfl/','2018-01-10','1515561528','3ea2pqIYGtwM4s5Ejn1yxBbEX58nWOx4eln1N7Ec62QGVCtXxLrVNUZRvyssgW3K/DNc6/h+/YOurANdQZVqiOG+H12owKSFn0c','0');
INSERT INTO `cn_log` VALUES('488','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=021afNZx1b6sRg01iE0y1T9JZx1afNZr','http://mls.keqxz.com/fwfl/','2018-01-10','1515561537','d71ed2/GHjHRcHTfeqhSX0PD+HDgD4zXeAWKawji2rhByDE4Rc+UKJAxpOJmqI+fvctZCw+LKNGQIc5kDGZoHudIi7iHicPIYiw','0');
INSERT INTO `cn_log` VALUES('489','281','16','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515561543','d75aNkh9L7sQO4gSHYZX7M9May3iocQmJEnTGZ0aynQTzumBByVKfwftE5V3dSe590NgKlVtzAE94Ud0qy/Z3w4UQemdRoBF9Oc','0');
INSERT INTO `cn_log` VALUES('490','281','0','10','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515561545','f70eaCdUCyVGPDwWeCzyDGWL/67AomF403E2GWjSFHKGe0egrmVf1eVvMagOEQiNelyjaHhA7FQS5aur8hG1rwWemuWgm+YwfK8','0');
INSERT INTO `cn_log` VALUES('491','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561547','f9a0tvcnIa9GB74t59pxIbD3BfByZ53BrdKkDCLtnAtAjINUQgWbquSZXCk1k8CUYrSAs5emeN7YkR8Ty7QYKI3PRhATn1MdjA','0');
INSERT INTO `cn_log` VALUES('492','256','13','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515561554','03fcOgz2hVKmJJqI4ST1v2kQtz89wjGXvwWED0VaDxPUSyVAyRGYMWtv+fjh7SmYROEZgb5+7tq6w1fuFF8bNzQJwRhbm0tm3Es','0');
INSERT INTO `cn_log` VALUES('493','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515561564','99cduz3BYopahIDyxG9y+W022fSBJDJxAlBaHox2XIbbNGDfqfY0gGvemMk/SvplQFzZ7t4qB9SgyuFI1X1wzDHQHGGRPaXMnA','0');
INSERT INTO `cn_log` VALUES('494','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561566','3686tT0UVwbO3ejomuH7nTYjKPyFJ7RGM1T3J3KqXAYcqdu0edFTyBI4dnY4lpporR3yof3/RRTQcfLcRqEEBwO+gncGdtqqHA','0');
INSERT INTO `cn_log` VALUES('495','281','17','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561566','450eKd0wRzzu5pLNpEBpfKH44yNhudV9X8NhCf5Vx7fbUIxHWlyNrFtpt9DqZzQRM/lsskenvgdmEwar1bPDMo/0i0GmLoskSOM','0');
INSERT INTO `cn_log` VALUES('496','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561571','8147Ofv8bfFxUGMz0dkQ4tvgKV8jJwgXCIMdww7HKLzArzNzAReALeomm4LWtUHPs+wA5WUjANiasCC4D6fYQoE7rcA54+MYGG4','0');
INSERT INTO `cn_log` VALUES('497','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-10','1515561572','7854ouPXPvTqWarG1mC8EhXlLoCLAnHOupsRgsFW5tlCe5uEeUU7g1f/7Tj63tgh4lD8a0kMNSN/wWyybqh+8EmvdnuBZ3r3Wg','0');
INSERT INTO `cn_log` VALUES('498','256','13','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515561615','e1e1Z7brxTbAJbUATLqX+Am8PT9FNns5dBbBi1TPTUkHWnt7B44e4pzDviaBZ+OEgpD0Tdu5SfLQEZ6U94osLDn1I82Q6JPRLu4','0');
INSERT INTO `cn_log` VALUES('499','257','13','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515561626','f9beb2qdCqzNVXRnFeu35k5qARxZRDsOTd1FWy2cZRmh00PqpeUdkCuTkpOtDo43p4gj4qqHiB4czQXTT2RiJ5PRrbeXZMDnKYU','0');
INSERT INTO `cn_log` VALUES('500','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-10','1515561646','6456ZQmP4vJukM7WzNXwJceJ4MPo1oVSwiEQu0YhVFb8ShsLwIIC7hUoNTI3ytQxjxTdmx5gMJkzZqvHuHQUj3qm8jevdDJQpg','0');
INSERT INTO `cn_log` VALUES('501','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/','2018-01-10','1515561648','ed8bBsRPfBIUKMfmHGe1w8ex2v/vy5FqW6t+MJSyO5bMr37946lnLAlaVGi+QZFaGckGcTi/uVEUO1HViB1n6NfMGHOPjnYwbQ','0');
INSERT INTO `cn_log` VALUES('502','282','24','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561653','ef9cce0JHfozCp0jSh4z9xziD1kCo5ZTwH8ty4oZB8uEP/UuuJ/xAh9tAFgkMxk1cfRU9cTPnLFxDA3AoMWBEN9OxxiwC1i9Gw0','0');
INSERT INTO `cn_log` VALUES('503','282','25','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561661','e63fZ7sqglYUeghtpjv1zHbQa96yIzHDNTiohP4LY9+cdcaRmYIWG4SVPptLEPNX7XV5j6JN/lcsfiQwmNQR2lCt7UrPgW3x9gY','0');
INSERT INTO `cn_log` VALUES('504','262','9','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561662','f2cb3W8zPPkclTgipZy5X7x9fLvFMGdWo4y7PGHGvymHMgLOjJCjJ8mUBZ7Hgporro+8wcQxCOe5na7/cpvBxViEGo8h91T4rg','0');
INSERT INTO `cn_log` VALUES('505','282','24','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561663','90b7T+MlOVATGJzCiIt1CB1wM4EiQVEuN1eU2U8GmG9Lyt/dfiu6gm9Q2Xhg1jWWJ5+OxSr8GQXLw83J8gEB1lGVwXIx6AZaBpU','0');
INSERT INTO `cn_log` VALUES('506','262','24','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561665','4fc7Yr7LwTNX3MLi4iqxFsXlXR3W688j1Vm4HmfiBn2YEOpCZ6mCl6jaKEkb+cufQXDtnTF8eCCTihW4Zo70tqAeqTHKSq1CoZ4','0');
INSERT INTO `cn_log` VALUES('507','262','23','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561669','0e15EL4Up/jCu85sAIQyoz4QURncqzmy+Vl7764d36WUcuSFKgs8xY/wzD9jfyfBqUXKcH+HXP6MnRjERKVBMrx7Yu6DxWX+H60','0');
INSERT INTO `cn_log` VALUES('508','262','25','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561671','6aedG4TAlBc28Kx8HVYDYmCWoD76yYT9TULgC6E1OMy8KqTLTwKWAjPn5nUN1OvZKXtQcCzJDGGcdGe0pUoZZMTMj68u2LEcYgI','0');
INSERT INTO `cn_log` VALUES('509','262','24','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561673','e7e76Zw6NcNVvk0aM4UmGbrYYwQeYjZXR8USR8mI8DB0jZ3/f2f2yNueSy289C9vOESSFPYAU/qqDETh6M1cY8suppzJlYt7K2M','0');
INSERT INTO `cn_log` VALUES('510','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/info','http://mls.keqxz.com/fwfl/','2018-01-10','1515561676','84154Bc4jXUq2MX+WVQsCNW/SfajWEwKMf86htt/yyFTUMff4T8BC41QbIWbS+Wypq5JRsIEh5a4diKQFQzx1vNeHcKlZBcjvsg','0');
INSERT INTO `cn_log` VALUES('511','282','16','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515561678','acc4xBTxfdmatULBDXuiaaU7K/0071QJZaw8MBguALbmiVXM+5o37+tg8SdphIKFqoUPXe9z7lVs086WgEBO7/2fFxLYmiGZwtw','0');
INSERT INTO `cn_log` VALUES('512','262','0','4','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515561680','62d4RZ20kfN0gp6i7tFZ2vwY1+nbPAX2FZ/2ngI3MS/1g2/tgQ471ajFVQ77/ZM3+PF4CEy1VZN99ydECUUcbTjrwgCTvm28Ag','0');
INSERT INTO `cn_log` VALUES('513','283','0','4','b31debec44ecb07da0b5c26000daafc29da4c070','123.151.153.120','','http://mls.keqxz.com/team/4.html','2018-01-10','1515561681','a52d1q+LlYlA1GdFu80ugwTZ7EEAvXmi4KiaDdWKwHcSL3ihojLd1UMQkfHFKkcDqbezVSbY+v7XS42XE7Ek0l03OJpT18/OAg','0');
INSERT INTO `cn_log` VALUES('514','282','17','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561683','adb4AT8XB5H5S4tIyUE89xbVXKKY+tP5ox8Iu1ECvhhDxYwTI6IeymrPb403c/LpU6q7b0RhHCKFRL/o6bVmCpiygrBNp6MsAro','0');
INSERT INTO `cn_log` VALUES('515','282','18','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-10','1515561687','ab31nEMrHR0mPj0N6LMuaie1bEXKOPG5MtkUilCiGEdhz6WoV0afHqj9YgA4+kry/YgnogT6ZH+vjZXEmBmTpJTJUpndn0pEW64','0');
INSERT INTO `cn_log` VALUES('516','282','19','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515561691','a332pY3pzj93cXcZYiBDJuCVN/tfLlwnHlBxTnmD0NL34AbUVPbZUXNkN9/KizOi6vvA78/xzkHhwp1y6hvCj9AM5D9Nd+tyUnQ','0');
INSERT INTO `cn_log` VALUES('517','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/user/info','http://mls.keqxz.com/','2018-01-10','1515561705','ad26lQgQjIY7SmVVsExcdceL0sdAbsibtDiuxjoUDvKcw3MqJij6g0sDNwu+qXIVNybXSPjqQfc0eMA+pghz2z0wSCSMmli8UQ','0');
INSERT INTO `cn_log` VALUES('518','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/wtjf/','http://mls.keqxz.com/fwfl/?k=童颜魔法','2018-01-10','1515561707','dac1rJGxpezRcZKjZU4XEIRqHsZgGj4VSkYljLGSI4ui6VSLje2Q6k2KBLUAIgV6J+0viWA8fAWQfUTuTMG4tXZINPWyiVck2tc','0');
INSERT INTO `cn_log` VALUES('519','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/?k=童颜魔法','http://mls.keqxz.com/fwfl/','2018-01-10','1515561710','c09aT2y3iEJr1f+7WTZc5zaat+LxERMTYDALX3K/hF/aOdc/NXgbEajN8PlnGEyUUGI4Hjvpni0mDhN/mlh5p8HiioIVuoEqMJc','0');
INSERT INTO `cn_log` VALUES('520','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561712','7a10oVwTpm0MuCWpvsIBm4BoVMzqNhQG4erD2CqEs2+/tP+KRYJt67WW0Xc0IMUfHnB+Cjgt6DESjoJvjF4zHuZ5RF5GKkpTgQ','0');
INSERT INTO `cn_log` VALUES('521','282','18','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-10','1515561717','128aW1t+QDK0GUeRE/Id2fc+w88GX7vVO70n7x+w/YMSSUj59PZNWSfhNnKZyzugj+/A2iPFbfXu6y/Ufhh+OGuZ1b+GW0243JM','0');
INSERT INTO `cn_log` VALUES('522','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/','2018-01-10','1515561719','9814b3ZwpmOxWw2zTefCpG1ngs1f4Oo7ZZa+tR6Ofzo3Mp6FkRUvU2E1/bt65C6w2vmWa83ppJ//jg32rAaFb427H21UlxGyIQ','0');
INSERT INTO `cn_log` VALUES('523','262','25','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561734','0238tMPBe4jYbOrqJFl+rNIRgvHUMwfPny+5EiMtddrC7hcOVhdKZdPDdSNMTWTpjz59DstsB6Ca6RA7nZOqHacnQlx5+R/UJhE','0');
INSERT INTO `cn_log` VALUES('524','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/','2018-01-10','1515561740','df7dDCmvBWcvmxua4l9pHtxH5Ow8sUGc7zTQn+NHZVTF4+HNBHTgQazj1Bi4ofUb3+18xw04ePs18VOkJ3Y4yi75z0/RIzO7+g','0');
INSERT INTO `cn_log` VALUES('525','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561741','aae3LPddpiSSf8pPo72OJTBliM4BdU7bewdy3tCjisupcVMrheFc6bjzomiCY9/amhOMrEjuYIOadHoFcGK8V5g0wBpqwq0ahYg','0');
INSERT INTO `cn_log` VALUES('526','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-10','1515561747','7c5coeaVyLj4pC4kGC1le8AKdgmY4QIvMSDTq1yDUu0QZYVHV3MheF+V5tKgoajm0m7E8w057iOqn+jDFXel6EPFYyt2wyLI5A','0');
INSERT INTO `cn_log` VALUES('527','282','24','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561749','8d1ft1xthOAxuqRI/0ZGjapmBOiCbaGJbYBtKQiFqrCHTZaklMuOFYEgn+fPP1U/LvqhTIPu1TiMVPEoRiEuVBkLyg/WEcescyQ','0');
INSERT INTO `cn_log` VALUES('528','282','0','4','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515561753','b909VqvzUqSSNSij9GmhuUMn9wOCut4Y3MxSAeTQirA57JtetPL5YEparkRK29fr6TyZh17SzVSydBkvs2f4V5JiRnoOPiSE4Q','0');
INSERT INTO `cn_log` VALUES('529','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561754','3719xrnQbaSkc83alirWrFYbmU4zLyP2/aG9ev9JrMZmy//FmWa1qlutXJHMVCq90RjXYm6YklOGuOinvtdnW3EIgMQO8xs7Jg','0');
INSERT INTO `cn_log` VALUES('530','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561757','3873b6SVZsoG/v0x/0KdKk6+i8c9lLAxzZNBm3Oft29FOIxLT0DRr34KkSbljPHiOER5PHW3Z6YcphCUKus+0Zgvh5X4LgNR9Vc','0');
INSERT INTO `cn_log` VALUES('531','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561759','f54dK9rjUnr/kRYBuBylmCTXYONeQAQGra2reIQ4M4VkhzgRrjZqNFfEtCDVcCzp/VOqjb3lRiiUySlgl4ZPRpdXuNSwNXZjmAs','0');
INSERT INTO `cn_log` VALUES('532','281','17','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561769','8034IT8sTgbYVhYFRCvh4i5AM92FOToloiQ6NjOKM+I5x46nJS9G2D0K+0FkH9BhDiIj5Xt3wTLeLSMix/tuJE0b0TJe9Ogd0Yw','0');
INSERT INTO `cn_log` VALUES('533','262','0','10','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515561769','4da70itxWlS0yeZE18SWKDToG2udBNqBDOWIsxZsMQ6wQKseeuOE2w65pzAYImJd/7WK0QECMlIio4ngk/Q1cvCD/19IEGkoiYc','0');
INSERT INTO `cn_log` VALUES('534','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/user/jf','http://mls.keqxz.com/','2018-01-10','1515561770','5b65cwT+3k0sM4ae2so2sugtK9sUITDg6XYu4GQZt0MCN14TqwaV+WaKHwmE4U6AXkmOVPwWe++K6cC3BAGfsaNkQ5gj8E3KgA','0');
INSERT INTO `cn_log` VALUES('535','288','0','0','aff872f8ad9bdda57922a7ede25a3d1246c756d7','123.151.153.120','','http://mls.keqxz.com/','2018-01-10','1515561771','750cBcNg8zto2NhSSVKKkutJwrQ+ctjtr2miiNRkXHVK7JjMaHym/VLcnE1boCnzf+L6Gz41MAb9Q/KXDU0944oCrMeLa0prDw','0');
INSERT INTO `cn_log` VALUES('536','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561775','b7eazi9GoVKsn4Kc106tVvgmSnAJcSuTuh7WYVij++Du8Sfe/prP0VYT5FZMa/VKpENKoSSTnCnco57cKsBaPww2kJJMgv1XiLE','0');
INSERT INTO `cn_log` VALUES('537','263','0','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515561779','37daRePRMb5GNb3ptAmKtgadPROoJ1pzoLJKI4X1aeQXXO2oHmujexRXbIkxE3XTWhfFW81vaoXwyPCY0FhKfkxmr0liNyCWJA','0');
INSERT INTO `cn_log` VALUES('538','256','1','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/about/','2018-01-10','1515561781','f6a2THqjmSqsiLBYM6u1CoZeCiAV+SofpPpQ/wNXvJ/s2JC1cYDPaZGhdFgHcexFEhlnagtNRLrTYFF+A2xRGTzRpk+whEqEMw','0');
INSERT INTO `cn_log` VALUES('539','281','9','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561782','d297Wl26igpnFtmj6RSMIFMom6EzGh8Wy41oFZaQJJ/BJDd9SH+xDedd2u26NcZf8B2vnMkizR9T/CDfO+v/fm9PmtV6GV1CgQ','0');
INSERT INTO `cn_log` VALUES('540','281','24','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561785','ef46L15FKzKcdD37ZNpR97z4ZYQyG5BH+gvSL5kvxOUxSu7lds+TRlt9F873bLKtS2O8eHdFM64t2LL4bWgTw+hOvzCXua7ItEM','0');
INSERT INTO `cn_log` VALUES('541','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/user/jf','http://mls.keqxz.com/','2018-01-10','1515561786','9166YTVH+v4sRbaNk1fLP+F7L1iOEbsnUIM9WwFvdDscOjrHYWQjFm+SH3Umv9MUfH2NxQBy7Dae2a92mNVyx/ZOqtahEJWxVg','0');
INSERT INTO `cn_log` VALUES('542','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561790','bcf0NvBErMj+qQRm7XOYPI1Q9EnG5h9UptvGuhxOI3+w9D30eFb6rJ4v8yXSzV4puE23F7RanUQ7JcGHIAS7BO7C8WJjTDkTIQ','0');
INSERT INTO `cn_log` VALUES('543','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561792','2e85yvZWn3gNmMwYtsL/hH9FVSAzwlxOIMBvZBim5AZGngENbYUQK+5hGwlP+MSfP+QpVaZ87oPSw3aZB/rXev6SNSyIGDxZZxw','0');
INSERT INTO `cn_log` VALUES('544','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-10','1515561799','5ddfyTF2kWdGzUUPbb7lNWh+pUVAUicf7F1II1dGhwvCWP54Aco8Y/f1sf8uXRXLSzFaJaVuO6n/k3d145u5diPsAgKSTNTRKw','0');
INSERT INTO `cn_log` VALUES('545','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561803','6fbewz7OXd5A4ik32A2TuKnvNcGw9BdAeE+5PpALuSvIoKxbowvAQBZX/6mEEaFwSD/cAbQtBJXu3bVu2vLQ1XIR9y4ajyfQvg','0');
INSERT INTO `cn_log` VALUES('546','257','24','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561805','e8a5TK+TLq8TUKAOU/dV7ZfsxV0688ycFHEU9guFlKosiNsWukQmLZp/FH8MaWRm8wWwhJ34R6ZTdq1T3cUSpspPL9ocJ+CA32M','0');
INSERT INTO `cn_log` VALUES('547','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/','2018-01-10','1515561808','e933UXwiSPvAnbb/A1Tw97EkukpTiyS866RmH9rffIqm8QDCi85HsOY0X6B0Di5gUcDSkG12rlIZomzM+F70dYwmUUwaE/tbmw','0');
INSERT INTO `cn_log` VALUES('548','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/fwfl/','2018-01-10','1515561810','b6f2PKRTRinLtbnoBZ4thzcjNvWmUoMWpnngewLcjDtOpKgIH+9RB90elQBPIfnWf96JL2FkhRiv5qa+9pZ/SFhkRbYIk8l/xdw','0');
INSERT INTO `cn_log` VALUES('549','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561814','d959UkLeSz+vs2ID/EhmE7qZrc7rkAg3X7Gb+zzUgpuGnwMGHy3SagdigOjvL0V1xoi/xrx1XDqXvOCAxafwIReb5s5WmZInMA','0');
INSERT INTO `cn_log` VALUES('550','282','25','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561817','8966X9bQTFQk73oNyN7ddcTUIiBkViE+4FoAJGjVTDrPIKfWGwx3JQYR6cgF3Na4IK9n1z1vcEfTmN8zoOyLQFmD2CMbirXslBs','0');
INSERT INTO `cn_log` VALUES('551','282','23','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561818','f0a5TmG95wnet0Qxhi7iCcJIPj9JfynweJm/RgdTEdN6eidQt/oBrxTHcmx/zNJlvibENAU+TkCjcfcEsn4bV7B6luWMImgCqR0','0');
INSERT INTO `cn_log` VALUES('552','256','23','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561819','7f39xA1ZnrqVGFGY2Sb2lufHzZhgU9zN9K/88SQ+VocPLECXkSgEfGi7uqaUQTCCagZ5dWwCgH3A4othYyzKOGCMTENxjyPu+Bg','0');
INSERT INTO `cn_log` VALUES('553','281','0','4','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515561823','24956UwMLxmRsATQZtSVS3oBY/z95X48kfb5OvMKlbtWmORBAuJGjgIgCTBTdW+ANw/oKJvDNgbPh6mv1JktWde+E6vuW3DMUg','0');
INSERT INTO `cn_log` VALUES('554','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561825','52dc4PUhpfKrfuO2XQT6Vvdxow1EsIsz5HhBmRb70KlDFcfErKqk0kMYQKdzGK1s9PNYNpdsZ0EEueXypOM8rF4hwNSOy6lvwgA','0');
INSERT INTO `cn_log` VALUES('555','263','9','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-10','1515561826','b567tITE+y66TjmpQ/oVwcTpGu8TgMCV7P7hgJwc6uT87945Hr6G4LTkQjZFanbhtOOgYT9XGMEuWTB+93v/QFGvwqypjaT/Yg','0');
INSERT INTO `cn_log` VALUES('556','257','25','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561829','6a4a0wp6QuU2rDZcDbCsJ8L06Dspm8P5jOZo5LmhID3I8m9p36hBvz8AoUUhb6PP8YfsCKo1FpJT5veGb4hI/EwkJQaP7nRcW9o','0');
INSERT INTO `cn_log` VALUES('557','263','24','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561831','ccd0MAAeXOOuUpykD1yjp7WnaroR36kKUXhwsxuk1LidiqhanBvsmUN0HrDySC18uAzztpty+6C4ju/y8tag2z22RYPMlPQDi8E','0');
INSERT INTO `cn_log` VALUES('558','257','24','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561831','d488a11yPqgL3DsuyMN5JGdqz7GG6EXjg1+PjR50jf4wKx9dIeU/Js6YlNZWX5DMfA3cYt1D6/sLZDSnGogtLm7vwhYf6fyrXIY','0');
INSERT INTO `cn_log` VALUES('559','256','23','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561834','4ec8qar7wQuMekr75Scl6Mij29IfbeiwWGuZzTL3nFWmbcLdfvQSrX5osCMcnrQN+hPOSGH8XnFBDA25ZcUcPM0cl+a9Ssuszfg','0');
INSERT INTO `cn_log` VALUES('560','282','23','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561835','5fe6k24fXrRfMvDYZRH6tfzn+a3UXyYmpCNkUA9JkXvqVMtWoSjBZqezXHTdazKQ8Ra502fAL2NV3xG9jCjL6W1I1lduq90yrrQ','0');
INSERT INTO `cn_log` VALUES('561','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/fwfl/','2018-01-10','1515561839','9066osZy+f4IaRAYAnPlADFSa05Qm2hcIDgvkUtFkD3L180GEygaksExp/cJ9tBF3AAeId7DupYWCuyXmJ/We3nZiBS5glEZPQk','0');
INSERT INTO `cn_log` VALUES('562','263','25','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561840','8332IRXbXUjJwpT2UAVSQhDBtVLeIxyUBO3cRZdOe8HzmBjyVjxyczlaNRr7Y82gYcnd2UasvQkmIk3lsua+CtwLG/zuug0d00o','0');
INSERT INTO `cn_log` VALUES('563','282','0','4','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515561841','50400YaUxEndI4HNwvTg3v/vbCeq7M7nqD0ZKDTm8ehm2QqodEEpA7nbfm2VLNHw4yt4cMTTvFOobwj6KFUu5FHee/hbOep0Dg','0');
INSERT INTO `cn_log` VALUES('564','263','23','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561845','5db2AXcAg+keI81Dc7DwH8hvpzyvd9sTjSSlGclyOicFwiy3Y/qi7o1Tb6mBd+DRAMztnJNulb/wo3yegS0f4NBtgYVudjS1UBo','0');
INSERT INTO `cn_log` VALUES('565','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561845','cb91DKBTxIXoBXqsVVCZPCkdQNjon0KxJ0FltsB2FSe+Iyh1Sp/K3SjHo75CQIL6zWnKCy4ldYt/WZDi/k43IQnsPVIWjHniQRc','0');
INSERT INTO `cn_log` VALUES('566','257','23','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561848','5422T4pfUx+ljb1Ch0Jg2+1k1irKkKiR2zrlHm8dXi354b2Ze0BAfrOGqCU82yaS1gtNiKOKL1W+InmmwxWJX6ARM2KiLQnISfY','0');
INSERT INTO `cn_log` VALUES('567','257','23','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561849','7dbaP6SDfzNEXFy0YGjCJCEtKm6CWYC6VdqrS6ge3kA789/HGHpAk/TXNRF6bc98xKEeCPj1OO+4T1v+EkUfZzogzIiubaY0aX0','0');
INSERT INTO `cn_log` VALUES('568','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561849','4945Pt5Uasqpw8hGV8wO2gqJcwJ7cjbpNhoOGUKJNMGu3MXSjxVZTzCSl6EtdOhe+IEU0HK1S0lvl59XAbVj7eiK0nABaYiCrg','0');
INSERT INTO `cn_log` VALUES('569','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/user/jf','http://mls.keqxz.com/','2018-01-10','1515561851','0708o5A0VCZo1EmZweds39MqBeUCHejVOMAafyL2T5Z14v/4Ih3URXiWg0V/MPUWJaZoZ1gwCboNRhdoq6QP5mQ78DQ49gNUiQ','0');
INSERT INTO `cn_log` VALUES('570','257','13','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515561853','5a566PFqAAHe4VtaJHRW6Cw6NbFpIRlnsy84pjrXa2+0GTJeTjsgYLGDM0fvwdgLtewuEWYcNKHx6DTP9exNDDWmLs2dAOkDUrA','0');
INSERT INTO `cn_log` VALUES('571','263','24','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561855','cddaSGii3WhHk9Smo0MD65pXWfpC18zMZ5D4fawp2RI2tGBO6bifqlJjhYso0G3MgjYYf/NaOeN4snAX0BACZjQN9XxNl2q7F2g','0');
INSERT INTO `cn_log` VALUES('572','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561857','5089naE0oCODLB6yLDUaJULT+MHsseOZCoO+a4HdLgyLTYZwk4fzt7aGcpwQCiSA/mYZhkb8SOwu9DV0CQP5juv/er9wkmGcsw','0');
INSERT INTO `cn_log` VALUES('573','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561859','3f9ddVbTLf2lVgveU4AXkd82xIXtU2Aqb0KY1eqTbKEz3vxa9o30i6/8pmKgavoFLU/ff3pGbu+Sh2vTZooOBRVQ/KZgJ1RLpw','0');
INSERT INTO `cn_log` VALUES('574','263','0','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515561865','ea548TUxpRbItdMHQX7xPEi0YAEpLOW/a0FPetlZGe9vVdXC+Rnj/TmVulRJEExAjGvwAPFImX/pHht5P7a9G1BiyAeAE7fyAg','0');
INSERT INTO `cn_log` VALUES('575','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561869','6098FJsM7HtRr4r8yhV27abpr5WXtsKOVyy1HdZmjUe9WiusteilMld2M/EQgyRWi3bXhFyHjhYHcPQ7KrHuepseq0UalcjpuA','0');
INSERT INTO `cn_log` VALUES('576','281','9','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/mlyy/','2018-01-10','1515561872','dda2hbrd/GM55GSqhmrs8L/1iSi89jyIPloeCbkh82dvQ/tw6J/sltXcvaOa7jYqcjZZS8DTyNSPssDdSEQjuaqbJIgQhuCDrw','0');
INSERT INTO `cn_log` VALUES('577','281','25','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561875','4502hlgi7NczKACQ1ou6KIcO4PGTB2VZV/991KN8us9aETGihJfOTSTPO7aiSHJxmgbSRdRol7IeqWbfDix/6Jw5ekxHHYEFib4','0');
INSERT INTO `cn_log` VALUES('578','281','24','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561877','9846aauYYStIt6JO7G1AhVRtjeOCVft4U9Ve9KuvI/rKA3y8yY+IiBZCbTGYpAsOPMFIOb8uQ+GrehVFHhp3eS6tLa+UbTzSDFI','0');
INSERT INTO `cn_log` VALUES('579','281','23','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515561883','b713YWsUoBwQ5QlQDUKOz5tCAtyvQh+n5qtoN810Qe6pEzXRxhm3yzbeban8C0kyjPqY84dX3Pu5S468dD8SCMFNSApWMuNFaxg','0');
INSERT INTO `cn_log` VALUES('580','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-10','1515561884','083f+7+B3dOOpsua4HTQtgj4HZxep3aa4mPC1JzVwPB7BJhyQM7qFiTeLGTtnEzbOP+UiCTTAtNmRnr0RFztIAL5WqAmhl+dXg','0');
INSERT INTO `cn_log` VALUES('581','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561885','9871zn+gYKM+2igPXpYGnALfk8JOMntC+O0kCYUdK2hEtnYtUvcnE2r7zKIkjt330fLmPejd8TKX/cWaYMVBRlJWe+DSagwQJ78','0');
INSERT INTO `cn_log` VALUES('582','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561885','d6a8mqIM6SKM2BEYgVn3AGfqPH0NM9Dc08v0G1erCq5XnOdE9S1xItKDEbsT7FXVKWnxJABQdT0oTDhYiKZqKbImD5dPjB4gxQ','0');
INSERT INTO `cn_log` VALUES('583','281','19','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515561888','ef89fmT5q1JCzZo+0p/SJynzN977EJs8L+Ne4GPEktJjgKFZCwB6u4OIzwM7zJoejeJ+8EaOkfMtbm7U1LfFjBIlZLUn2X824+A','0');
INSERT INTO `cn_log` VALUES('584','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/fwfl/','2018-01-10','1515561889','1296wSdVikxx5cYShj03OtJ91Jz5py89sPvdCEuZRWg9+rsawImnap4OsubdXtolKzKN5nI+Vyv48ytOoDQni5Xkw/QX0enSPyc','0');
INSERT INTO `cn_log` VALUES('585','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515561891','b626/HyuM8DWuywz7OrhnAKab9Jq90YY1pkM+eQl4jqcNthe6Z5P8FPQLojV6kTdp31h04gcyostG1WsbXJ/7Jrguvdx63p5oA','0');
INSERT INTO `cn_log` VALUES('586','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-10','1515561894','9fdcg/jm64TcdDnaDRp2g+sCf5ArVpCWRWvQoks2M56sXkve42sweNuueQMvSd50gOgKctcrPhFBlFZb1ksiAs5IUp4CwvMtp+Q','0');
INSERT INTO `cn_log` VALUES('587','281','18','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-10','1515561896','6735XIJ2uGO/G88NPF+lBbeuVENhCL90bNWqb61+CBPYVlhNEAr+Y05ksiwEdJHAxE0hcmXEUZRJ6sXIoO+7qoM40B/PX3GXkvw','0');
INSERT INTO `cn_log` VALUES('588','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/','2018-01-10','1515561897','4dc83KKPaPVSJwsLUbxxB99Jq594Noli2rhfJrHZMG6kUuRUMLify8a59zym1M8UfG7nSWACPOMvLZNtoNOsXGcSXRI9ZnaU2A','0');
INSERT INTO `cn_log` VALUES('589','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/','2018-01-10','1515561898','5162zvmWsUbcyTh/5AzdydhyljDQEC9e49OaylY8DUQiffL8lnDqS11s/pUT/nabawdBwMJMp6dy2rOIIHGTxU1sywd3CE3oiw','0');
INSERT INTO `cn_log` VALUES('590','263','18','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-10','1515561898','e5b1MuNgnmQyCzMAfVXyS4tx3py6Ga31CIwZBUVagwAclBy6fslRhEPIHwj1B8MQalGTrjzqS4XmxGssxgrY3wDPqLVlQwgXoM8','0');
INSERT INTO `cn_log` VALUES('591','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/fwfl/?k=脱毛','2018-01-10','1515561907','8fbftcXuiZtouuILPOvy2C9xOdpssXa3HZELhhbsdRlL5ZCz700cDGtWFyaw/KY1ULOZCfAJThDo6m/G3Vf/XIGtp5IDDmJhBTA','0');
INSERT INTO `cn_log` VALUES('592','263','0','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515561916','5a11jk35taQmK6cG7w+IGd+nmQqpncdYWNnWdMQ7SHwwoDebRBTQsYmdiZ192IswOPl4cu4IonmiG6ntYkf6UTIa22Golue70A','0');
INSERT INTO `cn_log` VALUES('593','257','16','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515561924','959b5nz23MvQ6jA4Q4Diq/GzJMKBTENlx/v5XOAkul1NrmbOO8tNXNeebfdIWhnOq+WWxo9Ho1gldeOYNyKAAh2RBEleYUcHiTk','0');
INSERT INTO `cn_log` VALUES('594','257','0','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/','2018-01-10','1515561928','aae6TvSQuZEU6bqJIzDwufsLXafJfOH3XmF/v3W/n++qxqTu1L/80iGvYtUB2ES6oT1vmk6TVUF6KOYVNYgLsYurlxCBN/KkfA','0');
INSERT INTO `cn_log` VALUES('595','282','4','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlbd/','2018-01-10','1515561929','4e89z93rXW2b3c9lsh+bGUMktw2Xjuj8vpG6XulH1wXwgixwLh2/J0U908lptK+VgZM1R23gvNBrFlkcEg+Ni579LCPJeyB8Rw','0');
INSERT INTO `cn_log` VALUES('596','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/user/kaquan','http://mls.keqxz.com/','2018-01-10','1515561933','b4d85+ob8aK6sE+Yicj7PZ0fm0ghDsJLEJQ24F4pErdqW7Di9oJg8jD/IXv9W2vJH3Q1cVVCssCKqoZklpUKeeKKiV/tgqHdIw','0');
INSERT INTO `cn_log` VALUES('597','282','2','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlbd/','http://mls.keqxz.com/team/','2018-01-10','1515561937','d5f23o/AIIXg4n+hyLcExp3rl50+iL7vRx/kQybfg/z+J18Ea0o4mMpJeD6uX9lDhM3rCismY7osABWkyePVhmAEkPJxgcuoFg','0');
INSERT INTO `cn_log` VALUES('598','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561945','c2cfPS99YgzjtsQ59EhlQRsMZXVH0aG7xU0bg+owuz2qPKW8R5IIqaE4Oi6aNIeWv2hr6zF2bR59v/K+Chbzc+gIL7XSpZg7+Uw','0');
INSERT INTO `cn_log` VALUES('599','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515561945','0d8c2O+rkrwlq91tBRvrExIZXeR3vYP04NFmt9dFCxA4rZ2A7pBsCgo/BxdAZi6SmY3xwBnTSxSa3YVIc7A/Lj6XlwAT7l+klg','0');
INSERT INTO `cn_log` VALUES('600','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561949','7b5axk9xdK0qFS4vhzJwqrRylOLKae7nwzVazIQCp7o1uhDhnujl+uPW7e0LGHbWvb5NfVakwrT83XQs4gWBHQTECSzBWaqykw','0');
INSERT INTO `cn_log` VALUES('601','263','17','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561951','112bc7chfn2VikBCH9PsmJQ++B7GRcwZWwhAIXvwt3xcwFGkHQ7o4Yc3+Ij6vly81n/baouWbvIwqq7CWVXv51oVMBWv6NCYy+k','0');
INSERT INTO `cn_log` VALUES('602','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515561952','22d3bbULbmvVQdvdYIv9cgNntIlbJaEOoLFA0d6vLK7Ght7syh5SP22Ux68X95SpWQ4YgSmfiNgWtehpRVa1+LHktUVUaKc6CzY','0');
INSERT INTO `cn_log` VALUES('603','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561954','a4c0WMSeDkrOyEP5BjGxWYRmzVAg2oQmZgiSNb1AByYxRM8qz5MyU/TcUor7Xd6260uVefX+UXZvLXXMMU+iL7XQhMGSGAcM9i8','0');
INSERT INTO `cn_log` VALUES('604','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561958','973fpf7EwzhVl8mnCayACIM5EjFC74CmAdt4anikBpmKa1sEons/xy2dwcCN+HabMvtrEXJCGzfGvheR1qAPDUVE7p4x+yU7BQ','0');
INSERT INTO `cn_log` VALUES('605','256','25','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515561958','b64ag9iEAs0DVhhG1YZQ3yuxlmVRDPDndV64MgO9hNoMSdOG/O7+KoUk+sum7lT7jdb6UZ/iLCyhKBn6gfwuHu49C6TYlI8+ASw','0');
INSERT INTO `cn_log` VALUES('606','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561964','db84hywJv/QbnS5c11WHDbVtpk2Aytx9b8qO8TqhWKwl5gqPQSp9JrvyDl/6rFqKHaRiw2jY3AMC5f0Wlqb6wTZ65C32oGwBZA','0');
INSERT INTO `cn_log` VALUES('607','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561967','3cc3+XkLeAPrVivlFzITtLjmnoPBMvGKet0fGWKrw9MTEiC9VdLQzdxvDQmRUIDaVwtyNC06r+6AAxM3ATLso3pmbSOU6tKzkw','0');
INSERT INTO `cn_log` VALUES('608','263','9','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561968','7f43FNTU3BN4s9Lvrx4Zgm9KtUt1Sh5vexzfRGc3H7AgZRTHC/3I1+ylYNhBoFCw6Xj+Fh9MZoIoYAUCi3XI92FVe9HIYSqScQ','0');
INSERT INTO `cn_log` VALUES('609','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561968','8005mdbVAowtGUmoNW/DHFmw4Ef+4TNOHWckyaTR+Kzl3TORfc56eYN4MexM3C1J+Y0mRzi0PuKazxTZ/feZdkPqs7OqwLMQ/A','0');
INSERT INTO `cn_log` VALUES('610','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561971','13acaD9c4ezFSk6Ei/HLRj/zIC/upMiapW7qK4GUwOQ9sIRJOjLYxv/z7EL6u6ERP5dJFlqMEaoSrJ7CtVQXb+4lfa8VVc63tA','0');
INSERT INTO `cn_log` VALUES('611','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561974','89a5VP+a7eD+5eZCRQLNXETei6jj1E4zvsh4gB01kDhIU3kVfsY1X5CwrppqH3zwn5dFRXaHum9QaMnZnHZoZlW7Mc+CqeAtmA','0');
INSERT INTO `cn_log` VALUES('612','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561974','be289cCR7+loLwiiaESzO9K0ZJRS+Hz7w5r6r/faS8ogX5gi3qIGVCSd99jfmhCFThnD6xCcZ6tZwHb2TlCJ4PMt9DF3sXkPdA','0');
INSERT INTO `cn_log` VALUES('613','257','24','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515561978','5da4IZJmlvOTqe1iyRge1dYZAVIjR7Yts8rqc1uPqiBITKEPzICuP7RbQFquddU/Pf/oyIe/cCnnerEJBZK1t6LXe4/qoMqkOPE','0');
INSERT INTO `cn_log` VALUES('614','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561980','ffe2Z0FPJFlRpvDjlnOu/elkGRXG/XAHiB/CTludeFqLCyAoLQvZgrzwU6Ib0KA1kh0GH3f4YJBSaNHgWlWn5OPrN+k3hdancQ','0');
INSERT INTO `cn_log` VALUES('615','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561983','228bpK87v19s+yhWBv9moJHwn8+T2kCby2wqY2N+oOhhMdB1k8qkPtbCLPAvIiOotCMTEb29fgYTmUiqBe/vBDKcnSpVC5Ed+w','0');
INSERT INTO `cn_log` VALUES('616','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561985','a405H1c5MflmDFDmFeZKXFt/s9de3UfFqRVxRJkKFitBy6ZOIjo1u+KatlGAZoAuPBbTJ07bVEn9COf9tOZNCPDE1Vaqosd9RA','0');
INSERT INTO `cn_log` VALUES('617','281','17','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561985','5d9beGDAhV7Gb9XLQC9IafKJbNMroRtKxHEEU/qCH/J5RBWdUUab8bRpsMJz7UOb80YNoBk6t3hFcm5wt7/2YDtk7CldWFqG0i0','0');
INSERT INTO `cn_log` VALUES('618','282','17','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515561986','84d8qQ55R72OkXV1yKP3XeKKtRXrVdG2grvVZm/ELN6LaVinBW8dH+Qb57towK7vgNcXU7ekTd9fliNpxX0Sh6Jc7pKyoygcCjo','0');
INSERT INTO `cn_log` VALUES('619','257','0','4','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515561986','ce24lpjcYv1HS21fvGdaRqxLDUglp7ErJgJ7+d2/hg4YA25ExlsBt1DnmRryJPxht/mZexro6+vG9NIaeeYseB99CtUXRtH0lg','0');
INSERT INTO `cn_log` VALUES('620','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515561986','4fe0LYDIZKdQDA/Tgs58pkSlcCw6JDvip9k1ymgIOHafsXY9TJ/5KmYVoOM/FmxdPh1Ji4o3lHSUvK6V5QHovnipoHj7aMAS7A','0');
INSERT INTO `cn_log` VALUES('621','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-10','1515561988','f4c9aM+Me/Fq2xq7aNP9l/afAMnqJB44DQeQuAfP2rZAKghhE2wzVVDy2kfvWoh+7zYxvmZ5rdLVxbCxufZsh8PLpR5JCEBbvA','0');
INSERT INTO `cn_log` VALUES('622','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-10','1515562005','1616RLscPTq4zYiw71CMLhsCkGbKmPGP/AMvs84bj+MjLPnl1RqxVt38mMKzHU+kvWCFufpqpJ5nXm7OPu0xnhAZbSZJCJVlbg','0');
INSERT INTO `cn_log` VALUES('623','263','17','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515562015','7280TC+MHM6oPVVzfdBJbLmqk1nmIfRl8p3vbEiDzhhKuYBVMJi57YzC9WLwTUjVoXYJnLHM8ZaLagl/VIFWZRT+f1Ba67TOTQQ','0');
INSERT INTO `cn_log` VALUES('624','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515562016','8512nav39NixXAWiSDpDhbovZVQgkI/wh4z/mz45/hHedYK4e9oQhgvBG6rnO0AMCjIlFa8aXQ6Mqhkh/BrrlkUP0QklL4LglA','0');
INSERT INTO `cn_log` VALUES('625','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/fwfl/','2018-01-10','1515562020','def57bDEc1cBR2/PtT6WjAkQ4xaPlbmeNqIAptD08k1/F2Z72c/q0DLlxUHg1vHuccDrtrnhHOacvGrS/x0d6H6BXDTj/zz4biw','0');
INSERT INTO `cn_log` VALUES('626','282','0','4','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515562021','2bfcJGtAHPVBSYN/dTztd+KOTh+HAqlwdQMLZaavrYUodlojWe5dhrWu8MXp4vj10KH/6NC1kxOo7rwwUywHUGnqTynAuW+vdQ','0');
INSERT INTO `cn_log` VALUES('627','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562022','b2c7MWTIqfZQiV2GENjYB8zGXYfHdiuNHAydR9htIsdsAgcgJOJ718ju0FTt5ZnlvIgXVDIPS7Quxn22CaxkyVxsbK6YFgN8nQ','0');
INSERT INTO `cn_log` VALUES('628','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562025','c067n01W13/F1bLHxo01vn1t2wJrHbfiL2BXYB3XrJ/BRy4HSrJeWE+Wp1D4hxhkIVwZdUmvXdSkHoP5XH+gCkJeaUUBbHTL5WU','0');
INSERT INTO `cn_log` VALUES('629','282','24','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562026','fe30Un6JwPqZo9rl4NtAUv5SbVEBZNmA7ArchewCvTPHsYqXldHG+VWlpLp5nodhvTgv7BFgNFvxhXr9jf+IojR3Ix+u0tpLLJ4','0');
INSERT INTO `cn_log` VALUES('630','256','0','4','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515562027','2296iwmQ46UAd9pcdLwzIq938rVpO8Ngw5u5NY9mlgsTY+Vy1rqOSVsQE88P/A6Ytk8nJec7K3KREtjipO99/KlEmFYG1oWKVw','0');
INSERT INTO `cn_log` VALUES('631','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-10','1515562030','1aadkf/Vl2W+ObDXVsZ7e1S3H1uE090SW8SyNBOrij5RHTAHPLb/2F3UXGEcMm/ybSHekQsdJKT46B4ymq9fnhIS9HzKCSPUNg','0');
INSERT INTO `cn_log` VALUES('632','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/gdyql','http://mls.keqxz.com/','2018-01-10','1515562034','ee16x4k3bNdY50W52/6OwWYl7+4YyNnesZCPCRj1tJXGkGHsTiaIfE9TlD38EwTLd1arU/BHooGFg3Ot6KSBNlopx3PYTyoGeQ','0');
INSERT INTO `cn_log` VALUES('633','282','18','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-10','1515562035','7850j9h7+/spCBFe/JrkpkWUYFmngDBuTc91U+HSHkuvv81CKyd4WKyX/WwcZnX3aQkVvMYqK8dnJQhf92X9XYOk+9WjZmNjTbs','0');
INSERT INTO `cn_log` VALUES('634','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515562037','367dt+kSS3eDhfgJPInN029LRNk3OBeBnJJ6i1IkA8dsxtq130OD2C8RpAov5NqES9oMT6CjRzSXdJILsConF7Di5FMWXBlh8A','0');
INSERT INTO `cn_log` VALUES('635','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/?k=童颜魔法','http://mls.keqxz.com/fwfl/','2018-01-10','1515562038','43963S+Mfxqms4aqQjL0R+anPDdu1PcRSB/Tgyb9nScp22ktFvyf4AdnhT5jaYZlyn5oeLTKQdrNnXFJn5UECXAmIhW1S8Uo4ss','0');
INSERT INTO `cn_log` VALUES('636','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/wtjf/','http://mls.keqxz.com/fwfl/?k=童颜魔法','2018-01-10','1515562039','26e5YPJYMPmeqT6XqquUw/+R1JZ3o2Mj+VbFVZpIY3bwgI2ubiB7qpnTG6APS0FjoWbEHJwpSrsqc0b8vFGcXEEQpC7hhn1swO0','0');
INSERT INTO `cn_log` VALUES('637','282','19','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515562041','7c95r0EuSODA1NJi1KUru+fGUjhs/DLzAElAqGOm+w6Prdo+ooAjFy2db+3m0VfClCp14xbIEq9hULeyuoG8mlGh6Vo3MUvUDR0','0');
INSERT INTO `cn_log` VALUES('638','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/info','http://mls.keqxz.com/fwfl/','2018-01-10','1515562043','8f38WW80YFTb+IhpLm8Gh324A6xZDFR4A4XNtiV01LEMmcESWWmAflY1OpHhXEejY6MTB4GduE6a7JnUnFWqWJ1S9e1vScW7HUg','0');
INSERT INTO `cn_log` VALUES('639','257','24','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562044','246e2aeSpVoLarFxDjbAL7SEZzTxARyuxClSmiADouR4GfURkgKYi7/S5pbdp5x/Djg7HeIbR5Mp/rvqRR0km8vElNaeeLWRWq8','0');
INSERT INTO `cn_log` VALUES('640','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562045','7a054D4RCXJc7561RUpl3Q0EtR0bduyvW7HwDeBGnDV52OEURNgJ3McG760wmolYL7J9oDVLrOddapoNcnbgNZMO7/cDCSP7XA','0');
INSERT INTO `cn_log` VALUES('641','282','24','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562053','1088GX1yNdO65jCmNjVLmL2G/n4SZf26BicuGF8pNI1bufIbLHb5LGhI/qOIqHb7L+HU5LmrI0l6WWha+aem9x63mc4Y09FJyMs','0');
INSERT INTO `cn_log` VALUES('642','282','25','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515562054','345eR6JUWX9p/anBZ0TIzRuApOAg1tRubkFogBXxB7GEAFGErsCvUGADCK+3Rq9+4mscgYiDWkZXE4HyeoXbWJ9RqG3Gq0knnTU','0');
INSERT INTO `cn_log` VALUES('643','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-10','1515562055','f5f8dmOKXJGXJqCz4NtWxxNMWITtSMPXYEBibKu2Mt40pzfAF/F33Rg2PRuE9o+YGiRu/YGwLaaHR2omeEGs3I11pZT/crEgNw','0');
INSERT INTO `cn_log` VALUES('644','257','9','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562057','af6clqzrCjgLq7GBSH8ZisbLgTJeTiQjoTLWsxqtZljiBJO8LR/4hvbKny09uJp+pTDPdFpOdKzhcXj6VGBzpwtxQidsfCJm/g','0');
INSERT INTO `cn_log` VALUES('645','257','13','0','852d54326ee077622d51c314a7a49a70f6b2781f','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515562059','5ecbge8GtRE0Lex0KJ7fc6fYBa4VKER9McjYI+QdVEANH+Q752c4xKK9wDBHBTDdTz3bRKg2B2ANRCpWYZFcOVmT1v48D0W4+Zg','0');
INSERT INTO `cn_log` VALUES('646','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515562062','4dcbO2LVRb+9/7OhMyb/gaAOCezBTEi2vi+HkGquNTjJlN3VAVlUi63jgvc+0Y5FOat3Iq+fOB6OaCvrnrdXiT9iJf2KZg+x76w','0');
INSERT INTO `cn_log` VALUES('647','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/','2018-01-10','1515562064','52a2fyTqWUWQlTrHDBUcySMwJK9Q/9gnNrqbTolEs8nbtgJRo5RaFt6PkRzssY9rveCpOlwEO+fb3Yr7yDS3Ty1wsI5LNi9dcg','0');
INSERT INTO `cn_log` VALUES('648','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562076','304fVe48DXhf/O6zg5YbJMfMHRtKRO0gUhk+lOBqTVyeFihDl0GZ2hNZxQUaJrEmMcPILEIPQ3+T2geGDpLlbhjJ6qSMma6n9zY','0');
INSERT INTO `cn_log` VALUES('649','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562077','2ea55uW5AS/y/O146vF+HcXUDauw6gZ1i0dE5JTv882DLmfXhD9YkSDa7XTGutmat1vJY6JL/jLGxuv3phL5eU4CFsqhzDZkqg','0');
INSERT INTO `cn_log` VALUES('650','256','25','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515562077','0a68vmWK6xrrmGNSwiVSnDyHVSS5bH9+SRbBdKoVLJBGHOwPz/ZGW5CEwvyRKjhzggt7EogtPqZ8iT7rWhspnzS5lp8eW5ZU3Kg','0');
INSERT INTO `cn_log` VALUES('651','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562078','bdcbfiIlzSrY0ugArB5f+QGbxiZIt2eBAFRRGHTTZ3JWKfNap9h/MgjyomKSxEKCCoBgj0hIY+qtmgK9zHixPEmD3Iuu683YYuw','0');
INSERT INTO `cn_log` VALUES('652','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562079','2e24kUc1ug391kwJE8Gi2bH7zza34sxRvdl+iJSxnLrWVvelujc+fQFJHCDaOxVDwHn/4FN9fceTwmVbZV0VC4xxXfxBVVnqEQ','0');
INSERT INTO `cn_log` VALUES('653','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515562080','334cSXiAdby42Mh0PmvTQERVwLHPsuJ3G3ZKt6pW6ZTclDkoi4qI9tr6WypzFidV8LghRpebXGYmB2aVGZ/RQiedl99SZSXuqA','0');
INSERT INTO `cn_log` VALUES('654','263','13','0','10402e3df5a0a952d7b77a299727d7efa35d093a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/','2018-01-10','1515562101','c040Cf4BvX8lkk7/65ARziGLIkFXQluglbu+nXjyl7McfHFfkNoyZn9y8FjUUIvGwkZ2/GeDw4YpPz3AMZ1hwxqVf4u6au+xE0Q','0');
INSERT INTO `cn_log` VALUES('655','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562107','56a4K0tnqamd1ueMuJiMXVRzi9qrcWw2zaSqy/RsHDBtnwqvsDgmXmTgHCuMEEqHeZmTGXd+tBtgbxOXKEPZs0PEX1KZsISKyQ','0');
INSERT INTO `cn_log` VALUES('656','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/gdyql/','http://mls.keqxz.com/','2018-01-10','1515562114','8eb29J5G47s/hZo92oXSFUKRETFFmAfPVF63rIrwZ4yWzLM9UVD+VeRJF6zO3rUciLf8r/56sLqCiCsMCS8t+zObt2WDSenJ4w','0');
INSERT INTO `cn_log` VALUES('657','281','18','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/gdyql/','2018-01-10','1515562144','7833eAcz9RTyU/KCiKMWdBtVpdHjwsmMk/fTf/7yUOBU15p2ecPDoW/Y3/pVTiuhiEf3sfVAd96Zm7NFe3SXV+PnCsaHuIAjECI','0');
INSERT INTO `cn_log` VALUES('658','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-10','1515562145','f8f2X4EiYaQUQpBeNZA9ym+vpPeXovGKZc/qZnAhP6rMXXZPIs8Smp2PUp90ov2vdCd+vbUJ4puDmRI0J5VXI5BwqqRPwso0WJU','0');
INSERT INTO `cn_log` VALUES('659','281','19','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515562148','1529Zf3FbQvegVng6qYu0vXLNl6DL9JKHYoFx2K8tDbIl4y1EdbIf5t2v+JUQIPSn+bCQURbDEpFZpZ1n6fVfV/4do9DCYn1d+c','0');
INSERT INTO `cn_log` VALUES('660','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/wtjf/','http://mls.keqxz.com/','2018-01-10','1515562153','ea4bYpq7QW98Ck+FLZ76Hrvv3IjEj7fU5lHIApzkDtLH+fSMr+bou/IN46+sndG3n/MkFcln/NUYC3CRn0JTy+tB6qAX9mPiwQ','0');
INSERT INTO `cn_log` VALUES('661','281','19','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/wtjf/','2018-01-10','1515562170','1780BN1aqTVovADABMqNIghqTBEdd+zHxO59NKi0BIUaHFAy49lT0iSsBLjKzJG6rkWnqWtvyKdPpAopinJjgXF6AdI3uCz3FsU','0');
INSERT INTO `cn_log` VALUES('662','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/wtjf/','http://mls.keqxz.com/','2018-01-10','1515562172','e4c4ILAUvn8kJ+MtMh2BPmAX4VReIODQneZowHdbEu5PZ8eBPvj6DaT9LUtZvBEsCACi9zG8y4qpxiZMfYcogTqntqamrGuz/w','0');
INSERT INTO `cn_log` VALUES('663','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/yyservice/','http://mls.keqxz.com/fwfl/','2018-01-10','1515562174','4ad8s03cHMdOLoze3ElgT9aJZhj/0+F4EViJuSDl5CCL4+mXWTxZ/THMz3YQL+HPhwVKFMwQk8Q37f6A0y4OYZVDqDyeiI/rzQQ','0');
INSERT INTO `cn_log` VALUES('664','281','23','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/yyservice/','2018-01-10','1515562175','38f3j3MlU3AY0m6bGPFAVMsHGIQ597PsekGt6oYVucy5v1dvaf+nuTtADC8J4cCS1p7ENfTM/K2J71cgaVpz9KI9ojhJaEpxPLE','0');
INSERT INTO `cn_log` VALUES('665','281','24','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/list-25/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562175','442f3isxKy6/8AnIg2PAEjW2NUVSXG/jOey6BHXNTAZgA7/H4NfplYKmzUzgYHDrYU1sKAyerTUYXTQxE355ygaeeH5SdspH5PQ','0');
INSERT INTO `cn_log` VALUES('666','281','25','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/mlyy/list-25/','2018-01-10','1515562177','6bf2/YWw8TXg1xmSynMuLWwAEnL5p0Lf/IPK7SYvyJK1AAxHpgekPtlRSDf0MZB1DkRfqq48iPXkAb778a0CYgC8Wh3zHEBbr2o','0');
INSERT INTO `cn_log` VALUES('667','281','9','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/team/4.html','http://mls.keqxz.com/mlyy/','2018-01-10','1515562178','1be2ced1bi0Q4p35g/YG/o/D458MBLtYr4hr5PIAUNv6A2bTBdfO7aV4cqO4Mlr+Qx/jiqUUbWUf8+A52wcat65b3jW2qbW87w','0');
INSERT INTO `cn_log` VALUES('668','281','0','4','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515562179','c6e1i5LJqmTP4SaoD5T4Vh4E6UeW7bvJFivDsLovk5r97R8OwnKIvIF4etn7pmHBfhSamFur/45oLroTulM3FFjEGUDYsa8ulQ','0');
INSERT INTO `cn_log` VALUES('669','281','24','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562180','b73blnMZp7av/3ASv/qh+ehqM33f8UMfB6+wQojXN+94R8NdrNmw9tAe3ZKftDIQXj25jNrPuAmaA/wzSgCSexsio60jXVBPK3Q','0');
INSERT INTO `cn_log` VALUES('670','281','9','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562182','d135pkZ0UXURESKXhFXZ0vQUszXw2Sy4hqr81E2+eZIDH2zdMoEFnRN3JduHXkGefiI2yHKQRQep17OtqEstQjPjDvP7s8FTzw','0');
INSERT INTO `cn_log` VALUES('671','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/fwfl/','2018-01-10','1515562183','f313fI3/GWDZtCLr/p74AzH3t782RSYsKUeo/sl/41zi4Wem/T5BSU96mIyNrInJ+ugOfFTN8987zofVCuhmLx2Hptts/e3XH0I','0');
INSERT INTO `cn_log` VALUES('672','281','17','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mbjchl/','2018-01-10','1515562186','4a7524CybTGpL4eecO6VAfa86yeydPFn5F01ozvItU6+TSgFwYnn2i2phrnPn+NTY6tGRQ/zZE7VOlw3Qs4PqH1ITBPaI/o6QXo','0');
INSERT INTO `cn_log` VALUES('673','281','13','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=061AV1PU1mNFQV0M7uQU13oaPU1AV1PI','http://mls.keqxz.com/fwfl/','2018-01-10','1515562188','6bcdWvnuEDZqEb/IRdSz9DGRRD8FAlss7iVW/jgq1ETU7mBCICrafHc4Gv8F01uqoJvV6Uys2CJHYbkVmWuxFD+9bhgjIH0KfZU','0');
INSERT INTO `cn_log` VALUES('674','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515562194','efb7A4pf+t1pLd8p+pRh0pQgebKRfCFPfmFJq/Hpk3Ek6KL/v8/2LYqpfgE5CGsrlT/PzLsDgY7L30HWddWeYx5Axzx+FbnJVA','0');
INSERT INTO `cn_log` VALUES('675','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562212','0254bEusdqCZ4F0WJAR/AbLIQiXrgR84NNryOXth0mQqXizwGb3mQz5W9G3FUlHqDd2HQaSuHrpHY0xc2ECBG5FJWrnaLAkAdQ','0');
INSERT INTO `cn_log` VALUES('676','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562224','868egIP5yZF6SIneqoJ+5DPbHbLvSzfST/VSaw4Yw7OWjGldG9sKqMxvwvZ6nn6BBHWbNe8t9JsvlYl1Uj7sBZX/AFiTYOYFLA','0');
INSERT INTO `cn_log` VALUES('677','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-10','1515562256','4c3eX7U83XIJr+YQFTUdw5MUJkanN+pUY8Uh8PCBZ+CNdFD2GHtIHSM0uu2kkrOigJbXHrYOcGjx38XuGNpnclb8/qFo9PIPJw','0');
INSERT INTO `cn_log` VALUES('678','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562257','5b7aSzTNcwDEX4rM4u0q3uHphwtCsLNIXYd3csE8TjkZXHXew8trTJkpd1WwiiwWBRyA6mWquuZVhqKlLi30kKTdQ2GnVs5muWQ','0');
INSERT INTO `cn_log` VALUES('679','256','0','4','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-10','1515562259','a1dciEg0Zm9tSDXFBJND18V4mx4NKyq6sweCwTUIikHGQEiXokRj77+WsCRo4ghSfeCT5Dh6NvWv2gHLHyNsWlBCadXIFQV2UQ','0');
INSERT INTO `cn_log` VALUES('680','256','24','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-10','1515562282','f403GiRqLH2L8fLPjRYsASS/8+mgkO0SxojWJGS68MHykwhqQvqMA7kjw5XX1+jh2A+w3L1CaCoPE4JRugz+NiddgXOZ55hvrhg','0');
INSERT INTO `cn_log` VALUES('681','256','9','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/mlyy/','2018-01-10','1515562286','dde1IcGlnsmHxYjcGBXdPqc7ngCA8/1dS/6lgMRHAbycahNR/c3UeDrRx+n6hP5pcPLqHXaDoxN0FZ6Zo14e/zbXoJHnuun3Jg','0');
INSERT INTO `cn_log` VALUES('682','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline#no','2018-01-10','1515562309','3239WnHTw+M8PvGPLuYZVXxJYM2IvchsIZAKo1JzDeS6mo/u+zKFCMeNHeZMVMiHxL54fzPIaO0e1k/O26B1sDyeGRiJ0vcwbQ','0');
INSERT INTO `cn_log` VALUES('683','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562315','47e3IR1xlTtJ4gw4dsznlvMD1euY9d105QGFf2h4Iexuy/H0ueWsqc3LPjeNCxzSzzW2Ux/GjtaxNaWOtg45kAQc0knwgPn4mQ','0');
INSERT INTO `cn_log` VALUES('684','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-10','1515562324','37fdq4378fDNUKohCxuWqkQRXHVEryD6amzcZZqbvFdLWpd3sVulOLeR/Mek3vxlMrOwWyZErC7FQJUNXYQ4/IeKb/ZKygxeuL4','0');
INSERT INTO `cn_log` VALUES('685','256','0','0','1dad34400a0fc4827a4281627755654279dc180f','118.116.89.102','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562350','fe70jtwcrdWRlliyEElrXCoUr0gC6JDNIaIu6zlCfUjFI38P+H7HwOrem9uhnQaxoyOylOq/lMput5FypoAtSiboaBpD78tAsw','0');
INSERT INTO `cn_log` VALUES('686','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/kaquan','http://mls.keqxz.com/','2018-01-10','1515562356','72d9S37OcElXp/Ui74IJi5p05wmz0OKArdNRSPs0bAYecUz9htYQVxew4azAA0WnrllsCCooACF1ehtOxlEcoibwXLfaPlOTvw','0');
INSERT INTO `cn_log` VALUES('687','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-10','1515562365','0f686VMvIK39WSfExyBYIMUkvsCM/oSUB+M9L8ThM/GX8FrS7Q1U00UgLnrlwaHrhfe30Cg4mHv153pFn+4/LqZ6w9GPoN4hb3I','0');
INSERT INTO `cn_log` VALUES('688','282','13','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/fwfl/','2018-01-10','1515562386','832cmb+wUiQzK4AZK3vnacL/8h8RaMU3xRU4IuiYeUf4Jv0Q4YVINxpCErEoZuzuQbZkmRBByK1iF0O/KOe1VTUuIjilZYLOeY4','0');
INSERT INTO `cn_log` VALUES('689','282','9','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515562387','7820iicBLv1RAgLE0Ci1fK8SCPQ0RO4KhSE7W31DZjDgvATWA1zJYjomoLzLxUwR5s0H3XZLEeiHgV47IKNL/+6PcVookYC62g','0');
INSERT INTO `cn_log` VALUES('690','282','0','0','798645b464a1bf65e2063014064e72592c298aac','118.116.89.102','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/','2018-01-10','1515562395','7a8ej4GQI4ydI1A6QGGJ1rWnKdhrkxZS9ex3nZRqlb/aYwcZYQLl4NpknuGm47LqInN/WV2Ab/IqEzhBAEPcG5gjPwPZMfBV+A','0');
INSERT INTO `cn_log` VALUES('691','300','0','0','92ea2289eb4f8610cbd0a122fa83b67e23189d80','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=001qcJH92YFj2S0keiK92DVVH92qcJHZ','http://mls.keqxz.com/?from=timeline','2018-01-10','1515562605','68ccjmslGkcyEzpsdbLi+Nn1llv2VI7TFeDCOStkF96NAP+cxychCdaHp6I30naWbOP6A5KwCqKkp7xEPMcXrDEST9aG6IxMAQ','0');
INSERT INTO `cn_log` VALUES('692','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','','http://mls.keqxz.com/?wrnd=qm','2018-01-10','1515564435','3fc9Uga2f4A7cyjbF9Br3HO40VdjE/puTSXI7fCPkPSOkXZAhWCxw+rRBO/sVSXjnHvYxRHIBvz5P71sB0CF8coMUTdJD7d3vg','0');
INSERT INTO `cn_log` VALUES('693','236','13','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/fwfl/','2018-01-10','1515564438','a318Jhi9zILTmnoR/dKDyPPdrOearDxiWzHwXFlKFfFQJWvEuH69e09dPA9M+CaLBlEvyTZfJ6RRrQ4PDzGdM9o2x5U8pkD3X5Y','0');
INSERT INTO `cn_log` VALUES('694','236','16','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-10','1515564440','13cfyUFlbWw5JYd40KefDLDV0/86wkP9kAFPwTEnZzvNdFkqAV5EwhLukCcvLDSpxR9hlOAH6vqSOV/zqdGooPZ55gXYK9XZSuk','0');
INSERT INTO `cn_log` VALUES('695','236','0','10','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-10','1515564442','02bdW7Y2sEjVb6B5XmxwZX4EGPdQnsbDJ0aywpMgCUlw4KYHPW5jhffa8eYA57a1M/0TQlUnJLTnVvyOFOR0Swix7FaC+bRbXho','0');
INSERT INTO `cn_log` VALUES('696','305','0','0','ee5c18850a6ccc95c9b45d718de7226e81914202','117.174.94.25','http://mls.keqxz.com/whome/user/get_winfo?code=081MoV6R1cZgM91Jmo9R1Gc67R1MoV60','http://mls.keqxz.com/?from=timeline','2018-01-10','1515570409','67215DSMD5hM4CVZ0EtxVFl3V1cH7Y5I2mfa9fHxxIhzWT9Pyk0VlSCAsnif/NRpSDNip+ZI7/RCLNvlJU8r+W7cSZ5gbK6dpQ','0');
INSERT INTO `cn_log` VALUES('697','305','17','0','ee5c18850a6ccc95c9b45d718de7226e81914202','117.174.94.25','http://mls.keqxz.com/?from=timeline','http://mls.keqxz.com/mbjchl/','2018-01-10','1515570443','316cu1jEs7f/qYD3FSbosUh2NeQKOGycOEG4TXV2F0eXnh+63uybwTUcB1Xx7/kcYS+IGsFXRQ5mgCleKMNiuJxUK+Xga6WmzW0','0');
INSERT INTO `cn_log` VALUES('698','305','0','0','ee5c18850a6ccc95c9b45d718de7226e81914202','117.174.94.25','http://mls.keqxz.com/mbjchl/','http://mls.keqxz.com/','2018-01-10','1515570447','386354MRZmIQ98HmdUcwJVoZioeNyu/IBWWtMLyKVEEGZ3RZGdgixeLqdNQQwNh+hIbJ6u2s4KBYmre9yVgszHdkmsBr4Q5Fvw','0');
INSERT INTO `cn_log` VALUES('699','305','17','0','ee5c18850a6ccc95c9b45d718de7226e81914202','117.174.94.25','http://mls.keqxz.com/?from=timeline','http://mls.keqxz.com/mbjchl/','2018-01-10','1515570454','48ebpSwYEsPd96Z1EbadrtsUAD/g4qn9b9usefG5/Nh/MzkIr/FcVS5fodaW5cXGZF91QvhLQ4lHBWcvDmlM23q4TfA177kp+HA','0');
INSERT INTO `cn_log` VALUES('700','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=011TdRH005vk5F1jCfH00yCQH00TdRHu','http://mls.keqxz.com/','2018-01-10','1515573192','4c36K5yomvAv5H64o+hFBNm/ybfm7l0TnyFCvezP3cpCasr9cpPD26pU8i61PhftgyXZwYoBn8+5Da+Iemj7uaRfQ8rK/EyMyg','0');
INSERT INTO `cn_log` VALUES('701','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/whome/user/get_winfo?code=011TdRH005vk5F1jCfH00yCQH00TdRHu','http://mls.keqxz.com/','2018-01-10','1515573207','5058f5bmVtTyV8fYbI5U5yq0cQwKuMPSVu3LBBV0hI+Tsp/Ov3+Ljg2Z+Twzb2yGkxbhGOMoJ5DTjuRve/31abP7nRhYab6Cyw','0');
INSERT INTO `cn_log` VALUES('702','281','9','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/mlyy/','2018-01-10','1515573213','d101DK2kT7Z2SPEX2CjJgxa8KgCEwd6wyT5WPWx9SzGEHvuSn79g7i6spdl46wRjE7Rbb1C7OuSRhl3dKVs9IKYt+UDZHkn5eA','0');
INSERT INTO `cn_log` VALUES('703','281','0','0','3b0867850fa7306f4713c00b0543633a73fbfb1a','118.116.89.102','','http://mls.keqxz.com/','2018-01-10','1515573223','932b4Q06P9wi5A8dAC5uLpZEAT9ZZxsnDY5hznFBVw5KTzWIjqocm3oGGmjBnk0/UX8KcG6oz0+wVLbK8/tjxxa4tw+36inEiw','0');
INSERT INTO `cn_log` VALUES('704','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','','http://mls.keqxz.com/','2018-01-10','1515576440','22f1hEzHxkaRBWEC4+GsKCGapgjyCJbGpqlQBvyb3Rla70caxR/5696kpFCPC3H1w5ruRzDdfQ6Hd0BUTrrFrYuAOq5T3LtLqA','0');
INSERT INTO `cn_log` VALUES('705','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/admin/Yuyue/view.qm?id=3','http://mls.keqxz.com/?V=7','2018-01-10','1515576756','ad86jWLG59wl2ixt7XOks5gHiihi0dXFYqGf0aEIkpyMbI4iN0ciorxJLkJtZLvpMT/1fs9jL9M5rq36QLHlRpg1GeV35dfz3w','0');
INSERT INTO `cn_log` VALUES('706','236','0','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','','http://mls.keqxz.com/?wrnd=qm','2018-01-10','1515576772','ae28KZBffm+OcZWPPv3N4itDmoQMntBVEb3NS/GCZ81V5jgFBGen2LB21tPTZAYfbi4faw+mzAjoSVln/1f9xS0sk1UFHyaCuw','0');
INSERT INTO `cn_log` VALUES('707','236','8','0','ccf0d37c3aebe3790edbafa809e7a2ce0bf23c0e','110.184.221.139','http://mls.keqxz.com/?wrnd=qm','http://mls.keqxz.com/contact/','2018-01-10','1515576777','0e29TGYOWhrmQw8Hp49vgwA3Yy44+XoIy95xYZvXx7UbHsmoAMNMa5UVPPFI2TT0eJU9xYLTl8FyUekB1FflwR4B1rNsH7pIRg','0');
INSERT INTO `cn_log` VALUES('708','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','','http://mls.keqxz.com/?from=timeline','2018-01-10','1515577299','acce8s4nXHRDR6FunYE5MHoRVxQwHBg81Empx6VkBnK6N1jswqqVNe1t1R98faw0u4cn+wm6aFlyy3F+VlN+gF5yJk/H+nuIaA','0');
INSERT INTO `cn_log` VALUES('709','262','9','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/user/buy','http://mls.keqxz.com/mlyy/','2018-01-10','1515577311','08dbk6SBfzgvorrUEAfbR2VTy0RKEJs23MM2fyMF2aiMcADQ3cYiaBjPBhHxS9m1ZA7JDh63TalO0FA6pfL4djH3g3XBSnT2RA','0');
INSERT INTO `cn_log` VALUES('710','262','13','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/fwfl/','2018-01-10','1515577314','22e949CoS9i37/eQlP6RrU1/R4k/El5CFKKYl80EZnJK8y0nx214ita/0pvoIhXQ7EK1dghn9rO2SQ1lMMBp0gZ7VRVnnefQ1Dk','0');
INSERT INTO `cn_log` VALUES('711','262','9','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/mlyy/','2018-01-10','1515577317','ed16iGJr+TrGVFuMMTOW9zkSzbeqTce++qnwMHilyoXjA5OdHhVkURTSroKYvwPr0HwNMQFjCOR23WD8yy/CmVr9ZSUP8FA2Yg','0');
INSERT INTO `cn_log` VALUES('712','262','0','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/','2018-01-10','1515577328','f5aaNbY9PErqOftJ4RGCUChWvFhPPKFPhbOC4yEdYS4eX9FfiAVJhIyoZsdZmbHNXxjkxOgwkDaAfnUiZqpUSNsRG0PLCIBdIQ','0');
INSERT INTO `cn_log` VALUES('713','262','18','0','0b6a51f54fcc5b49cd3dbdc0c828d82a8f236a7f','171.210.224.79','http://mls.keqxz.com/','http://mls.keqxz.com/gdyql','2018-01-10','1515577330','89daEZHIIaMGkX+KNFdZHZr+PP6hVsUlSsr1/XN9w6zdYDnmkDIhvwo6524dAT5SJQ0DvwNJ98WKcinnKWcdt1oY5mIlt8NnuIA','0');
INSERT INTO `cn_log` VALUES('714','309','0','0','5786636db7a31f9bf862588453b106399a506e4d','123.151.148.54','','http://mls.keqxz.com/','2018-01-10','1515577849','4c61d+LPWFpP+6UtvVwv9f7DjJozzif5ij6OAW7oXyvEP2jIdYAE8t31HieYttV9+Yg/Eu+lbaHN+p2JIf0RRJv3CwoiGZrWrg','0');
INSERT INTO `cn_log` VALUES('715','312','0','0','5969a41dff354fdeb825bfe3d0e9582f9a0e8a08','123.151.148.57','http://mls.keqxz.com/whome/user/get_winfo?code=0710IHCQ0h6oL72NA8DQ0YuRCQ00IHCS','http://mls.keqxz.com/','2018-01-10','1515577852','152185floVPLREMbJgJFoGL/uHgmIQGBedtmgLuhFY7P1FQo99hJtBW1flXlbIS78SC4nK9jqBmxWCWuM+j2ZKmt8U6Mv3woJA','0');
INSERT INTO `cn_log` VALUES('716','308','0','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','','http://mls.keqxz.com/','2018-01-10','1515577854','bc39GPljREgC5y/ZNyo4Q//axmBZw3uAycKdm3559F7a1t69eub9pqkvs0R++kj+dsBeW8p+T+Anl3jC+gO612nE4ZlCSbVJgA','0');
INSERT INTO `cn_log` VALUES('717','308','2','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','http://mls.keqxz.com/','http://mls.keqxz.com/team/','2018-01-10','1515577862','c22cxmLhjU2jeIQ2TqfdGY5MwaMqqYD1HWAnwArZtf4XU3m15Y/a5hGhKAA+OEk2SP76s86S+vtvzmXVpBsZQX+6+fG1w6ZlyA','0');
INSERT INTO `cn_log` VALUES('718','308','1','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','http://mls.keqxz.com/team/','http://mls.keqxz.com/about/','2018-01-10','1515577871','0641jZ/eJDv5hVM1/Uusc0P4pdI92ZV+devHeVtom1/95+G4GixPAQyCxLPAiwuSg9p1m0Vsy0StUiTEOic4PFs+2gp1XZyhZA','0');
INSERT INTO `cn_log` VALUES('719','308','2','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','http://mls.keqxz.com/','http://mls.keqxz.com/team/','2018-01-10','1515577882','6f5esz0GNsi80eOqc8wYMufTZhTZNaP6mbaQvmJe05CniKtXerHEdgeiwkuBgdgqNtNHSMYR7bRgB+cWCs+C2rwhOZofqipI1g','0');
INSERT INTO `cn_log` VALUES('720','308','0','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','','http://mls.keqxz.com/','2018-01-10','1515577896','dd9dFT5pXd/avIT/vO6qGFV0qA1VB8VQPW3AL4J/ZMZYxwxJAHJ3d9JlA4GVKYyYwAyg42HT/HsQ1ak7AkERlxxaamhCTMOB4g','0');
INSERT INTO `cn_log` VALUES('721','308','0','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','171.210.229.158','','http://mls.keqxz.com/','2018-01-10','1515577899','870aTB13ZqhSz1Z4UlWJnhW+8+CSRN+zkNV046gkKODEBCroqIG8VifYw8bUk+6tdSrPdqLVBUN0YChWoPT+ZWdRRhhJAYrVUQ','0');
INSERT INTO `cn_log` VALUES('722','308','13','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','45.115.218.138','http://mls.keqxz.com/whome/user/get_winfo?code=071ltZHw1WJ8va0W9DFw1uPeIw1ltZHp','http://mls.keqxz.com/fwfl/','2018-01-10','1515585416','cd25uPBm4EL4Zd1goO/YHWVQRc9e5noPpS/E6+48nVxClZ4QqiYUYtpW6RpBVVu1ShFFlclFNtViGCIokVfUsDu9KlYlwOL59j8','0');
INSERT INTO `cn_log` VALUES('723','308','13','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','45.115.218.138','','http://mls.keqxz.com/fwfl/','2018-01-10','1515585417','3d81oHGU8ww32RpxJiDZv4xYwZLI4YXZhtyAbeT4q5tMVh4assQuxy7g2wc9UzIQH5auWNlblH8ELnNvNogy0hH6gtJUBaSVTs8','0');
INSERT INTO `cn_log` VALUES('724','308','13','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','45.115.218.138','','http://mls.keqxz.com/fwfl/','2018-01-10','1515585425','3d9ececNLfprrs95ol8EGZ+fJxhNKAv3XkeYK44GCos/Uis7oSG9YLAlijqIDiWw9bVS8LGjkS0mZzEgEvzndjolQnHUsMh/PVs','0');
INSERT INTO `cn_log` VALUES('725','308','13','0','e5aa2fb8f1bc5ce7f18a8a0bae89fbe08af4b99e','45.115.218.138','','http://mls.keqxz.com/fwfl/','2018-01-10','1515585426','650caHamvuCpGBUW89n6Eus9OIfSf1uPSR/QI22m2ae4VvRu66zzavLju+7CN2DNhTxiNLXoJemHHOGjneLSAfj1FNqSKqQhj24','0');
INSERT INTO `cn_log` VALUES('726','317','0','0','90947f800a7dd522fd7fa3e3d4cdf2d056e68b79','118.116.89.102','','http://mls.keqxz.com/','2018-01-11','1515639565','a776iFHyHl+0kWyV9ZqKVYmeRctkzE343GGWvWi6d89VxlOCAE3M1w5aIi6PzDn9cn6yHPv9CLW11uNbTMGNmXXz0F1vHEeqNw','0');
INSERT INTO `cn_log` VALUES('727','317','13','0','90947f800a7dd522fd7fa3e3d4cdf2d056e68b79','118.116.89.102','http://mls.keqxz.com/','http://mls.keqxz.com/fwfl/?k=水光','2018-01-11','1515639571','7598LOvlJTzsda/fqvUKjedkPL0xwC6lxp6ii4wslhr15cn17alBTy+RfQYkZrC786+I/T2nlwmwOd9UcSVxB0qh/xVYalWFz9g','0');
INSERT INTO `cn_log` VALUES('728','317','13','0','90947f800a7dd522fd7fa3e3d4cdf2d056e68b79','118.116.89.102','','http://mls.keqxz.com/fwfl/','2018-01-11','1515639580','c7c553Xg/SKeBmh1MYtKal0i1FABM6rz0vwhsDKdbToGfi8O/aF/9R9byTzqMuaiCeyToyX/nKImM73fKnum3esajcQK02DMLlA','0');
INSERT INTO `cn_log` VALUES('729','319','0','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','','http://mls.keqxz.com/?wrnd=qm','2018-01-11','1515656016','e335JpCc/1ZkLBLyMH3LhH/ZS0uBMxevFMux9Uhi3Ek7YlKaldH2WLVlktFBf/8xApO/D5k7rksH0V3FVbnDY3FUwu8923sfUg','0');
INSERT INTO `cn_log` VALUES('730','319','0','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','','http://mls.keqxz.com/?wrnd=qm','2018-01-11','1515656030','0285g6oLBSCM/kaHaftY6XexM961gEVGQrFvaCTuV+5enrMrCrLZwAnjqk6Owgs4ajXWC2doJ3Ytlp7MkPx7aFIfTkRuec+tLQ','0');
INSERT INTO `cn_log` VALUES('731','319','13','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/user/index','http://mls.keqxz.com/fwfl/','2018-01-11','1515656037','5696VqOSCArq6Y2RiVUEGaajyb4ygznp1NOIIcmeJ0CO+2CX9oqAxx0tIdEZni3xvPW7IT3EonrDIFRFyunFi1bEbQp3N7l20RE','0');
INSERT INTO `cn_log` VALUES('732','319','16','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/fwfl/','http://mls.keqxz.com/stjbhl/','2018-01-11','1515656039','c422pVIWh7OFqFdxZv01Ir6vVvM0w0XS608HU2FpQjEJf0Xk418XBZCALJLTvFbO8p3BIPF90UntVSZ8qltXkgIqOdBzYkBMSKg','0');
INSERT INTO `cn_log` VALUES('733','319','0','10','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/stjbhl/','http://mls.keqxz.com/stjbhl/10.html','2018-01-11','1515656041','7558sDq3e2dmUIzKi3CD2b15Y1/r6NGrwYALfcWY4IZnCsu58ySNBnw1eWZFXQFjlW6pb8aC6yJtI6BJMM3Y6TNw0JGhZ9MiJe0','0');
INSERT INTO `cn_log` VALUES('734','319','9','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/user/cart','http://mls.keqxz.com/mlyy/','2018-01-11','1515656068','1843N3pJ9t7aiLgU4li1JHUOuwtOLtxDjEQzDnoFlbii0yIHYj103YVrIaeZp64UtZZrhSwHDPNxwVjFD0nxlKgX2xgxyrJ3wg','0');
INSERT INTO `cn_log` VALUES('735','319','24','0','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/mlyy/','http://mls.keqxz.com/jsyy/','2018-01-11','1515656070','109dk1tDWAcgW6uDN2gLpdZJvgKDKxZ9r9pRWdwxuQA9KKRkwQf3Zz38lJMDq1vQhkEicBgthrnwRVDK76yOzqrDxpXTUYsabws','0');
INSERT INTO `cn_log` VALUES('736','319','0','4','72fa3ea428f53ce0bf4d3bf6aa4c74d58961a30f','118.113.41.81','http://mls.keqxz.com/jsyy/','http://mls.keqxz.com/team/4.html','2018-01-11','1515656072','3ef4YlcHFDPqx3YkyW7l6xuSFzMj4aD6VC3mMiDQxiQzP8nnEZy8t+UHPNpMmgUo+cXN9eRtOgVhQYdBPQywzDQVacBbYX4NgA','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='微信端用户表 即会员表';

--
-- 转存表中的数据 cn_member
--

INSERT INTO `cn_member` VALUES('1','0','13594333241','1','13594333241','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','','40753e71591badf5751ad5847fea81e9','1511165911','1','管家','WiFi管家','','四川 广安','这里是详细的地址','2017-11-11','','3','WiFi管家','o32l3wDjRU0ALmBRwHhgqsGowVI0','0','http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0','0','','男','女','117.136.62.79','0','','备注备注备注备注备注备注备注备注备注','','1511433311','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('6','0','13594333242','1','13594333242','','1','1513921491','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIM0PIibaNPEsvKrpkH9uyGeA/0','','fd1b36acb8b4f4fa21eb4d9126b720b8','1514948993','1','管家2','WiFi管家','','四川 广安','','','','3','WiFi管家','oLCgv0rbnPRKGZXNa8mBPbvIJYu8','0','http://wx.qlogo.cn/mmopen/vi_32/p9ic3erCbNWKnBlFu4iaXFkquowGnbclSK74Ac3Kq8jA8yto7ahqhjpeEVvJibsZEXIuzoGicRDDZHMWHSvgGlneUg/132','0','','女','女','118.113.40.159','0','','','','1515556699','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('7','0','18081029908','1','18081029908','','1','1515139149','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/0','','13ed46c1bb9365f1c611871dafaffa74','1515118059','1','','羽毛','','四川 成都','','','','3','羽毛','oLCgv0g_pELowJK4srRzJfphpAvo','0','http://wx.qlogo.cn/mmopen/vi_32/A4XhUDJpmLg2e3yz1If3xqbnxnflzPyGbpzbVx8X24eT1OiaNrM7ODE9pS6FIsCgLENSFwBibCDgN4sbgJFj44MQ/0','0','','男','男','118.113.56.65','0','','','','1515556681','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('8','0','15928373167','1','15928373167','','1','1515136632','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','','815385d061174fc9042e51c7f8b23277','1515119126','1','','yeahaa','','四川 内江','','','','3','yeahaa','oLCgv0rbtIo3N0og5-tgkufE_KEs','0','http://wx.qlogo.cn/mmopen/vi_32/fyjLcnmW6KLfUbM4cvmyFFwTN2sWKYXjc1uovr6YcLI8jtdAiavcHfkmcB4QDlkXpXicA0qhV1VTEfEAdauva4DA/0','0','','女','女','117.136.62.41','0','','','','1515142628','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('9','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','','ab7d82e734e70a5b6b87720a8d3b8da4','1515119905','1','','知更鸟','','四川 成都','','','','3','知更鸟','oLCgv0kb2hPr08avL2rQ1jdX3eV8','0','http://wx.qlogo.cn/mmopen/vi_32/3hjusice0zQC87lFvFOZmTu6C1ib5Byk0NpDsj7yz2pENM4wMbAQ35G6oGhoDOFHabPsVcbL6aebQfyeDk0mm6icw/0','0','','男','男','118.113.56.65','0','','','','1515119905','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('10','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/0','','374b6d9a0ec6da00fe9ff688feff340c','1515119907','1','','习惯','','四川 成都','','','','3','习惯','oLCgv0lHdkTWy6-mTDNSKJELYP4Y','0','http://wx.qlogo.cn/mmopen/vi_32/Z3faTNzcfANV2Gc7xRFyvkP3te0MXnJ3f1ZpuIia0guwrOibLmurwTIuqYeC6ecpr4U8pVvtf1eZZjS4hUYdicneA/132','0','','女','女','139.207.55.15','0','','','','1515585412','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('11','0','15828974773','1','15828974773','','1','1515561637','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/0','','d378420532880e98af3658e35ba986d6','1515121177','1','','义博云天','','四川 遂宁','海上海','','','3','义博云天','oLCgv0qMB56RRvhf7GSz-qX50Xnk','0','http://wx.qlogo.cn/mmopen/vi_32/atVpApQnoGmcMdo032bqMYVaH4Bny071xeCHV8z1e0p3BCOZAlYBXORiaEEcRgDVEhm3ISbfD6FaSMKX8yr59Hg/0','0','','女','女','118.113.56.65','0','','','','1515561550','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('12','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/0','','90b324e12fcb9e8e74b76b8f13ceaaad','1515132652','1','','两个人流浪','','四川 成都','','','','3','两个人流浪','oLCgv0ikzGe4dyd2Y013l-wd8aAw','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9tsFutVHOmrsIgNv9FodTe1ZghJTz6fMbTxzZIqJDsJ7GPs52icLVYc10XDhnZBx0pZkHjyZOiaRQ/132','0','','男','男','171.210.212.10','0','','','','1515570408','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('13','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','','baea7b6502f3740ffd388d8c9ea094ad','1515151210','1','','小智','','四川 成都','','','','3','小智','oLCgv0h-sP_zHY9-XKT-tCBRZeCU','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICicbQa64qEbKlkybicUicoYIuExgQZd1eOSUo3rNokUrCzRpE5hVCD6k5GNJ4iaRxQWklmtaQGRdr7g/0','0','','女','女','139.207.177.131','0','','','','1515562601','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('14','0','18908099505','1','18908099505','','1','1515557318','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/0','','6d802a6730eeaaf40c8fa72caa8b008e','1515153700','1','','黄丽','','四川 成都','','','','3','黄丽','oLCgv0qcxBDMVhvgGbyvImuu4TGs','0','http://wx.qlogo.cn/mmopen/vi_32/m9LcibWIuMvY7wHAR0vyf1U3B79cQNdnn8aCFv5s853MicoSyhyREN8hCMhozWAX9jt65bt1iaz2Fv1UbSNsJStgw/132','0','','女','女','139.207.93.125','0','','','','1515577298','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('15','0','18116619416','1','18116619416','','1','1515561658','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/0','','2c1a409eed4cbeefdf00b61af8880f04','1515162938','1','','0   0','','四川 成都','','','','3','0   0','oLCgv0rE_ZbAsm6F9L9_m_1fUoLs','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXGwmrvzHDBOSbzqBSOQyx1kzCEpXibrPIibBtxemcqWk8ZTE2UWPGbMD2TrOBDQ3vv6WHgRSeiay1Q/132','0','','女','女','118.116.92.52','0','','','','1515573191','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('16','0','18908073896','1','18908073896','','1','1515561816','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/0','','5ff3e17008091ea59bfba1ba570ac8a0','1515209807','1','','游傅英','','重庆 ','','','','3','游傅英','oLCgv0paPDQxcgMOJqeH1JQECGzA','0','http://wx.qlogo.cn/mmopen/vi_32/O1kmOPuGOskQoSovOI6WFIoae63ywGUoY7ga5CpwozvHww1J94eZaorlWYu5N6c1mYxLIUmYiaQaTiahqcLXOBIA/132','0','','女','女','118.113.56.65','0','','','','1515639564','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('17','0','13880180472','1','13880180472','','1','1515561674','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/0','','3eab13e6c8ac736de78ce6bc4c9d5eda','1515557150','1','','余笙','','四川 成都','海上海','11.27','','3','余笙','oLCgv0tuaS11r-ifAZXCu8_cqM80','0','http://wx.qlogo.cn/mmopen/vi_32/iclUibvliakPTE4iaC6fJpWgZWs0AREwwXPopyWy8icT4TsBtMbHTGKTj78Cg0aepH59T06LURZEOqaiazpPIoN387sA/132','0','','女','女','117.136.62.48','0','','','','1515561552','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('18','0','','1','','','0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','','a14034da61cc63c57f959ff195c5f5e4','1515557754','1','','花','','四川 成都','','','','3','花','oLCgv0rtb5kHkW-yh5X2AhLbmz1Q','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKB3VVvmKgxb2FDagdpM9233mSufc4Yev17gx1iau4dbgpelibpoALswWuSkW0KumYziclDNtYBB1Pdw/0','0','','女','女','118.112.185.236','0','','','','1515557754','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
INSERT INTO `cn_member` VALUES('19','0','18781702377','1','18781702377','','1','1515561618','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','','beadbefe5579f90af70f9eac5f216ef9','1515561536','1','','南风过境','','四川 南充','','','','3','南风过境','oLCgv0lUlD6rcEWhJAF0rSmV5Ra0','0','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJu6JD6CLPbHic9KyPukJFibJSdnruib3g6CqAdd2W2fibiarfQQS52LhI1vssxV6RophsXNvnLDG0gKKw/132','0','','女','女','118.116.89.102','0','','','','1515561536','','0','0.0000000000000','0.0000000000000','','','','','','0','0');
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
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `ty` tinyint(1) DEFAULT '0' COMMENT '订单类型1购买产品或服务项目 2预约技师',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单记录表';

--
-- 转存表中的数据 cn_order
--

INSERT INTO `cn_order` VALUES('1','1','8','8-20180105045902','1','1','0.00','0','0.00','0.00','0','0','1515142742','1','0','','','','0','0','','15928373167');
INSERT INTO `cn_order` VALUES('2','1','8','8-20180105050037','1','0','0.00','0','0.00','0.00','0','0','1515142837','1','0','','','','0','0','','15928373167');
INSERT INTO `cn_order` VALUES('3','1','7','7-20180110122403','2','2','360.00','0','0.00','360.00','0','0','1515558243','1','0','','','','0','0','','18081029908');
INSERT INTO `cn_order` VALUES('4','1','7','7-20180110122627','4','4','4.00','0','0.00','4.00','0','0','1515558387','1','1515569465','','','','0','0','','18081029908');
--
-- 表的结构cn_order_goods
--

DROP TABLE IF EXISTS `cn_order_goods`;
CREATE TABLE `cn_order_goods` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
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
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单下单明细表';

--
-- 转存表中的数据 cn_order_goods
--

INSERT INTO `cn_order_goods` VALUES('1','1','8','8-20180105045902','10','0.00','1','1','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1515142742','0');
INSERT INTO `cn_order_goods` VALUES('2','1','8','8-20180105050037','10','0.00','1','0','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1515142837','0');
INSERT INTO `cn_order_goods` VALUES('3','1','7','7-20180110122403','10','180.00','2','2','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1515558243','0');
INSERT INTO `cn_order_goods` VALUES('4','1','7','7-20180110122627','10','1.00','4','4','精油推背','/Comm/images/img_6.png','16',',0,13,16,16','1515558387','0');
--
-- 表的结构cn_order_use
--

DROP TABLE IF EXISTS `cn_order_use`;
CREATE TABLE `cn_order_use` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单购买产品预约表和预约技师记录表';

--
-- 转存表中的数据 cn_order_yuyue
--

INSERT INTO `cn_order_yuyue` VALUES('1','8','8-20180105050037','10','','1','1515229200','4','梅老师','1515142868','1','0','','精油推背','15928373167','1515142904');
INSERT INTO `cn_order_yuyue` VALUES('2','7','7-20180110122627','10','','1','1515574800','4','梅老师','1515558484','0','0','','精油推背','18081029908','0');
INSERT INTO `cn_order_yuyue` VALUES('3','14','','4','','1','1515648060','4','梅老师','1515561732','0','0','','梅老师','18908099505','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 cn_rsms
--

INSERT INTO `cn_rsms` VALUES('1','1','13594333241','00476','1513920848','127.0.0.1','0','0');
INSERT INTO `cn_rsms` VALUES('2','1','13594333241','16611','1513920874','127.0.0.1','0','0');
INSERT INTO `cn_rsms` VALUES('3','1','13594333241','48165','1513920875','127.0.0.1','0','0');
INSERT INTO `cn_rsms` VALUES('4','1','13594333241','94153','1513920877','127.0.0.1','1','0');
INSERT INTO `cn_rsms` VALUES('5','1','13594333241','02103','1513921432','127.0.0.1','1','0');
INSERT INTO `cn_rsms` VALUES('6','7','18081029908','35834','1515118124','118.113.56.65','0','0');
INSERT INTO `cn_rsms` VALUES('7','8','15928373167','83787','1515119250','117.136.62.41','0','0');
INSERT INTO `cn_rsms` VALUES('8','8','15928373167','40826','1515119251','117.136.62.41','0','0');
INSERT INTO `cn_rsms` VALUES('9','8','15928373167','55885','1515136620','118.113.40.159','1','1');
INSERT INTO `cn_rsms` VALUES('10','7','18081029908','54401','1515139134','139.207.178.125','1','1');
INSERT INTO `cn_rsms` VALUES('11','15','18116619416','00839','1515201344','118.113.56.65','0','1');
INSERT INTO `cn_rsms` VALUES('12','14','18908099505','43353','1515557300','171.210.224.79','1','1');
INSERT INTO `cn_rsms` VALUES('13','19','18781702377','18720','1515561606','118.116.89.102','1','1');
INSERT INTO `cn_rsms` VALUES('14','11','15828974773','23401','1515561627','118.116.89.102','1','1');
INSERT INTO `cn_rsms` VALUES('15','15','18116619416','08028','1515561643','118.116.89.102','1','1');
INSERT INTO `cn_rsms` VALUES('16','17','13880180472','98872','1515561656','118.116.89.102','1','1');
INSERT INTO `cn_rsms` VALUES('17','16','18908073896','27921','1515561796','118.116.89.102','1','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 COMMENT='访问者记录表';

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
  `uid` bigint(9) DEFAULT NULL,
  `usemoney` int(8) DEFAULT '0' COMMENT '订单最低金额 在商城购买服务，满599可以使用一张50元的优惠券，满399可以使用一张30元的优惠券；优惠券不可叠加使用',
  `money` int(5) DEFAULT '0' COMMENT '优惠金额',
  `audit` tinyint(1) DEFAULT '0' COMMENT '是否使用',
  `usetime` bigint(10) DEFAULT '0' COMMENT '使用时间',
  `useorderid` varchar(30) DEFAULT '' COMMENT '使用对应的订单编号',
  `time` bigint(10) DEFAULT '0' COMMENT '领取时间',
  `endtime` bigint(10) DEFAULT '0' COMMENT '截止时间',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户优惠券信息';

--
-- 转存表中的数据 cn_user_yh
--

INSERT INTO `cn_user_yh` VALUES('1','1','1','599','50','1','1514045265','1-20171224120745','1514042780','1545494400','0');
INSERT INTO `cn_user_yh` VALUES('2','1','15','599','50','0','0','','1515561951','1547049600','0');
INSERT INTO `cn_user_yh` VALUES('3','1','11','599','50','0','0','','1515562237','1547049600','0');
INSERT INTO `cn_user_yh` VALUES('4','1','19','599','50','0','0','','1515562359','1547049600','0');
