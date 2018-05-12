# Host: servercenter  (Version: 5.7.14)
# Date: 2017-10-26 17:32:01
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `login_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '登录账号',
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理用户名称',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态：Y-启用，N-禁用',
  `last_login` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_ip` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '上次登录IP地址',
  PRIMARY KEY (`id`,`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','管理员','admin@163.com','2017-10-23 16:36:11',NULL,'Y','2017-10-23 16:36:19','127.0.0.1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

#
# Structure for table "admin_group"
#

DROP TABLE IF EXISTS `admin_group`;
CREATE TABLE `admin_group` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` bigint(32) NOT NULL COMMENT '管理用户ID',
  `group_code` tinyint(8) NOT NULL COMMENT '用户组代码',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Data for table "admin_group"
#

/*!40000 ALTER TABLE `admin_group` DISABLE KEYS */;
INSERT INTO `admin_group` VALUES (2,28,6,'2017-10-26 10:20:12','2017-10-26 10:20:17','Y'),(6,23,1,'2017-10-25 11:33:34','2017-10-25 11:33:37','Y'),(8,24,3,'2017-10-26 10:19:35','2017-10-26 10:19:40','Y'),(10,26,5,'2017-10-25 11:34:42',NULL,'Y'),(11,25,4,'2017-10-26 10:20:00',NULL,'Y'),(12,29,1,'2017-10-26 10:20:34',NULL,'Y'),(13,30,1,'2017-10-26 10:21:26',NULL,'Y');
/*!40000 ALTER TABLE `admin_group` ENABLE KEYS */;

#
# Structure for table "admin_group_privilege"
#

DROP TABLE IF EXISTS `admin_group_privilege`;
CREATE TABLE `admin_group_privilege` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_code` tinyint(8) DEFAULT NULL COMMENT '用户组代码',
  `privilege_code` tinyint(8) DEFAULT NULL COMMENT '权限代码',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态：Y-启用，N-禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

#
# Data for table "admin_group_privilege"
#

/*!40000 ALTER TABLE `admin_group_privilege` DISABLE KEYS */;
INSERT INTO `admin_group_privilege` VALUES (23,1,1,'2017-10-26 09:12:33',NULL,NULL),(24,1,2,'2017-10-26 09:12:33',NULL,NULL),(25,1,3,'2017-10-26 09:12:33',NULL,NULL),(26,1,4,'2017-10-26 09:12:33',NULL,NULL),(27,1,5,'2017-10-26 09:12:33',NULL,NULL),(28,1,6,'2017-10-26 09:12:33',NULL,NULL),(29,1,7,'2017-10-26 09:12:33',NULL,NULL),(30,1,8,'2017-10-26 09:12:33',NULL,NULL),(31,2,1,'2017-10-26 09:32:58',NULL,NULL),(32,2,2,'2017-10-26 09:32:58',NULL,NULL),(33,2,3,'2017-10-26 09:32:58',NULL,NULL),(34,2,4,'2017-10-26 09:32:58',NULL,NULL),(35,2,5,'2017-10-26 09:32:58',NULL,NULL),(36,2,6,'2017-10-26 09:32:58',NULL,NULL),(43,5,4,'2017-10-26 10:22:19',NULL,NULL),(44,5,5,'2017-10-26 10:22:19',NULL,NULL),(45,6,1,'2017-10-26 10:22:39',NULL,NULL),(46,6,2,'2017-10-26 10:22:39',NULL,NULL),(47,6,5,'2017-10-26 10:22:39',NULL,NULL),(48,6,6,'2017-10-26 10:22:39',NULL,NULL),(49,4,1,NULL,'2017-10-26 10:23:30',NULL),(50,4,2,NULL,'2017-10-26 10:23:30',NULL),(51,4,5,NULL,'2017-10-26 10:23:30',NULL),(52,3,1,NULL,'2017-10-26 15:46:36',NULL),(53,3,3,NULL,'2017-10-26 15:46:36',NULL),(54,3,4,NULL,'2017-10-26 15:46:36',NULL),(55,3,5,NULL,'2017-10-26 15:46:36',NULL);
/*!40000 ALTER TABLE `admin_group_privilege` ENABLE KEYS */;

#
# Structure for table "banner"
#

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告名称',
  `image` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '图片地址',
  `link_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '链接地址',
  `type` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '类型：1-电脑端，0-移动端',
  `order` int(32) DEFAULT '1' COMMENT '顺序',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '状态：Y-启用，N-禁用',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='广告横幅表';

#
# Data for table "banner"
#

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'全新政策1','/uploads/banner/20171020/01f0ea7f0cf1a35b64982d72da64b1ee.jpg','https://www.hao123.com/','1',1,'Y','2017-10-20 08:31:54'),(2,'全新政策2','/uploads/banner/20171020/58dcee6164517ae365d5de850a679233.jpg','https://www.hao123.com/','1',2,'Y','2017-10-20 08:32:09'),(3,'全新政策3','/uploads/banner/20171020/ebb2bed520ca60e48adf7ee0ed024489.jpg','http://www.163.com/','1',3,'Y','2017-10-20 08:32:26'),(4,'全新政策4','/uploads/banner/20171020/f1f779ea7ac7f65583fce8ade9c4cb58.jpg','http://www.163.com/','1',4,'Y','2017-10-20 08:32:49'),(5,'全新政策6','/uploads/banner/20171020/746373aea58abcb6c423f83db6a65d3b.jpg','https://www.hao123.com/','1',6,'Y','2017-10-20 08:33:26');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

#
# Structure for table "bespeak"
#

DROP TABLE IF EXISTS `bespeak`;
CREATE TABLE `bespeak` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '信息ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` bigint(11) NOT NULL COMMENT '手机号码',
  `education_code` char(1) DEFAULT NULL COMMENT '学历代码',
  `age` tinyint(3) DEFAULT NULL COMMENT '年龄',
  `insurance` tinyint(2) DEFAULT NULL COMMENT '社保年限',
  `content` longtext COMMENT '内容',
  `comment` varchar(2000) DEFAULT NULL COMMENT '备注',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_overbirth` char(1) DEFAULT 'N' COMMENT '是否超生',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='入户预约表';

#
# Data for table "bespeak"
#

/*!40000 ALTER TABLE `bespeak` DISABLE KEYS */;
INSERT INTO `bespeak` VALUES (1,'无名',13536224916,'2',18,3,NULL,'11111','2017-10-23 09:20:08','N'),(2,'无名1',13536224912,'3',88,15,NULL,'222222222','2017-10-23 09:20:40','N'),(3,'无名3',13536224913,'3',88,15,NULL,NULL,'2017-10-19 10:32:39','N'),(4,'无名4',13536224914,'4',88,3,NULL,NULL,'2017-10-19 10:33:04','N'),(5,'无名5',13536224915,'1',18,3,NULL,NULL,'2017-10-19 10:33:24','N'),(6,'无名6',13536224917,'2',88,3,NULL,NULL,'2017-10-19 10:33:45','N'),(7,'无名8',13536224918,'1',0,15,NULL,NULL,'2017-10-19 10:34:09','N'),(8,'无名9',13536224919,'1',88,15,NULL,NULL,'2017-10-19 10:34:36','N'),(9,'无名11',13756555461,'1',18,3,NULL,NULL,'2017-10-19 10:35:55','N'),(10,'无名12',13756555462,'3',88,15,NULL,NULL,'2017-10-19 10:36:16','N'),(11,'无名13',13756555465,'2',88,55,NULL,NULL,'2017-10-19 10:37:09','N'),(12,'无名',13756555466,'1',28,15,NULL,NULL,'2017-10-19 10:37:48','N'),(13,'无名',13536224910,'1',88,15,NULL,NULL,'2017-10-19 10:39:02','N'),(14,'无名',13536224921,'2',88,15,NULL,NULL,'2017-10-19 10:39:25','N');
/*!40000 ALTER TABLE `bespeak` ENABLE KEYS */;

#
# Structure for table "case"
#

DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '案例ID',
  `name` varchar(200) NOT NULL COMMENT '姓名',
  `native_place` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `education_code` char(1) NOT NULL COMMENT '学历代码',
  `permit_time` date NOT NULL COMMENT '入户时间',
  `permit_code` char(1) NOT NULL COMMENT '入户方式代码',
  `age` tinyint(3) DEFAULT NULL COMMENT '年龄',
  `image` varchar(200) DEFAULT NULL COMMENT '案例图片',
  `url` varchar(200) DEFAULT NULL COMMENT '案例外链地址',
  `content` longtext COMMENT '案例内容',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '优化标题',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '优化关键词',
  `seo_description` varchar(2000) DEFAULT NULL COMMENT '优化描述',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "case"
#

/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'无名1','大连','1','1966-06-05','2',18,'/thumb/cases/b3f2a85c399988efe452a11f3cd0b994.jpg','https://www.hao123.com/','&lt;p&gt;无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名&lt;/p&gt;','无名','无名','无名','2017-10-20 15:22:15','2017-10-20 17:14:33','Y'),(2,'无名','大连','3','1966-06-05','2',88,'/thumb/cases/5b864a1899189a7c2cfb82fa3ebf445e.jpg','https://www.hao123.com/','&lt;p&gt;无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名无名&lt;/p&gt;','无名无名无名无名无名','无名无名无名无名','无名无名无名无名无名无名无名','2017-10-20 15:22:18','2017-10-20 17:14:53','Y'),(4,'无名13','大连','3','1966-06-05','3',88,'/thumb/cases/7adc7113cfc0bdf090869876de7be97e.jpg','https://www.hao123.com/','&lt;p&gt;无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13&lt;/p&gt;','无名13','无名13','无名13','2017-10-20 17:11:24',NULL,'Y'),(5,'无名14','大连','2','1966-06-05','3',18,'/thumb/cases/899823c3a248f2fe08a6c41512cbed42.jpg','https://www.hao123.com/','&lt;p&gt;无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13无名13&lt;/p&gt;','无名13','无名13','无名13','2017-10-20 17:12:09',NULL,'Y'),(6,'无名15','大连','3','1966-06-05','1',3,'/thumb/cases/603d2b4892936acc08ed3942e8daf759.jpg','https://www.hao123.com/','&lt;p&gt;无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15无名15&lt;/p&gt;','无名15','无名15','无名15','2017-10-20 17:12:49',NULL,'Y'),(7,'无名20','大连','3','1966-06-05','1',3,'/thumb/cases/c904195232ffc308866c7945670ee6e1.jpg','http://www.jsjtt.com/webkaifa/PHP/46.html','&lt;p&gt;无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20无名20&lt;/p&gt;','无名20','无名20','无名20','2017-10-20 17:13:37',NULL,'Y');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;

#
# Structure for table "code_account"
#

DROP TABLE IF EXISTS `code_account`;
CREATE TABLE `code_account` (
  `code` char(2) NOT NULL COMMENT '账户类型',
  `label` varchar(100) NOT NULL COMMENT '标签',
  `name` varchar(100) NOT NULL COMMENT '账户类型名称',
  `parent_code` char(2) NOT NULL,
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账号代码表';

#
# Data for table "code_account"
#

/*!40000 ALTER TABLE `code_account` DISABLE KEYS */;
INSERT INTO `code_account` VALUES ('10','insystem','内部账号','10','2017-09-27 15:09:32','2017-09-27 15:09:32','N'),('11','phone','手机','10','2017-09-27 15:09:18','2017-09-27 15:09:18','Y'),('12','account','账号','10','2017-09-27 15:09:20','2017-09-27 15:09:20','Y'),('13','email','邮箱','10','2017-09-27 15:09:23','2017-09-27 15:09:23','Y'),('20','outsystem','第三方账号','20','2017-09-27 15:09:39','2017-09-27 15:09:39','N'),('21','wechat','微信','20','2017-09-27 15:09:25','2017-09-27 15:09:25','Y'),('22','weibo','微博','20','2017-09-27 15:09:27','2017-09-27 15:09:27','Y'),('23','qq','QQ','20','2017-09-27 15:09:30','2017-09-27 15:09:30','Y');
/*!40000 ALTER TABLE `code_account` ENABLE KEYS */;

#
# Structure for table "code_account_copy"
#

DROP TABLE IF EXISTS `code_account_copy`;
CREATE TABLE `code_account_copy` (
  `code` char(2) NOT NULL COMMENT '账户类型',
  `label` varchar(100) NOT NULL COMMENT '标签',
  `name` varchar(100) NOT NULL COMMENT '账户类型名称',
  `parent_code` char(2) NOT NULL,
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账号代码表';

#
# Data for table "code_account_copy"
#

/*!40000 ALTER TABLE `code_account_copy` DISABLE KEYS */;
INSERT INTO `code_account_copy` VALUES ('10','insystem','内部账号','10','2017-09-27 15:09:32','2017-09-27 15:09:32','N'),('11','phone','手机','10','2017-09-27 15:09:18','2017-09-27 15:09:18','Y'),('12','account','账号','10','2017-09-27 15:09:20','2017-09-27 15:09:20','Y'),('13','email','邮箱','10','2017-09-27 15:09:23','2017-09-27 15:09:23','Y'),('20','outsystem','第三方账号','20','2017-09-27 15:09:39','2017-09-27 15:09:39','N'),('21','wechat','微信','20','2017-09-27 15:09:25','2017-09-27 15:09:25','Y'),('22','weibo','微博','20','2017-09-27 15:09:27','2017-09-27 15:09:27','Y'),('23','qq','QQ','20','2017-09-27 15:09:30','2017-09-27 15:09:30','Y');
/*!40000 ALTER TABLE `code_account_copy` ENABLE KEYS */;

#
# Structure for table "code_education"
#

DROP TABLE IF EXISTS `code_education`;
CREATE TABLE `code_education` (
  `code` char(1) CHARACTER SET utf8 NOT NULL COMMENT '代码',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '状态：Y-启用，N-禁用',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='学历代码表';

#
# Data for table "code_education"
#

/*!40000 ALTER TABLE `code_education` DISABLE KEYS */;
INSERT INTO `code_education` VALUES ('1','小学','2017-10-20 09:51:30','2017-10-20 09:51:30','Y'),('2','初中',NULL,NULL,'Y'),('3','中专',NULL,NULL,'Y'),('4','高中',NULL,NULL,'Y'),('5','大专',NULL,NULL,'Y'),('6','本科',NULL,NULL,'Y'),('7','研究生',NULL,NULL,'Y'),('8','博士',NULL,NULL,'Y'),('9','其它',NULL,NULL,'Y');
/*!40000 ALTER TABLE `code_education` ENABLE KEYS */;

#
# Structure for table "code_group"
#

DROP TABLE IF EXISTS `code_group`;
CREATE TABLE `code_group` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '代码',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "code_group"
#

/*!40000 ALTER TABLE `code_group` DISABLE KEYS */;
INSERT INTO `code_group` VALUES (1,'总经理','2017-10-25 11:27:03',NULL,'Y'),(2,'主管','2017-10-25 11:27:19',NULL,'Y'),(3,'组长','2017-10-25 11:27:45',NULL,'Y'),(4,'新闻管理员','2017-10-25 11:28:12',NULL,'Y'),(5,'客户信息管理员','2017-10-25 11:28:30',NULL,'Y'),(6,'系统管理员','2017-10-25 11:28:50',NULL,'Y');
/*!40000 ALTER TABLE `code_group` ENABLE KEYS */;

#
# Structure for table "code_news"
#

DROP TABLE IF EXISTS `code_news`;
CREATE TABLE `code_news` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '代码',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "code_news"
#

/*!40000 ALTER TABLE `code_news` DISABLE KEYS */;
INSERT INTO `code_news` VALUES (1,'公司动态','Y'),(2,'行业资讯','Y'),(3,'最新动态','Y');
/*!40000 ALTER TABLE `code_news` ENABLE KEYS */;

#
# Structure for table "code_permit"
#

DROP TABLE IF EXISTS `code_permit`;
CREATE TABLE `code_permit` (
  `code` char(1) CHARACTER SET utf8 NOT NULL COMMENT '代码',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '状态：Y-启用，N-禁用',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='入户方式代码表';

#
# Data for table "code_permit"
#

/*!40000 ALTER TABLE `code_permit` DISABLE KEYS */;
INSERT INTO `code_permit` VALUES ('1','积分入户','2017-10-20 10:08:07','2017-10-20 10:08:07','Y'),('2','学历入户','2017-10-20 10:08:14','2017-10-20 10:08:14','Y'),('3','技能入户','2017-10-20 10:08:19','2017-10-20 10:08:19','Y'),('4','购房入户','2017-10-20 10:08:26','2017-10-20 10:08:26','Y'),('5','毕业生接收','2017-10-20 10:08:42','2017-10-20 10:08:42','Y'),('9','其它',NULL,NULL,'Y');
/*!40000 ALTER TABLE `code_permit` ENABLE KEYS */;

#
# Structure for table "code_privilege"
#

DROP TABLE IF EXISTS `code_privilege`;
CREATE TABLE `code_privilege` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '代码',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "code_privilege"
#

/*!40000 ALTER TABLE `code_privilege` DISABLE KEYS */;
INSERT INTO `code_privilege` VALUES (1,'新闻权限','2017-10-25 11:31:16',NULL,'Y'),(2,'轮播图权限','2017-10-25 11:31:35',NULL,'Y'),(3,'预约信息权限','2017-10-25 11:31:49',NULL,'Y'),(4,'测评信息权限','2017-10-25 11:32:08',NULL,'Y'),(5,'成功案列权限','2017-10-25 17:47:58','2017-10-25 17:48:01','Y'),(6,'关于我们权限','2017-10-25 11:32:34',NULL,'Y'),(7,'用户管理权限','2017-10-25 11:32:48',NULL,'Y'),(8,'权限管理权限','2017-10-25 11:33:02',NULL,'Y');
/*!40000 ALTER TABLE `code_privilege` ENABLE KEYS */;

#
# Structure for table "config"
#

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `key` varchar(64) NOT NULL COMMENT '键',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `value` varchar(2000) DEFAULT NULL COMMENT '值',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "config"
#

/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('address','地址','XX市XX区XX路XX号XX室','Y'),('copyright','版本信息','XXXX版权所有','Y'),('email','邮箱','domain@domain.com','Y'),('fax','传真','020-XXXXXXXX','Y'),('icp','备案号','粤ICPXXX','Y'),('phone','手机','13800138000','Y'),('qq','QQ号','888888888','Y'),('site_closed','站点关闭','0','Y'),('site_description','站点描述','ThinkCMS','Y'),('site_keyword','站点关键词','微信小程序|微信公众号','Y'),('site_logo','站点LOGO','logo.png','Y'),('site_name','站点名称','ThinkCMS','Y'),('site_rewrite','站点重写','0','Y'),('site_route','站点路由','0','Y'),('site_title','站点标题','XX有限公司','Y'),('tel','电话','020-00000001','Y'),('wechart','微信公众号','xxxxxxxxxxxx','Y');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

#
# Structure for table "estimate"
#

DROP TABLE IF EXISTS `estimate`;
CREATE TABLE `estimate` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '信息ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` bigint(11) NOT NULL COMMENT '手机号码',
  `education_code` char(1) DEFAULT NULL COMMENT '学历代码',
  `age` tinyint(3) DEFAULT NULL COMMENT '年龄',
  `insurance` tinyint(2) DEFAULT NULL COMMENT '社保年限',
  `comment` varchar(2000) DEFAULT NULL COMMENT '备注',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_property` char(1) DEFAULT 'N' COMMENT '是否有房产',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='入户测评表';

#
# Data for table "estimate"
#

/*!40000 ALTER TABLE `estimate` DISABLE KEYS */;
INSERT INTO `estimate` VALUES (1,'无名',13536224911,'4',2,3,NULL,'2017-10-19 14:13:48','Y'),(2,'无名2',13536224912,'2',2,15,NULL,'2017-10-19 14:13:54','Y'),(3,'无名3',13536224913,'4',3,5,NULL,'2017-10-19 14:21:00','Y'),(4,'无名4',13536224914,'4',3,4,NULL,'2017-10-19 14:19:01','N'),(5,'无名5',13536224915,'3',4,5,NULL,'2017-10-19 14:20:44','Y'),(6,'无名7',13536224917,'2',1,7,NULL,'2017-10-19 14:22:43','Y'),(7,'无名8',13536224918,'1',4,8,NULL,'2017-10-19 14:23:02','N'),(8,'无名9',13536224919,'1',3,8,NULL,'2017-10-19 14:23:26','N'),(9,'无名11',13756555461,'1',1,1,NULL,'2017-10-19 14:24:05','Y'),(10,'无名12',13756555462,'1',1,2,NULL,'2017-10-19 14:24:30','Y'),(11,'无名13',13756555463,'1',1,5,NULL,'2017-10-19 14:25:06','Y'),(12,'无名13',13756555466,'2',1,6,NULL,'2017-10-19 14:25:47','Y'),(14,'无名',13536221111,'1',1,4,NULL,'2017-10-20 09:18:52','Y'),(15,'刘备',13539441864,'3',1,1,NULL,'2017-10-20 09:25:30','Y');
/*!40000 ALTER TABLE `estimate` ENABLE KEYS */;

#
# Structure for table "link"
#

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `logo` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(64) NOT NULL COMMENT '网址',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "link"
#

/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'360','upload/360.png','www.360.cn','360公司','1','2017-10-12 17:42:58','2017-10-12 17:42:58'),(2,'网易','sss','www.163.com','网易科技','1','2017-09-26 16:44:17','2017-09-26 16:44:17'),(3,'百度',NULL,'www.baidu.com','百度','1','2017-09-26 16:44:12','2017-09-26 16:44:12');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;

#
# Structure for table "module"
#

DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `code` varchar(64) NOT NULL COMMENT '模块代码',
  `name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "module"
#

/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'index','首页','2017-09-26 16:32:05','2017-09-26 16:32:05','1'),(2,'product','产品列表','2017-09-26 16:40:15','2017-09-26 16:40:15','1'),(3,'product_detail','产品内容','2017-09-26 16:35:42','2017-09-26 16:35:42','1'),(4,'case','案例列表','2017-09-26 16:35:45','2017-09-26 16:35:45','1'),(5,'case_detail','案例内容','2017-09-26 16:35:49','2017-09-26 16:35:49','1'),(6,'news','新闻列表','2017-09-26 16:37:21','2017-09-26 16:37:24','1'),(7,'news_detail','新闻内容','2017-09-26 16:37:57','2017-09-26 16:38:02','1'),(8,'message','在线留言','2017-09-26 16:38:32','2017-09-26 16:38:35','1'),(9,'about','关于我们','2017-09-26 16:39:03','2017-09-26 16:39:08','1'),(10,'login','用户登录','2017-09-26 16:40:36','2017-09-26 16:40:40','1');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;

#
# Structure for table "nav"
#

DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `name` varchar(50) NOT NULL COMMENT '导航名称',
  `module_id` tinyint(8) NOT NULL COMMENT '模块ID',
  `parent_id` tinyint(8) NOT NULL COMMENT '父级ID',
  `type` char(1) NOT NULL COMMENT '类型',
  `order` tinyint(8) DEFAULT NULL COMMENT '次序',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "nav"
#

/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,'广州入户新政公告',0,0,'1',NULL,'2017-10-17 14:30:26',NULL,'Y'),(2,'导航名测试1',0,0,'1',NULL,'2017-10-17 15:18:12','2017-10-17 15:18:12','Y'),(3,'导航名测试2',0,0,'3',NULL,'2017-10-18 17:09:41','2017-10-18 17:09:41','Y');
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;

#
# Structure for table "nav_table"
#

DROP TABLE IF EXISTS `nav_table`;
CREATE TABLE `nav_table` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '导航关系ID',
  `nav_id` tinyint(8) NOT NULL COMMENT '导航ID',
  `table_id` int(32) NOT NULL COMMENT '表ID',
  `table_code` tinyint(8) NOT NULL COMMENT '表代码',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "nav_table"
#

/*!40000 ALTER TABLE `nav_table` DISABLE KEYS */;
INSERT INTO `nav_table` VALUES (2,1,2,1,'2017-10-17 14:33:10',NULL,'Y'),(5,1,4,1,'2017-10-17 14:49:54','2017-10-17 14:49:54','Y'),(6,2,4,1,'2017-10-17 14:49:54','2017-10-17 14:49:54','Y'),(7,1,3,1,'2017-10-17 14:50:37','2017-10-17 14:50:37','Y'),(8,3,3,1,'2017-10-17 14:50:37','2017-10-17 14:50:37','Y'),(9,1,1,1,'2017-10-17 17:17:16','2017-10-17 17:17:16','Y');
/*!40000 ALTER TABLE `nav_table` ENABLE KEYS */;

#
# Structure for table "news"
#

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `author` varchar(30) NOT NULL COMMENT '作者',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `content` longtext COMMENT '内容',
  `click` int(32) DEFAULT NULL COMMENT '点击量',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '优化标题',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '优化关键词',
  `seo_description` varchar(200) DEFAULT NULL COMMENT '优化描述',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  `is_prior` char(1) NOT NULL DEFAULT 'N' COMMENT '是否置顶',
  `is_notice` char(1) NOT NULL DEFAULT 'N' COMMENT '是否公告: Y-是，N-否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "news"
#

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'入户广州的政策条件','adsa','/thumb/news/e67d080b178f7336168b41558ceada11.jpg','<p>入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件入户广州的政策条件</p>',NULL,'入户广州的政策条件','入户广州的政策条件','入户广州的政策条件','2017-10-23 08:37:39','2017-10-23 08:37:39','Y','Y','Y'),(3,'入户广州的好处与优势','jlkl','/thumb/news/8053d596fe114b0f894285da53bcc253.jpg','<p>入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势入户广州的好处与优势</p>',NULL,'入户广州的好处与优势','入户广州的好处与优势','入户广州的好处与优势','2017-10-18 16:42:04','2017-10-20 08:47:51','Y','Y','Y'),(4,'入户的流程','入户的流程','/thumb/news/e79d7088092be38cb4e321d1eb6b2b28.jpg','&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;/ueditor/php/upload/image/20171020/1508462053705807.png&quot; title=&quot;1508462053705807.png&quot; alt=&quot;image.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程入户的流程&lt;/p&gt;',NULL,'入户的流程','入户的流程','入户的流程','2017-10-18 18:06:32','2017-10-20 09:14:59','Y','Y','Y'),(5,'中共十八大召开','毛为民','/thumb/news/4b4cf12f3a6765555ae49e9f2a05be04.jpg','&lt;p&gt;中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开中共十八大召开&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20171020/1508461802117261.png&quot; title=&quot;1508461802117261.png&quot; alt=&quot;image.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开十八大召开中共十八大召开&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'中共十八大召开','中共十八大召开','中共十八大召开','2017-10-20 09:10:23',NULL,'Y','Y','Y');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(200) NOT NULL COMMENT '产品名称',
  `image` varchar(200) DEFAULT NULL COMMENT '产品图片',
  `price` decimal(20,2) DEFAULT NULL COMMENT '产品价格',
  `content` longtext COMMENT '产品内容',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '优化标题',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '优化关键词',
  `seo_description` varchar(2000) DEFAULT NULL COMMENT '优化描述',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "product"
#

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'111111','/thumb/goods/7c5caadf27b594caffd867545449bf65.jpg',11.11,'111111111111111111','1111111111111','111111111111111','111111111111111111','2017-10-10 15:31:53','2017-10-10 15:31:53','Y'),(3,'222','/thumb/goods/7cd3b25306a3c8e84d89f1ee1a4bee36.jpg',2.11,'222222222222222222','222222222222','222222222222','22222222222222','2017-10-10 15:34:19','2017-10-10 15:39:54','N'),(4,'333','/thumb/goods/0e51a9819717d620af8949731fe7e16a.jpg',3.33,'3333333333333','33333333333333','33333333333','33333333333333333','2017-10-10 15:27:35','2017-10-10 15:27:35','Y'),(6,'4444','/thumb/goods/278f155907b9aa233b995fafb5412077.jpg',4.44,'4444444444','444444444','4444444444','444444444','2017-10-10 15:28:38','2017-10-10 15:28:38','Y'),(7,'555555','/thumb/goods/31a1f19f073711c280fb37b271ab9b3a.jpg',5.00,'55555555555','5555555555','5555555555','555555555','2017-10-09 17:38:30','2017-10-09 17:38:28','Y'),(8,'666','/thumb/goods/0fee02d95529b0712b3ed27bea5cb46d.jpg',6.00,'6666666666','666666','666666','6666666','2017-10-10 08:39:23',NULL,'Y'),(9,'77777','/thumb/goods/2bab53400e0dd773b13b9b1a357b8150.jpg',7.88,'777777777','77777','777777','777777','2017-10-10 15:40:22','2017-10-10 15:54:11','Y'),(10,'88888','/thumb/goods/de3cdcef97b873fd9a358c0f917a3c1b.jpg',8.44,'88888888','8888888','8888888','8888888','2017-10-10 15:47:37','2017-10-10 15:53:47','Y'),(11,'999','/thumb/goods/f4b94e57dc571467f7379f522425cf69.jpg',9.00,'9999','9999','9999','9999','2017-10-10 08:40:34',NULL,'Y'),(12,'2122','/thumb/goods/9bb857a5310ece931b459b9fbc12afe4.jpg',22.00,'232323','2323232','232323','232323','2017-10-10 08:41:15',NULL,'Y'),(13,'adfs','/thumb/goods/18ca59e689663ffcc991b5fcda4af3f5.jpg',2.00,'sfsfsfsfsfsf','wewewfwewf','wewewfwewf','wewewfwewf','2017-10-10 10:32:31',NULL,'Y'),(14,'苹果','/thumb/goods/746beb531bd5b83fc9bf5dbc6ed5aca4.jpg',11.00,'','','','','2017-10-10 14:21:35',NULL,'Y'),(15,'香蕉','/thumb/goods/50f40a104603854bb563a7adaa8e2eb8.jpg',12.33,'1111111111','1111','1111','11111','2017-10-10 15:18:37',NULL,'Y');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `avator` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态：启用/禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

#
# Structure for table "user_account"
#

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `account_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_name` varchar(32) DEFAULT NULL COMMENT '账户名称',
  `user_id` int(32) DEFAULT NULL COMMENT '用户ID',
  `credential` char(32) NOT NULL COMMENT '密码凭证',
  `account_code` char(2) DEFAULT NULL COMMENT '账户类型',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` char(1) NOT NULL COMMENT '状态：启用/禁用',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# Data for table "user_account"
#

/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (23,'admin',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:43:41',NULL,'Y'),(24,'admin1',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:46:13',NULL,'Y'),(25,'admin2',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:46:29',NULL,'Y'),(26,'admin3',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-24 10:33:38','2017-10-24 10:33:38','Y'),(28,'admin6',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 11:10:21','2017-10-26 11:10:21','Y'),(29,'adminjk',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 11:10:27','2017-10-26 11:10:27','Y'),(30,'back',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 10:21:17',NULL,'Y'),(31,'测试用户1',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 17:27:30',NULL,'Y');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
