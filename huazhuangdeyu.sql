/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : huazhuangdeyu

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 28/06/2019 09:11:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for z_access
-- ----------------------------
DROP TABLE IF EXISTS `z_access`;
CREATE TABLE `z_access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面URL',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0生效 1无效',
  `pid` int(11) NOT NULL COMMENT '权限分类ID',
  `is_nav` tinyint(1) NOT NULL DEFAULT 2 COMMENT '是否加入菜单 1是 2否',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 倒序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_access
-- ----------------------------
INSERT INTO `z_access` VALUES (2, '管理员', 'index', '', 0, 2, 1, 9, 1514197382, 1529339312);
INSERT INTO `z_access` VALUES (3, '角色管理', 'role', '', 0, 2, 1, 8, 1514197392, 1529339333);
INSERT INTO `z_access` VALUES (4, '权限列表', 'node', '', 0, 2, 1, 7, 1514197402, 1529339338);
INSERT INTO `z_access` VALUES (29, '添加/编辑角色', 'addrole', '', 0, 2, 2, 6, 1528954933, 1529339351);
INSERT INTO `z_access` VALUES (46, '配置权限', 'access', '', 0, 2, 2, 0, 1529338363, 1529338363);
INSERT INTO `z_access` VALUES (47, '删除角色', 'delerole', '', 0, 2, 2, 5, 1529338413, 1529339364);
INSERT INTO `z_access` VALUES (48, '添加/编辑管理', 'addadmin', '', 0, 2, 2, 0, 1529338540, 1529338577);
INSERT INTO `z_access` VALUES (49, '激活/冻结管理', 'isstatus', '', 0, 2, 2, 0, 1529338608, 1529338608);
INSERT INTO `z_access` VALUES (50, '删除管理', 'deleadmin', '', 0, 2, 2, 0, 1529338626, 1529338626);
INSERT INTO `z_access` VALUES (116, '肌肤类型', 'index', '', 0, 31, 1, 9, 1557028839, 1557028839);
INSERT INTO `z_access` VALUES (115, '用户列表', 'index', '', 0, 30, 1, 9, 1553070811, 1553070811);
INSERT INTO `z_access` VALUES (114, '商品分类', 'type', '', 0, 29, 1, 8, 1553050672, 1553050672);
INSERT INTO `z_access` VALUES (113, '商品列表', 'index', '', 0, 29, 1, 9, 1552891706, 1552891706);
INSERT INTO `z_access` VALUES (117, '添加/编辑肌肤类型', 'save', '', 0, 31, 2, 8, 1557028899, 1557028899);
INSERT INTO `z_access` VALUES (118, '添加/编辑组合商品', 'goods_save', '', 0, 31, 2, 7, 1557028929, 1557028944);
INSERT INTO `z_access` VALUES (119, '商品组合列表', 'goods', '', 0, 31, 2, 7, 1557028971, 1557028971);
INSERT INTO `z_access` VALUES (120, '专区推荐', 'zone', '', 0, 31, 1, 9, 1557130095, 1557130095);
INSERT INTO `z_access` VALUES (121, '满减活动', 'index', '', 0, 32, 1, 9, 1557195133, 1557211449);
INSERT INTO `z_access` VALUES (122, '优惠劵', 'coupon', '', 0, 32, 1, 8, 1557195164, 1557195164);
INSERT INTO `z_access` VALUES (123, '商品标签', 'label', '', 0, 29, 1, 7, 1557196614, 1557196614);
INSERT INTO `z_access` VALUES (124, '添加/编辑商品标签', 'label_save', '', 0, 29, 2, 7, 1557198040, 1557198040);
INSERT INTO `z_access` VALUES (125, '咨询与售后', 'help', '', 0, 29, 1, 6, 1557198090, 1557198090);
INSERT INTO `z_access` VALUES (126, '会员等级', 'grade', '', 0, 30, 1, 9, 1557215935, 1557215935);
INSERT INTO `z_access` VALUES (127, '会员说明', 'desc', '', 0, 30, 1, 7, 1557301894, 1557301894);
INSERT INTO `z_access` VALUES (128, '砍价商品', 'index', '', 0, 33, 1, 9, 1557307739, 1557307739);
INSERT INTO `z_access` VALUES (129, '添加/编辑砍价商品', 'save', '', 0, 33, 2, 8, 1557307778, 1557307778);
INSERT INTO `z_access` VALUES (130, '砍价规则', 'rule', '', 0, 33, 1, 5, 1557307804, 1557396256);
INSERT INTO `z_access` VALUES (131, '砍价订单', 'order', '', 0, 33, 1, 7, 1557384781, 1557384781);
INSERT INTO `z_access` VALUES (132, '拼团商品', 'index', '', 0, 34, 1, 9, 1557451052, 1557451284);
INSERT INTO `z_access` VALUES (133, '添加/编辑拼团商品', 'save', '', 0, 34, 2, 8, 1557451070, 1557451070);
INSERT INTO `z_access` VALUES (134, '拼团订单', 'order', '', 0, 34, 1, 7, 1557470892, 1557470892);
INSERT INTO `z_access` VALUES (135, '秒杀商品', 'index', '', 0, 35, 1, 9, 1557470995, 1557470995);
INSERT INTO `z_access` VALUES (136, '添加/编辑秒杀商品', 'save', '', 0, 35, 2, 8, 1557471012, 1557560498);
INSERT INTO `z_access` VALUES (137, '秒杀配置', 'time', '', 0, 35, 1, 7, 1557472401, 1557482449);
INSERT INTO `z_access` VALUES (138, '基础配置', 'index', '', 0, 36, 1, 9, 1557713072, 1557713072);

-- ----------------------------
-- Table structure for z_access_role
-- ----------------------------
DROP TABLE IF EXISTS `z_access_role`;
CREATE TABLE `z_access_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  `acc_id` int(11) NOT NULL COMMENT '权限ID',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of z_access_role
-- ----------------------------
INSERT INTO `z_access_role` VALUES (1, 1, 6, 1514197463);
INSERT INTO `z_access_role` VALUES (2, 1, 1, 1514198168);
INSERT INTO `z_access_role` VALUES (4, 1, 7, 1514361292);
INSERT INTO `z_access_role` VALUES (5, 1, 8, 1514455230);
INSERT INTO `z_access_role` VALUES (6, 1, 9, 1514455230);
INSERT INTO `z_access_role` VALUES (7, 1, 10, 1514455230);
INSERT INTO `z_access_role` VALUES (8, 1, 11, 1514455230);
INSERT INTO `z_access_role` VALUES (9, 2, 1, 1526385621);
INSERT INTO `z_access_role` VALUES (25, 5, 2, 1529338677);
INSERT INTO `z_access_role` VALUES (26, 5, 3, 1529338677);
INSERT INTO `z_access_role` VALUES (30, 6, 58, 1546409369);
INSERT INTO `z_access_role` VALUES (31, 6, 59, 1546409369);
INSERT INTO `z_access_role` VALUES (32, 6, 60, 1546409369);
INSERT INTO `z_access_role` VALUES (33, 6, 61, 1546409369);
INSERT INTO `z_access_role` VALUES (34, 6, 62, 1546409369);
INSERT INTO `z_access_role` VALUES (35, 6, 63, 1546409369);
INSERT INTO `z_access_role` VALUES (36, 6, 64, 1546409369);
INSERT INTO `z_access_role` VALUES (37, 6, 65, 1546409369);

-- ----------------------------
-- Table structure for z_access_type
-- ----------------------------
DROP TABLE IF EXISTS `z_access_type`;
CREATE TABLE `z_access_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名称',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 倒序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_access_type
-- ----------------------------
INSERT INTO `z_access_type` VALUES (2, '后台管理', 'admins', 'icon-shezhi', 99, 1514197373, 1531962285);
INSERT INTO `z_access_type` VALUES (29, '商品管理', 'goods', 'icon-shangpin', 9, 1552891675, 1552891692);
INSERT INTO `z_access_type` VALUES (30, '用户管理', 'user', 'icon-jiaosequnti', 0, 1553070786, 1553070786);
INSERT INTO `z_access_type` VALUES (31, '专区管理', 'zone', 'icon-yun', 8, 1557028808, 1557129772);
INSERT INTO `z_access_type` VALUES (32, '优惠促销', 'prom', 'icon-zhinengyouhua', 7, 1557195106, 1557195106);
INSERT INTO `z_access_type` VALUES (33, '砍价专区', 'bargain', 'icon-caiwu-xianxing', 9, 1557307720, 1557307720);
INSERT INTO `z_access_type` VALUES (34, '拼团专区', 'group', 'icon-tianjiayonghu', 9, 1557451005, 1557451035);
INSERT INTO `z_access_type` VALUES (35, '秒杀专区', 'spike', 'icon-jifen-xianxing', 9, 1557470981, 1557470981);
INSERT INTO `z_access_type` VALUES (36, '网站配置', 'config', 'icon-peizhiguanli', 99, 1557713045, 1557713045);

-- ----------------------------
-- Table structure for z_admin
-- ----------------------------
DROP TABLE IF EXISTS `z_admin`;
CREATE TABLE `z_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名称',
  `admin_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `forst` int(1) NOT NULL DEFAULT 0 COMMENT '是否冻结 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_admin
-- ----------------------------
INSERT INTO `z_admin` VALUES (1, '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1514163261, 1526385304, 0);

-- ----------------------------
-- Table structure for z_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `z_admin_role`;
CREATE TABLE `z_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态 0有效 1无效',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for z_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `z_admin_roles`;
CREATE TABLE `z_admin_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) NOT NULL COMMENT '管理员ID',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of z_admin_roles
-- ----------------------------
INSERT INTO `z_admin_roles` VALUES (3, 6, 2, 1526384853);
INSERT INTO `z_admin_roles` VALUES (4, 2, 5, 1528873113);
INSERT INTO `z_admin_roles` VALUES (7, 9, 6, 1546427140);
INSERT INTO `z_admin_roles` VALUES (8, 7, 6, 1547003146);

-- ----------------------------
-- Table structure for z_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_goods`;
CREATE TABLE `z_bargain_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `old_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价格',
  `min_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '最低可以砍到金额',
  `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `hour` int(11) NOT NULL DEFAULT 0 COMMENT '砍价小时',
  `minute` int(11) NOT NULL DEFAULT 0 COMMENT '砍价分钟',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_bargain_goods
-- ----------------------------
INSERT INTO `z_bargain_goods` VALUES (1, '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', '/uploads/20190509/5172f34a74e20c0205740e15aa259836.jpg', 5499.00, 5999.00, 4500.00, 0, 1, 30, 1557367791, 1557384556);
INSERT INTO `z_bargain_goods` VALUES (2, 'vivo Z1极光特别版 新一代全面屏AI双摄手机', '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', 1799.00, 1999.00, 1399.00, 0, 1, 0, 1557370823, 1557370823);
INSERT INTO `z_bargain_goods` VALUES (3, '外星人Alienware Area水冷游戏台式电脑主机(i7-7800X 8G 256GSSD GTX1070 8G独显)', '/uploads/20190509/7a4a700ea90b470d7dda59fb3478bba6.jpg', 15999.00, 18999.00, 12999.00, 0, 1, 0, 1557371126, 1557371126);

-- ----------------------------
-- Table structure for z_bargain_help
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_help`;
CREATE TABLE `z_bargain_help`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '砍价订单ID',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '砍掉金额',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '砍价时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单砍价记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_bargain_help
-- ----------------------------
INSERT INTO `z_bargain_help` VALUES (1, 1, 1, 15.00, 1557394985, 1557394985);
INSERT INTO `z_bargain_help` VALUES (2, 2, 1, 8.88, 1557394985, 1557394985);
INSERT INTO `z_bargain_help` VALUES (3, 5, 1, 13.80, 1557394985, 1557394985);

-- ----------------------------
-- Table structure for z_bargain_order
-- ----------------------------
DROP TABLE IF EXISTS `z_bargain_order`;
CREATE TABLE `z_bargain_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应付金额',
  `pay_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实付金额',
  `bargain_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已砍金额',
  `bargain_num` int(11) NOT NULL DEFAULT 0 COMMENT '砍价次数',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `goods_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1待付款 2待发货 3待收货 4已完成 5申请售后',
  `bargain_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '砍价状态 1砍价中 2砍价成功 3砍价成功',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '砍价结束时间',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_bargain_order
-- ----------------------------
INSERT INTO `z_bargain_order` VALUES (1, '201905091648684591', 5499.00, 5300.00, 199.00, 15, 1, '三星 Galaxy S10 8GB+512GB炭晶黑（SM-G9730）', 5499.00, '/uploads/20190509/cece69e5a56f6322e6036bce7b1430db.jpg', 1, 1, '彭君', '18819171134', '广东省广州市天河区车陂南大街', 1557400860, 1557391828, 1557391828);

-- ----------------------------
-- Table structure for z_config
-- ----------------------------
DROP TABLE IF EXISTS `z_config`;
CREATE TABLE `z_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站logo',
  `appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信APPID',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appsecret',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付key',
  `mchid` int(11) NOT NULL DEFAULT 0 COMMENT '商户号',
  `fare_money` int(11) NOT NULL DEFAULT 0 COMMENT '运费',
  `work_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店地址',
  `cust_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客服电话',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店介绍',
  `long` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_config
-- ----------------------------
INSERT INTO `z_config` VALUES (1, '化妆的鱼', '/uploads/20190330/87923715f7d3c1722d0be82c440860b8.jpg', 'wxce3f2855099a8374', 'fbb662e0d11613c255cbe0a9e27c75ee', 'e0069ba4feeced842617256a79a04feb', 1530854171, 10, '广州市天河区车陂南', '020-864556213', '营业时间 11:00 - 18:00 （周一至周六） 限时买一送一（特价商品除外）', '113.402870', '23.125220', 1551341451, 1557713350);

-- ----------------------------
-- Table structure for z_coupon
-- ----------------------------
DROP TABLE IF EXISTS `z_coupon`;
CREATE TABLE `z_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '条件金额',
  `less_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣金额',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 1是用户领取 2是指定用户',
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '指定的用户ID',
  `day` int(11) NOT NULL DEFAULT 0 COMMENT '领取后的有效天数',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '领取开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '领取结束时间',
  `set_num` int(11) NOT NULL DEFAULT 0 COMMENT '已领取数',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '发放时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠劵' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_coupon
-- ----------------------------
INSERT INTO `z_coupon` VALUES (1, 100.00, 30.00, 2, '2,1', 5, 1553498120, 1553498120, 0, 1553498120, 1553498120);
INSERT INTO `z_coupon` VALUES (2, 50.00, 10.00, 1, '', 3, 1553529600, 1553702400, 0, 1553501091, 1553501091);
INSERT INTO `z_coupon` VALUES (3, 200.00, 30.00, 1, '', 10, 1557244800, 1557849600, 0, 1557212722, 1557212722);

-- ----------------------------
-- Table structure for z_discount
-- ----------------------------
DROP TABLE IF EXISTS `z_discount`;
CREATE TABLE `z_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_price` int(11) NOT NULL DEFAULT 0 COMMENT '满多少',
  `less_price` int(11) NOT NULL DEFAULT 0 COMMENT '减多少',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1是 2否',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_discount
-- ----------------------------
INSERT INTO `z_discount` VALUES (1, 30, 10, 1, 1553331108, 1553331108);
INSERT INTO `z_discount` VALUES (2, 50, 20, 1, 1553331558, 1553331558);

-- ----------------------------
-- Table structure for z_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_goods`;
CREATE TABLE `z_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品标题',
  `old_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `type_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相册',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `keep` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数',
  `is_reco` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否推荐 1否 2是',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上下架 1上架 2下架',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签信息',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `parameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品参数',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods
-- ----------------------------
INSERT INTO `z_goods` VALUES (1, '三星 Galaxy S10（SM-G9730）', '3D超声波屏下指纹超感官全视屏双卡双待全网通4G游戏手机', 2, '/uploads/20190319/b7c0403c1fdad799c843f944d0c5d949.jpg', 5999.00, '/uploads/20190319/92fb801f7f95b9b10bea08e81aab3652.jpg,/uploads/20190319/cd9e534e8d14e4ecaabf8359d245beb4.jpg,/uploads/20190319/f032c475df79643fa8abd59e034c502e.jpg,/uploads/20190319/98955acad8db05ea84c8b384d253324a.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/4938279a7ebbb72b2cddf9b4a3534555.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/48bfc8661e98ca18199c8ab0ccad5c76.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190319/0bca19ffe91699550aacc3c55d5786e9.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '', 0, NULL, 1552984475, 1557134791);
INSERT INTO `z_goods` VALUES (2, '三星 Galaxy Note9（SM-N9600）', '移动联通电信4G手机 双卡双待', 2, '/uploads/20190320/ebabe1b906868ff93c6f045cd9ed0da5.jpg', 6569.00, '/uploads/20190320/e4f83bf577aefcace6206dd1b27c61af.jpg,/uploads/20190320/7a7000e62b963ac13f0c66218b8b0a03.jpg,/uploads/20190320/24b15522fd0c8059e614cff80fbf5789.jpg,/uploads/20190320/5a3ec623b458fc8028871a5cd7cd00fa.jpg,/uploads/20190320/53947263f1f3b4858f35c8dcadcc8d06.jpg,/uploads/20190320/7ac59ec07074ba28990e6d02857579da.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/2245916dc7987fc57d8d093567ecfb11.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '', 0, NULL, 1553066949, 1557134591);
INSERT INTO `z_goods` VALUES (3, '山海经典藏画册', '全新包装', 8, '/uploads/20190320/5bd2a1ab0b26a46f808226dd22d52b3f.jpg', 89.00, '/uploads/20190320/b8dd4ab6b76565b29331300120b0469f.jpg,/uploads/20190320/b41181faaf78d9b6c1ea708ad853a7eb.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/3d43a9c73394c280e59d5a3015d5a1df.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/30f46b908508c30408bbd123cabbd86e.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '', 0, NULL, 1553067979, 1553067979);
INSERT INTO `z_goods` VALUES (4, '追风筝的人', '2018版', 8, '/uploads/20190320/af76bde21bee295e2ff3e7b77112817a.jpg', 39.00, '/uploads/20190320/d9dfc4f7e94c5cf8faf5808247b046ad.jpg,/uploads/20190320/7993802138d0f3ec3daf7ea2de4dc8fb.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/13836345330d21e6f6e82397806a4143.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '', 0, NULL, 1553068109, 1553068109);
INSERT INTO `z_goods` VALUES (5, '广西高乐蜜芒果', '单果250g以上 新鲜水果', 10, '/uploads/20190320/8109a862da3962a64ec3b52fd084bc2d.jpg', 54.00, '/uploads/20190320/eabd4a9872befed3e917e54932307263.jpg,/uploads/20190320/e02ee321c179598be477abc2bc17d0c0.jpg,/uploads/20190320/d217a6fc2d7cb0a2fad5de8baf98bcf5.jpg,/uploads/20190320/c2870ced9db34fed2c2faf02257bd73c.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/c4d516242fc714eb70fa820b85dbbfaa.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190320/2d2180b82f937132e5aaa55c2fc9203b.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '', 0, NULL, 1553069304, 1557134581);
INSERT INTO `z_goods` VALUES (6, 'MAC魅可19年新春限定联名口红', '王者荣耀限量合作版', 13, '/uploads/20190506/c3a5da5006756812b485aae856b01aa2.jpg', 289.00, '/uploads/20190506/4459c423ceb3ce6c004da948b345675a.jpg,/uploads/20190506/3120754c0af740facf43060869a5340a.jpg,/uploads/20190506/0cb82522b879ff5799dc135b5e108f02.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/aaa04974e6c48290284d45f8145edd4a.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/d878c435b63529dd29182236bfd18094.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/661b737a08ae19ef83daa449c3b4837e.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '2', 0, '<p><br></p>', 1557125446, 1557210621);
INSERT INTO `z_goods` VALUES (7, '膜法世家 吸黑水润雪肌黑面膜贴21片装  ', '补水面膜保湿化妆品护肤套装', 12, '/uploads/20190506/c566c5aef3a75f55fae9a0f200f37ad1.jpg', 119.00, '/uploads/20190506/805dd349c35e6272b22088871e166ef6.jpg,/uploads/20190506/58deb31ee8df402a8e9f46fd3b810ea6.jpg,/uploads/20190506/add748a3217c07fe05353be3d798906c.jpg', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/273444276c932bc48c7224d1b498b1c0.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/a042bc91704e43722900f47df9736f37.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190506/83dfcd9baf2ce7056ae7e226b1c6a902.jpg\" width=\"300\"></p><p><br></p>', 0, 0, 1, 1, '3,2', 0, '<p>发货地：&nbsp; &nbsp;北京</p><p>运费：&nbsp; &nbsp; &nbsp; &nbsp;全国包邮</p>', 1557125537, 1557197751);

-- ----------------------------
-- Table structure for z_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_attr`;
CREATE TABLE `z_goods_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `ap_id` int(11) NOT NULL COMMENT 'sku id 用于初始化',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_attr
-- ----------------------------
INSERT INTO `z_goods_attr` VALUES (1, '颜色', 1, 1, 1552984640, 1553048577);
INSERT INTO `z_goods_attr` VALUES (2, '版本', 1, 2, 1552984640, 1553048577);
INSERT INTO `z_goods_attr` VALUES (5, '颜色', 2, 1, 1553067269, 1553067269);
INSERT INTO `z_goods_attr` VALUES (6, '版本', 2, 2, 1553067269, 1553067269);
INSERT INTO `z_goods_attr` VALUES (7, '套装', 3, 1, 1553068015, 1553068015);
INSERT INTO `z_goods_attr` VALUES (8, '默认属性', 4, 1, 1553068200, 1553068200);
INSERT INTO `z_goods_attr` VALUES (9, '默认属性', 5, 1, 1553069462, 1557026757);
INSERT INTO `z_goods_attr` VALUES (10, '色号', 6, 1, 1557125479, 1557125479);
INSERT INTO `z_goods_attr` VALUES (11, '规格', 7, 1, 1557125571, 1557713403);

-- ----------------------------
-- Table structure for z_goods_help
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_help`;
CREATE TABLE `z_goods_help`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品咨询与售后' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_help
-- ----------------------------
INSERT INTO `z_goods_help` VALUES (1, '<p>购买后什么时候发货：</p><p>答：用户下单购买后，将在24小时内发货</p>', 1557198430, 1557198509);

-- ----------------------------
-- Table structure for z_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_label`;
CREATE TABLE `z_goods_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签说明',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_label
-- ----------------------------
INSERT INTO `z_goods_label` VALUES (2, '24小时发货', '成功下单并付款的商品，将于24小时内发出', 1557197257, 1557197257);
INSERT INTO `z_goods_label` VALUES (3, '7天退换', '提供7天无理由退换货服务', 1557197287, 1557197298);

-- ----------------------------
-- Table structure for z_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_spec`;
CREATE TABLE `z_goods_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_attr_id` int(11) NOT NULL DEFAULT 0 COMMENT '属性ID',
  `ap_id` int(11) NOT NULL DEFAULT 0 COMMENT 'sku id 用于初始化',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_spec
-- ----------------------------
INSERT INTO `z_goods_spec` VALUES (1, '皓玉白', 1, 1, 1, 1552984640, 1553048577);
INSERT INTO `z_goods_spec` VALUES (2, '炭晶黑', 1, 1, 2, 1552984640, 1553048577);
INSERT INTO `z_goods_spec` VALUES (3, '琉璃绿', 1, 1, 3, 1552984640, 1553048577);
INSERT INTO `z_goods_spec` VALUES (4, '8GB+128GB', 1, 2, 4, 1552984640, 1553048578);
INSERT INTO `z_goods_spec` VALUES (5, '8GB+512GB', 1, 2, 5, 1552984640, 1553048578);
INSERT INTO `z_goods_spec` VALUES (7, '丹青黑', 2, 5, 1, 1553067269, 1553067269);
INSERT INTO `z_goods_spec` VALUES (8, '玄镜铜', 2, 5, 2, 1553067269, 1553067269);
INSERT INTO `z_goods_spec` VALUES (9, '寒霜蓝', 2, 5, 3, 1553067269, 1553067269);
INSERT INTO `z_goods_spec` VALUES (10, '6GB+128GB', 2, 6, 4, 1553067269, 1553067269);
INSERT INTO `z_goods_spec` VALUES (11, '8GB+512GB', 2, 6, 5, 1553067269, 1553067269);
INSERT INTO `z_goods_spec` VALUES (12, '整套8册', 3, 7, 1, 1553068015, 1553068015);
INSERT INTO `z_goods_spec` VALUES (13, '默认规格', 4, 8, 1, 1553068200, 1553068200);
INSERT INTO `z_goods_spec` VALUES (14, '4个装', 5, 9, 1, 1553069462, 1557026757);
INSERT INTO `z_goods_spec` VALUES (15, '8个装', 5, 9, 2, 1553069462, 1557026757);
INSERT INTO `z_goods_spec` VALUES (16, '32#', 6, 10, 1, 1557125479, 1557125479);
INSERT INTO `z_goods_spec` VALUES (17, '33#', 6, 10, 2, 1557125479, 1557125479);
INSERT INTO `z_goods_spec` VALUES (18, '34#', 6, 10, 3, 1557125479, 1557125479);
INSERT INTO `z_goods_spec` VALUES (19, '21片', 7, 11, 1, 1557125571, 1557713403);
INSERT INTO `z_goods_spec` VALUES (20, '36片', 7, 11, 2, 1557125571, 1557713403);

-- ----------------------------
-- Table structure for z_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_type`;
CREATE TABLE `z_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_type
-- ----------------------------
INSERT INTO `z_goods_type` VALUES (1, '电子产品', 0, '/uploads/20190320/ee33903376337be6fe4c69bd730aea73.jpg', 0, 1553054469, 1553054469);
INSERT INTO `z_goods_type` VALUES (2, '手机数码', 1, '', 0, 1553054478, 1553054629);
INSERT INTO `z_goods_type` VALUES (3, '手机配件', 1, '', 0, 1553054494, 1553054494);
INSERT INTO `z_goods_type` VALUES (4, '男女服饰', 0, '/uploads/20190320/ca775d035ee73d30490cca0b0c09c354.jpg', 0, 1553065751, 1553065751);
INSERT INTO `z_goods_type` VALUES (5, '男装', 4, '', 0, 1553065759, 1553065759);
INSERT INTO `z_goods_type` VALUES (6, '女装', 4, '', 0, 1553065767, 1553065767);
INSERT INTO `z_goods_type` VALUES (7, '图书文娱', 0, '/uploads/20190320/a8afe4d71197bdbf5c3660fcf4665f9c.jpg', 0, 1553065938, 1553065938);
INSERT INTO `z_goods_type` VALUES (8, '经典小说', 7, '', 0, 1553065952, 1553065952);
INSERT INTO `z_goods_type` VALUES (9, '新鲜水果', 0, '/uploads/20190320/d478211bdc52a581d3ed045b594a37b4.jpg', 0, 1553066066, 1553066066);
INSERT INTO `z_goods_type` VALUES (10, '进口水果', 9, '', 0, 1553066086, 1553066086);
INSERT INTO `z_goods_type` VALUES (11, '化妆品', 0, '/uploads/20190506/7055e1bd59807f267597a56b2ca8992b.jpg', 0, 1557125153, 1557125153);
INSERT INTO `z_goods_type` VALUES (12, '面膜', 11, '/uploads/20190506/8220eedff238dea91418df4f558d7708.jpg', 0, 1557125160, 1557125160);
INSERT INTO `z_goods_type` VALUES (13, '口红', 11, '/uploads/20190506/bde9e58c042424ddcd6ccd20a143cfe7.jpg', 0, 1557125186, 1557125186);

-- ----------------------------
-- Table structure for z_goods_val
-- ----------------------------
DROP TABLE IF EXISTS `z_goods_val`;
CREATE TABLE `z_goods_val`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格属性值 示例： 1:2 1为属性 2为规格',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `old_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价格',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `fare_money` int(11) NOT NULL DEFAULT 0 COMMENT '运费',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_goods_val
-- ----------------------------
INSERT INTO `z_goods_val` VALUES (1, 1, '1:1,2:4', 5999.00, 5999.00, 999, 0, 0, 1552984640, 1553048578);
INSERT INTO `z_goods_val` VALUES (2, 1, '1:1,2:5', 7699.00, 7699.00, 999, 0, 0, 1552984640, 1553048578);
INSERT INTO `z_goods_val` VALUES (3, 1, '1:2,2:4', 5999.00, 5999.00, 999, 0, 0, 1552984640, 1553048578);
INSERT INTO `z_goods_val` VALUES (4, 1, '1:2,2:5', 7699.00, 7699.00, 999, 0, 0, 1552984640, 1553048578);
INSERT INTO `z_goods_val` VALUES (5, 1, '1:3,2:4', 5999.00, 5999.00, 999, 0, 0, 1552984640, 1553048578);
INSERT INTO `z_goods_val` VALUES (11, 1, '1:3,2:5', 7699.00, 7699.00, 999, 0, 0, 1553048578, 1553048578);
INSERT INTO `z_goods_val` VALUES (12, 2, '5:7,6:10', 6569.00, 6899.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (13, 2, '5:7,6:11', 8569.00, 8799.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (14, 2, '5:8,6:10', 6569.00, 6899.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (15, 2, '5:8,6:11', 8569.00, 8799.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (16, 2, '5:9,6:10', 6569.00, 6899.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (17, 2, '5:9,6:11', 8569.00, 8799.00, 999, 0, 0, 1553067269, 1553067269);
INSERT INTO `z_goods_val` VALUES (18, 3, '7:12', 89.00, 128.00, 999, 0, 0, 1553068015, 1553068015);
INSERT INTO `z_goods_val` VALUES (19, 4, '8:13', 39.00, 48.00, 100, 0, 0, 1553068200, 1553068200);
INSERT INTO `z_goods_val` VALUES (20, 5, '9:14', 54.00, 60.00, 99, 0, 10, 1553069462, 1557026758);
INSERT INTO `z_goods_val` VALUES (21, 5, '9:15', 89.00, 96.00, 99, 0, 10, 1553069462, 1557026758);
INSERT INTO `z_goods_val` VALUES (22, 6, '10:16', 289.00, 309.00, 99, 0, 0, 1557125479, 1557125479);
INSERT INTO `z_goods_val` VALUES (23, 6, '10:17', 289.00, 309.00, 99, 0, 0, 1557125479, 1557125479);
INSERT INTO `z_goods_val` VALUES (24, 6, '10:18', 289.00, 309.00, 99, 0, 0, 1557125479, 1557125479);
INSERT INTO `z_goods_val` VALUES (25, 7, '11:19', 119.00, 148.00, 99, 0, 0, 1557125571, 1557713403);
INSERT INTO `z_goods_val` VALUES (26, 7, '11:20', 159.00, 148.00, 99, 0, 0, 1557125571, 1557713403);

-- ----------------------------
-- Table structure for z_group_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_group_goods`;
CREATE TABLE `z_group_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相册',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `old_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价格',
  `fare_price` int(11) NOT NULL DEFAULT 0 COMMENT '运费',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `keep` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上下架 1上架 2下架',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签信息',
  `parameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品参数',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_group_goods
-- ----------------------------
INSERT INTO `z_group_goods` VALUES (8, '迪奥（Dior）烈焰蓝金唇膏口红 999#金属光 显色持久', '/uploads/20190510/2cf47cc0c593263ed4658e24aa1b1e3b.jpg', '/uploads/20190510/843b8aaa22e20859d4ff5689fe874975.jpg,/uploads/20190510/84ca83b33147bca5b2ff0a4c2a70e08e.jpg,/uploads/20190510/9b4def91793570be01ae2295f712e257.jpg,/uploads/20190510/7dfc6724090247c6f67a70db593ff35c.jpg', 280.00, 320.00, 10, '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/6ac6ed112316fa382baca48893376e90.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/d09ef8554ed4d1ee20d309e9c6ebc47d.jpg\" width=\"300\"></p><p><br></p>', 0, 99, 0, 1, '3,2', '<p>参数：无</p>', 1557455074, 1557456242);
INSERT INTO `z_group_goods` VALUES (9, '香奈儿chanel口红炫亮魅力唇膏保湿赠礼盒礼袋套装生日礼物送女友 43#珊瑚红_亲爱 送礼盒礼品袋', '/uploads/20190510/2df104027afb455bb454541959d8f31c.jpg', '/uploads/20190510/527fdb97d2615e878bab29b82c4bec1c.jpg,/uploads/20190510/5bf0ff72299aed9131317d6788107af0.jpg,/uploads/20190510/caa6aa22c21d1cd7d515e85773ec1e9e.jpg,/uploads/20190510/e54e67ff9411304467c6b42a30c92939.jpg', 230.00, 278.00, 0, '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/0f09865f95d7621ab84c84c8fd2bf9d2.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/42511169be5b424ec1c902383cb2792b.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/96ae6e8db5e771f0dba7e6c11ee72c72.jpg\" width=\"300\"></p><p><br></p>', 0, 99, 0, 1, '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190510/75ce0347866c577a51c05ce04a9a85cb.jpg\" width=\"300\"></p><p><br></p>', 1557469671, 1557469671);

-- ----------------------------
-- Table structure for z_skin
-- ----------------------------
DROP TABLE IF EXISTS `z_skin`;
CREATE TABLE `z_skin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_skin
-- ----------------------------
INSERT INTO `z_skin` VALUES (1, '健康肌肤', '/uploads/20190505/7c798727fb6bc2532b1dda81c621aa61.jpg', '肌肤健康，透亮，红润有光泽', 9, 1557038302, 1557038743);
INSERT INTO `z_skin` VALUES (2, '痘痘肌', '/uploads/20190505/b3a83c8b265292d24927f2e7fcd8d144.jpg', '脸部肌肤长痘痘', 8, 1557038865, 1557038865);
INSERT INTO `z_skin` VALUES (3, '痘印肌', '/uploads/20190505/a697582610aa46c814ba97d4e84492e6.jpg', '脸部肌肤有痘印', 6, 1557038909, 1557038909);
INSERT INTO `z_skin` VALUES (4, '敏感肌', '/uploads/20190505/c2876f105925160fc2772a2a17df2a1d.jpg', '脸部肌肤比较敏感，容易过敏', 5, 1557038951, 1557038951);
INSERT INTO `z_skin` VALUES (5, '医术美后', '/uploads/20190505/80b95c011d0dddd07d9951087bf65883.jpg', '进行过美容手术或微整形的', 5, 1557039006, 1557039006);

-- ----------------------------
-- Table structure for z_skin_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_skin_goods`;
CREATE TABLE `z_skin_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skin_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '推荐商品ID',
  `old_goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '推荐组合商品ID',
  `crowd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '针对人群',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '说明介绍',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_reco` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否推荐 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '肌肤类型推荐组合' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_skin_goods
-- ----------------------------
INSERT INTO `z_skin_goods` VALUES (1, 1, 3, 2, '肌肤暗淡无光泽', '测试组合描述', 9, 2, 1557108305, 1557108305);
INSERT INTO `z_skin_goods` VALUES (2, 1, 2, 5, '测试', '测试测试', 8, 2, 1557123657, 1557123657);
INSERT INTO `z_skin_goods` VALUES (3, 2, 7, 6, '肌肤暗淡', '水润面膜，激活肌肤', 7, 2, 1557125670, 1557125670);
INSERT INTO `z_skin_goods` VALUES (4, 3, 6, 5, '嘴唇暗淡', '王者荣耀限量联名口红', 9, 2, 1557125783, 1557125783);
INSERT INTO `z_skin_goods` VALUES (5, 5, 7, 5, '肌肤疲劳', '面膜加芒果', 9, 2, 1557127053, 1557127053);
INSERT INTO `z_skin_goods` VALUES (6, 4, 6, 3, '测试人群', '口红加画册', 9, 2, 1557127138, 1557127138);

-- ----------------------------
-- Table structure for z_spike_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_goods`;
CREATE TABLE `z_spike_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `old_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价格',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相册',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `parameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品参数',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `fare_price` int(11) NOT NULL DEFAULT 0 COMMENT '运费',
  `time_id` int(11) NOT NULL DEFAULT 0 COMMENT '时间段ID',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_spike_goods
-- ----------------------------
INSERT INTO `z_spike_goods` VALUES (1, '观山海 杉泽山海经彩图正版画册全集无删减', 69.00, 99.00, '/uploads/20190511/99a99081d5b93569d6e78a461445454a.jpg', '/uploads/20190511/f0dddc6299e2dc48450237e9ee7b1f8e.jpg,/uploads/20190511/8ef1bef801cab0ab15310c211d487969.jpg,/uploads/20190511/1e2784a505e7dacb6fff0598dba86aaa.jpg', '3,2', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/0a15845506283d8a3700291cdd357124.jpg\" width=\"300\"></p><p><br></p>', '<p>无</p>', 99, 0, 0, 2, 1557559250, 1557559250);
INSERT INTO `z_spike_goods` VALUES (2, '山海经典藏画册', 57.00, 88.00, '/uploads/20190511/a97e27bcd7ab37fc79a3c731bbb0b660.jpg', '/uploads/20190511/ccaa572eaa8539577dc7511724f3519f.jpg,/uploads/20190511/eb238302fe1e7f092a7bf770ec1a8de3.jpg', '3', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/53dcfc62d2a0158bca43174f2785e660.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/uploads/20190511/eee683cf9f008d10cc5cf01e0c2823fb.jpg\" width=\"300\"></p><p><br></p>', '<p>无</p>', 99, 0, 0, 2, 1557559300, 1557566323);

-- ----------------------------
-- Table structure for z_spike_time
-- ----------------------------
DROP TABLE IF EXISTS `z_spike_time`;
CREATE TABLE `z_spike_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `goods_num` int(11) NOT NULL DEFAULT 0 COMMENT '活动商品数',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀时间段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_spike_time
-- ----------------------------
INSERT INTO `z_spike_time` VALUES (1, 1557543600, 1557547200, 0, 1557478318, 1557478318);
INSERT INTO `z_spike_time` VALUES (2, 1557554400, 1557568800, 0, 1557481027, 1557481027);

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `sex` tinyint(1) NOT NULL DEFAULT 1 COMMENT '性别 1男 2女',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1 正常 2冻结',
  `subscribe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关注公众号 1表示关注 0表示未关注',
  `grade_id` int(11) NOT NULL DEFAULT 1 COMMENT '会员等级',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户 token 接口凭证',
  `skin_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户肌肤类型ID',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES (6, '腔棘鱼\\ue522', 'https://wx.qlogo.cn/mmopen/vi_32/Ad2m3J8duUl99GRlibsCZ6xqYd0sxMMibuxR3RQbVEeX9nO32hO43J7bOVroZ2QJLDUicamo4La180GIpdLibsSZCQ/132', 1, '广西', '南宁', 'oZycs5PwrEndPm4oSIxGOmirsqeI', 1, 0, 1, '3f1f1b52c172ddb7f1f79b76a2b7571d', '1,3,4', 1553582368, 1557730708);
INSERT INTO `z_user` VALUES (7, '猴子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEQytTMw20PFqbNMUy66tGDSwzgCNFqI1GkwYGde9HwM12FIGcmoQlviaW3QpKYNtrCgRvUknBs7A/132', 1, '广东', '广州', 'oZycs5JCJ3XXbw2I5At6AK3tw8D8', 1, 0, 1, '9672320aa911e0fd972e5401a494cbcb', '', 1553857428, 1553857428);

-- ----------------------------
-- Table structure for z_user_grade
-- ----------------------------
DROP TABLE IF EXISTS `z_user_grade`;
CREATE TABLE `z_user_grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '等级名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '等级图标',
  `full_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '条件金额',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `is_point` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否允许积分抵扣 1否 2是',
  `is_convert` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否允许积分兑换 1否 2是',
  `discount` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '享受折扣',
  `birthday_discount` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '生日折扣',
  `is_default` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否设为用户默认等级 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_user_grade
-- ----------------------------
INSERT INTO `z_user_grade` VALUES (1, '店铺会员', '/uploads/20190508/8c1329699009ea3bd61941db09531ffa.jpg', 0.00, '登录即可成为会员', 1, 1, 0.00, 0.00, 2, 1557283911, 1557303125);
INSERT INTO `z_user_grade` VALUES (2, '鱼家新粉', '/uploads/20190508/ab47cc966e744502bf023b9d31b44e8b.jpg', 0.10, '成功购买一件商品并消费', 2, 1, 0.00, 0.00, 1, 1557283966, 1557285376);
INSERT INTO `z_user_grade` VALUES (3, '鱼家铁粉', '/uploads/20190508/b4967985e983ec0ebcf085a3c153d999.jpg', 2000.00, '消费≥2000元', 2, 2, 9.50, 0.00, 1, 1557284023, 1557288306);
INSERT INTO `z_user_grade` VALUES (4, '鱼家真爱粉', '/uploads/20190508/6be8cb211286da7ae56dc8f1c76f0ba7.jpg', 5000.00, '消费≥5000元', 2, 2, 9.00, 8.00, 1, 1557284058, 1557285389);
INSERT INTO `z_user_grade` VALUES (5, '鱼家粉你', '/uploads/20190508/34a35dd8efaf5926bfdbc0b11c7ee2f5.jpg', 10000.00, '消费≥10000元', 2, 2, 8.00, 7.50, 1, 1557284096, 1557285407);

-- ----------------------------
-- Table structure for z_zone
-- ----------------------------
DROP TABLE IF EXISTS `z_zone`;
CREATE TABLE `z_zone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情展示图',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 倒序',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_zone
-- ----------------------------
INSERT INTO `z_zone` VALUES (6, '博主推荐', '/uploads/20190506/6c1a4274e3740af8080d5adb76722a61.jpg', '/uploads/20190507/2078d824fd7c366282e44776f26cb05b.jpg', '博主独家推荐', 9, 1557130752, 1557194395);
INSERT INTO `z_zone` VALUES (7, '经典爆款', '/uploads/20190506/20df37d55304ffb40a729db0efdaf539.jpg', '', '经典爆款，火热开售', 8, 1557130809, 1557130809);
INSERT INTO `z_zone` VALUES (8, '上新专区', '/uploads/20190506/4ba6e725154b8f66560da75cc2589acc.png', '/uploads/20190507/6d17aa05bbae71455130f97484660666.jpg', '上新商品，独家购买', 10, 1557130849, 1557194498);

-- ----------------------------
-- Table structure for z_zone_goods
-- ----------------------------
DROP TABLE IF EXISTS `z_zone_goods`;
CREATE TABLE `z_zone_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '专区ID',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `is_reco` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否推荐 1否 2是',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品所属专区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_zone_goods
-- ----------------------------
INSERT INTO `z_zone_goods` VALUES (7, 6, 5, 2, 1557134581, 1557134581);
INSERT INTO `z_zone_goods` VALUES (8, 8, 2, 2, 1557134591, 1557134591);
INSERT INTO `z_zone_goods` VALUES (10, 8, 1, 2, 1557134791, 1557134791);
INSERT INTO `z_zone_goods` VALUES (11, 6, 1, 2, 1557134791, 1557134791);
INSERT INTO `z_zone_goods` VALUES (16, 8, 7, 2, 1557197751, 1557197751);
INSERT INTO `z_zone_goods` VALUES (17, 6, 7, 2, 1557197751, 1557197751);
INSERT INTO `z_zone_goods` VALUES (23, 7, 6, 2, 1557210621, 1557210621);

SET FOREIGN_KEY_CHECKS = 1;
