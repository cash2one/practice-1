--
-- MySQL database dump
-- Created by wifiguanjia class, Power By quanmei. 
-- http://www.wifiguanjia.com 
--
-- 主机: 127.0.0.1
-- 生成日期: 2018 年  01 月 22 日 09:17
-- MySQL版本: 5.5.53
-- PHP 版本: 5.4.45

--
-- 数据库: `20180119_fz`
--

-- -------------------------------------------------------

--
-- 表的结构qm_ad
--

DROP TABLE IF EXISTS `qm_ad`;
CREATE TABLE `qm_ad` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_ad
--

INSERT INTO `qm_ad` VALUES('1','网站logo','/Comm/images/logo.png','597','56','/','logo','','','1','0');
INSERT INTO `qm_ad` VALUES('2','二维码','/pub/qm/p/image/180119/012238_744.jpg','260','260','','二维码','','','1','0');
INSERT INTO `qm_ad` VALUES('3','默认内页banner','/pub/qm/p/image/180122/091558_169.jpg','1920','220','','banner','','','1','0');
INSERT INTO `qm_ad` VALUES('4','首页通栏广告','/pub/qm/p/image/180122/035346_532.jpg','1920','302','','成都百芳岁环保技术有限公司','','','1','0');
--
-- 表的结构qm_admin
--

DROP TABLE IF EXISTS `qm_admin`;
CREATE TABLE `qm_admin` (
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_admin
--

INSERT INTO `qm_admin` VALUES('1','qmadmin','c5358a6db37949d725ae280082a99a4a','9','0','','','2018-01-22 13:34:37','110.184.220.84','739','01ebcab5bde4691766028d2998a1a7b6','','','','0','0','主站','','','','0');
--
-- 表的结构qm_admin_check
--

DROP TABLE IF EXISTS `qm_admin_check`;
CREATE TABLE `qm_admin_check` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `sort` int(4) DEFAULT '0' COMMENT '排序 默认降序',
  `type` tinyint(2) DEFAULT '1' COMMENT '权限分类 1模块 2操作权限（添加 删除 修改 导出）',
  `cntitle` varchar(100) DEFAULT '' COMMENT '权限说明',
  `flag` varchar(50) DEFAULT '' COMMENT '权限标识',
  `audit` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_admin_check
--

INSERT INTO `qm_admin_check` VALUES('1','0','1','网站设置','system','1','0');
INSERT INTO `qm_admin_check` VALUES('2','0','1','栏目设置','lm','1','0');
INSERT INTO `qm_admin_check` VALUES('3','0','1','属性设置','attr','1','1');
INSERT INTO `qm_admin_check` VALUES('4','0','1','网站内容','lists','1','0');
INSERT INTO `qm_admin_check` VALUES('5','0','1','广告管理','ad','1','0');
INSERT INTO `qm_admin_check` VALUES('6','0','1','留言管理','msg','1','0');
INSERT INTO `qm_admin_check` VALUES('7','0','1','数据备份','dbak','1','0');
INSERT INTO `qm_admin_check` VALUES('8','0','2','添加','add','1','0');
INSERT INTO `qm_admin_check` VALUES('9','0','2','修改','edit','1','0');
INSERT INTO `qm_admin_check` VALUES('10','0','2','删除','del','1','0');
INSERT INTO `qm_admin_check` VALUES('11','0','2','导出','export','1','1');
INSERT INTO `qm_admin_check` VALUES('12','0','1','预约管理','msg2','1','1');
--
-- 表的结构qm_attr
--

DROP TABLE IF EXISTS `qm_attr`;
CREATE TABLE `qm_attr` (
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
-- 转存表中的数据 qm_attr
--

--
-- 表的结构qm_color
--

DROP TABLE IF EXISTS `qm_color`;
CREATE TABLE `qm_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(55) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_color
--

INSERT INTO `qm_color` VALUES('1','#FFFFFF');
INSERT INTO `qm_color` VALUES('2','#FF0000');
INSERT INTO `qm_color` VALUES('3','#FFFF00');
INSERT INTO `qm_color` VALUES('4','#FF00FF');
INSERT INTO `qm_color` VALUES('5','#0000FF');
INSERT INTO `qm_color` VALUES('6','#00FFFF');
INSERT INTO `qm_color` VALUES('7','#00FF00');
INSERT INTO `qm_color` VALUES('8','#CCCCCC');
INSERT INTO `qm_color` VALUES('9','#000000');
INSERT INTO `qm_color` VALUES('10','#666666');
--
-- 表的结构qm_config
--

DROP TABLE IF EXISTS `qm_config`;
CREATE TABLE `qm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varname` varchar(255) DEFAULT '',
  `info` varchar(255) DEFAULT '',
  `gid` tinyint(3) DEFAULT '0',
  `type` varchar(255) DEFAULT '',
  `value` longtext,
  `sort` int(7) DEFAULT '1',
  `audit` int(7) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_config
--

INSERT INTO `qm_config` VALUES('1','cfg_webname','网站标题','1','1','成都百芳岁环保技术有限公司','1','0');
INSERT INTO `qm_config` VALUES('2','cfg_keywords','关键字','1','1','成都百芳岁环保技术有限公司','1','0');
INSERT INTO `qm_config` VALUES('3','cfg_searchtitle','搜索关键字','1','1','','1','1');
INSERT INTO `qm_config` VALUES('4','cfg_description','网站描述','1','2','成都百芳岁环保技术有限公司专业从事一体化污水处理设备,生活污水处理设备,医院污水处理设备,地埋式污水处理设备，净水设备等设备的生产加工以及污水处理技术的研发和污水处理工程施工,','1','0');
INSERT INTO `qm_config` VALUES('5','cfg_copyright','底部版权','1','2','成都百芳岁环保技术有限公司\r\nChengdu 100 years old Environmental Protection Technology Co., Ltd.\r\n地址：成都市成华区建材路299号隆鑫九熙广场\r\n手机：15828317119    13198530799','1','0');
INSERT INTO `qm_config` VALUES('6','cfg_name','网站名称','1','1','成都百芳岁环保技术有限公司','2','0');
INSERT INTO `qm_config` VALUES('7','cfg_head','Head前代码','1','2','','1','0');
INSERT INTO `qm_config` VALUES('8','cfg_body','Body前代码','1','2','','1','0');
INSERT INTO `qm_config` VALUES('9','cfg_copyright2','底部版权2','1','2','蜀ICP备xxxxxxx号','1','0');
INSERT INTO `qm_config` VALUES('10','cfg_f1','联系电话','1','1','15828317119','1','0');
INSERT INTO `qm_config` VALUES('11','cfg_f2','咨询热线','1','1','13198530799','1','0');
INSERT INTO `qm_config` VALUES('12','cfg_f3','联系邮箱','1','1','','1','1');
INSERT INTO `qm_config` VALUES('13','cfg_f4','在线QQ','1','1','1013520640','1','0');
INSERT INTO `qm_config` VALUES('14','cfg_f5','公司经纬度','1','9','104.144745,30.650546','1','0');
INSERT INTO `qm_config` VALUES('15','cfg_f6','公司地址','1','1','成都市成华区建材路299号隆鑫九熙广场','1','0');
INSERT INTO `qm_config` VALUES('16','cfg_f7','联系我们','1','2','','1','1');
INSERT INTO `qm_config` VALUES('17','cfg_f8','公司简介','1','2','','1','1');
--
-- 表的结构qm_flag
--

DROP TABLE IF EXISTS `qm_flag`;
CREATE TABLE `qm_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att` varchar(255) DEFAULT '',
  `attname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_flag
--

INSERT INTO `qm_flag` VALUES('1','1','热卖产品');
--
-- 表的结构qm_info
--

DROP TABLE IF EXISTS `qm_info`;
CREATE TABLE `qm_info` (
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
  `s1` double(10,1) DEFAULT '0.0',
  `s2` double(10,1) DEFAULT '0.0',
  `s3` bigint(10) DEFAULT '0',
  `s4` int(7) DEFAULT '0',
  `s5` int(7) DEFAULT '0',
  `s6` int(7) DEFAULT '0',
  `sd` int(7) DEFAULT '0',
  `z1` longtext,
  `z2` longtext,
  `z3` longtext,
  `z4` longtext,
  `z5` longtext,
  `ktime` date DEFAULT NULL,
  `uid` bigint(11) DEFAULT '0',
  `weburl` varchar(500) DEFAULT '',
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_info
--

INSERT INTO `qm_info` VALUES('1','banner','','0','0','25',',0,6,25','','','','','','32','1','2018-01-19 09:43:26','/Comm/images/banner1.jpg','/Comm/images/banner1_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/1.html','0');
INSERT INTO `qm_info` VALUES('2','banner','','0','0','25',',0,6,25','','','','','','31','1','2018-01-19 09:43:35','/Comm/images/banner2.jpg','/Comm/images/banner2_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/2.html','0');
INSERT INTO `qm_info` VALUES('3','banner','','0','0','25',',0,6,25','','','','','','30','9','2018-01-19 09:43:45','/Comm/images/banner3.jpg','/Comm/images/banner3_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/3.html','0');
INSERT INTO `qm_info` VALUES('4','联系我们','','0','0','5',',0,5','','<p>\r\n	<strong><span style=\\\"font-size:18px;font-family:SimHei;\\\">成都百芳岁环保技术有限公司</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;color:#e53333;\\\"><strong>24小时免费咨询热线：</strong></span><strong><span style=\\\"font-size:18px;color:#e53333;\\\">15828317119</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">地址：<span style=\\\"font-size:16px;line-height:24px;\\\">成都市成华区建材路299号隆鑫九熙广场</span></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">联系人：颜炳林</span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">手机：15828317119<span><span style=\\\"color:#e53333;\\\"></span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">电话：13198530799</span> \r\n</p>','','','','1','36','2018-01-19 09:46:07','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/contact/4.html','0');
INSERT INTO `qm_info` VALUES('5','公司简介','','0','0','7',',0,1,7','','<p class=\\\"MsoNormal\\\" style=\\\"text-align:center;text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\"><img alt=\\\"\\\" src=\\\"/Comm/images/20151211160697039703.jpg\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:center;text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\"><img width=\\\"700\\\" height=\\\"715\\\" title=\\\"\\\" align=\\\"\\\" alt=\\\"\\\" src=\\\"/Comm/images/20171110100612811281.jpg\\\"><br>\r\n&nbsp;</span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">成都百芳岁环保技术有限公司专业从事环保产品及技术开发，电力工程设计，环保工程、环保设施营运及技术服务等业务。公司具有环保工程专业承包叁级资质、环境污染治理设施运营资质、工程咨询丙级资格，并通过质量、职业健康安全、环境管理体系认证，是中国环保产业协会会员单位，诸城市环保产业重点骨干企业。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">公司位于知名城市成都。公司拥有一支学术领先、经验丰富和高度敬业的研发和工程技术人员队伍。公司坚持以高新技术服务于客户，以卓越的产品质量赢得用户的信赖。在公司快速发展的同时，受到业界和客户的广泛尊重和好评。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">公司专业生产给排水处理环保设备五十多个系列，</span><span style=\\\"line-height:150%;font-size:12pt;\\\">200</span><span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">多个规格的产品。污水处理系列：气浮机、刮泥机、格栅除污机、带式压滤机、医疗垃圾焚烧炉、烟尘处理设备、尾气处理设备、生活污水处理设备、地埋式污水处理设备、涡凹气浮机、溶气气浮机、地埋式一体化生活污水处理设备、旋转式格栅、微滤机、机械过滤器、污泥脱水机、中心传动、周边传动刮吸泥机、行车式刮泥机、曝气机、生物填料等。我公司还可为用户提供技术咨询、设计工艺、场区平面布置、工艺改造、设备安装和调试等完善的服务。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">公司现已形成国际先进水平的环保工艺、技术、设备的供应和成套中心，以城市和工业污水处理、污水回用、污泥处理为专长的设备制造中心，以及相配套的工程运行管理和售后服务体系，我公司将以此为平台，为广大客户提供高质量的一步到位的全方位服务。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-size:12pt;\\\"> </span><span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">面对竞争激烈的市场，公司秉承“以人为本、诚信守法、科技领先、铸就经典、顾客满意”的管理理念，悉心打造精品工程</span><span style=\\\"line-height:150%;font-size:12pt;\\\">,</span><span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">不断加强新产品的开发与创新，使公司有了更广阔的市场。现产品行销全国</span><span style=\\\"line-height:150%;font-size:12pt;\\\">26</span><span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">个省级行政区划，并出口到非洲、南亚、中亚、东南亚的二十多个国家和地区。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">展望未来，公司将继续依托诸城机械工业优势，跟踪国内外高新技术，对产品质量和服务精益求精，与客户共赢，谋求和谐、持续、快速发展，</span><span style=\\\"line-height:150%;font-size:12pt;\\\"> </span><span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\">为我国的环保事业做出积极贡献。</span><span style=\\\"line-height:150%;font-size:12pt;\\\"></span> \r\n</p>','','','','1','33','2018-01-19 09:54:42','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/about/us/5.html','0');
INSERT INTO `qm_info` VALUES('6','喷漆水处理设备发货记录','','0','0','4',',0,4','','<p>\r\n	（1）物理处理法 &nbsp; &nbsp; &nbsp; &nbsp;有分离法、过滤法、离心分离法等。喷涂污水的物理处理法，主要是用于去除悬浮物、胶状物等物质；而采用蒸发结晶和高磁分离法，主要是用于去除胶状物、悬浮物和可溶性盐类以及各种金属离子。若投加磁铁粉和凝聚剂，还能去除其他非金属杂质。\r\n</p>\r\n<p>\r\n	0\r\n</p>\r\n<p>\r\n	（2）化学处理法 &nbsp; &nbsp; &nbsp; &nbsp;有中和法、凝聚法、氧化还原法等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（3）物理化学法 &nbsp; &nbsp; &nbsp; &nbsp;用此法处理污水有离子交换、电渗析、反渗透、气浮分离、汽提、吹脱、吸附、萃取等方法。物理化学法主要用于分离污水中的溶解物质，回收有用的物质成分，使污水得到深度处理。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（4）生物处理法 &nbsp; &nbsp; &nbsp; &nbsp;也称生化法，是利用微生物群的新陈代谢过程，使污水中的复杂有机物氧化分解成二氧化碳、甲烷和水。生物法的种类很多，按生物法的基本类型可分为四大类，即自然氧化法、生物滤池氧化法、活性污泥法、厌氧发酵法。\r\n</p>','','','','2','7','2018-01-19 09:56:29','/Comm/images/20180116113854329.jpg','/Comm/images/20180116113854329_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/6.html','0');
INSERT INTO `qm_info` VALUES('7','山西游泳池生活污水处理设备发货记录','','0','0','4',',0,4','','<p>\r\n	前段时间山西某公司订购了一套游泳池生活污水处理设备，于2018年01月08日按时发货。经出厂检验，设备完全符合出厂要求。\r\n</p>','','','','1','4','2018-01-19 09:57:34','/Comm/images/20180108105941250.jpg','/Comm/images/20180108105941250_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/7.html','0');
INSERT INTO `qm_info` VALUES('8','山西矿井水处理设备现场案例','','0','0','21',',0,3,21','','<img src=\\\"/Comm/images/20180102083323897.jpg\\\" alt=\\\"\\\" width=\\\"700\\\" height=\\\"500\\\" title=\\\"\\\" align=\\\"\\\"></img>','','','','2','1','2018-01-19 10:00:00','/Comm/images/20180102083323897.jpg','/Comm/images/20180102083323897_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/8.html','0');
INSERT INTO `qm_info` VALUES('9','滨州养猪废水处理安装现场','','0','0','21',',0,3,21','','<img src=\\\"/pub/qm/p/image/180119/020537_280.jpg\\\" alt=\\\"\\\">','','','','1','7','2018-01-19 10:04:51','/pub/qm/p/image/180119/020537_280.jpg','/pub/qm/p/image/180119/020537_280_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/9.html','0');
INSERT INTO `qm_info` VALUES('10','地埋式一体化污水处理设备','','0','0','12',',0,2,12','','<p>\r\n	一、概述\r\n</p>\r\n<p>\r\n	随着经济和人口的增长，对大自然的污染愈来愈受到人类的重视，在总结国内外生活污水处理装置的运行经验的基础上，结合我公司自己的科研成果和工程实践，设计出一种可地埋设置的成套有机废水处理装置，其设备采用九十年代后期国内外先进工艺和生产制造技术，生产出以玻璃钢、不锈钢为主要原料的SPR型系列污水处理设备。其目的主要是使生活污水和与之类似的工业有机废水经该设备处理后达到用户要求的排放标准。该设备主要用于居住小区(含别墅小区)、高级宾馆、医院、综合办公楼和各类公共建筑的生活污水处理，经该设备处理的出水水质，达到国家排放标准。全套设备均可埋设于地下，故亦称\\\"地埋式生活污水处理设备\\\"。\r\n</p>\r\n<p>\r\n	本公司地埋式生活污水处理设备采用国际先进的生物处理工艺，集去除BOD5、COD、NH3-N于一身，具有技术性能稳定可靠，处理效果好，投资省，占地少，维护方便等优点。我公司也可根据客户要求同时配套中水回用设备。\r\n</p>\r\n<p>\r\n	二、产品特点\r\n</p>\r\n<p>\r\n	1、埋设于地表以下，设备上面的地表可作为绿化或其他用地，不需要建房及采暖、保温。\r\n</p>\r\n<p>\r\n	2、二级生物接触氧化处理工艺均采用推流式生物接触氧化，其处理效果优于完全混合式或二级串联完全混合式生物接触氧化池。并比活性污泥池体积小，对水质的适应性强，耐冲击负荷性能好，出水水质稳定，不会产生污泥膨胀。池中采用新型弹性立体填料，比表面积大，微生物易挂膜，脱膜，在同样有机物负荷条件下，对有机物去除率高，能提高空气中的氧在水中溶解度。\r\n</p>\r\n<p>\r\n	3、生化池采用生物接触氧化法，其填料的体积负荷比较低，微生物处于自身氧化阶断，产泥量少，仅需三个月（90天）以上排一次泥（用粪车抽吸或脱水成泥饼外运）。\r\n</p>\r\n<p>\r\n	4、该地埋式生活污水处理设备的除臭方式除采用常规高空排气，另配有土壤脱臭措施。\r\n</p>\r\n<p>\r\n	5、整个设备处理系统配有全自动电气控制系统和设备故障报警系统，运行安全可靠，平时一般不需要专人管理，只需适时地对设备进行维护和保养。\r\n</p>\r\n<p>\r\n	三、使用方法\r\n</p>\r\n<p>\r\n	能够处理生活系统综合性废水及其相类似的有机污水；\r\n</p>\r\n<p>\r\n	采用玻璃钢、不锈钢结构，具有耐腐蚀、抗老化等优良特性，使用寿命长达 50 年以上；\r\n</p>\r\n<p>\r\n	全套装置施工简单、操作容易，所有机械设备均为自动化控制，全部装置可设置于地表以下。\r\n</p>\r\n<p>\r\n	四、适用范围\r\n</p>\r\n<p>\r\n	1、宾馆、饭店、疗养院、医院；\r\n</p>\r\n<p>\r\n	2、住宅小区、村庄、集镇；\r\n</p>\r\n<p>\r\n	3、车站、飞机场、海港码头、船舶；\r\n</p>\r\n<p>\r\n	4、工厂、矿山、部队、旅游点、风景区；\r\n</p>\r\n<p>\r\n	5、与生活污水类似的各种工业有机废水。\r\n</p>','','','','1','2','2018-01-19 10:06:26','/pub/qm/p/image/180119/020827_109.jpg','/pub/qm/p/image/180119/020827_109_th.jpg','','','','0','1','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/product/list-12/10.html','0');
INSERT INTO `qm_info` VALUES('11','改善水体环境','','0','0','31',',0,6,31','','','','','','29','1','2018-01-19 10:24:26','/Comm/images/ceww.jpg','/Comm/images/ceww_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-31/11.html','0');
INSERT INTO `qm_info` VALUES('12','造就美丽世界','','0','0','31',',0,6,31','','','','','','28','3','2018-01-19 10:25:20','/Comm/images/cewwa.jpg','/Comm/images/cewwa_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-31/12.html','0');
INSERT INTO `qm_info` VALUES('13','营业执照','','0','0','29',',0,6,29','','','','','','27','1','2018-01-19 10:26:11','/Comm/images/Simal_yyzz.jpg','/Comm/images/Simal_yyzz_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/13.html','0');
INSERT INTO `qm_info` VALUES('14','环保工程承包资质','','0','0','29',',0,6,29','','','','','','26','1','2018-01-19 10:26:53','/Comm/images/Simal_khzm.jpg','/Comm/images/Simal_khzm_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/14.html','0');
INSERT INTO `qm_info` VALUES('15','ISO9001质量管理','','0','0','29',',0,6,29','','','','','','25','1','2018-01-19 10:27:15','/Comm/images/Simal_iso.jpg','/Comm/images/Simal_iso_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/15.html','0');
INSERT INTO `qm_info` VALUES('16','ISO14001环境管理','','0','0','29',',0,6,29','','','','','','24','1','2018-01-19 10:27:37','/Comm/images/Simal_isz.jpg','/Comm/images/Simal_isz_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/16.html','0');
INSERT INTO `qm_info` VALUES('17','GB/T28001职业健康安全','','0','0','29',',0,6,29','','','','','','23','1','2018-01-19 10:27:59','/Comm/images/Simal_isy.jpg','/Comm/images/Simal_isy_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/17.html','0');
INSERT INTO `qm_info` VALUES('18','商标证书','','0','0','29',',0,6,29','','','','','','22','3','2018-01-19 10:28:20','/Comm/images/Simal_sb.jpg','/Comm/images/Simal_sb_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-29/18.html','0');
INSERT INTO `qm_info` VALUES('19','高出国家污水排放以及行业排放标准','','0','0','27',',0,6,27','','<p>\r\n	通过ISO9001-2000国际质量体系认证\r\n</p>','','','','16','3','2018-01-19 10:32:46','/Comm/images/at.jpg','/Comm/images/at_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/19.html','0');
INSERT INTO `qm_info` VALUES('20','公司年营业额上千万元','','0','0','27',',0,6,27','','<p>\r\n	百芳岁（百汸水）已与国内部分大型企业建立了合作关系，使我们在各自领域内实现互补，创造更高的价值\r\n</p>','','','','17','1','2018-01-19 10:38:05','/pub/qm/p/image/180122/061951_576.png','/pub/qm/p/image/180122/061951_576_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/20.html','0');
INSERT INTO `qm_info` VALUES('21','十二年工程师污水处理经验，近五年公司运营历程','','0','0','27',',0,6,27','','<p>\r\n	产品基本已覆盖各个行业，特别是用于生活污水、工业污水、医疗污水处理\r\n</p>','','','','18','1','2018-01-19 10:38:59','/pub/qm/p/image/180122/064641_361.png','/pub/qm/p/image/180122/064641_361_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/21.html','0');
INSERT INTO `qm_info` VALUES('22','高科技高精度污水检测分析仪器','','0','0','27',',0,6,27','','高科技高精度污水分析仪器精确检测污水污染成分，量身打造最佳处理方案，力争投入最低、处理费用最低。<br>\r\n</br>','','','','19','1','2018-01-19 10:41:54','/pub/qm/p/image/180122/064727_124.png','/pub/qm/p/image/180122/064727_124_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/22.html','0');
INSERT INTO `qm_info` VALUES('23','污水处理设备标准化、规范化、，规模化生产，污水处理工程精细化。','','0','0','27',',0,6,27','','<p>\r\n	精心管理，精密组织，精确加工。\r\n</p>','','','','20','1','2018-01-19 10:43:06','/Comm/images/atc.jpg','/Comm/images/atc_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/23.html','0');
INSERT INTO `qm_info` VALUES('24','经验丰富的技术团队','','0','0','27',',0,6,27','','<p>\r\n	省内24小时到设备现场，省外72小时内到设备现场。\r\n</p>','','','','21','1','2018-01-19 10:44:27','/pub/qm/p/image/180122/071948_198.png','/pub/qm/p/image/180122/071948_198_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/24.html','0');
INSERT INTO `qm_info` VALUES('25','中国石油','','0','0','26',',0,6,26','','','','','','15','1','2018-01-19 10:46:07','/Comm/images/ho8.png','/Comm/images/ho8_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/25.html','0');
INSERT INTO `qm_info` VALUES('26','中粮集团','','0','0','26',',0,6,26','','','','','','14','1','2018-01-19 10:46:34','/Comm/images/ho1.png','/Comm/images/ho1_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/26.html','0');
INSERT INTO `qm_info` VALUES('27','青岛啤酒','','0','0','26',',0,6,26','','','','','','13','1','2018-01-19 10:46:46','/Comm/images/ho2.png','/Comm/images/ho2_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/27.html','0');
INSERT INTO `qm_info` VALUES('28','百事可乐','','0','0','26',',0,6,26','','','','','','12','1','2018-01-19 10:46:59','/Comm/images/ho3.png','/Comm/images/ho3_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/28.html','0');
INSERT INTO `qm_info` VALUES('29','中国中化','','0','0','26',',0,6,26','','','','','','11','1','2018-01-19 10:47:10','/Comm/images/ho4.png','/Comm/images/ho4_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/29.html','0');
INSERT INTO `qm_info` VALUES('30','英国石油','','0','0','26',',0,6,26','','','','','','10','1','2018-01-19 10:47:22','/Comm/images/ho5.png','/Comm/images/ho5_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/30.html','0');
INSERT INTO `qm_info` VALUES('31','美格机械','','0','0','26',',0,6,26','','','','','','9','1','2018-01-19 10:47:36','/Comm/images/ho6.png','/Comm/images/ho6_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/31.html','0');
INSERT INTO `qm_info` VALUES('32','联合利华','','0','0','26',',0,6,26','','','','','','8','3','2018-01-19 10:47:47','/Comm/images/ho7.png','/Comm/images/ho7_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/32.html','0');
INSERT INTO `qm_info` VALUES('33','banner1','','0','0','32',',0,6,32','','','','','','7','1','2018-01-19 10:51:03','/pub/qm/p/image/180122/073413_157.jpg','/pub/qm/p/image/180122/073413_157_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-32/33.html','0');
INSERT INTO `qm_info` VALUES('34','banner2','','0','0','32',',0,6,32','','','','','','6','3','2018-01-19 10:51:21','/Comm/m/images/banner02.jpg','/Comm/m/images/banner02_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-32/34.html','0');
INSERT INTO `qm_info` VALUES('35','手机首页公司简介','','0','0','33',',0,6,33','','<p>\r\n	成都百芳岁环保设备科技有限公司专业从事环保产品及技术开发，电力工程设计，环保工程、环保设施营运及技术服务等业务。公司具有环保工程专业承包叁级资质、环境污染治理..\r\n</p>','','','','5','3','2018-01-19 10:52:31','/Comm/m/images/in_about.png','/Comm/m/images/in_about_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-33/35.html','0');
INSERT INTO `qm_info` VALUES('36','污水处理设备','','0','0','35',',0,6,35','','','','','','4','1','2018-01-19 17:13:32','','','http://www.zchaipuou.com','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/36.html','0');
INSERT INTO `qm_info` VALUES('37','污水处理设备','','0','0','35',',0,6,35','','','','','','3','1','2018-01-19 17:13:55','','','http://www.sdhpo.com','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/37.html','0');
INSERT INTO `qm_info` VALUES('38','山东沼气发电机','','0','0','35',',0,6,35','','','','','','2','1','2018-01-19 17:14:13','','','http://www.fdjfs.cn','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/38.html','0');
INSERT INTO `qm_info` VALUES('39','带式压滤机','','0','0','35',',0,6,35','','','','','','1','3','2018-01-19 17:14:31','','','http://www.fdjfs.cn','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/39.html','0');
--
-- 表的结构qm_lm
--

DROP TABLE IF EXISTS `qm_lm`;
CREATE TABLE `qm_lm` (
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_lm
--

INSERT INTO `qm_lm` VALUES('1','关于百芳岁','','0',',0','','1','','','','','1','3','','1','','/about/','/about/','/Comm/images/com_menu_pic.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('2','产品中心','Products Center','0',',0','','2','','','','','1','2','','1','','/product/','/product/','/Comm/images/ccc.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('3','成功案例','Successful Cases','0',',0','','3','','','百芳岁环保技术团队一直致力于污水处理技术以及污水处理设备的研发，污水处理工程的施工。百芳岁环保产品在生活、医疗、工业等行业的案例，获得了行业标准认证，满足国家严格的污水排放要求。','','1','2','','1','','/case/','/case/','/Comm/images/al.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('4','新闻中心','News Center','0',',0','','4','','','','','1','1','','1','','/news/','/news/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('5','联系我们','','0',',0','','5','','','','','1','3','','1','','/contact/','/contact/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('6','其它','','0',',0','','7','','','','','1','3','','1','','/other/','/other/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('7','公司简介','','1',',0,1','','1','','','','','1','3','','1','','/about/us/','/about/us/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('8','荣誉资质','','1',',0,1','','2','','','','','1','3','','0','','/about/honor/','/about/honor/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('9','组织机构','','1',',0,1','','3','','','','','1','3','','0','','/about/organization/','/about/organization/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('10','企业文化','','1',',0,1','','4','','','','','1','3','','0','','/about/culture/','/about/culture/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('11','公司理念','','1',',0,1','','5','','','','','1','3','','0','','/about/linian/','/about/linian/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('12','生活污水处理设备','','2',',0,2','','1','','','','','1','2','','0','','/product/list-12/','/product/list-12/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('13','污泥浓缩设备','','2',',0,2','','2','','','','','1','2','','0','','/product/list-13/','/product/list-13/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('14','过滤沉淀设备','','2',',0,2','','3','','','','','1','2','','0','','/product/list-14/','/product/list-14/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('15','气浮沉淀设备','','2',',0,2','','4','','','','','1','2','','0','','/product/list-15/','/product/list-15/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('16','医疗污水处理设备','','2',',0,2','','5','','','','','1','2','','0','','/product/list-16/','/product/list-16/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('17','屠宰污水处理设备','','2',',0,2','','6','','','','','1','2','','0','','/product/list-17/','/product/list-17/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('18','刮吸泥设备','','2',',0,2','','7','','','','','1','2','','0','','/product/list-18/','/product/list-18/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('19','污水处理设备','','2',',0,2','','8','','','','','1','2','','0','','/product/list-19/','/product/list-19/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('20','酸洗磷化污水处理设备','','2',',0,2','','9','','','','','1','2','','0','','/product/list-20/','/product/list-20/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('21','成功案例','','3',',0,3','','1','','','','','1','2','','0','','/case/list-21/','/case/list-21/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('22','动画演示','','3',',0,3','','2','','','','','1','2','','0','','/case/list-22/','/case/list-22/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('23','设备视频','','3',',0,3','','3','','','','','1','2','','0','','/case/list-23/','/case/list-23/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('24','工艺流程','','3',',0,3','','4','','','','','1','2','','0','','/case/list-24/','/case/list-24/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('25','banner','','6',',0,6','','1','','','','','1','3','','1','','/other/list-25/','/other/list-25/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('26','首页客户','','6',',0,6','','2','','','','','1','3','','1','','/other/list-26/','/other/list-26/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('27','客户多年来选择百芳岁环保的优势','Over the years, choose the advantage of us','6',',0,6','','3','','','为什么众多企业选择百芳岁，超过50家世界500强企业选择了百芳岁','','1','3','','1','','/other/list-27/','/other/list-27/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('28','专业的过滤解决方案','','6',',0,6','','4','','','公司自成立近年来，一直坚持以做具有世界先前水平的环保设备为已任，以创造中国环保企业新价值为使命。','','1','4','','1','','/other/list-28/','/other/list-28/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('29','我们的资质证书','Our Qualification Certificate','6',',0,6','','5','','','不仅是多一份资质，更多的是一份责任；\r\n我们不辜负每一个客户的信任和支持，并让我们的产品经的起考验。','','1','3','','1','','/other/list-29/','/other/list-29/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('30','真实与真诚的百芳岁','Truth and sincerity of Us','6',',0,6','','6','','','在辛勤付出的同时，海普欧员工不仅收获了业内领先的技能、宝贵的团队经验和成就感，还在工作环境中培养了开放、信任、包容和尊重的良好品质。','/Comm/images/index_cc.jpg','1','4','','1','','/other/list-30/','/other/list-30/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('31','百芳岁企业简介','','6',',0,6','','7','','','百芳岁环保设备科技有限公司专业从事环保产品及技术开发，电力工程设计，环保工程、环保设施营运及技术服务等业务。公司具有环保工程专业承包叁级资质、环境污染治理设施运营资质、工程咨询丙级资格，并通过质量、职业健康安全、环境管理体系认证，是中国环保产业协会会员单位，诸城市环保产业重点骨干企业。 公司位于知名的四川省成都市。公司拥有一支学术领先、经验丰富和高度敬业的研发和工程技术人员队伍。公司坚持以高新技术服务于客户，以卓越的产品质量赢得用户的信赖。在公司快速发展的同时，受到业界和客户的广泛尊重...','','1','3','','1','','/other/list-31/','/other/list-31/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('32','手机banner','','6',',0,6','','8','','','','','1','3','','1','','/other/list-32/','/other/list-32/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('33','手机端首页公司简介','','6',',0,6','','9','','','','','1','3','','1','','/other/list-33/','/other/list-33/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('34','业务范围','Scope of business','0',',0','','6','','','','','1','1','','1','','/service/','/service/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('35','友情链接','','6',',0,6','','1','','','','','1','3','','1','','/other/list-35/','/other/list-35/','','0','0','','0');
--
-- 表的结构qm_msg
--

DROP TABLE IF EXISTS `qm_msg`;
CREATE TABLE `qm_msg` (
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
-- 转存表中的数据 qm_msg
--

--
-- 表的结构qm_msg2
--

DROP TABLE IF EXISTS `qm_msg2`;
CREATE TABLE `qm_msg2` (
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
-- 转存表中的数据 qm_msg2
--

