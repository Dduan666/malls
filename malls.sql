# Host: localhost  (Version: 5.7.17)
# Date: 2017-05-28 17:48:21
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

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
  `curprice` int(11) NOT NULL DEFAULT '0' COMMENT '现价',
  `oriprece` int(11) NOT NULL DEFAULT '0' COMMENT '市场价',
  `cosprice` int(11) NOT NULL DEFAULT '0' COMMENT '成本价',
  `inventory` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `restrict` int(11) DEFAULT '0' COMMENT '限制购买量',
  `already` int(11) DEFAULT '0' COMMENT '已经购买量',
  `freight` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `status` enum('0','1') DEFAULT '0' COMMENT '是否上架',
  `reorder` int(11) DEFAULT '0' COMMENT '商品排序',
  `text` text NOT NULL COMMENT '商品详情描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品表';

#
# Data for table "ma_goods"
#

/*!40000 ALTER TABLE `ma_goods` DISABLE KEYS */;
INSERT INTO `ma_goods` VALUES (4,'路虎',14,13,'0000000','1','',1111,0,100000,100000,100000,10,2,1,500,'0',1,'<p>路虎 -- 揽胜</p>'),(5,'哈佛H9',14,13,'0000000','2','',1111,0,100000,100000,100000,10,2,1,500,'0',1,'<p>哈佛h9</p>'),(6,'哈佛H9999999999',14,13,'0000000','2','',1111,0,100000,100000,100000,10,2,1,500,'0',1,'<p>哈佛h9</p>'),(10,'',14,13,'','1','10,9,8,7',0,0,0,0,0,0,0,0,0,'0',0,''),(11,'靴子',3,0,'','1','12',0,0,0,0,0,0,0,0,0,'0',0,''),(12,'宝马',14,13,'1','1','16,14,15,13',1,0,1,1,1,1,1,1,1,'0',1,'<p>宝马</p>'),(13,'悍马',14,13,'2','1','28,27,26,25',2,0,2,2,2,2,2,2,2,'0',0,'<p>悍马</p>');
/*!40000 ALTER TABLE `ma_goods` ENABLE KEYS */;

#
# Structure for table "ma_goods_files"
#

DROP TABLE IF EXISTS `ma_goods_files`;
CREATE TABLE `ma_goods_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "ma_goods_files"
#

/*!40000 ALTER TABLE `ma_goods_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ma_goods_files` ENABLE KEYS */;

#
# Structure for table "ma_goods_type"
#

DROP TABLE IF EXISTS `ma_goods_type`;
CREATE TABLE `ma_goods_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类路径',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分类级别',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

#
# Data for table "ma_goods_type"
#

/*!40000 ALTER TABLE `ma_goods_type` DISABLE KEYS */;
INSERT INTO `ma_goods_type` VALUES (1,'服装',0,'0-1',1),(3,'鞋',0,'0-3',1),(4,'皮鞋',3,'0-3-4',2),(10,'裙子',1,'0-1-10',2),(12,'连衣裙',10,'0-1-10-12',3),(13,'汽车',0,'0-13',1),(14,'轿车',13,'0-13-14',2);
/*!40000 ALTER TABLE `ma_goods_type` ENABLE KEYS */;
