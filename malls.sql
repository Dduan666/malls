# Host: localhost  (Version: 5.7.17)
# Date: 2017-06-09 18:58:03
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ma_admin_user"
#

DROP TABLE IF EXISTS `ma_admin_user`;
CREATE TABLE `ma_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `admin_password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `phone` varchar(20) DEFAULT '0' COMMENT '手机号',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `group_id` int(11) DEFAULT NULL,
  `admin_remark` text COMMENT '备注',
  `add_time` time DEFAULT '00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_name` (`admin_name`) USING BTREE,
  UNIQUE KEY `index_admin_password` (`admin_password`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='管理员表';

#
# Data for table "ma_admin_user"
#

INSERT INTO `ma_admin_user` VALUES (14,'admin','21232f297a57a5a743894a0e4a801fc3',0,'13074724849','dduan666@163.com',NULL,'掌控商品','00:00:01'),(15,'duan','202cb962ac59075b964b07152d234b70',0,'13074724849','d',4,'','00:00:01');

#
# Structure for table "ma_auth_group"
#

DROP TABLE IF EXISTS `ma_auth_group`;
CREATE TABLE `ma_auth_group` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '为1正常，为0禁用',
  `rules` varchar(225) DEFAULT '',
  `text` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户组表';

#
# Data for table "ma_auth_group"
#

/*!40000 ALTER TABLE `ma_auth_group` DISABLE KEYS */;
INSERT INTO `ma_auth_group` VALUES (4,'商品管理员',1,'14,15','拥有至高无上的权利'),(6,'用户',1,'','浏览网页，没有什么权利');
/*!40000 ALTER TABLE `ma_auth_group` ENABLE KEYS */;

#
# Structure for table "ma_auth_group_access"
#

DROP TABLE IF EXISTS `ma_auth_group_access`;
CREATE TABLE `ma_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

#
# Data for table "ma_auth_group_access"
#

/*!40000 ALTER TABLE `ma_auth_group_access` DISABLE KEYS */;
INSERT INTO `ma_auth_group_access` VALUES (14,4),(15,4);
/*!40000 ALTER TABLE `ma_auth_group_access` ENABLE KEYS */;

#
# Structure for table "ma_auth_rule"
#

DROP TABLE IF EXISTS `ma_auth_rule`;
CREATE TABLE `ma_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类别',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁用',
  `condition` char(100) DEFAULT '' COMMENT '规则表达式，为空表示存在验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='权限控制规则表';

#
# Data for table "ma_auth_rule"
#

/*!40000 ALTER TABLE `ma_auth_rule` DISABLE KEYS */;
INSERT INTO `ma_auth_rule` VALUES (14,'admin/users/admin_list','管理员管理',1,1,''),(15,'admin/product/product_category','分类的添加',1,1,''),(17,'admin/index/index.html','boss管理',1,1,'');
/*!40000 ALTER TABLE `ma_auth_rule` ENABLE KEYS */;

#
# Structure for table "ma_goods"
#

DROP TABLE IF EXISTS `ma_goods`;
CREATE TABLE `ma_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品自增id',
  `goodsname` varchar(255) NOT NULL DEFAULT '' COMMENT '商品的名字',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `tpid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父级id',
  `unit` varchar(255) DEFAULT '' COMMENT '商品的单位',
  `attributes` enum('1','2','3','4','5','6','7') NOT NULL DEFAULT '1' COMMENT '商品的属性（1、推荐 2、新上 3、热卖 4、促销 5、包邮 6、限时买 7、不参与会员折扣）',
  `imagepath` varchar(255) DEFAULT '' COMMENT '商品轮播图',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `barcode` int(11) DEFAULT '0' COMMENT '条形码',
  `curprice` int(11) NOT NULL DEFAULT '0' COMMENT '商品展示价格',
  `oriprece` int(11) NOT NULL DEFAULT '0' COMMENT '市场价格',
  `cosprice` int(11) NOT NULL DEFAULT '0' COMMENT '成本价格',
  `inventory` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `restrict` int(11) DEFAULT '0' COMMENT '限制购买量',
  `already` int(11) DEFAULT '0' COMMENT '已经购买量',
  `freight` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `status` enum('0','1') DEFAULT '0' COMMENT '是否上架',
  `reorder` int(11) DEFAULT '0' COMMENT '商品排序',
  `text` text NOT NULL COMMENT '商品详情描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商品表';

#
# Data for table "ma_goods"
#

/*!40000 ALTER TABLE `ma_goods` DISABLE KEYS */;
INSERT INTO `ma_goods` VALUES (4,'路虎',14,13,'0000000','1','',1111,0,100000,100000,100000,10,2,1,500,'0',1,'<p>路虎 -- 揽胜</p>'),(5,'哈佛H9',14,13,'0000000','2','',1111,0,100000,100000,100000,10,2,1,500,'0',1,'<p>哈佛h9</p>'),(6,'哈佛H9',14,13,'0000000','2','',0,0,0,0,0,0,0,0,0,'0',1,'<p>哈佛h9</p>'),(11,'靴子',3,0,'','1','12',0,0,0,0,0,0,0,0,0,'0',0,''),(12,'宝马',14,13,'1','1','16,14,15,13',1,0,1,1,1,1,1,1,1,'0',1,'<p>宝马</p>'),(13,'悍马',14,13,'2','1','28,27,26,25',2,0,2,2,2,2,2,2,2,'0',0,'<p>悍马</p>'),(14,'路虎揽胜',14,13,'33','2','38,37',33,33,33,33,33,33,33,33,33,'0',3,'<p>3333</p>'),(17,'韩超',12,10,'发送到','1',',undefined',23423,0,4234,4234,4234,4234,4234,4324,4324,'0',0,''),(18,'公司',4,3,'2','1','undefined,,80',22,0,2,2,2,2,2,2,2,'0',0,'<p>23</p>'),(19,'联想',17,0,'002','1','84,,82',2,2,2,2,2,2,2,2,2,'0',0,'<p>201761号上线</p>'),(20,'324',22,0,'43','1','90,89,88',423,0,423,423,423,42,4234,423,423,'0',0,''),(21,'4535',1,0,'53','1','93,92,91',53,0,3534,3453,534,534,534,534,534,'0',53,'<p>534</p>'),(22,'42342',14,13,'2','1','96,95,94',2,0,2,2,2,2,2,2,2,'0',2,'<p>发顺丰</p>');
/*!40000 ALTER TABLE `ma_goods` ENABLE KEYS */;

#
# Structure for table "ma_goods_files"
#

DROP TABLE IF EXISTS `ma_goods_files`;
CREATE TABLE `ma_goods_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "ma_goods_files"
#

/*!40000 ALTER TABLE `ma_goods_files` DISABLE KEYS */;
INSERT INTO `ma_goods_files` VALUES (29,'/static/files/2017-05-31/14961973891644.png'),(30,'/static/files/2017-05-31/14961973893096.png'),(31,'/static/files/2017-05-31/14961986842331.png'),(32,'/static/files/2017-05-31/14961986848304.png'),(33,'/static/files/2017-05-31/14961988488152.png'),(34,'/static/files/2017-05-31/14961988496559.png'),(35,'/static/files/2017-05-31/14961990081523.png'),(36,'/static/files/2017-05-31/14961990099505.png'),(37,'/static/files/2017-05-31/14961991674929.png'),(38,'/static/files/2017-05-31/14961991673873.png'),(39,'/static/files/2017-05-31/14961992508101.png'),(40,'/static/files/2017-05-31/14961995924695.png'),(41,'/static/files/2017-05-31/14962004478788.png'),(42,'/static/files/2017-05-31/14962004753225.png'),(43,'/static/files/2017-05-31/14962014871276.png'),(44,'/static/files/2017-05-31/14962024304752.png'),(45,'/static/files/2017-05-31/14962024314609.png'),(46,'/static/files/2017-05-31/14962024318479.png'),(47,'/static/files/2017-05-31/14962032341265.png'),(48,'/static/files/2017-05-31/14962032356809.png'),(49,'/static/files/2017-05-31/14962032357731.png'),(50,'/static/files/2017-05-31/14962032362287.png'),(51,'/static/files/2017-05-31/14962089689124.png'),(52,'/static/files/2017-05-31/14962089696321.png'),(53,'/static/files/2017-05-31/14962090018385.png'),(54,'/static/files/2017-05-31/14962090013155.png'),(55,'/static/files/2017-05-31/14962117637634.png'),(56,'/static/files/2017-05-31/14962119338841.png'),(57,'/static/files/2017-05-31/14962119343638.png'),(58,'/static/files/2017-05-31/14962119343924.png'),(61,'/static/files/2017-05-31/14962124595804.png'),(62,'/static/files/2017-05-31/14962132123660.png'),(63,'/static/files/2017-05-31/14962132121257.png'),(64,'/static/files/2017-05-31/14962132124352.png'),(65,'/static/files/2017-05-31/14962132697279.png'),(66,'/static/files/2017-05-31/14962132699248.png'),(67,'/static/files/2017-05-31/14962132703600.png'),(68,'/static/files/2017-05-31/14962132991914.png'),(69,'/static/files/2017-05-31/14962132991817.png'),(70,'/static/files/2017-05-31/14962133005380.png'),(71,'/static/files/2017-05-31/14962133156648.png'),(72,'/static/files/2017-05-31/14962133152257.png'),(73,'/static/files/2017-05-31/14962133151560.png'),(74,'/static/files/2017-05-31/14962134848001.png'),(75,'/static/files/2017-05-31/14962134844879.png'),(76,'/static/files/2017-05-31/14962134848818.png'),(77,'/static/files/2017-05-31/14962135106322.png'),(78,'/static/files/2017-05-31/14962135107281.png'),(79,'/static/files/2017-05-31/14962135106172.png'),(80,'/static/files/2017-05-31/14962248504997.png'),(81,'/static/files/2017-05-31/14962248521193.png'),(82,'/static/files/2017-06-01/14962861515641.png'),(83,'/static/files/2017-06-01/14962861518507.png'),(84,'/static/files/2017-06-01/14962861528448.png'),(85,'/static/files/2017-06-01/14962894571632.png'),(86,'/static/files/2017-06-06/14967127068873.png'),(87,'/static/files/2017-06-06/14967127071113.png'),(88,'/static/files/2017-06-06/14967441319568.png'),(89,'/static/files/2017-06-06/14967441329169.png'),(90,'/static/files/2017-06-06/14967441326075.png'),(91,'/static/files/2017-06-06/14967448529845.png'),(92,'/static/files/2017-06-06/14967448534980.png'),(93,'/static/files/2017-06-06/14967448535777.png'),(94,'/static/files/2017-06-09/14969984966598.png'),(95,'/static/files/2017-06-09/14969984975640.png'),(96,'/static/files/2017-06-09/14969984986420.png');
/*!40000 ALTER TABLE `ma_goods_files` ENABLE KEYS */;

#
# Structure for table "ma_goods_type"
#

DROP TABLE IF EXISTS `ma_goods_type`;
CREATE TABLE `ma_goods_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类路径',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分类级别',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

#
# Data for table "ma_goods_type"
#

/*!40000 ALTER TABLE `ma_goods_type` DISABLE KEYS */;
INSERT INTO `ma_goods_type` VALUES (1,'服装',0,'0-1',1),(3,'鞋',0,'0-3',1),(4,'皮鞋',3,'0-3-4',2),(10,'裙子',1,'0-1-10',2),(12,'连衣裙',10,'0-1-10-12',3),(13,'汽车',0,'0-13',1),(14,'轿车',13,'0-13-14',2),(17,'数码',0,'0-17',1),(18,'食物',0,'0-18',1),(19,'电脑',17,'0-17-19',2),(22,'飞机',0,'0-22',1),(23,'佛挡杀佛',13,'0-13-23',2);
/*!40000 ALTER TABLE `ma_goods_type` ENABLE KEYS */;
