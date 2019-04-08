DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
);

DROP TABLE IF EXISTS `sys_user_authorities`;
CREATE TABLE `sys_user_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `sys_role_users`;
CREATE TABLE `sys_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `sys_role_authorities`;
CREATE TABLE `sys_role_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE `books` IF EXISTS;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '书名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `publishDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出版日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
);