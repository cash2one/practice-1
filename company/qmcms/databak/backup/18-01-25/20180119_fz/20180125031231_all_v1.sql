--
-- MySQL database dump
-- Created by wifiguanjia class, Power By quanmei. 
-- http://www.wifiguanjia.com 
--
-- 主机: 127.0.0.1
-- 生成日期: 2018 年  01 月 25 日 03:12
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
INSERT INTO `qm_ad` VALUES('3','默认内页banner','/pub/qm/p/image/180122/094738_374.jpg','1920','220','','banner','','','1','0');
INSERT INTO `qm_ad` VALUES('4','首页通栏广告','/pub/qm/p/image/180123/035000_620.jpg','1920','302','','成都百芳岁环保技术有限公司','','','1','0');
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

INSERT INTO `qm_admin` VALUES('1','qmadmin','c5358a6db37949d725ae280082a99a4a','9','0','','','2018-01-25 11:09:21','118.113.137.21','749','01ebcab5bde4691766028d2998a1a7b6','','','','0','0','主站','','','','0');
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
INSERT INTO `qm_config` VALUES('4','cfg_description','网站描述','1','2','成都百芳岁环保技术有限公司专业从事一体化污水处理设备,生活污水处理设备,医院污水处理设备,地埋式污水处理设备，净水设备等设备的生产加工以及污水处理技术的研发和污水处理工程施工','1','0');
INSERT INTO `qm_config` VALUES('5','cfg_copyright','底部版权','1','2','成都百芳岁环保技术有限公司\r\nChengdu 100 years old Environmental Protection Technology Co., Ltd.\r\n地址：成都市成华区建材路299号隆鑫九熙广场\r\n手机：15828317119    13198530799','1','0');
INSERT INTO `qm_config` VALUES('6','cfg_name','网站名称','1','1','成都百芳岁环保技术有限公司','2','0');
INSERT INTO `qm_config` VALUES('7','cfg_head','Head前代码','1','2','','1','0');
INSERT INTO `qm_config` VALUES('8','cfg_body','Body前代码','1','2','','1','0');
INSERT INTO `qm_config` VALUES('9','cfg_copyright2','底部版权2','1','2','蜀ICP备xxxxxxx号','1','0');
INSERT INTO `qm_config` VALUES('10','cfg_f1','联系电话','1','1','15828317119    ','1','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_info
--

INSERT INTO `qm_info` VALUES('1','banner','','0','0','25',',0,6,25','','','','','','32','1','2018-01-19 09:43:26','/pub/qm/p/image/180123/050730_702.jpg','/pub/qm/p/image/180123/050730_702_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/1.html','0');
INSERT INTO `qm_info` VALUES('2','banner','','0','0','25',',0,6,25','','','','','','31','1','2018-01-19 09:43:35','/pub/qm/p/image/180123/021110_998.jpg','/pub/qm/p/image/180123/021110_998_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/2.html','0');
INSERT INTO `qm_info` VALUES('3','banner','','0','0','25',',0,6,25','','','','','','30','13','2018-01-19 09:43:45','/pub/qm/p/image/180123/050652_652.jpg','/pub/qm/p/image/180123/050652_652_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/3.html','0');
INSERT INTO `qm_info` VALUES('4','联系我们','','0','0','5',',0,5','','<p>\r\n	<strong><span style=\\\"font-size:18px;font-family:SimHei;\\\">成都百芳岁环保技术有限公司</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">联系地址：<span style=\\\"font-size:16px;line-height:24px;\\\">成都市成华区建材路299号隆鑫九熙广场</span></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;line-height:1.5;\\\"> 联系人：徐经理</span><span style=\\\"font-size:16px;line-height:1.5;\\\"></span><span style=\\\"font-size:16px;line-height:1.5;\\\"></span><span style=\\\"font-size:16px;line-height:24px;\\\">13198530799</span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;简经理15828317119</span> \r\n</p>','','','','1','55','2018-01-19 09:46:07','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/contact/4.html','0');
INSERT INTO `qm_info` VALUES('5','公司简介','','0','0','7',',0,1,7','','<p class=\\\"MsoNormal\\\" style=\\\"text-align:center;text-indent:24pt;\\\">\r\n	<span style=\\\"line-height:150%;font-family:宋体;font-size:12pt;\\\"></span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;text-indent:30pt;\\\">\r\n	<span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">成都百芳岁环保技术有限公司技术研发团队以及生产加工厂区组建于</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">2014</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">年</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">3</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">月，公司</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">2015</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">年</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">5</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">月年正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，最长的已有</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">12</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">年。公司拥有</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">16000</span><span style=\\\"text-align:left;text-indent:30pt;font-size:16px;\\\">平米污水处理设备生产加工基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备、场馆类污水处理设备以及市政污水处理厂工程施工等。）生产、销售、安装、售后于一体的全方位服务。</span><br>\r\n<span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; 百芳岁（百汸水）环保自成立以来，坚持“以科技保护环境，以技术创造品质、诚信守法、顾客满意”的经营理念，严格按照</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">ISO9001</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">：</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">2000</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">质量管理体系标准执行运作，不断创造出新的污水处理设备和高质量的污水处理工程施工项目，现产品行销西南西北和华中</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">10</span><span style=\\\"text-align:left;text-indent:24pt;font-size:16px;\\\">余个省、自治区、直辖市。</span><br>\r\n<span style=\\\"font-size:16px;line-height:1.5;text-indent:24pt;text-align:left;background-color:white;\\\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;我们没有强大的背景，也不必用过多的语言来修饰和夸耀自己，我们只有踏踏实实做事、认认真真做人。为企业以及组织、和个人顺利通过环评，为山更青、水更绿、天更蓝，为优美的人居环境贡献我们的一份力量！</span>\r\n</p>\r\n<br>\r\n<br>\r\n<p>\r\n	<br />\r\n</p>','','','','1','80','2018-01-19 09:54:42','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/about/us/5.html','0');
INSERT INTO `qm_info` VALUES('6','喷漆水处理设备发货记录','','0','0','4',',0,4','','<p>\r\n	（1）物理处理法 &nbsp; &nbsp; &nbsp; &nbsp;有分离法、过滤法、离心分离法等。喷涂污水的物理处理法，主要是用于去除悬浮物、胶状物等物质；而采用蒸发结晶和高磁分离法，主要是用于去除胶状物、悬浮物和可溶性盐类以及各种金属离子。若投加磁铁粉和凝聚剂，还能去除其他非金属杂质。\r\n</p>\r\n<p>\r\n	0\r\n</p>\r\n<p>\r\n	（2）化学处理法 &nbsp; &nbsp; &nbsp; &nbsp;有中和法、凝聚法、氧化还原法等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（3）物理化学法 &nbsp; &nbsp; &nbsp; &nbsp;用此法处理污水有离子交换、电渗析、反渗透、气浮分离、汽提、吹脱、吸附、萃取等方法。物理化学法主要用于分离污水中的溶解物质，回收有用的物质成分，使污水得到深度处理。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（4）生物处理法 &nbsp; &nbsp; &nbsp; &nbsp;也称生化法，是利用微生物群的新陈代谢过程，使污水中的复杂有机物氧化分解成二氧化碳、甲烷和水。生物法的种类很多，按生物法的基本类型可分为四大类，即自然氧化法、生物滤池氧化法、活性污泥法、厌氧发酵法。\r\n</p>','','','','2','10','2018-01-19 09:56:29','/Comm/images/20180116113854329.jpg','/Comm/images/20180116113854329_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/6.html','0');
INSERT INTO `qm_info` VALUES('7','山西游泳池生活污水处理设备发货记录','','0','0','4',',0,4','','<p>\r\n	前段时间山西某公司订购了一套游泳池生活污水处理设备，于2018年01月08日按时发货。经出厂检验，设备完全符合出厂要求。\r\n</p>','','','','1','6','2018-01-19 09:57:34','/Comm/images/20180108105941250.jpg','/Comm/images/20180108105941250_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/7.html','0');
INSERT INTO `qm_info` VALUES('8','山西矿井水处理设备现场案例','','0','0','21',',0,3,21','','<img src=\\\"/Comm/images/20180102083323897.jpg\\\" alt=\\\"\\\" width=\\\"700\\\" height=\\\"500\\\" title=\\\"\\\" align=\\\"\\\"></img>','','','','2','3','2018-01-19 10:00:00','/Comm/images/20180102083323897.jpg','/Comm/images/20180102083323897_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/8.html','0');
INSERT INTO `qm_info` VALUES('9','滨州养猪废水处理安装现场','','0','0','21',',0,3,21','','<img src=\\\"/pub/qm/p/image/180119/020537_280.jpg\\\" alt=\\\"\\\">','','','','1','7','2018-01-19 10:04:51','/pub/qm/p/image/180119/020537_280.jpg','/pub/qm/p/image/180119/020537_280_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/9.html','0');
INSERT INTO `qm_info` VALUES('10','地埋式一体化污水处理设备','','0','0','12',',0,2,12','','<p>\r\n	一、概述\r\n</p>\r\n<p>\r\n	随着经济和人口的增长，对大自然的污染愈来愈受到人类的重视，在总结国内外生活污水处理装置的运行经验的基础上，结合我公司自己的科研成果和工程实践，设计出一种可地埋设置的成套有机废水处理装置，其设备采用九十年代后期国内外先进工艺和生产制造技术，生产出以玻璃钢、不锈钢为主要原料的SPR型系列污水处理设备。其目的主要是使生活污水和与之类似的工业有机废水经该设备处理后达到用户要求的排放标准。该设备主要用于居住小区(含别墅小区)、高级宾馆、医院、综合办公楼和各类公共建筑的生活污水处理，经该设备处理的出水水质，达到国家排放标准。全套设备均可埋设于地下，故亦称\\\"地埋式生活污水处理设备\\\"。\r\n</p>\r\n<p>\r\n	本公司地埋式生活污水处理设备采用国际先进的生物处理工艺，集去除BOD5、COD、NH3-N于一身，具有技术性能稳定可靠，处理效果好，投资省，占地少，维护方便等优点。我公司也可根据客户要求同时配套中水回用设备。\r\n</p>\r\n<p>\r\n	二、产品特点\r\n</p>\r\n<p>\r\n	1、埋设于地表以下，设备上面的地表可作为绿化或其他用地，不需要建房及采暖、保温。\r\n</p>\r\n<p>\r\n	2、二级生物接触氧化处理工艺均采用推流式生物接触氧化，其处理效果优于完全混合式或二级串联完全混合式生物接触氧化池。并比活性污泥池体积小，对水质的适应性强，耐冲击负荷性能好，出水水质稳定，不会产生污泥膨胀。池中采用新型弹性立体填料，比表面积大，微生物易挂膜，脱膜，在同样有机物负荷条件下，对有机物去除率高，能提高空气中的氧在水中溶解度。\r\n</p>\r\n<p>\r\n	3、生化池采用生物接触氧化法，其填料的体积负荷比较低，微生物处于自身氧化阶断，产泥量少，仅需三个月（90天）以上排一次泥（用粪车抽吸或脱水成泥饼外运）。\r\n</p>\r\n<p>\r\n	4、该地埋式生活污水处理设备的除臭方式除采用常规高空排气，另配有土壤脱臭措施。\r\n</p>\r\n<p>\r\n	5、整个设备处理系统配有全自动电气控制系统和设备故障报警系统，运行安全可靠，平时一般不需要专人管理，只需适时地对设备进行维护和保养。\r\n</p>\r\n<p>\r\n	三、使用方法\r\n</p>\r\n<p>\r\n	能够处理生活系统综合性废水及其相类似的有机污水；\r\n</p>\r\n<p>\r\n	采用玻璃钢、不锈钢结构，具有耐腐蚀、抗老化等优良特性，使用寿命长达 50 年以上；\r\n</p>\r\n<p>\r\n	全套装置施工简单、操作容易，所有机械设备均为自动化控制，全部装置可设置于地表以下。\r\n</p>\r\n<p>\r\n	四、适用范围\r\n</p>\r\n<p>\r\n	1、宾馆、饭店、疗养院、医院；\r\n</p>\r\n<p>\r\n	2、住宅小区、村庄、集镇；\r\n</p>\r\n<p>\r\n	3、车站、飞机场、海港码头、船舶；\r\n</p>\r\n<p>\r\n	4、工厂、矿山、部队、旅游点、风景区；\r\n</p>\r\n<p>\r\n	5、与生活污水类似的各种工业有机废水。\r\n</p>','','','','1','3','2018-01-19 10:06:26','/pub/qm/p/image/180119/020827_109.jpg','/pub/qm/p/image/180119/020827_109_th.jpg','','','','0','1','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/product/list-12/10.html','0');
INSERT INTO `qm_info` VALUES('11','改善水体环境','','0','0','31',',0,6,31','','','','','','29','1','2018-01-19 10:24:26','/pub/qm/p/image/180122/135602_762.jpg','/pub/qm/p/image/180122/135602_762_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-31/11.html','0');
INSERT INTO `qm_info` VALUES('12','造就美丽世界','','0','0','31',',0,6,31','','企业文化','','','','28','3','2018-01-19 10:25:20','/pub/qm/p/image/180122/140110_769.jpg','/pub/qm/p/image/180122/140110_769_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-31/12.html','0');
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
INSERT INTO `qm_info` VALUES('23','污水处理设备标准化、规范化、，规模化生产，污水处理工程精细化。','','0','0','27',',0,6,27','','<p>\r\n	精心管理，精密组织，精确加工。\r\n</p>','','','','20','1','2018-01-19 10:43:06','/pub/qm/p/image/180122/100138_357.png','/pub/qm/p/image/180122/100138_357_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/23.html','0');
INSERT INTO `qm_info` VALUES('24','经验丰富的技术团队','','0','0','27',',0,6,27','','<p>\r\n	省内24小时到设备现场，省外72小时内到设备现场。\r\n</p>','','','','21','1','2018-01-19 10:44:27','/pub/qm/p/image/180122/100200_763.png','/pub/qm/p/image/180122/100200_763_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-27/24.html','0');
INSERT INTO `qm_info` VALUES('25','中国石油','','0','0','26',',0,6,26','','','','','','15','1','2018-01-19 10:46:07','/Comm/images/ho8.png','/Comm/images/ho8_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/25.html','0');
INSERT INTO `qm_info` VALUES('26','中粮集团','','0','0','26',',0,6,26','','','','','','14','1','2018-01-19 10:46:34','/Comm/images/ho1.png','/Comm/images/ho1_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/26.html','0');
INSERT INTO `qm_info` VALUES('27','维达纸业','','0','0','26',',0,6,26','','','','','','13','1','2018-01-19 10:46:46','/pub/qm/p/image/180124/031650_241.png','/pub/qm/p/image/180124/031650_241_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/27.html','0');
INSERT INTO `qm_info` VALUES('28','百事可乐','','0','0','26',',0,6,26','','','','','','12','1','2018-01-19 10:46:59','/Comm/images/ho3.png','/Comm/images/ho3_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/28.html','0');
INSERT INTO `qm_info` VALUES('29','中国中化','','0','0','26',',0,6,26','','','','','','11','1','2018-01-19 10:47:10','/Comm/images/ho4.png','/Comm/images/ho4_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/29.html','0');
INSERT INTO `qm_info` VALUES('30','英国石油','','0','0','26',',0,6,26','','','','','','10','1','2018-01-19 10:47:22','/Comm/images/ho5.png','/Comm/images/ho5_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/30.html','0');
INSERT INTO `qm_info` VALUES('31','美格机械','','0','0','26',',0,6,26','','','','','','9','1','2018-01-19 10:47:36','/Comm/images/ho6.png','/Comm/images/ho6_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/31.html','0');
INSERT INTO `qm_info` VALUES('32','联合利华','','0','0','26',',0,6,26','','','','','','8','5','2018-01-19 10:47:47','/Comm/images/ho7.png','/Comm/images/ho7_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-26/32.html','0');
INSERT INTO `qm_info` VALUES('33','banner1','','0','0','32',',0,6,32','','','','','','7','1','2018-01-19 10:51:03','/pub/qm/p/image/180122/073413_157.jpg','/pub/qm/p/image/180122/073413_157_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-32/33.html','0');
INSERT INTO `qm_info` VALUES('34','banner2','','0','0','32',',0,6,32','','','','','','6','5','2018-01-19 10:51:21','/pub/qm/p/image/180123/081902_610.jpg','/pub/qm/p/image/180123/081902_610_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-32/34.html','0');
INSERT INTO `qm_info` VALUES('35','手机首页公司简介','','0','0','33',',0,6,33','','<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\"><span style=\\\"color:#686868;font-family:\\\'microsoft yahei\\\';font-size:16px;line-height:22px;text-indent:32px;white-space:normal;background-color:#FFFFFF;\\\">成都百芳岁（百汸水）</span>环保技术有限公司技术研发团队以及生产加工厂区组建于</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">2014</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">3</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">月，公司</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">2015</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">5</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">月年正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，最长的已有</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">12</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年。公司拥有</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">16000</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">平米污水处理设备生产加工基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备、场馆类污水处理设备以及市政污水处理厂 &nbsp; &nbsp; &nbsp; 工程施工等。）生产、销售、安装、售后于一体的全方位服务。</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\"><br>\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\"> 百芳岁（百汸水）环保自成立以来，坚持“以科技保护环境，以技术创造品质、诚信守法、顾客满意”的经营理念，严格按照</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">ISO9001</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">：</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">2000</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">质量管理体系标准执行运作，不断创造出新的污水处理设备和高质量的污水处理工程施工项目，现产品行销西南西北和华中</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">10</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">余个省、自治区、直辖市。</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\"><br>\r\n</span>\r\n</p>\r\n<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';white-space:normal;line-height:1.5;text-indent:24pt;background-color:white;\\\"> 我们没有强大的背景，也不必用过多的语言来修饰和夸耀自己，我们只有踏踏实实做事、认认真真做人。为企业以及组织、和个人顺利通过环评，为山更青、水更绿、天更蓝，为优美的人居环境贡献我们的一份力量！</span>','','','','5','3','2018-01-19 10:52:31','/pub/qm/p/image/180123/085514_579.png','/pub/qm/p/image/180123/085514_579_th.png','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-33/35.html','0');
INSERT INTO `qm_info` VALUES('36','污水处理设备','','0','0','35',',0,6,35','','','','','','4','1','2018-01-19 17:13:32','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/36.html','0');
INSERT INTO `qm_info` VALUES('37','污水处理设备','','0','0','35',',0,6,35','','','','','','3','1','2018-01-19 17:13:55','','','http://www.sdhpo.com','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/37.html','0');
INSERT INTO `qm_info` VALUES('38','山东沼气发电机','','0','0','35',',0,6,35','','','','','','2','1','2018-01-19 17:14:13','','','http://www.fdjfs.cn','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/38.html','0');
INSERT INTO `qm_info` VALUES('39','带式压滤机','','0','0','35',',0,6,35','','','','','','1','5','2018-01-19 17:14:31','','','http://www.fdjfs.cn','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/39.html','0');
INSERT INTO `qm_info` VALUES('40','业务范围','','','0','34',',0,34','','生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备','','','','1','4','2018-01-23 17:19:53','','','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/service/40.html','0');
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

INSERT INTO `qm_lm` VALUES('1','关于百芳岁','','0',',0','','1','','','','','1','3','','1','','/about/','/about/','/pub/qm/p/image/180123/032705_647.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('2','产品中心','Products Center','0',',0','','2','','','','','1','2','','1','','/product/','/product/','/pub/qm/p/image/180123/034417_794.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('3','成功案例','Successful Cases','0',',0','','3','','','百芳岁环保技术团队一直致力于污水处理技术以及污水处理设备的研发，污水处理工程的施工。百芳岁环保产品在生活、医疗、工业等行业的案例，获得了行业标准认证，满足国家严格的污水排放要求。','','1','2','','1','','/case/','/case/','/pub/qm/p/image/180123/045254_646.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('4','新闻中心','News Center','0',',0','','4','','','','','1','1','','1','','/news/','/news/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('5','联系我们','','0',',0','','5','','','','','1','3','','1','','/contact/','/contact/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('6','其它','','0',',0','','7','','','','','1','3','','1','','/other/','/other/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('7','公司简介','','1',',0,1','','1','','','       成都百芳岁环保技术有限公司技术研发团队以及生产加工厂区组建于2014年3月，公司2015年5月年正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，最长的已有12年。公司拥有16000平米污水处理设备生产加工基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理','','1','3','','1','','/about/us/','/about/us/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('8','荣誉资质','','1',',0,1','','2','','','','','1','3','','0','','/about/honor/','/about/honor/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('9','组织机构','','1',',0,1','','3','','','','','1','3','','0','','/about/organization/','/about/organization/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('10','企业文化','','1',',0,1','','4','创新环保科技 服务绿色生活','','创新环保科技 服务绿色生活。以设计和工程为导，力争至2015年， 将南大环 保建设成为集咨询、研发、 设计、设备集成、 材料制造、工程、 服务及运营一体化发展的领 先型环保 企业，推动工业社会的绿色化；\r\n总体价值观\r\n创新 谦逊 团结 诚信 奋斗\r\n对股东的价值观-- 诚信 勤勉 沟通\r\n对客户的价值观-- 诚实信用 勇于创新 换位思考 推彼及此\r\n对员工的价值观-- 像家庭一样生活，像军队一样工作，像学校一样学习\r\n对协作方的价值观-- 坦诚沟通 精诚协作 收益共享\r\n对社会的价值观','/pub/qm/p/image/180123/094502_799.jpg','1','3','','0','','/about/culture/','/about/culture/','','0','0','','0');
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
INSERT INTO `qm_lm` VALUES('22','动画演示','','3',',0,3','','2','','','','','1','2','','0','','/case/list-22/','/case/list-22/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('23','设备视频','','3',',0,3','','3','','','','','1','2','','0','','/case/list-23/','/case/list-23/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('24','工艺流程','','3',',0,3','','4','','','','','1','2','','0','','/case/list-24/','/case/list-24/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('25','banner','','6',',0,6','','1','','','','','1','3','','1','','/other/list-25/','/other/list-25/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('26','首页客户','','6',',0,6','','2','','','','','1','3','','1','','/other/list-26/','/other/list-26/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('27','选择百芳岁环保的优势','Over the years, choose the advantage of us','6',',0,6','','3','','','为什么众多企业选择百芳岁(百汸水）环保技术公司','','1','3','','1','','/other/list-27/','/other/list-27/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('28','专业的处理方案','','6',',0,6','','4','','','公司自创建以来，一直坚持为客户提供投入最少，处理成本最低的有效的处理方案以及设备','','1','4','','1','','/other/list-28/','/other/list-28/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('29','我们的资质证书','Our Qualification Certificate','6',',0,6','','5','','','不仅是多一份资质，更多的是一份责任；\r\n我们不辜负每一个客户的信任和支持，并让我们的产品经的起考验。','','1','3','','1','','/other/list-29/','/other/list-29/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('30','企业目标','Truth and sincerity of Us','6',',0,6','','6','','','创新环保科技， 服务绿色生活，以设计和工程为导， 将百芳岁（百汸水）环保建设成为集咨询、研发、 设计、设备加工制造、工程施工、 服务及运营一体化发展的领先型环保企业，推动工业社会的绿色化\r\n\r\n','','1','4','','1','','/other/list-30/','/other/list-30/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('31','百芳岁企业简介','','6',',0,6','','7','','','成都百芳岁环保技术有限公司技术研发团队以及生产加工厂区组建于2014年3月，公司2015年5月年正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，最长的已有12年。公司拥有16000平米污水处理设备生产加工基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处','','1','3','','1','','/other/list-31/','/other/list-31/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('32','手机banner','','6',',0,6','','8','','','','','1','3','','1','','/other/list-32/','/other/list-32/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('33','手机端首页公司简介','','6',',0,6','','9','','','','','1','3','','1','','/other/list-33/','/other/list-33/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('34','业务范围','Scope of business','0',',0','','6','','','生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备','','1','1','','1','','/service/','/service/','','0','0','','0');
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

