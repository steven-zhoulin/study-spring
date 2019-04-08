SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_user_authorities`;
CREATE TABLE `sys_user_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_role_users`;
CREATE TABLE `sys_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_role_authorities`;
CREATE TABLE `sys_role_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


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