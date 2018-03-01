--
-- MySQL database dump
-- Created by wifiguanjia class, Power By quanmei. 
-- http://www.wifiguanjia.com 
--
-- 主机: 127.0.0.1
-- 生成日期: 2018 年  01 月 26 日 08:25
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

INSERT INTO `qm_admin` VALUES('1','qmadmin','c5358a6db37949d725ae280082a99a4a','9','0','','','2018-01-26 16:01:17','110.184.220.84','753','01ebcab5bde4691766028d2998a1a7b6','','','','0','0','主站','','','','0');
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

INSERT INTO `qm_config` VALUES('1','cfg_webname','网站标题','1','1','','1','0');
INSERT INTO `qm_config` VALUES('2','cfg_keywords','关键字','1','1','成都百芳岁环保技术有限公司','1','0');
INSERT INTO `qm_config` VALUES('3','cfg_searchtitle','搜索关键字','1','1','','1','1');
INSERT INTO `qm_config` VALUES('4','cfg_description','网站描述','1','2','成都百芳岁环保技术有限公司专业从事一体化污水处理设备,生活污水处理设备,医院污水处理设备,地埋式污水处理设备，净水设备等设备的生产加工以及污水处理技术的研发和污水处理工程施工','1','0');
INSERT INTO `qm_config` VALUES('5','cfg_copyright','底部版权','1','2','成都百芳岁环保技术有限公司\r\nChengdu 100 years old Environmental Protection Technology Co., Ltd.\r\n地址：成都市成华区建材路299号隆鑫九熙广场\r\n手机：15828317119    13198530799','1','0');
INSERT INTO `qm_config` VALUES('6','cfg_name','网站名称','1','1','','2','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 qm_info
--

INSERT INTO `qm_info` VALUES('1','banner','','0','0','25',',0,6,25','','','','','','32','1','2018-01-19 09:43:26','/pub/qm/p/image/180123/050730_702.jpg','/pub/qm/p/image/180123/050730_702_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/1.html','0');
INSERT INTO `qm_info` VALUES('2','banner','','0','0','25',',0,6,25','','','','','','31','1','2018-01-19 09:43:35','/pub/qm/p/image/180123/021110_998.jpg','/pub/qm/p/image/180123/021110_998_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/2.html','0');
INSERT INTO `qm_info` VALUES('3','banner','','0','0','25',',0,6,25','','','','','','30','14','2018-01-19 09:43:45','/pub/qm/p/image/180123/050652_652.jpg','/pub/qm/p/image/180123/050652_652_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-25/3.html','0');
INSERT INTO `qm_info` VALUES('4','联系我们','','0','0','5',',0,5','','<p>\r\n	<strong><span style=\\\"font-size:18px;font-family:SimHei;\\\">成都百芳岁环保技术有限公司</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\">联系地址：</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\"><span style=\\\"font-size:16px;line-height:24px;\\\">成都市成华区建材路299号隆鑫九熙广场</span></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;line-height:1.5;\\\"> 联系人：</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;line-height:1.5;\\\">徐经理</span><span style=\\\"font-size:16px;line-height:1.5;\\\"></span><span style=\\\"font-size:16px;line-height:1.5;\\\"></span><span style=\\\"font-size:16px;line-height:24px;\\\">13198530799</span> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\"> 简经理15828317119</span> \r\n</p>','','','','1','71','2018-01-19 09:46:07','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','成都百芳岁环保技术有限公司','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/contact/4.html','0');
INSERT INTO `qm_info` VALUES('5','公司简介','','0','0','7',',0,1,7','','<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"text-indent:30pt;line-height:1.5;font-size:18px;\\\"><br>\r\n</span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\"> 成都百芳岁环保技术有限公司技术研发团队以及生产加工厂区组建于</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">2014</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">年</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">3</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\"><span style=\\\"font-size:16px;\\\">月</span><span style=\\\"font-size:16px;\\\">，</span><span style=\\\"font-size:16px;\\\">公司</span></span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">2015</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">年</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">5</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">月正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，有的已有</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">12</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">年行业经验。公司拥有大型</span><span style=\\\"text-indent:30pt;line-height:1.5;font-size:16px;\\\">污水处理设备生产基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备、场馆类污水处理设备以及市政污水处理厂工程施工等。）生产、销售、安装、售后于一体的全方位服务。</span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;background-color:white;\\\"> 百芳岁（百汸水）环保自成立以来，坚持“以科技保护环境，以技术创造品质、诚信守法、顾客满意”的经营理念，严格按照</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;\\\">ISO9001</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;background-color:white;\\\">：</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;\\\">2000</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;background-color:white;\\\">质量管理体系标准执行运作，不断创造出新的污水处理设备和高质量的污水处理工程施工项目。面对竞争激烈的市场，公司团队精心管理、紧密组织、广拓业务使公司有了更广阔的市场。现产品行销西南西北和华中</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;\\\">10</span><span style=\\\"text-indent:24pt;line-height:1.5;font-size:16px;background-color:white;\\\">余个省、自治区、直辖市。</span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:16px;line-height:1.5;text-indent:24pt;background-color:white;\\\"> 我们没有强大的背景，也不必用过多的语言来修饰和夸耀自己，我们只有踏踏实实做事、认认真真做人。为企业以及组织、和个人顺利通过环评，为山更青、水更绿、天更蓝，为优美的人居环境贡献我们的一份力量！</span> \r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;\\\">\r\n	<br />\r\n</p>\r\n<p class=\\\"MsoNormal\\\" style=\\\"text-align:justify;text-indent:24pt;background:white;\\\">\r\n	<span style=\\\"font-size:18px;\\\"> </span> \r\n</p>','','','','3','126','2018-01-19 09:54:42','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/about/us/5.html','0');
INSERT INTO `qm_info` VALUES('42','公司组织机构','','','0','9',',0,1,9','','<img src=\\\"/pub/qm/p/image/180125/062138_818.jpg\\\" alt=\\\"\\\">','','','','1','8','2018-01-25 14:14:18','/pub/qm/p/image/180125/062114_503.jpg','/pub/qm/p/image/180125/062114_503_th.jpg','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/about/organization/42.html','0');
INSERT INTO `qm_info` VALUES('6','喷漆水处理设备发货记录','','0','0','4',',0,4','','<p>\r\n	（1）物理处理法 &nbsp; &nbsp; &nbsp; &nbsp;有分离法、过滤法、离心分离法等。喷涂污水的物理处理法，主要是用于去除悬浮物、胶状物等物质；而采用蒸发结晶和高磁分离法，主要是用于去除胶状物、悬浮物和可溶性盐类以及各种金属离子。若投加磁铁粉和凝聚剂，还能去除其他非金属杂质。\r\n</p>\r\n<p>\r\n	0\r\n</p>\r\n<p>\r\n	（2）化学处理法 &nbsp; &nbsp; &nbsp; &nbsp;有中和法、凝聚法、氧化还原法等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（3）物理化学法 &nbsp; &nbsp; &nbsp; &nbsp;用此法处理污水有离子交换、电渗析、反渗透、气浮分离、汽提、吹脱、吸附、萃取等方法。物理化学法主要用于分离污水中的溶解物质，回收有用的物质成分，使污水得到深度处理。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	（4）生物处理法 &nbsp; &nbsp; &nbsp; &nbsp;也称生化法，是利用微生物群的新陈代谢过程，使污水中的复杂有机物氧化分解成二氧化碳、甲烷和水。生物法的种类很多，按生物法的基本类型可分为四大类，即自然氧化法、生物滤池氧化法、活性污泥法、厌氧发酵法。\r\n</p>','','','','2','10','2018-01-19 09:56:29','/Comm/images/20180116113854329.jpg','/Comm/images/20180116113854329_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/6.html','1');
INSERT INTO `qm_info` VALUES('7','省环保厅召开2018年全省环保工作会议','','0','0','4',',0,4','','<div style=\\\"text-align:left;\\\">\r\n	<span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:15px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\"> 一月24</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">日</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">，省环保厅召开</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">2018</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">年全省</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">环境保护</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">暨党风廉政建设工作会议</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">，</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">省环保厅党组书记、厅长于会文</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">出席会议并</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">作主题发言</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">，</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">副厅长彭勇</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">主持会议。</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">大会回顾总结</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">了</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">2017</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">年工作</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">，</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">分析研判</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">了</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">当前环境保护形势</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">，</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">安排部署</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">2018</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">年环境保护和党风廉政建设工作</span><span style=\\\"margin:0px;padding:0px;max-width:100%;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\">。</span> \r\n</div>\r\n<p style=\\\"text-align:justify;margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:15px;letter-spacing:2px;line-height:30px;white-space:normal;box-sizing:border-box !important;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-size:16px;\\\">会上，于会文作了“</span><span style=\\\"color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;white-space:normal;background-color:#FFFFFF;\\\">于会文作了“</span><span style=\\\"margin:0px;padding:0px;max-width:100%;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;white-space:normal;color:#333333;box-sizing:border-box !important;word-wrap:break-word !important;background-color:#FFFFFF;\\\"><strong style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\">坚决打好污染防治攻坚战奋力推动新时代环保工作再上新台阶</strong></span><span style=\\\"color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;letter-spacing:2px;line-height:30px;text-align:justify;white-space:normal;background-color:#FFFFFF;\\\">”</span><span style=\\\"font-size:16px;\\\">”的主题报告。报告提到，现阶段要抢抓机遇，乘势而为，以习近平新时代中国特色社会主义思想的生态文明观为指导，坚决打好污染防治攻坚战，着力解决突出环境问题，实现全省生态环境质量持续改善。</span>\r\n</p>\r\n<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:15px;letter-spacing:2px;text-align:justify;white-space:normal;box-sizing:border-box !important;background-color:#FFFFFF;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-align:justify;line-height:2em;margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;white-space:normal;box-sizing:border-box !important;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"margin:0px;padding:0px;max-width:100%;letter-spacing:2px;font-size:16px;box-sizing:border-box !important;word-wrap:break-word !important;\\\">报告显示，2017年，全省环保系统共同努力，克难攻坚，奋力拼搏，取得了环保督察各方满意、“三大战役”成效明显、服务发展能力不断提高、环境执法力度持续加码、环保宣传教育培训亮点纷呈、生态文明体制改革稳步推进、党建质量不断提升的好成绩。</span> \r\n</p>\r\n<p style=\\\"text-align:justify;margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;white-space:normal;box-sizing:border-box !important;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-size:15px;line-height:32px;\\\"> </span><span style=\\\"line-height:2em;font-size:16px;\\\">于会文对去年一年的工作予以肯定，但“凡是过去，皆为序章”，2018年要抢抓机遇、乘势而为，实现未达标城市PM2.5平均浓度较2015年下降12%，优良天数率达到82.6%，较2015年增加2.1个百分点，全省国考断面地表水水质优良(达到或优于Ⅲ类)比例达到79.3%，地表水劣V类水体比例控制在46%以内，确保全省土壤环境保持稳定、辐射环境质量保持良好。</span><span style=\\\"line-height:2;font-size:16px;text-align:center;\\\">于会文提出</span><span style=\\\"line-height:2;font-size:16px;text-align:center;\\\">2018年全省环保工作</span><span style=\\\"line-height:2;font-size:16px;text-align:center;\\\">要迈上新台阶</span><span style=\\\"line-height:2;font-size:16px;text-align:center;\\\">必须做到</span><span style=\\\"line-height:2;font-size:15px;text-align:center;margin:0px;padding:0px;max-width:100%;box-sizing:border-box;color:#333333;word-wrap:break-word !important;\\\"><strong style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">“五个坚持”和“三个支持”</span><span style=\\\"color:#697375;text-align:justify;font-size:16px;\\\">一是始终坚持处理好环境保护和经济发展的关系，二是始终坚持处理好条块结合以块为主的关系，三是始终坚持处理好治标与治本的关系，四是始终坚持处理好打好“手仗”和打赢“嘴仗”的关系，五是始终坚持处理好抓党建与抓业务的关系，</span></strong></span><span style=\\\"line-height:1.8;color:#697375;font-size:16px;text-align:justify;margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\">一是争取环保部的支持，二是争取省委省政府的支持，三是争取省直各部门、</span><span style=\\\"line-height:1.8;color:#697375;font-size:16px;text-align:justify;margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\">21</span><span style=\\\"line-height:1.8;color:#697375;font-size:16px;text-align:justify;margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\">个市（州）党委政府的支持。</span> \r\n</p>\r\n<section style=\\\"line-height:25.6px;margin:0px;padding:0px;max-width:100%;box-sizing:border-box;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;white-space:normal;word-wrap:break-word !important;background-color:#FFFFFF;\\\"><section class=\\\"\\\" powered-by=\\\"xiumi.us\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;font-size:15px;text-align:justify;line-height:2;letter-spacing:2px;\\\">\r\n<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;line-height:2em;box-sizing:border-box !important;\\\">\r\n	<span style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"></span>\r\n</p>\r\n<section style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;line-height:25.6px;white-space:normal;word-wrap:break-word !important;background-color:#FFFFFF;\\\"><section class=\\\"\\\" powered-by=\\\"xiumi.us\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;font-size:15px;text-align:justify;line-height:2;letter-spacing:2px;\\\">\r\n<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;box-sizing:border-box !important;\\\">\r\n	<br />\r\n</p>\r\n<section style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;color:#3E3E3E;font-family:\\\'Hiragino Sans GB\\\', \\\'Microsoft YaHei\\\', Arial, sans-serif;font-size:16px;line-height:25.6px;white-space:normal;word-wrap:break-word !important;background-color:#FFFFFF;\\\"><section class=\\\"\\\" powered-by=\\\"xiumi.us\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;\\\"><section class=\\\"\\\" style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box;word-wrap:break-word !important;font-size:15px;text-align:justify;line-height:2;letter-spacing:2px;\\\">\r\n<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;line-height:2em;box-sizing:border-box !important;\\\">\r\n	<span style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">此外，报告对2018年须着力抓好的重点工作进行了全面部署，重点涉及以下几点：</span><strong style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">一是</span></strong><span style=\\\"font-size:16px;\\\">强化环保责任落实，加强地方党委政府对环保督查工作的认识，落实督察问题整改方案。</span><strong style=\\\"margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">二是</span></strong><span style=\\\"font-size:16px;\\\">继续打好污染防治“三大战役”，以七大措施为主要抓手坚决打赢蓝天保卫战，继续把成都平原大气污染防治作为环保工作“一号工程”；以沱江、岷江为重中之重，强化督查、专项整治，打好碧水保卫战；做好人才梯队建设，组织实施好土壤污染防治“五大”行动，强化土壤风险管控，打好净土保卫战。</span></span><span style=\\\"line-height:2;font-size:16px;\\\">同时于会文强调，现在所做的绝大部分工作还是在“治标”阶段，治本还得靠调整产业结构、优化能源结构、改善城市结构、转变生产生活方式。因此，要坚持规划环评与项目环评联动，建立和完善地方环境标准体系，严守生态保护红线，强化环境准入倒逼，推动经济高质量发展。</span> \r\n</p>\r\n<p style=\\\"margin-top:0px;margin-bottom:0px;padding:0px;max-width:100%;clear:both;min-height:1em;box-sizing:border-box !important;\\\">\r\n	<span style=\\\"line-height:2;font-size:16px;\\\"> 报告中逐一分析了10项重点工作的问题和不足，细化了工作目标，并提出了具体措施。最后于会文补充了两点要求，</span><strong style=\\\"line-height:2;margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">一是</span></strong><span style=\\\"line-height:2;font-size:16px;\\\">对加强环境监管的体制保障、能力保障、制度保障、效能保障；</span><strong style=\\\"line-height:2;margin:0px;padding:0px;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\\\"><span style=\\\"font-size:16px;\\\">二是</span></strong><span style=\\\"line-height:2;font-size:16px;\\\">期望广大党员干部做到信念过硬、政治过硬、责任过硬、能力过硬、作风过硬。</span> \r\n</p>\r\n</section></section></section></section><br>\r\n<br>\r\n<p>\r\n	<br />\r\n</p>\r\n</section></section></section></section><br>\r\n<br>\r\n<p>\r\n	<br />\r\n</p>\r\n</section></section></section></section>\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	<br>\r\n</div>','','','','1','14','2018-01-19 09:57:34','/pub/qm/p/image/180125/085258_416.jpg','/pub/qm/p/image/180125/085258_416_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/news/7.html','0');
INSERT INTO `qm_info` VALUES('8','德阳勿忘花海污水处理','','0','0','21',',0,3,21','','<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong><span style=\\\"font-size:18px;\\\">德阳勿忘花海是一家集花海观赏、休闲娱乐的度假圣地，产生的生活污水直接排到河沟中，环评要求处理达到国家污水综合排放</span></strong><strong style=\\\"font-size:18px;line-height:27px;\\\"><span style=\\\"font-size:18px;\\\">一</span></strong><strong style=\\\"line-height:1.5;\\\"><span style=\\\"font-size:18px;\\\">级标准。</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\\\"font-size:18px;\\\">我公司采用（AO+MBR膜</span></strong><strong style=\\\"line-height:1.5;\\\"><span style=\\\"font-size:18px;\\\">+二氧化氯消毒工艺，前段预设调节池）一体化污水处理设备，经该设备处理后达到</span></strong><span style=\\\"font-size:16px;\\\"><strong><span style=\\\"font-size:18px;\\\">国家</span><strong><span style=\\\"font-size:18px;\\\">综合</span></strong><span style=\\\"font-size:18px;\\\">污水排放要求。</span></strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"white-space:normal;font-size:16px;\\\"><strong><br>\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<img src=\\\"/pub/qm/p/image/180125/043511_857.jpg\\\" alt=\\\"\\\"> \r\n</p>\r\n<p>\r\n	<img src=\\\"http://m1.keqxz.com/pub/qm/p/image/180125/043510_391.jpg\\\"> \r\n</p>\r\n<p>\r\n	<img src=\\\"/pub/qm/p/image/180125/043655_888.jpg\\\" alt=\\\"\\\"> \r\n</p>','','','','2','36','2018-01-19 10:00:00','/pub/qm/p/image/180125/050352_916.jpg','/pub/qm/p/image/180125/050352_916_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/8.html','0');
INSERT INTO `qm_info` VALUES('9','绵阳酸洗磷化污水处理','','0','0','21',',0,3,21','','<p>\r\n	<span style=\\\"font-size:16px;line-height:1.5;\\\">该厂污水特点是PH值严重偏低，磷含量达20000mg/L严重超标，经我公司采用搅拌池投加石灰，斜管沉淀器投加PAC絮凝沉淀除磷后PH值在6-9，磷含量0.5-2mg/L，达到国家三级排放标准，排放到城市污水处理管网。</span> \r\n</p>\r\n<p>\r\n	<img src=\\\"/pub/qm/p/image/180125/073536_617.jpg\\\" alt=\\\"\\\"> \r\n</p>\r\n<p>\r\n	<img src=\\\"/pub/qm/p/image/180125/073535_504.jpg\\\" alt=\\\"\\\"> \r\n</p>\r\n<p>\r\n	<img src=\\\"/pub/qm/p/image/180125/080606_776.jpg\\\" alt=\\\"\\\">\r\n</p>','','','','1','27','2018-01-19 10:04:51','/pub/qm/p/image/180125/081924_704.jpg','/pub/qm/p/image/180125/081924_704_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/case/list-21/9.html','0');
INSERT INTO `qm_info` VALUES('10','一体化污水处理设备','','0','0','12',',0,2,12','','<p>\r\n	<img alt=\\\"\\\" src=\\\"/pub/qm/p/image/180126/043531_699.jpg\\\"> \r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\"><strong><br>\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\"><strong><img alt=\\\"\\\" src=\\\"/pub/qm/p/image/180126/045428_500.png\\\"><br>\r\n</strong></span> \r\n</p>\r\n<span style=\\\"font-size:16px;\\\"><strong> \r\n<p>\r\n	&nbsp;\r\n</p>\r\n</strong>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n</span> \r\n<p>\r\n	<span style=\\\"color:#003399;\\\">产品概述：</span>\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	一体化污水处理设备是将一沉池、一二级接触氧化池、二沉池、污泥池集中一体的设备，并在I、II级接触氧化池中进行鼓风曝气，使接触氧化法和活性污泥法有效的结合起来，同时具备两者的优点，并克服两者的缺点，使污水处理水平进一步提高\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#003399;\\\">适用范围：</span>\r\n</p>\r\n<p>\r\n	<br>\r\n一体化污水处理设备适用于住宅小区、村庄、村镇、办公楼、商场、宾馆、饭店、疗养院、机关、学校、部队、医院、高速公路、铁路、工厂、矿山、旅游景区等生活污水和与之类似的屠宰、水产品加工、食品等中小型规模工业有机废水的处理和回用。经该设备处理的污水，水质达到国家污水处理综合排放标准一级B标准。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#003399;\\\">产品特点：</span>\r\n</p>\r\n<p>\r\n	1、抗冲击负荷的能力强。接触氧化法的平均停留时间在6小时以上；\r\n</p>\r\n<p>\r\n	2、具有脱氮除磷能力，并可以通过调节设备的构造，达到处理工业废水，生活污水，城市污水的能力；\r\n</p>\r\n<p>\r\n	3、接触氧化池内的填料多为组合软填料，质轻、高强、物理化学性质稳定，比表面积大，生物膜附着能力强，污水与生物膜的接触效率高；\r\n</p>\r\n<p>\r\n	4、接触氧化池内采用曝气器进行鼓风曝气，使纤维束不断漂动，曝气均匀，微生物生长成熟，具有活性污泥法的特征；\r\n</p>\r\n<p>\r\n	5、出水水质稳定，污泥产量少并易于处理；\r\n</p>\r\n<p>\r\n	6、潜水泵中可设于设备之中，减少工程投资；\r\n</p>\r\n<p>\r\n	7、设备可设于地面上，也可埋于地下。埋于地下时，上部覆上可用于绿化，厂区占地面积少，地面构筑物少；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong><span style=\\\"font-family:NSimsun;font-size:small;\\\"></span></strong> \r\n</p>\r\n<div>\r\n	<br>\r\n</div>\r\n<p>\r\n	<br />\r\n</p>','','','','6','26','2018-01-19 10:06:26','/pub/qm/p/image/180126/043531_699.jpg','/pub/qm/p/image/180126/043531_699_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/product/list-12/10.html','0');
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
INSERT INTO `qm_info` VALUES('35','手机首页公司简介','','0','0','33',',0,6,33','','<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\"><span style=\\\"color:#686868;font-family:\\\'microsoft yahei\\\';font-size:16px;line-height:22px;text-indent:32px;white-space:normal;background-color:#FFFFFF;\\\">成都百芳岁（百汸水）</span>环保技术有限公司技术研发团队以及生产加工厂区组建于</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">2014</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">3</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">月，公司</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">2015</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">5</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">月年正式取得国家工商部门颁发的营业执照。公司自组建之日起就在环保行业高薪聘请了多名拥有数年污水处理以及环保工程设计施工经验的工程师，最长的已有</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">12</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">年。公司拥有</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">16000</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\">平米污水处理设备生产加工基地，提供（生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备、场馆类污水处理设备以及市政污水处理厂       工程施工等。）生产、销售、安装、售后于一体的全方位服务。</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;text-indent:30pt;white-space:normal;background-color:#FFFFFF;\\\"><br>\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\"> 百芳岁（百汸水）环保自成立以来，坚持“以科技保护环境，以技术创造品质、诚信守法、顾客满意”的经营理念，严格按照</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">ISO9001</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">：</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">2000</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">质量管理体系标准执行运作，不断创造出新的污水处理设备和高质量的污水处理工程施工项目，现产品行销西南西北和华中</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">10</span><span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\">余个省、自治区、直辖市。</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';line-height:22px;white-space:normal;text-indent:24pt;background-color:#FFFFFF;\\\"><br>\r\n</span>\r\n</p>\r\n<span style=\\\"margin:0px;padding:0px;font-size:16px;color:#686868;font-family:\\\'microsoft yahei\\\';white-space:normal;line-height:1.5;text-indent:24pt;background-color:white;\\\"> 我们没有强大的背景，也不必用过多的语言来修饰和夸耀自己，我们只有踏踏实实做事、认认真真做人。为企业以及组织、和个人顺利通过环评，为山更青、水更绿、天更蓝，为优美的人居环境贡献我们的一份力量！</span>','','','','5','3','2018-01-19 10:52:31','/pub/qm/p/image/180125/091409_988.jpg','/pub/qm/p/image/180125/091409_988_th.jpg','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-33/35.html','0');
INSERT INTO `qm_info` VALUES('36','污水处理设备','','0','0','35',',0,6,35','','','','','','4','1','2018-01-19 17:13:32','','','','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/36.html','0');
INSERT INTO `qm_info` VALUES('37','污水处理设备','','0','0','35',',0,6,35','','','','','','3','1','2018-01-19 17:13:55','','','http://www.sdhpo.com','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/37.html','0');
INSERT INTO `qm_info` VALUES('38','四川环保厅','','0','0','35',',0,6,35','','','','','','2','1','2018-01-19 17:14:13','','','http://www.schj.gov.cn/','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/38.html','0');
INSERT INTO `qm_info` VALUES('39','带式压滤机','','0','0','35',',0,6,35','','','','','','1','5','2018-01-19 17:14:31','','','http://www.fdjfs.cn','','','0','','0','1','1','0','0000-00-00 00:00:00','','','','','','','','','百芳岁环保','admin','0.0','0.0','0','0','0','0','0','','','','','','0000-00-00','0','/other/list-35/39.html','0');
INSERT INTO `qm_info` VALUES('40','业务范围','','','0','34',',0,34','','生活污水处理设备、新农村污水处理设备、化工污水处理设备、酒厂污水处理设备、医疗污水处理设备、印染污水处理设备、砂石场污水处理设备、洗涤污水处理设备、酸洗磷化污水处理设备、含油污水处理设备、煤矿污水处理设备、餐具清洗消毒污水处理设备、机械加工污水处理设备、养殖污水处理设备、磷化污水处理设备、高速公路服务区污水处理设备、旅游风景区污水处理设备、公园园林污水处理设备、机场铁路污水处理设备','','','','1','4','2018-01-23 17:19:53','','','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/service/40.html','0');
INSERT INTO `qm_info` VALUES('41','企业文化','','','0','10',',0,1,10','','<p style=\\\"text-align:justify;\\\">\r\n	<strong><span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\">创新环保科技 服务绿色生活</span></strong>\r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\">以研发设计和工程施工为向导，力争在十三五期间将我公司建设成为集环保技术咨询、研发、 设计、设备加工制造、 材料配件销售、工程施工、 服务运营为一体发展的领先型环保企业，推动工业社会的绿色化；</span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<strong style=\\\"font-family:SimSun;font-size:18px;line-height:1.5;\\\"><span style=\\\"color:#333333;font-size:18px;\\\"><br>\r\n</span></strong> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<strong style=\\\"font-family:SimSun;font-size:18px;line-height:1.5;\\\"><span style=\\\"color:#333333;font-size:18px;\\\">总体价值观</span></strong> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\">创新、谦逊、团结、诚信、奋斗</span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\">对股东的价值观-- 诚信、勤勉、沟通</span></span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\">对协作方的价值观-- 坦诚沟通、精诚协作、收益共享</span></span></span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-size:18px;font-family:SimSun;color:#333333;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:27px;white-space:normal;\\\">对员工的价值观-- 像家庭一样生活，像军队一样工作</span></span></span></span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"color:#333333;font-family:SimSun;font-size:18px;line-height:1.5;\\\">对客户的价值观-- 诚实信用、勇于创新、换位思考、推彼及此</span> \r\n</p>\r\n<p style=\\\"text-align:justify;\\\">\r\n	<span style=\\\"font-family:SimSun;font-size:18px;color:#333333;line-height:40px;background-color:#FFFFFF;\\\">对社会的价值观-- 创新环保及相关技术，为世界的清洁化提供支持；</span><span style=\\\"font-family:SimSun;font-size:18px;color:#333333;line-height:40px;background-color:#FFFFFF;\\\">树立良好的企业形象，积极投入环保事业中，做促进社会绿色发展的优秀企业。</span> \r\n</p>\r\n<span style=\\\"font-size:18px;\\\"></span>','','','','2','23','2018-01-25 13:06:35','','','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/about/culture/41.html','0');
INSERT INTO `qm_info` VALUES('43','地埋式污水处理设备','','','0','2',',0,2','','<p>\r\n	<img src=\\\"/pub/qm/p/image/180126/054010_132.jpg\\\" alt=\\\"\\\">\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\"><strong>产品概述</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\">地埋式污水处理设备采用国际先进的生物处理工艺，集去除</span><span style=\\\"color:#333333;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;font-family:SimSun;background-color:#FFFFFF;\\\">BOD5</span><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\">、</span><span style=\\\"color:#333333;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;font-family:SimSun;background-color:#FFFFFF;\\\">COD</span><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\">、</span><span style=\\\"color:#333333;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;font-family:SimSun;background-color:#FFFFFF;\\\">NH3-N</span><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\">于一身，具有技术性能稳定可靠，处理效果好，投资省，占地少，维护方便等优点。设备埋设于地表以下，设备上面的地表可作为绿化或其它用地，不需要建房及采暖、保温。地埋式污水处理设备配套全自动电器控制系统及设备损坏报警系统，设备可靠性好，因此平时无需专人管理，只需定期进行维护和保养。</span><br>\r\n</br>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\"><strong>适用范围</strong></span></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:宋体;font-size:14px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\">适用于住宅小区、医院疗养院、办公楼、商场、宾馆、饭店、机关、学校、部队、&nbsp;水产加工厂、牲蓄加工厂、乳品加工厂等生活污水和与之类似的工业有机废水，如纺织、啤酒、造纸、制革、食品、化工等行业的有机污水处理，主要目的是将生活污水和与之相类似的工业有机废水处理后达到回用水质要求，使废水处理后资源化利用。</span><br>\r\n</br>\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\"><span style=\\\"color:#333333;font-family:SimSun;font-size:16px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\"><strong>工艺流程</strong></span></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-family:宋体;font-size:14px;line-height:24px;text-indent:28px;white-space:normal;margin:0px;padding:0px;background-color:#FFFFFF;\\\"><span style=\\\"color:#333333;font-family:宋体;font-size:14px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\"><img src=\\\"/pub/qm/p/image/180126/055159_750.jpg\\\" alt=\\\"\\\"><br>\r\n</span></span>\r\n</p>\r\n<p>\r\n	<div class=\\\"met_clear\\\" style=\\\"clear:both;color:#333333;font-family:\\\'Microsoft YaHei\\\', Tahoma, Verdana, Simsun;font-size:14px;line-height:22.4px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	</div>\r\n	<ol class=\\\"met_nav\\\" style=\\\"margin:30px 0px;padding:0px;height:45px;line-height:45px;border:1px solid #DDDDDD;color:#333333;font-family:\\\'Microsoft YaHei\\\', Tahoma, Verdana, Simsun;font-size:14px;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<li class=\\\"met_now\\\" style=\\\"list-style:none;margin:0px;padding:0px;float:left;border-right-width:1px;border-right-style:solid;border-right-color:#DDDDDD;cursor:pointer;background:#F7F8FA;\\\">\r\n		</li>\r\n	</ol>\r\n<br>\r\n</br>\r\n</p>','','','','5','5','2018-01-26 13:27:35','/pub/qm/p/image/180126/054010_132.jpg','/pub/qm/p/image/180126/054010_132_th.jpg','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/product/43.html','0');
INSERT INTO `qm_info` VALUES('44','溶气气浮机','','','0','15',',0,2,15','','<table class=\\\"text2 ke-zeroborder\\\" border=\\\"0\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\" width=\\\"98%\\\" align=\\\"center\\\" height=\\\"145\\\" style=\\\"font-family:微软雅黑;\\\">\r\n	<tbody>\r\n		<tr>\r\n			<td valign=\\\"top\\\" align=\\\"middle\\\" style=\\\"font-size:14px;line-height:23.8px;word-break:normal;\\\">\r\n				<span style=\\\"font-size:16px;\\\"> </span> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\\\"18\\\" style=\\\"line-height:25px;word-break:normal;\\\">\r\n				<p style=\\\"font-size:14px;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;font-stretch:normal;font-family:微软雅黑;color:#444444;line-height:22px;\\\">\r\n					<strong><span style=\\\"font-size:16px;\\\"><img src=\\\"/pub/qm/p/image/180126/063603_569.png\\\" alt=\\\"\\\"><br>\r\n</span></strong> \r\n				</p>\r\n				<p style=\\\"font-size:14px;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;font-stretch:normal;font-family:微软雅黑;color:#444444;line-height:22px;\\\">\r\n					<br />\r\n				</p>\r\n				<p style=\\\"padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;font-stretch:normal;font-family:微软雅黑;color:#444444;line-height:22px;\\\">\r\n					<strong style=\\\"font-size:14px;\\\"><span style=\\\"font-size:16px;\\\">结构和原理 </span></strong> \r\n				</p>\r\n				<p style=\\\"padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;font-stretch:normal;font-family:微软雅黑;color:#444444;line-height:22px;\\\">\r\n					<span style=\\\"font-size:16px;\\\">BFSF系列溶气气浮污水处理机为钢制结构，其工作原理是：由空气压缩机送到空气罐中的空气通过射流装置被带入溶气罐，在0.35Mpa压力下被强制溶解在水中，形成溶气水，送到气浮槽中。在突然释放的情况下，溶解在水中的空气析出，形成大量的微气泡群，同泵送过来的并经加药后正在絮凝的污水中的悬浮物充分接触，并在缓慢上升过程中吸附在絮集好的悬浮物中，使其密度下降而浮至水面，达到去除SS和CODcr的目的。 </span><br>\r\n<span style=\\\"font-size:16px;\\\">溶气气浮污水处理机结构主要由以下几部分组成： </span><br>\r\n<strong style=\\\"font-size:14px;\\\"><span style=\\\"font-size:16px;\\\">1、 气浮槽： </span></strong><br>\r\n<span style=\\\"font-size:16px;\\\">圆形钢制结构，是污水处理机的主体和核心，内部由释放器、均布器、污水管、出水管、污泥槽、刮泥板系统等组成。释放器置于气浮机中央位置，是生产微气泡的关键部件。溶气罐来的溶液气水在这里与废水充分混合，突然释放，产生剧烈搅动和涡流，形成直径约为20－80um的微气泡，从而黏附于水中的絮凝体上升，清水彻底分离出来。均布器呈锥形结构，连接于释放器上，主要作用是将分离出来的清水和污泥均布散布于罐体中。出水管均布于罐体下部，并通过一根直立主管连接到罐的上部溢出，溢出口设有水位调节手柄，便于调节罐内水位。污泥管安装于罐体底部，用于排出沉积于罐底的沉积物，罐体上部设有污泥槽，槽上有刮板，刮板不断转动，连续将上浮的污泥刮到污泥槽内，自流至污泥池里。 </span><br>\r\n<strong style=\\\"font-size:14px;\\\"><span style=\\\"font-size:16px;\\\">2、溶气系统： </span></strong><br>\r\n<span style=\\\"font-size:16px;\\\">溶气系统主要有溶气罐、储气罐、空气压缩机、高压泵组成，溶气罐是系统中最关键的部分，其作用就是实现和空气的充分接触，加速空气溶解。它是一个密闭耐压钢罐，内部设计有挡板、隔套，可以加速空气和水体的扩散、传质过程，提高溶气效率。 </span><br>\r\n<strong style=\\\"font-size:14px;\\\"><span style=\\\"font-size:16px;\\\">3、药剂罐： </span></strong><br>\r\n<span style=\\\"font-size:16px;\\\">用于溶解存储药液，其中两个为溶解罐，带有搅拌装置，另外两个为药剂储存罐，体积随处理能力大小而配套。</span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','','','','4','8','2018-01-26 14:09:31','/pub/qm/p/image/180126/063603_569.png','/pub/qm/p/image/180126/063603_569_th.png','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/product/list-15/44.html','0');
INSERT INTO `qm_info` VALUES('45','斜管沉淀器','','','0','2',',0,2','','<p>\r\n	<img src=\\\"/pub/qm/p/image/180126/070824_391.png\\\" alt=\\\"\\\">\r\n</p>\r\n<p>\r\n	<span style=\\\"font-size:16px;\\\"><strong>产品概述</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:14px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:22pt;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:12pt;line-height:1.5;color:#000000;word-spacing:0px;\\\"><span data-mce-style=\\\"font-size: 12.0pt;\\\" style=\\\"font-size:16px;\\\">BFSS-I型斜管沉淀池，是在泥渣悬浮层上方安装倾角60度的斜管组建而成，使原水中的悬浮物ss，固体物或经投加混凝剂后形成的絮体矾花，</span><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:16px;line-height:1.5;\\\">在斜管底侧表面积聚成薄泥层，</span><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:16px;line-height:1.5;\\\">依靠重力作用滑回泥渣悬浮层，继而沉入集泥斗，</span><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:16px;line-height:1.5;\\\">由排泥管排入污泥池另行处理或综合利用，</span><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:16px;line-height:1.5;\\\">上清液逐渐上升至三角溢流堰排出，</span><span style=\\\"font-size:16px;\\\">可直接排放或回用。</span></span></span></span></span><span style=\\\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:16px;line-height:24px;text-indent:2em;font-weight:inherit;background-color:#FFFFFF;\\\">根据其相互运动方向分为逆（异）向流、同向流和侧向流三种不同分离方式。每两块平行斜板间（或平行管内）相当于一个很浅的沉淀池。</span>\r\n</p>\r\n<p>\r\n	<span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:14px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:22pt;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:12pt;line-height:1.5;color:#000000;word-spacing:0px;\\\"><span style=\\\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<div class=\\\"para\\\" label-module=\\\"para\\\" style=\\\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<span style=\\\"font-size:16px;\\\">其优点是：</span>\r\n	</div>\r\n	<div class=\\\"para\\\" label-module=\\\"para\\\" style=\\\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<span style=\\\"font-size:16px;\\\">①利用了层流原理，提高了沉淀池的处理能力；</span>\r\n	</div>\r\n</span></span></span></span></span>\r\n</p>\r\n<div>\r\n	<span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:14px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:22pt;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:12pt;line-height:1.5;color:#000000;word-spacing:0px;\\\"><span style=\\\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;line-height:24px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<div class=\\\"para\\\" label-module=\\\"para\\\" style=\\\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<span style=\\\"font-size:16px;\\\">②缩短了颗粒沉降距离，从而缩短了沉淀时间；</span>\r\n	</div>\r\n	<p style=\\\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<span style=\\\"font-size:16px;\\\">③增加了沉淀池的沉淀面积，从而提高了处理效率。</span>\r\n	</p>\r\n	<p style=\\\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\\\">\r\n		<span style=\\\"text-indent:2em;font-weight:inherit;font-size:16px;\\\">沉淀池的过流率可达36m3/（m2.h）,比一般沉淀池的处理能力高出7-10倍，是一种新型高效沉淀设备。并已定型用于生产实践。</span><span style=\\\"text-indent:2em;font-weight:inherit;font-size:16px;\\\">去除率高，停留时间短，占地面积小。浅池理论原理</span><span style=\\\"text-indent:2em;font-weight:inherit;font-size:16px;\\\">设斜管沉淀池池长为L，池中水平流速为V，颗粒沉速为u0，在理想状态下，L/H=V/ u0。可见L与V值不变时，池深H越浅，可被去除的悬浮物颗粒越小。若用水平隔板，将H分成3层，每层层深为H/3，在u0与v不变的条件下，只需L/3，就可以将u0的颗粒去除。也即总容积可减少到原来的1/3。如果池长不变，由于池深为H/3，则水平流速可增加到3v，仍能将沉速为u0的颗粒除去，也即处理能力提高3倍。同时将沉淀池分成n层就可以把处理能力提高n倍。这就是20世纪初，哈真（Hazen）提出的浅池理论。</span><span style=\\\"line-height:1.5;text-indent:2em;font-weight:inherit;color:#000000;font-size:16px;font-family:simsun;\\\"></span>\r\n	</p>\r\n</span></span></span></span></span>\r\n</div>\r\n<p>\r\n	<span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:16px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:16px;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;font-size:16px;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:16px;line-height:1.5;color:#000000;word-spacing:0px;\\\"><strong>适用范围</strong></span></span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:14px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:22pt;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:12pt;line-height:1.5;color:#000000;word-spacing:0px;\\\"><span style=\\\"font-weight:inherit;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span style=\\\"color:#ff0000;font-size:x-small;\\\"><span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">斜管沉淀池既可以作为气浮法，升化法等水工艺的配套设备，也可以单级处理多种污水。</span><br style=\\\"font-stretch:normal;font-size:12px;line-height:18px;font-family:Verdana, Arial, Helvetica, sans-seri;color:#000000;word-spacing:0px;\\\">\r\n<span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">（1）电镀废水中含多种金属离子的混合废水、铭、铜、铁、锌、镍等去除率均在90%以上，一般电镀废水经处理后均可达到排放标准。</span><br style=\\\"font-stretch:normal;font-size:12px;line-height:18px;font-family:Verdana, Arial, Helvetica, sans-seri;color:#000000;word-spacing:0px;\\\">\r\n<span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">（2）煤矿、选矿废水可使浊度在500-1500 mg/L降至50 mg/L。</span></span></span></span></span></span></span><span style=\\\"font-weight:inherit;color:#333333;font-family:simsun;font-size:14px;line-height:25px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span data-mce-style=\\\"font-size: 22.0pt;\\\" style=\\\"font-size:22pt;\\\"><span data-mce-style=\\\"color: #ff0000;\\\" style=\\\"color:#FF0000;\\\"><span data-mce-style=\\\"font-size: 12.0pt; line-height: 1.5;\\\" style=\\\"font-stretch:normal;font-size:12pt;line-height:1.5;color:#000000;word-spacing:0px;\\\"><span style=\\\"font-weight:inherit;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;word-spacing:10px;background-color:#FFFFFF;\\\"><span style=\\\"color:#ff0000;font-size:x-small;\\\"><span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">（3）印染、漂染等废水色度去除率70-90%，COD去除50-70%</span><br style=\\\"font-stretch:normal;font-size:12px;line-height:18px;font-family:Verdana, Arial, Helvetica, sans-seri;color:#000000;word-spacing:0px;\\\">\r\n<span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">（4）制革、食品等行业废水大量有机质的去除，COD去除率50-80%，杂质固体去除率90%以上。</span><br style=\\\"font-stretch:normal;font-size:12px;line-height:18px;font-family:Verdana, Arial, Helvetica, sans-seri;color:#000000;word-spacing:0px;\\\">\r\n<span data-mce-style=\\\"font-family: simsun; font-size: 12.0pt;\\\" style=\\\"font-family:simsun;color:#000000;font-size:16px;word-spacing:0px;\\\">（5）化工废水的COD去除率60-70%，色度去除60-90%，悬浮物达排放标准。</span></span></span><br>\r\n</br>\r\n</span></span></span></span>\r\n</p>','','','','3','2','2018-01-26 15:05:11','/pub/qm/p/image/180126/070824_391.png','/pub/qm/p/image/180126/070824_391_th.png','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/product/45.html','0');
INSERT INTO `qm_info` VALUES('46','MBR膜污水处理设备','','','0','2',',0,2','','<p style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<b><span style=\\\"font-family:宋体;font-size:16px;color:#000000;background-color:#FFFFFF;\\\"><span style=\\\"color:#000000;font-size:16px;background-color:#FFFFFF;\\\"><img src=\\\"/pub/qm/p/image/180126/074234_972.jpg\\\" alt=\\\"\\\"><br>\r\n</span></span></b>\r\n</p>\r\n<p style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<b><span style=\\\"font-family:宋体;font-size:16px;color:#000000;background-color:#FFFFFF;\\\"><span style=\\\"color:#000000;font-size:16px;background-color:#FFFFFF;\\\">设备简介</span></span></b>\r\n</p>\r\n<p style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">&nbsp; MBR一体化污水处理设备是以污水的达标排放和资源化回收利用为目的，针对中、低浓度分散式有机污水处理的集成技术设备。</span>\r\n</p>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">&nbsp; MBR一体化污水处理设备设备采用国际先进的生物处理工艺，集去除BOD5，COD，NH3-N于一身，具有技术性能稳定可靠，处理效果好，投资省，占地少，维护方便等优点。</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">工作原理</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">&nbsp; MBR一体化污水处理设备是膜分离技术与生物技术有机结合的新型废水处理技术。它利用膜分离设备将生化反应池中的活性污泥和大分子有机物质截留住，省掉二沉池。活性污泥浓度因此大大提高，水力停留时间和污泥停留时间可以分别控制，而难降解的物质在反应器中不断反应、降解。</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<b><span style=\\\"font-family:宋体;font-size:16px;color:#000000;\\\"><span style=\\\"color:#000000;font-size:16px;\\\">设备特点</span></span></b>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（1）紧凑，体积小，占地面积小，地埋式结构，可移动，便于绿化且无蚊蝇滋生；</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（2）有机污染物去除率高，出水水质稳定；</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（3）操作简单，施工方便，无需特殊维护，设备自我保护性好；</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（4）处理水质好，达到排放标准要求；</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（5）一体化设备可根据原水水质进行灵活配置，使该设备具有广泛的适用性。 &nbsp;</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（6）益生菌是高效微生物菌种，针对特殊污水，本公司可提供专用益生菌快速有效地使出水水质达标。</span>\r\n</div>\r\n<div style=\\\"margin:0px;padding:0px 5px;color:#333333;font-family:微软雅黑;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\\\">\r\n	<span style=\\\"font-family:宋体;font-size:16px;\\\">（7）整个设备处理系统配有全自动电气控制系统和设备故障报警系统，运行安全可靠，平时一般不需要专人管理，只需适时地对设备进行维护和保养。</span>\r\n</div>','','','','2','2','2018-01-26 15:28:34','/pub/qm/p/image/180126/074234_972.jpg','/pub/qm/p/image/180126/074234_972_th.jpg','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/product/46.html','0');
INSERT INTO `qm_info` VALUES('47','二氧化氯消毒器','','','0','16',',0,2,16','','<p>\r\n	<img alt=\\\"\\\" src=\\\"/pub/qm/p/image/180126/075112_224.jpg\\\"> \r\n</p>\r\n<br>\r\n<p>\r\n	<span style=\\\"color:#333333;font-size:16px;\\\"><strong>设备简介：</strong></span> <br>\r\n<span style=\\\"font-size:14px;\\\"> 二氧化氯发生器是一种集化学反应、精密计量、精确电子控制、闭环电子监视系统为一体的精密可靠的高科技产品，整个系统主要由精密计量泵、反应器及流量监视系统组成，采用整机集成为一体的集成安装方式，因此结构紧凑，安装方便，性能可靠，维护容易。广泛应用于钦用水、医院污水、城市污水、工业循环水、化工环保废水、水产养殖、纸浆生产、家禽宰杀、室内空气、啤酒制造、食品加工、泳池水循环、器具洗涤等众多领域的杀菌、消毒、灭藻、剥泥、漂白、脱色、除臭、氧化、防腐、保鲜、抗霉、破氰、破酚等。使用二氧化氯消毒剂杀菌有以下优点： A、快速持久B、安全无毒C、广谱高效D、无二次污染E、不受PH值影响 </span><br>\r\n<span style=\\\"color:#333333;font-size:14px;\\\"> <strong><span style=\\\"font-size:16px;\\\"><br>\r\n</span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#333333;font-size:14px;\\\"><strong><span style=\\\"font-size:16px;\\\">二氧化氯发生器的应用范围：</span></strong></span><br>\r\n<span style=\\\"font-size:14px;\\\"> 1、各种场合下的生活、饮用、自来水的消毒； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 2、餐厅、宾馆、家庭、餐具卫生设施的灭菌消毒和空气环境消毒等。 </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 3、食品、饮料厂、发酵工业的设备、管道、容器的最终灭菌消毒。 </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 4、乳品厂、屠宰场的管道、设施及环境的灭菌处理； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 5、医院污水的灭菌消毒处理； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 6、游泳池、工业循环水、浴池水的灭菌消毒； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 7、医院、卫生、临床器械的消毒、灭菌、除臭的防霉处理； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 8、家庭、宾馆、饭店、水果蔬菜、鱼肉等食品的保鲜及最终淋洗消毒； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 9、配置各种口腔消毒液、除臭剂及创口清洗液等。 </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 10、废水回用中的灭菌及脱臭； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 11、面粉与各种食品的漂白剂； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 12、造纸、印染行业的漂白药剂； </span><br>\r\n<span style=\\\"font-size:14px;\\\"> 13、电镀含氰废水的破氰处理、印染废水的脱色处理，工业徨冷却水的除藻灭菌处理。</span> \r\n</p>','','','','1','16','2018-01-26 15:45:35','/pub/qm/p/image/180126/075112_224.jpg','/pub/qm/p/image/180126/075112_224_th.jpg','','','','0','','0','1','1','0','','','','','','','','','','百芳岁环保','admin','','0.0','0','0','0','0','0','','','','','','','0','/product/list-16/47.html','0');
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

INSERT INTO `qm_lm` VALUES('1','关于百芳岁','','0',',0','','1','','','','/pub/qm/p/image/180125/070310_195.jpg','1','3','','1','','/about/','/about/','/pub/qm/p/image/180123/032705_647.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('2','产品中心','Products Center','0',',0','','2','','','','/pub/qm/p/image/180125/065400_557.jpg','1','2','','1','','/product/','/product/','/pub/qm/p/image/180123/034417_794.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('3','成功案例','Successful Cases','0',',0','','3','','','百芳岁环保技术团队一直致力于污水处理技术以及污水处理设备的研发，污水处理工程的施工。百芳岁环保产品在生活、医疗、工业等行业的案例，获得了行业标准认证，满足国家严格的污水排放要求。','/pub/qm/p/image/180125/070130_238.jpg','1','2','','1','','/case/','/case/','/pub/qm/p/image/180123/045254_646.jpg','0','0','','0');
INSERT INTO `qm_lm` VALUES('4','新闻中心','News Center','0',',0','','4','','','','/pub/qm/p/image/180125/070310_195.jpg','1','1','','1','','/news/','/news/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('5','联系我们','','0',',0','','5','','','','/pub/qm/p/image/180125/065510_707.jpg','1','3','','1','','/contact/','/contact/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('6','其它','','0',',0','','7','','','','','1','3','','1','','/other/','/other/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('7','公司简介','','1',',0,1','','1','','','','','1','3','','1','','/about/us/','/about/us/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('8','荣誉资质','','1',',0,1','','2','','','','','1','3','','0','','/about/honor/','/about/honor/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('9','组织机构','','1',',0,1','','3','','','','','1','3','','0','','/about/organization/','/about/organization/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('10','企业文化','','1',',0,1','','4','创新环保科技 服务绿色生活','','创新环保科技 服务绿色生活。以设计和工程为导，力争至年， 我公司建设成为集咨询、研发、 设计、设备集成、 材料制造、工程、 服务及运营一体化发展的领 先型环保 企业，推动工业社会的绿色化；\r\n总体价值观\r\n创新 谦逊 团结 诚信 奋斗\r\n对股东的价值观-- 诚信 勤勉 沟通\r\n对客户的价值观-- 诚实信用 勇于创新 换位思考 推彼及此\r\n对员工的价值观-- 像家庭一样生活，像军队一样工作，像学校一样学习\r\n对协作方的价值观-- 坦诚沟通 精诚协作 收益共享\r\n对社会的价值观','/pub/qm/p/image/180123/094502_799.jpg','1','3','','0','','/about/culture/','/about/culture/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('11','公司理念','','1',',0,1','','5','','','','','1','3','','0','','/about/linian/','/about/linian/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('12','一体化污水处理设备','','2',',0,2','','1','','','','','1','2','','0','','/product/list-12/','/product/list-12/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('13','污泥浓缩设备','','2',',0,2','','2','','','','','1','2','','0','','/product/list-13/','/product/list-13/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('14','过滤沉淀设备','','2',',0,2','','3','','','','','1','2','','0','','/product/list-14/','/product/list-14/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('15','气浮沉淀设备','','2',',0,2','','4','','','','','1','2','','0','','/product/list-15/','/product/list-15/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('16','医疗污水处理设备','','2',',0,2','','5','','','','','1','2','','0','','/product/list-16/','/product/list-16/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('17','屠宰污水处理设备','','2',',0,2','','6','','','','','1','2','','0','','/product/list-17/','/product/list-17/','','0','0','','0');
INSERT INTO `qm_lm` VALUES('18','刮吸泥设备','','2',',0,2','','7','','','','','1','2','','0','','/product/list-18/','/product/list-18/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('19','污水处理设备','','2',',0,2','','8','','','','','1','2','','0','','/product/list-19/','/product/list-19/','','0','0','','1');
INSERT INTO `qm_lm` VALUES('20','酸洗磷化污水处理设备','','2',',0,2','','9','','','','','1','2','','0','','/product/list-20/','/product/list-20/','','0','0','','1');
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

