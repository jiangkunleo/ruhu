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
  `login_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '��¼�˺�',
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '����',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '�����û�����',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '����',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '״̬��Y-���ã�N-����',
  `last_login` timestamp NULL DEFAULT NULL COMMENT '�ϴε�¼ʱ��',
  `last_ip` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '�ϴε�¼IP��ַ',
  PRIMARY KEY (`id`,`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','����Ա','admin@163.com','2017-10-23 16:36:11',NULL,'Y','2017-10-23 16:36:19','127.0.0.1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

#
# Structure for table "admin_group"
#

DROP TABLE IF EXISTS `admin_group`;
CREATE TABLE `admin_group` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` bigint(32) NOT NULL COMMENT '�����û�ID',
  `group_code` tinyint(8) NOT NULL COMMENT '�û������',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '״̬',
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
  `group_code` tinyint(8) DEFAULT NULL COMMENT '�û������',
  `privilege_code` tinyint(8) DEFAULT NULL COMMENT 'Ȩ�޴���',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '״̬��Y-���ã�N-����',
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
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '�������',
  `image` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'ͼƬ��ַ',
  `link_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '���ӵ�ַ',
  `type` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '���ͣ�1-���Զˣ�0-�ƶ���',
  `order` int(32) DEFAULT '1' COMMENT '˳��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '״̬��Y-���ã�N-����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='�������';

#
# Data for table "banner"
#

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'ȫ������1','/uploads/banner/20171020/01f0ea7f0cf1a35b64982d72da64b1ee.jpg','https://www.hao123.com/','1',1,'Y','2017-10-20 08:31:54'),(2,'ȫ������2','/uploads/banner/20171020/58dcee6164517ae365d5de850a679233.jpg','https://www.hao123.com/','1',2,'Y','2017-10-20 08:32:09'),(3,'ȫ������3','/uploads/banner/20171020/ebb2bed520ca60e48adf7ee0ed024489.jpg','http://www.163.com/','1',3,'Y','2017-10-20 08:32:26'),(4,'ȫ������4','/uploads/banner/20171020/f1f779ea7ac7f65583fce8ade9c4cb58.jpg','http://www.163.com/','1',4,'Y','2017-10-20 08:32:49'),(5,'ȫ������6','/uploads/banner/20171020/746373aea58abcb6c423f83db6a65d3b.jpg','https://www.hao123.com/','1',6,'Y','2017-10-20 08:33:26');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

#
# Structure for table "bespeak"
#

DROP TABLE IF EXISTS `bespeak`;
CREATE TABLE `bespeak` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '��ϢID',
  `name` varchar(50) DEFAULT NULL COMMENT '����',
  `phone` bigint(11) NOT NULL COMMENT '�ֻ�����',
  `education_code` char(1) DEFAULT NULL COMMENT 'ѧ������',
  `age` tinyint(3) DEFAULT NULL COMMENT '����',
  `insurance` tinyint(2) DEFAULT NULL COMMENT '�籣����',
  `content` longtext COMMENT '����',
  `comment` varchar(2000) DEFAULT NULL COMMENT '��ע',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `is_overbirth` char(1) DEFAULT 'N' COMMENT '�Ƿ���',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='�뻧ԤԼ��';

#
# Data for table "bespeak"
#

/*!40000 ALTER TABLE `bespeak` DISABLE KEYS */;
INSERT INTO `bespeak` VALUES (1,'����',13536224916,'2',18,3,NULL,'11111','2017-10-23 09:20:08','N'),(2,'����1',13536224912,'3',88,15,NULL,'222222222','2017-10-23 09:20:40','N'),(3,'����3',13536224913,'3',88,15,NULL,NULL,'2017-10-19 10:32:39','N'),(4,'����4',13536224914,'4',88,3,NULL,NULL,'2017-10-19 10:33:04','N'),(5,'����5',13536224915,'1',18,3,NULL,NULL,'2017-10-19 10:33:24','N'),(6,'����6',13536224917,'2',88,3,NULL,NULL,'2017-10-19 10:33:45','N'),(7,'����8',13536224918,'1',0,15,NULL,NULL,'2017-10-19 10:34:09','N'),(8,'����9',13536224919,'1',88,15,NULL,NULL,'2017-10-19 10:34:36','N'),(9,'����11',13756555461,'1',18,3,NULL,NULL,'2017-10-19 10:35:55','N'),(10,'����12',13756555462,'3',88,15,NULL,NULL,'2017-10-19 10:36:16','N'),(11,'����13',13756555465,'2',88,55,NULL,NULL,'2017-10-19 10:37:09','N'),(12,'����',13756555466,'1',28,15,NULL,NULL,'2017-10-19 10:37:48','N'),(13,'����',13536224910,'1',88,15,NULL,NULL,'2017-10-19 10:39:02','N'),(14,'����',13536224921,'2',88,15,NULL,NULL,'2017-10-19 10:39:25','N');
/*!40000 ALTER TABLE `bespeak` ENABLE KEYS */;

#
# Structure for table "case"
#

DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(200) NOT NULL COMMENT '����',
  `native_place` varchar(100) DEFAULT NULL COMMENT '����',
  `education_code` char(1) NOT NULL COMMENT 'ѧ������',
  `permit_time` date NOT NULL COMMENT '�뻧ʱ��',
  `permit_code` char(1) NOT NULL COMMENT '�뻧��ʽ����',
  `age` tinyint(3) DEFAULT NULL COMMENT '����',
  `image` varchar(200) DEFAULT NULL COMMENT '����ͼƬ',
  `url` varchar(200) DEFAULT NULL COMMENT '����������ַ',
  `content` longtext COMMENT '��������',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '�Ż�����',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '�Ż��ؼ���',
  `seo_description` varchar(2000) DEFAULT NULL COMMENT '�Ż�����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "case"
#

/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'����1','����','1','1966-06-05','2',18,'/thumb/cases/b3f2a85c399988efe452a11f3cd0b994.jpg','https://www.hao123.com/','&lt;p&gt;����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������&lt;/p&gt;','����','����','����','2017-10-20 15:22:15','2017-10-20 17:14:33','Y'),(2,'����','����','3','1966-06-05','2',88,'/thumb/cases/5b864a1899189a7c2cfb82fa3ebf445e.jpg','https://www.hao123.com/','&lt;p&gt;����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������&lt;/p&gt;','��������������������','����������������','����������������������������','2017-10-20 15:22:18','2017-10-20 17:14:53','Y'),(4,'����13','����','3','1966-06-05','3',88,'/thumb/cases/7adc7113cfc0bdf090869876de7be97e.jpg','https://www.hao123.com/','&lt;p&gt;����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13&lt;/p&gt;','����13','����13','����13','2017-10-20 17:11:24',NULL,'Y'),(5,'����14','����','2','1966-06-05','3',18,'/thumb/cases/899823c3a248f2fe08a6c41512cbed42.jpg','https://www.hao123.com/','&lt;p&gt;����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13����13&lt;/p&gt;','����13','����13','����13','2017-10-20 17:12:09',NULL,'Y'),(6,'����15','����','3','1966-06-05','1',3,'/thumb/cases/603d2b4892936acc08ed3942e8daf759.jpg','https://www.hao123.com/','&lt;p&gt;����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15����15&lt;/p&gt;','����15','����15','����15','2017-10-20 17:12:49',NULL,'Y'),(7,'����20','����','3','1966-06-05','1',3,'/thumb/cases/c904195232ffc308866c7945670ee6e1.jpg','http://www.jsjtt.com/webkaifa/PHP/46.html','&lt;p&gt;����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20����20&lt;/p&gt;','����20','����20','����20','2017-10-20 17:13:37',NULL,'Y');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;

#
# Structure for table "code_account"
#

DROP TABLE IF EXISTS `code_account`;
CREATE TABLE `code_account` (
  `code` char(2) NOT NULL COMMENT '�˻�����',
  `label` varchar(100) NOT NULL COMMENT '��ǩ',
  `name` varchar(100) NOT NULL COMMENT '�˻���������',
  `parent_code` char(2) NOT NULL,
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '����ʱ��',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�˺Ŵ����';

#
# Data for table "code_account"
#

/*!40000 ALTER TABLE `code_account` DISABLE KEYS */;
INSERT INTO `code_account` VALUES ('10','insystem','�ڲ��˺�','10','2017-09-27 15:09:32','2017-09-27 15:09:32','N'),('11','phone','�ֻ�','10','2017-09-27 15:09:18','2017-09-27 15:09:18','Y'),('12','account','�˺�','10','2017-09-27 15:09:20','2017-09-27 15:09:20','Y'),('13','email','����','10','2017-09-27 15:09:23','2017-09-27 15:09:23','Y'),('20','outsystem','�������˺�','20','2017-09-27 15:09:39','2017-09-27 15:09:39','N'),('21','wechat','΢��','20','2017-09-27 15:09:25','2017-09-27 15:09:25','Y'),('22','weibo','΢��','20','2017-09-27 15:09:27','2017-09-27 15:09:27','Y'),('23','qq','QQ','20','2017-09-27 15:09:30','2017-09-27 15:09:30','Y');
/*!40000 ALTER TABLE `code_account` ENABLE KEYS */;

#
# Structure for table "code_account_copy"
#

DROP TABLE IF EXISTS `code_account_copy`;
CREATE TABLE `code_account_copy` (
  `code` char(2) NOT NULL COMMENT '�˻�����',
  `label` varchar(100) NOT NULL COMMENT '��ǩ',
  `name` varchar(100) NOT NULL COMMENT '�˻���������',
  `parent_code` char(2) NOT NULL,
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '����ʱ��',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='�˺Ŵ����';

#
# Data for table "code_account_copy"
#

/*!40000 ALTER TABLE `code_account_copy` DISABLE KEYS */;
INSERT INTO `code_account_copy` VALUES ('10','insystem','�ڲ��˺�','10','2017-09-27 15:09:32','2017-09-27 15:09:32','N'),('11','phone','�ֻ�','10','2017-09-27 15:09:18','2017-09-27 15:09:18','Y'),('12','account','�˺�','10','2017-09-27 15:09:20','2017-09-27 15:09:20','Y'),('13','email','����','10','2017-09-27 15:09:23','2017-09-27 15:09:23','Y'),('20','outsystem','�������˺�','20','2017-09-27 15:09:39','2017-09-27 15:09:39','N'),('21','wechat','΢��','20','2017-09-27 15:09:25','2017-09-27 15:09:25','Y'),('22','weibo','΢��','20','2017-09-27 15:09:27','2017-09-27 15:09:27','Y'),('23','qq','QQ','20','2017-09-27 15:09:30','2017-09-27 15:09:30','Y');
/*!40000 ALTER TABLE `code_account_copy` ENABLE KEYS */;

#
# Structure for table "code_education"
#

DROP TABLE IF EXISTS `code_education`;
CREATE TABLE `code_education` (
  `code` char(1) CHARACTER SET utf8 NOT NULL COMMENT '����',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '����',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '״̬��Y-���ã�N-����',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ѧ�������';

#
# Data for table "code_education"
#

/*!40000 ALTER TABLE `code_education` DISABLE KEYS */;
INSERT INTO `code_education` VALUES ('1','Сѧ','2017-10-20 09:51:30','2017-10-20 09:51:30','Y'),('2','����',NULL,NULL,'Y'),('3','��ר',NULL,NULL,'Y'),('4','����',NULL,NULL,'Y'),('5','��ר',NULL,NULL,'Y'),('6','����',NULL,NULL,'Y'),('7','�о���',NULL,NULL,'Y'),('8','��ʿ',NULL,NULL,'Y'),('9','����',NULL,NULL,'Y');
/*!40000 ALTER TABLE `code_education` ENABLE KEYS */;

#
# Structure for table "code_group"
#

DROP TABLE IF EXISTS `code_group`;
CREATE TABLE `code_group` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '����',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '״̬',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "code_group"
#

/*!40000 ALTER TABLE `code_group` DISABLE KEYS */;
INSERT INTO `code_group` VALUES (1,'�ܾ���','2017-10-25 11:27:03',NULL,'Y'),(2,'����','2017-10-25 11:27:19',NULL,'Y'),(3,'�鳤','2017-10-25 11:27:45',NULL,'Y'),(4,'���Ź���Ա','2017-10-25 11:28:12',NULL,'Y'),(5,'�ͻ���Ϣ����Ա','2017-10-25 11:28:30',NULL,'Y'),(6,'ϵͳ����Ա','2017-10-25 11:28:50',NULL,'Y');
/*!40000 ALTER TABLE `code_group` ENABLE KEYS */;

#
# Structure for table "code_news"
#

DROP TABLE IF EXISTS `code_news`;
CREATE TABLE `code_news` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(100) NOT NULL COMMENT '����',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '�Ƿ���Ч',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "code_news"
#

/*!40000 ALTER TABLE `code_news` DISABLE KEYS */;
INSERT INTO `code_news` VALUES (1,'��˾��̬','Y'),(2,'��ҵ��Ѷ','Y'),(3,'���¶�̬','Y');
/*!40000 ALTER TABLE `code_news` ENABLE KEYS */;

#
# Structure for table "code_permit"
#

DROP TABLE IF EXISTS `code_permit`;
CREATE TABLE `code_permit` (
  `code` char(1) CHARACTER SET utf8 NOT NULL COMMENT '����',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '����',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT 'Y' COMMENT '״̬��Y-���ã�N-����',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='�뻧��ʽ�����';

#
# Data for table "code_permit"
#

/*!40000 ALTER TABLE `code_permit` DISABLE KEYS */;
INSERT INTO `code_permit` VALUES ('1','�����뻧','2017-10-20 10:08:07','2017-10-20 10:08:07','Y'),('2','ѧ���뻧','2017-10-20 10:08:14','2017-10-20 10:08:14','Y'),('3','�����뻧','2017-10-20 10:08:19','2017-10-20 10:08:19','Y'),('4','�����뻧','2017-10-20 10:08:26','2017-10-20 10:08:26','Y'),('5','��ҵ������','2017-10-20 10:08:42','2017-10-20 10:08:42','Y'),('9','����',NULL,NULL,'Y');
/*!40000 ALTER TABLE `code_permit` ENABLE KEYS */;

#
# Structure for table "code_privilege"
#

DROP TABLE IF EXISTS `code_privilege`;
CREATE TABLE `code_privilege` (
  `code` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '����',
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '״̬',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "code_privilege"
#

/*!40000 ALTER TABLE `code_privilege` DISABLE KEYS */;
INSERT INTO `code_privilege` VALUES (1,'����Ȩ��','2017-10-25 11:31:16',NULL,'Y'),(2,'�ֲ�ͼȨ��','2017-10-25 11:31:35',NULL,'Y'),(3,'ԤԼ��ϢȨ��','2017-10-25 11:31:49',NULL,'Y'),(4,'������ϢȨ��','2017-10-25 11:32:08',NULL,'Y'),(5,'�ɹ�����Ȩ��','2017-10-25 17:47:58','2017-10-25 17:48:01','Y'),(6,'��������Ȩ��','2017-10-25 11:32:34',NULL,'Y'),(7,'�û�����Ȩ��','2017-10-25 11:32:48',NULL,'Y'),(8,'Ȩ�޹���Ȩ��','2017-10-25 11:33:02',NULL,'Y');
/*!40000 ALTER TABLE `code_privilege` ENABLE KEYS */;

#
# Structure for table "config"
#

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `key` varchar(64) NOT NULL COMMENT '��',
  `name` varchar(64) NOT NULL COMMENT '����',
  `value` varchar(2000) DEFAULT NULL COMMENT 'ֵ',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '�Ƿ���Ч',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "config"
#

/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('address','��ַ','XX��XX��XX·XX��XX��','Y'),('copyright','�汾��Ϣ','XXXX��Ȩ����','Y'),('email','����','domain@domain.com','Y'),('fax','����','020-XXXXXXXX','Y'),('icp','������','��ICPXXX','Y'),('phone','�ֻ�','13800138000','Y'),('qq','QQ��','888888888','Y'),('site_closed','վ��ر�','0','Y'),('site_description','վ������','ThinkCMS','Y'),('site_keyword','վ��ؼ���','΢��С����|΢�Ź��ں�','Y'),('site_logo','վ��LOGO','logo.png','Y'),('site_name','վ������','ThinkCMS','Y'),('site_rewrite','վ����д','0','Y'),('site_route','վ��·��','0','Y'),('site_title','վ�����','XX���޹�˾','Y'),('tel','�绰','020-00000001','Y'),('wechart','΢�Ź��ں�','xxxxxxxxxxxx','Y');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

#
# Structure for table "estimate"
#

DROP TABLE IF EXISTS `estimate`;
CREATE TABLE `estimate` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '��ϢID',
  `name` varchar(50) DEFAULT NULL COMMENT '����',
  `phone` bigint(11) NOT NULL COMMENT '�ֻ�����',
  `education_code` char(1) DEFAULT NULL COMMENT 'ѧ������',
  `age` tinyint(3) DEFAULT NULL COMMENT '����',
  `insurance` tinyint(2) DEFAULT NULL COMMENT '�籣����',
  `comment` varchar(2000) DEFAULT NULL COMMENT '��ע',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `is_property` char(1) DEFAULT 'N' COMMENT '�Ƿ��з���',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='�뻧������';

#
# Data for table "estimate"
#

/*!40000 ALTER TABLE `estimate` DISABLE KEYS */;
INSERT INTO `estimate` VALUES (1,'����',13536224911,'4',2,3,NULL,'2017-10-19 14:13:48','Y'),(2,'����2',13536224912,'2',2,15,NULL,'2017-10-19 14:13:54','Y'),(3,'����3',13536224913,'4',3,5,NULL,'2017-10-19 14:21:00','Y'),(4,'����4',13536224914,'4',3,4,NULL,'2017-10-19 14:19:01','N'),(5,'����5',13536224915,'3',4,5,NULL,'2017-10-19 14:20:44','Y'),(6,'����7',13536224917,'2',1,7,NULL,'2017-10-19 14:22:43','Y'),(7,'����8',13536224918,'1',4,8,NULL,'2017-10-19 14:23:02','N'),(8,'����9',13536224919,'1',3,8,NULL,'2017-10-19 14:23:26','N'),(9,'����11',13756555461,'1',1,1,NULL,'2017-10-19 14:24:05','Y'),(10,'����12',13756555462,'1',1,2,NULL,'2017-10-19 14:24:30','Y'),(11,'����13',13756555463,'1',1,5,NULL,'2017-10-19 14:25:06','Y'),(12,'����13',13756555466,'2',1,6,NULL,'2017-10-19 14:25:47','Y'),(14,'����',13536221111,'1',1,4,NULL,'2017-10-20 09:18:52','Y'),(15,'����',13539441864,'3',1,1,NULL,'2017-10-20 09:25:30','Y');
/*!40000 ALTER TABLE `estimate` ENABLE KEYS */;

#
# Structure for table "link"
#

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(32) NOT NULL COMMENT '����',
  `logo` varchar(64) DEFAULT NULL COMMENT 'ͼƬ��ַ',
  `url` varchar(64) NOT NULL COMMENT '��ַ',
  `description` varchar(200) DEFAULT NULL COMMENT '����',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "link"
#

/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'360','upload/360.png','www.360.cn','360��˾','1','2017-10-12 17:42:58','2017-10-12 17:42:58'),(2,'����','sss','www.163.com','���׿Ƽ�','1','2017-09-26 16:44:17','2017-09-26 16:44:17'),(3,'�ٶ�',NULL,'www.baidu.com','�ٶ�','1','2017-09-26 16:44:12','2017-09-26 16:44:12');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;

#
# Structure for table "module"
#

DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT 'ģ��ID',
  `code` varchar(64) NOT NULL COMMENT 'ģ�����',
  `name` varchar(64) DEFAULT NULL COMMENT 'ģ������',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "module"
#

/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'index','��ҳ','2017-09-26 16:32:05','2017-09-26 16:32:05','1'),(2,'product','��Ʒ�б�','2017-09-26 16:40:15','2017-09-26 16:40:15','1'),(3,'product_detail','��Ʒ����','2017-09-26 16:35:42','2017-09-26 16:35:42','1'),(4,'case','�����б�','2017-09-26 16:35:45','2017-09-26 16:35:45','1'),(5,'case_detail','��������','2017-09-26 16:35:49','2017-09-26 16:35:49','1'),(6,'news','�����б�','2017-09-26 16:37:21','2017-09-26 16:37:24','1'),(7,'news_detail','��������','2017-09-26 16:37:57','2017-09-26 16:38:02','1'),(8,'message','��������','2017-09-26 16:38:32','2017-09-26 16:38:35','1'),(9,'about','��������','2017-09-26 16:39:03','2017-09-26 16:39:08','1'),(10,'login','�û���¼','2017-09-26 16:40:36','2017-09-26 16:40:40','1');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;

#
# Structure for table "nav"
#

DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(50) NOT NULL COMMENT '��������',
  `module_id` tinyint(8) NOT NULL COMMENT 'ģ��ID',
  `parent_id` tinyint(8) NOT NULL COMMENT '����ID',
  `type` char(1) NOT NULL COMMENT '����',
  `order` tinyint(8) DEFAULT NULL COMMENT '����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "nav"
#

/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,'�����뻧��������',0,0,'1',NULL,'2017-10-17 14:30:26',NULL,'Y'),(2,'����������1',0,0,'1',NULL,'2017-10-17 15:18:12','2017-10-17 15:18:12','Y'),(3,'����������2',0,0,'3',NULL,'2017-10-18 17:09:41','2017-10-18 17:09:41','Y');
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;

#
# Structure for table "nav_table"
#

DROP TABLE IF EXISTS `nav_table`;
CREATE TABLE `nav_table` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '������ϵID',
  `nav_id` tinyint(8) NOT NULL COMMENT '����ID',
  `table_id` int(32) NOT NULL COMMENT '��ID',
  `table_code` tinyint(8) NOT NULL COMMENT '�����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
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
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `title` varchar(200) NOT NULL COMMENT '����',
  `author` varchar(30) NOT NULL COMMENT '����',
  `image` varchar(100) DEFAULT NULL COMMENT 'ͼƬ',
  `content` longtext COMMENT '����',
  `click` int(32) DEFAULT NULL COMMENT '�����',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '�Ż�����',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '�Ż��ؼ���',
  `seo_description` varchar(200) DEFAULT NULL COMMENT '�Ż�����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
  `is_prior` char(1) NOT NULL DEFAULT 'N' COMMENT '�Ƿ��ö�',
  `is_notice` char(1) NOT NULL DEFAULT 'N' COMMENT '�Ƿ񹫸�: Y-�ǣ�N-��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "news"
#

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'�뻧���ݵ���������','adsa','/thumb/news/e67d080b178f7336168b41558ceada11.jpg','<p>�뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ����������뻧���ݵ���������</p>',NULL,'�뻧���ݵ���������','�뻧���ݵ���������','�뻧���ݵ���������','2017-10-23 08:37:39','2017-10-23 08:37:39','Y','Y','Y'),(3,'�뻧���ݵĺô�������','jlkl','/thumb/news/8053d596fe114b0f894285da53bcc253.jpg','<p>�뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô��������뻧���ݵĺô�������</p>',NULL,'�뻧���ݵĺô�������','�뻧���ݵĺô�������','�뻧���ݵĺô�������','2017-10-18 16:42:04','2017-10-20 08:47:51','Y','Y','Y'),(4,'�뻧������','�뻧������','/thumb/news/e79d7088092be38cb4e321d1eb6b2b28.jpg','&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;�뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧����&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;/ueditor/php/upload/image/20171020/1508462053705807.png&quot; title=&quot;1508462053705807.png&quot; alt=&quot;image.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;�뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧�������뻧������&lt;/p&gt;',NULL,'�뻧������','�뻧������','�뻧������','2017-10-18 18:06:32','2017-10-20 09:14:59','Y','Y','Y'),(5,'�й�ʮ�˴��ٿ�','ëΪ��','/thumb/news/4b4cf12f3a6765555ae49e9f2a05be04.jpg','&lt;p&gt;�й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ��й�ʮ�˴��ٿ�&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20171020/1508461802117261.png&quot; title=&quot;1508461802117261.png&quot; alt=&quot;image.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�ʮ�˴��ٿ��й�ʮ�˴��ٿ�&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'�й�ʮ�˴��ٿ�','�й�ʮ�˴��ٿ�','�й�ʮ�˴��ٿ�','2017-10-20 09:10:23',NULL,'Y','Y','Y');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '��ƷID',
  `name` varchar(200) NOT NULL COMMENT '��Ʒ����',
  `image` varchar(200) DEFAULT NULL COMMENT '��ƷͼƬ',
  `price` decimal(20,2) DEFAULT NULL COMMENT '��Ʒ�۸�',
  `content` longtext COMMENT '��Ʒ����',
  `seo_title` varchar(200) DEFAULT NULL COMMENT '�Ż�����',
  `seo_keyword` varchar(200) DEFAULT NULL COMMENT '�Ż��ؼ���',
  `seo_description` varchar(2000) DEFAULT NULL COMMENT '�Ż�����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) DEFAULT 'Y' COMMENT '״̬������/����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "product"
#

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'111111','/thumb/goods/7c5caadf27b594caffd867545449bf65.jpg',11.11,'111111111111111111','1111111111111','111111111111111','111111111111111111','2017-10-10 15:31:53','2017-10-10 15:31:53','Y'),(3,'222','/thumb/goods/7cd3b25306a3c8e84d89f1ee1a4bee36.jpg',2.11,'222222222222222222','222222222222','222222222222','22222222222222','2017-10-10 15:34:19','2017-10-10 15:39:54','N'),(4,'333','/thumb/goods/0e51a9819717d620af8949731fe7e16a.jpg',3.33,'3333333333333','33333333333333','33333333333','33333333333333333','2017-10-10 15:27:35','2017-10-10 15:27:35','Y'),(6,'4444','/thumb/goods/278f155907b9aa233b995fafb5412077.jpg',4.44,'4444444444','444444444','4444444444','444444444','2017-10-10 15:28:38','2017-10-10 15:28:38','Y'),(7,'555555','/thumb/goods/31a1f19f073711c280fb37b271ab9b3a.jpg',5.00,'55555555555','5555555555','5555555555','555555555','2017-10-09 17:38:30','2017-10-09 17:38:28','Y'),(8,'666','/thumb/goods/0fee02d95529b0712b3ed27bea5cb46d.jpg',6.00,'6666666666','666666','666666','6666666','2017-10-10 08:39:23',NULL,'Y'),(9,'77777','/thumb/goods/2bab53400e0dd773b13b9b1a357b8150.jpg',7.88,'777777777','77777','777777','777777','2017-10-10 15:40:22','2017-10-10 15:54:11','Y'),(10,'88888','/thumb/goods/de3cdcef97b873fd9a358c0f917a3c1b.jpg',8.44,'88888888','8888888','8888888','8888888','2017-10-10 15:47:37','2017-10-10 15:53:47','Y'),(11,'999','/thumb/goods/f4b94e57dc571467f7379f522425cf69.jpg',9.00,'9999','9999','9999','9999','2017-10-10 08:40:34',NULL,'Y'),(12,'2122','/thumb/goods/9bb857a5310ece931b459b9fbc12afe4.jpg',22.00,'232323','2323232','232323','232323','2017-10-10 08:41:15',NULL,'Y'),(13,'adfs','/thumb/goods/18ca59e689663ffcc991b5fcda4af3f5.jpg',2.00,'sfsfsfsfsfsf','wewewfwewf','wewewfwewf','wewewfwewf','2017-10-10 10:32:31',NULL,'Y'),(14,'ƻ��','/thumb/goods/746beb531bd5b83fc9bf5dbc6ed5aca4.jpg',11.00,'','','','','2017-10-10 14:21:35',NULL,'Y'),(15,'�㽶','/thumb/goods/50f40a104603854bb563a7adaa8e2eb8.jpg',12.33,'1111111111','1111','1111','11111','2017-10-10 15:18:37',NULL,'Y');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '�û��ǳ�',
  `avator` varchar(100) DEFAULT NULL COMMENT '�û�ͷ��',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL DEFAULT 'Y' COMMENT '״̬������/����',
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
  `account_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '�˻�ID',
  `account_name` varchar(32) DEFAULT NULL COMMENT '�˻�����',
  `user_id` int(32) DEFAULT NULL COMMENT '�û�ID',
  `credential` char(32) NOT NULL COMMENT '����ƾ֤',
  `account_code` char(2) DEFAULT NULL COMMENT '�˻�����',
  `add_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `is_valid` char(1) NOT NULL COMMENT '״̬������/����',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# Data for table "user_account"
#

/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (23,'admin',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:43:41',NULL,'Y'),(24,'admin1',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:46:13',NULL,'Y'),(25,'admin2',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-12 14:46:29',NULL,'Y'),(26,'admin3',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-24 10:33:38','2017-10-24 10:33:38','Y'),(28,'admin6',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 11:10:21','2017-10-26 11:10:21','Y'),(29,'adminjk',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 11:10:27','2017-10-26 11:10:27','Y'),(30,'back',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 10:21:17',NULL,'Y'),(31,'�����û�1',NULL,'e10adc3949ba59abbe56e057f20f883e','1','2017-10-26 17:27:30',NULL,'Y');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
