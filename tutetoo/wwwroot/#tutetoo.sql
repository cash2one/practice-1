/*
Navicat MySQL Data Transfer

Source Server         : x2
Source Server Version : 50161
Source Host           : localhost:3306
Source Database       : tutetoo

Target Server Type    : MYSQL
Target Server Version : 50161
File Encoding         : 65001

Date: 2018-01-01 21:36:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `#qm_admin`
-- ----------------------------
DROP TABLE IF EXISTS `#qm_admin`;
CREATE TABLE `#qm_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `Grade` int(11) DEFAULT '1',
  `Lock` int(11) DEFAULT '0',
  `Issue` varchar(255) DEFAULT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  `LastTime` datetime DEFAULT NULL,
  `LastIP` varchar(50) DEFAULT NULL,
  `logins` int(11) DEFAULT '0',
  `cookie` varchar(255) DEFAULT NULL,
  `flag1` varchar(255) DEFAULT '',
  `flag2` varchar(255) DEFAULT '',
  `flag3` varchar(255) DEFAULT '',
  `s1` bigint(20) DEFAULT '0',
  `s2` bigint(20) DEFAULT '0',
  `cityname` varchar(100) DEFAULT '',
  `truename` varchar(100) DEFAULT '' COMMENT '联系人',
  `tel` varchar(100) DEFAULT '' COMMENT '联系人电话',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `del` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of #qm_admin
-- ----------------------------
INSERT INTO `#qm_admin` VALUES ('1', 'sunshine', '010cfe15300b7f0ea08f4215747b3c43', '9', '0', '', '', '2017-08-13 23:38:37', '118.116.90.88', '792', '592ccc0017df18aa43b04d68c3a6d408', '', '', '', '0', '0', '主站', '', '', '', '0');

-- ----------------------------
-- Table structure for `qm_ad`
-- ----------------------------
DROP TABLE IF EXISTS `qm_ad`;
CREATE TABLE `qm_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(250) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `flash` varchar(250) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `ty` int(11) DEFAULT NULL,
  `ids_bz1` longtext,
  `ids_bz2` longtext,
  `ids_bz3` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_ad
-- ----------------------------
INSERT INTO `qm_ad` VALUES ('1', '网站logo', '/img/logo.png', '', '', '', '/', '0', 'logo', '', '');
INSERT INTO `qm_ad` VALUES ('2', '网站二维码', '/pub/qm/p/image/160701/072143_293.png', '', '', '', '', '0', '网站二维码', '', '');
INSERT INTO `qm_ad` VALUES ('3', '顶部广告', '/pub/qm/p/image/160922/143222_190.jpg', '', '', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', '0', '绿壳土鸡蛋', '', '');
INSERT INTO `qm_ad` VALUES ('4', '热卖商品下方通栏广告', '/pub/qm/p/image/160829/111708_134.jpg', '', '1200', '', 'http://www.tutetoo.com/product/huacai/24.html', '0', '苍溪红心猕猴桃30枚大果装', '', '');
INSERT INTO `qm_ad` VALUES ('5', '礼盒专区 精品汇广告1', '/pub/qm/p/image/160830/140224_210.jpg', '', '210', '230', '', '0', '精品汇广告1', '', '');
INSERT INTO `qm_ad` VALUES ('6', '精品汇广告2', '/pub/qm/p/image/160830/135802_426.jpg', '', '490', '230', 'http://www.tutetoo.com/gift/27.html', '0', '精品汇广告2', '', '');
INSERT INTO `qm_ad` VALUES ('7', '精品汇广告3', '/pub/qm/p/image/160830/140553_879.jpg', '', '184', '110', '', '0', '精品汇广告3', '', '');
INSERT INTO `qm_ad` VALUES ('8', '会员中心右侧广告1', '/pub/qm/p/image/160829/162223_405.jpg', '', '168', '118', 'http://www.tutetoo.com/product/huacai/24.html', '0', '会员中心右侧广告1', '', '');
INSERT INTO `qm_ad` VALUES ('9', '会员中心右侧广告2', '/pub/qm/p/image/160829/162259_936.jpg', '', '168', '118', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', '0', '会员中心右侧广告2', '', '');
INSERT INTO `qm_ad` VALUES ('10', '手机首页通栏广告', '/m/img/5.jpg', null, '', '', '', '0', '手机首页通栏广告', null, null);
INSERT INTO `qm_ad` VALUES ('11', '会员登录广告', '/pub/qm/p/image/160922/142218_872.jpg', null, '732', '468', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', '0', '绿壳土鸡蛋', null, null);
INSERT INTO `qm_ad` VALUES ('12', '会员注册广告', '/pub/qm/p/image/160922/143043_854.jpg', null, '462', '306', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', '0', '土鸡蛋', null, null);
INSERT INTO `qm_ad` VALUES ('13', '忘记密码广告', '/pub/qm/p/image/160922/143043_854.jpg', null, '462', '306', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', '0', '', null, null);

-- ----------------------------
-- Table structure for `qm_addf`
-- ----------------------------
DROP TABLE IF EXISTS `qm_addf`;
CREATE TABLE `qm_addf` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sid` int(8) DEFAULT '0' COMMENT '商家id',
  `uid` bigint(11) DEFAULT '0',
  `pid` bigint(11) DEFAULT '0',
  `num` int(6) DEFAULT '1',
  `addtime` bigint(11) DEFAULT '0',
  `del` smallint(1) DEFAULT '0',
  `sc` smallint(1) DEFAULT '0' COMMENT '是否搜藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_addf
-- ----------------------------
INSERT INTO `qm_addf` VALUES ('1', '0', '1', '24', '1', '1475128323', '0', '0');
INSERT INTO `qm_addf` VALUES ('2', '0', '9', '2', '1', '1472457619', '0', '0');
INSERT INTO `qm_addf` VALUES ('3', '0', '9', '24', '1', '1472457631', '0', '0');
INSERT INTO `qm_addf` VALUES ('4', '0', '13', '24', '1', '1472457352', '0', '0');
INSERT INTO `qm_addf` VALUES ('5', '0', '9', '1', '1', '1472457625', '0', '0');
INSERT INTO `qm_addf` VALUES ('6', '0', '9', '25', '1', '1472457638', '0', '0');
INSERT INTO `qm_addf` VALUES ('7', '0', '1', '2', '1', '1473664326', '0', '0');
INSERT INTO `qm_addf` VALUES ('8', '0', '17', '27', '1', '1474341092', '0', '0');
INSERT INTO `qm_addf` VALUES ('9', '0', '17', '24', '1', '1474341421', '0', '0');
INSERT INTO `qm_addf` VALUES ('10', '0', '17', '25', '1', '1474356218', '0', '0');
INSERT INTO `qm_addf` VALUES ('11', '0', '17', '26', '1', '1474356226', '0', '0');
INSERT INTO `qm_addf` VALUES ('12', '0', '1', '26', '1', '1475731598', '0', '0');
INSERT INTO `qm_addf` VALUES ('13', '0', '3', '24', '1', '1476110413', '1', '0');
INSERT INTO `qm_addf` VALUES ('14', '0', '21', '24', '1', '1478745062', '0', '0');
INSERT INTO `qm_addf` VALUES ('15', '0', '38', '56', '1', '1483513091', '0', '0');
INSERT INTO `qm_addf` VALUES ('16', '0', '106', '24', '1', '1500963274', '0', '0');
INSERT INTO `qm_addf` VALUES ('17', '0', '106', '56', '1', '1501057846', '1', '0');
INSERT INTO `qm_addf` VALUES ('18', '0', '106', '1', '1', '1501057853', '0', '0');
INSERT INTO `qm_addf` VALUES ('19', '0', '106', '57', '1', '1501160524', '0', '0');

-- ----------------------------
-- Table structure for `qm_address`
-- ----------------------------
DROP TABLE IF EXISTS `qm_address`;
CREATE TABLE `qm_address` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '' COMMENT '收货人',
  `tel` varchar(255) DEFAULT '',
  `addr1` varchar(255) DEFAULT '' COMMENT '省市区',
  `addr2` varchar(255) DEFAULT '' COMMENT '详细地址',
  `qq` varchar(20) DEFAULT NULL,
  `cid` bigint(11) DEFAULT '0' COMMENT '配送车辆',
  `settop` smallint(1) DEFAULT '0' COMMENT '设为默认收货地址',
  `audit` smallint(1) DEFAULT '0' COMMENT '是否审核',
  `addtime` bigint(11) DEFAULT '0',
  `uptime` bigint(11) DEFAULT '0',
  `shtime` bigint(11) DEFAULT '0' COMMENT '审核时间',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `shopname` varchar(255) DEFAULT '',
  `addr3` varchar(255) DEFAULT '',
  `zipcode` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_address
-- ----------------------------
INSERT INTO `qm_address` VALUES ('1', '1', '蒋文川', '13594333241', '重庆市,重庆市,江北区', '地址地址地址地址地址地址地址地址', '1251563', '0', '0', '0', '1467085733', '0', '1467547176', '0', '', '', '123456');
INSERT INTO `qm_address` VALUES ('2', '1', '张经理', '18955568563', '四川省,成都市,青羊区', '成华区建材路玖熙广场二栋', '8852662', '0', '1', '1', '1467340141', '1467340141', '1474335697', '0', '', '', '789456');
INSERT INTO `qm_address` VALUES ('3', '1', '张经理', '18955568563', '四川省,成都市,青羊区', '成华区建材路玖熙广场二栋', '8852662', '0', '0', '1', '1467970821', '1467970821', '1474335691', '0', '', '', '789456');
INSERT INTO `qm_address` VALUES ('4', '6', '王老吉', '13888888887', '北京市,北京市,东城区', '个嘎嘎嘎嘎嘎嘎嘎嘎嘎过过过过', '', '0', '0', '0', '1470302861', '0', '1480073433', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('5', '9', '甘琴', '15882253438', '四川省,成都市,成华区', '罗兰小镇', '564065632', '0', '1', '1', '1471583322', '1471583322', '0', '0', '', '', '610000');
INSERT INTO `qm_address` VALUES ('6', '3', '张中林', '13881879952', '四川省,成都市,成华区', '双成2路39号', '', '0', '1', '1', '1473694101', '1473694101', '0', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('7', '17', '王某', '15882253675', '四川省,成都市,成华区', '万年场联合小区', '', '0', '1', '1', '1474341509', '1474341509', '0', '0', '', '', '610000');
INSERT INTO `qm_address` VALUES ('8', '7', 'zhangzhonglin', '13881879952', '四川省,成都市,成华区', '建材路39号', '254029396', '0', '1', '1', '1476027065', '1476027065', '0', '1', '', '', '');
INSERT INTO `qm_address` VALUES ('9', '7', '张中林', '15266666666', '四川省,成都市,武侯区', '123123123123123123', '', '0', '1', '1', '1480045673', '1480045673', '0', '0', '', '', '650001');
INSERT INTO `qm_address` VALUES ('10', '28', '张中林', '13541092414', '四川省,成都市,成华区', '花样年华花郡', '', '0', '0', '0', '1480334155', '0', '1483509529', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('11', '30', '建设', '18966666666', '重庆市,重庆市,大渡口区', '默默哦哦哦哦哦哦哦哦哦哦哦', '', '0', '0', '1', '1480903389', '1480903389', '1482583217', '0', '', '', '638300');
INSERT INTO `qm_address` VALUES ('12', '32', '张中林', '13881879952', '四川省,成都市,成华区', '华润24城', '254029396', '0', '1', '1', '1482566891', '1482566891', '1483516843', '0', '', '', '610061');
INSERT INTO `qm_address` VALUES ('13', '38', '蒋文川', '13594333241', '四川省,成都市,成华区', '详细地址详细地址详细地址', '1506067071', '0', '0', '1', '1483087117', '1483087117', '0', '1', '', '', '651000');
INSERT INTO `qm_address` VALUES ('14', '38', '蒋文川', '13594333241', '西藏,阿里地区,札达县', '详细地址详细地址详细地址', '1506067071', '0', '0', '1', '1483087202', '1483087202', '1483512634', '0', '', '', '651000');
INSERT INTO `qm_address` VALUES ('15', '28', '万小姐', '13881879952', '四川省,成都市,成华区', 'AAAAAA', '', '0', '0', '1', '1483509618', '1483509618', '0', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('16', '32', '张定发', '13881206791', '西藏,阿里地区,噶尔县', '石门乡柳池村', '', '0', '0', '1', '1483510532', '1483510532', '1483511232', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('17', '28', '122121223', '13881879952', '四川省,巴中市,通江县', '111122232', '', '0', '0', '1', '1483511893', '1483511893', '0', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('18', '32', ' 3232322332', '13541391404', '四川省,广元市,苍溪县', '4521122123123', '', '0', '0', '1', '1483511977', '1483511977', '0', '1', '', '', '');
INSERT INTO `qm_address` VALUES ('19', '62', 'sans', '13301212204', '北京市,北京市,东城区', '北京市东城区莲花大厦', '', '0', '0', '1', '1484270774', '1484270774', '0', '0', '', '', '100010');
INSERT INTO `qm_address` VALUES ('20', '105', '李先生', '13654626652', '北京市,北京市,西城区', '你聚餐大家好', '', '0', '1', '1', '1499589604', '1499589604', '0', '0', '', '', '');
INSERT INTO `qm_address` VALUES ('21', '106', '黄先生', '13512345678', '重庆市,重庆市,沙坪坝区', '大华路22号', '', '0', '0', '1', '1500978862', '1500978862', '1501417627', '0', '', '', '100001');

-- ----------------------------
-- Table structure for `qm_admin`
-- ----------------------------
DROP TABLE IF EXISTS `qm_admin`;
CREATE TABLE `qm_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `Grade` int(11) DEFAULT '1',
  `Lock` int(11) DEFAULT '0',
  `Issue` varchar(255) DEFAULT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  `LastTime` datetime DEFAULT NULL,
  `LastIP` varchar(50) DEFAULT NULL,
  `logins` int(11) DEFAULT '0',
  `cookie` varchar(255) DEFAULT NULL,
  `flag1` varchar(255) DEFAULT '' COMMENT '模块权限',
  `flag2` varchar(255) DEFAULT '' COMMENT '操作权限',
  `flag3` varchar(255) DEFAULT '',
  `s1` bigint(20) DEFAULT '0',
  `s2` bigint(20) DEFAULT '0',
  `cityname` varchar(100) DEFAULT '',
  `truename` varchar(100) DEFAULT '' COMMENT '联系人',
  `tel` varchar(100) DEFAULT '' COMMENT '联系人电话',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `del` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_admin
-- ----------------------------
INSERT INTO `qm_admin` VALUES ('1', 'qmadmin', 'c5358a6db37949d725ae280082a99a4a', '9', '0', '', '', '2017-12-26 15:18:22', '118.113.43.31', '945', '01ebcab5bde4691766028d2998a1a7b6', '', '', '', '0', '0', '管理员', '', '', '', '0');
INSERT INTO `qm_admin` VALUES ('2', 'mytest1', '772da11222ba2d4b4d142b6776daedff', '1', '0', '', '', '2017-04-18 15:24:26', '127.0.0.1', '2', '828f80822d4b69af7d9b834d2088194b', '1,2,3,4,5,6,8,11', '13', '', '0', '0', 'mytest1', '联系人', '联系电话', '', '0');

-- ----------------------------
-- Table structure for `qm_attr`
-- ----------------------------
DROP TABLE IF EXISTS `qm_attr`;
CREATE TABLE `qm_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `fidpath` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT '',
  `isshow` int(11) DEFAULT NULL,
  `ty` int(11) DEFAULT NULL,
  `content` longtext,
  `kdel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_attr
-- ----------------------------
INSERT INTO `qm_attr` VALUES ('1', null, null, null, null, null, '', null, null, null, null);

-- ----------------------------
-- Table structure for `qm_buy`
-- ----------------------------
DROP TABLE IF EXISTS `qm_buy`;
CREATE TABLE `qm_buy` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sid` int(8) DEFAULT '0' COMMENT '商家id',
  `uid` bigint(11) DEFAULT '0',
  `pid` bigint(11) DEFAULT '0',
  `num` int(6) DEFAULT '1',
  `addtime` bigint(11) DEFAULT '0',
  `del` smallint(1) DEFAULT '0',
  `sc` smallint(1) DEFAULT '0' COMMENT '是否搜藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_buy
-- ----------------------------
INSERT INTO `qm_buy` VALUES ('1', '0', '30', '25', '1', '1480925698', '0', '0');
INSERT INTO `qm_buy` VALUES ('2', '0', '30', '26', '1', '1480903406', '0', '0');
INSERT INTO `qm_buy` VALUES ('3', '0', '29', '24', '6', '1480925557', '0', '0');
INSERT INTO `qm_buy` VALUES ('4', '0', '29', '26', '2', '1480922637', '0', '0');
INSERT INTO `qm_buy` VALUES ('5', '0', '29', '25', '1', '1480922950', '0', '0');
INSERT INTO `qm_buy` VALUES ('6', '0', '32', '25', '1', '1481547639', '0', '0');
INSERT INTO `qm_buy` VALUES ('7', '0', '32', '24', '0', '1481253097', '0', '0');
INSERT INTO `qm_buy` VALUES ('8', '0', '32', '2', '1', '1483523913', '0', '0');
INSERT INTO `qm_buy` VALUES ('9', '0', '32', '26', '1', '1481525488', '0', '0');
INSERT INTO `qm_buy` VALUES ('10', '0', '28', '26', '0', '1481528948', '0', '0');
INSERT INTO `qm_buy` VALUES ('11', '0', '44', '25', '1', '1482200893', '0', '0');
INSERT INTO `qm_buy` VALUES ('12', '0', '30', '24', '1', '1482583139', '0', '0');
INSERT INTO `qm_buy` VALUES ('13', '0', '51', '3', '1', '1483068522', '0', '0');
INSERT INTO `qm_buy` VALUES ('14', '0', '38', '56', '1', '1483512609', '0', '0');
INSERT INTO `qm_buy` VALUES ('15', '0', '38', '22', '1', '1483084857', '0', '0');
INSERT INTO `qm_buy` VALUES ('16', '0', '38', '1', '1', '1486781114', '0', '0');
INSERT INTO `qm_buy` VALUES ('17', '0', '32', '57', '1', '1483524277', '0', '0');
INSERT INTO `qm_buy` VALUES ('18', '0', '32', '56', '2', '1483512996', '0', '0');
INSERT INTO `qm_buy` VALUES ('19', '0', '28', '56', '1', '1483511845', '0', '0');
INSERT INTO `qm_buy` VALUES ('20', '0', '38', '3', '31', '1483514333', '0', '0');
INSERT INTO `qm_buy` VALUES ('21', '0', '28', '57', '1', '1483516985', '0', '0');
INSERT INTO `qm_buy` VALUES ('22', '0', '32', '1', '1', '1483521839', '0', '0');
INSERT INTO `qm_buy` VALUES ('23', '0', '62', '2', '1', '1484395371', '0', '0');
INSERT INTO `qm_buy` VALUES ('24', '0', '62', '3', '0', '1484965988', '0', '0');
INSERT INTO `qm_buy` VALUES ('25', '0', '34', '2', '1', '1488173557', '0', '0');
INSERT INTO `qm_buy` VALUES ('26', '0', '83', '24', '1', '1491040326', '0', '0');
INSERT INTO `qm_buy` VALUES ('27', '0', '83', '1', '5', '1491040426', '0', '0');
INSERT INTO `qm_buy` VALUES ('28', '0', '85', '57', '1', '1491718026', '0', '0');
INSERT INTO `qm_buy` VALUES ('29', '0', '85', '1', '1', '1491718061', '0', '0');
INSERT INTO `qm_buy` VALUES ('30', '0', '30', '2', '1', '1498212184', '0', '0');
INSERT INTO `qm_buy` VALUES ('31', '0', '105', '1', '1', '1499589558', '0', '0');
INSERT INTO `qm_buy` VALUES ('32', '0', '106', '1', '0', '1501855234', '0', '0');
INSERT INTO `qm_buy` VALUES ('33', '0', '106', '57', '1', '1501832429', '0', '0');
INSERT INTO `qm_buy` VALUES ('34', '0', '106', '2', '5', '1501743534', '0', '0');

-- ----------------------------
-- Table structure for `qm_class`
-- ----------------------------
DROP TABLE IF EXISTS `qm_class`;
CREATE TABLE `qm_class` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) DEFAULT '',
  `s1` int(7) DEFAULT '100' COMMENT '升级积分',
  `zk` int(3) DEFAULT '100' COMMENT '打折比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_class
-- ----------------------------
INSERT INTO `qm_class` VALUES ('1', '普通会员', '0', '100');
INSERT INTO `qm_class` VALUES ('2', 'vip会员', '1000', '100');
INSERT INTO `qm_class` VALUES ('3', '钻石会员', '2000', '100');
INSERT INTO `qm_class` VALUES ('4', '合作伙伴', '99000', '100');

-- ----------------------------
-- Table structure for `qm_color`
-- ----------------------------
DROP TABLE IF EXISTS `qm_color`;
CREATE TABLE `qm_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_color
-- ----------------------------
INSERT INTO `qm_color` VALUES ('1', '#FFFFFF');
INSERT INTO `qm_color` VALUES ('2', '#FF0000');
INSERT INTO `qm_color` VALUES ('3', '#FFFF00');
INSERT INTO `qm_color` VALUES ('4', '#FF00FF');
INSERT INTO `qm_color` VALUES ('5', '#0000FF');
INSERT INTO `qm_color` VALUES ('6', '#00FFFF');
INSERT INTO `qm_color` VALUES ('7', '#00FF00');
INSERT INTO `qm_color` VALUES ('8', '#CCCCCC');
INSERT INTO `qm_color` VALUES ('9', '#000000');
INSERT INTO `qm_color` VALUES ('10', '#666666');

-- ----------------------------
-- Table structure for `qm_comment`
-- ----------------------------
DROP TABLE IF EXISTS `qm_comment`;
CREATE TABLE `qm_comment` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `ty` smallint(1) DEFAULT '0' COMMENT '评论类型 1产品评论 2会员评论',
  `uid` bigint(12) DEFAULT '0' COMMENT '会员编号',
  `pid` bigint(12) DEFAULT '0' COMMENT '产品或者会员编号',
  `hid` bigint(12) DEFAULT '0' COMMENT '回复id',
  `ip` varchar(100) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `title` varchar(200) DEFAULT '' COMMENT '评论标题',
  `content` varchar(2000) DEFAULT '' COMMENT '评论内容',
  `nc` varchar(100) DEFAULT '' COMMENT '评论昵称',
  `fidpath` varchar(1000) DEFAULT '' COMMENT '评论层级',
  `s1` int(4) DEFAULT '0' COMMENT '评论层级',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `audit` smallint(1) DEFAULT '1' COMMENT '是否审核',
  `orderid` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_comment_copy`
-- ----------------------------
DROP TABLE IF EXISTS `qm_comment_copy`;
CREATE TABLE `qm_comment_copy` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `ty` smallint(1) DEFAULT '0' COMMENT '评论类型 1产品评论 2会员评论',
  `uid` bigint(12) DEFAULT '0' COMMENT '会员编号',
  `pid` bigint(12) DEFAULT '0' COMMENT '产品或者会员编号',
  `hid` bigint(12) DEFAULT '0' COMMENT '回复id',
  `ip` varchar(100) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `title` varchar(200) DEFAULT '' COMMENT '评论标题',
  `content` varchar(2000) DEFAULT '' COMMENT '评论内容',
  `nc` varchar(100) DEFAULT '' COMMENT '评论昵称',
  `fidpath` varchar(1000) DEFAULT '' COMMENT '评论层级',
  `s1` int(4) DEFAULT '0' COMMENT '评论层级',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `audit` smallint(1) DEFAULT '1' COMMENT '是否审核',
  `orderid` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_comment_copy
-- ----------------------------
INSERT INTO `qm_comment_copy` VALUES ('1', '1', '9', '25', '0', '118.113.42.175', '1472522111', '', '包装很好，送礼很不错', '', '', '0', '1', '1', '');
INSERT INTO `qm_comment_copy` VALUES ('2', '1', '1', '2', '0', '171.212.195.226', '1473560519', '', '秦巴山生态放养富硒绿壳土鸡蛋这款产品真的不错！', '', '', '0', '1', '1', '');
INSERT INTO `qm_comment_copy` VALUES ('3', '1', '1', '25', '0', '171.212.195.226', '1473560948', '', '苍溪红心猕猴桃礼盒装（中果装）奇异果四川特产猕猴桃30枚质量不错！', '', '', '0', '1', '1', '1-5199907');
INSERT INTO `qm_comment_copy` VALUES ('5', '1', '1', '2', '0', '110.184.4.65', '1473769599', '', '秦巴山生态放养富硒绿壳土鸡蛋（40枚） 产品不错！适合送领导！', '', '', '0', '1', '1', '1-2175001');
INSERT INTO `qm_comment_copy` VALUES ('6', '1', '9', '25', '0', '171.212.195.20', '1473835921', '', '包装很好，没有损伤！！！', '', '', '0', '1', '1', '9-4658719');
INSERT INTO `qm_comment_copy` VALUES ('7', '1', '17', '1', '0', '110.184.221.254', '1474358447', '', '2012年5月31日，顺丰优选正式上线，北京区域全品类配送；有不配送区域，具体查看官网； 2012年12月12日，顺丰优选“时令优选”频道上线，特色经济产品开通全国配送；', '', '', '0', '1', '1', '17-6478952');
INSERT INTO `qm_comment_copy` VALUES ('8', '1', '1', '1', '0', '110.184.221.36', '1474804583', '', '适合送领导！小麥白啤酒 产品不错！适合送朋友！', '', '', '0', '1', '1', '1-107733');

-- ----------------------------
-- Table structure for `qm_config`
-- ----------------------------
DROP TABLE IF EXISTS `qm_config`;
CREATE TABLE `qm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varname` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` longtext,
  `sort` int(11) DEFAULT '1',
  `audit` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_config
-- ----------------------------
INSERT INTO `qm_config` VALUES ('1', 'cfg_webname', '网站标题', '1', '1', '商城建站系统', '1', '0');
INSERT INTO `qm_config` VALUES ('2', 'cfg_keywords', '关键字', '1', '1', '商城建站系统', '1', '0');
INSERT INTO `qm_config` VALUES ('3', 'cfg_description', '网站描述', '1', '2', '商城建站系统', '1', '0');
INSERT INTO `qm_config` VALUES ('4', 'cfg_copyright', '底部版权', '1', '1', '蜀ICP备xxxxxxx号-1 食品流通许可证 SPxxxx888880019900号', '1', '0');
INSERT INTO `qm_config` VALUES ('5', 'cfg_name', '网站名称', '1', '1', '商城建站系统', '1', '0');
INSERT INTO `qm_config` VALUES ('6', 'cfg_tel', '客服电话', '1', '1', '400-028-6255', '1', '0');
INSERT INTO `qm_config` VALUES ('7', 'cfg_qqx', 'QQ客服', '1', '7', '3388523218', '1', '0');
INSERT INTO `qm_config` VALUES ('8', 'cfg_work', '工作时间', '1', '1', '周一至周日 　8：30-22：00', '1', '0');
INSERT INTO `qm_config` VALUES ('9', 'cfg_beian', '备案号', '1', '1', '蜀ICP备12001945号-1', '1', '1');
INSERT INTO `qm_config` VALUES ('10', 'cfg_f1', '手机', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('11', 'cfg_f2', '邮箱', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('12', 'cfg_f3', '地址', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('13', 'cfg_wxh', '微信公众号', '1', '1', 'jinshuosunshine', '1', '0');
INSERT INTO `qm_config` VALUES ('14', 'cfg_key', '热门搜索', '1', '7', '土鸡蛋| 土鸡 皮蛋| 野生菌', '1', '0');
INSERT INTO `qm_config` VALUES ('15', 'cfg_welcome', '欢迎语', '1', '1', '  欢迎光临　', '1', '0');
INSERT INTO `qm_config` VALUES ('16', 'cfg_sm', '网站说明', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('17', 'cfg_weibo', '新浪微博', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('18', 'cfg_tq', '腾讯微博', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('19', 'cfg_qq', 'QQ客服', '1', '1', '', '1', '1');
INSERT INTO `qm_config` VALUES ('20', 'cfg_jf', '分享积分', '1', '1', '5', '1', '0');
INSERT INTO `qm_config` VALUES ('21', 'cfg_bl', '积分比例', '1', '10', '100', '1', '0');
INSERT INTO `qm_config` VALUES ('22', 'cfg_yunfei', '默认运费', '1', '1', '15', '1', '0');
INSERT INTO `qm_config` VALUES ('23', 'cfg_mb1', '生日消息模板', '1', '21', '尊敬的会员您好！你的生日将至，生日当天下单，土特土商城将会有特殊赠品相送哟。', '1', '0');
INSERT INTO `qm_config` VALUES ('24', 'cfg_mb2', '注册消息模板', '1', '21', '尊敬的会员，恭喜您成为土特土商城会员，祝您购物愉快！', '1', '0');
INSERT INTO `qm_config` VALUES ('25', 'cfg_mb3', '发货消息模板', '1', '22', '尊敬的会员您好！您的订单[#订单号#]已发货，请注意查收！', '1', '0');
INSERT INTO `qm_config` VALUES ('26', 'cfg_mb4', '未付款消息模板', '1', '23', '尊敬的会员您好！您有未付款订单，请在72小时内完成付款，超过72小时，系统将自动取消订单！', '1', '0');

-- ----------------------------
-- Table structure for `qm_count`
-- ----------------------------
DROP TABLE IF EXISTS `qm_count`;
CREATE TABLE `qm_count` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `s1` smallint(2) NOT NULL DEFAULT '0' COMMENT '统计类型 比如app浏览 app下载 广告点击 网站访问',
  `ip` varchar(255) DEFAULT '' COMMENT '所在区域',
  `url` text COMMENT '访问页面',
  `fromurl` text COMMENT '来源页面',
  `s2` smallint(3) DEFAULT '0' COMMENT '机型',
  `time` bigint(11) DEFAULT '0' COMMENT '访问时间',
  `z1` text COMMENT '附加字段1',
  `z2` text COMMENT '附加字段2',
  `z3` text COMMENT '附加字段3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_count
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_email`
-- ----------------------------
DROP TABLE IF EXISTS `qm_email`;
CREATE TABLE `qm_email` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `ty` smallint(2) DEFAULT '0' COMMENT '类型',
  `fid` bigint(11) DEFAULT '0' COMMENT '消息对象 比如我给会员留言 对象即是我',
  `uid` bigint(11) NOT NULL DEFAULT '0',
  `pid` bigint(11) DEFAULT NULL,
  `content` varchar(1150) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `ip` varchar(50) DEFAULT '',
  `del` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_email
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_flag`
-- ----------------------------
DROP TABLE IF EXISTS `qm_flag`;
CREATE TABLE `qm_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att` varchar(255) DEFAULT NULL,
  `attname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_flag
-- ----------------------------
INSERT INTO `qm_flag` VALUES ('1', 'y', '活动专区');
INSERT INTO `qm_flag` VALUES ('2', 'r', '热卖');
INSERT INTO `qm_flag` VALUES ('3', 'z', '正品保障');
INSERT INTO `qm_flag` VALUES ('4', 'f', '提供发票');
INSERT INTO `qm_flag` VALUES ('5', 't', '7天无理由退换货');
INSERT INTO `qm_flag` VALUES ('6', 'c', '促销');
INSERT INTO `qm_flag` VALUES ('7', 'x', '猜您喜欢');
INSERT INTO `qm_flag` VALUES ('8', 'j', '今日推荐');
INSERT INTO `qm_flag` VALUES ('9', 'd', '手机置顶');

-- ----------------------------
-- Table structure for `qm_info`
-- ----------------------------
DROP TABLE IF EXISTS `qm_info`;
CREATE TABLE `qm_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) NOT NULL DEFAULT '',
  `entitle` varchar(255) DEFAULT '',
  `cid` int(7) DEFAULT '0',
  `share` smallint(1) DEFAULT '0' COMMENT '是否是全站共享',
  `fid` int(11) DEFAULT NULL,
  `fidpath` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `content` longtext,
  `title` longtext,
  `keywords` longtext,
  `description` longtext,
  `sort` int(11) DEFAULT '9999',
  `hit` int(11) DEFAULT '18',
  `addtime` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT '',
  `simg` longtext,
  `url` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `kdel` int(11) DEFAULT NULL,
  `flag` varchar(255) NOT NULL DEFAULT '',
  `settop` int(11) DEFAULT '0',
  `audit` int(11) DEFAULT '1',
  `vouch` int(11) DEFAULT '0',
  `addtime2` datetime DEFAULT NULL,
  `bz1` longtext,
  `bz2` longtext,
  `bz3` longtext,
  `bz4` longtext,
  `bz5` longtext,
  `bz6` longtext,
  `bz7` longtext,
  `bz8` longtext,
  `bz9` longtext,
  `bz10` longtext,
  `s1` double(10,2) DEFAULT '0.00',
  `s2` double(10,2) DEFAULT '0.00',
  `s3` double(11,0) DEFAULT '0',
  `s4` bigint(11) DEFAULT '0',
  `s5` bigint(11) DEFAULT '0',
  `s6` bigint(11) DEFAULT '0' COMMENT '购买人数',
  `s7` bigint(11) DEFAULT '0',
  `s8` bigint(11) DEFAULT '1',
  `s9` bigint(11) DEFAULT '0' COMMENT '累计评价',
  `kucun` bigint(11) DEFAULT '0' COMMENT '库存',
  `sd` bigint(11) DEFAULT '0',
  `z1` longtext,
  `z2` longtext,
  `z3` longtext,
  `z4` longtext,
  `z5` longtext,
  `uid` bigint(11) DEFAULT '0',
  `weburl` varchar(500) DEFAULT '',
  `vid` bigint(11) DEFAULT '0' COMMENT '活动发布人',
  PRIMARY KEY (`id`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_info
-- ----------------------------
INSERT INTO `qm_info` VALUES ('1', '绿壳土鸡蛋快速装', null, '1', '0', '167', ',0,1,33,40,167', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('2', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '68', ',0,1,33,40,68', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('3', '商品积分兑换', null, '1', '0', '5', ',0,5', '', '', '', '', '', '1', '6', '2016-06-21 10:42:41', '/images/detail1.jpg', '', '', null, '', '0', '', '0', '1', '0', '2016-06-21 10:43:10', '1', '', '', '', '', '', '', '', 'admin', '本站', null, '99999.00', null, '3', '0', '81', '0', '1', '0', '66', '0', '', '', '', '', '', '0', '/integral/3.html', '0');
INSERT INTO `qm_info` VALUES ('4', '关于我们', null, '1', '0', '6', ',0,6', '', '<p>\r\n	<br />\r\n</p>\r\n<p align=\"center\">\r\n	关 于 我 们\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	土特土商城（英文域名：<a href=\"http://www.tutetoo.com/\"><strong><span>www.tutetoo.com</span></strong></a><span>）隶属四川金硕阳光生态农业有限公司，为旗下B2C农产品购物平台。网站汇集了国内众多名优农副土特产品，部分产品还来自公司基地。网站</span>宗旨：“打造安全、健康、优质的农土特产品”。在商城网站内，用户可以注册成为会员、享受优质、安全的购物体验。目前我们拥有完善的客服服务人员、物流工作人员，品质监测人员、市场开拓人员及产品物流仓库（备注：部分生鲜季节产品需从原产地发货除外）。品质护航、快乐购物，土特土商城欢迎您的光临！\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	四川金硕阳光生态农业有限公司\r\n</p>\r\n<p>\r\n	联系电话：400-028-6255 、028-84422716&nbsp;\r\n</p>\r\n<p>\r\n	邮箱：<a href=\"mailto:scgoldagri@126.com\">scgoldagri@126.com</a>\r\n</p>\r\n<p>\r\n	地&nbsp;&nbsp;&nbsp; 址：成都市成华区建材路39号隆鑫九熙广场2-2509&nbsp;\r\n</p>', '', '', '', '1', '334', '2016-06-21 10:47:59', '', '', '', null, '', '0', '', '0', '1', '0', '2016-06-21 10:52:06', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/about/4.html', '0');
INSERT INTO `qm_info` VALUES ('5', '淘宝网', '', '1', '0', '16', ',0,13,16', '', '', '', '', '', '4', '1', '2016-06-21 11:00:07', '', '', 'http://www.taobao.com', '', '', '0', '', '0', '1', '0', '2016-06-21 11:00:18', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '350', '0', '1', '0', '-350', '0', '', '', '', '', '', '0', '/link/5.html', '0');
INSERT INTO `qm_info` VALUES ('6', '天猫', '', '1', '0', '16', ',0,13,16', '', '', '', '', '', '3', '1', '2016-06-21 11:00:19', '', '', 'http://www.tmall.com', '', '', '0', '', '0', '1', '0', '2016-06-21 11:00:31', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '36', '0', '1', '0', '-36', '0', '', '', '', '', '', '0', '/link/6.html', '0');
INSERT INTO `qm_info` VALUES ('7', '京东商城', '', '1', '0', '16', ',0,13,16', '', '', '', '', '', '2', '1', '2016-06-21 11:00:33', '', '', 'http://www.jd.com', '', '', '0', '', '0', '1', '0', '2016-06-21 11:00:45', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '7', '0', '1', '0', '-7', '0', '', '', '', '', '', '0', '/link/7.html', '0');
INSERT INTO `qm_info` VALUES ('8', '可信网站', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '7', '1', '2016-06-21 11:21:47', '/img/cx1.jpg', '', '', '', '', '0', '', '0', '0', '0', '2016-06-21 11:22:18', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '168', '0', '1', '0', '-168', '0', '', '', '', '', '', '0', '/other/list-15/8.html', '0');
INSERT INTO `qm_info` VALUES ('9', '支付宝', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '6', '1', '2016-06-21 11:22:20', '/img/cx2.jpg', '', '', '', '', '0', '', '0', '1', '0', '2016-06-21 11:22:27', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '144', '0', '1', '0', '-144', '0', '', '', '', '', '', '0', '/other/list-15/9.html', '0');
INSERT INTO `qm_info` VALUES ('10', '微信支付', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '5', '1', '2016-06-21 11:22:28', '/img/cx3.jpg', '', '', '', '', '0', '', '0', '1', '0', '2016-06-21 11:22:40', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-15/10.html', '0');
INSERT INTO `qm_info` VALUES ('11', '安全检查', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '4', '1', '2016-06-21 11:22:41', '/img/cx4.jpg', '', '', '', '', '0', '', '0', '0', '0', '2016-06-21 11:22:57', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-15/11.html', '0');
INSERT INTO `qm_info` VALUES ('12', '百度信誉档案', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '3', '1', '2016-06-21 11:22:58', '/img/cx5.jpg', '', '', '', '', '0', '', '0', '0', '0', '2016-06-21 11:23:11', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-15/12.html', '0');
INSERT INTO `qm_info` VALUES ('13', '诚信网站', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '2', '1', '2016-06-21 11:23:12', '/img/cx6.jpg', '', '', '', '', '0', '', '0', '0', '0', '2016-06-21 11:23:26', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-15/13.html', '0');
INSERT INTO `qm_info` VALUES ('14', '工商网监', '', '1', '0', '15', ',0,13,15', '', '', '', '', '', '1', '1', '2016-06-21 11:23:27', '/img/cx7.jpg', '', '', '', '', '0', '', '0', '1', '0', '2016-06-21 11:23:40', '', '', '', '', '', '', '', '', 'admin', '本站', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-15/14.html', '0');
INSERT INTO `qm_info` VALUES ('15', 'banner', null, '1', '0', '14', ',0,13,14', '', '', null, null, null, '1', '21', '2016-06-21 12:16:32', '/pub/qm/p/image/160922/134448_304.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 12:16:45', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-14/15.html', '0');
INSERT INTO `qm_info` VALUES ('16', 'banner2', null, '1', '0', '14', ',0,13,14', '', '', null, null, null, '2', '17', '2016-06-21 13:44:26', '/pub/qm/p/image/160922/134924_360.jpg', '', 'http://www.tutetoo.com/product/huacai/25.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:44:31', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-14/16.html', '0');
INSERT INTO `qm_info` VALUES ('17', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('18', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('19', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('21', '用户注册协议', null, '1', '0', '87', ',0,87', '', '<p style=\"text-align: center; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">用 户 注 册 协 议</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">“</span><span style=\"font-family: 宋体;\">土特土”网（<a href=\"http://www.tutetoo.com/\"><span style=\"color: windowtext; font-family: ;\">http://www.tutetoo.com</span></a>）是由四川金硕阳光生态农业有限公司（下称金硕阳光公司）自建并运营的电子商务网站。金硕阳光公司将通过本网站向您提供优质的土特商品及相关服务，并严格遵守本协议及相关承诺。当您通过本网站系统注册成为用户或以其它方式获得本网站所提供的商品及相关服务时，即表明您已经完全接受并签署了本协议。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">一．协议接纳</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">1.1 </span><span style=\"font-family: 宋体;\">如果您通过电脑端或手机端登录“土特土”网，购买商品或接受服务的，应当遵守相应网站的注册协议及其所发布的一切规则。<br/> 1.2 您在点击“同意“本协议之前，应当认真阅读“土特土”网相应的注册服务协议。<br/> 1.3 您应当认真阅读本协议，对于协议中重要权益的内容，您应当加以重点阅读。 如果您对本协议中的某一或某些条款产生疑问，您应当向土特土网咨询。如果您不同意本协议中的某一或某些条款，您应当立即停止注册。<br/> 1.4 本协议为电子形式的协议，是处理您与土特土网一切权利义务关系的约定，对双方均具有法律约束力。<br/> 1.5 “土特土” 网站上所发布的一切规则都是本协议的条款，是本协议不可分割的组成部分。因此，当您完全接受本协议时，表明您也完全接受本协议的特殊条款。<br/> 1.6 金硕阳光公司根据经营需要对本协议作出的新修订或其在“土特土”网站上不时发布的新规则对您具有法律约束力。如果您不愿意接受，请您停止注册，或停止使用“土特土”网站。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">二．服务说明</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">2.1 </span><span style=\"font-family: 宋体;\">金硕阳光公司通过其自建的“土特土”网站运营系统，为您提供商品交易、物流配送、售后服务等服务项目。除此之外，“土特土”网站所不时推出的新商品和新服务均属于本协议的调整范围。<br/> 2.2 为使用“土特土”网站，您应当自行负责接入国际互联网，以及配备上网所需的一切硬件设备，包括但不限于计算机、调制解调器或其它存取设备。由此所产生的一切费用，您同意土特土网不予承担。<br/> 2.3 为方便您使用“土特土”网站，金硕阳光公司尽最大努力保障网络的畅通性。但是由于互联网服务的特殊性，金硕阳光公司不保证服务不会中断，也不担保服务的绝对安全性和准确性。<br/> 2.4 为保障您的利益或提高服务质量，金硕阳光公司有权定期或不定期的对网站或相应的系统进行检修、维护或升级，您对此表示理解和支持。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">三．网上注册</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">3.1 </span><span style=\"font-family: 宋体;\">当您登陆“土特土”网站注册系统进行注册时，您应当具备完全民事权利能力和完全民事行为能力。如果您不具备完全民事权利能力或完全民事行为能力，您应当停止注册或在您的监护人的参与下完成注册。如果您违反本项规定而进行注册，金硕阳光公司将有权注销您的账户。<br/> 3.2 您应该根据“土特土”网站系统的要求填写必要的注册信息和账户信息，并保证信息的合法性、真实性、及时性和有效性。注册成功后，如果您所填写的信息发生改变，您应当及时登录“土特土”网站变更相关内容。<br/> 3.3 如果土特土网发现您填写的注册信息和账户信息存在违规、违法、不真实或无效，金硕阳光公司有权删除相关信息或冻结、注销您的账户。<br/> 3.4 注册成功后，您将获得“土特土”网站为您提供的用户名。该用户名的所有权归属于金硕阳光公司，您对用户名仅具有使用权。<br/> 3.5 您愿意接受由土特土网以电子邮件、手机短信等方式发送的任何广告和其它商业信息。<br/> 3.6 您不得将您注册的用户名及其对应密码转让、出借或出租给任何第三方使用，您应当为在该用户名下所发生的一切行为负责。如果您是在监护人参与下完成用户注册的不具备完全民事权利能力或完全民事行为能力的自然人，您及您的监护人同意为在该用户名下所发生的一切行为负责。<br/> 3.7 为保证交易安全，您应当妥善保管用户名和密码，并对他人使用您的计算机设定限制。如果因为您的疏忽或管理不善，造成用户名和密码外泄、被盗等后果的，您应当自行承担由此所引发的一切损失。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">四．商品信息</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">4.1 “</span><span style=\"font-family: 宋体;\">土特土”网站上所发布的一切商品信息，包括但不限于图片、视频、文字说明，均供您决定是否订购商品，一旦您在决定订购商品后通过网站系统提交订单，即表明您向土特土网发出了明确的购买该商品的意图。<br/> 4.2 土特土网有义务最大限度的提高商品信息的准确性、及时性、完整性和有效性。但是由于信息复杂、信息量庞大以及互联网技术问题，商品信息出现误差或错误在所难免。因此，土特土不必因此而承担法律责任。<br/> 4.3 为最大限度的提高商品信息的准确性、及时性、完整性和有效性，土特土网有权利对商品信息进行不间断的监测、修改或删除，对此您表示理解和支持。<br/> 4.4 当您通过网站系统提交订单后，商品信息发生变化的，您不得以变更后的商品信息主张权利或要求土特土网承担责任。<br/> 4.5 因网站系统或互联网技术性问题导致商品信息发生错误的，土特土网有权视情况取消订单或作其它处理。<br/> 4.6 土特土网不对商品的适用性及商品能够满足您的特定需求做任何保证。<br/> 4.7 为方便您直观的了解商品和相关服务，土特土网可以以图片或视频的形式展示商品，但是您应当认同图片或视频与真实商品之间具有直观上的差异性。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">五．商品订购</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">5.1 </span><span style=\"font-family: 宋体;\">如果您使用“土特土”网站购买商品或相关服务，请务必依据系统程序填写并提交订单。当您提交订单后，网站系统将自动向您的后台发送信息。<br/> 5.2 土特土网特别提醒您，请在购买商品或相关服务之前，务必认真了解有关商品的所有信息。在订单提交成功之后，您不得以不了解商品的相关信息而主张撤销订单。<br/> 5.3 当您使用“土特土”网站购买商品或相关服务时，请务必依据本协议及系统程序进行操作。您不得以不了解本协议及系统程序为由主张订单无效或可撤销。<br/> 5.4 “土特土”网站收到您的订单后，将会及时审核订单。经审核无误，金硕阳光公司将安排商品配送。如果金硕阳光公司认为订单存在疑问，无论您是否已经支付价款，金硕阳光公司均有权取消订单，或通过邮件、电话等沟通渠道要求您变更订单。<br/> 5.5 因市场存在难以控制的商业因素，您订购或拟订购的商品有可能存在缺货现象，如果缺货，土特土网将无法配送，此时，您有权取消订单。<br/> 5.6 如果“土特土”网站推出预订商品，您可以根据网站的相关预订规则提交订单。土特网可以根据实际情况决定是否接受订单，如果接受订单，土特土网将按照预订规则和您的合理要求向您配送商品。<br/> 5.7 当您提交订单时，请务必确认商品信息和价格信息。土特土网对商品信息和价格信息作出变动的，不再特别作出通知或说明。<br/> 5.8 土特土网根据本协议的规定拒绝、取消或不接受订单的，您同意自行承担一切责任，但是有特别规定的除外。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">六．商品价格</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">6.1 </span><span style=\"font-family: 宋体;\">为方便您选购商品，土特土网在网站的相应位置公布商品价格。<br/> 6.2 商品价格包含税，部分商品包含运费。有运费的具体结算以不超过为市场均价格为准。<br/> 6.3土特土网可以根据市场变化或市场竞争的需要不时的变更商品价格。如果价格变更发生在您提交订单之前，您所订购商品的价格以变更后的价格为准。如果您提交订单后发生了价格变更，您所订购商品的价格以您提交订单时的价格为准。<br/> 6.4 提交订单后，土特土网发现由于人工操作失误或技术问题导致定价错误，您同意按如下方式处理：<br/> （1）如果您所订购商品的正确价格（以“土特土”网站对相应商品价格的再次公布为准）低于错误定价，金硕阳光公司有义务按较低价格收取您的付款。<br/> （2）如果您所订购商品的正确价格高于错误定价，土特土网将会与您沟通，并根据实际情况作出取消订单或停止配送的处理，此时，您也有权取消订单。<br/> 6.5 “市场价”或横线划去的价格不等于原价，其是方便您购物时参考的预估市场价，而非本网站在降价前一周内的最低交易价格。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">七．促销规则</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">7.1 </span><span style=\"font-family: 宋体;\">促销活动是指在一定时期内，土特土网针对某些商品作让利处理或针对消费者群体开展的优惠激励措施。<br/> 7.2 促销形式包括如下三种情形：<br/> （1）某些商品集合内的满减、满返和满增；<br/> （2）相对于原网站定价的直接降价；<br/> （3）其它满足7.1的形式；<br/> 7.3 促销活动的目的是为满足您及其他消费者的消费需求，一切以牟利、排挤竞争为意图或者为达到其它恶意目的的参与行为均不予接受。<br/> 7.4 使用同一账户参与促销活动时，每日下单总量至多仅限于5份，超过份数限制的订单作无效处理，土特土网有权取消或停止发货。<br/> 7.5 土特土网发现与促销活动相关的订单中的配送地址相同或相近的，相关订单无效，土特土网有权取消或停止发货。<br/> 7.6 土特土网发现与促销活动相关的订单中的收货人信息相同或相近的，相关订单无效，金硕阳光公司有权取消或停止发货。<br/> 7.7 土特土网有合理理由怀疑用户有恶意参加促销活动的，相关订单无效，土特土网有权取消或停止发货。<br/> 7.8 土特土网开展促销活动时所临时发布的活动规则与上述不一致的，以临时发布的规则为准。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">八．物流配送</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">8.1 </span><span style=\"font-family: 宋体;\">如果您订购冷藏、冷冻类商品，土特土网将依靠协议物流系统直接进行物流配送服务。<br/> 8.2 您默认土特土网依靠其协议物流系统直接进行物流配送服务，您也可以指定选择其它物流、快递或邮政单位配送商品，增加的费用您必须承担。<br/> 8.3 土特土网根据您提供的收货人信息及您在备注信息栏中填写的合理信息安排商品配送。如果收货人不是您本人，收货人的行为即为您本人的行为，收货人与您应当承担连带责任。<br/> 8.4 订单生成后，您通过与土特土网客服沟通变更了收货人信息或备注信息的，实际配送服务将依据您变更后的信息作出安排。<br/> 8.5 土特土网在特别条款（《配送政策》）中所承诺的配送时效均为一般配送时间，该时间仅作为您订购商品的参考因素。<br/> 8.6 发生下列情形之一的，土特土网不承担迟延送达的违约责任：<br/> （1）发生不可抗力或情势变更事件的；<br/> （2）您提供的信息有误、过时、缺失，或根据您提供的信息无法判断收货人或收货地址的；<br/> （3）因网络故障、系统故障、系统检修、维护或升级导致迟延送达的；<br/> （4）因路途遥远且交通不便造成迟延送达的；<br/> （5）为满足您的配送要求及特殊需要而迟延送达的。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">九．评论规则</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">9.1 </span><span style=\"font-family: 宋体;\">土特土网欢迎并鼓励您在网站系统上进行商品评论、文章评论、公布订单、发布图片或视频等言论行为。但是，在“土特土”网站上所进行的一切言论行为均属于您的个人行为，与土特土网无关。<br/> 9.2 为保障网络信息安全，您在进行言论行为时，应当遵守国家相关法律法规的规定，不得制作、复制、发布、传播含有下列内容的信息：<br/> （1）违反宪法所确定的基本原则的；<br/> （2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/> （3）损害国家荣誉和利益的；<br/> （4）煽动民族仇恨、民族歧视，破坏民族团结的；<br/> （5）破坏国家宗教政策，宣扬邪教和封建迷信的；<br/> （6）散布谣言，扰乱社会秩序，破坏社会稳定的；<br/> （7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/> （8）侮辱或者诽谤他人，侵害他人合法权益的；<br/> （9）含有法律、行政法规禁止的其他内容的。<br/> 9.3 您保证自己在网站系统上所进行的一切言论行为均不侵犯土特土的合法权益。<br/> 9.4 您保证自己在网站系统上所进行的一切言论行为均不侵犯任何第三人的合法权益。如果因您的言论行为引起法律纠纷，您应当积极协助金硕阳光公司处理。第三人向土特土网索赔的，土特土网有权在实际赔偿之后，向您追偿。<br/> 9.5 您承诺自己在网站系统上制作、复制、发布、传播的一切评论、图片和视频不损害金硕阳光公司的商业信誉。<br/> 9.6土特土网认为您违反相关评论规则的，其有权删除相关评论、图片或视频，冻结或注销您的账户，并保留追究您法律责任的权利。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">十．知识产权</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">10.1 </span><span style=\"font-family: 宋体;\">除您及其它用户向“土特土”网站所发布的评论、订单、图片或视频之外，金硕阳光公司对“土特土”网站及网站上所显示的其它所有信息资料，包括但不限于商标、软件系统、宣传图案、商品图片、商品信息、视频资料和文字信息，享有绝对的、完全的知识产权。<br/> 10.2 未经金硕阳光公司同意，您不得以任何方式修改、复制和传播土特土网享有知识产权的信息资料。<br/> 10.3 对于您向“土特土”网提供的一切图片及信息资料，您同意授予金硕阳光公司免费的 使用权利。您确认，金硕阳光公司对您提供的信息资料的使用是基于您对信息资料内容的合法性、真实性的承诺之上，金硕阳光公司因使用该信息资料而遭受索赔、指控的，您应当承担全部责任。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">十一．隐私保护</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">11.1 </span><span style=\"font-family: 宋体;\">土特土网保证不对外公开或向任何第三方透露您的注册信息、账户信息和交易信息，但是存在下列情形之一的除外：<br/> （1）公开或透露相关信息之前获得您许可的；<br/> （2）根据法律或政策的规定而公开或透露的；<br/> （3）为向您提供商品或服务而需要公开或透露的；<br/> （4）金硕阳光公司为保护自身利益而公开的；<br/> （5）根据本协议其它约定而公开或透露的。<br/> 11.2 为了向您提供优质的服务，您同意土特土网将您的注册信息、账户信息和交易信息提供给金硕阳光公司的关联公司以及与金硕阳光公司合作的第三方。<br/> 11.3 金硕阳光公司根据本协议的规定对网站或相应的系统进行检修、维护或升级时，有可能丢失、损坏或泄漏您的注册信息、账户信息或交易信息，您对此表示理解，且不要求土特土网承担责任。<br/> 11.4 为保证交易安全以及保障您的合法权益，土特土网建议您对注册信息、账户信息和交易信息进行数据备份。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">十二．协议终止</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">12.1 </span><span style=\"font-family: 宋体;\">土特土网有权通知您终止本协议，您有权请求土特土网作出终止本协议的决定。<br/> 12.2 发生下列情形之一的，土特土网有权立即终止协议：<br/> （1）本协议发生变更后，您明确通知土特土网不愿意接受新协议或变更内容的；<br/> （2）土特土网发现您连续1个月内注册用户数量超过10个的；<br/> （3）土特土网发现您为达到排挤竞争对手、实施不正当竞争的目的而注册用户的，或者土特土网发现您有其它恶意目的注册用户，扰乱正常经营秩序的；<br/> （4）土特土网发现您恶意注册用户，扰乱正常经营秩序的；<br/> （5）土特土网发现您对订单多次恶意拒收，扰乱正常经营秩序的；<br/> （6）您注册账户后，连续12个月不使用该账户的；<br/> （7）您通过本网站进行违法犯罪活动的。<br/> 12.3 协议终止后，您在“土特土”网站上的积分、优惠券和礼品卡均失效，金硕阳光公司不予兑现。<br/> 12.4 协议终止后，您同意土特土网在1年内继续保留您的注册信息、账户信息以及交易记录。<br/> 12.5 协议终止后，土特网有权向他人开放您所注册使用的用户名。<br/> 12.6 如果您在协议终止之前存在违反本协议的行为，土特土网有权依据本协议追究您的法律责任。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">十三．法律适用</span></strong></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><span style=\"font-family: 宋体;\">13.1 </span><span style=\"font-family: 宋体;\">本协议的签订、履行和执行及解释均适用中华人民共和国法律法规。如果中华人民共和国法律法规没有相关规定，则适用中华人民共和国的商业惯例。<br/> 13.2 如果本协议</span><span style=\"font-family: 宋体;\"></span><span style=\"font-family: 宋体;\">的相关规定违反中华人民共和国法律法规的相应条款，则适用中华人民共和国法律法规。如果本协议的相关规定违反中华人民共和国的相关商业惯例，则仍然以本协议为准。</span></p><p style=\"text-align: left; margin-top: auto; margin-bottom: auto;\"><strong><span style=\"font-family: 宋体;\">十四．纠纷解决</span></strong></p><p><span style=\"font-family: 宋体; font-size: 14px;\">14.1 </span><span style=\"font-family: 宋体; font-size: 14px;\">因本协议发生的任何争议，金硕阳光公司与您应当友好协商，协商不成的，任何一方均有权向被告住所所在地有管辖权的人民法院起诉，其它任何法院均不具有管辖权。</span></p><p>&nbsp;</p>', '', '', '', '1', '101', '2016-06-24 14:36:17', '', '', '', null, '', '0', '', '0', '1', '0', '2016-06-24 14:36:40', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/agree/21.html', '0');
INSERT INTO `qm_info` VALUES ('22', '时尚礼盒', null, '1', '0', '4', ',0,4', '', '详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息详细信息', '', '', '', '2', '146', '2016-06-24 14:41:57', '/pub/qm/p/image/160830/100041_447.jpg', '', '', null, '', '0', '', '0', '1', '0', '2016-06-24 14:47:26', '', '0261778677', '品牌', '产地', '', '', '成都', '', 'admin', '本站', '88.00', '36.00', '15', '6', '0', '0', '0', '1', '0', '200', '650698', '', '', '', '', '', '0', '/gift/22.html', '0');
INSERT INTO `qm_info` VALUES ('23', '联系我们', null, '1', '0', '7', ',0,7', '', '<p>\r\n	公司地址：成都市成华区建材路39号九熙广场2栋2509＃\r\n</p>\r\n<p>\r\n	联系电话：400-028-6255\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">邮箱：</span><a href=\"mailto:scgoldagri@126.com\" style=\"line-height:1.5;color:#000000;text-decoration:none;\">scgoldagri@126.com</a>\r\n</p>\r\n<p>\r\n	<iframe style=\"width:560px;height:362px;\" src=\"http://www.tutetoo.com/pub/qm/plugins/baidumap/index.html?center=104.144065%2C30.650202&zoom=18&width=558&height=360&markers=104.144065%2C30.650202&markerStyles=l%2CA\" frameborder=\"0\">\r\n	</iframe>\r\n</p>\r\n<!--\r\n<p>\r\n	<iframe src=\"/pub/qm/plugins/baidumap/index.html?center=104.147232%2C30.650256&zoom=17&width=558&height=360&markers=104.147232%2C30.650256&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n	</iframe>\r\n</p>\r\n-->', '', '', '', '1', '342', '2016-07-01 13:36:51', '', '', '', null, '', '0', '', '0', '1', '0', '2016-07-01 13:37:50', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/contact/23.html', '0');
INSERT INTO `qm_info` VALUES ('24', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('27', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('28', '礼盒专区1', null, '1', '0', '97', ',0,13,97', '', '', null, null, null, '2', '1', '2016-08-30 14:54:19', '/images/g1.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-08-30 14:54:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-97/28.html', '0');
INSERT INTO `qm_info` VALUES ('29', '礼盒专区2', null, '1', '0', '97', ',0,13,97', '', '', null, null, null, '1', '1', '2016-08-30 14:55:47', '/images/g1.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-08-30 14:55:55', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-97/29.html', '0');
INSERT INTO `qm_info` VALUES ('31', '合作洽谈', null, '1', '0', '9', ',0,9', '', '<p>请联系土特土客服：400-028-6255 或 028-84422716 &nbsp;邮箱：scgoldagri@126.com</p>', '', '', '', '1', '185', '2016-09-23 11:40:03', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 11:40:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/cooperation/31.html', '0');
INSERT INTO `qm_info` VALUES ('32', '配送政策', null, '1', '0', '21', ',0,10,21', '', '<p style=\"text-align:left;\">\r\n	<strong style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">配送政策</strong> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">一、配送范围及配送时效</span></strong></span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-top:0px;margin-bottom:0px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;font-size:14px;\">1<span style=\"font-size:14px;\">、</span></span><span style=\"color:#6B6B6B;font-size:14px;\"><span style=\"font-size:14px;\">订单生成后，商城将在</span>24小时内安排发货、并根据默认物流配送（预订类商品订单除外）。由于部分农产品将在</span></span><span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;\">原</span></span><span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;\">产</span></span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">地发货，可能</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">会因为</span>\r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-top:0px;margin-bottom:0px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">&nbsp; &nbsp;所处地理偏远或物流不发达等情况而延</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">迟发货，敬请谅解。</span>\r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-top:0px;margin-bottom:0px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">2、订单支持配送的范围，有可能存在部分偏远地区无法直接送达的情况，商城会根据情况为您转寄其他快递公司发货，敬请谅解。</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-top:0px;margin-bottom:0px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">3、下单成功后48小时内，会员可以在我的订单内查询到货物的物流信息。</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-top:0px;margin-bottom:0px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">3、特殊节假日可能会出现延期发货或在发货后物流拖延的情况，商城平台会给予公告，敬请谅解</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">。</span><span style=\"font-family:宋体, SimSun;font-size:14px;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">二、配送须知</span></strong></span> \r\n</p>\r\n<p>\r\n	<strong style=\"line-height:20px;font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;font-family:宋体;\">收件人姓名</span></strong> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">收件人请填写中文姓名，如使用非中文姓名，请务必与身份证或护照保持完全一致，以保证您的货物可以准确送达。如不一致造成货物无法送达或</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">丢失，商城不负任何责任。</span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<strong style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;font-family:宋体;\">配送变更说明</span></strong> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">如遇五一、十一、春节等假期、当地城市的大型庆祝活动、大雨雪、洪涝、冰灾、地震等自然灾害及交通管制等特殊情况，配送时间将会有适当顺延，请您给予谅解。货物一经发出，如果需要更改收货地址而产生的配送费用以及出现生鲜变质，用户需承担更改责任。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>', '', '', '', '1', '294', '2016-09-23 11:41:23', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 11:42:05', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/delivery/list-21/32.html', '0');
INSERT INTO `qm_info` VALUES ('33', '会员介绍', null, '1', '0', '17', ',0,8,17', '', '<p>\r\n	<strong style=\"line-height:33px;\"><span style=\"color:#6B6B6B;font-family:宋体;\">一、会员级别:</span></strong> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">土特土商城会员目前分为3级，分别为：普通会员、vip会员和钻石会员</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">会员等级标准</span><span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">如下：</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\"></span><img style=\"width:444px;height:172px;\" title=\"\" alt=\"\" align=\"\" src=\"/pub/qm/p/image/161121/225942_185.png\" width=\"448\" height=\"164\" />&nbsp;\r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"text-align:center;color:#6B6B6B;line-height:33px;font-family:宋体;\">备注：会员等级通过购物送积分、分享送积分并达到对应的标准后才能升级;购物积分是指成功购物后获得的积分，分享积分是成功分享后获得的积分。会员积分兑换后，扣除相应积分，但会员等级不会降低。</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:150%;\">\r\n	<span style=\"text-align:center;color:#6B6B6B;line-height:33px;font-family:宋体;\">会员积分来源仅限以下获得：</span><strong><span style=\"color:#6B6B6B;font-family:宋体;\"><br />\r\n</span></strong><img style=\"width:441px;height:115px;\" alt=\"\" src=\"/pub/qm/p/image/161121/230350_123.png\" width=\"456\" height=\"119\" /> \r\n</p>\r\n<p style=\"text-align:left;line-height:22px;\">\r\n	<strong><span style=\"color:#6B6B6B;font-family:宋体;\">二、会员权益</span></strong> \r\n</p>\r\n<p style=\"text-align:left;line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;\"></span><img style=\"width:442px;height:146px;\" title=\"\" alt=\"\" align=\"\" src=\"/pub/qm/p/image/161121/224415_986.png\" width=\"442\" height=\"146\" /> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;\">*</span><span style=\"color:#6B6B6B;font-family:宋体;\">备注：以上会员权益均由系统自动计算，积分兑换需个人到积分商城人工兑换。</span> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;\">*</span><span style=\"color:#6B6B6B;font-family:宋体;\">积分兑换商品：土特土商城不定期推出的各种积分兑换商品。</span> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<strong><span style=\"color:#6B6B6B;font-family:宋体;\">三</span></strong><strong><span style=\"color:#6B6B6B;font-family:宋体;\">、会员日时间说明</span></strong> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;\">会员日为商城周年或特殊节日。</span> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<strong><span style=\"color:#6B6B6B;font-family:宋体;\">四、特别声明</span></strong> \r\n</p>\r\n<p style=\"line-height:33px;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">1. 会员级别变更在积分获得后的24小时内生效。 </span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">2. 企业客户不享受本会员政策，企业客户可以直接与客服联系享受专属服务。 </span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">3. 会员账号禁止转借或转让他人使用，如因转借或转让他人使用所带来的一切后果，土特土商城概不负责。</span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">4. </span><span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">会员在公共场合登录账号，建议不要选择记录账号，退出时应选择安全退出。</span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">5.&nbsp;</span><span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\">会员权益最终解释权归土特土商城方所有。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#6B6B6B;line-height:150%;font-family:宋体;\"></span> \r\n</p>', '', '', '', '1', '506', '2016-09-23 11:42:40', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 12:53:14', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/guide/g17/33.html', '0');
INSERT INTO `qm_info` VALUES ('34', '购物流程', null, '1', '0', '18', ',0,8,18', '', '<p>\r\n	一、新用户注册\r\n</p>\r\n<p>\r\n	第一步：进入土特土商城网站，点击页面上方的“免费注册”进入注册页面。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621752955649.jpg\" title=\"1474621752955649.jpg\" alt=\"1.jpg\" /> \r\n</p>\r\n<p>\r\n	第二步:在相应提示处输入您的账户名、手机号（本人长期使用手机号码）、密码（密码设置不要过于简单）、确认密码、输入验 证码后，点击“立即注册”即可，注册用户名是唯一的。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621763128398.jpg\" title=\"1474621763128398.jpg\" alt=\"2.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第三步：完成注册后，系统自动登录。您可以进入“会员中心&nbsp;–个人中心”编辑个人档案或直接挑选所需购买的商品。\r\n</p>\r\n<p>\r\n	备注：也可以点击使用个人：QQ、新浪微博、微信、支付宝账户直接登录后再完善资料。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	二、搜索商品\r\n</p>\r\n<p>\r\n	方法一：通过导航查找。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621776476361.jpg\" title=\"1474621776476361.jpg\" alt=\"3.jpg\" /> \r\n</p>\r\n<p>\r\n	方法二：您可以通过在首页输入关键字的方法来搜索您想要购买的商品\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621784340639.jpg\" title=\"1474621784340639.jpg\" alt=\"4.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	三、确认下单\r\n</p>\r\n<p>\r\n	第一步：放入购物车。\r\n</p>\r\n<p>\r\n	在您想要购买的商品的详情页点击“加入购物车”，商品会添加到您的购物车中；您还可以继续挑选商品放入购物车，一起结算。\r\n</p>\r\n<p>\r\n	（1）在购物车中，系统默认每件商品的订购数量为一件，如果您想购买多件商品，可修改购买数量\r\n</p>\r\n<p>\r\n	（2）在购物车中，您可以直接查看到商品的优惠折和参加促销活动的商品名称、促销主题\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621792675168.jpg\" title=\"1474621792675168.jpg\" alt=\"5.jpg\" />温馨提示：\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; （1）商品价格会不定期调整，最终价格以您提交订单后订单中的价格为准<br />\r\n&nbsp; &nbsp;&nbsp;（2）优惠政策、配送时间、运费收取标准等都有可能进行调整，最终成交信息以您提交订单时网站公布的最新信息为准\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第二步：在购物车中确认商品的数量及金额等信息无误后进行结算。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621802681279.jpg\" title=\"1474621802681279.jpg\" alt=\"6.jpg\" /> \r\n</p>\r\n<p>\r\n	温馨提示：在购物车内，您可以修改商品的数量等商品属性。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第三步：&nbsp;按提示填写详细的配送地址、收件人信息、联系电话，相关信息确定后，提交订单去支付。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621814110256.jpg\" title=\"1474621814110256.jpg\" alt=\"7.jpg\" /> \r\n</p>\r\n<p>\r\n	温馨提示：如果商品在72小时内未提交订单，商品将重新回到货架、需要重新操作购买。\r\n</p>\r\n<p>\r\n	第四步：&nbsp;提交订单后，在这里可以选择支付方式。\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621825534024.jpg\" title=\"1474621825534024.jpg\" alt=\"8.jpg\" /> \r\n</p>\r\n<p>\r\n	温馨提示：土特土商城目前提供2种支付方式，订购过程中您可以选择：（1）支付宝 （2）微信支付\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第五步：支付成功\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/20160923/1474621839101933.jpg\" title=\"1474621839101933.jpg\" alt=\"9.jpg\" />温馨提示：\r\n</p>\r\n<p>\r\n	（1）优惠劵使用\r\n</p>\r\n<p>\r\n	请在“会员中心”页面“我的优惠卷”使用优惠劵，输入有效的编号，即可查找对应商品并确认兑换使用。超期使用的优惠卷将不予以兑换。\r\n</p>\r\n<p>\r\n	（2）发票开具\r\n</p>\r\n<p>\r\n	会员购买时没有单独注明需要发票的，系统默认为不需要发票，需要发票可以在“提交订单”页面时选择开具发票，备注：个人需完善个人资料，否则以注册名字来开具，企业需提供完整开票资料。发票将在确认收货后订单完成的1周内采用邮局平邮或公司默认合作快递送达。开票时我们会按订货清单开具，不能开具其它特殊内容。用户可以在订单完成后的30天内提出申请补开发票，超过时间商城将不予开票。月底订单的发票有可能会在次月再开具。\r\n</p>\r\n<p>\r\n	（3）积分兑换商品与优惠卷兑换产品，不能提供发票。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '215', '2016-09-23 13:00:32', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 13:14:36', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/guide/g18/34.html', '0');
INSERT INTO `qm_info` VALUES ('35', '用券规则', null, '1', '0', '19', ',0,8,19', '', '<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<span style=\"font-size:14px;\"><strong style=\"color:#6B6B6B;\">如何使用土特土商城线下优惠券？</strong><strong style=\"color:#6B6B6B;\"></strong></span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<span style=\"color:#6B6B6B;font-family:Verdana, 宋体;letter-spacing:0.001cm;text-indent:1em;font-size:14px;\">使用商城线下优惠券时，必须先注册成为土特土商城会员，否则无法使用。您可通过以下途径兑换优惠卷。</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;font-family:Calibri, 宋体, \'Times New Roman\';font-size:14px;white-space:normal;word-break:break-word;\">\r\n	<span style=\"font-size:14px;\"><span style=\"font-family:Verdana, 宋体;color:#6B6B6B;\">请在“</span><span style=\"font-family:Verdana, 宋体;color:#565656;\">会员中心-我的优惠券</span><span style=\"font-family:Verdana, 宋体;color:#6B6B6B;\">”页面进行线下优惠券兑换，如下图：</span></span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<img src=\"/pub/qm/p/image/20160923/1474622118994464.jpg\" title=\"1474622118994464.jpg\" alt=\"13.jpg\" />\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<span style=\"color:#6B6B6B;font-size:14px;\">&nbsp;在我的优惠券页面中“输入优惠券号”点击查询，出现优惠券信息之后点击兑换即可</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<img src=\"/pub/qm/p/image/20160923/1474622126889380.jpg\" title=\"1474622126889380.jpg\" alt=\"14.jpg\" />\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<br />\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:14px;font-family:Verdana, 宋体;color:#FF0000;\"><strong style=\"font-family:宋体;font-size:14px;letter-spacing:0.0377953px;line-height:21px;text-indent:-70px;white-space:normal;color:#C00000;\">注意：</strong></span></span><span style=\"color:#6B6B6B;font-size:14px;\">超期未使用的优惠券将无法被激活再次使用。</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;word-wrap:break-word;white-space:normal;word-break:break-word;font-family:宋体;\">\r\n	<span style=\"font-family:Verdana, 宋体;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '176', '2016-09-23 13:54:27', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:00:50', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/guide/g19/35.html', '0');
INSERT INTO `qm_info` VALUES ('36', '验货与签收', null, '1', '0', '23', ',0,10,23', '', '<p style=\"line-height:150%;\">\r\n	<span style=\"font-size:14px;font-family:宋体, SimSun;\"><strong><span style=\"font-size:14px;line-height:150%;color:#6B6B6B;\">验货</span></strong></span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">请您在配送人员在场情况下，当面开包验收您的商品。为保障您的合法权益，请您务必确认以下信息：</span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">1、请您收到货物后及时打开检查商品，生鲜商品在被签收超过24小时后的异议，商城方将不予认可<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">；</span></span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">2、收件人姓名是否是您本人，订单号是否正确；</span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">3、<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">查看商品品牌、型号、数量等内容是否与您</span>下单时完全一致；</span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">4、如果您选择货到付款，订单上标明的费用是否与您在下单时核对的费用完全一致；</span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">5、<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">商品是否存在任何异常（例如变形、损坏、渗漏等）。</span></span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"font-size:14px;font-family:宋体, SimSun;\"><strong><span style=\"line-height:150%;color:#6B6B6B;font-size:14px;font-family:宋体;\">签收</span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"color:#6B6B6B;font-size:13px;font-family:宋体, SimSun;\">1、<span style=\"color:#6B6B6B;font-size:14px;\">如果您在签收后24小时未发现异常，即认可完整签收；</span></span> \r\n</p>\r\n<p style=\"margin-top:0;margin-bottom:0;line-height:29px;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">2、如果您在收货时就发现有异常，请第一时间保留拍照并与商城客服及时取得联系；</span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">3、叫他人代签收且无异议，商城均认定为本人签收且无异议。</span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">5、生鲜将安排在第一时间内配送，如果物流送到您所在小区物管中心</span><span style=\"font-size:14px;line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;\">、速递易、终点站并通知到您，但您疏忽未能及时领取而出现产品保管</span>\r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	&nbsp; &nbsp; &nbsp;<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">变质，商城将不予赔付。</span>\r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"line-height:150%;color:#6B6B6B;font-size:14px;font-family:宋体, SimSun;\">6、货物一经发出，如果<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">您中途需要</span>更换收货地<span style=\"line-height:150%;color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">址而产生的配送产品延送变质，您将承担责任。</span></span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-size:14px;font-family:宋体, SimSun;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">注意：</span></strong><span style=\"color:#6B6B6B;font-size:14px;font-family:宋体, SimSun;\">如您在快递员离开后才提出货物外包装或封带异常而要求退换货，土特土商城将无法为您处理，敬请谅解。除非您有证据证明问题的特殊性，此时请与土特土商城客服中心400-028-6255或028-84422716联系。</span></span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"font-size:14px;font-family:宋体, SimSun;\"><strong><span style=\"font-size:14px;line-height:150%;color:#6B6B6B;\">备注：</span></strong><span style=\"font-size:14px;line-height:150%;color:#6B6B6B;\"><span style=\"font-size:14px;\">请您确保订单中的收货</span>信息的准确性，以便商品及时、准确地发出，会员随时可到会员中心－“产品订单”查看订单更新情况，如果因为以上信息有误不能发货，我们会把订单审核为不合格，不合格订单将会放入“异常订单”区，会员可以根据反馈提示并修改后再次提交订单，但须承担自身原因可能产生的损失。</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '199', '2016-09-23 14:07:06', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:08:46', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/delivery/list-23/36.html', '0');
INSERT INTO `qm_info` VALUES ('37', '发票制度', null, '1', '0', '27', ',0,11,27', '', '<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<strong style=\"color:#6B6B6B;\">发票制度</strong> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">1、根据国家税务总局增值税发票管理规定，商业企业纳税人零售的烟、酒、食品、化妆品</span><span style=\"color:#6B6B6B;text-indent:-0.5em;letter-spacing:0.001cm;\">等消费品不得开具“增值税专用发票”。</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;\">2、土特土商城提供的发票现为“增值税普通发票”。</span><span style=\"color:#6B6B6B;letter-spacing:0.001cm;\">可提供给有需求的所有顾客，网上提交订单时可选择开具，也可以在订单成功后30日内</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;letter-spacing:0.001cm;\">&nbsp;&nbsp; 补</span><span style=\"color:#6B6B6B;letter-spacing:0.001cm;\">开，超过30日未说明需要发票的，将不能补开，视为自动放弃。</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;\">3、增值税普通发票开票货物为顾客所购买的相应货物。</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;\">4、系<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;letter-spacing:0.03779527544975281px;white-space:normal;\">统默认为订单不需要发票，如果您需要发票，可</span>以在提交订单的备注里说明，见下图：</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<img title=\"1474623356607953.jpg\" alt=\"15.jpg\" src=\"/pub/qm/p/image/20160923/1474623356607953.jpg\" width=\"872\" height=\"233\" /> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">5、订货时你需要发票，你需要在订单备注中注明：填写发票抬头</span><span style=\"color:#6B6B6B;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">（企业需提供详细开票资料）</span><span style=\"color:#6B6B6B;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">，（备注：字数限制在500个字内），你也可以</span></span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">&nbsp; &nbsp;注明：“需要发票，另补资料”，然后再及时与商城客服</span><span style=\"color:#0000FF;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">400-028-6255</span><span style=\"color:#6B6B6B;text-indent:-1em;letter-spacing:0.001cm;font-size:14px;\">办理补开发票。收货后超过30天未申请发票，将不能补开。</span></span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">6、如果备注</span><span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">信息不全或有异议，将不开具发票，请认真备注相关信息。发票将在订单完成后1周后采用邮局平邮或公司合约快递送达，如遇 &nbsp; &nbsp; &nbsp;月底订单，其</span><span style=\"color:#6B6B6B;letter-spacing:0.001cm;text-indent:-2em;\">发票可能会延迟下月开出。</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">7、当您的订单被拆分为多个包裹进行派送时，如果发票需要分别开具，需要清晰备注说明或及时联系客服，发票一经寄出后，如本身发票</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">&nbsp; &nbsp;内</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-1.5em;font-family:宋体, SimSun;\">容</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-1.5em;font-family:宋体, SimSun;\">无误，将不能重开。</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">8、使用优惠券、积分兑换的订单不能开票。</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">9、</span><span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">请您在收到发票时核对发票信息是否有误。如果收到的发票与您提供的开票信息、订单信息不一致，请您立即拨打土特土</span><span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">商</span><span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">城客服电话</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-2em;letter-spacing:0.001cm;\">&nbsp; &nbsp; &nbsp; 400</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-2em;\">&nbsp;-028-6255，经客服核实后我们会以最快的速度为您更换正确的发票。在换票过程中，您需要先将错误发票回寄至</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-2em;\">商城办</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-2em;\">公地址。感</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-2em;\">&nbsp; &nbsp; &nbsp;谢您的配合！</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">10、发生全退货时，商城将不开具发票。如果发生部分商品退货时，土特土商城会在收到您所退还的商品后为您开具实际购买商品对应金</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.5em;letter-spacing:0.001cm;font-family:宋体, SimSun;font-size:14px;\">&nbsp; &nbsp;额</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-1.5em;font-family:宋体, SimSun;\">的</span><span style=\"letter-spacing:0.001cm;color:#6B6B6B;text-indent:-1.5em;font-family:宋体, SimSun;\">发票。</span>\r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">11、如果会员特别指定需要其它快递寄送发票，发票邮寄的费用需由本人承担。</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">12、您在致电土特土商城客服要求补开发票的同时，请配合客服人员提供以下信息：</span> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<strong style=\"color:#C00000;letter-spacing:0.001cm;font-family:宋体, SimSun;\">&nbsp; &nbsp;<span>订单号、订单日期、发票抬头、发票内容、单价、数量、金额、姓名、电话、邮寄地址及邮编</span></strong> \r\n</p>\r\n<p style=\"letter-spacing:0.001cm;font-family:宋体;font-size:14px;white-space:normal;word-wrap:break-word;\">\r\n	<span style=\"color:#6B6B6B;text-indent:-1.96em;letter-spacing:0.001cm;font-family:宋体, SimSun;\">13、如还有其他问题，请联系商城客服或致电400-028-6255、028-84422716，土特土商城客服人员将竭诚为您服务。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '194', '2016-09-23 14:41:14', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:41:24', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/pay/list-27/37.html', '0');
INSERT INTO `qm_info` VALUES ('38', '支付遇到问题', null, '1', '0', '26', ',0,11,26', '', '<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">1、下单后等待付款的时间是多久？</span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">如果在</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">72</span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">小时内未收到您的款项，系统将自动取消订单。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">2、可以一起补开多笔订单的发票吗？</span></strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">注</span>\r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\"></span></strong><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">可以。在规定的时间范围内，需要补开发票时，请致电</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">400-028-625<span style=\"font-family:宋体;\">或后台</span></span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">联系客服人员核实需要补开发票的订单。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">3、购物结算时可以部分银行卡付款、部分货到付款吗？</span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">不可以两种付款方式结合付款。货到付款需要商品有注明支持到付。</span></span>\r\n</p>\r\n<p style=\"line-height:22px;text-indent:14px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">4、开具发票需要另收费吗？</span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\"></span></strong><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">开具发票不会另外收取费用。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;text-indent:14px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\">5<span style=\"font-family:宋体;\">、</span><span style=\"font-family:宋体;\">优惠券是否必需购买商城其它商品后才能使用？</span></span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\"></span></span></strong><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">不需要。优惠券可以直接兑换商品使用。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;text-indent:7px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">6</span></strong><strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">、为什么支付不成功？</span></span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">如果您对购买的商品使用在线付款不成功时，请确认是否存在如下问题：</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">（</span>1<span style=\"font-family:宋体;\">）请核实确认您的银行卡是否已开通网上支付功能？</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">（</span>2<span style=\"font-family:宋体;\">）您输入的账号或密码是否正确？</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">（</span>3<span style=\"font-family:宋体;\">）您的支付宝</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">/<span style=\"font-family:宋体;\">微信</span></span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">余额是否已小于订单应支付金额？</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">如果出现卡内余额不足、意外断线等导致支付不成功，请您登录</span>“</span><span style=\"color:#0070C0;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;font-size:14px;\">会员中心</span>——<span style=\"font-family:宋体;font-size:14px;\">我的订单</span></span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">”<span style=\"font-family:宋体;\">找到该订单，重新完成支付。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">订单生成后，商城向客户提供了</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">72</span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">小时的有效支付时限，您可以在</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">72</span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">小时内完成支付。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">7</span></strong><strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">、付款时提示</span>“<span style=\"font-family:宋体;\">支付时间不在许可范围内</span><span style=\"font-family:Arial;\">”</span><span style=\"font-family:宋体;\">？</span></span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">每一家银行都有一个结算的时间，在这个时间段内，是不能进行网上交易的，如果您的交易付款时间正好在这个时间里面，那么很抱歉，则会在银行支付页面显示</span>“<span style=\"font-family:宋体;\">支付时间不在许可范围内</span><span style=\"font-family:Arial;\">”</span><span style=\"font-family:宋体;\">，稍后您可登录</span><span style=\"font-family:Arial;\">“</span></span><a style=\"text-decoration:none;\"><span style=\"color:#0070C0;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">会员中心</span>—<span style=\"font-family:宋体;\">我的订单</span></span></a><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">”<span style=\"font-family:宋体;\">找到该订单，重新完成支付或选择另外的支付方式。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">8</span></strong><strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">、付款时提示</span>“<span style=\"font-family:宋体;\">此订单金额超过商户所允许支付的金额范围</span><span style=\"font-family:Arial;\">”</span><span style=\"font-family:宋体;\">？</span></span></strong><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><br />\r\n</span><span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">每家银行对网上支付都有一定的限额，具体情况请联系自己银行确认您的网上支付额度。</span></span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<a></a><strong><span style=\"color:#565656;font-family:宋体;font-size:14px;\">9</span></strong><strong><span style=\"color:#565656;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">、如果您在使用支付过程中有出现错误提示？</span></span></strong> \r\n</p>\r\n<p style=\"line-height:22px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:14px;\"><span style=\"font-family:宋体;\">建议您及时联系该支付渠道的客服请求解决方案。</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '209', '2016-09-23 14:50:00', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:50:14', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/pay/list-26/38.html', '0');
INSERT INTO `qm_info` VALUES ('39', '隐私条款', null, '1', '0', '31', ',0,12,31', '', '<p><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">尊重用户个人隐私是土特土商城</span><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px; text-decoration: none;\">（</span><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px; text-decoration: none;\"><a href=\"http://www.tutetoo.com）的一项基本政策。所以土特土商城（www.tutetoo.com）一定不会在未经合法用户授权时公\" style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px; text-decoration: none;\">www.tutetoo.com）的一项基本政策。所以商城一定不会在未经合法用户授权时公</a></span><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">开或透露其注册资料</span><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">及保存</span></p><p><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">在商城中的非公开内容，除非有法律许可要求。</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\"><span style=\"font-family: 宋体, SimSun; color: rgb(107, 107, 107);\">土特土商城（</span>www.tutetoo.com）要</span><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">求您同样遵循以下内容是必不可分的：</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-size: 14px; font-family: 宋体, SimSun;\">(1) 公共场所上网后，退出时应选择“安全退出”。</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">(2) 遵守有关法律规定，遵从土特土商城（www.tutetoo.com）合法服务程序。</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">(3) 保持维护土特土商城（www.tutetoo.com）的商标所有权。</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">(4) 在紧急情况下竭力维护用户个人和社会大众的隐私安全。</span></p><p style=\"line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">(5) 符合其他相关的要求。</span></p><p style=\"margin-left: 0;line-height: 25px\"><span style=\"color: rgb(107, 107, 107); font-family: 宋体, SimSun; font-size: 14px;\">备注：我们的用户隐私制度将不断改进，随着本网站服务范围的扩大，我们会随时更新我们的隐私声明。</span></p><p><br/></p>', '', '', '', '1', '200', '2016-09-23 14:54:31', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:54:56', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/aftermarket/list-31/39.html', '0');
INSERT INTO `qm_info` VALUES ('40', '在线支付', null, '1', '0', '24', ',0,11,24', '', '<p>\r\n	<span style=\"font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">1、第三方支付平台</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;margin-top:5px;\">\r\n	<span style=\"font-size:14px;\"><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">土特土商城目前为您提供支付宝、微信支付2种平台支付方式，您可以根据需要选择不同的支付平台进行支付。</span></span><span style=\"font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"><img title=\"1474731681132774.png\" alt=\"X0[0)E2QATEY@6M6W4R_C64.png\" src=\"/pub/qm/p/image/20160924/1474731681132774.png\" /></span></strong></span><span style=\"font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;\">2</span></strong><strong><span style=\"color:#6B6B6B;font-family:宋体;\">、&nbsp;支付金额上限</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">目前各银行对于网上支</span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">付均有一定金额的限制，由于各银行政策不同，建议您在申请开通网上支付功能时向银行咨询相关事宜。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">3</span></strong><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">、&nbsp;到款时间</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">网上支付均是支付成功即到账。若由于网络故障导致您已收到扣款信息但对应的订单状态并未更新至”待发货“状态，为了避免给您带来不便，您无需再次支付，请您立刻与联系我们的客服人员联系解决。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">客服热线：<strong>400-028-6255、028-84422716</strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">E-Mail：<strong>scgoldagri@126.com</strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">温馨提示</span></strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">：您选择在线支付方式，提交订单成功后72小时内系统为您保留订购商品的库存，请您尽快完成支付。超时未付款订单将会自动关闭，商品可供被他人选购，因此无法保证您再次下单时有现货，敬请您谅解</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">。</span>\r\n</p>', '', '', '', '1', '370', '2016-09-23 14:55:36', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 14:58:38', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/pay/list-24/40.html', '0');
INSERT INTO `qm_info` VALUES ('41', '公司转账', null, '1', '0', '25', ',0,11,25', '', '<p>\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">公司转帐</span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">土特土商城目前暂不支持线上公司间转账，公司转账请选择线下转账，在转账过程中有任何不清楚地方，请与客服联系或咨询400-028-6255、028-84422716</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:宋体, SimSun;\"><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">汇</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">款如下</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">：</span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:宋体, SimSun;\"><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">单位</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">：四川金硕阳光生态农业有限公司</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\"></span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:宋体, SimSun;\"><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">账户：</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">平安银行成都锦江支行</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\"></span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:宋体, SimSun;\"><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;\">开户行：</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;font-size:16px;\">11014808703005</span></strong><strong style=\"line-height:21px;text-indent:32px;font-family:宋体, SimSun;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#6B6B6B;font-size:16px;\"></span></strong></span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '186', '2016-09-23 15:00:03', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 15:00:13', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/pay/list-25/41.html', '0');
INSERT INTO `qm_info` VALUES ('42', '积分政策', null, '1', '0', '20', ',0,8,20', '', '<p>\r\n	积分政策\r\n</p>\r\n<p>\r\n	1、积分来源\r\n</p>\r\n<p>\r\n	<img style=\"width:449px;height:110px;\" alt=\"\" src=\"/pub/qm/p/image/161121/230907_515.png\" width=\"463\" height=\"114\" /> \r\n</p>\r\n<p>\r\n	备注：积分兑换商品需要会员到积分商城去人工兑换。\r\n</p>\r\n<p>\r\n	（1）在商城购买商品、分享网站内容后均可获得积分；\r\n</p>\r\n<p>\r\n	（2）优惠券，将不计入积分赠送；\r\n</p>\r\n<p>\r\n	（3）不同账户的积分不能合并；\r\n</p>\r\n<p>\r\n	（4）若订单发生退货，已赠送的消费积分将从您的账户中扣除；\r\n</p>\r\n<p>\r\n	2、积分的使用\r\n</p>\r\n<p>\r\n	&nbsp; 用户积分达到一定数量后，可以到积分商城兑换相应喜爱商品。兑换成功后，系统将扣除相应积分。扣除积分，不会影响会员等级。\r\n</p>\r\n<p>\r\n	3、积分有效期\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;积分可以连续累加，不会每年归零。\r\n</p>\r\n<p>\r\n	4、积分查询\r\n</p>\r\n<p>\r\n	&nbsp; 您可登录土特土商城“会员中心&nbsp;——我的积分“，查询积分情况。\r\n</p>\r\n<p>\r\n	5、积分可以兑换现金或者提现吗？\r\n</p>\r\n<p>\r\n	&nbsp; 土特土商城积分不可兑换现金、不能提现。&nbsp;\r\n</p>\r\n<p>\r\n	6、积分兑换商品是否能开具发票？\r\n</p>\r\n<p>\r\n	&nbsp; 使用积分兑换的商品，属于商城对您的回馈行为而非交易，不能提供发票。&nbsp;\r\n</p>\r\n<p>\r\n	7、积分兑换的商品运费如何支付？\r\n</p>\r\n<p>\r\n	&nbsp; 详见商品兑换运费要求。\r\n</p>', '', '', '', '1', '205', '2016-09-23 15:01:55', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 15:02:13', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/guide/g20/42.html', '0');
INSERT INTO `qm_info` VALUES ('44', '进度查询', null, '1', '0', '22', ',0,10,22', '', '<p style=\"line-height:32px;\">\r\n	<strong><span style=\"font-family:Arial;color:#6B6B6B;font-size:14px;\"><span style=\"font-family:宋体;\">进度查询</span></span></strong> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<span style=\"font-family:宋体;line-height:150%;color:#666666;font-size:14px;\"><span style=\"font-family:宋体;\">在等待收货过程中，您可以在网站查询订单状态，了解订单处理及商品配送进度。</span></span> \r\n</p>\r\n<p style=\"line-height:150%;\">\r\n	<strong><span style=\"font-family:宋体;line-height:150%;color:#C00000;font-size:14px;\"><span style=\"font-family:宋体;\">第一步：</span></span></strong><span style=\"font-family:宋体;line-height:150%;color:#666666;font-size:14px;\">&nbsp;进入“会员中心”</span> \r\n</p>\r\n<p style=\"margin-bottom:16px;line-height:20px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:150%;color:#C00000;font-size:14px;\">第二步：</span></strong><span style=\"font-family:宋体;line-height:150%;color:#C00000;font-size:14px;\">&nbsp;</span><span style=\"font-family:宋体;line-height:150%;color:#666666;font-size:14px;\">在“会员中心”中点击“产品订单”查看“订单详情”，即出现订单全部信息。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<img src=\"/pub/qm/p/image/20160923/1474622480587039.jpg\" title=\"1474622480587039.jpg\" alt=\"未标题-14.jpg\" /><span style=\"font-family:微软雅黑;color:#666666;font-size:12px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:Calibri;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '219', '2016-09-23 15:15:27', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 15:17:01', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/delivery/list-22/44.html', '0');
INSERT INTO `qm_info` VALUES ('45', '取消订单', null, '1', '0', '29', ',0,12,29', '', '<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;\">取消订单</span></strong></span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"text-indent:16px;font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;\">土特土商城为您提供自助取消订单服务，您可进入“</span><span style=\"color:#00B0F0;text-indent:16px;font-family:宋体, SimSun;font-size:14px;\">会员中心—我的订单</span><span style=\"color:#6B6B6B;\">”或者直接进入“我的订单”针对问题订单自助操作取消</span></span><span style=\"color:#6B6B6B;text-indent:16px;font-family:微软雅黑;\">。</span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:微软雅黑;font-size:16px;\">&nbsp;<img title=\"1474623792129818.jpg\" alt=\"17.jpg\" src=\"/pub/qm/p/image/20160923/1474623792129818.jpg\" /></span> \r\n</p>\r\n<p style=\"line-height:20px;margin-left:24px;\">\r\n	<strong><span style=\"color:#333333;font-family:Arial;font-size:13px;\">&nbsp; &nbsp;</span></strong> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">温馨提示：</span></strong></span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">1、&nbsp;&nbsp;取消订单成功后，优惠劵兑换的商品优惠券编号仍能使用，积分兑换的商品积分将自动返还到您的账户中；</span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;font-family:宋体, SimSun;\">2、&nbsp;&nbsp;已发货的产品不能取消订单，已付款未发货的状态下可以联系土特土商</span><span style=\"color:#6B6B6B;text-indent:32px;font-family:宋体, SimSun;\">城客服或致电400-028-6255、028-84422716进行及时更改</span></span><span style=\"color:#6B6B6B;text-indent:32px;font-family:微软雅黑;font-size:14px;\">。</span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:Arial;font-size:13px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:Calibri;font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '199', '2016-09-23 15:18:25', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 15:19:11', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/aftermarket/list-29/45.html', '0');
INSERT INTO `qm_info` VALUES ('46', '退款说明', null, '1', '0', '30', ',0,12,30', '', '<p>\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">退货订单退款</span></strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">&nbsp;&nbsp; </span></strong></span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">若您办理了订单退货，退货商品在入库后，我们会根据您原订单的支付方式来判断退款的方式。</span>\r\n</p>\r\n<p style=\"line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">1</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:16px;\">、<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">非货到付款支付：&nbsp;退款将原渠道退回。</span></span>\r\n</p>\r\n<p style=\"line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">2、</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">货到付款支付：请在申请退货时，务必向客服人员提供准确的银行账户信息，我们会将您已支付的款项退至指定的银行卡内。银行账</span>\r\n</p>\r\n<p style=\"line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">&nbsp; &nbsp;户</span><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">信息包括持卡人姓名，借记卡卡号，开户银行全称（及所属支行如有），请确认该银行账户处于活跃状态。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">拒收订单退款</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">若您对收到的商品不满意（生鲜除外）直接进行了拒收，那么在货物返回后，我们会将您支付的款项按原渠道退回。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">退款办理时效</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">退款审核通过后的退款方式及退款周期：</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<img title=\"1474615225886712.png\" alt=\"图片1.png\" src=\"/pub/qm/p/image/20160923/1474615225886712.png\" width=\"716\" height=\"189\" /><span style=\"color:#6B6B6B;font-family:Arial;font-size:13px;\">&nbsp;</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:微软雅黑;font-size:14px;\">注意：</span></strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">退款单处理周期仅供参考，具体退款到账时间可能会受银行、支付机构、业务高峰等相关因素影响，敬请谅解。</span></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">退款进度查询</span></strong></span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">&nbsp;&nbsp;&nbsp;您可登录“会员中心—我的订单—订单详情”查询订单的退款进度。</span>\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">声明</span></strong></span><span style=\"font-family:宋体, SimSun;font-size:14px;\"><span style=\"color:#6B6B6B;font-family:微软雅黑;font-size:14px;\">：<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">土特土商城保<span style=\"color:#6B6B6B;font-size:14px;\">留对</span>以上规则的最终解释权。如有任何疑问您可以咨询客服或致电400－028-6255、028-84422716</span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:Calibri;font-size:14px;\">&nbsp;</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '1', '194', '2016-09-23 15:20:05', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 15:20:30', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/aftermarket/list-30/46.html', '0');
INSERT INTO `qm_info` VALUES ('47', '售后政策', null, '1', '0', '28', ',0,12,28', '', '<p style=\"text-align:justify;\" align=\"center\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\"></span></strong></span>&nbsp;<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">售后客服时间：</span></strong></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">土特土商城售后客服受理时间为：8：30（早）— 18：00（下午），特殊节气或假日会稍作调整。用户可以选择任何时间留言，工作人员会第一时间与您取得联系。</span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:宋体, SimSun;font-size:14px;\"><strong><span style=\"color:#6B6B6B;font-size:14px;\">退换货总则：</span></strong></span> \r\n</p>\r\n<p style=\"text-align:justify;line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\">顾客自商品实际收货日期为准起7日内可以申请退货（生鲜除外），10日内可以换货<span style=\"color:#6B6B6B;font-family:宋体;\">（生鲜除外）</span>。消费者可到商城线上或电话联系商城客服申请办理退换货事宜。</span> \r\n</p>\r\n<p style=\"text-align:justify;line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体, SimSun;font-size:14px;\"><img title=\"1474707460697114.png\" alt=\"F60B4317-F3C5-4BDE-B019-96FAF1D33A32.png\" src=\"/pub/qm/p/image/20160924/1474707460697114.png\" /></span> \r\n</p>\r\n<p style=\"text-align:justify;line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;line-height:20px;font-family:Arial, sans-serif;font-size:14px;\">1.<span style=\"line-height: normal; font-family: ;\" 9px;?=\"\" roman?;=\"\" new=\"\" times=\"\">&nbsp;&nbsp;</span></span><span style=\"color:#6B6B6B;line-height:20px;font-family:宋体;font-size:14px;\">判断实际收货日期规则：按照第三方物流平台显示或客户签收单日期为准。</span>\r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">2.<span style=\"line-height: normal; font-family: ;\" 9px;?=\"\" roman?;=\"\" new=\"\" times=\"\">&nbsp;&nbsp;</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">在商品无任何问题情况下，商城承诺：自您实际收到商品之日起</span><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">7</span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">日内（生鲜除外），在商品返回运费由您承担的情况下，可享受无理由</span></span>\r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">&nbsp; &nbsp; &nbsp;退货。土特土商</span></span><span 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">城</span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">以下商品不适用于</span><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">7</span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">天无理由退货：</span>\r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">&nbsp; &nbsp; &nbsp; 1）</span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">禽肉蛋品类商品；</span><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">&nbsp;</span></span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">&nbsp; &nbsp; &nbsp; 2）</span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">鲜活易腐类商品；</span></span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">3.<span style=\"line-height: normal; font-family: ;\" 9px;?=\"\" roman?;=\"\" new=\"\" times=\"\">&nbsp; </span></span><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">特别说明，以下情况不予办理退换货：</span></span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">1）任何非土特土商城出售的商品；</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">2）未经授权的碰撞或撕毁、涂改标贴、机器序号、防伪标记、吊牌；</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"> 3）包装含防伪码的商品防伪码一经刮开不予退换货；</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"> 4）赠品出现质量问题，可以进行换货或按赠品成本价值补款；</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"> 5）商品图片仅供参照，一切以实物为准。因拍摄灯光及不同显示器等问题造成的色差但不属于质量问题；</span> \r\n</p>\r\n<p style=\"text-align:left;line-height:20px;margin-left:24px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\"> 6）其他依法不应办理退换货的。</span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">4. &nbsp;凡在土特土商城购买的生鲜类商品，如果质量有问题请自签收之时起24小时内必须与商城客服联系，并提供相关图片证明属实，商城方可 </span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">&nbsp; &nbsp; &nbsp;以重新</span><span style=\"font-family: 微软雅黑,;\" microsoft=\"\" yahei?;?=\"\"><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">补发货或退款。生鲜签收后超过24小时再反馈，商城将不予受理。</span></span> \r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><strong><span style=\"color:#595959;font-family:宋体;font-size:14px;\"></span></strong></span>&nbsp;\r\n</p>\r\n<p style=\"line-height:20px;\">\r\n	<span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><strong><span style=\"color:#595959;font-family:宋体;font-size:14px;\">温馨提示</span></strong><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">：详情请联系土特土客服或致电400-028-62</span></span><span style=\"color:#6B6B6B;font-family:Arial, sans-serif;font-size:14px;\">55、</span><span style=\"font-family: 微软雅黑,;\" 14px;?=\"\" yahei?;=\"\" microsoft=\"\"><span style=\"color:#6B6B6B;font-family:宋体;font-size:14px;\">028-84422716</span></span> \r\n</p>', '', '', '', '1', '297', '2016-09-23 16:24:52', '', null, '', null, '', null, '', '0', '1', '0', '2016-09-23 16:42:13', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/aftermarket/list-28/47.html', '0');
INSERT INTO `qm_info` VALUES ('48', '食品', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '1', '1', '2016-10-21 09:41:10', '/pub/qm/p/image/160911/112836_179.png', null, '/product/snack-foods/', null, '', null, '', '0', '1', '0', '2016-10-21 09:42:03', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/48.html', '0');
INSERT INTO `qm_info` VALUES ('49', '工艺', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '2', '1', '2016-10-21 09:42:51', '/pub/qm/p/image/160911/112853_606.png', null, '/product/dry/', null, '', null, '', '0', '1', '0', '2016-10-21 09:43:31', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/49.html', '0');
INSERT INTO `qm_info` VALUES ('50', '鲜果', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '3', '1', '2016-10-21 09:43:33', '/pub/qm/p/image/160911/112923_704.png', null, '/product/vegetablefruit/', null, '', null, '', '0', '1', '0', '2016-10-21 09:44:03', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/50.html', '0');
INSERT INTO `qm_info` VALUES ('51', '优选', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '4', '1', '2016-10-21 09:44:05', '/m/img/11.jpg', null, '/active/', null, '', null, '', '0', '1', '0', '2016-10-21 09:44:44', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/51.html', '0');
INSERT INTO `qm_info` VALUES ('52', '土特产', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '5', '1', '2016-10-21 09:44:45', '/pub/qm/p/image/160911/112836_179.png', null, '/product/brewing/', null, '', null, '', '0', '1', '0', '2016-10-21 09:45:50', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/52.html', '0');
INSERT INTO `qm_info` VALUES ('53', '坚果', null, '1', '0', '98', ',0,13,98', '', '', null, null, null, '6', '1', '2016-10-21 09:45:52', '/pub/qm/p/image/160911/112853_606.png', null, '/product/brewing/', null, '', null, '', '0', '1', '0', '2016-10-21 09:46:29', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-98/53.html', '0');
INSERT INTO `qm_info` VALUES ('54', '网站测试中', null, '1', '0', '32', ',0,32', '', '网站目前正在最后测试阶段。', '', '', '', '1', '75', '2016-12-01 15:16:48', '', null, '', null, '', null, '', '0', '1', '0', '2016-12-12 15:18:46', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/notice/54.html', '0');
INSERT INTO `qm_info` VALUES ('55', '126邮箱', null, '1', '0', '16', ',0,13,16', '', '', null, null, null, '1', '1', '2016-12-12 15:54:36', '', null, 'www.126.com', null, '', null, '', '0', '1', '0', '2016-12-12 15:55:45', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/link/55.html', '0');
INSERT INTO `qm_info` VALUES ('56', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('57', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('58', '绿壳土鸡蛋快速装', null, '1', '0', '167', ',0,1,33,40,167', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('59', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '68', ',0,1,33,40,68', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('60', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('61', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('62', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('63', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('64', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('65', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('66', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('67', '绿壳土鸡蛋快速装', null, '1', '0', '167', ',0,1,33,40,167', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('68', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '68', ',0,1,33,40,68', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('69', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('70', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('71', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('72', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('73', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('74', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('75', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('76', '绿壳土鸡蛋快速装', null, '1', '0', '167', ',0,1,33,40,167', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('77', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '68', ',0,1,33,40,68', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('78', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('79', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('80', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('81', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('82', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('83', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('84', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('85', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('86', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('87', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('88', '绿壳土鸡蛋快速装', null, '1', '0', '167', ',0,1,33,40,167', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('89', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '68', ',0,1,33,40,68', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('90', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('91', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('92', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('93', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('94', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('95', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('96', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('97', '绿壳土鸡蛋快速装', null, '1', '0', '165', ',0,1,35,165', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('98', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '165', ',0,1,35,165', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('99', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('100', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('101', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('102', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '46', ',0,1,34,46', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('103', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('104', '剑门黑花生', null, '1', '0', '36', ',0,1,36', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('105', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('106', '绿壳土鸡蛋快速装', null, '1', '0', '165', ',0,1,35,165', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('107', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '165', ',0,1,35,165', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('108', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('109', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('110', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('111', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '37', ',0,1,37', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('112', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('113', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('114', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('115', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('116', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('117', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('118', '绿壳土鸡蛋快速装', null, '1', '0', '165', ',0,1,35,165', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('119', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '165', ',0,1,35,165', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('120', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('121', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('122', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('123', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '37', ',0,1,37', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('124', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('125', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('126', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('127', '绿壳土鸡蛋快速装', null, '1', '0', '165', ',0,1,35,165', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('128', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '165', ',0,1,35,165', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('129', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('130', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('131', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('132', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '37', ',0,1,37', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('133', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('134', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('135', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');
INSERT INTO `qm_info` VALUES ('136', '绿壳土鸡蛋快速装', null, '1', '0', '165', ',0,1,35,165', '', '<img src=\"/pub/qm/p/image/161222/235233_399.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235550_494.jpg\" alt=\"\" />\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235614_299.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/235453_341.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/pub/qm/p/image/161222/235949_828.jpg\" alt=\"\" />\r\n</p>', '', '', '', '1', '535', '2016-06-20 18:15:03', '/pub/qm/p/image/160719/230813_595.jpg', '', '', null, '', '0', 'z,f,x,j,d', '0', '1', '0', '2016-06-20 18:15:52', '生态放养绿壳土鸡蛋、不吃饲料的鸡蛋、天然富硒', '2100023', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/160719/230813_595.jpg,/pub/qm/p/image/161222/235157_164.jpg', '', '成都仓库或苍溪', '', 'admin', '本站', '128.00', '108.00', '15', '24', '1', '174', '0', '3', '2', '1000', '650698', '', '', '#', '', '8,22,32,42,15,12,12,12,12,12,12,12,12,12,12,22,32,18,12,12,12,12,12,12,12,12,12,12,12,12,12', '0', '/freshfood/meat/list-167/1.html', '0');
INSERT INTO `qm_info` VALUES ('137', '富硒绿壳土鸡蛋礼盒（限成都主城区）', null, '1', '0', '165', ',0,1,35,165', '', '<p>\r\n	<img src=\"/pub/qm/p/image/161222/221247_407.jpg\" alt=\"\" width=\"480\" height=\"360\" title=\"\" align=\"\" /><img src=\"/pub/qm/p/image/161222/221924_767.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/224128_908.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231512_242.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/225448_569.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231551_893.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160719/231431_436.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/161222/230248_297.jpg\" alt=\"\" /> \r\n</p>', '', '', '', '1', '721', '2016-07-19 22:25:43', '/pub/qm/p/image/161222/232345_961.jpg', '', '', null, '', '0', 'r,z,x,j,d', '0', '1', '0', '2016-06-20 19:37:14', '秦巴山生态放养绿壳土鸡蛋，农场时实监控、不喂养饲料厂料、安全放心', '2001', '秦巴臻品', '广元苍溪县', '/pub/qm/p/image/161222/230725_675.jpg,/pub/qm/p/image/161222/231448_321.jpg,/pub/qm/p/image/161222/233717_758.jpg', '', '成都仓库或苍溪', '/pub/qm/p/image/161222/232136_271.jpg', 'admin', '本站', '150.00', '128.00', '15', '150', '1', '38', '0', '3', '2', '10000', '650698', '包装,品质,净重,规格,颜色', '盒装、不适合发快递,鲜蛋,1700g,40枚,绿色、灰色', '', '', '8,12,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,35,35,25', '0', '/freshfood/meat/list-68/2.html', '0');
INSERT INTO `qm_info` VALUES ('138', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '3', '67', '2016-06-21 13:50:38', '/pub/qm/p/image/160922/171514_975.jpg', '', 'http://www.tutetoo.com/product/huacai/26.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:10', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/17.html', '0');
INSERT INTO `qm_info` VALUES ('139', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '2', '73', '2016-06-21 13:51:11', '/pub/qm/p/image/160922/171312_956.jpg', '', 'http://www.tutetoo.com/product/huacai/24.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:23', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/18.html', '0');
INSERT INTO `qm_info` VALUES ('140', '高逼格家宴葡萄酒', null, '1', '0', '86', ',0,13,86', '', '', null, null, null, '1', '110', '2016-06-21 13:51:25', '/pub/qm/p/image/160922/171234_505.jpg', '', 'http://www.tutetoo.com/freshfood/meat/list-67/2.html', null, '', '0', '', '0', '1', '0', '2016-06-21 13:51:33', '', '', '', '', '', '', '', '', 'admin', '本站', null, null, null, null, '0', '0', '0', '1', '0', '0', '0', '', '', '', '', '', '0', '/other/list-86/19.html', '0');
INSERT INTO `qm_info` VALUES ('141', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '37', ',0,1,37', '', '<p><img src=\"/pub/qm/php/../p/image/160826/120652_556.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_438.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_370.jpg\" alt=\"\"/><img src=\"/pub/qm/php/../p/image/160826/120652_680.jpg\" alt=\"\"/></p>', '', '', '', '1', '543', '2016-08-26 10:08:53', '/pub/qm/p/image/160824/104210_655.jpg', null, '', null, '', null, 'y,r,c,x,j,d', '1', '1', '0', '2016-08-26 12:07:05', '中国红心猕猴桃之乡——苍溪红心猕猴桃 自家果园 现摘现发 汁多味甜 当地政府为了保持品质统一发货时间为9月中旬 现在预售中', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg,/pub/qm/p/image/160826/121727_728.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160829/173323_598.jpg', 'admin', '本站', '208.00', '168.00', '15', '0', '0', '0', '0', '8', '0', '1000', '650698', '包装规格,同城服务,净含量', '30枚,同城24小时物流送货上门,2400g', '650698#650699,659022,661421,665565,668542', '', '0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15', '0', '/product/huacai/24.html', '0');
INSERT INTO `qm_info` VALUES ('142', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', null, '1', '0', '4', ',0,4', '', '<img src=\"/pub/qm/p/image/160826/120652_556.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_438.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_370.jpg\" alt=\"\" /><img src=\"/pub/qm/p/image/160826/120652_680.jpg\" alt=\"\" />', '', '', '', '1', '117', '2016-08-30 13:41:40', '/pub/qm/p/image/160830/134502_544.jpg', null, '', null, '', null, 'y,r,c,x', '1', '1', '0', '2016-08-30 13:48:24', '苍溪红心猕猴桃礼盒装   五斤装', '6970480780027', '金硕阳光', '四川广元苍溪', '/pub/qm/p/image/160826/121717_403.jpg', '', '成都市成华区建材路', '/pub/qm/p/image/160830/134537_425.jpg', 'admin', '本站', '208.00', '168.00', '15', '50', '1', '0', '0', '2', '0', '1000', '650698', '产品规格,净含量,同城服务,包装', '30枚,2700g,同城24小时物流送货上门,手提礼盒', '', '', '', '0', '/gift/27.html', '0');
INSERT INTO `qm_info` VALUES ('143', '剑门黑花生', null, '1', '0', '53', ',0,1,37,53', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;\">  剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”，能够提高人体的免疫能力，同时通过抑制癌细胞的代谢、抑制癌细胞生长进而起到防癌抗癌的作用。研究发现，虽然不同品种的黑花生中硒含量差别较大，但最少的也含有15mg以上（每百克黑花生），含量高的品种含硒量可以高达37mg（每百克黑花生）。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg，而钠含量则微乎其微，两者比例基本超过500：1。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。</span><span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;font-family:SimSun;font-size:18px;\"><img src=\"/pub/qm/p/image/161229/211004_606.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '4', '272', '2016-12-29 22:49:20', '/pub/qm/p/image/161229/210949_853.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 22:55:08', '美味自然，纯真品味', '101', '剑门黑花生', '广元剑阁', '/pub/qm/p/image/161229/210922_775.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211004_606.jpg', '', '广元', '/pub/qm/p/image/161229/211439_288.jpg', 'admin', '本站', '85.00', '85.00', '15', '100', '0', '0', '0', '7', '0', '0', '650698', ',', ',', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/snack-foods/56.html', '0');
INSERT INTO `qm_info` VALUES ('144', '通江段木贡品银耳', null, '1', '0', '38', ',0,1,38', '', '<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><span style=\"color:#009900;\"> </span> <span style=\"color:#009900;\">四川达州通江段木贡品银耳</span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\">  <span style=\"color:#009900;\">银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘<span style=\"background-color:;\"><span style=\"color:#009900;\"></span></span>。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品！</span></span><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;font-family:SimSun;\"></span><span style=\"font-size:18px;font-family:SimSun;\"></span></span> \r\n</p>\r\n<p style=\"text-align:justify;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:SimSun;\"><img src=\"/pub/qm/p/image/161229/232240_945.png\" alt=\"\" /><br />\r\n</span> \r\n</p>', '', '', '', '1', '250', '2016-12-29 22:57:53', '/pub/qm/p/image/161229/230630_400.jpg', null, '', null, '', null, '', '0', '1', '0', '2016-12-29 23:07:00', '', '102', '通江段木贡品', '四川通江', '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/220631_813.jpg,/pub/qm/p/image/161229/220712_169.jpg,/pub/qm/p/image/161229/220835_761.jpg', '', '成都', '/pub/qm/p/image/161229/220613_280.png', 'admin', '本站', '168.00', '126.00', '15', '0', '0', '0', '0', '2', '0', '1', '650698', '', '', '716798#716799,717141,718610,719300,721282,722694,722882', '', '', '0', '/product/oils/57.html', '0');

-- ----------------------------
-- Table structure for `qm_integral`
-- ----------------------------
DROP TABLE IF EXISTS `qm_integral`;
CREATE TABLE `qm_integral` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `uid` bigint(12) DEFAULT '0',
  `cid` bigint(12) DEFAULT '0',
  `orderid` varchar(100) DEFAULT '' COMMENT '订单编号',
  `type` smallint(2) DEFAULT '1' COMMENT '积分类型 1表示订单获取积分 2表示积分兑换消耗积分',
  `s1` int(7) DEFAULT '0' COMMENT '积分值',
  `audit` smallint(1) DEFAULT '0' COMMENT '是否生效',
  `attr` varchar(200) DEFAULT '' COMMENT '积分产生的说明',
  `addtime` bigint(11) DEFAULT '0' COMMENT '积分时间时间',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_integral
-- ----------------------------
INSERT INTO `qm_integral` VALUES ('1', '1', '0', '1-107319', '1', '0', '1', '订单[1-107319]获取积分', '1467970557', '1');
INSERT INTO `qm_integral` VALUES ('2', '1', '0', '1-107733', '1', '0', '1', '订单[1-107733]获取积分', '1467970892', '1');
INSERT INTO `qm_integral` VALUES ('3', '1', '0', '1-107923', '1', '2', '1', '订单[1-107923]获取积分', '1467971063', '1');
INSERT INTO `qm_integral` VALUES ('4', '1', '0', '1-1719812', '1', '9', '1', '订单[1-1719812]获取积分', '1469583153', '0');
INSERT INTO `qm_integral` VALUES ('5', '1', '0', '1-2175001', '1', '9', '1', '订单[1-2175001]获取积分', '1470038225', '0');
INSERT INTO `qm_integral` VALUES ('6', '9', '0', '9-4658719', '1', '12', '1', '订单[9-4658719]获取积分', '1472522005', '0');
INSERT INTO `qm_integral` VALUES ('7', '1', '0', '1-5982447', '2', '3', '1', '订单[1-5982447]花费积分', '1473845560', '0');
INSERT INTO `qm_integral` VALUES ('8', '1', '0', '1-5987530', '2', '3', '1', '订单[1-5987530]花费积分', '1473850643', '0');
INSERT INTO `qm_integral` VALUES ('9', '1', '0', '1-6472809', '2', '3', '1', '订单[1-6472809]花费积分', '1474335922', '0');
INSERT INTO `qm_integral` VALUES ('10', '17', '0', '17-6478952', '1', '17', '1', '订单[17-6478952]获取积分', '1474342114', '0');

-- ----------------------------
-- Table structure for `qm_lm`
-- ----------------------------
DROP TABLE IF EXISTS `qm_lm`;
CREATE TABLE `qm_lm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cntitle` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `cty` varchar(500) DEFAULT '0' COMMENT '车型',
  `fid` int(11) DEFAULT NULL,
  `fidpath` varchar(255) DEFAULT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `isshow` int(11) DEFAULT NULL,
  `ty` int(11) DEFAULT NULL,
  `content` longtext,
  `kdel` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `weburl` varchar(555) DEFAULT NULL,
  `urlpath` varchar(555) DEFAULT NULL,
  `Additional` longtext,
  `hit` bigint(20) DEFAULT '0',
  `mty` int(5) DEFAULT '0' COMMENT '内容模型',
  `dtitle` varchar(200) DEFAULT '',
  `imglist` varchar(5000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_lm
-- ----------------------------
INSERT INTO `qm_lm` VALUES ('1', '产品中心', '', '0', '0', ',0', '', '1', '', '', '', '', '1', '2', '', '1', '', '/product/', '/product/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('2', '活动专区', '/m/img/11.jpg', '0', '0', ',0', '', '2', '', '', '', '', '1', '4', '', '1', '', '/active/', '/active/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('3', '禽肉蛋品', '', '0', '0', ',0', '', '3', '', '', '', null, '1', '4', '', '1', '', '/fresh/', '/fresh/', '', '0', '0', null, '/pub/qm/p/image/160830/101058_116.jpg');
INSERT INTO `qm_lm` VALUES ('4', '礼盒专区', '', '0', '0', ',0', '', '4', '', '', '', '', '1', '2', '', '1', '', '/gift/', '/gift/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('5', '积分商城', '', '0', '0', ',0', '', '5', '', '', '', '', '1', '2', '', '1', '', '/integral/', '/integral/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('6', '关于我们', '', '0', '0', ',0', '', '6', '', '', '', '', '1', '3', '', '1', '', '/about/', '/about/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('7', '联系我们', '', '0', '0', ',0', '', '7', '', '', '', '', '1', '3', '', '1', '', '/contact/', '/contact/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('8', '购物指南', '', '0', '0', ',0', '', '8', '', '', '', '', '1', '3', '', '1', '', '/guide/', '/guide/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('9', '合作洽谈', '', '0', '0', ',0', '', '9', '', '', '', '', '1', '3', '', '1', '', '/cooperation/', '/cooperation/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('10', '配送信息', '', '0', '0', ',0', '', '10', '', '', '', '', '1', '3', '', '1', '', '/delivery/', '/delivery/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('11', '支付方式', '', '0', '0', ',0', '', '11', '', '', '', '', '1', '3', '', '1', '', '/pay/', '/pay/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('12', '售后服务', '', '0', '0', ',0', '', '12', '', '', '', '', '1', '3', '', '1', '', '/aftermarket/', '/aftermarket/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('13', '其它', '', '0', '0', ',0', '', '14', '', '', '', '', '1', '3', '', '1', '', '/other/', '/other/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('14', 'banner', '', '0', '13', ',0,13', '', '1', '', '', '', '', '1', '3', '', '1', '', '/other/list-14/', '/other/list-14/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('15', '版权下方图片', '', '0', '13', ',0,13', '', '2', '', '', '', '', '1', '3', '', '1', '', '/other/list-15/', '/other/list-15/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('16', '友情链接', '', '0', '13', ',0,13', '', '3', '', '', '', '', '1', '3', '', '1', '', '/link/', '/link/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('17', '会员介绍', '', '0', '8', ',0,8', '', '1', '', '', '', '', '1', '3', '', '0', '', '/guide/g17/', '/guide/g17/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('18', '购物流程', '', '0', '8', ',0,8', '', '2', '', '', '', '', '1', '3', '', '0', '', '/guide/g18/', '/guide/g18/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('19', '用劵规则', '', '0', '8', ',0,8', '', '3', '', '', '', '', '1', '3', '', '0', '', '/guide/g19/', '/guide/g19/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('20', '积分政策', '', '0', '8', ',0,8', '', '4', '', '', '', '', '1', '3', '', '1', '', '/guide/g20/', '/guide/g20/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('21', '配送政策', '', '0', '10', ',0,10', '', '1', '', '', '', '', '1', '3', '', '0', '', '/delivery/list-21/', '/delivery/list-21/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('22', '进度查询', '', '0', '10', ',0,10', '', '2', '', '', '', '', '1', '3', '', '0', '', '/delivery/list-22/', '/delivery/list-22/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('23', '验货与签收', '', '0', '10', ',0,10', '', '3', '', '', '', '', '1', '3', '', '0', '', '/delivery/list-23/', '/delivery/list-23/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('24', '在线支付', '', '0', '11', ',0,11', '', '1', '', '', '', '', '1', '3', '', '0', '', '/pay/list-24/', '/pay/list-24/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('25', '公司转账', '', '0', '11', ',0,11', '', '2', '', '', '', '', '1', '3', '', '0', '', '/pay/list-25/', '/pay/list-25/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('26', '支付遇到问题', '', '0', '11', ',0,11', '', '3', '', '', '', '', '1', '3', '', '0', '', '/pay/list-26/', '/pay/list-26/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('27', '发票制度', '', '0', '11', ',0,11', '', '4', '', '', '', '', '1', '3', '', '0', '', '/pay/list-27/', '/pay/list-27/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('28', '售后政策', '', '0', '12', ',0,12', '', '1', '', '', '', '', '1', '3', '', '0', '', '/aftermarket/list-28/', '/aftermarket/list-28/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('29', '取消订单', '', '0', '12', ',0,12', '', '2', '', '', '', '', '1', '3', '', '0', '', '/aftermarket/list-29/', '/aftermarket/list-29/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('30', '退款说明', '', '0', '12', ',0,12', '', '3', '', '', '', '', '1', '3', '', '0', '', '/aftermarket/list-30/', '/aftermarket/list-30/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('31', '隐私条款', '', '0', '12', ',0,12', '', '4', '', '', '', '', '1', '3', '', '0', '', '/aftermarket/list-31/', '/aftermarket/list-31/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('32', '最新公告', '', '0', '0', ',0', '', '13', '', '', '', '', '1', '1', '', '1', '', '/notice/', '/notice/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('33', '禽肉蛋品', '', '0', '1', ',0,1', '', '2', '', '', '', '/img/icon/1.jpg', '1', '2', '', '1', '', '/freshfood/', '/freshfood/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('34', '鲜果时蔬', '/pub/qm/p/image/160911/112923_704.png', '0', '1', ',0,1', '', '1', '', '', '', '/img/icon/2.jpg', '1', '2', '', '1', '', '/product/vegetablefruit/', '/product/vegetablefruit/', '', '0', '0', '#ffa7a6', '');
INSERT INTO `qm_lm` VALUES ('35', '土特优选', '/m/img/9.jpg', '0', '1', ',0,1', '', '6', '', '', '', '/img/icon/3.jpg', '1', '2', '', '1', '', '/product/drinks/', '/product/drinks/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('36', '休闲食品', '/pub/qm/p/image/160911/112836_179.png', '0', '1', ',0,1', '', '3', '', '', '', '/img/icon/5.jpg', '1', '2', '', '1', '', '/product/snack-foods/', '/product/snack-foods/', '', '0', '0', '#d9b598', '');
INSERT INTO `qm_lm` VALUES ('37', '酒水饮料', '/m/img/11.jpg', '0', '1', ',0,1', '', '5', '', '', '', '/img/icon/4.jpg', '1', '2', '', '1', '', '/product/brewing/', '/product/brewing/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('38', '粮油干货', '', '0', '1', ',0,1', '', '4', '', '', '', '/img/icon/6.jpg', '1', '2', '', '1', '', '/product/oils/', '/product/oils/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('39', '健康养生', '/pub/qm/p/image/160911/112853_606.png', '0', '1', ',0,1', '', '7', '', '', '', '/img/icon/7.jpg', '1', '2', '', '1', '', '/product/dry/', '/product/dry/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('40', '生态土鸡蛋', '', '0', '33', ',0,1,33', '', '1', '', '', '', null, '1', '2', '', '0', '', '/freshfood/meat/', '/freshfood/meat/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('41', '生态土鸡肉', '', '0', '33', ',0,1,33', '', '2', '', '', '', null, '1', '2', '', '0', '', '/freshfood/seafood/', '/freshfood/seafood/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('42', '特色牛肉', '', '0', '33', ',0,1,33', '', '5', '', '', '', null, '1', '2', '', '0', '', '/freshfood/delicatessen/', '/freshfood/delicatessen/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('46', '地域鲜果', '', '0', '34', ',0,1,34', '', '1', '', '', '', null, '1', '2', '', '0', '', '/product/huacai/', '/product/huacai/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('50', '坚果类', '', '0', '36', ',0,1,36', '', '1', '', '', '', null, '1', '2', '', '0', '', '/product/biscuit/', '/product/biscuit/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('53', '酒类', '', '0', '37', ',0,1,37', '', '1', '', '', '', null, '1', '2', '', '0', '', '/product/coffee/', '/product/coffee/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('54', '饮料', '', '0', '37', ',0,1,37', '', '2', '', '', '', null, '1', '2', '', '0', '', '/product/tea/', '/product/tea/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('57', '特色油', '', '0', '38', ',0,1,38', '', '1', '', '', '', null, '1', '2', '', '0', '', '/product/oliveoil/', '/product/oliveoil/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('58', '生态米', '', '0', '38', ',0,1,38', '', '2', '', '', '', null, '1', '2', '', '0', '', '/product/rice/', '/product/rice/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('59', '手工面条', '', '0', '38', ',0,1,38', '', '3', '', '', '', null, '1', '2', '', '0', '', '/product/can/', '/product/can/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('60', '茶叶', '', '0', '39', ',0,1,39', '', '1', '', '', '', '', '1', '2', '', '0', '', '/product/seeds/', '/product/seeds/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('61', '茶盘', '', '0', '39', ',0,1,39', '', '2', '', '', '', null, '1', '2', '', '0', '', '/product/peanut/', '/product/peanut/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('62', '原木手串', '', '0', '39', ',0,1,39', '', '3', '', '', '', '', '1', '2', '', '0', '', '/product/jujube/', '/product/jujube/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('64', '特色皮蛋', '', '0', '33', ',0,1,33', '', '4', '', '', '', null, '1', '2', '', '0', '', '/freshfood/eggs/', '/freshfood/eggs/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('66', '特色腊肉', '', '0', '33', ',0,1,33', '', '6', '', '', '', null, '1', '2', '', '0', '', '/freshfood/pastry/', '/freshfood/pastry/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('67', '绿壳土鸡蛋', '', '0', '40', ',0,1,33,40', '', '1', '', '', '', '', '1', '2', '', '0', '', '/freshfood/meat/list-67/', '/freshfood/meat/list-67/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('68', '土鸡蛋礼盒', '', '0', '40', ',0,1,33,40', '', '3', '', '', '', null, '1', '2', '', '0', '', '/freshfood/meat/list-68/', '/freshfood/meat/list-68/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('69', '黄壳土鸡蛋', '', '0', '40', ',0,1,33,40', '', '2', '', '', '', null, '1', '2', '', '0', '', '/freshfood/meat/list-69/', '/freshfood/meat/list-69/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('71', '土公鸡', '', '0', '41', ',0,1,33,41', '', '1', '', '', '', '', '1', '2', '', '0', '', '/freshfood/seafood/list-71/', '/freshfood/seafood/list-71/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('72', '老母鸡', '', '0', '41', ',0,1,33,41', '', '2', '', '', '', '', '1', '2', '', '0', '', '/freshfood/seafood/list-72/', '/freshfood/seafood/list-72/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('73', '乌骨鸡', '', '0', '41', ',0,1,33,41', '', '3', '', '', '', null, '1', '2', '', '0', '', '/freshfood/seafood/list-73/', '/freshfood/seafood/list-73/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('86', 'bnnner右侧广告', '', '0', '13', ',0,13', '', '4', '', '', '', '', '1', '3', '', '1', '', '/other/list-86/', '/other/list-86/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('87', '用户注册协议', '', '0', '0', ',0', '', '15', '', '', '用 户 注 册 协 议\r\n“土特土”网（http://www.tutetoo.com）是由四川金硕阳光生态农业有限公司（下称金硕阳光公司）自建并运营的电子商务网站。金硕阳光公司将通过本网站向您提供优质的土特商品及相关服务，并严格遵守本协议及相关承诺。当您通过本网站系统注册成为用户或以其它方式获得本网站所提供的商品及相关服务时，即表明您已经完全接受并签署了本协议。\r\n一．协议接纳\r\n1.1 如果您通过电脑端或手机端登录“土特土”网，购买商品或接受服务的，应当遵守相应网站的注册协议及其所发布的一切规则。\r\n1', '', '1', '3', '', '1', '', '/agree/', '/agree/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('89', '猕猴桃饮料', '', '0', '54', ',0,1,37,54', '', '1', '', '', '', null, '1', '2', '', '0', '', '/product/tea/list-89/', '/product/tea/list-89/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('97', '礼盒专区banner', '', '0', '13', ',0,13', '', '5', '', '', '', '', '1', '3', '', '1', '', '/other/list-97/', '/other/list-97/', '', '0', '0', '', '');
INSERT INTO `qm_lm` VALUES ('98', '手机首页6个广告', '', '0', '13', ',0,13', null, '6', '', '', '', null, '1', '3', null, '1', '', '/other/list-98/', '/other/list-98/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('101', '特色蔬菜', '', '0', '34', ',0,1,34', null, '7', '', '', '', null, '1', '1', null, '0', '', '/product/vegetablefruit/list-101/', '/product/vegetablefruit/list-101/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('103', '苍溪猕猴桃', '', '0', '46', ',0,1,34,46', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/huacai/list-103/', '/product/huacai/list-103/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('104', '雷波脐橙', '', '0', '46', ',0,1,34,46', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/huacai/list-104/', '/product/huacai/list-104/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('105', '赣南脐橙', '', '0', '46', ',0,1,34,46', null, '3', '', '', '', null, '1', '1', null, '0', '', '/product/huacai/list-105/', '/product/huacai/list-105/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('106', '盐源苹果', '', '0', '103', ',0,1,34,46,103', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/huacai/list-103/list-106/', '/product/huacai/list-103/list-106/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('107', '盐源苹果', '', '0', '46', ',0,1,34,46', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/huacai/list-107/', '/product/huacai/list-107/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('110', '特色板鸭', '', '0', '33', ',0,1,33', null, '8', '', '', '', null, '1', '2', null, '0', '', '/freshfood/list-110/', '/freshfood/list-110/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('112', '土鸡蛋皮蛋', '', '0', '64', ',0,1,33,64', null, '1', '', '', '', null, '1', '1', null, '0', '', '/freshfood/eggs/list-112/', '/freshfood/eggs/list-112/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('113', '广安盐皮蛋', '', '0', '64', ',0,1,33,64', null, '2', '', '', '', null, '1', '1', null, '0', '', '/freshfood/eggs/list-113/', '/freshfood/eggs/list-113/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('114', '阆中张飞牛肉', '', '0', '42', ',0,1,33,42', null, '1', '', '', '', null, '1', '1', null, '0', '', '/freshfood/delicatessen/list-114/', '/freshfood/delicatessen/list-114/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('115', '高原牦牛肉', '', '0', '42', ',0,1,33,42', null, '2', '', '', '', null, '1', '1', null, '0', '', '/freshfood/delicatessen/list-115/', '/freshfood/delicatessen/list-115/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('116', '四川老腊肉', '', '0', '66', ',0,1,33,66', null, '1', '', '', '', null, '1', '1', null, '0', '', '/freshfood/pastry/list-116/', '/freshfood/pastry/list-116/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('117', '攀枝花花坛子肉', '', '0', '66', ',0,1,33,66', null, '2', '', '', '', null, '1', '1', null, '0', '', '/freshfood/pastry/list-117/', '/freshfood/pastry/list-117/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('118', '云南火腿肉', '', '0', '66', ',0,1,33,66', null, '3', '', '', '', null, '1', '1', null, '0', '', '/freshfood/pastry/list-118/', '/freshfood/pastry/list-118/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('119', '安徽卤牛腱肉', '', '0', '42', ',0,1,33,42', null, '3', '', '', '', null, '1', '1', null, '0', '', '/freshfood/delicatessen/list-119/', '/freshfood/delicatessen/list-119/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('120', '德昌板鸭', '', '0', '110', ',0,1,33,110', null, '1', '', '', '', null, '1', '2', null, '0', '', '/freshfood/list-110/list-120/', '/freshfood/list-110/list-120/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('123', '蔬菜礼包', '', '0', '101', ',0,1,34,101', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/vegetablefruit/list-101/list-122/', '/product/vegetablefruit/list-101/list-122/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('124', '蔬菜礼包', '', '0', '123', ',0,1,34,101,123', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/vegetablefruit/list-101/list-122/list-124/', '/product/vegetablefruit/list-101/list-122/list-124/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('129', '蟹味菇', '', '0', '101', ',0,1,34,101', null, '6', '', '', '', null, '1', '1', null, '0', '', '/product/vegetablefruit/list-101/list-129/', '/product/vegetablefruit/list-101/list-129/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('132', '果脯类', '', '0', '36', ',0,1,36', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-130/', '/product/snack-foods/list-130/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('133', '豆制品类', '', '0', '36', ',0,1,36', null, '5', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-133/', '/product/snack-foods/list-133/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('134', '肉品类', '', '0', '36', ',0,1,36', null, '6', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-134/', '/product/snack-foods/list-134/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('135', '其它', '', '0', '36', ',0,1,36', null, '7', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-135/', '/product/snack-foods/list-135/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('136', '核桃油', '', '0', '57', ',0,1,38,57', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/oliveoil/list-136/', '/product/oliveoil/list-136/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('137', '亚麻籽油', '', '0', '57', ',0,1,38,57', null, '3', '', '', '', null, '1', '1', null, '0', '', '/product/oliveoil/list-137/', '/product/oliveoil/list-137/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('138', '橄榄油', '', '0', '57', ',0,1,38,57', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/oliveoil/list-138/', '/product/oliveoil/list-138/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('140', '黄菜籽油', '', '0', '57', ',0,1,38,57', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/oliveoil/list-140/', '/product/oliveoil/list-140/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('143', '五常大米', '', '0', '58', ',0,1,38,58', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/rice/list-141/', '/product/rice/list-141/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('146', '农家手工挂面', '', '0', '59', ',0,1,38,59', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/can/list-144/', '/product/can/list-144/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('147', '手工拉面', '', '0', '59', ',0,1,38,59', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/can/list-147/', '/product/can/list-147/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('148', '其它', '', '0', '38', ',0,1,38', null, '5', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-148/', '/product/oils/list-148/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('149', '阆州手工醋', '', '0', '148', ',0,1,38,148', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-148/list-149/', '/product/oils/list-148/list-149/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('150', '大竹醪糟', '', '0', '148', ',0,1,38,148', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-148/list-150/', '/product/oils/list-148/list-150/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('151', '广元米豆腐', '', '0', '148', ',0,1,38,148', null, '3', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-148/list-151/', '/product/oils/list-148/list-151/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('152', '特色菌菇', '', '0', '38', ',0,1,38', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-152/', '/product/oils/list-152/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('153', '土蜂蜜', '', '0', '148', ',0,1,38,148', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-148/list-153/', '/product/oils/list-148/list-153/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('154', '青川木耳', '', '0', '152', ',0,1,38,152', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/oils/list-152/list-154/', '/product/oils/list-152/list-154/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('155', '通江段木贡品银耳', '通江段木贡品银耳', '0', '152', ',0,1,38,152', null, '2', '通江段木贡品银耳', '干货   段木   贡品   银耳', '通江银耳：贡品今入百姓家银耳生长的椴木是青冈树，当地选择生长在土壤肥沃、向阳山区的青冈树，每年3月下旬，温度适宜，接种银耳的菌丝。6-7月份，银耳可以被采摘。作为滋补良品，银耳从来是大户人家喜爱的山珍，不仅滋阴补肾润肺，也是女人喜爱的养颜物品!', null, '1', '1', null, '0', '', '/product/oils/list-152/list-155/', '/product/oils/list-152/list-155/', '', '0', '0', null, '/pub/qm/p/image/161229/220613_280.png,/pub/qm/p/image/161229/223828_331.jpg,/pub/qm/p/image/161229/220835_761.jpg,/pub/qm/p/image/161229/220712_169.jpg');
INSERT INTO `qm_lm` VALUES ('156', '核桃', '', '0', '50', ',0,1,36,50', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/biscuit/list-156/', '/product/biscuit/list-156/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('157', '枣片', '', '0', '132', ',0,1,36,132', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-130/list-157/', '/product/snack-foods/list-130/list-157/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('158', '剑门豆腐干', '', '0', '133', ',0,1,36,133', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-133/list-158/', '/product/snack-foods/list-133/list-158/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('159', '枣加核', '', '0', '132', ',0,1,36,132', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-130/list-159/', '/product/snack-foods/list-130/list-159/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('160', '鳄鱼肉', '', '0', '134', ',0,1,36,134', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/snack-foods/list-134/list-160/', '/product/snack-foods/list-134/list-160/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('161', '红酒', '', '0', '53', ',0,1,37,53', null, '1', '', '', '', null, '1', '1', null, '0', '', '/product/coffee/list-161/', '/product/coffee/list-161/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('162', '白酒', '', '0', '53', ',0,1,37,53', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/coffee/list-162/', '/product/coffee/list-162/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('163', '果酒', '', '0', '53', ',0,1,37,53', null, '3', '', '', '', null, '1', '1', null, '0', '', '/product/coffee/list-163/', '/product/coffee/list-163/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('164', '空气净化器', '', '0', '39', ',0,1,39', null, '4', '', '', '', null, '1', '1', null, '0', '', '/product/dry/list-164/', '/product/dry/list-164/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('165', '土鸡蛋礼盒', '', '0', '35', ',0,1,35', null, '1', '', '', '', null, '1', '2', null, '0', '', '/product/drinks/list-165/', '/product/drinks/list-165/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('166', '土鸡肉', '', '0', '35', ',0,1,35', null, '2', '', '', '', null, '1', '1', null, '0', '', '/product/drinks/list-166/', '/product/drinks/list-166/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('167', '土鸡蛋快递装', '', '0', '40', ',0,1,33,40', null, '4', '', '', '', null, '1', '1', null, '0', '', '/freshfood/meat/list-167/', '/freshfood/meat/list-167/', '', '0', '0', null, '');
INSERT INTO `qm_lm` VALUES ('169', '剑门黑花生', '/pub/qm/p/image/161229/210949_853.jpg', '0', '50', ',0,1,36,50', null, '2', '剑门黑花生', '剑门黑花生', '剑门黑花生所含的矿物质成分，首先就要讲的就是硒元素，因为富含硒元素是黑花生最主要的特点之一。硒元素中被称为“抗癌之王”。高钾低钠也是黑花生的一大特点，每百克黑花生含钾约700mg。黑花生中镁元素含量也很高，这对于维持肌肉兴奋性和男性性功能非常重要。黑花生还富含其他多种矿物质及微量元素，如铁、锌等。', null, '1', '1', null, '1', '', '/product/biscuit/list-168/剑门黑花生', '/product/biscuit/list-168/', '', '0', '0', null, '/pub/qm/p/image/161229/211439_288.jpg,/pub/qm/p/image/161229/211502_227.jpg,/pub/qm/p/image/161229/211514_278.jpg,/pub/qm/p/image/161229/211527_697.jpg');

-- ----------------------------
-- Table structure for `qm_lm_ad`
-- ----------------------------
DROP TABLE IF EXISTS `qm_lm_ad`;
CREATE TABLE `qm_lm_ad` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(11) DEFAULT '0' COMMENT '栏目id',
  `img` varchar(200) DEFAULT '' COMMENT '图片',
  `url` varchar(200) DEFAULT '' COMMENT '广告链接',
  `cid` int(7) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_lm_ad
-- ----------------------------
INSERT INTO `qm_lm_ad` VALUES ('1', '33', '/images/floor1.jpg', '/product/vegetablefruit/', '0');
INSERT INTO `qm_lm_ad` VALUES ('2', '34', '/pub/qm/p/image/160830/154729_832.jpg', 'http://www.tutetoo.com/product/huacai/26.html', '0');
INSERT INTO `qm_lm_ad` VALUES ('3', '35', '/images/floor2.jpg', '', '0');
INSERT INTO `qm_lm_ad` VALUES ('4', '36', '/images/floor3.jpg', '', '0');
INSERT INTO `qm_lm_ad` VALUES ('5', '37', '/images/floor4.jpg', '', '0');
INSERT INTO `qm_lm_ad` VALUES ('6', '38', '/images/floor5.jpg', '', '0');

-- ----------------------------
-- Table structure for `qm_money`
-- ----------------------------
DROP TABLE IF EXISTS `qm_money`;
CREATE TABLE `qm_money` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `uid` bigint(12) DEFAULT '0',
  `money` double(11,2) DEFAULT '0.00',
  `addtime` bigint(11) DEFAULT '0' COMMENT '提现时间',
  `zt` smallint(1) DEFAULT '0' COMMENT '提现状态',
  `del` smallint(1) DEFAULT '0',
  `oktime` bigint(11) DEFAULT '0',
  `wx` varchar(200) DEFAULT '',
  `zfb` varchar(200) DEFAULT '',
  `bz` varchar(500) DEFAULT '',
  `pty` smallint(1) DEFAULT '1' COMMENT '1支付宝 2微信 等提现方式',
  `tel` varchar(100) DEFAULT '',
  `truename` varchar(100) DEFAULT '',
  `state` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_money
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_msg`
-- ----------------------------
DROP TABLE IF EXISTS `qm_msg`;
CREATE TABLE `qm_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `z1` text,
  `z2` text,
  `z3` text,
  `z4` text,
  `z5` text,
  `z6` text,
  `z7` text,
  `z8` text,
  `z9` text,
  `z10` text,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `Qcontent` longtext,
  `Qtime` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_msg2`
-- ----------------------------
DROP TABLE IF EXISTS `qm_msg2`;
CREATE TABLE `qm_msg2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0',
  `z1` text,
  `z2` text,
  `z3` text,
  `z4` text,
  `z5` text,
  `z6` text,
  `z7` text,
  `z8` text,
  `z9` text,
  `z10` text,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `Qcontent` longtext,
  `Qtime` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_msg2
-- ----------------------------

-- ----------------------------
-- Table structure for `qm_order`
-- ----------------------------
DROP TABLE IF EXISTS `qm_order`;
CREATE TABLE `qm_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `oty` smallint(2) NOT NULL DEFAULT '0' COMMENT '订单类型0 产品订单 1积分订单',
  `uid` bigint(11) DEFAULT '0',
  `cid` bigint(11) DEFAULT '0' COMMENT '临时id',
  `aid` bigint(11) DEFAULT '0' COMMENT '收货地址id',
  `orderid` varchar(200) DEFAULT '',
  `num` int(7) DEFAULT '0' COMMENT '订购数量',
  `money` double(11,2) DEFAULT '0.00' COMMENT '订单总金额',
  `paymoney` double(11,2) DEFAULT '0.00' COMMENT '订单应支付金额',
  `zhe` int(3) DEFAULT '100' COMMENT '订单折扣 百分比 比如50 表示5折',
  `zt` smallint(2) DEFAULT '0' COMMENT '订单状态 默认未发货 已发货 ',
  `gbz` varchar(5000) DEFAULT '' COMMENT '系统备注',
  `pty` smallint(2) DEFAULT '0' COMMENT '支付类型 1微信支付 2支付宝 3网银 4其它',
  `addtime` bigint(11) DEFAULT '0' COMMENT '订单提交时间',
  `paytime` bigint(11) DEFAULT '0' COMMENT '付款时间 通过时间可以判断是否付款',
  `oktime` bigint(11) DEFAULT '0' COMMENT '确认收货时间',
  `ttime` bigint(11) DEFAULT '0' COMMENT '退货时间',
  `sh_name` varchar(200) DEFAULT '' COMMENT '收货人',
  `sh_tel` varchar(200) DEFAULT '' COMMENT '收货人电话',
  `sh_area` varchar(200) DEFAULT '' COMMENT '收货人省市区',
  `sh_address` varchar(200) DEFAULT '' COMMENT '收货人详细地址',
  `sh_qq` varchar(100) DEFAULT '',
  `sh_zipcode` varchar(100) DEFAULT '',
  `sh_pid` varchar(200) DEFAULT '' COMMENT '收货人配送站点（配送地址id）',
  `sh_bz` varchar(2000) DEFAULT '' COMMENT '订单备注',
  `sh_kuaidi` varchar(200) DEFAULT '' COMMENT '快递',
  `sh_yunfei` int(5) DEFAULT '0' COMMENT '订单总运费',
  `youhui` int(6) DEFAULT '0' COMMENT '订单优惠金额',
  `yhj` int(7) DEFAULT '0' COMMENT '使用优惠劵编号',
  `yhj_money` int(7) DEFAULT '0' COMMENT '优惠劵抵扣金额',
  `jf_bl` int(7) DEFAULT '10',
  `jf_num` int(7) DEFAULT '0',
  `del` smallint(1) DEFAULT '0' COMMENT '订单是否删除',
  `ip` varchar(50) DEFAULT '',
  `hzt` smallint(1) DEFAULT '0' COMMENT '活动是否结算',
  `hid` bigint(11) DEFAULT '0' COMMENT 'id',
  `hzk` int(2) DEFAULT '90' COMMENT '比例',
  `endtime` bigint(11) DEFAULT '0' COMMENT '活动结束时间',
  `wtype` int(3) DEFAULT '1' COMMENT '送货方式 预付预付 货到付运费',
  `sid` bigint(11) DEFAULT '0' COMMENT '商家id',
  `isbirthday` smallint(1) DEFAULT '0' COMMENT '订单是否是生日下单的',
  `ispl` smallint(1) DEFAULT '0' COMMENT '订单是否评论',
  `uptime` bigint(11) DEFAULT '0',
  `vtime` bigint(11) DEFAULT '0',
  `ftime` bigint(11) DEFAULT '0',
  `view` smallint(1) DEFAULT '0',
  `cxtime` bigint(11) DEFAULT '0',
  `yhjstr` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_order
-- ----------------------------
INSERT INTO `qm_order` VALUES ('1', '0', '30', '0', '11', '30-13062596', '1', '128.00', '128.00', '100', '95', '', '1', '1480925709', '0', '0', '0', '建设', '18966666666', '北京市,北京市,朝阳区', '北京市,北京市,朝阳区 默默哦哦哦哦哦哦哦哦哦哦哦', '', '638300', '', '', '', '0', '0', '0', '0', '100', '1', '0', '171.217.163.63', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1486886253', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('2', '0', '32', '0', '12', '32-14703793', '1', '168.00', '168.00', '100', '95', '', '1', '1482566906', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 双成4路华润24城1期3栋2单元', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '168', '1', '222.211.139.189', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1483509852', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('3', '0', '32', '0', '12', '32-14704971', '1', '128.00', '128.00', '100', '95', '', '1', '1482568084', '0', '0', '0', 'AAA', '13218989800', '四川省,成都市,成华区', '四川省,成都市,成华区 非官方v', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '128', '1', '222.211.139.189', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1483509179', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('4', '0', '30', '0', '11', '30-14722501', '1', '168.00', '183.00', '100', '95', '', '1', '1482585614', '0', '0', '0', '建设', '18966666666', '重庆市,重庆市,大渡口区', '重庆市,重庆市,大渡口区 默默哦哦哦哦哦哦哦哦哦哦哦', '', '638300', '', '', '', '15', '0', '0', '0', '100', '183', '0', '118.113.42.153', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1483089122', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('5', '0', '38', '0', '14', '38-15224097', '3', '248.00', '248.00', '100', '95', '', '1', '1483087210', '0', '0', '0', '蒋文川', '13594333241', '四川省,成都市,青羊区', '四川省,成都市,青羊区 详细地址详细地址详细地址', '1506067071', '651000', '', '详细地址详细地址详细地址', '', '15', '0', '0', '0', '100', '248', '1', '222.211.201.128', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1483089585', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('6', '0', '32', '0', '12', '32-15561888', '1', '128.00', '128.00', '100', '95', '', '1', '1483425001', '0', '0', '0', 'AAA', '13218989800', '四川省,成都市,成华区', '四川省,成都市,成华区 非官方v', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '128', '1', '118.113.42.162', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('7', '0', '32', '0', '12', '32-15645992', null, null, null, '100', '95', '', '1', '1483509105', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 建材路39号九熙广场2栋2510', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '0', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('8', '0', '28', '0', '10', '28-15646263', '1', '85.00', '100.00', '100', '95', '', '1', '1483509377', '0', '0', '0', '张中林', '', '四川省,成都市,成华区', '四川省,成都市,成华区 双城二路39号', null, '', '', '', '', '15', '0', '0', '0', '100', '100', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('9', '0', '28', '0', '10', '28-15646291', '1', '85.00', '100.00', '100', '95', '', '1', '1483509404', '0', '0', '0', '张中林', '', '四川省,成都市,成华区', '四川省,成都市,成华区 双城二路39号', null, '', '', '', '', '15', '0', '0', '0', '100', '100', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('10', '0', '28', '0', '10', '28-15646365', '1', '85.00', '100.00', '100', '95', '', '1', '1483509478', '0', '0', '0', '张中林', '13541092414', '四川省,成都市,成华区', '四川省,成都市,成华区 双城二路39号', '', '', '', '', '', '15', '0', '0', '0', '100', '100', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('11', '0', '28', '0', '10', '28-15646519', '1', '85.00', '100.00', '100', '95', '', '1', '1483509632', '0', '0', '0', '张中林', '13541092414', '四川省,成都市,成华区', '四川省,成都市,成华区 花样年华花郡', '', '', '', '', '', '15', '0', '0', '0', '100', '100', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('12', '0', '28', '0', '15', '28-15646559', '1', '85.00', '100.00', '100', '95', '', '1', '1483509672', '0', '0', '0', '万小姐', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 AAAAAA', '', '', '', '', '', '15', '0', '0', '0', '100', '100', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('13', '0', '32', '0', '16', '32-15648127', null, null, null, '100', '95', '', '1', '1483511240', '0', '0', '0', '张定发', '13881206791', '西藏,阿里地区,噶尔县', '西藏,阿里地区,噶尔县 石门乡柳池村', '', '', '', '', '', '0', '0', '0', '0', '100', '0', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('14', '0', '38', '0', '14', '38-15648979', null, null, null, '100', '95', '', '1', '1483512092', '0', '0', '0', '蒋文川', '13594333241', '四川省,成都市,青羊区', '四川省,成都市,青羊区 详细地址详细地址详细地址', '1506067071', '651000', '', '', '', '0', '0', '0', '0', '100', '0', '1', '171.88.9.216', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1483521197', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('15', '0', '32', '0', '12', '32-15654367', '1', '126.00', '141.00', '100', '95', '', '1', '1483517480', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '141', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('16', '0', '32', '0', '12', '32-15658249', '1', '126.00', '141.00', '100', '95', '', '1', '1483521362', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '141', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('17', '0', '32', '0', '12', '32-15658609', '2', '254.00', '269.00', '100', '95', '', '1', '1483521722', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '269', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('18', '0', '32', '0', '12', '32-15658733', null, null, null, '100', '95', '', '1', '1483521846', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '0', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('19', '0', '32', '0', '12', '32-15658885', '1', '128.00', '128.00', '100', '95', '', '1', '1483521998', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '128', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('20', '0', '32', '0', '12', '32-15660738', '1', '126.00', '141.00', '100', '95', '', '1', '1483523851', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '141', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('21', '0', '38', '0', '14', '38-15660990', null, '0.00', '0.00', '100', '95', '', '1', '1483524103', '0', '0', '0', '蒋文川', '13594333241', '西藏,阿里地区,札达县', '西藏,阿里地区,札达县 详细地址详细地址详细地址', '1506067071', '651000', '', '', '', '0', '0', '0', '0', '100', '0', '1', '171.88.9.216', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('22', '0', '32', '0', '12', '32-15661025', '1', '128.00', '128.00', '100', '95', '', '1', '1483524138', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '0', '0', '0', '0', '100', '128', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('23', '0', '32', '0', '12', '32-15661169', '1', '126.00', '141.00', '100', '95', '', '1', '1483524282', '0', '0', '0', '张中林', '13881879952', '四川省,成都市,成华区', '四川省,成都市,成华区 华润24城', '254029396', '610061', '', '', '', '15', '0', '0', '0', '100', '141', '1', '118.113.43.1', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('24', '0', '38', '0', '14', '38-15661278', null, '0.00', '0.00', '100', '95', '', '1', '1483524391', '0', '0', '0', '蒋文川', '13594333241', '西藏,阿里地区,札达县', '西藏,阿里地区,札达县 详细地址详细地址详细地址', '1506067071', '651000', '', '', '', '0', '0', '0', '0', '100', '0', '1', '171.88.9.216', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('25', '0', '38', '0', '14', '38-15661595', '2', '216.00', '216.00', '100', '95', '', '1', '1483524708', '0', '0', '0', '蒋文川', '13594333241', '西藏,阿里地区,札达县', '西藏,阿里地区,札达县 详细地址详细地址详细地址', '1506067071', '651000', '', '', '', '0', '0', '0', '0', '100', '216', '0', '171.88.9.216', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('26', '0', '62', '0', '19', '62-16407668', '1', '128.00', '128.00', '100', '95', '', '1', '1484270781', '0', '0', '0', 'sans', '13301212204', '北京市,北京市,东城区', '北京市,北京市,东城区 北京市东城区莲花大厦', '', '100010', '', '', '', '0', '0', '0', '0', '100', '128', '1', '118.26.157.102', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('27', '0', '62', '0', '19', '62-16532275', '1', '128.00', '128.00', '100', '95', '', '1', '1484395388', '0', '0', '0', 'sans', '13301212204', '北京市,北京市,东城区', '北京市,北京市,东城区 北京市东城区莲花大厦', '', '100010', '', '', '', '0', '0', '0', '0', '100', '128', '0', '114.243.167.201', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('28', '0', '0', '1', '0', '1-18918069', '2', '236.00', '236.00', '100', '95', '', '1', '1486781182', '0', '0', '0', '王先生', '18963636365', '四川省,成都市,青羊区', '四川省,成都市,青羊区 青羊区详细地址', '', '888888', '', '', '', '0', '0', '0', '0', '100', '236', '0', '118.116.90.164', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('29', '0', '105', '0', '20', '105-31726502', '1', '108.00', '108.00', '100', '95', '', '1', '1499589615', '0', '0', '0', '李先生', '13654626652', '北京市,北京市,西城区', '北京市,北京市,西城区 你聚餐大家好', '', '', '', '', '', '0', '0', '0', '0', '100', '108', '0', '120.85.77.142', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('30', '0', '106', '0', '21', '106-33115871', '1', '126.00', '141.00', '100', '95', '', '1', '1500978985', '0', '0', '0', '黄先生', '13512345678', '北京市,北京市,西城区', '北京市,北京市,西城区 大华路22号', '', '100001', '', '', '', '15', '0', '0', '0', '100', '141', '0', '120.85.77.67', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('31', '0', '0', '2', '0', '2-33260564', '1', '126.00', '141.00', '100', '95', '', '1', '1501123677', '0', '0', '0', '测试', '13712346578', '上海市,上海市,徐汇区', '上海市,上海市,徐汇区 不登录cccccccc', '123456', '213546', '', '', '', '15', '0', '0', '0', '100', '141', '0', '120.85.77.117', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1501132459', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('32', '0', '106', '0', '21', '106-33269643', '1', '108.00', '108.00', '100', '95', '', '1', '1501132756', '0', '0', '0', '黄先生', '13512345678', '重庆市,重庆市,沙坪坝区', '重庆市,重庆市,沙坪坝区 大华路22号', '', '100001', '', '', '', '0', '0', '0', '0', '100', '108', '0', '120.85.77.117', '0', '0', '90', '0', '1', '0', '0', '0', '0', '1501151008', '0', '1', '0', '');
INSERT INTO `qm_order` VALUES ('33', '0', '106', '0', '21', '106-33880482', '5', '640.00', '640.00', '100', '95', '', '1', '1501743595', '0', '0', '0', '黄先生', '13512345678', '重庆市,重庆市,沙坪坝区', '重庆市,重庆市,沙坪坝区 大华路22号', '', '100001', '', '', '', '0', '0', '0', '0', '100', '640', '0', '120.85.77.124', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `qm_order` VALUES ('34', '0', '106', '0', '21', '106-33969336', '1', '126.00', '141.00', '100', '95', '', '1', '1501832449', '0', '0', '0', '黄先生', '13512345678', '重庆市,重庆市,沙坪坝区', '重庆市,重庆市,沙坪坝区 大华路22号', '', '100001', '', '', '', '15', '0', '0', '0', '100', '141', '0', '120.85.77.74', '0', '0', '90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `qm_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `qm_order_goods`;
CREATE TABLE `qm_order_goods` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `oty` smallint(2) NOT NULL DEFAULT '0' COMMENT '订单类型0 产品订单 1积分订单',
  `uid` bigint(11) DEFAULT '0',
  `cid` bigint(11) DEFAULT '0' COMMENT '临时会员id',
  `aid` bigint(11) DEFAULT '0',
  `orderid` varchar(100) DEFAULT '',
  `pid` bigint(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `money` double(11,2) DEFAULT '0.00',
  `num` int(7) DEFAULT '0' COMMENT '订购商品数量',
  `cntitle` varchar(300) DEFAULT '' COMMENT '商品名称',
  `yf` int(7) DEFAULT '0',
  `ip` varchar(100) DEFAULT '',
  `pic` varchar(300) DEFAULT '' COMMENT '商品图片',
  `gys` varchar(200) DEFAULT '' COMMENT '商品供应商或者是卖家id',
  `zhe` int(3) DEFAULT '100' COMMENT '商品折扣',
  `bz` text COMMENT '商品其它信息',
  `sh_kuaidi` varchar(200) DEFAULT '' COMMENT '商品快递号',
  `sh_yunfei` int(6) DEFAULT '0' COMMENT '快递运费',
  `zt` smallint(2) DEFAULT '0' COMMENT '商品订单状态 比如1已发货 0未发货 2已收货 3退货 4取消订单',
  `fk` smallint(1) DEFAULT '0' COMMENT '付款状态',
  `del` smallint(2) DEFAULT '0' COMMENT '是否删除',
  `s1` smallint(1) DEFAULT '0' COMMENT '是否评价商品',
  `s2` smallint(1) DEFAULT '0' COMMENT '是否评价物流',
  `addtime` bigint(11) DEFAULT '0',
  `price` double(11,2) DEFAULT '0.00',
  `s3` smallint(1) DEFAULT '0' COMMENT '是否评论产品是否评论 只有确认收货后才能评论',
  `pzt` smallint(2) DEFAULT '0' COMMENT '订单状态 0已下单 1已发货 2确认收货 3订单完成9退货订单 91 申请了退货 92退货处理中 93退货失败',
  `cxtime` bigint(11) DEFAULT '0' COMMENT '撤销退货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_order_goods
-- ----------------------------
INSERT INTO `qm_order_goods` VALUES ('1', '0', '30', '0', '11', '30-13062596', '25', '128.00', '1', '苍溪红心猕猴桃礼盒装（中果装）奇异果四川特产猕猴桃30枚', '0', '', '/pub/qm/p/image/160829/101826_530.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1480925709', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('2', '0', '32', '0', '12', '32-14703793', '24', '168.00', '1', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', '0', '', '/pub/qm/p/image/160824/104210_655.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1482566906', '168.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('3', '0', '32', '0', '12', '32-14704971', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1482568084', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('4', '0', '30', '0', '11', '30-14722501', '24', '168.00', '1', '苍溪红心猕猴桃礼盒装（大果装）奇异果四川特产猕猴桃30枚', '15', '', '/pub/qm/p/image/160824/104210_655.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1482585614', '168.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('5', '0', '38', '0', '14', '38-15224097', '1', '216.00', '2', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483087210', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('6', '0', '38', '0', '14', '38-15224097', '22', '32.00', '1', '时尚礼盒', '15', '', '/pub/qm/p/image/160830/100041_447.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483087210', '32.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('7', '0', '32', '0', '12', '32-15561888', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483425001', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('8', '0', '32', '0', '12', '32-15645992', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509105', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('9', '0', '28', '0', '10', '28-15646263', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509376', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('10', '0', '28', '0', '10', '28-15646291', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509404', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('11', '0', '28', '0', '10', '28-15646365', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509478', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('12', '0', '28', '0', '10', '28-15646519', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509632', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('13', '0', '28', '0', '15', '28-15646559', '56', '85.00', '1', '剑门黑花生', '15', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483509672', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('14', '0', '32', '0', '16', '32-15648127', '56', '85.00', '1', '剑门黑花生', '0', '', '/pub/qm/p/image/161229/210949_853.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483511240', '85.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('15', '0', '38', '0', '14', '38-15648979', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483512092', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('16', '0', '32', '0', '12', '32-15654367', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483517480', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('17', '0', '32', '0', '12', '32-15658249', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483521362', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('18', '0', '32', '0', '12', '32-15658609', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483521722', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('19', '0', '32', '0', '12', '32-15658609', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483521722', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('20', '0', '32', '0', '12', '32-15658733', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483521846', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('21', '0', '32', '0', '12', '32-15658885', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483521998', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('22', '0', '32', '0', '12', '32-15660738', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483523851', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('23', '0', '38', '0', '14', '38-15660990', '1', '0.00', null, '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483524103', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('24', '0', '32', '0', '12', '32-15661025', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483524138', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('25', '0', '32', '0', '12', '32-15661169', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483524282', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('26', '0', '38', '0', '14', '38-15661278', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1483524391', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('27', '0', '38', '0', '14', '38-15661595', '1', '216.00', '2', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1483524708', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('28', '0', '62', '0', '19', '62-16407668', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1484270781', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('29', '0', '62', '0', '19', '62-16532275', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1484395388', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('30', '0', '0', '0', '0', '1-18918069', '2', '128.00', '1', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1486781182', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('31', '0', '0', '0', '0', '1-18918069', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1486781182', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('32', '0', '105', '0', '20', '105-31726502', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1499589615', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('33', '0', '106', '0', '21', '106-33115871', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1500978984', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('34', '0', '0', '0', '0', '2-33260564', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '1', '0', '0', '1501123677', '126.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('35', '0', '106', '0', '21', '106-33269643', '1', '108.00', '1', '绿壳土鸡蛋快速装', '0', '', '/pub/qm/p/image/160719/230813_595.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1501132756', '108.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('36', '0', '106', '0', '21', '106-33880482', '2', '640.00', '5', '富硒绿壳土鸡蛋礼盒（限成都主城区）', '0', '', '/pub/qm/p/image/161222/232345_961.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1501743595', '128.00', '0', '0', '0');
INSERT INTO `qm_order_goods` VALUES ('37', '0', '106', '0', '21', '106-33969336', '57', '126.00', '1', '通江段木贡品银耳', '15', '', '/pub/qm/p/image/161229/230630_400.jpg', '0', '100', null, '', '0', '0', '0', '0', '0', '0', '1501832449', '126.00', '0', '0', '0');

-- ----------------------------
-- Table structure for `qm_region`
-- ----------------------------
DROP TABLE IF EXISTS `qm_region`;
CREATE TABLE `qm_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `longcode` varchar(12) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=767137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_region
-- ----------------------------
INSERT INTO `qm_region` VALUES ('1', '请选择', '0', '1', '1', '0', '0');
INSERT INTO `qm_region` VALUES ('2', '福建省', '1', '12', '2', '35', '35');
INSERT INTO `qm_region` VALUES ('3', '福州市', '2', '1', '3', '3501', '01');
INSERT INTO `qm_region` VALUES ('4', '市辖区', '3', '1', '4', '350101', '01');
INSERT INTO `qm_region` VALUES ('5', '鼓楼区', '3', '2', '4', '350102', '02');
INSERT INTO `qm_region` VALUES ('92', '台江区', '3', '3', '4', '350103', '03');
INSERT INTO `qm_region` VALUES ('176', '仓山区', '3', '4', '4', '350104', '04');
INSERT INTO `qm_region` VALUES ('373', '马尾区', '3', '5', '4', '350105', '05');
INSERT INTO `qm_region` VALUES ('452', '晋安区', '3', '6', '4', '350111', '11');
INSERT INTO `qm_region` VALUES ('634', '闽侯县', '3', '7', '4', '350121', '21');
INSERT INTO `qm_region` VALUES ('971', '连江县', '3', '8', '4', '350122', '22');
INSERT INTO `qm_region` VALUES ('1266', '罗源县', '3', '9', '4', '350123', '23');
INSERT INTO `qm_region` VALUES ('1474', '闽清县', '3', '10', '4', '350124', '24');
INSERT INTO `qm_region` VALUES ('1782', '永泰县', '3', '11', '4', '350125', '25');
INSERT INTO `qm_region` VALUES ('2068', '平潭县', '3', '12', '4', '350128', '28');
INSERT INTO `qm_region` VALUES ('2286', '福清市', '3', '13', '4', '350181', '81');
INSERT INTO `qm_region` VALUES ('2801', '长乐市', '3', '14', '4', '350182', '82');
INSERT INTO `qm_region` VALUES ('3076', '厦门市', '2', '2', '3', '3502', '02');
INSERT INTO `qm_region` VALUES ('3077', '市辖区', '3076', '1', '4', '350201', '01');
INSERT INTO `qm_region` VALUES ('3078', '思明区', '3076', '2', '4', '350203', '03');
INSERT INTO `qm_region` VALUES ('3190', '海沧区', '3076', '3', '4', '350205', '05');
INSERT INTO `qm_region` VALUES ('3236', '湖里区', '3076', '4', '4', '350206', '06');
INSERT INTO `qm_region` VALUES ('3297', '集美区', '3076', '5', '4', '350211', '11');
INSERT INTO `qm_region` VALUES ('3366', '同安区', '3076', '6', '4', '350212', '12');
INSERT INTO `qm_region` VALUES ('3510', '翔安区', '3076', '7', '4', '350213', '13');
INSERT INTO `qm_region` VALUES ('3631', '莆田市', '2', '3', '3', '3503', '03');
INSERT INTO `qm_region` VALUES ('3632', '市辖区', '3631', '1', '4', '350301', '01');
INSERT INTO `qm_region` VALUES ('3633', '城厢区', '3631', '2', '4', '350302', '02');
INSERT INTO `qm_region` VALUES ('3760', '涵江区', '3631', '3', '4', '350303', '03');
INSERT INTO `qm_region` VALUES ('3974', '荔城区', '3631', '4', '4', '350304', '04');
INSERT INTO `qm_region` VALUES ('4111', '秀屿区', '3631', '5', '4', '350305', '05');
INSERT INTO `qm_region` VALUES ('4323', '仙游县', '3631', '6', '4', '350322', '22');
INSERT INTO `qm_region` VALUES ('4668', '三明市', '2', '4', '3', '3504', '04');
INSERT INTO `qm_region` VALUES ('4669', '市辖区', '4668', '1', '4', '350401', '01');
INSERT INTO `qm_region` VALUES ('4670', '梅列区', '4668', '2', '4', '350402', '02');
INSERT INTO `qm_region` VALUES ('4724', '三元区', '4668', '3', '4', '350403', '03');
INSERT INTO `qm_region` VALUES ('4809', '明溪县', '4668', '4', '4', '350421', '21');
INSERT INTO `qm_region` VALUES ('4914', '清流县', '4668', '5', '4', '350423', '23');
INSERT INTO `qm_region` VALUES ('5047', '宁化县', '4668', '6', '4', '350424', '24');
INSERT INTO `qm_region` VALUES ('5286', '大田县', '4668', '7', '4', '350425', '25');
INSERT INTO `qm_region` VALUES ('5581', '尤溪县', '4668', '8', '4', '350426', '26');
INSERT INTO `qm_region` VALUES ('5858', '沙县', '4668', '9', '4', '350427', '27');
INSERT INTO `qm_region` VALUES ('6052', '将乐县', '4668', '10', '4', '350428', '28');
INSERT INTO `qm_region` VALUES ('6217', '泰宁县', '4668', '11', '4', '350429', '29');
INSERT INTO `qm_region` VALUES ('6344', '建宁县', '4668', '12', '4', '350430', '30');
INSERT INTO `qm_region` VALUES ('6455', '永安市', '4668', '13', '4', '350481', '81');
INSERT INTO `qm_region` VALUES ('6728', '泉州市', '2', '5', '3', '3505', '05');
INSERT INTO `qm_region` VALUES ('6729', '市辖区', '6728', '1', '4', '350501', '01');
INSERT INTO `qm_region` VALUES ('6730', '鲤城区', '6728', '2', '4', '350502', '02');
INSERT INTO `qm_region` VALUES ('6819', '丰泽区', '6728', '3', '4', '350503', '03');
INSERT INTO `qm_region` VALUES ('6899', '洛江区', '6728', '4', '4', '350504', '04');
INSERT INTO `qm_region` VALUES ('6992', '泉港区', '6728', '5', '4', '350505', '05');
INSERT INTO `qm_region` VALUES ('7102', '惠安县', '6728', '6', '4', '350521', '21');
INSERT INTO `qm_region` VALUES ('7414', '安溪县', '6728', '7', '4', '350524', '24');
INSERT INTO `qm_region` VALUES ('7911', '永春县', '6728', '8', '4', '350525', '25');
INSERT INTO `qm_region` VALUES ('8170', '德化县', '6728', '9', '4', '350526', '26');
INSERT INTO `qm_region` VALUES ('8391', '金门县', '6728', '10', '4', '350527', '27');
INSERT INTO `qm_region` VALUES ('8392', '石狮市', '6728', '11', '4', '350581', '81');
INSERT INTO `qm_region` VALUES ('8527', '晋江市', '6728', '12', '4', '350582', '82');
INSERT INTO `qm_region` VALUES ('8958', '南安市', '6728', '13', '4', '350583', '83');
INSERT INTO `qm_region` VALUES ('9403', '漳州市', '2', '6', '3', '3506', '06');
INSERT INTO `qm_region` VALUES ('9404', '市辖区', '9403', '1', '4', '350601', '01');
INSERT INTO `qm_region` VALUES ('9405', '芗城区', '9403', '2', '4', '350602', '02');
INSERT INTO `qm_region` VALUES ('9579', '龙文区', '9403', '3', '4', '350603', '03');
INSERT INTO `qm_region` VALUES ('9637', '云霄县', '9403', '4', '4', '350622', '22');
INSERT INTO `qm_region` VALUES ('9848', '漳浦县', '9403', '5', '4', '350623', '23');
INSERT INTO `qm_region` VALUES ('10194', '诏安县', '9403', '6', '4', '350624', '24');
INSERT INTO `qm_region` VALUES ('10454', '长泰县', '9403', '7', '4', '350625', '25');
INSERT INTO `qm_region` VALUES ('10540', '东山县', '9403', '8', '4', '350626', '26');
INSERT INTO `qm_region` VALUES ('10625', '南靖县', '9403', '9', '4', '350627', '27');
INSERT INTO `qm_region` VALUES ('10835', '平和县', '9403', '10', '4', '350628', '28');
INSERT INTO `qm_region` VALUES ('11109', '华安县', '9403', '11', '4', '350629', '29');
INSERT INTO `qm_region` VALUES ('11216', '龙海市', '9403', '12', '4', '350681', '81');
INSERT INTO `qm_region` VALUES ('11533', '南平市', '2', '7', '3', '3507', '07');
INSERT INTO `qm_region` VALUES ('11534', '市辖区', '11533', '1', '4', '350701', '01');
INSERT INTO `qm_region` VALUES ('11535', '延平区', '11533', '2', '4', '350702', '02');
INSERT INTO `qm_region` VALUES ('11871', '顺昌县', '11533', '3', '4', '350721', '21');
INSERT INTO `qm_region` VALUES ('12030', '浦城县', '11533', '4', '4', '350722', '22');
INSERT INTO `qm_region` VALUES ('12350', '光泽县', '11533', '5', '4', '350723', '23');
INSERT INTO `qm_region` VALUES ('12456', '松溪县', '11533', '6', '4', '350724', '24');
INSERT INTO `qm_region` VALUES ('12574', '政和县', '11533', '7', '4', '350725', '25');
INSERT INTO `qm_region` VALUES ('12716', '邵武市', '11533', '8', '4', '350781', '81');
INSERT INTO `qm_region` VALUES ('12918', '武夷山市', '11533', '9', '4', '350782', '82');
INSERT INTO `qm_region` VALUES ('13064', '建瓯市', '11533', '10', '4', '350783', '83');
INSERT INTO `qm_region` VALUES ('13336', '建阳市', '11533', '11', '4', '350784', '84');
INSERT INTO `qm_region` VALUES ('13562', '龙岩市', '2', '8', '3', '3508', '08');
INSERT INTO `qm_region` VALUES ('13563', '市辖区', '13562', '1', '4', '350801', '01');
INSERT INTO `qm_region` VALUES ('13564', '新罗区', '13562', '2', '4', '350802', '02');
INSERT INTO `qm_region` VALUES ('13912', '长汀县', '13562', '3', '4', '350821', '21');
INSERT INTO `qm_region` VALUES ('14227', '永定县', '13562', '4', '4', '350822', '22');
INSERT INTO `qm_region` VALUES ('14533', '上杭县', '13562', '5', '4', '350823', '23');
INSERT INTO `qm_region` VALUES ('14898', '武平县', '13562', '6', '4', '350824', '24');
INSERT INTO `qm_region` VALUES ('15133', '连城县', '13562', '7', '4', '350825', '25');
INSERT INTO `qm_region` VALUES ('15392', '漳平市', '13562', '8', '4', '350881', '81');
INSERT INTO `qm_region` VALUES ('15608', '宁德市　', '2', '9', '3', '3509', '09');
INSERT INTO `qm_region` VALUES ('15609', '市辖区', '15608', '1', '4', '350901', '01');
INSERT INTO `qm_region` VALUES ('15610', '蕉城区', '15608', '2', '4', '350902', '02');
INSERT INTO `qm_region` VALUES ('15934', '霞浦县', '15608', '3', '4', '350921', '21');
INSERT INTO `qm_region` VALUES ('16264', '古田县', '15608', '4', '4', '350922', '22');
INSERT INTO `qm_region` VALUES ('16568', '屏南县', '15608', '5', '4', '350923', '23');
INSERT INTO `qm_region` VALUES ('16737', '寿宁县', '15608', '6', '4', '350924', '24');
INSERT INTO `qm_region` VALUES ('16955', '周宁县', '15608', '7', '4', '350925', '25');
INSERT INTO `qm_region` VALUES ('17112', '柘荣县', '15608', '8', '4', '350926', '26');
INSERT INTO `qm_region` VALUES ('17238', '福安市', '15608', '9', '4', '350981', '81');
INSERT INTO `qm_region` VALUES ('17748', '福鼎市', '15608', '10', '4', '350982', '82');
INSERT INTO `qm_region` VALUES ('18047', '浙江省', '1', '5', '2', '33', '33');
INSERT INTO `qm_region` VALUES ('18048', '杭州市', '18047', '1', '3', '3301', '01');
INSERT INTO `qm_region` VALUES ('18049', '市辖区', '18048', '1', '4', '330101', '01');
INSERT INTO `qm_region` VALUES ('18050', '上城区', '18048', '2', '4', '330102', '02');
INSERT INTO `qm_region` VALUES ('18108', '下城区', '18048', '3', '4', '330103', '03');
INSERT INTO `qm_region` VALUES ('18187', '江干区', '18048', '4', '4', '330104', '04');
INSERT INTO `qm_region` VALUES ('18320', '拱墅区', '18048', '5', '4', '330105', '05');
INSERT INTO `qm_region` VALUES ('18417', '西湖区', '18048', '6', '4', '330106', '06');
INSERT INTO `qm_region` VALUES ('18612', '滨江区', '18048', '7', '4', '330108', '08');
INSERT INTO `qm_region` VALUES ('18651', '萧山区', '18048', '8', '4', '330109', '09');
INSERT INTO `qm_region` VALUES ('19236', '余杭区', '18048', '9', '4', '330110', '10');
INSERT INTO `qm_region` VALUES ('19574', '桐庐县', '18048', '10', '4', '330122', '22');
INSERT INTO `qm_region` VALUES ('19784', '淳安县', '18048', '11', '4', '330127', '27');
INSERT INTO `qm_region` VALUES ('20717', '建德市', '18048', '12', '4', '330182', '82');
INSERT INTO `qm_region` VALUES ('21275', '富阳市', '18048', '13', '4', '330183', '83');
INSERT INTO `qm_region` VALUES ('21935', '临安市', '18048', '14', '4', '330185', '85');
INSERT INTO `qm_region` VALUES ('22636', '宁波市', '18047', '2', '3', '3302', '02');
INSERT INTO `qm_region` VALUES ('22637', '市辖区', '22636', '1', '4', '330201', '01');
INSERT INTO `qm_region` VALUES ('22638', '海曙区', '22636', '2', '4', '330203', '03');
INSERT INTO `qm_region` VALUES ('22721', '江东区', '22636', '3', '4', '330204', '04');
INSERT INTO `qm_region` VALUES ('22801', '江北区', '22636', '4', '4', '330205', '05');
INSERT INTO `qm_region` VALUES ('22963', '北仑区', '22636', '5', '4', '330206', '06');
INSERT INTO `qm_region` VALUES ('23237', '镇海区', '22636', '6', '4', '330211', '11');
INSERT INTO `qm_region` VALUES ('23330', '鄞州区', '22636', '7', '4', '330212', '12');
INSERT INTO `qm_region` VALUES ('23841', '象山县', '22636', '8', '4', '330225', '25');
INSERT INTO `qm_region` VALUES ('24372', '宁海县', '22636', '9', '4', '330226', '26');
INSERT INTO `qm_region` VALUES ('24810', '余姚市', '22636', '10', '4', '330281', '81');
INSERT INTO `qm_region` VALUES ('25130', '慈溪市', '22636', '11', '4', '330282', '82');
INSERT INTO `qm_region` VALUES ('25496', '奉化市', '22636', '12', '4', '330283', '83');
INSERT INTO `qm_region` VALUES ('25884', '温州市', '18047', '3', '3', '3303', '03');
INSERT INTO `qm_region` VALUES ('25885', '市辖区', '25884', '1', '4', '330301', '01');
INSERT INTO `qm_region` VALUES ('25886', '鹿城区', '25884', '2', '4', '330302', '02');
INSERT INTO `qm_region` VALUES ('26198', '龙湾区', '25884', '3', '4', '330303', '03');
INSERT INTO `qm_region` VALUES ('26357', '瓯海区', '25884', '4', '4', '330304', '04');
INSERT INTO `qm_region` VALUES ('26636', '洞头县', '25884', '5', '4', '330322', '22');
INSERT INTO `qm_region` VALUES ('26736', '永嘉县', '25884', '6', '4', '330324', '24');
INSERT INTO `qm_region` VALUES ('27684', '平阳县', '25884', '7', '4', '330326', '26');
INSERT INTO `qm_region` VALUES ('28323', '苍南县', '25884', '8', '4', '330327', '27');
INSERT INTO `qm_region` VALUES ('29213', '文成县', '25884', '9', '4', '330328', '28');
INSERT INTO `qm_region` VALUES ('29639', '泰顺县', '25884', '10', '4', '330329', '29');
INSERT INTO `qm_region` VALUES ('29977', '瑞安市', '25884', '11', '4', '330381', '81');
INSERT INTO `qm_region` VALUES ('30964', '乐清市', '25884', '12', '4', '330382', '82');
INSERT INTO `qm_region` VALUES ('31894', '嘉兴市', '18047', '4', '3', '3304', '04');
INSERT INTO `qm_region` VALUES ('31895', '市辖区', '31894', '1', '4', '330401', '01');
INSERT INTO `qm_region` VALUES ('31896', '南湖区', '31894', '2', '4', '330402', '02');
INSERT INTO `qm_region` VALUES ('32055', '秀洲区', '31894', '3', '4', '330411', '11');
INSERT INTO `qm_region` VALUES ('32222', '嘉善县', '31894', '4', '4', '330421', '21');
INSERT INTO `qm_region` VALUES ('32421', '海盐县', '31894', '5', '4', '330424', '24');
INSERT INTO `qm_region` VALUES ('32557', '海宁市', '31894', '6', '4', '330481', '81');
INSERT INTO `qm_region` VALUES ('32793', '平湖市', '31894', '7', '4', '330482', '82');
INSERT INTO `qm_region` VALUES ('32984', '桐乡市', '31894', '8', '4', '330483', '83');
INSERT INTO `qm_region` VALUES ('33214', '湖州市', '18047', '5', '3', '3305', '05');
INSERT INTO `qm_region` VALUES ('33215', '市辖区', '33214', '1', '4', '330501', '01');
INSERT INTO `qm_region` VALUES ('33216', '吴兴区', '33214', '2', '4', '330502', '02');
INSERT INTO `qm_region` VALUES ('33532', '南浔区', '33214', '3', '4', '330503', '03');
INSERT INTO `qm_region` VALUES ('33791', '德清县', '33214', '4', '4', '330521', '21');
INSERT INTO `qm_region` VALUES ('33997', '长兴县', '33214', '5', '4', '330522', '22');
INSERT INTO `qm_region` VALUES ('34295', '安吉县', '33214', '6', '4', '330523', '23');
INSERT INTO `qm_region` VALUES ('34575', '绍兴市', '18047', '6', '3', '3306', '06');
INSERT INTO `qm_region` VALUES ('34576', '市辖区', '34575', '1', '4', '330601', '01');
INSERT INTO `qm_region` VALUES ('34577', '越城区', '34575', '2', '4', '330602', '02');
INSERT INTO `qm_region` VALUES ('35006', '绍兴县', '34575', '3', '4', '330621', '21');
INSERT INTO `qm_region` VALUES ('35439', '新昌县', '34575', '4', '4', '330624', '24');
INSERT INTO `qm_region` VALUES ('35888', '诸暨市', '34575', '5', '4', '330681', '81');
INSERT INTO `qm_region` VALUES ('36442', '上虞市', '34575', '6', '4', '330682', '82');
INSERT INTO `qm_region` VALUES ('36905', '嵊州市', '34575', '7', '4', '330683', '83');
INSERT INTO `qm_region` VALUES ('38035', '金华市', '18047', '7', '3', '3307', '07');
INSERT INTO `qm_region` VALUES ('38036', '市辖区', '38035', '1', '4', '330701', '01');
INSERT INTO `qm_region` VALUES ('38037', '婺城区', '38035', '2', '4', '330702', '02');
INSERT INTO `qm_region` VALUES ('38759', '金东区', '38035', '3', '4', '330703', '03');
INSERT INTO `qm_region` VALUES ('39278', '武义县', '38035', '4', '4', '330723', '23');
INSERT INTO `qm_region` VALUES ('39853', '浦江县', '38035', '5', '4', '330726', '26');
INSERT INTO `qm_region` VALUES ('40298', '磐安县', '38035', '6', '4', '330727', '27');
INSERT INTO `qm_region` VALUES ('40690', '兰溪市', '38035', '7', '4', '330781', '81');
INSERT INTO `qm_region` VALUES ('41378', '义乌市', '38035', '8', '4', '330782', '82');
INSERT INTO `qm_region` VALUES ('42195', '东阳市', '38035', '9', '4', '330783', '83');
INSERT INTO `qm_region` VALUES ('42605', '永康市', '38035', '10', '4', '330784', '84');
INSERT INTO `qm_region` VALUES ('43349', '衢州市', '18047', '8', '3', '3308', '08');
INSERT INTO `qm_region` VALUES ('43350', '市辖区', '43349', '1', '4', '330801', '01');
INSERT INTO `qm_region` VALUES ('43351', '柯城区', '43349', '2', '4', '330802', '02');
INSERT INTO `qm_region` VALUES ('43700', '衢江区', '43349', '3', '4', '330803', '03');
INSERT INTO `qm_region` VALUES ('44235', '常山县', '43349', '4', '4', '330822', '22');
INSERT INTO `qm_region` VALUES ('44599', '开化县', '43349', '5', '4', '330824', '24');
INSERT INTO `qm_region` VALUES ('45072', '龙游县', '43349', '6', '4', '330825', '25');
INSERT INTO `qm_region` VALUES ('45528', '江山市', '43349', '7', '4', '330881', '81');
INSERT INTO `qm_region` VALUES ('46108', '舟山市', '18047', '9', '3', '3309', '09');
INSERT INTO `qm_region` VALUES ('46109', '市辖区', '46108', '1', '4', '330901', '01');
INSERT INTO `qm_region` VALUES ('46110', '定海区', '46108', '2', '4', '330902', '02');
INSERT INTO `qm_region` VALUES ('46275', '普陀区', '46108', '3', '4', '330903', '03');
INSERT INTO `qm_region` VALUES ('46492', '岱山县', '46108', '4', '4', '330921', '21');
INSERT INTO `qm_region` VALUES ('46596', '嵊泗县', '46108', '5', '4', '330922', '22');
INSERT INTO `qm_region` VALUES ('46652', '台州市', '18047', '10', '3', '3310', '10');
INSERT INTO `qm_region` VALUES ('46653', '市辖区', '46652', '1', '4', '331001', '01');
INSERT INTO `qm_region` VALUES ('46654', '椒江区', '46652', '2', '4', '331002', '02');
INSERT INTO `qm_region` VALUES ('46967', '黄岩区', '46652', '3', '4', '331003', '03');
INSERT INTO `qm_region` VALUES ('47555', '路桥区', '46652', '4', '4', '331004', '04');
INSERT INTO `qm_region` VALUES ('47866', '玉环县', '46652', '5', '4', '331021', '21');
INSERT INTO `qm_region` VALUES ('48179', '三门县', '46652', '6', '4', '331022', '22');
INSERT INTO `qm_region` VALUES ('48714', '天台县', '46652', '7', '4', '331023', '23');
INSERT INTO `qm_region` VALUES ('49339', '仙居县', '46652', '8', '4', '331024', '24');
INSERT INTO `qm_region` VALUES ('50083', '温岭市', '46652', '9', '4', '331081', '81');
INSERT INTO `qm_region` VALUES ('51022', '临海市', '46652', '10', '4', '331082', '82');
INSERT INTO `qm_region` VALUES ('52064', '丽水市', '18047', '11', '3', '3311', '11');
INSERT INTO `qm_region` VALUES ('52065', '市辖区', '52064', '1', '4', '331101', '01');
INSERT INTO `qm_region` VALUES ('52066', '莲都区', '52064', '2', '4', '331102', '02');
INSERT INTO `qm_region` VALUES ('52479', '青田县', '52064', '3', '4', '331121', '21');
INSERT INTO `qm_region` VALUES ('52972', '缙云县', '52064', '4', '4', '331122', '22');
INSERT INTO `qm_region` VALUES ('53645', '遂昌县', '52064', '5', '4', '331123', '23');
INSERT INTO `qm_region` VALUES ('54063', '松阳县', '52064', '6', '4', '331124', '24');
INSERT INTO `qm_region` VALUES ('54496', '云和县', '52064', '7', '4', '331125', '25');
INSERT INTO `qm_region` VALUES ('54687', '庆元县', '52064', '8', '4', '331126', '26');
INSERT INTO `qm_region` VALUES ('55058', '景宁畲族自治县', '52064', '9', '4', '331127', '27');
INSERT INTO `qm_region` VALUES ('55370', '龙泉市', '52064', '10', '4', '331181', '81');
INSERT INTO `qm_region` VALUES ('55845', '甘肃省', '1', '16', '2', '62', '62');
INSERT INTO `qm_region` VALUES ('55846', '兰州市', '55845', '1', '3', '6201', '01');
INSERT INTO `qm_region` VALUES ('55847', '市辖区', '55846', '1', '4', '620101', '01');
INSERT INTO `qm_region` VALUES ('55848', '城关区', '55846', '2', '4', '620102', '02');
INSERT INTO `qm_region` VALUES ('56044', '七里河区', '55846', '3', '4', '620103', '03');
INSERT INTO `qm_region` VALUES ('56200', '兰州市西固区', '55846', '4', '4', '620104', '04');
INSERT INTO `qm_region` VALUES ('56336', '安宁区', '55846', '5', '4', '620105', '05');
INSERT INTO `qm_region` VALUES ('56401', '红古区', '55846', '6', '4', '620111', '11');
INSERT INTO `qm_region` VALUES ('56465', '永登县', '55846', '7', '4', '620121', '21');
INSERT INTO `qm_region` VALUES ('56735', '皋兰县', '55846', '8', '4', '620122', '22');
INSERT INTO `qm_region` VALUES ('56817', '榆中县', '55846', '9', '4', '620123', '23');
INSERT INTO `qm_region` VALUES ('57113', '嘉峪关市', '55845', '2', '3', '6202', '02');
INSERT INTO `qm_region` VALUES ('57114', '市辖', '57113', '1', '4', '620201', '01');
INSERT INTO `qm_region` VALUES ('57188', '金昌市', '55845', '3', '3', '6203', '03');
INSERT INTO `qm_region` VALUES ('57189', '市辖区', '57188', '1', '4', '620301', '01');
INSERT INTO `qm_region` VALUES ('57190', '金川区', '57188', '2', '4', '620302', '02');
INSERT INTO `qm_region` VALUES ('57252', '永昌县', '57188', '3', '4', '620321', '21');
INSERT INTO `qm_region` VALUES ('57384', '白银市', '55845', '4', '3', '6204', '04');
INSERT INTO `qm_region` VALUES ('57385', '市辖区', '57384', '1', '4', '620401', '01');
INSERT INTO `qm_region` VALUES ('57386', '白银区', '57384', '2', '4', '620402', '02');
INSERT INTO `qm_region` VALUES ('57473', '平川区', '57384', '3', '4', '620403', '03');
INSERT INTO `qm_region` VALUES ('57569', '靖远县', '57384', '4', '4', '620421', '21');
INSERT INTO `qm_region` VALUES ('57770', '会宁县', '57384', '5', '4', '620422', '22');
INSERT INTO `qm_region` VALUES ('58092', '景泰县', '57384', '6', '4', '620423', '23');
INSERT INTO `qm_region` VALUES ('58262', '天水市', '55845', '5', '3', '6205', '05');
INSERT INTO `qm_region` VALUES ('58263', '市辖区', '58262', '1', '4', '620501', '01');
INSERT INTO `qm_region` VALUES ('58264', '秦州区', '58262', '2', '4', '620502', '02');
INSERT INTO `qm_region` VALUES ('58751', '麦积区', '58262', '3', '4', '620503', '03');
INSERT INTO `qm_region` VALUES ('59179', '清水县', '58262', '4', '4', '620521', '21');
INSERT INTO `qm_region` VALUES ('59462', '秦安县', '58262', '5', '4', '620522', '22');
INSERT INTO `qm_region` VALUES ('60001', '甘谷县', '58262', '6', '4', '620523', '23');
INSERT INTO `qm_region` VALUES ('60428', '武山县', '58262', '7', '4', '620524', '24');
INSERT INTO `qm_region` VALUES ('60796', '张家川县', '58262', '8', '4', '620525', '25');
INSERT INTO `qm_region` VALUES ('61085', '武威市', '55845', '6', '3', '6206', '06');
INSERT INTO `qm_region` VALUES ('61086', '市辖区', '61085', '1', '4', '620601', '01');
INSERT INTO `qm_region` VALUES ('61087', '凉州区', '61085', '2', '4', '620602', '02');
INSERT INTO `qm_region` VALUES ('61633', '民勤县', '61085', '3', '4', '620621', '21');
INSERT INTO `qm_region` VALUES ('61925', '古浪县', '61085', '4', '4', '620622', '22');
INSERT INTO `qm_region` VALUES ('62203', '天祝县', '61085', '5', '4', '620623', '23');
INSERT INTO `qm_region` VALUES ('62415', '张掖市', '55845', '7', '3', '6207', '07');
INSERT INTO `qm_region` VALUES ('62416', '市辖区', '62415', '1', '4', '620701', '01');
INSERT INTO `qm_region` VALUES ('62417', '甘州区', '62415', '2', '4', '620702', '02');
INSERT INTO `qm_region` VALUES ('62710', '肃南裕固族自治县', '62415', '3', '4', '620721', '21');
INSERT INTO `qm_region` VALUES ('62827', '民乐县', '62415', '4', '4', '620722', '22');
INSERT INTO `qm_region` VALUES ('63057', '临泽县', '62415', '5', '4', '620723', '23');
INSERT INTO `qm_region` VALUES ('63153', '高台县', '62415', '6', '4', '620724', '24');
INSERT INTO `qm_region` VALUES ('63309', '山丹县', '62415', '7', '4', '620725', '25');
INSERT INTO `qm_region` VALUES ('63447', '平凉市', '55845', '8', '3', '6208', '08');
INSERT INTO `qm_region` VALUES ('63448', '市辖区', '63447', '1', '4', '620801', '01');
INSERT INTO `qm_region` VALUES ('63449', '崆峒区', '63447', '2', '4', '620802', '02');
INSERT INTO `qm_region` VALUES ('63737', '泾川县', '63447', '3', '4', '620821', '21');
INSERT INTO `qm_region` VALUES ('63978', '灵台县', '63447', '4', '4', '620822', '22');
INSERT INTO `qm_region` VALUES ('64182', '崇信县', '63447', '5', '4', '620823', '23');
INSERT INTO `qm_region` VALUES ('64279', '华亭县', '63447', '6', '4', '620824', '24');
INSERT INTO `qm_region` VALUES ('64418', '庄浪县', '63447', '7', '4', '620825', '25');
INSERT INTO `qm_region` VALUES ('64734', '静宁县', '63447', '8', '4', '620826', '26');
INSERT INTO `qm_region` VALUES ('65157', '酒泉市', '55845', '9', '3', '6209', '09');
INSERT INTO `qm_region` VALUES ('65158', '市辖区', '65157', '1', '4', '620901', '01');
INSERT INTO `qm_region` VALUES ('65159', '肃州区', '65157', '2', '4', '620902', '02');
INSERT INTO `qm_region` VALUES ('65340', '金塔县', '65157', '3', '4', '620921', '21');
INSERT INTO `qm_region` VALUES ('65445', '瓜州县', '65157', '4', '4', '620922', '22');
INSERT INTO `qm_region` VALUES ('65531', '肃北蒙古族自治县', '65157', '5', '4', '620923', '23');
INSERT INTO `qm_region` VALUES ('65563', '阿克塞县', '65157', '6', '4', '620924', '24');
INSERT INTO `qm_region` VALUES ('65581', '玉门市', '65157', '7', '4', '620981', '81');
INSERT INTO `qm_region` VALUES ('65668', '敦煌市', '65157', '8', '4', '620982', '82');
INSERT INTO `qm_region` VALUES ('65773', '庆阳市', '55845', '10', '3', '6210', '10');
INSERT INTO `qm_region` VALUES ('65774', '市辖区', '65773', '1', '4', '621001', '01');
INSERT INTO `qm_region` VALUES ('65775', '西峰区', '65773', '2', '4', '621002', '02');
INSERT INTO `qm_region` VALUES ('65904', '庆城县', '65773', '3', '4', '621021', '21');
INSERT INTO `qm_region` VALUES ('66079', '环县', '65773', '4', '4', '621022', '22');
INSERT INTO `qm_region` VALUES ('66354', '华池县', '65773', '5', '4', '621023', '23');
INSERT INTO `qm_region` VALUES ('66482', '合水县', '65773', '6', '4', '621024', '24');
INSERT INTO `qm_region` VALUES ('66580', '正宁县', '65773', '7', '4', '621025', '25');
INSERT INTO `qm_region` VALUES ('66686', '宁县', '65773', '8', '4', '621026', '26');
INSERT INTO `qm_region` VALUES ('66969', '镇原县', '65773', '9', '4', '621027', '27');
INSERT INTO `qm_region` VALUES ('67206', '定西市', '55845', '11', '3', '6211', '11');
INSERT INTO `qm_region` VALUES ('67207', '市辖区', '67206', '1', '4', '621101', '01');
INSERT INTO `qm_region` VALUES ('67208', '安定区', '67206', '2', '4', '621102', '02');
INSERT INTO `qm_region` VALUES ('67547', '通渭县', '67206', '3', '4', '621121', '21');
INSERT INTO `qm_region` VALUES ('67898', '陇西县', '67206', '4', '4', '621122', '22');
INSERT INTO `qm_region` VALUES ('68142', '渭源县', '67206', '5', '4', '621123', '23');
INSERT INTO `qm_region` VALUES ('68379', '临洮县', '67206', '6', '4', '621124', '24');
INSERT INTO `qm_region` VALUES ('68729', '漳县', '67206', '7', '4', '621125', '25');
INSERT INTO `qm_region` VALUES ('68880', '岷县', '67206', '8', '4', '621126', '26');
INSERT INTO `qm_region` VALUES ('69209', '陇南市', '55845', '12', '3', '6212', '12');
INSERT INTO `qm_region` VALUES ('69210', '市辖区', '69209', '1', '4', '621201', '01');
INSERT INTO `qm_region` VALUES ('69211', '武都区', '69209', '2', '4', '621202', '02');
INSERT INTO `qm_region` VALUES ('69952', '成县', '69209', '3', '4', '621221', '21');
INSERT INTO `qm_region` VALUES ('70229', '文县', '69209', '4', '4', '621222', '22');
INSERT INTO `qm_region` VALUES ('70562', '宕昌县', '69209', '5', '4', '621223', '23');
INSERT INTO `qm_region` VALUES ('70926', '康县', '69209', '6', '4', '621224', '24');
INSERT INTO `qm_region` VALUES ('71306', '西和县', '69209', '7', '4', '621225', '25');
INSERT INTO `qm_region` VALUES ('71717', '礼县', '69209', '8', '4', '621226', '26');
INSERT INTO `qm_region` VALUES ('72324', '徽县', '69209', '9', '4', '621227', '27');
INSERT INTO `qm_region` VALUES ('72595', '两当县', '69209', '10', '4', '621228', '28');
INSERT INTO `qm_region` VALUES ('72730', '临夏州', '55845', '13', '3', '6229', '29');
INSERT INTO `qm_region` VALUES ('72731', '临夏市', '72730', '1', '4', '622901', '01');
INSERT INTO `qm_region` VALUES ('72810', '临夏县', '72730', '2', '4', '622921', '21');
INSERT INTO `qm_region` VALUES ('73057', '康乐县', '72730', '3', '4', '622922', '22');
INSERT INTO `qm_region` VALUES ('73226', '永靖县', '72730', '4', '4', '622923', '23');
INSERT INTO `qm_region` VALUES ('73393', '广河县', '72730', '5', '4', '622924', '24');
INSERT INTO `qm_region` VALUES ('73506', '和政县', '72730', '6', '4', '622925', '25');
INSERT INTO `qm_region` VALUES ('73643', '东乡族自治县', '72730', '7', '4', '622926', '26');
INSERT INTO `qm_region` VALUES ('73898', '积石山县', '72730', '8', '4', '622927', '27');
INSERT INTO `qm_region` VALUES ('74067', '甘南州', '55845', '14', '3', '6230', '30');
INSERT INTO `qm_region` VALUES ('74068', '合作市', '74067', '1', '4', '623001', '01');
INSERT INTO `qm_region` VALUES ('74125', '临潭县', '74067', '2', '4', '623021', '21');
INSERT INTO `qm_region` VALUES ('74284', '卓尼县', '74067', '3', '4', '623022', '22');
INSERT INTO `qm_region` VALUES ('74401', '舟曲县', '74067', '4', '4', '623023', '23');
INSERT INTO `qm_region` VALUES ('74634', '迭部县', '74067', '5', '4', '623024', '24');
INSERT INTO `qm_region` VALUES ('74700', '玛曲县', '74067', '6', '4', '623025', '25');
INSERT INTO `qm_region` VALUES ('74753', '碌曲县', '74067', '7', '4', '623026', '26');
INSERT INTO `qm_region` VALUES ('74790', '夏河县', '74067', '8', '4', '623027', '27');
INSERT INTO `qm_region` VALUES ('74873', '北京市', '1', '1', '2', '11', '11');
INSERT INTO `qm_region` VALUES ('74874', '市辖区', '74873', '1', '3', '1101', '01');
INSERT INTO `qm_region` VALUES ('74875', '东城区', '74874', '1', '4', '110101', '01');
INSERT INTO `qm_region` VALUES ('75012', '西城区', '74874', '2', '4', '110102', '02');
INSERT INTO `qm_region` VALUES ('75172', '崇文区', '74874', '3', '4', '110103', '03');
INSERT INTO `qm_region` VALUES ('75265', '宣武区', '74874', '4', '4', '110104', '04');
INSERT INTO `qm_region` VALUES ('75383', '朝阳区', '74874', '5', '4', '110105', '05');
INSERT INTO `qm_region` VALUES ('75976', '丰台区', '74874', '6', '4', '110106', '06');
INSERT INTO `qm_region` VALUES ('76330', '石景山区', '74874', '7', '4', '110107', '07');
INSERT INTO `qm_region` VALUES ('76468', '海淀区', '74874', '8', '4', '110108', '08');
INSERT INTO `qm_region` VALUES ('77147', '门头沟区', '74874', '9', '4', '110109', '09');
INSERT INTO `qm_region` VALUES ('77433', '房山区', '74874', '10', '4', '110111', '11');
INSERT INTO `qm_region` VALUES ('78031', '通州区', '74874', '11', '4', '110112', '12');
INSERT INTO `qm_region` VALUES ('78596', '顺义区', '74874', '12', '4', '110113', '13');
INSERT INTO `qm_region` VALUES ('79113', '昌平区', '74874', '13', '4', '110114', '14');
INSERT INTO `qm_region` VALUES ('79579', '大兴区', '74874', '14', '4', '110115', '15');
INSERT INTO `qm_region` VALUES ('80223', '怀柔区', '74874', '15', '4', '110116', '16');
INSERT INTO `qm_region` VALUES ('80553', '平谷区', '74874', '16', '4', '110117', '17');
INSERT INTO `qm_region` VALUES ('80873', '密云县', '74874', '1', '4', '110228', '28');
INSERT INTO `qm_region` VALUES ('81293', '延庆县', '74874', '2', '4', '110229', '29');
INSERT INTO `qm_region` VALUES ('81714', '安徽省', '1', '11', '2', '34', '34');
INSERT INTO `qm_region` VALUES ('81715', '合肥市', '81714', '1', '3', '3401', '01');
INSERT INTO `qm_region` VALUES ('81716', '市辖区', '81715', '1', '4', '340101', '01');
INSERT INTO `qm_region` VALUES ('81717', '瑶海区', '81715', '2', '4', '340102', '02');
INSERT INTO `qm_region` VALUES ('81834', '庐阳区', '81715', '3', '4', '340103', '03');
INSERT INTO `qm_region` VALUES ('81949', '蜀山区', '81715', '4', '4', '340104', '04');
INSERT INTO `qm_region` VALUES ('82064', '包河区', '81715', '5', '4', '340111', '11');
INSERT INTO `qm_region` VALUES ('82189', '长丰县', '81715', '6', '4', '340121', '21');
INSERT INTO `qm_region` VALUES ('82509', '肥东县', '81715', '7', '4', '340122', '22');
INSERT INTO `qm_region` VALUES ('83059', '肥西县', '81715', '8', '4', '340123', '23');
INSERT INTO `qm_region` VALUES ('83410', '芜湖市', '81714', '2', '3', '3402', '02');
INSERT INTO `qm_region` VALUES ('83411', '市辖区', '83410', '1', '4', '340201', '01');
INSERT INTO `qm_region` VALUES ('83412', '镜湖区', '83410', '2', '4', '340202', '02');
INSERT INTO `qm_region` VALUES ('83485', '弋江区', '83410', '3', '4', '340203', '03');
INSERT INTO `qm_region` VALUES ('83547', '鸠江区', '83410', '4', '4', '340207', '07');
INSERT INTO `qm_region` VALUES ('83626', '三山区', '83410', '5', '4', '340208', '08');
INSERT INTO `qm_region` VALUES ('83674', '芜湖县', '83410', '6', '4', '340221', '21');
INSERT INTO `qm_region` VALUES ('83821', '繁昌县', '83410', '7', '4', '340222', '22');
INSERT INTO `qm_region` VALUES ('83929', '南陵县', '83410', '8', '4', '340223', '23');
INSERT INTO `qm_region` VALUES ('84117', '蚌埠市', '81714', '3', '3', '3403', '03');
INSERT INTO `qm_region` VALUES ('84118', '市辖区', '84117', '1', '4', '340301', '01');
INSERT INTO `qm_region` VALUES ('84119', '龙子湖区', '84117', '2', '4', '340302', '02');
INSERT INTO `qm_region` VALUES ('84203', '蚌山区', '84117', '3', '4', '340303', '03');
INSERT INTO `qm_region` VALUES ('84288', '禹会区', '84117', '4', '4', '340304', '04');
INSERT INTO `qm_region` VALUES ('84376', '淮上区', '84117', '5', '4', '340311', '11');
INSERT INTO `qm_region` VALUES ('84437', '怀远县', '84117', '6', '4', '340321', '21');
INSERT INTO `qm_region` VALUES ('84862', '五河县', '84117', '7', '4', '340322', '22');
INSERT INTO `qm_region` VALUES ('85115', '固镇县', '84117', '8', '4', '340323', '23');
INSERT INTO `qm_region` VALUES ('85357', '淮南市', '81714', '4', '3', '3404', '04');
INSERT INTO `qm_region` VALUES ('85358', '市辖区', '85357', '1', '4', '340401', '01');
INSERT INTO `qm_region` VALUES ('85359', '大通区', '85357', '2', '4', '340402', '02');
INSERT INTO `qm_region` VALUES ('85434', '田家庵区', '85357', '3', '4', '340403', '03');
INSERT INTO `qm_region` VALUES ('85563', '谢家集区', '85357', '4', '4', '340404', '04');
INSERT INTO `qm_region` VALUES ('85677', '八公山区', '85357', '5', '4', '340405', '05');
INSERT INTO `qm_region` VALUES ('85730', '潘集区', '85357', '6', '4', '340406', '06');
INSERT INTO `qm_region` VALUES ('85919', '凤台县', '85357', '7', '4', '340421', '21');
INSERT INTO `qm_region` VALUES ('86235', '马鞍山市', '81714', '5', '3', '3405', '05');
INSERT INTO `qm_region` VALUES ('86236', '市辖区', '86235', '1', '4', '340501', '01');
INSERT INTO `qm_region` VALUES ('86237', '金家庄区', '86235', '2', '4', '340502', '02');
INSERT INTO `qm_region` VALUES ('86279', '花山区', '86235', '3', '4', '340503', '03');
INSERT INTO `qm_region` VALUES ('86334', '雨山区', '86235', '4', '4', '340504', '04');
INSERT INTO `qm_region` VALUES ('86407', '当涂县', '86235', '5', '4', '340521', '21');
INSERT INTO `qm_region` VALUES ('86640', '淮北市', '81714', '6', '3', '3406', '06');
INSERT INTO `qm_region` VALUES ('86641', '市辖区', '86640', '1', '4', '340601', '01');
INSERT INTO `qm_region` VALUES ('86642', '杜集区', '86640', '2', '4', '340602', '02');
INSERT INTO `qm_region` VALUES ('86759', '相山区', '86640', '3', '4', '340603', '03');
INSERT INTO `qm_region` VALUES ('86873', '烈山区', '86640', '4', '4', '340604', '04');
INSERT INTO `qm_region` VALUES ('87006', '濉溪县', '86640', '5', '4', '340621', '21');
INSERT INTO `qm_region` VALUES ('87460', '铜陵市', '81714', '7', '3', '3407', '07');
INSERT INTO `qm_region` VALUES ('87461', '市辖区', '87460', '1', '4', '340701', '01');
INSERT INTO `qm_region` VALUES ('87462', '铜官山区', '87460', '2', '4', '340702', '02');
INSERT INTO `qm_region` VALUES ('87529', '狮子山区', '87460', '3', '4', '340703', '03');
INSERT INTO `qm_region` VALUES ('87573', '铜陵市郊区', '87460', '4', '4', '340711', '11');
INSERT INTO `qm_region` VALUES ('87622', '铜陵县', '87460', '5', '4', '340721', '21');
INSERT INTO `qm_region` VALUES ('87753', '安庆市', '81714', '8', '3', '3408', '08');
INSERT INTO `qm_region` VALUES ('87754', '市辖区', '87753', '1', '4', '340801', '01');
INSERT INTO `qm_region` VALUES ('87755', '迎江区', '87753', '2', '4', '340802', '02');
INSERT INTO `qm_region` VALUES ('87836', '大观区', '87753', '3', '4', '340803', '03');
INSERT INTO `qm_region` VALUES ('87929', '宜秀区', '87753', '4', '4', '340811', '11');
INSERT INTO `qm_region` VALUES ('88021', '怀宁县', '87753', '5', '4', '340822', '22');
INSERT INTO `qm_region` VALUES ('88283', '枞阳县', '87753', '6', '4', '340823', '23');
INSERT INTO `qm_region` VALUES ('88564', '潜山县', '87753', '7', '4', '340824', '24');
INSERT INTO `qm_region` VALUES ('88767', '太湖县', '87753', '8', '4', '340825', '25');
INSERT INTO `qm_region` VALUES ('88967', '宿松县', '87753', '9', '4', '340826', '26');
INSERT INTO `qm_region` VALUES ('89212', '望江县', '87753', '10', '4', '340827', '27');
INSERT INTO `qm_region` VALUES ('89361', '岳西县', '87753', '11', '4', '340828', '28');
INSERT INTO `qm_region` VALUES ('89574', '桐城市', '87753', '12', '4', '340881', '81');
INSERT INTO `qm_region` VALUES ('89828', '黄山市', '81714', '9', '3', '3410', '10');
INSERT INTO `qm_region` VALUES ('89829', '市辖区', '89828', '1', '4', '341001', '01');
INSERT INTO `qm_region` VALUES ('89830', '屯溪区', '89828', '2', '4', '341002', '02');
INSERT INTO `qm_region` VALUES ('89911', '黄山区', '89828', '3', '4', '341003', '03');
INSERT INTO `qm_region` VALUES ('90055', '徽州区', '89828', '4', '4', '341004', '04');
INSERT INTO `qm_region` VALUES ('90136', '歙县', '89828', '5', '4', '341021', '21');
INSERT INTO `qm_region` VALUES ('90603', '休宁县', '89828', '6', '4', '341022', '22');
INSERT INTO `qm_region` VALUES ('90892', '黟县', '89828', '7', '4', '341023', '23');
INSERT INTO `qm_region` VALUES ('90987', '祁门县', '89828', '8', '4', '341024', '24');
INSERT INTO `qm_region` VALUES ('91164', '滁州市', '81714', '10', '3', '3411', '11');
INSERT INTO `qm_region` VALUES ('91165', '市辖区', '91164', '1', '4', '341101', '01');
INSERT INTO `qm_region` VALUES ('91166', '琅琊区', '91164', '2', '4', '341102', '02');
INSERT INTO `qm_region` VALUES ('91241', '南谯区', '91164', '3', '4', '341103', '03');
INSERT INTO `qm_region` VALUES ('91431', '来安县', '91164', '4', '4', '341122', '22');
INSERT INTO `qm_region` VALUES ('91755', '全椒县', '91164', '5', '4', '341124', '24');
INSERT INTO `qm_region` VALUES ('91999', '定远县', '91164', '6', '4', '341125', '25');
INSERT INTO `qm_region` VALUES ('92597', '凤阳县', '91164', '7', '4', '341126', '26');
INSERT INTO `qm_region` VALUES ('93057', '天长市', '91164', '8', '4', '341181', '81');
INSERT INTO `qm_region` VALUES ('93462', '明光市', '91164', '9', '4', '341182', '82');
INSERT INTO `qm_region` VALUES ('93856', '阜阳市', '81714', '11', '3', '3412', '12');
INSERT INTO `qm_region` VALUES ('93857', '市辖区', '93856', '1', '4', '341201', '01');
INSERT INTO `qm_region` VALUES ('93858', '颍州区', '93856', '2', '4', '341202', '02');
INSERT INTO `qm_region` VALUES ('94060', '颍东区', '93856', '3', '4', '341203', '03');
INSERT INTO `qm_region` VALUES ('94196', '颍泉区', '93856', '4', '4', '341204', '04');
INSERT INTO `qm_region` VALUES ('94329', '临泉县', '93856', '5', '4', '341221', '21');
INSERT INTO `qm_region` VALUES ('95203', '太和县', '93856', '6', '4', '341222', '22');
INSERT INTO `qm_region` VALUES ('95547', '阜南县', '93856', '7', '4', '341225', '25');
INSERT INTO `qm_region` VALUES ('95925', '颍上县', '93856', '8', '4', '341226', '26');
INSERT INTO `qm_region` VALUES ('96304', '界首市', '93856', '9', '4', '341282', '82');
INSERT INTO `qm_region` VALUES ('96503', '宿州市', '81714', '12', '3', '3413', '13');
INSERT INTO `qm_region` VALUES ('96504', '市辖区', '96503', '1', '4', '341301', '01');
INSERT INTO `qm_region` VALUES ('96505', '墉桥区', '96503', '2', '4', '341302', '02');
INSERT INTO `qm_region` VALUES ('97412', '砀山县', '96503', '3', '4', '341321', '21');
INSERT INTO `qm_region` VALUES ('97821', '萧县', '96503', '4', '4', '341322', '22');
INSERT INTO `qm_region` VALUES ('98558', '灵璧县', '96503', '5', '4', '341323', '23');
INSERT INTO `qm_region` VALUES ('98905', '泗县', '96503', '6', '4', '341324', '24');
INSERT INTO `qm_region` VALUES ('99394', '巢湖市', '81714', '13', '3', '3414', '14');
INSERT INTO `qm_region` VALUES ('99395', '市辖区', '99394', '1', '4', '341401', '01');
INSERT INTO `qm_region` VALUES ('99396', '居巢区', '99394', '2', '4', '341402', '02');
INSERT INTO `qm_region` VALUES ('99619', '庐江县', '99394', '3', '4', '341421', '21');
INSERT INTO `qm_region` VALUES ('99876', '无为县', '99394', '4', '4', '341422', '22');
INSERT INTO `qm_region` VALUES ('100221', '含山县', '99394', '5', '4', '341423', '23');
INSERT INTO `qm_region` VALUES ('100347', '和县', '99394', '6', '4', '341424', '24');
INSERT INTO `qm_region` VALUES ('100497', '六安市', '81714', '14', '3', '3415', '15');
INSERT INTO `qm_region` VALUES ('100498', '市辖区', '100497', '1', '4', '341501', '01');
INSERT INTO `qm_region` VALUES ('100499', '金安区', '100497', '2', '4', '341502', '02');
INSERT INTO `qm_region` VALUES ('100858', '裕安区', '100497', '3', '4', '341503', '03');
INSERT INTO `qm_region` VALUES ('101182', '寿县', '100497', '4', '4', '341521', '21');
INSERT INTO `qm_region` VALUES ('101833', '霍邱县', '100497', '5', '4', '341522', '22');
INSERT INTO `qm_region` VALUES ('102650', '舒城县', '100497', '6', '4', '341523', '23');
INSERT INTO `qm_region` VALUES ('103094', '金寨县', '100497', '7', '4', '341524', '24');
INSERT INTO `qm_region` VALUES ('103556', '霍山县', '100497', '8', '4', '341525', '25');
INSERT INTO `qm_region` VALUES ('103717', '亳州市', '81714', '15', '3', '3416', '16');
INSERT INTO `qm_region` VALUES ('103718', '市辖区', '103717', '1', '4', '341601', '01');
INSERT INTO `qm_region` VALUES ('103719', '谯城区', '103717', '2', '4', '341602', '02');
INSERT INTO `qm_region` VALUES ('104425', '涡阳县', '103717', '3', '4', '341621', '21');
INSERT INTO `qm_region` VALUES ('104848', '蒙城县', '103717', '4', '4', '341622', '22');
INSERT INTO `qm_region` VALUES ('105199', '利辛县', '103717', '5', '4', '341623', '23');
INSERT INTO `qm_region` VALUES ('105719', '池州市', '81714', '16', '3', '3417', '17');
INSERT INTO `qm_region` VALUES ('105720', '市辖区', '105719', '1', '4', '341701', '01');
INSERT INTO `qm_region` VALUES ('105721', '贵池区', '105719', '2', '4', '341702', '02');
INSERT INTO `qm_region` VALUES ('106049', '东至县', '105719', '3', '4', '341721', '21');
INSERT INTO `qm_region` VALUES ('106344', '石台县', '105719', '4', '4', '341722', '22');
INSERT INTO `qm_region` VALUES ('106490', '青阳县', '105719', '5', '4', '341723', '23');
INSERT INTO `qm_region` VALUES ('106680', '宣城市', '81714', '17', '3', '3418', '18');
INSERT INTO `qm_region` VALUES ('106681', '市辖区', '106680', '1', '4', '341801', '01');
INSERT INTO `qm_region` VALUES ('106682', '宣州区', '106680', '2', '4', '341802', '02');
INSERT INTO `qm_region` VALUES ('106946', '郎溪县', '106680', '3', '4', '341821', '21');
INSERT INTO `qm_region` VALUES ('107072', '广德县', '106680', '4', '4', '341822', '22');
INSERT INTO `qm_region` VALUES ('107235', '泾县', '106680', '5', '4', '341823', '23');
INSERT INTO `qm_region` VALUES ('107392', '绩溪县', '106680', '6', '4', '341824', '24');
INSERT INTO `qm_region` VALUES ('107484', '旌德县', '106680', '7', '4', '341825', '25');
INSERT INTO `qm_region` VALUES ('107563', '宁国市', '106680', '8', '4', '341881', '81');
INSERT INTO `qm_region` VALUES ('107712', '广东省', '1', '6', '2', '44', '44');
INSERT INTO `qm_region` VALUES ('107713', '广州市', '107712', '1', '3', '4401', '01');
INSERT INTO `qm_region` VALUES ('107714', '荔湾区', '107713', '1', '4', '440103', '03');
INSERT INTO `qm_region` VALUES ('107931', '越秀区', '107713', '2', '4', '440104', '04');
INSERT INTO `qm_region` VALUES ('108238', '海珠区', '107713', '3', '4', '440105', '05');
INSERT INTO `qm_region` VALUES ('108514', '天河区', '107713', '4', '4', '440106', '06');
INSERT INTO `qm_region` VALUES ('108724', '白云区', '107713', '5', '4', '440111', '11');
INSERT INTO `qm_region` VALUES ('109096', '黄埔区', '107713', '6', '4', '440112', '12');
INSERT INTO `qm_region` VALUES ('109163', '番禺区', '107713', '7', '4', '440113', '13');
INSERT INTO `qm_region` VALUES ('109505', '花都区', '107713', '8', '4', '440114', '14');
INSERT INTO `qm_region` VALUES ('109747', '南沙区', '107713', '9', '4', '440115', '15');
INSERT INTO `qm_region` VALUES ('109828', '萝岗区', '107713', '10', '4', '440116', '16');
INSERT INTO `qm_region` VALUES ('109892', '增城市', '107713', '11', '4', '440183', '83');
INSERT INTO `qm_region` VALUES ('110221', '从化市', '107713', '12', '4', '440184', '84');
INSERT INTO `qm_region` VALUES ('110501', '韶关市', '107712', '2', '3', '4402', '02');
INSERT INTO `qm_region` VALUES ('110502', '武江区', '110501', '1', '4', '440203', '03');
INSERT INTO `qm_region` VALUES ('110589', '浈江区', '110501', '2', '4', '440204', '04');
INSERT INTO `qm_region` VALUES ('110714', '曲江区', '110501', '3', '4', '440205', '05');
INSERT INTO `qm_region` VALUES ('110836', '始兴县', '110501', '4', '4', '440222', '22');
INSERT INTO `qm_region` VALUES ('110976', '仁化县', '110501', '5', '4', '440224', '24');
INSERT INTO `qm_region` VALUES ('111111', '翁源县', '110501', '6', '4', '440229', '29');
INSERT INTO `qm_region` VALUES ('111294', '乳源瑶族自治县', '110501', '7', '4', '440232', '32');
INSERT INTO `qm_region` VALUES ('111423', '新丰县', '110501', '8', '4', '440233', '33');
INSERT INTO `qm_region` VALUES ('111586', '乐昌市', '110501', '9', '4', '440281', '81');
INSERT INTO `qm_region` VALUES ('111832', '南雄市', '110501', '10', '4', '440282', '82');
INSERT INTO `qm_region` VALUES ('112083', '深圳市', '107712', '3', '3', '4403', '03');
INSERT INTO `qm_region` VALUES ('112084', '罗湖区', '112083', '1', '4', '440303', '03');
INSERT INTO `qm_region` VALUES ('112210', '福田区', '112083', '2', '4', '440304', '04');
INSERT INTO `qm_region` VALUES ('112313', '南山区', '112083', '3', '4', '440305', '05');
INSERT INTO `qm_region` VALUES ('112420', '宝安区', '112083', '4', '4', '440306', '06');
INSERT INTO `qm_region` VALUES ('112608', '龙岗区', '112083', '5', '4', '440307', '07');
INSERT INTO `qm_region` VALUES ('112771', '盐田区', '112083', '6', '4', '440308', '08');
INSERT INTO `qm_region` VALUES ('112797', '珠海市', '107712', '4', '3', '4404', '04');
INSERT INTO `qm_region` VALUES ('112798', '香洲区', '112797', '1', '4', '440402', '02');
INSERT INTO `qm_region` VALUES ('112949', '斗门区', '112797', '2', '4', '440403', '03');
INSERT INTO `qm_region` VALUES ('113080', '金湾区', '112797', '3', '4', '440404', '04');
INSERT INTO `qm_region` VALUES ('113125', '汕头市', '107712', '5', '3', '4405', '05');
INSERT INTO `qm_region` VALUES ('113126', '龙湖区', '113125', '1', '4', '440507', '07');
INSERT INTO `qm_region` VALUES ('113244', '金平区', '113125', '2', '4', '440511', '11');
INSERT INTO `qm_region` VALUES ('113422', '濠江区', '113125', '3', '4', '440512', '12');
INSERT INTO `qm_region` VALUES ('113490', '潮阳区', '113125', '4', '4', '440513', '13');
INSERT INTO `qm_region` VALUES ('113775', '潮南区', '113125', '5', '4', '440514', '14');
INSERT INTO `qm_region` VALUES ('114019', '澄海区', '113125', '6', '4', '440515', '15');
INSERT INTO `qm_region` VALUES ('114205', '南澳县', '113125', '7', '4', '440523', '23');
INSERT INTO `qm_region` VALUES ('114247', '佛山市', '107712', '6', '3', '4406', '06');
INSERT INTO `qm_region` VALUES ('114248', '禅城区', '114247', '1', '4', '440604', '04');
INSERT INTO `qm_region` VALUES ('114394', '南海区', '114247', '2', '4', '440605', '05');
INSERT INTO `qm_region` VALUES ('114698', '顺德区', '114247', '3', '4', '440606', '06');
INSERT INTO `qm_region` VALUES ('114907', '三水区', '114247', '4', '4', '440607', '07');
INSERT INTO `qm_region` VALUES ('114992', '高明区', '114247', '5', '4', '440608', '08');
INSERT INTO `qm_region` VALUES ('115077', '江门市', '107712', '7', '3', '4407', '07');
INSERT INTO `qm_region` VALUES ('115078', '蓬江区', '115077', '1', '4', '440703', '03');
INSERT INTO `qm_region` VALUES ('115227', '江海区', '115077', '2', '4', '440704', '04');
INSERT INTO `qm_region` VALUES ('115298', '新会区', '115077', '3', '4', '440705', '05');
INSERT INTO `qm_region` VALUES ('115540', '台山市', '115077', '4', '4', '440781', '81');
INSERT INTO `qm_region` VALUES ('115872', '开平市', '115077', '5', '4', '440783', '83');
INSERT INTO `qm_region` VALUES ('116160', '鹤山市', '115077', '6', '4', '440784', '84');
INSERT INTO `qm_region` VALUES ('116315', '恩平市', '115077', '7', '4', '440785', '85');
INSERT INTO `qm_region` VALUES ('116502', '湛江市', '107712', '8', '3', '4408', '08');
INSERT INTO `qm_region` VALUES ('116503', '湛江市赤坎区', '116502', '1', '4', '440802', '02');
INSERT INTO `qm_region` VALUES ('116550', '湛江市霞山区', '116502', '2', '4', '440803', '03');
INSERT INTO `qm_region` VALUES ('116643', '湛江市坡头区', '116502', '3', '4', '440804', '04');
INSERT INTO `qm_region` VALUES ('116720', '湛江市麻章区', '116502', '4', '4', '440811', '11');
INSERT INTO `qm_region` VALUES ('116845', '遂溪县', '116502', '5', '4', '440823', '23');
INSERT INTO `qm_region` VALUES ('117128', '徐闻县', '116502', '6', '4', '440825', '25');
INSERT INTO `qm_region` VALUES ('117353', '廉江市', '116502', '7', '4', '440881', '81');
INSERT INTO `qm_region` VALUES ('117764', '雷州市', '116502', '8', '4', '440882', '82');
INSERT INTO `qm_region` VALUES ('118264', '吴川市', '116502', '9', '4', '440883', '83');
INSERT INTO `qm_region` VALUES ('118472', '茂名市', '107712', '9', '3', '4409', '09');
INSERT INTO `qm_region` VALUES ('118473', '茂南区', '118472', '1', '4', '440902', '02');
INSERT INTO `qm_region` VALUES ('118702', '茂港区', '118472', '2', '4', '440903', '03');
INSERT INTO `qm_region` VALUES ('118813', '电白县', '118472', '3', '4', '440923', '23');
INSERT INTO `qm_region` VALUES ('119159', '高州市', '118472', '4', '4', '440981', '81');
INSERT INTO `qm_region` VALUES ('119680', '化州市', '118472', '5', '4', '440982', '82');
INSERT INTO `qm_region` VALUES ('120083', '信宜市', '118472', '6', '4', '440983', '83');
INSERT INTO `qm_region` VALUES ('120491', '肇庆市', '107712', '10', '3', '4412', '12');
INSERT INTO `qm_region` VALUES ('120492', '端州区', '120491', '1', '4', '441202', '02');
INSERT INTO `qm_region` VALUES ('120585', '鼎湖区', '120491', '2', '4', '441203', '03');
INSERT INTO `qm_region` VALUES ('120676', '广宁县', '120491', '3', '4', '441223', '23');
INSERT INTO `qm_region` VALUES ('120872', '怀集县', '120491', '4', '4', '441224', '24');
INSERT INTO `qm_region` VALUES ('121216', '封开县', '120491', '5', '4', '441225', '25');
INSERT INTO `qm_region` VALUES ('121432', '德庆县', '120491', '6', '4', '441226', '26');
INSERT INTO `qm_region` VALUES ('121625', '高要市', '120491', '7', '4', '441283', '83');
INSERT INTO `qm_region` VALUES ('121993', '四会市', '120491', '8', '4', '441284', '84');
INSERT INTO `qm_region` VALUES ('122170', '惠州市', '107712', '11', '3', '4413', '13');
INSERT INTO `qm_region` VALUES ('122171', '惠城区', '122170', '1', '4', '441302', '02');
INSERT INTO `qm_region` VALUES ('122452', '惠阳区', '122170', '2', '4', '441303', '03');
INSERT INTO `qm_region` VALUES ('122625', '博罗县', '122170', '3', '4', '441322', '22');
INSERT INTO `qm_region` VALUES ('123021', '惠东县', '122170', '4', '4', '441323', '23');
INSERT INTO `qm_region` VALUES ('123329', '龙门县', '122170', '5', '4', '441324', '24');
INSERT INTO `qm_region` VALUES ('123530', '梅州市', '107712', '12', '3', '4414', '14');
INSERT INTO `qm_region` VALUES ('123531', '梅江区', '123530', '1', '4', '441402', '02');
INSERT INTO `qm_region` VALUES ('123630', '梅县', '123530', '2', '4', '441421', '21');
INSERT INTO `qm_region` VALUES ('124070', '大埔县', '123530', '3', '4', '441422', '22');
INSERT INTO `qm_region` VALUES ('124344', '丰顺县', '123530', '4', '4', '441423', '23');
INSERT INTO `qm_region` VALUES ('124643', '五华县', '123530', '5', '4', '441424', '24');
INSERT INTO `qm_region` VALUES ('125105', '平远县', '123530', '6', '4', '441426', '26');
INSERT INTO `qm_region` VALUES ('125261', '蕉岭县', '123530', '7', '4', '441427', '27');
INSERT INTO `qm_region` VALUES ('125385', '兴宁市', '123530', '8', '4', '441481', '81');
INSERT INTO `qm_region` VALUES ('125908', '汕尾市', '107712', '13', '3', '4415', '15');
INSERT INTO `qm_region` VALUES ('125909', '市辖区', '125908', '1', '4', '441501', '01');
INSERT INTO `qm_region` VALUES ('125910', '城区', '125908', '2', '4', '441502', '02');
INSERT INTO `qm_region` VALUES ('126042', '海丰县', '125908', '3', '4', '441521', '21');
INSERT INTO `qm_region` VALUES ('126342', '陆河县', '125908', '4', '4', '441523', '23');
INSERT INTO `qm_region` VALUES ('126478', '陆丰市', '125908', '5', '4', '441581', '81');
INSERT INTO `qm_region` VALUES ('126854', '河源市', '107712', '14', '3', '4416', '16');
INSERT INTO `qm_region` VALUES ('126855', '源城区', '126854', '1', '4', '441602', '02');
INSERT INTO `qm_region` VALUES ('126926', '紫金县', '126854', '2', '4', '441621', '21');
INSERT INTO `qm_region` VALUES ('127245', '龙川县', '126854', '3', '4', '441622', '22');
INSERT INTO `qm_region` VALUES ('127623', '连平县', '126854', '4', '4', '441623', '23');
INSERT INTO `qm_region` VALUES ('127811', '和平县', '126854', '5', '4', '441624', '24');
INSERT INTO `qm_region` VALUES ('128068', '东源县', '126854', '6', '4', '441625', '25');
INSERT INTO `qm_region` VALUES ('128373', '阳江市', '107712', '15', '3', '4417', '17');
INSERT INTO `qm_region` VALUES ('128374', '江城区', '128373', '1', '4', '441702', '02');
INSERT INTO `qm_region` VALUES ('128548', '阳西县', '128373', '2', '4', '441721', '21');
INSERT INTO `qm_region` VALUES ('128710', '阳东县', '128373', '3', '4', '441723', '23');
INSERT INTO `qm_region` VALUES ('128909', '阳春市', '128373', '4', '4', '441781', '81');
INSERT INTO `qm_region` VALUES ('129281', '清远市', '107712', '16', '3', '4418', '18');
INSERT INTO `qm_region` VALUES ('129282', '清城区', '129281', '1', '4', '441802', '02');
INSERT INTO `qm_region` VALUES ('129414', '佛冈县', '129281', '2', '4', '441821', '21');
INSERT INTO `qm_region` VALUES ('129511', '阳山县', '129281', '3', '4', '441823', '23');
INSERT INTO `qm_region` VALUES ('129692', '连山县', '129281', '4', '4', '441825', '25');
INSERT INTO `qm_region` VALUES ('129754', '连南瑶族自治县', '129281', '5', '4', '441826', '26');
INSERT INTO `qm_region` VALUES ('129833', '清新县', '129281', '6', '4', '441827', '27');
INSERT INTO `qm_region` VALUES ('130076', '英德市', '129281', '7', '4', '441881', '81');
INSERT INTO `qm_region` VALUES ('130402', '连州市', '129281', '8', '4', '441882', '82');
INSERT INTO `qm_region` VALUES ('130588', '东莞市', '107712', '17', '3', '4419', '19');
INSERT INTO `qm_region` VALUES ('131230', '中山市', '107712', '18', '3', '4420', '20');
INSERT INTO `qm_region` VALUES ('131531', '潮州市', '107712', '19', '3', '4451', '51');
INSERT INTO `qm_region` VALUES ('131532', '潮州市湘桥区', '131531', '1', '4', '445102', '02');
INSERT INTO `qm_region` VALUES ('131647', '潮州市潮安县', '131531', '2', '4', '445121', '21');
INSERT INTO `qm_region` VALUES ('132195', '潮州市饶平县', '131531', '3', '4', '445122', '22');
INSERT INTO `qm_region` VALUES ('132632', '揭阳市', '107712', '20', '3', '4452', '52');
INSERT INTO `qm_region` VALUES ('132633', '榕城区', '132632', '1', '4', '445202', '02');
INSERT INTO `qm_region` VALUES ('132808', '揭东县', '132632', '2', '4', '445221', '21');
INSERT INTO `qm_region` VALUES ('133072', '揭西县', '132632', '3', '4', '445222', '22');
INSERT INTO `qm_region` VALUES ('133420', '惠来县', '132632', '4', '4', '445224', '24');
INSERT INTO `qm_region` VALUES ('133770', '普宁市', '132632', '5', '4', '445281', '81');
INSERT INTO `qm_region` VALUES ('134374', '云浮市', '107712', '21', '3', '4453', '53');
INSERT INTO `qm_region` VALUES ('134375', '云城区', '134374', '1', '4', '445302', '02');
INSERT INTO `qm_region` VALUES ('134494', '新兴县', '134374', '2', '4', '445321', '21');
INSERT INTO `qm_region` VALUES ('134712', '郁南县', '134374', '3', '4', '445322', '22');
INSERT INTO `qm_region` VALUES ('134938', '云安县', '134374', '4', '4', '445323', '23');
INSERT INTO `qm_region` VALUES ('135067', '罗定市', '134374', '5', '4', '445381', '81');
INSERT INTO `qm_region` VALUES ('135425', '广西', '1', '7', '2', '45', '45');
INSERT INTO `qm_region` VALUES ('135426', '南宁市', '135425', '1', '3', '4501', '01');
INSERT INTO `qm_region` VALUES ('135427', '市辖区', '135426', '1', '4', '450101', '01');
INSERT INTO `qm_region` VALUES ('135428', '兴宁区', '135426', '2', '4', '450102', '02');
INSERT INTO `qm_region` VALUES ('135509', '青秀区', '135426', '3', '4', '450103', '03');
INSERT INTO `qm_region` VALUES ('135623', '江南区', '135426', '4', '4', '450105', '05');
INSERT INTO `qm_region` VALUES ('135729', '西乡塘区', '135426', '5', '4', '450107', '07');
INSERT INTO `qm_region` VALUES ('135900', '良庆区', '135426', '6', '4', '450108', '08');
INSERT INTO `qm_region` VALUES ('135977', '邕宁区', '135426', '7', '4', '450109', '09');
INSERT INTO `qm_region` VALUES ('136057', '武鸣县', '135426', '8', '4', '450122', '22');
INSERT INTO `qm_region` VALUES ('136313', '隆安县', '135426', '9', '4', '450123', '23');
INSERT INTO `qm_region` VALUES ('136470', '马山县', '135426', '10', '4', '450124', '24');
INSERT INTO `qm_region` VALUES ('136635', '上林县', '135426', '11', '4', '450125', '25');
INSERT INTO `qm_region` VALUES ('136778', '宾阳县', '135426', '12', '4', '450126', '26');
INSERT INTO `qm_region` VALUES ('137031', '横县', '135426', '13', '4', '450127', '27');
INSERT INTO `qm_region` VALUES ('137369', '柳州市', '135425', '2', '3', '4502', '02');
INSERT INTO `qm_region` VALUES ('137370', '市辖区', '137369', '1', '4', '450201', '01');
INSERT INTO `qm_region` VALUES ('137371', '城中区', '137369', '2', '4', '450202', '02');
INSERT INTO `qm_region` VALUES ('137403', '鱼峰区', '137369', '3', '4', '450203', '03');
INSERT INTO `qm_region` VALUES ('137470', '柳南区', '137369', '4', '4', '450204', '04');
INSERT INTO `qm_region` VALUES ('137552', '柳北区', '137369', '5', '4', '450205', '05');
INSERT INTO `qm_region` VALUES ('137648', '柳江县', '137369', '6', '4', '450221', '21');
INSERT INTO `qm_region` VALUES ('137806', '柳城县', '137369', '7', '4', '450222', '22');
INSERT INTO `qm_region` VALUES ('137956', '鹿寨县', '137369', '8', '4', '450223', '23');
INSERT INTO `qm_region` VALUES ('138097', '融安县', '137369', '9', '4', '450224', '24');
INSERT INTO `qm_region` VALUES ('138265', '融水苗族自治县', '137369', '10', '4', '450225', '25');
INSERT INTO `qm_region` VALUES ('138491', '三江侗族自治县', '137369', '11', '4', '450226', '26');
INSERT INTO `qm_region` VALUES ('138674', '桂林市', '135425', '3', '3', '4503', '03');
INSERT INTO `qm_region` VALUES ('138675', '市辖区', '138674', '1', '4', '450301', '01');
INSERT INTO `qm_region` VALUES ('138676', '秀峰区', '138674', '2', '4', '450302', '02');
INSERT INTO `qm_region` VALUES ('138705', '叠彩区', '138674', '3', '4', '450303', '03');
INSERT INTO `qm_region` VALUES ('138739', '象山区', '138674', '4', '4', '450304', '04');
INSERT INTO `qm_region` VALUES ('138781', '七星区', '138674', '5', '4', '450305', '05');
INSERT INTO `qm_region` VALUES ('138832', '雁山区', '138674', '6', '4', '450311', '11');
INSERT INTO `qm_region` VALUES ('138878', '阳朔县', '138674', '7', '4', '450321', '21');
INSERT INTO `qm_region` VALUES ('139002', '临桂县', '138674', '8', '4', '450322', '22');
INSERT INTO `qm_region` VALUES ('139181', '灵川县', '138674', '9', '4', '450323', '23');
INSERT INTO `qm_region` VALUES ('139335', '全州县', '138674', '10', '4', '450324', '24');
INSERT INTO `qm_region` VALUES ('139638', '兴安县', '138674', '11', '4', '450325', '25');
INSERT INTO `qm_region` VALUES ('139774', '永福县', '138674', '12', '4', '450326', '26');
INSERT INTO `qm_region` VALUES ('139883', '灌阳县', '138674', '13', '4', '450327', '27');
INSERT INTO `qm_region` VALUES ('140034', '龙胜各族自治县', '138674', '14', '4', '450328', '28');
INSERT INTO `qm_region` VALUES ('140170', '资源县', '138674', '15', '4', '450329', '29');
INSERT INTO `qm_region` VALUES ('140252', '平乐县', '138674', '16', '4', '450330', '30');
INSERT INTO `qm_region` VALUES ('140408', '荔浦县', '138674', '17', '4', '450331', '31');
INSERT INTO `qm_region` VALUES ('140566', '恭城县', '138674', '18', '4', '450332', '32');
INSERT INTO `qm_region` VALUES ('140700', '梧州市', '135425', '4', '3', '4504', '04');
INSERT INTO `qm_region` VALUES ('140701', '市辖区', '140700', '1', '4', '450401', '01');
INSERT INTO `qm_region` VALUES ('140702', '万秀区', '140700', '2', '4', '450403', '03');
INSERT INTO `qm_region` VALUES ('140748', '蝶山区', '140700', '3', '4', '450404', '04');
INSERT INTO `qm_region` VALUES ('140805', '长洲区', '140700', '4', '4', '450405', '05');
INSERT INTO `qm_region` VALUES ('140846', '苍梧县', '140700', '5', '4', '450421', '21');
INSERT INTO `qm_region` VALUES ('141069', '藤县', '140700', '6', '4', '450422', '22');
INSERT INTO `qm_region` VALUES ('141365', '蒙山县', '140700', '7', '4', '450423', '23');
INSERT INTO `qm_region` VALUES ('141458', '岑溪市', '140700', '8', '4', '450481', '81');
INSERT INTO `qm_region` VALUES ('141755', '北海市', '135425', '5', '3', '4505', '05');
INSERT INTO `qm_region` VALUES ('141756', '市辖区', '141755', '1', '4', '450501', '01');
INSERT INTO `qm_region` VALUES ('141757', '海城区', '141755', '2', '4', '450502', '02');
INSERT INTO `qm_region` VALUES ('141832', '银海区', '141755', '3', '4', '450503', '03');
INSERT INTO `qm_region` VALUES ('141886', '铁山港区', '141755', '4', '4', '450512', '12');
INSERT INTO `qm_region` VALUES ('141935', '合浦县', '141755', '5', '4', '450521', '21');
INSERT INTO `qm_region` VALUES ('142227', '防城港市', '135425', '6', '3', '4506', '06');
INSERT INTO `qm_region` VALUES ('142228', '市辖区', '142227', '1', '4', '450601', '01');
INSERT INTO `qm_region` VALUES ('142229', '港口区', '142227', '2', '4', '450602', '02');
INSERT INTO `qm_region` VALUES ('142272', '防城区', '142227', '3', '4', '450603', '03');
INSERT INTO `qm_region` VALUES ('142451', '上思县', '142227', '4', '4', '450621', '21');
INSERT INTO `qm_region` VALUES ('142572', '东兴市', '142227', '5', '4', '450681', '81');
INSERT INTO `qm_region` VALUES ('142618', '钦州市', '135425', '7', '3', '4507', '07');
INSERT INTO `qm_region` VALUES ('142619', '市辖区', '142618', '1', '4', '450701', '01');
INSERT INTO `qm_region` VALUES ('142620', '钦南区', '142618', '2', '4', '450702', '02');
INSERT INTO `qm_region` VALUES ('142810', '钦北区', '142618', '3', '4', '450703', '03');
INSERT INTO `qm_region` VALUES ('142999', '灵山县', '142618', '4', '4', '450721', '21');
INSERT INTO `qm_region` VALUES ('143434', '浦北县', '142618', '5', '4', '450722', '22');
INSERT INTO `qm_region` VALUES ('143725', '贵港市', '135425', '8', '3', '4508', '08');
INSERT INTO `qm_region` VALUES ('143726', '市辖区', '143725', '1', '4', '450801', '01');
INSERT INTO `qm_region` VALUES ('143727', '港北区', '143725', '2', '4', '450802', '02');
INSERT INTO `qm_region` VALUES ('143853', '港南区', '143725', '3', '4', '450803', '03');
INSERT INTO `qm_region` VALUES ('144028', '覃塘区', '143725', '4', '4', '450804', '04');
INSERT INTO `qm_region` VALUES ('144184', '平南县', '143725', '5', '4', '450821', '21');
INSERT INTO `qm_region` VALUES ('144491', '桂平市', '143725', '6', '4', '450881', '81');
INSERT INTO `qm_region` VALUES ('144949', '玉林市', '135425', '9', '3', '4509', '09');
INSERT INTO `qm_region` VALUES ('144950', '市辖区', '144949', '1', '4', '450901', '01');
INSERT INTO `qm_region` VALUES ('144951', '玉州区', '144949', '2', '4', '450902', '02');
INSERT INTO `qm_region` VALUES ('145190', '容县', '144949', '3', '4', '450921', '21');
INSERT INTO `qm_region` VALUES ('145435', '陆川县', '144949', '4', '4', '450922', '22');
INSERT INTO `qm_region` VALUES ('145608', '博白县', '144949', '5', '4', '450923', '23');
INSERT INTO `qm_region` VALUES ('145964', '兴业县', '144949', '6', '4', '450924', '24');
INSERT INTO `qm_region` VALUES ('146192', '北流市', '144949', '7', '4', '450981', '81');
INSERT INTO `qm_region` VALUES ('146522', '百色市', '135425', '10', '3', '4510', '10');
INSERT INTO `qm_region` VALUES ('146523', '市辖区', '146522', '1', '4', '451001', '01');
INSERT INTO `qm_region` VALUES ('146524', '右江区', '146522', '2', '4', '451002', '02');
INSERT INTO `qm_region` VALUES ('146654', '田阳县', '146522', '3', '4', '451021', '21');
INSERT INTO `qm_region` VALUES ('146821', '田东县', '146522', '4', '4', '451022', '22');
INSERT INTO `qm_region` VALUES ('146999', '平果县', '146522', '5', '4', '451023', '23');
INSERT INTO `qm_region` VALUES ('147195', '德保县', '146522', '6', '4', '451024', '24');
INSERT INTO `qm_region` VALUES ('147395', '靖西县', '146522', '7', '4', '451025', '25');
INSERT INTO `qm_region` VALUES ('147706', '那坡县', '146522', '8', '4', '451026', '26');
INSERT INTO `qm_region` VALUES ('147846', '凌云县', '146522', '9', '4', '451027', '27');
INSERT INTO `qm_region` VALUES ('147965', '乐业县', '146522', '10', '4', '451028', '28');
INSERT INTO `qm_region` VALUES ('148062', '田林县', '146522', '11', '4', '451029', '29');
INSERT INTO `qm_region` VALUES ('148245', '西林县', '146522', '12', '4', '451030', '30');
INSERT INTO `qm_region` VALUES ('148350', '隆林各族自治县', '146522', '13', '4', '451031', '31');
INSERT INTO `qm_region` VALUES ('148546', '贺州市', '135425', '11', '3', '4511', '11');
INSERT INTO `qm_region` VALUES ('148547', '市辖区', '148546', '1', '4', '451101', '01');
INSERT INTO `qm_region` VALUES ('148548', '八步区', '148546', '2', '4', '451102', '02');
INSERT INTO `qm_region` VALUES ('148870', '昭平县', '148546', '3', '4', '451121', '21');
INSERT INTO `qm_region` VALUES ('149041', '钟山县', '148546', '4', '4', '451122', '22');
INSERT INTO `qm_region` VALUES ('149210', '富川瑶族自治县', '148546', '5', '4', '451123', '23');
INSERT INTO `qm_region` VALUES ('149378', '河池市', '135425', '12', '3', '4512', '12');
INSERT INTO `qm_region` VALUES ('149379', '市辖区', '149378', '1', '4', '451201', '01');
INSERT INTO `qm_region` VALUES ('149380', '金城江区', '149378', '2', '4', '451202', '02');
INSERT INTO `qm_region` VALUES ('149537', '南丹县', '149378', '3', '4', '451221', '21');
INSERT INTO `qm_region` VALUES ('149697', '天峨县', '149378', '4', '4', '451222', '22');
INSERT INTO `qm_region` VALUES ('149801', '凤山县', '149378', '5', '4', '451223', '23');
INSERT INTO `qm_region` VALUES ('149909', '东兰县', '149378', '6', '4', '451224', '24');
INSERT INTO `qm_region` VALUES ('150073', '罗城仫佬族自治县', '149378', '7', '4', '451225', '25');
INSERT INTO `qm_region` VALUES ('150226', '环江毛南族自治县', '149378', '8', '4', '451226', '26');
INSERT INTO `qm_region` VALUES ('150387', '巴马瑶族自治县', '149378', '9', '4', '451227', '27');
INSERT INTO `qm_region` VALUES ('150505', '都安瑶族自治县', '149378', '10', '4', '451228', '28');
INSERT INTO `qm_region` VALUES ('150773', '大化瑶族自治县', '149378', '11', '4', '451229', '29');
INSERT INTO `qm_region` VALUES ('150946', '宜州市', '149378', '12', '4', '451281', '81');
INSERT INTO `qm_region` VALUES ('151173', '来宾市', '135425', '13', '3', '4513', '13');
INSERT INTO `qm_region` VALUES ('151174', '市辖区', '151173', '1', '4', '451301', '01');
INSERT INTO `qm_region` VALUES ('151175', '兴宾区', '151173', '2', '4', '451302', '02');
INSERT INTO `qm_region` VALUES ('151462', '忻城县', '151173', '3', '4', '451321', '21');
INSERT INTO `qm_region` VALUES ('151605', '象州县', '151173', '4', '4', '451322', '22');
INSERT INTO `qm_region` VALUES ('151743', '武宣县', '151173', '5', '4', '451323', '23');
INSERT INTO `qm_region` VALUES ('151905', '金秀瑶族自治县', '151173', '6', '4', '451324', '24');
INSERT INTO `qm_region` VALUES ('151999', '合山市', '151173', '7', '4', '451381', '81');
INSERT INTO `qm_region` VALUES ('152035', '崇左市', '135425', '14', '3', '4514', '14');
INSERT INTO `qm_region` VALUES ('152036', '市辖区', '152035', '1', '4', '451401', '01');
INSERT INTO `qm_region` VALUES ('152037', '江州区', '152035', '2', '4', '451402', '02');
INSERT INTO `qm_region` VALUES ('152161', '扶绥县', '152035', '3', '4', '451421', '21');
INSERT INTO `qm_region` VALUES ('152305', '宁明县', '152035', '4', '4', '451422', '22');
INSERT INTO `qm_region` VALUES ('152480', '龙州县', '152035', '5', '4', '451423', '23');
INSERT INTO `qm_region` VALUES ('152620', '大新县', '152035', '6', '4', '451424', '24');
INSERT INTO `qm_region` VALUES ('152781', '天等县', '152035', '7', '4', '451425', '25');
INSERT INTO `qm_region` VALUES ('152921', '凭祥市', '152035', '8', '4', '451481', '81');
INSERT INTO `qm_region` VALUES ('152964', '贵州省', '1', '8', '2', '52', '52');
INSERT INTO `qm_region` VALUES ('152965', '贵阳市', '152964', '1', '3', '5201', '01');
INSERT INTO `qm_region` VALUES ('152966', '市辖区', '152965', '1', '4', '520101', '01');
INSERT INTO `qm_region` VALUES ('152967', '南明区', '152965', '2', '4', '520102', '02');
INSERT INTO `qm_region` VALUES ('153131', '云岩区', '152965', '3', '4', '520103', '03');
INSERT INTO `qm_region` VALUES ('153288', '花溪区', '152965', '4', '4', '520111', '11');
INSERT INTO `qm_region` VALUES ('153488', '乌当区', '152965', '5', '4', '520112', '12');
INSERT INTO `qm_region` VALUES ('153659', '白云区', '152965', '6', '4', '520113', '13');
INSERT INTO `qm_region` VALUES ('153755', '小河区', '152965', '7', '4', '520114', '14');
INSERT INTO `qm_region` VALUES ('153793', '开阳县', '152965', '8', '4', '520121', '21');
INSERT INTO `qm_region` VALUES ('153931', '息烽县', '152965', '9', '4', '520122', '22');
INSERT INTO `qm_region` VALUES ('154112', '修文县', '152965', '10', '4', '520123', '23');
INSERT INTO `qm_region` VALUES ('154351', '清镇市', '152965', '11', '4', '520181', '81');
INSERT INTO `qm_region` VALUES ('154692', '六盘水市', '152964', '2', '3', '5202', '02');
INSERT INTO `qm_region` VALUES ('154693', '钟山区', '154692', '1', '4', '520201', '01');
INSERT INTO `qm_region` VALUES ('154825', '六枝特区', '154692', '2', '4', '520203', '03');
INSERT INTO `qm_region` VALUES ('155090', '水城县', '154692', '3', '4', '520221', '21');
INSERT INTO `qm_region` VALUES ('155497', '盘县', '154692', '4', '4', '520222', '22');
INSERT INTO `qm_region` VALUES ('156033', '遵义市', '152964', '3', '3', '5203', '03');
INSERT INTO `qm_region` VALUES ('156034', '市辖区', '156033', '1', '4', '520301', '01');
INSERT INTO `qm_region` VALUES ('156035', '红花岗区', '156033', '2', '4', '520302', '02');
INSERT INTO `qm_region` VALUES ('156168', '汇川区', '156033', '3', '4', '520303', '03');
INSERT INTO `qm_region` VALUES ('156269', '遵义县', '156033', '4', '4', '520321', '21');
INSERT INTO `qm_region` VALUES ('156576', '桐梓县', '156033', '5', '4', '520322', '22');
INSERT INTO `qm_region` VALUES ('156835', '绥阳县', '156033', '6', '4', '520323', '23');
INSERT INTO `qm_region` VALUES ('156971', '正安县', '156033', '7', '4', '520324', '24');
INSERT INTO `qm_region` VALUES ('157141', '道真仡佬族苗族自治县', '156033', '8', '4', '520325', '25');
INSERT INTO `qm_region` VALUES ('157244', '务川仡佬族苗族自治县', '156033', '9', '4', '520326', '26');
INSERT INTO `qm_region` VALUES ('157373', '凤冈县', '156033', '10', '4', '520327', '27');
INSERT INTO `qm_region` VALUES ('157474', '湄潭县', '156033', '11', '4', '520328', '28');
INSERT INTO `qm_region` VALUES ('157622', '余庆县', '156033', '12', '4', '520329', '29');
INSERT INTO `qm_region` VALUES ('157702', '习水县', '156033', '13', '4', '520330', '30');
INSERT INTO `qm_region` VALUES ('157961', '赤水市', '156033', '14', '4', '520381', '81');
INSERT INTO `qm_region` VALUES ('158101', '仁怀市', '156033', '15', '4', '520382', '82');
INSERT INTO `qm_region` VALUES ('158292', '安顺市', '152964', '4', '3', '5204', '04');
INSERT INTO `qm_region` VALUES ('158293', '市辖区', '158292', '1', '4', '520401', '01');
INSERT INTO `qm_region` VALUES ('158294', '西秀区', '158292', '2', '4', '520402', '02');
INSERT INTO `qm_region` VALUES ('158873', '平坝县', '158292', '3', '4', '520421', '21');
INSERT INTO `qm_region` VALUES ('159091', '普定县', '158292', '4', '4', '520422', '22');
INSERT INTO `qm_region` VALUES ('159427', '镇宁布依族苗族自治县', '158292', '5', '4', '520423', '23');
INSERT INTO `qm_region` VALUES ('159815', '关岭自治县', '158292', '6', '4', '520424', '24');
INSERT INTO `qm_region` VALUES ('160082', '紫云苗族布依族自治县', '158292', '7', '4', '520425', '25');
INSERT INTO `qm_region` VALUES ('160324', '铜仁地区', '152964', '5', '3', '5222', '22');
INSERT INTO `qm_region` VALUES ('160325', '铜仁市', '160324', '1', '4', '522201', '01');
INSERT INTO `qm_region` VALUES ('160515', '江口县', '160324', '2', '4', '522222', '22');
INSERT INTO `qm_region` VALUES ('160604', '玉屏侗族自治县', '160324', '3', '4', '522223', '23');
INSERT INTO `qm_region` VALUES ('160704', '石阡县', '160324', '4', '4', '522224', '24');
INSERT INTO `qm_region` VALUES ('160815', '思南县　', '160324', '5', '4', '522225', '25');
INSERT INTO `qm_region` VALUES ('161407', '印江土家族苗族自治县', '160324', '6', '4', '522226', '26');
INSERT INTO `qm_region` VALUES ('161780', '德江县', '160324', '7', '4', '522227', '27');
INSERT INTO `qm_region` VALUES ('162167', '沿河土家族自治县', '160324', '8', '4', '522228', '28');
INSERT INTO `qm_region` VALUES ('162600', '松桃苗族自治县', '160324', '9', '4', '522229', '29');
INSERT INTO `qm_region` VALUES ('163137', '万山特区', '160324', '10', '4', '522230', '30');
INSERT INTO `qm_region` VALUES ('163200', '黔西南州', '152964', '6', '3', '5223', '23');
INSERT INTO `qm_region` VALUES ('163201', '兴义市', '163200', '1', '4', '522301', '01');
INSERT INTO `qm_region` VALUES ('163618', '兴仁县', '163200', '2', '4', '522322', '22');
INSERT INTO `qm_region` VALUES ('163922', '普安县', '163200', '3', '4', '522323', '23');
INSERT INTO `qm_region` VALUES ('164107', '晴隆县', '163200', '4', '4', '522324', '24');
INSERT INTO `qm_region` VALUES ('164306', '贞丰县', '163200', '5', '4', '522325', '25');
INSERT INTO `qm_region` VALUES ('164608', '望谟县', '163200', '6', '4', '522326', '26');
INSERT INTO `qm_region` VALUES ('164938', '册亨县', '163200', '7', '4', '522327', '27');
INSERT INTO `qm_region` VALUES ('165147', '安龙县', '163200', '8', '4', '522328', '28');
INSERT INTO `qm_region` VALUES ('165461', '毕节地区', '152964', '7', '3', '5224', '24');
INSERT INTO `qm_region` VALUES ('165462', '毕节市', '165461', '1', '4', '522401', '01');
INSERT INTO `qm_region` VALUES ('166058', '大方县', '165461', '2', '4', '522422', '22');
INSERT INTO `qm_region` VALUES ('166484', '黔西县', '165461', '3', '4', '522423', '23');
INSERT INTO `qm_region` VALUES ('166928', '金沙县', '165461', '4', '4', '522424', '24');
INSERT INTO `qm_region` VALUES ('167535', '织金县', '165461', '5', '4', '522425', '25');
INSERT INTO `qm_region` VALUES ('168142', '纳雍县', '165461', '6', '4', '522426', '26');
INSERT INTO `qm_region` VALUES ('168665', '威宁彝族回族苗族自治县', '165461', '7', '4', '522427', '27');
INSERT INTO `qm_region` VALUES ('169322', '赫章县', '165461', '8', '4', '522428', '28');
INSERT INTO `qm_region` VALUES ('169815', '黔东南苗族侗族自治州', '152964', '8', '3', '5226', '26');
INSERT INTO `qm_region` VALUES ('169816', '凯里市', '169815', '1', '4', '522601', '01');
INSERT INTO `qm_region` VALUES ('170066', '黄平县', '169815', '2', '4', '522622', '22');
INSERT INTO `qm_region` VALUES ('170331', '施秉县', '169815', '3', '4', '522623', '23');
INSERT INTO `qm_region` VALUES ('170402', '三穗县', '169815', '4', '4', '522624', '24');
INSERT INTO `qm_region` VALUES ('170576', '镇远县', '169815', '5', '4', '522625', '25');
INSERT INTO `qm_region` VALUES ('170715', '岑巩县', '169815', '6', '4', '522626', '26');
INSERT INTO `qm_region` VALUES ('170865', '天柱县', '169815', '7', '4', '522627', '27');
INSERT INTO `qm_region` VALUES ('171208', '锦屏县', '169815', '8', '4', '522628', '28');
INSERT INTO `qm_region` VALUES ('171434', '剑河县', '169815', '9', '4', '522629', '29');
INSERT INTO `qm_region` VALUES ('171756', '台江县', '169815', '10', '4', '522630', '30');
INSERT INTO `qm_region` VALUES ('171925', '黎平县', '169815', '11', '4', '522631', '31');
INSERT INTO `qm_region` VALUES ('172360', '榕江县', '169815', '12', '4', '522632', '32');
INSERT INTO `qm_region` VALUES ('172643', '从江县', '169815', '13', '4', '522633', '33');
INSERT INTO `qm_region` VALUES ('172968', '雷山县', '169815', '14', '4', '522634', '34');
INSERT INTO `qm_region` VALUES ('173137', '麻江县', '169815', '15', '4', '522635', '35');
INSERT INTO `qm_region` VALUES ('173238', '丹寨县', '169815', '16', '4', '522636', '36');
INSERT INTO `qm_region` VALUES ('173413', '黔南布依族苗族自治州', '152964', '9', '3', '5227', '27');
INSERT INTO `qm_region` VALUES ('173414', '都匀市', '173413', '1', '4', '522701', '01');
INSERT INTO `qm_region` VALUES ('173595', '福泉市', '173413', '2', '4', '522702', '02');
INSERT INTO `qm_region` VALUES ('173689', '荔波县', '173413', '3', '4', '522722', '22');
INSERT INTO `qm_region` VALUES ('173805', '贵定县', '173413', '4', '4', '522723', '23');
INSERT INTO `qm_region` VALUES ('173939', '瓮安县', '173413', '5', '4', '522725', '25');
INSERT INTO `qm_region` VALUES ('174218', '独山县', '173413', '6', '4', '522726', '26');
INSERT INTO `qm_region` VALUES ('174496', '平塘县', '173413', '7', '4', '522727', '27');
INSERT INTO `qm_region` VALUES ('174643', '罗甸县', '173413', '8', '4', '522728', '28');
INSERT INTO `qm_region` VALUES ('174942', '长顺县', '173413', '9', '4', '522729', '29');
INSERT INTO `qm_region` VALUES ('175112', '龙里县', '173413', '10', '4', '522730', '30');
INSERT INTO `qm_region` VALUES ('175289', '惠水县', '173413', '11', '4', '522731', '31');
INSERT INTO `qm_region` VALUES ('175524', '三都水族自治县', '173413', '12', '4', '522732', '32');
INSERT INTO `qm_region` VALUES ('175820', '海南省', '1', '9', '2', '46', '46');
INSERT INTO `qm_region` VALUES ('175821', '海口市', '175820', '1', '3', '4601', '01');
INSERT INTO `qm_region` VALUES ('175822', '市辖区', '175821', '1', '4', '460101', '01');
INSERT INTO `qm_region` VALUES ('175823', '秀英区', '175821', '2', '4', '460105', '05');
INSERT INTO `qm_region` VALUES ('175919', '龙华区', '175821', '3', '4', '460106', '06');
INSERT INTO `qm_region` VALUES ('176036', '琼山区', '175821', '4', '4', '460107', '07');
INSERT INTO `qm_region` VALUES ('176228', '美兰区', '175821', '5', '4', '460108', '08');
INSERT INTO `qm_region` VALUES ('176381', '三亚市', '175820', '2', '3', '4602', '02');
INSERT INTO `qm_region` VALUES ('176382', '市辖区', '176381', '1', '4', '460201', '01');
INSERT INTO `qm_region` VALUES ('176773', '省属虚拟市', '175820', '3', '3', '4690', '90');
INSERT INTO `qm_region` VALUES ('176774', '五指山市', '176773', '1', '4', '469001', '01');
INSERT INTO `qm_region` VALUES ('176883', '琼海市', '176773', '2', '4', '469002', '02');
INSERT INTO `qm_region` VALUES ('177261', '儋州市', '176773', '3', '4', '469003', '03');
INSERT INTO `qm_region` VALUES ('178165', '文昌市', '176773', '4', '4', '469005', '05');
INSERT INTO `qm_region` VALUES ('178583', '万宁市', '176773', '5', '4', '469006', '06');
INSERT INTO `qm_region` VALUES ('179081', '东方市', '176773', '6', '4', '469007', '07');
INSERT INTO `qm_region` VALUES ('179374', '定安县', '176773', '7', '4', '469025', '25');
INSERT INTO `qm_region` VALUES ('179645', '屯昌县', '176773', '8', '4', '469026', '26');
INSERT INTO `qm_region` VALUES ('179992', '澄迈县', '176773', '9', '4', '469027', '27');
INSERT INTO `qm_region` VALUES ('180511', '临高县', '176773', '10', '4', '469028', '28');
INSERT INTO `qm_region` VALUES ('180859', '白沙黎族自治县', '176773', '11', '4', '469030', '30');
INSERT INTO `qm_region` VALUES ('181176', '昌江黎族自治县', '176773', '12', '4', '469031', '31');
INSERT INTO `qm_region` VALUES ('181335', '乐东黎族自治县', '176773', '13', '4', '469033', '33');
INSERT INTO `qm_region` VALUES ('181776', '陵水黎族自治县', '176773', '14', '4', '469034', '34');
INSERT INTO `qm_region` VALUES ('181993', '保亭黎族苗族自治县', '176773', '15', '4', '469035', '35');
INSERT INTO `qm_region` VALUES ('182279', '琼中黎族苗族自治县', '176773', '16', '4', '469036', '36');
INSERT INTO `qm_region` VALUES ('182745', '西沙群岛', '176773', '17', '4', '469037', '37');
INSERT INTO `qm_region` VALUES ('182748', '南沙群岛', '176773', '18', '4', '469038', '38');
INSERT INTO `qm_region` VALUES ('182751', '中沙群岛的岛礁及其海域', '176773', '19', '4', '469039', '39');
INSERT INTO `qm_region` VALUES ('182754', '河北省', '1', '10', '2', '13', '13');
INSERT INTO `qm_region` VALUES ('182755', '石家庄市', '182754', '1', '3', '1301', '01');
INSERT INTO `qm_region` VALUES ('182756', '市辖区', '182755', '1', '4', '130101', '01');
INSERT INTO `qm_region` VALUES ('182757', '长安区', '182755', '2', '4', '130102', '02');
INSERT INTO `qm_region` VALUES ('182862', '桥东区', '182755', '3', '4', '130103', '03');
INSERT INTO `qm_region` VALUES ('182940', '桥西区', '182755', '4', '4', '130104', '04');
INSERT INTO `qm_region` VALUES ('183063', '新华区', '182755', '5', '4', '130105', '05');
INSERT INTO `qm_region` VALUES ('183171', '井陉矿区', '182755', '6', '4', '130107', '07');
INSERT INTO `qm_region` VALUES ('183233', '裕华区', '182755', '7', '4', '130108', '08');
INSERT INTO `qm_region` VALUES ('183334', '井陉县', '182755', '8', '4', '130121', '21');
INSERT INTO `qm_region` VALUES ('183674', '正定县', '182755', '9', '4', '130123', '23');
INSERT INTO `qm_region` VALUES ('183871', '栾城县', '182755', '10', '4', '130124', '24');
INSERT INTO `qm_region` VALUES ('184066', '行唐县', '182755', '11', '4', '130125', '25');
INSERT INTO `qm_region` VALUES ('184412', '灵寿县', '182755', '12', '4', '130126', '26');
INSERT INTO `qm_region` VALUES ('184711', '高邑县', '182755', '13', '4', '130127', '27');
INSERT INTO `qm_region` VALUES ('184824', '深泽县', '182755', '14', '4', '130128', '28');
INSERT INTO `qm_region` VALUES ('184957', '赞皇县', '182755', '15', '4', '130129', '29');
INSERT INTO `qm_region` VALUES ('185182', '无极县', '182755', '16', '4', '130130', '30');
INSERT INTO `qm_region` VALUES ('185411', '平山县', '182755', '17', '4', '130131', '31');
INSERT INTO `qm_region` VALUES ('186152', '元氏县', '182755', '18', '4', '130132', '32');
INSERT INTO `qm_region` VALUES ('186380', '赵县', '182755', '19', '4', '130133', '33');
INSERT INTO `qm_region` VALUES ('186673', '辛集市', '182755', '20', '4', '130181', '81');
INSERT INTO `qm_region` VALUES ('187048', '藁城市', '182755', '21', '4', '130182', '82');
INSERT INTO `qm_region` VALUES ('187312', '晋州市', '182755', '22', '4', '130183', '83');
INSERT INTO `qm_region` VALUES ('187547', '新乐市', '182755', '23', '4', '130184', '84');
INSERT INTO `qm_region` VALUES ('187730', '鹿泉市', '182755', '24', '4', '130185', '85');
INSERT INTO `qm_region` VALUES ('187965', '唐山市', '182754', '2', '3', '1302', '02');
INSERT INTO `qm_region` VALUES ('187966', '市辖区', '187965', '1', '4', '130201', '01');
INSERT INTO `qm_region` VALUES ('187967', '路南区', '187965', '2', '4', '130202', '02');
INSERT INTO `qm_region` VALUES ('188137', '路北区', '187965', '3', '4', '130203', '03');
INSERT INTO `qm_region` VALUES ('188325', '古冶区', '187965', '4', '4', '130204', '04');
INSERT INTO `qm_region` VALUES ('188526', '开平区', '187965', '5', '4', '130205', '05');
INSERT INTO `qm_region` VALUES ('188702', '丰南区', '187965', '6', '4', '130207', '07');
INSERT INTO `qm_region` VALUES ('189226', '丰润区', '187965', '7', '4', '130208', '08');
INSERT INTO `qm_region` VALUES ('189881', '滦县', '187965', '8', '4', '130223', '23');
INSERT INTO `qm_region` VALUES ('190421', '滦南县', '187965', '9', '4', '130224', '24');
INSERT INTO `qm_region` VALUES ('191049', '乐亭县', '187965', '10', '4', '130225', '25');
INSERT INTO `qm_region` VALUES ('191620', '迁西县', '187965', '11', '4', '130227', '27');
INSERT INTO `qm_region` VALUES ('192064', '玉田县', '187965', '12', '4', '130229', '29');
INSERT INTO `qm_region` VALUES ('192520', '唐海县', '187965', '13', '4', '130230', '30');
INSERT INTO `qm_region` VALUES ('192699', '遵化市', '187965', '14', '4', '130281', '81');
INSERT INTO `qm_region` VALUES ('193407', '迁安市', '187965', '15', '4', '130283', '83');
INSERT INTO `qm_region` VALUES ('193972', '秦皇岛市', '182754', '3', '3', '1303', '03');
INSERT INTO `qm_region` VALUES ('193973', '市辖区', '193972', '1', '4', '130301', '01');
INSERT INTO `qm_region` VALUES ('193974', '海港区', '193972', '2', '4', '130302', '02');
INSERT INTO `qm_region` VALUES ('194198', '山海关区', '193972', '3', '4', '130303', '03');
INSERT INTO `qm_region` VALUES ('194356', '北戴河区', '193972', '4', '4', '130304', '04');
INSERT INTO `qm_region` VALUES ('194397', '青龙满族自治县', '193972', '5', '4', '130321', '21');
INSERT INTO `qm_region` VALUES ('194823', '昌黎县', '193972', '6', '4', '130322', '22');
INSERT INTO `qm_region` VALUES ('195310', '抚宁县', '193972', '7', '4', '130323', '23');
INSERT INTO `qm_region` VALUES ('195939', '卢龙县', '193972', '8', '4', '130324', '24');
INSERT INTO `qm_region` VALUES ('196500', '邯郸市', '182754', '4', '3', '1304', '04');
INSERT INTO `qm_region` VALUES ('196501', '市辖区', '196500', '1', '4', '130401', '01');
INSERT INTO `qm_region` VALUES ('196502', '邯山区', '196500', '2', '4', '130402', '02');
INSERT INTO `qm_region` VALUES ('196610', '丛台区', '196500', '3', '4', '130403', '03');
INSERT INTO `qm_region` VALUES ('196701', '复兴区', '196500', '4', '4', '130404', '04');
INSERT INTO `qm_region` VALUES ('196773', '峰峰矿区', '196500', '5', '4', '130406', '06');
INSERT INTO `qm_region` VALUES ('196999', '邯郸县', '196500', '6', '4', '130421', '21');
INSERT INTO `qm_region` VALUES ('197251', '临漳县', '196500', '7', '4', '130423', '23');
INSERT INTO `qm_region` VALUES ('197691', '成安县', '196500', '8', '4', '130424', '24');
INSERT INTO `qm_region` VALUES ('197935', '大名县', '196500', '9', '4', '130425', '25');
INSERT INTO `qm_region` VALUES ('198607', '涉县', '196500', '10', '4', '130426', '26');
INSERT INTO `qm_region` VALUES ('198933', '磁县', '196500', '11', '4', '130427', '27');
INSERT INTO `qm_region` VALUES ('199344', '肥乡县', '196500', '12', '4', '130428', '28');
INSERT INTO `qm_region` VALUES ('199617', '永年县', '196500', '13', '4', '130429', '29');
INSERT INTO `qm_region` VALUES ('200088', '邱县', '196500', '14', '4', '130430', '30');
INSERT INTO `qm_region` VALUES ('200321', '鸡泽县', '196500', '15', '4', '130431', '31');
INSERT INTO `qm_region` VALUES ('200498', '广平县', '196500', '16', '4', '130432', '32');
INSERT INTO `qm_region` VALUES ('200675', '馆陶县', '196500', '17', '4', '130433', '33');
INSERT INTO `qm_region` VALUES ('200961', '魏县', '196500', '18', '4', '130434', '34');
INSERT INTO `qm_region` VALUES ('201544', '曲周县', '196500', '19', '4', '130435', '35');
INSERT INTO `qm_region` VALUES ('201897', '武安市', '196500', '20', '4', '130481', '81');
INSERT INTO `qm_region` VALUES ('202444', '邢台市', '182754', '5', '3', '1305', '05');
INSERT INTO `qm_region` VALUES ('202445', '市辖区', '202444', '1', '4', '130501', '01');
INSERT INTO `qm_region` VALUES ('202446', '桥东区', '202444', '2', '4', '130502', '02');
INSERT INTO `qm_region` VALUES ('202562', '桥西区', '202444', '3', '4', '130503', '03');
INSERT INTO `qm_region` VALUES ('202681', '邢台县', '202444', '4', '4', '130521', '21');
INSERT INTO `qm_region` VALUES ('203312', '临城县', '202444', '5', '4', '130522', '22');
INSERT INTO `qm_region` VALUES ('203541', '内邱县', '202444', '6', '4', '130523', '23');
INSERT INTO `qm_region` VALUES ('203862', '柏乡县', '202444', '7', '4', '130524', '24');
INSERT INTO `qm_region` VALUES ('203990', '隆尧县', '202444', '8', '4', '130525', '25');
INSERT INTO `qm_region` VALUES ('204281', '任县', '202444', '9', '4', '130526', '26');
INSERT INTO `qm_region` VALUES ('204485', '南和县', '202444', '10', '4', '130527', '27');
INSERT INTO `qm_region` VALUES ('204716', '宁晋县', '202444', '11', '4', '130528', '28');
INSERT INTO `qm_region` VALUES ('205099', '巨鹿县', '202444', '12', '4', '130529', '29');
INSERT INTO `qm_region` VALUES ('205401', '新河县', '202444', '13', '4', '130530', '30');
INSERT INTO `qm_region` VALUES ('205577', '广宗县', '202444', '14', '4', '130531', '31');
INSERT INTO `qm_region` VALUES ('205799', '平乡县', '202444', '15', '4', '130532', '32');
INSERT INTO `qm_region` VALUES ('206060', '威县', '202444', '16', '4', '130533', '33');
INSERT INTO `qm_region` VALUES ('206600', '清河县', '202444', '17', '4', '130534', '34');
INSERT INTO `qm_region` VALUES ('206936', '临西县', '202444', '18', '4', '130535', '35');
INSERT INTO `qm_region` VALUES ('207251', '南宫市', '202444', '19', '4', '130581', '81');
INSERT INTO `qm_region` VALUES ('207731', '沙河市', '202444', '20', '4', '130582', '82');
INSERT INTO `qm_region` VALUES ('208054', '保定市', '182754', '6', '3', '1306', '06');
INSERT INTO `qm_region` VALUES ('208055', '市辖区', '208054', '1', '4', '130601', '01');
INSERT INTO `qm_region` VALUES ('208056', '新市区', '208054', '2', '4', '130602', '02');
INSERT INTO `qm_region` VALUES ('208228', '北市区', '208054', '3', '4', '130603', '03');
INSERT INTO `qm_region` VALUES ('208340', '南市区', '208054', '4', '4', '130604', '04');
INSERT INTO `qm_region` VALUES ('208448', '满城县', '208054', '5', '4', '130621', '21');
INSERT INTO `qm_region` VALUES ('208676', '清苑县', '208054', '6', '4', '130622', '22');
INSERT INTO `qm_region` VALUES ('208967', '涞水县', '208054', '7', '4', '130623', '23');
INSERT INTO `qm_region` VALUES ('209274', '阜平县', '208054', '8', '4', '130624', '24');
INSERT INTO `qm_region` VALUES ('209498', '徐水县', '208054', '9', '4', '130625', '25');
INSERT INTO `qm_region` VALUES ('209834', '定兴县', '208054', '10', '4', '130626', '26');
INSERT INTO `qm_region` VALUES ('210132', '唐县', '208054', '11', '4', '130627', '27');
INSERT INTO `qm_region` VALUES ('210506', '高阳县', '208054', '12', '4', '130628', '28');
INSERT INTO `qm_region` VALUES ('210696', '容城县', '208054', '13', '4', '130629', '29');
INSERT INTO `qm_region` VALUES ('210832', '涞源县', '208054', '14', '4', '130630', '30');
INSERT INTO `qm_region` VALUES ('211143', '望都县', '208054', '15', '4', '130631', '31');
INSERT INTO `qm_region` VALUES ('211302', '安新县', '208054', '16', '4', '130632', '32');
INSERT INTO `qm_region` VALUES ('211527', '易县', '208054', '17', '4', '130633', '33');
INSERT INTO `qm_region` VALUES ('212024', '曲阳县', '208054', '18', '4', '130634', '34');
INSERT INTO `qm_region` VALUES ('212416', '蠡县', '208054', '19', '4', '130635', '35');
INSERT INTO `qm_region` VALUES ('212668', '顺平县', '208054', '20', '4', '130636', '36');
INSERT INTO `qm_region` VALUES ('212921', '博野县', '208054', '21', '4', '130637', '37');
INSERT INTO `qm_region` VALUES ('213063', '雄县', '208054', '22', '4', '130638', '38');
INSERT INTO `qm_region` VALUES ('213303', '涿州市', '208054', '23', '4', '130681', '81');
INSERT INTO `qm_region` VALUES ('213756', '定州市', '208054', '24', '4', '130682', '82');
INSERT INTO `qm_region` VALUES ('214299', '安国市', '208054', '25', '4', '130683', '83');
INSERT INTO `qm_region` VALUES ('214514', '高碑店市', '208054', '26', '4', '130684', '84');
INSERT INTO `qm_region` VALUES ('214981', '张家口市', '182754', '7', '3', '1307', '07');
INSERT INTO `qm_region` VALUES ('214982', '市辖区', '214981', '1', '4', '130701', '01');
INSERT INTO `qm_region` VALUES ('214983', '桥东区', '214981', '2', '4', '130702', '02');
INSERT INTO `qm_region` VALUES ('215062', '桥西区', '214981', '3', '4', '130703', '03');
INSERT INTO `qm_region` VALUES ('215139', '宣化区', '214981', '4', '4', '130705', '05');
INSERT INTO `qm_region` VALUES ('215252', '下花园区', '214981', '5', '4', '130706', '06');
INSERT INTO `qm_region` VALUES ('215315', '宣化县', '214981', '6', '4', '130721', '21');
INSERT INTO `qm_region` VALUES ('215648', '张北县', '214981', '7', '4', '130722', '22');
INSERT INTO `qm_region` VALUES ('216069', '康保县', '214981', '8', '4', '130723', '23');
INSERT INTO `qm_region` VALUES ('216416', '沽源县', '214981', '9', '4', '130724', '24');
INSERT INTO `qm_region` VALUES ('216683', '尚义县', '214981', '10', '4', '130725', '25');
INSERT INTO `qm_region` VALUES ('216876', '蔚县', '214981', '11', '4', '130726', '26');
INSERT INTO `qm_region` VALUES ('217460', '阳原县', '214981', '12', '4', '130727', '27');
INSERT INTO `qm_region` VALUES ('217782', '怀安县', '214981', '13', '4', '130728', '28');
INSERT INTO `qm_region` VALUES ('218076', '万全县', '214981', '14', '4', '130729', '29');
INSERT INTO `qm_region` VALUES ('218270', '怀来县', '214981', '15', '4', '130730', '30');
INSERT INTO `qm_region` VALUES ('218590', '涿鹿县', '214981', '16', '4', '130731', '31');
INSERT INTO `qm_region` VALUES ('218990', '赤城县', '214981', '17', '4', '130732', '32');
INSERT INTO `qm_region` VALUES ('219449', '崇礼县', '214981', '18', '4', '130733', '33');
INSERT INTO `qm_region` VALUES ('219677', '承德市', '182754', '8', '3', '1308', '08');
INSERT INTO `qm_region` VALUES ('219678', '市辖区', '219677', '1', '4', '130801', '01');
INSERT INTO `qm_region` VALUES ('219679', '双桥区', '219677', '2', '4', '130802', '02');
INSERT INTO `qm_region` VALUES ('219804', '双滦区', '219677', '3', '4', '130803', '03');
INSERT INTO `qm_region` VALUES ('219868', '鹰手营子矿区', '219677', '4', '4', '130804', '04');
INSERT INTO `qm_region` VALUES ('219898', '承德县', '219677', '5', '4', '130821', '21');
INSERT INTO `qm_region` VALUES ('220355', '兴隆县', '219677', '6', '4', '130822', '22');
INSERT INTO `qm_region` VALUES ('220674', '平泉县', '219677', '7', '4', '130823', '23');
INSERT INTO `qm_region` VALUES ('221034', '滦平县', '219677', '8', '4', '130824', '24');
INSERT INTO `qm_region` VALUES ('221286', '隆化县', '219677', '9', '4', '130825', '25');
INSERT INTO `qm_region` VALUES ('221679', '丰宁满族自治县', '219677', '10', '4', '130826', '26');
INSERT INTO `qm_region` VALUES ('222026', '宽城满族自治县', '219677', '11', '4', '130827', '27');
INSERT INTO `qm_region` VALUES ('222255', '围场满族蒙古族自治县', '219677', '12', '4', '130828', '28');
INSERT INTO `qm_region` VALUES ('222616', '沧州市', '182754', '9', '3', '1309', '09');
INSERT INTO `qm_region` VALUES ('222617', '市辖区', '222616', '1', '4', '130901', '01');
INSERT INTO `qm_region` VALUES ('222618', '新华区', '222616', '2', '4', '130902', '02');
INSERT INTO `qm_region` VALUES ('222686', '运河区', '222616', '3', '4', '130903', '03');
INSERT INTO `qm_region` VALUES ('222799', '沧县', '222616', '4', '4', '130921', '21');
INSERT INTO `qm_region` VALUES ('223337', '青县', '222616', '5', '4', '130922', '22');
INSERT INTO `qm_region` VALUES ('223712', '东光县', '222616', '6', '4', '130923', '23');
INSERT INTO `qm_region` VALUES ('224178', '海兴县', '222616', '7', '4', '130924', '24');
INSERT INTO `qm_region` VALUES ('224393', '盐山县', '222616', '8', '4', '130925', '25');
INSERT INTO `qm_region` VALUES ('224860', '肃宁县', '222616', '9', '4', '130926', '26');
INSERT INTO `qm_region` VALUES ('225126', '南皮县', '222616', '10', '4', '130927', '27');
INSERT INTO `qm_region` VALUES ('225454', '吴桥县', '222616', '11', '4', '130928', '28');
INSERT INTO `qm_region` VALUES ('225945', '献县', '222616', '12', '4', '130929', '29');
INSERT INTO `qm_region` VALUES ('226477', '孟村回族自治县', '222616', '13', '4', '130930', '30');
INSERT INTO `qm_region` VALUES ('226612', '泊头市', '222616', '14', '4', '130981', '81');
INSERT INTO `qm_region` VALUES ('227338', '任邱市', '222616', '15', '4', '130982', '82');
INSERT INTO `qm_region` VALUES ('227823', '黄骅市', '222616', '16', '4', '130983', '83');
INSERT INTO `qm_region` VALUES ('228267', '河间市', '222616', '17', '4', '130984', '84');
INSERT INTO `qm_region` VALUES ('228914', '廊坊市', '182754', '10', '3', '1310', '10');
INSERT INTO `qm_region` VALUES ('228915', '市辖区', '228914', '1', '4', '131001', '01');
INSERT INTO `qm_region` VALUES ('228916', '安次区', '228914', '2', '4', '131002', '02');
INSERT INTO `qm_region` VALUES ('229238', '广阳区', '228914', '3', '4', '131003', '03');
INSERT INTO `qm_region` VALUES ('229492', '固安县', '228914', '4', '4', '131022', '22');
INSERT INTO `qm_region` VALUES ('229929', '永清县', '228914', '5', '4', '131023', '23');
INSERT INTO `qm_region` VALUES ('230339', '香河县', '228914', '6', '4', '131024', '24');
INSERT INTO `qm_region` VALUES ('230661', '大城县', '228914', '7', '4', '131025', '25');
INSERT INTO `qm_region` VALUES ('231076', '文安县', '228914', '8', '4', '131026', '26');
INSERT INTO `qm_region` VALUES ('231482', '大厂回族自治县', '228914', '9', '4', '131028', '28');
INSERT INTO `qm_region` VALUES ('231600', '霸州市', '228914', '10', '4', '131081', '81');
INSERT INTO `qm_region` VALUES ('232012', '三河市', '228914', '11', '4', '131082', '82');
INSERT INTO `qm_region` VALUES ('232454', '衡水市', '182754', '11', '3', '1311', '11');
INSERT INTO `qm_region` VALUES ('232455', '市辖区', '232454', '1', '4', '131101', '01');
INSERT INTO `qm_region` VALUES ('232456', '桃城区', '232454', '2', '4', '131102', '02');
INSERT INTO `qm_region` VALUES ('232872', '枣强县', '232454', '3', '4', '131121', '21');
INSERT INTO `qm_region` VALUES ('233443', '武邑县', '232454', '4', '4', '131122', '22');
INSERT INTO `qm_region` VALUES ('233998', '武强县', '232454', '5', '4', '131123', '23');
INSERT INTO `qm_region` VALUES ('234243', '饶阳县', '232454', '6', '4', '131124', '24');
INSERT INTO `qm_region` VALUES ('234448', '安平县', '232454', '7', '4', '131125', '25');
INSERT INTO `qm_region` VALUES ('234687', '故城县', '232454', '8', '4', '131126', '26');
INSERT INTO `qm_region` VALUES ('235240', '景县', '232454', '9', '4', '131127', '27');
INSERT INTO `qm_region` VALUES ('236109', '阜城县', '232454', '10', '4', '131128', '28');
INSERT INTO `qm_region` VALUES ('236730', '冀州市', '232454', '11', '4', '131181', '81');
INSERT INTO `qm_region` VALUES ('237152', '深州市', '232454', '12', '4', '131182', '82');
INSERT INTO `qm_region` VALUES ('237641', '河南省', '1', '13', '2', '41', '41');
INSERT INTO `qm_region` VALUES ('237642', '郑州市', '237641', '1', '3', '4101', '01');
INSERT INTO `qm_region` VALUES ('237643', '市辖区', '237642', '1', '4', '410101', '01');
INSERT INTO `qm_region` VALUES ('237644', '中原区', '237642', '2', '4', '410102', '02');
INSERT INTO `qm_region` VALUES ('237814', '二七区', '237642', '3', '4', '410103', '03');
INSERT INTO `qm_region` VALUES ('237965', '管城回族区', '237642', '4', '4', '410104', '04');
INSERT INTO `qm_region` VALUES ('238106', '金水区', '237642', '5', '4', '410105', '05');
INSERT INTO `qm_region` VALUES ('238344', '上街区', '237642', '6', '4', '410106', '06');
INSERT INTO `qm_region` VALUES ('238400', '惠济区', '237642', '7', '4', '410108', '08');
INSERT INTO `qm_region` VALUES ('238468', '中牟县', '237642', '8', '4', '410122', '22');
INSERT INTO `qm_region` VALUES ('238924', '巩义市', '237642', '9', '4', '410181', '81');
INSERT INTO `qm_region` VALUES ('239271', '荥阳市', '237642', '10', '4', '410182', '82');
INSERT INTO `qm_region` VALUES ('239583', '新密市', '237642', '11', '4', '410183', '83');
INSERT INTO `qm_region` VALUES ('239948', '新郑市', '237642', '12', '4', '410184', '84');
INSERT INTO `qm_region` VALUES ('240314', '登封市', '237642', '13', '4', '410185', '85');
INSERT INTO `qm_region` VALUES ('240649', '开封市', '237641', '2', '3', '4102', '02');
INSERT INTO `qm_region` VALUES ('240650', '市辖区', '240649', '1', '4', '410201', '01');
INSERT INTO `qm_region` VALUES ('240651', '龙亭区', '240649', '2', '4', '410202', '02');
INSERT INTO `qm_region` VALUES ('240712', '顺河区', '240649', '3', '4', '410203', '03');
INSERT INTO `qm_region` VALUES ('240788', '鼓楼区', '240649', '4', '4', '410204', '04');
INSERT INTO `qm_region` VALUES ('240839', '禹王台区', '240649', '5', '4', '410205', '05');
INSERT INTO `qm_region` VALUES ('240904', '金明区', '240649', '6', '4', '410211', '11');
INSERT INTO `qm_region` VALUES ('240980', '杞县', '240649', '7', '4', '410221', '21');
INSERT INTO `qm_region` VALUES ('241594', '通许县', '240649', '8', '4', '410222', '22');
INSERT INTO `qm_region` VALUES ('241916', '尉氏县', '240649', '9', '4', '410223', '23');
INSERT INTO `qm_region` VALUES ('242455', '开封县', '240649', '10', '4', '410224', '24');
INSERT INTO `qm_region` VALUES ('242816', '兰考县', '240649', '11', '4', '410225', '25');
INSERT INTO `qm_region` VALUES ('243298', '洛阳市', '237641', '3', '3', '4103', '03');
INSERT INTO `qm_region` VALUES ('243299', '市辖区', '243298', '1', '4', '410301', '01');
INSERT INTO `qm_region` VALUES ('243300', '老城区', '243298', '2', '4', '410302', '02');
INSERT INTO `qm_region` VALUES ('243358', '西工区', '243298', '3', '4', '410303', '03');
INSERT INTO `qm_region` VALUES ('243434', '廛河回族区', '243298', '4', '4', '410304', '04');
INSERT INTO `qm_region` VALUES ('243484', '涧西区', '243298', '5', '4', '410305', '05');
INSERT INTO `qm_region` VALUES ('243630', '吉利区', '243298', '6', '4', '410306', '06');
INSERT INTO `qm_region` VALUES ('243670', '洛龙区', '243298', '7', '4', '410307', '07');
INSERT INTO `qm_region` VALUES ('243823', '孟津县', '243298', '8', '4', '410322', '22');
INSERT INTO `qm_region` VALUES ('244061', '新安县', '243298', '9', '4', '410323', '23');
INSERT INTO `qm_region` VALUES ('244379', '栾川县', '243298', '10', '4', '410324', '24');
INSERT INTO `qm_region` VALUES ('244607', '嵩县', '243298', '11', '4', '410325', '25');
INSERT INTO `qm_region` VALUES ('244949', '汝阳县', '243298', '12', '4', '410326', '26');
INSERT INTO `qm_region` VALUES ('245180', '宜阳县', '243298', '13', '4', '410327', '27');
INSERT INTO `qm_region` VALUES ('245577', '洛宁县', '243298', '14', '4', '410328', '28');
INSERT INTO `qm_region` VALUES ('245992', '伊川县', '243298', '15', '4', '410329', '29');
INSERT INTO `qm_region` VALUES ('246385', '偃师市', '243298', '16', '4', '410381', '81');
INSERT INTO `qm_region` VALUES ('246751', '平顶山市', '237641', '4', '3', '4104', '04');
INSERT INTO `qm_region` VALUES ('246752', '市辖区', '246751', '1', '4', '410401', '01');
INSERT INTO `qm_region` VALUES ('246753', '新华区', '246751', '2', '4', '410402', '02');
INSERT INTO `qm_region` VALUES ('246866', '卫东区', '246751', '3', '4', '410403', '03');
INSERT INTO `qm_region` VALUES ('246940', '石龙区', '246751', '4', '4', '410404', '04');
INSERT INTO `qm_region` VALUES ('246961', '湛河区', '246751', '5', '4', '410411', '11');
INSERT INTO `qm_region` VALUES ('247069', '宝丰县', '246751', '6', '4', '410421', '21');
INSERT INTO `qm_region` VALUES ('247406', '叶', '246751', '7', '4', '410422', '22');
INSERT INTO `qm_region` VALUES ('248003', '鲁山县', '246751', '8', '4', '410423', '23');
INSERT INTO `qm_region` VALUES ('248583', '郏', '246751', '9', '4', '410425', '25');
INSERT INTO `qm_region` VALUES ('248972', '舞钢市', '246751', '10', '4', '410481', '81');
INSERT INTO `qm_region` VALUES ('249199', '汝州市', '246751', '11', '4', '410482', '82');
INSERT INTO `qm_region` VALUES ('249675', '安阳市', '237641', '5', '3', '4105', '05');
INSERT INTO `qm_region` VALUES ('249676', '市辖区', '249675', '1', '4', '410501', '01');
INSERT INTO `qm_region` VALUES ('249677', '文峰区', '249675', '2', '4', '410502', '02');
INSERT INTO `qm_region` VALUES ('249843', '北关区', '249675', '3', '4', '410503', '03');
INSERT INTO `qm_region` VALUES ('249921', '殷都区', '249675', '4', '4', '410505', '05');
INSERT INTO `qm_region` VALUES ('250015', '龙安区', '249675', '5', '4', '410506', '06');
INSERT INTO `qm_region` VALUES ('250170', '安阳县', '249675', '6', '4', '410522', '22');
INSERT INTO `qm_region` VALUES ('250800', '汤阴县', '249675', '7', '4', '410523', '23');
INSERT INTO `qm_region` VALUES ('251115', '滑县', '249675', '8', '4', '410526', '26');
INSERT INTO `qm_region` VALUES ('252157', '内黄县', '249675', '9', '4', '410527', '27');
INSERT INTO `qm_region` VALUES ('252707', '林州市', '249675', '10', '4', '410581', '81');
INSERT INTO `qm_region` VALUES ('253298', '鹤壁市', '237641', '6', '3', '4106', '06');
INSERT INTO `qm_region` VALUES ('253299', '市辖区', '253298', '1', '4', '410601', '01');
INSERT INTO `qm_region` VALUES ('253300', '鹤山区', '253298', '2', '4', '410602', '02');
INSERT INTO `qm_region` VALUES ('253389', '山城区', '253298', '3', '4', '410603', '03');
INSERT INTO `qm_region` VALUES ('253498', '淇滨区', '253298', '4', '4', '410611', '11');
INSERT INTO `qm_region` VALUES ('253606', '浚县', '253298', '5', '4', '410621', '21');
INSERT INTO `qm_region` VALUES ('254113', '淇县', '253298', '6', '4', '410622', '22');
INSERT INTO `qm_region` VALUES ('254296', '新乡市', '237641', '7', '3', '4107', '07');
INSERT INTO `qm_region` VALUES ('254297', '市辖区', '254296', '1', '4', '410701', '01');
INSERT INTO `qm_region` VALUES ('254298', '红旗区', '254296', '2', '4', '410702', '02');
INSERT INTO `qm_region` VALUES ('254409', '卫滨区', '254296', '3', '4', '410703', '03');
INSERT INTO `qm_region` VALUES ('254468', '凤泉区', '254296', '4', '4', '410704', '04');
INSERT INTO `qm_region` VALUES ('254518', '牧野区', '254296', '5', '4', '410711', '11');
INSERT INTO `qm_region` VALUES ('254618', '新乡县', '254296', '6', '4', '410721', '21');
INSERT INTO `qm_region` VALUES ('254803', '获嘉县', '254296', '7', '4', '410724', '24');
INSERT INTO `qm_region` VALUES ('255038', '原阳县', '254296', '8', '4', '410725', '25');
INSERT INTO `qm_region` VALUES ('255629', '延津县', '254296', '9', '4', '410726', '26');
INSERT INTO `qm_region` VALUES ('255991', '封丘县', '254296', '10', '4', '410727', '27');
INSERT INTO `qm_region` VALUES ('256616', '长垣县', '254296', '11', '4', '410728', '28');
INSERT INTO `qm_region` VALUES ('257234', '卫辉市', '254296', '12', '4', '410781', '81');
INSERT INTO `qm_region` VALUES ('257610', '辉县市', '254296', '13', '4', '410782', '82');
INSERT INTO `qm_region` VALUES ('258171', '焦作市', '237641', '8', '3', '4108', '08');
INSERT INTO `qm_region` VALUES ('258172', '市辖区', '258171', '1', '4', '410801', '01');
INSERT INTO `qm_region` VALUES ('258173', '解放区', '258171', '2', '4', '410802', '02');
INSERT INTO `qm_region` VALUES ('258233', '中站区', '258171', '3', '4', '410803', '03');
INSERT INTO `qm_region` VALUES ('258293', '马村区', '258171', '4', '4', '410804', '04');
INSERT INTO `qm_region` VALUES ('258379', '山阳区', '258171', '5', '4', '410811', '11');
INSERT INTO `qm_region` VALUES ('258460', '修武县', '258171', '6', '4', '410821', '21');
INSERT INTO `qm_region` VALUES ('258698', '博爱县', '258171', '7', '4', '410822', '22');
INSERT INTO `qm_region` VALUES ('258955', '武陟县', '258171', '8', '4', '410823', '23');
INSERT INTO `qm_region` VALUES ('259339', '温县', '258171', '9', '4', '410825', '25');
INSERT INTO `qm_region` VALUES ('259614', '济源市', '258171', '10', '4', '410881', '81');
INSERT INTO `qm_region` VALUES ('260170', '沁阳市', '258171', '11', '4', '410882', '82');
INSERT INTO `qm_region` VALUES ('260515', '孟州市', '258171', '12', '4', '410883', '83');
INSERT INTO `qm_region` VALUES ('260814', '濮阳市', '237641', '9', '3', '4109', '09');
INSERT INTO `qm_region` VALUES ('260815', '市辖区', '260814', '1', '4', '410901', '01');
INSERT INTO `qm_region` VALUES ('260816', '华龙区', '260814', '2', '4', '410902', '02');
INSERT INTO `qm_region` VALUES ('261119', '清丰县', '260814', '3', '4', '410922', '22');
INSERT INTO `qm_region` VALUES ('261651', '南乐县', '260814', '4', '4', '410923', '23');
INSERT INTO `qm_region` VALUES ('261986', '范县', '260814', '5', '4', '410926', '26');
INSERT INTO `qm_region` VALUES ('262596', '台前县', '260814', '6', '4', '410927', '27');
INSERT INTO `qm_region` VALUES ('262976', '濮阳县', '260814', '7', '4', '410928', '28');
INSERT INTO `qm_region` VALUES ('264000', '许昌市', '237641', '10', '3', '4110', '10');
INSERT INTO `qm_region` VALUES ('264001', '市辖区', '264000', '1', '4', '411001', '01');
INSERT INTO `qm_region` VALUES ('264002', '魏都区', '264000', '2', '4', '411002', '02');
INSERT INTO `qm_region` VALUES ('264117', '许昌县', '264000', '3', '4', '411023', '23');
INSERT INTO `qm_region` VALUES ('264585', '鄢陵县', '264000', '4', '4', '411024', '24');
INSERT INTO `qm_region` VALUES ('264980', '襄城县', '264000', '5', '4', '411025', '25');
INSERT INTO `qm_region` VALUES ('265439', '禹州市', '264000', '6', '4', '411081', '81');
INSERT INTO `qm_region` VALUES ('266123', '长葛市', '264000', '7', '4', '411082', '82');
INSERT INTO `qm_region` VALUES ('266517', '漯河市', '237641', '11', '3', '4111', '11');
INSERT INTO `qm_region` VALUES ('266518', '市辖区', '266517', '1', '4', '411101', '01');
INSERT INTO `qm_region` VALUES ('266519', '源汇区', '266517', '2', '4', '411102', '02');
INSERT INTO `qm_region` VALUES ('266655', '郾城区', '266517', '3', '4', '411103', '03');
INSERT INTO `qm_region` VALUES ('266861', '召陵区', '266517', '4', '4', '411104', '04');
INSERT INTO `qm_region` VALUES ('267096', '舞阳县', '266517', '5', '4', '411121', '21');
INSERT INTO `qm_region` VALUES ('267508', '临颖县', '266517', '6', '4', '411122', '22');
INSERT INTO `qm_region` VALUES ('267887', '三门峡市', '237641', '12', '3', '4112', '12');
INSERT INTO `qm_region` VALUES ('267888', '市辖区', '267887', '1', '4', '411201', '01');
INSERT INTO `qm_region` VALUES ('267889', '湖滨区', '267887', '2', '4', '411202', '02');
INSERT INTO `qm_region` VALUES ('267989', '渑池县', '267887', '3', '4', '411221', '21');
INSERT INTO `qm_region` VALUES ('268247', '陕县', '267887', '4', '4', '411222', '22');
INSERT INTO `qm_region` VALUES ('268532', '卢氏县', '267887', '5', '4', '411224', '24');
INSERT INTO `qm_region` VALUES ('268919', '义马市', '267887', '6', '4', '411281', '81');
INSERT INTO `qm_region` VALUES ('268967', '灵宝市', '267887', '7', '4', '411282', '82');
INSERT INTO `qm_region` VALUES ('269442', '南阳市', '237641', '13', '3', '4113', '13');
INSERT INTO `qm_region` VALUES ('269443', '市辖区', '269442', '1', '4', '411301', '01');
INSERT INTO `qm_region` VALUES ('269444', '宛城区', '269442', '2', '4', '411302', '02');
INSERT INTO `qm_region` VALUES ('269786', '卧龙区', '269442', '3', '4', '411303', '03');
INSERT INTO `qm_region` VALUES ('270103', '南召县', '269442', '4', '4', '411321', '21');
INSERT INTO `qm_region` VALUES ('270470', '方城县', '269442', '5', '4', '411322', '22');
INSERT INTO `qm_region` VALUES ('271054', '西峡县', '269442', '6', '4', '411323', '23');
INSERT INTO `qm_region` VALUES ('271375', '镇平县', '269442', '7', '4', '411324', '24');
INSERT INTO `qm_region` VALUES ('271828', '内乡县', '269442', '8', '4', '411325', '25');
INSERT INTO `qm_region` VALUES ('272141', '淅川县', '269442', '9', '4', '411326', '26');
INSERT INTO `qm_region` VALUES ('272679', '社旗县', '269442', '10', '4', '411327', '27');
INSERT INTO `qm_region` VALUES ('272941', '唐河县', '269442', '11', '4', '411328', '28');
INSERT INTO `qm_region` VALUES ('273472', '新野县', '269442', '12', '4', '411329', '29');
INSERT INTO `qm_region` VALUES ('273751', '桐柏县', '269442', '13', '4', '411330', '30');
INSERT INTO `qm_region` VALUES ('273983', '邓州市', '269442', '14', '4', '411381', '81');
INSERT INTO `qm_region` VALUES ('274594', '商丘市', '237641', '14', '3', '4114', '14');
INSERT INTO `qm_region` VALUES ('274595', '市辖区', '274594', '1', '4', '411401', '01');
INSERT INTO `qm_region` VALUES ('274596', '梁园区', '274594', '2', '4', '411402', '02');
INSERT INTO `qm_region` VALUES ('274923', '睢阳区', '274594', '3', '4', '411403', '03');
INSERT INTO `qm_region` VALUES ('275318', '民权县', '274594', '4', '4', '411421', '21');
INSERT INTO `qm_region` VALUES ('275887', '睢县', '274594', '5', '4', '411422', '22');
INSERT INTO `qm_region` VALUES ('276465', '宁陵县', '274594', '6', '4', '411423', '23');
INSERT INTO `qm_region` VALUES ('276844', '柘城县', '274594', '7', '4', '411424', '24');
INSERT INTO `qm_region` VALUES ('277375', '虞城县', '274594', '8', '4', '411425', '25');
INSERT INTO `qm_region` VALUES ('278065', '夏邑县', '274594', '9', '4', '411426', '26');
INSERT INTO `qm_region` VALUES ('278835', '永城市', '274594', '10', '4', '411481', '81');
INSERT INTO `qm_region` VALUES ('279630', '信阳市', '237641', '15', '3', '4115', '15');
INSERT INTO `qm_region` VALUES ('279631', '市辖区', '279630', '1', '4', '411501', '01');
INSERT INTO `qm_region` VALUES ('279632', '?负忧', '279630', '2', '4', '411502', '02');
INSERT INTO `qm_region` VALUES ('279903', '平桥区', '279630', '3', '4', '411503', '03');
INSERT INTO `qm_region` VALUES ('280237', '罗山县', '279630', '4', '4', '411521', '21');
INSERT INTO `qm_region` VALUES ('280559', '光山县', '279630', '5', '4', '411522', '22');
INSERT INTO `qm_region` VALUES ('280930', '新县', '279630', '6', '4', '411523', '23');
INSERT INTO `qm_region` VALUES ('281151', '商城县', '279630', '7', '4', '411524', '24');
INSERT INTO `qm_region` VALUES ('281543', '固始县', '279630', '8', '4', '411525', '25');
INSERT INTO `qm_region` VALUES ('282191', '潢川县', '279630', '9', '4', '411526', '26');
INSERT INTO `qm_region` VALUES ('282500', '淮滨县', '279630', '10', '4', '411527', '27');
INSERT INTO `qm_region` VALUES ('282812', '息县', '279630', '11', '4', '411528', '28');
INSERT INTO `qm_region` VALUES ('283179', '周口市', '237641', '16', '3', '4116', '16');
INSERT INTO `qm_region` VALUES ('283180', '市辖区', '283179', '1', '4', '411601', '01');
INSERT INTO `qm_region` VALUES ('283181', '川汇区', '283179', '2', '4', '411602', '02');
INSERT INTO `qm_region` VALUES ('283333', '扶沟县', '283179', '3', '4', '411621', '21');
INSERT INTO `qm_region` VALUES ('283761', '西华县', '283179', '4', '4', '411622', '22');
INSERT INTO `qm_region` VALUES ('284256', '商水县', '283179', '5', '4', '411623', '23');
INSERT INTO `qm_region` VALUES ('284866', '沈丘县', '283179', '6', '4', '411624', '24');
INSERT INTO `qm_region` VALUES ('285459', '郸城县', '283179', '7', '4', '411625', '25');
INSERT INTO `qm_region` VALUES ('285997', '淮阳县', '283179', '8', '4', '411626', '26');
INSERT INTO `qm_region` VALUES ('286520', '太康县', '283179', '9', '4', '411627', '27');
INSERT INTO `qm_region` VALUES ('287333', '鹿邑县', '283179', '10', '4', '411628', '28');
INSERT INTO `qm_region` VALUES ('287919', '项城市', '283179', '11', '4', '411681', '81');
INSERT INTO `qm_region` VALUES ('288419', '驻马店市', '237641', '17', '3', '4117', '17');
INSERT INTO `qm_region` VALUES ('288420', '市辖区', '288419', '1', '4', '411701', '01');
INSERT INTO `qm_region` VALUES ('288421', '驿城区', '288419', '2', '4', '411702', '02');
INSERT INTO `qm_region` VALUES ('288604', '西平县', '288419', '3', '4', '411721', '21');
INSERT INTO `qm_region` VALUES ('288840', '上蔡县', '288419', '4', '4', '411722', '22');
INSERT INTO `qm_region` VALUES ('289324', '平舆县', '288419', '5', '4', '411723', '23');
INSERT INTO `qm_region` VALUES ('289563', '正阳县', '288419', '6', '4', '411724', '24');
INSERT INTO `qm_region` VALUES ('289881', '确山县', '288419', '7', '4', '411725', '25');
INSERT INTO `qm_region` VALUES ('290103', '泌阳县', '288419', '8', '4', '411726', '26');
INSERT INTO `qm_region` VALUES ('290527', '汝南县', '288419', '9', '4', '411727', '27');
INSERT INTO `qm_region` VALUES ('290826', '遂平县', '288419', '10', '4', '411728', '28');
INSERT INTO `qm_region` VALUES ('291047', '新蔡县', '288419', '11', '4', '411729', '29');
INSERT INTO `qm_region` VALUES ('291426', '黑龙江省', '1', '14', '2', '23', '23');
INSERT INTO `qm_region` VALUES ('291427', '哈尔滨市', '291426', '1', '3', '2301', '01');
INSERT INTO `qm_region` VALUES ('291428', '市辖区', '291427', '1', '4', '230101', '01');
INSERT INTO `qm_region` VALUES ('291429', '道里区', '291427', '2', '4', '230102', '02');
INSERT INTO `qm_region` VALUES ('291603', '南岗区', '291427', '3', '4', '230103', '03');
INSERT INTO `qm_region` VALUES ('291776', '道外区', '291427', '4', '4', '230104', '04');
INSERT INTO `qm_region` VALUES ('291962', '平房区', '291427', '5', '4', '230108', '08');
INSERT INTO `qm_region` VALUES ('292008', '松北区', '291427', '6', '4', '230109', '09');
INSERT INTO `qm_region` VALUES ('292070', '香坊区', '291427', '7', '4', '230110', '10');
INSERT INTO `qm_region` VALUES ('292248', '呼兰区', '291427', '8', '4', '230111', '11');
INSERT INTO `qm_region` VALUES ('292451', '阿城区', '291427', '9', '4', '230112', '12');
INSERT INTO `qm_region` VALUES ('292679', '依兰县', '291427', '10', '4', '230123', '23');
INSERT INTO `qm_region` VALUES ('292861', '方正县', '291427', '11', '4', '230124', '24');
INSERT INTO `qm_region` VALUES ('292967', '宾县', '291427', '12', '4', '230125', '25');
INSERT INTO `qm_region` VALUES ('293206', '巴彦县', '291427', '13', '4', '230126', '26');
INSERT INTO `qm_region` VALUES ('293379', '木兰县', '291427', '14', '4', '230127', '27');
INSERT INTO `qm_region` VALUES ('293497', '通河县', '291427', '15', '4', '230128', '28');
INSERT INTO `qm_region` VALUES ('293673', '延寿县', '291427', '16', '4', '230129', '29');
INSERT INTO `qm_region` VALUES ('293824', '双城市', '291427', '17', '4', '230182', '82');
INSERT INTO `qm_region` VALUES ('294180', '尚志市', '291427', '18', '4', '230183', '83');
INSERT INTO `qm_region` VALUES ('294432', '五常市', '291427', '19', '4', '230184', '84');
INSERT INTO `qm_region` VALUES ('294766', '齐齐哈尔市', '291426', '2', '3', '2302', '02');
INSERT INTO `qm_region` VALUES ('294767', '市辖区', '294766', '1', '4', '230201', '01');
INSERT INTO `qm_region` VALUES ('294768', '龙沙区', '294766', '2', '4', '230202', '02');
INSERT INTO `qm_region` VALUES ('294842', '建华区', '294766', '3', '4', '230203', '03');
INSERT INTO `qm_region` VALUES ('294899', '铁锋区', '294766', '4', '4', '230204', '04');
INSERT INTO `qm_region` VALUES ('294993', '昂昂溪区', '294766', '5', '4', '230205', '05');
INSERT INTO `qm_region` VALUES ('295033', '富拉尔基区', '294766', '6', '4', '230206', '06');
INSERT INTO `qm_region` VALUES ('295132', '碾子山区', '294766', '7', '4', '230207', '07');
INSERT INTO `qm_region` VALUES ('295167', '梅里斯达斡尔族区', '294766', '8', '4', '230208', '08');
INSERT INTO `qm_region` VALUES ('295231', '龙江县', '294766', '9', '4', '230221', '21');
INSERT INTO `qm_region` VALUES ('295417', '依安县', '294766', '10', '4', '230223', '23');
INSERT INTO `qm_region` VALUES ('295628', '泰来县', '294766', '11', '4', '230224', '24');
INSERT INTO `qm_region` VALUES ('295757', '甘南县', '294766', '12', '4', '230225', '25');
INSERT INTO `qm_region` VALUES ('295911', '富裕县', '294766', '13', '4', '230227', '27');
INSERT INTO `qm_region` VALUES ('296024', '克山县', '294766', '14', '4', '230229', '29');
INSERT INTO `qm_region` VALUES ('296195', '克东县', '294766', '15', '4', '230230', '30');
INSERT INTO `qm_region` VALUES ('296364', '拜泉县', '294766', '16', '4', '230231', '31');
INSERT INTO `qm_region` VALUES ('296574', '讷河市', '294766', '17', '4', '230281', '81');
INSERT INTO `qm_region` VALUES ('296807', '鸡西市', '291426', '3', '3', '2303', '03');
INSERT INTO `qm_region` VALUES ('296808', '市辖区', '296807', '1', '4', '230301', '01');
INSERT INTO `qm_region` VALUES ('296809', '鸡冠区', '296807', '2', '4', '230302', '02');
INSERT INTO `qm_region` VALUES ('296871', '恒山区', '296807', '3', '4', '230303', '03');
INSERT INTO `qm_region` VALUES ('296935', '滴道区', '296807', '4', '4', '230304', '04');
INSERT INTO `qm_region` VALUES ('296980', '梨树区', '296807', '5', '4', '230305', '05');
INSERT INTO `qm_region` VALUES ('297009', '城子河区', '296807', '6', '4', '230306', '06');
INSERT INTO `qm_region` VALUES ('297049', '麻山区', '296807', '7', '4', '230307', '07');
INSERT INTO `qm_region` VALUES ('297075', '鸡东县', '296807', '8', '4', '230321', '21');
INSERT INTO `qm_region` VALUES ('297247', '虎林市', '296807', '9', '4', '230381', '81');
INSERT INTO `qm_region` VALUES ('297480', '密山市', '296807', '10', '4', '230382', '82');
INSERT INTO `qm_region` VALUES ('297701', '鹤岗市', '291426', '4', '3', '2304', '04');
INSERT INTO `qm_region` VALUES ('297702', '市辖区', '297701', '1', '4', '230401', '01');
INSERT INTO `qm_region` VALUES ('297703', '向阳区', '297701', '2', '4', '230402', '02');
INSERT INTO `qm_region` VALUES ('297726', '工农区', '297701', '3', '4', '230403', '03');
INSERT INTO `qm_region` VALUES ('297751', '南山区', '297701', '4', '4', '230404', '04');
INSERT INTO `qm_region` VALUES ('297780', '兴安区', '297701', '5', '4', '230405', '05');
INSERT INTO `qm_region` VALUES ('297804', '东山区', '297701', '6', '4', '230406', '06');
INSERT INTO `qm_region` VALUES ('297884', '兴山区', '297701', '7', '4', '230407', '07');
INSERT INTO `qm_region` VALUES ('297905', '萝北县', '297701', '8', '4', '230421', '21');
INSERT INTO `qm_region` VALUES ('298056', '绥滨县', '297701', '9', '4', '230422', '22');
INSERT INTO `qm_region` VALUES ('298208', '双鸭山市', '291426', '5', '3', '2305', '05');
INSERT INTO `qm_region` VALUES ('298209', '市辖区', '298208', '1', '4', '230501', '01');
INSERT INTO `qm_region` VALUES ('298210', '尖山区', '298208', '2', '4', '230502', '02');
INSERT INTO `qm_region` VALUES ('298260', '岭东区', '298208', '3', '4', '230503', '03');
INSERT INTO `qm_region` VALUES ('298299', '四方台区', '298208', '4', '4', '230505', '05');
INSERT INTO `qm_region` VALUES ('298333', '宝山区', '298208', '5', '4', '230506', '06');
INSERT INTO `qm_region` VALUES ('298379', '集贤县', '298208', '6', '4', '230521', '21');
INSERT INTO `qm_region` VALUES ('298602', '友谊县', '298208', '7', '4', '230522', '22');
INSERT INTO `qm_region` VALUES ('298702', '宝清县', '298208', '8', '4', '230523', '23');
INSERT INTO `qm_region` VALUES ('298934', '饶河县', '298208', '9', '4', '230524', '24');
INSERT INTO `qm_region` VALUES ('299119', '大庆市', '291426', '6', '3', '2306', '06');
INSERT INTO `qm_region` VALUES ('299120', '市辖区', '299119', '1', '4', '230601', '01');
INSERT INTO `qm_region` VALUES ('299121', '萨尔图区', '299119', '2', '4', '230602', '02');
INSERT INTO `qm_region` VALUES ('299176', '龙凤区', '299119', '3', '4', '230603', '03');
INSERT INTO `qm_region` VALUES ('299223', '让胡路区', '299119', '4', '4', '230604', '04');
INSERT INTO `qm_region` VALUES ('299306', '红岗区', '299119', '5', '4', '230605', '05');
INSERT INTO `qm_region` VALUES ('299347', '大同区', '299119', '6', '4', '230606', '06');
INSERT INTO `qm_region` VALUES ('299448', '肇州县', '299119', '7', '4', '230621', '21');
INSERT INTO `qm_region` VALUES ('299580', '肇源县', '299119', '8', '4', '230622', '22');
INSERT INTO `qm_region` VALUES ('299762', '林甸县', '299119', '9', '4', '230623', '23');
INSERT INTO `qm_region` VALUES ('299870', '杜尔伯特县', '299119', '10', '4', '230624', '24');
INSERT INTO `qm_region` VALUES ('299997', '伊春市', '291426', '7', '3', '2307', '07');
INSERT INTO `qm_region` VALUES ('299998', '市辖区', '299997', '1', '4', '230701', '01');
INSERT INTO `qm_region` VALUES ('299999', '伊春区', '299997', '2', '4', '230702', '02');
INSERT INTO `qm_region` VALUES ('300048', '南岔区', '299997', '3', '4', '230703', '03');
INSERT INTO `qm_region` VALUES ('300136', '友好区', '299997', '4', '4', '230704', '04');
INSERT INTO `qm_region` VALUES ('300183', '西林区', '299997', '5', '4', '230705', '05');
INSERT INTO `qm_region` VALUES ('300201', '翠峦区', '299997', '6', '4', '230706', '06');
INSERT INTO `qm_region` VALUES ('300236', '新青区', '299997', '7', '4', '230707', '07');
INSERT INTO `qm_region` VALUES ('300275', '美溪区', '299997', '8', '4', '230708', '08');
INSERT INTO `qm_region` VALUES ('300313', '金山屯区', '299997', '9', '4', '230709', '09');
INSERT INTO `qm_region` VALUES ('300349', '五营区', '299997', '10', '4', '230710', '10');
INSERT INTO `qm_region` VALUES ('300381', '乌马河区', '299997', '11', '4', '230711', '11');
INSERT INTO `qm_region` VALUES ('300419', '汤旺河区', '299997', '12', '4', '230712', '12');
INSERT INTO `qm_region` VALUES ('300462', '带岭区', '299997', '13', '4', '230713', '13');
INSERT INTO `qm_region` VALUES ('300501', '乌伊岭区', '299997', '14', '4', '230714', '14');
INSERT INTO `qm_region` VALUES ('300535', '红星区', '299997', '15', '4', '230715', '15');
INSERT INTO `qm_region` VALUES ('300565', '上甘岭区', '299997', '16', '4', '230716', '16');
INSERT INTO `qm_region` VALUES ('300599', '嘉荫县', '299997', '17', '4', '230722', '22');
INSERT INTO `qm_region` VALUES ('300722', '铁力市', '299997', '18', '4', '230781', '81');
INSERT INTO `qm_region` VALUES ('300907', '佳木斯市', '291426', '8', '3', '2308', '08');
INSERT INTO `qm_region` VALUES ('300908', '市辖区', '300907', '1', '4', '230801', '01');
INSERT INTO `qm_region` VALUES ('300909', '向阳区', '300907', '2', '4', '230803', '03');
INSERT INTO `qm_region` VALUES ('300987', '前进区', '300907', '3', '4', '230804', '04');
INSERT INTO `qm_region` VALUES ('301036', '东风区', '300907', '4', '4', '230805', '05');
INSERT INTO `qm_region` VALUES ('301091', '郊区', '300907', '5', '4', '230811', '11');
INSERT INTO `qm_region` VALUES ('301250', '桦南县', '300907', '6', '4', '230822', '22');
INSERT INTO `qm_region` VALUES ('301517', '桦川县', '300907', '7', '4', '230826', '26');
INSERT INTO `qm_region` VALUES ('301653', '汤原县', '300907', '8', '4', '230828', '28');
INSERT INTO `qm_region` VALUES ('301818', '抚远县', '300907', '9', '4', '230833', '33');
INSERT INTO `qm_region` VALUES ('301933', '同江市', '300907', '10', '4', '230881', '81');
INSERT INTO `qm_region` VALUES ('302138', '富锦市', '300907', '11', '4', '230882', '82');
INSERT INTO `qm_region` VALUES ('302482', '七台河市', '291426', '9', '3', '2309', '09');
INSERT INTO `qm_region` VALUES ('302483', '市辖区', '302482', '1', '4', '230901', '01');
INSERT INTO `qm_region` VALUES ('302484', '新兴区', '302482', '2', '4', '230902', '02');
INSERT INTO `qm_region` VALUES ('302538', '桃山区', '302482', '3', '4', '230903', '03');
INSERT INTO `qm_region` VALUES ('302582', '茄子河区', '302482', '4', '4', '230904', '04');
INSERT INTO `qm_region` VALUES ('302669', '勃利县', '302482', '5', '4', '230921', '21');
INSERT INTO `qm_region` VALUES ('302887', '牡丹江市', '291426', '10', '3', '2310', '10');
INSERT INTO `qm_region` VALUES ('302888', '市辖区', '302887', '1', '4', '231001', '01');
INSERT INTO `qm_region` VALUES ('302889', '东安区', '302887', '2', '4', '231002', '02');
INSERT INTO `qm_region` VALUES ('302935', '阳明区', '302887', '3', '4', '231003', '03');
INSERT INTO `qm_region` VALUES ('302994', '爱民区', '302887', '4', '4', '231004', '04');
INSERT INTO `qm_region` VALUES ('303049', '西安区', '302887', '5', '4', '231005', '05');
INSERT INTO `qm_region` VALUES ('303119', '东宁县', '302887', '6', '4', '231024', '24');
INSERT INTO `qm_region` VALUES ('303272', '林口县', '302887', '7', '4', '231025', '25');
INSERT INTO `qm_region` VALUES ('303540', '绥芬河市', '302887', '8', '4', '231081', '81');
INSERT INTO `qm_region` VALUES ('303570', '海林市', '302887', '9', '4', '231083', '83');
INSERT INTO `qm_region` VALUES ('303815', '宁安市', '302887', '10', '4', '231084', '84');
INSERT INTO `qm_region` VALUES ('304112', '穆棱市', '302887', '11', '4', '231085', '85');
INSERT INTO `qm_region` VALUES ('304374', '黑河市', '291426', '11', '3', '2311', '11');
INSERT INTO `qm_region` VALUES ('304375', '市辖区', '304374', '1', '4', '231101', '01');
INSERT INTO `qm_region` VALUES ('304376', '爱辉区', '304374', '2', '4', '231102', '02');
INSERT INTO `qm_region` VALUES ('304547', '嫩江县', '304374', '3', '4', '231121', '21');
INSERT INTO `qm_region` VALUES ('304831', '逊克县', '304374', '4', '4', '231123', '23');
INSERT INTO `qm_region` VALUES ('304947', '孙吴县', '304374', '5', '4', '231124', '24');
INSERT INTO `qm_region` VALUES ('305087', '北安市', '304374', '6', '4', '231181', '81');
INSERT INTO `qm_region` VALUES ('305282', '五大连池市', '304374', '7', '4', '231182', '82');
INSERT INTO `qm_region` VALUES ('305535', '绥化市', '291426', '12', '3', '2312', '12');
INSERT INTO `qm_region` VALUES ('305536', '市辖区', '305535', '1', '4', '231201', '01');
INSERT INTO `qm_region` VALUES ('305537', '北林区', '305535', '2', '4', '231202', '02');
INSERT INTO `qm_region` VALUES ('305749', '望奎县', '305535', '3', '4', '231221', '21');
INSERT INTO `qm_region` VALUES ('305892', '兰西县', '305535', '4', '4', '231222', '22');
INSERT INTO `qm_region` VALUES ('306030', '青冈县', '305535', '5', '4', '231223', '23');
INSERT INTO `qm_region` VALUES ('306258', '庆安县', '305535', '6', '4', '231224', '24');
INSERT INTO `qm_region` VALUES ('306392', '明水县', '305535', '7', '4', '231225', '25');
INSERT INTO `qm_region` VALUES ('306523', '绥棱县', '305535', '8', '4', '231226', '26');
INSERT INTO `qm_region` VALUES ('306694', '安达市', '305535', '9', '4', '231281', '81');
INSERT INTO `qm_region` VALUES ('306872', '肇东市', '305535', '10', '4', '231282', '82');
INSERT INTO `qm_region` VALUES ('307122', '海伦市', '305535', '11', '4', '231283', '83');
INSERT INTO `qm_region` VALUES ('307447', '大兴安岭地区', '291426', '13', '3', '2327', '27');
INSERT INTO `qm_region` VALUES ('307448', '加格达奇区', '307447', '1', '4', '232701', '01');
INSERT INTO `qm_region` VALUES ('307494', '松岭区', '307447', '2', '4', '232702', '02');
INSERT INTO `qm_region` VALUES ('307510', '新林区', '307447', '3', '4', '232703', '03');
INSERT INTO `qm_region` VALUES ('307535', '呼中区', '307447', '4', '4', '232704', '04');
INSERT INTO `qm_region` VALUES ('307551', '呼玛县', '307447', '5', '4', '232721', '21');
INSERT INTO `qm_region` VALUES ('307628', '塔河县', '307447', '6', '4', '232722', '22');
INSERT INTO `qm_region` VALUES ('307671', '漠河县', '307447', '7', '4', '232723', '23');
INSERT INTO `qm_region` VALUES ('307715', '湖北省', '1', '15', '2', '42', '42');
INSERT INTO `qm_region` VALUES ('307716', '武汉市', '307715', '1', '3', '4201', '01');
INSERT INTO `qm_region` VALUES ('307717', '市辖区', '307716', '1', '4', '420101', '01');
INSERT INTO `qm_region` VALUES ('307718', '江岸区', '307716', '2', '4', '420102', '02');
INSERT INTO `qm_region` VALUES ('307924', '江汉区', '307716', '3', '4', '420103', '03');
INSERT INTO `qm_region` VALUES ('308053', '汉口区', '307716', '4', '4', '420104', '04');
INSERT INTO `qm_region` VALUES ('308207', '汉阳区', '307716', '5', '4', '420105', '05');
INSERT INTO `qm_region` VALUES ('308358', '武昌区', '307716', '6', '4', '420106', '06');
INSERT INTO `qm_region` VALUES ('308571', '青山区', '307716', '7', '4', '420107', '07');
INSERT INTO `qm_region` VALUES ('308692', '洪山区', '307716', '8', '4', '420111', '11');
INSERT INTO `qm_region` VALUES ('308965', '东西湖区', '307716', '9', '4', '420112', '12');
INSERT INTO `qm_region` VALUES ('309114', '汉南区', '307716', '10', '4', '420113', '13');
INSERT INTO `qm_region` VALUES ('309186', '蔡甸区', '307716', '11', '4', '420114', '14');
INSERT INTO `qm_region` VALUES ('309596', '江夏区', '307716', '12', '4', '420115', '15');
INSERT INTO `qm_region` VALUES ('310019', '黄陂区', '307716', '13', '4', '420116', '16');
INSERT INTO `qm_region` VALUES ('310694', '武汉市新洲区', '307716', '14', '4', '420117', '17');
INSERT INTO `qm_region` VALUES ('311356', '黄石市', '307715', '2', '3', '4202', '02');
INSERT INTO `qm_region` VALUES ('311357', '市辖区', '311356', '1', '4', '420201', '01');
INSERT INTO `qm_region` VALUES ('311358', '黄石港区', '311356', '2', '4', '420202', '02');
INSERT INTO `qm_region` VALUES ('311408', '西塞山区', '311356', '3', '4', '420203', '03');
INSERT INTO `qm_region` VALUES ('311473', '下陆区', '311356', '4', '4', '420204', '04');
INSERT INTO `qm_region` VALUES ('311525', '铁山区', '311356', '5', '4', '420205', '05');
INSERT INTO `qm_region` VALUES ('311549', '阳新县', '311356', '6', '4', '420222', '22');
INSERT INTO `qm_region` VALUES ('311906', '大冶市', '311356', '7', '4', '420281', '81');
INSERT INTO `qm_region` VALUES ('312328', '十堰市', '307715', '3', '3', '4203', '03');
INSERT INTO `qm_region` VALUES ('312329', '市辖区', '312328', '1', '4', '420301', '01');
INSERT INTO `qm_region` VALUES ('312330', '茅箭区', '312328', '2', '4', '420302', '02');
INSERT INTO `qm_region` VALUES ('312410', '张湾区', '312328', '3', '4', '420303', '03');
INSERT INTO `qm_region` VALUES ('312524', '郧县', '312328', '4', '4', '420321', '21');
INSERT INTO `qm_region` VALUES ('312891', '郧西县', '312328', '5', '4', '420322', '22');
INSERT INTO `qm_region` VALUES ('313251', '竹山县', '312328', '6', '4', '420323', '23');
INSERT INTO `qm_region` VALUES ('313528', '竹溪县', '312328', '7', '4', '420324', '24');
INSERT INTO `qm_region` VALUES ('313909', '房县', '312328', '8', '4', '420325', '25');
INSERT INTO `qm_region` VALUES ('314243', '丹江口市', '312328', '9', '4', '420381', '81');
INSERT INTO `qm_region` VALUES ('314530', '宜昌市', '307715', '4', '3', '4205', '05');
INSERT INTO `qm_region` VALUES ('314531', '市辖区', '314530', '1', '4', '420501', '01');
INSERT INTO `qm_region` VALUES ('314532', '西陵区', '314530', '2', '4', '420502', '02');
INSERT INTO `qm_region` VALUES ('314636', '伍家岗区', '314530', '3', '4', '420503', '03');
INSERT INTO `qm_region` VALUES ('314691', '点军区', '314530', '4', '4', '420504', '04');
INSERT INTO `qm_region` VALUES ('314750', '?亭区', '314530', '5', '4', '420505', '05');
INSERT INTO `qm_region` VALUES ('314775', '夷陵区', '314530', '6', '4', '420506', '06');
INSERT INTO `qm_region` VALUES ('315018', '远安县', '314530', '7', '4', '420525', '25');
INSERT INTO `qm_region` VALUES ('315144', '兴山县', '314530', '8', '4', '420526', '26');
INSERT INTO `qm_region` VALUES ('315267', '秭归县', '314530', '9', '4', '420527', '27');
INSERT INTO `qm_region` VALUES ('315472', '长阳土家族自治县', '314530', '10', '4', '420528', '28');
INSERT INTO `qm_region` VALUES ('315645', '五峰土家族自治县', '314530', '11', '4', '420529', '29');
INSERT INTO `qm_region` VALUES ('315762', '宜都市', '314530', '12', '4', '420581', '81');
INSERT INTO `qm_region` VALUES ('315933', '当阳市', '314530', '13', '4', '420582', '82');
INSERT INTO `qm_region` VALUES ('316120', '枝江市', '314530', '14', '4', '420583', '83');
INSERT INTO `qm_region` VALUES ('316350', '襄樊市', '307715', '5', '3', '4206', '06');
INSERT INTO `qm_region` VALUES ('316351', '市辖区', '316350', '1', '4', '420601', '01');
INSERT INTO `qm_region` VALUES ('316352', '襄城区', '316350', '2', '4', '420602', '02');
INSERT INTO `qm_region` VALUES ('316537', '樊城区', '316350', '3', '4', '420606', '06');
INSERT INTO `qm_region` VALUES ('316733', '襄阳区', '316350', '4', '4', '420607', '07');
INSERT INTO `qm_region` VALUES ('317199', '南漳县', '316350', '5', '4', '420624', '24');
INSERT INTO `qm_region` VALUES ('317500', '谷城县', '316350', '6', '4', '420625', '25');
INSERT INTO `qm_region` VALUES ('317799', '保康县', '316350', '7', '4', '420626', '26');
INSERT INTO `qm_region` VALUES ('318077', '老河口市', '316350', '8', '4', '420682', '82');
INSERT INTO `qm_region` VALUES ('318354', '枣阳市', '316350', '9', '4', '420683', '83');
INSERT INTO `qm_region` VALUES ('318952', '宜城市', '316350', '10', '4', '420684', '84');
INSERT INTO `qm_region` VALUES ('319186', '鄂州市', '307715', '6', '3', '4207', '07');
INSERT INTO `qm_region` VALUES ('319187', '市辖区', '319186', '1', '4', '420701', '01');
INSERT INTO `qm_region` VALUES ('319188', '粱子湖区', '319186', '2', '4', '420702', '02');
INSERT INTO `qm_region` VALUES ('319280', '华容区', '319186', '3', '4', '420703', '03');
INSERT INTO `qm_region` VALUES ('319404', '鄂城区', '319186', '4', '4', '420704', '04');
INSERT INTO `qm_region` VALUES ('319597', '荆门市', '307715', '7', '3', '4208', '08');
INSERT INTO `qm_region` VALUES ('319598', '市辖区', '319597', '1', '4', '420801', '01');
INSERT INTO `qm_region` VALUES ('319599', '东宝区', '319597', '2', '4', '420802', '02');
INSERT INTO `qm_region` VALUES ('319811', '掇刀区', '319597', '3', '4', '420804', '04');
INSERT INTO `qm_region` VALUES ('319917', '京山县', '319597', '4', '4', '420821', '21');
INSERT INTO `qm_region` VALUES ('320414', '沙洋县', '319597', '5', '4', '420822', '22');
INSERT INTO `qm_region` VALUES ('320732', '钟祥市', '319597', '6', '4', '420881', '81');
INSERT INTO `qm_region` VALUES ('321323', '孝感市', '307715', '8', '3', '4209', '09');
INSERT INTO `qm_region` VALUES ('321324', '市辖区', '321323', '1', '4', '420901', '01');
INSERT INTO `qm_region` VALUES ('321325', '孝南区', '321323', '2', '4', '420902', '02');
INSERT INTO `qm_region` VALUES ('321872', '孝昌县', '321323', '3', '4', '420921', '21');
INSERT INTO `qm_region` VALUES ('322343', '大悟县', '321323', '4', '4', '420922', '22');
INSERT INTO `qm_region` VALUES ('322737', '云梦县', '321323', '5', '4', '420923', '23');
INSERT INTO `qm_region` VALUES ('323049', '应城市', '321323', '6', '4', '420981', '81');
INSERT INTO `qm_region` VALUES ('323489', '安陆市', '321323', '7', '4', '420982', '82');
INSERT INTO `qm_region` VALUES ('323912', '汉川市', '321323', '8', '4', '420984', '84');
INSERT INTO `qm_region` VALUES ('324609', '荆州市', '307715', '9', '3', '4210', '10');
INSERT INTO `qm_region` VALUES ('324610', '市辖区', '324609', '1', '4', '421001', '01');
INSERT INTO `qm_region` VALUES ('324611', '沙市区', '324609', '2', '4', '421002', '02');
INSERT INTO `qm_region` VALUES ('324821', '荆州区', '324609', '3', '4', '421003', '03');
INSERT INTO `qm_region` VALUES ('325025', '公安县', '324609', '4', '4', '421022', '22');
INSERT INTO `qm_region` VALUES ('325459', '监利县', '324609', '5', '4', '421023', '23');
INSERT INTO `qm_region` VALUES ('326339', '江陵县', '324609', '6', '4', '421024', '24');
INSERT INTO `qm_region` VALUES ('326597', '石首市', '324609', '7', '4', '421081', '81');
INSERT INTO `qm_region` VALUES ('326949', '洪湖市', '324609', '8', '4', '421083', '83');
INSERT INTO `qm_region` VALUES ('327504', '松滋市', '324609', '9', '4', '421087', '87');
INSERT INTO `qm_region` VALUES ('327798', '黄冈市', '307715', '10', '3', '4211', '11');
INSERT INTO `qm_region` VALUES ('327799', '市辖区', '327798', '1', '4', '421101', '01');
INSERT INTO `qm_region` VALUES ('327800', '黄州区', '327798', '2', '4', '421102', '02');
INSERT INTO `qm_region` VALUES ('327946', '团风县', '327798', '3', '4', '421121', '21');
INSERT INTO `qm_region` VALUES ('328259', '红安县', '327798', '4', '4', '421122', '22');
INSERT INTO `qm_region` VALUES ('328700', '罗田县', '327798', '5', '4', '421123', '23');
INSERT INTO `qm_region` VALUES ('329141', '英山县', '327798', '6', '4', '421124', '24');
INSERT INTO `qm_region` VALUES ('329474', '浠水县', '327798', '7', '4', '421125', '25');
INSERT INTO `qm_region` VALUES ('330160', '蕲春县', '327798', '8', '4', '421126', '26');
INSERT INTO `qm_region` VALUES ('330763', '黄梅县', '327798', '9', '4', '421127', '27');
INSERT INTO `qm_region` VALUES ('331316', '麻城市', '327798', '10', '4', '421181', '81');
INSERT INTO `qm_region` VALUES ('332090', '武穴市', '327798', '11', '4', '421182', '82');
INSERT INTO `qm_region` VALUES ('332446', '咸宁市', '307715', '11', '3', '4212', '12');
INSERT INTO `qm_region` VALUES ('332447', '市辖区', '332446', '1', '4', '421201', '01');
INSERT INTO `qm_region` VALUES ('332448', '咸安区', '332446', '2', '4', '421202', '02');
INSERT INTO `qm_region` VALUES ('332769', '嘉鱼县', '332446', '3', '4', '421221', '21');
INSERT INTO `qm_region` VALUES ('332880', '通城县', '332446', '4', '4', '421222', '22');
INSERT INTO `qm_region` VALUES ('333078', '崇阳县', '332446', '5', '4', '421223', '23');
INSERT INTO `qm_region` VALUES ('333287', '通山县', '332446', '6', '4', '421224', '24');
INSERT INTO `qm_region` VALUES ('333503', '赤壁市', '332446', '7', '4', '421281', '81');
INSERT INTO `qm_region` VALUES ('333702', '随州市', '307715', '12', '3', '4213', '13');
INSERT INTO `qm_region` VALUES ('333703', '市辖区', '333702', '1', '4', '421301', '01');
INSERT INTO `qm_region` VALUES ('333704', '曾都区', '333702', '2', '4', '421302', '02');
INSERT INTO `qm_region` VALUES ('334339', '广水市', '333702', '3', '4', '421381', '81');
INSERT INTO `qm_region` VALUES ('334770', '恩施州', '307715', '13', '3', '4228', '28');
INSERT INTO `qm_region` VALUES ('334771', '恩施市', '334770', '1', '4', '422801', '01');
INSERT INTO `qm_region` VALUES ('334994', '利川市', '334770', '2', '4', '422802', '02');
INSERT INTO `qm_region` VALUES ('335590', '建始县', '334770', '3', '4', '422822', '22');
INSERT INTO `qm_region` VALUES ('336008', '巴东县', '334770', '4', '4', '422823', '23');
INSERT INTO `qm_region` VALUES ('336512', '宣恩县', '334770', '5', '4', '422825', '25');
INSERT INTO `qm_region` VALUES ('336804', '咸丰县', '334770', '6', '4', '422826', '26');
INSERT INTO `qm_region` VALUES ('337004', '来凤县', '334770', '7', '4', '422827', '27');
INSERT INTO `qm_region` VALUES ('337209', '鹤峰县', '334770', '8', '4', '422828', '28');
INSERT INTO `qm_region` VALUES ('337430', '省直辖行政单位', '307715', '14', '3', '4290', '90');
INSERT INTO `qm_region` VALUES ('337431', '仙桃市', '337430', '1', '4', '429004', '04');
INSERT INTO `qm_region` VALUES ('338224', '潜江市', '337430', '2', '4', '429005', '05');
INSERT INTO `qm_region` VALUES ('338708', '天门市', '337430', '3', '4', '429006', '06');
INSERT INTO `qm_region` VALUES ('339575', '神农架林区', '337430', '4', '4', '429021', '21');
INSERT INTO `qm_region` VALUES ('339656', '湖南省', '1', '17', '2', '43', '43');
INSERT INTO `qm_region` VALUES ('339657', '长沙市', '339656', '1', '3', '4301', '01');
INSERT INTO `qm_region` VALUES ('339658', '市辖区', '339657', '1', '4', '430101', '01');
INSERT INTO `qm_region` VALUES ('339659', '芙蓉区', '339657', '2', '4', '430102', '02');
INSERT INTO `qm_region` VALUES ('339744', '天心区', '339657', '3', '4', '430103', '03');
INSERT INTO `qm_region` VALUES ('339831', '岳麓区', '339657', '4', '4', '430104', '04');
INSERT INTO `qm_region` VALUES ('339951', '开福区', '339657', '5', '4', '430105', '05');
INSERT INTO `qm_region` VALUES ('340098', '雨花区', '339657', '6', '4', '430111', '11');
INSERT INTO `qm_region` VALUES ('340230', '长沙县', '339657', '7', '4', '430121', '21');
INSERT INTO `qm_region` VALUES ('340523', '望城县', '339657', '8', '4', '430122', '22');
INSERT INTO `qm_region` VALUES ('340762', '宁乡县', '339657', '9', '4', '430124', '24');
INSERT INTO `qm_region` VALUES ('341221', '浏阳市', '339657', '10', '4', '430181', '81');
INSERT INTO `qm_region` VALUES ('341672', '株洲市', '339656', '2', '3', '4302', '02');
INSERT INTO `qm_region` VALUES ('341673', '市辖区', '341672', '1', '4', '430201', '01');
INSERT INTO `qm_region` VALUES ('341674', '荷塘区', '341672', '2', '4', '430202', '02');
INSERT INTO `qm_region` VALUES ('341759', '芦淞区', '341672', '3', '4', '430203', '03');
INSERT INTO `qm_region` VALUES ('341830', '石峰区', '341672', '4', '4', '430204', '04');
INSERT INTO `qm_region` VALUES ('341920', '天元区', '341672', '5', '4', '430211', '11');
INSERT INTO `qm_region` VALUES ('341986', '株洲县', '341672', '6', '4', '430221', '21');
INSERT INTO `qm_region` VALUES ('342360', '攸县', '341672', '7', '4', '430223', '23');
INSERT INTO `qm_region` VALUES ('342912', '茶陵县', '341672', '8', '4', '430224', '24');
INSERT INTO `qm_region` VALUES ('343323', '炎陵县', '341672', '9', '4', '430225', '25');
INSERT INTO `qm_region` VALUES ('343556', '醴陵市', '341672', '10', '4', '430281', '81');
INSERT INTO `qm_region` VALUES ('343985', '湘潭市', '339656', '3', '3', '4303', '03');
INSERT INTO `qm_region` VALUES ('343986', '市辖区', '343985', '1', '4', '430301', '01');
INSERT INTO `qm_region` VALUES ('343987', '雨湖区', '343985', '2', '4', '430302', '02');
INSERT INTO `qm_region` VALUES ('344116', '岳塘区', '343985', '3', '4', '430304', '04');
INSERT INTO `qm_region` VALUES ('344285', '湘潭县', '343985', '4', '4', '430321', '21');
INSERT INTO `qm_region` VALUES ('345099', '湘乡市', '343985', '5', '4', '430381', '81');
INSERT INTO `qm_region` VALUES ('345878', '韶山市', '343985', '6', '4', '430382', '82');
INSERT INTO `qm_region` VALUES ('345952', '衡阳市', '339656', '4', '3', '4304', '04');
INSERT INTO `qm_region` VALUES ('345953', '市辖区', '345952', '1', '4', '430401', '01');
INSERT INTO `qm_region` VALUES ('345954', '珠晖区', '345952', '2', '4', '430405', '05');
INSERT INTO `qm_region` VALUES ('346074', '雁峰区', '345952', '3', '4', '430406', '06');
INSERT INTO `qm_region` VALUES ('346153', '石鼓区', '345952', '4', '4', '430407', '07');
INSERT INTO `qm_region` VALUES ('346232', '蒸湘区', '345952', '5', '4', '430408', '08');
INSERT INTO `qm_region` VALUES ('346313', '南岳区', '345952', '6', '4', '430412', '12');
INSERT INTO `qm_region` VALUES ('346355', '衡阳县', '345952', '7', '4', '430421', '21');
INSERT INTO `qm_region` VALUES ('347320', '衡南县', '345952', '8', '4', '430422', '22');
INSERT INTO `qm_region` VALUES ('348174', '衡山县', '345952', '9', '4', '430423', '23');
INSERT INTO `qm_region` VALUES ('348536', '衡东县', '345952', '10', '4', '430424', '24');
INSERT INTO `qm_region` VALUES ('349142', '祁东县', '345952', '11', '4', '430426', '26');
INSERT INTO `qm_region` VALUES ('350073', '耒阳市', '345952', '12', '4', '430481', '81');
INSERT INTO `qm_region` VALUES ('350784', '常宁市', '345952', '13', '4', '430482', '82');
INSERT INTO `qm_region` VALUES ('351593', '邵阳市', '339656', '5', '3', '4305', '05');
INSERT INTO `qm_region` VALUES ('351594', '市辖区', '351593', '1', '4', '430501', '01');
INSERT INTO `qm_region` VALUES ('351595', '双清区', '351593', '2', '4', '430502', '02');
INSERT INTO `qm_region` VALUES ('351725', '大祥区', '351593', '3', '4', '430503', '03');
INSERT INTO `qm_region` VALUES ('351870', '北塔区', '351593', '4', '4', '430511', '11');
INSERT INTO `qm_region` VALUES ('351936', '邵东县', '351593', '5', '4', '430521', '21');
INSERT INTO `qm_region` VALUES ('352972', '新邵县', '351593', '6', '4', '430522', '22');
INSERT INTO `qm_region` VALUES ('353671', '邵阳县', '351593', '7', '4', '430523', '23');
INSERT INTO `qm_region` VALUES ('354366', '隆回县', '351593', '8', '4', '430524', '24');
INSERT INTO `qm_region` VALUES ('355399', '洞口县', '351593', '9', '4', '430525', '25');
INSERT INTO `qm_region` VALUES ('356019', '绥宁县', '351593', '10', '4', '430527', '27');
INSERT INTO `qm_region` VALUES ('356416', '新宁县', '351593', '11', '4', '430528', '28');
INSERT INTO `qm_region` VALUES ('356942', '城步苗族自治县', '351593', '12', '4', '430529', '29');
INSERT INTO `qm_region` VALUES ('357263', '武冈市', '351593', '13', '4', '430581', '81');
INSERT INTO `qm_region` VALUES ('357788', '岳阳市', '339656', '6', '3', '4306', '06');
INSERT INTO `qm_region` VALUES ('357789', '市辖区', '357788', '1', '4', '430601', '01');
INSERT INTO `qm_region` VALUES ('357790', '岳阳楼区', '357788', '2', '4', '430602', '02');
INSERT INTO `qm_region` VALUES ('358005', '云溪区', '357788', '3', '4', '430603', '03');
INSERT INTO `qm_region` VALUES ('358102', '君山区', '357788', '4', '4', '430611', '11');
INSERT INTO `qm_region` VALUES ('358221', '岳阳县', '357788', '5', '4', '430621', '21');
INSERT INTO `qm_region` VALUES ('358849', '华容县', '357788', '6', '4', '430623', '23');
INSERT INTO `qm_region` VALUES ('359377', '湘阴县', '357788', '7', '4', '430624', '24');
INSERT INTO `qm_region` VALUES ('359846', '平江县', '357788', '8', '4', '430626', '26');
INSERT INTO `qm_region` VALUES ('360679', '汩罗市', '357788', '9', '4', '430681', '81');
INSERT INTO `qm_region` VALUES ('361193', '临湘市', '357788', '10', '4', '430682', '82');
INSERT INTO `qm_region` VALUES ('361534', '常德市', '339656', '7', '3', '4307', '07');
INSERT INTO `qm_region` VALUES ('361535', '市辖区', '361534', '1', '4', '430701', '01');
INSERT INTO `qm_region` VALUES ('361536', '武陵区', '361534', '2', '4', '430702', '02');
INSERT INTO `qm_region` VALUES ('361727', '鼎城区', '361534', '3', '4', '430703', '03');
INSERT INTO `qm_region` VALUES ('362433', '安乡县', '361534', '4', '4', '430721', '21');
INSERT INTO `qm_region` VALUES ('362766', '汉寿县', '361534', '5', '4', '430722', '22');
INSERT INTO `qm_region` VALUES ('363375', '澧县', '361534', '6', '4', '430723', '23');
INSERT INTO `qm_region` VALUES ('363882', '临澧县', '361534', '7', '4', '430724', '24');
INSERT INTO `qm_region` VALUES ('364241', '桃源县', '361534', '8', '4', '430725', '25');
INSERT INTO `qm_region` VALUES ('365158', '石门县', '361534', '9', '4', '430726', '26');
INSERT INTO `qm_region` VALUES ('365896', '津市市', '361534', '10', '4', '430781', '81');
INSERT INTO `qm_region` VALUES ('366030', '张家界市', '339656', '8', '3', '4308', '08');
INSERT INTO `qm_region` VALUES ('366031', '市辖区', '366030', '1', '4', '430801', '01');
INSERT INTO `qm_region` VALUES ('366032', '永定区', '366030', '2', '4', '430802', '02');
INSERT INTO `qm_region` VALUES ('366435', '武陵源区', '366030', '3', '4', '430811', '11');
INSERT INTO `qm_region` VALUES ('366485', '慈利县', '366030', '4', '4', '430821', '21');
INSERT INTO `qm_region` VALUES ('367201', '桑植县', '366030', '5', '4', '430822', '22');
INSERT INTO `qm_region` VALUES ('367799', '益阳市', '339656', '9', '3', '4309', '09');
INSERT INTO `qm_region` VALUES ('367800', '市辖区', '367799', '1', '4', '430901', '01');
INSERT INTO `qm_region` VALUES ('367801', '资阳区', '367799', '2', '4', '430902', '02');
INSERT INTO `qm_region` VALUES ('368039', '赫山区', '367799', '3', '4', '430903', '03');
INSERT INTO `qm_region` VALUES ('368611', '南县', '367799', '4', '4', '430921', '21');
INSERT INTO `qm_region` VALUES ('369150', '桃江县', '367799', '5', '4', '430922', '22');
INSERT INTO `qm_region` VALUES ('369990', '安化县', '367799', '6', '4', '430923', '23');
INSERT INTO `qm_region` VALUES ('371197', '沅江市', '367799', '7', '4', '430981', '81');
INSERT INTO `qm_region` VALUES ('371667', '郴州市', '339656', '10', '3', '4310', '10');
INSERT INTO `qm_region` VALUES ('371668', '市辖区', '371667', '1', '4', '431001', '01');
INSERT INTO `qm_region` VALUES ('371669', '北湖区', '371667', '2', '4', '431002', '02');
INSERT INTO `qm_region` VALUES ('371865', '苏仙区', '371667', '3', '4', '431003', '03');
INSERT INTO `qm_region` VALUES ('372119', '桂阳县', '371667', '4', '4', '431021', '21');
INSERT INTO `qm_region` VALUES ('372660', '宜章县', '371667', '5', '4', '431022', '22');
INSERT INTO `qm_region` VALUES ('373054', '永兴县', '371667', '6', '4', '431023', '23');
INSERT INTO `qm_region` VALUES ('373444', '嘉禾县', '371667', '7', '4', '431024', '24');
INSERT INTO `qm_region` VALUES ('373743', '临武县', '371667', '8', '4', '431025', '25');
INSERT INTO `qm_region` VALUES ('374066', '汝城县', '371667', '9', '4', '431026', '26');
INSERT INTO `qm_region` VALUES ('374404', '桂东县', '371667', '10', '4', '431027', '27');
INSERT INTO `qm_region` VALUES ('374581', '安仁县', '371667', '11', '4', '431028', '28');
INSERT INTO `qm_region` VALUES ('374828', '资兴市', '371667', '12', '4', '431081', '81');
INSERT INTO `qm_region` VALUES ('375137', '永州市', '339656', '11', '3', '4311', '11');
INSERT INTO `qm_region` VALUES ('375138', '市辖区', '375137', '1', '4', '431101', '01');
INSERT INTO `qm_region` VALUES ('375139', '零陵区', '375137', '2', '4', '431102', '02');
INSERT INTO `qm_region` VALUES ('375697', '冷水滩区', '375137', '3', '4', '431103', '03');
INSERT INTO `qm_region` VALUES ('376075', '祁阳县', '375137', '4', '4', '431121', '21');
INSERT INTO `qm_region` VALUES ('377069', '东安县', '375137', '5', '4', '431122', '22');
INSERT INTO `qm_region` VALUES ('377626', '双牌县', '375137', '6', '4', '431123', '23');
INSERT INTO `qm_region` VALUES ('377841', '道县', '375137', '7', '4', '431124', '24');
INSERT INTO `qm_region` VALUES ('378445', '江永县', '375137', '8', '4', '431125', '25');
INSERT INTO `qm_region` VALUES ('378695', '宁远县', '375137', '9', '4', '431126', '26');
INSERT INTO `qm_region` VALUES ('379412', '蓝山县', '375137', '10', '4', '431127', '27');
INSERT INTO `qm_region` VALUES ('379810', '新田县', '375137', '11', '4', '431128', '28');
INSERT INTO `qm_region` VALUES ('380215', '江华县', '375137', '12', '4', '431129', '29');
INSERT INTO `qm_region` VALUES ('380758', '怀化市', '339656', '12', '3', '4312', '12');
INSERT INTO `qm_region` VALUES ('380759', '市辖区', '380758', '1', '4', '431201', '01');
INSERT INTO `qm_region` VALUES ('380760', '鹤城区', '380758', '2', '4', '431202', '02');
INSERT INTO `qm_region` VALUES ('380903', '中方县', '380758', '3', '4', '431221', '21');
INSERT INTO `qm_region` VALUES ('381150', '沅陵县', '380758', '4', '4', '431222', '22');
INSERT INTO `qm_region` VALUES ('381672', '辰溪县', '380758', '5', '4', '431223', '23');
INSERT INTO `qm_region` VALUES ('382162', '溆浦县', '380758', '6', '4', '431224', '24');
INSERT INTO `qm_region` VALUES ('382896', '会同县', '380758', '7', '4', '431225', '25');
INSERT INTO `qm_region` VALUES ('383283', '麻阳苗族自治县', '380758', '8', '4', '431226', '26');
INSERT INTO `qm_region` VALUES ('383632', '新晃侗族自治县', '380758', '9', '4', '431227', '27');
INSERT INTO `qm_region` VALUES ('383966', '芷江侗族自治县', '380758', '10', '4', '431228', '28');
INSERT INTO `qm_region` VALUES ('384305', '靖州苗族侗族县', '380758', '11', '4', '431229', '29');
INSERT INTO `qm_region` VALUES ('384518', '通道侗族自治县', '380758', '12', '4', '431230', '30');
INSERT INTO `qm_region` VALUES ('384796', '洪江市', '380758', '13', '4', '431281', '81');
INSERT INTO `qm_region` VALUES ('385214', '娄底市', '339656', '13', '3', '4313', '13');
INSERT INTO `qm_region` VALUES ('385215', '市辖区', '385214', '1', '4', '431301', '01');
INSERT INTO `qm_region` VALUES ('385216', '娄星区', '385214', '2', '4', '431302', '02');
INSERT INTO `qm_region` VALUES ('385463', '双峰县', '385214', '3', '4', '431321', '21');
INSERT INTO `qm_region` VALUES ('386398', '新化县', '385214', '4', '4', '431322', '22');
INSERT INTO `qm_region` VALUES ('387617', '冷水江市', '385214', '5', '4', '431381', '81');
INSERT INTO `qm_region` VALUES ('387846', '涟源市', '385214', '6', '4', '431382', '82');
INSERT INTO `qm_region` VALUES ('388832', '湘西土家族苗族自治州', '339656', '14', '3', '4331', '31');
INSERT INTO `qm_region` VALUES ('388833', '吉首市', '388832', '1', '4', '433101', '01');
INSERT INTO `qm_region` VALUES ('389020', '泸溪县', '388832', '2', '4', '433122', '22');
INSERT INTO `qm_region` VALUES ('389188', '凤凰县', '388832', '3', '4', '433123', '23');
INSERT INTO `qm_region` VALUES ('389572', '花垣县', '388832', '4', '4', '433124', '24');
INSERT INTO `qm_region` VALUES ('389897', '保靖县', '388832', '5', '4', '433125', '25');
INSERT INTO `qm_region` VALUES ('390126', '古丈县', '388832', '6', '4', '433126', '26');
INSERT INTO `qm_region` VALUES ('390288', '永顺县', '388832', '7', '4', '433127', '27');
INSERT INTO `qm_region` VALUES ('390646', '龙山县', '388832', '8', '4', '433130', '30');
INSERT INTO `qm_region` VALUES ('391143', '吉林省', '1', '18', '2', '22', '22');
INSERT INTO `qm_region` VALUES ('391144', '长春市', '391143', '1', '3', '2201', '01');
INSERT INTO `qm_region` VALUES ('391145', '长春市辖区', '391144', '1', '4', '220101', '01');
INSERT INTO `qm_region` VALUES ('391146', '南关区', '391144', '2', '4', '220102', '02');
INSERT INTO `qm_region` VALUES ('391287', '宽城区', '391144', '3', '4', '220103', '03');
INSERT INTO `qm_region` VALUES ('391466', '朝阳区', '391144', '4', '4', '220104', '04');
INSERT INTO `qm_region` VALUES ('391571', '二道区', '391144', '5', '4', '220105', '05');
INSERT INTO `qm_region` VALUES ('391732', '绿园区', '391144', '6', '4', '220106', '06');
INSERT INTO `qm_region` VALUES ('391827', '双阳区', '391144', '7', '4', '220112', '12');
INSERT INTO `qm_region` VALUES ('391985', '农安县', '391144', '8', '4', '220122', '22');
INSERT INTO `qm_region` VALUES ('392377', '九台市', '391144', '9', '4', '220181', '81');
INSERT INTO `qm_region` VALUES ('392686', '榆树市', '391144', '10', '4', '220182', '82');
INSERT INTO `qm_region` VALUES ('393119', '德惠市', '391144', '11', '4', '220183', '83');
INSERT INTO `qm_region` VALUES ('393450', '吉林市', '391143', '2', '3', '2202', '02');
INSERT INTO `qm_region` VALUES ('393451', '吉林市辖区', '393450', '1', '4', '220201', '01');
INSERT INTO `qm_region` VALUES ('393452', '昌邑区', '393450', '2', '4', '220202', '02');
INSERT INTO `qm_region` VALUES ('393662', '龙潭区', '393450', '3', '4', '220203', '03');
INSERT INTO `qm_region` VALUES ('393845', '船营区', '393450', '4', '4', '220204', '04');
INSERT INTO `qm_region` VALUES ('393977', '丰满区', '393450', '5', '4', '220211', '11');
INSERT INTO `qm_region` VALUES ('394079', '永吉县', '393450', '6', '4', '220221', '21');
INSERT INTO `qm_region` VALUES ('394245', '蛟河市', '393450', '7', '4', '220281', '81');
INSERT INTO `qm_region` VALUES ('394583', '桦甸市', '393450', '8', '4', '220282', '82');
INSERT INTO `qm_region` VALUES ('394798', '舒兰市', '393450', '9', '4', '220283', '83');
INSERT INTO `qm_region` VALUES ('395070', '磐石市', '393450', '10', '4', '220284', '84');
INSERT INTO `qm_region` VALUES ('395385', '四平市', '391143', '3', '3', '2203', '03');
INSERT INTO `qm_region` VALUES ('395386', '四平市辖区', '395385', '1', '4', '220301', '01');
INSERT INTO `qm_region` VALUES ('395387', '铁西区', '395385', '2', '4', '220302', '02');
INSERT INTO `qm_region` VALUES ('395453', '铁东区', '395385', '3', '4', '220303', '03');
INSERT INTO `qm_region` VALUES ('395568', '梨树县', '395385', '4', '4', '220322', '22');
INSERT INTO `qm_region` VALUES ('395937', '伊通满族自治县', '395385', '5', '4', '220323', '23');
INSERT INTO `qm_region` VALUES ('396156', '公主岭市', '395385', '6', '4', '220381', '81');
INSERT INTO `qm_region` VALUES ('396644', '双辽市', '395385', '7', '4', '220382', '82');
INSERT INTO `qm_region` VALUES ('396899', '辽源市', '391143', '4', '3', '2204', '04');
INSERT INTO `qm_region` VALUES ('396900', '辽源市辖区', '396899', '1', '4', '220401', '01');
INSERT INTO `qm_region` VALUES ('396901', '龙山区', '396899', '2', '4', '220402', '02');
INSERT INTO `qm_region` VALUES ('396973', '西安区', '396899', '3', '4', '220403', '03');
INSERT INTO `qm_region` VALUES ('397028', '东丰县', '396899', '4', '4', '220421', '21');
INSERT INTO `qm_region` VALUES ('397278', '东辽县', '396899', '5', '4', '220422', '22');
INSERT INTO `qm_region` VALUES ('397547', '通化市', '391143', '5', '3', '2205', '05');
INSERT INTO `qm_region` VALUES ('397548', '通化市辖区', '397547', '1', '4', '220501', '01');
INSERT INTO `qm_region` VALUES ('397549', '东昌区', '397547', '2', '4', '220502', '02');
INSERT INTO `qm_region` VALUES ('397631', '二道江区', '397547', '3', '4', '220503', '03');
INSERT INTO `qm_region` VALUES ('397684', '通化县', '397547', '4', '4', '220521', '21');
INSERT INTO `qm_region` VALUES ('397904', '辉南县', '397547', '5', '4', '220523', '23');
INSERT INTO `qm_region` VALUES ('398067', '柳河县', '397547', '6', '4', '220524', '24');
INSERT INTO `qm_region` VALUES ('398318', '梅河口市', '397547', '7', '4', '220581', '81');
INSERT INTO `qm_region` VALUES ('398673', '集安市', '397547', '8', '4', '220582', '82');
INSERT INTO `qm_region` VALUES ('398841', '白山市', '391143', '6', '3', '2206', '06');
INSERT INTO `qm_region` VALUES ('398842', '白山市辖区', '398841', '1', '4', '220601', '01');
INSERT INTO `qm_region` VALUES ('398843', '八道江区', '398841', '2', '4', '220602', '02');
INSERT INTO `qm_region` VALUES ('398955', '江源区', '398841', '3', '4', '220604', '04');
INSERT INTO `qm_region` VALUES ('399051', '抚松县', '398841', '4', '4', '220621', '21');
INSERT INTO `qm_region` VALUES ('399258', '靖宇县', '398841', '5', '4', '220622', '22');
INSERT INTO `qm_region` VALUES ('399407', '长白朝鲜族自治县', '398841', '6', '4', '220623', '23');
INSERT INTO `qm_region` VALUES ('399507', '临江市', '398841', '7', '4', '220681', '81');
INSERT INTO `qm_region` VALUES ('399649', '松原市', '391143', '7', '3', '2207', '07');
INSERT INTO `qm_region` VALUES ('399650', '松原市辖区', '399649', '1', '4', '220701', '01');
INSERT INTO `qm_region` VALUES ('399651', '宁江区', '399649', '2', '4', '220702', '02');
INSERT INTO `qm_region` VALUES ('399827', '前郭尔罗斯蒙古族自治县', '399649', '3', '4', '220721', '21');
INSERT INTO `qm_region` VALUES ('400122', '长岭县', '399649', '4', '4', '220722', '22');
INSERT INTO `qm_region` VALUES ('400411', '乾安县', '399649', '5', '4', '220723', '23');
INSERT INTO `qm_region` VALUES ('400594', '扶余县', '399649', '6', '4', '220724', '24');
INSERT INTO `qm_region` VALUES ('401038', '白城市', '391143', '8', '3', '2208', '08');
INSERT INTO `qm_region` VALUES ('401039', '白城市辖区', '401038', '1', '4', '220801', '01');
INSERT INTO `qm_region` VALUES ('401040', '洮北区', '401038', '2', '4', '220802', '02');
INSERT INTO `qm_region` VALUES ('401288', '镇赉县', '401038', '3', '4', '220821', '21');
INSERT INTO `qm_region` VALUES ('401472', '通榆县', '401038', '4', '4', '220822', '22');
INSERT INTO `qm_region` VALUES ('401686', '洮南市', '401038', '5', '4', '220881', '81');
INSERT INTO `qm_region` VALUES ('401962', '大安市', '401038', '6', '4', '220882', '82');
INSERT INTO `qm_region` VALUES ('402247', '延边朝鲜族自治州', '391143', '9', '3', '2224', '24');
INSERT INTO `qm_region` VALUES ('402248', '延吉市', '402247', '1', '4', '222401', '01');
INSERT INTO `qm_region` VALUES ('402355', '图们市', '402247', '2', '4', '222402', '02');
INSERT INTO `qm_region` VALUES ('402433', '敦化市', '402247', '3', '4', '222403', '03');
INSERT INTO `qm_region` VALUES ('402892', '珲春市', '402247', '4', '4', '222404', '04');
INSERT INTO `qm_region` VALUES ('403075', '龙井市', '402247', '5', '4', '222405', '05');
INSERT INTO `qm_region` VALUES ('403204', '和龙市', '402247', '6', '4', '222406', '06');
INSERT INTO `qm_region` VALUES ('403355', '汪清县', '402247', '7', '4', '222424', '24');
INSERT INTO `qm_region` VALUES ('403630', '安图县', '402247', '8', '4', '222426', '26');
INSERT INTO `qm_region` VALUES ('403889', '江苏省', '1', '19', '2', '32', '32');
INSERT INTO `qm_region` VALUES ('403890', '南京市', '403889', '1', '3', '3201', '01');
INSERT INTO `qm_region` VALUES ('403891', '市辖区', '403890', '1', '4', '320101', '01');
INSERT INTO `qm_region` VALUES ('403892', '玄武区', '403890', '2', '4', '320102', '02');
INSERT INTO `qm_region` VALUES ('403976', '白下区', '403890', '3', '4', '320103', '03');
INSERT INTO `qm_region` VALUES ('404052', '秦淮区', '403890', '4', '4', '320104', '04');
INSERT INTO `qm_region` VALUES ('404111', '建邺区', '403890', '5', '4', '320105', '05');
INSERT INTO `qm_region` VALUES ('404176', '鼓楼区', '403890', '6', '4', '320106', '06');
INSERT INTO `qm_region` VALUES ('404281', '下关区', '403890', '7', '4', '320107', '07');
INSERT INTO `qm_region` VALUES ('404345', '浦口区', '403890', '8', '4', '320111', '11');
INSERT INTO `qm_region` VALUES ('404554', '栖霞区', '403890', '9', '4', '320113', '13');
INSERT INTO `qm_region` VALUES ('404724', '雨花台区', '403890', '10', '4', '320114', '14');
INSERT INTO `qm_region` VALUES ('404804', '江宁区', '403890', '11', '4', '320115', '15');
INSERT INTO `qm_region` VALUES ('405040', '六合区', '403890', '12', '4', '320116', '16');
INSERT INTO `qm_region` VALUES ('405291', '溧水县', '403890', '13', '4', '320124', '24');
INSERT INTO `qm_region` VALUES ('405423', '高淳县', '403890', '14', '4', '320125', '25');
INSERT INTO `qm_region` VALUES ('405615', '无锡市', '403889', '2', '3', '3202', '02');
INSERT INTO `qm_region` VALUES ('405616', '市辖区', '405615', '1', '4', '320201', '01');
INSERT INTO `qm_region` VALUES ('405617', '崇安区', '405615', '2', '4', '320202', '02');
INSERT INTO `qm_region` VALUES ('405666', '南长区', '405615', '3', '4', '320203', '03');
INSERT INTO `qm_region` VALUES ('405729', '北塘区', '405615', '4', '4', '320204', '04');
INSERT INTO `qm_region` VALUES ('405793', '锡山区', '405615', '5', '4', '320205', '05');
INSERT INTO `qm_region` VALUES ('405925', '惠山区', '405615', '6', '4', '320206', '06');
INSERT INTO `qm_region` VALUES ('406074', '滨湖区', '405615', '7', '4', '320211', '11');
INSERT INTO `qm_region` VALUES ('406321', '江阴市', '405615', '8', '4', '320281', '81');
INSERT INTO `qm_region` VALUES ('406684', '宜兴市', '405615', '9', '4', '320282', '82');
INSERT INTO `qm_region` VALUES ('407074', '徐州市', '403889', '3', '3', '3203', '03');
INSERT INTO `qm_region` VALUES ('407075', '市辖区', '407074', '1', '4', '320301', '01');
INSERT INTO `qm_region` VALUES ('407076', '鼓楼区', '407074', '2', '4', '320302', '02');
INSERT INTO `qm_region` VALUES ('407184', '云龙区', '407074', '3', '4', '320303', '03');
INSERT INTO `qm_region` VALUES ('407260', '九里区', '407074', '4', '4', '320304', '04');
INSERT INTO `qm_region` VALUES ('407326', '贾汪区', '407074', '5', '4', '320305', '05');
INSERT INTO `qm_region` VALUES ('407487', '泉山区', '407074', '6', '4', '320311', '11');
INSERT INTO `qm_region` VALUES ('407575', '丰县', '407074', '7', '4', '320321', '21');
INSERT INTO `qm_region` VALUES ('407960', '沛县', '407074', '8', '4', '320322', '22');
INSERT INTO `qm_region` VALUES ('408366', '铜山县', '407074', '9', '4', '320323', '23');
INSERT INTO `qm_region` VALUES ('408711', '睢宁县', '407074', '10', '4', '320324', '24');
INSERT INTO `qm_region` VALUES ('409130', '新沂市', '407074', '11', '4', '320381', '81');
INSERT INTO `qm_region` VALUES ('409413', '邳州市', '407074', '12', '4', '320382', '82');
INSERT INTO `qm_region` VALUES ('409936', '常州市', '403889', '4', '3', '3204', '04');
INSERT INTO `qm_region` VALUES ('409937', '常州市区', '409936', '1', '4', '320401', '01');
INSERT INTO `qm_region` VALUES ('409938', '天宁区', '409936', '2', '4', '320402', '02');
INSERT INTO `qm_region` VALUES ('410046', '钟楼区', '409936', '3', '4', '320404', '04');
INSERT INTO `qm_region` VALUES ('410142', '戚墅堰区', '409936', '4', '4', '320405', '05');
INSERT INTO `qm_region` VALUES ('410169', '新北区', '409936', '5', '4', '320411', '11');
INSERT INTO `qm_region` VALUES ('410355', '武进区', '409936', '6', '4', '320412', '12');
INSERT INTO `qm_region` VALUES ('410874', '溧阳市', '409936', '7', '4', '320481', '81');
INSERT INTO `qm_region` VALUES ('411240', '金坛市', '409936', '8', '4', '320482', '82');
INSERT INTO `qm_region` VALUES ('411435', '苏州市', '403889', '5', '3', '3205', '05');
INSERT INTO `qm_region` VALUES ('411436', '市辖区', '411435', '1', '4', '320501', '01');
INSERT INTO `qm_region` VALUES ('411437', '沧浪区', '411435', '2', '4', '320502', '02');
INSERT INTO `qm_region` VALUES ('411513', '平江区', '411435', '3', '4', '320503', '03');
INSERT INTO `qm_region` VALUES ('411646', '金阊区', '411435', '4', '4', '320504', '04');
INSERT INTO `qm_region` VALUES ('411703', '苏州高新区虎丘区', '411435', '5', '4', '320505', '05');
INSERT INTO `qm_region` VALUES ('411817', '吴中区', '411435', '6', '4', '320506', '06');
INSERT INTO `qm_region` VALUES ('412024', '相城区', '411435', '7', '4', '320507', '07');
INSERT INTO `qm_region` VALUES ('412149', '常熟市', '411435', '8', '4', '320581', '81');
INSERT INTO `qm_region` VALUES ('412474', '张家港市', '411435', '9', '4', '320582', '82');
INSERT INTO `qm_region` VALUES ('412758', '昆山市', '411435', '10', '4', '320583', '83');
INSERT INTO `qm_region` VALUES ('413070', '吴江市', '411435', '11', '4', '320584', '84');
INSERT INTO `qm_region` VALUES ('413394', '太仓市', '411435', '12', '4', '320585', '85');
INSERT INTO `qm_region` VALUES ('413570', '南通市', '403889', '6', '3', '3206', '06');
INSERT INTO `qm_region` VALUES ('413571', '市辖区', '413570', '1', '4', '320601', '01');
INSERT INTO `qm_region` VALUES ('413572', '崇川区', '413570', '2', '4', '320602', '02');
INSERT INTO `qm_region` VALUES ('413769', '港闸区', '413570', '3', '4', '320611', '11');
INSERT INTO `qm_region` VALUES ('413835', '海安县', '413570', '4', '4', '320621', '21');
INSERT INTO `qm_region` VALUES ('414094', '如东', '413570', '5', '4', '320623', '23');
INSERT INTO `qm_region` VALUES ('414419', '启东市', '413570', '6', '4', '320681', '81');
INSERT INTO `qm_region` VALUES ('414825', '如皋市', '413570', '7', '4', '320682', '82');
INSERT INTO `qm_region` VALUES ('415214', '通州市', '413570', '8', '4', '320683', '83');
INSERT INTO `qm_region` VALUES ('415675', '海门市', '413570', '9', '4', '320684', '84');
INSERT INTO `qm_region` VALUES ('416015', '连云港市', '403889', '7', '3', '3207', '07');
INSERT INTO `qm_region` VALUES ('416016', '市辖区', '416015', '1', '4', '320701', '01');
INSERT INTO `qm_region` VALUES ('416017', '连云区', '416015', '2', '4', '320703', '03');
INSERT INTO `qm_region` VALUES ('416112', '新浦区', '416015', '3', '4', '320705', '05');
INSERT INTO `qm_region` VALUES ('416229', '海州区', '416015', '4', '4', '320706', '06');
INSERT INTO `qm_region` VALUES ('416287', '赣榆县', '416015', '5', '4', '320721', '21');
INSERT INTO `qm_region` VALUES ('416771', '东海县', '416015', '6', '4', '320722', '22');
INSERT INTO `qm_region` VALUES ('417185', '灌云县', '416015', '7', '4', '320723', '23');
INSERT INTO `qm_region` VALUES ('417600', '灌南县', '416015', '8', '4', '320724', '24');
INSERT INTO `qm_region` VALUES ('417852', '淮安市', '403889', '8', '3', '3208', '08');
INSERT INTO `qm_region` VALUES ('417853', '市辖区', '417852', '1', '4', '320801', '01');
INSERT INTO `qm_region` VALUES ('417854', '清河区', '417852', '2', '4', '320802', '02');
INSERT INTO `qm_region` VALUES ('417935', '楚州区', '417852', '3', '4', '320803', '03');
INSERT INTO `qm_region` VALUES ('418325', '淮阴区', '417852', '4', '4', '320804', '04');
INSERT INTO `qm_region` VALUES ('418608', '清浦区', '417852', '5', '4', '320811', '11');
INSERT INTO `qm_region` VALUES ('418705', '涟水县', '417852', '6', '4', '320826', '26');
INSERT INTO `qm_region` VALUES ('419113', '洪泽县', '417852', '7', '4', '320829', '29');
INSERT INTO `qm_region` VALUES ('419251', '盱眙县', '417852', '8', '4', '320830', '30');
INSERT INTO `qm_region` VALUES ('419531', '金湖县', '417852', '9', '4', '320831', '31');
INSERT INTO `qm_region` VALUES ('419692', '盐城市', '403889', '9', '3', '3209', '09');
INSERT INTO `qm_region` VALUES ('419693', '市辖区', '419692', '1', '4', '320901', '01');
INSERT INTO `qm_region` VALUES ('419694', '亭湖区', '419692', '2', '4', '320902', '02');
INSERT INTO `qm_region` VALUES ('419922', '盐都区', '419692', '3', '4', '320903', '03');
INSERT INTO `qm_region` VALUES ('420186', '响水县', '419692', '4', '4', '320921', '21');
INSERT INTO `qm_region` VALUES ('420374', '滨海县', '419692', '5', '4', '320922', '22');
INSERT INTO `qm_region` VALUES ('420701', '阜宁县', '419692', '6', '4', '320923', '23');
INSERT INTO `qm_region` VALUES ('421067', '射阳县', '419692', '7', '4', '320924', '24');
INSERT INTO `qm_region` VALUES ('421397', '建湖县', '419692', '8', '4', '320925', '25');
INSERT INTO `qm_region` VALUES ('421661', '东台市', '419692', '9', '4', '320981', '81');
INSERT INTO `qm_region` VALUES ('422163', '大丰市', '419692', '10', '4', '320982', '82');
INSERT INTO `qm_region` VALUES ('422449', '扬州市', '403889', '10', '3', '3210', '10');
INSERT INTO `qm_region` VALUES ('422450', '市辖区', '422449', '1', '4', '321001', '01');
INSERT INTO `qm_region` VALUES ('422451', '广陵区', '422449', '2', '4', '321002', '02');
INSERT INTO `qm_region` VALUES ('422525', '邗江区', '422449', '3', '4', '321003', '03');
INSERT INTO `qm_region` VALUES ('422722', '维扬区', '422449', '4', '4', '321011', '11');
INSERT INTO `qm_region` VALUES ('422835', '宝应县', '422449', '5', '4', '321023', '23');
INSERT INTO `qm_region` VALUES ('423134', '仪征市', '422449', '6', '4', '321081', '81');
INSERT INTO `qm_region` VALUES ('423369', '高邮市', '422449', '7', '4', '321084', '84');
INSERT INTO `qm_region` VALUES ('423730', '江都市', '422449', '8', '4', '321088', '88');
INSERT INTO `qm_region` VALUES ('424112', '镇江市', '403889', '11', '3', '3211', '11');
INSERT INTO `qm_region` VALUES ('424113', '市区', '424112', '1', '4', '321101', '01');
INSERT INTO `qm_region` VALUES ('424114', '京口区', '424112', '2', '4', '321102', '02');
INSERT INTO `qm_region` VALUES ('424289', '润州区', '424112', '3', '4', '321111', '11');
INSERT INTO `qm_region` VALUES ('424380', '丹徒区', '424112', '4', '4', '321112', '12');
INSERT INTO `qm_region` VALUES ('424486', '丹阳市', '424112', '5', '4', '321181', '81');
INSERT INTO `qm_region` VALUES ('424801', '扬中市', '424112', '6', '4', '321182', '82');
INSERT INTO `qm_region` VALUES ('424927', '句容市', '424112', '7', '4', '321183', '83');
INSERT INTO `qm_region` VALUES ('425168', '泰州市', '403889', '12', '3', '3212', '12');
INSERT INTO `qm_region` VALUES ('425169', '市辖区', '425168', '1', '4', '321201', '01');
INSERT INTO `qm_region` VALUES ('425170', '海陵区', '425168', '2', '4', '321202', '02');
INSERT INTO `qm_region` VALUES ('425341', '高港区', '425168', '3', '4', '321203', '03');
INSERT INTO `qm_region` VALUES ('425420', '兴化市', '425168', '4', '4', '321281', '81');
INSERT INTO `qm_region` VALUES ('426147', '靖江市', '425168', '5', '4', '321282', '82');
INSERT INTO `qm_region` VALUES ('426411', '泰兴市', '425168', '6', '4', '321283', '83');
INSERT INTO `qm_region` VALUES ('426853', '姜堰市', '425168', '7', '4', '321284', '84');
INSERT INTO `qm_region` VALUES ('427235', '宿迁市', '403889', '13', '3', '3213', '13');
INSERT INTO `qm_region` VALUES ('427236', '市辖区', '427235', '1', '4', '321301', '01');
INSERT INTO `qm_region` VALUES ('427237', '宿城区', '427235', '2', '4', '321302', '02');
INSERT INTO `qm_region` VALUES ('427455', '宿豫区', '427235', '3', '4', '321311', '11');
INSERT INTO `qm_region` VALUES ('427678', '沭阳县', '427235', '4', '4', '321322', '22');
INSERT INTO `qm_region` VALUES ('428192', '泗阳县', '427235', '5', '4', '321323', '23');
INSERT INTO `qm_region` VALUES ('428471', '泗洪县', '427235', '6', '4', '321324', '24');
INSERT INTO `qm_region` VALUES ('428836', '江西省', '1', '20', '2', '36', '36');
INSERT INTO `qm_region` VALUES ('428837', '南昌市', '428836', '1', '3', '3601', '01');
INSERT INTO `qm_region` VALUES ('428838', '市辖区', '428837', '1', '4', '360101', '01');
INSERT INTO `qm_region` VALUES ('428839', '东湖区', '428837', '2', '4', '360102', '02');
INSERT INTO `qm_region` VALUES ('428968', '西湖区', '428837', '3', '4', '360103', '03');
INSERT INTO `qm_region` VALUES ('429125', '青云谱区', '428837', '4', '4', '360104', '04');
INSERT INTO `qm_region` VALUES ('429193', '湾里区', '428837', '5', '4', '360105', '05');
INSERT INTO `qm_region` VALUES ('429255', '青山湖区', '428837', '6', '4', '360111', '11');
INSERT INTO `qm_region` VALUES ('429475', '南昌县', '428837', '7', '4', '360121', '21');
INSERT INTO `qm_region` VALUES ('429857', '新建县', '428837', '8', '4', '360122', '22');
INSERT INTO `qm_region` VALUES ('430289', '安义县', '428837', '9', '4', '360123', '23');
INSERT INTO `qm_region` VALUES ('430426', '进贤县', '428837', '10', '4', '360124', '24');
INSERT INTO `qm_region` VALUES ('430763', '景德镇市', '428836', '2', '3', '3602', '02');
INSERT INTO `qm_region` VALUES ('430764', '市辖区', '430763', '1', '4', '360201', '01');
INSERT INTO `qm_region` VALUES ('430765', '昌江区', '430763', '2', '4', '360202', '02');
INSERT INTO `qm_region` VALUES ('430888', '珠山区', '430763', '3', '4', '360203', '03');
INSERT INTO `qm_region` VALUES ('430979', '浮梁县', '430763', '4', '4', '360222', '22');
INSERT INTO `qm_region` VALUES ('431198', '乐平市', '430763', '5', '4', '360281', '81');
INSERT INTO `qm_region` VALUES ('431560', '萍乡市', '428836', '3', '3', '3603', '03');
INSERT INTO `qm_region` VALUES ('431561', '市辖区', '431560', '1', '4', '360301', '01');
INSERT INTO `qm_region` VALUES ('431562', '安源区', '431560', '2', '4', '360302', '02');
INSERT INTO `qm_region` VALUES ('431711', '湘东区', '431560', '3', '4', '360313', '13');
INSERT INTO `qm_region` VALUES ('431876', '莲花县', '431560', '4', '4', '360321', '21');
INSERT INTO `qm_region` VALUES ('432050', '上栗县', '431560', '5', '4', '360322', '22');
INSERT INTO `qm_region` VALUES ('432232', '芦溪县', '431560', '6', '4', '360323', '23');
INSERT INTO `qm_region` VALUES ('432398', '九江市', '428836', '4', '3', '3604', '04');
INSERT INTO `qm_region` VALUES ('432399', '市辖区', '432398', '1', '4', '360401', '01');
INSERT INTO `qm_region` VALUES ('432400', '庐山区', '432398', '2', '4', '360402', '02');
INSERT INTO `qm_region` VALUES ('432546', '浔阳区', '432398', '3', '4', '360403', '03');
INSERT INTO `qm_region` VALUES ('432654', '九江县', '432398', '4', '4', '360421', '21');
INSERT INTO `qm_region` VALUES ('432805', '武宁县', '432398', '5', '4', '360423', '23');
INSERT INTO `qm_region` VALUES ('433022', '修水县', '432398', '6', '4', '360424', '24');
INSERT INTO `qm_region` VALUES ('433458', '永修县', '432398', '7', '4', '360425', '25');
INSERT INTO `qm_region` VALUES ('433707', '德安县', '432398', '8', '4', '360426', '26');
INSERT INTO `qm_region` VALUES ('433842', '星子县', '432398', '9', '4', '360427', '27');
INSERT INTO `qm_region` VALUES ('433949', '都昌县', '432398', '10', '4', '360428', '28');
INSERT INTO `qm_region` VALUES ('434280', '湖口县', '432398', '11', '4', '360429', '29');
INSERT INTO `qm_region` VALUES ('434438', '彭泽县', '432398', '12', '4', '360430', '30');
INSERT INTO `qm_region` VALUES ('434645', '瑞昌市', '432398', '13', '4', '360481', '81');
INSERT INTO `qm_region` VALUES ('434871', '新余市', '428836', '5', '3', '3605', '05');
INSERT INTO `qm_region` VALUES ('434872', '市辖区', '434871', '1', '4', '360501', '01');
INSERT INTO `qm_region` VALUES ('434873', '渝水区', '434871', '2', '4', '360502', '02');
INSERT INTO `qm_region` VALUES ('435215', '分宜县', '434871', '3', '4', '360521', '21');
INSERT INTO `qm_region` VALUES ('435382', '鹰潭市', '428836', '6', '3', '3606', '06');
INSERT INTO `qm_region` VALUES ('435383', '市辖区', '435382', '1', '4', '360601', '01');
INSERT INTO `qm_region` VALUES ('435384', '月湖区', '435382', '2', '4', '360602', '02');
INSERT INTO `qm_region` VALUES ('435463', '余江县', '435382', '3', '4', '360622', '22');
INSERT INTO `qm_region` VALUES ('435654', '贵溪市', '435382', '4', '4', '360681', '81');
INSERT INTO `qm_region` VALUES ('435938', '赣州市', '428836', '7', '3', '3607', '07');
INSERT INTO `qm_region` VALUES ('435939', '市辖区', '435938', '1', '4', '360701', '01');
INSERT INTO `qm_region` VALUES ('435940', '章贡区', '435938', '2', '4', '360702', '02');
INSERT INTO `qm_region` VALUES ('436098', '赣县', '435938', '3', '4', '360721', '21');
INSERT INTO `qm_region` VALUES ('436410', '信丰县', '435938', '4', '4', '360722', '22');
INSERT INTO `qm_region` VALUES ('436715', '大余县', '435938', '5', '4', '360723', '23');
INSERT INTO `qm_region` VALUES ('436844', '上犹县', '435938', '6', '4', '360724', '24');
INSERT INTO `qm_region` VALUES ('437000', '崇义县', '435938', '7', '4', '360725', '25');
INSERT INTO `qm_region` VALUES ('437146', '安远县', '435938', '8', '4', '360726', '26');
INSERT INTO `qm_region` VALUES ('437329', '龙南县', '435938', '9', '4', '360727', '27');
INSERT INTO `qm_region` VALUES ('437452', '定南县', '435938', '10', '4', '360728', '28');
INSERT INTO `qm_region` VALUES ('437591', '全南县', '435938', '11', '4', '360729', '29');
INSERT INTO `qm_region` VALUES ('437702', '宁都县', '435938', '12', '4', '360730', '30');
INSERT INTO `qm_region` VALUES ('438048', '于都县', '435938', '13', '4', '360731', '31');
INSERT INTO `qm_region` VALUES ('438454', '兴国县', '435938', '14', '4', '360732', '32');
INSERT INTO `qm_region` VALUES ('438796', '会昌县', '435938', '15', '4', '360733', '33');
INSERT INTO `qm_region` VALUES ('439087', '寻乌县', '435938', '16', '4', '360734', '34');
INSERT INTO `qm_region` VALUES ('439279', '石城县', '435938', '17', '4', '360735', '35');
INSERT INTO `qm_region` VALUES ('439434', '瑞金市', '435938', '18', '4', '360781', '81');
INSERT INTO `qm_region` VALUES ('439691', '南康市', '435938', '19', '4', '360782', '82');
INSERT INTO `qm_region` VALUES ('440045', '吉安市', '428836', '8', '3', '3608', '08');
INSERT INTO `qm_region` VALUES ('440046', '市辖区', '440045', '1', '4', '360801', '01');
INSERT INTO `qm_region` VALUES ('440047', '吉州区', '440045', '2', '4', '360802', '02');
INSERT INTO `qm_region` VALUES ('440186', '青原区', '440045', '3', '4', '360803', '03');
INSERT INTO `qm_region` VALUES ('440323', '吉安县', '440045', '4', '4', '360821', '21');
INSERT INTO `qm_region` VALUES ('440678', '吉水县', '440045', '5', '4', '360822', '22');
INSERT INTO `qm_region` VALUES ('440971', '峡江县', '440045', '6', '4', '360823', '23');
INSERT INTO `qm_region` VALUES ('441072', '新干县', '440045', '7', '4', '360824', '24');
INSERT INTO `qm_region` VALUES ('441257', '永丰县', '440045', '8', '4', '360825', '25');
INSERT INTO `qm_region` VALUES ('441519', '泰和县', '440045', '9', '4', '360826', '26');
INSERT INTO `qm_region` VALUES ('441883', '遂川县', '440045', '10', '4', '360827', '27');
INSERT INTO `qm_region` VALUES ('442239', '万安县', '440045', '11', '4', '360828', '28');
INSERT INTO `qm_region` VALUES ('442403', '安福县', '440045', '12', '4', '360829', '29');
INSERT INTO `qm_region` VALUES ('442689', '永新县', '440045', '13', '4', '360830', '30');
INSERT INTO `qm_region` VALUES ('442971', '井冈山市', '440045', '14', '4', '360881', '81');
INSERT INTO `qm_region` VALUES ('443122', '宜春市', '428836', '9', '3', '3609', '09');
INSERT INTO `qm_region` VALUES ('443123', '市辖区', '443122', '1', '4', '360901', '01');
INSERT INTO `qm_region` VALUES ('443124', '袁州区', '443122', '2', '4', '360902', '02');
INSERT INTO `qm_region` VALUES ('443526', '奉新县', '443122', '3', '4', '360921', '21');
INSERT INTO `qm_region` VALUES ('443735', '万载县', '443122', '4', '4', '360922', '22');
INSERT INTO `qm_region` VALUES ('443952', '上高县', '443122', '5', '4', '360923', '23');
INSERT INTO `qm_region` VALUES ('444189', '宜丰县', '443122', '6', '4', '360924', '24');
INSERT INTO `qm_region` VALUES ('444448', '', '443122', '7', '4', '360925', '25');
INSERT INTO `qm_region` VALUES ('444561', '铜鼓县', '443122', '8', '4', '360926', '26');
INSERT INTO `qm_region` VALUES ('444694', '丰城市', '443122', '9', '4', '360981', '81');
INSERT INTO `qm_region` VALUES ('445258', '樟树市', '443122', '10', '4', '360982', '82');
INSERT INTO `qm_region` VALUES ('445556', '高安市', '443122', '11', '4', '360983', '83');
INSERT INTO `qm_region` VALUES ('445939', '抚州市', '428836', '10', '3', '3610', '10');
INSERT INTO `qm_region` VALUES ('445940', '市辖区', '445939', '1', '4', '361001', '01');
INSERT INTO `qm_region` VALUES ('445941', '临川区', '445939', '2', '4', '361002', '02');
INSERT INTO `qm_region` VALUES ('446472', '南城县', '445939', '3', '4', '361021', '21');
INSERT INTO `qm_region` VALUES ('446654', '黎川县', '445939', '4', '4', '361022', '22');
INSERT INTO `qm_region` VALUES ('446797', '南丰县', '445939', '5', '4', '361023', '23');
INSERT INTO `qm_region` VALUES ('446998', '崇仁县', '445939', '6', '4', '361024', '24');
INSERT INTO `qm_region` VALUES ('447197', '乐安县', '445939', '7', '4', '361025', '25');
INSERT INTO `qm_region` VALUES ('447410', '宜黄县', '445939', '8', '4', '361026', '26');
INSERT INTO `qm_region` VALUES ('447577', '金溪县', '445939', '9', '4', '361027', '27');
INSERT INTO `qm_region` VALUES ('447758', '资溪县', '445939', '10', '4', '361028', '28');
INSERT INTO `qm_region` VALUES ('447849', '东乡县', '445939', '11', '4', '361029', '29');
INSERT INTO `qm_region` VALUES ('448052', '广昌县', '445939', '12', '4', '361030', '30');
INSERT INTO `qm_region` VALUES ('448209', '上饶市', '428836', '11', '3', '3611', '11');
INSERT INTO `qm_region` VALUES ('448210', '市辖区', '448209', '1', '4', '361101', '01');
INSERT INTO `qm_region` VALUES ('448211', '信州区', '448209', '2', '4', '361102', '02');
INSERT INTO `qm_region` VALUES ('448344', '上饶县', '448209', '3', '4', '361121', '21');
INSERT INTO `qm_region` VALUES ('448606', '广丰县', '448209', '4', '4', '361122', '22');
INSERT INTO `qm_region` VALUES ('448856', '玉山县', '448209', '5', '4', '361123', '23');
INSERT INTO `qm_region` VALUES ('449111', '铅山县', '448209', '6', '4', '361124', '24');
INSERT INTO `qm_region` VALUES ('449344', '横峰县', '448209', '7', '4', '361125', '25');
INSERT INTO `qm_region` VALUES ('449437', '弋阳县', '448209', '8', '4', '361126', '26');
INSERT INTO `qm_region` VALUES ('449608', '余干县', '448209', '9', '4', '361127', '27');
INSERT INTO `qm_region` VALUES ('450045', '鄱阳县', '448209', '10', '4', '361128', '28');
INSERT INTO `qm_region` VALUES ('450687', '万年县', '448209', '11', '4', '361129', '29');
INSERT INTO `qm_region` VALUES ('450844', '婺源县', '448209', '12', '4', '361130', '30');
INSERT INTO `qm_region` VALUES ('451050', '德兴市', '448209', '13', '4', '361181', '81');
INSERT INTO `qm_region` VALUES ('451186', '辽宁省', '1', '21', '2', '21', '21');
INSERT INTO `qm_region` VALUES ('451187', '沈阳市', '451186', '1', '3', '2101', '01');
INSERT INTO `qm_region` VALUES ('451188', '市辖区', '451187', '1', '4', '210101', '01');
INSERT INTO `qm_region` VALUES ('451189', '和平区', '451187', '2', '4', '210102', '02');
INSERT INTO `qm_region` VALUES ('451315', '沈河区', '451187', '3', '4', '210103', '03');
INSERT INTO `qm_region` VALUES ('451426', '大东区', '451187', '4', '4', '210104', '04');
INSERT INTO `qm_region` VALUES ('451550', '皇姑区', '451187', '5', '4', '210105', '05');
INSERT INTO `qm_region` VALUES ('451721', '铁西区', '451187', '6', '4', '210106', '06');
INSERT INTO `qm_region` VALUES ('451855', '苏家屯区', '451187', '7', '4', '210111', '11');
INSERT INTO `qm_region` VALUES ('452063', '东陵区', '451187', '8', '4', '210112', '12');
INSERT INTO `qm_region` VALUES ('452373', '新城子区', '451187', '9', '4', '210113', '13');
INSERT INTO `qm_region` VALUES ('452592', '于洪区', '451187', '10', '4', '210114', '14');
INSERT INTO `qm_region` VALUES ('452897', '辽中县', '451187', '11', '4', '210122', '22');
INSERT INTO `qm_region` VALUES ('453151', '康平县', '451187', '12', '4', '210123', '23');
INSERT INTO `qm_region` VALUES ('453344', '法库县', '451187', '13', '4', '210124', '24');
INSERT INTO `qm_region` VALUES ('453604', '新民市', '451187', '14', '4', '210181', '81');
INSERT INTO `qm_region` VALUES ('454017', '大连市', '451186', '2', '3', '2102', '02');
INSERT INTO `qm_region` VALUES ('454018', '市辖区', '454017', '1', '4', '210201', '01');
INSERT INTO `qm_region` VALUES ('454019', '中山区', '454017', '2', '4', '210202', '02');
INSERT INTO `qm_region` VALUES ('454079', '西岗区', '454017', '3', '4', '210203', '03');
INSERT INTO `qm_region` VALUES ('454132', '沙河口区', '454017', '4', '4', '210204', '04');
INSERT INTO `qm_region` VALUES ('454228', '甘井子区', '454017', '5', '4', '210211', '11');
INSERT INTO `qm_region` VALUES ('454427', '旅顺口区', '454017', '6', '4', '210212', '12');
INSERT INTO `qm_region` VALUES ('454535', '金州区', '454017', '7', '4', '210213', '13');
INSERT INTO `qm_region` VALUES ('454812', '长海县', '454017', '8', '4', '210224', '24');
INSERT INTO `qm_region` VALUES ('454848', '瓦房店市', '454017', '9', '4', '210281', '81');
INSERT INTO `qm_region` VALUES ('455223', '普兰店市', '454017', '10', '4', '210282', '82');
INSERT INTO `qm_region` VALUES ('455444', '庄河市', '454017', '11', '4', '210283', '83');
INSERT INTO `qm_region` VALUES ('455742', '鞍山市', '451186', '3', '3', '2103', '03');
INSERT INTO `qm_region` VALUES ('455743', '市辖区', '455742', '1', '4', '210301', '01');
INSERT INTO `qm_region` VALUES ('455744', '铁东区', '455742', '2', '4', '210302', '02');
INSERT INTO `qm_region` VALUES ('455836', '铁西区', '455742', '3', '4', '210303', '03');
INSERT INTO `qm_region` VALUES ('455895', '立山区', '455742', '4', '4', '210304', '04');
INSERT INTO `qm_region` VALUES ('455992', '千山区', '455742', '5', '4', '210311', '11');
INSERT INTO `qm_region` VALUES ('456118', '台安县', '455742', '6', '4', '210321', '21');
INSERT INTO `qm_region` VALUES ('456295', '岫岩县', '455742', '7', '4', '210323', '23');
INSERT INTO `qm_region` VALUES ('456522', '海城市', '455742', '8', '4', '210381', '81');
INSERT INTO `qm_region` VALUES ('457000', '抚顺市', '451186', '4', '3', '2104', '04');
INSERT INTO `qm_region` VALUES ('457001', '市辖区', '457000', '1', '4', '210401', '01');
INSERT INTO `qm_region` VALUES ('457002', '新抚区', '457000', '2', '4', '210402', '02');
INSERT INTO `qm_region` VALUES ('457074', '东洲区', '457000', '3', '4', '210403', '03');
INSERT INTO `qm_region` VALUES ('457221', '望花区', '457000', '4', '4', '210404', '04');
INSERT INTO `qm_region` VALUES ('457360', '顺城区', '457000', '5', '4', '210411', '11');
INSERT INTO `qm_region` VALUES ('457474', '抚顺县', '457000', '6', '4', '210421', '21');
INSERT INTO `qm_region` VALUES ('457633', '新宾满族自治县', '457000', '7', '4', '210422', '22');
INSERT INTO `qm_region` VALUES ('457842', '清原满族自治县', '457000', '8', '4', '210423', '23');
INSERT INTO `qm_region` VALUES ('458067', '本溪市', '451186', '5', '3', '2105', '05');
INSERT INTO `qm_region` VALUES ('458068', '市辖区', '458067', '1', '4', '210501', '01');
INSERT INTO `qm_region` VALUES ('458069', '平山区', '458067', '2', '4', '210502', '02');
INSERT INTO `qm_region` VALUES ('458166', '溪湖区', '458067', '3', '4', '210503', '03');
INSERT INTO `qm_region` VALUES ('458249', '明山区', '458067', '4', '4', '210504', '04');
INSERT INTO `qm_region` VALUES ('458325', '南芬区', '458067', '5', '4', '210505', '05');
INSERT INTO `qm_region` VALUES ('458369', '本溪满族自治县', '458067', '6', '4', '210521', '21');
INSERT INTO `qm_region` VALUES ('458510', '桓仁满族自治县', '458067', '7', '4', '210522', '22');
INSERT INTO `qm_region` VALUES ('458658', '丹东市', '451186', '6', '3', '2106', '06');
INSERT INTO `qm_region` VALUES ('458659', '市辖区', '458658', '1', '4', '210601', '01');
INSERT INTO `qm_region` VALUES ('458660', '元宝区', '458658', '2', '4', '210602', '02');
INSERT INTO `qm_region` VALUES ('458712', '振兴区', '458658', '3', '4', '210603', '03');
INSERT INTO `qm_region` VALUES ('458809', '振安区', '458658', '4', '4', '210604', '04');
INSERT INTO `qm_region` VALUES ('458882', '宽甸满族自治县', '458658', '5', '4', '210624', '24');
INSERT INTO `qm_region` VALUES ('459097', '东港市', '458658', '6', '4', '210681', '81');
INSERT INTO `qm_region` VALUES ('459368', '凤城市', '458658', '7', '4', '210682', '82');
INSERT INTO `qm_region` VALUES ('459625', '锦州市', '451186', '7', '3', '2107', '07');
INSERT INTO `qm_region` VALUES ('459626', '市辖区', '459625', '1', '4', '210701', '01');
INSERT INTO `qm_region` VALUES ('459627', '古塔区', '459625', '2', '4', '210702', '02');
INSERT INTO `qm_region` VALUES ('459689', '凌河区', '459625', '3', '4', '210703', '03');
INSERT INTO `qm_region` VALUES ('459769', '太和区', '459625', '4', '4', '210711', '11');
INSERT INTO `qm_region` VALUES ('459903', '黑山县', '459625', '5', '4', '210726', '26');
INSERT INTO `qm_region` VALUES ('460255', '义县', '459625', '6', '4', '210727', '27');
INSERT INTO `qm_region` VALUES ('460529', '凌海市', '459625', '7', '4', '210781', '81');
INSERT INTO `qm_region` VALUES ('460875', '北镇市', '459625', '8', '4', '210782', '82');
INSERT INTO `qm_region` VALUES ('461146', '营口市', '451186', '8', '3', '2108', '08');
INSERT INTO `qm_region` VALUES ('461147', '市辖区', '461146', '1', '4', '210801', '01');
INSERT INTO `qm_region` VALUES ('461148', '站前区', '461146', '2', '4', '210802', '02');
INSERT INTO `qm_region` VALUES ('461196', '西市区', '461146', '3', '4', '210803', '03');
INSERT INTO `qm_region` VALUES ('461225', '鲅鱼圈区', '461146', '4', '4', '210804', '04');
INSERT INTO `qm_region` VALUES ('461309', '老边区', '461146', '5', '4', '210811', '11');
INSERT INTO `qm_region` VALUES ('461381', '盖州市', '461146', '6', '4', '210881', '81');
INSERT INTO `qm_region` VALUES ('461708', '大石桥市', '461146', '7', '4', '210882', '82');
INSERT INTO `qm_region` VALUES ('462003', '阜新市', '451186', '9', '3', '2109', '09');
INSERT INTO `qm_region` VALUES ('462004', '市辖区', '462003', '1', '4', '210901', '01');
INSERT INTO `qm_region` VALUES ('462005', '海州区', '462003', '2', '4', '210902', '02');
INSERT INTO `qm_region` VALUES ('462100', '新邱区', '462003', '3', '4', '210903', '03');
INSERT INTO `qm_region` VALUES ('462140', '太平区', '462003', '4', '4', '210904', '04');
INSERT INTO `qm_region` VALUES ('462214', '清河门区', '462003', '5', '4', '210905', '05');
INSERT INTO `qm_region` VALUES ('462249', '细河区', '462003', '6', '4', '210911', '11');
INSERT INTO `qm_region` VALUES ('462307', '阜新蒙古族自治县', '462003', '7', '4', '210921', '21');
INSERT INTO `qm_region` VALUES ('462752', '彰武县', '462003', '8', '4', '210922', '22');
INSERT INTO `qm_region` VALUES ('462997', '辽阳市', '451186', '10', '3', '2110', '10');
INSERT INTO `qm_region` VALUES ('462998', '市辖区', '462997', '1', '4', '211001', '01');
INSERT INTO `qm_region` VALUES ('462999', '白塔区', '462997', '2', '4', '211002', '02');
INSERT INTO `qm_region` VALUES ('463037', '文圣区', '462997', '3', '4', '211003', '03');
INSERT INTO `qm_region` VALUES ('463081', '宏伟区', '462997', '4', '4', '211004', '04');
INSERT INTO `qm_region` VALUES ('463114', '弓长岭区', '462997', '5', '4', '211005', '05');
INSERT INTO `qm_region` VALUES ('463149', '太子河区', '462997', '6', '4', '211011', '11');
INSERT INTO `qm_region` VALUES ('463202', '辽阳县', '462997', '7', '4', '211021', '21');
INSERT INTO `qm_region` VALUES ('463474', '灯塔市', '462997', '8', '4', '211081', '81');
INSERT INTO `qm_region` VALUES ('463726', '盘锦市', '451186', '11', '3', '2111', '11');
INSERT INTO `qm_region` VALUES ('463727', '市辖区', '463726', '1', '4', '211101', '01');
INSERT INTO `qm_region` VALUES ('463728', '双台子区', '463726', '2', '4', '211102', '02');
INSERT INTO `qm_region` VALUES ('463786', '兴隆台区', '463726', '3', '4', '211103', '03');
INSERT INTO `qm_region` VALUES ('463912', '大洼县', '463726', '4', '4', '211121', '21');
INSERT INTO `qm_region` VALUES ('464097', '盘山县', '463726', '5', '4', '211122', '22');
INSERT INTO `qm_region` VALUES ('464280', '铁岭市', '451186', '12', '3', '2112', '12');
INSERT INTO `qm_region` VALUES ('464281', '市辖区', '464280', '1', '4', '211201', '01');
INSERT INTO `qm_region` VALUES ('464282', '银州区', '464280', '2', '4', '211202', '02');
INSERT INTO `qm_region` VALUES ('464386', '清河区', '464280', '3', '4', '211204', '04');
INSERT INTO `qm_region` VALUES ('464441', '铁岭县', '464280', '4', '4', '211221', '21');
INSERT INTO `qm_region` VALUES ('464677', '西丰县', '464280', '5', '4', '211223', '23');
INSERT INTO `qm_region` VALUES ('464878', '昌图县', '464280', '6', '4', '211224', '24');
INSERT INTO `qm_region` VALUES ('465407', '调兵山市', '464280', '7', '4', '211281', '81');
INSERT INTO `qm_region` VALUES ('465471', '开原市', '464280', '8', '4', '211282', '82');
INSERT INTO `qm_region` VALUES ('465783', '朝阳市', '451186', '13', '3', '2113', '13');
INSERT INTO `qm_region` VALUES ('465784', '市辖区', '465783', '1', '4', '211301', '01');
INSERT INTO `qm_region` VALUES ('465785', '双塔区', '465783', '2', '4', '211302', '02');
INSERT INTO `qm_region` VALUES ('465901', '龙城区', '465783', '3', '4', '211303', '03');
INSERT INTO `qm_region` VALUES ('465999', '朝阳县', '465783', '4', '4', '211321', '21');
INSERT INTO `qm_region` VALUES ('466326', '建平县', '465783', '5', '4', '211322', '22');
INSERT INTO `qm_region` VALUES ('466643', '喀喇沁左翼蒙古族自治县', '465783', '6', '4', '211324', '24');
INSERT INTO `qm_region` VALUES ('466867', '北票市', '465783', '7', '4', '211381', '81');
INSERT INTO `qm_region` VALUES ('467213', '凌源市', '465783', '8', '4', '211382', '82');
INSERT INTO `qm_region` VALUES ('467520', '葫芦岛市', '451186', '14', '3', '2114', '14');
INSERT INTO `qm_region` VALUES ('467521', '市辖区', '467520', '1', '4', '211401', '01');
INSERT INTO `qm_region` VALUES ('467522', '连山区', '467520', '2', '4', '211402', '02');
INSERT INTO `qm_region` VALUES ('467851', '龙港区', '467520', '3', '4', '211403', '03');
INSERT INTO `qm_region` VALUES ('467945', '南票区', '467520', '4', '4', '211404', '04');
INSERT INTO `qm_region` VALUES ('468035', '绥中县', '467520', '5', '4', '211421', '21');
INSERT INTO `qm_region` VALUES ('468363', '建昌县', '467520', '6', '4', '211422', '22');
INSERT INTO `qm_region` VALUES ('468679', '兴城市', '467520', '7', '4', '211481', '81');
INSERT INTO `qm_region` VALUES ('468973', '内蒙古', '1', '22', '2', '15', '15');
INSERT INTO `qm_region` VALUES ('468974', '呼和浩特市', '468973', '1', '3', '1501', '01');
INSERT INTO `qm_region` VALUES ('468975', '市辖区', '468974', '1', '4', '150101', '01');
INSERT INTO `qm_region` VALUES ('468976', '新城区', '468974', '2', '4', '150102', '02');
INSERT INTO `qm_region` VALUES ('469065', '回民区', '468974', '3', '4', '150103', '03');
INSERT INTO `qm_region` VALUES ('469141', '玉泉区', '468974', '4', '4', '150104', '04');
INSERT INTO `qm_region` VALUES ('469254', '赛罕区', '468974', '5', '4', '150105', '05');
INSERT INTO `qm_region` VALUES ('469454', '土左旗', '468974', '6', '4', '150121', '21');
INSERT INTO `qm_region` VALUES ('469803', '托克托县', '468974', '7', '4', '150122', '22');
INSERT INTO `qm_region` VALUES ('469942', '和林格尔县', '468974', '8', '4', '150123', '23');
INSERT INTO `qm_region` VALUES ('470111', '清水河县', '468974', '9', '4', '150124', '24');
INSERT INTO `qm_region` VALUES ('470226', '武川县', '468974', '10', '4', '150125', '25');
INSERT INTO `qm_region` VALUES ('470335', '包头市', '468973', '2', '3', '1502', '02');
INSERT INTO `qm_region` VALUES ('470336', '市辖区', '470335', '1', '4', '150201', '01');
INSERT INTO `qm_region` VALUES ('470337', '东河区', '470335', '2', '4', '150202', '02');
INSERT INTO `qm_region` VALUES ('470471', '昆都仑区', '470335', '3', '4', '150203', '03');
INSERT INTO `qm_region` VALUES ('470598', '青山区', '470335', '4', '4', '150204', '04');
INSERT INTO `qm_region` VALUES ('470719', '石拐区', '470335', '5', '4', '150205', '05');
INSERT INTO `qm_region` VALUES ('470771', '白云鄂博矿区', '470335', '6', '4', '150206', '06');
INSERT INTO `qm_region` VALUES ('470780', '九原区', '470335', '7', '4', '150207', '07');
INSERT INTO `qm_region` VALUES ('470917', '土默特右旗', '470335', '8', '4', '150221', '21');
INSERT INTO `qm_region` VALUES ('471242', '固阳县', '470335', '9', '4', '150222', '22');
INSERT INTO `qm_region` VALUES ('471364', '达茂联合旗', '470335', '10', '4', '150223', '23');
INSERT INTO `qm_region` VALUES ('471458', '乌海市', '468973', '3', '3', '1503', '03');
INSERT INTO `qm_region` VALUES ('471459', '乌海市辖区', '471458', '1', '4', '150301', '01');
INSERT INTO `qm_region` VALUES ('471460', '海勃湾区', '471458', '2', '4', '150302', '02');
INSERT INTO `qm_region` VALUES ('471532', '海南区', '471458', '3', '4', '150303', '03');
INSERT INTO `qm_region` VALUES ('471591', '乌达区', '471458', '4', '4', '150304', '04');
INSERT INTO `qm_region` VALUES ('471644', '赤峰市', '468973', '4', '3', '1504', '04');
INSERT INTO `qm_region` VALUES ('471645', '市辖区', '471644', '1', '4', '150401', '01');
INSERT INTO `qm_region` VALUES ('471646', '红山区', '471644', '2', '4', '150402', '02');
INSERT INTO `qm_region` VALUES ('471752', '元宝山区', '471644', '3', '4', '150403', '03');
INSERT INTO `qm_region` VALUES ('471885', '松山区', '471644', '4', '4', '150404', '04');
INSERT INTO `qm_region` VALUES ('472180', '阿鲁科尔沁旗', '471644', '5', '4', '150421', '21');
INSERT INTO `qm_region` VALUES ('472444', '巴林左旗', '471644', '6', '4', '150422', '22');
INSERT INTO `qm_region` VALUES ('472631', '巴林右旗', '471644', '7', '4', '150423', '23');
INSERT INTO `qm_region` VALUES ('472811', '林西县', '471644', '8', '4', '150424', '24');
INSERT INTO `qm_region` VALUES ('472935', '克什克腾旗', '471644', '9', '4', '150425', '25');
INSERT INTO `qm_region` VALUES ('473080', '翁牛特旗', '471644', '10', '4', '150426', '26');
INSERT INTO `qm_region` VALUES ('473327', '喀喇沁旗', '471644', '11', '4', '150428', '28');
INSERT INTO `qm_region` VALUES ('473509', '宁城县', '471644', '12', '4', '150429', '29');
INSERT INTO `qm_region` VALUES ('473840', '敖汉旗', '471644', '13', '4', '150430', '30');
INSERT INTO `qm_region` VALUES ('474093', '通辽市', '468973', '5', '3', '1505', '05');
INSERT INTO `qm_region` VALUES ('474094', '市辖区', '474093', '1', '4', '150501', '01');
INSERT INTO `qm_region` VALUES ('474095', '科尔沁区', '474093', '2', '4', '150502', '02');
INSERT INTO `qm_region` VALUES ('474629', '科尔沁左翼中旗', '474093', '3', '4', '150521', '21');
INSERT INTO `qm_region` VALUES ('475197', '科左后旗', '474093', '4', '4', '150522', '22');
INSERT INTO `qm_region` VALUES ('475528', '开鲁县', '474093', '5', '4', '150523', '23');
INSERT INTO `qm_region` VALUES ('475810', '库伦旗', '474093', '6', '4', '150524', '24');
INSERT INTO `qm_region` VALUES ('476012', '奈曼旗', '474093', '7', '4', '150525', '25');
INSERT INTO `qm_region` VALUES ('476398', '扎鲁特旗', '474093', '8', '4', '150526', '26');
INSERT INTO `qm_region` VALUES ('476672', '霍林郭勒市', '474093', '9', '4', '150581', '81');
INSERT INTO `qm_region` VALUES ('476707', '鄂尔多斯市', '468973', '6', '3', '1506', '06');
INSERT INTO `qm_region` VALUES ('476708', '东胜区', '476707', '1', '4', '150602', '02');
INSERT INTO `qm_region` VALUES ('476813', '达拉特旗', '476707', '2', '4', '150621', '21');
INSERT INTO `qm_region` VALUES ('476965', '准格尔旗', '476707', '3', '4', '150622', '22');
INSERT INTO `qm_region` VALUES ('477154', '鄂托克前旗', '476707', '4', '4', '150623', '23');
INSERT INTO `qm_region` VALUES ('477237', '鄂托克旗', '476707', '5', '4', '150624', '24');
INSERT INTO `qm_region` VALUES ('477339', '杭锦旗', '476707', '6', '4', '150625', '25');
INSERT INTO `qm_region` VALUES ('477433', '乌审旗', '476707', '7', '4', '150626', '26');
INSERT INTO `qm_region` VALUES ('477518', '伊金霍洛旗', '476707', '8', '4', '150627', '27');
INSERT INTO `qm_region` VALUES ('477692', '呼伦贝尔市', '468973', '7', '3', '1507', '07');
INSERT INTO `qm_region` VALUES ('477693', '市辖区', '477692', '1', '4', '150701', '01');
INSERT INTO `qm_region` VALUES ('477694', '海拉尔区', '477692', '2', '4', '150702', '02');
INSERT INTO `qm_region` VALUES ('477766', '阿荣旗', '477692', '3', '4', '150721', '21');
INSERT INTO `qm_region` VALUES ('477986', '莫力达瓦达斡尔族自治旗', '477692', '4', '4', '150722', '22');
INSERT INTO `qm_region` VALUES ('478280', '鄂伦春自治旗', '477692', '5', '4', '150723', '23');
INSERT INTO `qm_region` VALUES ('478577', '鄂温克族自治旗', '477692', '6', '4', '150724', '24');
INSERT INTO `qm_region` VALUES ('478683', '陈巴尔虎旗镇', '477692', '7', '4', '150725', '25');
INSERT INTO `qm_region` VALUES ('478768', '新巴尔虎左旗', '477692', '8', '4', '150726', '26');
INSERT INTO `qm_region` VALUES ('478842', '新巴尔虎右旗', '477692', '9', '4', '150727', '27');
INSERT INTO `qm_region` VALUES ('478908', '满洲里市', '477692', '10', '4', '150781', '81');
INSERT INTO `qm_region` VALUES ('478972', '牙克石市', '477692', '11', '4', '150782', '82');
INSERT INTO `qm_region` VALUES ('479076', '扎兰屯市', '477692', '12', '4', '150783', '83');
INSERT INTO `qm_region` VALUES ('479327', '额尔古纳市', '477692', '13', '4', '150784', '84');
INSERT INTO `qm_region` VALUES ('479441', '根河市', '477692', '14', '4', '150785', '85');
INSERT INTO `qm_region` VALUES ('479482', '巴彦淖尔市', '468973', '8', '3', '1508', '08');
INSERT INTO `qm_region` VALUES ('479483', '市辖区', '479482', '1', '4', '150801', '01');
INSERT INTO `qm_region` VALUES ('479484', '临河区', '479482', '2', '4', '150802', '02');
INSERT INTO `qm_region` VALUES ('479746', '五原县', '479482', '3', '4', '150821', '21');
INSERT INTO `qm_region` VALUES ('479924', '磴口县', '479482', '4', '4', '150822', '22');
INSERT INTO `qm_region` VALUES ('480053', '乌拉特前旗', '479482', '5', '4', '150823', '23');
INSERT INTO `qm_region` VALUES ('480253', '乌拉特中旗', '479482', '6', '4', '150824', '24');
INSERT INTO `qm_region` VALUES ('480378', '乌拉特后旗', '479482', '7', '4', '150825', '25');
INSERT INTO `qm_region` VALUES ('480454', '杭锦后旗', '479482', '8', '4', '150826', '26');
INSERT INTO `qm_region` VALUES ('480605', '乌兰察布市', '468973', '9', '3', '1509', '09');
INSERT INTO `qm_region` VALUES ('480606', '市辖区', '480605', '1', '4', '150901', '01');
INSERT INTO `qm_region` VALUES ('480607', '集宁区', '480605', '2', '4', '150902', '02');
INSERT INTO `qm_region` VALUES ('480716', '卓资县', '480605', '3', '4', '150921', '21');
INSERT INTO `qm_region` VALUES ('480844', '化德县', '480605', '4', '4', '150922', '22');
INSERT INTO `qm_region` VALUES ('480950', '商都县', '480605', '5', '4', '150923', '23');
INSERT INTO `qm_region` VALUES ('481189', '兴和县', '480605', '6', '4', '150924', '24');
INSERT INTO `qm_region` VALUES ('481369', '凉城县', '480605', '7', '4', '150925', '25');
INSERT INTO `qm_region` VALUES ('481523', '察哈尔右翼前旗', '480605', '8', '4', '150926', '26');
INSERT INTO `qm_region` VALUES ('481666', '察右中旗', '480605', '9', '4', '150927', '27');
INSERT INTO `qm_region` VALUES ('481859', '察哈尔右翼后旗', '480605', '10', '4', '150928', '28');
INSERT INTO `qm_region` VALUES ('482000', '四子王旗', '480605', '11', '4', '150929', '29');
INSERT INTO `qm_region` VALUES ('482145', '丰镇市', '480605', '12', '4', '150981', '81');
INSERT INTO `qm_region` VALUES ('482281', '兴安盟', '468973', '10', '3', '1522', '22');
INSERT INTO `qm_region` VALUES ('482282', '乌兰浩特市', '482281', '1', '4', '152201', '01');
INSERT INTO `qm_region` VALUES ('482408', '阿尔山市', '482281', '2', '4', '152202', '02');
INSERT INTO `qm_region` VALUES ('482472', '科右前旗', '482281', '3', '4', '152221', '21');
INSERT INTO `qm_region` VALUES ('482781', '科右中旗', '482281', '4', '4', '152222', '22');
INSERT INTO `qm_region` VALUES ('483007', '扎赉特旗', '482281', '5', '4', '152223', '23');
INSERT INTO `qm_region` VALUES ('483249', '突泉县', '482281', '6', '4', '152224', '24');
INSERT INTO `qm_region` VALUES ('483469', '锡林郭勒盟', '468973', '11', '3', '1525', '25');
INSERT INTO `qm_region` VALUES ('483470', '二连浩特市', '483469', '1', '4', '152501', '01');
INSERT INTO `qm_region` VALUES ('483495', '锡林浩特市', '483469', '2', '4', '152502', '02');
INSERT INTO `qm_region` VALUES ('483593', '阿巴嘎旗', '483469', '3', '4', '152522', '22');
INSERT INTO `qm_region` VALUES ('483677', '苏尼特左旗', '483469', '4', '4', '152523', '23');
INSERT INTO `qm_region` VALUES ('483738', '苏尼特右旗', '483469', '5', '4', '152524', '24');
INSERT INTO `qm_region` VALUES ('483820', '东乌珠穆沁旗', '483469', '6', '4', '152525', '25');
INSERT INTO `qm_region` VALUES ('483937', '西乌珠穆沁旗', '483469', '7', '4', '152526', '26');
INSERT INTO `qm_region` VALUES ('484071', '太仆寺旗', '483469', '8', '4', '152527', '27');
INSERT INTO `qm_region` VALUES ('484273', '镶黄旗', '483469', '9', '4', '152528', '28');
INSERT INTO `qm_region` VALUES ('484343', '正镶白旗', '483469', '10', '4', '152529', '29');
INSERT INTO `qm_region` VALUES ('484435', '正蓝旗', '483469', '11', '4', '152530', '30');
INSERT INTO `qm_region` VALUES ('484571', '多伦县', '483469', '12', '4', '152531', '31');
INSERT INTO `qm_region` VALUES ('484647', '阿拉善盟', '468973', '12', '3', '1529', '29');
INSERT INTO `qm_region` VALUES ('484648', '阿拉善左旗', '484647', '1', '4', '152921', '21');
INSERT INTO `qm_region` VALUES ('484835', '阿拉善右旗', '484647', '2', '4', '152922', '22');
INSERT INTO `qm_region` VALUES ('484889', '额济纳旗', '484647', '3', '4', '152923', '23');
INSERT INTO `qm_region` VALUES ('484915', '宁夏', '1', '23', '2', '64', '64');
INSERT INTO `qm_region` VALUES ('484916', '银川市', '484915', '1', '3', '6401', '01');
INSERT INTO `qm_region` VALUES ('484917', '市辖区', '484916', '1', '4', '640101', '01');
INSERT INTO `qm_region` VALUES ('484918', '兴庆区', '484916', '2', '4', '640104', '04');
INSERT INTO `qm_region` VALUES ('485057', '西夏区', '484916', '3', '4', '640105', '05');
INSERT INTO `qm_region` VALUES ('485139', '金凤区', '484916', '4', '4', '640106', '06');
INSERT INTO `qm_region` VALUES ('485202', '永宁县', '484916', '5', '4', '640121', '21');
INSERT INTO `qm_region` VALUES ('485303', '贺兰县', '484916', '6', '4', '640122', '22');
INSERT INTO `qm_region` VALUES ('485386', '灵武市', '484916', '7', '4', '640181', '81');
INSERT INTO `qm_region` VALUES ('485503', '石嘴山市', '484915', '2', '3', '6402', '02');
INSERT INTO `qm_region` VALUES ('485504', '市辖区', '485503', '1', '4', '640201', '01');
INSERT INTO `qm_region` VALUES ('485505', '大武口区', '485503', '2', '4', '640202', '02');
INSERT INTO `qm_region` VALUES ('485589', '惠农区', '485503', '3', '4', '640205', '05');
INSERT INTO `qm_region` VALUES ('485698', '平罗县', '485503', '4', '4', '640221', '21');
INSERT INTO `qm_region` VALUES ('485884', '吴忠市', '484915', '3', '3', '6403', '03');
INSERT INTO `qm_region` VALUES ('485885', '市辖区', '485884', '1', '4', '640301', '01');
INSERT INTO `qm_region` VALUES ('485934', '利通区', '485884', '2', '4', '640302', '02');
INSERT INTO `qm_region` VALUES ('486086', '盐池县', '485884', '3', '4', '640323', '23');
INSERT INTO `qm_region` VALUES ('486210', '同心县', '485884', '4', '4', '640324', '24');
INSERT INTO `qm_region` VALUES ('486418', '青铜峡市', '485884', '5', '4', '640381', '81');
INSERT INTO `qm_region` VALUES ('486564', '固原市', '484915', '4', '3', '6404', '04');
INSERT INTO `qm_region` VALUES ('486565', '市辖区', '486564', '1', '4', '640401', '01');
INSERT INTO `qm_region` VALUES ('486566', '原州区', '486564', '2', '4', '640402', '02');
INSERT INTO `qm_region` VALUES ('486828', '西吉县', '486564', '3', '4', '640422', '22');
INSERT INTO `qm_region` VALUES ('487158', '隆德县', '486564', '4', '4', '640423', '23');
INSERT INTO `qm_region` VALUES ('487302', '泾源县', '486564', '5', '4', '640424', '24');
INSERT INTO `qm_region` VALUES ('487422', '彭阳县', '486564', '6', '4', '640425', '25');
INSERT INTO `qm_region` VALUES ('487595', '中卫市', '484915', '5', '3', '6405', '05');
INSERT INTO `qm_region` VALUES ('487596', '市辖区', '487595', '1', '4', '640501', '01');
INSERT INTO `qm_region` VALUES ('487770', '沙坡头区', '487595', '2', '4', '640502', '02');
INSERT INTO `qm_region` VALUES ('487771', '中宁县', '487595', '3', '4', '640521', '21');
INSERT INTO `qm_region` VALUES ('487928', '海原县', '487595', '4', '4', '640522', '22');
INSERT INTO `qm_region` VALUES ('488119', '青海省', '1', '24', '2', '63', '63');
INSERT INTO `qm_region` VALUES ('488120', '西宁市', '488119', '1', '3', '6301', '01');
INSERT INTO `qm_region` VALUES ('488121', '城东区', '488120', '1', '4', '630102', '02');
INSERT INTO `qm_region` VALUES ('488195', '城中区', '488120', '2', '4', '630103', '03');
INSERT INTO `qm_region` VALUES ('488237', '城西区', '488120', '3', '4', '630104', '04');
INSERT INTO `qm_region` VALUES ('488293', '城北区', '488120', '4', '4', '630105', '05');
INSERT INTO `qm_region` VALUES ('488360', '大通回族土族自治县', '488120', '5', '4', '630121', '21');
INSERT INTO `qm_region` VALUES ('488688', '湟中县', '488120', '6', '4', '630122', '22');
INSERT INTO `qm_region` VALUES ('489134', '湟源县', '488120', '7', '4', '630123', '23');
INSERT INTO `qm_region` VALUES ('489297', '海东地区', '488119', '2', '3', '6321', '21');
INSERT INTO `qm_region` VALUES ('489298', '平安县', '489297', '1', '4', '632121', '21');
INSERT INTO `qm_region` VALUES ('489423', '民和县', '489297', '2', '4', '632122', '22');
INSERT INTO `qm_region` VALUES ('489769', '乐都县', '489297', '3', '4', '632123', '23');
INSERT INTO `qm_region` VALUES ('490157', '互助县', '489297', '4', '4', '632126', '26');
INSERT INTO `qm_region` VALUES ('490478', '化隆回族自治县', '489297', '5', '4', '632127', '27');
INSERT INTO `qm_region` VALUES ('490868', '循化县', '489297', '6', '4', '632128', '28');
INSERT INTO `qm_region` VALUES ('491034', '海北州', '488119', '3', '3', '6322', '22');
INSERT INTO `qm_region` VALUES ('491035', '门源县', '491034', '1', '4', '632221', '21');
INSERT INTO `qm_region` VALUES ('491180', '祁连县', '491034', '2', '4', '632222', '22');
INSERT INTO `qm_region` VALUES ('491234', '海晏县', '491034', '3', '4', '632223', '23');
INSERT INTO `qm_region` VALUES ('491270', '刚察县', '491034', '4', '4', '632224', '24');
INSERT INTO `qm_region` VALUES ('491321', '黄南州', '488119', '4', '3', '6323', '23');
INSERT INTO `qm_region` VALUES ('491322', '同仁县', '491321', '1', '4', '632321', '21');
INSERT INTO `qm_region` VALUES ('491410', '尖扎县', '491321', '2', '4', '632322', '22');
INSERT INTO `qm_region` VALUES ('491506', '泽库县', '491321', '3', '4', '632323', '23');
INSERT INTO `qm_region` VALUES ('491580', '河南县', '491321', '4', '4', '632324', '24');
INSERT INTO `qm_region` VALUES ('491626', '海南州', '488119', '5', '3', '6325', '25');
INSERT INTO `qm_region` VALUES ('491627', '共和县', '491626', '1', '4', '632521', '21');
INSERT INTO `qm_region` VALUES ('491758', '同德县', '491626', '2', '4', '632522', '22');
INSERT INTO `qm_region` VALUES ('491847', '贵德县', '491626', '3', '4', '632523', '23');
INSERT INTO `qm_region` VALUES ('491978', '兴海县', '491626', '4', '4', '632524', '24');
INSERT INTO `qm_region` VALUES ('492047', '贵南县', '491626', '5', '4', '632525', '25');
INSERT INTO `qm_region` VALUES ('492141', '果洛州', '488119', '6', '3', '6326', '26');
INSERT INTO `qm_region` VALUES ('492142', '玛沁县', '492141', '1', '4', '632621', '21');
INSERT INTO `qm_region` VALUES ('492186', '班玛县', '492141', '2', '4', '632622', '22');
INSERT INTO `qm_region` VALUES ('492229', '甘德县', '492141', '3', '4', '632623', '23');
INSERT INTO `qm_region` VALUES ('492274', '达日县', '492141', '4', '4', '632624', '24');
INSERT INTO `qm_region` VALUES ('492319', '久治县', '492141', '5', '4', '632625', '25');
INSERT INTO `qm_region` VALUES ('492349', '玛多县', '492141', '6', '4', '632626', '26');
INSERT INTO `qm_region` VALUES ('492383', '玉树州', '488119', '7', '3', '6327', '27');
INSERT INTO `qm_region` VALUES ('492384', '玉树县', '492383', '1', '4', '632721', '21');
INSERT INTO `qm_region` VALUES ('492461', '杂多县', '492383', '2', '4', '632722', '22');
INSERT INTO `qm_region` VALUES ('492503', '称多县', '492383', '3', '4', '632723', '23');
INSERT INTO `qm_region` VALUES ('492572', '治多县', '492383', '4', '4', '632724', '24');
INSERT INTO `qm_region` VALUES ('492599', '囊谦县', '492383', '5', '4', '632725', '25');
INSERT INTO `qm_region` VALUES ('492681', '曲麻莱县', '492383', '6', '4', '632726', '26');
INSERT INTO `qm_region` VALUES ('492709', '海西州', '488119', '8', '3', '6328', '28');
INSERT INTO `qm_region` VALUES ('492710', '格尔木市', '492709', '1', '4', '632801', '01');
INSERT INTO `qm_region` VALUES ('492794', '德令哈市', '492709', '2', '4', '632802', '02');
INSERT INTO `qm_region` VALUES ('492880', '乌兰县', '492709', '3', '4', '632821', '21');
INSERT INTO `qm_region` VALUES ('492930', '都兰县', '492709', '4', '4', '632822', '22');
INSERT INTO `qm_region` VALUES ('493055', '天峻县', '492709', '5', '4', '632823', '23');
INSERT INTO `qm_region` VALUES ('493130', '山东省', '1', '25', '2', '37', '37');
INSERT INTO `qm_region` VALUES ('493131', '济南市', '493130', '1', '3', '3701', '01');
INSERT INTO `qm_region` VALUES ('493132', '市辖区', '493131', '1', '4', '370101', '01');
INSERT INTO `qm_region` VALUES ('493133', '历下区', '493131', '2', '4', '370102', '02');
INSERT INTO `qm_region` VALUES ('493235', '市中区', '493131', '3', '4', '370103', '03');
INSERT INTO `qm_region` VALUES ('493460', '槐荫区', '493131', '4', '4', '370104', '04');
INSERT INTO `qm_region` VALUES ('493622', '天桥区', '493131', '5', '4', '370105', '05');
INSERT INTO `qm_region` VALUES ('493878', '历城区', '493131', '6', '4', '370112', '12');
INSERT INTO `qm_region` VALUES ('494604', '长清区', '493131', '7', '4', '370113', '13');
INSERT INTO `qm_region` VALUES ('495250', '平阴县', '493131', '8', '4', '370124', '24');
INSERT INTO `qm_region` VALUES ('495604', '济阳县', '493131', '9', '4', '370125', '25');
INSERT INTO `qm_region` VALUES ('496485', '商河县', '493131', '10', '4', '370126', '26');
INSERT INTO `qm_region` VALUES ('497461', '章丘市', '493131', '11', '4', '370181', '81');
INSERT INTO `qm_region` VALUES ('498417', '青岛市', '493130', '2', '3', '3702', '02');
INSERT INTO `qm_region` VALUES ('498418', '市辖区', '498417', '1', '4', '370201', '01');
INSERT INTO `qm_region` VALUES ('498419', '市南区', '498417', '2', '4', '370202', '02');
INSERT INTO `qm_region` VALUES ('498515', '市北区', '498417', '3', '4', '370203', '03');
INSERT INTO `qm_region` VALUES ('498641', '四方区', '498417', '4', '4', '370205', '05');
INSERT INTO `qm_region` VALUES ('498740', '黄岛区', '498417', '5', '4', '370211', '11');
INSERT INTO `qm_region` VALUES ('498950', '崂山区', '498417', '6', '4', '370212', '12');
INSERT INTO `qm_region` VALUES ('499094', '李沧区', '498417', '7', '4', '370213', '13');
INSERT INTO `qm_region` VALUES ('499231', '城阳区', '498417', '8', '4', '370214', '14');
INSERT INTO `qm_region` VALUES ('499484', '胶州市', '498417', '9', '4', '370281', '81');
INSERT INTO `qm_region` VALUES ('500371', '即墨市', '498417', '10', '4', '370282', '82');
INSERT INTO `qm_region` VALUES ('501462', '平度市', '498417', '11', '4', '370283', '83');
INSERT INTO `qm_region` VALUES ('503338', '胶南市', '498417', '12', '4', '370284', '84');
INSERT INTO `qm_region` VALUES ('504372', '莱西市', '498417', '13', '4', '370285', '85');
INSERT INTO `qm_region` VALUES ('505283', '淄博市', '493130', '3', '3', '3703', '03');
INSERT INTO `qm_region` VALUES ('505284', '市辖区', '505283', '1', '4', '370301', '01');
INSERT INTO `qm_region` VALUES ('505285', '淄川区', '505283', '2', '4', '370302', '02');
INSERT INTO `qm_region` VALUES ('505789', '张店区', '505283', '3', '4', '370303', '03');
INSERT INTO `qm_region` VALUES ('506082', '博山区', '505283', '4', '4', '370304', '04');
INSERT INTO `qm_region` VALUES ('506426', '临淄区', '505283', '5', '4', '370305', '05');
INSERT INTO `qm_region` VALUES ('506913', '周村区', '505283', '6', '4', '370306', '06');
INSERT INTO `qm_region` VALUES ('507153', '桓台县', '505283', '7', '4', '370321', '21');
INSERT INTO `qm_region` VALUES ('507510', '高青县', '505283', '8', '4', '370322', '22');
INSERT INTO `qm_region` VALUES ('508287', '沂源县', '505283', '9', '4', '370323', '23');
INSERT INTO `qm_region` VALUES ('508941', '枣庄市', '493130', '4', '3', '3704', '04');
INSERT INTO `qm_region` VALUES ('508942', '市辖区', '508941', '1', '4', '370401', '01');
INSERT INTO `qm_region` VALUES ('508943', '市中区', '508941', '2', '4', '370402', '02');
INSERT INTO `qm_region` VALUES ('509135', '薛城区', '508941', '3', '4', '370403', '03');
INSERT INTO `qm_region` VALUES ('509410', '峄城区', '508941', '4', '4', '370404', '04');
INSERT INTO `qm_region` VALUES ('509761', '台儿庄区', '508941', '5', '4', '370405', '05');
INSERT INTO `qm_region` VALUES ('509979', '山亭区', '508941', '6', '4', '370406', '06');
INSERT INTO `qm_region` VALUES ('510245', '滕州市', '508941', '7', '4', '370481', '81');
INSERT INTO `qm_region` VALUES ('511483', '东营市', '493130', '5', '3', '3705', '05');
INSERT INTO `qm_region` VALUES ('511484', '市辖区', '511483', '1', '4', '370501', '01');
INSERT INTO `qm_region` VALUES ('511485', '东营区', '511483', '2', '4', '370502', '02');
INSERT INTO `qm_region` VALUES ('511751', '河口区', '511483', '3', '4', '370503', '03');
INSERT INTO `qm_region` VALUES ('511941', '垦利县', '511483', '4', '4', '370521', '21');
INSERT INTO `qm_region` VALUES ('512295', '利津县', '511483', '5', '4', '370522', '22');
INSERT INTO `qm_region` VALUES ('512817', '广饶县', '511483', '6', '4', '370523', '23');
INSERT INTO `qm_region` VALUES ('513384', '烟台市', '493130', '6', '3', '3706', '06');
INSERT INTO `qm_region` VALUES ('513385', '市辖区', '513384', '1', '4', '370601', '01');
INSERT INTO `qm_region` VALUES ('513386', '芝罘区', '513384', '2', '4', '370602', '02');
INSERT INTO `qm_region` VALUES ('513542', '福山区', '513384', '3', '4', '370611', '11');
INSERT INTO `qm_region` VALUES ('513913', '牟平区', '513384', '4', '4', '370612', '12');
INSERT INTO `qm_region` VALUES ('514535', '莱山区', '513384', '5', '4', '370613', '13');
INSERT INTO `qm_region` VALUES ('514668', '长岛县', '513384', '6', '4', '370634', '34');
INSERT INTO `qm_region` VALUES ('514717', '龙口市', '513384', '7', '4', '370681', '81');
INSERT INTO `qm_region` VALUES ('515362', '莱阳市', '513384', '8', '4', '370682', '82');
INSERT INTO `qm_region` VALUES ('516178', '莱州市', '513384', '9', '4', '370683', '83');
INSERT INTO `qm_region` VALUES ('517234', '蓬莱市', '513384', '10', '4', '370684', '84');
INSERT INTO `qm_region` VALUES ('517831', '招远市', '513384', '11', '4', '370685', '85');
INSERT INTO `qm_region` VALUES ('518581', '栖霞市', '513384', '12', '4', '370686', '86');
INSERT INTO `qm_region` VALUES ('519550', '海阳市', '513384', '13', '4', '370687', '87');
INSERT INTO `qm_region` VALUES ('520298', '潍坊市', '493130', '7', '3', '3707', '07');
INSERT INTO `qm_region` VALUES ('520299', '市辖区', '520298', '1', '4', '370701', '01');
INSERT INTO `qm_region` VALUES ('520300', '潍城区', '520298', '2', '4', '370702', '02');
INSERT INTO `qm_region` VALUES ('520577', '寒亭区', '520298', '3', '4', '370703', '03');
INSERT INTO `qm_region` VALUES ('520973', '坊子区', '520298', '4', '4', '370704', '04');
INSERT INTO `qm_region` VALUES ('521226', '奎文区', '520298', '5', '4', '370705', '05');
INSERT INTO `qm_region` VALUES ('521514', '临朐县', '520298', '6', '4', '370724', '24');
INSERT INTO `qm_region` VALUES ('522470', '昌乐县', '520298', '7', '4', '370725', '25');
INSERT INTO `qm_region` VALUES ('523379', '青州市', '520298', '8', '4', '370781', '81');
INSERT INTO `qm_region` VALUES ('524481', '诸城市', '520298', '9', '4', '370782', '82');
INSERT INTO `qm_region` VALUES ('525851', '寿光市', '520298', '10', '4', '370783', '83');
INSERT INTO `qm_region` VALUES ('526877', '安丘市', '520298', '11', '4', '370784', '84');
INSERT INTO `qm_region` VALUES ('528289', '高密市', '520298', '12', '4', '370785', '85');
INSERT INTO `qm_region` VALUES ('529304', '昌邑市', '520298', '13', '4', '370786', '86');
INSERT INTO `qm_region` VALUES ('530139', '济宁市', '493130', '8', '3', '3708', '08');
INSERT INTO `qm_region` VALUES ('530140', '市辖区', '530139', '1', '4', '370801', '01');
INSERT INTO `qm_region` VALUES ('530141', '市中区', '530139', '2', '4', '370802', '02');
INSERT INTO `qm_region` VALUES ('530260', '任城区', '530139', '3', '4', '370811', '11');
INSERT INTO `qm_region` VALUES ('530849', '微山县', '530139', '4', '4', '370826', '26');
INSERT INTO `qm_region` VALUES ('531407', '鱼台县', '530139', '5', '4', '370827', '27');
INSERT INTO `qm_region` VALUES ('531810', '金乡县', '530139', '6', '4', '370828', '28');
INSERT INTO `qm_region` VALUES ('532483', '嘉祥县', '530139', '7', '4', '370829', '29');
INSERT INTO `qm_region` VALUES ('533214', '汶上县', '530139', '8', '4', '370830', '30');
INSERT INTO `qm_region` VALUES ('533722', '泗水县', '530139', '9', '4', '370831', '31');
INSERT INTO `qm_region` VALUES ('534328', '梁山县', '530139', '10', '4', '370832', '32');
INSERT INTO `qm_region` VALUES ('535030', '曲阜市', '530139', '11', '4', '370881', '81');
INSERT INTO `qm_region` VALUES ('535438', '兖州市', '530139', '12', '4', '370882', '82');
INSERT INTO `qm_region` VALUES ('535978', '邹城市', '530139', '13', '4', '370883', '83');
INSERT INTO `qm_region` VALUES ('536887', '泰安市', '493130', '9', '3', '3709', '09');
INSERT INTO `qm_region` VALUES ('536888', '市辖区', '536887', '1', '4', '370901', '01');
INSERT INTO `qm_region` VALUES ('536889', '泰山区', '536887', '2', '4', '370902', '02');
INSERT INTO `qm_region` VALUES ('537101', '岱岳区', '536887', '3', '4', '370903', '03');
INSERT INTO `qm_region` VALUES ('537833', '宁阳县', '536887', '4', '4', '370921', '21');
INSERT INTO `qm_region` VALUES ('538412', '东平县', '536887', '5', '4', '370923', '23');
INSERT INTO `qm_region` VALUES ('539144', '新泰市', '536887', '6', '4', '370982', '82');
INSERT INTO `qm_region` VALUES ('540084', '肥城市', '536887', '7', '4', '370983', '83');
INSERT INTO `qm_region` VALUES ('540733', '威海市', '493130', '10', '3', '3710', '10');
INSERT INTO `qm_region` VALUES ('540734', '市辖区', '540733', '1', '4', '371001', '01');
INSERT INTO `qm_region` VALUES ('540735', '环翠区', '540733', '2', '4', '371002', '02');
INSERT INTO `qm_region` VALUES ('541173', '文登市', '540733', '3', '4', '371081', '81');
INSERT INTO `qm_region` VALUES ('542091', '荣成市', '540733', '4', '4', '371082', '82');
INSERT INTO `qm_region` VALUES ('543067', '乳山市', '540733', '5', '4', '371083', '83');
INSERT INTO `qm_region` VALUES ('543697', '日照市', '493130', '11', '3', '3711', '11');
INSERT INTO `qm_region` VALUES ('543698', '市辖区', '543697', '1', '4', '371101', '01');
INSERT INTO `qm_region` VALUES ('543699', '东港区', '543697', '2', '4', '371102', '02');
INSERT INTO `qm_region` VALUES ('544403', '岚山区', '543697', '3', '4', '371103', '03');
INSERT INTO `qm_region` VALUES ('544830', '五莲县', '543697', '4', '4', '371121', '21');
INSERT INTO `qm_region` VALUES ('545475', '莒县', '543697', '5', '4', '371122', '22');
INSERT INTO `qm_region` VALUES ('546757', '莱芜市', '493130', '12', '3', '3712', '12');
INSERT INTO `qm_region` VALUES ('546758', '市辖区', '546757', '1', '4', '371201', '01');
INSERT INTO `qm_region` VALUES ('546759', '莱城区', '546757', '2', '4', '371202', '02');
INSERT INTO `qm_region` VALUES ('547613', '钢城区', '546757', '3', '4', '371203', '03');
INSERT INTO `qm_region` VALUES ('547853', '临沂市', '493130', '13', '3', '3713', '13');
INSERT INTO `qm_region` VALUES ('547854', '临沂市辖区', '547853', '1', '4', '371301', '01');
INSERT INTO `qm_region` VALUES ('547855', '兰山区', '547853', '2', '4', '371302', '02');
INSERT INTO `qm_region` VALUES ('548333', '罗庄区', '547853', '3', '4', '371311', '11');
INSERT INTO `qm_region` VALUES ('548487', '河东区', '547853', '4', '4', '371312', '12');
INSERT INTO `qm_region` VALUES ('548975', '沂南县', '547853', '5', '4', '371321', '21');
INSERT INTO `qm_region` VALUES ('549593', '郯城县', '547853', '6', '4', '371322', '22');
INSERT INTO `qm_region` VALUES ('550285', '沂水县', '547853', '7', '4', '371323', '23');
INSERT INTO `qm_region` VALUES ('551530', '苍山县', '547853', '8', '4', '371324', '24');
INSERT INTO `qm_region` VALUES ('552608', '费县', '547853', '9', '4', '371325', '25');
INSERT INTO `qm_region` VALUES ('553190', '平邑县', '547853', '10', '4', '371326', '26');
INSERT INTO `qm_region` VALUES ('553945', '莒南县', '547853', '11', '4', '371327', '27');
INSERT INTO `qm_region` VALUES ('554723', '蒙阴县', '547853', '12', '4', '371328', '28');
INSERT INTO `qm_region` VALUES ('555199', '临沭县', '547853', '13', '4', '371329', '29');
INSERT INTO `qm_region` VALUES ('555512', '德州市', '493130', '14', '3', '3714', '14');
INSERT INTO `qm_region` VALUES ('555513', '市辖区', '555512', '1', '4', '371401', '01');
INSERT INTO `qm_region` VALUES ('555514', '德城区', '555512', '2', '4', '371402', '02');
INSERT INTO `qm_region` VALUES ('555957', '陵县', '555512', '3', '4', '371421', '21');
INSERT INTO `qm_region` VALUES ('556961', '宁津县', '555512', '4', '4', '371422', '22');
INSERT INTO `qm_region` VALUES ('557829', '庆云县', '555512', '5', '4', '371423', '23');
INSERT INTO `qm_region` VALUES ('558230', '临邑县', '555512', '6', '4', '371424', '24');
INSERT INTO `qm_region` VALUES ('559099', '齐河县', '555512', '7', '4', '371425', '25');
INSERT INTO `qm_region` VALUES ('560128', '平原县', '555512', '8', '4', '371426', '26');
INSERT INTO `qm_region` VALUES ('561019', '夏津县', '555512', '9', '4', '371427', '27');
INSERT INTO `qm_region` VALUES ('561541', '武城县', '555512', '10', '4', '371428', '28');
INSERT INTO `qm_region` VALUES ('561950', '乐陵市', '555512', '11', '4', '371481', '81');
INSERT INTO `qm_region` VALUES ('563056', '禹城市', '555512', '12', '4', '371482', '82');
INSERT INTO `qm_region` VALUES ('564076', '聊城市', '493130', '15', '3', '3715', '15');
INSERT INTO `qm_region` VALUES ('564077', '市辖区', '564076', '1', '4', '371501', '01');
INSERT INTO `qm_region` VALUES ('564078', '东昌府区', '564076', '2', '4', '371502', '02');
INSERT INTO `qm_region` VALUES ('565056', '阳谷县', '564076', '3', '4', '371521', '21');
INSERT INTO `qm_region` VALUES ('565949', '莘县', '564076', '4', '4', '371522', '22');
INSERT INTO `qm_region` VALUES ('567125', '茌平县', '564076', '5', '4', '371523', '23');
INSERT INTO `qm_region` VALUES ('567961', '东阿县', '564076', '6', '4', '371524', '24');
INSERT INTO `qm_region` VALUES ('568541', '冠县', '564076', '7', '4', '371525', '25');
INSERT INTO `qm_region` VALUES ('569317', '高唐县', '564076', '8', '4', '371526', '26');
INSERT INTO `qm_region` VALUES ('569965', '临清市', '564076', '9', '4', '371581', '81');
INSERT INTO `qm_region` VALUES ('570636', '滨州市', '493130', '16', '3', '3716', '16');
INSERT INTO `qm_region` VALUES ('570637', '市辖区', '570636', '1', '4', '371601', '01');
INSERT INTO `qm_region` VALUES ('570638', '滨城区', '570636', '2', '4', '371602', '02');
INSERT INTO `qm_region` VALUES ('571618', '惠民县', '570636', '3', '4', '371621', '21');
INSERT INTO `qm_region` VALUES ('572915', '阳信县', '570636', '4', '4', '371622', '22');
INSERT INTO `qm_region` VALUES ('573782', '无棣县', '570636', '5', '4', '371623', '23');
INSERT INTO `qm_region` VALUES ('574390', '沾化县', '570636', '6', '4', '371624', '24');
INSERT INTO `qm_region` VALUES ('574852', '博兴县', '570636', '7', '4', '371625', '25');
INSERT INTO `qm_region` VALUES ('575317', '邹平县', '570636', '8', '4', '371626', '26');
INSERT INTO `qm_region` VALUES ('576185', '菏泽市', '493130', '17', '3', '3717', '17');
INSERT INTO `qm_region` VALUES ('576186', '市辖区', '576185', '1', '4', '371701', '01');
INSERT INTO `qm_region` VALUES ('576187', '牡丹区', '576185', '2', '4', '371702', '02');
INSERT INTO `qm_region` VALUES ('576980', '曹县', '576185', '3', '4', '371721', '21');
INSERT INTO `qm_region` VALUES ('578192', '单县', '576185', '4', '4', '371722', '22');
INSERT INTO `qm_region` VALUES ('578721', '成武县', '576185', '5', '4', '371723', '23');
INSERT INTO `qm_region` VALUES ('579207', '巨野县', '576185', '6', '4', '371724', '24');
INSERT INTO `qm_region` VALUES ('580109', '郓城县', '576185', '7', '4', '371725', '25');
INSERT INTO `qm_region` VALUES ('581172', '鄄城县', '576185', '8', '4', '371726', '26');
INSERT INTO `qm_region` VALUES ('581629', '定陶县', '576185', '9', '4', '371727', '27');
INSERT INTO `qm_region` VALUES ('582009', '东明县', '576185', '10', '4', '371728', '28');
INSERT INTO `qm_region` VALUES ('582414', '山西', '1', '26', '2', '14', '14');
INSERT INTO `qm_region` VALUES ('582415', '太原市', '582414', '1', '3', '1401', '01');
INSERT INTO `qm_region` VALUES ('582416', '市辖区', '582415', '1', '4', '140101', '01');
INSERT INTO `qm_region` VALUES ('582417', '小店区(人口含高新经济区)', '582415', '2', '4', '140105', '05');
INSERT INTO `qm_region` VALUES ('582591', '迎泽区', '582415', '3', '4', '140106', '06');
INSERT INTO `qm_region` VALUES ('582719', '杏花岭区', '582415', '4', '4', '140107', '07');
INSERT INTO `qm_region` VALUES ('582877', '尖草坪区', '582415', '5', '4', '140108', '08');
INSERT INTO `qm_region` VALUES ('583035', '万柏林区', '582415', '6', '4', '140109', '09');
INSERT INTO `qm_region` VALUES ('583198', '晋源区', '582415', '7', '4', '140110', '10');
INSERT INTO `qm_region` VALUES ('583318', '清徐县', '582415', '8', '4', '140121', '21');
INSERT INTO `qm_region` VALUES ('583526', '阳曲县', '582415', '9', '4', '140122', '22');
INSERT INTO `qm_region` VALUES ('583665', '娄烦县', '582415', '10', '4', '140123', '23');
INSERT INTO `qm_region` VALUES ('583823', '古交市', '582415', '11', '4', '140181', '81');
INSERT INTO `qm_region` VALUES ('584021', '大同市', '582414', '2', '3', '1402', '02');
INSERT INTO `qm_region` VALUES ('584022', '市辖区', '584021', '1', '4', '140201', '01');
INSERT INTO `qm_region` VALUES ('584023', '大同市城区', '584021', '2', '4', '140202', '02');
INSERT INTO `qm_region` VALUES ('584146', '矿区', '584021', '3', '4', '140203', '03');
INSERT INTO `qm_region` VALUES ('584273', '南郊区', '584021', '4', '4', '140211', '11');
INSERT INTO `qm_region` VALUES ('584473', '新荣区', '584021', '5', '4', '140212', '12');
INSERT INTO `qm_region` VALUES ('584627', '阳高县', '584021', '6', '4', '140221', '21');
INSERT INTO `qm_region` VALUES ('584907', '天镇县', '584021', '7', '4', '140222', '22');
INSERT INTO `qm_region` VALUES ('585145', '广灵县', '584021', '8', '4', '140223', '23');
INSERT INTO `qm_region` VALUES ('585335', '灵丘县', '584021', '9', '4', '140224', '24');
INSERT INTO `qm_region` VALUES ('585603', '浑源县', '584021', '10', '4', '140225', '25');
INSERT INTO `qm_region` VALUES ('585946', '左云县', '584021', '11', '4', '140226', '26');
INSERT INTO `qm_region` VALUES ('586192', '大同县', '584021', '12', '4', '140227', '27');
INSERT INTO `qm_region` VALUES ('586426', '阳泉市', '582414', '3', '3', '1403', '03');
INSERT INTO `qm_region` VALUES ('586427', '市辖区', '586426', '1', '4', '140301', '01');
INSERT INTO `qm_region` VALUES ('586428', '城区', '586426', '2', '4', '140302', '02');
INSERT INTO `qm_region` VALUES ('586478', '矿区', '586426', '3', '4', '140303', '03');
INSERT INTO `qm_region` VALUES ('586525', '郊区', '586426', '4', '4', '140311', '11');
INSERT INTO `qm_region` VALUES ('586729', '平定县', '586426', '5', '4', '140321', '21');
INSERT INTO `qm_region` VALUES ('587072', '盂县', '586426', '6', '4', '140322', '22');
INSERT INTO `qm_region` VALUES ('587546', '长治市', '582414', '4', '3', '1404', '04');
INSERT INTO `qm_region` VALUES ('587547', '市辖区', '587546', '1', '4', '140401', '01');
INSERT INTO `qm_region` VALUES ('587548', '长治市城区', '587546', '2', '4', '140402', '02');
INSERT INTO `qm_region` VALUES ('587643', '长治市郊区', '587546', '3', '4', '140411', '11');
INSERT INTO `qm_region` VALUES ('587794', '长治县', '587546', '4', '4', '140421', '21');
INSERT INTO `qm_region` VALUES ('588067', '襄垣县', '587546', '5', '4', '140423', '23');
INSERT INTO `qm_region` VALUES ('588410', '屯留县', '587546', '6', '4', '140424', '24');
INSERT INTO `qm_region` VALUES ('588718', '平顺县', '587546', '7', '4', '140425', '25');
INSERT INTO `qm_region` VALUES ('588995', '黎城县', '587546', '8', '4', '140426', '26');
INSERT INTO `qm_region` VALUES ('589259', '壶关县', '587546', '9', '4', '140427', '27');
INSERT INTO `qm_region` VALUES ('589665', '长子县', '587546', '10', '4', '140428', '28');
INSERT INTO `qm_region` VALUES ('590077', '武乡县', '587546', '11', '4', '140429', '29');
INSERT INTO `qm_region` VALUES ('590472', '沁县', '587546', '12', '4', '140430', '30');
INSERT INTO `qm_region` VALUES ('590798', '沁源县', '587546', '13', '4', '140431', '31');
INSERT INTO `qm_region` VALUES ('591073', '潞城市', '587546', '14', '4', '140481', '81');
INSERT INTO `qm_region` VALUES ('591287', '晋城市', '582414', '5', '3', '1405', '05');
INSERT INTO `qm_region` VALUES ('591288', '市辖区', '591287', '1', '4', '140501', '01');
INSERT INTO `qm_region` VALUES ('591289', '晋城市城区', '591287', '2', '4', '140502', '02');
INSERT INTO `qm_region` VALUES ('591444', '沁水县', '591287', '3', '4', '140521', '21');
INSERT INTO `qm_region` VALUES ('591707', '阳城县', '591287', '4', '4', '140522', '22');
INSERT INTO `qm_region` VALUES ('592197', '陵川县', '591287', '5', '4', '140524', '24');
INSERT INTO `qm_region` VALUES ('592588', '泽州县', '591287', '6', '4', '140525', '25');
INSERT INTO `qm_region` VALUES ('593238', '高平市', '591287', '7', '4', '140581', '81');
INSERT INTO `qm_region` VALUES ('593715', '朔州市', '582414', '6', '3', '1406', '06');
INSERT INTO `qm_region` VALUES ('593716', '市辖区', '593715', '1', '4', '140601', '01');
INSERT INTO `qm_region` VALUES ('593717', '朔城区', '593715', '2', '4', '140602', '02');
INSERT INTO `qm_region` VALUES ('594072', '平鲁区', '593715', '3', '4', '140603', '03');
INSERT INTO `qm_region` VALUES ('594446', '山阴县', '593715', '4', '4', '140621', '21');
INSERT INTO `qm_region` VALUES ('594728', '应县', '593715', '5', '4', '140622', '22');
INSERT INTO `qm_region` VALUES ('595048', '右玉县', '593715', '6', '4', '140623', '23');
INSERT INTO `qm_region` VALUES ('595393', '怀仁县', '593715', '7', '4', '140624', '24');
INSERT INTO `qm_region` VALUES ('595591', '晋中市', '582414', '7', '3', '1407', '07');
INSERT INTO `qm_region` VALUES ('595592', '市辖区', '595591', '1', '4', '140701', '01');
INSERT INTO `qm_region` VALUES ('595593', '榆次区', '595591', '2', '4', '140702', '02');
INSERT INTO `qm_region` VALUES ('595964', '榆社县', '595591', '3', '4', '140721', '21');
INSERT INTO `qm_region` VALUES ('596256', '左权县', '595591', '4', '4', '140722', '22');
INSERT INTO `qm_region` VALUES ('596480', '和顺县', '595591', '5', '4', '140723', '23');
INSERT INTO `qm_region` VALUES ('596789', '昔阳县', '595591', '6', '4', '140724', '24');
INSERT INTO `qm_region` VALUES ('597141', '寿阳县', '595591', '7', '4', '140725', '25');
INSERT INTO `qm_region` VALUES ('597368', '太谷县', '595591', '8', '4', '140726', '26');
INSERT INTO `qm_region` VALUES ('597590', '祁县', '595591', '9', '4', '140727', '27');
INSERT INTO `qm_region` VALUES ('597765', '平遥县', '595591', '10', '4', '140728', '28');
INSERT INTO `qm_region` VALUES ('598057', '灵石县', '595591', '11', '4', '140729', '29');
INSERT INTO `qm_region` VALUES ('598375', '介休市', '595591', '12', '4', '140781', '81');
INSERT INTO `qm_region` VALUES ('598639', '运城市', '582414', '8', '3', '1408', '08');
INSERT INTO `qm_region` VALUES ('598640', '市辖区', '598639', '1', '4', '140801', '01');
INSERT INTO `qm_region` VALUES ('598641', '盐湖区', '598639', '2', '4', '140802', '02');
INSERT INTO `qm_region` VALUES ('599017', '临猗县', '598639', '3', '4', '140821', '21');
INSERT INTO `qm_region` VALUES ('599418', '万荣县', '598639', '4', '4', '140822', '22');
INSERT INTO `qm_region` VALUES ('599719', '闻喜县', '598639', '5', '4', '140823', '23');
INSERT INTO `qm_region` VALUES ('600082', '稷山县', '598639', '6', '4', '140824', '24');
INSERT INTO `qm_region` VALUES ('600290', '新绛县', '598639', '7', '4', '140825', '25');
INSERT INTO `qm_region` VALUES ('600525', '绛县', '598639', '8', '4', '140826', '26');
INSERT INTO `qm_region` VALUES ('600742', '垣曲县', '598639', '9', '4', '140827', '27');
INSERT INTO `qm_region` VALUES ('600948', '夏县', '598639', '10', '4', '140828', '28');
INSERT INTO `qm_region` VALUES ('601220', '平陆县', '598639', '11', '4', '140829', '29');
INSERT INTO `qm_region` VALUES ('601459', '芮城县', '598639', '12', '4', '140830', '30');
INSERT INTO `qm_region` VALUES ('601646', '永济市', '598639', '13', '4', '140881', '81');
INSERT INTO `qm_region` VALUES ('601933', '河津市', '598639', '14', '4', '140882', '82');
INSERT INTO `qm_region` VALUES ('602106', '忻州市', '582414', '9', '3', '1409', '09');
INSERT INTO `qm_region` VALUES ('602107', '市辖区', '602106', '1', '4', '140901', '01');
INSERT INTO `qm_region` VALUES ('602108', '忻府区', '602106', '2', '4', '140902', '02');
INSERT INTO `qm_region` VALUES ('602545', '定襄县', '602106', '3', '4', '140921', '21');
INSERT INTO `qm_region` VALUES ('602711', '五台县', '602106', '4', '4', '140922', '22');
INSERT INTO `qm_region` VALUES ('603304', '代县', '602106', '5', '4', '140923', '23');
INSERT INTO `qm_region` VALUES ('603707', '繁峙县', '602106', '6', '4', '140924', '24');
INSERT INTO `qm_region` VALUES ('604125', '宁武县', '602106', '7', '4', '140925', '25');
INSERT INTO `qm_region` VALUES ('604612', '静乐县', '602106', '8', '4', '140926', '26');
INSERT INTO `qm_region` VALUES ('605008', '神池县', '602106', '9', '4', '140927', '27');
INSERT INTO `qm_region` VALUES ('605261', '五寨县', '602106', '10', '4', '140928', '28');
INSERT INTO `qm_region` VALUES ('605524', '岢岚县', '602106', '11', '4', '140929', '29');
INSERT INTO `qm_region` VALUES ('605739', '河曲县', '602106', '12', '4', '140930', '30');
INSERT INTO `qm_region` VALUES ('606094', '保德县', '602106', '13', '4', '140931', '31');
INSERT INTO `qm_region` VALUES ('606457', '偏关县', '602106', '14', '4', '140932', '32');
INSERT INTO `qm_region` VALUES ('606717', '原平市', '602106', '15', '4', '140981', '81');
INSERT INTO `qm_region` VALUES ('607277', '临汾市', '582414', '10', '3', '1410', '10');
INSERT INTO `qm_region` VALUES ('607278', '市辖区', '607277', '1', '4', '141001', '01');
INSERT INTO `qm_region` VALUES ('607279', '尧都区', '607277', '2', '4', '141002', '02');
INSERT INTO `qm_region` VALUES ('607733', '曲沃县', '607277', '3', '4', '141021', '21');
INSERT INTO `qm_region` VALUES ('607906', '翼城县', '607277', '4', '4', '141022', '22');
INSERT INTO `qm_region` VALUES ('608131', '襄汾县', '607277', '5', '4', '141023', '23');
INSERT INTO `qm_region` VALUES ('608499', '洪洞县', '607277', '6', '4', '141024', '24');
INSERT INTO `qm_region` VALUES ('608982', '古县', '607277', '7', '4', '141025', '25');
INSERT INTO `qm_region` VALUES ('609105', '安泽县', '607277', '8', '4', '141026', '26');
INSERT INTO `qm_region` VALUES ('609219', '浮山县', '607277', '9', '4', '141027', '27');
INSERT INTO `qm_region` VALUES ('609416', '吉县', '607277', '10', '4', '141028', '28');
INSERT INTO `qm_region` VALUES ('609505', '乡宁县', '607277', '11', '4', '141029', '29');
INSERT INTO `qm_region` VALUES ('609699', '大宁县', '607277', '12', '4', '141030', '30');
INSERT INTO `qm_region` VALUES ('609790', '隰县', '607277', '13', '4', '141031', '31');
INSERT INTO `qm_region` VALUES ('609899', '永和县', '607277', '14', '4', '141032', '32');
INSERT INTO `qm_region` VALUES ('609988', '蒲县', '607277', '15', '4', '141033', '33');
INSERT INTO `qm_region` VALUES ('610099', '汾西县', '607277', '16', '4', '141034', '34');
INSERT INTO `qm_region` VALUES ('610234', '侯马市', '607277', '17', '4', '141081', '81');
INSERT INTO `qm_region` VALUES ('610350', '霍州市', '607277', '18', '4', '141082', '82');
INSERT INTO `qm_region` VALUES ('610589', '吕梁市', '582414', '11', '3', '1411', '11');
INSERT INTO `qm_region` VALUES ('610590', '市辖区', '610589', '1', '4', '141101', '01');
INSERT INTO `qm_region` VALUES ('610591', '离石区', '610589', '2', '4', '141102', '02');
INSERT INTO `qm_region` VALUES ('610809', '文水县', '610589', '3', '4', '141121', '21');
INSERT INTO `qm_region` VALUES ('611025', '交城县', '610589', '4', '4', '141122', '22');
INSERT INTO `qm_region` VALUES ('611183', '兴县', '610589', '5', '4', '141123', '23');
INSERT INTO `qm_region` VALUES ('611575', '临县', '610589', '6', '4', '141124', '24');
INSERT INTO `qm_region` VALUES ('612241', '柳林县', '610589', '7', '4', '141125', '25');
INSERT INTO `qm_region` VALUES ('612518', '石楼县', '610589', '8', '4', '141126', '26');
INSERT INTO `qm_region` VALUES ('612663', '岚县', '610589', '9', '4', '141127', '27');
INSERT INTO `qm_region` VALUES ('612843', '方山县', '610589', '10', '4', '141128', '28');
INSERT INTO `qm_region` VALUES ('613022', '中阳县', '610589', '11', '4', '141129', '29');
INSERT INTO `qm_region` VALUES ('613130', '交口县', '610589', '12', '4', '141130', '30');
INSERT INTO `qm_region` VALUES ('613229', '孝义市', '610589', '13', '4', '141181', '81');
INSERT INTO `qm_region` VALUES ('613645', '汾阳市', '610589', '14', '4', '141182', '82');
INSERT INTO `qm_region` VALUES ('613964', '陕西省', '1', '27', '2', '61', '61');
INSERT INTO `qm_region` VALUES ('613965', '西安市', '613964', '1', '3', '6101', '01');
INSERT INTO `qm_region` VALUES ('613966', '市辖区', '613965', '1', '4', '610101', '01');
INSERT INTO `qm_region` VALUES ('613967', '新城区', '613965', '2', '4', '610102', '02');
INSERT INTO `qm_region` VALUES ('614080', '碑林区', '613965', '3', '4', '610103', '03');
INSERT INTO `qm_region` VALUES ('614206', '莲湖区', '613965', '4', '4', '610104', '04');
INSERT INTO `qm_region` VALUES ('614358', '灞桥区', '613965', '5', '4', '610111', '11');
INSERT INTO `qm_region` VALUES ('614627', '未央区', '613965', '6', '4', '610112', '12');
INSERT INTO `qm_region` VALUES ('614897', '雁塔区', '613965', '7', '4', '610113', '13');
INSERT INTO `qm_region` VALUES ('615109', '阎良区', '613965', '8', '4', '610114', '14');
INSERT INTO `qm_region` VALUES ('615217', '临潼区', '613965', '9', '4', '610115', '15');
INSERT INTO `qm_region` VALUES ('615547', '长安区', '613965', '10', '4', '610116', '16');
INSERT INTO `qm_region` VALUES ('616267', '蓝田县', '613965', '11', '4', '610122', '22');
INSERT INTO `qm_region` VALUES ('616809', '周至县', '613965', '12', '4', '610124', '24');
INSERT INTO `qm_region` VALUES ('617220', '户县', '613965', '13', '4', '610125', '25');
INSERT INTO `qm_region` VALUES ('617776', '高陵县', '613965', '14', '4', '610126', '26');
INSERT INTO `qm_region` VALUES ('617876', '铜川市', '613964', '2', '3', '6102', '02');
INSERT INTO `qm_region` VALUES ('617877', '市辖区', '617876', '1', '4', '610201', '01');
INSERT INTO `qm_region` VALUES ('617878', '王益区', '617876', '2', '4', '610202', '02');
INSERT INTO `qm_region` VALUES ('617945', '印台区', '617876', '3', '4', '610203', '03');
INSERT INTO `qm_region` VALUES ('618087', '耀州区', '617876', '4', '4', '610204', '04');
INSERT INTO `qm_region` VALUES ('618331', '宜君县', '617876', '5', '4', '610222', '22');
INSERT INTO `qm_region` VALUES ('618522', '宝鸡市', '613964', '3', '3', '6103', '03');
INSERT INTO `qm_region` VALUES ('618523', '市辖区', '618522', '1', '4', '610301', '01');
INSERT INTO `qm_region` VALUES ('618524', '渭滨区', '618522', '2', '4', '610302', '02');
INSERT INTO `qm_region` VALUES ('618696', '金台区', '618522', '3', '4', '610303', '03');
INSERT INTO `qm_region` VALUES ('618866', '陈仓区', '618522', '4', '4', '610304', '04');
INSERT INTO `qm_region` VALUES ('619240', '凤翔县', '618522', '5', '4', '610322', '22');
INSERT INTO `qm_region` VALUES ('619497', '岐山县', '618522', '6', '4', '610323', '23');
INSERT INTO `qm_region` VALUES ('619671', '扶风县', '618522', '7', '4', '610324', '24');
INSERT INTO `qm_region` VALUES ('619873', '眉县', '618522', '8', '4', '610326', '26');
INSERT INTO `qm_region` VALUES ('620018', '陇县', '618522', '9', '4', '610327', '27');
INSERT INTO `qm_region` VALUES ('620195', '千阳县', '618522', '10', '4', '610328', '28');
INSERT INTO `qm_region` VALUES ('620307', '麟游县', '618522', '11', '4', '610329', '29');
INSERT INTO `qm_region` VALUES ('620420', '凤县', '618522', '12', '4', '610330', '30');
INSERT INTO `qm_region` VALUES ('620590', '太白县', '618522', '13', '4', '610331', '31');
INSERT INTO `qm_region` VALUES ('620668', '咸阳市', '613964', '4', '3', '6104', '04');
INSERT INTO `qm_region` VALUES ('620669', '市辖区', '620668', '1', '4', '610401', '01');
INSERT INTO `qm_region` VALUES ('620670', '秦都区', '620668', '2', '4', '610402', '02');
INSERT INTO `qm_region` VALUES ('620877', '杨凌区', '620668', '3', '4', '610403', '03');
INSERT INTO `qm_region` VALUES ('620962', '渭城区', '620668', '4', '4', '610404', '04');
INSERT INTO `qm_region` VALUES ('621140', '三原县', '620668', '5', '4', '610422', '22');
INSERT INTO `qm_region` VALUES ('621371', '泾阳县', '620668', '6', '4', '610423', '23');
INSERT INTO `qm_region` VALUES ('621627', '乾县', '620668', '7', '4', '610424', '24');
INSERT INTO `qm_region` VALUES ('621911', '礼泉县', '620668', '8', '4', '610425', '25');
INSERT INTO `qm_region` VALUES ('622249', '永寿县', '620668', '9', '4', '610426', '26');
INSERT INTO `qm_region` VALUES ('622517', '彬县', '620668', '10', '4', '610427', '27');
INSERT INTO `qm_region` VALUES ('622785', '长武县', '620668', '11', '4', '610428', '28');
INSERT INTO `qm_region` VALUES ('623014', '旬邑县', '620668', '12', '4', '610429', '29');
INSERT INTO `qm_region` VALUES ('623218', '淳化县', '620668', '13', '4', '610430', '30');
INSERT INTO `qm_region` VALUES ('623440', '武功县', '620668', '14', '4', '610431', '31');
INSERT INTO `qm_region` VALUES ('623671', '兴平市', '620668', '15', '4', '610481', '81');
INSERT INTO `qm_region` VALUES ('623918', '渭南市', '613964', '5', '3', '6105', '05');
INSERT INTO `qm_region` VALUES ('623919', '市辖区', '623918', '1', '4', '610501', '01');
INSERT INTO `qm_region` VALUES ('623920', '临渭区', '623918', '2', '4', '610502', '02');
INSERT INTO `qm_region` VALUES ('624513', '华县', '623918', '3', '4', '610521', '21');
INSERT INTO `qm_region` VALUES ('624785', '潼关县', '623918', '4', '4', '610522', '22');
INSERT INTO `qm_region` VALUES ('624886', '大荔县', '623918', '5', '4', '610523', '23');
INSERT INTO `qm_region` VALUES ('625364', '合阳县', '623918', '6', '4', '610524', '24');
INSERT INTO `qm_region` VALUES ('625739', '澄城县', '623918', '7', '4', '610525', '25');
INSERT INTO `qm_region` VALUES ('626029', '蒲城县', '623918', '8', '4', '610526', '26');
INSERT INTO `qm_region` VALUES ('626423', '白水县', '623918', '9', '4', '610527', '27');
INSERT INTO `qm_region` VALUES ('626636', '富平县', '623918', '10', '4', '610528', '28');
INSERT INTO `qm_region` VALUES ('627007', '韩城市', '623918', '11', '4', '610581', '81');
INSERT INTO `qm_region` VALUES ('627323', '华阴市', '623918', '12', '4', '610582', '82');
INSERT INTO `qm_region` VALUES ('627544', '延安市', '613964', '6', '3', '6106', '06');
INSERT INTO `qm_region` VALUES ('627545', '市辖区', '627544', '1', '4', '610601', '01');
INSERT INTO `qm_region` VALUES ('627546', '宝塔区', '627544', '2', '4', '610602', '02');
INSERT INTO `qm_region` VALUES ('628222', '延长县', '627544', '3', '4', '610621', '21');
INSERT INTO `qm_region` VALUES ('628529', '延川县', '627544', '4', '4', '610622', '22');
INSERT INTO `qm_region` VALUES ('628895', '子长县', '627544', '5', '4', '610623', '23');
INSERT INTO `qm_region` VALUES ('629270', '安塞县', '627544', '6', '4', '610624', '24');
INSERT INTO `qm_region` VALUES ('629500', '志丹县', '627544', '7', '4', '610625', '25');
INSERT INTO `qm_region` VALUES ('629715', '吴起县', '627544', '8', '4', '610626', '26');
INSERT INTO `qm_region` VALUES ('629895', '甘泉县', '627544', '9', '4', '610627', '27');
INSERT INTO `qm_region` VALUES ('630024', '富县', '627544', '10', '4', '610628', '28');
INSERT INTO `qm_region` VALUES ('630287', '洛川县', '627544', '11', '4', '610629', '29');
INSERT INTO `qm_region` VALUES ('630680', '宜川县', '627544', '12', '4', '610630', '30');
INSERT INTO `qm_region` VALUES ('630899', '黄龙县', '627544', '13', '4', '610631', '31');
INSERT INTO `qm_region` VALUES ('631000', '黄陵县', '627544', '14', '4', '610632', '32');
INSERT INTO `qm_region` VALUES ('631214', '汉中市', '613964', '7', '3', '6107', '07');
INSERT INTO `qm_region` VALUES ('631215', '市辖区', '631214', '1', '4', '610701', '01');
INSERT INTO `qm_region` VALUES ('631216', '汉台区', '631214', '2', '4', '610702', '02');
INSERT INTO `qm_region` VALUES ('631487', '南郑县', '631214', '3', '4', '610721', '21');
INSERT INTO `qm_region` VALUES ('632033', '城固县', '631214', '4', '4', '610722', '22');
INSERT INTO `qm_region` VALUES ('632468', '洋县', '631214', '5', '4', '610723', '23');
INSERT INTO `qm_region` VALUES ('632868', '西乡县', '631214', '6', '4', '610724', '24');
INSERT INTO `qm_region` VALUES ('633171', '勉县', '631214', '7', '4', '610725', '25');
INSERT INTO `qm_region` VALUES ('633444', '宁强县', '631214', '8', '4', '610726', '26');
INSERT INTO `qm_region` VALUES ('633748', '略阳县', '631214', '9', '4', '610727', '27');
INSERT INTO `qm_region` VALUES ('633970', '镇巴县', '631214', '10', '4', '610728', '28');
INSERT INTO `qm_region` VALUES ('634250', '留坝县', '631214', '11', '4', '610729', '29');
INSERT INTO `qm_region` VALUES ('634359', '佛坪县', '631214', '12', '4', '610730', '30');
INSERT INTO `qm_region` VALUES ('634429', '榆林市', '613964', '8', '3', '6108', '08');
INSERT INTO `qm_region` VALUES ('634430', '市辖区', '634429', '1', '4', '610801', '01');
INSERT INTO `qm_region` VALUES ('634431', '榆阳区', '634429', '2', '4', '610802', '02');
INSERT INTO `qm_region` VALUES ('634994', '神木县', '634429', '3', '4', '610821', '21');
INSERT INTO `qm_region` VALUES ('635688', '府谷县', '634429', '4', '4', '610822', '22');
INSERT INTO `qm_region` VALUES ('636053', '横山县', '634429', '5', '4', '610823', '23');
INSERT INTO `qm_region` VALUES ('636439', '靖边县', '634429', '6', '4', '610824', '24');
INSERT INTO `qm_region` VALUES ('636681', '定边县', '634429', '7', '4', '610825', '25');
INSERT INTO `qm_region` VALUES ('637049', '绥德县', '634429', '8', '4', '610826', '26');
INSERT INTO `qm_region` VALUES ('637745', '米脂县', '634429', '9', '4', '610827', '27');
INSERT INTO `qm_region` VALUES ('638161', '佳县', '634429', '10', '4', '610828', '28');
INSERT INTO `qm_region` VALUES ('638842', '吴堡县', '634429', '11', '4', '610829', '29');
INSERT INTO `qm_region` VALUES ('639077', '清涧县', '634429', '12', '4', '610830', '30');
INSERT INTO `qm_region` VALUES ('639736', '子洲县', '634429', '13', '4', '610831', '31');
INSERT INTO `qm_region` VALUES ('640315', '安康市', '613964', '9', '3', '6109', '09');
INSERT INTO `qm_region` VALUES ('640316', '市辖区', '640315', '1', '4', '610901', '01');
INSERT INTO `qm_region` VALUES ('640317', '汉滨区', '640315', '2', '4', '610902', '02');
INSERT INTO `qm_region` VALUES ('641282', '汉阴县', '640315', '3', '4', '610921', '21');
INSERT INTO `qm_region` VALUES ('641487', '石泉县', '640315', '4', '4', '610922', '22');
INSERT INTO `qm_region` VALUES ('641715', '宁陕县', '640315', '5', '4', '610923', '23');
INSERT INTO `qm_region` VALUES ('641830', '紫阳县', '640315', '6', '4', '610924', '24');
INSERT INTO `qm_region` VALUES ('642088', '岚皋县', '640315', '7', '4', '610925', '25');
INSERT INTO `qm_region` VALUES ('642300', '平利县', '640315', '8', '4', '610926', '26');
INSERT INTO `qm_region` VALUES ('642507', '镇坪县', '640315', '9', '4', '610927', '27');
INSERT INTO `qm_region` VALUES ('642597', '旬阳县', '640315', '10', '4', '610928', '28');
INSERT INTO `qm_region` VALUES ('642945', '白河县', '640315', '11', '4', '610929', '29');
INSERT INTO `qm_region` VALUES ('643090', '商洛市', '613964', '10', '3', '6110', '10');
INSERT INTO `qm_region` VALUES ('643091', '市辖区', '643090', '1', '4', '611001', '01');
INSERT INTO `qm_region` VALUES ('643092', '商州区', '643090', '2', '4', '611002', '02');
INSERT INTO `qm_region` VALUES ('643551', '洛南县', '643090', '3', '4', '611021', '21');
INSERT INTO `qm_region` VALUES ('643960', '丹凤县', '643090', '4', '4', '611022', '22');
INSERT INTO `qm_region` VALUES ('644190', '商南县', '643090', '5', '4', '611023', '23');
INSERT INTO `qm_region` VALUES ('644386', '山阳县', '643090', '6', '4', '611024', '24');
INSERT INTO `qm_region` VALUES ('644743', '镇安县', '643090', '7', '4', '611025', '25');
INSERT INTO `qm_region` VALUES ('644983', '柞水县', '643090', '8', '4', '611026', '26');
INSERT INTO `qm_region` VALUES ('645121', '上海市', '1', '2', '2', '31', '31');
INSERT INTO `qm_region` VALUES ('645122', '市辖区', '645121', '1', '3', '3101', '01');
INSERT INTO `qm_region` VALUES ('645123', '黄浦区', '645122', '1', '4', '310101', '01');
INSERT INTO `qm_region` VALUES ('645254', '卢湾区', '645122', '2', '4', '310103', '03');
INSERT INTO `qm_region` VALUES ('645334', '徐汇区', '645122', '3', '4', '310104', '04');
INSERT INTO `qm_region` VALUES ('645660', '长宁区', '645122', '4', '4', '310105', '05');
INSERT INTO `qm_region` VALUES ('645853', '静安区', '645122', '5', '4', '310106', '06');
INSERT INTO `qm_region` VALUES ('645933', '普陀区', '645122', '6', '4', '310107', '07');
INSERT INTO `qm_region` VALUES ('646172', '闸北区', '645122', '7', '4', '310108', '08');
INSERT INTO `qm_region` VALUES ('646390', '虹口区', '645122', '8', '4', '310109', '09');
INSERT INTO `qm_region` VALUES ('646648', '杨浦区', '645122', '9', '4', '310110', '10');
INSERT INTO `qm_region` VALUES ('646964', '闵行区', '645122', '10', '4', '310112', '12');
INSERT INTO `qm_region` VALUES ('647452', '宝山区', '645122', '11', '4', '310113', '13');
INSERT INTO `qm_region` VALUES ('647835', '嘉定区', '645122', '12', '4', '310114', '14');
INSERT INTO `qm_region` VALUES ('648114', '浦东新区', '645122', '13', '4', '310115', '15');
INSERT INTO `qm_region` VALUES ('648952', '金山区', '645122', '14', '4', '310116', '16');
INSERT INTO `qm_region` VALUES ('649162', '松江区', '645122', '15', '4', '310117', '17');
INSERT INTO `qm_region` VALUES ('649430', '青浦区', '645122', '16', '4', '310118', '18');
INSERT INTO `qm_region` VALUES ('649695', '南汇区', '645122', '17', '4', '310119', '19');
INSERT INTO `qm_region` VALUES ('649970', '奉贤区', '645122', '18', '4', '310120', '20');
INSERT INTO `qm_region` VALUES ('650332', '崇明县', '645122', '1', '4', '310230', '30');
INSERT INTO `qm_region` VALUES ('650698', '四川省', '1', '0', '2', '51', '51');
INSERT INTO `qm_region` VALUES ('650699', '成都市', '650698', '1', '3', '5101', '01');
INSERT INTO `qm_region` VALUES ('650700', '市辖区', '650699', '1', '4', '510101', '01');
INSERT INTO `qm_region` VALUES ('650701', '锦江区', '650699', '2', '4', '510104', '04');
INSERT INTO `qm_region` VALUES ('650777', '青羊区', '650699', '3', '4', '510105', '05');
INSERT INTO `qm_region` VALUES ('650873', '金牛区', '650699', '4', '4', '510106', '06');
INSERT INTO `qm_region` VALUES ('651003', '武侯区', '650699', '5', '4', '510107', '07');
INSERT INTO `qm_region` VALUES ('651151', '成华区', '650699', '6', '4', '510108', '08');
INSERT INTO `qm_region` VALUES ('651266', '龙泉驿区', '650699', '7', '4', '510112', '12');
INSERT INTO `qm_region` VALUES ('651413', '青白江区', '650699', '8', '4', '510113', '13');
INSERT INTO `qm_region` VALUES ('651545', '新都区', '650699', '9', '4', '510114', '14');
INSERT INTO `qm_region` VALUES ('651881', '温江区', '650699', '10', '4', '510115', '15');
INSERT INTO `qm_region` VALUES ('652013', '金堂县', '650699', '11', '4', '510121', '21');
INSERT INTO `qm_region` VALUES ('652265', '双流县', '650699', '12', '4', '510122', '22');
INSERT INTO `qm_region` VALUES ('652560', '郫县', '650699', '13', '4', '510124', '24');
INSERT INTO `qm_region` VALUES ('652794', '大邑县', '650699', '14', '4', '510129', '29');
INSERT INTO `qm_region` VALUES ('653031', '蒲江县', '650699', '15', '4', '510131', '31');
INSERT INTO `qm_region` VALUES ('653176', '新津县', '650699', '16', '4', '510132', '32');
INSERT INTO `qm_region` VALUES ('653295', '都江堰市', '650699', '17', '4', '510181', '81');
INSERT INTO `qm_region` VALUES ('653563', '彭州市', '650699', '18', '4', '510182', '82');
INSERT INTO `qm_region` VALUES ('653947', '邛崃市', '650699', '19', '4', '510183', '83');
INSERT INTO `qm_region` VALUES ('654233', '崇州市', '650699', '20', '4', '510184', '84');
INSERT INTO `qm_region` VALUES ('654512', '自贡市', '650698', '2', '3', '5103', '03');
INSERT INTO `qm_region` VALUES ('654513', '市辖区', '654512', '1', '4', '510301', '01');
INSERT INTO `qm_region` VALUES ('654514', '自流井区', '654512', '2', '4', '510302', '02');
INSERT INTO `qm_region` VALUES ('654640', '贡井区', '654512', '3', '4', '510303', '03');
INSERT INTO `qm_region` VALUES ('654834', '大安区', '654512', '4', '4', '510304', '04');
INSERT INTO `qm_region` VALUES ('655047', '沿滩区', '654512', '5', '4', '510311', '11');
INSERT INTO `qm_region` VALUES ('655245', '荣县', '654512', '6', '4', '510321', '21');
INSERT INTO `qm_region` VALUES ('655787', '富顺县', '654512', '7', '4', '510322', '22');
INSERT INTO `qm_region` VALUES ('656346', '攀枝花市', '650698', '3', '3', '5104', '04');
INSERT INTO `qm_region` VALUES ('656347', '市辖区', '656346', '1', '4', '510401', '01');
INSERT INTO `qm_region` VALUES ('656348', '攀枝花东区', '656346', '2', '4', '510402', '02');
INSERT INTO `qm_region` VALUES ('656429', '西区', '656346', '3', '4', '510403', '03');
INSERT INTO `qm_region` VALUES ('656481', '仁和区', '656346', '4', '4', '510411', '11');
INSERT INTO `qm_region` VALUES ('656595', '米易县', '656346', '5', '4', '510421', '21');
INSERT INTO `qm_region` VALUES ('656708', '盐边县', '656346', '6', '4', '510422', '22');
INSERT INTO `qm_region` VALUES ('656896', '泸州市', '650698', '4', '3', '5105', '05');
INSERT INTO `qm_region` VALUES ('656897', '市辖区', '656896', '1', '4', '510501', '01');
INSERT INTO `qm_region` VALUES ('656898', '江阳区', '656896', '2', '4', '510502', '02');
INSERT INTO `qm_region` VALUES ('657161', '纳溪区', '656896', '3', '4', '510503', '03');
INSERT INTO `qm_region` VALUES ('657437', '龙马潭区', '656896', '4', '4', '510504', '04');
INSERT INTO `qm_region` VALUES ('657542', '泸县', '656896', '5', '4', '510521', '21');
INSERT INTO `qm_region` VALUES ('657855', '合江县', '656896', '6', '4', '510522', '22');
INSERT INTO `qm_region` VALUES ('658420', '叙永县', '656896', '7', '4', '510524', '24');
INSERT INTO `qm_region` VALUES ('658710', '古蔺县', '656896', '8', '4', '510525', '25');
INSERT INTO `qm_region` VALUES ('659022', '德阳市', '650698', '5', '3', '5106', '06');
INSERT INTO `qm_region` VALUES ('659023', '市辖区', '659022', '1', '4', '510601', '01');
INSERT INTO `qm_region` VALUES ('659024', '旌阳区', '659022', '2', '4', '510603', '03');
INSERT INTO `qm_region` VALUES ('659347', '中江县', '659022', '3', '4', '510623', '23');
INSERT INTO `qm_region` VALUES ('660272', '罗江县', '659022', '4', '4', '510626', '26');
INSERT INTO `qm_region` VALUES ('660461', '广汉市', '659022', '5', '4', '510681', '81');
INSERT INTO `qm_region` VALUES ('660784', '什邡市', '659022', '6', '4', '510682', '82');
INSERT INTO `qm_region` VALUES ('661090', '绵竹市', '659022', '7', '4', '510683', '83');
INSERT INTO `qm_region` VALUES ('661421', '绵阳市', '650698', '6', '3', '5107', '07');
INSERT INTO `qm_region` VALUES ('661422', '市辖区', '661421', '1', '4', '510701', '01');
INSERT INTO `qm_region` VALUES ('661423', '涪城区', '661421', '2', '4', '510703', '03');
INSERT INTO `qm_region` VALUES ('661692', '游仙区', '661421', '3', '4', '510704', '04');
INSERT INTO `qm_region` VALUES ('662029', '三台县', '661421', '4', '4', '510722', '22');
INSERT INTO `qm_region` VALUES ('663123', '盐亭县', '661421', '5', '4', '510723', '23');
INSERT INTO `qm_region` VALUES ('663652', '安县', '661421', '6', '4', '510724', '24');
INSERT INTO `qm_region` VALUES ('663970', '梓潼县', '661421', '7', '4', '510725', '25');
INSERT INTO `qm_region` VALUES ('664344', '北川羌族自治县', '661421', '8', '4', '510726', '26');
INSERT INTO `qm_region` VALUES ('664659', '平武县', '661421', '9', '4', '510727', '27');
INSERT INTO `qm_region` VALUES ('664944', '江油市', '661421', '10', '4', '510781', '81');
INSERT INTO `qm_region` VALUES ('665565', '广元市', '650698', '7', '3', '5108', '08');
INSERT INTO `qm_region` VALUES ('665566', '市辖区', '665565', '1', '4', '510801', '01');
INSERT INTO `qm_region` VALUES ('665567', '市中区', '665565', '2', '4', '510802', '02');
INSERT INTO `qm_region` VALUES ('665839', '元坝区', '665565', '3', '4', '510811', '11');
INSERT INTO `qm_region` VALUES ('666089', '朝天区', '665565', '4', '4', '510812', '12');
INSERT INTO `qm_region` VALUES ('666334', '旺苍县', '665565', '5', '4', '510821', '21');
INSERT INTO `qm_region` VALUES ('666755', '青川县', '665565', '6', '4', '510822', '22');
INSERT INTO `qm_region` VALUES ('667079', '剑阁县', '665565', '7', '4', '510823', '23');
INSERT INTO `qm_region` VALUES ('667719', '苍溪县', '665565', '8', '4', '510824', '24');
INSERT INTO `qm_region` VALUES ('668542', '遂宁市', '650698', '8', '3', '5109', '09');
INSERT INTO `qm_region` VALUES ('668543', '市辖区', '668542', '1', '4', '510901', '01');
INSERT INTO `qm_region` VALUES ('668544', '船山区', '668542', '2', '4', '510903', '03');
INSERT INTO `qm_region` VALUES ('668851', '安居区', '668542', '3', '4', '510904', '04');
INSERT INTO `qm_region` VALUES ('669397', '蓬溪县', '668542', '4', '4', '510921', '21');
INSERT INTO `qm_region` VALUES ('669953', '射洪县', '668542', '5', '4', '510922', '22');
INSERT INTO `qm_region` VALUES ('670612', '大英县', '668542', '6', '4', '510923', '23');
INSERT INTO `qm_region` VALUES ('670954', '内江市', '650698', '9', '3', '5110', '10');
INSERT INTO `qm_region` VALUES ('670955', '市辖区', '670954', '1', '4', '511001', '01');
INSERT INTO `qm_region` VALUES ('670956', '市中区', '670954', '2', '4', '511002', '02');
INSERT INTO `qm_region` VALUES ('671201', '东兴区', '670954', '3', '4', '511011', '11');
INSERT INTO `qm_region` VALUES ('671712', '威远县', '670954', '4', '4', '511024', '24');
INSERT INTO `qm_region` VALUES ('672104', '资中县', '670954', '5', '4', '511025', '25');
INSERT INTO `qm_region` VALUES ('672976', '隆昌县', '670954', '6', '4', '511028', '28');
INSERT INTO `qm_region` VALUES ('673404', '乐山市', '650698', '10', '3', '5111', '11');
INSERT INTO `qm_region` VALUES ('673405', '市辖区', '673404', '1', '4', '511101', '01');
INSERT INTO `qm_region` VALUES ('673406', '市中区', '673404', '2', '4', '511102', '02');
INSERT INTO `qm_region` VALUES ('673741', '沙湾区', '673404', '3', '4', '511111', '11');
INSERT INTO `qm_region` VALUES ('673923', '五通桥区', '673404', '4', '4', '511112', '12');
INSERT INTO `qm_region` VALUES ('674108', '金口河区', '673404', '5', '4', '511113', '13');
INSERT INTO `qm_region` VALUES ('674160', '犍为县', '673404', '6', '4', '511123', '23');
INSERT INTO `qm_region` VALUES ('674573', '井研县', '673404', '7', '4', '511124', '24');
INSERT INTO `qm_region` VALUES ('674919', '夹江县', '673404', '8', '4', '511126', '26');
INSERT INTO `qm_region` VALUES ('675197', '沐川县', '673404', '9', '4', '511129', '29');
INSERT INTO `qm_region` VALUES ('675429', '峨边彝族自治县', '673404', '10', '4', '511132', '32');
INSERT INTO `qm_region` VALUES ('675585', '马边彝族自治县', '673404', '11', '4', '511133', '33');
INSERT INTO `qm_region` VALUES ('675814', '峨眉山市', '673404', '12', '4', '511181', '81');
INSERT INTO `qm_region` VALUES ('676108', '南充市', '650698', '11', '3', '5113', '13');
INSERT INTO `qm_region` VALUES ('676109', '市辖区', '676108', '1', '4', '511301', '01');
INSERT INTO `qm_region` VALUES ('676110', '顺庆区', '676108', '2', '4', '511302', '02');
INSERT INTO `qm_region` VALUES ('676437', '高坪区', '676108', '3', '4', '511303', '03');
INSERT INTO `qm_region` VALUES ('676869', '嘉陵区', '676108', '4', '4', '511304', '04');
INSERT INTO `qm_region` VALUES ('677487', '南部县', '676108', '5', '4', '511321', '21');
INSERT INTO `qm_region` VALUES ('678660', '营山县', '676108', '6', '4', '511322', '22');
INSERT INTO `qm_region` VALUES ('679388', '蓬安县', '676108', '7', '4', '511323', '23');
INSERT INTO `qm_region` VALUES ('680051', '仪陇县', '676108', '8', '4', '511324', '24');
INSERT INTO `qm_region` VALUES ('681028', '西充县', '676108', '9', '4', '511325', '25');
INSERT INTO `qm_region` VALUES ('681689', '阆中市', '676108', '10', '4', '511381', '81');
INSERT INTO `qm_region` VALUES ('682226', '眉山市', '650698', '12', '3', '5114', '14');
INSERT INTO `qm_region` VALUES ('682227', '市辖区', '682226', '1', '4', '511401', '01');
INSERT INTO `qm_region` VALUES ('682228', '东坡区', '682226', '2', '4', '511402', '02');
INSERT INTO `qm_region` VALUES ('682796', '仁寿县', '682226', '3', '4', '511421', '21');
INSERT INTO `qm_region` VALUES ('683999', '彭山县', '682226', '4', '4', '511422', '22');
INSERT INTO `qm_region` VALUES ('684217', '洪雅县', '682226', '5', '4', '511423', '23');
INSERT INTO `qm_region` VALUES ('684512', '丹棱县', '682226', '6', '4', '511424', '24');
INSERT INTO `qm_region` VALUES ('684657', '青神县', '682226', '7', '4', '511425', '25');
INSERT INTO `qm_region` VALUES ('684831', '宜宾市', '650698', '13', '3', '5115', '15');
INSERT INTO `qm_region` VALUES ('684832', '市辖区', '684831', '1', '4', '511501', '01');
INSERT INTO `qm_region` VALUES ('684833', '翠屏区', '684831', '2', '4', '511502', '02');
INSERT INTO `qm_region` VALUES ('685200', '宜宾县', '684831', '3', '4', '511521', '21');
INSERT INTO `qm_region` VALUES ('685807', '南溪县', '684831', '4', '4', '511522', '22');
INSERT INTO `qm_region` VALUES ('686057', '江安县', '684831', '5', '4', '511523', '23');
INSERT INTO `qm_region` VALUES ('686399', '长宁县', '684831', '6', '4', '511524', '24');
INSERT INTO `qm_region` VALUES ('686717', '高县', '684831', '7', '4', '511525', '25');
INSERT INTO `qm_region` VALUES ('687050', '珙县', '684831', '8', '4', '511526', '26');
INSERT INTO `qm_region` VALUES ('687346', '筠连县', '684831', '9', '4', '511527', '27');
INSERT INTO `qm_region` VALUES ('687622', '兴文县', '684831', '10', '4', '511528', '28');
INSERT INTO `qm_region` VALUES ('687981', '屏山县', '684831', '11', '4', '511529', '29');
INSERT INTO `qm_region` VALUES ('688272', '广安市', '650698', '14', '3', '5116', '16');
INSERT INTO `qm_region` VALUES ('688273', '市辖区', '688272', '1', '4', '511601', '01');
INSERT INTO `qm_region` VALUES ('688274', '广安区', '688272', '2', '4', '511602', '02');
INSERT INTO `qm_region` VALUES ('689213', '岳池县', '688272', '3', '4', '511621', '21');
INSERT INTO `qm_region` VALUES ('690123', '武胜县', '688272', '4', '4', '511622', '22');
INSERT INTO `qm_region` VALUES ('690697', '邻水县', '688272', '5', '4', '511623', '23');
INSERT INTO `qm_region` VALUES ('691264', '华蓥市', '688272', '6', '4', '511681', '81');
INSERT INTO `qm_region` VALUES ('691410', '达州市', '650698', '15', '3', '5117', '17');
INSERT INTO `qm_region` VALUES ('691411', '市辖区', '691410', '1', '4', '511701', '01');
INSERT INTO `qm_region` VALUES ('691412', '通川区', '691410', '2', '4', '511702', '02');
INSERT INTO `qm_region` VALUES ('691573', '达县', '691410', '3', '4', '511721', '21');
INSERT INTO `qm_region` VALUES ('692498', '宣汉县', '691410', '4', '4', '511722', '22');
INSERT INTO `qm_region` VALUES ('693100', '开江县', '691410', '5', '4', '511723', '23');
INSERT INTO `qm_region` VALUES ('693335', '大竹县', '691410', '6', '4', '511724', '24');
INSERT INTO `qm_region` VALUES ('693809', '渠县', '691410', '7', '4', '511725', '25');
INSERT INTO `qm_region` VALUES ('694416', '万源市', '691410', '8', '4', '511781', '81');
INSERT INTO `qm_region` VALUES ('694865', '雅安市', '650698', '16', '3', '5118', '18');
INSERT INTO `qm_region` VALUES ('694866', '市辖区', '694865', '1', '4', '511801', '01');
INSERT INTO `qm_region` VALUES ('694867', '雨城区', '694865', '2', '4', '511802', '02');
INSERT INTO `qm_region` VALUES ('695098', '名山县', '694865', '3', '4', '511821', '21');
INSERT INTO `qm_region` VALUES ('695321', '荥经县', '694865', '4', '4', '511822', '22');
INSERT INTO `qm_region` VALUES ('695452', '汉源县', '694865', '5', '4', '511823', '23');
INSERT INTO `qm_region` VALUES ('695754', '石棉县', '694865', '6', '4', '511824', '24');
INSERT INTO `qm_region` VALUES ('695875', '天全县', '694865', '7', '4', '511825', '25');
INSERT INTO `qm_region` VALUES ('696035', '芦山县', '694865', '8', '4', '511826', '26');
INSERT INTO `qm_region` VALUES ('696091', '宝兴县', '694865', '9', '4', '511827', '27');
INSERT INTO `qm_region` VALUES ('696157', '巴中市', '650698', '17', '3', '5119', '19');
INSERT INTO `qm_region` VALUES ('696158', '市辖区', '696157', '1', '4', '511901', '01');
INSERT INTO `qm_region` VALUES ('696159', '巴州区', '696157', '2', '4', '511902', '02');
INSERT INTO `qm_region` VALUES ('697101', '通江县', '696157', '3', '4', '511921', '21');
INSERT INTO `qm_region` VALUES ('697712', '南江县', '696157', '4', '4', '511922', '22');
INSERT INTO `qm_region` VALUES ('698369', '平昌县', '696157', '5', '4', '511923', '23');
INSERT INTO `qm_region` VALUES ('698940', '资阳市', '650698', '18', '3', '5120', '20');
INSERT INTO `qm_region` VALUES ('698941', '市辖区', '698940', '1', '4', '512001', '01');
INSERT INTO `qm_region` VALUES ('698942', '雁江区', '698940', '2', '4', '512002', '02');
INSERT INTO `qm_region` VALUES ('699494', '安岳县', '698940', '3', '4', '512021', '21');
INSERT INTO `qm_region` VALUES ('700575', '乐至县', '698940', '4', '4', '512022', '22');
INSERT INTO `qm_region` VALUES ('701223', '简阳市', '698940', '5', '4', '512081', '81');
INSERT INTO `qm_region` VALUES ('702109', '阿坝州', '650698', '19', '3', '5132', '32');
INSERT INTO `qm_region` VALUES ('702110', '汶川县', '702109', '1', '4', '513221', '21');
INSERT INTO `qm_region` VALUES ('702248', '理县', '702109', '2', '4', '513222', '22');
INSERT INTO `qm_region` VALUES ('702348', '茂县', '702109', '3', '4', '513223', '23');
INSERT INTO `qm_region` VALUES ('702523', '松潘县', '702109', '4', '4', '513224', '24');
INSERT INTO `qm_region` VALUES ('702699', '九寨沟县', '702109', '5', '4', '513225', '25');
INSERT INTO `qm_region` VALUES ('702849', '金川县', '702109', '6', '4', '513226', '26');
INSERT INTO `qm_region` VALUES ('702982', '小金县', '702109', '7', '4', '513227', '27');
INSERT INTO `qm_region` VALUES ('703140', '黑水县', '702109', '8', '4', '513228', '28');
INSERT INTO `qm_region` VALUES ('703284', '马尔康县', '702109', '9', '4', '513229', '29');
INSERT INTO `qm_region` VALUES ('703408', '壤塘县', '702109', '10', '4', '513230', '30');
INSERT INTO `qm_region` VALUES ('703482', '阿坝县', '702109', '11', '4', '513231', '31');
INSERT INTO `qm_region` VALUES ('703592', '若尔盖县', '702109', '12', '4', '513232', '32');
INSERT INTO `qm_region` VALUES ('703714', '红原县', '702109', '13', '4', '513233', '33');
INSERT INTO `qm_region` VALUES ('703762', '甘孜藏族自治州', '650698', '20', '3', '5133', '33');
INSERT INTO `qm_region` VALUES ('703763', '康定县', '703762', '1', '4', '513321', '21');
INSERT INTO `qm_region` VALUES ('704029', '泸定县', '703762', '2', '4', '513322', '22');
INSERT INTO `qm_region` VALUES ('704104', '丹巴县', '703762', '3', '4', '513323', '23');
INSERT INTO `qm_region` VALUES ('704302', '九龙县', '703762', '4', '4', '513324', '24');
INSERT INTO `qm_region` VALUES ('704450', '雅江县', '703762', '5', '4', '513325', '25');
INSERT INTO `qm_region` VALUES ('704582', '道孚县', '703762', '6', '4', '513326', '26');
INSERT INTO `qm_region` VALUES ('704765', '炉霍县', '703762', '7', '4', '513327', '27');
INSERT INTO `qm_region` VALUES ('704864', '甘孜县', '703762', '8', '4', '513328', '28');
INSERT INTO `qm_region` VALUES ('705107', '新龙县', '703762', '9', '4', '513329', '29');
INSERT INTO `qm_region` VALUES ('705223', '德格县', '703762', '10', '4', '513330', '30');
INSERT INTO `qm_region` VALUES ('705424', '白玉县', '703762', '11', '4', '513331', '31');
INSERT INTO `qm_region` VALUES ('705598', '石渠县', '703762', '12', '4', '513332', '32');
INSERT INTO `qm_region` VALUES ('705788', '色达县', '703762', '13', '4', '513333', '33');
INSERT INTO `qm_region` VALUES ('705873', '理塘县', '703762', '14', '4', '513334', '34');
INSERT INTO `qm_region` VALUES ('706113', '巴塘县', '703762', '15', '4', '513335', '35');
INSERT INTO `qm_region` VALUES ('706256', '乡城县', '703762', '16', '4', '513336', '36');
INSERT INTO `qm_region` VALUES ('706323', '稻城县', '703762', '17', '4', '513337', '37');
INSERT INTO `qm_region` VALUES ('706461', '得荣县', '703762', '18', '4', '513338', '38');
INSERT INTO `qm_region` VALUES ('706605', '凉山州', '650698', '21', '3', '5134', '34');
INSERT INTO `qm_region` VALUES ('706606', '西昌市', '706605', '1', '4', '513401', '01');
INSERT INTO `qm_region` VALUES ('706906', '木里藏族自治县', '706605', '2', '4', '513422', '22');
INSERT INTO `qm_region` VALUES ('707049', '盐源县', '706605', '3', '4', '513423', '23');
INSERT INTO `qm_region` VALUES ('707331', '德昌', '706605', '4', '4', '513424', '24');
INSERT INTO `qm_region` VALUES ('707497', '会理县', '706605', '5', '4', '513425', '25');
INSERT INTO `qm_region` VALUES ('707861', '会东县', '706605', '6', '4', '513426', '26');
INSERT INTO `qm_region` VALUES ('708239', '宁南县', '706605', '7', '4', '513427', '27');
INSERT INTO `qm_region` VALUES ('708392', '普格县', '706605', '8', '4', '513428', '28');
INSERT INTO `qm_region` VALUES ('708585', '布拖县', '706605', '9', '4', '513429', '29');
INSERT INTO `qm_region` VALUES ('708807', '金阳县', '706605', '10', '4', '513430', '30');
INSERT INTO `qm_region` VALUES ('709020', '昭觉县', '706605', '11', '4', '513431', '31');
INSERT INTO `qm_region` VALUES ('709340', '喜德县', '706605', '12', '4', '513432', '32');
INSERT INTO `qm_region` VALUES ('709537', '冕宁县', '706605', '13', '4', '513433', '33');
INSERT INTO `qm_region` VALUES ('709808', '越西县', '706605', '14', '4', '513434', '34');
INSERT INTO `qm_region` VALUES ('710143', '甘洛县', '706605', '15', '4', '513435', '35');
INSERT INTO `qm_region` VALUES ('710400', '美姑县', '706605', '16', '4', '513436', '36');
INSERT INTO `qm_region` VALUES ('710730', '雷波县', '706605', '17', '4', '513437', '37');
INSERT INTO `qm_region` VALUES ('711069', '天津市', '1', '3', '2', '12', '12');
INSERT INTO `qm_region` VALUES ('711070', '市辖区', '711069', '1', '3', '1201', '01');
INSERT INTO `qm_region` VALUES ('711071', '和平区', '711070', '1', '4', '120101', '01');
INSERT INTO `qm_region` VALUES ('711143', '河东区', '711070', '2', '4', '120102', '02');
INSERT INTO `qm_region` VALUES ('711301', '河西区', '711070', '3', '4', '120103', '03');
INSERT INTO `qm_region` VALUES ('711551', '南开区', '711070', '4', '4', '120104', '04');
INSERT INTO `qm_region` VALUES ('711820', '河北区', '711070', '5', '4', '120105', '05');
INSERT INTO `qm_region` VALUES ('711929', '红桥区', '711070', '6', '4', '120106', '06');
INSERT INTO `qm_region` VALUES ('712109', '塘沽区', '711070', '7', '4', '120107', '07');
INSERT INTO `qm_region` VALUES ('712258', '汉沽区', '711070', '8', '4', '120108', '08');
INSERT INTO `qm_region` VALUES ('712371', '大港区', '711070', '9', '4', '120109', '09');
INSERT INTO `qm_region` VALUES ('712538', '东丽区', '711070', '10', '4', '120110', '10');
INSERT INTO `qm_region` VALUES ('712719', '西青区', '711070', '11', '4', '120111', '11');
INSERT INTO `qm_region` VALUES ('712948', '津南区', '711070', '12', '4', '120112', '12');
INSERT INTO `qm_region` VALUES ('713171', '北辰区', '711070', '13', '4', '120113', '13');
INSERT INTO `qm_region` VALUES ('713409', '武清区', '711070', '14', '4', '120114', '14');
INSERT INTO `qm_region` VALUES ('714206', '宝坻区', '711070', '15', '4', '120115', '15');
INSERT INTO `qm_region` VALUES ('715035', '宁河县', '711070', '1', '4', '120221', '21');
INSERT INTO `qm_region` VALUES ('715361', '静海县', '711070', '2', '4', '120223', '23');
INSERT INTO `qm_region` VALUES ('715805', '蓟县', '711070', '3', '4', '120225', '25');
INSERT INTO `qm_region` VALUES ('716798', '西藏', '1', '28', '2', '54', '54');
INSERT INTO `qm_region` VALUES ('716799', '拉萨市', '716798', '1', '3', '5401', '01');
INSERT INTO `qm_region` VALUES ('716800', '城关区', '716799', '1', '4', '540102', '02');
INSERT INTO `qm_region` VALUES ('716852', '林周县', '716799', '2', '4', '540121', '21');
INSERT INTO `qm_region` VALUES ('716912', '当雄县', '716799', '3', '4', '540122', '22');
INSERT INTO `qm_region` VALUES ('716950', '尼木县', '716799', '4', '4', '540123', '23');
INSERT INTO `qm_region` VALUES ('716994', '曲水县', '716799', '5', '4', '540124', '24');
INSERT INTO `qm_region` VALUES ('717018', '堆龙德庆', '716799', '6', '4', '540125', '25');
INSERT INTO `qm_region` VALUES ('717061', '达孜县', '716799', '7', '4', '540126', '26');
INSERT INTO `qm_region` VALUES ('717089', '墨竹工卡县', '716799', '8', '4', '540127', '27');
INSERT INTO `qm_region` VALUES ('717141', '昌都地区', '716798', '2', '3', '5421', '21');
INSERT INTO `qm_region` VALUES ('717142', '昌都县', '717141', '1', '4', '542121', '21');
INSERT INTO `qm_region` VALUES ('717375', '江达县', '717141', '2', '4', '542122', '22');
INSERT INTO `qm_region` VALUES ('717483', '贡觉县', '717141', '3', '4', '542123', '23');
INSERT INTO `qm_region` VALUES ('717653', '类乌齐县', '717141', '4', '4', '542124', '24');
INSERT INTO `qm_region` VALUES ('717769', '丁青县', '717141', '5', '4', '542125', '25');
INSERT INTO `qm_region` VALUES ('717848', '察亚县', '717141', '6', '4', '542126', '26');
INSERT INTO `qm_region` VALUES ('718015', '八宿县', '717141', '7', '4', '542127', '27');
INSERT INTO `qm_region` VALUES ('718156', '左贡县', '717141', '8', '4', '542128', '28');
INSERT INTO `qm_region` VALUES ('718328', '芒康县', '717141', '9', '4', '542129', '29');
INSERT INTO `qm_region` VALUES ('718405', '洛隆县', '717141', '10', '4', '542132', '32');
INSERT INTO `qm_region` VALUES ('718493', '边坝县', '717141', '11', '4', '542133', '33');
INSERT INTO `qm_region` VALUES ('718610', '山南地区', '716798', '3', '3', '5422', '22');
INSERT INTO `qm_region` VALUES ('718611', '乃东县', '718610', '1', '4', '542221', '21');
INSERT INTO `qm_region` VALUES ('718669', '扎囊县', '718610', '2', '4', '542222', '22');
INSERT INTO `qm_region` VALUES ('718740', '贡嘎县', '718610', '3', '4', '542223', '23');
INSERT INTO `qm_region` VALUES ('718792', '桑日县', '718610', '4', '4', '542224', '24');
INSERT INTO `qm_region` VALUES ('718841', '琼结县', '718610', '5', '4', '542225', '25');
INSERT INTO `qm_region` VALUES ('718867', '曲松县', '718610', '6', '4', '542226', '26');
INSERT INTO `qm_region` VALUES ('718894', '措美县', '718610', '7', '4', '542227', '27');
INSERT INTO `qm_region` VALUES ('718915', '洛扎县', '718610', '8', '4', '542228', '28');
INSERT INTO `qm_region` VALUES ('718949', '加查县', '718610', '9', '4', '542229', '29');
INSERT INTO `qm_region` VALUES ('719045', '隆子县', '718610', '10', '4', '542231', '31');
INSERT INTO `qm_region` VALUES ('719143', '错那县', '718610', '11', '4', '542232', '32');
INSERT INTO `qm_region` VALUES ('719179', '浪卡子县', '718610', '12', '4', '542233', '33');
INSERT INTO `qm_region` VALUES ('719300', '日喀则地区', '716798', '4', '3', '5423', '23');
INSERT INTO `qm_region` VALUES ('719301', '日喀则市', '719300', '1', '4', '542301', '01');
INSERT INTO `qm_region` VALUES ('719494', '南木林县', '719300', '2', '4', '542322', '22');
INSERT INTO `qm_region` VALUES ('719664', '江孜县', '719300', '3', '4', '542323', '23');
INSERT INTO `qm_region` VALUES ('719843', '定日县', '719300', '4', '4', '542324', '24');
INSERT INTO `qm_region` VALUES ('720039', '萨迦县', '719300', '5', '4', '542325', '25');
INSERT INTO `qm_region` VALUES ('720181', '拉孜县', '719300', '6', '4', '542326', '26');
INSERT INTO `qm_region` VALUES ('720298', '昂仁县', '719300', '7', '4', '542327', '27');
INSERT INTO `qm_region` VALUES ('720507', '谢通门县', '719300', '8', '4', '542328', '28');
INSERT INTO `qm_region` VALUES ('720626', '白朗县', '719300', '9', '4', '542329', '29');
INSERT INTO `qm_region` VALUES ('720752', '仁布县', '719300', '10', '4', '542330', '30');
INSERT INTO `qm_region` VALUES ('720841', '康马县', '719300', '11', '4', '542331', '31');
INSERT INTO `qm_region` VALUES ('720899', '定结县', '719300', '12', '4', '542332', '32');
INSERT INTO `qm_region` VALUES ('720991', '仲巴县', '719300', '13', '4', '542333', '33');
INSERT INTO `qm_region` VALUES ('721064', '亚东县', '719300', '14', '4', '542334', '34');
INSERT INTO `qm_region` VALUES ('721097', '吉隆县', '719300', '15', '4', '542335', '35');
INSERT INTO `qm_region` VALUES ('721146', '聂拉木县', '719300', '16', '4', '542336', '36');
INSERT INTO `qm_region` VALUES ('721199', '萨嘎县', '719300', '17', '4', '542337', '37');
INSERT INTO `qm_region` VALUES ('721246', '岗巴县', '719300', '18', '4', '542338', '38');
INSERT INTO `qm_region` VALUES ('721282', '那曲地区', '716798', '5', '3', '5424', '24');
INSERT INTO `qm_region` VALUES ('721283', '那曲县', '721282', '1', '4', '542421', '21');
INSERT INTO `qm_region` VALUES ('721452', '嘉黎县', '721282', '2', '4', '542422', '22');
INSERT INTO `qm_region` VALUES ('721585', '比如县', '721282', '3', '4', '542423', '23');
INSERT INTO `qm_region` VALUES ('721792', '聂荣县', '721282', '4', '4', '542424', '24');
INSERT INTO `qm_region` VALUES ('721961', '安多县', '721282', '5', '4', '542425', '25');
INSERT INTO `qm_region` VALUES ('722054', '申扎县', '721282', '6', '4', '542426', '26');
INSERT INTO `qm_region` VALUES ('722136', '索县', '721282', '7', '4', '542427', '27');
INSERT INTO `qm_region` VALUES ('722279', '班戈县', '721282', '8', '4', '542428', '28');
INSERT INTO `qm_region` VALUES ('722385', '巴青县', '721282', '9', '4', '542429', '29');
INSERT INTO `qm_region` VALUES ('722558', '尼玛县', '721282', '10', '4', '542430', '30');
INSERT INTO `qm_region` VALUES ('722694', '阿里地区', '716798', '6', '3', '5425', '25');
INSERT INTO `qm_region` VALUES ('722695', '普兰县', '722694', '1', '4', '542521', '21');
INSERT INTO `qm_region` VALUES ('722709', '札达县', '722694', '2', '4', '542522', '22');
INSERT INTO `qm_region` VALUES ('722731', '噶尔县', '722694', '3', '4', '542523', '23');
INSERT INTO `qm_region` VALUES ('722751', '日土县', '722694', '4', '4', '542524', '24');
INSERT INTO `qm_region` VALUES ('722771', '革吉县', '722694', '5', '4', '542525', '25');
INSERT INTO `qm_region` VALUES ('722797', '改则县', '722694', '6', '4', '542526', '26');
INSERT INTO `qm_region` VALUES ('722855', '措勤县', '722694', '7', '4', '542527', '27');
INSERT INTO `qm_region` VALUES ('722882', '林芝地区', '716798', '7', '3', '5426', '26');
INSERT INTO `qm_region` VALUES ('722883', '林芝县', '722882', '1', '4', '542621', '21');
INSERT INTO `qm_region` VALUES ('722967', '工布江达县', '722882', '2', '4', '542622', '22');
INSERT INTO `qm_region` VALUES ('723066', '米林县', '722882', '3', '4', '542623', '23');
INSERT INTO `qm_region` VALUES ('723146', '墨脱县', '722882', '4', '4', '542624', '24');
INSERT INTO `qm_region` VALUES ('723205', '波密县', '722882', '5', '4', '542625', '25');
INSERT INTO `qm_region` VALUES ('723306', '察隅县', '722882', '6', '4', '542626', '26');
INSERT INTO `qm_region` VALUES ('723409', '朗县', '722882', '7', '4', '542627', '27');
INSERT INTO `qm_region` VALUES ('723476', '新疆', '1', '29', '2', '65', '65');
INSERT INTO `qm_region` VALUES ('723477', '乌鲁木齐市', '723476', '1', '3', '6501', '01');
INSERT INTO `qm_region` VALUES ('723478', '市辖区', '723477', '1', '4', '650101', '01');
INSERT INTO `qm_region` VALUES ('723479', '天山区', '723477', '2', '4', '650102', '02');
INSERT INTO `qm_region` VALUES ('723625', '沙依巴克区', '723477', '3', '4', '650103', '03');
INSERT INTO `qm_region` VALUES ('723785', '新市区', '723477', '4', '4', '650104', '04');
INSERT INTO `qm_region` VALUES ('723909', '水磨沟区', '723477', '5', '4', '650105', '05');
INSERT INTO `qm_region` VALUES ('723985', '头屯河区', '723477', '6', '4', '650106', '06');
INSERT INTO `qm_region` VALUES ('724077', '达坂城区', '723477', '7', '4', '650107', '07');
INSERT INTO `qm_region` VALUES ('724118', '东山区', '723477', '8', '4', '650108', '08');
INSERT INTO `qm_region` VALUES ('724151', '乌鲁木齐县', '723477', '9', '4', '650121', '21');
INSERT INTO `qm_region` VALUES ('724220', '克拉玛依市', '723476', '2', '3', '6502', '02');
INSERT INTO `qm_region` VALUES ('724221', '市辖区', '724220', '1', '4', '650201', '01');
INSERT INTO `qm_region` VALUES ('724222', '独山子区', '724220', '2', '4', '650202', '02');
INSERT INTO `qm_region` VALUES ('724241', '克拉玛依区', '724220', '3', '4', '650203', '03');
INSERT INTO `qm_region` VALUES ('724346', '白碱滩区', '724220', '4', '4', '650204', '04');
INSERT INTO `qm_region` VALUES ('724367', '乌尔禾区', '724220', '5', '4', '650205', '05');
INSERT INTO `qm_region` VALUES ('724388', '吐鲁番地区', '723476', '3', '3', '6521', '21');
INSERT INTO `qm_region` VALUES ('724389', '吐鲁番市', '724388', '1', '4', '652101', '01');
INSERT INTO `qm_region` VALUES ('724492', '鄯善县', '724388', '2', '4', '652122', '22');
INSERT INTO `qm_region` VALUES ('724589', '托克逊县', '724388', '3', '4', '652123', '23');
INSERT INTO `qm_region` VALUES ('724652', '哈密地区', '723476', '4', '3', '6522', '22');
INSERT INTO `qm_region` VALUES ('724653', '哈密市', '724652', '1', '4', '652201', '01');
INSERT INTO `qm_region` VALUES ('724893', '巴里坤县', '724652', '2', '4', '652222', '22');
INSERT INTO `qm_region` VALUES ('724983', '伊吾县', '724652', '3', '4', '652223', '23');
INSERT INTO `qm_region` VALUES ('725030', '昌吉州', '723476', '5', '3', '6523', '23');
INSERT INTO `qm_region` VALUES ('725031', '昌吉市', '725030', '1', '4', '652301', '01');
INSERT INTO `qm_region` VALUES ('725217', '阜康市', '725030', '2', '4', '652302', '02');
INSERT INTO `qm_region` VALUES ('725387', '米泉市', '725030', '3', '4', '652303', '03');
INSERT INTO `qm_region` VALUES ('725496', '呼图壁县', '725030', '4', '4', '652323', '23');
INSERT INTO `qm_region` VALUES ('725695', '玛纳斯', '725030', '5', '4', '652324', '24');
INSERT INTO `qm_region` VALUES ('726058', '奇台县', '725030', '6', '4', '652325', '25');
INSERT INTO `qm_region` VALUES ('726248', '吉木萨尔县', '725030', '7', '4', '652327', '27');
INSERT INTO `qm_region` VALUES ('726472', '木垒县', '725030', '8', '4', '652328', '28');
INSERT INTO `qm_region` VALUES ('726556', '博尔塔拉蒙古自治州', '723476', '6', '3', '6527', '27');
INSERT INTO `qm_region` VALUES ('726557', '博乐市', '726556', '1', '4', '652701', '01');
INSERT INTO `qm_region` VALUES ('726834', '精河县', '726556', '2', '4', '652722', '22');
INSERT INTO `qm_region` VALUES ('726977', '温泉县', '726556', '3', '4', '652723', '23');
INSERT INTO `qm_region` VALUES ('727104', '巴音郭楞蒙古自治州', '723476', '7', '3', '6528', '28');
INSERT INTO `qm_region` VALUES ('727105', '库尔勒市', '727104', '1', '4', '652801', '01');
INSERT INTO `qm_region` VALUES ('727355', '轮台县', '727104', '2', '4', '652822', '22');
INSERT INTO `qm_region` VALUES ('727442', '尉犁县', '727104', '3', '4', '652823', '23');
INSERT INTO `qm_region` VALUES ('727581', '若羌县', '727104', '4', '4', '652824', '24');
INSERT INTO `qm_region` VALUES ('727625', '且末县', '727104', '5', '4', '652825', '25');
INSERT INTO `qm_region` VALUES ('727704', '焉耆县', '727104', '6', '4', '652826', '26');
INSERT INTO `qm_region` VALUES ('727797', '和静县', '727104', '7', '4', '652827', '27');
INSERT INTO `qm_region` VALUES ('727957', '和硕县', '727104', '8', '4', '652828', '28');
INSERT INTO `qm_region` VALUES ('728018', '博湖县', '727104', '9', '4', '652829', '29');
INSERT INTO `qm_region` VALUES ('728067', '阿克苏地区', '723476', '8', '3', '6529', '29');
INSERT INTO `qm_region` VALUES ('728068', '阿克苏市', '728067', '1', '4', '652901', '01');
INSERT INTO `qm_region` VALUES ('728352', '温宿县', '728067', '2', '4', '652922', '22');
INSERT INTO `qm_region` VALUES ('728544', '库车县', '728067', '3', '4', '652923', '23');
INSERT INTO `qm_region` VALUES ('728837', '沙雅县', '728067', '4', '4', '652924', '24');
INSERT INTO `qm_region` VALUES ('729023', '新和县', '728067', '5', '4', '652925', '25');
INSERT INTO `qm_region` VALUES ('729169', '拜城县', '728067', '6', '4', '652926', '26');
INSERT INTO `qm_region` VALUES ('729371', '乌什县', '728067', '7', '4', '652927', '27');
INSERT INTO `qm_region` VALUES ('729508', '阿瓦提县', '728067', '8', '4', '652928', '28');
INSERT INTO `qm_region` VALUES ('729713', '柯坪县', '728067', '9', '4', '652929', '29');
INSERT INTO `qm_region` VALUES ('729754', '克州', '723476', '9', '3', '6530', '30');
INSERT INTO `qm_region` VALUES ('729755', '阿图什市', '729754', '1', '4', '653001', '01');
INSERT INTO `qm_region` VALUES ('729883', '阿克陶县', '729754', '2', '4', '653022', '22');
INSERT INTO `qm_region` VALUES ('730031', '阿合奇县', '729754', '3', '4', '653023', '23');
INSERT INTO `qm_region` VALUES ('730068', '乌恰县', '729754', '4', '4', '653024', '24');
INSERT INTO `qm_region` VALUES ('730130', '喀什地区', '723476', '10', '3', '6531', '31');
INSERT INTO `qm_region` VALUES ('730131', '喀什市', '730130', '1', '4', '653101', '01');
INSERT INTO `qm_region` VALUES ('730300', '疏附县', '730130', '2', '4', '653121', '21');
INSERT INTO `qm_region` VALUES ('730499', '疏勒县', '730130', '3', '4', '653122', '22');
INSERT INTO `qm_region` VALUES ('730762', '英吉沙县', '730130', '4', '4', '653123', '23');
INSERT INTO `qm_region` VALUES ('730955', '泽普县', '730130', '5', '4', '653124', '24');
INSERT INTO `qm_region` VALUES ('731129', '莎车县', '730130', '6', '4', '653125', '25');
INSERT INTO `qm_region` VALUES ('731690', '叶城县', '730130', '7', '4', '653126', '26');
INSERT INTO `qm_region` VALUES ('732037', '麦盖提县', '730130', '8', '4', '653127', '27');
INSERT INTO `qm_region` VALUES ('732233', '岳普湖县', '730130', '9', '4', '653128', '28');
INSERT INTO `qm_region` VALUES ('732348', '伽师县', '730130', '10', '4', '653129', '29');
INSERT INTO `qm_region` VALUES ('732684', '巴楚县', '730130', '11', '4', '653130', '30');
INSERT INTO `qm_region` VALUES ('732926', '塔什库尔干县', '730130', '12', '4', '653131', '31');
INSERT INTO `qm_region` VALUES ('732988', '和田地区', '723476', '11', '3', '6532', '32');
INSERT INTO `qm_region` VALUES ('732989', '和田市', '732988', '1', '4', '653201', '01');
INSERT INTO `qm_region` VALUES ('733143', '和田县', '732988', '2', '4', '653221', '21');
INSERT INTO `qm_region` VALUES ('733367', '墨玉县', '732988', '3', '4', '653222', '22');
INSERT INTO `qm_region` VALUES ('733779', '皮山县', '732988', '4', '4', '653223', '23');
INSERT INTO `qm_region` VALUES ('733987', '洛浦县', '732988', '5', '4', '653224', '24');
INSERT INTO `qm_region` VALUES ('734214', '策勒县', '732988', '6', '4', '653225', '25');
INSERT INTO `qm_region` VALUES ('734362', '于田县', '732988', '7', '4', '653226', '26');
INSERT INTO `qm_region` VALUES ('734559', '民丰县', '732988', '8', '4', '653227', '27');
INSERT INTO `qm_region` VALUES ('734603', '伊犁州', '723476', '12', '3', '6540', '40');
INSERT INTO `qm_region` VALUES ('734604', '伊宁市', '734603', '1', '4', '654002', '02');
INSERT INTO `qm_region` VALUES ('734753', '奎屯市', '734603', '2', '4', '654003', '03');
INSERT INTO `qm_region` VALUES ('734822', '伊宁县', '734603', '3', '4', '654021', '21');
INSERT INTO `qm_region` VALUES ('735010', '察布查尔县', '734603', '4', '4', '654022', '22');
INSERT INTO `qm_region` VALUES ('735153', '霍城县', '734603', '5', '4', '654023', '23');
INSERT INTO `qm_region` VALUES ('735377', '巩留县', '734603', '6', '4', '654024', '24');
INSERT INTO `qm_region` VALUES ('735496', '新源县', '734603', '7', '4', '654025', '25');
INSERT INTO `qm_region` VALUES ('735646', '昭苏县', '734603', '8', '4', '654026', '26');
INSERT INTO `qm_region` VALUES ('735793', '特克斯县', '734603', '9', '4', '654027', '27');
INSERT INTO `qm_region` VALUES ('735877', '尼勒克县', '734603', '10', '4', '654028', '28');
INSERT INTO `qm_region` VALUES ('735987', '塔城地区', '723476', '13', '3', '6542', '42');
INSERT INTO `qm_region` VALUES ('735988', '塔城市', '735987', '1', '4', '654201', '01');
INSERT INTO `qm_region` VALUES ('736205', '乌苏市', '735987', '2', '4', '654202', '02');
INSERT INTO `qm_region` VALUES ('736589', '额敏县', '735987', '3', '4', '654221', '21');
INSERT INTO `qm_region` VALUES ('736855', '沙湾县', '735987', '4', '4', '654223', '23');
INSERT INTO `qm_region` VALUES ('737377', '托里县', '735987', '5', '4', '654224', '24');
INSERT INTO `qm_region` VALUES ('737473', '裕民县', '735987', '6', '4', '654225', '25');
INSERT INTO `qm_region` VALUES ('737554', '和布克赛尔蒙古自治县', '735987', '7', '4', '654226', '26');
INSERT INTO `qm_region` VALUES ('737663', '阿勒泰地区', '723476', '14', '3', '6543', '43');
INSERT INTO `qm_region` VALUES ('737664', '阿勒泰市', '737663', '1', '4', '654301', '01');
INSERT INTO `qm_region` VALUES ('737830', '布尔津县', '737663', '2', '4', '654321', '21');
INSERT INTO `qm_region` VALUES ('737907', '富蕴县', '737663', '3', '4', '654322', '22');
INSERT INTO `qm_region` VALUES ('738000', '福海县', '737663', '4', '4', '654323', '23');
INSERT INTO `qm_region` VALUES ('738171', '哈巴河县', '737663', '5', '4', '654324', '24');
INSERT INTO `qm_region` VALUES ('738315', '青河县', '737663', '6', '4', '654325', '25');
INSERT INTO `qm_region` VALUES ('738382', '吉木乃县', '737663', '7', '4', '654326', '26');
INSERT INTO `qm_region` VALUES ('738443', '省直辖行政单位', '723476', '15', '3', '6590', '90');
INSERT INTO `qm_region` VALUES ('738444', '石河子市', '738443', '1', '4', '659001', '01');
INSERT INTO `qm_region` VALUES ('738609', '阿拉尔市', '738443', '2', '4', '659002', '02');
INSERT INTO `qm_region` VALUES ('738828', '图木舒克市', '738443', '3', '4', '659003', '03');
INSERT INTO `qm_region` VALUES ('738962', '五家渠市', '738443', '4', '4', '659004', '04');
INSERT INTO `qm_region` VALUES ('739032', '云南省', '1', '30', '2', '53', '53');
INSERT INTO `qm_region` VALUES ('739033', '昆明市', '739032', '1', '3', '5301', '01');
INSERT INTO `qm_region` VALUES ('739034', '市辖区', '739033', '1', '4', '530101', '01');
INSERT INTO `qm_region` VALUES ('739035', '五华区', '739033', '2', '4', '530102', '02');
INSERT INTO `qm_region` VALUES ('739151', '盘龙区', '739033', '3', '4', '530103', '03');
INSERT INTO `qm_region` VALUES ('739225', '官渡区', '739033', '4', '4', '530111', '11');
INSERT INTO `qm_region` VALUES ('739334', '西山区', '739033', '5', '4', '530112', '12');
INSERT INTO `qm_region` VALUES ('739440', '东川区', '739033', '6', '4', '530113', '13');
INSERT INTO `qm_region` VALUES ('739608', '呈贡县', '739033', '7', '4', '530121', '21');
INSERT INTO `qm_region` VALUES ('739681', '晋宁县', '739033', '8', '4', '530122', '22');
INSERT INTO `qm_region` VALUES ('739824', '富民县', '739033', '9', '4', '530124', '24');
INSERT INTO `qm_region` VALUES ('739907', '宜良县', '739033', '10', '4', '530125', '25');
INSERT INTO `qm_region` VALUES ('740054', '石林县', '739033', '11', '4', '530126', '26');
INSERT INTO `qm_region` VALUES ('740155', '嵩明县', '739033', '12', '4', '530127', '27');
INSERT INTO `qm_region` VALUES ('740272', '禄劝县', '739033', '13', '4', '530128', '28');
INSERT INTO `qm_region` VALUES ('740483', '寻甸县', '739033', '14', '4', '530129', '29');
INSERT INTO `qm_region` VALUES ('740673', '安宁市', '739033', '15', '4', '530181', '81');
INSERT INTO `qm_region` VALUES ('740775', '曲靖市', '739032', '2', '3', '5303', '03');
INSERT INTO `qm_region` VALUES ('740776', '市辖区', '740775', '1', '4', '530301', '01');
INSERT INTO `qm_region` VALUES ('740777', '麒麟区', '740775', '2', '4', '530302', '02');
INSERT INTO `qm_region` VALUES ('740908', '马龙县', '740775', '3', '4', '530321', '21');
INSERT INTO `qm_region` VALUES ('740983', '陆良县', '740775', '4', '4', '530322', '22');
INSERT INTO `qm_region` VALUES ('741134', '师宗县', '740775', '5', '4', '530323', '23');
INSERT INTO `qm_region` VALUES ('741252', '罗平县', '740775', '6', '4', '530324', '24');
INSERT INTO `qm_region` VALUES ('741420', '富源县', '740775', '7', '4', '530325', '25');
INSERT INTO `qm_region` VALUES ('741591', '会泽县', '740775', '8', '4', '530326', '26');
INSERT INTO `qm_region` VALUES ('741989', '沾益县', '740775', '9', '4', '530328', '28');
INSERT INTO `qm_region` VALUES ('742120', '宣威市', '740775', '10', '4', '530381', '81');
INSERT INTO `qm_region` VALUES ('742502', '玉溪市', '739032', '3', '3', '5304', '04');
INSERT INTO `qm_region` VALUES ('742503', '市辖区', '742502', '1', '4', '530401', '01');
INSERT INTO `qm_region` VALUES ('742504', '红塔区', '742502', '2', '4', '530402', '02');
INSERT INTO `qm_region` VALUES ('742597', '江川县', '742502', '3', '4', '530421', '21');
INSERT INTO `qm_region` VALUES ('742677', '澄江县', '742502', '4', '4', '530422', '22');
INSERT INTO `qm_region` VALUES ('742724', '通海县', '742502', '5', '4', '530423', '23');
INSERT INTO `qm_region` VALUES ('742805', '华宁县', '742502', '6', '4', '530424', '24');
INSERT INTO `qm_region` VALUES ('742889', '易门县', '742502', '7', '4', '530425', '25');
INSERT INTO `qm_region` VALUES ('742953', '峨山县', '742502', '8', '4', '530426', '26');
INSERT INTO `qm_region` VALUES ('743040', '新平县', '742502', '9', '4', '530427', '27');
INSERT INTO `qm_region` VALUES ('743175', '元江县', '742502', '10', '4', '530428', '28');
INSERT INTO `qm_region` VALUES ('743265', '保山市', '739032', '4', '3', '5305', '05');
INSERT INTO `qm_region` VALUES ('743266', '市辖区', '743265', '1', '4', '530501', '01');
INSERT INTO `qm_region` VALUES ('743267', '隆阳区', '743265', '2', '4', '530502', '02');
INSERT INTO `qm_region` VALUES ('743600', '施甸县', '743265', '3', '4', '530521', '21');
INSERT INTO `qm_region` VALUES ('743751', '腾冲县', '743265', '4', '4', '530522', '22');
INSERT INTO `qm_region` VALUES ('743991', '龙陵县', '743265', '5', '4', '530523', '23');
INSERT INTO `qm_region` VALUES ('744123', '昌宁县', '743265', '6', '4', '530524', '24');
INSERT INTO `qm_region` VALUES ('744263', '昭通市', '739032', '5', '3', '5306', '06');
INSERT INTO `qm_region` VALUES ('744264', '市辖区', '744263', '1', '4', '530601', '01');
INSERT INTO `qm_region` VALUES ('744265', '昭阳区', '744263', '2', '4', '530602', '02');
INSERT INTO `qm_region` VALUES ('744464', '鲁甸县', '744263', '3', '4', '530621', '21');
INSERT INTO `qm_region` VALUES ('744561', '巧家县', '744263', '4', '4', '530622', '22');
INSERT INTO `qm_region` VALUES ('744761', '盐津县', '744263', '5', '4', '530623', '23');
INSERT INTO `qm_region` VALUES ('744858', '大关县', '744263', '6', '4', '530624', '24');
INSERT INTO `qm_region` VALUES ('744946', '永善县', '744263', '7', '4', '530625', '25');
INSERT INTO `qm_region` VALUES ('745099', '绥江县', '744263', '8', '4', '530626', '26');
INSERT INTO `qm_region` VALUES ('745140', '镇雄县', '744263', '9', '4', '530627', '27');
INSERT INTO `qm_region` VALUES ('745413', '彝良县', '744263', '10', '4', '530628', '28');
INSERT INTO `qm_region` VALUES ('745566', '威信县', '744263', '11', '4', '530629', '29');
INSERT INTO `qm_region` VALUES ('745664', '水富县', '744263', '12', '4', '530630', '30');
INSERT INTO `qm_region` VALUES ('745693', '丽江市', '739032', '6', '3', '5307', '07');
INSERT INTO `qm_region` VALUES ('745694', '市辖区', '745693', '1', '4', '530701', '01');
INSERT INTO `qm_region` VALUES ('745695', '古城区', '745693', '2', '4', '530702', '02');
INSERT INTO `qm_region` VALUES ('745758', '玉龙县', '745693', '3', '4', '530721', '21');
INSERT INTO `qm_region` VALUES ('745875', '永胜县', '745693', '4', '4', '530722', '22');
INSERT INTO `qm_region` VALUES ('746038', '华坪县', '745693', '5', '4', '530723', '23');
INSERT INTO `qm_region` VALUES ('746107', '宁蒗县', '745693', '6', '4', '530724', '24');
INSERT INTO `qm_region` VALUES ('746214', '思茅市', '739032', '7', '3', '5308', '08');
INSERT INTO `qm_region` VALUES ('746215', '市辖区', '746214', '1', '4', '530801', '01');
INSERT INTO `qm_region` VALUES ('746216', '翠云区', '746214', '2', '4', '530802', '02');
INSERT INTO `qm_region` VALUES ('746296', '普洱县', '746214', '3', '4', '530821', '21');
INSERT INTO `qm_region` VALUES ('746395', '墨江县', '746214', '4', '4', '530822', '22');
INSERT INTO `qm_region` VALUES ('746579', '景东县', '746214', '5', '4', '530823', '23');
INSERT INTO `qm_region` VALUES ('746763', '景谷县', '746214', '6', '4', '530824', '24');
INSERT INTO `qm_region` VALUES ('746909', '镇沅县', '746214', '7', '4', '530825', '25');
INSERT INTO `qm_region` VALUES ('747030', '江城县', '746214', '8', '4', '530826', '26');
INSERT INTO `qm_region` VALUES ('747097', '孟连县', '746214', '9', '4', '530827', '27');
INSERT INTO `qm_region` VALUES ('747148', '澜沧县', '746214', '10', '4', '530828', '28');
INSERT INTO `qm_region` VALUES ('747330', '西盟县', '746214', '11', '4', '530829', '29');
INSERT INTO `qm_region` VALUES ('747377', '临沧市', '739032', '8', '3', '5309', '09');
INSERT INTO `qm_region` VALUES ('747378', '市辖区', '747377', '1', '4', '530901', '01');
INSERT INTO `qm_region` VALUES ('747379', '临翔区', '747377', '2', '4', '530902', '02');
INSERT INTO `qm_region` VALUES ('747492', '凤庆县', '747377', '3', '4', '530921', '21');
INSERT INTO `qm_region` VALUES ('747693', '云县', '747377', '4', '4', '530922', '22');
INSERT INTO `qm_region` VALUES ('747900', '永德县', '747377', '5', '4', '530923', '23');
INSERT INTO `qm_region` VALUES ('748032', '镇康县', '747377', '6', '4', '530924', '24');
INSERT INTO `qm_region` VALUES ('748113', '双江县', '747377', '7', '4', '530925', '25');
INSERT INTO `qm_region` VALUES ('748201', '耿马县', '747377', '8', '4', '530926', '26');
INSERT INTO `qm_region` VALUES ('748307', '沧源县', '747377', '9', '4', '530927', '27');
INSERT INTO `qm_region` VALUES ('748416', '楚雄州', '739032', '9', '3', '5323', '23');
INSERT INTO `qm_region` VALUES ('748417', '楚雄市', '748416', '1', '4', '532301', '01');
INSERT INTO `qm_region` VALUES ('748585', '双柏县', '748416', '2', '4', '532322', '22');
INSERT INTO `qm_region` VALUES ('748678', '牟定县', '748416', '3', '4', '532323', '23');
INSERT INTO `qm_region` VALUES ('748775', '南华县', '748416', '4', '4', '532324', '24');
INSERT INTO `qm_region` VALUES ('748914', '姚安县', '748416', '5', '4', '532325', '25');
INSERT INTO `qm_region` VALUES ('749002', '大姚县', '748416', '6', '4', '532326', '26');
INSERT INTO `qm_region` VALUES ('749144', '永仁县', '748416', '7', '4', '532327', '27');
INSERT INTO `qm_region` VALUES ('749215', '元谋县', '748416', '8', '4', '532328', '28');
INSERT INTO `qm_region` VALUES ('749304', '武定县', '748416', '9', '4', '532329', '29');
INSERT INTO `qm_region` VALUES ('749446', '禄丰县', '748416', '10', '4', '532331', '31');
INSERT INTO `qm_region` VALUES ('749624', '红河州', '739032', '10', '3', '5325', '25');
INSERT INTO `qm_region` VALUES ('749625', '个旧市', '749624', '1', '4', '532501', '01');
INSERT INTO `qm_region` VALUES ('749750', '开远市', '749624', '2', '4', '532502', '02');
INSERT INTO `qm_region` VALUES ('749832', '蒙自县', '749624', '3', '4', '532522', '22');
INSERT INTO `qm_region` VALUES ('749944', '屏边县', '749624', '4', '4', '532523', '23');
INSERT INTO `qm_region` VALUES ('750032', '建水县', '749624', '5', '4', '532524', '24');
INSERT INTO `qm_region` VALUES ('750199', '石屏县', '749624', '6', '4', '532525', '25');
INSERT INTO `qm_region` VALUES ('750324', '弥勒县', '749624', '7', '4', '532526', '26');
INSERT INTO `qm_region` VALUES ('750478', '泸西县', '749624', '8', '4', '532527', '27');
INSERT INTO `qm_region` VALUES ('750568', '元阳县', '749624', '9', '4', '532528', '28');
INSERT INTO `qm_region` VALUES ('750720', '红河县', '749624', '10', '4', '532529', '29');
INSERT INTO `qm_region` VALUES ('750825', '金平县', '749624', '11', '4', '532530', '30');
INSERT INTO `qm_region` VALUES ('750937', '绿春县', '749624', '12', '4', '532531', '31');
INSERT INTO `qm_region` VALUES ('751030', '河口县', '749624', '13', '4', '532532', '32');
INSERT INTO `qm_region` VALUES ('751071', '文山州', '739032', '11', '3', '5326', '26');
INSERT INTO `qm_region` VALUES ('751072', '文山县', '751071', '1', '4', '532621', '21');
INSERT INTO `qm_region` VALUES ('751225', '砚山县', '751071', '2', '4', '532622', '22');
INSERT INTO `qm_region` VALUES ('751342', '西畴县', '751071', '3', '4', '532623', '23');
INSERT INTO `qm_region` VALUES ('751424', '麻栗坡县', '751071', '4', '4', '532624', '24');
INSERT INTO `qm_region` VALUES ('751534', '马关县', '751071', '5', '4', '532625', '25');
INSERT INTO `qm_region` VALUES ('751674', '丘北县', '751071', '6', '4', '532626', '26');
INSERT INTO `qm_region` VALUES ('751786', '广南县', '751071', '7', '4', '532627', '27');
INSERT INTO `qm_region` VALUES ('751981', '富宁县', '751071', '8', '4', '532628', '28');
INSERT INTO `qm_region` VALUES ('752142', '西双版纳州', '739032', '12', '3', '5328', '28');
INSERT INTO `qm_region` VALUES ('752143', '景洪市', '752142', '1', '4', '532801', '01');
INSERT INTO `qm_region` VALUES ('752280', '勐海县', '752142', '2', '4', '532822', '22');
INSERT INTO `qm_region` VALUES ('752386', '勐腊县', '752142', '3', '4', '532823', '23');
INSERT INTO `qm_region` VALUES ('752477', '大理州', '739032', '13', '3', '5329', '29');
INSERT INTO `qm_region` VALUES ('752478', '大理市', '752477', '1', '4', '532901', '01');
INSERT INTO `qm_region` VALUES ('752620', '漾濞县', '752477', '2', '4', '532922', '22');
INSERT INTO `qm_region` VALUES ('752696', '祥云县', '752477', '3', '4', '532923', '23');
INSERT INTO `qm_region` VALUES ('752843', '宾川县', '752477', '4', '4', '532924', '24');
INSERT INTO `qm_region` VALUES ('752945', '弥渡县', '752477', '5', '4', '532925', '25');
INSERT INTO `qm_region` VALUES ('753043', '南涧县', '752477', '6', '4', '532926', '26');
INSERT INTO `qm_region` VALUES ('753132', '巍山县', '752477', '7', '4', '532927', '27');
INSERT INTO `qm_region` VALUES ('753226', '永平县', '752477', '8', '4', '532928', '28');
INSERT INTO `qm_region` VALUES ('753307', '云龙县', '752477', '9', '4', '532929', '29');
INSERT INTO `qm_region` VALUES ('753405', '洱源县', '752477', '10', '4', '532930', '30');
INSERT INTO `qm_region` VALUES ('753505', '剑川县', '752477', '11', '4', '532931', '31');
INSERT INTO `qm_region` VALUES ('753609', '鹤庆县', '752477', '12', '4', '532932', '32');
INSERT INTO `qm_region` VALUES ('753733', '德宏州', '739032', '14', '3', '5331', '31');
INSERT INTO `qm_region` VALUES ('753734', '瑞丽市', '753733', '1', '4', '533102', '02');
INSERT INTO `qm_region` VALUES ('753789', '潞西市', '753733', '2', '4', '533103', '03');
INSERT INTO `qm_region` VALUES ('753889', '梁河县', '753733', '3', '4', '533122', '22');
INSERT INTO `qm_region` VALUES ('753965', '盈江县', '753733', '4', '4', '533123', '23');
INSERT INTO `qm_region` VALUES ('754081', '陇川县', '753733', '5', '4', '533124', '24');
INSERT INTO `qm_region` VALUES ('754163', '怒江州', '739032', '15', '3', '5333', '33');
INSERT INTO `qm_region` VALUES ('754164', '泸水县', '754163', '1', '4', '533321', '21');
INSERT INTO `qm_region` VALUES ('754249', '福贡县', '754163', '2', '4', '533323', '23');
INSERT INTO `qm_region` VALUES ('754315', '贡山县', '754163', '3', '4', '533324', '24');
INSERT INTO `qm_region` VALUES ('754349', '兰坪县', '754163', '4', '4', '533325', '25');
INSERT INTO `qm_region` VALUES ('754465', '迪庆州', '739032', '16', '3', '5334', '34');
INSERT INTO `qm_region` VALUES ('754466', '香格里拉县', '754465', '1', '4', '533421', '21');
INSERT INTO `qm_region` VALUES ('754541', '德钦县', '754465', '2', '4', '533422', '22');
INSERT INTO `qm_region` VALUES ('754592', '维西县', '754465', '3', '4', '533423', '23');
INSERT INTO `qm_region` VALUES ('754685', '重庆市', '1', '4', '2', '50', '50');
INSERT INTO `qm_region` VALUES ('754686', '市辖区', '754685', '1', '3', '5001', '01');
INSERT INTO `qm_region` VALUES ('754687', '万州区', '754686', '1', '4', '500101', '01');
INSERT INTO `qm_region` VALUES ('755371', '涪陵区', '754686', '2', '4', '500102', '02');
INSERT INTO `qm_region` VALUES ('755834', '渝中区', '754686', '3', '4', '500103', '03');
INSERT INTO `qm_region` VALUES ('755956', '大渡口区', '754686', '4', '4', '500104', '04');
INSERT INTO `qm_region` VALUES ('756038', '江北区', '754686', '5', '4', '500105', '05');
INSERT INTO `qm_region` VALUES ('756173', '沙坪坝区', '754686', '6', '4', '500106', '06');
INSERT INTO `qm_region` VALUES ('756401', '九龙坡区', '754686', '7', '4', '500107', '07');
INSERT INTO `qm_region` VALUES ('756614', '南岸区', '754686', '8', '4', '500108', '08');
INSERT INTO `qm_region` VALUES ('756770', '北碚区', '754686', '9', '4', '500109', '09');
INSERT INTO `qm_region` VALUES ('756966', '万盛区', '754686', '10', '4', '500110', '10');
INSERT INTO `qm_region` VALUES ('757061', '双桥区', '754686', '11', '4', '500111', '11');
INSERT INTO `qm_region` VALUES ('757087', '渝北区', '754686', '12', '4', '500112', '12');
INSERT INTO `qm_region` VALUES ('757448', '巴南区', '754686', '13', '4', '500113', '13');
INSERT INTO `qm_region` VALUES ('757752', '黔江区', '754686', '14', '4', '500114', '14');
INSERT INTO `qm_region` VALUES ('758005', '长寿区', '754686', '15', '4', '500115', '15');
INSERT INTO `qm_region` VALUES ('758271', '江津区', '754686', '16', '4', '500116', '16');
INSERT INTO `qm_region` VALUES ('758565', '合川区', '754686', '17', '4', '500117', '17');
INSERT INTO `qm_region` VALUES ('759167', '永川区', '754686', '18', '4', '500118', '18');
INSERT INTO `qm_region` VALUES ('759445', '南川区', '754686', '19', '4', '500119', '19');
INSERT INTO `qm_region` VALUES ('759737', '綦江县', '754686', '1', '4', '500222', '22');
INSERT INTO `qm_region` VALUES ('760118', '潼南县', '754686', '2', '4', '500223', '23');
INSERT INTO `qm_region` VALUES ('760445', '铜梁县', '754686', '3', '4', '500224', '24');
INSERT INTO `qm_region` VALUES ('761090', '大足县', '754686', '4', '4', '500225', '25');
INSERT INTO `qm_region` VALUES ('761407', '荣昌县', '754686', '5', '4', '500226', '26');
INSERT INTO `qm_region` VALUES ('761678', '璧山县', '754686', '6', '4', '500227', '27');
INSERT INTO `qm_region` VALUES ('761877', '梁平县', '754686', '7', '4', '500228', '28');
INSERT INTO `qm_region` VALUES ('762253', '城口县', '754686', '8', '4', '500229', '29');
INSERT INTO `qm_region` VALUES ('762481', '丰都县', '754686', '9', '4', '500230', '30');
INSERT INTO `qm_region` VALUES ('762867', '垫江县', '754686', '10', '4', '500231', '31');
INSERT INTO `qm_region` VALUES ('763196', '武隆县', '754686', '11', '4', '500232', '32');
INSERT INTO `qm_region` VALUES ('763436', '忠县', '754686', '12', '4', '500233', '33');
INSERT INTO `qm_region` VALUES ('763828', '开县', '754686', '13', '4', '500234', '34');
INSERT INTO `qm_region` VALUES ('764375', '云阳县', '754686', '14', '4', '500235', '35');
INSERT INTO `qm_region` VALUES ('765053', '奉节县', '754686', '15', '4', '500236', '36');
INSERT INTO `qm_region` VALUES ('765470', '巫山县', '754686', '16', '4', '500237', '37');
INSERT INTO `qm_region` VALUES ('765842', '巫溪县', '754686', '17', '4', '500238', '38');
INSERT INTO `qm_region` VALUES ('766248', '石柱县', '754686', '18', '4', '500240', '40');
INSERT INTO `qm_region` VALUES ('766522', '秀山土家族苗族自治县', '754686', '19', '4', '500241', '41');
INSERT INTO `qm_region` VALUES ('766818', '酉阳土家族苗族自治县', '754686', '20', '4', '500242', '42');
INSERT INTO `qm_region` VALUES ('767136', '彭水苗族土家族自治县', '754686', '21', '4', '500243', '43');

-- ----------------------------
-- Table structure for `qm_rsms`
-- ----------------------------
DROP TABLE IF EXISTS `qm_rsms`;
CREATE TABLE `qm_rsms` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(50) NOT NULL DEFAULT '',
  `x1` varchar(50) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  `ip` varchar(50) DEFAULT '',
  `audit` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_rsms
-- ----------------------------
INSERT INTO `qm_rsms` VALUES ('1', '13881879952', '328322', '1468682632', '110.184.39.64', '1');
INSERT INTO `qm_rsms` VALUES ('2', '13881879952', '065062', '1473694600', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('3', '13881879952', '771285', '1473694602', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('4', '13881879952', '940134', '1473694603', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('5', '13881879952', '611104', '1473694603', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('6', '13881879952', '466842', '1473694604', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('7', '13881879952', '093039', '1473694604', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('8', '13881879952', '266584', '1473694605', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('9', '13881879952', '595145', '1473694605', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('10', '13881879952', '555755', '1473694606', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('11', '13881879952', '701708', '1473694606', '218.89.92.209', '1');
INSERT INTO `qm_rsms` VALUES ('12', '15882253438', '336670', '1473833223', '171.212.195.20', '1');
INSERT INTO `qm_rsms` VALUES ('13', '15882253438', '021680', '1473833224', '171.212.195.20', '1');
INSERT INTO `qm_rsms` VALUES ('14', '15882253438', '477600', '1473833225', '171.212.195.20', '1');
INSERT INTO `qm_rsms` VALUES ('15', '15882253438', '282553', '1473833225', '171.212.195.20', '1');
INSERT INTO `qm_rsms` VALUES ('16', '13594333241', '529767', '1477019727', '171.212.195.175', '1');
INSERT INTO `qm_rsms` VALUES ('17', '13594333241', '449813', '1480164508', '118.116.90.171', '1');
INSERT INTO `qm_rsms` VALUES ('18', '13881879952', '735065', '1480168960', '110.184.33.86', '1');
INSERT INTO `qm_rsms` VALUES ('19', '13881879952', '332708', '1480168962', '110.184.33.86', '1');
INSERT INTO `qm_rsms` VALUES ('20', '13594333241', '120385', '1480294485', '171.213.5.50', '1');
INSERT INTO `qm_rsms` VALUES ('21', '13594333241', '331096', '1480294496', '171.213.5.50', '1');
INSERT INTO `qm_rsms` VALUES ('22', '13594333241', '809123', '1480307503', '171.213.5.50', '0');
INSERT INTO `qm_rsms` VALUES ('23', '13881879952', '196110', '1480315304', '110.184.4.234', '1');
INSERT INTO `qm_rsms` VALUES ('24', '13881879952', '903023', '1480315305', '110.184.4.234', '0');
INSERT INTO `qm_rsms` VALUES ('25', '13594333241', '894376', '1480493394', '171.88.9.100', '1');
INSERT INTO `qm_rsms` VALUES ('26', '13594333241', '989836', '1480493818', '171.88.9.100', '0');
INSERT INTO `qm_rsms` VALUES ('27', '13594333241', '088331', '1480494012', '171.88.9.100', '1');
INSERT INTO `qm_rsms` VALUES ('28', '13541391404', '618765', '1480495832', '118.113.41.116', '1');
INSERT INTO `qm_rsms` VALUES ('29', '13541391404', '057345', '1480495833', '118.113.41.116', '1');
INSERT INTO `qm_rsms` VALUES ('30', '13541391404', '833687', '1480496501', '118.113.41.116', '1');
INSERT INTO `qm_rsms` VALUES ('31', '13541391404', '998650', '1480496503', '118.113.41.116', '1');
INSERT INTO `qm_rsms` VALUES ('32', '13594333241', '074026', '1480497348', '171.88.9.100', '1');
INSERT INTO `qm_rsms` VALUES ('33', '13594333241', '612299', '1480497354', '171.88.9.100', '1');
INSERT INTO `qm_rsms` VALUES ('34', '13881879952', '776028', '1481089122', '182.150.133.202', '1');

-- ----------------------------
-- Table structure for `qm_time`
-- ----------------------------
DROP TABLE IF EXISTS `qm_time`;
CREATE TABLE `qm_time` (
  `id` bigint(11) NOT NULL DEFAULT '0' COMMENT '网站最后一次更新时间 主要用于判断是否启用缓存',
  `ints` varchar(200) DEFAULT '0',
  `s2` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_time
-- ----------------------------
INSERT INTO `qm_time` VALUES ('1417007193', '', '');

-- ----------------------------
-- Table structure for `qm_user`
-- ----------------------------
DROP TABLE IF EXISTS `qm_user`;
CREATE TABLE `qm_user` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `class` int(2) DEFAULT '1',
  `phone` varchar(255) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `photo` varchar(250) DEFAULT '',
  `password` varchar(250) DEFAULT '',
  `time` varchar(11) DEFAULT NULL,
  `state` smallint(1) DEFAULT '1',
  `truename` varchar(250) DEFAULT '',
  `nc` varchar(255) DEFAULT '' COMMENT '昵称',
  `address` varchar(250) DEFAULT '',
  `birthday` varchar(50) DEFAULT '',
  `now_address` varchar(100) DEFAULT '' COMMENT '现居地',
  `shopname` varchar(255) DEFAULT '',
  `sh_name` varchar(255) DEFAULT '',
  `sh_tel` varchar(255) DEFAULT '',
  `third_num` varchar(50) DEFAULT '' COMMENT '第三方id',
  `third_name` varchar(50) DEFAULT '' COMMENT '第三方昵称',
  `openid` varchar(100) DEFAULT '' COMMENT '第三方唯一标识opendid',
  `subscribe` smallint(6) DEFAULT '0' COMMENT '是否关注',
  `wx_photo` varchar(200) DEFAULT '' COMMENT '微信头像',
  `unsubscribe_time` bigint(11) DEFAULT '0',
  `sex` varchar(10) DEFAULT '' COMMENT '性别',
  `ip` varchar(255) DEFAULT '',
  `jf` int(6) DEFAULT '0' COMMENT '会员积分',
  `del` smallint(1) DEFAULT '0',
  `tel` varchar(255) DEFAULT '',
  `tcode` varchar(255) DEFAULT '' COMMENT '推荐码',
  `education` varchar(255) DEFAULT '' COMMENT '学历',
  `piclist` varchar(555) DEFAULT '',
  `job` varchar(255) DEFAULT '',
  `xingz` varchar(255) DEFAULT '',
  `height` varchar(255) DEFAULT '',
  `weight` varchar(255) DEFAULT '',
  `about` varchar(2255) DEFAULT '' COMMENT '个人介绍',
  `loves` varchar(255) DEFAULT '' COMMENT '爱好',
  `cookrnd` varchar(100) DEFAULT '' COMMENT 'cookie随机码 当会员登录启用cookie随机生成',
  `logintime` bigint(11) DEFAULT '0' COMMENT '最后登录时间',
  `zhifubao` varchar(100) DEFAULT '' COMMENT '支付宝',
  `wxh` varchar(100) DEFAULT '' COMMENT '微信号',
  `wrnd` varchar(100) DEFAULT '' COMMENT '微信第三方登录cookie',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_user
-- ----------------------------
INSERT INTO `qm_user` VALUES ('15', '王娟123', '1', '', '', null, '9f08702b7cd2d5310cd5cdc6e4fcba3e', '1473760352', '1', '', null, '', '', '', '', '', '', '', '', '', '0', null, '0', '', '171.217.176.170', '0', '0', '13540244354', '', '', '', '', '', '', '', '', '', '', '1499589490', '', '', null);
INSERT INTO `qm_user` VALUES ('18', 'yangjun1018', '1', '', '', '/user/1406/u_1406.jpg', 'dbf3748994e66335e74e260a5e0bbd77', '1474468090', '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '117.136.84.207', '0', '0', '13759599651', '', '', '', '', '', '', '', '', '', '', '0', '', '', '');
INSERT INTO `qm_user` VALUES ('19', 'wanyongqiong', '1', '', '', '', 'abdd8ab4d084a330df9cee9ca5dea7da', '1476025221', '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '110.184.35.46', '0', '0', '13541391404', '', '', '', '', '', '', '', '', '', '', '0', '', '', '');
INSERT INTO `qm_user` VALUES ('28', '', '1', '', 'scgoldagri@126.com', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELqsQQOoHXXSGhpmnicD2s4C82CYjD0VgEAcgF87e1NhrhsqfGm0Cr00fGLyibmJtCiaRKu6fnMQY1UA/0', '71c5d1a8627eb48413ae4e95f58de900', '1480314883', '1', '张中林', 'ANDY', '四川省,成都市,成华区', '', '双城二路39号', '', '', '', '3', '张中林', 'okD3uv_FutkFvVF_DNVIEA3pd2UQ', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELqsQQOoHXXSGhpmnicD2s4C82CYjD0VgEAcgF87e1NhrhsqfGm0Cr00fGLyibmJtCiaRKu6fnMQY1UA/0', '0', '男', '110.184.4.234', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1498231070', null, null, null);
INSERT INTO `qm_user` VALUES ('29', 'wlcmgg', '1', '', '', '', '87581144a714214bafcceb5931192646', '1480493231', '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '171.88.9.100', '0', '0', '13594333241', '', '', '', '', '', '', '', '', '', '', '0', '', '', '');
INSERT INTO `qm_user` VALUES ('30', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6VqBumg3cbG0icgEsgwUPlHdaK5tJzgVGNRVcyuVAJiccdgUWibHAZM0gFnoEGWXKmY5jMeFJnPO4xu/0', '683bae22eb4080fc2e02d8585f72da75', '1480734987', '1', '', 'WiFi管家', '', '', '', '', '', '', '3', 'WiFi管家', 'okD3uvzYjcrylCzDEuMMxTW9yb3o', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6VqBumg3cbG0icgEsgwUPlHdaK5tJzgVGNRVcyuVAJiccdgUWibHAZM0gFnoEGWXKmY5jMeFJnPO4xu/0', '0', '', '118.116.92.204', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1498212144', '', '', null);
INSERT INTO `qm_user` VALUES ('31', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm1pBnWvHWvAeyNSI24bKa3gqhn0GIk4E93Q9Jc4bY37Z2T0cP0dvjBBOuhE7niboZ1UvvHr1Vy6icCS1dKedRBVK6/0', '6010549484516c2654b36c27fc1c69c2', '1480834155', '1', '', 'Dongbing_Liu', '', '', '', '', '', '', '3', 'Dongbing_Liu', 'okD3uvxX8Kov1ZK8IbVuLgb4oiZ4', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm1pBnWvHWvAeyNSI24bKa3gqhn0GIk4E93Q9Jc4bY37Z2T0cP0dvjBBOuhE7niboZ1UvvHr1Vy6icCS1dKedRBVK6/0', '0', '', '110.184.35.0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1480834155', '', '', null);
INSERT INTO `qm_user` VALUES ('32', 'zhangzhonglin', '1', '', '254029396@qq.com', '', '34d9aa91b3e54d2a20e8ab2ba8637e54', '1480908202', '1', '张中林', '螺杆', '四川省,成都市,成华区', '1977-04-05', '', '', '', '', '', '', '', '0', '', '0', '女', '118.113.40.86', '0', '0', '13881879952', '', '', '', '', '', '', '', '', '', '', '1480910237', null, null, '');
INSERT INTO `qm_user` VALUES ('33', '', '1', '', '', null, '9ea0222d02b8dd8b72bfcd10f37e03ea', '1481089338', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvwppeY_N7HPaiJafoxSlRSA', '0', null, '0', '', '222.219.176.199', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1481089338', '', '', null);
INSERT INTO `qm_user` VALUES ('34', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGcT6ydCIuZnXVt4tlshylAu6E6ib4icAP3Ocz6JUlW9KuJjTXrkjggzib2dtQyv3CT1wzRdAZuP3oD4oXuxhPq7QDF/0', 'e37685f845c082a9fa1a2adce9da4809', '1481097162', '1', '', '万万', '', '', '', '', '', '', '3', '万万', 'okD3uv8K98jf7Jus9r21niWzkQD0', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGcT6ydCIuZnXVt4tlshylAu6E6ib4icAP3Ocz6JUlW9KuJjTXrkjggzib2dtQyv3CT1wzRdAZuP3oD4oXuxhPq7QDF/0', '0', '', '182.150.133.202', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1493886154', '', '', null);
INSERT INTO `qm_user` VALUES ('35', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5Wyb1x2PS7oKyuVLHyt1NnZbzgowPJAhGoH5rJDT7AHr61yZk1SC8bDJYCYzZbu1wEsBUsKOC8U62aicTagv387a/0', '19b2f5fe8c1d7888fb47cbb87ed07afd', '1481117936', '1', '', '慢节奏', '', '', '', '', '', '', '3', '慢节奏', 'okD3uv38ZxdiCcYieYH_m0tZBfk0', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5Wyb1x2PS7oKyuVLHyt1NnZbzgowPJAhGoH5rJDT7AHr61yZk1SC8bDJYCYzZbu1wEsBUsKOC8U62aicTagv387a/0', '0', '', '182.133.245.126', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1481172181', '', '', null);
INSERT INTO `qm_user` VALUES ('36', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5U1pcibp32hy9Eoep8oL0W0U1gvhN7rZNTyzqaOFy9E8aNBTOfaNSvrbTMO6AU69uN0XEUtpZ9ariaucOxdgq7iajb/0', '244ff9d4fa95dcc8d7e59d2dfaf5b2c4', '1481431148', '1', '', '梅', '', '', '', '', '', '', '3', '梅', 'okD3uv6sveB4hoHzUTN_8i_v-mc8', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5U1pcibp32hy9Eoep8oL0W0U1gvhN7rZNTyzqaOFy9E8aNBTOfaNSvrbTMO6AU69uN0XEUtpZ9ariaucOxdgq7iajb/0', '0', '', '223.104.9.91', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1481431148', '', '', null);
INSERT INTO `qm_user` VALUES ('37', '', '1', '', '8563511@QQ.com', null, '60e76f15f82119c5d37c4f239ea6fc77', '1481448093', '1', 'smz', '沈明政', '四川省,成都市,锦江区', '2016-12-06', '', '', '', '', '3', null, 'okD3uvwsKGHi4jNlk28cEakgA3vo', '0', null, '0', '男', '117.136.63.181', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482847075', null, null, null);
INSERT INTO `qm_user` VALUES ('38', '13888888888', '1', '', '', 'http://qzapp.qlogo.cn/qzapp/101330511/D2AE4C87BE2538C9BF09D3257BE4BD94/100', 'd1d1ef14bd0cb837d1a28ca2ddc8f29d', '1481598355', '1', '', '全美网络{蒋}', '', '', '', '', '', '', '1', '全美网络{蒋}', 'D2AE4C87BE2538C9BF09D3257BE4BD94', '0', 'http://qzapp.qlogo.cn/qzapp/101330511/D2AE4C87BE2538C9BF09D3257BE4BD94/100', '0', '', '171.88.10.167', '0', '0', '13888888888', '', '', '', '', '', '', '', '', '', '', '1484529085', '', '', '');
INSERT INTO `qm_user` VALUES ('39', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGdO9oqR3QxscUjDAZNaIiaslgx8C3OajibCBMMeqhMhl2ibbN8VzsHqMYlchbD3HUfBpC68GWvTB5XibA/0', '5241f90235f55d6b52b837222f2a3767', '1481701537', '1', '', '亚亚', '', '', '', '', '', '', '3', '亚亚', 'okD3uv2kx8pfJRIubXs5cNw7VSxw', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGdO9oqR3QxscUjDAZNaIiaslgx8C3OajibCBMMeqhMhl2ibbN8VzsHqMYlchbD3HUfBpC68GWvTB5XibA/0', '0', '', '110.184.33.17', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1481701537', '', '', null);
INSERT INTO `qm_user` VALUES ('40', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6EOiccIlYrNk6KCykh6MQRPqaQ7dhnxET7dbgjQCjVa1v406MPoev9lnkg3TQWD94K56Sehl9LhsugLsiaibf0iamdFPBHO0wcSy4/0', '25a900cc938e7b7cdbe46be5f2999f28', '1481722401', '1', '', '绿茶', '', '', '', '', '', '', '3', '绿茶', 'okD3uvwpBHKpZJDfGW2EE55eWF6E', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6EOiccIlYrNk6KCykh6MQRPqaQ7dhnxET7dbgjQCjVa1v406MPoev9lnkg3TQWD94K56Sehl9LhsugLsiaibf0iamdFPBHO0wcSy4/0', '0', '', '117.139.14.155', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488428572', '', '', null);
INSERT INTO `qm_user` VALUES ('41', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6YiaGrUxbLrZKBe44218dC5QiaCs9Mf0vnYgd0SldeaJVicDMETHHbVt54u69UWypq6dSy9MIcl9dO8/0', '08a10e81c5abdcda0dcd7b36095b6de3', '1481945479', '1', '', '总有刁民想造反', '', '', '', '', '', '', '3', '总有刁民想造反', 'okD3uv-oPO5ps1lY0gjf3Ys-2nyQ', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6YiaGrUxbLrZKBe44218dC5QiaCs9Mf0vnYgd0SldeaJVicDMETHHbVt54u69UWypq6dSy9MIcl9dO8/0', '0', '', '171.213.61.74', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1481945479', '', '', null);
INSERT INTO `qm_user` VALUES ('42', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6aibibMmNQjC4bw17tTk91ibMrvZTxp05xvFsBbw8WRoPP98bad1sWMfMbHJlfZzrZjnxt2UuNuyEKY/0', '08ccc76a6ca99ce741625bf606db8230', '1482025269', '1', '', '流云', '', '', '', '', '', '', '3', '流云', 'okD3uv8A7qpeMO8P9p-XZ0D5YSb4', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6aibibMmNQjC4bw17tTk91ibMrvZTxp05xvFsBbw8WRoPP98bad1sWMfMbHJlfZzrZjnxt2UuNuyEKY/0', '0', '', '171.213.61.74', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482025269', '', '', null);
INSERT INTO `qm_user` VALUES ('43', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIEicC8pRVVRqicQfQ1Ze3cv9UAzDk9eMD3t9IGEbwUPkSGBicN2f0nYAibl1iavLVNmSUC5CwGicOu2jhxC/0', '6d5d996d25deefba0841214457ef8ef5', '1482145439', '1', '', '燕飞蓝天', '', '', '', '', '', '', '3', '燕飞蓝天', 'okD3uv5r7WC2sI25dmctqgVkjc0A', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIEicC8pRVVRqicQfQ1Ze3cv9UAzDk9eMD3t9IGEbwUPkSGBicN2f0nYAibl1iavLVNmSUC5CwGicOu2jhxC/0', '0', '', '223.87.241.42', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483279316', '', '', null);
INSERT INTO `qm_user` VALUES ('44', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELmgNibOibKoQYRrPVSprrbHF1a0V1lTICldCDHmiaSVuia4a4ohdILCjtRzJZWic5icyDZ1e3g7mkWTCJg/0', '6aecdaea00645657d1282d546bf1db49', '1482200853', '1', '', '神州华宇', '', '', '', '', '', '', '3', '神州华宇', 'okD3uv9cWuMnxA0418RvBoAKimRA', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELmgNibOibKoQYRrPVSprrbHF1a0V1lTICldCDHmiaSVuia4a4ohdILCjtRzJZWic5icyDZ1e3g7mkWTCJg/0', '0', '', '61.148.244.52', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1484271189', '', '', null);
INSERT INTO `qm_user` VALUES ('45', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGf31bYU6rzI62NdPU50XgX4gvDpXYvXu3SpESQnhEaKXuoLDMxAKK84b8MaSp2pwZbCRftwX9eSqUgZPbExON8s/0', '6b38f72b586e20c8f940cd9e284fbdd3', '1482409221', '1', '', '龚斌', '', '', '', '', '', '', '3', '龚斌', 'okD3uv5CecIJzJNn_NUff-XDC4NA', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGf31bYU6rzI62NdPU50XgX4gvDpXYvXu3SpESQnhEaKXuoLDMxAKK84b8MaSp2pwZbCRftwX9eSqUgZPbExON8s/0', '0', '', '118.121.176.53', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482409221', '', '', null);
INSERT INTO `qm_user` VALUES ('46', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGfEuX1xibeYVibLU4cPp4XrIoPeydkkzsljLwtiaI22t9g8IGg9t0VHULnjVsYzaIUAogiaUfGJOLdJNxggQeuic8tmF/0', 'd04b3b59c322f7dc1e6825fa4053feb1', '1482627562', '1', '', '洪荒来客', '', '', '', '', '', '', '3', '洪荒来客', 'okD3uv9ylWoOPRdn4TVWcQrWvdWg', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGfEuX1xibeYVibLU4cPp4XrIoPeydkkzsljLwtiaI22t9g8IGg9t0VHULnjVsYzaIUAogiaUfGJOLdJNxggQeuic8tmF/0', '0', '', '223.104.9.179', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482627562', '', '', null);
INSERT INTO `qm_user` VALUES ('47', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LnkHFbn7ibiazlUiasGwPYcrunZwgkhzibzD72x40NCoS3iaDIBo3RJjOv1GAPoH9TE5YRJESN43alPnl/0', '0bcf1e6c3aa976af166ae27a49e70003', '1482817751', '1', '', '格芸Green', '', '', '', '', '', '', '3', '格芸Green', 'okD3uv9_qxVcix-vZlxOULhgdOhI', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LnkHFbn7ibiazlUiasGwPYcrunZwgkhzibzD72x40NCoS3iaDIBo3RJjOv1GAPoH9TE5YRJESN43alPnl/0', '0', '', '182.148.34.96', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482817751', '', '', null);
INSERT INTO `qm_user` VALUES ('48', '', '1', '', '', null, '599cacb200c911785f40bdfa19ed2a4b', '1482849485', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uv6AeAlfgTIpyhNzrd5hEuhU', '0', null, '0', '', '171.217.66.34', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482849485', '', '', null);
INSERT INTO `qm_user` VALUES ('49', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm30Wo8xiaJKQ3JHOTH96iaKiauUWkibyESlGVsvib8rzic1GG5ibLtSxX9pH9T21Z1CxOdBMp1pteicdqAtJibMwxFmBicfaW/0', '9772f2f5cbf70bb0c9e0add4e191c14d', '1482914415', '1', '', '蒋建红', '', '', '', '', '', '', '3', '蒋建红', 'okD3uv6MqEMIKASMqoUo0K1kAXk4', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm30Wo8xiaJKQ3JHOTH96iaKiauUWkibyESlGVsvib8rzic1GG5ibLtSxX9pH9T21Z1CxOdBMp1pteicdqAtJibMwxFmBicfaW/0', '0', '', '117.139.248.3', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483452016', '', '', null);
INSERT INTO `qm_user` VALUES ('50', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj4hbESwiarUicYf4lj0jzick3AFCuOVz2u7O1WOiacic6wH1PxFGhxS7CUxRTnibKLg5TLASejYGDMiaobvSUxB76THhlu/0', '49d3885ef6f61acb8d7ae0472e51b7f5', '1482929894', '1', '', '超曼滤清器', '', '', '', '', '', '', '3', '超曼滤清器', 'okD3uv7pHQF8mIRVEg11ioGd6hqw', '1', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj4hbESwiarUicYf4lj0jzick3AFCuOVz2u7O1WOiacic6wH1PxFGhxS7CUxRTnibKLg5TLASejYGDMiaobvSUxB76THhlu/0', '0', '', '123.149.204.200', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1482929894', '', '', null);
INSERT INTO `qm_user` VALUES ('51', '', '1', '', '', '/user/1439/u_1439.jpg', '169dbe7e0712ce07fbccd60100196861', '1483068339', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvwHLrLM-903G30v3NuqSNpo', '0', null, '0', '', '222.211.201.128', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483068504', '', '', '1483067963iub4b');
INSERT INTO `qm_user` VALUES ('52', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/hn05lBVkqtZlr9k6EZooCCKpicNSvTE87RClsja3qM1snAiccXuhNHGnHbbk4nXgEKdpMXwbj5hG847wlfnicGfOag2npwoyhwib/0', '089ded8bb80bdf66a4af08d06ee672b2', '1483421976', '1', '', '张艳', '', '', '', '', '', '', '3', '张艳', 'okD3uv1gE1GtD_rQqcYHHcNqpsjE', '1', 'http://wx.qlogo.cn/mmopen/hn05lBVkqtZlr9k6EZooCCKpicNSvTE87RClsja3qM1snAiccXuhNHGnHbbk4nXgEKdpMXwbj5hG847wlfnicGfOag2npwoyhwib/0', '0', '', '222.211.226.218', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483421976', '', '', null);
INSERT INTO `qm_user` VALUES ('53', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6xehicChWAIdqQChR51HicvsfjLTPj2SvUU1eIh16iaficwhc1bkthpcHqnRkXxTFwSQYic19iapTD4nMN3zcVkJ4EhDeetNk6l0H8U/0', '1abc0423cfa16ade7f418d4eca243cd1', '1483428210', '1', '', '岁月斑驳', '', '', '', '', '', '', '3', '岁月斑驳', 'okD3uv3vVpsMO5xyax0wTt_kUVzs', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6xehicChWAIdqQChR51HicvsfjLTPj2SvUU1eIh16iaficwhc1bkthpcHqnRkXxTFwSQYic19iapTD4nMN3zcVkJ4EhDeetNk6l0H8U/0', '0', '', '121.31.250.229', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483428210', '', '', null);
INSERT INTO `qm_user` VALUES ('54', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5XWZV3T9nTUlZekwoulxXVAxzEkiaUwYHO9PCibOI03vxLX2bSUND9qjMpzbFCGK7ibSyLEdyFqHicU0wObCnYYyANL/0', '10d93a702f491f87866c9afb6937663e', '1483429552', '1', '', '吴敏', '', '', '', '', '', '', '3', '吴敏', 'okD3uv6t5sakKazTK255qUS6nTpo', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5XWZV3T9nTUlZekwoulxXVAxzEkiaUwYHO9PCibOI03vxLX2bSUND9qjMpzbFCGK7ibSyLEdyFqHicU0wObCnYYyANL/0', '0', '', '117.139.14.129', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483429552', '', '', null);
INSERT INTO `qm_user` VALUES ('55', '', '1', '', '', null, 'dddd020fe0b21ca844ad6d80e91b2365', '1483598530', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uv55f84Jol0_XisjO93fH-3U', '0', null, '0', '', '125.64.60.60', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483598530', '', '', null);
INSERT INTO `qm_user` VALUES ('56', '', '1', '', '', null, '48a047cb7144db55426fce7ea41be3b1', '1483598666', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uv_bXHVUxVcJRhCLydH2Oz1Q', '0', null, '0', '', '139.207.190.192', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483598666', '', '', null);
INSERT INTO `qm_user` VALUES ('57', '', '1', '', '', null, 'fc019131c4a2959987a1cdbab82375f5', '1483598749', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvxdYKTbmYHc9OdIf0CQVDpw', '0', null, '0', '', '117.136.82.238', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483598749', '', '', null);
INSERT INTO `qm_user` VALUES ('58', '', '1', '', '', null, 'c4d079e18b0d1d478cd140665b683306', '1483607843', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvydI_rz-NqsSpUIJE04Knjc', '0', null, '0', '', '118.125.144.29', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483607843', '', '', null);
INSERT INTO `qm_user` VALUES ('59', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7EJelE9siaxkbOOiaib5HgSUdIrugp4diclXYJia5nvWHVd83KJAc8SFTTYcbVZaevOicuWDLDn57DibcHg/0', '3c06f7fd707f0c538a092b3562287427', '1483695146', '1', '', '吴煜', '', '', '', '', '', '', '3', '吴煜', 'okD3uv0fIBpSHU6x6a2wcqE5-ZE4', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7EJelE9siaxkbOOiaib5HgSUdIrugp4diclXYJia5nvWHVd83KJAc8SFTTYcbVZaevOicuWDLDn57DibcHg/0', '0', '', '110.184.203.33', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483695146', '', '', null);
INSERT INTO `qm_user` VALUES ('60', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5XWZV3T9nTUlf9LZVHMgBUIiau54ZUCTYSC1SyXa1bYXHAzEjjO95lqQcx70GfJXzVHVqA2oBKmI0pWnEtdVvYU6/0', '5bcf41194b9d0c47a16f876c70a40430', '1483853143', '1', '', '天崖', '', '', '', '', '', '', '3', '天崖', 'okD3uv6yy8OC2-65sO_-kWhKVfm0', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5XWZV3T9nTUlf9LZVHMgBUIiau54ZUCTYSC1SyXa1bYXHAzEjjO95lqQcx70GfJXzVHVqA2oBKmI0pWnEtdVvYU6/0', '0', '', '125.67.137.222', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483853143', '', '', null);
INSERT INTO `qm_user` VALUES ('61', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6cV3FWaPs1S0J3oj8XuiaEAnCNN0JN0ZAAjezCUfWWD47esWcIjuiatFZb0tLhWkxriatcH8AhW39BU/0', 'eef1b086089124e6af5a853a95d8f4f5', '1483957543', '1', '', '微笑', '', '', '', '', '', '', '3', '微笑', 'okD3uv_aoDrc52oS48nnUA-xqw4g', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6cV3FWaPs1S0J3oj8XuiaEAnCNN0JN0ZAAjezCUfWWD47esWcIjuiatFZb0tLhWkxriatcH8AhW39BU/0', '0', '', '125.71.77.211', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1483957543', '', '', null);
INSERT INTO `qm_user` VALUES ('62', 'sanshao', '1', '', '', '', '6f15009609b608de551431a3e5481c49', '1484270581', '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '118.26.157.102', '0', '0', '13301212204', '', '', '', '', '', '', '', '', '', '', '1486871450', '', '', '');
INSERT INTO `qm_user` VALUES ('63', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIE7FZbZJnVH244vPMlDevfPCd0M7dyMShuZY11aypLCoebjW5Y2iaBfibDY8dFJ8cGFraLtibeZ9vibwf/0', 'ad74330014b46abf6e78c884d8e90bc7', '1484302290', '1', '', '杏花微雨', '', '', '', '', '', '', '3', '杏花微雨', 'okD3uv_JH9FWuCz6_jsoMv1vwV_s', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIE7FZbZJnVH244vPMlDevfPCd0M7dyMShuZY11aypLCoebjW5Y2iaBfibDY8dFJ8cGFraLtibeZ9vibwf/0', '0', '', '182.149.205.128', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1484302290', '', '', null);
INSERT INTO `qm_user` VALUES ('64', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm12GwtwxhjN9a3h65eFmmX30MnM8vhoe3RJfzIgicjmSBN7NY95MiaHbDN6H00h3PRsRbdIUOVb8Hibs44aBhmeibBW/0', '3256e26b5a79264dcd04c76aca970d29', '1484637729', '1', '', '你要站好', '', '', '', '', '', '', '3', '你要站好', 'okD3uv75VWmkzPDNDulc86wk2spY', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm12GwtwxhjN9a3h65eFmmX30MnM8vhoe3RJfzIgicjmSBN7NY95MiaHbDN6H00h3PRsRbdIUOVb8Hibs44aBhmeibBW/0', '0', '', '223.104.9.214', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1484637729', '', '', null);
INSERT INTO `qm_user` VALUES ('65', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGe95uRlCpknB7e2eBBjktjQKtmnLiaz8xZt1fg0r6RbFtshSaZzAplhsU7WYP0sjZx2PhfJeiboVN340dRLXGA3X2/0', '1f318fa4ae5f9fcbeedc85b5ad6234d1', '1485186419', '1', '', '任思全', '', '', '', '', '', '', '3', '任思全', 'okD3uv0Oim25yoL89Fhro0sEiIqk', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGe95uRlCpknB7e2eBBjktjQKtmnLiaz8xZt1fg0r6RbFtshSaZzAplhsU7WYP0sjZx2PhfJeiboVN340dRLXGA3X2/0', '0', '', '171.93.133.216', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1485186419', '', '', null);
INSERT INTO `qm_user` VALUES ('66', '', '1', '', '', 'http://qzapp.qlogo.cn/qzapp/101330511/54A325993611E690E8E237B716A05577/100', 'f147d4f7928d260bf4df35fb82c2c97e', '1487764552', '1', '', '螺杆', '', '', '', '', '', '', '1', '螺杆', '54A325993611E690E8E237B716A05577', '0', 'http://qzapp.qlogo.cn/qzapp/101330511/54A325993611E690E8E237B716A05577/100', '0', '', '110.184.32.144', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '');
INSERT INTO `qm_user` VALUES ('67', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm2ib78L4HmWAib56hgBpjVibvG9UYiay9BMjkS4mx0mE8d8xhRDwG1ZOBzZbX8xm9liclibxr626Diaa2ibBiaxOCQibP1zhV/0', '16301279b0b4caa54e604d1c1c736922', '1488291602', '1', '', '芳', '', '', '', '', '', '', '3', '芳', 'okD3uv9KS_G4xtvNoXRkx4YnDXBU', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm2ib78L4HmWAib56hgBpjVibvG9UYiay9BMjkS4mx0mE8d8xhRDwG1ZOBzZbX8xm9liclibxr626Diaa2ibBiaxOCQibP1zhV/0', '0', '', '182.150.169.21', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488291602', '', '', null);
INSERT INTO `qm_user` VALUES ('68', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm3tvthcrnCuFqKbbN47hEcx9YmjIojXO4SXm9EjibWR1GtH9HWj5QicVicRSMwxLArf6m9bnrTRrpKwUia6K2aJ82VD/0', '1ca50c5c53c5f7634e7a7e73ac11b4f8', '1488324926', '1', '', 'A  ※   陈慧蓉  ※', '', '', '', '', '', '', '3', 'A  ※   陈慧蓉  ※', 'okD3uv9_1H12ni7DUEiQ4KC_r_dw', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm3tvthcrnCuFqKbbN47hEcx9YmjIojXO4SXm9EjibWR1GtH9HWj5QicVicRSMwxLArf6m9bnrTRrpKwUia6K2aJ82VD/0', '0', '', '223.104.3.233', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488324926', '', '', null);
INSERT INTO `qm_user` VALUES ('69', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/cnK8LormbUxV6vf6Fddx3vgBcxSWXpzkia6iaEZ64SdwQ8rLyla7Q2HValqsysInVUYT45zdUxzOyR9ibiclW8l1GFeia39j5zv0y/0', '1b9df8a724d763f5436bfb84ae7d5471', '1488354028', '1', '', '陈佳', '', '', '', '', '', '', '3', '陈佳', 'okD3uv52NPm4feJO0NKkl8-B1Sfk', '1', 'http://wx.qlogo.cn/mmopen/cnK8LormbUxV6vf6Fddx3vgBcxSWXpzkia6iaEZ64SdwQ8rLyla7Q2HValqsysInVUYT45zdUxzOyR9ibiclW8l1GFeia39j5zv0y/0', '0', '', '119.4.254.129', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488947339', '', '', null);
INSERT INTO `qm_user` VALUES ('70', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDvoFEgib7Qicq8UWD5GORYklpbRVKdFAhTIjl5r5ibNYs5RE3Dp4uopyIM8a07yXfk4u3atibFJUI1mA/0', 'd1dba44ae84ee000883c7c099d91d60e', '1488381623', '1', '', '周婷婷', '', '', '', '', '', '', '3', '周婷婷', 'okD3uvwDPOicu3b-B3ti7slk9iTI', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDvoFEgib7Qicq8UWD5GORYklpbRVKdFAhTIjl5r5ibNYs5RE3Dp4uopyIM8a07yXfk4u3atibFJUI1mA/0', '0', '', '117.136.63.167', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488381623', '', '', null);
INSERT INTO `qm_user` VALUES ('71', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM69pKFFg2vEfpibcNrqamibqVvXdaKJ4Sgpotod3KAehGg4Igw77YrmvjYL1azp2JxKQYibC86jj5QSQ/0', '7ab67008284da8716e1060c0e46137fe', '1488461516', '1', '', 'Alex', '', '', '', '', '', '', '3', 'Alex', 'okD3uvxsVHkbid52_xyR93TYwT10', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM69pKFFg2vEfpibcNrqamibqVvXdaKJ4Sgpotod3KAehGg4Igw77YrmvjYL1azp2JxKQYibC86jj5QSQ/0', '0', '', '218.88.30.90', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1490587847', '', '', null);
INSERT INTO `qm_user` VALUES ('72', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIUeQiaX3nX9ibIkPcjZEHFibPhXYSYhuGDiawnyC7ETcjkcS1F9Xh0C6yIekZ0ticBuWzpXfNXhK7MRDA/0', 'f004bc631f3515b7a909b112209b3d3f', '1488542674', '1', '', '石坝上', '', '', '', '', '', '', '3', '石坝上', 'okD3uv-SCzAxMPKgHmb78ChplcLE', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIUeQiaX3nX9ibIkPcjZEHFibPhXYSYhuGDiawnyC7ETcjkcS1F9Xh0C6yIekZ0ticBuWzpXfNXhK7MRDA/0', '0', '', '171.209.132.9', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488542674', '', '', null);
INSERT INTO `qm_user` VALUES ('73', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm2lSQFcq3KjlibzMga27H89aMLuibG7PHN6CpwkmcPVZOQickxO30GEiblG34jSQ4icpHIv2CI6GnfeqsW1PHHMTEl7t/0', 'fda1a23c347bb4f8d37ac8bd76a987e9', '1488769650', '1', '', '黄春林up1378', '', '', '', '', '', '', '3', '黄春林up1378', 'okD3uvzN_WTHJsVIfDiK8IZJC8YM', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm2lSQFcq3KjlibzMga27H89aMLuibG7PHN6CpwkmcPVZOQickxO30GEiblG34jSQ4icpHIv2CI6GnfeqsW1PHHMTEl7t/0', '0', '', '182.148.62.80', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1496995485', '', '', null);
INSERT INTO `qm_user` VALUES ('74', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/2D8A9NYicmwNVEKweEZ9A9JLUuLb3YkR4Bibqa3976EiaXdR3E8BWRbvH8OFD1nB6F59CqdPo9MPhibg8Bqn99pDKC6VjnA20kfA/0', '8b799641b8f3863fc6ffe9e654535414', '1488947984', '1', '', '常常smile', '', '', '', '', '', '', '3', '常常smile', 'okD3uv5YvbXe2Sqjgg-SbslUkbQM', '1', 'http://wx.qlogo.cn/mmopen/2D8A9NYicmwNVEKweEZ9A9JLUuLb3YkR4Bibqa3976EiaXdR3E8BWRbvH8OFD1nB6F59CqdPo9MPhibg8Bqn99pDKC6VjnA20kfA/0', '0', '', '218.88.125.92', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1488947984', '', '', null);
INSERT INTO `qm_user` VALUES ('75', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGcyVfscarAn9sYsyhWl3nehvZ9IjliciaoQfuHfOIw2nsyRMLRnOyx9VCS5vRDf2lVKc8iaK9lVqibUUyqPic0zO7Jby/0', '2fbc3d939f21d3b18994e387da04ae6c', '1489636192', '1', '', '莫非你是我', '', '', '', '', '', '', '3', '莫非你是我', 'okD3uv9LDqa3wb8kmNTJNQ0cHjBQ', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGcyVfscarAn9sYsyhWl3nehvZ9IjliciaoQfuHfOIw2nsyRMLRnOyx9VCS5vRDf2lVKc8iaK9lVqibUUyqPic0zO7Jby/0', '0', '', '183.38.246.189', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1489720080', '', '', null);
INSERT INTO `qm_user` VALUES ('76', '', '1', '', '', null, 'b66d6fda5d9846a1725733e544053210', '1489639295', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvylpwboj3vcYAIR3QBm4IqI', '0', null, '0', '', '101.204.150.75', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1489639295', '', '', null);
INSERT INTO `qm_user` VALUES ('77', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm1pBnWvHWvAe6z5Cp3ApOu4J9w1lmHmrtTEYWCJqIAice1kAt3RicXQunAGQQfheicxPu4JiaEiaMOPBY4uAjSt92gpt/0', '3636d8ed82bf30b11840120c196a498b', '1489711711', '1', '', '炭', '', '', '', '', '', '', '3', '炭', 'okD3uv9XJ8oMGY3dQRLZGdRUDn4g', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm1pBnWvHWvAe6z5Cp3ApOu4J9w1lmHmrtTEYWCJqIAice1kAt3RicXQunAGQQfheicxPu4JiaEiaMOPBY4uAjSt92gpt/0', '0', '', '115.164.217.199', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1489711711', '', '', null);
INSERT INTO `qm_user` VALUES ('78', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5X7QxZWp34b8KOpE1nucdLQibaInVcoACyv6yc3s59LO7LjYCyEmlubhicPyHGjcoj3FqgcTUnFRKXLz9a59Q563E/0', 'db05d1b115438d009ab68e4d10274540', '1489772360', '1', '', '孙晓波', '', '', '', '', '', '', '3', '孙晓波', 'okD3uvxf2rtVGAmO_657o-mg4Uc4', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5X7QxZWp34b8KOpE1nucdLQibaInVcoACyv6yc3s59LO7LjYCyEmlubhicPyHGjcoj3FqgcTUnFRKXLz9a59Q563E/0', '0', '', '218.88.93.218', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1489772360', '', '', null);
INSERT INTO `qm_user` VALUES ('79', '', '1', '', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELoPlrkUgv0FB1ibW6cOIsiahAC2ofNNf6eAStzT3Q2KjC6gjz3vku0icpw2XaoSbcnt2DaJ1ia3pe1DA/0', '82cd88c07c1e8bf41d0b764adaa9c640', '1490180916', '1', '', '毛了', '', '', '', '', '', '', '3', '毛了', 'okD3uv8iz-ba5TR4GURkdCOMuuQQ', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELoPlrkUgv0FB1ibW6cOIsiahAC2ofNNf6eAStzT3Q2KjC6gjz3vku0icpw2XaoSbcnt2DaJ1ia3pe1DA/0', '0', '', '222.211.250.38', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1490180916', '', '', null);
INSERT INTO `qm_user` VALUES ('80', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5WEOPZmNp3THFnXlIIM526lmL5lmber4xusyX6PgG45nHTRkdDWRoVGhCfFWImsl59THm5S94DMvPkficLZhzMnib/0', '4f187129fa802767114b41793f834149', '1490948593', '1', '', 'A0网站建设、推广', '', '', '', '', '', '', '3', 'A0网站建设、推广', 'okD3uv4N50YQa_ZAcRHB9xtRODo0', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5WEOPZmNp3THFnXlIIM526lmL5lmber4xusyX6PgG45nHTRkdDWRoVGhCfFWImsl59THm5S94DMvPkficLZhzMnib/0', '0', '', '117.136.70.45', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1490948593', '', '', null);
INSERT INTO `qm_user` VALUES ('81', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj4ibFQGNI9tfumeptBNg0ALGmHz63bHm3nmgQcl3KL61JYuFTRWSH4h6VibISVoH9f3rD6fmAwu88Z5v25JvoC1br/0', '2dbaa44ce7d0af60b2d9a0419eca953d', '1490950198', '1', '', '何林根', '', '', '', '', '', '', '3', '何林根', 'okD3uv-6JlVbvUgWKFl0RhDNs_bo', '1', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj4ibFQGNI9tfumeptBNg0ALGmHz63bHm3nmgQcl3KL61JVOnqcxKaWZwIoXwdD7UrLOF54dAYNic6o3NaN6KBHM0N/0', '0', '', '222.211.202.178', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1493192589', '', '', null);
INSERT INTO `qm_user` VALUES ('82', '', '0', '', '', null, '0225c5230aba6fe2154c99d7b7dca71d', '1490965356', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvwg_OOb5U6HA3B302HZ6c4E', '0', null, '0', '', '222.209.72.198', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1490965356', '', '', null);
INSERT INTO `qm_user` VALUES ('83', 'wdw5d1w5', '0', '', '', '', '0b483a5fd29032b3f6bb48c5ef89707e', '1491040208', '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '39.67.131.186', '0', '0', '15563379500', '', '', '', '', '', '', '', '', '', '', '0', '', '', '');
INSERT INTO `qm_user` VALUES ('84', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCuYSsxdc4NUumbNvEl6S768SZziafExHyPwGyRlfUSiaqRO3sVfHQ7fLAWd0zblMS521OdKU3symAA/0', '3f394e6bce0544583f2ecc5772708784', '1491380346', '1', '', '小笨猪', '', '', '', '', '', '', '3', '小笨猪', 'okD3uv9jqLa2O9ZlpOQP2Pgz22UM', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCuYSsxdc4NUumbNvEl6S768SZziafExHyPwGyRlfUSiaqRO3sVfHQ7fLAWd0zblMS521OdKU3symAA/0', '0', '', '117.136.70.63', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1491380346', '', '', null);
INSERT INTO `qm_user` VALUES ('85', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6QTlXJOFuCkKFibAo5jJNI4n1u9CZTeWyD6LyGQicSklIyNiahZRmhLkUkNaV1JgGnICkP3fUib17nH7/0', '601336249cb09d63c94f6326d36c18a2', '1491717909', '1', '', '愛你的人生', '', '', '', '', '', '', '3', '愛你的人生', 'okD3uv7GmsXGpDmus-5kH9MXZhVo', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm39S0T95nXT0UQsJOTHt7rI8icINwibf3LAg22j6Rjr4dzBNPBbeVnoWeb6PpGB3mrzxn2VVOqyXDb2OtPLNDIIw4/0', '0', '', '113.81.3.119', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1494858041', '', '', null);
INSERT INTO `qm_user` VALUES ('86', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/janaztAsmm2K5t6L7JtyO2hPbibmu5iajajBvuIf5u47k4Ieewia1Zu1lMBE80sEe9TkILRtcjqBIuN6VGgMSg7ibG1UnHzm9Xr5/0', 'd1bd70fc86bc7d669f06f5fc69831ef4', '1491785144', '1', '', '郭琼瑶 Ծ', '', '', '', '', '', '', '3', '郭琼瑶 Ծ', 'okD3uvyrD96HTGgkoCwwI3DH8XXg', '1', 'http://wx.qlogo.cn/mmopen/janaztAsmm2K5t6L7JtyO2hPbibmu5iajajBvuIf5u47k4Ieewia1Zu1lMBE80sEe9TkILRtcjqBIuN6VGgMSg7ibG1UnHzm9Xr5/0', '0', '', '171.221.144.144', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1491785144', '', '', null);
INSERT INTO `qm_user` VALUES ('87', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj748BxUjUE82Id1ESDPD5I7xcbKrGKW6iaD5uicZ7VnWGAfIyrZIGbkCjNWE5vlibuJtwNnwqWbyRwep4FhcmxpG5L/0', 'b4a6b395431427aa78f75cea90d9032c', '1491890753', '1', '', '中国联通智慧农场', '', '', '', '', '', '', '3', '中国联通智慧农场', 'okD3uv75LJQIQMTzHHVSyGF3SV5E', '1', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj748BxUjUE82Id1ESDPD5I7xcbKrGKW6iaD5uicZ7VnWGAfIyrZIGbkCjNWE5vlibuJtwNnwqWbyRwep4FhcmxpG5L/0', '0', '', '119.4.174.68', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1491890753', '', '', null);
INSERT INTO `qm_user` VALUES ('88', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/sxvMSKHEibMqGrW8SgdGl38BltuiaSe2F5CkwbSEb4xFsbWyicm1Nbwiaia6GDAt0s0ceLOVGqjibUBR3BFvAmVic5TbfyEvUVaExeT/0', '0daac1dee2d2ad2584b1c3ef01f29f4d', '1492141381', '1', '', '刘启江', '', '', '', '', '', '', '3', '刘启江', 'okD3uvxb_ZShPUFjOzeG8iPNIPq4', '1', 'http://wx.qlogo.cn/mmopen/sxvMSKHEibMqGrW8SgdGl38BltuiaSe2F5CkwbSEb4xFsbWyicm1Nbwiaia6GDAt0s0ceLOVGqjibUBR3BFvAmVic5TbfyEvUVaExeT/0', '0', '', '223.104.9.64', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1493094109', '', '', null);
INSERT INTO `qm_user` VALUES ('89', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LpQMwpjRQmV8zsDicCr6ib3ZzEdQ2Fwo1gQzS8XDDA22xxvcm8zvuNvBadia0FT4mBLM0mtbreW2lZ7/0', '79bbf58b81bb9940a71705347cd202aa', '1492432011', '1', '', '深蓝', '', '', '', '', '', '', '3', '深蓝', 'okD3uvxe2FJJkyYVQOdYz0YUmXhg', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LpQMwpjRQmV8zsDicCr6ib3ZzEdQ2Fwo1gQzS8XDDA22xxvcm8zvuNvBadia0FT4mBLM0mtbreW2lZ7/0', '0', '', '119.4.175.150', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1492432011', '', '', null);
INSERT INTO `qm_user` VALUES ('90', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeIll3unGu0eTXxZZGcFyUkBRD2MXHqLRmdkLKCacqhNNKHib4xt7EutibBcw5iceiao28VvDicsjK0UUTlqmNbUjWxF/0', 'bfab5121abf6e601a7670e16a14a5c00', '1492608856', '1', '', '25小时', '', '', '', '', '', '', '3', '25小时', 'okD3uv6wm9_uUSymrZDkRpe57Seo', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeIll3unGu0eTXxZZGcFyUkBRD2MXHqLRmdkLKCacqhNNKHib4xt7EutibBcw5iceiao28VvDicsjK0UUTlqmNbUjWxF/0', '0', '', '117.139.14.188', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1492608856', '', '', null);
INSERT INTO `qm_user` VALUES ('91', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/IPjYGG3UwiaJeUTaBtcmCE6ibq2dhxrsayE4XD14UawmEjveGYeOgmtZpFGDz17sGOn1TK2Ny42VyBWRgMib0tnL1g3iadHNRRSic/0', '85b289f0bb4a93c33c314fddf7d4848a', '1492741193', '1', '', '毛清松', '', '', '', '', '', '', '3', '毛清松', 'okD3uv41ssbBL40pbwIEm_RNGWFY', '1', 'http://wx.qlogo.cn/mmopen/IPjYGG3UwiaJeUTaBtcmCE6ibq2dhxrsayE4XD14UawmEjveGYeOgmtZpFGDz17sGOn1TK2Ny42VyBWRgMib0tnL1g3iadHNRRSic/0', '0', '', '222.210.173.119', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1492742582', '', '', null);
INSERT INTO `qm_user` VALUES ('92', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGdTYacLEibMxbjkGZIeGqNAreZb8AyELU4LFugCcgZVagEQGP7YtCvAC28qgk5ZhxToicLNp2STwJAA6MbpNU08jA/0', '39f5b5bcc20c8cd6cb6f6cdc89090ac2', '1492744522', '1', '', ':)', '', '', '', '', '', '', '3', ':)', 'okD3uvydn3c4MJISC-Udk3n5sOcI', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGdTYacLEibMxbjkGZIeGqNAreZb8AyELU4LFugCcgZVagEQGP7YtCvAC28qgk5ZhxToicLNp2STwJAA6MbpNU08jA/0', '0', '', '117.136.70.117', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1492744522', '', '', null);
INSERT INTO `qm_user` VALUES ('93', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/nSn0Zo9VAlxsRJzpnVfOlvlNoAcf6JwfdTRc8C2Lpt1J4Im61LAUyE2bic3BTWibkcBXbumxC1R2nCxKTpuJQ8Z1hzfkXL41rQ/0', '6e2a30d0c4b38da07deedc3c8f2da5d0', '1492744527', '1', '', '李静', '', '', '', '', '', '', '3', '李静', 'okD3uv088xd_IXIlYxdfeLKW87cc', '1', 'http://wx.qlogo.cn/mmopen/nSn0Zo9VAlxsRJzpnVfOlvlNoAcf6JwfdTRc8C2Lpt1J4Im61LAUyE2bic3BTWibkcBXbumxC1R2nCxKTpuJQ8Z1hzfkXL41rQ/0', '0', '', '117.136.70.53', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1492744527', '', '', null);
INSERT INTO `qm_user` VALUES ('94', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6ZCdVP8RyOfjyfbY5ibQkVibwVEhgmaDlrJKGjlGhxRkCM6rX5icpJKxYHtiap0qFibleILbKZe6cWicLib/0', 'd15d12071023841295dd2965b2bdb61c', '1493014851', '1', '', '鳯苑小舍', '', '', '', '', '', '', '3', '鳯苑小舍', 'okD3uv9Y24MLuSWMJi38MuBAaYz0', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGc7ImvicEl0O6ZCdVP8RyOfjyfbY5ibQkVibwVEhgmaDlrJKGjlGhxRkCM6rX5icpJKxYHtiap0qFibleILbKZe6cWicLib/0', '0', '', '182.138.213.157', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1493014851', '', '', null);
INSERT INTO `qm_user` VALUES ('95', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/NgUU0I85FiaI6lg1mrJVPMGYY3G9kJjUOkAM4S7ZrMyPPn2P88wFcutYvRKRic2xQzVeIcrd1etKxnWNmvNndDVHphicZI7fmLD/0', '99039639cce19e4cbc658021f564d336', '1493887895', '1', '', '撑着雨伞的护身符', '', '', '', '', '', '', '3', '撑着雨伞的护身符', 'okD3uvzZlLmbN9I4hat6xRQg-XrA', '1', 'http://wx.qlogo.cn/mmopen/NgUU0I85FiaI6lg1mrJVPMGYY3G9kJjUOkAM4S7ZrMyPPn2P88wFcutYvRKRic2xQzVeIcrd1etKxnWNmvNndDVHphicZI7fmLD/0', '0', '', '118.116.110.120', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1493887895', '', '', null);
INSERT INTO `qm_user` VALUES ('96', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5U4iahVNE0dpnoROLCfnMYAYy68L2J7kMnundFsV1mWntzcaMFyVBzO5bl5rRkhcvrGkx1hctKt91fLLAaMlB3lic/0', '00e391327bcb0dcdb6c6e13053bb6c82', '1494744113', '1', '', 'mm', '', '', '', '', '', '', '3', 'mm', 'okD3uv_YGOwZR_3DqzqkiKs1Xzjc', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5U4iahVNE0dpnoROLCfnMYAYy68L2J7kMnundFsV1mWntzcaMFyVBzO5bl5rRkhcvrGkx1hctKt91fLLAaMlB3lic/0', '0', '', '117.172.166.178', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1494744113', '', '', null);
INSERT INTO `qm_user` VALUES ('97', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7Lkdg8EjGrOAk5lomibficZjGbHiccwOpV4mdWSlPW837dKiaM2YEuYv7UaQiaewB5mhL2OQ7vJw26zEq8/0', 'b4ae7edffafa5f1efacb80f2b762242a', '1494758907', '1', '', '小袁', '', '', '', '', '', '', '3', '小袁', 'okD3uv7uBVS0OmIj2HNXCHePwnYA', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7Lkdg8EjGrOAk5lomibficZjGbHiccwOpV4mdWSlPW837dKiaM2YEuYv7UaQiaewB5mhL2OQ7vJw26zEq8/0', '0', '', '110.188.73.35', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1494758907', '', '', null);
INSERT INTO `qm_user` VALUES ('98', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj6MbW3l5fgRMNZPgHaSvOBXXDlxtFIMDNNDATIVSfXMkDH6oAO5icmI4w0dSRBjbEX8Z20fy4MWTpg/0', 'a53e213862bfcbbe6116ebbeca8129b7', '1495545244', '1', '', '小巩妈', '', '', '', '', '', '', '3', '小巩妈', 'okD3uvwL1CNOY5-jU3yoEmXP_7xA', '1', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj6MbW3l5fgRMNZPgHaSvOBXXDlxtFIMDNNDATIVSfXMkDH6oAO5icmI4w0dSRBjbEX8Z20fy4MWTpg/0', '0', '', '110.184.11.190', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1495545244', '', '', null);
INSERT INTO `qm_user` VALUES ('99', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGfhB9p8vy7F6CACpHlFyRM3EFx4OAYGR0iaxhxg6TKcMpJMsX9biaXMhzu4eqHHD7dKg5hKOJ0Fc8Tro5eVFd4vOI/0', '7f9bfc5b5886895f468c76a21484e00d', '1495769020', '1', '', 'QQ', '', '', '', '', '', '', '3', 'QQ', 'okD3uv7OYVC3Wdm2bDOQpMwvkwho', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGfhB9p8vy7F6CACpHlFyRM3EFx4OAYGR0iaxhxg6TKcMpJMsX9biaXMhzu4eqHHD7dKg5hKOJ0Fc8Tro5eVFd4vOI/0', '0', '', '110.184.66.22', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1495769020', '', '', null);
INSERT INTO `qm_user` VALUES ('100', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LqnnJhFAPCnJD10mPeYvmFpAa84faZRfmKxSUfeH8iah5hVJc28ynPePF68wSHKysfQ7TpPzAEYGh/0', 'a8beae27655595ed8c51bddb8cfc5e97', '1495887850', '1', '', '缘分天空', '', '', '', '', '', '', '3', '缘分天空', 'okD3uv_K3MTLJFeMa0h11DRc4njI', '1', 'http://wx.qlogo.cn/mmopen/jDe4HHcjFGeF871Dtvo7LqnnJhFAPCnJD10mPeYvmFpAa84faZRfmKxSUfeH8iah5hVJc28ynPePF68wSHKysfQ7TpPzAEYGh/0', '0', '', '14.120.90.50', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1495887850', '', '', null);
INSERT INTO `qm_user` VALUES ('101', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIEicUxwo1uop926M50Kend7uZDY922XPibeUtqhJjEOYwCwicuFxAydjU6shRiarNcicgdZrvicZNWovfZS/0', '023b4e47aec42a27b56fdbca4adeaa00', '1496065276', '1', '', '钟麟', '', '', '', '', '', '', '3', '钟麟', 'okD3uv2s6N4G3QiD1ilJoG3jtc68', '1', 'http://wx.qlogo.cn/mmopen/stUmxk5gd5VXAH6LqzqIEicUxwo1uop926M50Kend7uZDY922XPibeUtqhJjEOYwCwicuFxAydjU6shRiarNcicgdZrvicZNWovfZS/0', '0', '', '182.128.15.137', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1496065276', '', '', null);
INSERT INTO `qm_user` VALUES ('102', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM46oIhSicUqrxwmU1mCFrp5VuD4Bt0BrqWfB4YLEaS7gzfPkkQiaNhniarnnUqFdibjpb8vicKfkyQyah0Bzf2H1Nxgu8VnYt8vSyaI/0', 'cac19d8e44d5566003d7ecb37697ee13', '1497407126', '1', '', '山水', '', '', '', '', '', '', '3', '山水', 'okD3uv06gJ91gQvoSkelspjEDH7E', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM46oIhSicUqrxwmU1mCFrp5VuD4Bt0BrqWfB4YLEaS7gzfPkkQiaNhniarnnUqFdibjpb8vicKfkyQyah0Bzf2H1Nxgu8VnYt8vSyaI/0', '0', '', '125.70.59.64', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1497407126', '', '', null);
INSERT INTO `qm_user` VALUES ('103', '', '0', '', '', null, '4f74c3218ff97c494795cea8d2f10a40', '1498533302', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uvwVxUBkTs1YbjPnxZLkFukQ', '0', null, '0', '', '110.185.17.125', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1498533302', '', '', null);
INSERT INTO `qm_user` VALUES ('104', '', '0', '', '', 'http://wx.qlogo.cn/mmopen/sxvMSKHEibMqGrW8SgdGl382g6akgGOrtJhe2y9hAxhJsm5QBgpymFEf76xMtoW3lOcfRQRQvQibSWWVMsj3ArMDooSUsGPpqb/0', '2aab43c9a850481ce1a976a22f3fc8ae', '1498734371', '1', '', 'H', '', '', '', '', '', '', '3', 'H', 'okD3uv5aTmQB_H1D4edBXmE7p-ro', '1', 'http://wx.qlogo.cn/mmopen/sxvMSKHEibMqGrW8SgdGl382g6akgGOrtJhe2y9hAxhJsm5QBgpymFEf76xMtoW3lOcfRQRQvQibSWWVMsj3ArMDooSUsGPpqb/0', '0', '', '117.174.31.202', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1498734371', '', '', null);
INSERT INTO `qm_user` VALUES ('105', '', '0', '', '', null, '12a5a679dc60895954b6ac8321f5411a', '1499589482', '1', '', null, '', '', '', '', '', '', '3', null, 'okD3uv66yAkw0-4wPk9WhgORbhGM', '0', null, '0', '', '120.85.77.142', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '1499589482', '', '', null);
INSERT INTO `qm_user` VALUES ('106', 'testaa', '0', '', 'test@qq.com', '/user/1494/u_1494.jpg', 'fdefad5a0224746e83ee2fcf2b6767ac', '1500716483', '1', '李先生', 'a2a5s2', '江西省,上饶市,玉亭镇', '2017-07-26', 'asdfasdfasdfasdfasdf', '', '', '', '', '', '', '0', '', '0', '男', '120.85.77.79', '0', '0', '13512345678', '', '', '', '', '', '', '', '', '', '', '0', null, null, '');

-- ----------------------------
-- Table structure for `qm_view`
-- ----------------------------
DROP TABLE IF EXISTS `qm_view`;
CREATE TABLE `qm_view` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sid` int(8) DEFAULT '0' COMMENT '商家id',
  `uid` bigint(11) DEFAULT '0',
  `pid` bigint(11) DEFAULT '0',
  `lasttime` int(11) DEFAULT '0' COMMENT '最后浏览时间',
  `addtime` bigint(11) DEFAULT '0',
  `del` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=722 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_view
-- ----------------------------
INSERT INTO `qm_view` VALUES ('1', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('2', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('3', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('4', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('5', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('6', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('7', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('8', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('9', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('10', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('11', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('12', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('13', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('14', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('15', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('16', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('17', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('18', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('19', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('20', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('21', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('22', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('23', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('24', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('25', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('26', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('27', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('28', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('29', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('30', '0', '8', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('31', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('32', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('33', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('34', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('35', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('36', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('37', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('38', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('39', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('40', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('41', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('42', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('43', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('44', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('45', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('46', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('47', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('48', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('49', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('50', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('51', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('52', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('53', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('54', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('55', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('56', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('57', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('58', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('59', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('60', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('61', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('62', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('63', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('64', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('65', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('66', '0', '13', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('67', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('68', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('69', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('70', '0', '13', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('71', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('72', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('73', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('74', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('75', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('76', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('77', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('78', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('79', '0', '13', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('80', '0', '13', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('81', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('82', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('83', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('84', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('85', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('86', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('87', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('88', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('89', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('90', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('91', '0', '9', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('92', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('93', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('94', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('95', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('96', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('97', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('98', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('99', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('100', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('101', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('102', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('103', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('104', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('105', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('106', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('107', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('108', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('109', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('110', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('111', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('112', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('113', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('114', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('115', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('116', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('117', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('118', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('119', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('120', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('121', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('122', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('123', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('124', '0', '9', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('125', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('126', '0', '13', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('127', '0', '13', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('128', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('129', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('130', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('131', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('132', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('133', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('134', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('135', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('136', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('137', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('138', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('139', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('140', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('141', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('142', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('143', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('144', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('145', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('146', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('147', '0', '6', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('148', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('149', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('150', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('151', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('152', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('153', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('154', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('155', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('156', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('157', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('158', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('159', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('160', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('161', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('162', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('163', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('164', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('165', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('166', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('167', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('168', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('169', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('170', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('171', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('172', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('173', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('174', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('175', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('176', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('177', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('178', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('179', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('180', '0', '9', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('181', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('182', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('183', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('184', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('185', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('186', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('187', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('188', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('189', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('190', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('191', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('192', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('193', '0', '9', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('194', '0', '9', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('195', '0', '9', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('196', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('197', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('198', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('199', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('200', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('201', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('202', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('203', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('204', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('205', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('206', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('207', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('208', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('209', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('210', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('211', '0', '3', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('212', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('213', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('214', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('215', '0', '17', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('216', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('217', '0', '17', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('218', '0', '17', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('219', '0', '17', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('220', '0', '17', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('221', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('222', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('223', '0', '17', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('224', '0', '17', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('225', '0', '17', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('226', '0', '17', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('227', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('228', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('229', '0', '17', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('230', '0', '17', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('231', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('232', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('233', '0', '17', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('234', '0', '17', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('235', '0', '17', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('236', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('237', '0', '17', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('238', '0', '17', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('239', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('240', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('241', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('242', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('243', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('244', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('245', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('246', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('247', '0', '17', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('248', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('249', '0', '17', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('250', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('251', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('252', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('253', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('254', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('255', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('256', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('257', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('258', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('259', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('260', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('261', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('262', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('263', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('264', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('265', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('266', '0', '9', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('267', '0', '9', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('268', '0', '9', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('269', '0', '9', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('270', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('271', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('272', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('273', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('274', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('275', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('276', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('277', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('278', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('279', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('280', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('281', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('282', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('283', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('284', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('285', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('286', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('287', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('288', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('289', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('290', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('291', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('292', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('293', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('294', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('295', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('296', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('297', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('298', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('299', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('300', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('301', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('302', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('303', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('304', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('305', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('306', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('307', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('308', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('309', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('310', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('311', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('312', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('313', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('314', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('315', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('316', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('317', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('318', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('319', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('320', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('321', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('322', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('323', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('324', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('325', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('326', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('327', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('328', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('329', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('330', '0', '7', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('331', '0', '7', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('332', '0', '7', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('333', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('334', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('335', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('336', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('337', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('338', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('339', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('340', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('341', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('342', '0', '3', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('343', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('344', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('345', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('346', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('347', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('348', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('349', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('350', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('351', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('352', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('353', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('354', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('355', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('356', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('357', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('358', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('359', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('360', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('361', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('362', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('363', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('364', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('365', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('366', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('367', '0', '3', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('368', '0', '7', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('369', '0', '7', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('370', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('371', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('372', '0', '21', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('373', '0', '21', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('374', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('375', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('376', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('377', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('378', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('379', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('380', '0', '1', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('381', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('382', '0', '1', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('383', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('384', '0', '1', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('385', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('386', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('387', '0', '1', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('388', '0', '1', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('389', '0', '1', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('390', '0', '1', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('391', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('392', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('393', '0', '1', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('394', '0', '1', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('395', '0', '1', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('396', '0', '7', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('397', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('398', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('399', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('400', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('401', '0', '3', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('402', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('403', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('404', '0', '3', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('405', '0', '3', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('406', '0', '3', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('407', '0', '3', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('408', '0', '3', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('409', '0', '28', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('410', '0', '28', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('411', '0', '28', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('412', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('413', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('414', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('415', '0', '30', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('416', '0', '30', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('417', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('418', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('419', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('420', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('421', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('422', '0', '29', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('423', '0', '29', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('424', '0', '29', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('425', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('426', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('427', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('428', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('429', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('430', '0', '29', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('431', '0', '29', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('432', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('433', '0', '30', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('434', '0', '33', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('435', '0', '35', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('436', '0', '36', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('437', '0', '32', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('438', '0', '28', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('439', '0', '28', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('440', '0', '28', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('441', '0', '28', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('442', '0', '28', '26', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('443', '0', '28', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('444', '0', '32', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('445', '0', '30', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('446', '0', '30', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('447', '0', '44', '25', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('448', '0', '44', '25', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('449', '0', '38', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('450', '0', '38', '26', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('451', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('452', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('453', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('454', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('455', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('456', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('457', '0', '32', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('458', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('459', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('460', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('461', '0', '30', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('462', '0', '46', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('463', '0', '46', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('464', '0', '48', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('465', '0', '48', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('466', '0', '48', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('467', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('468', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('469', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('470', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('471', '0', '51', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('472', '0', '51', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('473', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('474', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('475', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('476', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('477', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('478', '0', '49', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('479', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('480', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('481', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('482', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('483', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('484', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('485', '0', '53', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('486', '0', '53', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('487', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('488', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('489', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('490', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('491', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('492', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('493', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('494', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('495', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('496', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('497', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('498', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('499', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('500', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('501', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('502', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('503', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('504', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('505', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('506', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('507', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('508', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('509', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('510', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('511', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('512', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('513', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('514', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('515', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('516', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('517', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('518', '0', '28', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('519', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('520', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('521', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('522', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('523', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('524', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('525', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('526', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('527', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('528', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('529', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('530', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('531', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('532', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('533', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('534', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('535', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('536', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('537', '0', '28', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('538', '0', '28', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('539', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('540', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('541', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('542', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('543', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('544', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('545', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('546', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('547', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('548', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('549', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('550', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('551', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('552', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('553', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('554', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('555', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('556', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('557', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('558', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('559', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('560', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('561', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('562', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('563', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('564', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('565', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('566', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('567', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('568', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('569', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('570', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('571', '0', '38', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('572', '0', '32', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('573', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('574', '0', '28', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('575', '0', '28', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('576', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('577', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('578', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('579', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('580', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('581', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('582', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('583', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('584', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('585', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('586', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('587', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('588', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('589', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('590', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('591', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('592', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('593', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('594', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('595', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('596', '0', '32', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('597', '0', '32', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('598', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('599', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('600', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('601', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('602', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('603', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('604', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('605', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('606', '0', '32', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('607', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('608', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('609', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('610', '0', '32', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('611', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('612', '0', '38', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('613', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('614', '0', '32', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('615', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('616', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('617', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('618', '0', '38', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('619', '0', '38', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('620', '0', '32', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('621', '0', '32', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('622', '0', '56', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('623', '0', '57', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('624', '0', '58', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('625', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('626', '0', '62', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('627', '0', '62', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('628', '0', '44', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('629', '0', '44', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('630', '0', '44', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('631', '0', '44', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('632', '0', '44', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('633', '0', '44', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('634', '0', '44', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('635', '0', '44', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('636', '0', '44', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('637', '0', '62', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('638', '0', '62', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('639', '0', '38', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('640', '0', '34', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('641', '0', '34', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('642', '0', '34', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('643', '0', '67', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('644', '0', '67', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('645', '0', '40', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('646', '0', '40', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('647', '0', '40', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('648', '0', '72', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('649', '0', '72', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('650', '0', '73', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('651', '0', '73', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('652', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('653', '0', '32', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('654', '0', '32', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('655', '0', '28', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('656', '0', '34', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('657', '0', '34', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('658', '0', '75', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('659', '0', '34', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('660', '0', '83', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('661', '0', '83', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('662', '0', '83', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('663', '0', '83', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('664', '0', '83', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('665', '0', '85', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('666', '0', '85', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('667', '0', '85', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('668', '0', '87', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('669', '0', '89', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('670', '0', '90', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('671', '0', '90', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('672', '0', '91', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('673', '0', '93', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('674', '0', '93', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('675', '0', '93', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('676', '0', '93', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('677', '0', '93', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('678', '0', '92', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('679', '0', '92', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('680', '0', '93', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('681', '0', '93', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('682', '0', '94', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('683', '0', '88', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('684', '0', '34', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('685', '0', '34', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('686', '0', '34', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('687', '0', '98', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('688', '0', '100', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('689', '0', '101', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('690', '0', '73', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('691', '0', '30', '2', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('692', '0', '30', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('693', '0', '105', '1', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('694', '0', '106', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('695', '0', '106', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('696', '0', '106', '24', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('697', '0', '106', '24', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('698', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('699', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('700', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('701', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('702', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('703', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('704', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('705', '0', '106', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('706', '0', '106', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('707', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('708', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('709', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('710', '0', '106', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('711', '0', '106', '2', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('712', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('713', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('714', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('715', '0', '106', '56', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('716', '0', '106', '56', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('717', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('718', '0', '106', '57', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('719', '0', '106', '57', '0', '0', '0');
INSERT INTO `qm_view` VALUES ('720', '0', '106', '1', '0', '0', '1');
INSERT INTO `qm_view` VALUES ('721', '0', '106', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `qm_views`
-- ----------------------------
DROP TABLE IF EXISTS `qm_views`;
CREATE TABLE `qm_views` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) DEFAULT '',
  `addtime` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_views
-- ----------------------------
INSERT INTO `qm_views` VALUES ('1', '118.116.90.164', '1486781182');
INSERT INTO `qm_views` VALUES ('2', '120.85.77.117', '1501123677');

-- ----------------------------
-- Table structure for `qm_websms`
-- ----------------------------
DROP TABLE IF EXISTS `qm_websms`;
CREATE TABLE `qm_websms` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT '0' COMMENT '会员id(接收者)',
  `fid` bigint(11) DEFAULT '0' COMMENT '发送者id',
  `type` smallint(2) DEFAULT '0' COMMENT '消息类型 1注册消息 2发货消息 3生日消息 0系统推送消息等等',
  `ip` varchar(50) DEFAULT '',
  `content` longtext,
  `addtime` bigint(11) DEFAULT '0' COMMENT '发送时间',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `audit` smallint(1) DEFAULT '0' COMMENT '是否审核',
  `view` smallint(1) DEFAULT '0' COMMENT '是否查看 默认为未查看',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_websms
-- ----------------------------
INSERT INTO `qm_websms` VALUES ('1', '29', '0', '1', '171.88.9.100', '尊敬的会员您好！恭喜您成为土特土会员，在这里您将买到放心、优质、正宗的土特产品。有任何疑问请联系我们哟~', '1480493231', '1', '1', '0');
INSERT INTO `qm_websms` VALUES ('2', '32', '0', '1', '118.113.40.86', '尊敬的会员您好！恭喜您成为土特土会员，在这里您将买到放心、优质、正宗的土特产品。有任何疑问请联系我们哟~', '1480908202', '1', '1', '1');
INSERT INTO `qm_websms` VALUES ('3', '28', '0', '0', '110.184.38.184', 'ghhghgytyk', '1481447630', '1', '1', '1');
INSERT INTO `qm_websms` VALUES ('4', '32', '0', '0', '118.113.43.1', '你好！请记得收货，', '1483515510', '1', '1', '1');
INSERT INTO `qm_websms` VALUES ('5', '62', '0', '1', '118.26.157.102', '尊敬的会员，恭喜您成为土特土商城会员，祝您购物愉快！', '1484270581', '0', '1', '1');
INSERT INTO `qm_websms` VALUES ('6', '83', '0', '1', '39.67.131.186', '尊敬的会员，恭喜您成为土特土商城会员，祝您购物愉快！', '1491040208', '0', '1', '1');
INSERT INTO `qm_websms` VALUES ('7', '106', '0', '1', '120.85.77.79', '尊敬的会员，恭喜您成为土特土商城会员，祝您购物愉快！', '1500716483', '0', '1', '1');

-- ----------------------------
-- Table structure for `qm_work`
-- ----------------------------
DROP TABLE IF EXISTS `qm_work`;
CREATE TABLE `qm_work` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `addtime` bigint(11) DEFAULT '0',
  `audit` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_work
-- ----------------------------
INSERT INTO `qm_work` VALUES ('1', '1473738096', '0');
INSERT INTO `qm_work` VALUES ('2', '1473738806', '1');
INSERT INTO `qm_work` VALUES ('3', '1473782910', '1');
INSERT INTO `qm_work` VALUES ('4', '1473869071', '1');
INSERT INTO `qm_work` VALUES ('5', '1473955355', '1');
INSERT INTO `qm_work` VALUES ('6', '1474041963', '1');
INSERT INTO `qm_work` VALUES ('7', '1474129249', '1');
INSERT INTO `qm_work` VALUES ('8', '1474218382', '1');
INSERT INTO `qm_work` VALUES ('9', '1474302734', '1');
INSERT INTO `qm_work` VALUES ('10', '1474388161', '1');
INSERT INTO `qm_work` VALUES ('11', '1474477839', '1');
INSERT INTO `qm_work` VALUES ('12', '1474560492', '1');
INSERT INTO `qm_work` VALUES ('13', '1474651621', '1');
INSERT INTO `qm_work` VALUES ('14', '1474733071', '1');
INSERT INTO `qm_work` VALUES ('15', '1474819616', '1');
INSERT INTO `qm_work` VALUES ('16', '1474909652', '1');
INSERT INTO `qm_work` VALUES ('17', '1474992223', '1');
INSERT INTO `qm_work` VALUES ('18', '1475078471', '1');
INSERT INTO `qm_work` VALUES ('19', '1475167796', '1');
INSERT INTO `qm_work` VALUES ('20', '1475251371', '1');
INSERT INTO `qm_work` VALUES ('21', '1475339448', '1');
INSERT INTO `qm_work` VALUES ('22', '1475426964', '1');
INSERT INTO `qm_work` VALUES ('23', '1475510762', '1');
INSERT INTO `qm_work` VALUES ('24', '1475596819', '1');
INSERT INTO `qm_work` VALUES ('25', '1475686268', '1');
INSERT INTO `qm_work` VALUES ('26', '1475770060', '1');
INSERT INTO `qm_work` VALUES ('27', '1475858864', '1');
INSERT INTO `qm_work` VALUES ('28', '1475942616', '1');
INSERT INTO `qm_work` VALUES ('29', '1476032410', '1');
INSERT INTO `qm_work` VALUES ('30', '1476116832', '1');
INSERT INTO `qm_work` VALUES ('31', '1476204852', '1');
INSERT INTO `qm_work` VALUES ('32', '1476289769', '1');
INSERT INTO `qm_work` VALUES ('33', '1476374622', '1');
INSERT INTO `qm_work` VALUES ('34', '1476461032', '1');
INSERT INTO `qm_work` VALUES ('35', '1476549794', '1');
INSERT INTO `qm_work` VALUES ('36', '1476634809', '1');
INSERT INTO `qm_work` VALUES ('37', '1476720396', '1');
INSERT INTO `qm_work` VALUES ('38', '1476807188', '1');
INSERT INTO `qm_work` VALUES ('39', '1476893566', '1');
INSERT INTO `qm_work` VALUES ('40', '1476980067', '1');
INSERT INTO `qm_work` VALUES ('41', '1477066606', '1');
INSERT INTO `qm_work` VALUES ('42', '1477152294', '1');
INSERT INTO `qm_work` VALUES ('43', '1477239205', '1');
INSERT INTO `qm_work` VALUES ('44', '1477325299', '1');
INSERT INTO `qm_work` VALUES ('45', '1477412738', '1');
INSERT INTO `qm_work` VALUES ('46', '1477499278', '1');
INSERT INTO `qm_work` VALUES ('47', '1477584187', '1');
INSERT INTO `qm_work` VALUES ('48', '1477671525', '1');
INSERT INTO `qm_work` VALUES ('49', '1477756801', '1');
INSERT INTO `qm_work` VALUES ('50', '1477845327', '1');
INSERT INTO `qm_work` VALUES ('51', '1477930502', '1');
INSERT INTO `qm_work` VALUES ('52', '1478016073', '1');
INSERT INTO `qm_work` VALUES ('53', '1478103309', '1');
INSERT INTO `qm_work` VALUES ('54', '1478189868', '1');
INSERT INTO `qm_work` VALUES ('55', '1478276124', '1');
INSERT INTO `qm_work` VALUES ('56', '1478362687', '1');
INSERT INTO `qm_work` VALUES ('57', '1478448992', '1');
INSERT INTO `qm_work` VALUES ('58', '1478535203', '1');
INSERT INTO `qm_work` VALUES ('59', '1478620948', '1');
INSERT INTO `qm_work` VALUES ('60', '1478708117', '1');
INSERT INTO `qm_work` VALUES ('61', '1478795088', '1');
INSERT INTO `qm_work` VALUES ('62', '1478881231', '1');
INSERT INTO `qm_work` VALUES ('63', '1478969858', '1');
INSERT INTO `qm_work` VALUES ('64', '1479053407', '1');
INSERT INTO `qm_work` VALUES ('65', '1479140686', '1');
INSERT INTO `qm_work` VALUES ('66', '1479226632', '1');
INSERT INTO `qm_work` VALUES ('67', '1479312641', '1');
INSERT INTO `qm_work` VALUES ('68', '1479398934', '1');
INSERT INTO `qm_work` VALUES ('69', '1479486096', '1');
INSERT INTO `qm_work` VALUES ('70', '1479572294', '1');
INSERT INTO `qm_work` VALUES ('71', '1479658698', '1');
INSERT INTO `qm_work` VALUES ('72', '1479745050', '1');
INSERT INTO `qm_work` VALUES ('73', '1479830636', '1');
INSERT INTO `qm_work` VALUES ('74', '1479918539', '1');
INSERT INTO `qm_work` VALUES ('75', '1480004861', '1');
INSERT INTO `qm_work` VALUES ('76', '1480091739', '1');
INSERT INTO `qm_work` VALUES ('77', '1480176049', '1');
INSERT INTO `qm_work` VALUES ('78', '1480263145', '1');
INSERT INTO `qm_work` VALUES ('79', '1480349971', '1');
INSERT INTO `qm_work` VALUES ('80', '1480435216', '1');
INSERT INTO `qm_work` VALUES ('81', '1480521788', '1');
INSERT INTO `qm_work` VALUES ('82', '1480608374', '1');
INSERT INTO `qm_work` VALUES ('83', '1480694976', '1');
INSERT INTO `qm_work` VALUES ('84', '1480780955', '1');
INSERT INTO `qm_work` VALUES ('85', '1480868483', '1');
INSERT INTO `qm_work` VALUES ('86', '1480954829', '1');
INSERT INTO `qm_work` VALUES ('87', '1481041669', '1');
INSERT INTO `qm_work` VALUES ('88', '1481041669', '1');
INSERT INTO `qm_work` VALUES ('89', '1481126459', '1');
INSERT INTO `qm_work` VALUES ('90', '1481214154', '1');
INSERT INTO `qm_work` VALUES ('91', '1481299793', '1');
INSERT INTO `qm_work` VALUES ('92', '1481387921', '1');
INSERT INTO `qm_work` VALUES ('93', '1481472558', '1');
INSERT INTO `qm_work` VALUES ('94', '1481558829', '1');
INSERT INTO `qm_work` VALUES ('95', '1481645119', '1');
INSERT INTO `qm_work` VALUES ('96', '1481731688', '1');
INSERT INTO `qm_work` VALUES ('97', '1481818443', '1');
INSERT INTO `qm_work` VALUES ('98', '1481904439', '1');
INSERT INTO `qm_work` VALUES ('99', '1481990645', '1');
INSERT INTO `qm_work` VALUES ('100', '1482076955', '1');
INSERT INTO `qm_work` VALUES ('101', '1482163744', '1');
INSERT INTO `qm_work` VALUES ('102', '1482250368', '1');
INSERT INTO `qm_work` VALUES ('103', '1482336009', '1');
INSERT INTO `qm_work` VALUES ('104', '1482422558', '1');
INSERT INTO `qm_work` VALUES ('105', '1482508825', '1');
INSERT INTO `qm_work` VALUES ('106', '1482595954', '1');
INSERT INTO `qm_work` VALUES ('107', '1482682237', '1');
INSERT INTO `qm_work` VALUES ('108', '1482768809', '1');
INSERT INTO `qm_work` VALUES ('109', '1482855910', '1');
INSERT INTO `qm_work` VALUES ('110', '1482942664', '1');
INSERT INTO `qm_work` VALUES ('111', '1483027797', '1');
INSERT INTO `qm_work` VALUES ('112', '1483114262', '1');
INSERT INTO `qm_work` VALUES ('113', '1483201181', '1');
INSERT INTO `qm_work` VALUES ('114', '1483286783', '1');
INSERT INTO `qm_work` VALUES ('115', '1483373096', '1');
INSERT INTO `qm_work` VALUES ('116', '1483459827', '1');
INSERT INTO `qm_work` VALUES ('117', '1483547006', '1');
INSERT INTO `qm_work` VALUES ('118', '1483632887', '1');
INSERT INTO `qm_work` VALUES ('119', '1483718454', '1');
INSERT INTO `qm_work` VALUES ('120', '1483806838', '1');
INSERT INTO `qm_work` VALUES ('121', '1483892086', '1');
INSERT INTO `qm_work` VALUES ('122', '1483978810', '1');
INSERT INTO `qm_work` VALUES ('123', '1484064104', '1');
INSERT INTO `qm_work` VALUES ('124', '1484151610', '1');
INSERT INTO `qm_work` VALUES ('125', '1484237064', '1');
INSERT INTO `qm_work` VALUES ('126', '1484323339', '1');
INSERT INTO `qm_work` VALUES ('127', '1484410530', '1');
INSERT INTO `qm_work` VALUES ('128', '1484497412', '1');
INSERT INTO `qm_work` VALUES ('129', '1484583757', '1');
INSERT INTO `qm_work` VALUES ('130', '1484670160', '1');
INSERT INTO `qm_work` VALUES ('131', '1484756101', '1');
INSERT INTO `qm_work` VALUES ('132', '1484841881', '1');
INSERT INTO `qm_work` VALUES ('133', '1484928501', '1');
INSERT INTO `qm_work` VALUES ('134', '1485015662', '1');
INSERT INTO `qm_work` VALUES ('135', '1485100996', '1');
INSERT INTO `qm_work` VALUES ('136', '1485187274', '1');
INSERT INTO `qm_work` VALUES ('137', '1485274667', '1');
INSERT INTO `qm_work` VALUES ('138', '1485360094', '1');
INSERT INTO `qm_work` VALUES ('139', '1485447000', '1');
INSERT INTO `qm_work` VALUES ('140', '1485533252', '1');
INSERT INTO `qm_work` VALUES ('141', '1485620291', '1');
INSERT INTO `qm_work` VALUES ('142', '1485705716', '1');
INSERT INTO `qm_work` VALUES ('143', '1485795063', '1');
INSERT INTO `qm_work` VALUES ('144', '1485878911', '1');
INSERT INTO `qm_work` VALUES ('145', '1485965777', '1');
INSERT INTO `qm_work` VALUES ('146', '1486051646', '1');
INSERT INTO `qm_work` VALUES ('147', '1486137749', '1');
INSERT INTO `qm_work` VALUES ('148', '1486224445', '1');
INSERT INTO `qm_work` VALUES ('149', '1486312367', '1');
INSERT INTO `qm_work` VALUES ('150', '1486312367', '1');
INSERT INTO `qm_work` VALUES ('151', '1486396883', '1');
INSERT INTO `qm_work` VALUES ('152', '1486484092', '1');
INSERT INTO `qm_work` VALUES ('153', '1486569902', '1');
INSERT INTO `qm_work` VALUES ('154', '1486656044', '1');
INSERT INTO `qm_work` VALUES ('155', '1486743186', '1');
INSERT INTO `qm_work` VALUES ('156', '1486829684', '1');
INSERT INTO `qm_work` VALUES ('157', '1486916456', '1');
INSERT INTO `qm_work` VALUES ('158', '1487001916', '1');
INSERT INTO `qm_work` VALUES ('159', '1487001916', '1');
INSERT INTO `qm_work` VALUES ('160', '1487088242', '1');
INSERT INTO `qm_work` VALUES ('161', '1487175189', '1');
INSERT INTO `qm_work` VALUES ('162', '1487260859', '1');
INSERT INTO `qm_work` VALUES ('163', '1487349252', '1');
INSERT INTO `qm_work` VALUES ('164', '1487349252', '1');
INSERT INTO `qm_work` VALUES ('165', '1487349252', '1');
INSERT INTO `qm_work` VALUES ('166', '1487349252', '1');
INSERT INTO `qm_work` VALUES ('167', '1487434389', '1');
INSERT INTO `qm_work` VALUES ('168', '1487520741', '1');
INSERT INTO `qm_work` VALUES ('169', '1487606964', '1');
INSERT INTO `qm_work` VALUES ('170', '1487692870', '1');
INSERT INTO `qm_work` VALUES ('171', '1487781136', '1');
INSERT INTO `qm_work` VALUES ('172', '1487781136', '1');
INSERT INTO `qm_work` VALUES ('173', '1487865627', '1');
INSERT INTO `qm_work` VALUES ('174', '1487952545', '1');
INSERT INTO `qm_work` VALUES ('175', '1488039514', '1');
INSERT INTO `qm_work` VALUES ('176', '1488125497', '1');
INSERT INTO `qm_work` VALUES ('177', '1488211254', '1');
INSERT INTO `qm_work` VALUES ('178', '1488297628', '1');
INSERT INTO `qm_work` VALUES ('179', '1488384104', '1');
INSERT INTO `qm_work` VALUES ('180', '1488471274', '1');
INSERT INTO `qm_work` VALUES ('181', '1488557370', '1');
INSERT INTO `qm_work` VALUES ('182', '1488643479', '1');
INSERT INTO `qm_work` VALUES ('183', '1488730684', '1');
INSERT INTO `qm_work` VALUES ('184', '1488817004', '1');
INSERT INTO `qm_work` VALUES ('185', '1488902429', '1');
INSERT INTO `qm_work` VALUES ('186', '1488989087', '1');
INSERT INTO `qm_work` VALUES ('187', '1489075640', '1');
INSERT INTO `qm_work` VALUES ('188', '1489161758', '1');
INSERT INTO `qm_work` VALUES ('189', '1489248006', '1');
INSERT INTO `qm_work` VALUES ('190', '1489335233', '1');
INSERT INTO `qm_work` VALUES ('191', '1489422548', '1');
INSERT INTO `qm_work` VALUES ('192', '1489511431', '1');
INSERT INTO `qm_work` VALUES ('193', '1489595308', '1');
INSERT INTO `qm_work` VALUES ('194', '1489681346', '1');
INSERT INTO `qm_work` VALUES ('195', '1489766961', '1');
INSERT INTO `qm_work` VALUES ('196', '1489853025', '1');
INSERT INTO `qm_work` VALUES ('197', '1489940311', '1');
INSERT INTO `qm_work` VALUES ('198', '1490026214', '1');
INSERT INTO `qm_work` VALUES ('199', '1490112643', '1');
INSERT INTO `qm_work` VALUES ('200', '1490198663', '1');
INSERT INTO `qm_work` VALUES ('201', '1490198663', '1');
INSERT INTO `qm_work` VALUES ('202', '1490285370', '1');
INSERT INTO `qm_work` VALUES ('203', '1490371297', '1');
INSERT INTO `qm_work` VALUES ('204', '1490457845', '1');
INSERT INTO `qm_work` VALUES ('205', '1490544108', '1');
INSERT INTO `qm_work` VALUES ('206', '1490630805', '1');
INSERT INTO `qm_work` VALUES ('207', '1490718643', '1');
INSERT INTO `qm_work` VALUES ('208', '1490803482', '1');
INSERT INTO `qm_work` VALUES ('209', '1490889884', '1');
INSERT INTO `qm_work` VALUES ('210', '1490976457', '1');
INSERT INTO `qm_work` VALUES ('211', '1491063592', '1');
INSERT INTO `qm_work` VALUES ('212', '1491153445', '1');
INSERT INTO `qm_work` VALUES ('213', '1491237576', '1');
INSERT INTO `qm_work` VALUES ('214', '1491322382', '1');
INSERT INTO `qm_work` VALUES ('215', '1491408503', '1');
INSERT INTO `qm_work` VALUES ('216', '1491494528', '1');
INSERT INTO `qm_work` VALUES ('217', '1491581039', '1');
INSERT INTO `qm_work` VALUES ('218', '1491669223', '1');
INSERT INTO `qm_work` VALUES ('219', '1491754768', '1');
INSERT INTO `qm_work` VALUES ('220', '1491841665', '1');
INSERT INTO `qm_work` VALUES ('221', '1491926606', '1');
INSERT INTO `qm_work` VALUES ('222', '1492013224', '1');
INSERT INTO `qm_work` VALUES ('223', '1492099436', '1');
INSERT INTO `qm_work` VALUES ('224', '1492185885', '1');
INSERT INTO `qm_work` VALUES ('225', '1492272218', '1');
INSERT INTO `qm_work` VALUES ('226', '1492359552', '1');
INSERT INTO `qm_work` VALUES ('227', '1492445635', '1');
INSERT INTO `qm_work` VALUES ('228', '1492531349', '1');
INSERT INTO `qm_work` VALUES ('229', '1492617618', '1');
INSERT INTO `qm_work` VALUES ('230', '1492704174', '1');
INSERT INTO `qm_work` VALUES ('231', '1492790591', '1');
INSERT INTO `qm_work` VALUES ('232', '1492877189', '1');
INSERT INTO `qm_work` VALUES ('233', '1492877189', '1');
INSERT INTO `qm_work` VALUES ('234', '1492963217', '1');
INSERT INTO `qm_work` VALUES ('235', '1493050530', '1');
INSERT INTO `qm_work` VALUES ('236', '1493136240', '1');
INSERT INTO `qm_work` VALUES ('237', '1493225993', '1');
INSERT INTO `qm_work` VALUES ('238', '1493308854', '1');
INSERT INTO `qm_work` VALUES ('239', '1493395857', '1');
INSERT INTO `qm_work` VALUES ('240', '1493482439', '1');
INSERT INTO `qm_work` VALUES ('241', '1493568452', '1');
INSERT INTO `qm_work` VALUES ('242', '1493654860', '1');
INSERT INTO `qm_work` VALUES ('243', '1493740911', '1');
INSERT INTO `qm_work` VALUES ('244', '1493827372', '1');
INSERT INTO `qm_work` VALUES ('245', '1493913978', '1');
INSERT INTO `qm_work` VALUES ('246', '1494000610', '1');
INSERT INTO `qm_work` VALUES ('247', '1494086409', '1');
INSERT INTO `qm_work` VALUES ('248', '1494176593', '1');
INSERT INTO `qm_work` VALUES ('249', '1494266912', '1');
INSERT INTO `qm_work` VALUES ('250', '1494346039', '1');
INSERT INTO `qm_work` VALUES ('251', '1494437528', '1');
INSERT INTO `qm_work` VALUES ('252', '1494519456', '1');
INSERT INTO `qm_work` VALUES ('253', '1494611073', '1');
INSERT INTO `qm_work` VALUES ('254', '1494697807', '1');
INSERT INTO `qm_work` VALUES ('255', '1494782018', '1');
INSERT INTO `qm_work` VALUES ('256', '1494865777', '1');
INSERT INTO `qm_work` VALUES ('257', '1494950459', '1');
INSERT INTO `qm_work` VALUES ('258', '1495037249', '1');
INSERT INTO `qm_work` VALUES ('259', '1495125898', '1');
INSERT INTO `qm_work` VALUES ('260', '1495210024', '1');
INSERT INTO `qm_work` VALUES ('261', '1495302551', '1');
INSERT INTO `qm_work` VALUES ('262', '1495382547', '1');
INSERT INTO `qm_work` VALUES ('263', '1495476821', '1');
INSERT INTO `qm_work` VALUES ('264', '1495557500', '1');
INSERT INTO `qm_work` VALUES ('265', '1495557500', '1');
INSERT INTO `qm_work` VALUES ('266', '1495651029', '1');
INSERT INTO `qm_work` VALUES ('267', '1495728932', '1');
INSERT INTO `qm_work` VALUES ('268', '1495818022', '1');
INSERT INTO `qm_work` VALUES ('269', '1495901339', '1');
INSERT INTO `qm_work` VALUES ('270', '1495987710', '1');
INSERT INTO `qm_work` VALUES ('271', '1496073829', '1');
INSERT INTO `qm_work` VALUES ('272', '1496161298', '1');
INSERT INTO `qm_work` VALUES ('273', '1496255117', '1');
INSERT INTO `qm_work` VALUES ('274', '1496334162', '1');
INSERT INTO `qm_work` VALUES ('275', '1496419254', '1');
INSERT INTO `qm_work` VALUES ('276', '1496506577', '1');
INSERT INTO `qm_work` VALUES ('277', '1496599091', '1');
INSERT INTO `qm_work` VALUES ('278', '1496679570', '1');
INSERT INTO `qm_work` VALUES ('279', '1496765225', '1');
INSERT INTO `qm_work` VALUES ('280', '1496853481', '1');
INSERT INTO `qm_work` VALUES ('281', '1496940322', '1');
INSERT INTO `qm_work` VALUES ('282', '1497025214', '1');
INSERT INTO `qm_work` VALUES ('283', '1497110718', '1');
INSERT INTO `qm_work` VALUES ('284', '1497198549', '1');
INSERT INTO `qm_work` VALUES ('285', '1497283329', '1');
INSERT INTO `qm_work` VALUES ('286', '1497374565', '1');
INSERT INTO `qm_work` VALUES ('287', '1497456218', '1');
INSERT INTO `qm_work` VALUES ('288', '1497542695', '1');
INSERT INTO `qm_work` VALUES ('289', '1497628990', '1');
INSERT INTO `qm_work` VALUES ('290', '1497716340', '1');
INSERT INTO `qm_work` VALUES ('291', '1497801947', '1');
INSERT INTO `qm_work` VALUES ('292', '1497888109', '1');
INSERT INTO `qm_work` VALUES ('293', '1497974551', '1');
INSERT INTO `qm_work` VALUES ('294', '1498061051', '1');
INSERT INTO `qm_work` VALUES ('295', '1498147684', '1');
INSERT INTO `qm_work` VALUES ('296', '1498233692', '1');
INSERT INTO `qm_work` VALUES ('297', '1498321535', '1');
INSERT INTO `qm_work` VALUES ('298', '1498406407', '1');
INSERT INTO `qm_work` VALUES ('299', '1498493388', '1');
INSERT INTO `qm_work` VALUES ('300', '1498581631', '1');
INSERT INTO `qm_work` VALUES ('301', '1498667328', '1');
INSERT INTO `qm_work` VALUES ('302', '1498752032', '1');
INSERT INTO `qm_work` VALUES ('303', '1498752032', '1');
INSERT INTO `qm_work` VALUES ('304', '1498839420', '1');
INSERT INTO `qm_work` VALUES ('305', '1498926088', '1');
INSERT INTO `qm_work` VALUES ('306', '1499011719', '1');
INSERT INTO `qm_work` VALUES ('307', '1499098372', '1');
INSERT INTO `qm_work` VALUES ('308', '1499184653', '1');
INSERT INTO `qm_work` VALUES ('309', '1499272522', '1');
INSERT INTO `qm_work` VALUES ('310', '1499357899', '1');
INSERT INTO `qm_work` VALUES ('311', '1499443556', '1');
INSERT INTO `qm_work` VALUES ('312', '1499530388', '1');
INSERT INTO `qm_work` VALUES ('313', '1499616313', '1');
INSERT INTO `qm_work` VALUES ('314', '1499703178', '1');
INSERT INTO `qm_work` VALUES ('315', '1499790217', '1');
INSERT INTO `qm_work` VALUES ('316', '1499881271', '1');
INSERT INTO `qm_work` VALUES ('317', '1499962944', '1');
INSERT INTO `qm_work` VALUES ('318', '1500048018', '1');
INSERT INTO `qm_work` VALUES ('319', '1500136425', '1');
INSERT INTO `qm_work` VALUES ('320', '1500222148', '1');
INSERT INTO `qm_work` VALUES ('321', '1500307818', '1');
INSERT INTO `qm_work` VALUES ('322', '1500393636', '1');
INSERT INTO `qm_work` VALUES ('323', '1500482477', '1');
INSERT INTO `qm_work` VALUES ('324', '1500566978', '1');
INSERT INTO `qm_work` VALUES ('325', '1500653926', '1');
INSERT INTO `qm_work` VALUES ('326', '1500741040', '1');
INSERT INTO `qm_work` VALUES ('327', '1500826740', '1');
INSERT INTO `qm_work` VALUES ('328', '1500912208', '1');
INSERT INTO `qm_work` VALUES ('329', '1500999762', '1');
INSERT INTO `qm_work` VALUES ('330', '1501085591', '1');
INSERT INTO `qm_work` VALUES ('331', '1501171891', '1');
INSERT INTO `qm_work` VALUES ('332', '1501257961', '1');
INSERT INTO `qm_work` VALUES ('333', '1501345286', '1');
INSERT INTO `qm_work` VALUES ('334', '1501431524', '1');
INSERT INTO `qm_work` VALUES ('335', '1501517376', '1');
INSERT INTO `qm_work` VALUES ('336', '1501603890', '1');
INSERT INTO `qm_work` VALUES ('337', '1501690338', '1');
INSERT INTO `qm_work` VALUES ('338', '1501777761', '1');
INSERT INTO `qm_work` VALUES ('339', '1501863045', '1');
INSERT INTO `qm_work` VALUES ('340', '1501949147', '1');
INSERT INTO `qm_work` VALUES ('341', '1502043523', '1');
INSERT INTO `qm_work` VALUES ('342', '1502121734', '1');
INSERT INTO `qm_work` VALUES ('343', '1502208725', '1');
INSERT INTO `qm_work` VALUES ('344', '1502295606', '1');
INSERT INTO `qm_work` VALUES ('345', '1502382646', '1');
INSERT INTO `qm_work` VALUES ('346', '1514272082', '1');

-- ----------------------------
-- Table structure for `qm_youhui`
-- ----------------------------
DROP TABLE IF EXISTS `qm_youhui`;
CREATE TABLE `qm_youhui` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(11) DEFAULT '0' COMMENT '产品id',
  `num` int(7) DEFAULT '1' COMMENT '生成数量',
  `addtime` bigint(11) NOT NULL DEFAULT '0',
  `img` varchar(200) DEFAULT '' COMMENT '优惠劵图',
  `del` smallint(1) DEFAULT '0',
  `attr` varchar(100) DEFAULT '' COMMENT '优惠劵名称或者说明',
  `bz` varchar(100) DEFAULT '' COMMENT '备注名称',
  `audit` smallint(1) DEFAULT '1' COMMENT '是否启用',
  `s1` bigint(11) DEFAULT '0' COMMENT '有效期开始',
  `s2` bigint(11) DEFAULT '0' COMMENT '有效截止日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_youhui
-- ----------------------------
INSERT INTO `qm_youhui` VALUES ('1', '24', '10', '1484191447', '', '1', '免费领猕猴桃', '免费领猕猴桃', '0', '1484191447', '1484928000');
INSERT INTO `qm_youhui` VALUES ('2', '1', '10', '1501132500', '', '1', '测试', '1', '0', '1501132500', '1501430400');

-- ----------------------------
-- Table structure for `qm_youhui_info`
-- ----------------------------
DROP TABLE IF EXISTS `qm_youhui_info`;
CREATE TABLE `qm_youhui_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(11) DEFAULT '0' COMMENT '产品id',
  `uid` bigint(11) DEFAULT '0' COMMENT '使用者id',
  `yid` bigint(11) DEFAULT '0' COMMENT '优惠id',
  `addtime` bigint(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `usetime` bigint(11) DEFAULT '0' COMMENT '使用时间',
  `uaddtime` bigint(11) DEFAULT '0' COMMENT '加入优惠券时间',
  `del` smallint(1) DEFAULT '0' COMMENT '是否删除',
  `attr` varchar(100) DEFAULT '' COMMENT '优惠序列号 必须是唯一的',
  `s1` bigint(11) DEFAULT '0' COMMENT '有效期开始',
  `s2` bigint(11) DEFAULT '0' COMMENT '有效截止日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_youhui_info
-- ----------------------------
INSERT INTO `qm_youhui_info` VALUES ('1', '24', '0', '1', '1484191447', '0', '0', '0', 'PFR7-DE9CC1D4', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('2', '24', '0', '1', '1484191447', '0', '0', '0', 'GAU9-0D1C0714', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('3', '24', '0', '1', '1484191447', '0', '0', '0', 'OXO6-5D4DC0F8', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('4', '24', '0', '1', '1484191447', '0', '0', '0', '93BX-362F4E80', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('5', '24', '0', '1', '1484191447', '0', '0', '0', 'G7GC-E01CD2DF', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('6', '24', '0', '1', '1484191447', '0', '0', '0', 'W6FS-CC993EAF', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('7', '24', '0', '1', '1484191447', '0', '0', '0', 'AINP-E7DB57BB', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('8', '24', '0', '1', '1484191447', '0', '0', '0', 'A3QQ-B9DF7D1D', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('9', '24', '0', '1', '1484191447', '0', '0', '0', '73VL-BB574D1E', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('10', '24', '0', '1', '1484191447', '0', '0', '0', 'KBYV-9CF5BD49', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('11', '1', '0', '2', '1501132500', '0', '0', '0', '4NCT-01BDEBAB', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('12', '1', '0', '2', '1501132500', '0', '0', '0', '2UDM-AA5D57C9', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('13', '1', '0', '2', '1501132500', '0', '0', '0', 'MNVO-E767FF0B', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('14', '1', '0', '2', '1501132500', '0', '0', '0', 'G0XJ-E4FB2877', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('15', '1', '0', '2', '1501132500', '0', '0', '0', 'MH7G-3BEAD498', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('16', '1', '0', '2', '1501132500', '0', '0', '0', '7KHQ-DD211595', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('17', '1', '0', '2', '1501132500', '0', '0', '0', 'TOQ2-666D112B', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('18', '1', '0', '2', '1501132500', '0', '0', '0', 'HMWM-749F6F5E', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('19', '1', '0', '2', '1501132500', '0', '0', '0', '8VBL-726EE03D', '0', '0');
INSERT INTO `qm_youhui_info` VALUES ('20', '1', '0', '2', '1501132500', '0', '0', '0', 'V38X-041010F8', '0', '0');

-- ----------------------------
-- Table structure for `qm_yunfei`
-- ----------------------------
DROP TABLE IF EXISTS `qm_yunfei`;
CREATE TABLE `qm_yunfei` (
  `id` bigint(11) NOT NULL,
  `pid` bigint(11) DEFAULT '0' COMMENT '产品id',
  `city` int(6) DEFAULT '0' COMMENT '省份id',
  `cityname` varchar(100) DEFAULT '' COMMENT '省份名称 比如四川省',
  `money` int(6) DEFAULT '0' COMMENT '运费',
  `addtime` bigint(11) DEFAULT '0' COMMENT '新增时间',
  `del` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qm_yunfei
-- ----------------------------
