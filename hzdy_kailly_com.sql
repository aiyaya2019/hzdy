/*
Navicat MySQL Data Transfer

Source Server         : 39.108.144.247
Source Server Version : 50557
Source Host           : 39.108.144.247:3306
Source Database       : hzdy_kailly_com

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2019-11-02 09:25:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_access
-- ----------------------------
DROP TABLE IF EXISTS `z_access`;
CREATE TABLE `z_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '权限名称',
  `url` varchar(100) NOT NULL COMMENT '页面URL',
  `parameter` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0生效 1无效',
  `pid` int(11) NOT NULL COMMENT '权限分类ID',
  `is_nav` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否加入菜单 1是 2否',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of z_access
-- ----------------------------
INSERT INTO `z_access` VALUES ('2', '管理员', 'index', '', '0', '2', '1', '9', '1514197382', '1529339312');
INSERT INTO `z_access` VALUES ('3', '角色管理', 'role', '', '0', '2', '1', '8', '1514197392', '1529339333');
INSERT INTO `z_access` VALUES ('4', '权限列表', 'node', '', '0', '2', '1', '7', '1514197402', '1529339338');
INSERT INTO `z_access` VALUES ('29', '添加/编辑角色', 'addrole', '', '0', '2', '2', '6', '1528954933', '1529339351');
INSERT INTO `z_access` VALUES ('46', '配置权限', 'access', '', '0', '2', '2', '0', '1529338363', '1529338363');
INSERT INTO `z_access` VALUES ('47', '删除角色', 'delerole', '', '0', '2', '2', '5', '1529338413', '1529339364');
INSERT INTO `z_access` VALUES ('48', '添加/编辑管理', 'addadmin', '', '0', '2', '2', '0', '1529338540', '1529338577');
INSERT INTO `z_access` VALUES ('49', '激活/冻结管理', 'isstatus', '', '0', '2', '2', '0', '1529338608', '1529338608');
INSERT INTO `z_access` VALUES ('50', '删除管理', 'deleadmin', '', '0', '2', '2', '0', '1529338626', '1529338626');
INSERT INTO `z_access` VALUES ('116', '肌肤类型', 'index', '', '0', '31', '1', '9', '1557028839', '1557028839');
INSERT INTO `z_access` VALUES ('115', '用户列表', 'index', '', '0', '30', '1', '9', '1553070811', '1553070811');
INSERT INTO `z_access` VALUES ('114', '商品分类', 'type', '', '0', '29', '1', '8', '1553050672', '1553050672');
INSERT INTO `z_access` VALUES ('113', '商品列表', 'index', '', '0', '29', '1', '9', '1552891706', '1552891706');
INSERT INTO `z_access` VALUES ('117', '添加/编辑肌肤类型', 'save', '', '0', '31', '2', '8', '1557028899', '1557028899');
INSERT INTO `z_access` VALUES ('118', '添加/编辑组合商品', 'goods_save', '', '0', '31', '2', '7', '1557028929', '1557028944');
INSERT INTO `z_access` VALUES ('119', '商品组合列表', 'goods', '', '0', '31', '2', '7', '1557028971', '1557028971');
INSERT INTO `z_access` VALUES ('120', '专区推荐', 'zone', '', '0', '31', '1', '9', '1557130095', '1557130095');
INSERT INTO `z_access` VALUES ('121', '满减活动', 'index', '', '0', '32', '1', '9', '1557195133', '1557211449');
INSERT INTO `z_access` VALUES ('122', '优惠劵', 'coupon', '', '0', '32', '1', '8', '1557195164', '1557195164');
INSERT INTO `z_access` VALUES ('123', '商品标签', 'label', '', '0', '29', '1', '7', '1557196614', '1557196614');
INSERT INTO `z_access` VALUES ('124', '添加/编辑商品标签', 'label_save', '', '0', '29', '2', '7', '1557198040', '1557198040');
INSERT INTO `z_access` VALUES ('125', '咨询与售后', 'help', '', '0', '29', '1', '6', '1557198090', '1557198090');
INSERT INTO `z_access` VALUES ('126', '会员等级', 'grade', '', '0', '30', '1', '9', '1557215935', '1557215935');
INSERT INTO `z_access` VALUES ('127', '会员说明', 'desc', '', '0', '30', '1', '7', '1557301894', '1557301894');
INSERT INTO `z_access` VALUES ('128', '砍价商品', 'index', '', '0', '33', '1', '9', '1557307739', '1557307739');
INSERT INTO `z_access` VALUES ('129', '添加/编辑砍价商品', 'save', '', '0', '33', '2', '8', '1557307778', '1557307778');
INSERT INTO `z_access` VALUES ('130', '砍价规则', 'rule', '', '0', '33', '1', '5', '1557307804', '1557396256');
INSERT INTO `z_access` VALUES ('131', '砍价订单', 'order', '', '0', '33', '1', '7', '1557384781', '1557384781');
INSERT INTO `z_access` VALUES ('132', '拼团商品', 'index', '', '0', '34', '1', '9', '1557451052', '1557451284');
INSERT INTO `z_access` VALUES ('133', '添加/编辑拼团商品', 'save', '', '0', '34', '2', '8', '1557451070', '1557451070');
INSERT INTO `z_access` VALUES ('134', '拼团订单', 'order', '', '0', '34', '1', '7', '1557470892', '1557470892');
INSERT INTO `z_access` VALUES ('135', '秒杀商品', 'index', '', '0', '35', '1', '9', '1557470995', '1557470995');
INSERT INTO `z_access` VALUES ('136', '添加/编辑秒杀商品', 'save', '', '0', '35', '2', '8', '1557471012', '1557560498');
INSERT INTO `z_access` VALUES ('137', '秒杀配置', 'time', '', '0', '35', '1', '7', '1557472401', '1557482449');
INSERT INTO `z_access` VALUES ('138', '基础配置', 'index', '', '0', '36', '1', '9', '1557713072', '1557713072');
INSERT INTO `z_access` VALUES ('139', '轮播图管理', 'banner', '', '0', '36', '1', '0', '1561945734', '1561945734');
INSERT INTO `z_access` VALUES ('140', '添加轮播图', 'addbanner', '', '0', '36', '2', '0', '1561945752', '1561945752');
INSERT INTO `z_access` VALUES ('141', '编辑轮播图', 'editbanner', '', '0', '36', '2', '0', '1561945766', '1561945766');
INSERT INTO `z_access` VALUES ('142', '删除轮播图', 'dele', '', '0', '36', '2', '0', '1561945786', '1561945786');
INSERT INTO `z_access` VALUES ('143', '秒杀订单', 'order', '', '0', '35', '1', '0', '1562225779', '1562225779');
INSERT INTO `z_access` VALUES ('144', '全部订单', 'index', '', '0', '37', '1', '0', '1562289233', '1562289233');
INSERT INTO `z_access` VALUES ('145', '评论管理', 'evaluate', '', '0', '37', '1', '0', '1562328003', '1562328003');
INSERT INTO `z_access` VALUES ('146', '物流管理', 'logistics', '', '0', '37', '1', '0', '1562334480', '1562334480');
INSERT INTO `z_access` VALUES ('147', '积分商品', 'index', '', '0', '38', '1', '0', '1563594298', '1563594298');
INSERT INTO `z_access` VALUES ('148', '积分订单', 'order', '', '0', '38', '1', '0', '1563594298', '1563594298');
INSERT INTO `z_access` VALUES ('149', '推广规则', 'rule', '', '0', '30', '1', '0', '1563074868', '1563074868');
INSERT INTO `z_access` VALUES ('150', '生日优惠', 'birthday', '', '0', '30', '1', '0', '1563074868', '1563074868');
INSERT INTO `z_access` VALUES ('151', '售后管理', 'refund', '', '0', '35', '1', '0', '1563183328', '1563183328');
INSERT INTO `z_access` VALUES ('152', '退款审核', 'refundaudit', '', '0', '35', '2', '0', '1563183345', '1563183345');
INSERT INTO `z_access` VALUES ('153', '首页导航', 'nav', '', '0', '36', '1', '0', '1563186483', '1563186483');
INSERT INTO `z_access` VALUES ('154', '添加/编辑导航', 'nav_edit', '', '0', '36', '2', '0', '1563186499', '1563186499');
INSERT INTO `z_access` VALUES ('155', '售后管理', 'refund', '', '1', '33', '2', '0', '1563262691', '1563262691');
INSERT INTO `z_access` VALUES ('156', '退款审核', 'refundaudit', '', '0', '33', '2', '0', '1563262704', '1563262704');
INSERT INTO `z_access` VALUES ('157', '订单发货', 'delivery', '', '0', '33', '2', '0', '1563262716', '1563262716');
INSERT INTO `z_access` VALUES ('158', '订单发货', 'delivery', '', '0', '34', '2', '0', '1563263262', '1563263262');
INSERT INTO `z_access` VALUES ('159', '售后管理', 'refund', '', '0', '34', '1', '0', '1563263278', '1563263278');
INSERT INTO `z_access` VALUES ('160', '退款审核', 'refundaudit', '', '0', '34', '2', '0', '1563263290', '1563263290');
INSERT INTO `z_access` VALUES ('161', '广告管理', 'adv', '', '0', '36', '1', '0', '1564036138', '1564036152');
INSERT INTO `z_access` VALUES ('162', '警戒商品', 'warn_goods', '', '0', '29', '1', '6', '1564193180', '1564193180');
INSERT INTO `z_access` VALUES ('164', '站内信列表', 'msg', '', '0', '30', '1', '6', '1564216233', '1564216233');
INSERT INTO `z_access` VALUES ('165', '弹窗管理', 'popup', '', '0', '36', '1', '13', '1564555101', '1564555286');
INSERT INTO `z_access` VALUES ('166', '商品列表', 'index', '', '0', '39', '1', '9', '1564711901', '1564711901');
INSERT INTO `z_access` VALUES ('167', '时间配置', 'time', '', '0', '39', '1', '8', '1564711901', '1564711901');
INSERT INTO `z_access` VALUES ('168', '订单管理', 'order', '', '0', '39', '1', '7', '1564711901', '1564711901');
INSERT INTO `z_access` VALUES ('169', '签到配置', 'sign', '', '0', '36', '1', '11', '1565840926', '1565840926');
INSERT INTO `z_access` VALUES ('170', '链接列表', 'index', '', '0', '40', '1', '9', '1570521123', '1570521123');
INSERT INTO `z_access` VALUES ('171', '邀请好友', 'friend', '', '0', '30', '1', '4', '1570864763', '1570864763');
INSERT INTO `z_access` VALUES ('172', '下架商品', 'noshow', '', '0', '29', '1', '1', '1571039739', '1571039739');
INSERT INTO `z_access` VALUES ('173', '自定义评论', 'evaluatelst', '', '0', '29', '1', '1', '1571131103', '1571131103');
INSERT INTO `z_access` VALUES ('174', '售后管理', 'refund', '', '0', '39', '1', '6', '1572333545', '1572333545');
INSERT INTO `z_access` VALUES ('175', '售后管理', 'refundlist', '', '0', '37', '1', '4', '1572336426', '1572336426');

-- ----------------------------
-- Table structure for z_access_role
-- ----------------------------
DROP TABLE IF EXISTS `z_access_role`;
CREATE TABLE `z_access_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  `acc_id` int(11) NOT NULL COMMENT '权限ID',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of z_access_role
-- ----------------------------
INSERT INTO `z_access_role` VALUES ('1', '1', '6', '1514197463');
INSERT INTO `z_access_role` VALUES ('2', '1', '1', '1514198168');
INSERT INTO `z_access_role` VALUES ('4', '1', '7', '1514361292');
INSERT INTO `z_access_role` VALUES ('5', '1', '8', '1514455230');
INSERT INTO `z_access_role` VALUES ('6', '1', '9', '1514455230');
INSERT INTO `z_access_role` VALUES ('7', '1', '10', '1514455230');
INSERT INTO `z_access_role` VALUES ('8', '1', '11', '1514455230');
INSERT INTO `z_access_role` VALUES ('9', '2', '1', '1526385621');
INSERT INTO `z_access_role` VALUES ('25', '5', '2', '1529338677');
INSERT INTO `z_access_role` VALUES ('26', '5', '3', '1529338677');
INSERT INTO `z_access_role` VALUES ('30', '6', '58', '1546409369');
INSERT INTO `z_access_role` VALUES ('31', '6', '59', '1546409369');
INSERT INTO `z_access_role` VALUES ('32', '6', '60', '1546409369');
INSERT INTO `z_access_role` VALUES ('33', '6', '61', '1546409369');
INSERT INTO `z_access_role` VALUES ('34', '6', '62', '1546409369');
INSERT INTO `z_access_role` VALUES ('35', '6', '63', '1546409369');
INSERT INTO `z_access_role` VALUES ('36', '6', '64', '1546409369');
INSERT INTO `z_access_role` VALUES ('37', '6', '65', '1546409369');

-- ----------------------------
-- Table structure for z_access_type
-- ----------------------------
DROP TABLE IF EXISTS `z_access_type`;
CREATE TABLE `z_access_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '控制器名称',
  `url` varchar(50) NOT NULL COMMENT '控制器',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='权限分类表';

-- ----------------------------
-- Records of z_access_type
-- ----------------------------
INSERT INTO `z_access_type` VALUES ('2', '后台管理', 'admins', 'icon-shezhi', '99', '1514197373', '1531962285');
INSERT INTO `z_access_type` VALUES ('29', '商品管理', 'goods', 'icon-shangpin', '9', '1552891675', '1552891692');
INSERT INTO `z_access_type` VALUES ('30', '用户管理', 'user', 'icon-jiaosequnti', '0', '1553070786', '1553070786');
INSERT INTO `z_access_type` VALUES ('31', '专区管理', 'zone', 'icon-yun', '8', '1557028808', '1557129772');
INSERT INTO `z_access_type` VALUES ('32', '优惠促销', 'prom', 'icon-zhinengyouhua', '7', '1557195106', '1557195106');
INSERT INTO `z_access_type` VALUES ('33', '砍价专区', 'bargain', 'icon-caiwu-xianxing', '9', '1557307720', '1557307720');
INSERT INTO `z_access_type` VALUES ('34', '拼团专区', 'group', 'icon-tianjiayonghu', '9', '1557451005', '1557451035');
INSERT INTO `z_access_type` VALUES ('35', '秒杀专区', 'spike', 'icon-jifen-xianxing', '9', '1557470981', '1557470981');
INSERT INTO `z_access_type` VALUES ('36', '网站配置', 'config', 'icon-peizhiguanli', '99', '1557713045', '1557713045');
INSERT INTO `z_access_type` VALUES ('37', '订单管理', 'order', 'icon-quanbudingdan', '0', '1562289205', '1562289205');
INSERT INTO `z_access_type` VALUES ('38', '积分商品', 'point', 'icon-shangpin', '9', '1563594298', '1563594298');
INSERT INTO `z_access_type` VALUES ('39', '限时打折', 'Limit', 'icon-jifen-xianxing', '8', '1564711901', '1564711901');
INSERT INTO `z_access_type` VALUES ('40', '链接管理', 'link', 'icon-peizhiguanli', '0', '1570521123', '1570521123');

-- ----------------------------
-- Table structure for z_admin
-- ----------------------------
DROP TABLE IF EXISTS `z_admin`;
CREATE TABLE `z_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '管理员名称',
  `admin_user` varchar(50) NOT NULL COMMENT '账号',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `addtime` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `forst` int(1) NOT NULL DEFAULT '0' COMMENT '是否冻结 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of z_admin
-- ----------------------------
INSERT INTO `z_admin` VALUES ('1', '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1514163261', '1526385304', '0');

-- ----------------------------
-- Table structure for z_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `z_admin_role`;
CREATE TABLE `z_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0有效 1无效',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '角色描述',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of z_admin_role
-- ----------------------------
INSERT INTO `z_admin_role` VALUES ('7', '客服', '0', '1', '1564042345', '1564042345');

-- ----------------------------
-- Table structure for z_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `z_admin_roles`;
CREATE TABLE `z_admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) NOT NULL COMMENT '管理员ID',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of z_admin_roles
-- ----------------------------
INSERT INTO `z_admin_roles` VALUES ('3', '6', '2', '1526384853');
INSERT INTO `z_admin_roles` VALUES ('4', '2', '5', '1528873113');
INSERT INTO `z_admin_roles` VALUES ('7', '9', '6', '1546427140');
INSERT INTO `z_admin_roles` VALUES ('8', '7', '6', '1547003146');

-- ----------------------------
-- Table structure for z_adv
-- ----------------------------
DROP TABLE IF EXISTS `z_adv`;
CREATE TABLE `z_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标题',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型 1首页广告图',
  `status` tinyint(1) DEFAULT '1' COMMENT '1显示 2隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of z_adv
-- ----------------------------
INSERT INTO `z_adv` VALUES ('1', '首页广告图', '/uploads/20190701/8cb323c769aad5a6a2fd418ad6a5f8e2.png', 'www.baidu.com', '0', '1561949434', '1564037966', '1', '2');
INSERT INTO `z_adv` VALUES ('4', '广告', '/uploads/20190730/9ef4dd47850c4a7d2a073a6828c3f5fc.jpg', 'www', '0', '1564037981', '1564469427', '1', '1');

-- ----------------------------
-- Table structure for z_banner
-- ----------------------------
DROP TABLE IF EXISTS `z_banner`;
CREATE TABLE `z_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标题',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型 1首页轮播',
  `status` tinyint(1) DEFAULT '1' COMMENT '1显示 2隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of z_banner
-- ----------------------------
INSERT INTO `z_banner` VALUES ('1', '首页轮播图', '/uploads/20190701/8cb323c769aad5a6a2fd418ad6a5f8e2.png', '#', '1', '1561949434', '1570864379', '1', '1');
INSERT INTO `z_banner` VALUES ('4', '首页', '/uploads/20190925/a22ad7c2ff1ffb30727f04224a084f4a.jpg', '#', '2', '1569375302', '1570864365', '1', '1');

-- ----------------------------
-- Table structure for z_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_goods`;
CREATE TABLE `z_bargain_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低可以砍到金额',
  `min_money` int(11) NOT NULL DEFAULT '0' COMMENT '单次砍价最低金额',
  `max_money` int(11) NOT NULL DEFAULT '0' COMMENT '单次砍价最高金额',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `hour` int(11) NOT NULL DEFAULT '0' COMMENT '砍价小时',
  `minute` int(11) NOT NULL DEFAULT '0' COMMENT '砍价分钟',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='砍价商品';

-- ----------------------------
-- Records of z_bargain_goods
-- ----------------------------
INSERT INTO `z_bargain_goods` VALUES ('1', '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', '5499.00', '5999.00', '5490.00', '0', '8', '2', '0', '5', '1557367791', '1563206655');
INSERT INTO `z_bargain_goods` VALUES ('2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1799.00', '1999.00', '1399.00', '0', '20', '1', '1', '0', '1557370823', '1557370823');
INSERT INTO `z_bargain_goods` VALUES ('3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '159.00', '189.00', '129.00', '5', '100', '6', '1', '0', '1557371126', '1568967889');
INSERT INTO `z_bargain_goods` VALUES ('7', '测', '/uploads/20191030/ee19ccb4d4bfb51cbe82c58ccbe3446c.png', '15.00', '20.00', '5.00', '5', '5', '2', '10', '10', '1572426525', '1572426525');

-- ----------------------------
-- Table structure for z_bargain_help
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_help`;
CREATE TABLE `z_bargain_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '砍价订单ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '砍掉金额',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='订单砍价记录';

-- ----------------------------
-- Records of z_bargain_help
-- ----------------------------
INSERT INTO `z_bargain_help` VALUES ('1', '11', '2', '2.56', '1563207103', '1563207103');
INSERT INTO `z_bargain_help` VALUES ('2', '19', '2', '20.38', '1563207302', '1563207302');
INSERT INTO `z_bargain_help` VALUES ('3', '33', '11', '6.14', '1565753171', '1565753171');
INSERT INTO `z_bargain_help` VALUES ('4', '29', '15', '12.19', '1568966823', '1568966823');
INSERT INTO `z_bargain_help` VALUES ('5', '32', '15', '41.41', '1568966895', '1568966895');
INSERT INTO `z_bargain_help` VALUES ('6', '28', '16', '0.96', '1568967678', '1568967678');
INSERT INTO `z_bargain_help` VALUES ('7', '29', '16', '0.65', '1568967735', '1568967735');
INSERT INTO `z_bargain_help` VALUES ('8', '35', '16', '0.53', '1568967921', '1568967921');
INSERT INTO `z_bargain_help` VALUES ('9', '42', '19', '30.00', '1569392352', '1569392352');
INSERT INTO `z_bargain_help` VALUES ('10', '40', '22', '30.00', '1569575387', '1569575387');
INSERT INTO `z_bargain_help` VALUES ('11', '41', '31', '23.84', '1571127199', '1571127199');
INSERT INTO `z_bargain_help` VALUES ('12', '46', '34', '30.00', '1571188996', '1571188996');
INSERT INTO `z_bargain_help` VALUES ('13', '46', '35', '24.04', '1571193874', '1571193874');
INSERT INTO `z_bargain_help` VALUES ('14', '46', '38', '0.00', '1572337979', '1572337979');
INSERT INTO `z_bargain_help` VALUES ('15', '46', '41', '0.00', '1572338393', '1572338393');
INSERT INTO `z_bargain_help` VALUES ('16', '49', '42', '0.00', '1572338887', '1572338887');
INSERT INTO `z_bargain_help` VALUES ('17', '49', '43', '0.00', '1572420366', '1572420366');
INSERT INTO `z_bargain_help` VALUES ('18', '40', '44', '0.00', '1572425371', '1572425371');
INSERT INTO `z_bargain_help` VALUES ('19', '40', '45', '30.00', '1572425441', '1572425441');
INSERT INTO `z_bargain_help` VALUES ('20', '40', '46', '3.00', '1572425563', '1572425563');
INSERT INTO `z_bargain_help` VALUES ('21', '33', '47', '5.00', '1572426189', '1572426189');
INSERT INTO `z_bargain_help` VALUES ('22', '12', '47', '0.00', '1572426330', '1572426330');
INSERT INTO `z_bargain_help` VALUES ('23', '12', '48', '5.00', '1572426563', '1572426563');
INSERT INTO `z_bargain_help` VALUES ('24', '33', '48', '5.00', '1572426641', '1572426641');

-- ----------------------------
-- Table structure for z_bargain_order
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_order`;
CREATE TABLE `z_bargain_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `uid` int(11) DEFAULT NULL COMMENT '下单用户ID',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `bargain_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已砍金额',
  `bargain_num` int(11) NOT NULL DEFAULT '0' COMMENT '已砍次数',
  `min_price` int(11) NOT NULL DEFAULT '0' COMMENT '最低可砍金额',
  `min_money` int(11) NOT NULL DEFAULT '0' COMMENT '单次最低砍价金额',
  `max_money` int(11) NOT NULL DEFAULT '0' COMMENT '单次最高砍价金额',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后 6同意售后 7不同意 8取消订单',
  `bargain_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '砍价状态 1砍价中 2砍价成功 3砍价失败4终止砍价',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价结束时间',
  `succ_time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价成功时间',
  `receipt_time` int(11) NOT NULL DEFAULT '0' COMMENT '收货时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信 2余额',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额(微信返回)',
  `pay_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '支付单号(微信返回)',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `logistics_state` tinyint(1) DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '发货快递公司ID',
  `logistics_name` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(100) DEFAULT NULL COMMENT '发货快递单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态（0未删除  1用户已删除 2后台删除）',
  `form_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='砍价订单';

-- ----------------------------
-- Records of z_bargain_order
-- ----------------------------
INSERT INTO `z_bargain_order` VALUES ('1', '201907160152767807', '11', '5499.00', '5499.00', '0.00', '0', '5490', '0', '8', '1', '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '5499.00', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', '1', '2', '彭君', '18819171134', '广东省', '广州市', '天河区', '珠江东路13号', '1563213468', '0', '0', '1563213168', '1563213168', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('2', '201907161733592996', '21', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎福路231号有间租房', '1563273214', '0', '0', '1563269614', '1563269614', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('3', '201907171744958167', '24', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '1', '林馥纯', '18211212987', '广东省', '潮州市', '饶平县', '海山镇浮任村', '1563360254', '0', '0', '1563356654', '1563356654', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('4', '201907171809301776', '24', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '1', '林馥纯', '18211212987', '广东省', '潮州市', '饶平县', '海山镇浮任村', '1563361784', '0', '0', '1563358184', '1563358184', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('5', '201907180755372603', '19', '5499.00', '5499.00', '0.00', '0', '5490', '0', '8', '1', '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '5499.00', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', '1', '3', '李剑成', '13129087405', '广东省', '广州市', '天河区', '猎德 珠江新城', '1563408007', '0', '0', '1563407707', '1563407707', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('6', '201907221048819206', '19', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1563767282', '0', '0', '1563763682', '1563763682', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('7', '201907271010905487', '19', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1564197057', '0', '0', '1564193457', '1564193457', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('8', '201907271413276265', '19', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1564211624', '0', '0', '1564208024', '1564208024', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('9', '201907301638510340', '19', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1564479517', '0', '0', '1564475917', '1564475917', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('10', '201908131531162581', '33', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1565685066', '0', '0', '1565681466', '1565681466', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('11', '201908141125444488', '28', '1799.00', '1792.86', '6.14', '1', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '3', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1565756723', '0', '0', '1565753123', '1565753171', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('12', '201908141538897881', '28', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1565771922', '0', '0', '1565768322', '1565768322', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('13', '201908142121183106', '13', '15999.00', '15999.00', '0.00', '0', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '1', '袁靓靓', '15915744188', '广东省', '广州市', '天河区', '东圃', '1565792474', '0', '0', '1565788874', '1565788874', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('14', '201909201036777689', '33', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1568950568', '0', '0', '1568946968', '1568946968', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('15', '201909201606411641', '28', '15999.00', '15945.40', '53.60', '2', '12999', '0', '50', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '15999.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1568970370', '0', '0', '1568966770', '1568966895', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('16', '201909201620920130', '32', '159.00', '156.86', '2.14', '3', '129', '0', '5', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1568971250', '0', '0', '1568967650', '1568967921', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('17', '201909201947182813', '28', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1568983628', '0', '0', '1568980028', '1568980028', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('18', '201909251147831289', '21', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎福路231号有间租房', '1569386862', '0', '0', '1569383262', '1569383262', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('19', '201909251416169975', '21', '159.00', '129.00', '30.00', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '2', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎福路231号有间租房', '1569395784', '0', '0', '1569392184', '1569392352', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('20', '201909251820835074', '21', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎福路231号有间租房', '1569410402', '0', '0', '1569406802', '1569406802', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('21', '201909251820650411', '21', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎福路231号有间租房', '1569410409', '0', '0', '1569406809', '1569406809', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('22', '201909271659796224', '21', '159.00', '129.00', '30.00', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '2', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569578394', '0', '0', '1569574794', '1569575387', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('23', '201909271700120196', '41', '5499.00', '5499.00', '0.00', '0', '5490', '0', '8', '1', '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '5499.00', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', '1', '3', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569575133', '0', '0', '1569574833', '1569574833', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('24', '201909271708334554', '31', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '1', '李智良', '15007517166', '广东省', '广州市', '天河区', '东圃一横路90号 天河东泷商务中心C座二楼217-218', '1569578922', '0', '0', '1569575322', '1569575322', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('25', '201910140856246399', '33', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571018162', '0', '0', '1571014562', '1571014562', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('26', '201910140901567151', '33', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571018466', '0', '0', '1571014866', '1571014866', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('27', '201910151439672870', '33', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '2', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571125188', '0', '0', '1571121588', '1571125361', '2', '1', '0.00', '', '1571125361', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('28', '201910151521340202', '33', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '2', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571127676', '0', '0', '1571124076', '1571124832', '2', '1', '0.00', '', '1571124832', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('29', '201910151523857313', '33', '5499.00', '5499.00', '0.00', '0', '5490', '0', '8', '1', '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '5499.00', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', '2', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571124538', '0', '0', '1571124238', '1571124667', '2', '1', '0.00', '', '1571124667', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('30', '201910151559068539', '33', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '2', '4', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571129959', '0', '0', '1571126359', '1571126379', '2', '1', '0.00', '', '1571126379', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('31', '201910151609250605', '33', '159.00', '135.16', '23.84', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '2', '4', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571130565', '0', '0', '1571126965', '1571127220', '2', '1', '0.00', '', '1571127220', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('32', '201910151614034579', '33', '159.00', '159.00', '0.00', '0', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '7', '2', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571130868', '0', '0', '1571127268', '1572493868', '2', '1', '0.00', '', '1571127666', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('33', '201910151717080979', '41', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '1', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1571134623', '0', '0', '1571131023', '1571131023', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('34', '201910160922508325', '49', '159.00', '129.00', '30.00', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '2', '2', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1571192549', '0', '0', '1571188949', '1571189017', '2', '1', '0.00', '', '1571189017', '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('35', '201910161043079966', '33', '159.00', '134.96', '24.04', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '8', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571197386', '0', '0', '1571193786', '1572602099', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '0');
INSERT INTO `z_bargain_order` VALUES ('36', '201910291603322434', '33', '1799.00', '1799.00', '0.00', '0', '1399', '0', '20', '2', 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '1799.00', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', '2', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1572339825', '0', '0', '1572336225', '1572602109', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'the formId is a mock one');
INSERT INTO `z_bargain_order` VALUES ('37', '201910291631528704', '32', '1.00', '1.00', '0.00', '0', '1', '1', '1', '4', '免费10.29', '1.00', '/uploads/20191029/c94c4e2234d333d9c19e83bd3dc0ef51.jpg', '1', '3', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572374519', '0', '0', '1572337919', '1572337919', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '34f7eea580264a58ab44dc79aee8cee8');
INSERT INTO `z_bargain_order` VALUES ('38', '201910291631960129', '32', '1.00', '1.00', '0.00', '1', '1', '1', '1', '4', '免费10.29', '1.00', '/uploads/20191029/c94c4e2234d333d9c19e83bd3dc0ef51.jpg', '1', '2', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572374519', '0', '0', '1572337919', '1572337979', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '4c545cbdb7cc465a8c1a45522d9fed14');
INSERT INTO `z_bargain_order` VALUES ('39', '201910291631706814', '32', '1.00', '1.00', '0.00', '0', '1', '1', '1', '4', '免费10.29', '1.00', '/uploads/20191029/c94c4e2234d333d9c19e83bd3dc0ef51.jpg', '1', '3', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572374519', '0', '0', '1572337919', '1572337919', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'd0a490a673b6451e8aae15c6d5675b64');
INSERT INTO `z_bargain_order` VALUES ('40', '201910291636567913', '33', '1.00', '1.00', '0.00', '0', '1', '1', '1', '4', '免费10.29', '1.00', '/uploads/20191029/c94c4e2234d333d9c19e83bd3dc0ef51.jpg', '1', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1572374776', '0', '0', '1572338176', '1572338176', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'the formId is a mock one');
INSERT INTO `z_bargain_order` VALUES ('41', '201910291639065399', '32', '6.00', '6.00', '0.00', '1', '6', '3', '3', '5', '10.29测试', '6.00', '/uploads/20191029/42726ba8b5f0287af5d65cee57f308b2.jpg', '1', '2', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572374971', '0', '0', '1572338371', '1572338393', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'ad4b58b7288a4e69bd3e79bcd98051b3');
INSERT INTO `z_bargain_order` VALUES ('42', '201910291646987865', '33', '6.00', '6.00', '0.00', '1', '6', '3', '6', '5', '10.29测试', '6.00', '/uploads/20191029/42726ba8b5f0287af5d65cee57f308b2.jpg', '1', '2', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1572375380', '0', '0', '1572338780', '1572338887', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '461e5e0b91014b84a4fd47a21c6a27ec');
INSERT INTO `z_bargain_order` VALUES ('43', '201910301521444590', '33', '6.00', '6.00', '0.00', '1', '6', '3', '6', '5', '10.29测试', '6.00', '/uploads/20191029/42726ba8b5f0287af5d65cee57f308b2.jpg', '1', '2', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1572456665', '0', '0', '1572420065', '1572420366', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'the formId is a mock one');
INSERT INTO `z_bargain_order` VALUES ('44', '201910301648279933', '33', '6.00', '6.00', '0.00', '1', '6', '3', '6', '5', '10.29测试', '6.00', '/uploads/20191029/42726ba8b5f0287af5d65cee57f308b2.jpg', '1', '2', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1572461914', '0', '0', '1572425314', '1572425371', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'be2ef17e0eff4a8d80a9c6df99b1af38');
INSERT INTO `z_bargain_order` VALUES ('45', '201910301650626582', '33', '159.00', '129.00', '30.00', '1', '129', '5', '100', '3', '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '159.00', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', '1', '2', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1572429009', '0', '0', '1572425409', '1572425441', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', 'aa472ea164ac441ba30701bb8749b98f');
INSERT INTO `z_bargain_order` VALUES ('46', '201910301652581495', '33', '9.00', '6.00', '3.00', '1', '6', '3', '6', '5', '10.29测试', '9.00', '/uploads/20191029/42726ba8b5f0287af5d65cee57f308b2.jpg', '1', '2', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1572462143', '0', '0', '1572425543', '1572597457', '1', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '04dae83d2e2d46ec9a5592eb2b07be45');
INSERT INTO `z_bargain_order` VALUES ('47', '201910301702470248', '32', '15.00', '10.00', '5.00', '2', '10', '5', '5', '6', '测下', '15.00', '/uploads/20191030/0e06aac452297f46ec7b4041942c3adf.png', '6', '2', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572462748', '0', '1572427833', '1572426148', '1572430052', '2', '1', '1.00', '', '1572427526', '1', '1', '顺丰快递', 'shunfeng', '00', '1572427820', '0', 'a1a4008fcd184056b0393f054f5e9b8c');
INSERT INTO `z_bargain_order` VALUES ('48', '201910301708308518', '32', '15.00', '5.00', '10.00', '2', '5', '5', '5', '7', '测', '15.00', '/uploads/20191030/ee19ccb4d4bfb51cbe82c58ccbe3446c.png', '2', '4', '吴佳瑜', '13189176760', '广东省', '广州市', '天河区', '中山大道中379号联合社区2栋208广州小程序开发定制开利网络aa', '1572463138', '0', '0', '1572426538', '1572574378', '2', '1', '1.00', '', '1572427367', '0', null, '', '', null, null, '0', '97b377b36e414e47b8115de964c8202e');
INSERT INTO `z_bargain_order` VALUES ('49', '201910311154486690', '33', '15.00', '15.00', '0.00', '0', '5', '5', '5', '7', '测', '15.00', '/uploads/20191030/ee19ccb4d4bfb51cbe82c58ccbe3446c.png', '4', '4', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号qqqqqeeee', '1572530649', '0', '1572494209', '1572494049', '1572574155', '2', '1', '1.00', '', '1572494076', '1', '1', '顺丰快递', 'shunfeng', '8484848', '1572494111', '0', 'the formId is a mock one');

-- ----------------------------
-- Table structure for z_bargain_sale
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_sale`;
CREATE TABLE `z_bargain_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 仅退款  2退货退款',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic` text NOT NULL COMMENT '退款凭证',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(255) unsigned DEFAULT '0' COMMENT '0未处理  1成功 2拒绝',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '用户申请金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='拼团订单售后信息';

-- ----------------------------
-- Records of z_bargain_sale
-- ----------------------------
INSERT INTO `z_bargain_sale` VALUES ('1', '32', '201910151623867568', '1', '159.00', '', '', '1571127789', '1571127789', '2', '0.00');
INSERT INTO `z_bargain_sale` VALUES ('2', '47', '201910301730691983', '1', '10.00', '', '', '1572427856', '1572427856', '1', '0.00');

-- ----------------------------
-- Table structure for z_car
-- ----------------------------
DROP TABLE IF EXISTS `z_car`;
CREATE TABLE `z_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_title` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `goods_attr` varchar(5000) NOT NULL DEFAULT '' COMMENT '商品规格',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '添加时间',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未选中，1已选中',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `attr` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

-- ----------------------------
-- Records of z_car
-- ----------------------------
INSERT INTO `z_car` VALUES ('58', '44', '1', '三星 Galaxy S10（SM-G9730）', '5999.00', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '{\"id\":5,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":986,\"pay_num\":7}', '2', '0', '1571134214', '1571136385', '1:3,2:4');
INSERT INTO `z_car` VALUES ('59', '44', '5', '广西高乐蜜芒果', '54.00', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1', '0', '1571136378', '0', '9:14');
INSERT INTO `z_car` VALUES ('60', '48', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '12.00', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '{\"id\":26,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a36\\u7247\",\"fare_money\":11,\"stock\":1000,\"pay_num\":0}', '1', '0', '1571187894', '0', '11:20');
INSERT INTO `z_car` VALUES ('62', '26', '12', '敷尔佳白膜', '11.00', '/uploads/20190925/6e3dcd3a8417ea8f3b9179738dbe5b6a.jpg', '{\"id\":48,\"price\":\"11.00\",\"old_price\":\"22.00\",\"spec_name\":\"qq\\uff1ass\",\"fare_money\":11,\"stock\":33,\"pay_num\":0}', '33', '1', '1571298784', '1571299577', '18:38');
INSERT INTO `z_car` VALUES ('65', '33', '5', '广西高乐蜜芒果', '54.00', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1', '1', '1572426100', '1572428873', '9:14');
INSERT INTO `z_car` VALUES ('66', '33', '11', '敷尔佳白膜', '87.00', '/uploads/20190925/947094e65469e420893673c89e204fc7.jpg', '{\"id\":47,\"price\":\"87.00\",\"old_price\":\"87.00\",\"spec_name\":\"\\u6577\\u5c14\\u4f73\\u767d\\u819c\\u4e00\\u76d2\\uff1a\\u767d\\u819c\",\"fare_money\":0,\"stock\":300,\"pay_num\":0}', '1', '1', '1572426117', '1572428889', '15:35');
INSERT INTO `z_car` VALUES ('67', '32', '5', '广西高乐蜜芒果', '54.00', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":958,\"pay_num\":14}', '1', '1', '1572508278', '1572508289', '9:14');

-- ----------------------------
-- Table structure for z_collect
-- ----------------------------
DROP TABLE IF EXISTS `z_collect`;
CREATE TABLE `z_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

-- ----------------------------
-- Records of z_collect
-- ----------------------------
INSERT INTO `z_collect` VALUES ('33', '25', '1', '1563213239', '0');
INSERT INTO `z_collect` VALUES ('35', '13', '1', '1563237731', '0');
INSERT INTO `z_collect` VALUES ('36', '13', '3', '1563237765', '0');
INSERT INTO `z_collect` VALUES ('38', '19', '1', '1563283094', '0');
INSERT INTO `z_collect` VALUES ('40', '19', '2', '1563321077', '0');
INSERT INTO `z_collect` VALUES ('43', '23', '10', '1568858463', '0');
INSERT INTO `z_collect` VALUES ('48', '12', '4', '1568979259', '0');
INSERT INTO `z_collect` VALUES ('54', '28', '1', '1568980954', '0');
INSERT INTO `z_collect` VALUES ('55', '28', '5', '1568982846', '0');
INSERT INTO `z_collect` VALUES ('56', '41', '7', '1569059491', '0');
INSERT INTO `z_collect` VALUES ('58', '44', '1', '1571134202', '0');
INSERT INTO `z_collect` VALUES ('60', '46', '5', '1572338144', '0');

-- ----------------------------
-- Table structure for z_config
-- ----------------------------
DROP TABLE IF EXISTS `z_config`;
CREATE TABLE `z_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `appid` varchar(100) NOT NULL DEFAULT '' COMMENT '微信APPID',
  `appsecret` varchar(255) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付key',
  `mchid` int(11) NOT NULL DEFAULT '0' COMMENT '商户号',
  `fare_money` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `bargain_desc` text COMMENT '砍价规则',
  `grade_desc` varchar(255) DEFAULT '' COMMENT '会员说明',
  `sign_point` int(11) DEFAULT '0' COMMENT '每天签到可获得积分',
  `reco_point` int(11) unsigned DEFAULT '0' COMMENT '分享推荐好友获得积分',
  `point_money` int(11) DEFAULT '0' COMMENT '多少积分可以抵扣1元',
  `rule` text COMMENT '推广规则',
  `birthday` text COMMENT '生日优惠',
  `stock_warn` int(11) DEFAULT '0' COMMENT '库存警戒线',
  `friend_money` decimal(10,2) DEFAULT '0.00' COMMENT '邀请新用户拿到的佣金',
  `share_title` varchar(255) DEFAULT '' COMMENT '分享标题',
  `share_pic` varchar(255) DEFAULT '' COMMENT '分享图片',
  `friend_num` int(11) NOT NULL DEFAULT '0' COMMENT '邀请人数',
  `pub_content` text COMMENT '公共模块内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of z_config
-- ----------------------------
INSERT INTO `z_config` VALUES ('1', '化妆的鱼', '/uploads/20190330/87923715f7d3c1722d0be82c440860b8.jpg', 'wx2f38d5d5d170064b', 'b82918114ab96b292cef8918d002e33d', 'c3b831951baf129b6aaf94e24a278265', '1511253371', '10', '1551341451', '1571111119', '<p>砍价规则：</p><p>1、xxxxxxxxxxxxxxxxxxxx</p><p>2、xxxxxxxx</p><p>3、xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p><p>4、xxxxxxxxxxxxxx</p>', '<p>会员说明</p>', '10', '10', '100', '<p>1</p>', '<p>1、每位用户生日只限设置一次</p>', '100', '10.00', '化妆的鱼实力进军世界500强', '/uploads/20190815/1bdcb94e9b7652c9baba11dd8ce138dd.jpg', '10', '<p>fdgdfgdfgdf<img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20191015/d43be122d29af6dee2f37f665b6d3ccf.png\" width=\"300\"></p>');

-- ----------------------------
-- Table structure for z_coupon
-- ----------------------------
DROP TABLE IF EXISTS `z_coupon`;
CREATE TABLE `z_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '条件金额',
  `less_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型 1是用户领取 2是指定用户 3指定等级',
  `uid` varchar(255) NOT NULL DEFAULT '' COMMENT '指定的用户ID',
  `grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级ID',
  `goods_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品可用；2指定商品可用',
  `goods_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品id',
  `day` int(11) NOT NULL DEFAULT '0' COMMENT '领取后的有效天数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取结束时间',
  `set_num` int(11) NOT NULL DEFAULT '0' COMMENT '已领取数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '发放时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `point` int(10) DEFAULT '0' COMMENT '需要多少积分兑换',
  `num` int(5) DEFAULT '1' COMMENT '一人能领多少张',
  `point_status` tinyint(1) DEFAULT '1' COMMENT '是否允许积分兑换：1允许2不允许',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='优惠劵';

-- ----------------------------
-- Records of z_coupon
-- ----------------------------
INSERT INTO `z_coupon` VALUES ('1', '100.00', '30.00', '2', '2,1', '0', '1', '', '5', '1553498120', '1563260683', '0', '1553498120', '1553498120', '1', '1', '1');
INSERT INTO `z_coupon` VALUES ('2', '50.00', '10.00', '1', '1,3', '0', '1', '', '3', '1553529600', '1563260683', '0', '1553501091', '1553501091', '0', '1', '1');
INSERT INTO `z_coupon` VALUES ('3', '200.00', '30.00', '1', '', '0', '1', '', '10', '1557244800', '1563260683', '0', '1557212722', '1557212722', '0', '1', '1');
INSERT INTO `z_coupon` VALUES ('4', '100.00', '1.00', '1', '', '0', '1', '', '1', '1563120000', '1564502400', '0', '1563201898', '1563201898', '100', '1', '1');
INSERT INTO `z_coupon` VALUES ('5', '25.00', '5.00', '2', '6', '0', '1', '', '2', '1564470827', '1564470827', '0', '1564470827', '1564470827', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('6', '25.00', '5.00', '2', '6', '0', '1', '', '2', '1564470827', '1564470827', '0', '1564470827', '1564470827', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('7', '25.00', '5.00', '2', '6', '0', '1', '', '2', '1564471060', '1564471060', '0', '1564471060', '1564471060', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('8', '25.00', '5.00', '2', '6', '0', '1', '', '2', '1564471080', '1564471080', '0', '1564471080', '1564471080', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('9', '25.00', '5.00', '2', '6', '0', '1', '', '2', '1564471113', '1564471113', '0', '1564471113', '1564471113', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('10', '30.00', '3.00', '2', '10', '0', '1', '', '3', '1564471986', '1564471986', '0', '1564471986', '1564471986', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('11', '4.00', '1.00', '2', '6', '2', '2', '4', '1', '1564476932', '1564476932', '0', '1564476932', '1564476932', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('12', '6.00', '1.00', '2', '10', '0', '1', '', '1', '1564477748', '1564477748', '0', '1564477748', '1564477748', '0', '1', '2');
INSERT INTO `z_coupon` VALUES ('13', '250.00', '10.00', '1', '33', '0', '1', '11', '100', '1569513600', '1569600000', '0', '1569550585', '1569550585', '1800', '1', '1');
INSERT INTO `z_coupon` VALUES ('14', '1.00', '1.00', '1', '7', '0', '1', '', '30', '1569513600', '1572451200', '0', '1569551579', '1569551579', '10', '10', '1');

-- ----------------------------
-- Table structure for z_discount
-- ----------------------------
DROP TABLE IF EXISTS `z_discount`;
CREATE TABLE `z_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_price` int(11) NOT NULL DEFAULT '0' COMMENT '满多少',
  `less_price` int(11) NOT NULL DEFAULT '0' COMMENT '减多少',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 1是 2否',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `goods_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品可用；2指定商品可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='满减表';

-- ----------------------------
-- Records of z_discount
-- ----------------------------
INSERT INTO `z_discount` VALUES ('19', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1');

-- ----------------------------
-- Table structure for z_form
-- ----------------------------
DROP TABLE IF EXISTS `z_form`;
CREATE TABLE `z_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` varchar(255) DEFAULT '',
  `uid` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '1未使用2已使用',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户formid记录表';

-- ----------------------------
-- Records of z_form
-- ----------------------------

-- ----------------------------
-- Table structure for z_friend
-- ----------------------------
DROP TABLE IF EXISTS `z_friend`;
CREATE TABLE `z_friend` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='邀请好友';

-- ----------------------------
-- Records of z_friend
-- ----------------------------
INSERT INTO `z_friend` VALUES ('1', '/uploads/20191012/264f6bc85a8dcdf99b35344ce0a1b667.jpg', '1', '1570864763', '1570867021');
INSERT INTO `z_friend` VALUES ('2', '/uploads/20191012/d8feb45982dc6b6b3200371b3c506995.jpg', '11', '1570866799', '1570867161');
INSERT INTO `z_friend` VALUES ('3', '/uploads/20191012/38a5e6886bd14bfdbdaf382810ffc233.jpg', '111', '1570867169', '1570867169');
INSERT INTO `z_friend` VALUES ('4', '/uploads/20191012/2435a7dfb7c7a6050da4b6dc2cbf5fff.jpg', '111', '1570867176', '1570867176');
INSERT INTO `z_friend` VALUES ('5', '/uploads/20191012/13546c2f7ac5981732576c442cd38203.jpg', '11', '1570867508', '1570867508');
INSERT INTO `z_friend` VALUES ('6', '/uploads/20191012/a91ebd31f1fc3996b0ad7c5432d530e6.jpg', '222', '1570867515', '1570867515');

-- ----------------------------
-- Table structure for z_friend_order
-- ----------------------------
DROP TABLE IF EXISTS `z_friend_order`;
CREATE TABLE `z_friend_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `friend_id` int(10) DEFAULT '0',
  `pic` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='领取满足条件的好友奖励';

-- ----------------------------
-- Records of z_friend_order
-- ----------------------------

-- ----------------------------
-- Table structure for z_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_goods`;
CREATE TABLE `z_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品标题',
  `old_title` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现价格',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `images` text COMMENT '相册',
  `desc` text COMMENT '详情',
  `pay_num` int(11) NOT NULL DEFAULT '100' COMMENT '销量',
  `keep` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `is_reco` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐 1否 2是',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架 1上架 2下架 3已售罄',
  `label_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标签信息',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `parameter` text COMMENT '商品参数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `nav_id` varchar(255) DEFAULT '' COMMENT '所属导航栏目',
  `point` int(11) DEFAULT '0' COMMENT '可用积分',
  `quota` int(11) DEFAULT '0' COMMENT '限购数量',
  `false_sales` int(11) DEFAULT '1' COMMENT '假销量',
  `share_pic` varchar(255) DEFAULT NULL COMMENT '分享图片',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '条形码',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '参考库存',
  `use_coupon` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1可以使用优惠券；2不可使用优惠券；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of z_goods
-- ----------------------------
INSERT INTO `z_goods` VALUES ('1', '三星 Galaxy S10（SM-G9730）', '3D超声波屏下指纹超感官全视屏双卡双待全网通4G游戏手机', '3', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '0.00', '/uploads/20190319/92fb801f7f95b9b10bea08e81aab3652.jpg,/uploads/20190319/cd9e534e8d14e4ecaabf8359d245beb4.jpg,/uploads/20190319/f032c475df79643fa8abd59e034c502e.jpg,/uploads/20190319/98955acad8db05ea84c8b384d253324a.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/4938279a7ebbb72b2cddf9b4a3534555.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/48bfc8661e98ca18199c8ab0ccad5c76.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/0bca19ffe91699550aacc3c55d5786e9.jpg\" width=\"300\"></p><p><br></p>', '28', '0', '1', '2', '', '0', '<p><br></p>', '1552984475', '1572245278', '1,2', '0', '0', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('3', '山海经典藏画册', '全新包装', '8', '/uploads/20190320/5bd2a1ab0b26a46f808226dd22d52b3f.jpg', '89.00', '0.00', '/uploads/20190320/b8dd4ab6b76565b29331300120b0469f.jpg,/uploads/20190320/b41181faaf78d9b6c1ea708ad853a7eb.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/3d43a9c73394c280e59d5a3015d5a1df.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/30f46b908508c30408bbd123cabbd86e.jpg\" width=\"300\"></p><p><br></p>', '3', '0', '1', '1', '', '0', null, '1553067979', '1553067979', '1,3', '0', '0', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('4', '追风筝的人', '2018版', '8', '/uploads/20190320/af76bde21bee295e2ff3e7b77112817a.jpg', '39.00', '0.00', '/uploads/20190320/d9dfc4f7e94c5cf8faf5808247b046ad.jpg,/uploads/20190320/7993802138d0f3ec3daf7ea2de4dc8fb.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/13836345330d21e6f6e82397806a4143.jpg\" width=\"300\"></p><p><br></p>', '1', '0', '1', '2', '', '0', '<p><br></p>', '1553068109', '1572340256', '1,2,3', '20', '0', '1', null, '', '0', '1');
INSERT INTO `z_goods` VALUES ('5', '广西高乐蜜芒果', '单果250g以上 新鲜水果', '10', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '2.00', '1.00', '/uploads/20190320/eabd4a9872befed3e917e54932307263.jpg,/uploads/20190320/e02ee321c179598be477abc2bc17d0c0.jpg,/uploads/20190320/d217a6fc2d7cb0a2fad5de8baf98bcf5.jpg,/uploads/20190320/c2870ced9db34fed2c2faf02257bd73c.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/c4d516242fc714eb70fa820b85dbbfaa.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/2d2180b82f937132e5aaa55c2fc9203b.jpg\" width=\"300\"></p><p><br></p>', '20', '0', '1', '1', '', '0', '<p><br></p>', '1553069304', '1572339927', '1,3', '10', '3', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('6', 'MAC魅可19年新春限定联名口红', '王者荣耀限量合作版', '13', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '289.00', '0.00', '/uploads/20190506/4459c423ceb3ce6c004da948b345675a.jpg,/uploads/20190506/3120754c0af740facf43060869a5340a.jpg,/uploads/20190506/0cb82522b879ff5799dc135b5e108f02.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/aaa04974e6c48290284d45f8145edd4a.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/d878c435b63529dd29182236bfd18094.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/661b737a08ae19ef83daa449c3b4837e.jpg\" width=\"300\"></p><p><br></p>', '3', '0', '1', '1', '2', '0', '<p><br></p>', '1557125446', '1569485669', '1', '0', '0', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '补水面膜保湿化妆品护肤套装', '12', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '119.00', '0.00', '/uploads/20190506/805dd349c35e6272b22088871e166ef6.jpg,/uploads/20190506/58deb31ee8df402a8e9f46fd3b810ea6.jpg,/uploads/20190725/fabbfe193e56bf7699f9aad885410c9e.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/273444276c932bc48c7224d1b498b1c0.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/a042bc91704e43722900f47df9736f37.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/83dfcd9baf2ce7056ae7e226b1c6a902.jpg\" width=\"300\"></p><p><br></p>', '16', '0', '1', '1', '', '0', '<p>发货地：&nbsp; &nbsp;北京</p><p>运费：&nbsp; &nbsp; &nbsp; &nbsp;全国包邮</p>', '1557125537', '1565428447', '', '0', '0', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('8', '商品标题', '商品副标题', '14', '/uploads/20190727/6f095ec69b26047bb0d4124d84afc670.png', '0.00', '0.00', '/uploads/20190727/b4abb985ebfe2b5283c3e40f1c603d0f.png', '<p>11</p>', '0', '0', '1', '1', '3', '0', '<p>22</p>', '1564209933', '1564209933', '1', '100', '0', '1', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('11', '敷尔佳白膜', '包邮', '12', '/uploads/20190925/947094e65469e420893673c89e204fc7.jpg', '0.00', '0.00', '/uploads/20190925/0bf71d1f2aab463b09ecb8c4d8236fd8.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190925/d83b43f9688284b710cb6d915bf88a25.jpg\" width=\"300\"></p><p><br></p>', '2', '0', '1', '3', '', '0', '<p><br></p>', '1569393658', '1571297648', '', '87', '100', '129', null, '', '100', '1');
INSERT INTO `z_goods` VALUES ('12', '敷尔佳白膜', '包邮', '12', '/uploads/20190925/6e3dcd3a8417ea8f3b9179738dbe5b6a.jpg', '0.00', '0.00', '/uploads/20190925/0bf71d1f2aab463b09ecb8c4d8236fd8.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190925/d83b43f9688284b710cb6d915bf88a25.jpg\" width=\"300\"></p><p><br></p>', '0', '0', '1', '2', '', '0', '<p><br></p>', '1569393664', '1571296947', '', '87', '100', '122', null, '', '100', '1');

-- ----------------------------
-- Table structure for z_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_attr`;
CREATE TABLE `z_goods_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `ap_id` int(11) NOT NULL COMMENT 'sku id 用于初始化',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of z_goods_attr
-- ----------------------------
INSERT INTO `z_goods_attr` VALUES ('1', '颜色', '1', '1', '1552984640', '1572244851');
INSERT INTO `z_goods_attr` VALUES ('2', '版本', '1', '2', '1552984640', '1572244851');
INSERT INTO `z_goods_attr` VALUES ('5', '颜色', '2', '1', '1553067269', '1563199534');
INSERT INTO `z_goods_attr` VALUES ('6', '版本', '2', '2', '1553067269', '1563199534');
INSERT INTO `z_goods_attr` VALUES ('7', '套装', '3', '1', '1553068015', '1563199526');
INSERT INTO `z_goods_attr` VALUES ('8', '默认属性', '4', '1', '1553068200', '1572340267');
INSERT INTO `z_goods_attr` VALUES ('9', '默认属性', '5', '1', '1553069462', '1571043913');
INSERT INTO `z_goods_attr` VALUES ('10', '色号', '6', '1', '1557125479', '1564219045');
INSERT INTO `z_goods_attr` VALUES ('11', '规格', '7', '1', '1557125571', '1565425736');
INSERT INTO `z_goods_attr` VALUES ('12', '规格', '8', '1', '1564209995', '1565425742');
INSERT INTO `z_goods_attr` VALUES ('13', '测试装', '9', '1', '1568271030', '1568271075');
INSERT INTO `z_goods_attr` VALUES ('14', '1', '10', '1', '1568630386', '1568630386');
INSERT INTO `z_goods_attr` VALUES ('15', '敷尔佳白膜一盒', '11', '1', '1569393901', '1569393901');
INSERT INTO `z_goods_attr` VALUES ('16', '红色', '13', '1', '1571296573', '1571296573');
INSERT INTO `z_goods_attr` VALUES ('17', 'as', '13', '2', '1571296573', '1571296573');
INSERT INTO `z_goods_attr` VALUES ('18', 'qq', '12', '1', '1571296617', '1571296617');

-- ----------------------------
-- Table structure for z_goods_count
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_count`;
CREATE TABLE `z_goods_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT '0' COMMENT '商品id',
  `uid` int(10) DEFAULT '0',
  `visit` int(10) DEFAULT '0' COMMENT '访问次数',
  `number` int(10) DEFAULT '0' COMMENT '访问人数',
  `add_number` int(10) DEFAULT '0' COMMENT '加购人数',
  `buy` int(10) DEFAULT '0' COMMENT '购买人数',
  `add_count` int(10) DEFAULT '0' COMMENT '加购总人数',
  `add_num` int(10) DEFAULT '0' COMMENT '加购总件数',
  `add_money` decimal(10,2) DEFAULT '0.00' COMMENT '加购总金额',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='商品统计';

-- ----------------------------
-- Records of z_goods_count
-- ----------------------------
INSERT INTO `z_goods_count` VALUES ('1', '8', '33', '4', '4', '12', '21', '48', '60', '77.00', '1565404066', '1565404066');
INSERT INTO `z_goods_count` VALUES ('2', '8', '33', '4', '7', '3', '8', '3', '3', '70.00', '1565329509', '1565329509');
INSERT INTO `z_goods_count` VALUES ('3', '7', '33', '12', '3', '22', '7', '24', '24', '508.00', '1565243109', '1565243109');
INSERT INTO `z_goods_count` VALUES ('4', '7', '1', '17', '4', '37', '9', '26', '23', '67.00', '1565156709', '1564983909');
INSERT INTO `z_goods_count` VALUES ('5', '1', '33', '18', '18', '63', '1', '63', '63', '63.00', '1565424081', '1565424081');
INSERT INTO `z_goods_count` VALUES ('6', '5', '33', '2', '2', '28', '0', '28', '28', '28.00', '1565424144', '1565424144');
INSERT INTO `z_goods_count` VALUES ('7', '6', '33', '9', '9', '7', '0', '7', '7', '7.00', '1565424642', '1565424642');
INSERT INTO `z_goods_count` VALUES ('8', '3', '33', '1', '1', '2', '0', '2', '2', '2.00', '1565428999', '1565428999');
INSERT INTO `z_goods_count` VALUES ('9', '1', '33', '2', '2', '57', '0', '57', '57', '57.00', '1565681021', '1565681021');
INSERT INTO `z_goods_count` VALUES ('10', '1', '28', '1', '1', '57', '0', '57', '57', '57.00', '1565689225', '1565689225');
INSERT INTO `z_goods_count` VALUES ('11', '4', '28', '1', '1', '3', '0', '3', '3', '3.00', '1565689370', '1565689370');
INSERT INTO `z_goods_count` VALUES ('12', '1', '28', '5', '5', '57', '6', '57', '57', '57.00', '1565746124', '1565746124');
INSERT INTO `z_goods_count` VALUES ('13', '6', '28', '4', '4', '5', '0', '5', '5', '5.00', '1565746194', '1565746194');
INSERT INTO `z_goods_count` VALUES ('14', '8', '28', '5', '5', '2', '0', '2', '2', '2.00', '1565752840', '1565752840');
INSERT INTO `z_goods_count` VALUES ('15', '5', '28', '3', '3', '25', '0', '25', '25', '25.00', '1565768572', '1565768572');
INSERT INTO `z_goods_count` VALUES ('16', '1', '34', '3', '3', '57', '0', '57', '57', '57.00', '1565770579', '1565770579');
INSERT INTO `z_goods_count` VALUES ('17', '5', '34', '1', '1', '24', '0', '24', '24', '24.00', '1565770655', '1565770655');
INSERT INTO `z_goods_count` VALUES ('18', '6', '34', '1', '1', '5', '0', '5', '5', '5.00', '1565770683', '1565770683');
INSERT INTO `z_goods_count` VALUES ('19', '7', '34', '1', '1', '20', '0', '20', '20', '20.00', '1565770693', '1565770693');
INSERT INTO `z_goods_count` VALUES ('20', '1', '33', '1', '1', '57', '0', '57', '57', '57.00', '1565778706', '1565778706');
INSERT INTO `z_goods_count` VALUES ('21', '7', '28', '3', '3', '20', '0', '20', '20', '20.00', '1565781963', '1565781963');
INSERT INTO `z_goods_count` VALUES ('22', '3', '28', '2', '2', '2', '0', '2', '2', '2.00', '1565781971', '1565781971');
INSERT INTO `z_goods_count` VALUES ('23', '5', '13', '1', '1', '19', '0', '19', '19', '19.00', '1565783528', '1565783528');
INSERT INTO `z_goods_count` VALUES ('24', '4', '13', '2', '2', '3', '0', '3', '3', '3.00', '1565788921', '1565788921');
INSERT INTO `z_goods_count` VALUES ('25', '3', '13', '1', '1', '2', '0', '2', '2', '2.00', '1565789348', '1565789348');
INSERT INTO `z_goods_count` VALUES ('26', '1', '13', '1', '1', '57', '0', '57', '57', '57.00', '1565790522', '1565790522');
INSERT INTO `z_goods_count` VALUES ('27', '8', '13', '1', '1', '2', '0', '2', '2', '2.00', '1565791538', '1565791538');
INSERT INTO `z_goods_count` VALUES ('28', '1', '33', '6', '6', '57', '11', '57', '57', '57.00', '1565832265', '1565832265');
INSERT INTO `z_goods_count` VALUES ('29', '8', '33', '1', '1', '2', '0', '2', '2', '2.00', '1565867252', '1565867252');
INSERT INTO `z_goods_count` VALUES ('30', '5', '33', '1', '1', '19', '0', '19', '19', '19.00', '1565869383', '1565869383');
INSERT INTO `z_goods_count` VALUES ('31', '1', '33', '7', '7', '47', '0', '47', '47', '47.00', '1566028356', '1566028356');
INSERT INTO `z_goods_count` VALUES ('32', '5', '33', '1', '1', '18', '0', '18', '18', '18.00', '1566028409', '1566028409');
INSERT INTO `z_goods_count` VALUES ('33', '1', '33', '7', '7', '47', '3', '47', '47', '47.00', '1566608596', '1566608596');
INSERT INTO `z_goods_count` VALUES ('34', '7', '33', '5', '5', '20', '2', '20', '20', '20.00', '1566785777', '1566785777');
INSERT INTO `z_goods_count` VALUES ('35', '1', '33', '13', '13', '44', '0', '44', '44', '44.00', '1566785796', '1566785796');
INSERT INTO `z_goods_count` VALUES ('36', '6', '33', '5', '5', '5', '0', '5', '5', '5.00', '1566785838', '1566785838');
INSERT INTO `z_goods_count` VALUES ('37', '5', '33', '8', '8', '18', '0', '18', '18', '18.00', '1566785906', '1566785906');
INSERT INTO `z_goods_count` VALUES ('38', '3', '21', '1', '1', '2', '8', '2', '2', '2.00', '1568274888', '1568274888');
INSERT INTO `z_goods_count` VALUES ('39', '9', '21', '3', '3', '0', '0', '0', '0', '0.00', '1568274906', '1568274906');
INSERT INTO `z_goods_count` VALUES ('40', '5', '21', '1', '1', '18', '0', '18', '18', '18.00', '1568276040', '1568276040');
INSERT INTO `z_goods_count` VALUES ('41', '6', '21', '1', '1', '5', '0', '5', '5', '5.00', '1568276107', '1568276107');
INSERT INTO `z_goods_count` VALUES ('42', '4', '21', '1', '1', '3', '0', '3', '3', '3.00', '1568276251', '1568276251');
INSERT INTO `z_goods_count` VALUES ('43', '1', '11', '5', '5', '42', '0', '42', '42', '42.00', '1568278501', '1568278501');
INSERT INTO `z_goods_count` VALUES ('44', '6', '33', '1', '1', '3', '0', '3', '3', '3.00', '1568278794', '1568278794');
INSERT INTO `z_goods_count` VALUES ('45', '1', '33', '5', '5', '37', '0', '37', '37', '37.00', '1568278803', '1568278803');
INSERT INTO `z_goods_count` VALUES ('46', '6', '33', '2', '2', '3', '0', '3', '3', '3.00', '1568595569', '1568595569');
INSERT INTO `z_goods_count` VALUES ('47', '1', '33', '6', '6', '37', '0', '37', '37', '37.00', '1568596580', '1568596580');
INSERT INTO `z_goods_count` VALUES ('48', '5', '33', '1', '1', '18', '0', '18', '18', '18.00', '1568597216', '1568597216');
INSERT INTO `z_goods_count` VALUES ('49', '3', '33', '1', '1', '2', '0', '2', '2', '2.00', '1568597225', '1568597225');
INSERT INTO `z_goods_count` VALUES ('50', '4', '33', '1', '1', '2', '0', '2', '2', '2.00', '1568597232', '1568597232');
INSERT INTO `z_goods_count` VALUES ('51', '1', '21', '1', '1', '37', '0', '37', '37', '37.00', '1568630176', '1568630176');
INSERT INTO `z_goods_count` VALUES ('52', '10', '21', '1', '1', '0', '0', '0', '0', '0.00', '1568630402', '1568630402');
INSERT INTO `z_goods_count` VALUES ('53', '1', '33', '7', '7', '37', '1', '37', '37', '37.00', '1568682054', '1568682054');
INSERT INTO `z_goods_count` VALUES ('54', '1', '33', '2', '2', '36', '0', '36', '36', '36.00', '1568774610', '1568774610');
INSERT INTO `z_goods_count` VALUES ('55', '10', '33', '1', '1', '0', '0', '0', '0', '0.00', '1568821353', '1568821353');
INSERT INTO `z_goods_count` VALUES ('56', '5', '33', '1', '1', '18', '6', '18', '18', '18.00', '1568855731', '1568855731');
INSERT INTO `z_goods_count` VALUES ('57', '6', '33', '1', '1', '3', '0', '3', '3', '3.00', '1568886096', '1568886096');
INSERT INTO `z_goods_count` VALUES ('58', '1', '33', '3', '3', '36', '0', '36', '36', '36.00', '1568886162', '1568886162');
INSERT INTO `z_goods_count` VALUES ('59', '5', '35', '1', '1', '16', '0', '16', '16', '16.00', '1568886964', '1568886964');
INSERT INTO `z_goods_count` VALUES ('60', '1', '33', '39', '39', '32', '34', '32', '32', '32.00', '1568941792', '1568941792');
INSERT INTO `z_goods_count` VALUES ('61', '5', '33', '7', '7', '16', '0', '16', '16', '16.00', '1568946239', '1568946239');
INSERT INTO `z_goods_count` VALUES ('62', '7', '33', '7', '7', '20', '0', '20', '20', '20.00', '1568948639', '1568948639');
INSERT INTO `z_goods_count` VALUES ('63', '8', '28', '3', '3', '2', '0', '2', '2', '2.00', '1568961346', '1568961346');
INSERT INTO `z_goods_count` VALUES ('64', '1', '35', '1', '1', '29', '0', '29', '29', '29.00', '1568964228', '1568964228');
INSERT INTO `z_goods_count` VALUES ('65', '6', '32', '3', '3', '3', '0', '3', '3', '3.00', '1568968256', '1568968256');
INSERT INTO `z_goods_count` VALUES ('66', '5', '32', '1', '1', '15', '0', '15', '15', '15.00', '1568968360', '1568968360');
INSERT INTO `z_goods_count` VALUES ('67', '6', '33', '14', '14', '3', '0', '3', '3', '3.00', '1568968392', '1568968392');
INSERT INTO `z_goods_count` VALUES ('68', '6', '28', '11', '11', '3', '0', '3', '3', '3.00', '1568968398', '1568968398');
INSERT INTO `z_goods_count` VALUES ('69', '7', '28', '16', '16', '20', '0', '20', '20', '20.00', '1568968477', '1568968477');
INSERT INTO `z_goods_count` VALUES ('70', '8', '27', '1', '1', '2', '0', '2', '2', '2.00', '1568971245', '1568971245');
INSERT INTO `z_goods_count` VALUES ('71', '1', '27', '2', '2', '19', '0', '19', '19', '19.00', '1568971271', '1568971271');
INSERT INTO `z_goods_count` VALUES ('72', '6', '27', '1', '1', '3', '0', '3', '3', '3.00', '1568971273', '1568971273');
INSERT INTO `z_goods_count` VALUES ('73', '5', '27', '2', '2', '15', '0', '15', '15', '15.00', '1568971324', '1568971324');
INSERT INTO `z_goods_count` VALUES ('74', '3', '28', '7', '7', '2', '0', '2', '2', '2.00', '1568972881', '1568972881');
INSERT INTO `z_goods_count` VALUES ('75', '5', '28', '17', '17', '15', '0', '15', '15', '15.00', '1568973280', '1568973280');
INSERT INTO `z_goods_count` VALUES ('76', '1', '28', '24', '24', '19', '0', '19', '19', '19.00', '1568973465', '1568973465');
INSERT INTO `z_goods_count` VALUES ('77', '9', '33', '1', '1', '0', '0', '0', '0', '0.00', '1568974105', '1568974105');
INSERT INTO `z_goods_count` VALUES ('78', '4', '33', '3', '3', '2', '0', '2', '2', '2.00', '1568974300', '1568974300');
INSERT INTO `z_goods_count` VALUES ('79', '4', '12', '8', '8', '2', '0', '2', '2', '2.00', '1568979240', '1568979240');
INSERT INTO `z_goods_count` VALUES ('80', '7', '36', '1', '1', '19', '0', '19', '19', '19.00', '1568979397', '1568979397');
INSERT INTO `z_goods_count` VALUES ('81', '3', '12', '9', '9', '2', '0', '2', '2', '2.00', '1568979432', '1568979432');
INSERT INTO `z_goods_count` VALUES ('82', '5', '12', '1', '1', '13', '0', '13', '13', '13.00', '1568979643', '1568979643');
INSERT INTO `z_goods_count` VALUES ('83', '4', '28', '3', '3', '2', '0', '2', '2', '2.00', '1568979826', '1568979826');
INSERT INTO `z_goods_count` VALUES ('84', '10', '28', '1', '1', '0', '0', '0', '0', '0.00', '1568980421', '1568980421');
INSERT INTO `z_goods_count` VALUES ('85', '1', '33', '6', '6', '9', '4', '9', '9', '9.00', '1569054251', '1569054251');
INSERT INTO `z_goods_count` VALUES ('86', '1', '41', '2', '2', '8', '0', '8', '8', '8.00', '1569059321', '1569059321');
INSERT INTO `z_goods_count` VALUES ('87', '7', '41', '2', '2', '19', '0', '19', '19', '19.00', '1569059487', '1569059487');
INSERT INTO `z_goods_count` VALUES ('88', '10', '21', '1', '1', '0', '0', '0', '0', '0.00', '1569319068', '1569319068');
INSERT INTO `z_goods_count` VALUES ('89', '5', '21', '1', '1', '10', '4', '10', '10', '10.00', '1569380181', '1569380181');
INSERT INTO `z_goods_count` VALUES ('90', '9', '21', '1', '1', '0', '0', '0', '0', '0.00', '1569393147', '1569393147');
INSERT INTO `z_goods_count` VALUES ('91', '8', '21', '1', '1', '0', '0', '0', '0', '0.00', '1569393167', '1569393167');
INSERT INTO `z_goods_count` VALUES ('92', '11', '21', '2', '2', '3', '0', '3', '3', '3.00', '1569406366', '1569406366');
INSERT INTO `z_goods_count` VALUES ('93', '1', '21', '2', '2', '5', '0', '5', '5', '5.00', '1569481857', '1569481857');
INSERT INTO `z_goods_count` VALUES ('94', '6', '21', '2', '2', '1', '0', '1', '1', '1.00', '1569481875', '1569481875');
INSERT INTO `z_goods_count` VALUES ('95', '7', '21', '1', '1', '19', '0', '19', '19', '19.00', '1569481884', '1569481884');
INSERT INTO `z_goods_count` VALUES ('96', '3', '21', '1', '1', '2', '0', '2', '2', '2.00', '1569486605', '1569486605');
INSERT INTO `z_goods_count` VALUES ('97', '5', '21', '1', '1', '6', '0', '6', '6', '6.00', '1569486650', '1569486650');
INSERT INTO `z_goods_count` VALUES ('98', '1', '31', '1', '1', '5', '1', '5', '5', '5.00', '1569573762', '1569573762');
INSERT INTO `z_goods_count` VALUES ('99', '8', '11', '1', '1', '0', '0', '0', '0', '0.00', '1569574419', '1569574419');
INSERT INTO `z_goods_count` VALUES ('100', '6', '11', '3', '3', '1', '0', '1', '1', '1.00', '1569574428', '1569574428');
INSERT INTO `z_goods_count` VALUES ('101', '4', '11', '1', '1', '2', '0', '2', '2', '2.00', '1569574486', '1569574486');
INSERT INTO `z_goods_count` VALUES ('102', '1', '11', '5', '5', '5', '0', '5', '5', '5.00', '1569574538', '1569574538');
INSERT INTO `z_goods_count` VALUES ('103', '5', '21', '2', '2', '6', '0', '6', '6', '6.00', '1569574541', '1569574541');
INSERT INTO `z_goods_count` VALUES ('104', '5', '41', '1', '1', '6', '0', '6', '6', '6.00', '1569574550', '1569574550');
INSERT INTO `z_goods_count` VALUES ('105', '1', '40', '1', '1', '5', '0', '5', '5', '5.00', '1569574572', '1569574572');
INSERT INTO `z_goods_count` VALUES ('106', '5', '40', '1', '1', '6', '0', '6', '6', '6.00', '1569574598', '1569574598');
INSERT INTO `z_goods_count` VALUES ('107', '5', '11', '3', '3', '6', '0', '6', '6', '6.00', '1569574605', '1569574605');
INSERT INTO `z_goods_count` VALUES ('108', '11', '33', '1', '1', '3', '0', '3', '3', '3.00', '1569574790', '1569574790');
INSERT INTO `z_goods_count` VALUES ('109', '5', '31', '1', '1', '6', '0', '6', '6', '6.00', '1569575509', '1569575509');
INSERT INTO `z_goods_count` VALUES ('110', '6', '40', '1', '1', '1', '0', '1', '1', '1.00', '1569575757', '1569575757');
INSERT INTO `z_goods_count` VALUES ('111', '6', '31', '1', '1', '1', '0', '1', '1', '1.00', '1569575761', '1569575761');
INSERT INTO `z_goods_count` VALUES ('112', '7', '41', '1', '1', '19', '0', '19', '19', '19.00', '1569575912', '1569575912');
INSERT INTO `z_goods_count` VALUES ('113', '1', '21', '1', '1', '5', '0', '5', '5', '5.00', '1569576447', '1569576447');
INSERT INTO `z_goods_count` VALUES ('114', '1', '33', '2', '2', '5', '0', '5', '5', '5.00', '1569576457', '1569576457');
INSERT INTO `z_goods_count` VALUES ('115', '8', '21', '2', '2', '0', '0', '0', '0', '0.00', '1569576769', '1569576769');
INSERT INTO `z_goods_count` VALUES ('116', '8', '33', '1', '1', '0', '0', '0', '0', '0.00', '1569576797', '1569576797');
INSERT INTO `z_goods_count` VALUES ('117', '12', '33', '1', '1', '0', '0', '0', '0', '0.00', '1569951647', '1569951647');
INSERT INTO `z_goods_count` VALUES ('118', '5', '33', '1', '1', '6', '0', '6', '6', '6.00', '1570010476', '1570010476');
INSERT INTO `z_goods_count` VALUES ('119', '12', '33', '1', '1', '0', '0', '0', '0', '0.00', '1570549901', '1570549901');
INSERT INTO `z_goods_count` VALUES ('120', '1', '40', '1', '1', '5', '0', '5', '5', '5.00', '1570672107', '1570672107');
INSERT INTO `z_goods_count` VALUES ('121', '5', '33', '1', '1', '6', '0', '6', '6', '6.00', '1570762737', '1570762737');
INSERT INTO `z_goods_count` VALUES ('122', '8', '33', '1', '1', '0', '0', '0', '0', '0.00', '1570862644', '1570862644');
INSERT INTO `z_goods_count` VALUES ('123', '1', '33', '3', '3', '5', '0', '5', '5', '5.00', '1570868845', '1570868845');
INSERT INTO `z_goods_count` VALUES ('124', '5', '33', '2', '2', '6', '0', '6', '6', '6.00', '1570869332', '1570869332');
INSERT INTO `z_goods_count` VALUES ('125', '1', '33', '5', '5', '5', '2', '5', '5', '5.00', '1570936447', '1570936447');
INSERT INTO `z_goods_count` VALUES ('126', '3', '33', '1', '1', '2', '0', '2', '2', '2.00', '1570936800', '1570936800');
INSERT INTO `z_goods_count` VALUES ('127', '5', '33', '1', '1', '6', '0', '6', '6', '6.00', '1570936809', '1570936809');
INSERT INTO `z_goods_count` VALUES ('128', '1', '33', '27', '27', '3', '1', '3', '3', '3.00', '1571017392', '1571017392');
INSERT INTO `z_goods_count` VALUES ('129', '5', '33', '10', '10', '6', '0', '6', '6', '6.00', '1571017406', '1571017406');
INSERT INTO `z_goods_count` VALUES ('130', '5', '41', '1', '1', '6', '0', '6', '6', '6.00', '1571042194', '1571042194');
INSERT INTO `z_goods_count` VALUES ('131', '4', '33', '8', '8', '2', '0', '2', '2', '2.00', '1571042405', '1571042405');
INSERT INTO `z_goods_count` VALUES ('132', '7', '33', '3', '3', '18', '0', '18', '18', '18.00', '1571056138', '1571056138');
INSERT INTO `z_goods_count` VALUES ('133', '6', '33', '1', '1', '1', '0', '1', '1', '1.00', '1571056538', '1571056538');
INSERT INTO `z_goods_count` VALUES ('134', '5', '33', '4', '4', '6', '16', '6', '6', '6.00', '1571105287', '1571105287');
INSERT INTO `z_goods_count` VALUES ('135', '13', '33', '1', '1', '0', '0', '0', '0', '0.00', '1571109861', '1571109861');
INSERT INTO `z_goods_count` VALUES ('136', '12', '33', '2', '2', '0', '0', '0', '0', '0.00', '1571109902', '1571109902');
INSERT INTO `z_goods_count` VALUES ('137', '4', '33', '4', '4', '1', '0', '1', '1', '1.00', '1571109908', '1571109908');
INSERT INTO `z_goods_count` VALUES ('138', '8', '33', '1', '1', '0', '0', '0', '0', '0.00', '1571119441', '1571119441');
INSERT INTO `z_goods_count` VALUES ('139', '1', '33', '13', '13', '3', '0', '3', '3', '3.00', '1571120192', '1571120192');
INSERT INTO `z_goods_count` VALUES ('140', '11', '33', '1', '1', '3', '0', '3', '3', '3.00', '1571121671', '1571121671');
INSERT INTO `z_goods_count` VALUES ('141', '7', '33', '23', '23', '18', '0', '18', '18', '18.00', '1571122550', '1571122550');
INSERT INTO `z_goods_count` VALUES ('142', '14', '33', '1', '1', '0', '0', '0', '0', '0.00', '1571122654', '1571122654');
INSERT INTO `z_goods_count` VALUES ('143', '3', '41', '3', '3', '2', '0', '2', '2', '2.00', '1571131562', '1571131562');
INSERT INTO `z_goods_count` VALUES ('144', '3', '33', '1', '1', '2', '0', '2', '2', '2.00', '1571131686', '1571131686');
INSERT INTO `z_goods_count` VALUES ('145', '6', '33', '1', '1', '1', '0', '1', '1', '1.00', '1571133312', '1571133312');
INSERT INTO `z_goods_count` VALUES ('146', '3', '29', '1', '1', '2', '0', '2', '2', '2.00', '1571133779', '1571133779');
INSERT INTO `z_goods_count` VALUES ('147', '1', '44', '6', '6', '3', '0', '3', '3', '3.00', '1571134177', '1571134177');
INSERT INTO `z_goods_count` VALUES ('148', '5', '44', '2', '2', '6', '0', '6', '6', '6.00', '1571134304', '1571134304');
INSERT INTO `z_goods_count` VALUES ('149', '13', '44', '1', '1', '0', '0', '0', '0', '0.00', '1571134409', '1571134409');
INSERT INTO `z_goods_count` VALUES ('150', '8', '44', '4', '4', '0', '0', '0', '0', '0.00', '1571134425', '1571134425');
INSERT INTO `z_goods_count` VALUES ('151', '7', '44', '5', '5', '7', '0', '7', '7', '7.00', '1571134475', '1571134475');
INSERT INTO `z_goods_count` VALUES ('152', '7', '46', '1', '1', '7', '0', '7', '7', '7.00', '1571134617', '1571134617');
INSERT INTO `z_goods_count` VALUES ('153', '3', '44', '1', '1', '1', '0', '1', '1', '1.00', '1571136004', '1571136004');
INSERT INTO `z_goods_count` VALUES ('154', '12', '44', '1', '1', '0', '8', '0', '0', '0.00', '1571187207', '1571187207');
INSERT INTO `z_goods_count` VALUES ('155', '7', '44', '1', '1', '5', '0', '5', '5', '5.00', '1571187238', '1571187238');
INSERT INTO `z_goods_count` VALUES ('156', '5', '44', '1', '1', '5', '0', '5', '5', '5.00', '1571187252', '1571187252');
INSERT INTO `z_goods_count` VALUES ('157', '5', '48', '2', '2', '5', '0', '5', '5', '5.00', '1571187817', '1571187817');
INSERT INTO `z_goods_count` VALUES ('158', '7', '48', '2', '2', '5', '0', '5', '5', '5.00', '1571187850', '1571187850');
INSERT INTO `z_goods_count` VALUES ('159', '4', '48', '1', '1', '1', '0', '1', '1', '1.00', '1571187902', '1571187902');
INSERT INTO `z_goods_count` VALUES ('160', '6', '48', '1', '1', '1', '0', '1', '1', '1.00', '1571187924', '1571187924');
INSERT INTO `z_goods_count` VALUES ('161', '12', '48', '1', '1', '0', '0', '0', '0', '0.00', '1571187948', '1571187948');
INSERT INTO `z_goods_count` VALUES ('162', '1', '49', '2', '2', '2', '0', '2', '2', '2.00', '1571188201', '1571188201');
INSERT INTO `z_goods_count` VALUES ('163', '7', '49', '2', '2', '5', '0', '5', '5', '5.00', '1571188318', '1571188318');
INSERT INTO `z_goods_count` VALUES ('164', '5', '49', '2', '2', '4', '0', '4', '4', '4.00', '1571192000', '1571192000');
INSERT INTO `z_goods_count` VALUES ('165', '1', '33', '2', '2', '0', '0', '0', '0', '0.00', '1571197001', '1571197001');
INSERT INTO `z_goods_count` VALUES ('166', '3', '33', '2', '2', '1', '0', '1', '1', '1.00', '1571197254', '1571197254');
INSERT INTO `z_goods_count` VALUES ('167', '4', '33', '1', '1', '0', '0', '0', '0', '0.00', '1571208938', '1571208938');
INSERT INTO `z_goods_count` VALUES ('168', '1', '26', '1', '1', '0', '3', '0', '0', '0.00', '1571274080', '1571274080');
INSERT INTO `z_goods_count` VALUES ('169', '7', '33', '1', '1', '3', '0', '3', '3', '3.00', '1571278640', '1571278640');
INSERT INTO `z_goods_count` VALUES ('170', '12', '21', '5', '5', '0', '0', '0', '0', '0.00', '1571294509', '1571294509');
INSERT INTO `z_goods_count` VALUES ('171', '12', '40', '11', '11', '0', '0', '0', '0', '0.00', '1571295878', '1571295878');
INSERT INTO `z_goods_count` VALUES ('172', '13', '40', '2', '2', '0', '0', '0', '0', '0.00', '1571295885', '1571295885');
INSERT INTO `z_goods_count` VALUES ('173', '1', '33', '2', '2', '0', '0', '0', '0', '0.00', '1571296562', '1571296562');
INSERT INTO `z_goods_count` VALUES ('174', '12', '33', '6', '6', '0', '0', '0', '0', '0.00', '1571296672', '1571296672');
INSERT INTO `z_goods_count` VALUES ('175', '12', '35', '2', '2', '0', '0', '0', '0', '0.00', '1571296856', '1571296856');
INSERT INTO `z_goods_count` VALUES ('176', '11', '33', '1', '1', '3', '0', '3', '3', '3.00', '1571296864', '1571296864');
INSERT INTO `z_goods_count` VALUES ('177', '11', '40', '1', '1', '3', '0', '3', '3', '3.00', '1571296864', '1571296864');
INSERT INTO `z_goods_count` VALUES ('178', '3', '40', '2', '2', '0', '0', '0', '0', '0.00', '1571296867', '1571296867');
INSERT INTO `z_goods_count` VALUES ('179', '1', '40', '4', '4', '0', '0', '0', '0', '0.00', '1571296873', '1571296873');
INSERT INTO `z_goods_count` VALUES ('180', '11', '21', '1', '1', '3', '0', '3', '3', '3.00', '1571296955', '1571296955');
INSERT INTO `z_goods_count` VALUES ('181', '6', '40', '2', '2', '0', '0', '0', '0', '0.00', '1571296957', '1571296957');
INSERT INTO `z_goods_count` VALUES ('182', '4', '40', '1', '1', '0', '0', '0', '0', '0.00', '1571296959', '1571296959');
INSERT INTO `z_goods_count` VALUES ('183', '6', '33', '1', '1', '0', '0', '0', '0', '0.00', '1571297167', '1571297167');
INSERT INTO `z_goods_count` VALUES ('184', '7', '40', '1', '1', '3', '0', '3', '3', '3.00', '1571298339', '1571298339');
INSERT INTO `z_goods_count` VALUES ('185', '6', '26', '1', '1', '0', '0', '0', '0', '0.00', '1571298591', '1571298591');
INSERT INTO `z_goods_count` VALUES ('186', '13', '26', '1', '1', '0', '0', '0', '0', '0.00', '1571298670', '1571298670');
INSERT INTO `z_goods_count` VALUES ('187', '12', '26', '2', '2', '0', '0', '0', '0', '0.00', '1571298774', '1571298774');
INSERT INTO `z_goods_count` VALUES ('188', '5', '40', '2', '2', '4', '0', '4', '4', '4.00', '1571299070', '1571299070');
INSERT INTO `z_goods_count` VALUES ('189', '5', '26', '1', '1', '3', '0', '3', '3', '3.00', '1571300251', '1571300251');
INSERT INTO `z_goods_count` VALUES ('190', '7', '26', '2', '2', '2', '0', '2', '2', '2.00', '1571300316', '1571300316');
INSERT INTO `z_goods_count` VALUES ('191', '5', '33', '1', '1', '3', '0', '3', '3', '3.00', '1571302536', '1571302536');
INSERT INTO `z_goods_count` VALUES ('192', '1', '33', '5', '5', '0', '0', '0', '0', '0.00', '1572053821', '1572053821');
INSERT INTO `z_goods_count` VALUES ('193', '3', '33', '2', '2', '0', '0', '0', '0', '0.00', '1572054179', '1572054179');
INSERT INTO `z_goods_count` VALUES ('194', '7', '33', '1', '1', '1', '0', '1', '1', '1.00', '1572054590', '1572054590');
INSERT INTO `z_goods_count` VALUES ('195', '1', '35', '1', '1', '0', '0', '0', '0', '0.00', '1572244762', '1572244762');
INSERT INTO `z_goods_count` VALUES ('196', '1', '33', '1', '1', '0', '0', '0', '0', '0.00', '1572245467', '1572245467');
INSERT INTO `z_goods_count` VALUES ('197', '5', '33', '5', '5', '3', '0', '3', '3', '3.00', '1572245538', '1572245538');
INSERT INTO `z_goods_count` VALUES ('198', '6', '33', '2', '2', '0', '1', '0', '0', '0.00', '1572312069', '1572312069');
INSERT INTO `z_goods_count` VALUES ('199', '5', '33', '9', '9', '3', '0', '3', '3', '3.00', '1572312213', '1572312213');
INSERT INTO `z_goods_count` VALUES ('200', '11', '33', '2', '2', '3', '0', '3', '3', '3.00', '1572312254', '1572312254');
INSERT INTO `z_goods_count` VALUES ('201', '12', '33', '3', '3', '0', '0', '0', '0', '0.00', '1572312358', '1572312358');
INSERT INTO `z_goods_count` VALUES ('202', '8', '33', '1', '1', '0', '0', '0', '0', '0.00', '1572335156', '1572335156');
INSERT INTO `z_goods_count` VALUES ('203', '3', '33', '2', '2', '0', '0', '0', '0', '0.00', '1572335200', '1572335200');
INSERT INTO `z_goods_count` VALUES ('204', '12', '46', '1', '1', '0', '0', '0', '0', '0.00', '1572338023', '1572338023');
INSERT INTO `z_goods_count` VALUES ('205', '5', '46', '2', '2', '3', '0', '3', '3', '3.00', '1572338139', '1572338139');
INSERT INTO `z_goods_count` VALUES ('206', '11', '46', '1', '1', '2', '0', '2', '2', '2.00', '1572338150', '1572338150');
INSERT INTO `z_goods_count` VALUES ('207', '4', '32', '9', '9', '0', '0', '0', '0', '0.00', '1572340243', '1572340243');
INSERT INTO `z_goods_count` VALUES ('208', '5', '32', '1', '1', '3', '0', '3', '3', '3.00', '1572340451', '1572340451');
INSERT INTO `z_goods_count` VALUES ('209', '1', '33', '1', '1', '0', '2', '0', '0', '0.00', '1572398467', '1572398467');
INSERT INTO `z_goods_count` VALUES ('210', '11', '33', '4', '4', '2', '0', '2', '2', '2.00', '1572421410', '1572421410');
INSERT INTO `z_goods_count` VALUES ('211', '5', '33', '4', '4', '3', '0', '3', '3', '3.00', '1572426028', '1572426028');
INSERT INTO `z_goods_count` VALUES ('212', '5', '32', '1', '1', '1', '2', '1', '1', '1.00', '1572508237', '1572508237');
INSERT INTO `z_goods_count` VALUES ('213', '8', '32', '1', '1', '0', '0', '0', '0', '0.00', '1572508987', '1572508987');
INSERT INTO `z_goods_count` VALUES ('214', '7', '32', '1', '1', '1', '0', '1', '1', '1.00', '1572508990', '1572508990');
INSERT INTO `z_goods_count` VALUES ('215', '5', '33', '3', '3', '0', '0', '0', '0', '0.00', '1572511879', '1572511879');

-- ----------------------------
-- Table structure for z_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_discount`;
CREATE TABLE `z_goods_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `full_price` int(11) NOT NULL DEFAULT '0' COMMENT '满多少',
  `less_price` int(11) NOT NULL DEFAULT '0' COMMENT '减多少',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 1是 2否',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `goods_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品可用；2指定商品可用',
  `dis_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='满减表';

-- ----------------------------
-- Records of z_goods_discount
-- ----------------------------
INSERT INTO `z_goods_discount` VALUES ('30', '1', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('31', '3', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('32', '4', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('33', '5', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('34', '6', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('35', '7', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');
INSERT INTO `z_goods_discount` VALUES ('36', '8', '3', '1', '1', '1565922314', '1570952196', '1565884800', '1566144000', '3', '1', '19');

-- ----------------------------
-- Table structure for z_goods_help
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_help`;
CREATE TABLE `z_goods_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` text COMMENT '内容',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品咨询与售后';

-- ----------------------------
-- Records of z_goods_help
-- ----------------------------
INSERT INTO `z_goods_help` VALUES ('1', '<p>购买后什么时候发货：</p><p>答：用户下单购买后，将在24小时内发货</p>', '1557198430', '1564042284');
INSERT INTO `z_goods_help` VALUES ('2', '<p>qqqq购买后什么时候发货：</p><p>答：用户下单购买后，将在24小时内发货</p>', '1557198430', '1562558718');

-- ----------------------------
-- Table structure for z_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_label`;
CREATE TABLE `z_goods_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '标签说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品标签';

-- ----------------------------
-- Records of z_goods_label
-- ----------------------------
INSERT INTO `z_goods_label` VALUES ('2', '24小时发货', '成功下单并付款的商品，将于24小时内发出', '1557197257', '1557197257');
INSERT INTO `z_goods_label` VALUES ('3', '7天退换', '提供7天无理由退换货服务', '1557197287', '1557197298');

-- ----------------------------
-- Table structure for z_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_spec`;
CREATE TABLE `z_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '属性ID',
  `ap_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku id 用于初始化',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of z_goods_spec
-- ----------------------------
INSERT INTO `z_goods_spec` VALUES ('1', '皓玉白', '1', '1', '1', '1552984640', '1572244851');
INSERT INTO `z_goods_spec` VALUES ('2', '炭晶黑', '1', '1', '2', '1552984640', '1572244851');
INSERT INTO `z_goods_spec` VALUES ('3', '琉璃绿', '1', '1', '3', '1552984640', '1572244851');
INSERT INTO `z_goods_spec` VALUES ('4', '8GB+128GB', '1', '2', '4', '1552984640', '1572244851');
INSERT INTO `z_goods_spec` VALUES ('5', '8GB+512GB', '1', '2', '5', '1552984640', '1572244851');
INSERT INTO `z_goods_spec` VALUES ('7', '丹青黑', '2', '5', '1', '1553067269', '1563199534');
INSERT INTO `z_goods_spec` VALUES ('8', '玄镜铜', '2', '5', '2', '1553067269', '1563199534');
INSERT INTO `z_goods_spec` VALUES ('9', '寒霜蓝', '2', '5', '3', '1553067269', '1563199534');
INSERT INTO `z_goods_spec` VALUES ('10', '6GB+128GB', '2', '6', '4', '1553067269', '1563199534');
INSERT INTO `z_goods_spec` VALUES ('11', '8GB+512GB', '2', '6', '5', '1553067269', '1563199534');
INSERT INTO `z_goods_spec` VALUES ('12', '整套8册', '3', '7', '1', '1553068015', '1563199526');
INSERT INTO `z_goods_spec` VALUES ('13', '默认规格', '4', '8', '1', '1553068200', '1572340267');
INSERT INTO `z_goods_spec` VALUES ('14', '4个装', '5', '9', '1', '1553069462', '1571043914');
INSERT INTO `z_goods_spec` VALUES ('15', '8个装', '5', '9', '2', '1553069462', '1571043914');
INSERT INTO `z_goods_spec` VALUES ('16', '32#', '6', '10', '1', '1557125479', '1564219045');
INSERT INTO `z_goods_spec` VALUES ('17', '33#', '6', '10', '2', '1557125479', '1564219045');
INSERT INTO `z_goods_spec` VALUES ('18', '34#', '6', '10', '3', '1557125479', '1564219045');
INSERT INTO `z_goods_spec` VALUES ('19', '21片', '7', '11', '1', '1557125571', '1565425736');
INSERT INTO `z_goods_spec` VALUES ('20', '36片', '7', '11', '2', '1557125571', '1565425736');
INSERT INTO `z_goods_spec` VALUES ('21', '2片', '8', '12', '1', '1564209995', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('22', '3片', '8', '12', '2', '1564218696', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('23', '4片', '8', '12', '3', '1564218696', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('26', '35#', '6', '16', '4', '1564218819', '1564219045');
INSERT INTO `z_goods_spec` VALUES ('28', '5片', '8', '12', '4', '1564220647', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('29', '38片', '7', '11', '3', '1564220776', '1565425736');
INSERT INTO `z_goods_spec` VALUES ('30', '6片', '8', '12', '5', '1564220747', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('31', '7片', '8', '12', '6', '1564225378', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('32', '8片', '8', '12', '7', '1564225417', '1565425742');
INSERT INTO `z_goods_spec` VALUES ('33', '90', '9', '13', '1', '1568271075', '1568271075');
INSERT INTO `z_goods_spec` VALUES ('34', '50', '10', '14', '1', '1568630386', '1568630386');
INSERT INTO `z_goods_spec` VALUES ('35', '白膜', '11', '15', '1', '1569393901', '1569393901');
INSERT INTO `z_goods_spec` VALUES ('36', 'zz', '13', '16', '1', '1571296573', '1571296573');
INSERT INTO `z_goods_spec` VALUES ('37', 'xx', '13', '17', '2', '1571296573', '1571296573');
INSERT INTO `z_goods_spec` VALUES ('38', 'ss', '12', '18', '1', '1571296617', '1571296617');

-- ----------------------------
-- Table structure for z_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_type`;
CREATE TABLE `z_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of z_goods_type
-- ----------------------------
INSERT INTO `z_goods_type` VALUES ('1', '电子产品', '0', '/uploads/20190320/ee33903376337be6fe4c69bd730aea73.jpg', '1', '1553054469', '1571042021');
INSERT INTO `z_goods_type` VALUES ('3', '手机配件', '1', '/uploads/20190716/dff9de6c8c47b3b0fed084cf011344b9.jpg', '0', '1553054494', '1563211616');
INSERT INTO `z_goods_type` VALUES ('7', '图书文娱', '0', '/uploads/20190320/a8afe4d71197bdbf5c3660fcf4665f9c.jpg', '3', '1553065938', '1571042035');
INSERT INTO `z_goods_type` VALUES ('8', '经典小说', '7', '/uploads/20190716/e6911d6098406ddef0eebf9cc573d89c.png', '0', '1553065952', '1563211660');
INSERT INTO `z_goods_type` VALUES ('9', '新鲜水果', '0', '/uploads/20190320/d478211bdc52a581d3ed045b594a37b4.jpg', '2', '1553066066', '1571042028');
INSERT INTO `z_goods_type` VALUES ('10', '进口水果', '9', '/uploads/20190716/887cdf5f06c58e750b8dafd8855f825c.jpg', '0', '1553066086', '1563211632');
INSERT INTO `z_goods_type` VALUES ('11', '化妆品', '0', '/uploads/20190506/7055e1bd59807f267597a56b2ca8992b.jpg', '6', '1557125153', '1571297926');
INSERT INTO `z_goods_type` VALUES ('12', '面膜', '11', '/uploads/20190506/8220eedff238dea91418df4f558d7708.jpg', '0', '1557125160', '1557125160');
INSERT INTO `z_goods_type` VALUES ('13', '口红', '11', '/uploads/20190506/bde9e58c042424ddcd6ccd20a143cfe7.jpg', '0', '1557125186', '1557125186');
INSERT INTO `z_goods_type` VALUES ('14', '测试', '1', '/uploads/20190725/7ea0eb02c63e5d1041dd842e0be040a3.jpg', '0', '1564042516', '1564042516');
INSERT INTO `z_goods_type` VALUES ('15', '111', '1', '/uploads/20190725/b8e6743746bdc2b5e504b58bd81fe5de.jpg', '0', '1564042528', '1564042528');
INSERT INTO `z_goods_type` VALUES ('16', '仪器', '0', '', '0', '1569480756', '1569480756');

-- ----------------------------
-- Table structure for z_goods_val
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_val`;
CREATE TABLE `z_goods_val` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_spec` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格属性值 示例： 1:2 1为属性 2为规格',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `fare_money` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `spec_name` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='商品规格属性值';

-- ----------------------------
-- Records of z_goods_val
-- ----------------------------
INSERT INTO `z_goods_val` VALUES ('1', '1', '1:1,2:4', '4999.00', '4499.00', '993', '0', '0', '颜色：皓玉白 , 版本：8GB+128GB', '1552984640', '1572244851');
INSERT INTO `z_goods_val` VALUES ('2', '1', '1:1,2:5', '5699.00', '5599.00', '993', '0', '0', '颜色：皓玉白 , 版本：8GB+512GB', '1552984640', '1572244851');
INSERT INTO `z_goods_val` VALUES ('3', '1', '1:2,2:4', '6999.00', '6699.00', '979', '14', '0', '颜色：炭晶黑 , 版本：8GB+128GB', '1552984640', '1572244851');
INSERT INTO `z_goods_val` VALUES ('4', '1', '1:2,2:5', '7699.00', '7799.00', '986', '7', '0', '颜色：炭晶黑 , 版本：8GB+512GB', '1552984640', '1572244851');
INSERT INTO `z_goods_val` VALUES ('5', '1', '1:3,2:4', '8999.00', '8899.00', '979', '14', '0', '颜色：琉璃绿 , 版本：8GB+128GB', '1552984640', '1572244851');
INSERT INTO `z_goods_val` VALUES ('11', '1', '1:3,2:5', '9699.00', '9999.00', '0', '91', '0', '颜色：琉璃绿 , 版本：8GB+512GB', '1553048578', '1572244851');
INSERT INTO `z_goods_val` VALUES ('12', '2', '5:7,6:10', '6569.00', '6899.00', '999', '0', '0', '颜色：丹青黑 , 版本：6GB+128GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('13', '2', '5:7,6:11', '8569.00', '8799.00', '999', '0', '0', '颜色：丹青黑 , 版本：8GB+512GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('14', '2', '5:8,6:10', '6569.00', '6899.00', '999', '0', '0', '颜色：玄镜铜 , 版本：6GB+128GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('15', '2', '5:8,6:11', '8569.00', '8799.00', '999', '0', '0', '颜色：玄镜铜 , 版本：8GB+512GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('16', '2', '5:9,6:10', '6569.00', '6899.00', '999', '0', '0', '颜色：寒霜蓝 , 版本：6GB+128GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('17', '2', '5:9,6:11', '8569.00', '8799.00', '969', '30', '0', '颜色：寒霜蓝 , 版本：8GB+512GB', '1553067269', '1563199534');
INSERT INTO `z_goods_val` VALUES ('18', '3', '7:12', '89.00', '128.00', '978', '7', '0', '套装：整套8册', '1553068015', '1563199526');
INSERT INTO `z_goods_val` VALUES ('19', '4', '8:13', '39.00', '48.00', '0', '0', '0', '默认属性：默认规格', '1553068200', '1572340267');
INSERT INTO `z_goods_val` VALUES ('20', '5', '9:14', '54.00', '60.00', '951', '14', '10', '默认属性：4个装', '1553069462', '1571043914');
INSERT INTO `z_goods_val` VALUES ('21', '5', '9:15', '89.00', '96.00', '0', '25', '10', '默认属性：8个装', '1553069462', '1571043914');
INSERT INTO `z_goods_val` VALUES ('22', '6', '10:16', '10.00', '20.00', '10', '0', '0', '色号：32#', '1557125479', '1564219045');
INSERT INTO `z_goods_val` VALUES ('23', '6', '10:17', '10.00', '20.00', '3', '7', '0', '色号：33#', '1557125479', '1564219045');
INSERT INTO `z_goods_val` VALUES ('24', '6', '10:18', '10.00', '20.00', '0', '10', '0', '色号：34#', '1557125479', '1564219045');
INSERT INTO `z_goods_val` VALUES ('25', '7', '11:19', '12.00', '11.00', '972', '7', '11', '规格：21片', '1557125571', '1565425736');
INSERT INTO `z_goods_val` VALUES ('26', '7', '11:20', '12.00', '11.00', '993', '0', '11', '规格：36片', '1557125571', '1565425736');
INSERT INTO `z_goods_val` VALUES ('37', '8', '12:21', '42.00', '158.00', '1000', '0', '27', '规格：2片', '1564218936', '1565425742');
INSERT INTO `z_goods_val` VALUES ('38', '8', '12:22', '42.00', '158.00', '1000', '0', '27', '规格：3片', '1564218936', '1565425742');
INSERT INTO `z_goods_val` VALUES ('39', '8', '12:23', '42.00', '158.00', '1000', '0', '27', '规格：4片', '1564218936', '1565425742');
INSERT INTO `z_goods_val` VALUES ('40', '6', '10:26', '10.00', '20.00', '10', '0', '0', '色号：35#', '1564219045', '1564219045');
INSERT INTO `z_goods_val` VALUES ('41', '8', '12:28', '42.00', '158.00', '1000', '0', '27', '规格：5片', '1564220753', '1565425742');
INSERT INTO `z_goods_val` VALUES ('42', '7', '11:29', '12.00', '11.00', '923', '56', '11', '规格：38片', '1564220776', '1565425736');
INSERT INTO `z_goods_val` VALUES ('43', '8', '12:30', '42.00', '158.00', '1000', '0', '27', '规格：6片', '1564220747', '1565425742');
INSERT INTO `z_goods_val` VALUES ('44', '8', '12:31', '42.00', '158.00', '1000', '0', '27', '规格：7片', '1564225378', '1565425742');
INSERT INTO `z_goods_val` VALUES ('45', '9', '13:33', '0.01', '0.01', '100', '0', '0', '测试装：90', '1568271075', '1568271075');
INSERT INTO `z_goods_val` VALUES ('46', '10', '14:34', '50.00', '0.00', '0', '0', '0', '1：50', '1568630386', '1568630386');
INSERT INTO `z_goods_val` VALUES ('47', '11', '15:35', '87.00', '87.00', '286', '0', '0', '敷尔佳白膜一盒：白膜', '1569393901', '1569393901');
INSERT INTO `z_goods_val` VALUES ('48', '12', '18:38', '11.00', '22.00', '33', '0', '11', 'qq：ss', '1571296617', '1571296617');

-- ----------------------------
-- Table structure for z_group_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_group_goods`;
CREATE TABLE `z_group_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品标题',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `images` text COMMENT '相册',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `fare_price` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `desc` text COMMENT '详情',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `keep` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架 1上架 2下架',
  `label_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标签信息',
  `parameter` text COMMENT '商品参数',
  `hour` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时长 小时',
  `minute` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时长  分钟',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `num` int(11) DEFAULT '0' COMMENT '拼团人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='拼团商品';

-- ----------------------------
-- Records of z_group_goods
-- ----------------------------
INSERT INTO `z_group_goods` VALUES ('8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '/uploads/20190510/843b8aaa22e20859d4ff5689fe874975.jpg,/uploads/20190510/84ca83b33147bca5b2ff0a4c2a70e08e.jpg,/uploads/20190510/9b4def91793570be01ae2295f712e257.jpg,/uploads/20190510/7dfc6724090247c6f67a70db593ff35c.jpg', '280.00', '320.00', '10', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/6ac6ed112316fa382baca48893376e90.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/d09ef8554ed4d1ee20d309e9c6ebc47d.jpg\" width=\"300\"></p><p><br></p>', '54', '99', '0', '1', '3,2', '<p>参数：无</p>', '10', '0', '1557455074', '1557456242', '2');
INSERT INTO `z_group_goods` VALUES ('9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '/uploads/20190510/527fdb97d2615e878bab29b82c4bec1c.jpg,/uploads/20190510/5bf0ff72299aed9131317d6788107af0.jpg,/uploads/20190510/caa6aa22c21d1cd7d515e85773ec1e9e.jpg,/uploads/20190510/e54e67ff9411304467c6b42a30c92939.jpg', '230.00', '278.00', '0', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20191015/2d244a7dec38edc3602113a2992b926c.jpg\" width=\"300\"></p><p><br></p>', '26', '99', '0', '1', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"https://hzdy.kailly.comhttps://hzdy.kailly.comhttps://hzdy.kailly.com/uploads/20190510/75ce0347866c577a51c05ce04a9a85cb.jpg\" style=\"width:100%;\" width=\"300\"></p><p><br></p>', '10', '0', '1557469671', '1571123538', '5');

-- ----------------------------
-- Table structure for z_group_order
-- ----------------------------
DROP TABLE IF EXISTS `z_group_order`;
CREATE TABLE `z_group_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `group_no` char(18) DEFAULT '' COMMENT '团单号，同一个团单号一样',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `goods_num` int(11) DEFAULT NULL COMMENT '商品拼团人数限制',
  `number` int(11) DEFAULT '0' COMMENT '购买数量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后 6已取消 ',
  `fare_price` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `group_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '拼团状态 1拼团中 2拼团成功 3拼团失败',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团结束时间',
  `receipt_time` int(11) NOT NULL DEFAULT '0' COMMENT '收货时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付类型 1微信 2余额',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额(微信返回)',
  `pay_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '支付单号(微信返回)',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) unsigned DEFAULT '0' COMMENT '取消状态（0未取消，1已取消）',
  `cancel_user` tinyint(1) DEFAULT NULL COMMENT '取消用户（1用户，2系统自动取消  3后台）',
  `cancel_at` int(11) DEFAULT NULL COMMENT '取消时间',
  `cancel_desc` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '取消描述',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态（0未删除  1用户已删除 2后台删除）',
  `is_main` tinyint(1) DEFAULT '1' COMMENT '1团长   2团员',
  `refund_state` tinyint(1) DEFAULT '0' COMMENT '退款状态（0未申请，1已申请，2退款成功，3拒绝退款）',
  `refund_at` int(11) DEFAULT NULL COMMENT '退款申请时间',
  `logistics_state` tinyint(1) unsigned DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `logistics_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '发货单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `remark` varchar(255) DEFAULT '' COMMENT '用户留言',
  `form_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='拼团订单';

-- ----------------------------
-- Records of z_group_order
-- ----------------------------
INSERT INTO `z_group_order` VALUES ('1', '201909201646050912', '201909201646098863', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1569005162', '0', '1568969162', '1568969162', '2', '1', '0.00', '', '1568969163', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('2', '201909201756850385', '201909201756042309', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569009371', '0', '1568973371', '1568973371', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('3', '201909201756066172', '201909201756551624', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569009381', '0', '1568973381', '1568973381', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('4', '201909201756857503', '201909201756176285', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569009402', '0', '1568973402', '1568973402', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('5', '201909201756715975', '201909201756549686', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569009413', '0', '1568973413', '1568973413', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('6', '201909201757818134', '201909201757829938', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569009443', '0', '1568973443', '1568973443', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('7', '201909201757410410', '201909201757204843', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1569009460', '0', '1568973460', '1568973460', '2', '1', '0.00', '', '1568973460', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('8', '201909201759602256', '201909201759780896', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1569009563', '0', '1568973563', '1568973563', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('9', '201909201759505995', '201909201759850083', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1569009573', '0', '1568973573', '1568973573', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('10', '201909201802509228', '201909201802985105', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1569009749', '0', '1568973749', '1568973749', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('11', '201909201829455828', '201909201757829938', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569009443', '0', '1568975389', '1568975389', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('12', '201909201829058797', '201909201757829938', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569009443', '0', '1568975390', '1568975390', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('13', '201909201829337641', '201909201757829938', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569009443', '0', '1568975393', '1568975393', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('14', '201909201839681174', '201909201757829938', '11', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '彭君', '18819171134', '广东省', '广州市', '天河区', '珠江东路13号', '1569009443', '0', '1568975997', '1568975997', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('15', '201909201840292846', '201909201757829938', '11', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '彭君', '18819171134', '广东省', '广州市', '天河区', '珠江东路13号', '1569009443', '0', '1568976002', '1568976002', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('16', '201909201840722012', '201909201757829938', '11', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '彭君', '18819171134', '广东省', '广州市', '天河区', '珠江东路13号', '1569009443', '0', '1568976011', '1568976011', '2', '1', '0.00', '', '1568976017', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('17', '201909201841771106', '201909201841272108', '28', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569012070', '0', '1568976070', '1568976070', '2', '1', '0.00', '', '1568976071', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('18', '201909201841123510', '201909201757829938', '35', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '郭万福', '13760853744', '广东省', '广州市', '天河区', '车陂南沙美公园', '1569009443', '0', '1568976118', '1568976118', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('19', '201909201907073353', '201909201757829938', '33', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1569009443', '0', '1568977631', '1568977631', '2', '1', '0.00', '', '1568977631', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('20', '201909201909273193', '201909201909603412', '28', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '2', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569013744', '0', '1568977744', '1568977744', '2', '1', '0.00', '', '1568977744', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('21', '201909201909136035', '201909201909603412', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '7', '10', '2', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1569013744', '1572490716', '1568977795', '1572493893', '2', '1', '0.00', '', '1568977796', '0', null, null, '', '0', '2', '0', null, '1', '1', '顺丰快递', 'shunfeng', '24342324234243234', '1572490696', '', '0');
INSERT INTO `z_group_order` VALUES ('22', '201909201911796873', '201909201911985612', '28', '460.00', '460.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '2', '1', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569013869', '0', '1568977869', '1568977869', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('23', '201909201911445230', '201909201911212005', '28', '460.00', '460.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '2', '2', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1569013875', '0', '1568977875', '1568977875', '2', '1', '0.00', '', '1568977881', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('24', '201909201912076677', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568977950', '1568977950', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('25', '201909201912729398', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568977975', '1568977975', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('26', '201909201913965632', '201909201911212005', '33', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1569013875', '0', '1568978039', '1568978039', '2', '1', '0.00', '', '1568978040', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('27', '201909201914244272', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568978050', '1568978050', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('28', '201909201914808595', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568978074', '1568978074', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('29', '201909201914485833', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568978097', '1568978097', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('30', '201909201915264924', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568978104', '1568978104', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('31', '201909201917064985', '201909201911212005', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1569013875', '0', '1568978253', '1568978253', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('32', '201909251055390860', '201909251055478101', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569416145', '0', '1569380145', '1569380145', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('33', '201909251055995203', '201909251055136424', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569416152', '0', '1569380152', '1569380152', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('34', '201909251056662189', '201909251056992320', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569416163', '0', '1569380163', '1569380163', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('35', '201909251056009158', '201909251056265439', '21', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569416212', '0', '1569380212', '1569380212', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('36', '201909251441027162', '201909251441640518', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569429691', '0', '1569393691', '1569393691', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('37', '201909251441373802', '201909251441625215', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569429696', '0', '1569393696', '1569393696', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('38', '201909251442195118', '201909251441625215', '24', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '1', '林馥纯', '18211212987', '广东省', '潮州市', '饶平县', '海山镇浮任村', '1569429696', '0', '1569393770', '1569393770', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('39', '201909251606920204', '201909251606413899', '21', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '李佳保', '17388714976', '广东省', '广州市', '天河区', '龙洞迎龙路199号 中创汇文创硅谷', '1569434780', '0', '1569398780', '1569398780', '2', '1', '0.00', '', '1569398799', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('40', '201910151512444099', '201910151512264558', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159544', '0', '1571123544', '1571123544', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('41', '201910151512284457', '201910151512201184', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159548', '0', '1571123548', '1571123548', '2', '1', '0.00', '', '1571123548', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('42', '201910151512512260', '201910151512493777', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159562', '0', '1571123562', '1571123562', '2', '1', '0.00', '', '1571123562', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('43', '201910151513379819', '201910151513633637', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159580', '0', '1571123580', '1571123580', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('44', '201910151513237722', '201910151513358304', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159584', '0', '1571123584', '1571123584', '2', '1', '0.00', '', '1571123584', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('45', '201910151515247117', '201910151515703237', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159755', '0', '1571123755', '1571123755', '2', '1', '0.00', '', '1571123755', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('46', '201910151516217325', '201910151516431338', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159772', '0', '1571123772', '1571123772', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('47', '201910151517270595', '201910151517021403', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159834', '0', '1571123834', '1571123834', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('48', '201910151517867355', '201910151517056579', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571159845', '0', '1571123845', '1571123845', '2', '1', '0.00', '', '1571123845', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('49', '201910151712492994', '201910151712183836', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571166766', '0', '1571130766', '1571130766', '2', '1', '0.00', '', '1571130766', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('50', '201910151714515395', '201910151714867048', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571166878', '0', '1571130878', '1571130878', '2', '1', '0.00', '', '1571130878', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('51', '201910160916322819', '201910160916468828', '49', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '1', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县', '麦饭石旁', '1571224583', '0', '1571188583', '1571188583', '2', '1', '0.00', '', '1571188583', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('52', '201910160917892600', '201910160916468828', '46', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '1', '梁清清', '18320707478', '广东省', '广州市', '天河区', '桃园西路美林湖畔北苑620胜邦机械', '1571224583', '0', '1571188643', '1571188643', '2', '1', '1.00', '', '1571188652', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('53', '201910160917956441', '201910160916468828', '32', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '吴生', '13189176760', '广东省', '广州市', '天河区', '农科路北社大厦', '1571224583', '0', '1571188667', '1571188667', '2', '1', '1.00', '', '1571188671', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('54', '201910160918512277', '201910160916468828', '33', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '2', '0', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571224583', '0', '1571188722', '1571188722', '2', '1', '0.00', '', '1571188722', '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('55', '201910160920379321', '201910160916468828', '40', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '8', '0', '3', '王宝', '18825085888', '北京市', '北京市', '东城区', '四合院', '1571224583', '0', '1571188802', '1572602344', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('56', '201910160920638540', '201910160916468828', '40', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '1', '0', '3', '王宝', '18825085888', '北京市', '北京市', '东城区', '四合院', '1571224583', '0', '1571188819', '1571188819', '0', '0', '0.00', '', null, '0', null, null, '', '0', '2', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('57', '201910161026326374', '201910161026604580', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571228767', '0', '1571192767', '1571192767', '2', '1', '0.00', '', '1571192767', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('58', '201910161026671203', '201910161026702857', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571228774', '0', '1571192774', '1571192774', '2', '1', '0.00', '', '1571192774', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('59', '201910161028812996', '201910161028880262', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571228885', '0', '1571192885', '1571192885', '2', '1', '0.00', '', '1571192885', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('60', '201910161028519095', '201910161028083879', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571228902', '0', '1571192902', '1571192902', '2', '1', '0.00', '', '1571192903', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('61', '201910161029578900', '201910161029780815', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571228947', '0', '1571192947', '1571192947', '2', '1', '0.00', '', '1571192947', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('62', '201910161031554343', '201910161031686090', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571229108', '0', '1571193108', '1571193108', '2', '1', '0.00', '', '1571193108', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('63', '201910161032451267', '201910161032663097', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571229124', '0', '1571193124', '1571193124', '2', '1', '0.00', '', '1571193124', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('64', '201910161032374553', '201910161032100826', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571229132', '0', '1571193132', '1571193132', '2', '1', '1.00', '', '1571193139', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('65', '201910161035868455', '201910161035059592', '46', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '1', '10', '1', '梁清清', '18320707478', '广东省', '广州市', '天河区', '桃园西路美林湖畔北苑620胜邦机械', '1571229310', '0', '1571193310', '1571193310', '0', '0', '0.00', '', null, '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('66', '201910161035891592', '201910161035168121', '46', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '1', '梁清清', '18320707478', '广东省', '广州市', '天河区', '桃园西路美林湖畔北苑620胜邦机械', '1571229317', '0', '1571193317', '1571193317', '2', '1', '1.00', '', '1571193347', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('67', '201910161042536957', '201910161042842813', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1571229736', '0', '1571193736', '1571193736', '2', '1', '0.00', '', '1571193737', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('68', '201910161048686848', '201910161048770545', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '李剑成', '13129087405', '广东省', '广州市', '越秀区', '站前路西站一街', '1571230135', '0', '1571194135', '1571194135', '2', '1', '0.00', '', '1571194136', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', '0');
INSERT INTO `z_group_order` VALUES ('69', '201910301752144146', '201910301752083331', '33', '290.00', '290.00', '8', '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '280.00', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '2', '1', '2', '10', '3', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号', '1572465122', '0', '1572429122', '1572429122', '2', '1', '0.00', '', '1572429122', '0', null, null, '', '0', '1', '0', null, '0', null, '', '', '', null, '', 'the formId is a mock one');
INSERT INTO `z_group_order` VALUES ('72', '201910311418460312', '201910311418818474', '33', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '6', '0', '2', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号aa', '1572538686', '1572502979', '1572502686', '1572574856', '1', '1', '1.00', '', '1572502705', '0', null, null, '', '0', '1', '0', null, '1', '14', '信丰快递', 'xinfengwuliu', '5985414114', '1572502964', '', 'the formId is a mock one');
INSERT INTO `z_group_order` VALUES ('73', '201910311437703972', '201910311437429234', '40', '230.00', '230.00', '9', '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '230.00', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '5', '1', '6', '0', '2', '王宝', '18825085888', '北京市', '北京市', '东城区', '四合院zzz', '1572539873', '1572503939', '1572503873', '1572574773', '1', '1', '1.00', '', '1572503878', '0', null, null, '', '0', '1', '0', null, '1', '2', '圆通快递', 'yuantong', '841515151115', '1572503930', '呵呵', '372af444a76f456b809d93dfcaf491cf');

-- ----------------------------
-- Table structure for z_group_sale
-- ----------------------------
DROP TABLE IF EXISTS `z_group_sale`;
CREATE TABLE `z_group_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 仅退款  2退货退款',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic` text NOT NULL COMMENT '退款凭证',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(255) unsigned DEFAULT '0' COMMENT '0未处理  1成功 2拒绝',
  `money` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='拼团订单售后信息';

-- ----------------------------
-- Records of z_group_sale
-- ----------------------------
INSERT INTO `z_group_sale` VALUES ('4', '72', '201910311423019934', '1', '230.00', '', '/uploads/20191031/3c6e6f471f4edf4fa0e640debe919cc6.jpg', '1572502996', '1572502996', '1', '0.01');
INSERT INTO `z_group_sale` VALUES ('5', '73', '201910311439444589', '1', '230.00', '测试', '/uploads/20191031/69793590a4a7f005f2cededd8c139c96.jpg,/uploads/20191031/eeaafbb629ef13a0ed567fefde326363.jpg', '1572503965', '1572503965', '1', '0.01');

-- ----------------------------
-- Table structure for z_index_nav
-- ----------------------------
DROP TABLE IF EXISTS `z_index_nav`;
CREATE TABLE `z_index_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '导航名称',
  `pic` varchar(255) DEFAULT '' COMMENT '图标',
  `images` varchar(255) DEFAULT '' COMMENT '轮播图',
  `status` tinyint(1) DEFAULT NULL COMMENT '1显示 2隐藏',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最近更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_index_nav
-- ----------------------------
INSERT INTO `z_index_nav` VALUES ('1', '博主推荐', '/uploads/20190715/6df883bedbc91b46a878d399a3a50c1e.png', '/uploads/20190715/affc14a81ceb6fa3c6a7045d56b7dafe.png,/uploads/20190715/b674ecf2f27112418c5dbac7250d8b66.png', '1', '1563186246', '1563186638');
INSERT INTO `z_index_nav` VALUES ('2', '片装试用', '/uploads/20190715/50bc41b6825b538540742a57dc9f1443.png', '/uploads/20190715/affc14a81ceb6fa3c6a7045d56b7dafe.png,/uploads/20190715/b674ecf2f27112418c5dbac7250d8b66.png', '1', '1563186256', '1563186256');
INSERT INTO `z_index_nav` VALUES ('3', '分享有礼', '/uploads/20190715/b019eda90ff1533346e63972dfea3ebe.png', '/uploads/20190715/affc14a81ceb6fa3c6a7045d56b7dafe.png,/uploads/20190715/b674ecf2f27112418c5dbac7250d8b66.png', '1', '1563186264', '1563186264');
INSERT INTO `z_index_nav` VALUES ('4', '砍价拼团', '/uploads/20190715/6ec3c0489bca18241b283395ca38d3de.png', '/uploads/20190715/affc14a81ceb6fa3c6a7045d56b7dafe.png,/uploads/20190715/b674ecf2f27112418c5dbac7250d8b66.png', '1', '1563186272', '1563186272');

-- ----------------------------
-- Table structure for z_limit_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_limit_goods`;
CREATE TABLE `z_limit_goods` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `old_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价格',
  `pic` varchar(255) DEFAULT '' COMMENT '封面图',
  `images` text COMMENT '商品相册',
  `label_id` varchar(255) DEFAULT '' COMMENT '商品标签',
  `desc` text COMMENT '商品详情',
  `parameter` text COMMENT '商品参数',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `pay_num` int(10) DEFAULT '0' COMMENT '销量',
  `discount` varchar(155) DEFAULT '0' COMMENT '打折',
  `fare_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `add_time` int(10) DEFAULT '0',
  `time_id` int(10) DEFAULT '1' COMMENT 'limit_time主键',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时打折';

-- ----------------------------
-- Records of z_limit_goods
-- ----------------------------
INSERT INTO `z_limit_goods` VALUES ('1', '罗技（Logitech）C310 高清网络摄像头 高清视频通话 720P', '149.00', '169.00', '/uploads/20190802/24f1d5cbf8b12158fa6d18d9f9c7ae14.jpg', '/uploads/20190802/b3b5bf5071a86075083f79a7097139c9.jpg,/uploads/20190802/fa1dff0628b09b6f13e94a9ed63672ae.jpg,/uploads/20190802/a740a59f5603157a3739a02fec8dc469.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190802/34dc6e3556e94155fbfe1850a8a08532.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190802/175dbda204f56157e1430c011bb0ae43.jpg\" width=\"300\"></p><p><br></p>', '198', '0', '8.5', '10.00', '1564737163', '1', '1564737163');
INSERT INTO `z_limit_goods` VALUES ('2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '68.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '/uploads/20190805/bc162468dd0bf5cd8a8e2ef1baf06e80.jpg,/uploads/20190805/61beb65f21123c1e576d5a5175c7407e.jpg,/uploads/20190805/7e5ac380c467077c20d9551902fefd17.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/b031752e1c427f64672104585984e9a8.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/9a7ef8cd36a3f763542b84458bb698aa.jpg\" width=\"300\"></p><p><br></p>', '62', '0', '9', '10.00', '1564973665', '1', '1564973665');
INSERT INTO `z_limit_goods` VALUES ('3', '维达(Vinda) 抽纸纸巾', '47.00', '99.90', '/uploads/20190805/39b6b602e0911f6770babbd33936bda4.jpg', '/uploads/20190803/241bf14337fa3878ff9c9d4265d8390b.png,/uploads/20190805/31677b3c09385eaf69ed0bb9ca4dab99.jpg,/uploads/20190805/3d76c2c1a95d956fc40a399cf623227f.jpg,/uploads/20190805/bc2e3f229a0b3b866916ab77aeb2f063.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/3a13117b674f5e3c297a0b1bb7e0feb5.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/bd7ee2f6695d261fbda1c07badff5845.jpg\" width=\"300\"></p><p><br></p>', '20', '0', '8.8', '1.00', '1564821519', '1', '1564971041');
INSERT INTO `z_limit_goods` VALUES ('4', '原味肉松饼1000g/箱', '29.00', '39.90', '/uploads/20190805/74ba96b49b8ad04987ca1d5e7b33c4a5.jpg', '/uploads/20190805/ff2918f17387a4b34c6998af285747b5.jpg,/uploads/20190805/ae7d7f901d52960e729cfb6b80e2c25d.jpg,/uploads/20190805/cb27970b0c5a420e9e9d659ef8a5a55c.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/16e7a0e290d4b6c13b1a947f0d391b5b.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/cb6a636272cb63c8172c45391d5da568.jpg\" width=\"300\"></p><p><br></p>', '9', '0', '8.5', '10.00', '1564971392', '1', '1564971392');
INSERT INTO `z_limit_goods` VALUES ('5', '代餐棒控能饼干能量棒营养棒食品饼干面包运动健身粗粮低卡饱腹装零食整箱', '59.00', '69.00', '/uploads/20190805/e9b1ebf0de861c48f411beaf34bde093.jpg', '/uploads/20190805/a53ced9106199a766ac1a13d0b5a0181.jpg,/uploads/20190805/1e490d3b6835cd344db5ddefef189dd6.jpg,/uploads/20190805/e446f2d3be3032139caa14a922ad5431.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/d1402cf05d324fbba4d9afc992c95782.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/18bb91dde3680fca488afe6ded902f9e.jpg\" width=\"300\"></p><p><br></p>', '45', '0', '9', '5.00', '1564971755', '1', '1564971755');
INSERT INTO `z_limit_goods` VALUES ('6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '88.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '/uploads/20190805/b9b7d55057319a6d47c2d2ea6852fd03.jpg,/uploads/20190805/87efbf654d2dddc84522bd92d59d71cd.jpg,/uploads/20190805/e3cd051c9d93ab3c69b23a8d2f09d9fe.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/b0e1355f6bd209b9fde4b149e6edf5b5.jpg\" width=\"300\"></p><p><br></p>', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190805/9fdf51574b9970ad1f824c8c1420a9c7.jpg\" width=\"300\"></p><p><br></p>', '62', '0', '8.5', '10.00', '1564971923', '1', '1564971923');
INSERT INTO `z_limit_goods` VALUES ('7', '测试', '8.00', '9.00', '/uploads/20190814/52958873f28bacc13d5957c3c431625d.png', '/uploads/20190814/f10d82b408064ec827e34d4cdc514125.png', '3', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot; Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">测试</span><span style=\"color: rgb(102, 102, 102); font-family: &quot; Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">测试</span><span style=\"color: rgb(102, 102, 102); font-family: &quot; Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">测试</span><span style=\"color: rgb(102, 102, 102); font-family: &quot; Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">测试</span><span style=\"color: rgb(102, 102, 102); font-family: &quot; Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">测试</span></p>', '<p><br></p>', '994', '0', '1', '10.00', '1565782839', '1', '1565782839');

-- ----------------------------
-- Table structure for z_limit_order
-- ----------------------------
DROP TABLE IF EXISTS `z_limit_order`;
CREATE TABLE `z_limit_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `uid` int(11) DEFAULT NULL COMMENT '下单用户ID',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后6售后成功7售后失败',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额(微信返回)',
  `pay_no` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '支付单号(微信返回)',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `logistics_state` tinyint(1) DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '发货快递公司ID',
  `logistics_name` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(100) DEFAULT NULL COMMENT '发货快递单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态（0未删除  1用户已删除  2后台删除）',
  `remark` varchar(255) DEFAULT '' COMMENT '用户留言',
  `type` tinyint(1) DEFAULT '1' COMMENT '1微信支付2余额支付',
  `fare_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `discount` varchar(155) DEFAULT '' COMMENT '订单折扣',
  `form_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='秒杀订单管理';

-- ----------------------------
-- Records of z_limit_order
-- ----------------------------
INSERT INTO `z_limit_order` VALUES ('1', '201907171706175631', '21', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '5', '李佳保', '17388714976', '天河区', '1563354379', '1564823400', '1', '0.00', '', null, '1', '1', '顺丰快递', 'shunfeng', '1234', '1564823400', '0', 'qwe', '2', '10.00', '', '0');
INSERT INTO `z_limit_order` VALUES ('24', '201908140926906658', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745970', '1565745970', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('25', '201908140926380179', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745973', '1565745973', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('26', '201908140926311418', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745973', '1565745973', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('27', '201908140926137502', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745973', '1565745973', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('28', '201908140926015898', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745973', '1565745973', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('29', '201908140926070878', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745973', '1565745973', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('30', '201908140926501918', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745990', '1565745990', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('31', '201908140926205755', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1565745993', '1568978951', '0', '68.00', '201908140926205755', '1568978951', '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('32', '201908140926711368', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745993', '1565745993', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('33', '201908140926163267', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745993', '1565745993', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('34', '201908140926110645', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '1', '曾伟兵', '13263010441', '信丰县', '1565745993', '1565745993', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('35', '201908140926900437', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1565745993', '1568978928', '0', '68.00', '201908140926900437', '1568978928', '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('36', '201908142010448482', '29', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '6', '梁清清', '18320707478', '天河区', '1565784603', '1565784603', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('37', '201908142010420330', '29', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '8', '梁清清', '18320707478', '天河区', '1565784611', '1565784611', '0', '0.00', '', null, '0', null, '', '', null, null, '0', '', '2', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('64', '201909201751954383', '28', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568973068', '1568981034', '0', '55.00', '201909201751954383', '1568981034', '0', null, '', '', null, null, '0', '', '2', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('65', '201909201751738330', '28', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568973073', '1568973073', '0', '1.00', '201909201751738330', '1569057936', '0', null, '', '', null, null, '0', '', '1', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('66', '201909201815435551', '28', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568974539', '1568978851', '0', '68.00', '201909201815435551', '1568978851', '0', null, '', '', null, null, '0', '', '2', '10.00', '8.5', '0');
INSERT INTO `z_limit_order` VALUES ('71', '201909201930683486', '28', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568979055', '1568979055', '0', '1.00', '201909201930683486', '1569063939', '0', null, '', '', null, null, '0', '', '1', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('76', '201909202022591069', '28', '59.00', '58.10', '5', '代餐棒控能饼干能量棒营养棒食品饼干面包运动健身粗粮低卡饱腹装零食整箱', '59.00', '/uploads/20190805/e9b1ebf0de861c48f411beaf34bde093.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1568982143', '1568982144', '0', '64.00', '201909202022591069', '1568982144', '0', null, '', '', null, null, '0', '', '2', '5.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('86', '201909211747700639', '41', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1569059263', '1569059263', '0', '1.00', '201909211747700639', '1569059272', '0', null, '', '', null, null, '0', '', '1', '10.00', '9', '0');
INSERT INTO `z_limit_order` VALUES ('87', '201910151758968690', '44', '68.00', '67.80', '6', '蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装', '68.00', '/uploads/20190805/d7f6f926cda232b3305f4d3b47da87eb.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571133506', '1571133506', '0', '1.00', '201910151758968690', '1571133515', '0', null, '', '', null, null, '0', '', '1', '10.00', '8.5', '97472edb086f45d490ace9109d445594');
INSERT INTO `z_limit_order` VALUES ('89', '201910151844602078', '44', '59.00', '58.10', '5', '代餐棒控能饼干能量棒营养棒食品饼干面包运动健身粗粮低卡饱腹装零食整箱', '59.00', '/uploads/20190805/e9b1ebf0de861c48f411beaf34bde093.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571136247', '1571136247', '0', '1.00', '201910151844602078', '1571136253', '0', null, '', '', null, null, '0', '', '1', '5.00', '9', 'e4e2501c74584b479a5c60d8f2956b53');
INSERT INTO `z_limit_order` VALUES ('90', '201910160911198851', '49', '55.00', '59.50', '2', '维他奶 维他低糖柠檬茶饮料250ml*24盒', '55.00', '/uploads/20190805/38cc4f9951019a4ca31266515f00319a.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571188304', '1571188304', '0', '1.00', '201910160911198851', '1571188468', '0', null, '', '', null, null, '0', '', '1', '10.00', '9', 'e2c156f0074a40eb81991f43bffe9cc8');
INSERT INTO `z_limit_order` VALUES ('91', '201910160913219781', '49', '59.00', '58.10', '5', '代餐棒控能饼干能量棒营养棒食品饼干面包运动健身粗粮低卡饱腹装零食整箱', '59.00', '/uploads/20190805/e9b1ebf0de861c48f411beaf34bde093.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571188435', '1571188435', '0', '1.00', '201910160913219781', '1571188442', '0', null, '', '', null, null, '0', '', '1', '5.00', '9', '7cd61f79d1524bd3905a7a807fd7ca58');
INSERT INTO `z_limit_order` VALUES ('99', '201910291804742418', '33', '149.00', '136.65', '1', '罗技（Logitech）C310 高清网络摄像头 高清视频通话 720P', '149.00', '/uploads/20190802/24f1d5cbf8b12158fa6d18d9f9c7ae14.jpg', '6', '张三', '020-81167888', '广东省广州市海珠区新港中路397号', '1572343463', '1572343820', '0', '1.00', '201910291804742418', '1572343475', '1', '7', '韵达快递', 'yunda', '52962112155151', '1572343581', '0', '', '1', '10.00', '8.5', 'the formId is a mock one');
INSERT INTO `z_limit_order` VALUES ('100', '201910291804259447', '33', '149.00', '136.65', '1', '罗技（Logitech）C310 高清网络摄像头 高清视频通话 720P', '149.00', '/uploads/20190802/24f1d5cbf8b12158fa6d18d9f9c7ae14.jpg', '6', '张三', '020-81167888', '广东省广州市海珠区新港中路397号', '1572343492', '1572343824', '0', '159.00', '201910291804259447', '1572343493', '1', '2', '圆通快递', 'yuantong', '151501155', '1572343574', '0', '', '2', '10.00', '8.5', 'the formId is a mock one');
INSERT INTO `z_limit_order` VALUES ('101', '201910301608497019', '32', '8.00', '10.80', '7', '测试', '8.00', '/uploads/20190814/52958873f28bacc13d5957c3c431625d.png', '5', '吴佳瑜', '13189176760', '广东省广州市天河区中山大道中379号联合社区2栋208广州小程序开发定制开利网络', '1572422931', '1572423297', '0', '1.00', '201910301608497019', '1572422941', '1', '1', '顺丰快递', 'shunfeng', '000000000000', '1572423297', '0', '', '1', '10.00', '1', 'b746496a6979413b9217ab5df3cd20cb');
INSERT INTO `z_limit_order` VALUES ('102', '201910301618181523', '32', '8.00', '10.80', '7', '测试', '8.00', '/uploads/20190814/52958873f28bacc13d5957c3c431625d.png', '6', '吴生', '13189176760', '广东省广州市天河区农科路北社大厦', '1572423487', '1572600324', '0', '1.00', '201910301618181523', '1572423500', '1', '1', '顺丰快递', 'shunfeng', '0', '1572423517', '0', '11', '1', '10.00', '1', '8299d89e621041c48dd839810487c23c');

-- ----------------------------
-- Table structure for z_limit_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `z_limit_order_refund`;
CREATE TABLE `z_limit_order_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `order_id` int(10) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(255) DEFAULT '' COMMENT '退款单号',
  `goods_title` varchar(255) DEFAULT '',
  `goods_pic` varchar(255) DEFAULT '',
  `goods_price` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(1) DEFAULT '0' COMMENT '退款原因',
  `msg` varchar(500) DEFAULT '' COMMENT '退款说明',
  `many_pic` text COMMENT '凭证',
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `pay_type` tinyint(1) DEFAULT '1' COMMENT '微信支付2余额支付',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未处理  1成功 2拒绝',
  `discount` varchar(155) DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '用户输入的金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='限时打折售后表';

-- ----------------------------
-- Records of z_limit_order_refund
-- ----------------------------
INSERT INTO `z_limit_order_refund` VALUES ('16', '33', '100', '201910291804259447', '罗技（Logitech）C310 高清网络摄像头 高清视频通话 720P', '/uploads/20190802/24f1d5cbf8b12158fa6d18d9f9c7ae14.jpg', '149.00', '1', '1', '/uploads/20191029/a664a9f0c52671099869adb1ad6b2a5e.png', '1572343634', '1572343634', '2', '1', '8.5', '1.00');
INSERT INTO `z_limit_order_refund` VALUES ('17', '33', '99', '201910291804742418', '罗技（Logitech）C310 高清网络摄像头 高清视频通话 720P', '/uploads/20190802/24f1d5cbf8b12158fa6d18d9f9c7ae14.jpg', '149.00', '1', '1', '/uploads/20191029/7dca37a9341fb10fab3498f5838cb0c1.jpg', '1572343645', '1572343645', '1', '1', '8.5', '0.01');
INSERT INTO `z_limit_order_refund` VALUES ('18', '32', '101', '201910301608497019', '测试', '/uploads/20190814/52958873f28bacc13d5957c3c431625d.png', '8.00', '1', '', '', '1572423437', '1572423437', '1', '0', '1', '8.00');
INSERT INTO `z_limit_order_refund` VALUES ('19', '32', '102', '201910301618181523', '测试', '/uploads/20190814/52958873f28bacc13d5957c3c431625d.png', '8.00', '1', '', '', '1572423544', '1572423544', '1', '1', '1', '0.01');

-- ----------------------------
-- Table structure for z_limit_time
-- ----------------------------
DROP TABLE IF EXISTS `z_limit_time`;
CREATE TABLE `z_limit_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '活动商品数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='秒杀时间段';

-- ----------------------------
-- Records of z_limit_time
-- ----------------------------
INSERT INTO `z_limit_time` VALUES ('1', '1568967803', '1572451200', '0', '1557478318', '1571119692');

-- ----------------------------
-- Table structure for z_link
-- ----------------------------
DROP TABLE IF EXISTS `z_link`;
CREATE TABLE `z_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='链接管理';

-- ----------------------------
-- Records of z_link
-- ----------------------------
INSERT INTO `z_link` VALUES ('1', '商品列表', '/page/goods/index', '1570521839', '1570521839');
INSERT INTO `z_link` VALUES ('2', '订单列表', '/page/order/index', '1570521861', '1570521861');
INSERT INTO `z_link` VALUES ('3', '限时打折', '/page/limit/index', '1570521876', '1570521876');
INSERT INTO `z_link` VALUES ('4', '秒杀专区', '/page/seck/index', '1570521895', '1570521895');
INSERT INTO `z_link` VALUES ('5', '拼团专区', '/page/assem/index', '1570521917', '1570521917');

-- ----------------------------
-- Table structure for z_logistics
-- ----------------------------
DROP TABLE IF EXISTS `z_logistics`;
CREATE TABLE `z_logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `code` varchar(20) DEFAULT '' COMMENT '物流公司编码',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1是正常 2是禁用',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '0未删除  1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='物流公司';

-- ----------------------------
-- Records of z_logistics
-- ----------------------------
INSERT INTO `z_logistics` VALUES ('1', '顺丰快递', 'shunfeng', '/uploads/20180831/89a2dd5a8ca2b18b8602d75e6d6369d0.jpg', '1', '1533696253', '1535696767', '0');
INSERT INTO `z_logistics` VALUES ('2', '圆通快递', 'yuantong', '/uploads/20180831/3065473ec818687511d1b6b4668297c5.png', '1', '1533696555', '1535684389', '0');
INSERT INTO `z_logistics` VALUES ('3', '天天快递', 'tiantian', '/uploads/20180831/7b24c54f66a32f26a8e378d4f0e94cf0.png', '1', '1533696572', '1535684496', '0');
INSERT INTO `z_logistics` VALUES ('14', '信丰快递', 'xinfengwuliu', '/uploads//20181205/34d3d9a760de5c2e2258117197645e83.jpg', '1', '1544009426', '1544009544', '0');
INSERT INTO `z_logistics` VALUES ('7', '韵达快递', 'yunda', '/uploads/20180831/41bb9273acb9f31d6bad4b9f22397389.png', '1', '1535684855', '1535700224', '0');
INSERT INTO `z_logistics` VALUES ('8', '申通快递', 'shentong', '/uploads/20180831/73a63f8249e16fef5ad1a28a4ed50b76.png', '1', '1535684907', '1535700225', '0');
INSERT INTO `z_logistics` VALUES ('9', 'EMS', 'ems', '/uploads/20180831/09a3921b32f57c1c6dabfe00bd8337c1.jpg', '1', '1535685425', '1535685515', '0');
INSERT INTO `z_logistics` VALUES ('13', '中通快递', 'zhongtong', '/uploads//20181205/494a7ebc8ff9a8e8a7d92604c844e84c.jpg', '1', '1543989260', '1543989298', '0');
INSERT INTO `z_logistics` VALUES ('12', '德邦快递', 'debangwuliu', '/uploads//20181109/6c0c8636b07733034fdf05993795a4e9.jpg', '1', '1541732933', '1541732933', '0');

-- ----------------------------
-- Table structure for z_msg
-- ----------------------------
DROP TABLE IF EXISTS `z_msg`;
CREATE TABLE `z_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `grade_id` int(10) unsigned DEFAULT '0' COMMENT '会员等级ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '内容',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1发给全部用户；2发给个人；3发给特定等级',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of z_msg
-- ----------------------------
INSERT INTO `z_msg` VALUES ('1', '6', '0', '标题11', '短信内容', '1', '1564223536', '1564223536');
INSERT INTO `z_msg` VALUES ('2', '7', '1', '标题标题', '短信内容短信内容', '2', '1564223671', '1564223671');
INSERT INTO `z_msg` VALUES ('4', '0', '1', '东坪花园', '短信内容短信内容', '3', '1564368268', '1564368268');
INSERT INTO `z_msg` VALUES ('5', '0', '0', '测试', '短信内容', '1', '0', '0');
INSERT INTO `z_msg` VALUES ('6', '10', '1', '测试二11', '短信内容二', '2', '0', '0');
INSERT INTO `z_msg` VALUES ('7', '19', '0', '爱仕达', '短信内容', '2', '0', '0');
INSERT INTO `z_msg` VALUES ('8', '19', '0', '标题标题', '短信内容短信内容', '2', '0', '0');

-- ----------------------------
-- Table structure for z_msg_user
-- ----------------------------
DROP TABLE IF EXISTS `z_msg_user`;
CREATE TABLE `z_msg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `msg_id` int(10) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '0未读；1已读',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不删除；1删除',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='站内信用户关系表';

-- ----------------------------
-- Records of z_msg_user
-- ----------------------------
INSERT INTO `z_msg_user` VALUES ('1', '6', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('2', '7', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('3', '10', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('4', '11', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('5', '12', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('6', '13', '5', '1', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('7', '14', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('8', '15', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('9', '16', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('11', '20', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('12', '21', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('13', '22', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('14', '23', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('15', '24', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('16', '25', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('17', '26', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('18', '27', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('20', '29', '5', '1', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('21', '30', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('22', '31', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('23', '32', '5', '0', '0', '1564395508', '0');
INSERT INTO `z_msg_user` VALUES ('48', '10', '6', '0', '0', '1564396431', '0');

-- ----------------------------
-- Table structure for z_order
-- ----------------------------
DROP TABLE IF EXISTS `z_order`;
CREATE TABLE `z_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` varchar(50) DEFAULT '0' COMMENT '订单单号',
  `order_price` decimal(20,2) DEFAULT '0.00' COMMENT '应付金额',
  `pay_money` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实付金额',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额(微信返回)',
  `is_discount` tinyint(1) DEFAULT '0' COMMENT '是否满减：0否；1是',
  `pay_no` varchar(100) DEFAULT '' COMMENT '支付单号(微信返回)',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) unsigned DEFAULT '0' COMMENT '取消状态（0未取消，1已取消）',
  `cancel_at` int(11) DEFAULT NULL COMMENT '取消时间',
  `cancel_desc` varchar(500) DEFAULT '' COMMENT '取消描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后  6已取消7已退款 8售后失败',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态（0未删除  1用户已删除 2后台删除）',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `username` varchar(50) DEFAULT '' COMMENT '用户姓名',
  `userphone` varchar(20) DEFAULT '' COMMENT '用户手机号码',
  `province` varchar(50) DEFAULT '' COMMENT '用户省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户城市',
  `area` varchar(50) DEFAULT '' COMMENT '用户区域',
  `address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `logistics_state` tinyint(1) DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '发货快递公司ID',
  `logistics_name` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '发货快递单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `refund_state` tinyint(1) DEFAULT '0' COMMENT '退款状态（0未申请，1已申请，2退款成功，3拒绝退款）',
  `refund_at` int(11) DEFAULT NULL COMMENT '退款申请时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最近更新',
  `msg` varchar(500) DEFAULT NULL COMMENT '订单留言',
  `pay_type` tinyint(1) DEFAULT '0' COMMENT '0余额支付；1微信支付',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠券id',
  `coupon_money` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券优惠金额',
  `fare_money` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `point_money` decimal(10,2) DEFAULT '0.00' COMMENT '积分抵扣金额',
  `birthday_money` decimal(10,2) DEFAULT '0.00' COMMENT '生日优惠金额',
  `members_money` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣金额',
  `full_money` decimal(10,2) DEFAULT '0.00' COMMENT '满减金额',
  `use_point` int(11) DEFAULT '0' COMMENT '使用积分',
  `remarks` varchar(500) DEFAULT '' COMMENT '订单备注',
  `form_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_order_uid` (`uid`) USING BTREE,
  KEY `index_order_order_no` (`order_no`) USING BTREE,
  KEY `index_order_pay_state` (`pay_state`) USING BTREE,
  KEY `index_order_cancel_state` (`cancel_state`) USING BTREE,
  KEY `index_order_status` (`status`) USING BTREE,
  KEY `index_order_pay_no` (`pay_no`) USING BTREE,
  KEY `index_order_is_deleted` (`is_deleted`) USING BTREE,
  KEY `index_order_logistics_id` (`logistics_id`) USING BTREE,
  KEY `index_order_refund_state` (`refund_state`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COMMENT='订单管理';

-- ----------------------------
-- Records of z_order
-- ----------------------------
INSERT INTO `z_order` VALUES ('2', '27', '201907161520379736', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '3', '0', '1563261631', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, '1572600571', '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('3', '27', '201907161520687707', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261639', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('4', '27', '201907161520514100', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261642', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('5', '27', '201907161520008875', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261644', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('6', '27', '201907161520671666', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261646', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('7', '27', '201907161520805138', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261647', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('8', '27', '201907161520055526', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261649', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('9', '27', '201907161520426057', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261649', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('10', '27', '201907161520103217', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261650', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('11', '27', '201907161520301799', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261651', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('12', '27', '201907161522305624', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261722', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('13', '27', '201907161522761727', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261725', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('14', '27', '201907161522491929', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261726', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('15', '27', '201907161522147345', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261726', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('16', '27', '201907161522513084', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261726', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('17', '27', '201907161522978748', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261726', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('18', '27', '201907161522567904', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261727', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('19', '27', '201907161522849672', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261727', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('20', '27', '201907161522571241', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261727', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('21', '27', '201907161522522494', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261728', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('22', '27', '201907161522835257', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261728', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('23', '27', '201907161522260772', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261728', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('24', '27', '201907161522527458', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261729', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('25', '27', '201907161522029564', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261730', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('26', '27', '201907161522637725', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261731', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('27', '27', '201907161522050182', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261731', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('28', '27', '201907161522384507', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261731', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('29', '27', '201907161522874887', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261731', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('30', '27', '201907161522088758', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261732', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('31', '27', '201907161522027198', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261732', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('32', '27', '201907161522795803', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261733', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('33', '27', '201907161522877713', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261733', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('34', '27', '201907161522024361', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261733', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('35', '27', '201907161522837684', '188.00', '168.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1563261733', '李', '13355360854', '河北省', '石家庄市', '长安区啊', '长安区啊', '0', null, '', '', null, null, '0', null, null, '', '2', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('42', '19', '201907261453402915', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564124030', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('43', '19', '201907261454973557', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564124043', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('44', '19', '201907261455053335', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564124141', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('45', '19', '201907261455920477', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564124146', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('46', '19', '201907261525992572', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564125914', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('47', '19', '201907261525666436', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564125918', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('48', '19', '201907261525238380', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564125933', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('49', '19', '201907261530424041', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564126226', '张三', '020-81167888', '广东省', '广州市', '海珠区', '新港中路397号qqqqq', '0', null, '', '', null, null, '0', null, '1572574115', '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('50', '19', '201907261531729394', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564126319', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('51', '19', '201907261532820623', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564126366', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('52', '19', '201907261536022388', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564126596', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('53', '19', '201907261543874438', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '4', '0', '1564127025', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('54', '19', '201907261543820547', '8668.00', '8648.00', '1', '0.00', '1', '', '1564127030', '0', null, '', '4', '0', '1564127030', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '9.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('55', '19', '201907261619419867', '8668.00', '8648.00', '1', '0.00', '1', '', '1564129187', '0', null, '', '4', '0', '1564129187', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '8.00', '0.00', '0.00', '20.00', '80', '', '0');
INSERT INTO `z_order` VALUES ('56', '19', '201907261656784682', '8668.00', '8648.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564131376', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '4', '100.00', '10.00', '7.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('57', '19', '201907261656342415', '8668.00', '8648.00', '1', '0.00', '1', '', '1564131386', '0', null, '', '2', '0', '1564131386', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '4', '100.00', '10.00', '7.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('58', '19', '201907261701882692', '8569.00', '8549.00', '1', '0.00', '1', '', '1564131665', '0', null, '', '2', '0', '1564131665', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '6.00', '0.00', '0.00', '20.00', '80', '', '0');
INSERT INTO `z_order` VALUES ('59', '19', '201907261702274543', '7699.00', '7679.00', '1', '0.00', '1', '', '1564131770', '0', null, '', '2', '0', '1564131770', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '5.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('60', '19', '201907261704404966', '8569.00', '8549.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564131843', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '4.00', '0.00', '0.00', '20.00', '80', '', '0');
INSERT INTO `z_order` VALUES ('61', '19', '201907261704990321', '8569.00', '8549.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1564131843', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '4.00', '0.00', '0.00', '20.00', '80', '', '0');
INSERT INTO `z_order` VALUES ('62', '19', '201907261704600013', '8569.00', '8549.00', '1', '0.00', '1', '', '1564131845', '0', null, '', '2', '0', '1564131845', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '4.00', '0.00', '0.00', '20.00', '80', '', '0');
INSERT INTO `z_order` VALUES ('63', '19', '201907261705773695', '8668.00', '8648.00', '1', '0.00', '1', '', '1564131922', '0', null, '', '2', '0', '1564131922', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '3.00', '0.00', '0.00', '20.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('65', '33', '201908060950098305', '7699.00', '7679.00', '0', '0.00', '1', '', null, '0', null, '', '5', '0', '1565056206', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '1', null, '1565322059', '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('80', '33', '201908101707575714', '7699.00', '7679.00', '0', '0.00', '1', '', null, '0', null, '', '5', '0', '1565428049', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '1', null, '1568818529', '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('81', '28', '201908141543161433', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '1', '0', '1565768590', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('82', '28', '201908141926490091', '99.00', '79.00', '1', '0.00', '1', '', '1568967159', '0', null, '', '2', '0', '1565782008', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('85', '28', '201908141926682094', '99.00', '79.00', '1', '0.00', '1', '', '1568965245', '0', null, '', '2', '0', '1565782017', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('96', '33', '201908151907767221', '7699.00', '7679.00', '0', '0.00', '1', '', null, '0', null, '', '7', '0', '1565867262', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('97', '33', '201908151943848466', '99.00', '79.00', '0', '0.00', '1', '', null, '0', null, '', '7', '0', '1565869390', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '20.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('98', '21', '201909121615012046', '10.00', '10.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1568276121', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('99', '21', '201909121616580758', '10.00', '10.00', '0', '0.00', '0', '', null, '0', null, '', '2', '0', '1568276202', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('100', '21', '201909121617611013', '39.00', '39.00', '0', '0.00', '0', '', null, '0', null, '', '2', '0', '1568276261', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('105', '11', '201909121659854617', '7699.00', '7699.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1568278774', '彭君', '18819171134', '广东省', '广州市', '天河区珠江东路13号', '天河区珠江东路13号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('123', '35', '201909201524308568', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965103', '0', null, '', '2', '0', '1568964252', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('124', '35', '201909201526374560', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965248', '0', null, '', '2', '0', '1568964396', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('125', '35', '201909201530295286', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965458', '0', null, '', '2', '0', '1568964608', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('126', '35', '201909201532224846', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965571', '0', null, '', '2', '0', '1568964721', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('127', '35', '201909201535567669', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965182', '0', null, '', '2', '0', '1568964926', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('128', '35', '201909201537353105', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965076', '0', null, '', '2', '0', '1568965066', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('129', '35', '201909201541694055', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965319', '0', null, '', '2', '0', '1568965313', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('130', '35', '201909201548361190', '7699.00', '7699.00', '1', '0.00', '0', '', '1568965709', '0', null, '', '2', '0', '1568965699', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('131', '35', '201909201554123607', '7699.00', '7699.00', '1', '0.00', '0', '', '1568966093', '0', null, '', '2', '0', '1568966086', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('132', '35', '201909201602647006', '7699.00', '7699.00', '1', '0.00', '0', '', '1568966571', '0', null, '', '2', '0', '1568966564', '郭万福', '13760853744', '广东省', '广州市', '天河区车陂南沙美公园', '天河区车陂南沙美公园', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('133', '28', '201909201757703901', '5999.00', '5999.00', '1', '0.00', '0', '', '1568981799', '0', null, '', '2', '0', '1568973475', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('134', '28', '201909201757470808', '5999.00', '5999.00', '1', '0.00', '0', '', '1568973484', '0', null, '', '2', '0', '1568973479', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('135', '28', '201909201758930239', '5999.00', '5999.00', '1', '0.00', '0', '', '1568980556', '0', null, '', '2', '0', '1568973528', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('139', '28', '201909201814571852', '5999.00', '5999.00', '1', '0.00', '0', '', '1568980507', '0', null, '', '2', '0', '1568974462', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('142', '28', '201909201821516425', '23.00', '23.00', '1', '0.00', '0', '', '1568974865', '0', null, '', '2', '0', '1568974865', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('150', '28', '201909202002484588', '5999.00', '5999.00', '1', '0.00', '0', '', '1568980979', '0', null, '', '2', '0', '1568980979', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('151', '28', '201909202023029590', '118.00', '118.00', '1', '0.00', '0', '', '1568982205', '0', null, '', '2', '0', '1568982205', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('152', '28', '201909202034176894', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1568982875', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('154', '41', '201909211748514951', '7699.00', '7699.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569059331', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('155', '41', '201909211748021971', '7699.00', '7699.00', '1', '0.00', '0', '', '1569059338', '0', null, '', '2', '0', '1569059333', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('157', '21', '201909251056451720', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569380190', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('158', '21', '201909251056434161', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569380191', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('159', '21', '201909251056447819', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569380192', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('160', '21', '201909251056951347', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569380194', '李佳保', '17388714976', '广东省', '广州市', '天河区龙洞迎龙路199号 中创汇文创硅谷', '天河区龙洞迎龙路199号 中创汇文创硅谷', '0', null, '', '', null, null, '0', null, null, '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('161', '41', '201909271720717667', '71.00', '71.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1569576020', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '0');
INSERT INTO `z_order` VALUES ('164', '33', '201910142115418567', '39.00', '9.75', '1', '0.00', '0', '', '1571058948', '0', null, '', '4', '0', '1571058931', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.20', '29.25', '0.00', '0.00', '20', '', '0');
INSERT INTO `z_order` VALUES ('174', '33', '201910151759993844', '23.00', '23.00', '1', '0.00', '0', '', '1571133546', '0', null, '', '4', '0', '1571133545', '李剑成', '13129087405', '广东省', '广州市', '越秀区站前路西站一街', '越秀区站前路西站一街', '1', '1', '顺丰快递', 'shunfeng', 'ddd', '1571134100', '0', null, '1571134100', '', '0', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '032307d721a64015ab74f04831a72fd5');
INSERT INTO `z_order` VALUES ('175', '33', '201910151800915639', '23.00', '23.00', '1', '1.00', '0', '', '1571133660', '0', null, '', '8', '0', '1571133653', '李剑成', '13129087405', '广东省', '广州市', '越秀区站前路西站一街', '越秀区站前路西站一街', '1', '2', '圆通快递', 'yuantong', '123', '1571133713', '1', null, '1572345457', '', '1', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '1ae560779a744ceba09977fd16f0a0b1');
INSERT INTO `z_order` VALUES ('176', '29', '201910151803577634', '178.00', '178.00', '1', '0.01', '0', '', '1571133852', '0', null, '', '2', '0', '1571133791', '梁清清', '18320707478', '广东省', '广州市', '天河区桃园西路美林湖畔北苑620胜邦机械', '天河区桃园西路美林湖畔北苑620胜邦机械', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '2d600b3b50354f52902931b07b36dbf4');
INSERT INTO `z_order` VALUES ('177', '44', '201910151812442305', '118.00', '118.00', '1', '0.01', '0', '', '1571134373', '0', null, '', '2', '0', '1571134366', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '哈哈', '1', '14', '1.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '04757ce84c6e4949bffd1cd0b0c794e6');
INSERT INTO `z_order` VALUES ('179', '44', '201910151838862948', '5999.00', '5999.00', '1', '0.01', '0', '', '1571135920', '0', null, '', '2', '0', '1571135913', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '14', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '4b2237c02822432dae99f25aad218bdd');
INSERT INTO `z_order` VALUES ('180', '44', '201910151844655195', '23.00', '23.00', '1', '0.01', '0', '', '1571136301', '0', null, '', '2', '0', '1571136296', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '4536f7b884ed43cfb371ef43d8999a6e');
INSERT INTO `z_order` VALUES ('181', '48', '201910160903614408', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1571187834', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '33a3e7fda10243b9bda15d95a92bba89');
INSERT INTO `z_order` VALUES ('182', '48', '201910160905459318', '39.00', '39.00', '0', '0.00', '0', '', null, '0', null, '', '1', '0', '1571187912', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'a3a0f06c1d1d497baa4471490e6ef44e');
INSERT INTO `z_order` VALUES ('183', '48', '201910160905857536', '10.00', '10.00', '0', '0.00', '0', '', null, '0', null, '', '6', '0', '1571187938', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, '1572511385', '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '38c9f7778d3e4a518527bc5b11f38c62');
INSERT INTO `z_order` VALUES ('184', '49', '201910160910408887', '7699.00', '7699.00', '1', '0.01', '0', '', '1571188219', '0', null, '', '2', '0', '1571188213', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'f1aed9bb998841109788fe2de2988cfb');
INSERT INTO `z_order` VALUES ('185', '49', '201910160912096112', '23.00', '23.00', '1', '0.01', '0', '', '1571188340', '0', null, '', '2', '0', '1571188334', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '1', '14', '1.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '2ca9e7f8d5524106a2fa7dcaa2645103');
INSERT INTO `z_order` VALUES ('186', '49', '201910160915719527', '5999.00', '5999.00', '1', '5999.00', '0', '', '1571188539', '0', null, '', '2', '0', '1571188538', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '14', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', '9bd9d626d9514ecdb646f40e01381bcc');
INSERT INTO `z_order` VALUES ('187', '49', '201910161145267947', '23.00', '23.00', '1', '23.00', '0', '', '1571197512', '0', null, '', '2', '0', '1571197511', '曾伟兵', '13263010441', '江西省', '赣州市', '信丰县麦饭石旁', '信丰县麦饭石旁', '0', null, '', '', null, null, '0', null, null, '', '0', '14', '1.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '2d99d95282ae49069aeca199367837e5');
INSERT INTO `z_order` VALUES ('188', '33', '201910161146269362', '89.00', '89.00', '1', '89.00', '0', '', '1571197581', '0', null, '', '4', '0', '1571197581', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '0', '14', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'the formId is a mock one');
INSERT INTO `z_order` VALUES ('189', '40', '201910171545624096', '23.00', '23.00', '1', '0.01', '0', '', '1571299256', '0', null, '', '3', '0', '1571298357', '王宝', '18825085888', '北京市', '北京市', '东城区四合院', '东城区四合院', '1', '1', '顺丰快递', 'shunfeng', '11111', '1572315052', '0', null, '1572315052', '111', '1', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '85409e6281bf4b0db8bb52df43e0a15d');
INSERT INTO `z_order` VALUES ('190', '40', '201910171558071888', '64.00', '64.00', '0', '0.00', '0', '', null, '0', null, '', '6', '0', '1571299083', '王宝', '18825085888', '北京市', '北京市', '东城区四合院', '东城区四合院', '0', null, '', '', null, null, '0', null, '1572511188', '', '0', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '7885750eb17d4a0bb001abfdfdefd972');
INSERT INTO `z_order` VALUES ('191', '26', '201910171619386346', '23.00', '23.00', '1', '0.01', '0', '', '1571300392', '0', null, '', '3', '0', '1571300344', '阳玮玮', '17620131586', '广东省', '广州市', '天河区东圃一横路90号天河东泷商务中心C座218', '天河区东圃一横路90号天河东泷商务中心C座218', '1', '1', '顺丰快递', 'shunfeng', '123', '1572509666', '0', null, '1572509666', '', '1', '14', '1.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', '6ec2c4b1e41e48358086bfe3b3d28b8e');
INSERT INTO `z_order` VALUES ('193', '33', '201910301717917062', '151.00', '151.00', '1', '0.01', '0', '', '1572427108', '0', null, '', '7', '0', '1572427062', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '1', '1', '顺丰快递', 'shunfeng', '12345', '1572427193', '1', null, '1572427244', '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'the formId is a mock one');
INSERT INTO `z_order` VALUES ('194', '33', '201910301748057768', '151.00', '151.00', '1', '0.01', '0', '', '1572428920', '0', null, '', '7', '0', '1572428902', '张三', '020-81167888', '广东省', '广州市', '海珠区新港中路397号', '海珠区新港中路397号', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'the formId is a mock one');
INSERT INTO `z_order` VALUES ('195', '32', '201910311551719548', '64.00', '64.00', '1', '0.01', '0', '', '1572508308', '0', null, '', '7', '0', '1572508299', '吴生', '13189176760', '广东省', '广州市', '天河区农科路北社大厦', '天河区农科路北社大厦', '0', null, '', '', null, null, '1', null, '1572508835', '', '1', '0', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '', '9b0921da61574e68a7a38126b447dd0d');
INSERT INTO `z_order` VALUES ('196', '32', '201910311603772165', '23.00', '23.00', '1', '0.01', '0', '', '1572509017', '0', null, '', '2', '0', '1572509004', '吴生', '13189176760', '广东省', '广州市', '天河区农科路北社大厦', '天河区农科路北社大厦', '0', null, '', '', null, null, '0', null, null, '', '1', '0', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '0', '', 'c2d66f95c9204a5d9543107bad317e7b');

-- ----------------------------
-- Table structure for z_order_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `z_order_evaluate`;
CREATE TABLE `z_order_evaluate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL COMMENT '评价用户ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `order_id` int(11) DEFAULT NULL COMMENT '评价订单ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '评论商品ID',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品名称',
  `picture` text COMMENT '评价图片',
  `content` varchar(255) DEFAULT '' COMMENT '评价内容',
  `add_time` int(11) DEFAULT NULL COMMENT '评价时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0隐藏 1显示',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '0未删除  1已删除',
  `star` int(5) DEFAULT '1' COMMENT '综合评价(星级)',
  `update_time` int(11) DEFAULT '0',
  `is_reply` tinyint(1) DEFAULT '0' COMMENT '0评价；1回复',
  `pid` int(11) DEFAULT '0' COMMENT '本表主键id',
  `is_true` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1真实评论；2假评论',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_order_evaluate_order_id` (`order_id`) USING BTREE,
  KEY `index_order_evaluate_goods_id` (`goods_id`) USING BTREE,
  KEY `index_order_evaluate_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单评价管理';

-- ----------------------------
-- Records of z_order_evaluate
-- ----------------------------
INSERT INTO `z_order_evaluate` VALUES ('2', null, '昵称昵称11', '/uploads/20190726/54fd520b8da0699806e8e07fc838e030.jpg', null, '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', null, '2评论内容评论内容', '1564109289', '1', '0', '3', '1564208620', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('3', null, '哎呀', '/uploads/20190726/530fc37bccdd599a62b71f2f99e04138.jpg', null, '6', 'MAC魅可19年新春限定联名口红', null, '评论内容评论内容评论内容', '1564111992', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('6', '19', 'ljc', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '55', '5', '广西高乐蜜芒果', null, '退钱', '1564129240', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('7', '19', 'ljc', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '55', '2', '三星 Galaxy Note9（SM-N9600）', null, '退钱', '1564129240', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('8', '19', null, null, '55', '5', '广西高乐蜜芒果', null, '回复内容1', '1564191092', '1', '0', '1', '1564191171', '1', '6', '1');
INSERT INTO `z_order_evaluate` VALUES ('10', '33', '\\ud83c\\uddf1 \\ud83c\\uddef \\ud83c\\udde8', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '65', '1', '三星 Galaxy S10（SM-G9730）', null, '1212322', '1565314290', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('11', '33', '\\ud83c\\uddf1 \\ud83c\\uddef \\ud83c\\udde8', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '65', '1', '三星 Galaxy S10（SM-G9730）', null, '1212132', '1565314319', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('12', '33', '\\ud83c\\uddf1 \\ud83c\\uddef \\ud83c\\udde8', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '80', '1', '三星 Galaxy S10（SM-G9730）', null, '121231213123', '1565428124', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('17', null, 'aa', '/uploads/20191015/72220c3e327eb6e3d322b4d0b8d46477.png', null, '0', '三星 Galaxy S10（SM-G9730）', null, 'dd', '1571108747', '1', '0', '4', '1571134792', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('19', '33', '\\ud83c\\uddf1 \\ud83c\\uddef \\ud83c\\udde8', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '164', '4', '追风筝的人', null, '你们的', '1571129910', '1', '0', '5', '0', '0', '0', '1');
INSERT INTO `z_order_evaluate` VALUES ('20', null, 'ce2', null, null, '0', '三星 Galaxy S10（SM-G9730）', null, '22', '1571134944', '1', '0', '2', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('21', null, 'dddd', null, null, '0', '三星 Galaxy S10（SM-G9730）', null, 'dddd', '1571134980', '1', '0', '5', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('22', null, 'zzz', '/uploads/20191015/759f3c5009dfe98cb91b72b6367566f7.png', null, '0', '三星 Galaxy S10（SM-G9730）', null, 'zzz', '1571135111', '1', '0', '5', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('23', null, 'xxx', '/uploads/20191015/ac28ea30bdb6f603d78b206f601c9f8b.png', null, '0', '三星 Galaxy S10（SM-G9730）', null, 'xxx', '1571135135', '1', '0', '9', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('24', null, 'vv', '/uploads/20191015/d156867a497c5beaf328ecd8d3b8d234.png', null, '1', '三星 Galaxy S10（SM-G9730）', null, 'vv', '1571135385', '1', '0', '5', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('25', null, 'bb12', null, null, '1', '三星 Galaxy S10（SM-G9730）', null, 'bb12', '1571135456', '1', '0', '5', '1571136098', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('26', null, '好', '/uploads/20191029/0b61f8e324b53f0b1f6418a7cd4654da.png', null, '4', '追风筝的人', null, '好吃 不上火', '1572340512', '1', '0', '0', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('27', '6', '腔棘鱼', 'https://wx.qlogo.cn/mmopen/vi_32/Ad2m3J8duUl99GRlibsCZ6xqYd0sxMMibuxR3RQbVEeX9nO32hO43J7bOVroZ2QJLDUicamo4La180GIpdLibsSZCQ/132', null, '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', null, '似懂非懂发', '1572514954', '0', '0', '5', '0', '0', '0', '2');
INSERT INTO `z_order_evaluate` VALUES ('28', '7', '猴子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEQytTMw20PFqbNMUy66tGDSwzgCNFqI1GkwYGde9HwM12FIGcmoQlviaW3QpKYNtrCgRvUknBs7A/132', null, '5', '广西高乐蜜芒果', null, '方法方法', '1572515243', '0', '0', '6', '0', '0', '0', '2');

-- ----------------------------
-- Table structure for z_order_list
-- ----------------------------
DROP TABLE IF EXISTS `z_order_list`;
CREATE TABLE `z_order_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_id` int(11) DEFAULT NULL COMMENT '关联的订单ID',
  `number` bigint(20) unsigned DEFAULT '0' COMMENT '交易数量',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品标识',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标题',
  `goods_pic` varchar(500) DEFAULT '' COMMENT '商品图标',
  `goods_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品销售价格',
  `goods_attr` varchar(1000) DEFAULT NULL COMMENT '商品规格',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_order_list_goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COMMENT='订单详情';

-- ----------------------------
-- Records of z_order_list
-- ----------------------------
INSERT INTO `z_order_list` VALUES ('1', '27', '2', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261631');
INSERT INTO `z_order_list` VALUES ('2', '27', '3', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261639');
INSERT INTO `z_order_list` VALUES ('3', '27', '4', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261642');
INSERT INTO `z_order_list` VALUES ('4', '27', '5', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261644');
INSERT INTO `z_order_list` VALUES ('5', '27', '6', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261646');
INSERT INTO `z_order_list` VALUES ('6', '27', '7', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261647');
INSERT INTO `z_order_list` VALUES ('7', '27', '8', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261649');
INSERT INTO `z_order_list` VALUES ('8', '27', '9', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261649');
INSERT INTO `z_order_list` VALUES ('9', '27', '10', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261650');
INSERT INTO `z_order_list` VALUES ('10', '27', '11', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261651');
INSERT INTO `z_order_list` VALUES ('11', '27', '12', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261722');
INSERT INTO `z_order_list` VALUES ('12', '27', '13', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261725');
INSERT INTO `z_order_list` VALUES ('13', '27', '14', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261726');
INSERT INTO `z_order_list` VALUES ('14', '27', '15', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261726');
INSERT INTO `z_order_list` VALUES ('15', '27', '16', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261726');
INSERT INTO `z_order_list` VALUES ('16', '27', '17', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261726');
INSERT INTO `z_order_list` VALUES ('17', '27', '18', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261727');
INSERT INTO `z_order_list` VALUES ('18', '27', '19', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261727');
INSERT INTO `z_order_list` VALUES ('19', '27', '20', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261727');
INSERT INTO `z_order_list` VALUES ('20', '27', '21', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261728');
INSERT INTO `z_order_list` VALUES ('21', '27', '22', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261728');
INSERT INTO `z_order_list` VALUES ('22', '27', '23', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261728');
INSERT INTO `z_order_list` VALUES ('23', '27', '24', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261729');
INSERT INTO `z_order_list` VALUES ('24', '27', '25', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261730');
INSERT INTO `z_order_list` VALUES ('25', '27', '26', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261731');
INSERT INTO `z_order_list` VALUES ('26', '27', '27', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261731');
INSERT INTO `z_order_list` VALUES ('27', '27', '28', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261731');
INSERT INTO `z_order_list` VALUES ('28', '27', '29', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261731');
INSERT INTO `z_order_list` VALUES ('29', '27', '30', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261732');
INSERT INTO `z_order_list` VALUES ('30', '27', '31', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261732');
INSERT INTO `z_order_list` VALUES ('31', '27', '32', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261733');
INSERT INTO `z_order_list` VALUES ('32', '27', '33', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261733');
INSERT INTO `z_order_list` VALUES ('33', '27', '34', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261733');
INSERT INTO `z_order_list` VALUES ('34', '27', '35', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1563261733');
INSERT INTO `z_order_list` VALUES ('35', '19', '36', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563267091');
INSERT INTO `z_order_list` VALUES ('36', '19', '37', '2', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563267205');
INSERT INTO `z_order_list` VALUES ('37', '19', '38', '2', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563267211');
INSERT INTO `z_order_list` VALUES ('38', '19', '39', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563271980');
INSERT INTO `z_order_list` VALUES ('39', '19', '40', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563347705');
INSERT INTO `z_order_list` VALUES ('40', '19', '41', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1563347719');
INSERT INTO `z_order_list` VALUES ('41', '19', '42', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564124030');
INSERT INTO `z_order_list` VALUES ('42', '19', '42', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564124030');
INSERT INTO `z_order_list` VALUES ('43', '19', '43', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564124043');
INSERT INTO `z_order_list` VALUES ('44', '19', '43', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564124043');
INSERT INTO `z_order_list` VALUES ('45', '19', '44', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564124141');
INSERT INTO `z_order_list` VALUES ('46', '19', '44', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564124141');
INSERT INTO `z_order_list` VALUES ('47', '19', '45', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564124146');
INSERT INTO `z_order_list` VALUES ('48', '19', '45', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564124146');
INSERT INTO `z_order_list` VALUES ('49', '19', '46', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564125914');
INSERT INTO `z_order_list` VALUES ('50', '19', '46', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564125914');
INSERT INTO `z_order_list` VALUES ('51', '19', '47', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564125918');
INSERT INTO `z_order_list` VALUES ('52', '19', '47', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564125918');
INSERT INTO `z_order_list` VALUES ('53', '19', '48', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564125933');
INSERT INTO `z_order_list` VALUES ('54', '19', '48', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564125933');
INSERT INTO `z_order_list` VALUES ('55', '19', '49', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564126226');
INSERT INTO `z_order_list` VALUES ('56', '19', '49', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564126226');
INSERT INTO `z_order_list` VALUES ('57', '19', '50', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564126319');
INSERT INTO `z_order_list` VALUES ('58', '19', '50', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564126319');
INSERT INTO `z_order_list` VALUES ('59', '19', '51', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564126366');
INSERT INTO `z_order_list` VALUES ('60', '19', '51', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564126366');
INSERT INTO `z_order_list` VALUES ('61', '19', '52', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564126596');
INSERT INTO `z_order_list` VALUES ('62', '19', '52', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564126596');
INSERT INTO `z_order_list` VALUES ('63', '19', '53', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564127025');
INSERT INTO `z_order_list` VALUES ('64', '19', '53', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564127025');
INSERT INTO `z_order_list` VALUES ('65', '19', '54', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564127030');
INSERT INTO `z_order_list` VALUES ('66', '19', '54', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564127030');
INSERT INTO `z_order_list` VALUES ('67', '19', '55', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564129187');
INSERT INTO `z_order_list` VALUES ('68', '19', '55', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564129187');
INSERT INTO `z_order_list` VALUES ('69', '19', '56', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564131376');
INSERT INTO `z_order_list` VALUES ('70', '19', '56', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131376');
INSERT INTO `z_order_list` VALUES ('71', '19', '57', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564131386');
INSERT INTO `z_order_list` VALUES ('72', '19', '57', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131386');
INSERT INTO `z_order_list` VALUES ('73', '19', '58', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131665');
INSERT INTO `z_order_list` VALUES ('74', '19', '59', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131770');
INSERT INTO `z_order_list` VALUES ('75', '19', '60', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131843');
INSERT INTO `z_order_list` VALUES ('76', '19', '61', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131843');
INSERT INTO `z_order_list` VALUES ('77', '19', '62', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131845');
INSERT INTO `z_order_list` VALUES ('78', '19', '63', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1564131922');
INSERT INTO `z_order_list` VALUES ('79', '19', '63', '1', '2', '三星 Galaxy Note9（SM-N9600）', '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', '8569.00', '{\"id\":17,\"price\":\"8569.00\",\"old_price\":\"8799.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u5bd2\\u971c\\u84dd , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1564131922');
INSERT INTO `z_order_list` VALUES ('80', '33', '64', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565056200');
INSERT INTO `z_order_list` VALUES ('81', '33', '65', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565056206');
INSERT INTO `z_order_list` VALUES ('82', '33', '66', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565339050');
INSERT INTO `z_order_list` VALUES ('83', '33', '67', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565402181');
INSERT INTO `z_order_list` VALUES ('84', '33', '68', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565402186');
INSERT INTO `z_order_list` VALUES ('85', '33', '69', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565424979');
INSERT INTO `z_order_list` VALUES ('86', '33', '70', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565424989');
INSERT INTO `z_order_list` VALUES ('87', '33', '71', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565425066');
INSERT INTO `z_order_list` VALUES ('88', '33', '72', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565425094');
INSERT INTO `z_order_list` VALUES ('89', '33', '73', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565425194');
INSERT INTO `z_order_list` VALUES ('90', '33', '74', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":24,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a34#\",\"fare_money\":0}', '1565425325');
INSERT INTO `z_order_list` VALUES ('91', '33', '75', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565427825');
INSERT INTO `z_order_list` VALUES ('92', '33', '76', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565427862');
INSERT INTO `z_order_list` VALUES ('93', '33', '77', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565427895');
INSERT INTO `z_order_list` VALUES ('94', '33', '78', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565427926');
INSERT INTO `z_order_list` VALUES ('95', '33', '79', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565427973');
INSERT INTO `z_order_list` VALUES ('96', '33', '80', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565428049');
INSERT INTO `z_order_list` VALUES ('97', '28', '81', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565768590');
INSERT INTO `z_order_list` VALUES ('98', '28', '82', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565782008');
INSERT INTO `z_order_list` VALUES ('99', '28', '83', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565782010');
INSERT INTO `z_order_list` VALUES ('100', '28', '84', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565782011');
INSERT INTO `z_order_list` VALUES ('101', '28', '85', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565782017');
INSERT INTO `z_order_list` VALUES ('102', '28', '86', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565782021');
INSERT INTO `z_order_list` VALUES ('103', '33', '87', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565832284');
INSERT INTO `z_order_list` VALUES ('104', '33', '88', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565866870');
INSERT INTO `z_order_list` VALUES ('105', '33', '89', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565866903');
INSERT INTO `z_order_list` VALUES ('106', '33', '90', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565866915');
INSERT INTO `z_order_list` VALUES ('107', '33', '91', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565866998');
INSERT INTO `z_order_list` VALUES ('108', '33', '92', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565867114');
INSERT INTO `z_order_list` VALUES ('109', '33', '93', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565867117');
INSERT INTO `z_order_list` VALUES ('110', '33', '94', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565867152');
INSERT INTO `z_order_list` VALUES ('111', '33', '95', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565867155');
INSERT INTO `z_order_list` VALUES ('112', '33', '96', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1565867262');
INSERT INTO `z_order_list` VALUES ('113', '33', '97', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1565869390');
INSERT INTO `z_order_list` VALUES ('114', '33', '98', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1566608972');
INSERT INTO `z_order_list` VALUES ('115', '33', '99', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1566609125');
INSERT INTO `z_order_list` VALUES ('116', '33', '100', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1566609221');
INSERT INTO `z_order_list` VALUES ('117', '33', '101', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1566786983');
INSERT INTO `z_order_list` VALUES ('118', '33', '102', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1566786990');
INSERT INTO `z_order_list` VALUES ('119', '21', '98', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":22,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a32#\",\"fare_money\":0}', '1568276121');
INSERT INTO `z_order_list` VALUES ('120', '21', '99', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":22,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a32#\",\"fare_money\":0}', '1568276202');
INSERT INTO `z_order_list` VALUES ('121', '21', '100', '1', '4', '追风筝的人', '/uploads/20190320/af76bde21bee295e2ff3e7b77112817a.jpg', '39.00', '{\"id\":19,\"price\":\"39.00\",\"old_price\":\"48.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a\\u9ed8\\u8ba4\\u89c4\\u683c\",\"fare_money\":0}', '1568276261');
INSERT INTO `z_order_list` VALUES ('122', '11', '101', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":3,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0}', '1568278517');
INSERT INTO `z_order_list` VALUES ('123', '11', '102', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568278551');
INSERT INTO `z_order_list` VALUES ('124', '11', '103', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568278710');
INSERT INTO `z_order_list` VALUES ('125', '11', '104', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568278735');
INSERT INTO `z_order_list` VALUES ('126', '11', '105', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568278774');
INSERT INTO `z_order_list` VALUES ('127', '33', '106', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568682249');
INSERT INTO `z_order_list` VALUES ('128', '33', '107', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1568855869');
INSERT INTO `z_order_list` VALUES ('129', '33', '108', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1568855907');
INSERT INTO `z_order_list` VALUES ('130', '33', '109', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568886172');
INSERT INTO `z_order_list` VALUES ('131', '33', '110', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568886272');
INSERT INTO `z_order_list` VALUES ('132', '33', '111', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568886461');
INSERT INTO `z_order_list` VALUES ('133', '33', '112', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568887485');
INSERT INTO `z_order_list` VALUES ('134', '33', '119', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568961107');
INSERT INTO `z_order_list` VALUES ('135', '33', '120', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568961256');
INSERT INTO `z_order_list` VALUES ('136', '33', '121', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568961265');
INSERT INTO `z_order_list` VALUES ('137', '33', '122', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '89.00', '{\"id\":21,\"price\":\"89.00\",\"old_price\":\"96.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a8\\u4e2a\\u88c5\",\"fare_money\":10}', '1568962293');
INSERT INTO `z_order_list` VALUES ('138', '35', '123', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568964252');
INSERT INTO `z_order_list` VALUES ('139', '35', '124', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568964396');
INSERT INTO `z_order_list` VALUES ('140', '35', '125', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568964608');
INSERT INTO `z_order_list` VALUES ('141', '35', '126', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568964721');
INSERT INTO `z_order_list` VALUES ('142', '35', '127', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568964926');
INSERT INTO `z_order_list` VALUES ('143', '35', '128', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568965066');
INSERT INTO `z_order_list` VALUES ('144', '35', '129', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568965313');
INSERT INTO `z_order_list` VALUES ('145', '35', '130', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568965699');
INSERT INTO `z_order_list` VALUES ('146', '35', '131', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568966086');
INSERT INTO `z_order_list` VALUES ('147', '35', '132', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0}', '1568966564');
INSERT INTO `z_order_list` VALUES ('148', '28', '133', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":3,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1568973475');
INSERT INTO `z_order_list` VALUES ('149', '28', '134', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":3,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1568973479');
INSERT INTO `z_order_list` VALUES ('150', '28', '135', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":3,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1568973528');
INSERT INTO `z_order_list` VALUES ('151', '28', '136', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":1000,\"pay_num\":0}', '1568974079');
INSERT INTO `z_order_list` VALUES ('152', '28', '137', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":1000,\"pay_num\":0}', '1568974087');
INSERT INTO `z_order_list` VALUES ('153', '28', '138', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":5,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1568974459');
INSERT INTO `z_order_list` VALUES ('154', '28', '139', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":5,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1568974462');
INSERT INTO `z_order_list` VALUES ('155', '28', '140', '2', '8', '商品标题', '/uploads/20190727/6f095ec69b26047bb0d4124d84afc670.png', '42.00', '{\"id\":43,\"price\":\"42.00\",\"old_price\":\"158.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a6\\u7247\",\"fare_money\":27,\"stock\":1000,\"pay_num\":0}', '1568974670');
INSERT INTO `z_order_list` VALUES ('156', '28', '141', '2', '8', '商品标题', '/uploads/20190727/6f095ec69b26047bb0d4124d84afc670.png', '42.00', '{\"id\":43,\"price\":\"42.00\",\"old_price\":\"158.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a6\\u7247\",\"fare_money\":27,\"stock\":1000,\"pay_num\":0}', '1568974672');
INSERT INTO `z_order_list` VALUES ('157', '28', '142', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":1000,\"pay_num\":0}', '1568974865');
INSERT INTO `z_order_list` VALUES ('158', '28', '143', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":945,\"pay_num\":56}', '1568974904');
INSERT INTO `z_order_list` VALUES ('159', '28', '144', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":945,\"pay_num\":56}', '1568974920');
INSERT INTO `z_order_list` VALUES ('160', '33', '145', '3', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":938,\"pay_num\":63}', '1568976034');
INSERT INTO `z_order_list` VALUES ('161', '33', '146', '3', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":938,\"pay_num\":63}', '1568977334');
INSERT INTO `z_order_list` VALUES ('162', '28', '147', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":23,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a33#\",\"fare_money\":0,\"stock\":10,\"pay_num\":0}', '1568979619');
INSERT INTO `z_order_list` VALUES ('163', '28', '148', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":23,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a33#\",\"fare_money\":0,\"stock\":10,\"pay_num\":0}', '1568979625');
INSERT INTO `z_order_list` VALUES ('164', '28', '149', '3', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":1000,\"pay_num\":0}', '1568979925');
INSERT INTO `z_order_list` VALUES ('165', '28', '150', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":5,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":993,\"pay_num\":0}', '1568980979');
INSERT INTO `z_order_list` VALUES ('166', '28', '151', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":1000,\"pay_num\":0}', '1568982205');
INSERT INTO `z_order_list` VALUES ('167', '28', '152', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1568982875');
INSERT INTO `z_order_list` VALUES ('168', '33', '153', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1569055186');
INSERT INTO `z_order_list` VALUES ('169', '41', '154', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":917,\"pay_num\":84}', '1569059331');
INSERT INTO `z_order_list` VALUES ('170', '41', '155', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":917,\"pay_num\":84}', '1569059333');
INSERT INTO `z_order_list` VALUES ('171', '33', '156', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":4,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u70ad\\u6676\\u9ed1 , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":993,\"pay_num\":7}', '1569059649');
INSERT INTO `z_order_list` VALUES ('172', '21', '157', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1569380190');
INSERT INTO `z_order_list` VALUES ('173', '21', '158', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1569380191');
INSERT INTO `z_order_list` VALUES ('174', '21', '159', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1569380192');
INSERT INTO `z_order_list` VALUES ('175', '21', '160', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1569380194');
INSERT INTO `z_order_list` VALUES ('176', '41', '161', '5', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":993,\"pay_num\":7}', '1569576020');
INSERT INTO `z_order_list` VALUES ('177', '33', '162', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":910,\"pay_num\":84}', '1570936522');
INSERT INTO `z_order_list` VALUES ('178', '33', '163', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":11,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":910,\"pay_num\":84}', '1570936526');
INSERT INTO `z_order_list` VALUES ('179', '33', '164', '1', '4', '追风筝的人', '/uploads/20190320/af76bde21bee295e2ff3e7b77112817a.jpg', '39.00', '{\"id\":19,\"price\":\"39.00\",\"old_price\":\"48.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a\\u9ed8\\u8ba4\\u89c4\\u683c\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1571058931');
INSERT INTO `z_order_list` VALUES ('180', '33', '165', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":993,\"pay_num\":7}', '1571128060');
INSERT INTO `z_order_list` VALUES ('181', '33', '166', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":993,\"pay_num\":7}', '1571130220');
INSERT INTO `z_order_list` VALUES ('182', '33', '167', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":986,\"pay_num\":14}', '1571132992');
INSERT INTO `z_order_list` VALUES ('183', '33', '168', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":979,\"pay_num\":14}', '1571133148');
INSERT INTO `z_order_list` VALUES ('184', '33', '169', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":972,\"pay_num\":21}', '1571133333');
INSERT INTO `z_order_list` VALUES ('185', '33', '170', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":972,\"pay_num\":21}', '1571133337');
INSERT INTO `z_order_list` VALUES ('186', '33', '171', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":958,\"pay_num\":35}', '1571133365');
INSERT INTO `z_order_list` VALUES ('187', '33', '172', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":958,\"pay_num\":35}', '1571133369');
INSERT INTO `z_order_list` VALUES ('188', '33', '173', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":958,\"pay_num\":35}', '1571133488');
INSERT INTO `z_order_list` VALUES ('189', '33', '174', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":944,\"pay_num\":49}', '1571133545');
INSERT INTO `z_order_list` VALUES ('190', '33', '175', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":937,\"pay_num\":56}', '1571133653');
INSERT INTO `z_order_list` VALUES ('191', '29', '176', '2', '3', '山海经典藏画册', '/uploads/20190320/5bd2a1ab0b26a46f808226dd22d52b3f.jpg', '89.00', '{\"id\":18,\"price\":\"89.00\",\"old_price\":\"128.00\",\"spec_name\":\"\\u5957\\u88c5\\uff1a\\u6574\\u59578\\u518c\",\"fare_money\":0,\"stock\":999,\"pay_num\":0}', '1571133791');
INSERT INTO `z_order_list` VALUES ('192', '44', '177', '2', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":986,\"pay_num\":14}', '1571134366');
INSERT INTO `z_order_list` VALUES ('193', '44', '178', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":930,\"pay_num\":56}', '1571135075');
INSERT INTO `z_order_list` VALUES ('194', '44', '179', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":1,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7693\\u7389\\u767d , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1571135913');
INSERT INTO `z_order_list` VALUES ('195', '44', '180', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":42,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a38\\u7247\",\"fare_money\":11,\"stock\":930,\"pay_num\":56}', '1571136296');
INSERT INTO `z_order_list` VALUES ('196', '48', '181', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1571187834');
INSERT INTO `z_order_list` VALUES ('197', '48', '182', '1', '4', '追风筝的人', '/uploads/20190320/af76bde21bee295e2ff3e7b77112817a.jpg', '39.00', '{\"id\":19,\"price\":\"39.00\",\"old_price\":\"48.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a\\u9ed8\\u8ba4\\u89c4\\u683c\",\"fare_money\":0,\"stock\":993,\"pay_num\":0}', '1571187912');
INSERT INTO `z_order_list` VALUES ('198', '48', '183', '1', '6', 'MAC魅可19年新春限定联名口红', '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', '10.00', '{\"id\":22,\"price\":\"10.00\",\"old_price\":\"20.00\",\"spec_name\":\"\\u8272\\u53f7\\uff1a32#\",\"fare_money\":0,\"stock\":10,\"pay_num\":0}', '1571187938');
INSERT INTO `z_order_list` VALUES ('199', '49', '184', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '7699.00', '{\"id\":2,\"price\":\"7699.00\",\"old_price\":\"7699.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7693\\u7389\\u767d , \\u7248\\u672c\\uff1a8GB+512GB\",\"fare_money\":0,\"stock\":1000,\"pay_num\":0}', '1571188213');
INSERT INTO `z_order_list` VALUES ('200', '49', '185', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":25,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a21\\u7247\",\"fare_money\":11,\"stock\":1000,\"pay_num\":0}', '1571188334');
INSERT INTO `z_order_list` VALUES ('201', '49', '186', '1', '1', '三星 Galaxy S10（SM-G9730）', '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', '5999.00', '{\"id\":5,\"price\":\"5999.00\",\"old_price\":\"5999.00\",\"spec_name\":\"\\u989c\\u8272\\uff1a\\u7409\\u7483\\u7eff , \\u7248\\u672c\\uff1a8GB+128GB\",\"fare_money\":0,\"stock\":986,\"pay_num\":7}', '1571188538');
INSERT INTO `z_order_list` VALUES ('202', '49', '187', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":25,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a21\\u7247\",\"fare_money\":11,\"stock\":993,\"pay_num\":0}', '1571197511');
INSERT INTO `z_order_list` VALUES ('203', '33', '188', '1', '3', '山海经典藏画册', '/uploads/20190320/5bd2a1ab0b26a46f808226dd22d52b3f.jpg', '89.00', '{\"id\":18,\"price\":\"89.00\",\"old_price\":\"128.00\",\"spec_name\":\"\\u5957\\u88c5\\uff1a\\u6574\\u59578\\u518c\",\"fare_money\":0,\"stock\":985,\"pay_num\":0}', '1571197581');
INSERT INTO `z_order_list` VALUES ('204', '40', '189', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":26,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a36\\u7247\",\"fare_money\":11,\"stock\":1000,\"pay_num\":0}', '1571298357');
INSERT INTO `z_order_list` VALUES ('205', '40', '190', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1571299083');
INSERT INTO `z_order_list` VALUES ('206', '26', '191', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":25,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a21\\u7247\",\"fare_money\":11,\"stock\":986,\"pay_num\":7}', '1571300344');
INSERT INTO `z_order_list` VALUES ('207', '33', '192', '1', '11', '敷尔佳白膜', '/uploads/20190925/947094e65469e420893673c89e204fc7.jpg', '87.00', '{\"id\":47,\"price\":\"87.00\",\"old_price\":\"87.00\",\"spec_name\":\"\\u6577\\u5c14\\u4f73\\u767d\\u819c\\u4e00\\u76d2\\uff1a\\u767d\\u819c\",\"fare_money\":0,\"stock\":300,\"pay_num\":0}', '1572328954');
INSERT INTO `z_order_list` VALUES ('208', '33', '193', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1572427062');
INSERT INTO `z_order_list` VALUES ('209', '33', '193', '1', '11', '敷尔佳白膜', '/uploads/20190925/947094e65469e420893673c89e204fc7.jpg', '87.00', '{\"id\":47,\"price\":\"87.00\",\"old_price\":\"87.00\",\"spec_name\":\"\\u6577\\u5c14\\u4f73\\u767d\\u819c\\u4e00\\u76d2\\uff1a\\u767d\\u819c\",\"fare_money\":0,\"stock\":300,\"pay_num\":0}', '1572427062');
INSERT INTO `z_order_list` VALUES ('210', '33', '194', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":972,\"pay_num\":14}', '1572428902');
INSERT INTO `z_order_list` VALUES ('211', '33', '194', '1', '11', '敷尔佳白膜', '/uploads/20190925/947094e65469e420893673c89e204fc7.jpg', '87.00', '{\"id\":47,\"price\":\"87.00\",\"old_price\":\"87.00\",\"spec_name\":\"\\u6577\\u5c14\\u4f73\\u767d\\u819c\\u4e00\\u76d2\\uff1a\\u767d\\u819c\",\"fare_money\":0,\"stock\":300,\"pay_num\":0}', '1572428902');
INSERT INTO `z_order_list` VALUES ('212', '32', '195', '1', '5', '广西高乐蜜芒果', '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', '54.00', '{\"id\":20,\"price\":\"54.00\",\"old_price\":\"60.00\",\"spec_name\":\"\\u9ed8\\u8ba4\\u5c5e\\u6027\\uff1a4\\u4e2a\\u88c5\",\"fare_money\":10,\"stock\":958,\"pay_num\":14}', '1572508299');
INSERT INTO `z_order_list` VALUES ('213', '32', '196', '1', '7', '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '/uploads/20190810/c729aca7dc24252c4fb5ed70163891dd.jpg', '12.00', '{\"id\":25,\"price\":\"12.00\",\"old_price\":\"11.00\",\"spec_name\":\"\\u89c4\\u683c\\uff1a21\\u7247\",\"fare_money\":11,\"stock\":979,\"pay_num\":7}', '1572509004');

-- ----------------------------
-- Table structure for z_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `z_order_refund`;
CREATE TABLE `z_order_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '退款订单ID，所属哪个订单',
  `order_no` varchar(255) DEFAULT NULL COMMENT '退款订单编号',
  `refund_no` varchar(255) DEFAULT NULL COMMENT '退款编号',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '申请退款金额（实际支付金额）',
  `images` varchar(255) DEFAULT '' COMMENT '退款凭证',
  `reason` varchar(255) DEFAULT '' COMMENT '退款原因',
  `explain` varchar(255) DEFAULT NULL COMMENT '退款说明',
  `result_code` varchar(20) DEFAULT '' COMMENT '业务结果，微信返回',
  `return_msg` varchar(255) DEFAULT '' COMMENT '返回信息，微信返回',
  `err_code` varchar(50) DEFAULT '' COMMENT '错误代码，微信返回',
  `out_refund_no` varchar(100) DEFAULT '' COMMENT '商户退款单号，微信返回',
  `refund_fee` int(11) DEFAULT NULL COMMENT '退款金额，微信返回',
  `is_refund` tinyint(1) unsigned DEFAULT '1' COMMENT '是否退款   1提交退款申请   2已退款   3拒绝退款',
  `add_time` int(11) DEFAULT NULL COMMENT '申请退款时间',
  `uid` int(11) DEFAULT NULL COMMENT '申请用户',
  `refund_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '退款申请金额',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `pay_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1微信支付2余额支付',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `goods_title` varchar(100) NOT NULL DEFAULT '' COMMENT '商品标题',
  `discount` varchar(155) NOT NULL DEFAULT '',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单退款申请记录';

-- ----------------------------
-- Records of z_order_refund
-- ----------------------------
INSERT INTO `z_order_refund` VALUES ('1', '65', '201908060950098305', '201908091140915518', '7699.00', '', '仅退款', '1', '', '', '', '', null, '1', '1565322059', '33', '0.00', '0', '1', 'img', '标题', '', '0.00');
INSERT INTO `z_order_refund` VALUES ('2', '80', '201908101707575714', '201909182255746935', '7699.00', '', '仅退款', '2', '', '', '', '', null, '1', '1568818529', '33', '0.00', '0', '1', '', '', '', '0.00');
INSERT INTO `z_order_refund` VALUES ('3', '175', '201910151800915639', '201910291541492257', '23.00', '', '退货退款', '3', '', '', '', '', null, '3', '1572334911', '33', '10.00', '0', '1', '', '', '', '0.00');
INSERT INTO `z_order_refund` VALUES ('4', '193', '201910301717917062', '201910301720057017', '151.00', '', '仅退款', null, '', '', '', '', null, '2', '1572427244', '33', '0.01', '0', '1', '', '', '', '0.00');
INSERT INTO `z_order_refund` VALUES ('5', '194', '201910301748057768', '201910311017410430', '151.00', '', '后台主动退款', '后台主动退款', '', '', '', '', null, '2', '1572488259', null, '0.01', '1572488259', '1', '', '', '', '0.00');
INSERT INTO `z_order_refund` VALUES ('8', '195', '201910311551719548', '201910311600306133', '64.00', '', '仅退款', null, '', '', '', '', null, '2', '1572508835', '32', '0.01', '0', '1', '', '', '', '0.00');

-- ----------------------------
-- Table structure for z_point_change
-- ----------------------------
DROP TABLE IF EXISTS `z_point_change`;
CREATE TABLE `z_point_change` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '获得积分用户ID',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型   1签到获得  2兑换商品 3抵扣4兑换优惠券',
  `desc` varchar(255) DEFAULT '' COMMENT '事件描述',
  `point` int(11) DEFAULT '0' COMMENT '积分',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '收支类型 1收入 2支出',
  `add_time` int(11) DEFAULT NULL,
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_point_change_uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COMMENT='积分明细记录';

-- ----------------------------
-- Records of z_point_change
-- ----------------------------
INSERT INTO `z_point_change` VALUES ('1', '6', '1', '签到获得', '10', '1', '1562989499', '0');
INSERT INTO `z_point_change` VALUES ('2', '6', '2', '兑换商品', '-5', '2', '1563594298', '0');
INSERT INTO `z_point_change` VALUES ('4', '20', '1', '每日签到', '10', '1', '1563097754', '1563097754');
INSERT INTO `z_point_change` VALUES ('5', '19', '1', '每日签到', '10', '1', '1563153179', '1563153179');
INSERT INTO `z_point_change` VALUES ('6', '19', '4', '兑换优惠券', '0', '2', '1563209256', '1563209256');
INSERT INTO `z_point_change` VALUES ('7', '20', '4', '兑换优惠券', '0', '2', '1563209377', '1563209377');
INSERT INTO `z_point_change` VALUES ('8', '20', '4', '兑换优惠券', '0', '2', '1563209441', '1563209441');
INSERT INTO `z_point_change` VALUES ('9', '19', '1', '每日签到', '10', '1', '1563209446', '1563209446');
INSERT INTO `z_point_change` VALUES ('10', '20', '4', '兑换优惠券', '0', '2', '1563209455', '1563209455');
INSERT INTO `z_point_change` VALUES ('11', '20', '4', '兑换优惠券', '-1', '2', '1563209660', '1563209660');
INSERT INTO `z_point_change` VALUES ('12', '20', '4', '兑换优惠券', '0', '2', '1563209701', '1563209701');
INSERT INTO `z_point_change` VALUES ('13', '11', '1', '每日签到', '10', '1', '1563212353', '1563212353');
INSERT INTO `z_point_change` VALUES ('14', '25', '1', '每日签到', '10', '1', '1563213009', '1563213009');
INSERT INTO `z_point_change` VALUES ('15', '19', '1', '每日签到', '10', '1', '1563213025', '1563213025');
INSERT INTO `z_point_change` VALUES ('16', '26', '1', '每日签到', '10', '1', '1563213046', '1563213046');
INSERT INTO `z_point_change` VALUES ('17', '19', '1', '每日签到', '10', '1', '1563213111', '1563213111');
INSERT INTO `z_point_change` VALUES ('18', '25', '1', '每日签到', '10', '1', '1563213171', '1563213171');
INSERT INTO `z_point_change` VALUES ('19', '11', '1', '每日签到', '10', '1', '1563213279', '1563213279');
INSERT INTO `z_point_change` VALUES ('20', '25', '1', '每日签到', '10', '1', '1563213381', '1563213381');
INSERT INTO `z_point_change` VALUES ('21', '25', '4', '兑换优惠券', '-1', '2', '1563213403', '1563213403');
INSERT INTO `z_point_change` VALUES ('22', '11', '4', '兑换优惠券', '-1', '2', '1563213519', '1563213519');
INSERT INTO `z_point_change` VALUES ('23', '25', '4', '兑换优惠券', '-1', '2', '1563213533', '1563213533');
INSERT INTO `z_point_change` VALUES ('24', '19', '1', '每日签到', '10', '1', '1563213533', '1563213533');
INSERT INTO `z_point_change` VALUES ('25', '27', '1', '每日签到', '10', '1', '1563261439', '1563261439');
INSERT INTO `z_point_change` VALUES ('26', '21', '1', '每日签到', '10', '1', '1563268142', '1563268142');
INSERT INTO `z_point_change` VALUES ('27', '19', '4', '兑换优惠券', '-100', '2', '1563268731', '1563268731');
INSERT INTO `z_point_change` VALUES ('28', '19', '1', '每日签到', '10', '1', '1563325745', '1563325745');
INSERT INTO `z_point_change` VALUES ('29', '21', '1', '每日签到', '10', '1', '1563351656', '1563351656');
INSERT INTO `z_point_change` VALUES ('30', '27', '1', '每日签到', '10', '1', '1563358586', '1563358586');
INSERT INTO `z_point_change` VALUES ('31', '19', '1', '每日签到', '10', '1', '1563762354', '1563762354');
INSERT INTO `z_point_change` VALUES ('32', '30', '1', '每日签到', '10', '1', '1563797413', '1563797413');
INSERT INTO `z_point_change` VALUES ('33', '21', '1', '每日签到', '10', '1', '1564040587', '1564040587');
INSERT INTO `z_point_change` VALUES ('34', '19', '3', '普通订单积分抵扣', '-20', '2', '1564127030', '0');
INSERT INTO `z_point_change` VALUES ('35', '19', '3', '普通订单积分抵扣', '-80', '2', '1564129187', '0');
INSERT INTO `z_point_change` VALUES ('36', '19', '3', '普通订单积分抵扣', '-20', '2', '1564131386', '0');
INSERT INTO `z_point_change` VALUES ('37', '19', '3', '普通订单积分抵扣', '-80', '2', '1564131665', '0');
INSERT INTO `z_point_change` VALUES ('38', '19', '3', '普通订单积分抵扣', '-20', '2', '1564131770', '0');
INSERT INTO `z_point_change` VALUES ('39', '19', '3', '普通订单积分抵扣', '-80', '2', '1564131845', '0');
INSERT INTO `z_point_change` VALUES ('40', '19', '3', '普通订单积分抵扣', '-20', '2', '1564131922', '0');
INSERT INTO `z_point_change` VALUES ('41', '19', '1', '每日签到', '10', '1', '1564189483', '1564189483');
INSERT INTO `z_point_change` VALUES ('42', '19', '4', '兑换优惠券', '-100', '2', '1564456736', '1564456736');
INSERT INTO `z_point_change` VALUES ('43', '33', '1', '每日签到', '10', '1', '1564848605', '1564848605');
INSERT INTO `z_point_change` VALUES ('44', '33', '1', '每日签到', '10', '1', '1565097980', '1565097980');
INSERT INTO `z_point_change` VALUES ('45', '33', '1', '每日签到', '10', '1', '1565424912', '1565424912');
INSERT INTO `z_point_change` VALUES ('46', '28', '1', '每日签到', '10', '1', '1565782350', '1565782350');
INSERT INTO `z_point_change` VALUES ('47', '13', '1', '每日签到', '10', '1', '1565789301', '1565789301');
INSERT INTO `z_point_change` VALUES ('48', '33', '1', '每日签到', '10', '1', '1566804986', '1566804986');
INSERT INTO `z_point_change` VALUES ('49', '33', '1', '每日签到', '10', '1', '1568818494', '1568818494');
INSERT INTO `z_point_change` VALUES ('50', '36', '1', '每日签到', '10', '1', '1568952140', '1568952140');
INSERT INTO `z_point_change` VALUES ('51', '28', '1', '每日签到', '10', '1', '1568967214', '1568967214');
INSERT INTO `z_point_change` VALUES ('52', '28', '2', '兑换商品', '-100', '2', '1568980665', '1568980665');
INSERT INTO `z_point_change` VALUES ('53', '41', '1', '每日签到', '10', '1', '1569059564', '1569059564');
INSERT INTO `z_point_change` VALUES ('54', '21', '1', '每日签到', '10', '1', '1569392111', '1569392111');
INSERT INTO `z_point_change` VALUES ('55', '21', '1', '每日签到', '10', '1', '1569484371', '1569484371');
INSERT INTO `z_point_change` VALUES ('56', '21', '4', '兑换优惠券', '-10', '2', '1569551773', '1569551773');
INSERT INTO `z_point_change` VALUES ('57', '21', '4', '兑换优惠券', '-10', '2', '1569551775', '1569551775');
INSERT INTO `z_point_change` VALUES ('58', '21', '4', '兑换优惠券', '-10', '2', '1569551776', '1569551776');
INSERT INTO `z_point_change` VALUES ('59', '21', '4', '兑换优惠券', '-10', '2', '1569551777', '1569551777');
INSERT INTO `z_point_change` VALUES ('60', '21', '4', '兑换优惠券', '-10', '2', '1569551777', '1569551777');
INSERT INTO `z_point_change` VALUES ('61', '21', '4', '兑换优惠券', '-10', '2', '1569551777', '1569551777');
INSERT INTO `z_point_change` VALUES ('62', '21', '4', '兑换优惠券', '-10', '2', '1569551777', '1569551777');
INSERT INTO `z_point_change` VALUES ('63', '21', '4', '兑换优惠券', '-10', '2', '1569551777', '1569551777');
INSERT INTO `z_point_change` VALUES ('64', '21', '4', '兑换优惠券', '-10', '2', '1569551778', '1569551778');
INSERT INTO `z_point_change` VALUES ('65', '21', '4', '兑换优惠券', '-10', '2', '1569551778', '1569551778');
INSERT INTO `z_point_change` VALUES ('66', '21', '4', '兑换优惠券', '-10', '2', '1569551778', '1569551778');
INSERT INTO `z_point_change` VALUES ('67', '21', '4', '兑换优惠券', '-10', '2', '1569551778', '1569551778');
INSERT INTO `z_point_change` VALUES ('68', '21', '4', '兑换优惠券', '-10', '2', '1569551778', '1569551778');
INSERT INTO `z_point_change` VALUES ('69', '21', '4', '兑换优惠券', '-10', '2', '1569551779', '1569551779');
INSERT INTO `z_point_change` VALUES ('70', '21', '4', '兑换优惠券', '-10', '2', '1569551779', '1569551779');
INSERT INTO `z_point_change` VALUES ('71', '21', '4', '兑换优惠券', '-10', '2', '1569551779', '1569551779');
INSERT INTO `z_point_change` VALUES ('72', '21', '4', '兑换优惠券', '-10', '2', '1569551779', '1569551779');
INSERT INTO `z_point_change` VALUES ('73', '21', '4', '兑换优惠券', '-10', '2', '1569551779', '1569551779');
INSERT INTO `z_point_change` VALUES ('74', '21', '4', '兑换优惠券', '-10', '2', '1569551780', '1569551780');
INSERT INTO `z_point_change` VALUES ('75', '21', '1', '每日签到', '10', '1', '1569563634', '1569563634');
INSERT INTO `z_point_change` VALUES ('76', '31', '1', '每日签到', '10', '1', '1569573739', '1569573739');
INSERT INTO `z_point_change` VALUES ('77', '11', '1', '每日签到', '10', '1', '1569574504', '1569574504');
INSERT INTO `z_point_change` VALUES ('78', '33', '4', '兑换优惠券', '-1800', '2', '1569576200', '1569576200');
INSERT INTO `z_point_change` VALUES ('79', '33', '4', '兑换优惠券', '-1800', '2', '1569576203', '1569576203');
INSERT INTO `z_point_change` VALUES ('80', '40', '1', '每日签到', '10', '1', '1569576206', '1569576206');
INSERT INTO `z_point_change` VALUES ('81', '11', '4', '兑换优惠券', '-10', '2', '1569576209', '1569576209');
INSERT INTO `z_point_change` VALUES ('82', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('83', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('84', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('85', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('86', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('87', '40', '4', '兑换优惠券', '-10', '2', '1569576213', '1569576213');
INSERT INTO `z_point_change` VALUES ('88', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('89', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('90', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('91', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('92', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('93', '11', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('94', '40', '4', '兑换优惠券', '-10', '2', '1569576214', '1569576214');
INSERT INTO `z_point_change` VALUES ('95', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('96', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('97', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('98', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('99', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('100', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('101', '11', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('102', '11', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('103', '11', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('104', '40', '4', '兑换优惠券', '-10', '2', '1569576215', '1569576215');
INSERT INTO `z_point_change` VALUES ('105', '40', '4', '兑换优惠券', '-10', '2', '1569576216', '1569576216');
INSERT INTO `z_point_change` VALUES ('106', '40', '4', '兑换优惠券', '-10', '2', '1569576216', '1569576216');
INSERT INTO `z_point_change` VALUES ('107', '40', '4', '兑换优惠券', '-10', '2', '1569576216', '1569576216');
INSERT INTO `z_point_change` VALUES ('108', '40', '4', '兑换优惠券', '-10', '2', '1569576216', '1569576216');
INSERT INTO `z_point_change` VALUES ('109', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('110', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('111', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('112', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('113', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('114', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('115', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('116', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('117', '40', '4', '兑换优惠券', '-10', '2', '1569576217', '1569576217');
INSERT INTO `z_point_change` VALUES ('118', '40', '4', '兑换优惠券', '-10', '2', '1569576218', '1569576218');
INSERT INTO `z_point_change` VALUES ('119', '40', '4', '兑换优惠券', '-10', '2', '1569576218', '1569576218');
INSERT INTO `z_point_change` VALUES ('120', '40', '4', '兑换优惠券', '-10', '2', '1569576218', '1569576218');
INSERT INTO `z_point_change` VALUES ('121', '41', '4', '兑换优惠券', '-10', '2', '1569576223', '1569576223');
INSERT INTO `z_point_change` VALUES ('122', '41', '4', '兑换优惠券', '-10', '2', '1569576225', '1569576225');
INSERT INTO `z_point_change` VALUES ('123', '41', '4', '兑换优惠券', '-10', '2', '1569576227', '1569576227');
INSERT INTO `z_point_change` VALUES ('124', '41', '4', '兑换优惠券', '-10', '2', '1569576228', '1569576228');
INSERT INTO `z_point_change` VALUES ('125', '41', '4', '兑换优惠券', '-10', '2', '1569576230', '1569576230');
INSERT INTO `z_point_change` VALUES ('126', '31', '4', '兑换优惠券', '-10', '2', '1569576233', '1569576233');
INSERT INTO `z_point_change` VALUES ('127', '31', '4', '兑换优惠券', '-10', '2', '1569576233', '1569576233');
INSERT INTO `z_point_change` VALUES ('128', '31', '4', '兑换优惠券', '-10', '2', '1569576234', '1569576234');
INSERT INTO `z_point_change` VALUES ('129', '31', '4', '兑换优惠券', '-10', '2', '1569576234', '1569576234');
INSERT INTO `z_point_change` VALUES ('130', '31', '4', '兑换优惠券', '-10', '2', '1569576236', '1569576236');
INSERT INTO `z_point_change` VALUES ('131', '31', '4', '兑换优惠券', '-10', '2', '1569576236', '1569576236');
INSERT INTO `z_point_change` VALUES ('132', '31', '4', '兑换优惠券', '-10', '2', '1569576236', '1569576236');
INSERT INTO `z_point_change` VALUES ('133', '31', '4', '兑换优惠券', '-10', '2', '1569576236', '1569576236');
INSERT INTO `z_point_change` VALUES ('134', '31', '4', '兑换优惠券', '-10', '2', '1569576237', '1569576237');
INSERT INTO `z_point_change` VALUES ('135', '31', '4', '兑换优惠券', '-10', '2', '1569576237', '1569576237');
INSERT INTO `z_point_change` VALUES ('136', '31', '4', '兑换优惠券', '-10', '2', '1569576238', '1569576238');
INSERT INTO `z_point_change` VALUES ('137', '31', '4', '兑换优惠券', '-10', '2', '1569576238', '1569576238');
INSERT INTO `z_point_change` VALUES ('138', '31', '4', '兑换优惠券', '-10', '2', '1569576238', '1569576238');
INSERT INTO `z_point_change` VALUES ('139', '31', '4', '兑换优惠券', '-10', '2', '1569576238', '1569576238');
INSERT INTO `z_point_change` VALUES ('140', '31', '4', '兑换优惠券', '-10', '2', '1569576239', '1569576239');
INSERT INTO `z_point_change` VALUES ('141', '33', '1', '每日签到', '10', '1', '1570010507', '1570010507');
INSERT INTO `z_point_change` VALUES ('142', '33', '1', '每日签到', '10', '1', '1570936229', '1570936229');
INSERT INTO `z_point_change` VALUES ('143', '33', '4', '兑换优惠券', '-10', '2', '1570950796', '1570950796');
INSERT INTO `z_point_change` VALUES ('144', '33', '4', '兑换优惠券', '-10', '2', '1570950798', '1570950798');
INSERT INTO `z_point_change` VALUES ('145', '33', '4', '兑换优惠券', '-10', '2', '1570950810', '1570950810');
INSERT INTO `z_point_change` VALUES ('146', '33', '4', '兑换优惠券', '-10', '2', '1570950818', '1570950818');
INSERT INTO `z_point_change` VALUES ('147', '33', '4', '兑换优惠券', '-10', '2', '1570954132', '1570954132');
INSERT INTO `z_point_change` VALUES ('148', '33', '1', '每日签到', '10', '1', '1571037574', '1571037574');
INSERT INTO `z_point_change` VALUES ('149', '40', '1', '每日签到', '10', '1', '1571043840', '1571043840');
INSERT INTO `z_point_change` VALUES ('150', '40', '1', '每日签到', '10', '1', '1571044463', '1571044463');
INSERT INTO `z_point_change` VALUES ('151', '40', '1', '连续签到', '5', '1', '1571044463', '1571044463');
INSERT INTO `z_point_change` VALUES ('152', '33', '3', '普通订单积分抵扣', '-20', '2', '1571058948', '0');
INSERT INTO `z_point_change` VALUES ('153', '33', '4', '兑换优惠券', '-10', '2', '1571102705', '1571102705');
INSERT INTO `z_point_change` VALUES ('154', '33', '4', '兑换优惠券', '-10', '2', '1571102707', '1571102707');
INSERT INTO `z_point_change` VALUES ('155', '33', '4', '兑换优惠券', '-10', '2', '1571102712', '1571102712');
INSERT INTO `z_point_change` VALUES ('156', '33', '4', '兑换优惠券', '-10', '2', '1571102761', '1571102761');
INSERT INTO `z_point_change` VALUES ('157', '33', '4', '兑换优惠券', '-10', '2', '1571102763', '1571102763');
INSERT INTO `z_point_change` VALUES ('158', '33', '2', '兑换商品', '-100', '2', '1571107676', '1571107676');
INSERT INTO `z_point_change` VALUES ('159', '33', '1', '每日签到', '10', '1', '1571108598', '1571108598');
INSERT INTO `z_point_change` VALUES ('160', '44', '1', '每日签到', '10', '1', '1571133434', '1571133434');
INSERT INTO `z_point_change` VALUES ('161', '44', '4', '兑换优惠券', '-10', '2', '1571133452', '1571133452');
INSERT INTO `z_point_change` VALUES ('162', '29', '1', '每日签到', '10', '1', '1571133723', '1571133723');
INSERT INTO `z_point_change` VALUES ('163', '44', '5', '邀请好友奖励', '100', '1', '1571134044', '1571134044');
INSERT INTO `z_point_change` VALUES ('164', '33', '5', '邀请好友奖励', '100', '1', '1571134245', '1571134245');
INSERT INTO `z_point_change` VALUES ('165', '47', '1', '每日签到', '10', '1', '1571152835', '1571152835');
INSERT INTO `z_point_change` VALUES ('166', '44', '1', '每日签到', '10', '1', '1571187100', '1571187100');
INSERT INTO `z_point_change` VALUES ('167', '49', '1', '每日签到', '10', '1', '1571188239', '1571188239');
INSERT INTO `z_point_change` VALUES ('168', '49', '4', '兑换优惠券', '-10', '2', '1571188250', '1571188250');
INSERT INTO `z_point_change` VALUES ('169', '26', '1', '每日签到', '10', '1', '1571274116', '1571274116');
INSERT INTO `z_point_change` VALUES ('170', '49', '1', '每日签到', '10', '1', '1571296159', '1571296159');
INSERT INTO `z_point_change` VALUES ('171', '21', '1', '每日签到', '10', '1', '1571296334', '1571296334');
INSERT INTO `z_point_change` VALUES ('172', '21', '1', '连续签到', '5', '1', '1571296334', '1571296334');
INSERT INTO `z_point_change` VALUES ('173', '26', '4', '兑换优惠券', '-10', '2', '1571298485', '1571298485');
INSERT INTO `z_point_change` VALUES ('174', '33', '1', '每日签到', '10', '1', '1571298832', '1571298832');
INSERT INTO `z_point_change` VALUES ('175', '33', '1', '连续签到', '5', '1', '1571298832', '1571298832');
INSERT INTO `z_point_change` VALUES ('176', '40', '1', '每日签到', '10', '1', '1571298985', '1571298985');
INSERT INTO `z_point_change` VALUES ('177', '33', '1', '每日签到', '10', '1', '1572053198', '1572053198');
INSERT INTO `z_point_change` VALUES ('178', '33', '4', '兑换优惠券', '-10', '2', '1572058315', '1572058315');
INSERT INTO `z_point_change` VALUES ('179', '33', '4', '兑换优惠券', '-10', '2', '1572058317', '1572058317');
INSERT INTO `z_point_change` VALUES ('180', '33', '4', '兑换优惠券', '-10', '2', '1572058319', '1572058319');
INSERT INTO `z_point_change` VALUES ('181', '33', '4', '兑换优惠券', '-10', '2', '1572058319', '1572058319');
INSERT INTO `z_point_change` VALUES ('182', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('183', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('184', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('185', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('186', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('187', '33', '4', '兑换优惠券', '-10', '2', '1572058320', '1572058320');
INSERT INTO `z_point_change` VALUES ('188', '33', '4', '兑换优惠券', '-10', '2', '1572058321', '1572058321');
INSERT INTO `z_point_change` VALUES ('189', '33', '4', '兑换优惠券', '-10', '2', '1572058324', '1572058324');
INSERT INTO `z_point_change` VALUES ('190', '33', '4', '兑换优惠券', '-10', '2', '1572058325', '1572058325');
INSERT INTO `z_point_change` VALUES ('191', '33', '4', '兑换优惠券', '-10', '2', '1572058325', '1572058325');
INSERT INTO `z_point_change` VALUES ('192', '33', '4', '兑换优惠券', '-10', '2', '1572058325', '1572058325');
INSERT INTO `z_point_change` VALUES ('193', '33', '4', '兑换优惠券', '-10', '2', '1572058325', '1572058325');
INSERT INTO `z_point_change` VALUES ('194', '33', '4', '兑换优惠券', '-10', '2', '1572058326', '1572058326');
INSERT INTO `z_point_change` VALUES ('195', '33', '4', '兑换优惠券', '-10', '2', '1572058329', '1572058329');
INSERT INTO `z_point_change` VALUES ('196', '33', '4', '兑换优惠券', '-10', '2', '1572058329', '1572058329');
INSERT INTO `z_point_change` VALUES ('197', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('198', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('199', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('200', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('201', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('202', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('203', '33', '4', '兑换优惠券', '-10', '2', '1572058330', '1572058330');
INSERT INTO `z_point_change` VALUES ('204', '33', '4', '兑换优惠券', '-10', '2', '1572058331', '1572058331');
INSERT INTO `z_point_change` VALUES ('205', '33', '4', '兑换优惠券', '-10', '2', '1572058331', '1572058331');
INSERT INTO `z_point_change` VALUES ('206', '33', '4', '兑换优惠券', '-10', '2', '1572058331', '1572058331');
INSERT INTO `z_point_change` VALUES ('207', '33', '4', '兑换优惠券', '-10', '2', '1572058331', '1572058331');
INSERT INTO `z_point_change` VALUES ('208', '33', '4', '兑换优惠券', '-10', '2', '1572058331', '1572058331');
INSERT INTO `z_point_change` VALUES ('209', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('210', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('211', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('212', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('213', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('214', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('215', '33', '4', '兑换优惠券', '-10', '2', '1572058332', '1572058332');
INSERT INTO `z_point_change` VALUES ('216', '33', '4', '兑换优惠券', '-10', '2', '1572058333', '1572058333');
INSERT INTO `z_point_change` VALUES ('217', '33', '4', '兑换优惠券', '-10', '2', '1572058333', '1572058333');
INSERT INTO `z_point_change` VALUES ('218', '33', '4', '兑换优惠券', '-10', '2', '1572058333', '1572058333');
INSERT INTO `z_point_change` VALUES ('219', '33', '4', '兑换优惠券', '-10', '2', '1572058333', '1572058333');
INSERT INTO `z_point_change` VALUES ('220', '33', '4', '兑换优惠券', '-10', '2', '1572058334', '1572058334');
INSERT INTO `z_point_change` VALUES ('221', '33', '4', '兑换优惠券', '-10', '2', '1572058334', '1572058334');
INSERT INTO `z_point_change` VALUES ('222', '33', '4', '兑换优惠券', '-10', '2', '1572058334', '1572058334');
INSERT INTO `z_point_change` VALUES ('223', '33', '4', '兑换优惠券', '-10', '2', '1572058334', '1572058334');
INSERT INTO `z_point_change` VALUES ('224', '33', '4', '兑换优惠券', '-10', '2', '1572058334', '1572058334');
INSERT INTO `z_point_change` VALUES ('225', '33', '4', '兑换优惠券', '-10', '2', '1572058335', '1572058335');
INSERT INTO `z_point_change` VALUES ('226', '33', '4', '兑换优惠券', '-10', '2', '1572058335', '1572058335');
INSERT INTO `z_point_change` VALUES ('227', '33', '4', '兑换优惠券', '-10', '2', '1572058335', '1572058335');
INSERT INTO `z_point_change` VALUES ('228', '33', '4', '兑换优惠券', '-10', '2', '1572058335', '1572058335');
INSERT INTO `z_point_change` VALUES ('229', '33', '4', '兑换优惠券', '-10', '2', '1572058335', '1572058335');
INSERT INTO `z_point_change` VALUES ('230', '33', '4', '兑换优惠券', '-10', '2', '1572058336', '1572058336');
INSERT INTO `z_point_change` VALUES ('231', '33', '1', '每日签到', '10', '1', '1572312413', '1572312413');
INSERT INTO `z_point_change` VALUES ('232', '33', '1', '每日签到', '10', '1', '1572489814', '1572489814');

-- ----------------------------
-- Table structure for z_point_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_point_goods`;
CREATE TABLE `z_point_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '' COMMENT '商品名称',
  `pic` varchar(255) DEFAULT '' COMMENT '商品图片',
  `point` int(10) DEFAULT '0' COMMENT '积分',
  `num` int(10) DEFAULT '0' COMMENT '多少人已兑换',
  `desc` text COMMENT '详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '1兑换中2仓库中',
  `stock` int(10) DEFAULT '0' COMMENT '发放总数',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `images` text,
  `limit_status` tinyint(1) DEFAULT '1' COMMENT '1只能限兑换一件2不限',
  `grade_id` tinyint(1) DEFAULT '1' COMMENT '什么会员等级才能兑换',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分商品表';

-- ----------------------------
-- Records of z_point_goods
-- ----------------------------
INSERT INTO `z_point_goods` VALUES ('1', '三只松鼠匠芯曲奇抹茶味', '/uploads/20190713/9d6c74b19703841a164bc64cc6e3aba8.jpg', '100', '17', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190713/515d956271d0fb9bcfe276d59bbed04b.jpg\" width=\"300\"></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '1', '20', '1563017863', '1571107686', '/uploads/20190713/155d145097cbe75b98fa6f7a5e8f97cd.jpg,/uploads/20190713/b67e78d2d7897938ef12be0b2d3ad30d.jpg', '1', '5');
INSERT INTO `z_point_goods` VALUES ('2', '雀巢(Nestle) 脆脆鲨 休闲零食 威化饼干 巧克力口味', '/uploads/20190713/f8a988c1d202cb8263489e46f7ca7464.jpg', '50', '28', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190713/d3b1421a74111958d64c626e64ee91ca.jpg\" width=\"300\"></p><p><br></p>', '1', '10', '1563018107', '1571104128', '/uploads/20190713/5bf4962b3580b06ccd1cc59c2e96c6ab.jpg,/uploads/20190713/b33746470f2d5c38b84d97589d32b13b.jpg', '1', '1');

-- ----------------------------
-- Table structure for z_point_order
-- ----------------------------
DROP TABLE IF EXISTS `z_point_order`;
CREATE TABLE `z_point_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT '',
  `uid` int(10) DEFAULT '0',
  `point` int(10) DEFAULT '0' COMMENT '兑换积分',
  `goods_title` varchar(255) DEFAULT '',
  `goods_pic` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '1:待发货2已发货3关闭',
  `name` varchar(255) DEFAULT '' COMMENT '姓名',
  `tel` varchar(255) DEFAULT '' COMMENT '手机',
  `address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `add_time` int(10) DEFAULT NULL COMMENT '下单时间',
  `update_time` int(10) DEFAULT '0',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `goods_id` int(10) DEFAULT '0' COMMENT '商品id',
  `logistics_state` tinyint(1) DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '发货快递公司ID',
  `logistics_name` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(100) DEFAULT NULL COMMENT '发货快递单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分订单表';

-- ----------------------------
-- Records of z_point_order
-- ----------------------------
INSERT INTO `z_point_order` VALUES ('1', '201909201957915879', '28', '100', '三只松鼠匠芯曲奇抹茶味', '/uploads/20190713/9d6c74b19703841a164bc64cc6e3aba8.jpg', '1', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁aa', '1568980665', '1572601697', 'aa', '1', '0', null, '', '', null, null);
INSERT INTO `z_point_order` VALUES ('2', '201910151047596053', '33', '100', '三只松鼠匠芯曲奇抹茶味', '/uploads/20190713/9d6c74b19703841a164bc64cc6e3aba8.jpg', '2', '张三', '020-81167888', '广东省广州市海珠区新港中路397号qq', '1571107676', '1572601348', 'qq', '1', '1', '1', '顺丰快递', 'shunfeng', '11', '1571907552');

-- ----------------------------
-- Table structure for z_popup
-- ----------------------------
DROP TABLE IF EXISTS `z_popup`;
CREATE TABLE `z_popup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1活动弹窗；2新人弹窗',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='弹窗表';

-- ----------------------------
-- Records of z_popup
-- ----------------------------
INSERT INTO `z_popup` VALUES ('1', '/uploads/20190731/bd19da80ea56409c78cbd96bee24f19d.png', 'www.baidu.com', '1', '1564557069', '1564557444');
INSERT INTO `z_popup` VALUES ('3', '/uploads/20190924/2bdc675df93c5fd3b61e657d0d7cc529.png', 'www.baidu.com', '2', '1564557210', '1569320663');

-- ----------------------------
-- Table structure for z_sign
-- ----------------------------
DROP TABLE IF EXISTS `z_sign`;
CREATE TABLE `z_sign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '签到获得的积分',
  `add_time` int(11) NOT NULL COMMENT '签到时间',
  `day` int(11) DEFAULT NULL COMMENT '用户第几天签到',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_sign_uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户签到数据记录表';

-- ----------------------------
-- Records of z_sign
-- ----------------------------

-- ----------------------------
-- Table structure for z_sign_config
-- ----------------------------
DROP TABLE IF EXISTS `z_sign_config`;
CREATE TABLE `z_sign_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `today` int(10) DEFAULT '0',
  `point` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='签到配置';

-- ----------------------------
-- Records of z_sign_config
-- ----------------------------
INSERT INTO `z_sign_config` VALUES ('1', '3', '5', '1565850738', '1565850766');
INSERT INTO `z_sign_config` VALUES ('2', '5', '10', '1565850758', '1565850771');
INSERT INTO `z_sign_config` VALUES ('3', '10', '20', '1565850775', '1565850775');

-- ----------------------------
-- Table structure for z_skin
-- ----------------------------
DROP TABLE IF EXISTS `z_skin`;
CREATE TABLE `z_skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_skin
-- ----------------------------
INSERT INTO `z_skin` VALUES ('1', '健康肌肤', '/uploads/20190505/7c798727fb6bc2532b1dda81c621aa61.jpg', '肌肤健康，透亮，红润有光泽', '9', '1557038302', '1557038743');
INSERT INTO `z_skin` VALUES ('2', '痘痘肌', '/uploads/20190505/b3a83c8b265292d24927f2e7fcd8d144.jpg', '脸部肌肤长痘痘', '8', '1557038865', '1557038865');
INSERT INTO `z_skin` VALUES ('3', '痘印肌', '/uploads/20190505/a697582610aa46c814ba97d4e84492e6.jpg', '脸部肌肤有痘印', '6', '1557038909', '1557038909');
INSERT INTO `z_skin` VALUES ('4', '敏感肌', '/uploads/20190505/c2876f105925160fc2772a2a17df2a1d.jpg', '脸部肌肤比较敏感，容易过敏', '5', '1557038951', '1557038951');
INSERT INTO `z_skin` VALUES ('5', '医术美后', '/uploads/20190505/80b95c011d0dddd07d9951087bf65883.jpg', '进行过美容手术或微整形的', '5', '1557039006', '1557039006');

-- ----------------------------
-- Table structure for z_skin_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_skin_goods`;
CREATE TABLE `z_skin_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skin_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐商品ID',
  `old_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐组合商品ID',
  `crowd` varchar(255) NOT NULL DEFAULT '' COMMENT '针对人群',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '说明介绍',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_reco` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='肌肤类型推荐组合';

-- ----------------------------
-- Records of z_skin_goods
-- ----------------------------
INSERT INTO `z_skin_goods` VALUES ('1', '1', '3', '2', '肌肤暗淡无光泽', '测试组合描述', '9', '2', '1557108305', '1557108305');
INSERT INTO `z_skin_goods` VALUES ('2', '1', '2', '5', '测试', '测试测试', '8', '2', '1557123657', '1557123657');
INSERT INTO `z_skin_goods` VALUES ('3', '2', '7', '6', '肌肤暗淡', '水润面膜，激活肌肤', '7', '2', '1557125670', '1557125670');
INSERT INTO `z_skin_goods` VALUES ('4', '3', '6', '5', '嘴唇暗淡', '王者荣耀限量联名口红', '9', '2', '1557125783', '1557125783');
INSERT INTO `z_skin_goods` VALUES ('5', '5', '7', '5', '肌肤疲劳', '面膜加芒果', '9', '2', '1557127053', '1557127053');
INSERT INTO `z_skin_goods` VALUES ('6', '4', '6', '3', '测试人群', '口红加画册', '9', '2', '1557127138', '1557127138');

-- ----------------------------
-- Table structure for z_spike_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_goods`;
CREATE TABLE `z_spike_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `images` text COMMENT '相册',
  `label_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标签',
  `desc` text COMMENT '商品详情',
  `parameter` text COMMENT '商品参数',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `fare_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `time_id` int(11) NOT NULL DEFAULT '0' COMMENT '时间段ID',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='秒杀商品管理';

-- ----------------------------
-- Records of z_spike_goods
-- ----------------------------
INSERT INTO `z_spike_goods` VALUES ('1', '观山海 杉泽山海经彩图正版画册全集无删减', '69.00', '99.00', '/uploads/20190511/99a99081d5b93569d6e78a461445454a.jpg', '/uploads/20190511/f0dddc6299e2dc48450237e9ee7b1f8e.jpg,/uploads/20190511/8ef1bef801cab0ab15310c211d487969.jpg,/uploads/20190511/1e2784a505e7dacb6fff0598dba86aaa.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/0a15845506283d8a3700291cdd357124.jpg\" width=\"300\"></p><p><br></p>', '<p>无</p>', '79', '0', '5.00', '1', '1557559250', '1563206012');
INSERT INTO `z_spike_goods` VALUES ('2', '山海经典藏画册', '57.00', '88.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '/uploads/20190511/ccaa572eaa8539577dc7511724f3519f.jpg,/uploads/20190511/eb238302fe1e7f092a7bf770ec1a8de3.jpg', '3', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/53dcfc62d2a0158bca43174f2785e660.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/eee683cf9f008d10cc5cf01e0c2823fb.jpg\" width=\"300\"></p><p><br></p>', '<p>无</p>', '55', '0', '10.00', '3', '1557559300', '1568596843');
INSERT INTO `z_spike_goods` VALUES ('3', '商品标题', '1.00', '1.00', '/uploads/20190727/fb8ec7198d2309958b1798aec6ddbce4.png', null, '3', '<p>11111111111</p>', '<p>11</p>', '109', '0', '1.00', '3', '1564193452', '1568596830');

-- ----------------------------
-- Table structure for z_spike_order
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_order`;
CREATE TABLE `z_spike_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `uid` int(11) DEFAULT NULL COMMENT '下单用户ID',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后6售后成功7售后失败',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额(微信返回)',
  `pay_no` varchar(100) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '支付单号(微信返回)',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `logistics_state` tinyint(1) DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `logistics_id` int(11) DEFAULT NULL COMMENT '发货快递公司ID',
  `logistics_name` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `logistics_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `logistics_no` varchar(100) DEFAULT NULL COMMENT '发货快递单号',
  `logistics_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态（0未删除  1用户已删除  2后台删除）',
  `remark` varchar(255) DEFAULT '' COMMENT '用户留言',
  `type` tinyint(1) DEFAULT '1' COMMENT '1微信支付2余额支付',
  `fare_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `form_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='秒杀订单管理';

-- ----------------------------
-- Records of z_spike_order
-- ----------------------------
INSERT INTO `z_spike_order` VALUES ('1', '201907171706175631', '21', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '6', '李佳保', '17388714976', '天河区', '1563354379', '1572343152', '0', '0.00', '', null, '1', '2', '圆通快递', 'yuantong', '132', '1564823229', '0', '', '2', '10.00', '0');
INSERT INTO `z_spike_order` VALUES ('14', '201909201809477276', '28', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568974181', '1568974189', '0', '1.00', '201909201809477276', '1568974189', '0', null, '', '', null, null, '0', '', '1', '10.00', '0');
INSERT INTO `z_spike_order` VALUES ('15', '201909201810480097', '28', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568974212', '1568974250', '0', '1.00', '201909201810480097', '1568974250', '0', null, '', '', null, null, '0', '', '1', '10.00', '0');
INSERT INTO `z_spike_order` VALUES ('16', '201909201921527838', '28', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '信丰县', '1568978498', '1568978499', '0', '67.00', '201909201921527838', '1568978499', '0', null, '', '', null, null, '0', '', '2', '10.00', '0');
INSERT INTO `z_spike_order` VALUES ('21', '201909201949971348', '28', '1.00', '2.00', '3', '商品标题', '1.00', '/uploads/20190727/fb8ec7198d2309958b1798aec6ddbce4.png', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1568980167', '1568980168', '0', '2.00', '201909201949971348', '1568980168', '0', null, '', '', null, null, '0', '', '2', '1.00', '0');
INSERT INTO `z_spike_order` VALUES ('23', '201909211750421851', '41', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1569059407', '1569059413', '0', '1.00', '201909211750421851', '1569059413', '0', null, '', '', null, null, '0', '', '1', '10.00', '0');
INSERT INTO `z_spike_order` VALUES ('27', '201910151840037792', '44', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571136019', '1571136025', '0', '1.00', '201910151840037792', '1571136025', '0', null, '', '', null, null, '0', '', '1', '10.00', 'f4dfbdb7ca9c40c2877c04c6ec5ec882');
INSERT INTO `z_spike_order` VALUES ('28', '201910151842431555', '44', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571136131', '1571136137', '0', '1.00', '201910151842431555', '1571136137', '0', null, '', '', null, null, '0', '', '1', '10.00', '8ca73ecb4cfa47b9ad7c72958c9ae3c7');
INSERT INTO `z_spike_order` VALUES ('32', '201910160912460647', '49', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571188366', '1571188372', '0', '1.00', '201910160912460647', '1571188372', '0', null, '', '', null, null, '0', '', '1', '10.00', 'ca09b4b80b7c46109b9c1fb564b373ac');
INSERT INTO `z_spike_order` VALUES ('38', '201910161128833451', '49', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '2', '曾伟兵', '13263010441', '江西省赣州市信丰县麦饭石旁', '1571196484', '1571196485', '0', '67.00', '201910161128833451', '1571196485', '0', null, '', '', null, null, '0', '', '2', '10.00', 'fda5afd0befd49c3a874682f6527bd15');
INSERT INTO `z_spike_order` VALUES ('45', '201910291805363689', '33', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '7', '张三', '020-81167888', '广东省广州市海珠区新港中路397号', '1572343507', '1572343797', '0', '1.00', '201910291805363689', '1572343521', '1', '13', '中通快递', 'zhongtong', 'zt5510221', '1572343564', '0', '', '1', '10.00', 'the formId is a mock one');
INSERT INTO `z_spike_order` VALUES ('46', '201910291805432071', '33', '57.00', '67.00', '2', '山海经典藏画册', '57.00', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '6', '张三', '020-81167888', '广东省广州市海珠区新港中路397号', '1572343534', '1572601276', '0', '67.00', '201910291805432071', '1572343535', '1', '13', '中通快递', 'zhongtong', '2615151551595', '1572343555', '0', '11', '2', '10.00', 'the formId is a mock one');

-- ----------------------------
-- Table structure for z_spike_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_order_refund`;
CREATE TABLE `z_spike_order_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品名称',
  `goods_pic` varchar(255) DEFAULT '' COMMENT '商品图片',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格（退款金额）',
  `type` tinyint(1) DEFAULT '0' COMMENT '退款原因',
  `msg` varchar(500) DEFAULT '' COMMENT '退款说明',
  `many_pic` text COMMENT '凭证',
  `update_time` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT '0',
  `pay_type` tinyint(1) DEFAULT '1' COMMENT '微信支付2余额支付',
  `status` tinyint(255) unsigned DEFAULT '0' COMMENT '0未处理  1成功 2拒绝',
  `money` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='秒杀订单退款';

-- ----------------------------
-- Records of z_spike_order_refund
-- ----------------------------
INSERT INTO `z_spike_order_refund` VALUES ('3', '33', '45', '201910291805363689', '山海经典藏画册', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '57.00', '2', '1', '/uploads/20191029/86311c81a0ec782f1931cd4e303612fe.jpg', '1572343597', '1572343597', '1', '2', '0.01');
INSERT INTO `z_spike_order_refund` VALUES ('4', '33', '46', '201910291805432071', '山海经典藏画册', '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '57.00', '1', '', '/uploads/20191029/e2d9441c3712abd108a973229ebe0db2.jpg', '1572343608', '1572343608', '2', '1', '2.00');

-- ----------------------------
-- Table structure for z_spike_time
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_time`;
CREATE TABLE `z_spike_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '活动商品数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='秒杀时间段';

-- ----------------------------
-- Records of z_spike_time
-- ----------------------------
INSERT INTO `z_spike_time` VALUES ('1', '1562989499', '1564200716', '0', '1557478318', '1564820442');
INSERT INTO `z_spike_time` VALUES ('2', '1568964893', '1572451200', '0', '1557481027', '1571053380');
INSERT INTO `z_spike_time` VALUES ('3', '1568908800', '1572364800', '0', '1568596797', '1571053368');

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT '' COMMENT '用户昵称',
  `head_img` varchar(255) DEFAULT '' COMMENT '用户头像',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别 1男 2女',
  `province` varchar(255) DEFAULT '' COMMENT '省份',
  `city` varchar(255) DEFAULT '' COMMENT '城市',
  `openid` varchar(255) DEFAULT '' COMMENT '用户openid',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1 正常 2冻结',
  `subscribe` tinyint(1) DEFAULT '0' COMMENT '是否关注公众号 1表示关注 0表示未关注',
  `grade_id` int(11) DEFAULT '1' COMMENT '会员等级1店铺会员2鱼家新粉3鱼家铁粉4鱼家真爱粉5鱼家粉你',
  `token` varchar(255) DEFAULT '' COMMENT '用户 token 接口凭证',
  `skin_id` varchar(255) DEFAULT '' COMMENT '用户肌肤类型ID',
  `add_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `point` int(10) DEFAULT '0' COMMENT '可用总积分',
  `birthday` varchar(30) DEFAULT '' COMMENT '生日',
  `top_id` int(10) DEFAULT '0' COMMENT '上级id',
  `number` int(10) DEFAULT '0' COMMENT '6位数的会员ID',
  `sign_id` char(8) DEFAULT NULL COMMENT '用户标识码',
  `barcode` varchar(255) DEFAULT '' COMMENT '用户二维码',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `login_time` int(10) DEFAULT '0',
  `today` int(10) DEFAULT '0' COMMENT '连续签到天数',
  `jump` tinyint(1) DEFAULT '1' COMMENT '1未跳2已跳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='用户列表';

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES ('6', '腔棘鱼\\ue522', 'https://wx.qlogo.cn/mmopen/vi_32/Ad2m3J8duUl99GRlibsCZ6xqYd0sxMMibuxR3RQbVEeX9nO32hO43J7bOVroZ2QJLDUicamo4La180GIpdLibsSZCQ/132', '1', '广西', '南宁', 'oZycs5PwrEndPm4oSIxGOmirsqeI', '1', '0', '3', '3f1f1b52c172ddb7f1f79b76a2b7571d', '1', '1553582368', '1571820460', '200', '', '0', '154210', null, '', '1200.00', '1571111581', '0', '2');
INSERT INTO `z_user` VALUES ('7', '猴子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEQytTMw20PFqbNMUy66tGDSwzgCNFqI1GkwYGde9HwM12FIGcmoQlviaW3QpKYNtrCgRvUknBs7A/132', '1', '广东', '广州', 'oZycs5JCJ3XXbw2I5At6AK3tw8D8', '1', '0', '1', '9672320aa911e0fd972e5401a494cbcb', '', '1553857428', '1553857428', '0', '', '0', '230141', null, null, '0.00', '0', '0', '1');
INSERT INTO `z_user` VALUES ('10', 'IT小绵羊', 'https://wx.qlogo.cn/mmopen/vi_32/C5w6iaictF7icr7cNicUvwR9U9xubj5atibxtibJggy02DUnqJwPicftwdRlTt2k4MQXqKBCkoicHMVgPKeHhibknsloicKA/132', '1', '广东', '广州', 'orJ6Z5Sp-EHMhlk5ejJfUmB2irJY', '1', '0', '1', 'e8f5522e363b2a035e0efe33d01e27a9', '', '1562929070', '1562929070', '0', '', '0', '195741', null, null, '0.00', '0', '0', '1');
INSERT INTO `z_user` VALUES ('11', '\\ud83c\\uddf2 \\ud83c\\uddf7 ·\\ud83c\\uddf5 \\ud83c\\uddef\\ud83d\\ude43', 'https://wx.qlogo.cn/mmopen/vi_32/H6iaU4sCz76nibib1iaY73rfHU14XWxzrP7UxlBEA7jR8jhqROKLVjucQZfPBcGJLg2Uv21yWiaI19m4PuDZ5AJiciaHA/132', '1', '贵州', '六盘水', 'orJ6Z5ZUaEPZZjchHQruy7Xwxduw', '1', '0', '1', 'b2bc1e57de43cf03ce3e76561644a58e', '5,3', '1562929071', '1569576096', '10', '', '0', '173652', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [XYcWbA0950b464]\"}', '0.00', '1569578363', '1', '1');
INSERT INTO `z_user` VALUES ('12', '鉍', 'https://wx.qlogo.cn/mmopen/vi_32/HpNqy5f4Eic975WOCSDYd6XlFn3Tbeua75hURfL51RbdjZenvZOV2bDV3RF4f3PR8kd05LdiaYkhCmelUvRbnblw/132', '1', '广东', '汕尾', 'orJ6Z5dxIrJ-OMgKlf0CgrsZyjiY', '1', '0', '1', '7742cc5b61f0aa5d30b53ddf6da4b45b', '1,2,3,5,4', '1562929076', '1568979199', '0', '', '0', '920175', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [bxZvtA02173955]\"}', '0.00', '1572427072', '0', '1');
INSERT INTO `z_user` VALUES ('13', '娃娃', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrV6YwicvrNyOqbEyandJNhL7T7tTv82qqMU7qw1h6RprLZ8ZSSXWkxgC42o1cPTN25ib1Jwc5mDfg/132', '2', '北京', '', 'orJ6Z5f_j6uQY3uZ73Ni_f5Acd9w', '1', '0', '1', '1af2d456ce446919cda8200685f3ad1f', '4', '1562929094', '1565783423', '10', '2019-01-01', '0', '802536', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [08843064]\"}', '0.00', '1569060079', '0', '1');
INSERT INTO `z_user` VALUES ('14', '付立军', 'https://wx.qlogo.cn/mmopen/vi_32/WsKEmRIT8yHyd2xjGLgYibJurRKg13RorYnZIAPC38d9iafo0GaNgdK2kjHyPXFjPPOmxGRC8NtGBwTFdjuVysTA/132', '1', '广东', '广州', 'orJ6Z5QHwt9xNbwgzH9PdcWTICEw', '1', '0', '1', '3f3374578e5427d1de73028c3b0a9d44', '4', '1562929104', '1565663918', '0', '', '0', '702563', null, null, '0.00', '1566360488', '0', '1');
INSERT INTO `z_user` VALUES ('15', '陆小六  つ。', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqJQEN0yWiad13Smnic3rLVgP8Io4eHLRTzBbic5cP11oPBQg5st3OCVLlEFbnc2Qm4LmWC0AtGBUgibw/132', '2', '广东', '广州', 'orJ6Z5fMxQSi-_O7Op62g3-WP0Q4', '1', '0', '1', '1af66a81f09425c88b891014fbeaefcc', '', '1563004866', '1563212679', '0', '', '0', '993621', null, null, '0.00', '0', '0', '1');
INSERT INTO `z_user` VALUES ('16', '烟℃', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erW1nyiavocyun0CJzFdmutvSIsSmOHXGjnMvqyZXX5Nl6NPn9Kq9mY2wvsEuF8tJbvlKyUufB4Hrg/132', '1', '广东', '广州', 'orJ6Z5SOMpglfi6mtusb5lwBCziM', '1', '0', '1', '2a0f27642b84944f00a09601c9fa9c42', '', '1563070957', '1563247739', '0', '', '0', '701253', null, null, '0.00', '1567590094', '0', '1');
INSERT INTO `z_user` VALUES ('20', 'Gavin', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJD8BDz0HWxxMvn6QhiamENibibiaQBiafQP3OXJibcVjh5TJibXRJoe0siahQjuOsnoD0PibxntibXUnkVDxEw/132', '1', '广东', '广州', 'orJ6Z5U8CxIVRx7_nxcCMdtzz5R4', '1', '0', '1', '6c31796b33e5d5fef0c5b5fba45ee5dc', '', '1563090928', '1563204616', '0', '', '0', '228903', null, '', '0.00', '1571123479', '0', '1');
INSERT INTO `z_user` VALUES ('21', '小李小李，不想理你', 'https://wx.qlogo.cn/mmopen/vi_32/ODOHkegpjaIUq0vsicXfoS5tIahrntIBcpibATfWalexQibvK2RFdplibwoYTxj7iafakRllicCgloHHp8m2iaYxww5RQ/132', '1', '湖南', '邵阳', 'orJ6Z5YcLvW_WHcpGiJFIHUDg17g', '1', '0', '3', '23ea114196cea35fca07761cad410704', '2,1', '1563154517', '1569573849', '15', '', '0', '113652', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [HgD.Ya07461090]\"}', '0.00', '1571971302', '3', '1');
INSERT INTO `z_user` VALUES ('22', '刘汉南', 'https://wx.qlogo.cn/mmopen/vi_32/dD3aPUUmic7IqKZTXmlZCWocYRLDeibZic8TRE83Pj5YMXhrdceNv4VtLib5lRGOCwKPiaG2xQbXQnjGvHtphn3P4wg/132', '1', '广东', '广州', 'orJ6Z5TnKLMglAXF3AXZr-55CU0U', '1', '0', '1', '9974d3792097459be05cbe518ec4c011', '', '1563159097', '1563159097', '0', '', '0', '111014', null, '', '0.00', '1570956007', '0', '1');
INSERT INTO `z_user` VALUES ('23', '黄官华', 'https://wx.qlogo.cn/mmopen/vi_32/KcESJd5yPTtIpJ29wicMfScg99OWEIT6xzNPT0YkMSOXZu5vsMVlmbEcv1AQPOibxTbwKyJOsicT9DP4iaCDNkiaKSA/132', '1', '', '', 'orJ6Z5Y0iXxvfWBdnEbQwGvF2IBI', '1', '0', '1', '6742d8369f9842d3b5ec9a62e312a94a', '', '1563159688', '1568857095', '0', '', '0', '153625', null, '', '0.00', '1568858488', '0', '1');
INSERT INTO `z_user` VALUES ('24', 'LFUCHUN', 'https://wx.qlogo.cn/mmopen/vi_32/PFYRCMMIwico41qFZ2kicK1VayujFjsYyGAy7iaiaBA2rAxaTwQicAibJaJ5ViaJicqXL8Reglljiayfk96lZd0ibdSzr10g/132', '2', '广东', '汕头', 'orJ6Z5WTsaSNZ0FfjUZe4Ns3HJfU', '1', '0', '1', '70a60ab25d7b9f0e7896f119bc32f37d', '1', '1563159801', '1563350847', '0', '2019-07-17', '0', '147025', null, '', '0.00', '1569632194', '0', '1');
INSERT INTO `z_user` VALUES ('26', '瑋瑋', 'https://wx.qlogo.cn/mmopen/vi_32/fLI3NSG6qScpLr0sRs0uIKoHk63mrw0pgIecicCMG1uU55gYQauXpUD5vwicn2qauFb8ktFHLt1LL2XNrEZDrhVA/132', '2', '湖南', '衡阳', 'orJ6Z5fRdibQLE56VHodCZwaWlnc', '1', '0', '2', '0b711deca1658a8296fe5cf91cc68f0f', '5', '1563212015', '1571300189', '0', '', '25', '140252', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [JJnJNa04762372]\"}', '0.00', '1571300625', '1', '1');
INSERT INTO `z_user` VALUES ('27', '开利网络科技@微信小程序～吕', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQU9FDmrtvOyribo8qc8ZscyIJM6kdKrabxwSAWzd5UfPzlLwzXBJATYI9gMnqvhDeHGDS88myrNA/132', '1', '广东', '广州', 'orJ6Z5axW_TQNHPQDYEyheW-ZfX4', '1', '0', '1', '3590045729eba6da9f589190e8a7f67b', '1,2,3,5,4', '1563261342', '1568971576', '20', '1995-11-11', '0', '139526', null, '', '0.00', '1568971673', '0', '1');
INSERT INTO `z_user` VALUES ('30', '憨厚正直的我', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL0fj4o0xGEfjje6rzDKDCk2RZce2iavvNrPAgV0NRAnc5TT2J7LrOoa0veJibj6jEc3zodA9VchazA/132', '1', '河南', '开封', 'orJ6Z5QD1__DbKxUCPqEq74OqXJk', '1', '0', '1', '43af78d92cca42e1d07257d99570df58', '3', '1563351419', '1563351429', '10', '', '0', '125963', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [DKZ5BA01004245]\"}', '0.00', '0', '0', '1');
INSERT INTO `z_user` VALUES ('31', 'If this is the reality', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKjAQJMaDh3VlmyibyA4RicJm0JaYp10rzbCNTkwic6rtKkTNvRwwbZJicibLOezIxVeqZlvJztY8yT4AA/132', '1', '广东', '韶关', 'orJ6Z5Y7ggK0vtxvAMwA2XlqZToI', '1', '0', '1', '169002da4986855d28dc2775e39f1b6b', '1,2', '1563420349', '1569573717', '10', '2000-07-18', '0', '110236', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [CruSQA02271869]\"}', '0.00', '1569637533', '1', '1');
INSERT INTO `z_user` VALUES ('32', '12', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvfha13uzKRlewDkOTb3rpbxW6fZCCG29xj33vsAPUOryjj1Nfg69pMhMNzzc6onk7173zibj06Qg/132', '1', '广东', '揭阳', 'orJ6Z5WsDIrkPmictUiilizk3L1w', '1', '0', '2', '02c59d301bfc17c30515683855f1383b', '4,5,3,2,1', '1563604431', '1568969264', '0', '', '0', '140236', null, '', '10.00', '1572597812', '0', '1');
INSERT INTO `z_user` VALUES ('33', '\\ud83c\\uddf1 \\ud83c\\uddef \\ud83c\\udde8', 'https://wx.qlogo.cn/mmopen/vi_32/hBKrr0QKKQuAMQztNHAO815Dbhg0DHXuoTly1Tyuy4N0rWXHdVuN0t8Zv7h2obncxnIRjsXmF8E9qcwRCD1Ixg/132', '1', '广东', '广州', 'orJ6Z5ad9EMq4xnr5RAmqxHYsQNE', '1', '0', '5', '7567e6fdd36ce98646100a6d39b367e6', '4,5,2,1,3', '1564625545', '1572489762', '25', '2019-10-14', '0', '660236', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [eafo509322372]\"}', '37261.00', '1572515574', '0', '1');
INSERT INTO `z_user` VALUES ('34', '青春的道路', 'https://wx.qlogo.cn/mmopen/vi_32/nPuvC8OLwkqrkNkgOkX13GliabC2UOCeEjChyPFCXgk3DYswCnqnfMVicDl932mgSI9LT31E0O7WxhUqRm2OZHkQ/132', '1', '广东', '广州', 'orJ6Z5TzB2GUPg1KUVYhv3KalbO4', '1', '0', '2', '54600eb93352efd704d5e1387b77bb76', '2', '1565770466', '1565770475', '0', '', '0', '774102', null, '', '0.00', '1571134863', '0', '1');
INSERT INTO `z_user` VALUES ('35', '哎呀จุ๊บ', 'https://wx.qlogo.cn/mmopen/vi_32/E4PXdmlekF8HCic6sdYniaegJGDyVibTmpicKVaRlFTNACjwb7dybe4wHHBavbgDApw74Xfp9sJD0MynGkzLPZWoTg/132', '1', '广东', '广州', 'orJ6Z5ZljxpKaHbovpdUTfV7SCK4', '1', '0', '5', '16efcbfbcb7926bc6ded0ac020f282b7', '1', '1568886920', '1568886933', '0', '', '0', '998502', null, '', '0.00', '1572244864', '0', '1');
INSERT INTO `z_user` VALUES ('36', 'Terminal丶句点', 'https://wx.qlogo.cn/mmopen/vi_32/qLCgDg8bhcNrqJ74DgjicibTyoSia5ic0hZYiaovX2UIodh1OuP8iczobp8wicq1lRFypCxlxfNiajXdI29cpV4GKn9MRQ/132', '1', '河南', '周口', 'orJ6Z5V-gt_5f-bZIuiJzYrHOqdU', '1', '0', '1', 'ac3fcbe1b991cdb2fd461437f92268bf', '1,4', '1568952112', '1568979386', '10', '', '0', '320134', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [B8NB8a00503955]\"}', '0.00', '1568979471', '0', '1');
INSERT INTO `z_user` VALUES ('37', 'Aimee', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIW4BKAJ072RRGwIHpp2UicsuqhlVkk9ay7ZUYdFmLZcL0yAicmkbiaPTy6JgFYg34iaSqnSJyqNkyaxA/132', '2', '', '', 'orJ6Z5eJ_DLl8A9IFndEMkIpFN4g', '1', '0', '1', '9f3e4c29a9f1e875a0224568035ae7a2', '4', '1568967753', '1568967762', '0', '', '0', '903614', null, '', '0.00', '1568968368', '0', '1');
INSERT INTO `z_user` VALUES ('38', '后青春期的诗', 'https://wx.qlogo.cn/mmopen/vi_32/NzSRdfsqgeu1hsRvEnkiauRD4E6w5p9Uh0DcTnOT94jk3LibkTD6KCRBxeRZMhHyVCZ1SS7FIibSLpbKYvok3ZkXQ/132', '1', '广东', '广州', 'orJ6Z5aeKuwhQ4l12Jsl9pJ_i7pI', '1', '0', '2', 'a933c5034a457eb5f0a1a5dd692386ce', '1', '1568971506', '1568971512', '0', '', '0', '204714', null, '', '0.00', '1571134843', '0', '1');
INSERT INTO `z_user` VALUES ('40', '谜一样的男人', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4wNMcCY6iaScicibWROrfkAB1zgkDyZwNiafSa6Briaymn6xt8j2rsukXeuT0yAMFhohf6dGqib6F1Fgw/132', '1', '⁡⁢', '受相关部门保护  不予公开', 'orJ6Z5SwygJrmfkHfJKyJ19kimY0', '1', '0', '2', '1736ffd906034cdc32a9fac0bfc830f9', '3,5', '1569058367', '1572503845', '20', '', '33', '102451', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [LFqDJa09831511]\"}', '0.00', '1572602945', '4', '1');
INSERT INTO `z_user` VALUES ('42', 'Juan', 'https://wx.qlogo.cn/mmopen/vi_32/GeD2UEJRb1BARicQoFFLq0s7CAnhor8CkGdhaYabeA4TzLXtwr7ZJxYSOSSwKa0JqjZRG3LWWcjqibsInttV8SaQ/132', '2', '', '', 'orJ6Z5d2b12JVr_NkEApBQGKMACM', '1', '0', '1', 'c2239ff50e43f7f085b5de125c55a07e', '2', '1569392331', '1569392337', '0', '', '0', '240123', null, '', '0.00', '1569392383', '0', '1');
INSERT INTO `z_user` VALUES ('43', '一个NPC', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epib0pBowbCr9qEDG43CqLyWibuhOFoeic0LZfdURODgEQGFHrXctRSlXsUnBa90FKB6cKnYa5M42Gkw/132', '2', '', '', 'orJ6Z5RmY_1GY_piP5cAmWAIlF_0', '1', '0', '2', 'f94b26116eee511957290b338ab2306f', '1', '1569406865', '1569406872', '0', '', '0', '501452', null, '', '0.00', '1571134747', '0', '1');
INSERT INTO `z_user` VALUES ('46', 'Leong', 'https://wx.qlogo.cn/mmopen/vi_32/JTarQ1ZNHZ3N1zucpV74TtJg1Y3QWhbwoUCEDfaplOcYcnMeWMicTN550hYXogBOlfJXkN4Mr5RaUohR9BriaPVg/132', '2', '广东', '湛江', 'orJ6Z5WZMAZIDkTfotENCxpqATbQ', '1', '0', '1', '26c7cd1372c1fd98ea754cf16fe277a1', '1,2,5', '1571134245', '1571193294', '0', '', '33', '671374', null, '', '0.00', '1572509205', '0', '1');
INSERT INTO `z_user` VALUES ('47', '菠萝菠萝Me', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK1BhOichw778Nz6hZkeXQKHIQhgCcQgpBk84lTlMhDhODoA9B73ol4OriadapHTJqygDxUjOgpq5IA/132', '1', '广东', '广州', 'orJ6Z5Y1vQ9upKA1YKcYxiKU79EE', '1', '0', '5', 'bf93d558515347ab767703829934c064', '5,2,3,4', '1571152772', '1571152850', '10', '', '0', '46146', null, '{\"errcode\":41030,\"errmsg\":\"invalid page hint: [e08911531]\"}', '0.00', '1571152923', '1', '1');
INSERT INTO `z_user` VALUES ('49', 'A\\ud83d\\udc8b网站建设、全国营销', 'https://wx.qlogo.cn/mmopen/vi_32/LyJOXEvevuXy38qFmUVAhmnMMyemKbpl0xibA8TQP5M6dibxrrj6elI6MqDvMRwGkq1IRrGQ32c4MDRwZ6KYKtZQ/132', '1', '江西', '赣州', 'orJ6Z5fO62qoa90BwfnwfZzS37a8', '1', '0', '5', '09a9db7c7d5ddac1115f59e7203387fb', '2,5', '1571188168', '1572420357', '10', '', '0', '516020', null, '', '91552.00', '1572421668', '2', '1');
INSERT INTO `z_user` VALUES ('53', '12', '', '1', '', '', '100000', '1', '0', '5', 'd8e9b23d3c6e26e27e00cdac5c29ae53', '', '1572597426', '1572597426', '10000', '', '13141', '125910', null, '', '10000.00', '0', '0', '1');

-- ----------------------------
-- Table structure for z_user_count
-- ----------------------------
DROP TABLE IF EXISTS `z_user_count`;
CREATE TABLE `z_user_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `num` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_user_count
-- ----------------------------
INSERT INTO `z_user_count` VALUES ('2', '33', '3', '1565345597', '1565345597');
INSERT INTO `z_user_count` VALUES ('3', '33', '68', '1565399215', '1565399215');
INSERT INTO `z_user_count` VALUES ('4', '33', '1', '1565500115', '1565500115');
INSERT INTO `z_user_count` VALUES ('5', '33', '4', '1565660625', '1565660625');
INSERT INTO `z_user_count` VALUES ('6', '14', '1', '1565663906', '1565663906');
INSERT INTO `z_user_count` VALUES ('7', '28', '3', '1565681229', '1565681229');
INSERT INTO `z_user_count` VALUES ('8', '28', '5', '1565745908', '1565745908');
INSERT INTO `z_user_count` VALUES ('9', '27', '4', '1565764175', '1565764175');
INSERT INTO `z_user_count` VALUES ('10', '33', '6', '1565768232', '1565768232');
INSERT INTO `z_user_count` VALUES ('11', '34', '1', '1565770466', '1565770466');
INSERT INTO `z_user_count` VALUES ('12', '13', '14', '1565783404', '1565783404');
INSERT INTO `z_user_count` VALUES ('13', '29', '1', '1565784573', '1565784573');
INSERT INTO `z_user_count` VALUES ('14', '33', '9', '1565832259', '1565832259');
INSERT INTO `z_user_count` VALUES ('15', '33', '1', '1565914879', '1565914879');
INSERT INTO `z_user_count` VALUES ('16', '33', '20', '1566027809', '1566027809');
INSERT INTO `z_user_count` VALUES ('17', '14', '1', '1566360488', '1566360488');
INSERT INTO `z_user_count` VALUES ('18', '33', '1', '1566370379', '1566370379');
INSERT INTO `z_user_count` VALUES ('19', '33', '19', '1566607189', '1566607189');
INSERT INTO `z_user_count` VALUES ('20', '33', '23', '1566785667', '1566785667');
INSERT INTO `z_user_count` VALUES ('21', '33', '1', '1566865579', '1566865579');
INSERT INTO `z_user_count` VALUES ('22', '16', '1', '1567590073', '1567590073');
INSERT INTO `z_user_count` VALUES ('23', '33', '1', '1567930350', '1567930350');
INSERT INTO `z_user_count` VALUES ('24', '11', '1', '1568165457', '1568165457');
INSERT INTO `z_user_count` VALUES ('25', '21', '1', '1568274868', '1568274868');
INSERT INTO `z_user_count` VALUES ('26', '11', '1', '1568278498', '1568278498');
INSERT INTO `z_user_count` VALUES ('27', '33', '4', '1568278773', '1568278773');
INSERT INTO `z_user_count` VALUES ('28', '33', '1', '1568305707', '1568305707');
INSERT INTO `z_user_count` VALUES ('29', '33', '17', '1568595543', '1568595543');
INSERT INTO `z_user_count` VALUES ('30', '21', '1', '1568630161', '1568630161');
INSERT INTO `z_user_count` VALUES ('31', '33', '17', '1568681495', '1568681495');
INSERT INTO `z_user_count` VALUES ('32', '33', '18', '1568774413', '1568774413');
INSERT INTO `z_user_count` VALUES ('33', '33', '14', '1568855724', '1568855724');
INSERT INTO `z_user_count` VALUES ('34', '35', '1', '1568886921', '1568886921');
INSERT INTO `z_user_count` VALUES ('35', '33', '129', '1568941337', '1568941337');
INSERT INTO `z_user_count` VALUES ('36', '36', '33', '1568952112', '1568952112');
INSERT INTO `z_user_count` VALUES ('37', '28', '16', '1568961317', '1568961317');
INSERT INTO `z_user_count` VALUES ('38', '35', '1', '1568964223', '1568964223');
INSERT INTO `z_user_count` VALUES ('39', '27', '2', '1568971076', '1568971076');
INSERT INTO `z_user_count` VALUES ('40', '38', '1', '1568971506', '1568971506');
INSERT INTO `z_user_count` VALUES ('41', '12', '1', '1568979391', '1568979391');
INSERT INTO `z_user_count` VALUES ('42', '11', '1', '1568992908', '1568992908');
INSERT INTO `z_user_count` VALUES ('43', '33', '46', '1569048573', '1569048573');
INSERT INTO `z_user_count` VALUES ('44', '39', '2', '1569057873', '1569057873');
INSERT INTO `z_user_count` VALUES ('45', '40', '2', '1569058367', '1569058367');
INSERT INTO `z_user_count` VALUES ('46', '41', '1', '1569058499', '1569058499');
INSERT INTO `z_user_count` VALUES ('47', '13', '1', '1569059882', '1569059882');
INSERT INTO `z_user_count` VALUES ('48', '21', '2', '1569060147', '1569060147');
INSERT INTO `z_user_count` VALUES ('49', '41', '1', '1569230784', '1569230784');
INSERT INTO `z_user_count` VALUES ('50', '21', '5', '1569319003', '1569319003');
INSERT INTO `z_user_count` VALUES ('51', '21', '12', '1569375014', '1569375014');
INSERT INTO `z_user_count` VALUES ('52', '21', '6', '1569480804', '1569480804');
INSERT INTO `z_user_count` VALUES ('53', '21', '7', '1569549096', '1569549096');
INSERT INTO `z_user_count` VALUES ('54', '41', '4', '1569573457', '1569573457');
INSERT INTO `z_user_count` VALUES ('55', '11', '6', '1569573516', '1569573516');
INSERT INTO `z_user_count` VALUES ('56', '33', '3', '1569573530', '1569573530');
INSERT INTO `z_user_count` VALUES ('57', '31', '2', '1569573685', '1569573685');
INSERT INTO `z_user_count` VALUES ('58', '40', '2', '1569574370', '1569574370');
INSERT INTO `z_user_count` VALUES ('59', '31', '1', '1569636439', '1569636439');
INSERT INTO `z_user_count` VALUES ('60', '33', '2', '1569951634', '1569951634');
INSERT INTO `z_user_count` VALUES ('61', '21', '1', '1570262642', '1570262642');
INSERT INTO `z_user_count` VALUES ('62', '33', '1', '1570549879', '1570549879');
INSERT INTO `z_user_count` VALUES ('63', '40', '1', '1570611543', '1570611543');
INSERT INTO `z_user_count` VALUES ('64', '40', '1', '1570672086', '1570672086');
INSERT INTO `z_user_count` VALUES ('65', '33', '9', '1570762265', '1570762265');
INSERT INTO `z_user_count` VALUES ('66', '33', '41', '1570859795', '1570859795');
INSERT INTO `z_user_count` VALUES ('67', '33', '29', '1570938504', '1570938504');
INSERT INTO `z_user_count` VALUES ('68', '33', '59', '1571014515', '1571014515');
INSERT INTO `z_user_count` VALUES ('69', '40', '2', '1571017605', '1571017605');
INSERT INTO `z_user_count` VALUES ('70', '33', '112', '1571099237', '1571099237');
INSERT INTO `z_user_count` VALUES ('71', '41', '3', '1571130930', '1571130930');
INSERT INTO `z_user_count` VALUES ('72', '44', '7', '1571132834', '1571132834');
INSERT INTO `z_user_count` VALUES ('73', '29', '3', '1571133676', '1571133676');
INSERT INTO `z_user_count` VALUES ('74', '45', '1', '1571134045', '1571134045');
INSERT INTO `z_user_count` VALUES ('75', '46', '1', '1571134246', '1571134246');
INSERT INTO `z_user_count` VALUES ('76', '47', '1', '1571152772', '1571152772');
INSERT INTO `z_user_count` VALUES ('77', '21', '1', '1571155752', '1571155752');
INSERT INTO `z_user_count` VALUES ('78', '44', '2', '1571187058', '1571187058');
INSERT INTO `z_user_count` VALUES ('79', '48', '1', '1571187495', '1571187495');
INSERT INTO `z_user_count` VALUES ('80', '49', '7', '1571188168', '1571188168');
INSERT INTO `z_user_count` VALUES ('81', '33', '35', '1571190915', '1571190915');
INSERT INTO `z_user_count` VALUES ('82', '46', '4', '1571193293', '1571193293');
INSERT INTO `z_user_count` VALUES ('83', '26', '3', '1571274039', '1571274039');
INSERT INTO `z_user_count` VALUES ('84', '33', '14', '1571274277', '1571274277');
INSERT INTO `z_user_count` VALUES ('85', '21', '3', '1571294462', '1571294462');
INSERT INTO `z_user_count` VALUES ('86', '40', '2', '1571295854', '1571295854');
INSERT INTO `z_user_count` VALUES ('87', '49', '2', '1571296130', '1571296130');
INSERT INTO `z_user_count` VALUES ('88', '35', '2', '1571296808', '1571296808');
INSERT INTO `z_user_count` VALUES ('89', '33', '2', '1571371241', '1571371241');
INSERT INTO `z_user_count` VALUES ('90', '21', '1', '1571648849', '1571648849');
INSERT INTO `z_user_count` VALUES ('91', '21', '2', '1571824865', '1571824865');
INSERT INTO `z_user_count` VALUES ('92', '33', '12', '1572053344', '1572053344');
INSERT INTO `z_user_count` VALUES ('93', '35', '1', '1572244743', '1572244743');
INSERT INTO `z_user_count` VALUES ('94', '33', '5', '1572245194', '1572245194');
INSERT INTO `z_user_count` VALUES ('95', '33', '39', '1572312051', '1572312051');
INSERT INTO `z_user_count` VALUES ('96', '32', '1', '1572337802', '1572337802');
INSERT INTO `z_user_count` VALUES ('97', '33', '12', '1572397080', '1572397080');
INSERT INTO `z_user_count` VALUES ('98', '32', '4', '1572422903', '1572422903');
INSERT INTO `z_user_count` VALUES ('99', '33', '11', '1572483579', '1572483579');
INSERT INTO `z_user_count` VALUES ('100', '40', '2', '1572503677', '1572503677');
INSERT INTO `z_user_count` VALUES ('101', '32', '1', '1572508216', '1572508216');
INSERT INTO `z_user_count` VALUES ('102', '46', '1', '1572509205', '1572509205');
INSERT INTO `z_user_count` VALUES ('103', '32', '2', '1572597565', '1572597565');
INSERT INTO `z_user_count` VALUES ('104', '40', '1', '1572602945', '1572602945');

-- ----------------------------
-- Table structure for z_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `z_user_coupon`;
CREATE TABLE `z_user_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `coupon_id` int(10) DEFAULT '0' COMMENT '优惠券id',
  `full_price` decimal(10,2) DEFAULT '0.00' COMMENT '条件金额',
  `less_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣金额',
  `day` int(11) DEFAULT '0' COMMENT '领取后的有效天数',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1是用户领取 2是指定用户',
  `grade_id` int(11) DEFAULT '0' COMMENT '会员等级ID',
  `goods_type` tinyint(11) NOT NULL DEFAULT '1' COMMENT '1全部商品可用；2指定商品可用',
  `goods_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品id',
  `start_time` int(11) DEFAULT '0' COMMENT '领取开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '领取结束时间',
  `add_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `point` int(11) DEFAULT '0' COMMENT '兑换消耗的积分',
  `status` tinyint(1) DEFAULT '1' COMMENT '1未使用2已使用',
  `day_time` int(11) DEFAULT '0' COMMENT '优惠券到期时间',
  `num` int(5) DEFAULT '1' COMMENT '一人能领多少张',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='用户优惠券表';

-- ----------------------------
-- Records of z_user_coupon
-- ----------------------------
INSERT INTO `z_user_coupon` VALUES ('27', '11', '1', '100.00', '100.00', '5', '1', '0', '1', '', '2019', '2019', '1563213519', '1', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('28', '25', '1', '100.00', '100.00', '5', '1', '0', '1', '', '2019', '2019', '1563213533', '1', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('29', '19', '4', '100.00', '100.00', '1', '1', '0', '1', '', '2019', '2019', '1563268731', '100', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('30', '19', '4', '100.00', '100.00', '1', '1', '0', '1', '', '2019', '2019', '1564456736', '100', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('31', '6', '9', '25.00', '5.00', '0', '1', '0', '1', '', '0', '1564643913', '1564471113', '0', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('32', '10', '10', '30.00', '3.00', '3', '2', '0', '1', '', '1564471986', '1564731186', '1564471986', '0', '1', '1564731186', '1');
INSERT INTO `z_user_coupon` VALUES ('33', '6', '11', '4.00', '1.00', '1', '2', '0', '1', '', '1564476932', '1564563332', '1564476932', '0', '1', '1564563332', '1');
INSERT INTO `z_user_coupon` VALUES ('34', '10', '12', '6.00', '1.00', '1', '2', '0', '1', '', '1564477748', '1564564148', '1564477748', '0', '1', '1564564148', '1');
INSERT INTO `z_user_coupon` VALUES ('35', '10', '12', '6.00', '1.00', '1', '2', '0', '1', '', '1564542602', '1564629002', '1564542602', '0', '1', '1564629002', '1');
INSERT INTO `z_user_coupon` VALUES ('36', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551773', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('37', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551775', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('38', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551776', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('39', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551777', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('40', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551777', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('41', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551777', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('42', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551777', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('43', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551777', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('44', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551778', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('45', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551778', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('46', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551778', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('47', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551778', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('48', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551778', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('49', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551779', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('50', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551779', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('51', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551779', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('52', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551779', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('53', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551779', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('54', '21', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569551780', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('55', '33', '13', '0.00', '0.00', '100', '1', '0', '1', '', '2019', '2019', '1569576200', '1800', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('56', '33', '13', '0.00', '0.00', '100', '1', '0', '1', '', '2019', '2019', '1569576203', '1800', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('57', '11', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576209', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('58', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('59', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('60', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('61', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('62', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('63', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576213', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('64', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('65', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('66', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('67', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('68', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('69', '11', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('70', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576214', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('71', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('72', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('73', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('74', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('75', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('76', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('77', '11', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('78', '11', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('79', '11', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('80', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576215', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('81', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576216', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('82', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576216', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('83', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576216', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('84', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576216', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('85', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('86', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('87', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('88', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('89', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('90', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('91', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('92', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('93', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576217', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('94', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576218', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('95', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576218', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('96', '40', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576218', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('97', '41', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576223', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('98', '41', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576225', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('99', '41', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576227', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('100', '41', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576228', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('101', '41', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576230', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('102', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576233', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('103', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576233', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('104', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576234', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('105', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576234', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('106', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576236', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('107', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576236', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('108', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576236', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('109', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576236', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('110', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576237', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('111', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576237', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('112', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576238', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('113', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576238', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('114', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576238', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('115', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576238', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('116', '31', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1569576239', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('117', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1570950796', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('118', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1570950798', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('119', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1570950810', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('120', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1570950818', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('121', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1570954132', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('122', '35', '1', '100.00', '30.00', '5', '2', '0', '1', '', '1570957425', '1571389425', '1570957425', '1', '1', '1571389425', '1');
INSERT INTO `z_user_coupon` VALUES ('123', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571102705', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('124', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571102707', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('125', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571102712', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('126', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571102761', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('127', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571102763', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('128', '44', '14', '1.00', '1.00', '30', '1', '0', '1', '', '1571133416', '1573725416', '1571133416', '10', '1', '1573725416', '10');
INSERT INTO `z_user_coupon` VALUES ('129', '44', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571133452', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('130', '49', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571188250', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('131', '26', '14', '1.00', '1.00', '30', '1', '0', '1', '', '1571274093', '1573866093', '1571274093', '10', '1', '1573866093', '10');
INSERT INTO `z_user_coupon` VALUES ('132', '26', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1571298485', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('133', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058315', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('134', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058317', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('135', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058319', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('136', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058319', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('137', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('138', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('139', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('140', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('141', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('142', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058320', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('143', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058321', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('144', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058324', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('145', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058325', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('146', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058325', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('147', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058325', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('148', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058325', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('149', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058326', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('150', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058329', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('151', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058329', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('152', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('153', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('154', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('155', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('156', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('157', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('158', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058330', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('159', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058331', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('160', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058331', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('161', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058331', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('162', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058331', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('163', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058331', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('164', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('165', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('166', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('167', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('168', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('169', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('170', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058332', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('171', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058333', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('172', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058333', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('173', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058333', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('174', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058333', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('175', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058334', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('176', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058334', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('177', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058334', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('178', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058334', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('179', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058334', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('180', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058335', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('181', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058335', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('182', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058335', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('183', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058335', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('184', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058335', '10', '1', '2147483647', '1');
INSERT INTO `z_user_coupon` VALUES ('185', '33', '14', '1.00', '1.00', '30', '1', '0', '1', '', '2019', '2019', '1572058336', '10', '1', '2147483647', '1');

-- ----------------------------
-- Table structure for z_user_grade
-- ----------------------------
DROP TABLE IF EXISTS `z_user_grade`;
CREATE TABLE `z_user_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '等级名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '等级图标',
  `full_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '条件金额',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_point` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许积分抵扣 1否 2是',
  `is_convert` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许积分兑换 1否 2是',
  `discount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '享受折扣',
  `birthday_discount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '生日折扣',
  `is_default` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否设为用户默认等级 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户等级管理';

-- ----------------------------
-- Records of z_user_grade
-- ----------------------------
INSERT INTO `z_user_grade` VALUES ('1', '店铺会员', '/uploads/20190508/8c1329699009ea3bd61941db09531ffa.jpg', '0.00', '登录即可成为会员', '1', '1', '0.00', '0.00', '2', '1557283911', '1557303125');
INSERT INTO `z_user_grade` VALUES ('2', '鱼家新粉', '/uploads/20190508/ab47cc966e744502bf023b9d31b44e8b.jpg', '0.10', '成功购买一件商品并消费', '2', '1', '0.00', '0.00', '1', '1557283966', '1557285376');
INSERT INTO `z_user_grade` VALUES ('3', '鱼家铁粉', '/uploads/20190508/b4967985e983ec0ebcf085a3c153d999.jpg', '2000.00', '消费≥2000元', '2', '2', '0.95', '0.00', '1', '1557284023', '1557288306');
INSERT INTO `z_user_grade` VALUES ('4', '鱼家真爱粉', '/uploads/20190508/6be8cb211286da7ae56dc8f1c76f0ba7.jpg', '5000.00', '消费≥5000元', '2', '2', '0.90', '0.80', '1', '1557284058', '1557285389');
INSERT INTO `z_user_grade` VALUES ('5', '鱼家粉你', '/uploads/20190508/34a35dd8efaf5926bfdbc0b11c7ee2f5.jpg', '10000.00', '消费≥10000元', '2', '2', '0.80', '0.75', '1', '1557284096', '1557285407');

-- ----------------------------
-- Table structure for z_user_money
-- ----------------------------
DROP TABLE IF EXISTS `z_user_money`;
CREATE TABLE `z_user_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `new_uid` int(10) DEFAULT '0' COMMENT '新用户id',
  `type` tinyint(1) DEFAULT '1' COMMENT '1收入2支出',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='余额明细表';

-- ----------------------------
-- Records of z_user_money
-- ----------------------------
INSERT INTO `z_user_money` VALUES ('1', '19', '16', '1', '10.00', '1563092304', '1563092304', '邀请新用户奖励');
INSERT INTO `z_user_money` VALUES ('2', '12', '0', '2', '-69.00', '1563176841', '1563176841', '订单支付');
INSERT INTO `z_user_money` VALUES ('3', '12', '0', '2', '-69.00', '1563176975', '1563176975', '订单支付');
INSERT INTO `z_user_money` VALUES ('4', '12', '0', '2', '-57.00', '1563177319', '1563177319', '订单支付');
INSERT INTO `z_user_money` VALUES ('5', '12', '0', '2', '-69.00', '1563177416', '1563177416', '订单支付');
INSERT INTO `z_user_money` VALUES ('6', '12', '0', '2', '-69.00', '1563178642', '1563178642', '订单支付');
INSERT INTO `z_user_money` VALUES ('7', '12', '0', '2', '-69.00', '1563178667', '1563178667', '订单支付');
INSERT INTO `z_user_money` VALUES ('8', '12', '0', '2', '-57.00', '1563184495', '1563184495', '订单支付');
INSERT INTO `z_user_money` VALUES ('9', '12', '0', '2', '-69.00', '1563184514', '1563184514', '订单支付');
INSERT INTO `z_user_money` VALUES ('10', '12', '0', '2', '-69.00', '1563187504', '1563187504', '订单支付');
INSERT INTO `z_user_money` VALUES ('11', '12', '0', '2', '-69.00', '1563187576', '1563187576', '订单支付');
INSERT INTO `z_user_money` VALUES ('12', '12', '0', '2', '-69.00', '1563187714', '1563187714', '订单支付');
INSERT INTO `z_user_money` VALUES ('13', '12', '0', '2', '-69.00', '1563187747', '1563187747', '订单支付');
INSERT INTO `z_user_money` VALUES ('14', '12', '0', '2', '-69.00', '1563189497', '1563189497', '订单支付');
INSERT INTO `z_user_money` VALUES ('15', '12', '0', '2', '-57.00', '1563189839', '1563189839', '订单支付');
INSERT INTO `z_user_money` VALUES ('16', '15', '0', '2', '-15959.73', '1563192313', '1563192313', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('17', '16', '0', '2', '-290.00', '1563192386', '1563192386', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('18', '11', '0', '2', '-230.00', '1563192971', '1563192971', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('19', '16', '0', '2', '-290.00', '1563193066', '1563193066', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('20', '15', '0', '2', '-1150.00', '1563193166', '1563193166', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('21', '11', '0', '2', '-57.00', '1563193481', '1563193481', '订单支付');
INSERT INTO `z_user_money` VALUES ('22', '11', '0', '2', '-57.00', '1563193583', '1563193583', '订单支付');
INSERT INTO `z_user_money` VALUES ('23', '16', '0', '2', '-1130.00', '1563193648', '1563193648', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('24', '16', '0', '2', '-290.00', '1563194062', '1563194062', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('25', '12', '0', '2', '-57.00', '1563194509', '1563194509', '订单支付');
INSERT INTO `z_user_money` VALUES ('26', '12', '0', '2', '-69.00', '1563194611', '1563194611', '订单支付');
INSERT INTO `z_user_money` VALUES ('27', '12', '0', '2', '-69.00', '1563195099', '1563195099', '订单支付');
INSERT INTO `z_user_money` VALUES ('28', '19', '0', '2', '-230.00', '1563195350', '1563195350', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('29', '11', '0', '2', '-5490.00', '1563195590', '1563195590', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('30', '19', '0', '2', '-230.00', '1563195672', '1563195672', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('31', '19', '0', '2', '-230.00', '1563195701', '1563195701', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('32', '19', '0', '2', '-290.00', '1563195774', '1563195774', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('33', '19', '0', '2', '-290.00', '1563196020', '1563196020', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('34', '19', '0', '2', '-230.00', '1563196210', '1563196210', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('35', '19', '0', '2', '-230.00', '1563196355', '1563196355', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('36', '19', '0', '2', '-290.00', '1563196395', '1563196395', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('37', '19', '0', '2', '-290.00', '1563196478', '1563196478', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('38', '16', '0', '2', '-290.00', '1563197787', '1563197787', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('39', '12', '0', '2', '-57.00', '1563199636', '1563199636', '订单支付');
INSERT INTO `z_user_money` VALUES ('40', '16', '0', '2', '-290.00', '1563201104', '1563201104', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('41', '16', '0', '2', '-290.00', '1563201476', '1563201476', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('42', '16', '0', '2', '-290.00', '1563201670', '1563201670', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('43', '16', '0', '2', '-290.00', '1563202767', '1563202767', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('44', '11', '0', '2', '-850.00', '1563203126', '1563203126', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('45', '16', '0', '2', '-570.00', '1563203345', '1563203345', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('46', '16', '0', '2', '-290.00', '1563204844', '1563204844', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('47', '11', '0', '2', '-1130.00', '1563205379', '1563205379', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('48', '11', '0', '2', '-230.00', '1563206738', '1563206738', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('49', '16', '0', '2', '-290.00', '1563207194', '1563207194', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('50', '12', '0', '2', '-74.00', '1563207257', '1563207257', '订单支付');
INSERT INTO `z_user_money` VALUES ('51', '16', '0', '2', '-230.00', '1563207772', '1563207772', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('52', '12', '0', '2', '-74.00', '1563208594', '1563208594', '订单支付');
INSERT INTO `z_user_money` VALUES ('53', '12', '0', '2', '-67.00', '1563208746', '1563208746', '订单支付');
INSERT INTO `z_user_money` VALUES ('54', '16', '0', '2', '-290.00', '1563208792', '1563208792', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('55', '11', '0', '2', '-290.00', '1563208821', '1563208821', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('56', '12', '0', '2', '-67.00', '1563209085', '1563209085', '订单支付');
INSERT INTO `z_user_money` VALUES ('57', '12', '0', '2', '-67.00', '1563209148', '1563209148', '订单支付');
INSERT INTO `z_user_money` VALUES ('58', '12', '0', '2', '-74.00', '1563209209', '1563209209', '订单支付');
INSERT INTO `z_user_money` VALUES ('59', '12', '0', '2', '-74.00', '1563209267', '1563209267', '订单支付');
INSERT INTO `z_user_money` VALUES ('60', '12', '0', '2', '-74.00', '1563209324', '1563209324', '订单支付');
INSERT INTO `z_user_money` VALUES ('61', '12', '0', '2', '-74.00', '1563209438', '1563209438', '订单支付');
INSERT INTO `z_user_money` VALUES ('62', '12', '0', '2', '-74.00', '1563209559', '1563209559', '订单支付');
INSERT INTO `z_user_money` VALUES ('63', '19', '0', '2', '-230.00', '1563210573', '1563210573', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('64', '19', '0', '2', '-290.00', '1563210637', '1563210637', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('65', '19', '0', '2', '-230.00', '1563210775', '1563210775', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('66', '19', '0', '2', '-67.00', '1563211255', '1563211255', '订单支付');
INSERT INTO `z_user_money` VALUES ('67', '16', '0', '2', '-570.00', '1563211642', '1563211642', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('68', '12', '0', '2', '-290.00', '1563211824', '1563211824', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('69', '19', '0', '2', '-290.00', '1563211828', '1563211828', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('70', '19', '0', '2', '-290.00', '1563211904', '1563211904', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('71', '26', '0', '2', '-230.00', '1563213278', '1563213278', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('72', '19', '0', '2', '-290.00', '1563213448', '1563213448', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('73', '19', '25', '1', '10.00', '1563260398', '1563260398', '邀请新用户奖励');
INSERT INTO `z_user_money` VALUES ('74', '33', '0', '2', '-67.00', '1565055799', '1565055799', '订单支付');
INSERT INTO `z_user_money` VALUES ('75', '33', '0', '2', '-55.00', '1565055955', '1565055955', '订单支付');
INSERT INTO `z_user_money` VALUES ('76', '33', '0', '2', '-55.00', '1565056253', '1565056253', '订单支付');
INSERT INTO `z_user_money` VALUES ('77', '33', '0', '2', '-67.00', '1565056341', '1565056341', '订单支付');
INSERT INTO `z_user_money` VALUES ('78', '33', '0', '2', '-65.00', '1565057226', '1565057226', '订单支付');
INSERT INTO `z_user_money` VALUES ('79', '33', '0', '2', '-55.00', '1565058547', '1565058547', '订单支付');
INSERT INTO `z_user_money` VALUES ('80', '33', '0', '2', '-64.00', '1565059085', '1565059085', '订单支付');
INSERT INTO `z_user_money` VALUES ('81', '33', '0', '2', '-78.00', '1565059107', '1565059107', '订单支付');
INSERT INTO `z_user_money` VALUES ('82', '33', '0', '2', '-39.00', '1565059344', '1565059344', '订单支付');
INSERT INTO `z_user_money` VALUES ('83', '33', '0', '2', '-64.00', '1565139716', '1565139716', '订单支付');
INSERT INTO `z_user_money` VALUES ('84', '33', '0', '2', '-64.00', '1565139768', '1565139768', '订单支付');
INSERT INTO `z_user_money` VALUES ('85', '33', '0', '2', '-78.00', '1565141233', '1565141233', '订单支付');
INSERT INTO `z_user_money` VALUES ('86', '33', '0', '2', '-65.00', '1565427420', '1565427420', '订单支付');
INSERT INTO `z_user_money` VALUES ('87', '33', '0', '2', '-18.00', '1566613742', '1566613742', '订单支付');
INSERT INTO `z_user_money` VALUES ('88', '33', '0', '2', '-18.00', '1566613857', '1566613857', '订单支付');
INSERT INTO `z_user_money` VALUES ('89', '33', '0', '2', '-18.00', '1566614074', '1566614074', '订单支付');
INSERT INTO `z_user_money` VALUES ('90', '33', '0', '2', '-18.00', '1566614262', '1566614262', '订单支付');
INSERT INTO `z_user_money` VALUES ('91', '33', '0', '2', '-18.00', '1566787171', '1566787171', '订单支付');
INSERT INTO `z_user_money` VALUES ('92', '33', '0', '2', '-290.00', '1568948271', '1568948271', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('93', '33', '0', '2', '-290.00', '1568960760', '1568960760', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('94', '33', '0', '2', '-290.00', '1568961389', '1568961389', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('95', '33', '0', '2', '-67.00', '1568964912', '1568964912', '订单支付');
INSERT INTO `z_user_money` VALUES ('96', '33', '0', '2', '-57.00', '1568964967', '1568964967', '订单支付');
INSERT INTO `z_user_money` VALUES ('97', '33', '0', '2', '-67.00', '1568965031', '1568965031', '订单支付');
INSERT INTO `z_user_money` VALUES ('98', '33', '0', '2', '-57.00', '1568965364', '1568965364', '订单支付');
INSERT INTO `z_user_money` VALUES ('99', '33', '0', '2', '-290.00', '1568969163', '1568969163', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('100', '33', '0', '2', '-290.00', '1568973460', '1568973460', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('101', '28', '0', '2', '-230.00', '1568976071', '1568976071', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('102', '33', '0', '2', '-230.00', '1568977631', '1568977631', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('103', '28', '0', '2', '-290.00', '1568977744', '1568977744', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('104', '33', '0', '2', '-290.00', '1568977796', '1568977796', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('105', '33', '0', '2', '-230.00', '1568978040', '1568978040', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('106', '28', '0', '2', '-67.00', '1568978499', '1568978499', '订单支付');
INSERT INTO `z_user_money` VALUES ('107', '28', '0', '2', '-68.00', '1568978851', '1568978851', '订单支付');
INSERT INTO `z_user_money` VALUES ('108', '28', '0', '2', '-68.00', '1568978928', '1568978928', '订单支付');
INSERT INTO `z_user_money` VALUES ('109', '28', '0', '2', '-68.00', '1568978951', '1568978951', '订单支付');
INSERT INTO `z_user_money` VALUES ('110', '33', '0', '2', '-59.00', '1568978998', '1568978998', '订单支付');
INSERT INTO `z_user_money` VALUES ('111', '33', '0', '2', '-68.00', '1568979129', '1568979129', '订单支付');
INSERT INTO `z_user_money` VALUES ('112', '33', '0', '2', '-68.00', '1568979258', '1568979258', '订单支付');
INSERT INTO `z_user_money` VALUES ('113', '28', '0', '2', '-2.00', '1568980168', '1568980168', '订单支付');
INSERT INTO `z_user_money` VALUES ('114', '28', '0', '2', '-55.00', '1568981034', '1568981034', '订单支付');
INSERT INTO `z_user_money` VALUES ('115', '33', '0', '2', '-149.00', '1568981120', '1568981120', '订单支付');
INSERT INTO `z_user_money` VALUES ('116', '28', '0', '2', '-64.00', '1568982144', '1568982144', '订单支付');
INSERT INTO `z_user_money` VALUES ('117', '33', '0', '2', '-67.00', '1571101530', '1571101530', '订单支付');
INSERT INTO `z_user_money` VALUES ('118', '33', '0', '2', '-290.00', '1571123548', '1571123548', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('119', '33', '0', '2', '-290.00', '1571123562', '1571123562', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('120', '33', '0', '2', '-290.00', '1571123584', '1571123584', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('121', '33', '0', '2', '-290.00', '1571123755', '1571123755', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('122', '33', '0', '2', '-290.00', '1571123845', '1571123845', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('123', '33', '0', '2', '-5499.00', '1571124667', '1571124667', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('124', '33', '0', '2', '-1799.00', '1571124832', '1571124832', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('125', '33', '0', '2', '-159.00', '1571127666', '1571127666', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('126', '33', '0', '2', '-290.00', '1571130766', '1571130766', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('127', '33', '0', '2', '-290.00', '1571130878', '1571130878', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('128', '33', '0', '2', '-78.00', '1571133755', '1571133755', '订单支付');
INSERT INTO `z_user_money` VALUES ('129', '33', '0', '2', '-67.00', '1571136168', '1571136168', '订单支付');
INSERT INTO `z_user_money` VALUES ('130', '33', '0', '2', '-67.00', '1571136226', '1571136226', '订单支付');
INSERT INTO `z_user_money` VALUES ('131', '33', '0', '2', '-67.00', '1571136300', '1571136300', '订单支付');
INSERT INTO `z_user_money` VALUES ('132', '49', '0', '2', '-230.00', '1571188583', '1571188583', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('133', '33', '0', '2', '-230.00', '1571188722', '1571188722', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('134', '49', '0', '2', '-129.00', '1571189017', '1571189017', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('135', '33', '0', '2', '-2.00', '1571190963', '1571190963', '订单支付');
INSERT INTO `z_user_money` VALUES ('136', '33', '0', '2', '-67.00', '1571191140', '1571191140', '订单支付');
INSERT INTO `z_user_money` VALUES ('137', '33', '0', '2', '-67.00', '1571191591', '1571191591', '订单支付');
INSERT INTO `z_user_money` VALUES ('138', '33', '0', '2', '-67.00', '1571191661', '1571191661', '订单支付');
INSERT INTO `z_user_money` VALUES ('139', '33', '0', '2', '-67.00', '1571191737', '1571191737', '订单支付');
INSERT INTO `z_user_money` VALUES ('140', '33', '0', '2', '-65.00', '1571191814', '1571191814', '订单支付');
INSERT INTO `z_user_money` VALUES ('141', '33', '0', '2', '-65.00', '1571191861', '1571191861', '订单支付');
INSERT INTO `z_user_money` VALUES ('142', '33', '0', '2', '-290.00', '1571192767', '1571192767', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('143', '33', '0', '2', '-290.00', '1571192774', '1571192774', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('144', '33', '0', '2', '-290.00', '1571192885', '1571192885', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('145', '33', '0', '2', '-290.00', '1571192903', '1571192903', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('146', '33', '0', '2', '-290.00', '1571192947', '1571192947', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('147', '33', '0', '2', '-290.00', '1571193108', '1571193108', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('148', '33', '0', '2', '-290.00', '1571193124', '1571193124', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('149', '33', '0', '2', '-290.00', '1571193737', '1571193737', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('150', '33', '0', '2', '-290.00', '1571194136', '1571194136', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('151', '49', '0', '2', '-67.00', '1571196485', '1571196485', '订单支付');
INSERT INTO `z_user_money` VALUES ('152', '33', '0', '2', '-67.00', '1571196591', '1571196591', '订单支付');
INSERT INTO `z_user_money` VALUES ('153', '33', '0', '2', '-67.00', '1571196756', '1571196756', '订单支付');
INSERT INTO `z_user_money` VALUES ('154', '33', '0', '2', '-67.00', '1571196915', '1571196915', '订单支付');
INSERT INTO `z_user_money` VALUES ('155', '33', '0', '1', '1.00', '1572340861', '1572340861', '限时打折订单退款');
INSERT INTO `z_user_money` VALUES ('156', '33', '0', '2', '-67.00', '1572342818', '1572342818', '订单支付');
INSERT INTO `z_user_money` VALUES ('157', '33', '0', '2', '-159.00', '1572343493', '1572343493', '订单支付');
INSERT INTO `z_user_money` VALUES ('158', '33', '0', '2', '-67.00', '1572343535', '1572343535', '订单支付');
INSERT INTO `z_user_money` VALUES ('159', '33', '0', '1', '2.00', '1572343794', '1572343794', '秒杀订单退款');
INSERT INTO `z_user_money` VALUES ('160', '33', '0', '1', '1.00', '1572343824', '1572343824', '限时打折订单退款');
INSERT INTO `z_user_money` VALUES ('161', '33', '0', '2', '-290.00', '1572429122', '1572429122', '余额支付订单');
INSERT INTO `z_user_money` VALUES ('162', '32', '0', '1', '10.00', '1572430052', '1572430052', '砍价订单201910301702470248售后退回');
INSERT INTO `z_user_money` VALUES ('163', '33', '0', '2', '-230.00', '1572494019', '1572494019', '余额支付订单');

-- ----------------------------
-- Table structure for z_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `z_user_notice`;
CREATE TABLE `z_user_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '1' COMMENT '1未读2已读',
  `msg` varchar(255) DEFAULT '' COMMENT '内容',
  `add_time` int(10) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知';

-- ----------------------------
-- Records of z_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for z_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `z_user_sign`;
CREATE TABLE `z_user_sign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT '0' COMMENT '签到获得的积分',
  `add_time` int(10) DEFAULT '0' COMMENT '签到时间',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='签到记录表';

-- ----------------------------
-- Records of z_user_sign
-- ----------------------------
INSERT INTO `z_user_sign` VALUES ('8', '25', '10', '1563213381', '1563213381');
INSERT INTO `z_user_sign` VALUES ('9', '19', '10', '1563213533', '1563213533');
INSERT INTO `z_user_sign` VALUES ('10', '27', '10', '1563261439', '1563261439');
INSERT INTO `z_user_sign` VALUES ('11', '21', '10', '1563268142', '1563268142');
INSERT INTO `z_user_sign` VALUES ('12', '19', '10', '1563325745', '1563325745');
INSERT INTO `z_user_sign` VALUES ('13', '21', '10', '1563351656', '1563351656');
INSERT INTO `z_user_sign` VALUES ('14', '27', '10', '1563358586', '1563358586');
INSERT INTO `z_user_sign` VALUES ('15', '19', '10', '1563762354', '1563762354');
INSERT INTO `z_user_sign` VALUES ('16', '30', '10', '1563797413', '1563797413');
INSERT INTO `z_user_sign` VALUES ('17', '21', '10', '1564040587', '1564040587');
INSERT INTO `z_user_sign` VALUES ('18', '19', '10', '1564189483', '1564189483');
INSERT INTO `z_user_sign` VALUES ('19', '33', '10', '1564848605', '1564848605');
INSERT INTO `z_user_sign` VALUES ('20', '33', '10', '1565097980', '1565097980');
INSERT INTO `z_user_sign` VALUES ('21', '33', '10', '1565424912', '1565424912');
INSERT INTO `z_user_sign` VALUES ('22', '28', '10', '1565782350', '1565782350');
INSERT INTO `z_user_sign` VALUES ('23', '13', '10', '1565789301', '1565789301');
INSERT INTO `z_user_sign` VALUES ('24', '33', '10', '1566804986', '1566804986');
INSERT INTO `z_user_sign` VALUES ('25', '33', '10', '1568818494', '1568818494');
INSERT INTO `z_user_sign` VALUES ('26', '36', '10', '1568952140', '1568952140');
INSERT INTO `z_user_sign` VALUES ('27', '28', '10', '1568967214', '1568967214');
INSERT INTO `z_user_sign` VALUES ('28', '41', '10', '1569059564', '1569059564');
INSERT INTO `z_user_sign` VALUES ('29', '21', '10', '1569392111', '1569392111');
INSERT INTO `z_user_sign` VALUES ('30', '21', '10', '1569484371', '1569484371');
INSERT INTO `z_user_sign` VALUES ('31', '21', '10', '1569563634', '1569563634');
INSERT INTO `z_user_sign` VALUES ('32', '31', '10', '1569573739', '1569573739');
INSERT INTO `z_user_sign` VALUES ('33', '11', '10', '1569574504', '1569574504');
INSERT INTO `z_user_sign` VALUES ('34', '40', '10', '1569576206', '1569576206');
INSERT INTO `z_user_sign` VALUES ('35', '33', '10', '1570010507', '1570010507');
INSERT INTO `z_user_sign` VALUES ('36', '33', '10', '1570936229', '1570936229');
INSERT INTO `z_user_sign` VALUES ('37', '33', '10', '1571037574', '1571037574');
INSERT INTO `z_user_sign` VALUES ('39', '40', '10', '1571044463', '1571044463');
INSERT INTO `z_user_sign` VALUES ('40', '33', '10', '1571108598', '1571108598');
INSERT INTO `z_user_sign` VALUES ('41', '44', '10', '1571133434', '1571133434');
INSERT INTO `z_user_sign` VALUES ('42', '29', '10', '1571133723', '1571133723');
INSERT INTO `z_user_sign` VALUES ('43', '47', '10', '1571152835', '1571152835');
INSERT INTO `z_user_sign` VALUES ('44', '44', '10', '1571187100', '1571187100');
INSERT INTO `z_user_sign` VALUES ('45', '49', '10', '1571188239', '1571188239');
INSERT INTO `z_user_sign` VALUES ('46', '26', '10', '1571274116', '1571274116');
INSERT INTO `z_user_sign` VALUES ('47', '49', '10', '1571296159', '1571296159');
INSERT INTO `z_user_sign` VALUES ('48', '21', '10', '1571296334', '1571296334');
INSERT INTO `z_user_sign` VALUES ('49', '33', '10', '1571298832', '1571298832');
INSERT INTO `z_user_sign` VALUES ('50', '40', '10', '1571298985', '1571298985');
INSERT INTO `z_user_sign` VALUES ('51', '33', '10', '1572053198', '1572053198');
INSERT INTO `z_user_sign` VALUES ('52', '33', '10', '1572312413', '1572312413');
INSERT INTO `z_user_sign` VALUES ('53', '33', '10', '1572489814', '1572489814');

-- ----------------------------
-- Table structure for z_zone
-- ----------------------------
DROP TABLE IF EXISTS `z_zone`;
CREATE TABLE `z_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `pics` varchar(255) NOT NULL DEFAULT '' COMMENT '详情展示图',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='专区';

-- ----------------------------
-- Records of z_zone
-- ----------------------------
INSERT INTO `z_zone` VALUES ('6', '博主推荐', '/uploads/20190506/6c1a4274e3740af8080d5adb76722a61.jpg', '/uploads/20190507/2078d824fd7c366282e44776f26cb05b.jpg', '博主独家推荐', '9', '1557130752', '1557194395');
INSERT INTO `z_zone` VALUES ('7', '经典爆款', '/uploads/20190506/20df37d55304ffb40a729db0efdaf539.jpg', '', '经典爆款，火热开售', '8', '1557130809', '1557130809');
INSERT INTO `z_zone` VALUES ('8', '上新专区', '/uploads/20190506/4ba6e725154b8f66560da75cc2589acc.png', '/uploads/20190507/6d17aa05bbae71455130f97484660666.jpg', '上新商品，独家购买', '10', '1557130849', '1557194498');

-- ----------------------------
-- Table structure for z_zone_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_zone_goods`;
CREATE TABLE `z_zone_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '专区ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `is_reco` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='商品所属专区';

-- ----------------------------
-- Records of z_zone_goods
-- ----------------------------
INSERT INTO `z_zone_goods` VALUES ('45', '6', '5', '1', '1572339927', '1572339927');
INSERT INTO `z_zone_goods` VALUES ('8', '8', '2', '2', '1557134591', '1557134591');
INSERT INTO `z_zone_goods` VALUES ('41', '6', '1', '1', '1572245278', '1572245278');
INSERT INTO `z_zone_goods` VALUES ('40', '8', '1', '1', '1572245278', '1572245278');
INSERT INTO `z_zone_goods` VALUES ('30', '6', '7', '1', '1565428447', '1565428447');
INSERT INTO `z_zone_goods` VALUES ('29', '8', '7', '1', '1565428447', '1565428447');
INSERT INTO `z_zone_goods` VALUES ('35', '7', '6', '1', '1569485669', '1569485669');
INSERT INTO `z_zone_goods` VALUES ('39', '8', '0', '1', '1571123078', '1571123078');
DROP TRIGGER IF EXISTS `point_change`;
DELIMITER ;;
CREATE TRIGGER `point_change` AFTER INSERT ON `z_point_change` FOR EACH ROW begin
     update z_user set point = point + new.point where id = new.uid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `change`;
DELIMITER ;;
CREATE TRIGGER `change` AFTER INSERT ON `z_user_money` FOR EACH ROW begin
     update z_user set money = money + new.money where id = new.uid;
end
;;
DELIMITER ;
