/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : qm_1218_mls

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-18 17:52:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cn_ad`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_ad
-- ----------------------------
INSERT INTO `cn_ad` VALUES ('1', '默认内页banner', '/Comm/images/img_6.png', '639', '300', '', 'banner', '', '', '1', '0');
INSERT INTO `cn_ad` VALUES ('2', '身体基本护理', '/Comm/images/ho1_1.png', '65', '74', '/stjbhl/', '身体基本护理', '', '', '1', '0');
INSERT INTO `cn_ad` VALUES ('3', '面部基础护理', '/Comm/images/ho1_2.png', '65', '74', '/mbjchl/', '面部基础护理', '', '', '1', '0');
INSERT INTO `cn_ad` VALUES ('4', '高端仪器类', '/Comm/images/ho1_3.png', '65', '74', '/gdyql', '高端仪器类', '', '', '1', '0');
INSERT INTO `cn_ad` VALUES ('5', '问题肌肤', '/Comm/images/ho1_4.png', '65', '74', '/wtjf', '问题肌肤', '', '', '1', '0');

-- ----------------------------
-- Table structure for `cn_admin`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_admin
-- ----------------------------
INSERT INTO `cn_admin` VALUES ('1', 'qmadmin', 'c5358a6db37949d725ae280082a99a4a', '9', '0', '', '', '2018-01-18 09:03:27', '127.0.0.1', '758', '01ebcab5bde4691766028d2998a1a7b6', '', '', '', '0', '0', '主站', '', '', '', '0', '0');
INSERT INTO `cn_admin` VALUES ('2', 'mytest', '6197e352b2eb102fca1062eb8da54e82', '1', '0', '', '', '2017-11-14 10:54:54', '127.0.0.1', '3', '30b3fd9887d9a20be87b3f4728aecc5b', '', '', '', '0', '0', 'mytest', 'mytest', 'mytest', '', '0', '1');

-- ----------------------------
-- Table structure for `cn_admin_check`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_admin_check
-- ----------------------------
INSERT INTO `cn_admin_check` VALUES ('1', '0', '1', '网站设置', 'system', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('2', '0', '1', '栏目设置', 'lm', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('3', '0', '1', '属性设置', 'attr', '1', '1');
INSERT INTO `cn_admin_check` VALUES ('4', '0', '1', '网站内容', 'lists', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('5', '0', '1', '广告管理', 'ad', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('6', '0', '1', '留言报名', 'msg', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('7', '0', '1', '数据备份', 'dbak', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('8', '0', '2', '添加', 'add', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('9', '0', '2', '修改', 'edit', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('10', '0', '2', '删除', 'del', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('11', '0', '2', '导出', 'export', '1', '1');
INSERT INTO `cn_admin_check` VALUES ('12', '0', '1', '订单管理', 'order', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('13', '0', '1', '预约管理', 'yuyue', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('14', '0', '1', '会员管理', 'user', '1', '0');
INSERT INTO `cn_admin_check` VALUES ('22', '0', '1', '优惠券管理', 'youhuiquan', '1', '0');

-- ----------------------------
-- Table structure for `cn_admin_role`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_attr`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_cart`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='购物车清单表';

-- ----------------------------
-- Records of cn_cart
-- ----------------------------
INSERT INTO `cn_cart` VALUES ('1', '1', '10', '精油推背', '388.00', '1', '1', '0', '1516171208');
INSERT INTO `cn_cart` VALUES ('2', '1', '13', '精油推背2', '388.00', '1', '1', '0', '1516171198');

-- ----------------------------
-- Table structure for `cn_color`
-- ----------------------------
DROP TABLE IF EXISTS `cn_color`;
CREATE TABLE `cn_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(55) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_color
-- ----------------------------
INSERT INTO `cn_color` VALUES ('1', '#FFFFFF');
INSERT INTO `cn_color` VALUES ('2', '#FF0000');
INSERT INTO `cn_color` VALUES ('3', '#FFFF00');
INSERT INTO `cn_color` VALUES ('4', '#FF00FF');
INSERT INTO `cn_color` VALUES ('5', '#0000FF');
INSERT INTO `cn_color` VALUES ('6', '#00FFFF');
INSERT INTO `cn_color` VALUES ('7', '#00FF00');
INSERT INTO `cn_color` VALUES ('8', '#CCCCCC');
INSERT INTO `cn_color` VALUES ('9', '#000000');
INSERT INTO `cn_color` VALUES ('10', '#666666');

-- ----------------------------
-- Table structure for `cn_comment`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_config`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_config
-- ----------------------------
INSERT INTO `cn_config` VALUES ('1', 'cfg_webname', '网站标题', '1', '1', '美丽莎皮肤管理中心', '0', '0');
INSERT INTO `cn_config` VALUES ('2', 'cfg_keywords', '关键字', '1', '1', '美丽莎皮肤管理中心', '0', '0');
INSERT INTO `cn_config` VALUES ('3', 'cfg_searchtitle', '搜索关键字', '1', '1', '', '0', '1');
INSERT INTO `cn_config` VALUES ('4', 'cfg_description', '网站描述', '1', '2', '美丽莎皮肤管理中心', '0', '0');
INSERT INTO `cn_config` VALUES ('18', 'cfg_beian', '网站备案号', '1', '1', '', '0', '1');
INSERT INTO `cn_config` VALUES ('5', 'cfg_copyright', '底部版权', '1', '2', '', '0', '1');
INSERT INTO `cn_config` VALUES ('6', 'cfg_name', '网站名称', '1', '1', '美丽莎皮肤管理中心', '0', '0');
INSERT INTO `cn_config` VALUES ('7', 'cfg_head', 'Head前代码', '1', '2', '', '0', '0');
INSERT INTO `cn_config` VALUES ('8', 'cfg_body', 'Body前代码', '1', '2', '', '0', '0');
INSERT INTO `cn_config` VALUES ('9', 'cfg_f0', '顶部欢迎语', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('10', 'cfg_f1', '服务热线', '1', '1', '400-888-8888', '1', '0');
INSERT INTO `cn_config` VALUES ('11', 'cfg_f2', '400电话', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('12', 'cfg_f3', '联系邮箱', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('13', 'cfg_f4', '在线QQ', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('14', 'cfg_f5', '咨询链接', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('19', 'cfg_f9', '活动默认说明', '1', '2', '', '1', '1');
INSERT INTO `cn_config` VALUES ('15', 'cfg_f6', '赠送积分百分比', '1', '1', '10', '1', '0');
INSERT INTO `cn_config` VALUES ('16', 'cfg_f7', '公司地址', '1', '1', '', '1', '1');
INSERT INTO `cn_config` VALUES ('17', 'cfg_f8', '预约时间段', '1', '17', '18,19,20,21,22,23,24,28,29,30,31,32,33,34,35', '1', '0');

-- ----------------------------
-- Table structure for `cn_content`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_content
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_flag`
-- ----------------------------
DROP TABLE IF EXISTS `cn_flag`;
CREATE TABLE `cn_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att` varchar(255) DEFAULT '',
  `attname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_flag
-- ----------------------------
INSERT INTO `cn_flag` VALUES ('1', '1', '人气套餐');
INSERT INTO `cn_flag` VALUES ('2', '2', '美容养颜');
INSERT INTO `cn_flag` VALUES ('3', '3', '养生美体');
INSERT INTO `cn_flag` VALUES ('4', '4', '最新活动');

-- ----------------------------
-- Table structure for `cn_info`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_info
-- ----------------------------
INSERT INTO `cn_info` VALUES ('1', '0', '企业简介', '', null, '0', '10', ',0,1,10,10', '', '<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，与皮肤科学相结合，采用高科技光、电设备与专业美容手法相结合，拥有国际尖端的医疗美容设备、皮肤科学专家团队、专业管理技师团队、先进的皮肤护理理念，致力于各类皮肤问题管理、咨询、检测、治疗、护理，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '3', '7', '2017-12-18 18:17:57', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/about/list-10/1.html', '0', '0');
INSERT INTO `cn_info` VALUES ('2', '0', '发展理念', '', null, '0', '11', ',0,1,11,11', '', '<p>\r\n	坚持以“让女人更加年轻，自信和美丽”为企业使命，以“走时尚之路，创行业先锋”为公司愿景，倡导“精于求精，止于至善”的经营理念，力争为每一位求美者量身订做个性化皮肤健康以及身体机能亚健康管理计划和服务，演绎皮肤健康的最高境界健康、活力、年轻态；让更多的人享受最高品质的美丽服务、尽享新时代健康美容生活方式！\r\n</p>', '', '', '', '2', '1', '2017-12-18 18:18:22', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/about/list-11/2.html', '0', '0');
INSERT INTO `cn_info` VALUES ('3', '0', '公司业务', '', null, '0', '12', ',0,1,12,12', '', '<p>\r\n	美丽莎皮肤管理中心（Melissa MEDCALSPA Center），专注于皮肤健康、亚健康管理，致力于各类皮肤问题管理，如：色素沉积、红血丝、痘痘痤疮、瘢痕、皱纹、产后修复、脱毛及皮肤的抗衰等的咨询、检测、治疗、护理，皮肤管理师根据不同皮肤状态，选择适用的产品，结合皮肤管理仪器以及正确的皮肤管理手法，对皮肤针对性治疗、调理，以达到改善皮肤问题、拥有优质皮肤的效果。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '1', '2017-12-18 18:18:43', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/about/list-12/3.html', '0', '0');
INSERT INTO `cn_info` VALUES ('4', '0', '梅老师', '', null, '0', '2', ',0,2,2', '美容护理师', '<p>\r\n	服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。\r\n</p>', null, null, null, '3', '16', '2017-12-18 18:29:34', '/Comm/images/img_5.png', '/Comm/images/img_5_th.png', '', null, '', '0', '', '0', '1', '1', '0', null, '10年', '精油推背，全身SPA，养生按摩', '获得美容高级技师证、获得美容高级技师证、获得美容高级技师证', '13642567189', '', '', '10,13', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '/pub/qm/p/image/171224/095832_431.jpg,/pub/qm/p/image/171224/095832_862.jpg,/pub/qm/p/image/171224/095832_873.jpg,/pub/qm/p/image/171224/095832_638.jpg,/pub/qm/p/image/171224/095832_235.jpg,/pub/qm/p/image/171224/095832_793.jpg', '', null, null, '0', '/team/4.html', '0', '0');
INSERT INTO `cn_info` VALUES ('5', '0', '小苏打去黑头', '', null, '0', '6', ',0,4,6,6', '', '<p>\r\n	<br />\r\n</p>', '', '', '', '2', '6', '2017-12-18 18:33:03', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '清洁脸部的时候，在洗面奶中加入适量的苏打粉，洗面奶的泡沫会变得非常的细腻而且富有弹性。洗过之后会感觉毛孔会非常的清爽。黑头会明显的减少了，还能细致毛孔。', '', '', '', null, null, '0', '/mrys/5.html', '0', '0');
INSERT INTO `cn_info` VALUES ('6', '0', 'ladies', '', null, '0', '5', ',0,4,5,5', '', '<p>\r\n	美容一词，最早源于古希腊的“kosmetikos”，意为“装饰”。无论怎样命名，美容的活动在古代早已存在。考古学家从那一时期发掘的文物中考证，在当时，染料和香水已异地交换使用。到公元前5000年，黑锑粉末被用作描眉和染眉，铅被用来画眼线，绿孔雀石被用来画眼影等，令人惊奇的是，古代妇女化妆与现代妇女有着惊人的相似之处，如染指、趾甲，涂唇，描眉，染发等。\r\n</p>\r\n<p>\r\n	埃及古代时期，人们为了滋润皮肤和防止日晒，在皮肤涂抹各种药剂和油膏。古埃及妇女喜欢用黑颜料来描眼的轮廓，孔雀石粉制成的绿颜料涂在眼皮上，用黑灰色的锑粉把眉毛描得像柳叶一样细长，用乳白色的油脂抹在身上，使用红颜料涂抹嘴唇和脸颊，甚至在手、脚的指甲上都要染上橘红色，非常惹人注目。\r\n</p>\r\n<p>\r\n	美容在欧洲中世纪非常流行，到了文艺复兴时期，美容艺术大大发展。19世纪80年代，西方始出现了近代美容院。在中国殷商时期，人们已用燕地红蓝花叶捣汁凝成脂来饰面。\r\n</p>\r\n<p>\r\n	根据记载，春秋时周郑之女，用白粉敷面，用青黑颜料画眉。在汉代以后，开始出现妆点、扮妆、妆饰等字词。唐代出现了面膜美容。现代的女性对于美容养颜这一块需求非常高，层次也相对不一样。\r\n</p>\r\n<p>\r\n	初谈\r\n</p>\r\n<p>\r\n	《简易经》里记载：“简之矩只容能存之，易之规只美能化之。容则容物亦可护物，物之附表也。美其表、愚蠢目、健其本、乐而可为也。\r\n</p>\r\n<p>\r\n	”在三皇伏羲时期，大家就知道了美容的基本意义。那时候就把容字当做事物的外表，可以保护实质的东西，“美其表”就是美其容的意思。把外表美容一下，可以愚弄蠢笨的眼睛，使对方心中提高对本物的价值观点。美容一下还可以增强其本质的东西，对看家和对本物都有益处。\r\n</p>\r\n<p>\r\n	发展\r\n</p>\r\n<p>\r\n	美容产业迅速发展的驱动力主要在于：首先，中国近几年来居民的需求结构升级、社会的产业结构调整以及农村城市化和城市社区化为中国美容经济的兴起创造了大好机遇。\r\n</p>\r\n<p>\r\n	其次，中国经济持续、高速增长是中国美容经济兴起的根本原因，城乡居民收入的持续增长使美容消费支出的扩大由可能变为现实(10年间增长150%以上)，而中国居民消费结构的变迁直接促进了美容经济的兴起，国民健康意识和生活质量意识的提升更成为美容经济兴起的重要诱因\r\n</p>\r\n<p>\r\n	再者，美容产业所具有的集中性、广泛性、示范性、主导性和阶段性等特点，使美容成为当前中国居民的一大消费热点。\r\n</p>\r\n<p>\r\n	当一个国家的人均收入超过2000美元，即进入中等发达的小康社会后，对医疗整形美容行业的需求会增加10%左右，并每年以这个速度递增。2010年我国美容产业总产值已突破4000亿元，预计未来5年还将翻一番。庞大的市场需要更多的监管，尤其是医疗整形美容。\r\n</p>\r\n<p>\r\n	据《2013-2017年中国美容机构行业深度调研与投资战略规划分析报告》部分数据统计，2009年我国从事医疗整形美容的专业技术人员和相关人员达20余万人，以开展医疗整形美容诊疗业务为主的医疗机构如医疗整形美容医院、诊所和科室超过5万余所(个)，年总营业收入超过150亿元，不包括没有资质而从事美容行业人员，仅仅接受过医疗整形美容服务的人员就累计达到300万人次左右。\r\n</p>\r\n<p>\r\n	但当前的医疗整形美容行业存在服务资源分布不均、机构良莠不齐、存在不正当竞争、医疗事故频发等问题。卫生部门对医疗整形美容行业发展的支持力度不大，在“个别地方监管工作薄弱”，也是造成医疗整形美容行业混乱的原因。医疗整形美容行业存在的问题已引起政府有关部门的高度重视，《医疗整形美容行业发展规划纲要》即将出台。已有越来越多的美容专业机构通过连锁加盟形式，逐步扩散辐射面积抢占市场，行业发展业态初步呈现。从经营项目方面看，传统医学美容医院单一的服务已越来越无法满足市场需求，医学美容与生活美容综合经营，是中国美容产业未来5年的发展趋势及走向。\r\n</p>\r\n<p>\r\n	分类\r\n</p>\r\n<p>\r\n	美容起源于人类的祖先。自从有了人类，就有了美容。美容即是美化人们的容貌。随着社会的发展与科技的提升，美容从内容到形式上都有着不断的变化和提升。根据美容内涵的不同，现代美容可分为生活美容和医学美容两大部分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、生活美容是指专业人士使用专业的护肤化妆品和专业的美容仪器，运用专业的护肤方法和按摩手法，对人体的肌肤进行全面的护理和保养。生活美容可分为护理美容和修饰美容两大类。\r\n</p>\r\n<p>\r\n	2、医学美容是指运用一系列侵入皮肤内的医学手段，对人体的容貌与身体各部位进行维护、修复和再塑。\r\n</p>', '', '', '', '1', '2', '2017-12-18 18:36:34', '/Comm/images/img_6.png', '/Comm/images/img_6_th.png', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '美容一词可以从两个角度来理解。首选是\"容\"这个字，其次是\"美\"。\"容\"包括脸、仪态、和修饰三层意思。', '', '', '', null, null, '0', '/mlbd/list-5/6.html', '0', '0');
INSERT INTO `cn_info` VALUES ('7', '0', '公司总部', '', null, '0', '8', ',0,8,8', '', '', '', '', '', '1', '17', '2017-12-19 13:33:14', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '四川省成都市成华区双林路87', '0832-44446666', '30.656120,104.106310', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/contact/7.html', '0', '0');
INSERT INTO `cn_info` VALUES ('8', '0', 'banner', '', null, '0', '15', ',0,14,15,15', '', '', '', '', '', '2', '1', '2017-12-19 16:11:30', '/Comm/images/ban_1.jpg', '/Comm/images/ban_1_th.jpg', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/qita/list-15/8.html', '0', '0');
INSERT INTO `cn_info` VALUES ('9', '0', '《美丽莎会员使用协议》', '', null, '0', '20', ',0,14,20,20', '', '<p>\r\n	美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议美丽莎会员使用协议\r\n</p>', '', '', '', '1', '10', '2017-12-19 16:34:00', '', '', '', null, '', '0', '', '0', '1', '1', '0', null, '', '', '', '', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '', '', '', '', null, null, '0', '/xieyi/9.html', '0', '0');
INSERT INTO `cn_info` VALUES ('10', '0', '精油推背', '', null, '0', '16', ',0,13,16,16', '玫瑰花香，纤纤玉颈', '', '', '', '', '2', '26', '2017-12-19 16:52:12', '/Comm/images/img_6.png', '/Comm/images/img_6_th.png', '', null, '', '0', '1,2,3,4', '0', '1', '1', '0', null, '适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。', '', '028-44446666', '小萌', '', '12,4', '', '', 'admin', '美丽莎皮肤管理中心', '388', '2.5', '4', '0', '20', '0', '0', '0', '0.00', '0', '精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。', '', '/pub/qm/p/image/171224/100607_251.jpg,/pub/qm/p/image/171224/100607_460.jpg,/pub/qm/p/image/171224/100607_880.jpg', '', null, null, '0', '/stjbhl/10.html', '0', '0');
INSERT INTO `cn_info` VALUES ('11', '0', '何老师', '', null, '0', '2', ',0,2,2', '美容护理师', '', null, null, null, '2', '1', '2018-01-17 09:37:40', '/Comm/images/img_5.png', '/Comm/images/img_5_th.png', '', null, '', '0', '', '0', '1', '1', '0', null, '10', '精油推背，全身SPA，养生按摩', '获得美容高级技师证、获得美容高级技师证、获得美容高级技师证、', '13642567189', '', '', '', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。', '', '/pub/qm/p/image/180117/014138_622.jpg,/pub/qm/p/image/180117/014138_558.jpg,/pub/qm/p/image/180117/014138_803.jpg', '', null, null, '0', '/team/11.html', '0', '0');
INSERT INTO `cn_info` VALUES ('12', '0', '王老师', '', null, '0', '2', ',0,2,2', '按摩师', '', null, null, null, '1', '16', '2018-01-17 09:41:55', '/Comm/images/img_5.png', '/Comm/images/img_5_th.png', '', null, '', '0', '', '0', '1', '1', '0', null, '8', '精油推背，全身SPA，养生按摩', '获得美容高级技师证、获得美容高级技师证、获得美容高级技师证', '13642567188', '', '', '10,13', '', 'admin', '美丽莎皮肤管理中心', null, '0.0', '0', '0', '0', '0', '0', '0', '0.00', '0', '服务项目介绍：面膜洗净后，擦爽肤水，然后用一粒维生素E混合少量纳米珍珠粉，纳米珍珠粉的量相当于维生素E的三分之一，混合均匀，涂脸，轻轻打圈按摩至吸收，如果量过多，可以擦手上。', '', '/pub/qm/p/image/180117/014319_832.jpg,/pub/qm/p/image/180117/014319_410.jpg,/pub/qm/p/image/180117/014319_574.jpg', '', null, null, '0', '/team/12.html', '0', '0');
INSERT INTO `cn_info` VALUES ('13', '0', '精油推背2', '', null, '0', '16', ',0,13,16,16', '玫瑰花香，纤纤玉颈', '', '', '', '', '1', '26', '2017-12-19 16:52:12', '/Comm/images/img_6.png', '/Comm/images/img_6_th.png', '', null, '', '0', '1,2,3,4', '0', '1', '1', '0', null, '适用于肩颈僵硬、腰酸背痛、精神焦虑、工作压力大、长期坐办公室、肝肾疾病、肠胃消化功能不好、便秘、面色差等人群。', '', '028-44446666', '小萌', '', '12,4', '', '', 'admin', '美丽莎皮肤管理中心', '388', '0.5', '4', '0', '20', '0', '0', '0', '0.00', '0', '精油推背是一种按摩方法，是一种精神上享受，精油推背使用含有杜松子、薄荷、鼠尾草、甜没药、尤加利、玫瑰、紫荆等成分的活络精油，配合独特开背手法，进行松筋开背按摩，以促进血液循环，舒缓精神压力，消除疲劳，紧实肌肤，改善睡眠的功效。', '', '/pub/qm/p/image/171224/100607_251.jpg,/pub/qm/p/image/171224/100607_460.jpg,/pub/qm/p/image/171224/100607_880.jpg', '', null, null, '0', '/stjbhl/13.html', '0', '0');

-- ----------------------------
-- Table structure for `cn_lm`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_lm
-- ----------------------------
INSERT INTO `cn_lm` VALUES ('1', '关于我们', '', '0', ',0', '', '1', '', '', '', '', '1', '3', null, '1', '', '/about/', '/about/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('2', '团队介绍', '', '0', ',0', '', '2', '', '', '', '', '1', '2', null, '1', '', '/team/', '/team/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('3', '美丽商城', '', '0', ',0', '', '3', '', '', '', '', '1', '4', null, '1', '', '/shop/', '/shop/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('4', '美丽宝典', '', '0', ',0', '', '4', '', '', '', '', '1', '2', null, '1', '', '/mlbd/', '/mlbd/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('5', '优品驾到', '', '4', ',0,4', '', '1', '', '', '', '', '1', '2', null, '0', '', '/mlbd/list-5/', '/mlbd/list-5/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('6', '美容养生', '', '4', ',0,4', '', '2', '', '', '', '', '1', '2', null, '0', '', '/mrys/', '/mrys/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('7', '时尚前线', '', '4', ',0,4', '', '3', '', '', '', '', '1', '2', null, '0', '', '/mlbd/list-7/', '/mlbd/list-7/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('8', '联系我们', '', '0', ',0', '', '5', '', '', '', '', '1', '3', null, '1', '', '/contact/', '/contact/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('9', '美丽预约', '', '0', ',0', '', '6', '', '', '', '', '1', '4', null, '1', '', '/mlyy/', '/mlyy/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('10', '企业简介', 'CORPORATE PROFILE', '1', ',0,1', '', '1', '', '', '', '/Comm/images/ab_bg1.jpg', '1', '3', null, '1', '', '/about/list-10/', '/about/list-10/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('11', '发展理念', 'DEVELOPMENT PHILOSOPHY', '1', ',0,1', '', '2', '', '', '', '/Comm/images/ab_bg2.jpg', '1', '3', null, '1', '', '/about/list-11/', '/about/list-11/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('12', '公司业务', 'COMPANY BUSINESS', '1', ',0,1', '', '3', '', '', '', '/Comm/images/ab_bg3.jpg', '1', '3', null, '1', '', '/about/list-12/', '/about/list-12/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('13', '服务分类', '', '0', ',0', '', '7', '', '', '', '', '1', '2', null, '1', '', '/fwfl/', '/fwfl/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('14', '其它', '', '0', ',0', '', '8', '', '', '', '', '1', '3', null, '1', '', '/qita/', '/qita/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('15', 'banner', '', '14', ',0,14', '', '1', '', '', '', '', '1', '3', null, '1', '', '/qita/list-15/', '/qita/list-15/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('16', '身体基本护理', '', '13', ',0,13', '', '1', '', '', '', '', '1', '2', null, '1', '', '/stjbhl/', '/stjbhl/', '/Comm/images/f1.png', '0', '0', '美容与养颜是密不可分的', '0');
INSERT INTO `cn_lm` VALUES ('17', '面部基础护理', '', '13', ',0,13', '', '2', '', '', '', '', '1', '2', null, '1', '', '/mbjchl/', '/mbjchl/', '/Comm/images/f2.png', '0', '0', '后天的保养才能拥有完美健康的肌肤', '0');
INSERT INTO `cn_lm` VALUES ('18', '高端仪器类', '', '13', ',0,13', '', '3', '', '', '', '', '1', '2', null, '1', '', '/gdyql/', '/gdyql/', '/Comm/images/f1.png', '0', '0', '美容与养颜是密不可分的', '0');
INSERT INTO `cn_lm` VALUES ('19', '问题肌肤', '', '13', ',0,13', '', '4', '', '', '', '', '1', '2', null, '1', '', '/wtjf/', '/wtjf/', '/Comm/images/f2.png', '0', '0', '后天的保养才能拥有完美健康的肌肤', '0');
INSERT INTO `cn_lm` VALUES ('20', '《美丽莎会员使用协议》', '', '14', ',0,14', '', '2', '', '', '', '', '1', '3', null, '1', '', '/xieyi/', '/xieyi/', '', '0', '0', null, '0');
INSERT INTO `cn_lm` VALUES ('21', '常见问题', '', '0', ',0', '', '9', '', '', '', '', '1', '1', null, '1', '', '/question/', '/question/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('22', '怎样获取更多优惠券?', '', '0', ',0', '', '10', '', '', '', '', '1', '4', null, '1', '', '/getmore/', '/getmore/', '', '0', '0', '', '1');
INSERT INTO `cn_lm` VALUES ('23', '预约服务', '', '9', ',0,9', '', '1', '', '', '', '', '1', '4', null, '1', '', '/yyservice/', '/yyservice/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('24', '技师预约', '', '9', ',0,9', '', '2', '', '', '', '', '1', '4', null, '1', '', '/jsyy/', '/jsyy/', '', '0', '0', '', '0');
INSERT INTO `cn_lm` VALUES ('25', '预约记录', '', '9', ',0,9', '', '3', '', '', '', '', '1', '4', null, '1', '', '/mlyy/list-25/', '/mlyy/list-25/', '', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `cn_lm_`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_lm_
-- ----------------------------
INSERT INTO `cn_lm_` VALUES ('1', '关于我们', '', '0', ',0', '', '1', '', '', '', '', '1', '3', null, '1', '', '/about/', '/about/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('2', '团队介绍', '', '0', ',0', '', '2', '', '', '', '', '1', '2', null, '1', '', '/team/', '/team/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('4', '美丽宝典', '', '0', ',0', '', '4', '', '', '', '', '1', '2', null, '1', '', '/mlbd/', '/mlbd/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('5', '优品驾到', '', '4', ',0,4', '', '1', '', '', '', '', '1', '2', null, '0', '', '/mlbd/list-5/', '/mlbd/list-5/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('6', '美容养生', '', '4', ',0,4', '', '2', '', '', '', '', '1', '2', null, '0', '', '/mrys/', '/mrys/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('7', '时尚前线', '', '4', ',0,4', '', '3', '', '', '', '', '1', '2', null, '0', '', '/mlbd/list-7/', '/mlbd/list-7/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('8', '联系我们', '', '0', ',0', '', '5', '', '', '', '', '1', '3', null, '1', '', '/contact/', '/contact/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('9', '美丽预约', '', '0', ',0', '', '6', '', '', '', '', '1', '4', null, '1', '', '/mlyy/', '/mlyy/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('10', '企业简介', 'CORPORATE PROFILE', '1', ',0,1', '', '1', '', '', '', '/Comm/images/ab_bg1.jpg', '1', '3', null, '1', '', '/about/list-10/', '/about/list-10/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('11', '发展理念', 'DEVELOPMENT PHILOSOPHY', '1', ',0,1', '', '2', '', '', '', '/Comm/images/ab_bg2.jpg', '1', '3', null, '1', '', '/about/list-11/', '/about/list-11/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('12', '公司业务', 'COMPANY BUSINESS', '1', ',0,1', '', '3', '', '', '', '/Comm/images/ab_bg3.jpg', '1', '3', null, '1', '', '/about/list-12/', '/about/list-12/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('13', '服务分类', '', '0', ',0', '', '7', '', '', '', '', '1', '2', null, '1', '', '/fwfl/', '/fwfl/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('14', '其它', '', '0', ',0', '', '8', '', '', '', '', '1', '3', null, '1', '', '/qita/', '/qita/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('15', 'banner', '', '14', ',0,14', '', '1', '', '', '', '', '1', '3', null, '1', '', '/qita/list-15/', '/qita/list-15/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('16', '身体基本护理', '', '13', ',0,13', '', '1', '', '', '', '', '1', '2', null, '1', '', '/stjbhl/', '/stjbhl/', '/Comm/images/f1.png', '0', '0', '美容与养颜是密不可分的', '0');
INSERT INTO `cn_lm_` VALUES ('17', '面部基础护理', '', '13', ',0,13', '', '2', '', '', '', '', '1', '2', null, '1', '', '/mbjchl/', '/mbjchl/', '/Comm/images/f2.png', '0', '0', '后天的保养才能拥有完美健康的肌肤', '0');
INSERT INTO `cn_lm_` VALUES ('18', '高端仪器类', '', '13', ',0,13', '', '3', '', '', '', '', '1', '2', null, '1', '', '/gdyql/', '/gdyql/', '/Comm/images/f1.png', '0', '0', '美容与养颜是密不可分的', '0');
INSERT INTO `cn_lm_` VALUES ('19', '问题肌肤', '', '13', ',0,13', '', '4', '', '', '', '', '1', '2', null, '1', '', '/wtjf/', '/wtjf/', '/Comm/images/f2.png', '0', '0', '后天的保养才能拥有完美健康的肌肤', '0');
INSERT INTO `cn_lm_` VALUES ('20', '《美丽莎会员使用协议》', '', '14', ',0,14', '', '2', '', '', '', '', '1', '3', null, '1', '', '/xieyi/', '/xieyi/', '', '0', '0', null, '0');
INSERT INTO `cn_lm_` VALUES ('21', '常见问题', '', '0', ',0', '', '9', '', '', '', '', '1', '1', null, '1', '', '/question/', '/question/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('22', '怎样获取更多优惠券', '', '0', ',0', '', '10', '', '', '', '', '1', '3', null, '1', '', '/getmore/', '/getmore/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('23', '预约服务', '', '9', ',0,9', '', '1', '', '', '', '', '1', '4', null, '1', '', '/yyservice/', '/yyservice/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('24', '技师预约', '', '9', ',0,9', '', '2', '', '', '', '', '1', '4', null, '1', '', '/jsyy/', '/jsyy/', '', '0', '0', '', '0');
INSERT INTO `cn_lm_` VALUES ('25', '预约记录', '', '9', ',0,9', '', '3', '', '', '', '', '1', '4', null, '1', '', '/mlyy/list-25/', '/mlyy/list-25/', '', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `cn_log`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_log
-- ----------------------------
INSERT INTO `cn_log` VALUES ('1', '6', '0', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-22', '1513915046', 'c708xbWvFbUbEtj/X+AYP131dlp52IoCovX+FOzKu8+Cs7z2wBjyVik/27OHOB9GvXlg1qrj0H7O3m1IZ7X2HNppTx21d7FyGQ', '0');
INSERT INTO `cn_log` VALUES ('2', '6', '13', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/user/index', 'http://mls.net/fwfl/', '2017-12-22', '1513915084', '549dTLhd1BrLHcrJ+Vp7fnPfq3ZxHMiV1E7Le2isRM4hLj+n1W/5Qh7K3R4OUAeDEVYqsulwRYgGC6aSlsL/T85bzKLfx0NjaNA', '0');
INSERT INTO `cn_log` VALUES ('3', '6', '16', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/stjbhl/', '2017-12-22', '1513915087', '024aG7Xgl3dv2EZjZfErw1lOhX29FVxKafuQSy9h5Hx6Kb7jq2CudQ7Y7qxJy7GP/cYwtfMXV2L5wv5i37ekKFCVGVO4MzL8P8s', '0');
INSERT INTO `cn_log` VALUES ('4', '6', '0', '10', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-22', '1513915090', '9aa2lcUIuDbdWY6UxdokBkBcSzmMJggBMK9aDH6ncFPcP05cJM7RwZXkCeVLehVFEG/sP5zLjFEqPRHYqi3Wm6aUDScagGo3tms', '0');
INSERT INTO `cn_log` VALUES ('5', '6', '0', '10', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-22', '1513915139', '6520t2xvbSQHupWNQTh6l93nw+3utZTG+5QLOO/va123gS4WR4Q9YD9tt2MW3eHNo6It+v0JiUe0iGLW1EZViuLIEAUamXm51sc', '0');
INSERT INTO `cn_log` VALUES ('6', '6', '0', '10', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-22', '1513915172', '74709Qk52bHAsoCFeizSVzi3XEuOGuWLRS1vCPEL4CfAjKDwgtdNDNjQ31Do2FejcsGrMnwQbedqSNjYrL+y2ws47PB/HvhfV0M', '0');
INSERT INTO `cn_log` VALUES ('7', '6', '0', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', '', 'http://mls.net/', '2017-12-22', '1513921798', '62bdm4YSjflxvG8ZAr/NI+tfRb8ERToKxY84+EORcSM67Q610GzgDQwu9hL6YmaMLOUNrI7LE+k3XjPydRR0jO8A964gBnnXZw', '0');
INSERT INTO `cn_log` VALUES ('8', '6', '0', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/user/info', 'http://mls.net/', '2017-12-22', '1513923345', '3963ka/ifxHHtVczcPdbIwsSSYJ6e7kTFpkm7VG2/sLlD6q6m7b26gOEu/+krP6/SVBPSawqD9cpqsT/GI0bZ+FQflABUSWbcA', '0');
INSERT INTO `cn_log` VALUES ('9', '6', '13', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/', 'http://mls.net/fwfl/', '2017-12-22', '1513923347', 'b8bf/beA6YH3DqJliK/uxe2PKG0dYS1DRopR7owhfemfQAiPdP7buYZOSjD/5dTXUZG5f344ahLJi/AHjOGR2wgkht+nRMHCngA', '0');
INSERT INTO `cn_log` VALUES ('10', '6', '18', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/gdyql/', '2017-12-22', '1513923352', '33c0WPVazegi+EG6GCrbPFMDnnCd+vuY5P78cqXkLVwQAjR1/ud+ye28nUaoL0KjPj7mefRc1S6Drr7vA4Dg8eF0RsDycQ1TZTY', '0');
INSERT INTO `cn_log` VALUES ('11', '6', '13', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/', 'http://mls.net/fwfl/', '2017-12-22', '1513923356', '0bd1ZXHnNkpuGB/tFdBHm3uhQoLUo8CJs3dlHChHLOTIvcqxRPg0hIordefF9ftETTdacHdhj8TdgZvZW0eWmBSWMOcbYKff7aI', '0');
INSERT INTO `cn_log` VALUES ('12', '6', '16', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/stjbhl/', '2017-12-22', '1513923360', '1214IpOeW6dydf4VnuZMK13wMlCvs8Ym8fgL9Thj0tfOgL93PvSBD28jJpJ149IY28+/ugmMui7vWUIHbKK6F61UQbgfjJPYPBE', '0');
INSERT INTO `cn_log` VALUES ('13', '6', '0', '10', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-22', '1513923362', '46e7T/BV/O68GFPW3LeAKwTvSUr6vjwKPGx24byKdRbAUo7ByLNcSwQjA+nea44QPmER6e6Q3OBAomRhtbb49rMRdAjgIlbyzwE', '0');
INSERT INTO `cn_log` VALUES ('14', '6', '0', '0', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', 'http://mls.net/user/info', 'http://mls.net/', '2017-12-22', '1513939989', 'b1faTk1e8PrR4Jz5z3iXnp9cZOMEc1ZQNWPMmhaMeFKCU7223CftbpzqysTz2oPa34mZIKyBm6t/QHytkZYJ2RRhQUWUU1BTeA', '0');
INSERT INTO `cn_log` VALUES ('15', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/', '2017-12-23', '1514013990', '304d3riluhsxu408ScqAtwIN/Zh9cTAqYrsBHc4KL5ibWA9re06ETtDuVmbYg3L2kqoaoqHEyG5qdQ/ccIdNiQXbn+TnhKAtkQ', '0');
INSERT INTO `cn_log` VALUES ('16', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/', '2017-12-23', '1514014307', '93ccSd+QRGGA9tx4d3EW91YSRQCIkKCT9qn3FPIFHMTYAzy69AECcRnMRDwZC7lm0/g+TBww4yr1rKN1YWCVZc2AqfWqv3t4Xw', '0');
INSERT INTO `cn_log` VALUES ('17', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/', '2017-12-23', '1514014371', '03bbLI+Sa66Di7pPGLG361pSaS+OqN8JilFAldVYtT8OOa+IqsieW9oROvuQeHv1MIuoZpqehYZLy1Jn7YT1hpWABHeAmmtmJQ', '0');
INSERT INTO `cn_log` VALUES ('18', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/', '2017-12-23', '1514014564', '40648/FsMkGEfHMVaOsBl5Q5cbLZLSyCN1snPhnlkP53wXgnXaaJGboOmaJVl6n3gBIUsNQ9hrleI59yWhVi5j04+AO0Zk5Pnw', '0');
INSERT INTO `cn_log` VALUES ('19', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/', '2017-12-23', '1514014624', 'bf78kMI7nRcIVnRJTzKk3ODicbk7FW+ZB/WLYLBDu7Zv3aHuaNOpceoKOFMRQb8haDcliEs/mDiZdkexmBu3VvwHGQa0krycgw', '0');
INSERT INTO `cn_log` VALUES ('20', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514014687', '7e7baH+iipHihZ5egfWE7XPzF8b9Rj39eC3iRd4n+jO51LshkFvntGCp/B4O8ROGkLDUH8mO7Qa2mYnEmqaWpxKjF3VUL6OTL9E', '0');
INSERT INTO `cn_log` VALUES ('21', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514014737', 'd76ez1PJaY5Ifx8+OWnTyKUqY+Qg50nRI7rf2PXQCEAFXteFcUkD5GWAxYsLEjOj9dFl8wd35o0eflkodQvw8b9kSpV6oXYQUIw', '0');
INSERT INTO `cn_log` VALUES ('22', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/10.html', 'http://mls.net/', '2017-12-23', '1514014739', '8810ZjOXuyFHcLBk6mBAQmDJo7etNFyFDfIsPwsZPJsSi5TFA1R88doqj+9A7FdHMzovskGvhU+4jtRRLb3YnoYLWInoXmqJJA', '0');
INSERT INTO `cn_log` VALUES ('23', '8', '13', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/fwfl/?k=精油', '2017-12-23', '1514014797', 'adff95dPEklsE1OHnfanGa2KlCMpH3n0/CXFvKIHoZMTGtrGhLIpxBpWh25pcwN9p0So9EPh/kCPW2tnbTtDRBt6b1tCBHi1pvU', '0');
INSERT INTO `cn_log` VALUES ('24', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/?k=精油', 'http://mls.net/', '2017-12-23', '1514016393', '830dkM4xFC6wvN4edagbS+ptSjK8GFgAOIVZnrFQc9inOKqKNpBsXDMPDjfnLk4bpT8+actns1/mubDIEITc0gzoK5sPrxYQxQ', '0');
INSERT INTO `cn_log` VALUES ('25', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/?k=精油', 'http://mls.net/', '2017-12-23', '1514016431', 'b2ddfRlk5P0m8oABHX90h/f0oIvDQJL4jkPXGNhmcqk00BFmyhjT6Y/j5tH8cH1hNDu+I9uvjkznI14VaL95H4BLvoTcaPpojA', '0');
INSERT INTO `cn_log` VALUES ('26', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/?k=精油', 'http://mls.net/', '2017-12-23', '1514016439', '5e05YrELpTHu7l5FBu74qVcj24zU51mxrG1o4D179HdlQKw/rI80r9Lr780CprbzjjNr6sjWFBRmRgWVbAREJyMvx43ouxDftg', '0');
INSERT INTO `cn_log` VALUES ('27', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/?k=精油', 'http://mls.net/', '2017-12-23', '1514016469', '2b63EDjyCJxBkXLYuc997ezAJqpd+tlfr9dfNsgeRJ1oTEZRPIYjqRr5Z2GJy2X3I9ppnnXuZzc0b29zK9EIMaQjeIwAhMj7zA', '0');
INSERT INTO `cn_log` VALUES ('28', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/', '2017-12-23', '1514016471', 'c798JTp5nm/epWIXYz+7iVXCsKXSDjXFa9DmvjHqJ0VwAEGf6ZM5k/b9sAn78c5GZpqq2PK0GD9ViCh1re5MqwDXQZzFTqDeoA', '0');
INSERT INTO `cn_log` VALUES ('29', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/', '2017-12-23', '1514016480', '49af2aboy4crKy5YYzAJWyx9ag7I/S9DptJd+8mr/tBotPVu15J/B1bSK+pj2f1luZw2Rgs6T6avit3nDsPfr+D8AODWUulxKw', '0');
INSERT INTO `cn_log` VALUES ('30', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/', '2017-12-23', '1514016553', '436aFODqLCiOIw0JfSEESOcmSiP/DpjDEK1herdoeyp11f0+kms4Y6tcvzYhb9jiybmKMys2fAcjLz5uXb5DqDMDF7+C/yfAqw', '0');
INSERT INTO `cn_log` VALUES ('31', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/', 'http://mls.net/#no', '2017-12-23', '1514016584', 'a21bqn3fSMEjK7llqvIi1jaiEAjU20HHRabkUPSG/3ypH5sftbKMvs0K/FH6dDvdEGKBN10EcYJNtONLutXnuw3kCUUpGLkK7w', '0');
INSERT INTO `cn_log` VALUES ('32', '8', '13', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/user/buy', 'http://mls.net/fwfl/', '2017-12-23', '1514016634', '62d3+o4oFUJpu07nf9BT/6qbCEnyH+j18EP16l6CkrDmNTWhhBbVIybMzeq6kb/uXQLQxT94V0GEg53Nt34s5Xdib5LOWIncAus', '0');
INSERT INTO `cn_log` VALUES ('33', '8', '16', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/stjbhl/', '2017-12-23', '1514016635', 'b26adSJQg8P2Q3gOMtgviXro21NksZOzhTstsjiC5+tpApi342vuAHxUGucZPCz15jEtfBlLa47cmFD2wZHYCLGAYCKVC1EtUpo', '0');
INSERT INTO `cn_log` VALUES ('34', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016637', '2531JfakJfuh1SInBLF7eDcDC2GOz+2u3+MHyRsSv5Vi5a5c5NoCpd44J2xXc7HU6qKDGE4cYQynnOfU9MJLrSYCYke24L/T4N0', '0');
INSERT INTO `cn_log` VALUES ('35', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016644', '3dabPyx82ujzyG98awkgJgYVkKHk8NStGV2ktxSFk1YjPQIBBEumYazbXOHWgAxXstzsRmgRrZCgZG+M8Rwhcw5ExMth8I2BMls', '0');
INSERT INTO `cn_log` VALUES ('36', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016662', '41d17LWrMDrhMwqucOJ+L48YmxYf87i5TO/O55xCGxl7pXPVRR3KD2RYX4r0siMyHBvMGgfxp4iptui+UbiA079vyHMFgTuQDOw', '0');
INSERT INTO `cn_log` VALUES ('37', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016664', '95f7FqB6gRMQLA3vDvs49cMQFLfJUg6zlD2uAZTHOqrLHTu0rw1TIj4Jx/mUOnemJ61rcKaiDOs0ZDTB+3zY/m/cHnuBNT8bz1A', '0');
INSERT INTO `cn_log` VALUES ('38', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016676', '95337qgLgBbL32JH3FnZ9C2EuBHCJB2tn5T+1OLWvN/W6afWlcZMlzrsgFukJ9Rp3K1IT54rlSONiaTPCgJwigGM9wfZgzwWKhE', '0');
INSERT INTO `cn_log` VALUES ('39', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016738', 'a2265LM+m5AfLTgyj3pXCZCGs8rYsZGOs1uRuyTeSScwv1hhk/sZZuxOUusd6mW4o78Kcgv7TCH+p1plSf9PUQQbYi16cl2yFVc', '0');
INSERT INTO `cn_log` VALUES ('40', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016750', 'dcfdbWpIS/PrnbM0LyETr2DCiQx0zxfmGFeKVgCo8McV3m/RTjiu5Q/nGHKCirHrxhSEh1Mey6W8vYiEfwkt0OwZN469ERdzMaY', '0');
INSERT INTO `cn_log` VALUES ('41', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016751', 'f51fBBEci6uya65WNMi7VdyKFbI3GmOnHegR3sTKxrU04L3s5g4yrTelSWN4KoycY9cX8IcSEfNsBNQ0AruYfG1DRoqRUbU34mQ', '0');
INSERT INTO `cn_log` VALUES ('42', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016775', 'ca07ND+NWiHfEWYsjflj7EMY43n98cZsAeHMUJyUW+LfmNSObPTDP2dAwWGovWslO9t8jQzR7L/eohNzppl4JkTg8HnmfIJYtP0', '0');
INSERT INTO `cn_log` VALUES ('43', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514016851', 'f6d0gFG2msiXzRqf3DsQcTWzJJI8G8eshpfklgVbs/xuZDZ4EaEBPfewbgEnfOuwDEdKamVCF28l7n40fKYy0QXhOHbUoGFJtRw', '0');
INSERT INTO `cn_log` VALUES ('44', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-23', '1514039743', '470fwTuo5SXxQ+qWMVhxv7HObM54Xhgkcp0DdeXNpV/SDWQlfZKVdN8RAM8qt+0rTzbLm7YZGU/kI6br4K9SNGcAw0yLpRrpnQ', '0');
INSERT INTO `cn_log` VALUES ('45', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-23', '1514039751', '3cf860/oJl0vfY2bjIHOPgcJS9XjqzGSOCySBPEQ1e345n+xiOe3kldLOk/2pk7C/eB08uBvWLT5VVFBxxfu5HJUODjVG5sZVw', '0');
INSERT INTO `cn_log` VALUES ('46', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-23', '1514040132', '40e447qGTH2cvnK5KeovJ3jRr9AFuD9bd2+MwJKo7GQz0IvMk5ZYNP3Bd+vuNyYUXU5AIo4OpBmatlZkxYAC2nuan+hXRdidmg', '0');
INSERT INTO `cn_log` VALUES ('47', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-23', '1514042653', '28e7YBYAasmL6lzCLtNd254GzqGX877oO8IfT53rZ0YECJuIF01VOm2D/sBhUzzpsRaWi1kMadA/nmiazKO9tzVKo3lfyWmwbw', '0');
INSERT INTO `cn_log` VALUES ('48', '8', '13', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/user/kaquan', 'http://mls.net/fwfl/', '2017-12-23', '1514043740', 'd626SfyW4ymswFVXHudPften58gbe6p86MjshSP1lJZHzZHVxnu8G9RUV/Ux8I5mHunnTjGpfpaNPIV0JafSl8dZ4DaFTvFU4Cs', '0');
INSERT INTO `cn_log` VALUES ('49', '8', '16', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/stjbhl/', '2017-12-23', '1514043752', '0a1cxewEI4sHKZ3Qjn7sdk+A7+Km3qwtCPiCmJOX8EVYj7T1DrM4BnpKcrB7pliVvp/vQDkmg0TDWTiTww9oYMTXR11JoJ8QXBo', '0');
INSERT INTO `cn_log` VALUES ('50', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514043755', '9d6bb9XCsdzxkXvd9jXks0Nx3Og4mCw4jEmfcqlV9cNUrtgHMkJxtw8VRep8wpRdABm1DXG8FvaNJLkIZlYC823RlWaGgdIaOKE', '0');
INSERT INTO `cn_log` VALUES ('51', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514044327', 'da4a7KM7VX6VNXUkTpdhfZaBetQUc702V8Y6hkiu/uQafq42ttz9AaWa8XkRrYD4j0Ica+RYFgtT+GpA6UqY+t+pflP+wJVIlVU', '0');
INSERT INTO `cn_log` VALUES ('52', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514044402', '3ab5IUVNB/9I9uyPuOMWOBeF9VUndvoNmsh1K3j3Bjy/H12cOe6Fpr+aiBdlvO3/LIGxAltyV8MZ6GrJkifs4jp1jYqnOoOB+9c', '0');
INSERT INTO `cn_log` VALUES ('53', '8', '0', '10', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/stjbhl/', 'http://mls.net/stjbhl/10.html', '2017-12-23', '1514044451', 'bd018t3A7Np22k2/JUdkoeOkq+BSV2aBhho9WJ9k43RCTIvFt9pZmexKAbsHZwPzO4vrEgr24cY5FA7ln6maKRxPVtMKLi++q5w', '0');
INSERT INTO `cn_log` VALUES ('54', '8', '0', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/user/pay/1-20171224120745', 'http://mls.net/?ef', '2017-12-24', '1514045268', '9fbaRW1VUr7c4AQRxy8IafKZRDp/4iCsWNpPKx2HWGyk2DkQEURMRb4i5LsRdGE0alnm7+p1AY0MtryJ175brQ5Mef0U5w2YHA', '0');
INSERT INTO `cn_log` VALUES ('55', '8', '9', '0', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', 'http://mls.net/?ef', 'http://mls.net/mlyy/', '2017-12-24', '1514046736', '480206GYElg0gfh6Spu7vvGNrPkS1KWPzKPi9ec0wl5tfQEqQqMMaZqtWm+L38kym1RvOsuNftfdAB/L+Jau6EEi5of+UfjSAw', '0');
INSERT INTO `cn_log` VALUES ('56', '17', '0', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-24', '1514102864', '1acdqZXbgnkbVRE8aSodfikTrmScwVBs1tTU5j00i+lUo/wC/bz5pGYrH558NAlpQzP+8lBzfjaLpU9DivX8VUfXOZDzBr6DgA', '0');
INSERT INTO `cn_log` VALUES ('57', '17', '0', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-24', '1514102871', 'e732Pq2ljW15Ze7D7ik85Xezk90233wt/XSByvKsN3hPuq4Q/nc8tV9ifIx0ZWpzs6sA4s51VJLK9WMUXwzfTv+Lc3+ljRt2+A', '0');
INSERT INTO `cn_log` VALUES ('58', '17', '0', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-24', '1514102884', 'bd0eYTeT2JcM2ZVb/SC8Ksm+xMMoi9o/uiT1GYg59bNEw1n95OGPftcWdV+PC9vRljhI99VS21tCd0EHXGypA3FO8RtI48p4Xg', '0');
INSERT INTO `cn_log` VALUES ('59', '17', '0', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-24', '1514102886', '310aXgfnGlL+QuLSXv6HAYp9E2dEdC7ZNpnDqMmDk1NPeYz99SMAI2UcjeW1S/fBpe4xD+rjV0LfT8fkVlzb7dccC5NG6XDHqg', '0');
INSERT INTO `cn_log` VALUES ('60', '17', '0', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-24', '1514106202', 'fdd8GBXRxCqkYWAK/i58xWHNIfbdbx4SovlGaHNsTJS8fp1EdVwW4mpnrwL0La1gGkQlcnPCg8F7CyWFKgmIg/vCK3b8Y42ljQ', '0');
INSERT INTO `cn_log` VALUES ('61', '17', '9', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/user/buy', 'http://mls.net/mlyy/', '2017-12-24', '1514106309', 'be97kJPsInGOwtcWdRPvtBc8E56tfJ+PTvQf62Hnqh/ulPivREWeNJV4S5WQfrW3zQmd04R7ClKv4w0jeK4yO8C41p6TDgNLiQ', '0');
INSERT INTO `cn_log` VALUES ('62', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2017-12-24', '1514106322', 'b09cAYfdNcfAF5ckN1JFqwhNt1Uy4Nl/H36cxUW+Xp8Qiq6yzkRP64ZXJCImNjyKjC5o297NvSFreT/Hy0uBCCl8SXHluY0SRho', '0');
INSERT INTO `cn_log` VALUES ('63', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/yyservice/', '2017-12-24', '1514106324', '6f23F2op0XnHF7j+TeK2CqYAg7sbAZnJ8kGc/ecimbLvvjsqpWpVz/MAkgEJLQ6qyFZay4c0B+hHc9O4mMK0tBCic2fvgUt0hC0', '0');
INSERT INTO `cn_log` VALUES ('64', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514106894', 'd39eQ3fgnx6M3M6bz6O5fvUu8aPlCU+vmD7kZ8XlbbDruEnJGaJ578IXLoqFXYpnNEMc84wDzX1VYu93S7jViv6wqk03MVg+j50', '0');
INSERT INTO `cn_log` VALUES ('65', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514106904', '3773HIFSvNtOHrBXLBMOq63IBo3oPf2+yo7xtGk0skLSFPShh9MxF3MWtZW7ShmR3G5JNElRwu373wnvJJbmY1iDHmDdbuTnpq4', '0');
INSERT INTO `cn_log` VALUES ('66', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514106916', '9ef2Ge/c7e6upl7TRoO+IRk73TLy1WpmtyNbLNgPbLfQE0/B9EafqExnuUiy6KJRQuoAut62gf42Hdtj/W7hHk0rIWG3CyG55Zk', '0');
INSERT INTO `cn_log` VALUES ('67', '17', '2', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/', '2017-12-24', '1514106946', '53b7wLsFLkvJzGFsrJ71T9bniZNetj9wNNDifOR2Cl7iTuA1kW1Xvn6z5P1gNVnGw8Ql47Stl7pbuJ4IO+yi6EbqM4ULgn9Ibg', '0');
INSERT INTO `cn_log` VALUES ('68', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514106954', '7be7XnxXm+fhdXLZMdq7P/npvgJBfEyCzyTZZBFVN9APYY7piz69BiCJzNA09kyqJvgfzpPLApBARZdi++3Tdk25py27qh9msMM', '0');
INSERT INTO `cn_log` VALUES ('69', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514106957', '5eb5fQIqr6zi3UQnER1vmQCW6NHY1pkw/Y5XsmsllB8HooJh2LZE5B1QchieLFYTjB4uEWqrGRCziu5RfNKjn/JNTfWL1PFBSNw', '0');
INSERT INTO `cn_log` VALUES ('70', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2017-12-24', '1514107242', '151ffRhrhUFIM/x1XNtjFS8lxbTeW7z2O9DyIEKWxcwE9IdxsavTjs6VZ+mUWSjNfOrB2IMUnBDrk8RRfmAob0lWYnxN77V0X1w', '0');
INSERT INTO `cn_log` VALUES ('71', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/jsyy/?k=归属感', '2017-12-24', '1514107250', '93190NF9pNGuSUOBXIcl4SRdmBBJp9wthQ4eqsZYnG3SUp6bpKu/NHwvB8WQ2ZL6acRSGURP2KfLfA9vmNrq0TymTZgfPgXOQWo', '0');
INSERT INTO `cn_log` VALUES ('72', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=归属感', 'http://mls.net/jsyy/?k=老师', '2017-12-24', '1514107255', '77aemqG4zkZg2s4WEhSbOlXp5xtFPXy50XVPfDG/qTsZ2zM3COgx3yamifF1n0Yf7eUnEJ32nL5evUy511oiELxZyTXuRRrLFUo', '0');
INSERT INTO `cn_log` VALUES ('73', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107527', 'c551Od20hiiv485m+hyaylgbIovdqB4g7yqVbWj9ZRQ7sHDMQAipy9f2qUPSHrmDvoHQnCBQk8swtgiQthPrd8zU6Ljj5hAHyOM', '0');
INSERT INTO `cn_log` VALUES ('74', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107574', '569beItA/mfw8btA6LopKEbISVaSYsm7M5R9uScGb4l+85+9ZZyKOmQMDz4os6dtfyZrNG1i26rVCQ0xRlYaUY2/aUFS0YQH+QI', '0');
INSERT INTO `cn_log` VALUES ('75', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107638', 'e9ffR8YL/X1hufMpUQajhlqha86LDgeSI36xLYxViMFc/Czkj/1EQkBNHx5REMGs96J0K2qV8maODmUmiXaGn0c6EpLqZcNqyWo', '0');
INSERT INTO `cn_log` VALUES ('76', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107650', '1c871ZYjOX/nhVOvwDKblWiCtzq7T8oWDQ3khabe6pqudvu+H56m3K6WZNr/FE+4qsNlc00i9UfhYoKki3YdXk3SanqV5vdBP3k', '0');
INSERT INTO `cn_log` VALUES ('77', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107659', '8190/l6cI4hzoFlq6QSgM+ZnsCi0bdms5pZEWiIlCJ0jNmE9jzonz7Vc2hEIB5jEmcbAi9FqA6R6OCgg/PolIu7GZ2Bgdykjuog', '0');
INSERT INTO `cn_log` VALUES ('78', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107680', 'd430oX5VXSKPtmq26+p90E+4TBRjTVMyCXnkx1kpi1QkxcWG5u+XsvdK5dwyTZcDcTsBUiUvQ2j2KeZ8EJPW8O3CgN+CubtRqpM', '0');
INSERT INTO `cn_log` VALUES ('79', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107731', '274f4TxWpjRop1vRcP0eNz0pTRI5OVckUihBdJ/7sinKrc5DVuoSK3mo3W/CJii4Kn4doH6CTJxIudFUQspy3rn6oeb1Z3vsiOI', '0');
INSERT INTO `cn_log` VALUES ('80', '17', '23', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/yyservice/', '2017-12-24', '1514107737', 'b70c0jZH2VoI+6/rZtfOCCzsSSziKLbr4+JQT7iz1oDGge2VBMw5yCiWzIKHf1wQX/Ed9V7K98O8fs07xaGeZIn2yuCM2ckfXUs', '0');
INSERT INTO `cn_log` VALUES ('81', '17', '2', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/team/', '2017-12-24', '1514107926', 'c1bdc7PVnZYJQWGxT2Y5nSDCWiDhpd2FRH764FrfCaiMSlzunP8y7aeX9wYAsGrkqUzw01TZ1CIPomIh7NrwpxDTdYy09lovTg', '0');
INSERT INTO `cn_log` VALUES ('82', '17', '13', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/team/', 'http://mls.net/fwfl/', '2017-12-24', '1514108159', 'a785LkP6nzZFQSJfQl3Xho1secprJsuSco+ymFaJOl0swBctgSsRGjGUdNBSotI6pEYGB6vZzciSqMCt7gjLiMrKniR03c3NhRo', '0');
INSERT INTO `cn_log` VALUES ('83', '17', '9', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/mlyy/', '2017-12-24', '1514108161', 'd85asp5tMKRNEmKQ9s4/GHsdY0wqUqPjymLI++dKyWtexY0xIdVHfujQnmR1w6MoMdS6T49ynYjjzL3MJc4MFMPBZtVzwy/qQw', '0');
INSERT INTO `cn_log` VALUES ('84', '17', '9', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/user/yyfw?id=2', 'http://mls.net/mlyy/', '2017-12-24', '1514108227', '8166hFkHxMF2vSIXhD9dvSf5P6eM0LB13R7atDPHcpVi1sL8P1WAPS6WyTU2Qo/MlozA4gmKx2fZpDL0hl0j9jQuGuL2GWdtHQ', '0');
INSERT INTO `cn_log` VALUES ('85', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2017-12-24', '1514108229', 'b460Kku8atfxt3aEFc3d6WiuBPtGgnh+RqBEJaios7iVjtIxtLwZ0z6Q7Yq6dlJnttP29kg2o50R9SGqUClq+s0w9zOU0GVlxR4', '0');
INSERT INTO `cn_log` VALUES ('86', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514108232', 'ce2auM1g/507HsbfxyuithPaNA149f9yjmrQxZ1f1Q9puivx4+54CONcssLwS5yPx/vIN7BGEntG9KPuwSy7/uyEtchB+4R1MQ', '0');
INSERT INTO `cn_log` VALUES ('87', '17', '9', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/mlyy/', '2017-12-24', '1514108317', '8fddFk9DPI8kp8jlAA5GTUadL1ZsKgGHfGHxBvcqnlCMEkAFWuCF+8eslwB6TFJgB0qWdsZ6Q9FyJnDPRqbNRWNz6RN82cyZKg', '0');
INSERT INTO `cn_log` VALUES ('88', '17', '25', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/mlyy/list-25/', '2017-12-24', '1514108319', 'ca2f3LzpRtnL6I9dghGq6RL90ee7ZVFxRxIRee5v/Y5cRcAvArZAKxHrOxEwaUXS6yPhl1IMDH4cHucJ71cjeWFViW5FxRGBT14', '0');
INSERT INTO `cn_log` VALUES ('89', '17', '24', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2017-12-24', '1514108384', '5982Wn4RdsVyS/mBS5Y0BWnSH2aHe2GJr5tW2Beiv8kRNNlud5k9z8zL9K3AWkf8zhqcmKImWqzTNER49BfMDCxdAClvZP+kRqg', '0');
INSERT INTO `cn_log` VALUES ('90', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514108387', 'c4c8Ec3H+oa7cwPFq5f3Cu82XHl5rmZbia1lyEs3G3i56EKHQE9FHWOgjtmvAr4zNB3gz5mSQbFbV9oevDm3+GB1fp4ZPQHVrw', '0');
INSERT INTO `cn_log` VALUES ('91', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514108390', '900aJddIUCkOgJmcOm4gnGrlAkl0KSvhEC15ZpSf317552aN7c6EpkFwlN9+OlsaIwwoCnJm9yAoX/T6cqdrdetEoMiCw0kMMg', '0');
INSERT INTO `cn_log` VALUES ('92', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514108401', '0770f1iAQ2XM1mz8XouhowmsglOYfvHx5DyYLrH7fQTtdtZx/5VADIuIaPBt2HTx9IESHi+oRdtpDHoUiFFPkPaRI1nBGr4Vaw', '0');
INSERT INTO `cn_log` VALUES ('93', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514109475', '3f40WwmWTLC3Wsd2a9F3jJiP0OFGwdjOd/N29HWenwjZaTHc0LoRDBfdWlrrc0Z9SrlgzOxYYdTsCcyJcMI89017+YPKLnKKtQ', '0');
INSERT INTO `cn_log` VALUES ('94', '17', '0', '4', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-24', '1514109550', '99c8y6aSt6rqNrXY0vyDOrIKjOUCxFyN4LEm8cnA313is430rKGO2G22SeDbJHJ0FBB658OdEkQPfFEmA8wHZDhmTeJLXesX7A', '0');
INSERT INTO `cn_log` VALUES ('95', '17', '9', '0', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/mlyy/', '2017-12-24', '1514109784', '5196oLaQ/QsBwiWKH3sO6JVxXN8zKPPi6gRvGsFV0RWK5Z92ebl4yNMRC8iiE/oBySlAdKYPHtedCI4ZEXa21CqviIeN5Zl2IQ', '0');
INSERT INTO `cn_log` VALUES ('96', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', '', 'http://mls.net/', '2017-12-25', '1514163527', '4820YStlLPf52bo5MNYM3ujf3FBNDLFqHS4oMiRUET3GLVAUzfaBs1HyaYur3Jf2VTtn/cqi6ILjdkwXMuFU9Bb8mDD1LnIrbQ', '0');
INSERT INTO `cn_log` VALUES ('97', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2017-12-25', '1514163546', 'b8daVf8M//f0Q6DCftlnG4Ir7/aA4igRVEOzrCqPDycwpZiDUZAkJxSADGBTfZO1kfQGFHA2wSz4UWzA55ayXARQfDtQldiecQ', '0');
INSERT INTO `cn_log` VALUES ('98', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-25', '1514163553', '8f200m7Sc9MGEX4sfy1AlOYGCSzFybNoVbad8L9zNW+udYdKuPYT1mgU7+BRVqLVHaaCzDd7UsiJa8m2OqfMHJCf6CsTfO7rug', '0');
INSERT INTO `cn_log` VALUES ('99', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2017-12-25', '1514163555', '8adaOr1LSEfb+FAPazqsFU1q29aub/IkCc4hdrB2Up/5LBE7kpF9AnG9Btewb795yBpztiehyGB8kTKxmd2NqYUBJvoftAIvLg', '0');
INSERT INTO `cn_log` VALUES ('100', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/?wrnd=qm', 'http://mls.net/', '2017-12-25', '1514181566', '5506Q0oBe8T6XRI7SNY0mYQ/qJqTFfmYLli302TEVak9uIgPPAE0kBySj1YgGzo1iZAz9lmLDgdZKIuCFfeGZSR/KAfGcltWMg', '0');
INSERT INTO `cn_log` VALUES ('101', '19', '9', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/', 'http://mls.net/mlyy/', '2017-12-25', '1514181742', 'e0aerEaKdbudccRAFfKL+rxbEZNKAMl8n5LUJy3smC5xNnUEPwU48AQCJOVXkLDpHL+IGRbYAl4GVELF/4IUnm0s/FCD1tMM7w', '0');
INSERT INTO `cn_log` VALUES ('102', '19', '24', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2017-12-25', '1514181745', '371dHUQ8vcs/UFEArhkqcMQaPAXvEFaXZcYqstWPUE+lYSjUAnDFXm4sG8agUU2H8dmQdr/eipxHp0DmFb04O5rNFvuaE5OnJEM', '0');
INSERT INTO `cn_log` VALUES ('103', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514181749', 'a1fe6Ya+At+/dlRcIhAA1rCZlxDihcLAQg7QW4H5yA7IgVlC1wo+PjN0xIMJ0hMHQ55cPtSalOpzWwxaDqgy0HNn1FjBkw3zcA', '0');
INSERT INTO `cn_log` VALUES ('104', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514182112', '6a42MqHUOgn2bMMNEONtteMZ8TOJMOnS0rcN3TdKPhkB5LzjmjLrrI6gJUaMWlP45Hc0d5uQmLPsM8bLuIFSehxx/3mtS3UWfg', '0');
INSERT INTO `cn_log` VALUES ('105', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514182178', '94b0ZEyqtC3mPeaAT64TUNlztJN4YlA/O1IrdQUE68+dBj2PcqybA3SbQSVaTKfmfOhUjlss+znvR+j4LXCeGLPmsgianzV1sA', '0');
INSERT INTO `cn_log` VALUES ('106', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514182193', '0522KSgaJfnJds5l8EHgVst71kQOxc7eA2gJqH834MFKQuYfOPUdDBoBOpOxcb2FQdSCxKaqfYQ2j6wi9W6izsBSy9WAg/EZFQ', '0');
INSERT INTO `cn_log` VALUES ('107', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514183603', 'c25arlZ/Q5Pnl8BwAodpsV4so/oqECsrW/87LtdNMCqupxTTNoCyIe3KaXPFmogmZhuu4hi63gIzEyqGwgJZZv0FRvbZ3gEJkQ', '0');
INSERT INTO `cn_log` VALUES ('108', '19', '8', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/contact/', '2017-12-25', '1514183668', '6cf4wcVvkkU82B8Ab4IXFctbWwsW09quA4ASdZHy45+6gMJD2l/0XtD2xfgF9XOVSZf6vY6HLUeFXHdWJDNYXTLkvxJchJLD+w', '0');
INSERT INTO `cn_log` VALUES ('109', '19', '9', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/buy', 'http://mls.net/mlyy/', '2017-12-25', '1514183760', '5a7eBx+DOXBxBt1Ben1PYRSMc8h7um+LJx8DDjIyQCiO6KgiRb6TiL6myOCJrhWZRTuv9qhJcd85grmTYyQRfaWzFbTljVb0iA', '0');
INSERT INTO `cn_log` VALUES ('110', '19', '9', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/buy', 'http://mls.net/mlyy/', '2017-12-25', '1514183823', '86d4DQNJ3t3nTSpbW6xDiXwKT3GHuF6rkS1GvWuDR5qpmoADCiTOUFiCHg0ng1gQ8rdrYeUPCK5ps5z6rMGgs9o6gaoIIYp1Hw', '0');
INSERT INTO `cn_log` VALUES ('111', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/yyfw2?id=2', 'http://mls.net/?ef', '2017-12-25', '1514184725', '202aKb9xGdXytHcm2s/cw3BrmLhu8ACpJpuGv9HbDcnq/MyYhrR7a2NULu3Fedi3R6PbMWxyQsImeptniwqUZ9DTCQ4+HMST5A', '0');
INSERT INTO `cn_log` VALUES ('112', '19', '9', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/yyfw?id=2', 'http://mls.net/mlyy/', '2017-12-25', '1514185339', '6540iqZQbtDoBk2BnepaDwonWfS5hXhzmZ9PcUVecLygYqEQe34ci7ptd4g1Malm1Wq4JRN7SpkE9U/YmKVif6PHH2MsC3Ffrg', '0');
INSERT INTO `cn_log` VALUES ('113', '19', '25', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/mlyy/list-25/', '2017-12-25', '1514185341', 'ace9SwCHes3BtjUHWIc559v1fLoDnRuqbFgGG80xSC3Yqyv8qajOev5eN9eFAoEMS1p0YzviWs+XBa7Ur/bhhRGjIwNWvyWlwuM', '0');
INSERT INTO `cn_log` VALUES ('114', '19', '23', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2017-12-25', '1514185570', '0e64wAInZuwY7AJ8PcxvvqlwtmlEz21qLZvGJO/uJ6vAlzLwj8iTtCsoSossSB4DYuiZjKqnIAlzwisOG/c1KxssELEble0TgEI', '0');
INSERT INTO `cn_log` VALUES ('115', '19', '25', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/yyfw?id=2', 'http://mls.net/mlyy/list-25/', '2017-12-25', '1514185592', 'f3edKCrsSdqFwl7l6/se7ZtZvNTkZryt7hqptUagrp9hYWsKEynPdUzWSNEBpf3nN0TH3PHnY+KhRCUzMFKxiMc67TPkS7KPSKI', '0');
INSERT INTO `cn_log` VALUES ('116', '19', '23', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2017-12-25', '1514185706', 'f2f865Y6BDDe+Hofg5upr2XwxPqcCMfWHCNyJkvM3flC5BBUkvQgJYI04klh3nvD1uBNmk8idSEMDwj4YlUfYit2U4yaIQZWBSY', '0');
INSERT INTO `cn_log` VALUES ('117', '19', '25', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/user/yyfw?id=2', 'http://mls.net/mlyy/list-25/', '2017-12-25', '1514185734', '049dQfr27hVFhvnkMBZTfkAA3diNZq1e5fw2zomyo1XuoSRm8m74tuxJ0SMLXbXLHRcjbzIueSUCpQFZaPFb2yY+YmUT+eIalLg', '0');
INSERT INTO `cn_log` VALUES ('118', '19', '24', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2017-12-25', '1514185925', 'cd74t75fYCCUUQesq8tG0fmuEGqM6guFC5qLk37ewjleG4bjI6iP6Fg4OOsbtHiqm5/DkTpD/KfMFXQpF/YlgD+9oFPZ2x2SHfM', '0');
INSERT INTO `cn_log` VALUES ('119', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514185929', '3949AYPPOMEIDXlVY/VEZGyU+ciGlQLmwMcTSge5FEvkfsof+ZSjEtlkpXUcKNIIBqMAQ2WUtPqthmEESPyFIxp3jZ/hkZfhxw', '0');
INSERT INTO `cn_log` VALUES ('120', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514186336', 'f64chXN9jBoG5NZzWE3Kz9OLpIU5a1T2baCvD2hkTf4HbDx6JuxztL8mI7kAYrBqqvXjZq7SHO1hB+Zp4QZtCzC7tyx/0g9ZDQ', '0');
INSERT INTO `cn_log` VALUES ('121', '19', '25', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/mlyy/list-25/', '2017-12-25', '1514186345', '7cebp1kv9imL1RXEgLsntavP0ikUpRcTjNsSkBCceVj9CzP7CukbCCudpTRcgGJ0uxeVroWlct55+SIrXHJlY2B2dnl8gc5ytHw', '0');
INSERT INTO `cn_log` VALUES ('122', '19', '24', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2017-12-25', '1514186541', '11c2fIa6DHAV+bSUO8zAMOUinJgUQKqGf1vWsY2KNkfU9ZdKI/2WmWxJi/eVS8LsDRylCpFfH+d+xvdpKWQVqjcpgCMw3uQbAHI', '0');
INSERT INTO `cn_log` VALUES ('123', '19', '0', '4', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2017-12-25', '1514186544', '1c15oasdbQcxmGhrOsKCU03JEtA3xMkNiPFLDFvBC5llFl8GXnXL3Uw2cwf3p7BdNQYOYKTOFsjdgzKnSHgO8ydHAwtZoXS6yA', '0');
INSERT INTO `cn_log` VALUES ('124', '19', '0', '0', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', 'http://mls.net/admin/yuyue.qm', 'http://mls.net/?ec', '2017-12-25', '1514188803', '45c7XLjFT3aulo+nS1h6Age/jfUfl2Dp2J6ijvygGKSWTVzXNP2nNjzJ6c7Hbboz2U/Z86nGfnbV0PDo8PsTXr8sdNbPX+L/CA', '0');
INSERT INTO `cn_log` VALUES ('125', '20', '0', '0', '6eeea0bc26347a7b279cc177233d3288c4498c9f', '127.0.0.1', '', 'http://mls.net/', '2017-12-26', '1514249752', '1308RzwnHhSzuXELxMGhZpaVMu3xpR8CoPT7dFdeDqf6WMiEXGVW7sDXdARwR0VwwDKLm/6M3Yp2KD0WtqHj+ctWLy13/uNgTw', '0');
INSERT INTO `cn_log` VALUES ('126', '20', '0', '0', '6eeea0bc26347a7b279cc177233d3288c4498c9f', '127.0.0.1', '', 'http://mls.net/', '2017-12-26', '1514249752', '5ff7gZCeiSqr6xqesdx2f8rE3SK8E0ehoPTt94VVBdl/JY9nBVl2C2EtT83J5gsReGk9itP0fmytH7GdTv64NrWktmubcq4BAw', '0');
INSERT INTO `cn_log` VALUES ('127', '21', '0', '0', 'e55d899a70e2716a817234f1fc470df8275b51c5', '127.0.0.1', '', 'http://mls.net/', '2017-12-28', '1514422802', 'd039TPN+LZIbA4W3O9AX0gSwG0KR//PD8JVFwnoYl/OnSGqS2pg7zi7tcQfNKW/dDrW4HZVQeXG1U7oH5FUmpKE1gcUJPHRn/A', '0');
INSERT INTO `cn_log` VALUES ('128', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', '', 'http://mls.net/', '2018-01-02', '1514853598', 'bf4bHQ3XdoAWr6xI8gRYl2FygbIP8p2tvlXwcOOrHJiRaYsuEnBx5+gz6+VWzr98XKfPKCtzKMx3MDIIWR+HEtauds4TyvUNwA', '0');
INSERT INTO `cn_log` VALUES ('129', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/admin/index.qm?index', 'http://mls.net/?V=7', '2018-01-02', '1514882299', 'a795ugvShPPpvXVSrYmwICbK8xKlBiGRJC2TtbQviu6KGk1zqQ9NR3ueX2pEgn2tZDcmyBUYUGI+qAILzM6K5RBU36t5fOxLaQ', '0');
INSERT INTO `cn_log` VALUES ('130', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-02', '1514882302', 'fcbdqRY9crpS6pJZVf4m9XcaUE7T5ujQ2/aSyDgXy5YZzMbRcg/v25W6Z6Z500A2UApZKgnSiZ+lxq8x9YcbMPJqvLIc1X7sdA', '0');
INSERT INTO `cn_log` VALUES ('131', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-02', '1514882318', 'f1e1/bqZTKBDsZo8km/VicVaPdzZ8EvUj8Om87UCUWQmAmzNSvRKuf9NE5R5J4ctcg+EkLd7bN/uGkOuTLseuYBEvAQKSkQZaw', '0');
INSERT INTO `cn_log` VALUES ('132', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-02', '1514882320', '839e0oRJ7JK20SzhaoxlLB98zP3cxZSCD65etyX4oynJsYBl4LLVGDxXmRTX+Rhuk6wfwr2F1ByHj0LMB9si9cVJ0vMIe+6nig', '0');
INSERT INTO `cn_log` VALUES ('133', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/admin/order.qm', 'http://mls.net/?ec', '2018-01-02', '1514886377', '3b4eDgpCITx7xyUMpEE7U7jYCM4udDnrp2OwU71C0spB/15Bt7jfGdkGChOofkT1PE20fMth4xHiBZkr2jSDVJBtY6qcqJJu4Q', '0');
INSERT INTO `cn_log` VALUES ('134', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/user/paymoney/1-20171223064449', 'http://mls.net/?ef', '2018-01-02', '1514886454', 'b3d1LXJzdSX/Ip/2fCcX1B1UiMuqNiq00esWIXMe9XnqsqqKIKU6crGzLMvg+4fVehTUujbbmcLhpaSZ5DIrdCj8dAO216Z9xw', '0');
INSERT INTO `cn_log` VALUES ('135', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/admin/index.qm', 'http://mls.net/?V=7', '2018-01-02', '1514886494', 'afc8DNjQik3gNLSJc03yoXUbh+eDf2+YT4/jPAVwX5cjmN9Te2ikCEHyFSwdeQ/F+p83HuJSCH0ITGIxpdSH3khrkRWYLM9T3g', '0');
INSERT INTO `cn_log` VALUES ('136', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/pay', 'http://mls.net/?ec', '2018-01-02', '1514886577', '1bf21TLU8dS/GJ0kry9Q/e8SWJBbGPAITIgtZQjQkj/7xYLAYeiNHcoO84agWHBCA2+1d5eRTH18rVTM6qoOjmH5Bkutxkne3A', '0');
INSERT INTO `cn_log` VALUES ('137', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/pay', 'http://mls.net/?ec', '2018-01-02', '1514886628', '0f51AIGaPxwhJYhnuPlWZwBqOY9ENzrbFpJ+f1E1BFf813dHs6OFT8BawBG/vOReQ+1/Da3Rszv1x5If4iIRGtkR+1JS92ZD6w', '0');
INSERT INTO `cn_log` VALUES ('138', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/pay', 'http://mls.net/?ec', '2018-01-02', '1514886649', '3f68/GIGHdJfsk7iqeVgM3oUdUgW7FFo+9a0qLg3xjIgvw09AwWy+6lgpeENxrvBOzCul/WIjhWKQyWShVb7nMa32aY2fxcdKg', '0');
INSERT INTO `cn_log` VALUES ('139', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/pay', 'http://mls.net/?ec', '2018-01-02', '1514886672', '3f9fi2rc4LMdNdzA1hlRMh3n1bN9YvLt+AZmWKmfNgXxxwpBOaB9evpz6oHPTss62yrml83n74LRvSr7uZwOVBlMtw+ArkFl3Q', '0');
INSERT INTO `cn_log` VALUES ('140', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/index', 'http://mls.net/?ec', '2018-01-02', '1514886728', '60ff5TyvtY+5FZoEp/H4CpVWq/GdNOmgE+X8+Q11miANNlDMSJKnAgKB5Q9qGEnwdCa1q3KTRTH6YXhLMlbjBvJkJkB5ubkF8w', '0');
INSERT INTO `cn_log` VALUES ('141', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/index', 'http://mls.net/?ec', '2018-01-02', '1514886767', 'f015gG4lDA51i61O/aMNlBrtnqqcv/fEbGxZSQPs8AL5jW1WcO19puAIvHspBeWox0odJCqBWOX8KoM4KUZhQDlcRbBzAOWW4g', '0');
INSERT INTO `cn_log` VALUES ('142', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/api/api/pay', 'http://mls.net/?em', '2018-01-02', '1514886873', '793dS3MqZzcwOpTWFH9BcLp4dej36I5sjIt74DhneFQC6PmYDDgRz4sxenGejjwKgTdDDdyDPYFKtDxvg0YU+CN//lMOO8NVJQ', '0');
INSERT INTO `cn_log` VALUES ('143', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/index.php/index/api/pay', 'http://mls.net/?ef', '2018-01-02', '1514886919', '40absYJUyv2qe02NrZ+k+xobu+79l10FjPhipI4/bBINdz5LSM+CnjHhFdHFg2dcDng49ZomE35/8oPskfrPTKtZ7vtNmwZF8Q', '0');
INSERT INTO `cn_log` VALUES ('144', '22', '0', '0', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', 'http://mls.net/admin/index.qm', 'http://mls.net/?V=7', '2018-01-02', '1514886946', '5958QxzcSiMu7a3tNZFPqZ5WaUH3sb5HlAatZjP/st6adOg2i3ybwP2jDwJjTQFSA2oaEWcCZmpK+bZ3FmuFah943MitELmBgQ', '0');
INSERT INTO `cn_log` VALUES ('145', '28', '0', '0', 'f05caa17fdd4c8a1a256aeb6a10cc4df29eccc6a', '127.0.0.1', 'http://mls.net/admin/index.qm', 'http://mls.net/?V=7', '2018-01-03', '1514940899', '7542vfri3uW158ZD6qXZPyy7J6dlPecHC++JJx9EjfrPz+RlGUSCiIDxHpBlkstlRHSHls/mN4i3Z0ineNj/tBcRlfHiZoMCfw', '0');
INSERT INTO `cn_log` VALUES ('146', '28', '0', '0', 'f05caa17fdd4c8a1a256aeb6a10cc4df29eccc6a', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-03', '1514940905', '7aabvucQlvi+Oi3wIAyDfyzYdaShhbSj5AwnB6HnBxCsC0m0VX6LpG1Uc4froCHr2nN3iFhTDIxoK02XCVtmECq0nI1rYNy33Q', '0');
INSERT INTO `cn_log` VALUES ('147', '33', '0', '0', '789b10da2a4b778526d10632e52331e2fcec5238', '127.0.0.1', '', 'http://mls.net/', '2018-01-05', '1515135058', '1412QJzzYZ10fPyQxgIx1MOtVwyqKucW9lVJR/vBhgbZcRTyTxJFRstDjNO3sBp7ID/WJuqYPyS+y8mRlM9j3tg9NjchLH5WZg', '0');
INSERT INTO `cn_log` VALUES ('148', '33', '0', '0', '789b10da2a4b778526d10632e52331e2fcec5238', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-05', '1515135064', '5123CEYLLaxPJvtbCqdc5zyg6ZBkmSuJkxviP078LpmuSFykHcEULyEtWHFrvBH3Ix8RB7ZsJcxIFfSXRsXox39mChgmZqJ5tA', '0');
INSERT INTO `cn_log` VALUES ('149', '33', '9', '0', '789b10da2a4b778526d10632e52331e2fcec5238', '127.0.0.1', 'http://mls.net/user/info', 'http://mls.net/mlyy/', '2018-01-05', '1515135703', 'dc82Fe0kDLjTBQ18ID70yCHHyuIPvKyLT67dl1VWmlGG6bJVnAhGYJRPxsXgazyfHUcm/1sh2IiRx6rZ1iTCu1fn5JE3eqw0Wg', '0');
INSERT INTO `cn_log` VALUES ('150', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/admin/Lists/add.qm?fid=2', 'http://mls.net/?V=7', '2018-01-17', '1516153106', '7b3dh+yEbPIG4VJhu0Ogn0BBGrOqaGN6y755XmfR//MjZLrCn1XvLCs7cMnsDRPyUpw0WCex4jGfQa24bqSZxq1Rbn5iA5SQJw', '0');
INSERT INTO `cn_log` VALUES ('151', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-17', '1516153112', '5f0cJ2IoHriEmDzWhO5itxPYDv2yYITQMNsNCkfk1mMFSXxAPpsEqV0YWJ7tqOO371GfRUGwekbZ5uX61x9X5rsNzc6sFzS87w', '0');
INSERT INTO `cn_log` VALUES ('152', '51', '2', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/?wrnd=qm', 'http://mls.net/team/', '2018-01-17', '1516153123', '67560pP+lPPnSMu5eYbeU3VGgFEbB4jSlJ1C8zBZigffRyaXDLC1odg7cHNGEIJD66YZGdWdbcxPSD6IA18Nk3iRzw1oZplk5g', '0');
INSERT INTO `cn_log` VALUES ('153', '51', '13', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/', 'http://mls.net/fwfl/', '2018-01-17', '1516153206', 'c8edqFMfSWXcZwXvIAy26E+6VTDTmqxKkDrvJfN0UBcRBPRxGhcukZes4NN4xs6bYe2vqmxcqhyJ+YZ7qUnyW94+P1yHwUc1S6w', '0');
INSERT INTO `cn_log` VALUES ('154', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/fwfl/', 'http://mls.net/mlyy/', '2018-01-17', '1516153208', '78ddJrlGs1zmgS0Fs3j17dPLn+UquK6EOQ97SaQl5f+8lzVnbf+64/H2mg/HV1Y3CIlI5ITPoImhdVRsD9o/wasTqiOJNxjgmg', '0');
INSERT INTO `cn_log` VALUES ('155', '51', '24', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2018-01-17', '1516153211', '366bBVcj3xVrYxdhDK6TXdgNmSjkNIXDcnLYmnkPlpVAcuXJ/RfBb66k6eYKgOJlcaprTgUaT28qeeXsxPkSedjmlFOVS614L00', '0');
INSERT INTO `cn_log` VALUES ('156', '51', '0', '4', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/4.html', '2018-01-17', '1516153216', 'ef4bS5Fs3wHiGoxoc1vCtvqM8bAf2I/iKXIQnyAj3ktS/tOTRQdVTa3kioWs/d0nJgg7fxNyQ2DCUjuhkIT2BuWfG0hHZHEkQg', '0');
INSERT INTO `cn_log` VALUES ('157', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/', '2018-01-17', '1516155944', '5d22MtF97lVXz6YulJ1TnnkmAWIfrkEKFTmcsvbDJ7C+X6jA6mw7LSVpVd7roigWtzOLMX3h21WWA2r+hvgjEJDicnlIM8icCQ', '0');
INSERT INTO `cn_log` VALUES ('158', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/', '2018-01-17', '1516158787', '7ca9AGO2pTAM5dgxtdCnrjBdU0rZ/oUOlRMMZ/EM0WLVexAdSbHhimt0G1lOwLOIv3wfFwI6qCmUtF9++DSJ7cw5v8CTaxvktA', '0');
INSERT INTO `cn_log` VALUES ('159', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/', '2018-01-17', '1516158789', '8562EXvsyFqUnz9C9T/p31qxZhh/9InylH6pvRk2WiZQl9M/elhksCR0QLiZApEeyhhdoRCk7kYllpu/S9HWybT43Zy64TGzYw', '0');
INSERT INTO `cn_log` VALUES ('160', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/4.html', 'http://mls.net/', '2018-01-17', '1516158803', 'de73iF6VqAt44fYWk6ewOvQctVkawNJXhIWdGsf3w+96qKG5USoZvykQHyE4r+tTO0HD4cqC6u5K8W94WEI6c+f7wMTd4Nt+PQ', '0');
INSERT INTO `cn_log` VALUES ('161', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/index', 'http://mls.net/', '2018-01-17', '1516158870', 'bf1eeXYbTu+JSCS/nIxSIxeb8YK6oTnuiADIUT2V+CrPiKQjzff7YmjiHlL05cUcDcHb8B46l+/a7UTQvwVnTbtmyqMQt69ITA', '0');
INSERT INTO `cn_log` VALUES ('162', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/index', 'http://mls.net/', '2018-01-17', '1516158875', '688aj4VnmU+s6SNZikUDZx5eAWzIOseggutchO+WoOJIqktjzQewiccZatXXki+j9irujk0Fd8XB4pkjjdJem8SsBSzDPXllLw', '0');
INSERT INTO `cn_log` VALUES ('163', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/kaquan?ty=1', 'http://mls.net/', '2018-01-17', '1516171193', 'e090Vr1S7PJ+3QdcRZvI4bd6ZVOjM6pxqHJMxB4qoR8SZ/uwWGEwGq+wIz/9XpklEFqRVBTiHbuvA8vBUMi1U/gNMJXdMIeQbQ', '0');
INSERT INTO `cn_log` VALUES ('164', '51', '0', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', '', 'http://mls.net/', '2018-01-17', '1516171244', '0fb3tGghDftuKDRXOnA6Wjo6G2Pt34/rkhmMpPvVQGyhhnwYFHPouT+h0GxnrJ8gV8DL8ko5wtdKuqAVTWkKIWGdYekEht3b8A', '0');
INSERT INTO `cn_log` VALUES ('165', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/order', 'http://mls.net/mlyy/', '2018-01-17', '1516175162', 'c7bc29iQGML6JJ/ahgee+ErVjXlM6V0RS/w5k3RIttnQVndktOA0SckniV2fIMiKjkT3n2YYxPE7OjqhmX2IcEKEwG/gSjqDug', '0');
INSERT INTO `cn_log` VALUES ('166', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/order', 'http://mls.net/mlyy/', '2018-01-17', '1516176957', '162feovZNNh+HINXmdnt/FNeTbAdv+bmmug28JLjS3vo9BTvGspUflO682pafH4+R8hlrZQX1nRn0sq4dtz0yVG4z3ehfsqdxA', '0');
INSERT INTO `cn_log` VALUES ('167', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/order', 'http://mls.net/mlyy/', '2018-01-17', '1516177088', '354da3I8JjF03vqsCKXFtnwNY0knV/FpcS7xdHc9Nz8iqsGjEFW8hy7WH92hTrQs8MHC2I98oTNWommBIhYwUNn2gr30y3cVrw', '0');
INSERT INTO `cn_log` VALUES ('168', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/order', 'http://mls.net/mlyy/', '2018-01-17', '1516178526', '0df83zYLGD26o3vcpNz9GZpxD1Zm/5oDixrYrqGcuyDYWLCWtyjPtMcQJNJTYgvx+tbUwvfCgfTwUXugcrC9XseAQQz7CmWfcw', '0');
INSERT INTO `cn_log` VALUES ('169', '51', '24', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2018-01-17', '1516178530', 'b2815260jqJDT8a3f8DF+tYlPy5zr2k2vMLjeKpwlFYVr6AP9uD8LYeBcyYggG6n46eJC+5MclAtiqu3UXFkRC1sdoQk4iFDvug', '0');
INSERT INTO `cn_log` VALUES ('170', '51', '25', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/mlyy/list-25/', '2018-01-17', '1516178540', '5928U5txYHHN8qo9B36ghgf2T4x80k9a52os57rRHpMnZF8WB5NyfndjL/cXWq5QwcSHJ4fKUb9b22F5hkhJhWNPjNjVpEWEUwc', '0');
INSERT INTO `cn_log` VALUES ('171', '51', '24', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2018-01-17', '1516178543', 'ac3cw7ZoGMRg9tmQ6XDN+H/JHxBVZvjEBafnVX++OXog1WhHtM+evsrrFL7ivK9vmozLPooKIKLrhgZyoWfAWZDLS3bFVvArBbw', '0');
INSERT INTO `cn_log` VALUES ('172', '51', '24', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/jsyy/?k=老师', '2018-01-17', '1516180026', 'd66cixfIZzn7wYyWgfD2PRQoXDapEvcDGZinRfptvLJ5K1aDyiKJTD3U9jMUFmYdCi/lQqNMZCIBBB0u6xQJjH+O5RY7iv+Ide4', '0');
INSERT INTO `cn_log` VALUES ('173', '51', '24', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=老师', 'http://mls.net/jsyy/?k=王老师', '2018-01-17', '1516180031', 'e957vk3NqCbAwhpAizE3r6DgeNpV8w1Eqx7WOMi8Eww/a2pqWk0SBPyziNWElHkTLZiSNJAQtsxyL+nZPV2Z7HMUgjIZ+rr8QCI', '0');
INSERT INTO `cn_log` VALUES ('174', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516183055', 'cbf4naYmfOdDZKya9nNb9v+3IS3d5xPVZ0AyB5Dqeqg+zfoEDPxAn8e8nWcYNp2WMGXxoB1meJxx1u6QI0/tz0epboXs3B0zPVQ', '0');
INSERT INTO `cn_log` VALUES ('175', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184826', 'd8f95aSdZQ/eaeRwtVMDuQga17Rhyqo/yZY01pFEntX3o6PRaIwlNszzMRgpv543t4q/PQg6kbgO+vKjPKNVmq2r1zqtUtfari0', '0');
INSERT INTO `cn_log` VALUES ('176', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184857', '6c52t8nucQjorxtZMWm7f90HjY8y9GfGV4nObzI1k4QTalWCeuUxkaZOiiibI/hkg+qO16q1GX6lJQ/sq7mNUxAcdRcakE6z9os', '0');
INSERT INTO `cn_log` VALUES ('177', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184904', '89c543TVvXpwNccTfcEiyx/eho+1BsuzRFXiBrgo3hlxCrmXXkS+ReEd94PJ6f0kDdBubELUtTc8JVVSjL/Qesa5KN3Vu+xY/o0', '0');
INSERT INTO `cn_log` VALUES ('178', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184927', '0a9cft1JTnQWModFvC6FQkdv7P/Y7jeKNvlEqHv6ejGCRMMTHwZi07rKcKkCFO6IRqDT/w3nl7jr8zVURNTAX8Sar/yPpIHefcM', '0');
INSERT INTO `cn_log` VALUES ('179', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184976', 'c5be5QT2M3ZA+fiNMhV0Z91sfy4mI91qnP1eHRW6h7TOsgtvbbYeL1AgCKbZ+GAAaaorDgTZIeanPSi/KZU+tswWBCTUCTZmsq0', '0');
INSERT INTO `cn_log` VALUES ('180', '51', '0', '12', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/jsyy/?k=王老师', 'http://mls.net/team/12.html', '2018-01-17', '1516184998', '5e389k+yQwUw+O4ghBf+s36FZF1NwqYxdIDY0+4+hDn7Do1s4R+B04mZiWfjqt23WlFMGXeXxfHvO6VxsgG0w+5ZjN7uYNZUnUU', '0');
INSERT INTO `cn_log` VALUES ('181', '51', '9', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/', '2018-01-17', '1516185123', 'a504jkMriJ8vQXcBgcqKCFHOAh21Ze6NdaQumGuTecZ76VJjCWL7U6NjFMnHWaZbYwsUftZvhIIkbYU/Sl8T5GOgERo2vBpQZA', '0');
INSERT INTO `cn_log` VALUES ('182', '51', '8', '0', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', 'http://mls.net/user/yyfw?id=4', 'http://mls.net/contact/', '2018-01-17', '1516185997', '90d7o7OXRQDG8pzXnAir1Q9ypNwndZ/6UwZjq4QxsJajfttGdm/sigVojDWsqdPoFo4snEZ2s0DKeSV7lmK6G/KITmAJ0x+HPg', '0');
INSERT INTO `cn_log` VALUES ('183', '54', '0', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-18', '1516237388', '20ffaZ8K9904gO1ENKlpbqHtBwmuohQvOt3Ge3jvhYylcQYpTj3r67JxzPdmQrh8VgtGUZUAxeAXle3Rp/xc+jJbCNZaUGaMAg', '0');
INSERT INTO `cn_log` VALUES ('184', '54', '0', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-18', '1516237392', '288b/6yb6p69N6K+w3sGxUg/4z+gI5hEoJMyNtsHRyQ8k5J+xEZm/8FLFQwYBFPkUuoce+xeRjzKGCf8eroR0kfx2wkJEr63lw', '0');
INSERT INTO `cn_log` VALUES ('185', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/?wrnd=qm', 'http://mls.net/mlyy/', '2018-01-18', '1516237419', '9977FpXCvS42fX9vXIYAnJeMr+HYs0/7bOWK9I8kVSUjjABnc+X9phf4k5NH4M2dvofxvttUjQhQmQj5kXlAUbRPkY0JnuGG2A', '0');
INSERT INTO `cn_log` VALUES ('186', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/?wrnd=qm', 'http://mls.net/mlyy/', '2018-01-18', '1516238678', 'a9d44x+abdPBUDS32eoEFeGp0cawuvibdmSbVJg/7KLID0ub+7JOZf0QWywoEz5bfiModd21TT+NSYnHCuxKgbJXZqfgVT8PPg', '0');
INSERT INTO `cn_log` VALUES ('187', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2018-01-18', '1516238683', 'bb656WaCyDyYNMlSZWu9SpG+JanKCeC1p2PoSCZTyYLyXRH0IYF4q+d5Y9HCVwbkWDyMrNHBZ70diZFNB4vmqlw64sPTt7sy8v0', '0');
INSERT INTO `cn_log` VALUES ('188', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516238685', '17dfAwrPZKmXDAK6muLRC9GYp9RekDP5rvY7K3JnlfJ3MZdGQshO5L6YnlpvzdvjvCmzDhjUQzjtPNJv4xN4iAQ1Q0X95YSfDFA', '0');
INSERT INTO `cn_log` VALUES ('189', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516238900', 'b449UPVz4MTBW0uHs3t+0UrSEgJF2LTOesN8HZ+xq7Pum024yP3P7Ofq7pD3hTfAUo3nyPuksGH85f/LjhiKTS59DC+VXAfFz34', '0');
INSERT INTO `cn_log` VALUES ('190', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516239192', '8d50Zrb5yUUUvpNjBa3kVsar6Wo7c0IgMTD8e8+4QaDdHyVIR+5c0BqP89s0X/3rvNEsK5Jhu/rXMXHxEJ4cR1vNQIb88PbOjuY', '0');
INSERT INTO `cn_log` VALUES ('191', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516259876', '2417uCNy13gfAqWcmfwwNiSFN1lTZw4/+pxKTEl5lb56UWp9pgReTJqzWCa3aijWGu0myI2n/M/I9y2SI46c5caitjkEYZ4IbDM', '0');
INSERT INTO `cn_log` VALUES ('192', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516260407', '92f2wepQ2NcQNF5NrzdhL1YpBv9xX2CA12sImu4nVyNnisdX+yb471zWG/7W5A2tr8C8hXVaX51GXx8y/NvJywygPfmPPuL64bY', '0');
INSERT INTO `cn_log` VALUES ('193', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516260489', 'b33fe7XOB+kyrdQ0aZWaC5XjQYMVGNO6issVcVd4kfSD4IviNJMbxDvMrW3qBvOIyQgLs1+TvGhV0bq2uKSB6+KI44NAHTcHs8k', '0');
INSERT INTO `cn_log` VALUES ('194', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516262250', '74d6har6+be56nDWx3cWHd4viWgWvS/J/xZ27ATpa7htHupJ6zodgoo8TduD95eYg+OTf5xrFxaIksheTgMnwGrdOIASTdlY2k0', '0');
INSERT INTO `cn_log` VALUES ('195', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262254', 'bfed3kzOFFkJiWi8f8RtcdjfsMaVr8C5CZLETj/V5takHn2h+T91AT4GensPuDr/9SnHuhKcr/zhV7uzdwWVaq8xd5a5WwJaTGk', '0');
INSERT INTO `cn_log` VALUES ('196', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw?id=4', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516262491', '97c46Isu/Cni7xWRLYcRkTtWkrjRXNiBHiF1Dr1VHmNZoKNRGl0FiT7hxXaKhb2T/Ior+DjpvdcSPZwAYiVlZYwFkRK6YxHOrBA', '0');
INSERT INTO `cn_log` VALUES ('197', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262523', '0a26NYVYByzN6ytZYENiCfW1fbzZ59bWgsN+k9e3eN4dsi42Z9KjaZ4LbiNgSBbt6LFN/3S6o98+h0zF86T+9kQv+CPXNvtiS/Y', '0');
INSERT INTO `cn_log` VALUES ('198', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262792', '542dW4fPNnx8d0CFZ1YKgs5Nxky6FcV/tdCV+0vuYQFfI0wbWZvntbZ+4iNJtn7rg2jMKYaFRUEvoLr6tm6PDWx0OpBDsP7WtWY', '0');
INSERT INTO `cn_log` VALUES ('199', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262861', '8478XwOwJs0QJJI6dg/lg64ZWtQrHIqJUJtJknuRLAxONDVZsTqze/l/BqMsCllahfOaskJWo5qxTQ+yDhSehf13Oat2N7LtSfk', '0');
INSERT INTO `cn_log` VALUES ('200', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262906', '1671XuZs1WUPvWDWzM7IIXBlgwI5Pu1Li4bNB9/oOokkrGHxRt57NswioD0TjgAGZCdc+plVzcydJK6K1+RX5pfaradn7J0IHsU', '0');
INSERT INTO `cn_log` VALUES ('201', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516262931', '24d5E5TQxxWfzXkzuyYFDJ/tB4AAxBpbXqS01DIEZrjNPCzk8oinPD9y0ui0kWa+V93SiDdmKhBZEdLZQRG50dPVjFjil3g9R/w', '0');
INSERT INTO `cn_log` VALUES ('202', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2018-01-18', '1516263044', 'd2adBzwXbNe7xXDBCJZdRd2snaYm63pGkMY6FUqfD2f5IadSFn7XNvcVMsfUM4MlP+UKJfI+cSl0uLw5SMtqJYa/F8cowcqBWR0', '0');
INSERT INTO `cn_log` VALUES ('203', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/yyservice/', '2018-01-18', '1516263049', '53e35DBGHpPMFdDzn9WjyO7TGkSNdgys+xb8UHgvQi51yhkt8gT9y+cKAJa7B8PzAay/VlQphqr4sqATrg1rWohup1Jwvpz/F+c', '0');
INSERT INTO `cn_log` VALUES ('204', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/yyservice/', '2018-01-18', '1516263336', '9a62DvA8B8BOXLIW1CIQVZRuCxq2b+lHDhwziefIOVSfNJFPnKUmRoRqQaqZWd7LhhheDjoGqIG7djIQNy2J8kzmjgQ7WOoo3Bc', '0');
INSERT INTO `cn_log` VALUES ('205', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/yyservice/', '2018-01-18', '1516263378', '00fcHDUMinqwO2UHn9p+7/x2riDBmwwq8xY1dnXVu4OzrZ/6uzqrBIIy5q2VOVzxhN6Htq7IqVwgfrYnSFtXsd/i7FCEnu4Q79g', '0');
INSERT INTO `cn_log` VALUES ('206', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2018-01-18', '1516263381', '0e87rhDd7Djmf+wIT1EHv2JB6vGwTKBV7XPECrLlI28bSt+BOCeB9p9tq0m/jYYK0LBeLYtVZEcDXDL+/QQA2SVrqTLnAHLuKiM', '0');
INSERT INTO `cn_log` VALUES ('207', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516263391', 'ffc2uGNgJRGQaTqF8XEdIzUEbiV2AooPlCu3ZrfPqlyZaw9FazbbO3/erg1iOwr/b0cjzgh+p0J7GL/52hwMrnGfjCN9F9oU84Q', '0');
INSERT INTO `cn_log` VALUES ('208', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516263563', '2493BmOGNTI9cwOjFqlUa5aCFSPt/YUrrbwA21Zn7mJNKK5jrkVseHycm7oVP/lDx9Ut358kBcxlq/CUEnf3YXizjRUcwrkdvLw', '0');
INSERT INTO `cn_log` VALUES ('209', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/jsyy/', '2018-01-18', '1516263605', '12e8T3yIjBfPpEFubWWY+1VeRUNI2OpH4KqzfRUJr6xFgHoX7u37Tosxw5QT46MaJFb57zu05jrXH9MvlXJ/7GpDVHdcvX1G6ck', '0');
INSERT INTO `cn_log` VALUES ('210', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516263613', '7537Vu5tCBoWcbZezoPDrxaFJUx18WmtMsm3b7H78qgrAvqq8QtD5L4NIUk/vV7jNahpB6NjDFxb8bsY7qTGNIcdBZlXm09FtcE', '0');
INSERT INTO `cn_log` VALUES ('211', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516263622', '9beablmlJxgKDMtEY5e5n3N8CKajcMi+45pMVqCO8rYyMJ48SWIvqjorrhvGgzDeHaVdWM7pcNB1dFTux2ldx50LUPaG8HVEPzY', '0');
INSERT INTO `cn_log` VALUES ('212', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516263628', '1565RZexB/k+fO7b6OeJZ2M9Sst4/TYDPpmPwIamIjD86ntv7VmwtuThAkNNhrob15VJxQ78AjvFO5dUrGeJsDCCFdLWRF492iE', '0');
INSERT INTO `cn_log` VALUES ('213', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/yyservice/', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516263703', 'b46eLLHYRdfVHX/jDJ9WNwCN7YfefU2+gK5FdvBCLxpsK2f1sn6STGAwUOAFXgOe/Tlod+V8NmdmOs1yxX9qH3Wfw/eqM024Qp4', '0');
INSERT INTO `cn_log` VALUES ('214', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516263705', '4f7bGtveCYuWbfaLcMlDZidUHkAoPav7mnJ16rDe18mC4RuMuWkKTyYqR1ajf9bdrLhpvMTCn+LKccoE9YGeDbwMaBRgrrg8ems', '0');
INSERT INTO `cn_log` VALUES ('215', '54', '23', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/yyservice/', '2018-01-18', '1516263900', '9a0d+g1xgzNkBHRxrOH1RwR9P7Eub+Tt8ZRtDS3GYV7wvDnkL9eB+evdW5dtT1uDFxbhdM/GUB3udAwFIPfsLKdgb43Uc/NCGzg', '0');
INSERT INTO `cn_log` VALUES ('216', '54', '0', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw2?id=4', 'http://mls.net/?ef', '2018-01-18', '1516263905', '49dcc9Rfe/LdE5WfVXg2iGD0gSWRo5pv5Zf5JH0FkqzHFApI/wCtan5B0imj079mTAYs3d2tRxx+YQ/r26bubmQwmR1YKAZaAA', '0');
INSERT INTO `cn_log` VALUES ('217', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/?ef', 'http://mls.net/mlyy/', '2018-01-18', '1516264100', '99f6zCCvDi+Z9qn6EEMMmlXgv8DaooNZKEHSjXixO1veDUxJw18k73LedcDX/Lk4bkzKtvunYL5UYB9d8TmgGJHqU7FHnuxFNQ', '0');
INSERT INTO `cn_log` VALUES ('218', '54', '0', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', '', 'http://mls.net/?wrnd=qm', '2018-01-18', '1516264356', '0e8eJz7Oze7Tqo8QOrKGQOIDUC8j+kDVvPOHAQdkrd3YatVddMdSoq0Zq+hWwEcF7BF2FO3hFWX7kF6pN+8XxJGUwCan1tW2Og', '0');
INSERT INTO `cn_log` VALUES ('219', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/?wrnd=qm', 'http://mls.net/mlyy/', '2018-01-18', '1516264359', 'f3d61Wn8Ib0EGxNm/Gxk/FcieK47lfCk5LqTx3aDdCL69Lk7nztXsCXWbyF9JbMxxBDdYfT3lDNY81oJKwRzsuVRoUegN/Th8A', '0');
INSERT INTO `cn_log` VALUES ('220', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw2?id=4', 'http://mls.net/mlyy/', '2018-01-18', '1516265377', 'fb1aKyFPXEeamP0C+uLVr7uGPhcGt76y/pbCpTfca8B49ntpQayQpZRQp2qwlWOi4UE4gDOmgBIFjTzbh62ZsponLeiSHfFj3Q', '0');
INSERT INTO `cn_log` VALUES ('221', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw2?id=4', 'http://mls.net/mlyy/', '2018-01-18', '1516265465', '15724/RspVdFFb4drjDZhAsP8NJ5sJvmtuzQlNFWgbAPkcnx6XU7opwBPw9eSAPVXJBQH1R2tUTu19olgkTYqtAEhCfls1ZSFA', '0');
INSERT INTO `cn_log` VALUES ('222', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw2?id=4', 'http://mls.net/mlyy/', '2018-01-18', '1516265584', '9f428ZgX0lyl3aGFRex9jEovB/z2fcCk7XYNpOy9LnZdu5FbDli2BuhFhVwmAllLWtWMNeV2BegAfkjqTDIWrY7DbWB6rA2Afw', '0');
INSERT INTO `cn_log` VALUES ('223', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw?id=4', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516265702', '6cd7yFehQnu3fvqVT7au5ar2zZKrC368TLk8qF0d7uitS+sJe6fKv/NG/CK5DmMji1rwZw59CaGZghd62wR9UAxDrOpb3Wao/oI', '0');
INSERT INTO `cn_log` VALUES ('224', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yyfw?id=4', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516265753', '2c28zvqgksSkqFDQ2mpVVHIPaE5hf+mA286RfCnEzgAvllXL0pPs2uXjBp2hC5uHzXmPA+CeAPRYsZtg2daHlsfY5Hn3eMWuTOQ', '0');
INSERT INTO `cn_log` VALUES ('225', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/yuyue', 'http://mls.net/mlyy/', '2018-01-18', '1516265847', 'e7906SD3v4tAQKCw4Kfn45xX2sNPWmwexN1m7ssCNKUFnBYpCYpaP/NzBYl6zBSAfMlZwz7VOp4AYaVjAOxv/LE2r3MDzGtStA', '0');
INSERT INTO `cn_log` VALUES ('226', '54', '9', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/user/order', 'http://mls.net/mlyy/', '2018-01-18', '1516268092', 'ecd8E2gZkIanDPtyUP/efy6rqZ8wv/wUH7n2RZKVce/kudPaeibs/PtrbJR0n3jqP4Ss/dNPrxA32P7VRPgU3twTfQr3A0xRjA', '0');
INSERT INTO `cn_log` VALUES ('227', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/', 'http://mls.net/jsyy/', '2018-01-18', '1516268113', '68700SFu5OB/KiHsdA9Ikg2e/GEyxiP1TToxeAdG1Q6ArU0JUq3lfh6DbKO/80K94MJm62bQqBSn4CTApXwtUqE8Bz0VQcKRjxE', '0');
INSERT INTO `cn_log` VALUES ('228', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516268118', '0ede7M6+nQ5bekH7sLM01Uey/JZesKOU37KwK4zEEDw0nDRrdZekLtn/3znEhzgiTXh4pvtCoZpdgdaZquaX93qKJ4LFmh1xGx4', '0');
INSERT INTO `cn_log` VALUES ('229', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516268261', '51c8vZ0WDNq3x8Dhi8Fp0LRbbXsJukxGaFw6RrL4OYLWL1Zr4dgBVcpvEGBGAYPYy09pYSdcxCB6ZY7CVMZTslHnV0kb9db/G3c', '0');
INSERT INTO `cn_log` VALUES ('230', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516268315', '64bd4ID+8yqmhOOMsurEm6kS9z5byNwAVkL8Ec9o0iQBj3zFSOKziwwbF/Eb8NI4+bvHxNmvnCzQcEk2KGpTwOV+W/y6Q9ZA1MQ', '0');
INSERT INTO `cn_log` VALUES ('231', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2018-01-18', '1516268321', 'f8dbgiSzpfdrqEJHYh/xiJHOinmpBzV9w9vRLkL37N9VPqoGDw15EU3D6eyaVgTHKz6SHd0j7MALFtDy4hVgrr/KGILo6U3/+xc', '0');
INSERT INTO `cn_log` VALUES ('232', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516268325', '94275V/W/D6zKyiQ+5Yw12QfJu28lUpsq776mB+x1pigBFIS1HEkr/qcK8vMKNJxkvihj2vKANyTmQ+DwwpDkfkTCA3erMKUQ+k', '0');
INSERT INTO `cn_log` VALUES ('233', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516268469', '522cVCkOBHyW2K4FiDm+6Wpwj4WkAV3BBXErpIyVDBMjRqyNEbW295HlHDysB+x1G8x6Hg6lCSL1pxRpBEKIH5rm/VPtSyZrNRY', '0');
INSERT INTO `cn_log` VALUES ('234', '54', '25', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/mlyy/list-25/', '2018-01-18', '1516269051', 'dd4fCTJwt5AVItDuukY1gSZvLlXkmbGxUHD/5tO/BAUQbieCoS+enjmv0YKIbFI8znBpJgtvTtEzpPhLob2tZxniPUxkAMMJj3E', '0');
INSERT INTO `cn_log` VALUES ('235', '54', '24', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/mlyy/list-25/', 'http://mls.net/jsyy/', '2018-01-18', '1516269062', '14b47w4+Ls8HdJM6NhLVnHNwJafOJdIX0VIEOexG8PEhr6m0GvLHnl3aSyBPpMCpArG4JToMyVACEqgOS0etqvwUeW3mP2+q0Tg', '0');
INSERT INTO `cn_log` VALUES ('236', '54', '0', '12', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/jsyy/', 'http://mls.net/team/12.html', '2018-01-18', '1516269069', '06a3BAeUu1UqyVnaZmdHA9T4WVTkdx8/VXDg5DBHnvMXt/dJ+HjA/VXItX4yleNPajnliT1yYp3h/NNPv6I/QX4em7iNcOyd5H4', '0');
INSERT INTO `cn_log` VALUES ('237', '54', '8', '0', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', 'http://mls.net/team/12.html', 'http://mls.net/contact/', '2018-01-18', '1516269072', '46bawiEPD7uaHoTgvGxno14o/LVA+stToXLT2I89DSaEHtja1Yudpwc4UfexS4dB9zHe21uy5yM8NzmU+drOZPzcHdge58rniQ', '0');

-- ----------------------------
-- Table structure for `cn_member`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='微信端用户表 即会员表';

-- ----------------------------
-- Records of cn_member
-- ----------------------------
INSERT INTO `cn_member` VALUES ('1', '0', '13594333241', '1', '13594333241', '', '1', '1515135264', 'http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0', '', '40753e71591badf5751ad5847fea81e9', '1511165911', '1', '管家', 'WiFi管家', '', '四川 广安', '这里是详细的地址', '2017-11-11', '', '3', 'WiFi管家', 'o32l3wDjRU0ALmBRwHhgqsGowVI0', '0', 'http://wx.qlogo.cn/mmopen/vi_32/KhfOd71y8o6MUJK9eFqxwmphjclvfllic2pfYf7UfHHDCVtfYUKEhWljNsaib3c7xRaVRWG65Lzeuu4iaPlOAB1cw/0', '0', '', '男', '女', '117.136.62.79', '0', '', '备注备注备注备注备注备注备注备注备注', '', '1511433311', '', '0', '0.0000000000000', '0.0000000000000', '', '', '', '', null, '0', '0');

-- ----------------------------
-- Table structure for `cn_msg`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_msg2`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_msg2
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_msg3`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_msg3
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_order`
-- ----------------------------
DROP TABLE IF EXISTS `cn_order`;
CREATE TABLE `cn_order` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '分店ID',
  `shopid` int(6) DEFAULT '0' COMMENT '分店ID',
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
  `zt` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单记录表';

-- ----------------------------
-- Records of cn_order
-- ----------------------------
INSERT INTO `cn_order` VALUES ('1', '0', '1', '1', '1-20171223064449', '8', '8', '3104.00', '0', '0.00', '3104.00', '0', '0', '1514025889', '1', '0', '', '订单备注订单备注订单备注订单备注订单备注订单备注', '', '0', '0', '', '', '0');
INSERT INTO `cn_order` VALUES ('2', '0', '1', '1', '1-20171224120745', '2', '2', '776.00', '1', '50.00', '726.00', '0', '0', '1514045265', '1', '0', '', '订单备注 优惠50元', '', '0', '0', '', '', '0');
INSERT INTO `cn_order` VALUES ('3', '0', '1', '1', '1-20180117024029', '2', '2', '776.00', '0', '0.00', '776.00', '0', '0', '1516171229', '1', '1516171229', '', '购买2个产品测试', '', '0', '0', '管家', '13594333241', '0');

-- ----------------------------
-- Table structure for `cn_order_goods`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单下单明细表';

-- ----------------------------
-- Records of cn_order_goods
-- ----------------------------
INSERT INTO `cn_order_goods` VALUES ('1', '0', '1', '1', '1-20171223064449', '10', '388.00', '8', '8', '精油推背', '/Comm/images/img_6.png', '16', ',0,13,16,16', '1514025889', '0', '0', '0');
INSERT INTO `cn_order_goods` VALUES ('2', '0', '1', '1', '1-20171224120745', '10', '388.00', '2', '2', '精油推背', '/Comm/images/img_6.png', '16', ',0,13,16,16', '1514045265', '0', '0', '0');
INSERT INTO `cn_order_goods` VALUES ('3', '0', '1', '1', '1-20180117024029', '10', '388.00', '1', '1', '精油推背', '/Comm/images/img_6.png', '16', ',0,13,16,16', '1516171229', '0', '1516171229', '0');
INSERT INTO `cn_order_goods` VALUES ('4', '0', '1', '1', '1-20180117024029', '13', '388.00', '1', '1', '精油推背2', '/Comm/images/img_6.png', '16', ',0,13,16,16', '1516171229', '0', '1516171229', '0');

-- ----------------------------
-- Table structure for `cn_order_use`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_order_use
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_order_yuyue`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单购买产品预约表和预约技师记录表';

-- ----------------------------
-- Records of cn_order_yuyue
-- ----------------------------
INSERT INTO `cn_order_yuyue` VALUES ('1', '0', '1', '1-20180117024029', '13', '管家', '1', '1516327200', '4', '梅老师', '1516262489', '-1', '1', '', '精油推背2', '13594333241', '0', '21', '1', '22');
INSERT INTO `cn_order_yuyue` VALUES ('2', '0', '1', '1-20180117024029', '13', '管家', '1', '1516327200', '4', '梅老师', '1516265700', '0', '0', '', '精油推背2', '13594333241', '0', '21', '1', '22');
INSERT INTO `cn_order_yuyue` VALUES ('4', '0', '1', '1-20180117024029', '10', '管家', '1', '1516345200', '12', '王老师', '1516264867', '0', '0', '', '精油推背', '13594333241', '0', '31', '5', '36');

-- ----------------------------
-- Table structure for `cn_rsms`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_rsms
-- ----------------------------
INSERT INTO `cn_rsms` VALUES ('1', '1', '13594333241', '00476', '1513920848', '127.0.0.1', '0', null);
INSERT INTO `cn_rsms` VALUES ('2', '1', '13594333241', '16611', '1513920874', '127.0.0.1', '0', '0');
INSERT INTO `cn_rsms` VALUES ('3', '1', '13594333241', '48165', '1513920875', '127.0.0.1', '0', '0');
INSERT INTO `cn_rsms` VALUES ('4', '1', '13594333241', '94153', '1513920877', '127.0.0.1', '1', '0');
INSERT INTO `cn_rsms` VALUES ('5', '1', '13594333241', '02103', '1513921432', '127.0.0.1', '1', '0');
INSERT INTO `cn_rsms` VALUES ('6', '1', '13594333241', '97531', '1515135143', '127.0.0.1', '1', '1');

-- ----------------------------
-- Table structure for `cn_user`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='访问者记录表';

-- ----------------------------
-- Records of cn_user
-- ----------------------------
INSERT INTO `cn_user` VALUES ('1', '0', '4e105fb97ef3113f79858c0b31f3273f', 'de1dc989e0dbc409bebf25ccf26a3867e151c8fc', '127.0.0.1', '/comm/images/img_1.jpg', '2017-12-19', '1513646529', '1');
INSERT INTO `cn_user` VALUES ('2', '0', '4e105fb97ef3113f79858c0b31f3273f', 'de1dc989e0dbc409bebf25ccf26a3867e151c8fc', '127.0.0.1', '/comm/images/logo.png', '2017-12-19', '1513646529', '1');
INSERT INTO `cn_user` VALUES ('3', '0', '4e105fb97ef3113f79858c0b31f3273f', 'de1dc989e0dbc409bebf25ccf26a3867e151c8fc', '127.0.0.1', '/comm/images/logo2.png', '2017-12-19', '1513646529', '1');
INSERT INTO `cn_user` VALUES ('4', '0', '4e105fb97ef3113f79858c0b31f3273f', 'de1dc989e0dbc409bebf25ccf26a3867e151c8fc', '127.0.0.1', '/favicon.ico', '2017-12-19', '1513646529', '1');
INSERT INTO `cn_user` VALUES ('5', '0', '4e105fb97ef3113f79858c0b31f3273f', 'de1dc989e0dbc409bebf25ccf26a3867e151c8fc', '127.0.0.1', '/whome/index/logs', '2017-12-19', '1513646529', '1');
INSERT INTO `cn_user` VALUES ('6', '0', '9c462674ab79e4a5f7b9deb6d0081e24', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', '/', '2017-12-22', '1513914624', '1');
INSERT INTO `cn_user` VALUES ('7', '0', '9c462674ab79e4a5f7b9deb6d0081e24', '112e8aab2e759f4290ebac28f7e93903c868c9a5', '127.0.0.1', '/', '2017-12-22', '1513914624', '1');
INSERT INTO `cn_user` VALUES ('8', '1', 'ba87ffb54a7110b6d015fbb85afe3c79', '8be2200028030bbde5d6c73d3255ec5524b779d6', '127.0.0.1', '/', '2017-12-23', '1514013063', '1');
INSERT INTO `cn_user` VALUES ('9', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', '26c3ea3a9bed56f86154253bece442aca8ac7643', '127.0.0.1', '/index.php', '2017-12-23', '1514013991', '1');
INSERT INTO `cn_user` VALUES ('10', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', 'a60bdcdc16e2f6972d7c5ef6857f8621ac299d3f', '127.0.0.1', '/index.php', '2017-12-23', '1514018890', '1');
INSERT INTO `cn_user` VALUES ('11', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', '4c9a63fbdbe2db4f195ecfb27271cf3d2e160931', '127.0.0.1', '/index.php', '2017-12-23', '1514023850', '1');
INSERT INTO `cn_user` VALUES ('12', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', '6125f6851d0786444fafa8d904622d7ce3b879d3', '127.0.0.1', '/index.php', '2017-12-23', '1514042654', '1');
INSERT INTO `cn_user` VALUES ('13', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', 'd23dd7e38084861ecf28e1b8ffdeb214afe41604', '127.0.0.1', '/index.php', '2017-12-23', '1514044311', '1');
INSERT INTO `cn_user` VALUES ('14', '0', 'ba87ffb54a7110b6d015fbb85afe3c79', '3978fec6f57a7402f132b7e56267c5858d29451f', '127.0.0.1', '/index.php', '2017-12-24', '1514049699', '1');
INSERT INTO `cn_user` VALUES ('15', '0', '408b39e454ca6e750d714c6d5eff36c7', '1db30dcae3c5b2f5a1d6dd73c736856ed97a85cc', '127.0.0.1', '/favicon.ico', '2017-12-24', '1514102245', '1');
INSERT INTO `cn_user` VALUES ('16', '0', '408b39e454ca6e750d714c6d5eff36c7', 'cf1ae0201b2bd8c50a76387cd54a8a4630746d8c', '127.0.0.1', '/favicon.ico', '2017-12-24', '1514102857', '1');
INSERT INTO `cn_user` VALUES ('17', '0', '408b39e454ca6e750d714c6d5eff36c7', 'ba900707a8093c5e11837c86cc71fde1edef5084', '127.0.0.1', '/?v=7', '2017-12-24', '1514102863', '1');
INSERT INTO `cn_user` VALUES ('18', '0', '408b39e454ca6e750d714c6d5eff36c7', '7c335517f8e8315b43bbb12c6d1304e417e3691a', '127.0.0.1', '/index.php', '2017-12-24', '1514106206', '1');
INSERT INTO `cn_user` VALUES ('19', '0', '74bcc8c2afc1c2a2d734cb4749702c41', '268e7bba1151a8d46f38b6680b0659be41515421', '127.0.0.1', '/', '2017-12-25', '1514163525', '1');
INSERT INTO `cn_user` VALUES ('20', '1', 'da78ea63dd5b3ff3de2fb2f9325f2751', '6eeea0bc26347a7b279cc177233d3288c4498c9f', '127.0.0.1', '/', '2017-12-26', '1514249751', '1');
INSERT INTO `cn_user` VALUES ('21', '0', 'd067ecaf378dce882957205a69d2c04e', 'e55d899a70e2716a817234f1fc470df8275b51c5', '127.0.0.1', '/', '2017-12-28', '1514422798', '1');
INSERT INTO `cn_user` VALUES ('22', '0', '40a8216490419b047831bb331c25edd4', '176ece5a21f3ca65191a842eac7ee86e605a8c6f', '127.0.0.1', '/', '2018-01-02', '1514853594', '1');
INSERT INTO `cn_user` VALUES ('23', '0', '40a8216490419b047831bb331c25edd4', '93c3e33f38d351da2dc8c0c33f3fccaddaeafd4b', '127.0.0.1', '/', '2018-01-02', '1514854797', '1');
INSERT INTO `cn_user` VALUES ('24', '0', '40a8216490419b047831bb331c25edd4', 'c8d1923b55e47ea734f7c087f551b5d9f2318da9', '127.0.0.1', 'http://mls.net/', '2018-01-02', '1514854828', '1');
INSERT INTO `cn_user` VALUES ('25', '1', 'b4473f71c8dee05c2252eadf301d4d51', '19cc7bd09ce8a37ddacc9d19b268b72abe3f3dce', '127.0.0.1', '/favicon.ico', '2018-01-03', '1514940890', '1');
INSERT INTO `cn_user` VALUES ('26', '1', 'b4473f71c8dee05c2252eadf301d4d51', '9d962bb61f5580b04da187776f1cc11175a0fbcf', '127.0.0.1', '/favicon.ico', '2018-01-03', '1514940894', '1');
INSERT INTO `cn_user` VALUES ('27', '1', 'b4473f71c8dee05c2252eadf301d4d51', 'ebb4fdaae69d5859a035748fc051c8d1ad56ec00', '127.0.0.1', '/favicon.ico', '2018-01-03', '1514940896', '1');
INSERT INTO `cn_user` VALUES ('28', '1', 'b4473f71c8dee05c2252eadf301d4d51', 'f05caa17fdd4c8a1a256aeb6a10cc4df29eccc6a', '127.0.0.1', '/?v=7', '2018-01-03', '1514940898', '1');
INSERT INTO `cn_user` VALUES ('29', '0', 'b4473f71c8dee05c2252eadf301d4d51', 'e68f83c92b087cd1643a98df71a4f5ff1ee1b335', '127.0.0.1', '/index.php', '2018-01-03', '1514945257', '1');
INSERT INTO `cn_user` VALUES ('30', '0', 'cbf28d9c6975bc698385562c22abb3e5', '0ff620271ae8343220fc972e45f451f8957db426', '127.0.0.1', '/favicon.ico', '2018-01-04', '1515048837', '1');
INSERT INTO `cn_user` VALUES ('31', '0', 'cbf28d9c6975bc698385562c22abb3e5', '11bc8d212f974ea64b1e06b343b0503f3065a63f', '127.0.0.1', '/favicon.ico', '2018-01-04', '1515048838', '1');
INSERT INTO `cn_user` VALUES ('32', '0', 'cbf28d9c6975bc698385562c22abb3e5', '11bc8d212f974ea64b1e06b343b0503f3065a63f', '127.0.0.1', '/favicon.ico', '2018-01-04', '1515048838', '1');
INSERT INTO `cn_user` VALUES ('33', '0', '8624254c454179a5764b1486044ac3ce', '789b10da2a4b778526d10632e52331e2fcec5238', '127.0.0.1', '/', '2018-01-05', '1515135057', '1');
INSERT INTO `cn_user` VALUES ('34', '0', 'ed9e54f01f0b0177a0faeb09f9335d55', 'c3c7aa1be0a1cd55c9aadf35cd5f7d3ff9291f82', '127.0.0.1', '/', '2018-01-06', '1515231723', '1');
INSERT INTO `cn_user` VALUES ('35', '0', 'ed9e54f01f0b0177a0faeb09f9335d55', 'f7068ccb4d79f1750f064fcede7a2f22ac05bcb3', '127.0.0.1', 'http://mls.net/', '2018-01-06', '1515231757', '1');
INSERT INTO `cn_user` VALUES ('36', '0', '042b9de2ff26ea18c04efa78590250f8', '68dce7ee507be039839a18b18ea391fb6c071d78', '127.0.0.1', '/', '2018-01-10', '1515550288', '1');
INSERT INTO `cn_user` VALUES ('37', '0', '042b9de2ff26ea18c04efa78590250f8', '441f17092df7b02338e0ecbe04ac6dcd6c98839a', '127.0.0.1', 'http://mls.net/', '2018-01-10', '1515550323', '1');
INSERT INTO `cn_user` VALUES ('38', '0', '116669213dfe3f646eb5be3664440769', 'ce553ad19f0a83ff35a71a8ad5a1a458ac6beeef', '127.0.0.1', '/favicon.ico', '2018-01-15', '1515984872', '1');
INSERT INTO `cn_user` VALUES ('39', '0', '116669213dfe3f646eb5be3664440769', '2bb0b68a7d04b80ec52adfb0da48126250f590c7', '127.0.0.1', '/favicon.ico', '2018-01-15', '1515984873', '1');
INSERT INTO `cn_user` VALUES ('40', '0', '116669213dfe3f646eb5be3664440769', '2bb0b68a7d04b80ec52adfb0da48126250f590c7', '127.0.0.1', '/favicon.ico', '2018-01-15', '1515984873', '1');
INSERT INTO `cn_user` VALUES ('41', '0', '824682af0618de64188db473954c1281', 'c8565d0b662fbd715d06823c596f225bcd5f81b0', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152706', '1');
INSERT INTO `cn_user` VALUES ('42', '0', '824682af0618de64188db473954c1281', '5ee84f53445efafa7987621cd84de73756cf294e', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152711', '1');
INSERT INTO `cn_user` VALUES ('43', '0', '824682af0618de64188db473954c1281', 'aef80c4b20e8f8abbf3ae39869ac8f67127ba815', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152718', '1');
INSERT INTO `cn_user` VALUES ('44', '0', '824682af0618de64188db473954c1281', 'd88033d13c5d30c606e97a341d50db152a9e1f47', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152721', '1');
INSERT INTO `cn_user` VALUES ('45', '0', '824682af0618de64188db473954c1281', '6dda9d2b8728f9b0dd6cea183970e2ef5161f351', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152723', '1');
INSERT INTO `cn_user` VALUES ('46', '0', '824682af0618de64188db473954c1281', '51e6c5c00cd32375aa18afa92ba253e4618bf6bd', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152724', '1');
INSERT INTO `cn_user` VALUES ('47', '0', '824682af0618de64188db473954c1281', 'efde92b054b44bc474102ad3e3da1004e927f2a0', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516152733', '1');
INSERT INTO `cn_user` VALUES ('48', '0', '824682af0618de64188db473954c1281', '5eb6f4e616bb2f1a254c6bf0d3b4fb9a56ab1602', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516153024', '1');
INSERT INTO `cn_user` VALUES ('49', '0', '824682af0618de64188db473954c1281', '55e45df6fe0fa25e2ec80b84a49f3df07d736104', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516153051', '1');
INSERT INTO `cn_user` VALUES ('50', '0', '824682af0618de64188db473954c1281', '1a051c49228f34f2eb84c4a3e1fdd09a920a9142', '127.0.0.1', '/favicon.ico', '2018-01-17', '1516153060', '1');
INSERT INTO `cn_user` VALUES ('51', '0', '824682af0618de64188db473954c1281', '2b80fefda843989d48f81f0390af9ff72e00a1e5', '127.0.0.1', '/?v=7', '2018-01-17', '1516153105', '1');
INSERT INTO `cn_user` VALUES ('52', '0', '824682af0618de64188db473954c1281', '3c71f9b977456acb02b5a80afd66d16004bb9d91', '127.0.0.1', '/index.php', '2018-01-17', '1516176735', '1');
INSERT INTO `cn_user` VALUES ('53', '0', '824682af0618de64188db473954c1281', '368ea82f54b1cbf42a830c4c98a59279a690a749', '127.0.0.1', '/index.php', '2018-01-17', '1516181661', '1');
INSERT INTO `cn_user` VALUES ('54', '0', '03e68bb82e5c837879c64402e5bed214', '7af2d56291837981c6bc24edd666b662341cffe2', '127.0.0.1', '/?wrnd=qm', '2018-01-18', '1516237386', '1');
INSERT INTO `cn_user` VALUES ('55', '0', '03e68bb82e5c837879c64402e5bed214', 'b7cf59c72c6c3e0c68e24c31b0d25f9636b71da5', '127.0.0.1', '/index.php', '2018-01-18', '1516238334', '1');
INSERT INTO `cn_user` VALUES ('56', '0', '03e68bb82e5c837879c64402e5bed214', '086dba8963a8d587537f6a756cae0f5b3d847ce2', '127.0.0.1', '/index.php', '2018-01-18', '1516259822', '1');
INSERT INTO `cn_user` VALUES ('57', '0', '03e68bb82e5c837879c64402e5bed214', 'f483b328f39834130e877b7380ec2a35a6b89547', '127.0.0.1', '/index.php', '2018-01-18', '1516264923', '1');
INSERT INTO `cn_user` VALUES ('58', '0', '03e68bb82e5c837879c64402e5bed214', '4591f3f287425b9578c96d3311b87f6ef0472574', '127.0.0.1', '/index.php', '2018-01-18', '1516264924', '1');

-- ----------------------------
-- Table structure for `cn_user_jf`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_user_jf
-- ----------------------------

-- ----------------------------
-- Table structure for `cn_user_yh`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_user_yh
-- ----------------------------
INSERT INTO `cn_user_yh` VALUES ('1', '1', '0', '1', '599', '50', '1', '1514045265', '1-20171224120745', '1514042780', '0', '1545494400', '0');

-- ----------------------------
-- Table structure for `cn_youhuiquan`
-- ----------------------------
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

-- ----------------------------
-- Records of cn_youhuiquan
-- ----------------------------
INSERT INTO `cn_youhuiquan` VALUES ('1', '0', '新年优惠活动', '500', '200', '1516118400', '1522339200', '1516160280', '1', '0', '0', '0');
DROP TRIGGER IF EXISTS `update1`;
DELIMITER ;;
CREATE TRIGGER `update1` AFTER INSERT ON `cn_order` FOR EACH ROW begin  
    update cn_order_goods as b
    set b.zt=new.zt,b.paytime=new.paytime where b.orderid=new.orderid ;  
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update2`;
DELIMITER ;;
CREATE TRIGGER `update2` AFTER UPDATE ON `cn_order` FOR EACH ROW begin  
    update cn_order_goods as b
    set b.zt=new.zt,b.paytime=new.paytime where b.orderid=new.orderid ;  
end
;;
DELIMITER ;
