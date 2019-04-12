SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_menu_id` INT(11) COMMENT '父菜单ID',
  `menu_title` VARCHAR(50) NOT NULL COMMENT '菜单标题',
  `menu_url` VARCHAR(512) COMMENT '菜单地址',
  `show_order` INT(5) NOT NULL COMMENT '菜单显示顺序',
  `enabled` TINYINT(1) NOT NULL COMMENT '是否激活',
  `description` VARCHAR(100) COMMENT '描述',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `idx_sys_menu_menu_title` (`menu_title`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_right`;
CREATE TABLE `sys_right` (
  `right_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `right_name` VARCHAR(50) NOT NULL COMMENT '权限名',
  `right_type` CHAR(1) NOT NULL COMMENT '权限类别: m-菜单权限,f-功能权限',
  `enabled` TINYINT(1) NOT NULL COMMENT '是否激活',
  `description` VARCHAR(100) COMMENT '描述',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `real_name` VARCHAR(20) NOT NULL COMMENT '实名',
  `user_name` VARCHAR(20) NOT NULL COMMENT '登录名',
  `password` VARCHAR(100) NOT NULL COMMENT '密码',
  `phone` VARCHAR(50) COMMENT '手机号',
  `wechat` VARCHAR(50) COMMENT '微信号',
  `qq` VARCHAR(50) COMMENT 'QQ号码',
  `alipay` VARCHAR(50) COMMENT '支付宝帐号',
  `email` VARCHAR(60) COMMENT '邮箱',
  `enabled` TINYINT(1) NOT NULL COMMENT '激活',
  `description` VARCHAR(100) COMMENT '描述',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_sys_user_name` (`user_name`),
  UNIQUE KEY `idx_sys_user_phone` (`phone`),
  UNIQUE KEY `idx_sys_user_wechat` (`wechat`),
  UNIQUE KEY `idx_sys_user_qq` (`qq`),
  UNIQUE KEY `idx_sys_user_alipay` (`alipay`),
  UNIQUE KEY `idx_sys_user_email` (`email`)
) ENGINE=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` VARCHAR(50) NOT NULL COMMENT '角色名',
  `enabled` TINYINT(1) NOT NULL COMMENT '激活',
  `description` VARCHAR(100) COMMENT '描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_user_right`;
CREATE TABLE `sys_user_right` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `right_id` INT(11) NOT NULL COMMENT '权限ID',
  `enabled` TINYINT(1) NOT NULL COMMENT '激活',
  PRIMARY KEY (`user_id`, `right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_role_right`;
CREATE TABLE `sys_role_right` (
  `role_id` INT(11) NOT NULL COMMENT '角色ID',
  `right_id` INT(11) NOT NULL COMMENT '权限ID',
  `enabled` TINYINT(1) NOT NULL COMMENT '激活',
  PRIMARY KEY (`role_id`, `right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `role_id` INT(11) NOT NULL COMMENT '角色ID',
  `user_id` INT(11) NOT NULL COMMENT '用户ID',
  `enabled` TINYINT(1) NOT NULL COMMENT '是否激活',
  PRIMARY KEY (`role_id`, `user_id`),
  KEY `key_role_id` (`role_id`),
  KEY `key_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO sys_user(real_name, user_name, PASSWORD, phone, wechat, qq, alipay, email, enabled, description) VALUES('周麟', 'steven', '123', '13787235663', 'steven-zhou', '21550566', '13787235663', '21550566@qq.com', 1, '');
INSERT INTO sys_user(real_name, user_name, PASSWORD, phone, wechat, qq, alipay, email, enabled, description) VALUES('金念', 'jinnian', '123', '13787236663', 'jinnian', '123123123', '13787236663', '13787236663@139.com', 1, '');
INSERT INTO sys_user(real_name, user_name, PASSWORD, phone, wechat, qq, alipay, email, enabled, description) VALUES('廖盛', 'liaosheng', '123', '13787135440', 'liaosheng', '21550500', '13787135440', '13787135440@139.com', 1, '');

INSERT INTO sys_role(role_name, enabled, description) VALUES('admin', 1, '系统管理员');
INSERT INTO sys_role(role_name, enabled, description) VALUES('user', 1, '一般用户');

INSERT INTO sys_role_user(role_id, user_id, enabled) VALUES(10000, 10000, 1);
INSERT INTO sys_role_user(role_id, user_id, enabled) VALUES(10001, 10001, 1);
INSERT INTO sys_role_user(role_id, user_id, enabled) VALUES(10001, 10002, 1);



-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '书名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `publishDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出版日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', 'Java编程思想', '98.50', '2005-01-02 00:00:00');
INSERT INTO `books` VALUES ('2', 'HeadFirst设计模式', '55.70', '2010-11-09 00:00:00');
INSERT INTO `books` VALUES ('3', '第一行Android代码', '69.90', '2015-06-23 00:00:00');
INSERT INTO `books` VALUES ('4', 'C++编程思想', '88.50', '2004-01-09 00:00:00');
INSERT INTO `books` VALUES ('5', 'HeadFirst Java', '55.70', '2013-12-17 00:00:00');
INSERT INTO `books` VALUES ('6', '疯狂Android', '19.50', '2014-07-31 00:00:00');