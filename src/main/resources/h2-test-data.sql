INSERT INTO `sys_users` VALUES('admin', 'admin', '13007318123', 'zhoulin158@sohu.com', 1);
INSERT INTO `sys_users` VALUES('guest', 'guest', '13000000000', 'guest@gmail.com', 1);
INSERT INTO `sys_users` VALUES('zhoulin', 'zhoulin', '13787230000', 'tcaomsmail@gmail.com', 1);

-- INSERT INTO `sys_authorities` VALUES(1, 'admin', 'admin_auth_1');
-- INSERT INTO `sys_authorities` VALUES(2, 'admin', 'admin_auth_2');
-- INSERT INTO `sys_authorities` VALUES(3, 'user', 'user_auth_1');
-- INSERT INTO `sys_authorities` VALUES(4, 'user', 'user_auth_2');

INSERT INTO `sys_roles` VALUES(1, 'ROLE_ADMIN');
INSERT INTO `sys_roles` VALUES(2, 'ROLE_USER');

INSERT INTO `sys_role_users` VALUES(1, 1, 'admin');
INSERT INTO `sys_role_users` VALUES(2, 2, 'zhoulin');

INSERT INTO `sys_role_authorities` VALUES(1, 1, 'ROLE_ADMIN_AUTH_1');
INSERT INTO `sys_role_authorities` VALUES(2, 1, 'ROLE_ADMIN_AUTH_2');
INSERT INTO `sys_role_authorities` VALUES(3, 2, 'ROLE_USER_AUTH_1');
INSERT INTO `sys_role_authorities` VALUES(4, 2, 'ROLE_USER_AUTH_2');

INSERT INTO `books` VALUES ('1', 'Java 编程思想(第二版)', '98.50', '2005-01-02 00:00:00');
INSERT INTO `books` VALUES ('2', 'Head First 设计模式', '55.70', '2010-11-09 00:00:00');
INSERT INTO `books` VALUES ('3', '第一行 Android 代码', '69.90', '2015-06-23 00:00:00');
INSERT INTO `books` VALUES ('4', 'C++ 编程思想', '88.50', '2004-01-09 00:00:00');
INSERT INTO `books` VALUES ('5', 'Head First Java', '55.70', '2013-12-17 00:00:00');
INSERT INTO `books` VALUES ('6', '疯狂 Android', '19.50', '2014-07-31 00:00:00');