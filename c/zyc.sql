-- MySQL dump 10.13  Distrib 5.1.65, for Win32 (ia32)
--
-- Host: localhost    Database: zyc
-- ------------------------------------------------------
-- Server version	5.1.65-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pwn_advs_duilian`
--

DROP TABLE IF EXISTS `pwn_advs_duilian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_duilian` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `groupname` char(200) NOT NULL,
  `src` char(100) NOT NULL DEFAULT '',
  `src2` char(100) NOT NULL DEFAULT '',
  `url` char(200) NOT NULL DEFAULT '',
  `url2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_duilian`
--

LOCK TABLES `pwn_advs_duilian` WRITE;
/*!40000 ALTER TABLE `pwn_advs_duilian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_advs_duilian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_lb`
--

DROP TABLE IF EXISTS `pwn_advs_lb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_lb` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `groupid` int(5) NOT NULL DEFAULT '1',
  `title` char(100) NOT NULL DEFAULT '',
  `src` char(100) NOT NULL DEFAULT '',
  `src1` char(255) NOT NULL,
  `url` char(100) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_lb`
--

LOCK TABLES `pwn_advs_lb` WRITE;
/*!40000 ALTER TABLE `pwn_advs_lb` DISABLE KEYS */;
INSERT INTO `pwn_advs_lb` VALUES (39,1,'广告标题','advs/pics/20090323/1237779420.jpg','','http://',1),(40,1,'广告标题','advs/pics/20090323/1237780592.jpg','','http://',3),(41,1,'广告标题','advs/pics/20090323/1237780390.jpg','','http://',2);
/*!40000 ALTER TABLE `pwn_advs_lb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_lbgroup`
--

DROP TABLE IF EXISTS `pwn_advs_lbgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_lbgroup` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_lbgroup`
--

LOCK TABLES `pwn_advs_lbgroup` WRITE;
/*!40000 ALTER TABLE `pwn_advs_lbgroup` DISABLE KEYS */;
INSERT INTO `pwn_advs_lbgroup` VALUES (1,'默认轮播广告组',1,0);
/*!40000 ALTER TABLE `pwn_advs_lbgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_link`
--

DROP TABLE IF EXISTS `pwn_advs_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_link` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `groupid` int(5) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `src` varchar(100) NOT NULL DEFAULT '',
  `cl` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_link`
--

LOCK TABLES `pwn_advs_link` WRITE;
/*!40000 ALTER TABLE `pwn_advs_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_advs_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_linkgroup`
--

DROP TABLE IF EXISTS `pwn_advs_linkgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_linkgroup` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_linkgroup`
--

LOCK TABLES `pwn_advs_linkgroup` WRITE;
/*!40000 ALTER TABLE `pwn_advs_linkgroup` DISABLE KEYS */;
INSERT INTO `pwn_advs_linkgroup` VALUES (1,'默认友情链接组',1,0);
/*!40000 ALTER TABLE `pwn_advs_linkgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_logo`
--

DROP TABLE IF EXISTS `pwn_advs_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_logo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `groupname` char(200) NOT NULL,
  `src` char(100) NOT NULL DEFAULT '',
  `url` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_logo`
--

LOCK TABLES `pwn_advs_logo` WRITE;
/*!40000 ALTER TABLE `pwn_advs_logo` DISABLE KEYS */;
INSERT INTO `pwn_advs_logo` VALUES (1,'网站标志一','advs/pics/20140320/1395295514.gif','{#RP#}');
/*!40000 ALTER TABLE `pwn_advs_logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_movi`
--

DROP TABLE IF EXISTS `pwn_advs_movi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_movi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `groupname` char(200) NOT NULL,
  `src` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_movi`
--

LOCK TABLES `pwn_advs_movi` WRITE;
/*!40000 ALTER TABLE `pwn_advs_movi` DISABLE KEYS */;
INSERT INTO `pwn_advs_movi` VALUES (1,'视频广告测试一','http://vhead.blog.sina.com.cn/player/outer_player.swf?auto=1&vid=16205152&uid=1504617052');
/*!40000 ALTER TABLE `pwn_advs_movi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_pic`
--

DROP TABLE IF EXISTS `pwn_advs_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_pic` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `groupname` char(200) NOT NULL,
  `src` char(100) NOT NULL DEFAULT '',
  `url` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_pic`
--

LOCK TABLES `pwn_advs_pic` WRITE;
/*!40000 ALTER TABLE `pwn_advs_pic` DISABLE KEYS */;
INSERT INTO `pwn_advs_pic` VALUES (1,'测试图片广告','advs/pics/20090215/1234667308.jpg','http://www.try.com');
/*!40000 ALTER TABLE `pwn_advs_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_pop`
--

DROP TABLE IF EXISTS `pwn_advs_pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_pop` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text,
  `ifpop` int(1) NOT NULL DEFAULT '0',
  `popwidth` int(10) DEFAULT NULL,
  `popheight` int(10) DEFAULT NULL,
  `popleft` int(10) DEFAULT NULL,
  `poptop` int(10) DEFAULT NULL,
  `poptoolbar` int(1) DEFAULT NULL,
  `popmenubar` int(1) DEFAULT NULL,
  `popstatus` int(1) DEFAULT NULL,
  `poplocation` int(1) DEFAULT NULL,
  `popscrollbars` varchar(50) DEFAULT NULL,
  `popresizable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_pop`
--

LOCK TABLES `pwn_advs_pop` WRITE;
/*!40000 ALTER TABLE `pwn_advs_pop` DISABLE KEYS */;
INSERT INTO `pwn_advs_pop` VALUES (1,'弹出窗口','窗口内容 ',0,400,300,0,0,0,0,0,0,'auto',0);
/*!40000 ALTER TABLE `pwn_advs_pop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_advs_text`
--

DROP TABLE IF EXISTS `pwn_advs_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_advs_text` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `groupname` char(200) NOT NULL,
  `text` char(200) NOT NULL DEFAULT '',
  `url` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_advs_text`
--

LOCK TABLES `pwn_advs_text` WRITE;
/*!40000 ALTER TABLE `pwn_advs_text` DISABLE KEYS */;
INSERT INTO `pwn_advs_text` VALUES (1,'促销广告一','本季特大优惠活动开始啦qq','http://www.com');
/*!40000 ALTER TABLE `pwn_advs_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_admin`
--

DROP TABLE IF EXISTS `pwn_base_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_admin` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `job` varchar(50) NOT NULL,
  `jobid` varchar(20) NOT NULL,
  `moveable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_admin`
--

LOCK TABLES `pwn_base_admin` WRITE;
/*!40000 ALTER TABLE `pwn_base_admin` DISABLE KEYS */;
INSERT INTO `pwn_base_admin` VALUES (3,'admin','15d255d581717c9e5fb70c5cd3ef7f23','管理员','管理员','A001',0);
/*!40000 ALTER TABLE `pwn_base_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_adminauth`
--

DROP TABLE IF EXISTS `pwn_base_adminauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_adminauth` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL,
  `auth` int(5) NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL DEFAULT '',
  `intro` char(255) NOT NULL DEFAULT '',
  `xuhao` int(10) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL DEFAULT '0',
  `pname` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_adminauth`
--

LOCK TABLES `pwn_base_adminauth` WRITE;
/*!40000 ALTER TABLE `pwn_base_adminauth` DISABLE KEYS */;
INSERT INTO `pwn_base_adminauth` VALUES (69,'advs',91,'网站标志管理','',1,2,''),(17,'advs',95,'网站广告管理','',5,2,''),(30,'advs',96,'友情链接管理','',4,7,''),(1,'base',1,'网站参数设置','',1,0,''),(2,'base',2,'修改管理密码','',2,0,''),(3,'base',3,'管理账户维护','',3,0,''),(5,'base',5,'网站排版设置','',5,0,''),(66,'base',6,'模块插件管理','',6,0,''),(67,'base',7,'软件升级更新','',7,0,''),(37,'comment',130,'点评模块参数设置','',0,13,''),(11,'comment',131,'点评分类','',1,13,''),(26,'comment',132,'点评管理','',2,13,''),(4,'member',50,'会员类型设置','',1,5,''),(42,'member',51,'会员模块参数设置','',11,6,''),(19,'member',52,'会员查询管理','',2,5,''),(20,'member',53,'会员资料查询','',3,5,''),(21,'member',54,'会员资料修改','',4,5,''),(22,'member',55,'会员邮件发送','',5,5,''),(23,'member',56,'会员权限管理','',6,5,''),(24,'member',57,'会员公告管理','',7,5,''),(32,'member',58,'模拟会员登录','',8,5,''),(33,'member',59,'会员实名认证','',9,5,''),(34,'member',60,'会员删除权限','',10,5,''),(63,'member',61,'会员区域设置','',11,6,''),(64,'member',62,'会员行业分类','',12,0,''),(65,'member',63,'积分规则设置','',13,6,''),(35,'member',64,'会员转移类型','',11,5,''),(36,'member',65,'重设会员密码','',12,5,''),(68,'member',66,'积分录入权限','',16,6,''),(6,'menu',11,'导航菜单设置','',1,1,''),(38,'news',120,'文章模块参数设置','',0,12,''),(39,'news',121,'文章分类','',1,12,''),(13,'news',122,'文章管理','',2,12,''),(12,'news',123,'文章专题设置','',3,12,''),(40,'news',125,'文章发布','',5,12,''),(41,'news',126,'文章修改','',6,12,''),(43,'page',301,'网页分组和管理','',1,30,''),(27,'tools',81,'访问统计系统','',1,7,''),(29,'tools',82,'投票调查系统','',3,7,''),(72,'base',8,'管理菜单设置','',8,0,''),(73,'product',180,'产品模块参数设置','',0,15,''),(74,'product',181,'产品分类','',1,15,''),(75,'product',182,'产品管理','',2,15,''),(76,'product',183,'产品专题设置','',3,15,''),(77,'product',185,'产品发布','',5,15,''),(78,'product',186,'产品修改','',6,15,''),(87,'base',9,'模块安装卸载','',9,0,''),(88,'photo',150,'图片模块参数设置','',0,15,''),(89,'photo',151,'图片分类','',1,15,''),(90,'photo',152,'图片管理','',2,15,''),(91,'photo',153,'图片专题设置','',3,15,''),(92,'photo',155,'图片发布','',5,15,''),(93,'photo',156,'图片修改','',6,15,''),(94,'down',160,'下载模块参数设置','',0,16,''),(95,'down',161,'下载分类','',1,16,''),(96,'down',162,'下载管理','',2,16,''),(97,'down',163,'下载专题设置','',3,16,''),(98,'down',165,'下载发布','',5,16,''),(99,'down',166,'下载修改','',6,16,''),(100,'service',101,'客服分组设置','',1,10,''),(101,'service',102,'客服表单设置','',2,10,''),(102,'service',103,'客服工单处理','',3,10,''),(103,'service',104,'存档工单查询','',4,10,''),(104,'service',105,'客服工单删除','',5,10,''),(105,'service',106,'工单人工存档权限','',6,10,''),(106,'service',107,'全部工单监控','',7,10,''),(107,'service',108,'快捷回复设置','',8,10,''),(108,'tools',83,'图片投票系统','',3,7,''),(109,'tools',84,'QQ客服系统','',4,7,''),(110,'tools',85,'51客服系统','',5,7,''),(111,'tools',86,'51la统计系统','',6,7,''),(112,'tools',87,'移动短信留言','',7,7,''),(113,'member',67,'财务收款入账','',16,6,''),(114,'member',68,'会员帐务查询','',16,6,''),(115,'member',69,'支付方法设置','',16,6,''),(116,'member',70,'帐务查询统计','',16,6,'');
/*!40000 ALTER TABLE `pwn_base_adminauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_adminmenu`
--

DROP TABLE IF EXISTS `pwn_base_adminmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_adminmenu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` int(6) NOT NULL DEFAULT '0',
  `menu` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `xuhao` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_adminmenu`
--

LOCK TABLES `pwn_base_adminmenu` WRITE;
/*!40000 ALTER TABLE `pwn_base_adminmenu` DISABLE KEYS */;
INSERT INTO `pwn_base_adminmenu` VALUES (1,0,'栏目菜单设置','menu/admin/menu.php?groupid=1',1),(2,0,'公司简介修改','page/admin/page_edit.php?id=1&groupid=1',3),(16,0,'留言点评管理','comment/admin/bbs.php',9),(6,0,'联系方式修改','page/admin/page_edit.php?id=2&groupid=1',6),(8,0,'企业产品管理','product/admin/product_con.php',7),(11,0,'新闻动态管理','news/admin/news_con.php',8),(15,0,'上传网站标志','advs/admin/advs_logo_modi.php?id=1',2);
/*!40000 ALTER TABLE `pwn_base_adminmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_adminrights`
--

DROP TABLE IF EXISTS `pwn_base_adminrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_adminrights` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `auth` char(20) DEFAULT NULL,
  `user` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3079 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_adminrights`
--

LOCK TABLES `pwn_base_adminrights` WRITE;
/*!40000 ALTER TABLE `pwn_base_adminrights` DISABLE KEYS */;
INSERT INTO `pwn_base_adminrights` VALUES (3078,'108','admin'),(3077,'107','admin'),(3076,'106','admin'),(3075,'105','admin'),(3074,'104','admin'),(3073,'103','admin'),(3072,'102','admin'),(3071,'101','admin'),(3070,'166','admin'),(3069,'165','admin'),(3068,'163','admin'),(3067,'162','admin'),(3066,'161','admin'),(3065,'160','admin'),(3064,'156','admin'),(3063,'155','admin'),(3062,'153','admin'),(3061,'152','admin'),(3060,'151','admin'),(3059,'150','admin'),(3058,'9','admin'),(3057,'186','admin'),(3056,'185','admin'),(3055,'183','admin'),(3054,'182','admin'),(3053,'181','admin'),(3052,'180','admin'),(3051,'8','admin'),(3050,'82','admin'),(3049,'81','admin'),(3048,'301','admin'),(3047,'126','admin'),(3046,'125','admin'),(3045,'123','admin'),(3044,'122','admin'),(3043,'121','admin'),(3042,'120','admin'),(3041,'11','admin'),(3040,'66','admin'),(3039,'65','admin'),(3038,'64','admin'),(3037,'63','admin'),(3036,'62','admin'),(3035,'61','admin'),(3034,'60','admin'),(3033,'59','admin'),(3032,'58','admin'),(3031,'57','admin'),(3030,'56','admin'),(3029,'55','admin'),(3028,'54','admin'),(3027,'53','admin'),(3026,'52','admin'),(3025,'51','admin'),(3024,'50','admin'),(3023,'132','admin'),(3022,'131','admin'),(3021,'130','admin'),(3020,'7','admin'),(3019,'6','admin'),(3018,'5','admin'),(3017,'3','admin'),(3016,'2','admin'),(3015,'1','admin'),(3014,'96','admin'),(3013,'95','admin'),(3012,'91','admin');
/*!40000 ALTER TABLE `pwn_base_adminrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_border`
--

DROP TABLE IF EXISTS `pwn_base_border`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_border` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `bordertype` varchar(10) NOT NULL DEFAULT 'border',
  `tempid` char(8) NOT NULL DEFAULT '',
  `tempname` varchar(50) NOT NULL DEFAULT '边框模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_border`
--

LOCK TABLES `pwn_base_border` WRITE;
/*!40000 ALTER TABLE `pwn_base_border` DISABLE KEYS */;
INSERT INTO `pwn_base_border` VALUES (1,'border','001','可选颜色边框模板'),(2,'border','002','可选颜色边框模板'),(3,'border','003','可选颜色边框模板'),(4,'border','004','可选颜色边框模板'),(5,'border','005','可选颜色边框模板'),(6,'border','006','可选颜色边框模板'),(66,'lable','212','竖排菜单式标签切换边框模板,无外框线'),(8,'border','008','可选颜色边框模板(浅色调)'),(9,'border','009','可选颜色边框模板'),(10,'border','010','可选颜色边框模板'),(11,'border','011','可选颜色边框模板'),(12,'border','012','可选颜色边框模板(浅色调)'),(13,'border','013','可选颜色边框模板'),(14,'border','014','可选颜色边框模板'),(15,'border','015','可选颜色边框模板'),(16,'border','016','可选颜色边框模板'),(17,'border','017','可选颜色边框模板'),(18,'border','018','可选颜色边框模板'),(19,'border','501','浅色调创意边框模板'),(20,'border','502','边框模板'),(22,'border','504','边框模板'),(23,'border','505','边框模板'),(34,'border','020','可选颜色边框模板(浅色调)'),(25,'border','507','边框模板'),(35,'border','503','无框线简约边框模版'),(27,'border','509','边框模板'),(37,'border','506','浅色调无框线边框模版'),(31,'border','513','浅灰色圆角边框模板'),(33,'border','019','可选颜色边框模板(浅色调)'),(38,'border','508','浅色调边框模版'),(39,'border','510','左侧标题栏浅色调模版'),(40,'border','511','无标题栏圆角边框模版'),(41,'border','512','无标题栏圆角边框模版'),(42,'border','514','边框模板'),(43,'border','021','左侧标题栏可变色边框模板'),(44,'border','515','灰色外背景边框模板'),(45,'border','516','无标题栏圆角灰色背景边框模版'),(46,'border','517','无标题栏圆角浅色背景边框模板'),(47,'lable','201','标签切换边框模板,浅蓝简约型'),(48,'lable','051','可选颜色,标签切换边框模板,带总标题'),(49,'lable','202','标签切换边框模板,红黑标签，无框线'),(50,'lable','203','标签切换边框模板'),(51,'lable','204','标签切换边框模板,浅灰简约,带总标题栏'),(52,'lable','052','可选颜色,标签切换边框模板,带总标题'),(53,'lable','205','标签切换边框模板,圆角,深色'),(54,'lable','053','可选颜色,标签切换边框模板,圆角'),(55,'lable','206','标签切换边框模板,圆角,浅黄色调'),(56,'lable','207','标签切换边框模板,圆角,浅蓝淡雅风格'),(57,'lable','208','标签切换边框模板,内圆角,浅蓝淡雅风格'),(58,'lable','209','标签切换边框模板,内圆角,灰白渐变'),(59,'lable','210','标签切换边框模板,圆角,浅色渐变'),(60,'lable','054','可选颜色,标签切换边框模板,圆角'),(61,'lable','055','可选颜色,标签切换边框模板'),(62,'lable','211','标签切换边框模板,圆角,橙色+灰色'),(63,'border','500','条幅边框,无标题栏，搜索条登录框等专用'),(64,'border','022','可选颜色边框模板'),(67,'lable','056','可选颜色,竖排菜单式标签切换边框,无框线'),(75,'border','519','无标题栏边框模版(圆角，粗边线)'),(77,'border','521','绿色小圆角边框'),(78,'border','522','绿色标题栏边框'),(79,'border','523','会员登录边框'),(85,'border','526','条状背景边框(搜索、当前位置提示条专用)'),(82,'border','525','绿色创意边框');
/*!40000 ALTER TABLE `pwn_base_border` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_coltype`
--

DROP TABLE IF EXISTS `pwn_base_coltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_coltype` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL DEFAULT '',
  `colname` varchar(50) NOT NULL DEFAULT '',
  `sname` varchar(30) NOT NULL,
  `ifadmin` int(1) NOT NULL DEFAULT '1',
  `ifchannel` int(1) NOT NULL DEFAULT '0',
  `ifpubplus` int(1) NOT NULL DEFAULT '1',
  `moveable` int(1) NOT NULL DEFAULT '0',
  `installed` int(1) NOT NULL DEFAULT '1',
  `classtbl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_coltype`
--

LOCK TABLES `pwn_base_coltype` WRITE;
/*!40000 ALTER TABLE `pwn_base_coltype` DISABLE KEYS */;
INSERT INTO `pwn_base_coltype` VALUES (1,'base','基础模块','基础',0,0,0,0,1,''),(2,'diy','自定内容','自定义',0,0,1,0,1,''),(3,'menu','导航菜单','菜单',1,0,1,0,1,''),(5,'index','首页模块','首页',0,1,0,0,1,''),(20,'page','网页模块','网页',1,0,1,0,1,''),(21,'news','文章模块','文章',1,1,1,1,1,'_news_cat'),(25,'product','产品展示','产品',1,1,1,1,1,'_product_cat'),(26,'photo','图片模块','图片',1,1,1,1,1,'_photo_cat'),(27,'down','下载模块','下载',1,1,1,1,1,'_down_cat'),(28,'comment','留言点评','点评',1,1,1,1,1,'_comment_cat'),(29,'service','客户服务','客服',1,1,1,1,1,''),(30,'member','会员模块','会员',1,1,1,1,1,''),(97,'search','全站搜索','搜索',0,0,1,0,1,''),(98,'advs','网站广告','广告',1,0,1,0,1,''),(99,'tools','辅助工具','工具',1,0,1,0,1,''),(100,'effect','素材特效','特效',0,0,1,0,1,''),(299,'app','网站应用','应用',1,0,1,0,1,'');
/*!40000 ALTER TABLE `pwn_base_coltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_config`
--

DROP TABLE IF EXISTS `pwn_base_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_config`
--

LOCK TABLES `pwn_base_config` WRITE;
/*!40000 ALTER TABLE `pwn_base_config` DISABLE KEYS */;
INSERT INTO `pwn_base_config` VALUES (1,'网站名称','input','30','SiteName','安徽中宇通信设备有限公司','用于在网页标题、导航栏处显示'),(2,'网站网址','input','30','SiteHttp','http://ahzy.huijiangfang.com/','网站的实际访问网址,末尾加“/”'),(4,'服务邮箱','input','30','SiteEmail','service@mydomain.com','在发送系统邮件时作为发件人邮件'),(5,'邮件转发方式','ownersys','1','ownersys','0','LINUX/UNIX服务器一般可使用内置邮件系统转发邮件；WINDOWS服务器建议使用外部SMTP邮箱转发，并设置以下SMTP邮箱参数'),(6,'SMTP服务器','input','30','owner_m_smtp','mail.mydomain.com',''),(7,'SMTP邮箱用户','input','30','owner_m_user','alex@mydomain.com',''),(8,'SMTP邮箱密码','input','30','owner_m_pass','123456',''),(5,'SMTP转发邮箱','input','30','owner_m_mail','alex@mydomain.com',''),(9,'SMTP身份验证','YN','10','owner_m_check','1',''),(10,'是否生成并使用静态HTML网页','YN','10','CatchOpen','0',''),(11,'HTML静态网页更新时间(秒)','input','8','CatchTime','3600','超过此时间访问静态页面时，重新生成静态页并刷新页面'),(3,'软件授权用户账号','input','30','phpwebUser','db242000','在本软件安装、升级或使用其他服务时所采用的软件授权用户登录帐号'),(99,'安全校验码','code','30','safecode','8FC87898B7D1',''),(3,'API接口服务器','apiserver','1','apiserver','api.8555.net','设置API接口服务器'),(3,'API接口连接密钥','input','30','appkey','','用于网站应用通过API接口获取数据、提交数据时的连接校验，请输入5-20位英文字母和数字组合');
/*!40000 ALTER TABLE `pwn_base_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_pageset`
--

DROP TABLE IF EXISTS `pwn_base_pageset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_pageset` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `coltype` varchar(50) NOT NULL DEFAULT '',
  `pagename` varchar(50) NOT NULL DEFAULT '',
  `th` int(5) NOT NULL DEFAULT '200',
  `ch` int(5) NOT NULL DEFAULT '500',
  `bh` int(5) NOT NULL DEFAULT '200',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `metakey` varchar(255) NOT NULL DEFAULT '',
  `metacon` text NOT NULL,
  `bgcolor` varchar(100) NOT NULL,
  `bgimage` varchar(100) NOT NULL,
  `bgposition` varchar(20) NOT NULL,
  `bgrepeat` varchar(20) NOT NULL DEFAULT 'repeat',
  `bgatt` varchar(10) NOT NULL DEFAULT 'scroll',
  `containwidth` int(5) NOT NULL DEFAULT '900',
  `containbg` varchar(100) NOT NULL DEFAULT '#ffffff',
  `containimg` varchar(100) NOT NULL,
  `containmargin` int(2) NOT NULL DEFAULT '0',
  `containpadding` int(2) NOT NULL DEFAULT '10',
  `containcenter` char(10) NOT NULL DEFAULT 'auto',
  `topbg` varchar(100) NOT NULL DEFAULT 'transparent',
  `topwidth` char(10) NOT NULL DEFAULT '900',
  `contentbg` varchar(100) NOT NULL DEFAULT 'transparent',
  `contentwidth` char(10) NOT NULL DEFAULT '900',
  `contentmargin` int(2) NOT NULL DEFAULT '10',
  `bottombg` varchar(100) NOT NULL DEFAULT 'transparent',
  `bottomwidth` char(10) NOT NULL DEFAULT '900',
  `buildhtml` varchar(12) NOT NULL DEFAULT '0',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_pageset`
--

LOCK TABLES `pwn_base_pageset` WRITE;
/*!40000 ALTER TABLE `pwn_base_pageset` DISABLE KEYS */;
INSERT INTO `pwn_base_pageset` VALUES (126,'友情链接','advs','link',292,303,42,'','友情链接','友情链接','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',0),(92,'点评检索','comment','query',290,791,31,'','0','0','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','catid',12),(88,'点评详情','comment','detail',292,546,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','id',17),(123,'点评频道首页','comment','main',292,380,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','index',11),(1,'首页','index','index',609,486,202,'首页','','','transparent','url(effect/source/bg/top.gif)','0% 0%','repeat-x','scroll',1002,'none 0% 0% repeat scroll transparent','',0,0,'auto','url(effect/source/bg/topbg.gif) 50% 0% repeat-x','0','none 0% 0% repeat scroll transparent','0',0,'url(effect/source/bg/foot.gif) repeat-x','1','index',1),(241,'会员主页','member','homepage',130,441,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',15),(5,'会员登录','member','login',132,358,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',1),(6,'重设密码','member','lostpass',132,318,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',2),(12,'会员注册','member','reg',132,438,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(202,'会员中心首页','member','main',132,505,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',1),(203,'登录帐号设置','member','account',132,281,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',2),(204,'头像签名设置','member','person',132,385,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',3),(205,'详细资料修改','member','detail',132,461,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',5),(206,'联系信息设置','member','contact',132,367,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',6),(207,'会员公告详情','member','notice',176,350,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',7),(208,'文章发布','member','newsfabu',292,760,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',8),(209,'文章管理','member','newsgl',292,216,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',9),(210,'文章修改','member','newsmodify',130,785,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',10),(231,'我的收藏夹','member','fav',132,223,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',12),(232,'我的好友','member','friends',130,368,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',12),(233,'我的留言','member','comment',132,411,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',13),(228,'文章分类','member','newscat',292,216,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',9),(234,'我的站内短信','member','msn',132,366,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',15),(2,'文章检索','news','query',132,362,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','catid',2),(3,'文章正文','news','detail',132,395,202,'','0','0','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','id',3),(33,'频道首页','news','main',132,362,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','index',0),(129,'内容页','page','html',132,1112,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','id',1),(16,'全站搜索','search','search',291,2950,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',2),(246,'我的积分','member','membercent',130,498,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',19),(247,'会员文章','news','membernews',130,420,33,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',12),(274,'产品频道首页','product','main',132,617,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none 0% 0% repeat scroll transparent','',0,0,'auto','url(effect/source/bg/topbg.gif) 50% 0% repeat-x','0','none 0% 0% repeat scroll transparent','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','index',1),(275,'产品查询','product','query',132,617,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','catid',2),(276,'产品详情','product','detail',132,897,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none 0% 0% repeat scroll transparent','',0,0,'auto','url(effect/source/bg/topbg.gif) 50% 0% repeat-x','0','none 0% 0% repeat scroll transparent','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','id',3),(277,'会员产品','product','memberproduct',164,290,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',12),(278,'产品管理','member','productgl',265,737,161,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',1),(279,'产品发布','member','productfabu',265,442,161,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',0),(280,'产品修改','member','productmodify',265,498,161,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',0),(281,'产品分类','member','productcat',265,336,161,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',9),(289,'图文频道首页','photo','main',290,505,40,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','index',1),(290,'图片查询','photo','query',290,514,40,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','catid',2),(291,'图片详情','photo','detail',292,655,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','id',3),(292,'会员图片','photo','memberphoto',164,290,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',12),(293,'图片管理','member','photogl',162,267,150,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',1),(294,'图片发布','member','photofabu',164,435,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',0),(295,'图片修改','member','photomodify',164,493,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',0),(296,'图片分类','member','photocat',147,267,150,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',9),(297,'下载首页','down','main',132,214,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','index',1),(298,'下载检索页','down','query',132,214,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','catid',2),(299,'下载详情','down','detail',132,414,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','id',3),(300,'会员资源下载','down','memberdown',164,177,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',12),(301,'下载管理','member','downgl',147,440,150,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',5),(302,'下载发布','member','downfabu',164,393,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',6),(303,'下载修改','member','downmodify',164,422,152,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',7),(304,'下载分类','member','downcat',147,275,150,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',9),(305,'客户服务','service','main',292,616,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',1),(306,'客服问题提交','member','service',132,623,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',15),(307,'客服工单查询','member','feedback',132,362,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',16),(308,'工单详情','member','feedbacklook',292,462,42,'','','','#0177a9','url(effect/source/bg/1238691760.jpg)','0% 0%','repeat-x','fixed',900,'#ffffff','',0,0,'auto','#ffffff','900','#ffffff','900',0,'#8bcd01','900','0',16),(309,'存档工单查询','member','feedbackhis',132,223,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',19),(310,'分组首页','page','html_main',200,500,200,'','','','','','','repeat','scroll',900,'#ffffff','',0,10,'auto','transparent','900','transparent','900',10,'transparent','900','0',0),(311,'会员付款记录','member','paylist',164,327,152,'','','','','','0% 0%','repeat','scroll',900,'','',10,10,'auto','','900','none transparent scroll repeat 0% 0%','900',10,'none transparent scroll repeat 0% 0%','900','0',19),(312,'会员消费记录','member','buylist',164,327,152,'','','','','','0% 0%','repeat','scroll',900,'','',10,10,'auto','','900','none transparent scroll repeat 0% 0%','900',10,'none transparent scroll repeat 0% 0%','900','0',19),(313,'帐户在线充值','member','onlinepay',164,327,152,'','','','','','0% 0%','repeat','scroll',900,'','',10,10,'auto','','900','none transparent scroll repeat 0% 0%','900',10,'none transparent scroll repeat 0% 0%','900','0',19),(314,'公司简介','page','html_company',132,949,202,'公司简介','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(315,'FIT天地通','page','fit',132,1669,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','id',0),(316,'FIT天地通','page','fit_main',200,500,200,'','','','','','','repeat','scroll',900,'#ffffff','',0,10,'auto','transparent','900','transparent','900',10,'transparent','900','0',0),(317,'FIT手机使用帮助','page','fit_mobilehelp',132,1669,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(318,'FIT网关使用帮助','page','fit_nethelp',132,1430,202,'','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(319,'行业应用','news','class_2',132,782,202,'行业应用','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','index',0),(320,'解决方案','page','fit_solution',132,751,202,'解决方案','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(321,'联系我们','page','html_contact',132,151,202,'联系我们','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0),(322,'新闻动态','page','html_news',132,362,202,'新闻动态','','','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1','0',0);
/*!40000 ALTER TABLE `pwn_base_pageset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_pagetemp`
--

DROP TABLE IF EXISTS `pwn_base_pagetemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_pagetemp` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tempname` varchar(50) NOT NULL,
  `bgcolor` varchar(100) NOT NULL,
  `bgimage` varchar(100) NOT NULL,
  `bgposition` varchar(20) NOT NULL,
  `bgrepeat` varchar(20) NOT NULL DEFAULT 'repeat',
  `bgatt` varchar(10) NOT NULL DEFAULT 'scroll',
  `containwidth` int(5) NOT NULL DEFAULT '900',
  `containbg` varchar(100) NOT NULL DEFAULT '#ffffff',
  `containimg` varchar(100) NOT NULL,
  `containmargin` int(2) NOT NULL DEFAULT '0',
  `containpadding` int(2) NOT NULL DEFAULT '10',
  `containcenter` char(10) NOT NULL DEFAULT 'auto',
  `topbg` varchar(100) NOT NULL DEFAULT 'transparent',
  `topwidth` char(10) NOT NULL DEFAULT '900',
  `contentbg` varchar(100) NOT NULL DEFAULT 'transparent',
  `contentwidth` char(10) NOT NULL DEFAULT '900',
  `contentmargin` int(2) NOT NULL DEFAULT '10',
  `bottombg` varchar(100) NOT NULL DEFAULT 'transparent',
  `bottomwidth` char(10) NOT NULL DEFAULT '900',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_pagetemp`
--

LOCK TABLES `pwn_base_pagetemp` WRITE;
/*!40000 ALTER TABLE `pwn_base_pagetemp` DISABLE KEYS */;
INSERT INTO `pwn_base_pagetemp` VALUES (43,'index','transparent','url(effect/source/bg/top.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',0,'url(effect/source/bg/foot.gif) repeat-x','1'),(44,'inner','transparent','url(effect/source/bg/1395373202.gif)','0% 0%','repeat-x','scroll',1002,'none transparent scroll repeat 0% 0%','',0,0,'auto','url(effect/source/bg/topbg.gif) repeat-x 50% 0%','0','none transparent scroll repeat 0% 0%','0',24,'url(effect/source/bg/foot.gif) repeat-x','1');
/*!40000 ALTER TABLE `pwn_base_pagetemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_plus`
--

DROP TABLE IF EXISTS `pwn_base_plus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_plus` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL,
  `pluslable` varchar(100) DEFAULT '0',
  `plusname` varchar(50) NOT NULL,
  `plustype` varchar(50) DEFAULT '0',
  `pluslocat` varchar(50) DEFAULT '0',
  `tempname` varchar(100) NOT NULL DEFAULT '0',
  `tempcolor` varchar(2) NOT NULL,
  `showborder` char(20) NOT NULL DEFAULT '0',
  `bordercolor` varchar(7) NOT NULL DEFAULT '#dddddd',
  `borderwidth` int(2) NOT NULL DEFAULT '1',
  `borderstyle` varchar(10) NOT NULL DEFAULT 'solid',
  `borderlable` varchar(150) NOT NULL,
  `borderroll` varchar(10) NOT NULL,
  `showbar` varchar(10) NOT NULL DEFAULT 'none',
  `barbg` varchar(10) NOT NULL DEFAULT '#cccccc',
  `barcolor` varchar(10) NOT NULL DEFAULT '#ffffff',
  `backgroundcolor` varchar(7) NOT NULL DEFAULT '#ffffff',
  `morelink` varchar(100) NOT NULL DEFAULT 'http://',
  `width` int(5) NOT NULL DEFAULT '100',
  `height` int(5) NOT NULL DEFAULT '100',
  `top` int(5) NOT NULL DEFAULT '0',
  `left` int(5) NOT NULL DEFAULT '0',
  `zindex` int(2) NOT NULL DEFAULT '99',
  `padding` int(11) NOT NULL DEFAULT '0',
  `shownums` int(10) NOT NULL DEFAULT '0',
  `ord` varchar(100) NOT NULL DEFAULT 'id',
  `sc` varchar(10) NOT NULL DEFAULT 'desc',
  `showtj` int(5) NOT NULL DEFAULT '0',
  `cutword` int(20) DEFAULT '0',
  `target` varchar(30) DEFAULT '0',
  `catid` int(100) NOT NULL DEFAULT '0',
  `cutbody` int(5) NOT NULL DEFAULT '0',
  `picw` int(3) NOT NULL DEFAULT '100',
  `pich` int(3) NOT NULL DEFAULT '100',
  `fittype` char(10) NOT NULL DEFAULT 'fill',
  `title` varchar(100) NOT NULL,
  `body` text,
  `pic` varchar(255) NOT NULL,
  `piclink` char(255) NOT NULL DEFAULT '-1',
  `attach` varchar(255) NOT NULL,
  `movi` varchar(255) NOT NULL,
  `sourceurl` varchar(30) NOT NULL,
  `word` char(255) NOT NULL,
  `word1` char(255) NOT NULL,
  `word2` char(255) NOT NULL,
  `word3` char(255) NOT NULL DEFAULT '',
  `word4` char(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `text1` text NOT NULL,
  `code` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `link1` char(255) NOT NULL DEFAULT '',
  `link2` char(255) NOT NULL DEFAULT '',
  `link3` char(255) NOT NULL,
  `link4` char(255) NOT NULL,
  `tags` char(30) NOT NULL,
  `groupid` varchar(20) NOT NULL DEFAULT '',
  `projid` varchar(20) NOT NULL DEFAULT '',
  `modno` int(3) NOT NULL DEFAULT '0',
  `setglobal` int(5) NOT NULL DEFAULT '0',
  `overflow` varchar(20) NOT NULL DEFAULT 'hidden',
  `bodyzone` varchar(10) NOT NULL DEFAULT 'content',
  `display` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4826 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_plus`
--

LOCK TABLES `pwn_base_plus` WRITE;
/*!40000 ALTER TABLE `pwn_base_plus` DISABLE KEYS */;
INSERT INTO `pwn_base_plus` VALUES (4041,'news','modNewsGl','文章管理','member','newsgl','tpl_news_gl.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',718,164,41,182,9,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','文章管理','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4726,'product','modProductList','自选产品列表','member','reg','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,350,0,0,90,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4621,'menu','modMainMenu','一级导航菜单','news','class_2','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4800,'menu','modBottomMenu','底部菜单（一级）','member','comment','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4040,'diy','modButtomInfo','底部信息编辑区','member','newsgl','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(627,'menu','modBottomMenu','底部菜单（一级）','member','notice','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(3953,'member','modMemberNotice','会员公告(列表)','member','main','tpl_member_notice.htm','-1','E012','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',766,194,309,235,8,12,5,'id','desc',0,25,'_self',0,-1,-1,-1,'fill','会员公告','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4227,'diy','modHeadPic','头部自定义效果图','advs','link','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4567,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',328,130,259,338,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299907.jpg','{#RP#}product/html/?45.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',3,0,'hidden','content','block'),(4187,'effect','modHeadTraFlash','头部透明flash特效','member','photocat','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4790,'menu','modBottomMenu','底部菜单（一级）','member','msn','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(3621,'diy','modPic','图片/FLASH','search','search','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',575,289,0,205,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','图片','-1 ','diy/pics/20090328/1238248377.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4001,'member','modMemberFriends','我的好友','member','friends','tpl_member_friends.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',604,336,30,176,90,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','我的好友','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4186,'effect','modHeadTraFlash','头部透明flash特效','member','photomodify','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4185,'effect','modHeadTraFlash','头部透明flash特效','member','photofabu','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4184,'effect','modHeadTraFlash','头部透明flash特效','member','photogl','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4301,'product','modProductNavPath','当前位置提示条','product','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',767,36,7,235,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4652,'product','modProductQuery','产品检索搜索','product','main','tpl_product_query_1.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,565,50,236,8,0,10,'id','desc',0,30,'_blank',0,160,160,120,'fill','产品检索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3951,'member','modMemberInfo','会员登录信息','member','main','tpl_memberinfo.htm','-1','E012','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',767,247,60,235,9,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录信息','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3950,'member','modMemberNavPath','当前位置提示条','member','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4740,'menu','modBottomMenu','底部菜单（一级）','member','account','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4639,'menu','modMainMenu','一级导航菜单','page','html_news','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3928,'member','modMemberReg','会员注册','member','reg','tpl_reg.htm','-1','1000','',0,'solid','','click','none','','','#fff','-1',765,376,60,237,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员注册','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3936,'member','modMemberNavPath','当前位置提示条','member','reg','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4324,'member','modMemberNavPath','当前位置提示条','member','login','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3934,'member','modMemberLogin','会员登录表单(大)','member','login','tpl_member_login.htm','-1','1000','',0,'solid','','click','none','','','#fff','-1',713,282,74,285,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4720,'product','modProductList','自选产品列表','member','login','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,8,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4183,'effect','modHeadTraFlash','头部透明flash特效','photo','memberphoto','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4760,'menu','modBottomMenu','底部菜单（一级）','member','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4770,'menu','modBottomMenu','底部菜单（一级）','member','contact','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4000,'diy','modButtomInfo','底部信息编辑区','member','friends','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4033,'news','modNewsFabu','文章发布表单','member','newsfabu','tpl_news_fabu.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',610,715,43,192,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','文章发布','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4032,'diy','modButtomInfo','底部信息编辑区','member','newsfabu','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4039,'menu','modBottomMenu','底部菜单（一级）','member','newsgl','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,7,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4226,'menu','modBottomMenu','底部菜单（一级）','advs','link','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4049,'news','modNewsMyCat','文章分类管理','member','newscat','tpl_news_mycat.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',719,122,43,181,9,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','文章分类管理','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4048,'diy','modButtomInfo','底部信息编辑区','member','newscat','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(565,'member','modMemberNoticeContent','会员公告详情','member','notice','tpl_member_notice_content.htm','','A001','#4682b4',1,'solid','','','block','#4682b4','#fff','#fff','-1',700,318,30,200,6,20,-1,'id','desc',0,-1,'_self',0,-1,100,100,'fill','会员公告','-1 ','-1','-1','','-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content',''),(566,'member','modMemberNavPath','当前位置提示条','member','notice','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4824,'diy','modButtomInfo','底部信息编辑区','member','lostpass','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4229,'advs','modLinkPic','图片友情链接','advs','link','tpl_linkpic.htm','-1','A525','#dddddd',0,'solid','','click','block','#cccccc','#fff','#fff','http://',671,290,0,229,90,20,6,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','友情链接','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','content','block'),(4225,'effect','modHeadTraFlash','头部透明flash特效','advs','link','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(3620,'advs','modLogo','网站标志','search','search','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3619,'menu','modVMenu','竖式导航菜单','search','search','tpl_vmenu_c002.htm','E','1000','',0,'solid','','click','none','','','','-1',195,181,107,0,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','导航菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4348,'diy','modHeadPic','头部自定义效果图','photo','detail','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4025,'member','modMemberCentLog','会员积分查询','member','membercent','tpl_member_centlog.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',601,466,30,175,90,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','我的积分','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3922,'advs','modLogo','网站标志','comment','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3623,'search','modSearch','全站搜索结果','search','search','tpl_search.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',780,2898,50,0,7,0,-1,'id','desc',0,30,'_self',0,-1,-1,-1,'fill','全站搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3624,'search','modSearchForm','全站搜索表单','search','search','tpl_searchform.htm','-1','A500','',0,'solid','','click','none','','','','-1',780,33,0,0,8,3,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','全站搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(2699,'member','modMemberNavPath','当前位置提示条','member','productcat','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(2683,'member','modMemberNavPath','当前位置提示条','member','productgl','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(2675,'member','modMemberNavPath','当前位置提示条','member','productfabu','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4644,'page','modPageNavPath','当前位置提示条','page','html_news','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,11,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4637,'advs','modLogo','网站标志','page','html_news','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4635,'news','modNewsContent','文章正文','news','detail','tpl_newscontent.htm','-1','A519','',0,'solid','','click','none','','','','-1',1000,393,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4823,'menu','modTopMenu','顶部菜单(一级)','member','lostpass','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4337,'diy','modButtomInfo','底部信息编辑区','photo','query','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4326,'product','modProductTwoClass','产品二级分类','photo','main','tpl_producttwoclass_1.htm','-1','C522','#eeeeee',1,'solid','','click','none','','','#f5f5f5','-1',210,330,175,0,7,15,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品系列','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4179,'effect','modHeadTraFlash','头部透明flash特效','member','productcat','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4638,'menu','modBottomMenu','底部菜单（一级）','page','html_news','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4178,'effect','modHeadTraFlash','头部透明flash特效','member','productmodify','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(3910,'comment','modCommentQuery','点评检索','comment','query','tpl_comment_query.htm','-1','1000','#dcdcdc',1,'solid','','click','none','#e6e6fa','#fff','#fff','-1',679,753,38,221,6,0,20,'id','desc',0,30,'_self',0,-1,-1,-1,'fill','点评检索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3909,'comment','modCommentSearchForm','点评搜索表单','comment','query','tpl_comment_searchform.htm','-1','A526','',0,'solid','','click','none','','','','-1',679,35,0,221,7,3,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','点评搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3908,'advs','modLogo','网站标志','comment','query','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4177,'effect','modHeadTraFlash','头部透明flash特效','member','productfabu','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4047,'menu','modBottomMenu','底部菜单（一级）','member','newscat','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,7,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4779,'diy','modButtomInfo','底部信息编辑区','member','fav','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4024,'diy','modButtomInfo','底部信息编辑区','member','membercent','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(3999,'menu','modBottomMenu','底部菜单（一级）','member','friends','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4780,'menu','modBottomMenu','底部菜单（一级）','member','fav','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4750,'menu','modBottomMenu','底部菜单（一级）','member','person','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(3949,'menu','modMemberMenu','会员功能菜单','member','main','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4176,'effect','modHeadTraFlash','头部透明flash特效','member','productgl','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4739,'diy','modButtomInfo','底部信息编辑区','member','account','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4175,'effect','modHeadTraFlash','头部透明flash特效','product','memberproduct','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4065,'news','modMemberNewsList','会员最新文章','member','homepage','tpl_newslist.htm','-1','K001','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}news/membernews.php?mid={#mid#}',308,408,31,472,6,10,20,'id','desc',0,20,'_self',0,-1,-1,-1,'fill','我的文章','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3919,'menu','modBottomMenu','底部菜单（一级）','comment','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4690,'product','modProductNavPath','当前位置提示条','product','detail','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',767,36,7,235,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4788,'menu','modMemberMenu','会员功能菜单','member','msn','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4749,'diy','modButtomInfo','底部信息编辑区','member','person','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(3996,'advs','modLogo','网站标志','member','friends','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4778,'menu','modMemberMenu','会员功能菜单','member','fav','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4777,'member','modMemberNavPath','当前位置提示条','member','fav','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,19,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4171,'effect','modHeadTraFlash','头部透明flash特效','news','membernews','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4031,'menu','modBottomMenu','底部菜单（一级）','member','newsfabu','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,8,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4170,'effect','modHeadTraFlash','头部透明flash特效','member','membercent','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4064,'member','modMemberHomeInfo','会员信息','member','homepage','tpl_member_homeinfo.htm','-1','K001','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',465,207,27,0,7,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员信息','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4063,'member','modMemberIntro','会员简介','member','homepage','tpl_member_intro.htm','-1','K001','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',465,196,237,0,8,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员简介','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4062,'advs','modLogo','网站标志','member','homepage','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4758,'menu','modMemberMenu','会员功能菜单','member','detail','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4169,'effect','modHeadTraFlash','头部透明flash特效','search','search','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4079,'diy','modHeadPic','头部自定义效果图','member','homepage','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4798,'menu','modMemberMenu','会员功能菜单','member','comment','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4822,'advs','modLogo','网站标志','member','lostpass','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4404,'effect','modHeadTraFlash','头部透明flash特效','comment','detail','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4403,'diy','modButtomInfo','底部信息编辑区','comment','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4402,'menu','modBottomMenu','底部菜单（一级）','comment','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4073,'member','modMemberNavPath','当前位置提示条','member','homepage','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4072,'news','modMemberNewsQuery','会员文章检索','news','membernews','tpl_newsquery.htm','-1','K001','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',780,383,35,0,90,10,20,'id','desc',0,30,'_self',0,-1,-1,-1,'fill','会员文章','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4071,'news','modNewsNavPath','当前位置提示条','news','membernews','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',650,30,0,0,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','当前位置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4070,'advs','modLogo','网站标志','news','membernews','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3618,'diy','modButtomInfo','底部信息编辑区','search','search','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4023,'menu','modBottomMenu','底部菜单（一级）','member','membercent','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4020,'advs','modLogo','网站标志','member','membercent','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4057,'news','modNewsModify','文章修改表单','member','newsmodify','tpl_news_modify.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',606,745,38,174,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','文章修改','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4056,'diy','modButtomInfo','底部信息编辑区','member','newsmodify','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4055,'menu','modBottomMenu','底部菜单（一级）','member','newsmodify','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4027,'menu','modMemberMenu','会员功能菜单','member','newsfabu','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4028,'advs','modLogo','网站标志','member','newsfabu','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4035,'menu','modMemberMenu','会员功能菜单','member','newsgl','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4036,'advs','modLogo','网站标志','member','newsgl','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(2691,'member','modMemberNavPath','当前位置提示条','member','productmodify','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4738,'menu','modMemberMenu','会员功能菜单','member','account','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4748,'menu','modMemberMenu','会员功能菜单','member','person','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4757,'member','modMemberNavPath','当前位置提示条','member','detail','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,16,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4222,'advs','modLogo','网站标志','advs','link','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4077,'diy','modHeadPic','头部自定义效果图','comment','main','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4789,'diy','modButtomInfo','底部信息编辑区','member','msn','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4075,'diy','modHeadPic','头部自定义效果图','comment','query','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4221,'page','modPageTitleMenu','网页标题(菜单)','advs','link','tpl_page_titlemenu_1007.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',212,301,0,0,7,0,10,'id','desc',0,12,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','content','block'),(4686,'advs','modLogo','网站标志','product','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4687,'diy','modButtomInfo','底部信息编辑区','product','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4787,'member','modMemberNavPath','当前位置提示条','member','msn','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,15,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4737,'member','modMemberNavPath','当前位置提示条','member','account','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4797,'member','modMemberNavPath','当前位置提示条','member','comment','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4163,'effect','modHeadTraFlash','头部透明flash特效','member','newscat','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4747,'member','modMemberNavPath','当前位置提示条','member','person','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,17,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4563,'diy','modEdit','HTML编辑区','index','index','tpl_edit.htm','-1','A522','',0,'solid','','click','none','','','','-1',330,213,28,0,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','公司简介','\r\n\r\n\r\n<div style=\"font:12px/24px arial,simsun;color:#666;\">　　中国交通通信信息中心（http://www.cttic.cn  Transport Telecommunications &amp; Information Center ，英文缩写CTTIC，以下简称通信信息中心），作爲中华人民共和国交通运输部直属事业单位，受交通运输部委托拟订并组织实施交通运输行业通信、导航、无线电和信息化管理的技术政策、技术标淮、规章制度；代交通运输部行使交通运输部无线电行政许可和行政审批职责......<a href=\"page/html/company.php\" style=\"color:#0191D0\">[详细内容]</a></div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4649,'menu','modTopMenu','顶部菜单(一级)','product','main','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4651,'product','modProductList','自选产品列表','product','main','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,7,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4660,'product','modProductNavPath','当前位置提示条','product','query','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',767,36,7,235,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4659,'menu','modTopMenu','顶部菜单(一级)','product','query','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4658,'product','modProductQuery','产品检索搜索','product','query','tpl_product_query_1.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,565,50,236,8,0,10,'id','desc',0,30,'_blank',0,160,160,120,'fill','产品检索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4771,'member','modMemberContact','联系信息设置表单','member','contact','tpl_member_contact.htm','-1','1000','',0,'solid','','click','none','','','','-1',700,299,66,253,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','联系信息设置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4769,'diy','modButtomInfo','底部信息编辑区','member','contact','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4759,'diy','modButtomInfo','底部信息编辑区','member','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(3905,'menu','modBottomMenu','底部菜单（一级）','comment','query','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4161,'effect','modHeadTraFlash','头部透明flash特效','member','friends','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4400,'diy','modHeadPic','头部自定义效果图','comment','detail','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4398,'comment','modCommentSearchForm','点评搜索表单','comment','detail','tpl_comment_searchform.htm','-1','A526','',0,'solid','','click','none','','','','-1',679,35,0,221,6,3,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','点评搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4399,'advs','modLogo','网站标志','comment','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(2676,'menu','modMemberMenu','会员功能菜单','member','productfabu','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2677,'menu','modBottomMenu','底部菜单（一级）','member','productfabu','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4781,'member','modMemberFav','我的收藏夹','member','fav','tpl_member_fav.htm','-1','1000','',0,'solid','','click','none','','','','-1',763,115,66,237,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','我的收藏夹','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2680,'product','modProductFabu','产品发布表单','member','productfabu','tpl_product_fabu.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',700,405,35,200,90,20,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品发布','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2684,'menu','modMemberMenu','会员功能菜单','member','productgl','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2685,'menu','modBottomMenu','底部菜单（一级）','member','productgl','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4618,'diy','modButtomInfo','底部信息编辑区','page','html','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(2688,'product','modProductGl','产品管理','member','productgl','tpl_product_gl.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',700,700,35,200,90,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品管理','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2692,'menu','modMemberMenu','会员功能菜单','member','productmodify','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2693,'menu','modBottomMenu','底部菜单（一级）','member','productmodify','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(3144,'diy','modButtomInfo','底部信息编辑区','index','index','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(2696,'product','modProductModify','产品修改表单','member','productmodify','tpl_product_modify.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',700,463,33,200,90,20,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品修改','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2700,'menu','modMemberMenu','会员功能菜单','member','productcat','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(2701,'menu','modBottomMenu','底部菜单（一级）','member','productcat','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4159,'effect','modHeadTraFlash','头部透明flash特效','member','newsmodify','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4570,'diy','modEdit','HTML编辑区','index','index','tpl_edit.htm','-1','1000','',0,'solid','','click','none','','','','-1',628,53,431,37,9,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<div style=\"color:#666;font-family:arial\"><span style=\"margin-right:50px;\">0086-563-2825976</span><span style=\"margin-right:40px;\">zhongyutx2012@aliyun.com</span>安徽省宣城市锦城北路丽晶国际中心A1604</div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',2,0,'hidden','content','block'),(2704,'product','modProductMyCat','产品分类管理','member','productcat','tpl_product_mycat.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',700,300,34,200,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品分类管理','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(3904,'diy','modButtomInfo','底部信息编辑区','comment','query','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4569,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1000,44,414,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1\r\n\r\n\r\n','diy/pics/20140320/1395299987.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',5,0,'hidden','content','block'),(4566,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',328,130,259,0,10,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299878.jpg','{#RP#}product/html/?44.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',2,0,'hidden','content','block'),(3520,'advs','modLogo','网站标志','index','index','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4564,'news','modNewsList','文章列表','index','index','tpl_newslist.htm','-1','A522','',0,'solid','','click','none','','','','',330,184,28,359,11,0,6,'dtime','desc',0,24,'_self',1,50,-1,-1,'fill','新闻中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',3,0,'hidden','content','block'),(4576,'advs','modLogo','网站标志','page','html_company','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4565,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',56,18,211,619,12,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299710.gif','{#RP#}page/html/news.php','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3918,'diy','modButtomInfo','底部信息编辑区','comment','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4158,'effect','modHeadTraFlash','头部透明flash特效','member','newsgl','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4059,'menu','modBottomMenu','底部菜单（一级）','member','homepage','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4058,'diy','modButtomInfo','底部信息编辑区','member','homepage','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4821,'menu','modBottomMenu','底部菜单（一级）','member','lostpass','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4725,'diy','modButtomInfo','底部信息编辑区','member','reg','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4731,'diy','modButtomInfo','底部信息编辑区','member','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4741,'member','modMemberAccount','登录账号设置表单','member','account','tpl_member_account.htm','-1','1000','',0,'solid','','click','none','','','','-1',700,200,59,233,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','登录帐号设置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4734,'advs','modLogo','网站标志','member','account','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4751,'member','modMemberPerson','头像签名设置表单','member','person','tpl_member_person.htm','-1','1000','',0,'solid','','click','none','','','','-1',700,313,70,269,99,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','头像签名设置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4761,'member','modMemberDetail','个人资料修改表单','member','detail','tpl_member_detail.htm','-1','1000','',0,'solid','','click','none','','','','-1',700,390,69,268,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','个人资料修改','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4768,'menu','modMemberMenu','会员功能菜单','member','contact','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4767,'member','modMemberNavPath','当前位置提示条','member','contact','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,13,236,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4717,'menu','modMainMenu','一级导航菜单','member','login','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4026,'member','modMemberNavPath','当前位置提示条','member','newsfabu','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4034,'member','modMemberNavPath','当前位置提示条','member','newsgl','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4157,'effect','modHeadTraFlash','头部透明flash特效','member','newsfabu','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4052,'advs','modLogo','网站标志','member','newsmodify','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4050,'member','modMemberNavPath','当前位置提示条','member','newsmodify','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4051,'menu','modMemberMenu','会员功能菜单','member','newsmodify','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4774,'advs','modLogo','网站标志','member','fav','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3994,'member','modMemberNavPath','当前位置提示条','member','friends','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(3995,'menu','modMemberMenu','会员功能菜单','member','friends','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4801,'member','modMemberComment','我的点评','member','comment','tpl_member_comment.htm','-1','1000','',0,'solid','','click','none','','','','-1',765,350,59,237,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','我的点评','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4156,'effect','modHeadTraFlash','头部透明flash特效','member','notice','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4044,'advs','modLogo','网站标志','member','newscat','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4042,'member','modMemberNavPath','当前位置提示条','member','newscat','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4043,'menu','modMemberMenu','会员功能菜单','member','newscat','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4791,'member','modMemberMsn','我的站内短信','member','msn','tpl_member_msn.htm','-1','1000','',0,'solid','','click','none','','','','-1',766,302,62,236,99,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','我的站内短信','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4675,'menu','modTopMenu','顶部菜单(一级)','news','query','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4631,'diy','modButtomInfo','底部信息编辑区','news','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4630,'menu','modTopMenu','顶部菜单(一级)','news','detail','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4673,'menu','modMainMenu','一级导航菜单','news','query','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4674,'menu','modBottomMenu','底部菜单（一级）','news','query','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4754,'advs','modLogo','网站标志','member','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4672,'advs','modLogo','网站标志','news','query','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(3617,'menu','modBottomMenu','底部菜单（一级）','search','search','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4018,'member','modMemberNavPath','当前位置提示条','member','membercent','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4019,'menu','modMemberMenu','会员功能菜单','member','membercent','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4067,'menu','modBottomMenu','底部菜单（一级）','news','membernews','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4066,'diy','modButtomInfo','底部信息编辑区','news','membernews','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4648,'menu','modMainMenu','一级导航菜单','product','main','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4147,'effect','modHeadTraFlash','头部透明flash特效','member','homepage','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4145,'effect','modHeadTraFlash','头部透明flash特效','comment','main','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4407,'comment','modCommentContent','点评详情','comment','detail','tpl_comment_content.htm','-1','1000','#def',0,'solid','','click','none','#def','#fff','#fff','-1',679,502,42,221,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','点评详情','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4219,'diy','modButtomInfo','底部信息编辑区','advs','link','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4143,'effect','modHeadTraFlash','头部透明flash特效','comment','query','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4657,'diy','modButtomInfo','底部信息编辑区','product','query','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(3532,'menu','modBottomMenu','底部菜单（一级）','index','index','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4668,'news','modNewsGlobalQuery','全站翻页文章列表','news','main','tpl_newsquery.htm','-1','1000','',0,'solid','','click','none','','','','-1',765,304,56,237,7,0,15,'id','desc',0,36,'_blank',1,50,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4716,'menu','modBottomMenu','底部菜单（一级）','member','login','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4825,'member','modResetPass','重设密码向导','member','lostpass','tpl_resetpass.htm','-1','1000','',0,'solid','','click','none','','','','-1',500,250,66,269,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','重设密码','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4722,'menu','modBottomMenu','底部菜单（一级）','member','reg','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4728,'menu','modBottomMenu','底部菜单（一级）','member','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4733,'menu','modMainMenu','一级导航菜单','member','account','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4744,'advs','modLogo','网站标志','member','person','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4753,'menu','modMainMenu','一级导航菜单','member','detail','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4764,'advs','modLogo','网站标志','member','contact','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4088,'diy','modHeadPic','头部自定义效果图','member','notice','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4089,'diy','modHeadPic','头部自定义效果图','member','newsfabu','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4090,'diy','modHeadPic','头部自定义效果图','member','newsgl','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4091,'diy','modHeadPic','头部自定义效果图','member','newsmodify','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4773,'menu','modMainMenu','一级导航菜单','member','fav','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4093,'diy','modHeadPic','头部自定义效果图','member','friends','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4095,'diy','modHeadPic','头部自定义效果图','member','newscat','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4629,'menu','modBottomMenu','底部菜单（一级）','news','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4669,'news','modNewsNavPath','当前位置提示条','news','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,12,236,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4617,'menu','modTopMenu','顶部菜单(一级)','page','html','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4101,'diy','modHeadPic','头部自定义效果图','search','search','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4102,'diy','modHeadPic','头部自定义效果图','member','membercent','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4103,'diy','modHeadPic','头部自定义效果图','news','membernews','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4647,'menu','modBottomMenu','底部菜单（一级）','product','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4656,'advs','modLogo','网站标志','product','query','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4691,'product','modProductContent','产品详情','product','detail','tpl_product_content.htm','-1','1000','',0,'solid','','click','none','','','','-1',766,845,50,236,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4689,'menu','modTopMenu','顶部菜单(一级)','product','detail','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4107,'diy','modHeadPic','头部自定义效果图','product','memberproduct','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4108,'diy','modHeadPic','头部自定义效果图','member','productgl','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4109,'diy','modHeadPic','头部自定义效果图','member','productfabu','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4110,'diy','modHeadPic','头部自定义效果图','member','productmodify','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4111,'diy','modHeadPic','头部自定义效果图','member','productcat','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4325,'diy','modButtomInfo','底部信息编辑区','photo','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4336,'product','modProductTwoClass','产品二级分类','photo','query','tpl_producttwoclass_1.htm','-1','C522','#eeeeee',1,'solid','','click','none','','','#f5f5f5','-1',210,330,178,0,7,15,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','产品系列','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4347,'advs','modLogo','网站标志','photo','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4115,'diy','modHeadPic','头部自定义效果图','photo','memberphoto','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4116,'diy','modHeadPic','头部自定义效果图','member','photogl','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4117,'diy','modHeadPic','头部自定义效果图','member','photofabu','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4118,'diy','modHeadPic','头部自定义效果图','member','photomodify','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4119,'diy','modHeadPic','头部自定义效果图','member','photocat','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4123,'diy','modHeadPic','头部自定义效果图','down','memberdown','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4124,'diy','modHeadPic','头部自定义效果图','member','downgl','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4125,'diy','modHeadPic','头部自定义效果图','member','downfabu','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4126,'diy','modHeadPic','头部自定义效果图','member','downmodify','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4127,'diy','modHeadPic','头部自定义效果图','member','downcat','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4418,'service','modForm','客户服务表单','service','main','tpl_form.htm','-1','1000','#dddddd',0,'dotted','','click','none','#cccccc','#fff','#fff','-1',666,574,40,225,8,10,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','客户服务','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'visible','content','block'),(4449,'menu','modMemberMenu','会员功能菜单','member','service','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,221,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4458,'menu','modMemberMenu','会员功能菜单','member','feedback','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,221,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4467,'menu','modMemberMenu','会员功能菜单','member','feedbacklook','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,214,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4476,'menu','modMemberMenu','会员功能菜单','member','feedbackhis','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,221,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4743,'menu','modMainMenu','一级导航菜单','member','person','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4568,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',324,130,259,678,13,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299930.jpg','{#RP#}product/html/?46.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',4,0,'hidden','content','block'),(4191,'effect','modHeadTraFlash','头部透明flash特效','down','memberdown','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4192,'effect','modHeadTraFlash','头部透明flash特效','member','downgl','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4193,'effect','modHeadTraFlash','头部透明flash特效','member','downfabu','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4194,'effect','modHeadTraFlash','头部透明flash特效','member','downmodify','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4195,'effect','modHeadTraFlash','头部透明flash特效','member','downcat','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4408,'diy','modButtomInfo','底部信息编辑区','service','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4466,'diy','modHeadPic','头部自定义效果图','member','feedbacklook','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4799,'diy','modButtomInfo','底部信息编辑区','member','comment','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4665,'advs','modLogo','网站标志','news','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4666,'menu','modMainMenu','一级导航菜单','news','main','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4664,'menu','modBottomMenu','底部菜单（一级）','news','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4616,'menu','modMainMenu','一级导航菜单','page','html','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4671,'news','modNewsNavPath','当前位置提示条','news','query','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,12,236,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4663,'menu','modTopMenu','顶部菜单(一级)','news','main','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4615,'menu','modBottomMenu','底部菜单（一级）','page','html','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4614,'advs','modLogo','网站标志','page','html','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4628,'advs','modLogo','网站标志','news','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4327,'effect','modHeadTraFlash','头部透明flash特效','photo','main','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4619,'advs','modLogo','网站标志','news','class_2','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4335,'photo','modPhotoNavPath','当前位置提示条','photo','main','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',670,30,0,230,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','当前位置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4330,'menu','modBottomMenu','底部菜单（一级）','photo','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4334,'photo','modPhotoSearchForm','图片搜索表单','photo','main','tpl_photo_searchform.htm','-1','A522','',0,'solid','','click','none','','','','-1',210,175,0,0,9,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','图片搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4332,'diy','modHeadPic','头部自定义效果图','photo','main','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4333,'advs','modLogo','网站标志','photo','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4338,'effect','modHeadTraFlash','头部透明flash特效','photo','query','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4620,'menu','modBottomMenu','底部菜单（一级）','news','class_2','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4349,'photo','modPhotoSearchForm','图片搜索表单','photo','detail','tpl_photo_searchform.htm','-1','A522','',0,'solid','','click','none','','','','-1',210,181,0,690,8,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','图片搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4341,'menu','modBottomMenu','底部菜单（一级）','photo','query','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4342,'photo','modPhotoSearchForm','图片搜索表单','photo','query','tpl_photo_searchform.htm','-1','A522','',0,'solid','','click','none','','','','-1',210,175,3,0,8,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','图片搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4343,'diy','modHeadPic','头部自定义效果图','photo','query','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4344,'advs','modLogo','网站标志','photo','query','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4346,'photo','modPhotoQuery','图片检索搜索','photo','query','tpl_photo_query.htm','-1','A525','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',671,514,0,229,9,0,9,'id','desc',0,30,'_self',0,-1,200,150,'fill','企业图库','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4350,'menu','modBottomMenu','底部菜单（一级）','photo','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,15,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4714,'diy','modButtomInfo','底部信息编辑区','down','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4353,'effect','modHeadTraFlash','头部透明flash特效','photo','detail','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4357,'photo','modPhotoPic','图片+名称','photo','detail','tpl_photopic.htm','-1','A522','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}photo/class/',210,474,179,690,9,10,6,'id','desc',0,12,'_self',0,-1,80,60,'fill','企业图库','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'hidden','content','block'),(4355,'diy','modButtomInfo','底部信息编辑区','photo','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4356,'photo','modPhotoContent','图片详情','photo','detail','tpl_photo_content.htm','-1','A525','',0,'solid','','click','none','','','','-1',670,565,0,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','企业图片','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4575,'diy','modPlusBorder','空白边框','index','index','tpl_plusborder.htm','-1','A522','#dddddd',1,'solid','','click','none','#cccccc','#fff','#fff','http://',285,36,29,717,18,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','行业应用','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4713,'menu','modTopMenu','顶部菜单(一级)','down','main','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4712,'down','modDownNavPath','当前位置提示条','down','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',765,36,16,236,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4710,'advs','modLogo','网站标志','down','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4711,'down','modDownQuery','下载检索搜索','down','main','tpl_down_query.htm','-1','1000','',0,'solid','','click','none','','','','-1',766,148,64,236,7,0,20,'id','desc',0,36,'_blank',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4371,'down','modDownNavPath','当前位置提示条','down','query','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',765,36,16,236,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4574,'news','modNewsPicLb','文章图片轮播','index','index','tpl_newspic_lb.htm','-1','1000','',0,'solid','','click','none','','','','-1',283,172,67,717,17,0,7,'id','asc',0,15,'_self',2,-1,-1,-1,'fill','','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','',1,0,'hidden','content','block'),(4695,'menu','modTopMenu','顶部菜单(一级)','down','query','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4696,'diy','modButtomInfo','底部信息编辑区','down','query','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4697,'down','modDownClass','下载分类（列表）','down','query','tpl_downclass.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',200,178,0,0,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','支持与下载','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4378,'down','modDownQuery','下载检索搜索','down','query','tpl_down_query.htm','-1','1000','',0,'solid','','click','none','','','','-1',766,148,64,236,7,0,20,'id','desc',0,36,'_blank',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4705,'diy','modButtomInfo','底部信息编辑区','down','detail','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4704,'menu','modTopMenu','顶部菜单(一级)','down','detail','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4573,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1,166,52,343,16,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','diy/pics/20140320/1395302903.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',6,0,'hidden','content','block'),(4706,'down','modDownContent','下载详情','down','detail','tpl_down_content.htm','-1','1000','',0,'solid','','click','none','','','','-1',765,348,64,237,90,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','下载详情','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4703,'down','modDownNavPath','当前位置提示条','down','detail','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',765,36,16,236,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4392,'comment','modCommentSearchForm','点评搜索表单','comment','main','tpl_comment_searchform.htm','-1','A522','',0,'solid','','click','none','','','','-1',210,179,0,0,7,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','点评搜索','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4699,'menu','modBottomMenu','底部菜单（一级）','down','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4393,'comment','modCommentClass','点评分类','comment','main','tpl_comment_class.htm','-1','A522','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',210,201,177,0,8,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','分类查询','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4394,'comment','modCommentNavPath','当前位置提示条','comment','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',676,35,0,224,9,8,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','当前位置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4395,'member','modLoginForm','会员登录表单','comment','query','tpl_loginform.htm','-1','A523','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',210,185,0,0,9,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4396,'comment','modCommentClass','点评分类','comment','query','tpl_comment_class.htm','-1','A522','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',210,200,181,0,10,15,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','分类导航','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4405,'member','modLoginForm','会员登录表单','comment','detail','tpl_loginform.htm','-1','A523','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',210,185,0,0,8,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4406,'comment','modCommentClass','点评分类','comment','detail','tpl_comment_class.htm','-1','A522','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',210,200,181,0,9,15,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','分类导航','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4784,'advs','modLogo','网站标志','member','msn','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4794,'advs','modLogo','网站标志','member','comment','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4763,'menu','modMainMenu','一级导航菜单','member','contact','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4410,'page','modPageTitleMenu','网页标题(菜单)','service','main','tpl_page_titlemenu_1007.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',212,301,0,0,7,0,10,'id','desc',0,12,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','content','block'),(4411,'advs','modLogo','网站标志','service','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4417,'service','modServiceNavPath','当前位置提示条','service','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',675,35,0,225,9,8,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','当前位置','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4414,'effect','modHeadTraFlash','头部透明flash特效','service','main','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4415,'menu','modBottomMenu','底部菜单（一级）','service','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,6,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4416,'diy','modHeadPic','头部自定义效果图','service','main','tpl_headpic.htm','-1','1000','',0,'solid','','click','none','','','','-1',900,250,40,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20090402/1238687380.jpg','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4793,'menu','modMainMenu','一级导航菜单','member','comment','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4783,'menu','modMainMenu','一级导航菜单','member','msn','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4450,'member','modMemberNavPath','当前位置提示条','member','service','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4806,'menu','modBottomMenu','底部菜单（一级）','member','service','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4805,'diy','modButtomInfo','底部信息编辑区','member','service','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4456,'service','modServiceForm','客户服务表单','member','service','tpl_serviceform.htm','-1','1000','#dddddd',1,'solid','','click','none','#cccccc','#fff','#fff','-1',766,564,57,236,8,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','有问必答','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'visible','content','block'),(4459,'member','modMemberNavPath','当前位置提示条','member','feedback','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4811,'menu','modBottomMenu','底部菜单（一级）','member','feedback','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4571,'diy','modHeadTraFlashCyrano','自定义透明FLASH','index','index','tpl_headtraflash_cyrano.htm','-1','1000','',0,'solid','','click','none','','','','-1',1000,457,150,0,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395300606.swf','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4810,'diy','modButtomInfo','底部信息编辑区','member','feedback','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4465,'service','modServiceTaskList','客服工单查询','member','feedback','tpl_tasklist.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',767,299,61,235,8,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','客服工单查询','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4468,'member','modMemberNavPath','当前位置提示条','member','feedbacklook','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4469,'effect','modHeadTraFlash','头部透明flash特效','member','feedbacklook','tpl_flash3.htm','-1','1000','',0,'solid','','click','none','','','','-1',428,198,47,200,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(4470,'advs','modLogo','网站标志','member','feedbacklook','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',270,90,114,47,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4572,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1,166,49,693,15,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','diy/pics/20140320/1395302903.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',6,0,'hidden','content','block'),(4472,'menu','modBottomMenu','底部菜单（一级）','member','feedbacklook','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',331,33,7,0,7,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注栏目','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4473,'diy','modButtomInfo','底部信息编辑区','member','feedbacklook','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',350,22,15,548,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','脚注信息','\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4474,'service','modServiceTaskDetail','客服工单详情','member','feedbacklook','tpl_taskdetail.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',713,417,43,187,90,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','工单详情','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4477,'member','modMemberNavPath','当前位置提示条','member','feedbackhis','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4816,'menu','modBottomMenu','底部菜单（一级）','member','feedbackhis','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4562,'menu','modMainMenu','一级导航菜单','index','index','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4815,'diy','modButtomInfo','底部信息编辑区','member','feedbackhis','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4483,'service','modServiceTaskHis','存档工单查询','member','feedbackhis','tpl_taskhis.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',767,128,58,235,8,5,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','存档工单查询','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4503,'menu','modTopMenu','顶部菜单(一级)','advs','link','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4504,'menu','modTopMenu','顶部菜单(一级)','comment','query','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4505,'menu','modTopMenu','顶部菜单(一级)','comment','detail','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4506,'menu','modTopMenu','顶部菜单(一级)','comment','main','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4507,'menu','modTopMenu','顶部菜单(一级)','index','index','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4508,'menu','modTopMenu','顶部菜单(一级)','member','homepage','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4715,'advs','modLogo','网站标志','member','login','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4817,'member','modMemberNavPath','当前位置提示条','member','lostpass','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4721,'menu','modMainMenu','一级导航菜单','member','reg','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4727,'advs','modLogo','网站标志','member','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4732,'menu','modTopMenu','顶部菜单(一级)','member','account','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4742,'menu','modTopMenu','顶部菜单(一级)','member','person','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4752,'menu','modTopMenu','顶部菜单(一级)','member','detail','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4762,'menu','modTopMenu','顶部菜单(一级)','member','contact','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4517,'menu','modTopMenu','顶部菜单(一级)','member','notice','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4518,'menu','modTopMenu','顶部菜单(一级)','member','newsfabu','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4519,'menu','modTopMenu','顶部菜单(一级)','member','newsgl','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4520,'menu','modTopMenu','顶部菜单(一级)','member','newsmodify','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4772,'menu','modTopMenu','顶部菜单(一级)','member','fav','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4522,'menu','modTopMenu','顶部菜单(一级)','member','friends','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4792,'menu','modTopMenu','顶部菜单(一级)','member','comment','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4524,'menu','modTopMenu','顶部菜单(一级)','member','newscat','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4782,'menu','modTopMenu','顶部菜单(一级)','member','msn','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4670,'news','modNewsGlobalQuery','全站翻页文章列表','news','query','tpl_newsquery.htm','-1','1000','',0,'solid','','click','none','','','','-1',765,304,56,237,7,0,15,'id','desc',0,36,'_blank',1,50,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4627,'menu','modMainMenu','一级导航菜单','news','detail','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4661,'page','modPageTitleMenu','网页标题(菜单)','news','main','tpl_page_titlemenu.htm','-1','A521','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,178,0,0,6,0,10,'id','desc',0,12,'_self',0,-1,-1,-1,'fill','关于我们','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'visible','content','block'),(4613,'page','modPageContent','网页内容详情','page','html','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,1110,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4530,'menu','modTopMenu','顶部菜单(一级)','search','search','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4531,'menu','modTopMenu','顶部菜单(一级)','member','membercent','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4532,'menu','modTopMenu','顶部菜单(一级)','news','membernews','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4646,'advs','modLogo','网站标志','product','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4653,'product','modProductList','自选产品列表','product','query','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,7,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4685,'menu','modBottomMenu','底部菜单（一级）','product','detail','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4536,'menu','modTopMenu','顶部菜单(一级)','product','memberproduct','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4537,'menu','modTopMenu','顶部菜单(一级)','member','productgl','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4538,'menu','modTopMenu','顶部菜单(一级)','member','productfabu','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4539,'menu','modTopMenu','顶部菜单(一级)','member','productmodify','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4540,'menu','modTopMenu','顶部菜单(一级)','member','productcat','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4541,'menu','modTopMenu','顶部菜单(一级)','photo','main','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4542,'menu','modTopMenu','顶部菜单(一级)','photo','query','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4543,'menu','modTopMenu','顶部菜单(一级)','photo','detail','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4544,'menu','modTopMenu','顶部菜单(一级)','photo','memberphoto','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4545,'menu','modTopMenu','顶部菜单(一级)','member','photogl','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4546,'menu','modTopMenu','顶部菜单(一级)','member','photofabu','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4547,'menu','modTopMenu','顶部菜单(一级)','member','photomodify','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4548,'menu','modTopMenu','顶部菜单(一级)','member','photocat','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4707,'menu','modMainMenu','一级导航菜单','down','main','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4692,'advs','modLogo','网站标志','down','query','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4698,'menu','modMainMenu','一级导航菜单','down','detail','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4552,'menu','modTopMenu','顶部菜单(一级)','down','memberdown','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4553,'menu','modTopMenu','顶部菜单(一级)','member','downgl','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4554,'menu','modTopMenu','顶部菜单(一级)','member','downfabu','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4555,'menu','modTopMenu','顶部菜单(一级)','member','downmodify','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4556,'menu','modTopMenu','顶部菜单(一级)','member','downcat','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4557,'menu','modTopMenu','顶部菜单(一级)','service','main','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4802,'menu','modTopMenu','顶部菜单(一级)','member','service','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4807,'menu','modTopMenu','顶部菜单(一级)','member','feedback','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4560,'menu','modTopMenu','顶部菜单(一级)','member','feedbacklook','tpl_topmenu_white.htm','-1','1000','',0,'solid','','click','none','','','#72ae1d','-1',294,27,263,606,16,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4812,'menu','modTopMenu','顶部菜单(一级)','member','feedbackhis','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4650,'diy','modButtomInfo','底部信息编辑区','product','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4676,'page','modPageTitleMenu','网页标题(菜单)','news','query','tpl_page_titlemenu.htm','-1','A521','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,178,0,0,6,0,10,'id','desc',0,12,'_self',0,-1,-1,-1,'fill','关于我们','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'visible','content','block'),(4677,'diy','modButtomInfo','底部信息编辑区','news','query','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4718,'menu','modTopMenu','顶部菜单(一级)','member','login','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4719,'diy','modButtomInfo','底部信息编辑区','member','login','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4819,'product','modProductList','自选产品列表','member','lostpass','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,7,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4820,'menu','modMainMenu','一级导航菜单','member','lostpass','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4723,'advs','modLogo','网站标志','member','reg','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4724,'menu','modTopMenu','顶部菜单(一级)','member','reg','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4729,'menu','modMainMenu','一级导航菜单','member','main','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4730,'menu','modTopMenu','顶部菜单(一级)','member','main','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4654,'menu','modMainMenu','一级导航菜单','product','query','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4655,'menu','modBottomMenu','底部菜单（一级）','product','query','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4684,'menu','modMainMenu','一级导航菜单','product','detail','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4683,'product','modProductList','自选产品列表','product','detail','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,7,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4662,'diy','modButtomInfo','底部信息编辑区','news','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4708,'menu','modBottomMenu','底部菜单（一级）','down','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4709,'down','modDownClass','下载分类（列表）','down','main','tpl_downclass.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',200,178,0,0,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','支持与下载','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4693,'menu','modBottomMenu','底部菜单（一级）','down','query','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4694,'menu','modMainMenu','一级导航菜单','down','query','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4700,'down','modDownClass','下载分类（列表）','down','detail','tpl_downclass.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',200,178,0,0,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','支持与下载','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4701,'advs','modLogo','网站标志','down','detail','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4803,'menu','modMainMenu','一级导航菜单','member','service','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4804,'advs','modLogo','网站标志','member','service','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4808,'menu','modMainMenu','一级导航菜单','member','feedback','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4809,'advs','modLogo','网站标志','member','feedback','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4813,'menu','modMainMenu','一级导航菜单','member','feedbackhis','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4814,'advs','modLogo','网站标志','member','feedbackhis','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4577,'menu','modBottomMenu','底部菜单（一级）','page','html_company','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4579,'menu','modMainMenu','一级导航菜单','page','html_company','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4580,'menu','modTopMenu','顶部菜单(一级)','page','html_company','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4581,'diy','modButtomInfo','底部信息编辑区','page','html_company','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4583,'page','modPageContent','网页内容详情','page','html_contact','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,149,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4582,'page','modPageContent','网页内容详情','page','html_company','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,947,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4584,'advs','modLogo','网站标志','page','html_contact','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4585,'menu','modBottomMenu','底部菜单（一级）','page','html_contact','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4586,'menu','modMainMenu','一级导航菜单','page','html_contact','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4587,'menu','modTopMenu','顶部菜单(一级)','page','html_contact','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4588,'diy','modButtomInfo','底部信息编辑区','page','html_contact','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4589,'page','modPageContent','网页内容详情','page','fit_solution','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,749,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4590,'advs','modLogo','网站标志','page','fit_solution','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4591,'menu','modBottomMenu','底部菜单（一级）','page','fit_solution','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4592,'menu','modMainMenu','一级导航菜单','page','fit_solution','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4593,'menu','modTopMenu','顶部菜单(一级)','page','fit_solution','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4594,'diy','modButtomInfo','底部信息编辑区','page','fit_solution','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4595,'page','modPageContent','网页内容详情','page','fit_mobilehelp','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,1667,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4596,'advs','modLogo','网站标志','page','fit_mobilehelp','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4597,'menu','modBottomMenu','底部菜单（一级）','page','fit_mobilehelp','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4598,'menu','modMainMenu','一级导航菜单','page','fit_mobilehelp','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4599,'menu','modTopMenu','顶部菜单(一级)','page','fit_mobilehelp','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4600,'diy','modButtomInfo','底部信息编辑区','page','fit_mobilehelp','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4601,'page','modPageContent','网页内容详情','page','fit_nethelp','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,1428,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4602,'advs','modLogo','网站标志','page','fit_nethelp','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4603,'menu','modBottomMenu','底部菜单（一级）','page','fit_nethelp','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4604,'menu','modMainMenu','一级导航菜单','page','fit_nethelp','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4605,'menu','modTopMenu','顶部菜单(一级)','page','fit_nethelp','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4606,'diy','modButtomInfo','底部信息编辑区','page','fit_nethelp','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4607,'page','modPageContent','网页内容详情','page','fit','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,1667,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(4608,'advs','modLogo','网站标志','page','fit','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4609,'menu','modBottomMenu','底部菜单（一级）','page','fit','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(4610,'menu','modMainMenu','一级导航菜单','page','fit','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(4611,'menu','modTopMenu','顶部菜单(一级)','page','fit','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4612,'diy','modButtomInfo','底部信息编辑区','page','fit','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4622,'menu','modTopMenu','顶部菜单(一级)','news','class_2','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4623,'diy','modButtomInfo','底部信息编辑区','news','class_2','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4624,'news','modNewsList','文章列表','news','class_2','tpl_newslist_cat.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','',200,252,0,0,6,0,10,'id','desc',0,12,'_self',2,50,-1,-1,'fill','行业应用','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4625,'news','modNewsNavPath','当前位置提示条','news','class_2','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',773,37,13,229,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(4626,'news','modNewsPicMemo','文章图片+标题+摘要','news','class_2','tpl_newspicmemo.htm','-1','1000','',0,'solid','','click','none','','','','http://',769,720,60,231,8,0,10,'id','desc',0,30,'_blank',2,160,150,113,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(4640,'menu','modTopMenu','顶部菜单(一级)','page','html_news','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(4641,'diy','modButtomInfo','底部信息编辑区','page','html_news','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(4643,'page','modPageTitleMenu','网页标题(菜单)','page','html_news','tpl_page_titlemenu.htm','-1','A521','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,178,0,0,6,0,10,'id','desc',0,12,'_self',0,-1,-1,-1,'fill','关于我们','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'visible','content','block'),(4645,'news','modNewsGlobalQuery','全站翻页文章列表','page','html_news','tpl_newsquery.htm','-1','1000','',0,'solid','','click','none','','','','-1',765,304,56,237,8,0,15,'id','desc',0,36,'_blank',1,50,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block');
/*!40000 ALTER TABLE `pwn_base_plus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_plusdefault`
--

DROP TABLE IF EXISTS `pwn_base_plusdefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_plusdefault` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL,
  `pluslable` varchar(100) DEFAULT '0',
  `plusname` char(100) NOT NULL DEFAULT '',
  `plustype` varchar(50) DEFAULT '0',
  `pluslocat` varchar(50) DEFAULT '0',
  `tempname` varchar(100) NOT NULL DEFAULT '0',
  `tempcolor` varchar(2) NOT NULL DEFAULT '-1',
  `showborder` char(20) NOT NULL DEFAULT '1000',
  `bordercolor` varchar(7) NOT NULL DEFAULT '#4682b4',
  `borderwidth` int(2) NOT NULL DEFAULT '1',
  `borderstyle` varchar(10) NOT NULL DEFAULT 'solid',
  `borderlable` varchar(150) NOT NULL,
  `borderroll` varchar(10) NOT NULL,
  `showbar` varchar(10) NOT NULL DEFAULT 'none',
  `barbg` varchar(10) NOT NULL DEFAULT '#4682b4',
  `barcolor` varchar(10) NOT NULL DEFAULT '#fff',
  `backgroundcolor` varchar(7) NOT NULL DEFAULT '#fff',
  `morelink` varchar(100) NOT NULL DEFAULT 'http://',
  `width` int(5) NOT NULL DEFAULT '100',
  `height` int(5) NOT NULL DEFAULT '100',
  `top` int(5) NOT NULL DEFAULT '0',
  `left` int(5) NOT NULL DEFAULT '0',
  `zindex` int(2) NOT NULL DEFAULT '99',
  `padding` int(11) NOT NULL DEFAULT '0',
  `shownums` int(10) NOT NULL DEFAULT '-1',
  `ord` varchar(100) NOT NULL DEFAULT '-1',
  `sc` varchar(10) NOT NULL DEFAULT '-1',
  `showtj` int(5) NOT NULL DEFAULT '-1',
  `cutword` int(20) NOT NULL DEFAULT '-1',
  `target` varchar(30) NOT NULL DEFAULT '-1',
  `catid` int(10) NOT NULL DEFAULT '-1',
  `cutbody` int(5) NOT NULL DEFAULT '-1',
  `picw` int(3) NOT NULL DEFAULT '-1',
  `pich` int(3) NOT NULL DEFAULT '-1',
  `fittype` varchar(10) NOT NULL DEFAULT '-1',
  `title` varchar(100) NOT NULL DEFAULT '',
  `body` text,
  `pic` varchar(255) NOT NULL DEFAULT '-1',
  `piclink` char(255) NOT NULL DEFAULT '-1',
  `attach` varchar(255) NOT NULL DEFAULT '-1',
  `movi` varchar(255) NOT NULL DEFAULT '-1',
  `sourceurl` varchar(20) NOT NULL DEFAULT '-1',
  `word` varchar(255) NOT NULL DEFAULT '-1',
  `word1` varchar(255) NOT NULL DEFAULT '-1',
  `word2` varchar(255) NOT NULL DEFAULT '-1',
  `word3` char(255) NOT NULL DEFAULT '-1',
  `word4` char(255) NOT NULL DEFAULT '-1',
  `text` text NOT NULL,
  `text1` text NOT NULL,
  `code` text NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '-1',
  `link1` char(255) NOT NULL DEFAULT '-1',
  `link2` char(255) NOT NULL DEFAULT '-1',
  `link3` char(255) NOT NULL DEFAULT '-1',
  `link4` char(255) NOT NULL DEFAULT '-1',
  `tags` varchar(30) NOT NULL DEFAULT '-1',
  `groupid` varchar(20) NOT NULL DEFAULT '-1',
  `projid` varchar(20) NOT NULL DEFAULT '-1',
  `moveable` int(1) NOT NULL DEFAULT '1',
  `classtbl` varchar(30) NOT NULL DEFAULT '',
  `grouptbl` varchar(50) NOT NULL,
  `projtbl` varchar(50) NOT NULL,
  `setglobal` int(5) NOT NULL DEFAULT '-1',
  `overflow` varchar(20) NOT NULL DEFAULT 'hidden',
  `bodyzone` varchar(10) NOT NULL DEFAULT 'content',
  `display` varchar(10) NOT NULL DEFAULT 'block',
  `ifmul` int(1) NOT NULL DEFAULT '1',
  `ifrefresh` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_plusdefault`
--

LOCK TABLES `pwn_base_plusdefault` WRITE;
/*!40000 ALTER TABLE `pwn_base_plusdefault` DISABLE KEYS */;
INSERT INTO `pwn_base_plusdefault` VALUES (17,'advs','modLogo','网站标志','all','all','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',150,60,20,20,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','网站标志','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_logo','',1,'hidden','top','block',0,0),(25,'advs','modLinkPic','图片友情链接','all','all','tpl_linkpic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}advs/link/',650,100,0,0,90,10,6,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','友情链接','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_linkgroup','',-1,'hidden','content','block',1,0),(26,'advs','modLinkText','文字友情链接','all','all','tpl_link.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}advs/link/',650,100,0,0,90,10,12,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','友情链接','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_linkgroup','',-1,'hidden','content','block',1,0),(31,'advs','modAdvsLb','图片轮播广告','all','all','tpl_advslb.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',320,280,200,200,90,0,5,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','轮播广告','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_lbgroup','',-1,'hidden','content','block',0,1),(32,'advs','modAdvsPic','页内图片广告','all','all','tpl_advspic.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',565,95,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_pic','',-1,'hidden','content','block',1,0),(199,'effect','modHeadBgSource','头部效果图素材','all','all','tpl_headbg.htm','-1','1000','',0,'solid','','','none','','','','-1',900,150,0,0,-1,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','头部效果图','-1','-1','-1','-1','-1','head/1.png','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(34,'advs','modAdvsText','文字广告（静态）','all','all','tpl_advstext.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',200,30,200,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_text','',-1,'hidden','content','block',1,0),(35,'advs','modAdvsMovi','FLASH视频广告','all','all','tpl_movi.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',300,300,200,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','视频播放','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_movi','',-1,'hidden','content','block',1,0),(48,'advs','modAdvsFloat','图片广告（飘动）','all','all','tpl_advs_float.htm','-1','1000','',0,'solid','','','none','','','','-1',100,100,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_pic','',-1,'hidden','bodyex','block',0,1),(49,'advs','modAdvsDuilian','对联广告','all','all','tpl_advs_duilian.htm','-1','1000','',0,'solid','','','none','','','','-1',100,220,130,6,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_duilian','',-1,'hidden','bodyex','block',0,1),(50,'advs','modAdvsZimu','文字广告（字幕）','all','all','tpl_advszimu.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',200,30,200,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_text','',-1,'hidden','content','block',1,0),(51,'advs','modAdvsFixed','图片广告（悬浮）','all','all','tpl_advs_fixed.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',100,100,350,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','-1',1,'','_advs_pic','',-1,'hidden','bodyex','block',0,0),(61,'advs','modLinkNavPath','当前位置提示条','advs','link','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(89,'advs','modAdvsCode','广告代码','all','all','tpl_advscode.htm','-1','1000','',0,'solid','','','none','','','#fff','-1',250,250,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','广告位','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','请在此插入广告代码','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,1),(18,'comment','modCommentSearchForm','点评搜索表单','comment','all','tpl_comment_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',650,30,0,200,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','点评搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',0,0),(21,'comment','modCommentList','最新点评（列表）','all','all','tpl_commentlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php',300,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','最新点评','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',1,0),(22,'comment','modCommentQuery','点评检索','comment','query','tpl_comment_query.htm','-1','1000','#def',1,'solid','','','none','#def','#fff','#fff','-1',750,300,35,0,90,0,20,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','点评检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'visible','content','block',0,0),(23,'comment','modCommentClass','点评分类','all','all','tpl_comment_class.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,200,200,90,12,-1,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','点评分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',1,0),(24,'comment','modCommentContent','点评详情','comment','detail','tpl_comment_content.htm','-1','1000','#def',0,'solid','','','none','#def','#fff','#fff','-1',750,500,35,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','点评详情','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'visible','content','block',0,0),(56,'comment','modCommentNavPath','当前位置提示条','comment','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',0,0),(151,'comment','modMemberCommentList','会员最新点评','member','homepage','tpl_membercommentlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php?mid={#mid#}',380,170,0,0,90,12,5,'-1','-1',0,20,'_self',-1,-1,-1,-1,'-1','我的点评','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(164,'comment','modCommentHot30','本月点评点击榜','all','all','tpl_comment_hotlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php?myord=cl',300,200,0,0,90,12,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本月点击榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',1,0),(165,'comment','modCommentHot7','本周点评点击榜','all','all','tpl_comment_hotlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php?myord=cl',300,200,0,0,90,12,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本周点击榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',1,0),(166,'comment','modCommentRq30','本月点评人气榜','all','all','tpl_comment_hotlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php?myord=backcount',300,200,0,0,90,12,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本月人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',1,0),(167,'comment','modCommentRq7','本周点评人气榜','all','all','tpl_comment_hotlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}comment/class/index.php?myord=backcount',300,200,0,0,90,12,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本周人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_comment_cat','','',-1,'hidden','content','block',1,0),(9,'diy','modEdit','HTML编辑区','all','all','tpl_edit.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','-1',200,200,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','自定内容','请输入内容','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',1,0),(27,'diy','modButtomInfo','底部信息编辑区','all','all','tpl_bottominfo.htm','-1','1000','',0,'solid','','','none','','','#fff','-1',900,120,30,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','脚注信息','请输入内容','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',1,'hidden','bottom','block',0,0),(47,'diy','modText','多行文字','all','all','tpl_text.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','多行文字','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','请输入自定义文字','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(53,'diy','modPic','图片/FLASH','all','all','tpl_pic.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','-1',300,200,0,0,90,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片','-1','','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(74,'diy','modWords','单行文字','all','all','tpl_words.htm','-1','1000','',0,'solid','','','none','','','','-1',200,50,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','单行文字','-1','-1','-1','-1','-1','-1','请输入文字','-1','-1','-1','-1','-1','-1','-1','http://','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(75,'diy','modPicWordText','图片+标题+介绍','all','all','tpl_picwordtext.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',250,90,30,300,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,100,'-1','自定图文','-1','','http://','-1','-1','-1','请输入标题文字','-1','-1','-1','-1','请输入介绍文字','-1','-1','http://','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(76,'diy','modPicWord','图片+标题','all','all','tpl_picword.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',200,250,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','自定图文','-1','','http://','-1','-1','-1','请输入标题','-1','-1','-1','-1','-1','-1','-1','http://','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(184,'news','modNewsPicMemo','文章图片+标题+摘要','all','all','tpl_newspicmemo.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',300,320,0,0,99,5,3,'id|dtime|uptime|prop1|prop2|cl|xuhao','desc',0,12,'_self',0,35,80,80,'fill','图片新闻','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,0),(86,'diy','modPlusBorder','空白边框','all','all','tpl_plusborder.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',300,300,0,0,1,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','空白边框','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(87,'diy','modColorZone','空白色块','all','all','tpl_colorzone.htm','-1','1000','#e10000',1,'solid','','','none','','','#e10000','-1',200,200,30,30,1,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(63,'effect','modJIanFan','动态简繁转换','all','all','tpl_jianfan.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','','-1',150,50,30,700,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','简繁转换','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(64,'effect','modNowDate','当前日期时间','all','all','tpl_nowdate.htm','-1','1000','#dddddd',0,'solid','','','none','','','','-1',200,30,10,600,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前日期时间','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(65,'effect','modMouseClock','鼠标时钟特效','all','all','tpl_mouseclock.htm','-1','1000','',0,'solid','','','none','','','','-1',150,150,300,10,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','特效','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','bodyex','block',0,1),(90,'effect','modTraFlash','透明flash特效','all','all','tpl_flash1.htm','-1','1000','',0,'solid','','','none','','','','-1',500,200,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(6,'index','modIndexNavPath','当前位置提示条','index','index','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(30,'member','modLoginForm','会员登录表单','all','all','tpl_loginform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,180,0,0,90,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员登录','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(37,'member','modMemberReg','会员注册','member','reg','tpl_reg.htm','-1','1000','',0,'solid','','','none','','','#fff','-1',750,390,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员注册','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(43,'member','modMemberLogin','会员登录表单(大)','member','login','tpl_member_login.htm','-1','1000','',0,'solid','','','none','','','#fff','-1',650,300,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员登录','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(45,'member','modResetPass','重设密码向导','member','lostpass','tpl_resetpass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',500,250,0,0,90,30,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','重设密码','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(57,'member','modMemberNavPath','当前位置提示条','member','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',700,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(103,'member','modMemberInfo','会员登录信息','member','main','tpl_memberinfo.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',300,250,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员登录信息','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(104,'member','modMemberNotice','会员公告(列表)','member','main','tpl_member_notice.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,200,0,0,99,12,5,'-1','-1',-1,25,'_self',-1,-1,-1,-1,'-1','会员公告','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(106,'member','modMemberAccount','登录账号设置表单','member','account','tpl_member_account.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,200,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','登录帐号设置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(107,'member','modMemberPerson','头像签名设置表单','member','person','tpl_member_person.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,390,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','头像签名设置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(108,'member','modMemberDetail','个人资料修改表单','member','detail','tpl_member_detail.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,500,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','个人资料修改','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(109,'member','modMemberContact','联系信息设置表单','member','contact','tpl_member_contact.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,390,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','联系信息设置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(110,'member','modMemberNoticeContent','会员公告详情','member','notice','tpl_member_notice_content.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员公告','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(139,'member','modMemberFav','我的收藏夹','member','fav','tpl_member_fav.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,350,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','我的收藏夹','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(140,'member','modMemberFriends','我的好友','member','friends','tpl_member_friends.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,350,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','我的好友','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(141,'member','modMemberComment','我的点评','member','comment','tpl_member_comment.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,350,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','我的点评','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(142,'member','modMemberMsn','我的站内短信','member','msn','tpl_member_msn.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,350,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','我的站内短信','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(147,'member','modMemberCentInfo','会员积分信息','member','main','tpl_centinfo.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',300,200,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员积分','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(148,'member','modMemberCentLog','会员积分查询','member','membercent','tpl_member_centlog.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','我的积分','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(153,'member','modMemberIntro','会员简介','member','homepage','tpl_member_intro.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',500,200,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员简介','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(154,'member','modMemberHomeInfo','会员信息','member','homepage','tpl_member_homeinfo.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',500,210,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员信息','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(14,'menu','modChannelMenu','二级导航菜单','all','all','tpl_channelmenu.htm','A','1000','',0,'solid','','','none','','','','-1',900,65,120,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',1,'hidden','top','block',0,0),(16,'menu','modBottomMenu','底部菜单（一级）','all','all','tpl_bottommenu.htm','A','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',900,28,0,0,90,0,10,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','脚注栏目','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','-1',1,'','_menu_group','',1,'hidden','bottom','block',0,0),(67,'menu','modDropDownMenu','二级下拉菜单','all','all','tpl_dropdownmenu.htm','A','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',900,28,100,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',1,'hidden','top','block',0,0),(66,'menu','modTopMenu','顶部菜单(一级)','all','all','tpl_topmenu.htm','-1','1000','',0,'solid','','','none','','','','-1',350,30,5,500,90,0,10,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','顶部菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','-1',1,'','_menu_group','',1,'hidden','top','block',0,0),(68,'menu','modMainMenu','一级导航菜单','all','all','tpl_mainmenu.htm','A','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',900,30,100,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',1,'hidden','top','block',0,0),(115,'menu','modTreeMenu','树形导航菜单','all','all','tpl_treemenu.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',190,200,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',1,'visible','content','block',0,1),(116,'menu','modMemberMenu','会员功能菜单','member','all','tpl_qqmenu.htm','A','1000','#def',0,'solid','','','none','#cccccc','#fff','#fff','-1',190,200,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','会员中心','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,1),(1,'news','modNewsQuery','文章翻页检索','news','all','tpl_newsquery.htm','-1','A010','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',600,500,30,200,90,10,20,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','文章检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'visible','content','block',0,0),(2,'news','modNewsClass','文章一级分类','all','all','tpl_newsclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(3,'news','modNewsTreeClass','文章分类（树形）','all','all','tpl_classtree.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,200,200,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,1),(4,'news','modNewsProjList','相关文章(同专题)','news','detail','tpl_newslist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(5,'news','modNewsAuthorList','相关文章(同发布人)','news','detail','tpl_newslist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(7,'news','modNewsClassFc','文章逐级分类','news','query','tpl_newsclass.htm','-1','A001','',0,'solid','','','none','','','#fff','-1',200,200,0,0,90,12,99,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(8,'news','modNewsList','文章列表','all','all','tpl_newslist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}news/class/',200,200,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl|xuhao','desc',0,12,'_self',0,50,-1,-1,'-1','最新文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,0),(12,'news','modNewsContent','文章正文','news','detail','tpl_newscontent.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','-1',630,300,30,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章正文','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'visible','content','block',0,0),(13,'news','modNewsSearchForm','文章搜索表单','news','all','tpl_news_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',650,30,0,0,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(20,'news','modNewsComment','文章点评','news','detail','tpl_news_comment.htm','-1','1000','#dddddd',1,'solid','','','none','','','#fff','http://',630,300,300,0,90,1,5,'-1','-1',-1,20,'_self',-1,120,-1,-1,'-1','文章评论','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(55,'news','modNewsNavPath','当前位置提示条','news','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(72,'news','modNewsProject','文章专题名称列表','all','all','tpl_newsproj.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,-1,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','最新专题','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(82,'news','modNewsPic','文章图片+标题','all','all','tpl_newspic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,99,5,4,'id|dtime|uptime|prop1|prop2|cl|xuhao','desc',0,6,'_self',0,-1,160,120,'fill','图片新闻','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,0),(88,'news','modNewsHot','文章人气榜','all','all','tpl_newshot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}news/class/index.php?myord=cl',200,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','文章人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,0),(112,'news','modNewsFabu','文章发布表单','member','newsfabu','tpl_news_fabu.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章发布','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(113,'news','modNewsGl','文章管理','member','newsgl','tpl_news_gl.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(114,'news','modNewsModify','文章修改表单','member','newsmodify','tpl_news_modify.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章修改','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(136,'news','modNewsMyCat','文章分类管理','member','newscat','tpl_news_mycat.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章分类管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(149,'news','modMemberNewsList','会员最新文章','member','homepage','tpl_newslist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}news/membernews.php?mid={#mid#}',380,170,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl','desc',0,20,'_self',-1,-1,-1,-1,'-1','我的文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(155,'news','modMemberNewsClass','会员文章分类','news','membernews','tpl_membernews_class.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,180,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(156,'news','modMemberNewsQuery','会员文章检索','news','membernews','tpl_newsquery.htm','-1','A010','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',680,300,30,220,90,10,20,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','会员文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(157,'news','modMemberNewsSearchForm','会员文章搜索','news','membernews','tpl_membernews_searchform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,175,0,0,99,15,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','文章搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(58,'page','modPageNavPath','当前位置提示条','page','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(62,'page','modPageContent','网页内容详情','page','all','tpl_page_content.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,350,30,220,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','内容标题','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(70,'page','modPageTitleList','网页标题(列表)','all','all','tpl_pagelist.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,10,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','内容标题列表','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_page_group','',-1,'hidden','content','block',0,0),(71,'page','modPageContentFy','网页内容翻页','page','all','tpl_page_fy.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,50,30,220,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','翻页','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(73,'page','modPageTitleMenu','网页标题(菜单)','all','all','tpl_page_titlemenu.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',200,300,0,0,90,0,10,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','内容标题菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_page_group','',-1,'hidden','content','block',0,0),(29,'search','modSearch','全站搜索结果','search','search','tpl_search.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',900,600,30,0,90,0,-1,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','全站搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(46,'search','modSearchForm','全站搜索表单','all','all','tpl_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',900,30,0,0,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','全站搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(59,'search','modSearchNavPath','当前位置提示条','search','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(28,'tools','modShowCount','访问统计','all','all','tpl_showcount.htm','-1','1000','',0,'solid','','','none','','','','-1',150,30,100,300,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','访问统计','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',1,'hidden','bottom','block',0,0),(54,'tools','modVote','投票调查','all','all','tpl_vote.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,250,200,200,90,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','投票调查','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_tools_pollindex','',-1,'hidden','content','block',0,0),(169,'news','modNewsHot30','本月文章人气榜','all','all','tpl_newshot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}news/class/index.php?myord=cl',200,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本月人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,0),(172,'news','modNewsSameTagList','相关文章(同标签)','news','detail','tpl_newslist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(176,'diy','modDiyMovi','FLASH视频','all','all','tpl_diymovi.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','-1',300,300,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','视频','-1','-1','-1','-1','请输入FLASH视频来源网址','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(175,'advs','modLinkOpt','下拉式友情链接','all','all','tpl_linkopt.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','{#RP#}advs/link/',200,50,0,0,90,10,12,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','友情链接','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_advs_linkgroup','',-1,'hidden','content','block',1,0),(204,'member','modMemberRank3','会员悬赏榜(积分三)','all','all','tpl_memberrank.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,10,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','会员悬赏榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(205,'member','modMemberRank4','会员金币榜(积分四)','all','all','tpl_memberrank.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,10,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','会员金币榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(206,'member','modMemberRank5','消费积分榜(积分五)','all','all','tpl_memberrank.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,10,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','消费积分榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(207,'member','modMemberTags','会员推荐(标签)','all','all','tpl_membertags.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,2,'-1','-1',-1,-1,'_self',-1,-1,70,70,'-1','会员推荐','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(203,'member','modMemberRank2','会员人气榜(积分二)','all','all','tpl_memberrank.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,10,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','会员人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(202,'member','modMemberRank1','会员经验榜(积分一)','all','all','tpl_memberrank.htm','-1','A001','',0,'solid','','','none','','','','-1',200,250,0,0,99,12,10,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','会员经验榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(182,'diy','modWordTT','标题+链接组','all','all','tpl_wordtt.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','http://',300,70,0,0,99,10,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','今日头条','-1','-1','-1','-1','-1','-1','请输入头条标题文字','自定义链接文字一','自定义链接文字二','自定义链接文字三','自定义链接文字四','-1','-1','-1','http://','http://','http://','http://','http://','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(183,'diy','modWordText','标题+介绍','all','all','tpl_wordtext.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',300,100,0,0,99,10,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','插件标题','-1','-1','-1','-1','-1','-1','请输入标题文字','-1','-1','-1','-1','请输入介绍文字','-1','-1','http://','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(187,'news','modNewsPicRollx3','三图轮播特效','all','all','tpl_newspicrollx3.htm','A','1000','#dddddd',0,'solid','','','none','#dddddd','#fff','#fff','-1',700,270,0,200,99,0,-1,'-1','-1',0,12,'_self',0,25,-1,-1,'-1','图片新闻','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'hidden','content','block',0,1),(189,'diy','modPicWords','图片+标题组','all','all','tpl_picwordx5.htm','-1','1000','#dddddd',1,'solid','','','none','#cccccc','#fff','#fff','http://',300,120,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,100,'-1','自定图文','-1','','http://','-1','-1','-1','请输入标题','请输入标题','请输入标题','请输入标题','请输入标题','-1','-1','-1','http://','http://','http://','http://','http://','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(190,'effect','modButtonSource','按钮素材','all','all','tpl_picsource.htm','-1','1000','',0,'solid','','','none','','','','-1',200,80,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','按钮素材','-1','-1','-1','-1','-1','button/01.gif','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(191,'effect','modIconSource','图标素材','all','all','tpl_picsource.htm','-1','1000','',0,'solid','','','none','','','','-1',50,50,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图标素材','-1','-1','-1','-1','-1','icon/01.gif','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(193,'effect','modSmallIcon','小图标素材','all','all','tpl_smallicon.htm','-1','1000','',0,'solid','','','none','','','','-1',50,50,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图标素材','-1','-1','-1','-1','-1','smallicon/1.gif','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(198,'effect','modBgSource','背景图片素材','all','all','tpl_bgsource.htm','-1','1000','',0,'solid','','','none','','','','-1',100,100,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','背景素材','-1','-1','-1','-1','-1','bg/1.gif','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(195,'effect','modSourceCoolLine','分割线装饰素材','all','all','tpl_picsource.htm','-1','1000','',0,'solid','','','none','','','','-1',300,100,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','分割线素材','-1','-1','-1','-1','-1','coolline/1.png','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(196,'effect','modCartonSource','其他图片素材','all','all','tpl_picsource.htm','-1','1000','',0,'solid','','','none','','','','-1',200,200,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','卡通图片','-1','-1','-1','-1','-1','carton/1.png','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(200,'diy','modGroupLable','标签切换边框','all','all','tpl_plusborder.htm','-1','A201','',0,'solid','','','none','','#fff','#fff','http://',300,300,0,0,0,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','自动标签','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(208,'effect','modHeaderBg','头部背景图素材','all','all','tpl_bgsource.htm','-1','1000','',0,'solid','','','none','','','','-1',900,150,0,0,-1,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','头部背景素材','-1','-1','-1','-1','-1','bg/1.gif','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(209,'effect','modHeadTraFlash','头部透明flash特效','all','all','tpl_flash1.htm','-1','1000','',0,'solid','','','none','','','','-1',900,150,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(210,'diy','modBgSound','网页背景音乐(mid)','all','all','tpl_bgsound.htm','-1','1000','',0,'solid','','','none','','','','-1',100,50,350,0,-1,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','背景音乐','-1','-1','-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','bodyex','block',0,1),(211,'news','modNewsSameClass','文章同级分类','news','query','tpl_newsclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(214,'diy','modHeadPic','头部自定义效果图','all','all','tpl_headpic.htm','-1','1000','',0,'solid','','','none','','','','-1',900,150,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片','-1','','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(219,'diy','modDiyTemp','自定义模版','all','all','tpl_diy.htm','-1','1000','',0,'solid','','','none','','','','-1',300,300,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','自定模版','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(220,'news','modNewsTwoClass','文章二级分类','all','all','tpl_newstwoclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,300,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','文章分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_news_cat','','',-1,'hidden','content','block',0,0),(222,'product','modProductQuery','产品检索搜索','product','all','tpl_product_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',680,500,30,200,90,5,20,'-1','-1',-1,30,'_self',-1,30,120,120,'fill','产品检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'visible','content','block',0,1),(223,'product','modProductContent','产品详情','product','detail','tpl_product_content.htm','-1','1000','',0,'solid','','','none','','','','-1',650,300,30,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品详情','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'visible','content','block',0,0),(224,'product','modProductClass','产品分类（列表）','all','all','tpl_productclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','产品分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',1,0),(225,'product','modProductList','自选产品列表','all','all','tpl_productlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}product/class/',300,350,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl','desc',0,12,'_self',0,30,80,80,'fill','最新产品','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_product_cat','','_product_proj',-1,'hidden','content','block',1,0),(226,'product','modProductSearchForm','产品搜索表单','product','all','tpl_product_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',650,30,0,200,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(227,'product','modProductNavPath','当前位置提示条','product','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(228,'product','modProductProject','产品专题（列表）','all','all','tpl_productproj.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,-1,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','最新专题','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(229,'product','modProductProjList','相关产品(同专题)','product','detail','tpl_productpic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关产品','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(230,'product','modProductClassFc','产品逐级分类','product','query','tpl_productclass.htm','-1','A001','',0,'solid','','','none','','#fff','#fff','-1',200,200,0,0,90,12,99,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','产品分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(231,'product','modProductComment','产品点评','product','detail','tpl_product_comment.htm','-1','1000','#dddddd',1,'solid','','','none','','','#fff','http://',650,350,350,0,90,1,5,'-1','-1',-1,20,'_self',-1,120,-1,-1,'-1','产品评论','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(232,'product','modProductFabu','产品发布表单','member','productfabu','tpl_product_fabu.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品发布','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(233,'product','modProductGl','产品管理','member','productgl','tpl_product_gl.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(234,'product','modProductModify','产品修改表单','member','productmodify','tpl_product_modify.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品修改','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(235,'product','modProductMyCat','产品分类管理','member','productcat','tpl_product_mycat.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品分类管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(236,'product','modMemberProductPic','会员最新产品','member','homepage','tpl_productpic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}product/memberproduct.php?mid={#mid#}',500,200,0,0,90,10,10,'id|dtime|uptime|prop1|prop2|cl','desc',0,7,'_self',-1,-1,120,120,'fill','我的产品','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(237,'product','modMemberProductClass','会员产品分类','product','memberproduct','tpl_memberproduct_class.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(238,'product','modMemberProductQuery','会员产品检索','product','memberproduct','tpl_product_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,350,0,220,99,0,20,'-1','-1',-1,-1,'-1',-1,-1,120,120,'fill','产品检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,1),(239,'product','modMemberProductSearchForm','会员产品搜索','product','memberproduct','tpl_memberproduct_searchform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,175,0,0,99,15,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','产品搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(240,'product','modProductAuthorList','相关产品(同发布人)','product','detail','tpl_productpic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关产品','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(241,'product','modProductSameTagList','相关产品(同标签)','product','detail','tpl_productpic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关产品','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(242,'product','modProductRollx3','产品三图轮播特效','all','all','tpl_productrollx3.htm','A','1000','#dddddd',0,'solid','','','none','#dddddd','#fff','#fff','-1',700,270,0,200,99,0,-1,'-1','-1',0,12,'_self',0,25,-1,-1,'-1','产品图片特效','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_product_cat','','_product_proj',-1,'hidden','content','block',0,1),(243,'product','modProductSameClass','产品同级分类','product','query','tpl_productclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','产品分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(244,'product','modProductCarousel','产品图片旋转特效','all','all','tpl_productcarousel_cyrano.htm','-1','1000','#dddddd',0,'solid','','','none','#dddddd','#fff','#fff','-1',600,225,0,200,99,0,-1,'-1','-1',0,-1,'_self',0,-1,180,180,'-1','产品图片特效','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_product_cat','','_product_proj',-1,'hidden','content','block',0,1),(245,'product','modProductTwoClass','产品二级分类','all','all','tpl_producttwoclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,300,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','产品分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_product_cat','','',-1,'hidden','content','block',0,0),(246,'menu','modVMenu','竖式导航菜单','all','all','tpl_vmenu.htm','A','1000','',0,'solid','','','none','','','','-1',200,300,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',1,'hidden','content','block',0,0),(247,'menu','modMVMenu','手风琴式二级菜单','all','all','tpl_mvmenu.htm','A','1000','',0,'solid','','','none','','','','-1',180,200,0,0,99,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','导航菜单','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_menu_group','',-1,'visible','content','block',0,1),(255,'news','modNewsPicLb','文章图片轮播','all','all','tpl_newspic_lb.htm','-1','1000','',0,'solid','','','none','','','','-1',300,280,0,0,99,1,5,'id|dtime|uptime|prop1|prop2|cl|xuhao','desc',0,15,'-1',0,-1,-1,-1,'-1','图片新闻','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','-1',1,'_news_cat','','_news_proj',-1,'hidden','content','block',1,1),(256,'photo','modPhotoQuery','图片检索搜索','photo','all','tpl_photo_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',680,500,30,200,90,5,20,'-1','-1',-1,30,'_self',-1,-1,120,120,'fill','图片检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'visible','content','block',0,1),(257,'photo','modPhotoContent','图片详情','photo','detail','tpl_photo_content.htm','-1','1000','',0,'solid','','','none','','','','-1',650,300,30,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片详情','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'visible','content','block',0,0),(258,'photo','modPhotoClass','图片分类（列表）','all','all','tpl_photoclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','图片分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',1,0),(259,'photo','modPhotoPic','图片+名称','all','all','tpl_photopic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}photo/class/',620,200,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl','desc',0,12,'_self',0,-1,100,100,'fill','最新图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',1,0),(260,'photo','modPhotoSearchForm','图片搜索表单','photo','all','tpl_photo_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',650,30,0,200,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(261,'photo','modPhotoNavPath','当前位置提示条','photo','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(262,'photo','modPhotoProject','图片专题（列表）','all','all','tpl_photoproj.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,-1,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','最新专题','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(263,'photo','modPhotoProjList','相关图片(同专题)','photo','detail','tpl_photopic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(264,'photo','modPhotoClassFc','图片逐级分类','photo','query','tpl_photoclass.htm','-1','A001','',0,'solid','','','none','','#fff','#fff','-1',200,200,0,0,90,12,99,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','图片分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(265,'photo','modPhotoHot','图片人气榜','all','all','tpl_photohot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}photo/class/index.php?myord=cl',200,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','图片人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',1,0),(266,'photo','modPhotoComment','图片点评','photo','detail','tpl_photo_comment.htm','-1','1000','#dddddd',1,'solid','','','none','','','#fff','http://',650,350,350,0,90,1,5,'-1','-1',-1,20,'_self',-1,120,-1,-1,'-1','图片评论','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(267,'photo','modPhotoFabu','图片发布表单','member','photofabu','tpl_photo_fabu.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片发布','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(268,'photo','modPhotoGl','图片管理','member','photogl','tpl_photo_gl.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(269,'photo','modPhotoModify','图片修改表单','member','photomodify','tpl_photo_modify.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片修改','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(270,'photo','modPhotoMyCat','图片分类管理','member','photocat','tpl_photo_mycat.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片分类管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(271,'photo','modMemberPhotoPic','会员最新图片','member','homepage','tpl_photopic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}photo/memberphoto.php?mid={#mid#}',500,200,0,0,90,10,10,'id|dtime|uptime|prop1|prop2|cl','desc',0,7,'_self',-1,-1,120,120,'fill','我的图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(272,'photo','modMemberPhotoClass','会员图片分类','photo','memberphoto','tpl_memberphoto_class.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(273,'photo','modMemberPhotoQuery','会员图片检索','photo','memberphoto','tpl_photo_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,350,0,220,99,0,20,'-1','-1',-1,-1,'-1',-1,-1,120,120,'fill','图片检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,1),(274,'photo','modMemberPhotoSearchForm','会员图片搜索','photo','memberphoto','tpl_memberphoto_searchform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,175,0,0,99,15,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','图片搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(275,'photo','modPhotoHot30','本月图片人气榜','all','all','tpl_photohot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}photo/class/index.php?myord=cl',200,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本月人气榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',1,0),(276,'photo','modPhotoAuthorList','相关图片(同发布人)','photo','detail','tpl_photopic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(277,'photo','modPhotoSameTagList','相关图片(同标签)','photo','detail','tpl_photopic.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,300,0,0,90,10,6,'-1','-1',0,12,'_self',0,-1,100,100,'fill','相关图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(278,'photo','modPhotoPicMemo','图片+名称+介绍','all','all','tpl_photopicmemo.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}photo/class/',300,350,0,0,90,10,3,'id|dtime|uptime|prop1|prop2|cl','desc',0,12,'_self',0,30,80,80,'fill','最新图片','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',1,0),(279,'photo','modPhotoRollx3','三图轮播特效','all','all','tpl_photorollx3.htm','A','1000','#dddddd',0,'solid','','','none','#dddddd','#fff','#fff','-1',700,270,0,200,99,0,-1,'-1','-1',0,12,'_self',0,25,-1,-1,'-1','图片特效','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',0,1),(280,'photo','modPhotoSameClass','图片同级分类','photo','query','tpl_photoclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','图片分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(281,'photo','modPhotoCarousel','图片旋转显示特效','all','all','tpl_photocarousel_cyrano.htm','-1','1000','#dddddd',0,'solid','','','none','#dddddd','#fff','#fff','-1',140,225,0,200,99,0,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','图片特效','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_photo_cat','','_photo_proj',-1,'hidden','content','block',0,1),(282,'photo','modPhotoTwoClass','图片二级分类','all','all','tpl_phototwoclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,300,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','图片分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_photo_cat','','',-1,'hidden','content','block',0,0),(283,'down','modDownQuery','下载检索搜索','down','all','tpl_down_query.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',650,500,30,200,90,12,20,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','下载检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'visible','content','block',0,0),(284,'down','modDownClass','下载分类（列表）','all','all','tpl_downclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','下载分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',1,0),(285,'down','modDownTreeClass','下载分类（树形）','all','all','tpl_classtree.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,200,200,90,12,-1,'-1','-1',0,-1,'_self',0,-1,-1,-1,'-1','下载分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',1,1),(286,'down','modDownProjList','相关下载(同专题)','down','detail','tpl_downlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',230,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关下载','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',0,0),(287,'down','modDownAuthorList','相关下载(同发布人)','down','detail','tpl_downlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',230,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关下载','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',0,0),(288,'down','modDownClassFc','下载逐级分类','down','query','tpl_downclass.htm','-1','A001','',0,'solid','','','none','','','#fff','-1',200,200,0,0,90,12,99,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','下载分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(289,'down','modDownList','下载列表','all','all','tpl_downlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}down/class/',250,200,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl','desc',0,12,'_self',0,-1,-1,-1,'-1','最新下载','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_down_cat','','_down_proj',-1,'hidden','content','block',1,0),(290,'down','modDownContent','下载详情','down','detail','tpl_down_content.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',650,300,30,0,90,25,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载详情','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'visible','content','block',0,0),(291,'down','modDownSearchForm','下载搜索表单','down','all','tpl_down_searchform.htm','-1','A500','',0,'solid','','','none','','','','-1',650,30,0,200,90,3,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',0,0),(292,'down','modDownComment','下载点评','down','detail','tpl_down_comment.htm','-1','1000','#dddddd',0,'solid','','','none','','','#fff','http://',650,350,300,0,90,0,5,'-1','-1',-1,20,'_self',-1,120,-1,-1,'-1','下载评论','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(293,'down','modDownNavPath','当前位置提示条','down','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',0,0),(294,'down','modDownProject','下载专题（列表）','all','all','tpl_downproj.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',200,200,0,0,90,12,-1,'-1','-1',-1,12,'_self',-1,-1,-1,-1,'-1','最新专题','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(295,'down','modDownHot','下载排行榜','all','all','tpl_downhot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}down/class/index.php?myord=cl',250,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','下载排行榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_down_cat','','_down_proj',-1,'hidden','content','block',1,0),(296,'down','modDownFabu','下载发布表单','member','downfabu','tpl_down_fabu.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载发布','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(297,'down','modDownGl','下载管理','member','downgl','tpl_down_gl.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(298,'down','modDownModify','下载修改表单','member','downmodify','tpl_down_modify.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,700,0,0,99,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载修改','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(299,'down','modDownMyCat','下载分类管理','member','downcat','tpl_down_mycat.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载分类管理','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(300,'down','modMemberDownList','会员下载列表','member','homepage','tpl_downlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}down/memberdown.php?mid={#mid#}',380,170,0,0,90,10,5,'id|dtime|uptime|prop1|prop2|cl','desc',0,20,'_self',-1,-1,-1,-1,'-1','资源下载','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',1,0),(301,'down','modMemberDownClass','会员下载分类','down','memberdown','tpl_memberdown_class.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,180,0,0,99,12,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(302,'down','modMemberDownQuery','会员下载检索','down','memberdown','tpl_memberdown_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,300,0,0,90,5,20,'-1','-1',-1,30,'_self',-1,-1,-1,-1,'-1','下载检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(303,'down','modMemberDownSearchForm','会员下载搜索','down','memberdown','tpl_memberdown_searchform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,175,0,0,99,15,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','下载搜索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(304,'down','modDownHot30','本月下载排行榜','all','all','tpl_downhot.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','{#RP#}down/class/index.php?myord=cl',250,280,0,0,90,10,10,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','本月下载榜','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_down_cat','','_down_proj',-1,'hidden','content','block',1,0),(305,'down','modDownSameTagList','相关下载(同标签)','down','detail','tpl_downlist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','http://',230,200,0,0,90,12,5,'-1','-1',0,12,'_self',0,-1,-1,-1,'-1','相关下载','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_down_cat','','',-1,'hidden','content','block',0,0),(306,'down','modDownSameClass','下载同级分类','down','query','tpl_downclass.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',200,200,0,0,90,12,-1,'-1','-1',0,-1,'_self',-1,-1,-1,-1,'-1','下载分类','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(307,'service','modForm','客户服务表单','service','all','tpl_form.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',650,500,50,220,90,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','客户服务','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_service_group','',-1,'visible','content','block',0,0),(308,'service','modServiceNavPath','当前位置提示条','service','all','tpl_navpath.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',650,30,0,200,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','当前位置','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','content','block',0,0),(309,'service','modFormGroup','客服分组菜单','service','all','tpl_formgroup.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',200,200,0,0,99,0,-1,'-1','-1',-1,-1,'_self',-1,-1,-1,-1,'-1','客服分组','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(310,'service','modServiceForm','客户服务表单','member','service','tpl_serviceform.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',650,500,50,220,90,20,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','有问必答','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_service_group','',-1,'visible','content','block',0,0),(311,'service','modServiceTaskList','客服工单查询','member','feedback','tpl_tasklist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,500,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','客服工单查询','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(312,'service','modServiceTaskDetail','客服工单详情','member','feedbacklook','tpl_taskdetail.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','工单详情','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(313,'service','modServiceTaskHis','存档工单查询','member','feedbackhis','tpl_taskhis.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','存档工单查询','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(314,'page','modPagePicList','标题+摘要+主题图','all','all','tpl_page_piclist.htm','-1','1000','',0,'solid','','','none','','','','-1',650,300,0,0,90,0,10,'-1','-1',-1,15,'_self',-1,50,120,90,'fill','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','-1',1,'','_page_group','',-1,'hidden','content','block',0,0),(315,'tools','modToolsPhotoPollQuery','图片投票翻页检索','all','all','tpl_tools_photopoll_query.htm','-1','1000','#dddddd',0,'solid','','','none','#cccccc','#fff','#fff','-1',680,500,30,200,90,5,20,'id|uptime|votes','-1',-1,30,'-1',0,-1,80,80,'fill','图片投票检索','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'_tools_photopollindex','','',-1,'visible','content','block',0,1),(316,'tools','modToolsQqCs','QQ客服','all','all','tpl_tools_qqcs.htm','-1','1000','',0,'solid','','','none','','','','-1',120,300,100,20,90,0,-1,'-1','-1',0,-1,'-1',-1,-1,-1,-1,'-1','QQ客服','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','content','block',0,0),(317,'tools','modToolsWyCs','51客服','all','all','tpl_tools_wycs.htm','-1','1000','',0,'solid','','','none','','','','-1',300,120,100,0,90,0,-1,'-1','-1',0,-1,'-1',-1,-1,-1,-1,'-1','51客服','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','content','block',0,0),(318,'tools','modToolsStatistics','统计代码插件','all','all','tpl_tools_statistics.htm','-1','1000','',0,'solid','','','none','','','','-1',30,30,50,400,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','统计代码','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'hidden','bottom','block',0,0),(319,'tools','modToolsYdCs','移动短信留言','all','all','tpl_tools_ydcs.htm','-1','1000','',0,'solid','','','none','','','','-1',400,350,100,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','移动短信留言板','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','content','block',0,0),(320,'member','modMemberPayList','会员付款记录','member','paylist','tpl_member_paylist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','付款记录','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(321,'member','modMemberBuyList','会员消费记录','member','buylist','tpl_member_buylist.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','消费记录','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(322,'member','modMemberOnlinePay','帐户在线充值','member','onlinepay','tpl_member_onlinepay.htm','-1','A001','#dddddd',1,'solid','','','block','#cccccc','#fff','#fff','-1',700,300,0,0,99,5,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','帐户在线充值','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',-1,'visible','content','block',0,0),(323,'diy','modHeadTraFlashCyrano','自定义透明FLASH','all','all','tpl_headtraflash_cyrano.htm','-1','1000','',0,'solid','','','none','','','','-1',900,150,0,0,90,0,-1,'-1','-1',-1,-1,'-1',-1,-1,-1,-1,'-1','','-1','','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1',1,'','','',1,'hidden','top','block',0,0),(324,'news','modNewsGlobalQuery','全站翻页文章列表','all','all','tpl_newsquery.htm','-1','A001','',1,'solid','','','block','','','#fff','-1',650,350,0,0,90,15,10,'id|dtime|uptime|prop1|prop2|cl|xuhao','desc',0,20,'_self',0,50,-1,-1,'-1','最新文章','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','-1','0',1,'_news_cat','','_news_proj',-1,'visible','content','block',0,0);
/*!40000 ALTER TABLE `pwn_base_plusdefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_plusplan`
--

DROP TABLE IF EXISTS `pwn_base_plusplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_plusplan` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `planid` int(6) NOT NULL DEFAULT '0',
  `coltype` varchar(30) NOT NULL,
  `pluslable` varchar(100) DEFAULT '0',
  `plusname` varchar(50) NOT NULL,
  `plustype` varchar(50) DEFAULT '0',
  `pluslocat` varchar(50) DEFAULT '0',
  `tempname` varchar(100) NOT NULL DEFAULT '0',
  `tempcolor` varchar(2) NOT NULL,
  `showborder` char(20) NOT NULL DEFAULT '0',
  `bordercolor` varchar(7) NOT NULL DEFAULT '#dddddd',
  `borderwidth` int(2) NOT NULL DEFAULT '1',
  `borderstyle` varchar(10) NOT NULL DEFAULT 'solid',
  `borderlable` varchar(150) NOT NULL,
  `borderroll` varchar(10) NOT NULL,
  `showbar` varchar(10) NOT NULL DEFAULT 'none',
  `barbg` varchar(10) NOT NULL DEFAULT '#cccccc',
  `barcolor` varchar(10) NOT NULL DEFAULT '#ffffff',
  `backgroundcolor` varchar(7) NOT NULL DEFAULT '#ffffff',
  `morelink` varchar(100) NOT NULL DEFAULT 'http://',
  `width` int(5) NOT NULL DEFAULT '100',
  `height` int(5) NOT NULL DEFAULT '100',
  `top` int(5) NOT NULL DEFAULT '0',
  `left` int(5) NOT NULL DEFAULT '0',
  `zindex` int(2) NOT NULL DEFAULT '99',
  `padding` int(11) NOT NULL DEFAULT '0',
  `shownums` int(10) NOT NULL DEFAULT '0',
  `ord` varchar(100) NOT NULL DEFAULT 'id',
  `sc` varchar(10) NOT NULL DEFAULT 'desc',
  `showtj` int(5) NOT NULL DEFAULT '0',
  `cutword` int(20) DEFAULT '0',
  `target` varchar(30) DEFAULT '0',
  `catid` int(100) NOT NULL DEFAULT '0',
  `cutbody` int(5) NOT NULL DEFAULT '0',
  `picw` int(3) NOT NULL DEFAULT '100',
  `pich` int(3) NOT NULL DEFAULT '100',
  `fittype` char(10) NOT NULL DEFAULT 'fill',
  `title` varchar(100) NOT NULL,
  `body` text,
  `pic` varchar(255) NOT NULL,
  `piclink` char(255) NOT NULL DEFAULT '-1',
  `attach` varchar(255) NOT NULL,
  `movi` varchar(255) NOT NULL,
  `sourceurl` varchar(30) NOT NULL,
  `word` char(255) NOT NULL,
  `word1` char(255) NOT NULL,
  `word2` char(255) NOT NULL,
  `word3` char(255) NOT NULL DEFAULT '',
  `word4` char(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `text1` text NOT NULL,
  `code` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `link1` char(255) NOT NULL DEFAULT '',
  `link2` char(255) NOT NULL DEFAULT '',
  `link3` char(255) NOT NULL,
  `link4` char(255) NOT NULL,
  `tags` char(30) NOT NULL,
  `groupid` varchar(20) NOT NULL DEFAULT '',
  `projid` varchar(20) NOT NULL DEFAULT '',
  `modno` int(3) NOT NULL DEFAULT '0',
  `setglobal` int(5) NOT NULL DEFAULT '0',
  `overflow` varchar(20) NOT NULL DEFAULT 'hidden',
  `bodyzone` varchar(10) NOT NULL DEFAULT 'content',
  `display` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=523 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_plusplan`
--

LOCK TABLES `pwn_base_plusplan` WRITE;
/*!40000 ALTER TABLE `pwn_base_plusplan` DISABLE KEYS */;
INSERT INTO `pwn_base_plusplan` VALUES (447,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',328,130,259,0,10,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299878.jpg','{#RP#}product/html/?44.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',2,0,'hidden','content','block'),(448,48,'advs','modLogo','网站标志','index','index','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(449,48,'news','modNewsList','文章列表','index','index','tpl_newslist.htm','-1','A522','',0,'solid','','click','none','','','','',330,184,28,359,11,0,6,'dtime','desc',0,24,'_self',1,50,-1,-1,'fill','新闻中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',3,0,'hidden','content','block'),(450,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',56,18,211,619,12,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1\r\n\r\n\r\n','diy/pics/20140320/1395299710.gif','{#RP#}news/class/','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(451,48,'menu','modBottomMenu','底部菜单（一级）','index','index','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(452,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',324,130,259,678,13,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299930.jpg','{#RP#}product/html/?46.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',4,0,'hidden','content','block'),(453,48,'diy','modPlusBorder','空白边框','index','index','tpl_plusborder.htm','-1','A522','#dddddd',1,'solid','','click','none','#cccccc','#fff','#fff','http://',285,36,29,717,18,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','行业应用','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(454,48,'news','modNewsPicLb','文章图片轮播','index','index','tpl_newspic_lb.htm','-1','1000','',0,'solid','','click','none','','','','-1',283,172,67,717,17,0,7,'id','asc',0,15,'_self',2,-1,-1,-1,'fill','','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','',1,0,'hidden','content','block'),(455,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1,166,52,343,16,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','diy/pics/20140320/1395302903.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',6,0,'hidden','content','block'),(456,48,'diy','modHeadTraFlashCyrano','自定义透明FLASH','index','index','tpl_headtraflash_cyrano.htm','-1','1000','',0,'solid','','click','none','','','','-1',1000,457,150,0,14,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395300606.swf','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','top','block'),(457,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1,166,49,693,15,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','diy/pics/20140320/1395302903.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',6,0,'hidden','content','block'),(458,48,'menu','modMainMenu','一级导航菜单','index','index','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(459,48,'menu','modTopMenu','顶部菜单(一级)','index','index','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(465,49,'page','modPageContent','网页内容详情','page','html_company','tpl_page_content.htm','-1','A519','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',1000,947,0,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(506,55,'member','modMemberNavPath','当前位置提示条','member','login','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(446,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',1000,44,414,0,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1\r\n\r\n\r\n','diy/pics/20140320/1395299987.gif','http://','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',5,0,'hidden','content','block'),(445,48,'diy','modEdit','HTML编辑区','index','index','tpl_edit.htm','-1','1000','',0,'solid','','click','none','','','','-1',628,53,431,37,9,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<div style=\"color:#666;font-family:arial\"><span style=\"margin-right:50px;\">0086-563-2825976</span><span style=\"margin-right:40px;\">zhongyutx2012@aliyun.com</span>安徽省宣城市锦城北路丽晶国际中心A1604</div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',2,0,'hidden','content','block'),(460,49,'advs','modLogo','网站标志','page','html_company','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(444,48,'diy','modButtomInfo','底部信息编辑区','index','index','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(442,48,'diy','modPic','图片/FLASH','index','index','tpl_pic.htm','-1','1000','',0,'solid','','click','none','','','','-1',328,130,259,338,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','diy/pics/20140320/1395299907.jpg','{#RP#}product/html/?45.html','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',3,0,'hidden','content','block'),(443,48,'diy','modEdit','HTML编辑区','index','index','tpl_edit.htm','-1','A522','',0,'solid','','click','none','','','','-1',330,213,28,0,8,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','公司简介','\r\n\r\n\r\n<div style=\"font:12px/24px arial,simsun;color:#666;\">　　中国交通通信信息中心（http://www.cttic.cn  Transport Telecommunications &amp; Information Center ，英文缩写CTTIC，以下简称通信信息中心），作爲中华人民共和国交通运输部直属事业单位，受交通运输部委托拟订并组织实施交通运输行业通信、导航、无线电和信息化管理的技术政策、技术标淮、规章制度；代交通运输部行使交通运输部无线电行政许可和行政审批职责......<a href=\"page/html/company.php\" style=\"color:#0191D0\">[详细内容]</a></div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(461,49,'menu','modBottomMenu','底部菜单（一级）','page','html_company','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(462,49,'menu','modMainMenu','一级导航菜单','page','html_company','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,5,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(463,49,'menu','modTopMenu','顶部菜单(一级)','page','html_company','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(464,49,'diy','modButtomInfo','底部信息编辑区','page','html_company','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(522,56,'menu','modTopMenu','顶部菜单(一级)','member','main','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(521,56,'menu','modMainMenu','一级导航菜单','member','main','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(520,56,'advs','modLogo','网站标志','member','main','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(514,56,'member','modMemberNotice','会员公告(列表)','member','main','tpl_member_notice.htm','-1','E012','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',766,194,309,235,8,12,5,'id','desc',0,25,'_self',0,-1,-1,-1,'fill','会员公告','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(515,56,'member','modMemberInfo','会员登录信息','member','main','tpl_memberinfo.htm','-1','E012','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','-1',767,247,60,235,9,12,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录信息','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(516,56,'member','modMemberNavPath','当前位置提示条','member','main','tpl_navpath.htm','-1','A526','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',766,36,14,235,7,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(517,56,'menu','modMemberMenu','会员功能菜单','member','main','tpl_qqmenu.htm','A','A521','#def',0,'solid','','click','none','#cccccc','#fff','#fff','-1',200,221,0,0,3,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'visible','content','block'),(518,56,'diy','modButtomInfo','底部信息编辑区','member','main','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block'),(519,56,'menu','modBottomMenu','底部菜单（一级）','member','main','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,4,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(507,55,'member','modMemberLogin','会员登录表单(大)','member','login','tpl_member_login.htm','-1','1000','',0,'solid','','click','none','','','#fff','-1',713,282,74,285,4,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','会员登录','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','content','block'),(508,55,'product','modProductList','自选产品列表','member','login','tpl_productlist.htm','-1','A521','#dddddd',1,'solid','','click','block','#cccccc','#fff','#fff','{#RP#}product/class/',200,178,0,0,8,0,10,'id','desc',0,12,'_self',0,30,80,80,'fill','产品中心','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','','0',1,0,'visible','content','block'),(509,55,'menu','modMainMenu','一级导航菜单','member','login','tpl_mainmenu.htm','A','1000','',0,'solid','','click','none','','','','-1',1000,40,90,1,6,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n\r\n\r\n-1\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(510,55,'menu','modBottomMenu','底部菜单（一级）','member','login','tpl_bottommenu_1.htm','E','1000','',0,'solid','','click','none','','','','-1',408,33,95,594,3,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','-1 ','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','3','',1,0,'hidden','bottom','block'),(511,55,'advs','modLogo','网站标志','member','login','tpl_logo.htm','-1','1000','#dddddd',0,'solid','','click','none','#cccccc','#fff','#fff','-1',472,74,12,0,1,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n-1 \r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','1','',1,0,'hidden','top','block'),(512,55,'menu','modTopMenu','顶部菜单(一级)','member','login','tpl_topmenu.htm','-1','1000','',0,'solid','','click','none','','','','-1',173,26,7,829,5,0,10,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','顶部菜单','\r\n\r\n-1 \r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','2','',1,0,'hidden','top','block'),(513,55,'diy','modButtomInfo','底部信息编辑区','member','login','tpl_bottominfo.htm','-1','1000','',0,'solid','','click','none','','','','-1',585,145,55,0,2,0,-1,'id','desc',0,-1,'_self',0,-1,-1,-1,'fill','','\r\n\r\n<div style=\"FONT: 12px/24px arial,simsun; COLOR: #fff;text-align:left\"><img alt=\"\" src=\"[ROOTPATH]index/pics/20140320/201403201395301738563.gif\" border=\"0\" /> \r\n<br />全球唯一建有国家级卫星地面站的运营商<br />海事卫星中国运营服务商<br />Copyright © 2014-2015 www.ahzyc.com All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;版权所有：安徽中宇通讯设备有限公司<br />技术支持：<a style=\"COLOR: #fff\" href=\"http://www.xcdb.cn\" target=\"_blank\">地宝网络&nbsp;&nbsp;</a>&nbsp;&nbsp;备案号：<a style=\"COLOR: #fff\" href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">皖ICP备14252501号</a></div>\r\n\r\n\r\n\r\n\r\n\r\n','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','','',1,0,'hidden','bottom','block');
/*!40000 ALTER TABLE `pwn_base_plusplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_plusplanid`
--

DROP TABLE IF EXISTS `pwn_base_plusplanid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_plusplanid` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `planname` varchar(50) NOT NULL DEFAULT '',
  `plustype` varchar(50) NOT NULL DEFAULT '',
  `pluslocat` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_plusplanid`
--

LOCK TABLES `pwn_base_plusplanid` WRITE;
/*!40000 ALTER TABLE `pwn_base_plusplanid` DISABLE KEYS */;
INSERT INTO `pwn_base_plusplanid` VALUES (48,'index','index','index'),(49,'inner','page','html_company'),(56,'11','member','main'),(55,'member','member','login');
/*!40000 ALTER TABLE `pwn_base_plusplanid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_plustemp`
--

DROP TABLE IF EXISTS `pwn_base_plustemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_plustemp` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pluslable` char(30) NOT NULL DEFAULT '',
  `cname` char(30) NOT NULL,
  `tempname` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_plustemp`
--

LOCK TABLES `pwn_base_plustemp` WRITE;
/*!40000 ALTER TABLE `pwn_base_plustemp` DISABLE KEYS */;
INSERT INTO `pwn_base_plustemp` VALUES (201,'modLoginForm','横式会员登录表单，请选用专用边框(如500号边框)','tpl_loginform_h.htm'),(67,'modMemberNewsList','标题+时间','tpl_newslist_time.htm'),(68,'modMemberNewsList','标题+摘要','tpl_newslist_memo.htm'),(87,'modMemberNewsQuery','文章翻页检索,标题+摘要','tpl_newsquery_memo.htm'),(88,'modMemberNewsQuery','文章翻页检索,标题+时间,带表头','tpl_newsquery_cap.htm'),(89,'modNewsAuthorList','标题+时间','tpl_newslist_time.htm'),(90,'modNewsAuthorList','类别+标题','tpl_newslist_cat.htm'),(91,'modNewsAuthorList','标题+摘要','tpl_newslist_memo.htm'),(92,'modNewsAuthorList','标题+作者','tpl_newslist_author.htm'),(103,'modNewsContent','仿新闻门户正文风格','tpl_newscontent_portal.htm'),(16,'modNewsHot','标题+图标风格2','tpl_newshot2.htm'),(58,'modNewsHot','标题+时间','tpl_newshot_time.htm'),(59,'modNewsHot','标题+作者','tpl_newshot_author.htm'),(60,'modNewsHot','标题+图标风格3','tpl_newshot3.htm'),(61,'modNewsHot','标题+图标风格4','tpl_newshot4.htm'),(102,'modNewsHot','标题+点击数','tpl_newshot_cl.htm'),(62,'modNewsHot30','标题+图标风格2','tpl_newshot2.htm'),(63,'modNewsHot30','标题+时间','tpl_newshot_time.htm'),(64,'modNewsHot30','标题+作者','tpl_newshot_author.htm'),(65,'modNewsHot30','标题+图标风格3','tpl_newshot3.htm'),(66,'modNewsHot30','标题+图标风格4','tpl_newshot4.htm'),(101,'modNewsHot30','标题+点击数','tpl_newshot_cl.htm'),(2,'modNewsList','标题+时间','tpl_newslist_time.htm'),(3,'modNewsList','类别+标题','tpl_newslist_cat.htm'),(57,'modNewsList','标题+参数列1,2,3','tpl_newslist_prop3.htm'),(56,'modNewsList','标题+参数列1,2','tpl_newslist_prop2.htm'),(55,'modNewsList','标题+参数列1','tpl_newslist_prop1.htm'),(42,'modNewsList','标题+摘要','tpl_newslist_memo.htm'),(41,'modNewsList','标题+作者','tpl_newslist_author.htm'),(198,'modNewsPicMemo','图片+标题+两个参数列','tpl_newspicprop_2.htm'),(84,'modNewsPicMemo','图片+标题+三个参数列','tpl_newspicprop.htm'),(93,'modNewsProjList','标题+时间','tpl_newslist_time.htm'),(94,'modNewsProjList','类别+标题','tpl_newslist_cat.htm'),(95,'modNewsProjList','标题+摘要','tpl_newslist_memo.htm'),(96,'modNewsProjList','标题+作者','tpl_newslist_author.htm'),(10,'modNewsQuery','文章翻页检索,标题+摘要','tpl_newsquery_memo.htm'),(86,'modNewsQuery','文章翻页检索,标题+时间,带表头','tpl_newsquery_cap.htm'),(97,'modNewsSameTagList','标题+时间','tpl_newslist_time.htm'),(98,'modNewsSameTagList','类别+标题','tpl_newslist_cat.htm'),(99,'modNewsSameTagList','标题+摘要','tpl_newslist_memo.htm'),(100,'modNewsSameTagList','标题+作者','tpl_newslist_author.htm'),(277,'modText','白色文字','tpl_text_2.htm'),(48,'modPicWords','图片+四行标题','tpl_picwordx4.htm'),(46,'modPicWords','图片+两行标题','tpl_picwordx2.htm'),(49,'modPicWords','图片+三行标题','tpl_picwordx3.htm'),(18,'modText','从右到左竖写','tpl_text_1.htm'),(20,'modTraFlash','移动竖条','tpl_flash2.htm'),(21,'modTraFlash','光球光芒时隐时现','tpl_flash3.htm'),(22,'modTraFlash','米字星光','tpl_flash4.htm'),(45,'modWordTT','标题+4组链接','tpl_wordttx4.htm'),(44,'modWordTT','标题+3组链接','tpl_wordttx3.htm'),(43,'modWordTT','标题+2组链接','tpl_wordttx2.htm'),(202,'modNewsSearchForm','竖式搜索表单','tpl_news_searchform_h.htm'),(276,'modVMenu','纯色背景按钮导航菜单','tpl_vmenu_1.htm'),(205,'modCommentSearchForm','竖式搜索表单','tpl_comment_searchform_h.htm'),(206,'modSearchForm','竖式搜索表单','tpl_searchform_h.htm'),(207,'modButtomInfo','灰色渐变背景','tpl_bottominfo_1.htm'),(208,'modMemberTags','头像+三组积分+推荐标签3','tpl_membertags_1.htm'),(209,'modMemberTags','头像+推荐标签3','tpl_membertags_2.htm'),(210,'modMemberRank1','小头像+昵称+积分','tpl_memberrank_head.htm'),(211,'modMemberRank2','小头像+昵称+积分','tpl_memberrank_head.htm'),(212,'modMemberRank3','小头像+昵称+积分','tpl_memberrank_head.htm'),(213,'modMemberRank4','小头像+昵称+积分','tpl_memberrank_head.htm'),(214,'modMemberRank5','小头像+昵称+积分','tpl_memberrank_head.htm'),(215,'modHeadTraFlash','移动竖条','tpl_flash2.htm'),(216,'modHeadTraFlash','光球光芒时隐时现','tpl_flash3.htm'),(217,'modHeadTraFlash','米字星光','tpl_flash4.htm'),(218,'modHeadBgSource','头部效果图片+圆角遮罩(5px)','tpl_headbg_circle.htm'),(219,'modHeadBgSource','头部效果图片+圆角遮罩(9px)','tpl_headbg_circle9.htm'),(220,'modTopMenu','白色文字','tpl_topmenu_white.htm'),(221,'modBgSound','显示播放器','tpl_bgsound_show.htm'),(222,'modFormGroup','列表式','tpl_formgroup_list.htm'),(223,'modNewsList','标题+时间(微软雅黑,14px)','tpl_newslist_time_big.htm'),(245,'modProductSearchForm','竖式搜索表单','tpl_product_searchform_h.htm'),(246,'modProductTwoClass','产品二级分类紧凑型风格','tpl_producttwoclass_1.htm'),(247,'modProductList','产品名称+图片+简介(每行两个产品)','tpl_productlist_1.htm'),(248,'modProductList','产品名称+图片+参数列(每行两个产品)','tpl_productlist_2.htm'),(249,'modProductList','产品名称+图片+简介+参数列(每行两个产品)','tpl_productlist_3.htm'),(250,'modProductList','产品名称+图片+简介(每行三个产品)','tpl_productlist_4.htm'),(251,'modProductList','产品名称+图片+参数列(每行三个产品)','tpl_productlist_5.htm'),(252,'modProductList','产品名称+图片+参数列(文字在图下方，每行产品数自动)','tpl_productlist_6.htm'),(253,'modProductQuery','产品名称+图片+简介(每行两个产品)','tpl_product_query_1.htm'),(254,'modProductQuery','产品名称+图片+参数列(每行两个产品)','tpl_product_query_2.htm'),(255,'modProductQuery','产品名称+图片+简介+参数列(每行两个产品)','tpl_product_query_3.htm'),(256,'modProductQuery','产品名称+图片+简介(每行三个产品)','tpl_product_query_4.htm'),(257,'modProductQuery','产品名称+图片+参数列(每行三个产品)','tpl_product_query_5.htm'),(258,'modProductQuery','产品名称+图片+参数列(文字在图下方，每行产品数自动)','tpl_product_query_6.htm'),(259,'modProductContent','会员互动型产品详情风格','tpl_product_content_1.htm'),(261,'modDropDownMenu','圆角标签二级下拉菜单模板','tpl_dropdownmenu_6.htm'),(299,'modChannelMenu','方形按钮二级菜单浅色背景','tpl_channelmenu_1007.htm'),(264,'modMainMenu','水晶按钮一级导航菜单模板','tpl_mainmenu_5.htm'),(265,'modMainMenu','透明背景纯文字菜单模板','tpl_mainmenu_4.htm'),(266,'modBottomMenu','底部菜单之纯文字菜单模板','tpl_bottommenu_1.htm'),(267,'modNewsList','双列文章标题模板','tpl_newslist_mul.htm'),(268,'modPageTitleMenu','圆角按钮型网页标题菜单','tpl_page_titlemenu_b1.htm'),(271,'modCommentContent','留言问答风格','tpl_comment_content_pw.htm'),(272,'modMemberMenu','圆角按钮仿QQ菜单模板','tpl_qqmenu_1.htm'),(273,'modNewsList','标题 时间（反白）','tpl_newslist_time_white.htm'),(275,'modWordText','标题和介绍白色文字模板','tpl_wordtext_1_cr.htm'),(278,'modVMenu','方形带箭头按钮菜单','tpl_vmenu_c002.htm'),(279,'modPicWordText','图片标题文字环绕','tpl_picwordtext_2.htm'),(281,'modPhotoHot','排行榜样式二','tpl_photohot2.htm'),(282,'modPhotoContent','浅蓝淡雅风格','tpl_photo_content_blue.htm'),(283,'modPhotoHot','标题+时间','tpl_photohot_time.htm'),(284,'modPhotoHot','标题+作者','tpl_photohot_author.htm'),(285,'modPhotoHot','标题+点击数','tpl_photohot_cl.htm'),(286,'modPhotoHot30','排行榜样式二','tpl_photohot2.htm'),(287,'modPhotoHot30','标题+时间','tpl_photohot_time.htm'),(288,'modPhotoHot30','标题+作者','tpl_photohot_author.htm'),(289,'modPhotoHot30','标题+点击数','tpl_photohot_cl.htm'),(290,'modPhotoPicMemo','图片+名称+三个参数列','tpl_photopicprop.htm'),(291,'modPhotoPicMemo','图片+名称+两个参数列','tpl_photopicprop_2.htm'),(292,'modPhotoSearchForm','竖式搜索表单','tpl_photo_searchform_h.htm'),(293,'modPhotoTwoClass','图片二级分类紧凑型风格','tpl_phototwoclass_1.htm'),(294,'modDownHot','排行榜样式二','tpl_downhot2.htm'),(295,'modDownSearchForm','竖式搜索表单','tpl_down_searchform_h.htm'),(296,'modDownQuery','下载检索,标题 时间 简介','tpl_down_query_memo.htm'),(297,'modDownQuery','下载检索(标题 分类 发布人)','tpl_down_query_auth_cat.htm'),(300,'modPageTitleMenu','双色按钮菜单','tpl_page_titlemenu_1007.htm'),(301,'modPagePicList','图片 标题 摘要,每行两个','tpl_page_piclist_2.htm');
/*!40000 ALTER TABLE `pwn_base_plustemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_base_version`
--

DROP TABLE IF EXISTS `pwn_base_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_base_version` (
  `version` varchar(30) NOT NULL DEFAULT '',
  `release` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_base_version`
--

LOCK TABLES `pwn_base_version` WRITE;
/*!40000 ALTER TABLE `pwn_base_version` DISABLE KEYS */;
INSERT INTO `pwn_base_version` VALUES ('1.0.0',20090215),('1.1.0',20090320),('1.1.1',20090326),('1.1.2',20090327),('1.1.3',20090328),('1.1.4',20090401),('1.1.5',20090402),('1.1.6',20090412),('1.1.7',20090418),('1.1.8',20090419),('1.1.9',20090420),('1.1.10',20090421),('1.2.0',20090428),('1.2.1',20090504),('1.2.2',20090508),('1.2.3',20090514),('1.2.4',20090612),('1.2.5',20090615),('1.2.6',20090624),('1.2.7',20090728),('1.2.8',20090801),('1.2.9',20090802),('1.2.10',20090803),('1.2.11',20090804),('1.2.12',20090820),('1.2.12',20090820),('1.3.0',20090828),('1.3.1',20090829),('1.3.2',20090830),('1.3.3',20090831),('1.3.4',20090901),('1.3.5',20090902),('1.3.6',20090903),('1.3.7',20090904),('1.3.15',20090912),('1.3.16',20091009),('1.3.17',20091010),('1.3.18',20091112),('1.3.19',20100623),('1.4.0',20100830),('1.4.1',20100920),('1.4.2',20100921),('1.4.3',20100925),('1.5.0',20111209),('2.0.0',20120407),('2.0.1',20120408),('2.0.2',20120409),('2.0.2',20120409),('2.0.3',20120410),('2.0.4',20120411),('2.0.5',20120412),('2.0.8',20121013),('2.0.9',20121014),('2.0.10',20121015),('2.0.11',20121016),('2.0.12',20121017),('2.0.14',20121019),('2.0.15',20121030),('2.0.16',20121106),('2.0.17',20121107),('2.0.18',20121108),('2.0.19',20121109),('2.0.20',20121110),('2.0.21',20121209),('2.0.22',20121210),('2.0.23',20121211),('2.0.24',20121213),('2.0.25',20121220),('2.0.26',20121221),('2.0.27',20121226),('2.0.28',20130121),('2.0.29',20130123),('2.0.30',20130212),('2.0.31',20130308),('2.0.32',20130309),('2.0.33',20130310),('2.0.34',20130311),('2.0.35',20130312),('2.0.36',20130323),('2.0.37',20130403),('2.0.38',20130406),('2.0.39',20130417),('2.0.40',20130423),('2.0.41',20130428),('2.0.42',20130503),('2.0.43',20130504),('2.0.44',20130505),('2.0.45',20130506),('2.0.46',20130507),('2.0.47',20130509),('2.0.48',20130510),('2.0.49',20130513),('2.0.50',20130608),('2.0.51',20130621),('2.0.52',20130626),('2.0.53',20130705),('2.0.54',20130727);
/*!40000 ALTER TABLE `pwn_base_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_comment`
--

DROP TABLE IF EXISTS `pwn_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `rid` int(20) NOT NULL DEFAULT '0',
  `contype` varchar(30) NOT NULL DEFAULT 'comment',
  `pname` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `body` text,
  `pj1` int(1) NOT NULL DEFAULT '3',
  `pj2` int(1) NOT NULL DEFAULT '3',
  `pj3` int(1) NOT NULL DEFAULT '3',
  `dtime` int(11) NOT NULL DEFAULT '0',
  `uptime` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `iffb` int(1) NOT NULL DEFAULT '0',
  `tuijian` int(1) NOT NULL DEFAULT '0',
  `cl` int(10) NOT NULL DEFAULT '0',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `lastmemberid` int(12) NOT NULL DEFAULT '0',
  `backcount` int(12) NOT NULL DEFAULT '0',
  `picsrc` varchar(255) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `memberid` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=516 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_comment`
--

LOCK TABLES `pwn_comment` WRITE;
/*!40000 ALTER TABLE `pwn_comment` DISABLE KEYS */;
INSERT INTO `pwn_comment` VALUES (515,0,109,0,'comment','测试会员','test','test',3,3,3,1238898529,1238898529,'127.0.0.1',1,0,6,'测试会员',150,0,'',1,150),(514,0,109,0,'comment','游客','产品咨询','sss',3,3,3,1238224685,1238224685,'127.0.0.1',1,0,8,'游客',-1,0,'',1,-1);
/*!40000 ALTER TABLE `pwn_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_comment_cat`
--

DROP TABLE IF EXISTS `pwn_comment_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_comment_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(6) NOT NULL DEFAULT '0',
  `cat` varchar(50) NOT NULL DEFAULT '',
  `catpath` varchar(255) NOT NULL,
  `coltype` varchar(30) NOT NULL DEFAULT '',
  `xuhao` int(4) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '0',
  `ifbbs` int(1) NOT NULL DEFAULT '1',
  `ifshow` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_comment_cat`
--

LOCK TABLES `pwn_comment_cat` WRITE;
/*!40000 ALTER TABLE `pwn_comment_cat` DISABLE KEYS */;
INSERT INTO `pwn_comment_cat` VALUES (1,0,'文章评论','0001:','news',0,0,0,0),(109,0,'产品咨询','0109:','comment',1,1,1,1),(4,0,'产品点评','0004:','product',0,0,0,0),(110,0,'知识问答','0110:','comment',2,1,1,1),(111,0,'用户茶座','0111:','comment',7,1,1,1),(2,0,'图片点评','0002:','photo',0,0,0,0),(3,0,'下载点评','1003:','down',0,0,0,0);
/*!40000 ALTER TABLE `pwn_comment_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_comment_config`
--

DROP TABLE IF EXISTS `pwn_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_comment_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_comment_config`
--

LOCK TABLES `pwn_comment_config` WRITE;
/*!40000 ALTER TABLE `pwn_comment_config` DISABLE KEYS */;
INSERT INTO `pwn_comment_config` VALUES (5,'匿名点评是否审核','YN','30','noMembercheck','0','匿名发表、回复点评时是否审核'),(7,'点评图片上传尺寸限制(Byte)','input','30','EditPicLimit','204800','发表点评时，编辑器内上传图片大小的限制'),(6,'未登录时是否允许上传图片','YN','30','NoMemberUpPic','0','未登录会员时,是否允许在编辑器内上传图片(备注:会员登录后发表点评是否可以上传图片，在会员权限中设置)'),(1,'模块频道名称','input','30','ChannelName','网友留言','本模块对应的频道名称，如“网友点评”；用于显示在网页标题、当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','1','是否在当前位置提示条显示模块频道名称'),(8,'点评关键词过滤','textarea','30','KeywordDeny','法轮功,麻醉,兴奋剂,妈的,操你,日你','点评禁止的词语，多个以逗号分割');
/*!40000 ALTER TABLE `pwn_comment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_cat`
--

DROP TABLE IF EXISTS `pwn_down_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) DEFAULT NULL,
  `cat` char(100) DEFAULT NULL,
  `xuhao` int(12) DEFAULT NULL,
  `catpath` char(255) DEFAULT NULL,
  `nums` int(20) DEFAULT NULL,
  `tj` int(1) NOT NULL DEFAULT '0',
  `ifchannel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_cat`
--

LOCK TABLES `pwn_down_cat` WRITE;
/*!40000 ALTER TABLE `pwn_down_cat` DISABLE KEYS */;
INSERT INTO `pwn_down_cat` VALUES (1,0,'软件下载',1,'0001:',0,0,0),(2,0,'产品资料下载',2,'0002:',0,0,0),(3,0,'服务表格下载',3,'0003:',0,0,0);
/*!40000 ALTER TABLE `pwn_down_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_con`
--

DROP TABLE IF EXISTS `pwn_down_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_con` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(12) NOT NULL DEFAULT '0',
  `catpath` varchar(255) NOT NULL DEFAULT '',
  `pcatid` int(12) NOT NULL DEFAULT '0',
  `contype` varchar(20) NOT NULL DEFAULT 'down',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` text,
  `dtime` int(11) DEFAULT '0',
  `xuhao` int(5) DEFAULT '0',
  `cl` int(20) DEFAULT NULL,
  `tj` int(1) DEFAULT NULL,
  `iffb` int(1) DEFAULT '0',
  `ifbold` int(1) DEFAULT '0',
  `ifred` varchar(20) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `src` varchar(150) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `memberid` varchar(100) DEFAULT NULL,
  `proj` varchar(255) NOT NULL DEFAULT '',
  `secure` int(11) NOT NULL DEFAULT '0',
  `memo` text NOT NULL,
  `prop1` char(255) NOT NULL DEFAULT '',
  `prop2` char(255) NOT NULL DEFAULT '',
  `prop3` char(255) NOT NULL DEFAULT '',
  `prop4` char(255) NOT NULL DEFAULT '',
  `prop5` char(255) NOT NULL DEFAULT '',
  `prop6` char(255) NOT NULL DEFAULT '',
  `prop7` char(255) NOT NULL DEFAULT '',
  `prop8` char(255) NOT NULL DEFAULT '',
  `prop9` char(255) NOT NULL DEFAULT '',
  `prop10` char(255) NOT NULL DEFAULT '',
  `prop11` char(255) NOT NULL DEFAULT '',
  `prop12` char(255) NOT NULL DEFAULT '',
  `prop13` char(255) NOT NULL DEFAULT '',
  `prop14` char(255) NOT NULL DEFAULT '',
  `prop15` char(255) NOT NULL DEFAULT '',
  `prop16` char(255) NOT NULL DEFAULT '',
  `prop17` char(255) NOT NULL DEFAULT '',
  `prop18` char(255) NOT NULL DEFAULT '',
  `prop19` char(255) NOT NULL DEFAULT '',
  `prop20` char(255) NOT NULL DEFAULT '',
  `fileurl` varchar(100) NOT NULL,
  `downcount` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL,
  `zhichi` int(5) NOT NULL DEFAULT '0',
  `fandui` int(5) NOT NULL DEFAULT '0',
  `tplog` text NOT NULL,
  `downcentid` int(1) NOT NULL DEFAULT '1',
  `downcent` int(5) NOT NULL DEFAULT '0',
  `centincome` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_con`
--

LOCK TABLES `pwn_down_con` WRITE;
/*!40000 ALTER TABLE `pwn_down_con` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_config`
--

DROP TABLE IF EXISTS `pwn_down_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_config`
--

LOCK TABLES `pwn_down_config` WRITE;
/*!40000 ALTER TABLE `pwn_down_config` DISABLE KEYS */;
INSERT INTO `pwn_down_config` VALUES (1,'模块频道名称','input','30','ChannelName','资料下载','本模块对应的频道名称，如“资源下载”；用于显示在网页标题、当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','1','是否在当前位置提示条显示模块频道名称'),(3,'文件上传大小限制(Byte)','input','30','FileSizeLimit','1024000','会员上传文件时,单个文件大小的限制;但最高设置不能超过2M'),(7,'下载介绍编辑器图片上传限制(Byte)','input','30','EditPicLimit','512000','会员发布下载资源时,在编辑器内上传图片,单个图片的尺寸限制'),(8,'下载交易积分类型','centlist','30','DefaultCentId','3','会员资源下载交易所采用的积分类型'),(9,'下载交易积分佣金','centyj','30','CentYj','0.2','资源下载积分交易中网站方收取的佣金比例，如果计算后不足1个积分单位，以1个积分单位计算');
/*!40000 ALTER TABLE `pwn_down_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_downlog`
--

DROP TABLE IF EXISTS `pwn_down_downlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_downlog` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `downid` int(12) NOT NULL DEFAULT '0',
  `memberid` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_downlog`
--

LOCK TABLES `pwn_down_downlog` WRITE;
/*!40000 ALTER TABLE `pwn_down_downlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_downlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_pages`
--

DROP TABLE IF EXISTS `pwn_down_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_pages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `downid` int(12) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `xuhao` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_pages`
--

LOCK TABLES `pwn_down_pages` WRITE;
/*!40000 ALTER TABLE `pwn_down_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_pcat`
--

DROP TABLE IF EXISTS `pwn_down_pcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_pcat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_pcat`
--

LOCK TABLES `pwn_down_pcat` WRITE;
/*!40000 ALTER TABLE `pwn_down_pcat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_pcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_proj`
--

DROP TABLE IF EXISTS `pwn_down_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_proj` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `folder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_proj`
--

LOCK TABLES `pwn_down_proj` WRITE;
/*!40000 ALTER TABLE `pwn_down_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_down_prop`
--

DROP TABLE IF EXISTS `pwn_down_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_down_prop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catid` int(20) NOT NULL DEFAULT '0',
  `propname` char(30) DEFAULT NULL,
  `xuhao` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xuhao` (`xuhao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_down_prop`
--

LOCK TABLES `pwn_down_prop` WRITE;
/*!40000 ALTER TABLE `pwn_down_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_down_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member`
--

DROP TABLE IF EXISTS `pwn_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member` (
  `memberid` int(12) NOT NULL AUTO_INCREMENT,
  `membertypeid` int(3) NOT NULL DEFAULT '0',
  `membergroupid` int(3) NOT NULL DEFAULT '0',
  `user` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL DEFAULT '',
  `birthday` int(8) NOT NULL DEFAULT '0',
  `zoneid` int(10) NOT NULL DEFAULT '0',
  `catid` int(10) NOT NULL DEFAULT '0',
  `addr` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `mov` varchar(255) NOT NULL DEFAULT '',
  `postcode` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT 'http://',
  `passtype` varchar(255) NOT NULL DEFAULT '',
  `passcode` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(100) NOT NULL DEFAULT '',
  `msn` varchar(100) NOT NULL DEFAULT '',
  `maillist` int(1) NOT NULL DEFAULT '0',
  `bz` text,
  `pname` varchar(30) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `memberface` varchar(100) NOT NULL,
  `nowface` varchar(50) NOT NULL,
  `checked` int(1) NOT NULL DEFAULT '0',
  `rz` int(1) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL,
  `regtime` int(11) NOT NULL DEFAULT '0',
  `exptime` int(11) NOT NULL DEFAULT '0',
  `account` decimal(12,2) NOT NULL DEFAULT '0.00',
  `paytotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `buytotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cent1` int(10) NOT NULL DEFAULT '0',
  `cent2` int(10) NOT NULL DEFAULT '0',
  `cent3` int(10) NOT NULL DEFAULT '0',
  `cent4` int(10) NOT NULL DEFAULT '0',
  `cent5` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(26) NOT NULL DEFAULT '',
  `logincount` int(20) NOT NULL DEFAULT '0',
  `logintime` int(11) NOT NULL DEFAULT '0',
  `loginip` varchar(50) NOT NULL DEFAULT '',
  `salesname` varchar(30) NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member`
--

LOCK TABLES `pwn_member` WRITE;
/*!40000 ALTER TABLE `pwn_member` DISABLE KEYS */;
INSERT INTO `pwn_member` VALUES (150,26,1,'aaaaa','594f803b380a41396ed63dca39503542','小张','','1',19750101,1,0,'','','','','aaaaa@www.cn','http://','身份证','','','',0,'','测试会员','sssss','','1',1,0,'',1232813523,0,'0.00','0.00','0.00',225,0,0,3,0,'127.0.0.1',18,1238897444,'127.0.0.1',''),(154,26,1,'sssssss','2d02e669731cbade6a64b58d602cf2a4','','','',0,0,0,'','','','','ss@www.cn','http://','','','','',0,NULL,'sssssss','','','1',1,0,'',1238290626,0,'0.00','0.00','0.00',10,0,0,0,0,'127.0.0.1',1,1238290626,'127.0.0.1',''),(155,26,1,'linye','e10adc3949ba59abbe56e057f20f883e','11111','','1',19020101,1,0,'','','','','12@qq.com','http://','身份证','','','',0,'','linye','','','1',1,0,'',1395388026,0,'0.00','0.00','0.00',10,0,0,0,0,'218.23.220.183',1,1395388026,'218.23.220.183','');
/*!40000 ALTER TABLE `pwn_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_buylist`
--

DROP TABLE IF EXISTS `pwn_member_buylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_buylist` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `buyfrom` varchar(50) NOT NULL DEFAULT '',
  `memberid` int(12) NOT NULL DEFAULT '0',
  `orderid` int(12) NOT NULL DEFAULT '0',
  `payid` int(12) NOT NULL DEFAULT '0',
  `paytype` varchar(50) NOT NULL DEFAULT '0',
  `payhb` varchar(30) NOT NULL DEFAULT '',
  `payhl` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `paytotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `daytime` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `OrderNo` varchar(30) NOT NULL DEFAULT '',
  `logname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_buylist`
--

LOCK TABLES `pwn_member_buylist` WRITE;
/*!40000 ALTER TABLE `pwn_member_buylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_buylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_cat`
--

DROP TABLE IF EXISTS `pwn_member_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(4) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  `nums` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_cat`
--

LOCK TABLES `pwn_member_cat` WRITE;
/*!40000 ALTER TABLE `pwn_member_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_centlog`
--

DROP TABLE IF EXISTS `pwn_member_centlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_centlog` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `event` int(5) NOT NULL DEFAULT '0',
  `dtime` int(11) NOT NULL DEFAULT '0',
  `cent1` int(10) NOT NULL DEFAULT '0',
  `cent2` int(10) NOT NULL DEFAULT '0',
  `cent3` int(10) NOT NULL DEFAULT '0',
  `cent4` int(10) NOT NULL DEFAULT '0',
  `cent5` int(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_centlog`
--

LOCK TABLES `pwn_member_centlog` WRITE;
/*!40000 ALTER TABLE `pwn_member_centlog` DISABLE KEYS */;
INSERT INTO `pwn_member_centlog` VALUES (1,153,111,1237648810,10,0,0,0,0,''),(2,153,131,1237648965,5,0,0,0,0,''),(3,153,181,1237650958,10,0,0,0,0,''),(4,150,114,1237711955,1,0,0,0,0,''),(5,150,114,1237781183,1,0,0,0,0,''),(6,150,114,1238228910,1,0,0,0,0,''),(7,150,121,1238230484,10,0,0,0,0,''),(8,150,114,1238260989,1,0,0,0,0,''),(9,154,111,1238290627,10,0,0,0,0,''),(10,150,114,1238424185,1,0,0,0,0,''),(11,150,114,1238426835,1,0,0,0,0,''),(12,150,114,1238427138,1,0,0,0,0,''),(13,150,114,1238896776,1,0,0,0,0,''),(14,150,114,1238897444,1,0,0,0,0,''),(15,150,131,1238898529,5,0,0,0,0,''),(16,155,111,1395388026,10,0,0,0,0,'');
/*!40000 ALTER TABLE `pwn_member_centlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_centrule`
--

DROP TABLE IF EXISTS `pwn_member_centrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_centrule` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL,
  `name` char(100) NOT NULL DEFAULT '',
  `event` int(5) NOT NULL DEFAULT '0',
  `cent1` int(10) NOT NULL DEFAULT '0',
  `cent2` int(10) NOT NULL DEFAULT '0',
  `cent3` int(10) NOT NULL DEFAULT '0',
  `cent4` int(10) NOT NULL DEFAULT '0',
  `cent5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_centrule`
--

LOCK TABLES `pwn_member_centrule` WRITE;
/*!40000 ALTER TABLE `pwn_member_centrule` DISABLE KEYS */;
INSERT INTO `pwn_member_centrule` VALUES (1,'member','新会员注册',111,10,0,0,0,0),(6,'member','加好友',112,1,0,0,0,0),(7,'member','发站内短信',113,1,0,0,0,0),(21,'member','会员登录',114,1,0,0,0,0),(2,'news','发布文章',121,10,0,0,0,0),(9,'news','文章被支持',122,0,1,0,0,0),(10,'news','文章被反对',123,0,-1,0,0,0),(22,'news','文章被版主推荐',124,20,0,0,0,0),(23,'news','文章被版主删除并扣分',125,-20,0,0,0,0),(5,'comment','发表点评',131,5,0,0,0,0),(8,'comment','回复点评',132,1,0,0,0,0),(28,'comment','点评被版主推荐',134,20,0,0,0,0),(29,'comment','点评被版主删除并扣分',135,-20,0,0,0,0),(30,'product','发布产品',181,10,0,0,0,0),(31,'product','产品被支持',182,0,1,0,0,0),(32,'product','产品被反对',183,0,-1,0,0,0),(33,'product','产品被版主推荐',184,20,0,0,0,0),(34,'product','产品被版主删除并扣分',185,-20,0,0,0,0),(35,'photo','发布图片',151,10,0,0,0,0),(36,'photo','图片被支持',152,0,1,0,0,0),(37,'photo','图片被反对',153,0,-1,0,0,0),(38,'photo','图片被版主推荐',154,20,0,0,0,0),(39,'photo','图片被版主删除并扣分',155,-20,0,0,0,0),(40,'down','发布资源下载',161,10,0,0,0,0),(41,'down','下载资源被支持',162,0,1,0,0,0),(42,'down','下载资源被反对',163,0,-1,0,0,0),(43,'down','下载资源被版主推荐',164,20,0,0,0,0),(44,'down','下载被版主删除并扣分',165,-20,0,0,0,0);
/*!40000 ALTER TABLE `pwn_member_centrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_centset`
--

DROP TABLE IF EXISTS `pwn_member_centset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_centset` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `centname1` char(50) NOT NULL,
  `centname2` char(50) NOT NULL,
  `centname3` char(50) NOT NULL,
  `centname4` char(50) NOT NULL,
  `centname5` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_centset`
--

LOCK TABLES `pwn_member_centset` WRITE;
/*!40000 ALTER TABLE `pwn_member_centset` DISABLE KEYS */;
INSERT INTO `pwn_member_centset` VALUES (1,'经验','人气','悬赏','金币','消费');
/*!40000 ALTER TABLE `pwn_member_centset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_config`
--

DROP TABLE IF EXISTS `pwn_member_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_config`
--

LOCK TABLES `pwn_member_config` WRITE;
/*!40000 ALTER TABLE `pwn_member_config` DISABLE KEYS */;
INSERT INTO `pwn_member_config` VALUES (1,'模块频道名称','input','30','ChannelName','会员中心','本模块对应的频道名称；用于显示在当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','1','是否在当前位置提示条显示模块频道名称'),(3,'会员网名昵称是否允许重复','YN','1','DblPname','1','会员注册和修改资料时校验网名昵称是否允许重复'),(4,'UCenter 会员接口是否启用','YN','1','UC_OPEN','0','UCenter会员接口包括会员注册、会员登录接口；启用本接口前请先上传UCenter会员接口程序'),(5,'UCenter 应用 ID','input','30','UC_APPID','2','该值为PHPWEB在 UCenter 的应用 ID，请填写你在UCenter将PHPWEB添加应用后实际获得的应用ID'),(6,'UCenter 通信密钥','input','30','UC_KEY','PWUC2009','通信密钥用于在 UCenter 和 PHPWEB 之间传输信息的加密，可包含任何字母及数字，请在 UCenter 与 PHPWEB 设置完全相同的通讯密钥，以确保两套系统能够正常通信'),(7,'UCenter 访问地址','input','30','UC_API','http://discuz.phpweb.net/uc_server','您的 UCenter 访问地址，不正确的设置可能导致网站功能异常，请小心修改。格式: http://www.sitename.com/uc_server (最后不要加\'/\')'),(7,'UCenter IP 地址','input','30','UC_IP','','如果您的服务器无法通过域名访问 UCenter，可以输入 UCenter 服务器的 IP 地址'),(8,'UCenter 数据库服务器','input','30','UC_DBHOST','localhost','可以是本地也可以是远程数据库服务器，如果 MySQL 端口不是默认的 3306，请填写如下形式：127.0.0.1:6033'),(9,'UCenter 数据库用户名','input','30','UC_DBUSER','root',''),(10,'UCenter 数据库密码','input','30','UC_DBPW','123456',''),(12,'UCenter 数据库名','input','30','UC_DBNAME','dbdiscuz',''),(13,'UCenter 数据表前缀','input','30','UC_DBTABLEPRE','cdb_uc_','请填入您的UCenter数据表前缀，注意格式正确；如果是直接安装UCENTER，表前缀是一个“_”，如果是和discuz!一起安装的，则是带两个“_”的完整前缀'),(14,'UCenter 数据库编码','input','30','UC_DBCHARSET','utf8','UCenter的数据库编码'),(15,'UCenter 的字符集','input','30','UC_CHARSET','utf-8',''),(17,'UCenter 用户自动激活时对应的会员类型','MTYPE','30','UC_MEMBERTYPEID','26','用户登录时，在UCenter通过验证的用户（来自其他应用的用户），如果本系统没有该会员，自动增加会员时对应的会员类型');
/*!40000 ALTER TABLE `pwn_member_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_defaultrights`
--

DROP TABLE IF EXISTS `pwn_member_defaultrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_defaultrights` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `membertypeid` int(12) NOT NULL DEFAULT '0',
  `secureid` int(12) NOT NULL DEFAULT '0',
  `securetype` char(100) NOT NULL DEFAULT '',
  `secureset` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_defaultrights`
--

LOCK TABLES `pwn_member_defaultrights` WRITE;
/*!40000 ALTER TABLE `pwn_member_defaultrights` DISABLE KEYS */;
INSERT INTO `pwn_member_defaultrights` VALUES (505,26,133,'func','0'),(504,26,132,'func','0'),(502,26,127,'func','0'),(503,26,131,'func','0'),(501,26,126,'class',':1:2:'),(500,26,123,'func','0'),(499,26,122,'func','0'),(498,26,121,'func','0'),(497,26,114,'func','0'),(493,26,101,'con','1'),(494,26,111,'func','0'),(495,26,112,'func','0'),(496,26,113,'func','0');
/*!40000 ALTER TABLE `pwn_member_defaultrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_fav`
--

DROP TABLE IF EXISTS `pwn_member_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_fav` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_fav`
--

LOCK TABLES `pwn_member_fav` WRITE;
/*!40000 ALTER TABLE `pwn_member_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_friends`
--

DROP TABLE IF EXISTS `pwn_member_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_friends` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `fid` int(12) NOT NULL DEFAULT '0',
  `fgroup` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_friends`
--

LOCK TABLES `pwn_member_friends` WRITE;
/*!40000 ALTER TABLE `pwn_member_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_group`
--

DROP TABLE IF EXISTS `pwn_member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_group` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `membergroup` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_group`
--

LOCK TABLES `pwn_member_group` WRITE;
/*!40000 ALTER TABLE `pwn_member_group` DISABLE KEYS */;
INSERT INTO `pwn_member_group` VALUES (1,'个人'),(2,'企业');
/*!40000 ALTER TABLE `pwn_member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_msn`
--

DROP TABLE IF EXISTS `pwn_member_msn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_msn` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tomemberid` int(12) NOT NULL DEFAULT '0',
  `frommemberid` int(12) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `dtime` int(11) NOT NULL DEFAULT '0',
  `iflook` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_msn`
--

LOCK TABLES `pwn_member_msn` WRITE;
/*!40000 ALTER TABLE `pwn_member_msn` DISABLE KEYS */;
INSERT INTO `pwn_member_msn` VALUES (2,154,0,'sssssss,您好!\r\n\r\n感谢您在本站注册!\r\n\r\n会员名: sssssss\r\n密码: sssss\r\n\r\n网址:http://',1238290626,0),(3,155,0,'linye,您好!\r\n\r\n感谢您在本站注册!\r\n\r\n会员名: linye\r\n密码: 123456\r\n\r\n网址:http://',1395388026,1);
/*!40000 ALTER TABLE `pwn_member_msn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_notice`
--

DROP TABLE IF EXISTS `pwn_member_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_notice` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `membertypeid` int(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `dtime` int(11) DEFAULT NULL,
  `xuhao` int(5) DEFAULT NULL,
  `cl` int(20) DEFAULT NULL,
  `ifnew` int(1) DEFAULT NULL,
  `ifred` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_notice`
--

LOCK TABLES `pwn_member_notice` WRITE;
/*!40000 ALTER TABLE `pwn_member_notice` DISABLE KEYS */;
INSERT INTO `pwn_member_notice` VALUES (1,0,'这是测试的一条会员公告','这是测试的一条会员公告',1220596305,0,2,0,0);
/*!40000 ALTER TABLE `pwn_member_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_nums`
--

DROP TABLE IF EXISTS `pwn_member_nums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_nums` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(50) DEFAULT NULL,
  `secureid` int(50) DEFAULT NULL,
  `nums` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_nums`
--

LOCK TABLES `pwn_member_nums` WRITE;
/*!40000 ALTER TABLE `pwn_member_nums` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_nums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_onlinepay`
--

DROP TABLE IF EXISTS `pwn_member_onlinepay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_onlinepay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(20) NOT NULL DEFAULT '0',
  `payid` int(11) NOT NULL DEFAULT '0',
  `paytype` char(30) NOT NULL DEFAULT '',
  `paytotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ifpay` int(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `backtime` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_onlinepay`
--

LOCK TABLES `pwn_member_onlinepay` WRITE;
/*!40000 ALTER TABLE `pwn_member_onlinepay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_onlinepay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_pay`
--

DROP TABLE IF EXISTS `pwn_member_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(20) NOT NULL DEFAULT '0',
  `payid` int(11) NOT NULL DEFAULT '0',
  `payhb` varchar(30) NOT NULL DEFAULT '',
  `payhl` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `oof` decimal(12,2) NOT NULL DEFAULT '0.00',
  `method` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `fpnum` varchar(100) NOT NULL DEFAULT '',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `logname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_pay`
--

LOCK TABLES `pwn_member_pay` WRITE;
/*!40000 ALTER TABLE `pwn_member_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_paycenter`
--

DROP TABLE IF EXISTS `pwn_member_paycenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_paycenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcenter` varchar(100) NOT NULL DEFAULT '',
  `pcentertype` int(2) NOT NULL DEFAULT '0',
  `pcenteruser` varchar(100) NOT NULL DEFAULT '',
  `pcenterkey` text,
  `key1` text,
  `key2` text,
  `hbtype` varchar(255) NOT NULL DEFAULT '',
  `postfile` varchar(100) NOT NULL DEFAULT '',
  `recfile` varchar(100) NOT NULL DEFAULT '',
  `ifuse` int(1) NOT NULL DEFAULT '0',
  `ifback` int(1) NOT NULL DEFAULT '0',
  `intro` text,
  `xuhao` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_paycenter`
--

LOCK TABLES `pwn_member_paycenter` WRITE;
/*!40000 ALTER TABLE `pwn_member_paycenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_member_paycenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_regstep`
--

DROP TABLE IF EXISTS `pwn_member_regstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_regstep` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `membertypeid` int(5) NOT NULL DEFAULT '0',
  `regstep` varchar(30) NOT NULL,
  `stepname` varchar(50) NOT NULL,
  `xuhao` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_regstep`
--

LOCK TABLES `pwn_member_regstep` WRITE;
/*!40000 ALTER TABLE `pwn_member_regstep` DISABLE KEYS */;
INSERT INTO `pwn_member_regstep` VALUES (1,0,'person','头像签名设置',1),(2,0,'detail','会员资料设置',2),(3,0,'contact','填写联系信息',3),(66,26,'contact','填写联系信息',3),(65,26,'detail','会员资料设置',2),(64,26,'person','头像签名设置',1);
/*!40000 ALTER TABLE `pwn_member_regstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_rights`
--

DROP TABLE IF EXISTS `pwn_member_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_rights` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `secureid` int(12) NOT NULL DEFAULT '0',
  `securetype` char(100) NOT NULL,
  `secureset` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4666 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_rights`
--

LOCK TABLES `pwn_member_rights` WRITE;
/*!40000 ALTER TABLE `pwn_member_rights` DISABLE KEYS */;
INSERT INTO `pwn_member_rights` VALUES (4583,150,164,'func','0'),(4582,150,163,'func','0'),(4581,150,162,'func','0'),(4580,150,161,'func','0'),(4579,150,157,'func','0'),(4578,150,156,'class',':5:'),(4577,150,153,'func','0'),(4576,150,152,'func','0'),(4575,150,151,'func','0'),(4574,150,134,'func','0'),(4573,150,133,'func','0'),(4572,150,132,'func','0'),(4571,150,131,'func','0'),(4570,150,129,'banzhu',''),(4569,150,127,'func','0'),(4568,150,126,'class',':1:2:'),(4567,150,125,'func','0'),(4566,150,124,'func','0'),(4565,150,123,'func','0'),(4564,150,122,'func','0'),(4563,150,121,'func','0'),(4562,150,114,'func','0'),(4561,150,113,'func','0'),(4560,150,112,'func','0'),(4559,150,111,'func','0'),(4558,150,101,'con','1'),(4588,150,169,'banzhu',''),(4587,150,139,'banzhu',''),(4586,150,159,'banzhu',''),(4585,150,167,'func','0'),(4584,150,166,'class',':1:'),(4640,154,133,'func','0'),(4641,154,132,'func','0'),(4642,154,127,'func','0'),(4643,154,131,'func','0'),(4644,154,126,'class',':1:2:'),(4645,154,123,'func','0'),(4646,154,122,'func','0'),(4647,154,121,'func','0'),(4648,154,114,'func','0'),(4649,154,101,'con','1'),(4650,154,111,'func','0'),(4651,154,112,'func','0'),(4652,154,113,'func','0'),(4653,155,133,'func','0'),(4654,155,132,'func','0'),(4655,155,127,'func','0'),(4656,155,131,'func','0'),(4657,155,126,'class',':1:2:'),(4658,155,123,'func','0'),(4659,155,122,'func','0'),(4660,155,121,'func','0'),(4661,155,114,'func','0'),(4662,155,101,'con','1'),(4663,155,111,'func','0'),(4664,155,112,'func','0'),(4665,155,113,'func','0');
/*!40000 ALTER TABLE `pwn_member_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_secure`
--

DROP TABLE IF EXISTS `pwn_member_secure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_secure` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `coltype` varchar(30) NOT NULL,
  `securename` char(100) NOT NULL DEFAULT '',
  `securetype` char(30) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_secure`
--

LOCK TABLES `pwn_member_secure` WRITE;
/*!40000 ALTER TABLE `pwn_member_secure` DISABLE KEYS */;
INSERT INTO `pwn_member_secure` VALUES (101,'base','内容阅读权限级别','con',1),(111,'member','会员登录帐号设置','func',2),(112,'member','会员头像签名设置','func',3),(113,'member','会员个人资料修改','func',4),(114,'member','会员联系信息修改','func',5),(121,'news','文章发布权限','func',6),(122,'news','文章修改权限','func',7),(123,'news','文章发布/修改免审核权限','func',8),(124,'news','文章图片上传权限','func',5),(125,'news','文章附件上传权限','func',8),(126,'news','文章公共分类投稿授权','class',12),(127,'news','文章自定义分类权限','func',9),(129,'news','文章版主权限(推荐/删除)','banzhu',9),(131,'comment','点评发表权限','func',10),(132,'comment','点评回复权限','func',11),(133,'comment','点评免审核权限','func',12),(134,'comment','点评图片上传权限','func',4),(139,'comment','点评版主权限(推荐/删除)','banzhu',9),(181,'product','会员产品发布权限','func',6),(182,'product','会员产品修改权限','func',7),(183,'product','会员产品发布/修改免审核权限','func',8),(184,'product','会员产品介绍编辑器图片上传权限','func',9),(186,'product','会员产品公共分类发布授权','class',11),(187,'product','会员产品自定义分类权限','func',9),(189,'product','产品版主管理权限(推荐/删除)','banzhu',9),(151,'photo','图片发布权限','func',6),(152,'photo','图片修改权限','func',7),(153,'photo','图片发布/修改免审核权限','func',8),(156,'photo','图片公共分类投稿授权','class',11),(157,'photo','图片自定义分类权限','func',9),(159,'photo','图片版主权限(推荐/删除)','banzhu',9),(161,'down','下载发布权限','func',1),(162,'down','下载修改权限','func',2),(163,'down','下载发布/修改免审核权限','func',3),(164,'down','编辑器图片上传权限','func',5),(166,'down','下载公共分类投稿授权','class',11),(167,'down','下载自定义分类权限','func',9),(169,'down','下载版主权限(推荐/删除)','banzhu',9);
/*!40000 ALTER TABLE `pwn_member_secure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_type`
--

DROP TABLE IF EXISTS `pwn_member_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_type` (
  `membertypeid` int(6) NOT NULL AUTO_INCREMENT,
  `membertype` varchar(100) DEFAULT NULL,
  `membergroupid` int(3) NOT NULL DEFAULT '0',
  `ifcanreg` int(1) DEFAULT NULL,
  `ifchecked` int(1) DEFAULT NULL,
  `regxy` text,
  `regmail` text,
  `expday` int(8) DEFAULT NULL,
  `startcent` int(20) DEFAULT NULL,
  `endcent` int(20) DEFAULT NULL,
  `menugroupid` int(5) NOT NULL DEFAULT '4',
  PRIMARY KEY (`membertypeid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_type`
--

LOCK TABLES `pwn_member_type` WRITE;
/*!40000 ALTER TABLE `pwn_member_type` DISABLE KEYS */;
INSERT INTO `pwn_member_type` VALUES (26,'免费用户',1,1,1,'会员注册协议\r\n\r\n1.\r\n2.\r\n3.\r\n4.\r\n5.\r\n','{#user#},您好!\r\n\r\n感谢您在本站注册!\r\n\r\n会员名: {#user#}\r\n密码: {#password#}\r\n\r\n网址:http://',0,0,0,4);
/*!40000 ALTER TABLE `pwn_member_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_member_zone`
--

DROP TABLE IF EXISTS `pwn_member_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_member_zone` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) DEFAULT NULL,
  `cat` char(50) DEFAULT NULL,
  `xuhao` int(4) DEFAULT NULL,
  `catpath` char(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_member_zone`
--

LOCK TABLES `pwn_member_zone` WRITE;
/*!40000 ALTER TABLE `pwn_member_zone` DISABLE KEYS */;
INSERT INTO `pwn_member_zone` VALUES (1,0,'北京',1,'0001:'),(2,0,'上海',2,'0002:'),(3,0,'天津',3,'0003:'),(4,0,'重庆',4,'0004:'),(5,0,'浙江',5,'0005:'),(6,0,'江苏',6,'0006:'),(7,0,'广东',7,'0007:'),(8,5,'杭州',1,'0005:0008:'),(9,5,'嘉兴',2,'0005:0009:'),(10,6,'南京',1,'0006:0010:'),(11,6,'苏州',2,'0006:0011:'),(12,7,'广州',1,'0007:0012:'),(13,7,'深圳',2,'0007:0013:'),(21,5,'宁波',3,'0005:0021:'),(26,5,'舟山',8,'0005:0026:'),(25,5,'金华',7,'0005:0025:'),(23,5,'温州',5,'0005:0023:'),(22,5,'湖州',4,'0005:0022:'),(24,5,'台州',6,'0005:0024:');
/*!40000 ALTER TABLE `pwn_member_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_menu`
--

DROP TABLE IF EXISTS `pwn_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_menu` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `groupid` int(6) NOT NULL DEFAULT '1',
  `pid` int(6) NOT NULL DEFAULT '0',
  `menu` varchar(50) NOT NULL DEFAULT '',
  `linktype` int(1) NOT NULL DEFAULT '1',
  `coltype` varchar(30) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL DEFAULT '',
  `ifshow` int(1) NOT NULL DEFAULT '0',
  `xuhao` int(4) NOT NULL DEFAULT '0',
  `target` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_menu`
--

LOCK TABLES `pwn_menu` WRITE;
/*!40000 ALTER TABLE `pwn_menu` DISABLE KEYS */;
INSERT INTO `pwn_menu` VALUES (3,1,0,'产品中心',0,'product','news/class/','http://ssss.com',1,3,'_self'),(80,1,0,'公司简介',1,'','page/html/company.php','http://',1,2,'_self'),(83,1,0,'网站首页',0,'index','','http://',1,1,'_self'),(215,4,0,'会员资料设置',1,'','member/member_account.php','http://',1,1,'_self'),(216,4,215,'登录账号设置',1,'','member/member_account.php','http://',1,1,'_self'),(152,3,0,'FIT网关费率',1,'','gateway.htm','gateway.htm',1,1,'_blank'),(294,4,293,'提交我的问题',1,'','service/service.php','http://',1,1,'_self'),(153,3,0,'FIT手机费率',1,'','mobile.htm','http://',1,2,'_blank'),(155,3,0,'FIT网关使用帮助',1,'','page/fit/nethelp.php','http://',1,4,'_self'),(166,2,0,'会员中心',0,'member','','http://',1,27,'_self'),(218,4,215,'个人资料修改',1,'','member/member_detail.php','http://',1,3,'_self'),(217,4,215,'头像签名设置',1,'','member/member_person.php','http://',1,2,'_self'),(298,2,0,'英文版',0,'index','service/service.php','http://',1,45,'_blank'),(276,1,0,'联系我们',1,'','page/html/contact.php','http://',1,7,'_self'),(219,4,215,'联系信息修改',1,'','member/member_contact.php','http://',1,4,'_self'),(293,4,0,'在线客户服务',1,'','service/service.php','http://',1,44,'_self'),(237,4,235,'站内短信',1,'','member/member_msn.php','http://',1,4,'_self'),(295,4,293,'客服工单查询',1,'','service/feedback.php','http://',1,2,'_self'),(235,4,0,'会员个人专区',1,'','member/member_fav.php','http://',1,2,'_self'),(236,4,235,'我的收藏',1,'','member/member_fav.php','http://',1,1,'_self'),(297,4,235,'我的留言',1,'','member/member_comment.php','http://',1,5,'_self'),(243,4,215,'安全退出登录',1,'','logout.php','http://',1,5,'_self'),(251,2,0,'中文版',0,'index','','http://',1,42,'_self'),(253,3,0,'FIT手机使用帮助',1,'','page/fit/mobilehelp.php','http://',1,3,'_self'),(256,1,0,'解决方案',1,'','page/fit/solution.php','http://',1,4,'_self'),(278,1,0,'行业应用',1,'','news/class/2/ ','http://',1,5,'_self'),(279,1,0,'支持与下载',1,'','down/class/','http://',1,6,'_self'),(281,1,0,'话费充值',2,'','service/index.php?groupid=16','http://www.ahzyc.cn/',1,8,'_blank'),(296,4,293,'历史工单查询',1,'','service/feedbackhis.php','http://',1,3,'_self');
/*!40000 ALTER TABLE `pwn_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_menu_group`
--

DROP TABLE IF EXISTS `pwn_menu_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_menu_group` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_menu_group`
--

LOCK TABLES `pwn_menu_group` WRITE;
/*!40000 ALTER TABLE `pwn_menu_group` DISABLE KEYS */;
INSERT INTO `pwn_menu_group` VALUES (1,'频道导航菜单',1,0),(2,'顶部导航菜单',2,0),(3,'底部导航菜单',3,0),(4,'会员功能菜单',4,0);
/*!40000 ALTER TABLE `pwn_menu_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_cat`
--

DROP TABLE IF EXISTS `pwn_news_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  `nums` int(20) NOT NULL DEFAULT '0',
  `tj` int(1) NOT NULL DEFAULT '0',
  `ifchannel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_cat`
--

LOCK TABLES `pwn_news_cat` WRITE;
/*!40000 ALTER TABLE `pwn_news_cat` DISABLE KEYS */;
INSERT INTO `pwn_news_cat` VALUES (1,0,'新闻动态',1,'0001:',36,0,0),(2,0,'行业应用',2,'0002:',5,0,1);
/*!40000 ALTER TABLE `pwn_news_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_con`
--

DROP TABLE IF EXISTS `pwn_news_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_con` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(12) NOT NULL DEFAULT '0',
  `catpath` varchar(255) NOT NULL DEFAULT '',
  `pcatid` int(12) NOT NULL DEFAULT '0',
  `contype` varchar(20) NOT NULL DEFAULT 'news',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext,
  `dtime` int(11) DEFAULT '0',
  `xuhao` int(5) DEFAULT '0',
  `cl` int(20) DEFAULT NULL,
  `tj` int(1) DEFAULT NULL,
  `iffb` int(1) DEFAULT '0',
  `ifbold` int(1) DEFAULT '0',
  `ifred` varchar(20) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `src` varchar(150) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `memberid` varchar(100) DEFAULT NULL,
  `proj` varchar(255) NOT NULL DEFAULT '',
  `secure` int(11) NOT NULL DEFAULT '0',
  `memo` text NOT NULL,
  `prop1` char(255) NOT NULL DEFAULT '',
  `prop2` char(255) NOT NULL DEFAULT '',
  `prop3` char(255) NOT NULL DEFAULT '',
  `prop4` char(255) NOT NULL DEFAULT '',
  `prop5` char(255) NOT NULL DEFAULT '',
  `prop6` char(255) NOT NULL DEFAULT '',
  `prop7` char(255) NOT NULL DEFAULT '',
  `prop8` char(255) NOT NULL DEFAULT '',
  `prop9` char(255) NOT NULL DEFAULT '',
  `prop10` char(255) NOT NULL DEFAULT '',
  `prop11` char(255) NOT NULL DEFAULT '',
  `prop12` char(255) NOT NULL DEFAULT '',
  `prop13` char(255) NOT NULL DEFAULT '',
  `prop14` char(255) NOT NULL DEFAULT '',
  `prop15` char(255) NOT NULL DEFAULT '',
  `prop16` char(255) NOT NULL DEFAULT '',
  `prop17` char(255) NOT NULL DEFAULT '',
  `prop18` char(255) NOT NULL DEFAULT '',
  `prop19` char(255) NOT NULL DEFAULT '',
  `prop20` char(255) NOT NULL DEFAULT '',
  `fileurl` varchar(100) NOT NULL,
  `tourl` varchar(255) NOT NULL,
  `downcount` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL,
  `zhichi` int(5) NOT NULL DEFAULT '0',
  `fandui` int(5) NOT NULL DEFAULT '0',
  `tplog` text NOT NULL,
  `downcentid` int(1) NOT NULL DEFAULT '1',
  `downcent` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_con`
--

LOCK TABLES `pwn_news_con` WRITE;
/*!40000 ALTER TABLE `pwn_news_con` DISABLE KEYS */;
INSERT INTO `pwn_news_con` VALUES (304,1,'0001:',0,'news','第四代国际海事卫星北京关口站交付运行','<div>　　12月4日上午，中国交通通信信息中心（北京船舶通信导航公司）在北京国际移动卫星地面站举办第四代国际海事卫星北京关口站交付运行活动。出席当天活动的有中国航海学会刘功臣常务副理事长、国际移动卫星公司董事长安德鲁•萨卡瓦迪先生、丹麦考本公司总裁Mr. Richard Tyson、爱立信全球副总裁Mr.Olle Isaksson、北京航空航天大学副校长郑志明、北京理工大学校长助理李燕月等嘉宾，政府、军队、企业等方面的嘉宾，以及参与工程建设的谘询、规划、设计等单位。</div>\r\n<div>　　第四代国际海事卫星北京关口站正式交付运行，意味著我国领土、领空、领海范围内的所有海事卫星通讯，200海裡专属经济区内的中国用户海事卫星通讯，都将通过北京关口站进行落地接续，可有效提高我国海上遇险救助及交通安全应急通讯保障水平。</div>\r\n<div>　　北京关口站是第四代海事卫星的全球第三个主用地面关口站，是国际移动卫星公司第四代海事卫星业务全球网络的重要组成部分。在这之前，我国第四代海事卫星通讯需通过美国夏威夷关口站进行转接，所以北京关口站交付运行对维护我国通讯主权和国家安全，满足国家海上遇险安全通讯、安全应急保障等领域的应用需求，具有重要意义。</div>\r\n<div>　　海事卫星业务经过30馀年发展，现已升级到符合3G标准的第四代系统，全面兼容WCDMA 3G标准，标志著移动卫星通讯进入了3G时代，并且通过空间卫星、地面关口站和陆地光纤网构建了一张全球网，不存在陆地3G网络中常见的漫游问题，是真正意义上的全球覆盖的宽带、泛在3G通讯网。</div>\r\n<div>　　在此次交付运行上，中国交通通信信息中心还与国际移动卫星公司、中国国际航空公司、中国联合网络通信有限公司、北京航空航天大学、北京理工大学等五家单位签署了战略合作协议，进一步拓展海事卫星的应用范围和服务领域。</div>\r\n<div>中国交通通信信息中心将在交通运输部的正确领导下，以强烈的责任感和使命感，努力做好北京关口站的运行管理，使海事卫星通信技术更好地服务于交通运输和各行各业。我们将进一步深化改革，加强体制、机制创新，锐意进取，积极探索事业发展新模式，努力把地面站建成交通运输行业信息化基地、国家移动卫星产业创新基地，为现代交通运输业、国家卫星通讯产业发展做出更大贡献。</div>\r\n<div style=\"TEXT-ALIGN: center\"><img alt=\"\" src=\"../../news/pics/20140321/201403211395368469062.jpg\" border=0 /></div>\r\n<div style=\"TEXT-ALIGN: center\"><br /></div>\r\n<div style=\"TEXT-ALIGN: center\"><img alt=\"\" src=\"../../news/pics/20140321/201403211395368475069.jpg\" border=0 /></div>\r\n<div><br /></div>',1386123675,0,0,0,1,0,'0','gif','',1395368495,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(305,1,'0001:',0,'news','海事卫星全力保障“雪龙”号自救','<p>　　我国南极科考船“雪龙”号在成功营救南极遇险的俄罗斯籍“绍利卡斯基院士”号客船上的52名乘客后，准备撤离浮冰区继续执行考察任务的时，所在地区受强大气旋影响，浮冰范围迅速扩大，造成了“雪龙”号船及船上101名人员被困。 “雪龙”号受阻后，中共中央、国务院高度重视，有关部门正按照中央领导同志重要指示，採取措施，全力组织“雪龙”号船舶的救援脱困工作。<br />　　“雪龙”号装配了最先进的海事卫星宽频通讯系统，“雪龙”号周边海况，气象资料，对“雪龙”号状况影响等信息，以及国家级电视台等多家媒体对救援全程进行的直播等信息交互都通过海事卫星进行，中国交通通信信息中心对此次救援行动及电视直播进行了全程通讯保障支持。<br />　　截至目前,已经支持海洋局及中央电视台视频连线4天，共计19次。包括视频连线“雪龙”号领队及船长、直升机工作组专场、海洋气场专场、科学家专场；视频分别来自“雪龙”号驾驶室、会议室、气象室及舱外数个监控图像并在视频间隙协助收发“雪龙”图片和视频资料。此次除央视视频连线外，分别进行了两次视频会商及多次局内视频会议，海事卫星宽频通讯系统在本次救援和直播报导中发挥了关键作用。</p>\r\n<p align=center><img alt=\"\" src=\"[ROOTPATH]news/pics/20140321/201403211395368610687.jpg\" border=0 /></p>\r\n<p align=left>　　中国交通通信信息中心建设并运维国际海事卫星四代星全球第三个主用关口站-北京关口站，具有覆盖全球船舶、飞机、陆地应急的宽频通讯支持保障能力，拥有一支训练有素的专业技术团队，在历次重大国际、国内应急救援中都发挥了不可替代的关键作用。</p>',1388975011,0,1,0,1,0,'0','gif','',1395368655,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(306,1,'0001:',0,'news','交通应急宽频SAT保障央视300米饱和深潜直播','　　饱和潜水是一种适用于大深度条件下，开展长期作业的潜水方式。上海打捞局深潜号将于2013年1月9日至13日于距离海岸150海里处开展300米饱和深潜任务，中央电视台将对关键作业环节予以现场直播。时间紧任务重，在1月4日接到任务即派专业工程师前往深潜号与各方对实施利用VSAT卫星传输方式进行可行性论证，于1月6日进行设备准备，并于7日登船进行保障工作前的系统调试。<br />　　1月7日晚至9日凌晨，登船现场工程师与后方系统支持工程师连续奋战近60个小时，不眠不休，克服了船舶设备锁死、系统单一私有化工作的困难，打通了从深潜号船舶到交通应急宽频VSAT北京中心站的链路，完成了央视直播前的准备工作，获得了央视技术部主任、节目製作人的认可。<br />　　此次保障准备工作中，中国交通通信中心的同志连续奋战、废寝忘食工作态度，体现出了应急通信保障工作的专业水准，并形成了未来海洋工程作业、任务直播的保障工作模式。',1389320744,0,1,0,1,0,'0','gif','',1389320744,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(307,1,'0001:',0,'news','海事卫星Fleet（33/55/77）通讯资费调整通知','<p>尊敬的客户：<br />　　近期受到​​Inmarsat通知，鑑于第四代卫星性能优越，通讯性价比高，容量充裕，是当前主流卫星，同时为加快三代星（用户）向四代星FB业务（用户）的迁移，Inmarsat决定于2014年1月1日起，上调Fleet（33/55/77）卫星通讯业务资费。为此，北京船舶通信导航公司将同步调整相关的通讯收费标准，具体资费请谘询市场经理或客服中心。<br />新资费于2014年1月1号00：00（国际标准时间）生效，原Fleet价格同时废止。<br />第四代海事宽带卫星FB功能强大，资费适宜。为答谢长期客户的支持，我司在今年12月1日至明年2月28日期间，免收FB入网费（价值￥500）。此外还有相应的设备优惠活动。有需要採购FB设备或开通FB业务的用户，请直接联繫我司客户经理，或谘询客服中心，联繫电话：00861065293800。</p>\r\n<p align=right>北京船舶通信导航公司</p>',1384828229,0,0,0,1,0,'0','gif','',1384828229,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(308,1,'0001:',0,'news','关于MCN客户服务中心邮箱系统升级的通知','<p>尊敬的用户：<br />　　为了提升邮箱服务性能，北京船舶通信导航公司计划于北京时间2013年12月19日星期四21：00-23：00对客服邮箱（<a href=\"mailto:cs@bjles.cn,kefu@bjles.cn\">cs@bjles.cn,kefu@bjles.cn</a>）进行系统升级,届时邮件收发功能将中断，在此期间如有业务需求请直接发送传真至01065293801，或拨打24小时客户服务热线01065293800.<br />　　由此带来不便敬请谅解！</p>\r\n<p align=right>北京船舶通信导航公司</p>',1387420345,0,0,0,1,0,'0','gif','',1387420345,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(309,1,'0001:',0,'news','Thrane&amp;Thrane公司发布最新版本终端软件V1.19','<p>尊敬的用户：</p>\r\n<p>　　Thrane&amp;Thrane公司发布了最新版本的终端软件V1.19，该版本适用于海用FB系列的Sailor500、Sailor250、Sailor150终端，以及车载Explorer727和Explorer325终端。详情和​​软件请导航至软件下载页面，下载[固件升级][版本1.19][TT系列][海用FB&amp;陆用BGAN][宽带终端及手柄]，本次版本升级将使终端能够支持国家关口站特性，解决网络用户组不能用的问题。</p>\r\n<p align=right><br />　　　北京船舶通信导航公司</p>',1393382074,0,6,0,1,0,'0','gif','',1393382074,'管理员','','0','',0,'','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(310,2,'0002:',0,'news','原油和矿业','<p><strong>移动卫星通讯将协助您勘探新的採集点<br /></strong>　　MCN卫星通讯解决方案提供语音和宽频数据服务，保证您至关重要的商务信息沟通，同时保障工人安全，提高採集点现场的工作效率，并减少採油和採矿所花费的时间。 <br />　　无论您的工作团队身在何处——钻井平台、採油塔、矿场或是其他与世隔绝的勘探地点，MCN总有一种卫星通讯解决方案满足您的需求。 <br /><strong>为什麽选择MCN？<br /></strong>　　卫星直连：直接发送勘探数据、管道报告、油井诊断结论、现场图片等到公司总部供分析研究。 <br />　　高效：提高勘探效率，实现对偏远地区设备和管道的远程监控。<br />　　易于携带：设备轻便易用，便于随身携带。 <br />　　安全：无论您的工作队伍在哪——钻井平台、採油塔、矿场还是其他与世隔绝的勘探地点，您都可以和他们联繫，确保安全。</p>\r\n<p><strong>最佳产品</strong></p>\r\n<p>FleetBroadband<br />　　船载用户终端，安装于船舶/舰艇/海上钻井平台上，工作在Inmarsat第四代卫星网络下，提供全球范围的海上宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如话音、短讯、文件传输、传真、视像会议等。最高支持432kbps共享数据频宽和256kbps独享数据频宽。<br />IsatPhone Pro<br />　　新一代全球卫星手提电话，通过Inmarsat第四代卫星网络实现全球覆盖，提供话音、短讯和低速数据(2.4kbps)通讯。<br />BGAN<br />　　便携和车载用户终端，人员随身携带或安装于车辆上，工作在Inmarsat第四代卫星网络下，实现在全球范围内宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如话音、短讯、文件传输、传真、视像会议等。支持最高432kbps共享数据频宽和384kbps独享数据频宽。</p>\r\n<p><strong>最佳方案</strong></p>\r\n<p>870卡<br />一号通<br />BGAN-GIS<br />访问控制<br />网络互联<br />IP地址规划<br />流量预警</p>',1395370634,0,1,0,1,0,'0','gif','news/pics/20140321/1395370634.jpg',1395370647,'管理员','','0','',0,'MCN卫星通讯解决方案可以为您建立到偏远採集点的通讯连接，从而保证工人的安全、提高採集点的效率，有助减少採掘的费用。','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(311,2,'0002:',0,'news','航运业','<p>　　更好的航运控制，更高效更安全的海上航行<br />　　现时，航运公司会越来越多地需要卫星通讯系统来保证船务航运更高效、商业沟通更便捷，同时也方便长期在海上的船员与家人朋友沟通。 MCN提供给您先进的卫星通讯增值解决方案。<br /><strong>为什麽选择MCN？<br /></strong>•&nbsp;&nbsp;&nbsp; 使用我们专门为卫星通讯优化的邮件软件Rydex邮件传输系统，为您节省通讯费用。<br />•&nbsp;&nbsp;&nbsp; 使用我们的船员电话业务，船员可以方便地与亲友联繫，并使公私帐户分开，方便航运公司管理。<br />•&nbsp;&nbsp;&nbsp; 可以传输数码照片和视像等大文件。<br />•&nbsp;&nbsp;&nbsp; 安全地接入公司内网或者互联网。<br />•&nbsp;&nbsp;&nbsp; 确保海上安全（GMDSS）。<br />•&nbsp;&nbsp;&nbsp; 实现远程网络监控来削减成本。</p>\r\n<p><strong>最佳产品</strong></p>\r\n<p>精緻、高效和可靠的产品<br />　　可靠性、可用性以及性价比是航运业对卫星通讯提出的三个关键要求。 MCN为您提供Inmarsat海用全系列产品。<br /><font color=#ff0000>FleetBroadband<br /></font>　　在Inmarsat第四代卫星网络下运作，实现海上通讯技术的宽频化，提供宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如打电话，收发短讯、语音信箱、文件传输、传真、视像会议。支持最高432kbps共享数据频宽和256kbps独享数据频宽。<br /><font color=#ff0000>Fleet77/55/33<br /></font>　　提供话音、传真，最高速率达128KBPS的ISDN和包交换数据MPDS服务，F77具有GMDSS和全球海事遇险呼叫功能。<br /><font color=#ff0000>Inmarsat-C &amp; Mini-C<br /></font>　　提供GMDSS全球遇险报警功能，实现全球范围的位置报告，随时响应询呼请求。提供包括电子邮件、电传、X.25、手机短讯、传真、数据文件等Inmarsat-C之间、船岸之间的双向数据通讯。<br /><font color=#ff0000>IsatPhone Pro<br /></font>　新一代全球卫星手提电话，通过Inmarsat第四代卫星网络实现全球覆盖，提供话音、短讯和低速数据（2.4kbps）通讯。</p>\r\n<p><strong>最佳方案</strong></p>\r\n<p>　MCN整合了卫星通讯服务，为海上用户提供了多种通讯解决方案，以满足海上用户各种特色通讯需求。<br /><font color=#ff0000>Rydex<br /></font>　　提供安全、可靠的船岸电子邮件传输服务。邮件收发高效数据压缩和断点续传，并为船岸信息化管理提供高效自动化的数据传输接口。<br /><font color=#ff0000>SMSCrewmail<br /></font>　　船员个人电子邮件系统。船员个人帐号固定，个人邮件通讯完全保密。<br /><font color=#ff0000>CrewCall<br /></font>　　为船员提供可靠、预付费、低价格的个人通讯服务。<br /><font color=#ff0000>870卡<br /></font>　　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>一号通<br /></font>　　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>Rydex eNODE<br /></font>　　创建、传输符合美国海岸警卫队要求的电子表格。<br /><font color=#ff0000>CmailPlus<br /></font>　　基于Inmarsat-C，为用户打造的一个船岸双向信息交互系统。<br /><font color=#ff0000>Ctrack ™ Marine<br /></font>　　全球卫星船舶监控与指挥管理系统。集成国际海事卫星(Inmarsat) C / MiniC 通讯系统、全球卫星定位系统（GPS）、地理资讯系统（GIS）、管理资讯系统（MIS）的综合应用系统，在全球范围内实现高效船舶监控和指挥管理。<br />BGAN-GIS<br />访问控制<br />网络互联<br />IP地址规划<br />“流量预警”</p>',1395370974,0,0,0,1,0,'0','gif','news/pics/20140321/1395370974.jpg',1395370974,'管理员','','0','',0,'先进的MCN卫星通讯解决方案使航运公司船务航运更高效、商业沟通更便捷，同时也方便长期在海上的船员与家人朋友沟通联繫，亲情友情就在眼前。','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(312,2,'0002:',0,'news','捕鱼业','<p>　　渔船需要可靠稳定的卫星通讯用于安全航行及与其他渔船、公司总部、渔业代理商联繫。无论您是拥有一艘近海捕捞的小艇，还是拥有一支远洋捕捞的拖网渔船船队，MCN都能提供给您一套适合您的卫星通讯解决方案：你可以谘询并分享重要的渔业信息，包括电子海图、水流水温、电子航海日志、捕捞报告、天气信息以及船舶位置等。<br /><strong>为什麽选择MCN？<br /></strong>　　随时随地与您的公司和家人保持联繫。<br />　　即使在海上也可以发送和接收电子邮件和传真。<br />　　直接给您的渔业公司发送捕捞报告和照片。<br />　　下载最新的天气预报、水流水温地图。<br />　　发送您的船舶位置到船舶监控中心。</p>\r\n<p><strong>最佳产品</strong></p>\r\n<p>选择最适合您的系统<br />　　我们的产品安全、可靠、易于使用且性价比高。<br /><font color=#ff0000>FleetBroadband<br /></font>　　在Inmarsat第四代卫星网络下运作，实现海上通讯技术的宽频化，提供宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如打电话，收发短讯、语音信箱、文件传输、传真、视像会议。支持最高432kbps共享数据频宽和256kbps独享数据频宽。<br /><font color=#ff0000>Fleet77/55/33<br /></font>　　F77能提供话音、传真、最高速率达128KBPS的ISDN和包交换数据MPDS服务，并具有GMDSS和全球海事遇险呼叫功能。<br /><font color=#ff0000>Inmarsat-C &amp; Mini-C<br /></font>　　提供GMDSS全球遇险报警功能，实现全球范围的位置报告，随时响应询呼请求。提供包括电子邮件、电传、X.25、手机短讯、传真、数据文件等Inmarsat-C之间、船岸之间的双向数据通讯。<br /><font color=#ff0000>IsatPhone Pro<br /></font>　　新一代全球卫星手提电话，通过Inmarsat第四代卫星网络实现全球覆盖，提供话音、短讯和低速数据（2.4kbps）通讯。</p>\r\n<p><strong>最佳方案</strong></p>\r\n<p>MCN整合了卫星通讯服务，为海上用户提供了多种通讯解决方案，以满足海上用户各种特色通讯需求。<br /><font color=#ff0000>Rydex<br /></font>　　提供安全、可靠的船岸电子邮件传输服务。邮件收发高效数据压缩和断点续传，并为船岸信息化管理提供高效自动化的数据传输接口。<br /><font color=#ff0000>SMSCrewmail<br /></font>　　船员个人电子邮件系统。船员个人帐号固定，个人邮件通讯完全保密。<br /><font color=#ff0000>CrewCall<br /></font>　　为船员提供可靠、预付费、低价格的个人通讯服务。<br /><font color=#ff0000>870卡<br /></font>　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>一号通<br /></font>　　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>Rydex eNODE<br /></font>　　创建、传输符合美国海岸警卫队要求的电子表格。<br /><font color=#ff0000>CmailPlus<br /></font>　　基于Inmarsat-C，为用户打造的一个船岸双向信息交互系统。<br /><font color=#ff0000>Ctrack ™ Marine<br /></font>　全球卫星船舶监控与指挥管理系统。集成国际海事卫星(INMARSAT) C/MiniC 通讯系统、全球卫星定位系统（GPS）、地理资讯系统（GIS）、管理资讯系统（MIS）的综合应用系统，在全球范围内实现高效船舶监控和指挥管理。<br />BGAN-GIS<br />访问控制<br />网络互联<br />IP地址规划<br />“流量预警”</p>',1395371393,0,0,0,1,0,'0','gif','news/pics/20140321/1395371393.jpg',1395371393,'管理员','','0','',0,'值得信赖的MCN卫星通讯解决方案让您的渔船即使在海上，也可与其他渔船、公司总部、渔业代理商保持联繫，并及时获取天气等航海资讯，保证航行安全。','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(313,2,'0002:',0,'news','游艇业','<p>离家很远，离家人很近<br />　　无论您的游艇游弋在哪裡，您都可以通过MCN卫星通讯解决方案提供的语音、电子邮件、互联网接入和传真与商业伙伴、家人和朋友保持联繫。 MCN解决方案会提高您在船上的安全性和舒适性，同时使您可以通过卫星通讯在第一时间内分享您的快乐。<br /><strong>为什麽选择MCN？<br /></strong>·&nbsp;&nbsp; 7×24小时与您的商务伙伴保持联繫。<br />·&nbsp;&nbsp; 通过话音、电子邮件、短讯以及传真与您的家人保持联络。<br />·&nbsp;&nbsp; 让您如同在家裡一样享受网上冲浪。<br />·&nbsp;&nbsp; 确保船隻安全（符合GMDSS）。<br />·&nbsp;&nbsp; 下载最新的实时天气以及海图资讯。<br />·&nbsp;&nbsp; 在您到达港口之前订购补给，或者在第一时间把您捕捉到的美景图片发送出去。</p>\r\n<p><strong>最佳产品</strong></p>\r\n<p>　　无论您是拥有一艘超级游艇，还是一个小游乐船，MCN都能提供给您安全可靠的卫星通讯方案，让您在海上游乐的同时也可以保持和商务伙伴、家人、朋友的沟通。<br /><font color=#ff0000>FleetBroadband<br /></font>　　在Inmarsat第四代卫星网络下运作，实现海上通讯技术的宽频化，提供宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如打电话，收发短讯、语音信箱、文件传输、传真、视像会议。支持最高432kbps共享数据频宽和256kbps独享数据频宽。<br /><font color=#ff0000>Fleet77/55/33<br /></font>　　提供话音、传真，最高速率达128KBPS的ISDN和包交换数据MPDS服务，F77具有GMDSS和全球海事遇险呼叫功能。<br /><font color=#ff0000>Inmarsat-C &amp; Mini-C<br /></font>　　提供GMDSS全球遇险报警功能，实现全球范围的位置报告，随时响应询呼请求。提供包括电子邮件、电传、X.25、手机短讯、传真、数据文件等Inmarsat-C之间、船岸之间的双向数据通讯。<br /><font color=#ff0000>IsatPhone Pro<br /></font>　　新一代全球卫星手提电话，通过Inmarsat第四代卫星网络实现全球覆盖，提供话音、短讯和低速数据（2.4kbps）通讯。</p>\r\n<p><strong>最佳方案</strong></p>\r\n<p>MCN整合了卫星通讯服务，为海上用户提供了多种通讯解决方案，以满足海上用户各种特色通讯需求。<br /><font color=#ff0000>Rydex<br /></font>　　提供安全、可靠的船岸电子邮件传输服务。邮件收发高效数据压缩和断点续传，并为船岸信息化管理提供高效自动化的数据传输接口。<br /><font color=#ff0000>SMSCrewmail<br /></font>　　船员个人电子邮件系统。船员个人帐号固定，个人邮件通讯完全保密。<br /><font color=#ff0000>CrewCall<br /></font>　　为船员提供可靠、预付费、低价格的个人通讯服务。<br /><font color=#ff0000>870卡<br /></font>　　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>一号通<br /></font>　　提供岸到船话音服务，安全、低价。<br /><font color=#ff0000>Rydex eNODE<br /></font>　　创建、传输符合美国海岸警卫队要求的电子表格。<br /><font color=#ff0000>CmailPlus<br /></font>　　基于Inmarsat-C，为用户打造的一个船岸双向信息交互系统。<br /><font color=#ff0000>Ctrack ™ Marine<br /></font>　　全球卫星船舶监控与指挥管理系统。汇集国际海事卫星(INMARSAT) C/​​MiniC 通讯系统、全球卫星定位系统（GPS）、地理资讯系统（GIS）、管理资讯系统（MIS）的综合应用系统，在全球范围内实现高效船舶监控和指挥管理。<br />BGAN-GIS<br />访问控制<br />网络互联<br />IP地址规划<br />“流量预警”<br />&nbsp;</p>',1395371590,0,0,0,1,0,'0','gif','news/pics/20140321/1395371590.jpg',1395371590,'管理员','','0','',0,'MCN卫星通讯解决方案提供话音、电子邮件、互联网和传真等多种通讯方式，让您即使在海上游乐时，也可与您的商业伙伴、家庭和朋友保持联繫，在第一时间内分享您的快乐。','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0),(314,2,'0002:',0,'news','政府和国防','<p>移动卫星通讯使军队战场反应更迅速，战场感知更全面<br />　　任何兵种的军队，都迫切需要一种无论身在何处都能迅速建立、可靠的通讯方式。您能依靠MCN卫星通讯解决方案更高效的给您行动中的军队下达命令，并能在保证通讯安全的前提下与全球任何地点的其他队友分享战术情报。<br />为什麽选择MCN？<br />·　 快速部署：独立于陆地网络之外，即使在荒无人烟之地也可以快速建立起对反应时间要求严格的通讯链路。 <br />·　 机动性：设备重量轻、展开快、坚固耐用，便于您在行动中携带。<br />·　 多兵种协同作战：全球性通讯解决方案可以使陆地、海上、空中协同作战，最大化保证海陆空信息畅通，确保任务成功完成。<br />·　 获取战场形势分析：在总部指挥中心与行动部队之间建立持续的信息交流，有利于部队高效部署与快速反应。<br />·　 信息安全保证：卫星通讯网络为数据和语音提供高度安全性。在应用层，还同时支持电路交换和IP包交换加密设备。<br />·　 专线连接：通过专线连接，我们可以提供卫星信号北京落地后直接连接到政府、军队的“最后一公里”解决方案。</p>\r\n<p><strong>最佳产品</strong></p>\r\n<p><font color=#ff0000>FleetBroadband<br /></font>　　船载用户终端，安装于船舶/舰艇上，在Inmarsat第四代卫星网络下运作，提供全球范围的海上宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如话音、短讯、文件传输、传真、视像会议等。最高支持432kbps共享数据频宽和256kbps独享数据频宽。<br /><font color=#ff0000>IsatPhone Pro<br /></font>　　新一代全球卫星手提电话，通过Inmarsat第四代卫星网络实现全球覆盖，提供话音、短讯和低速数据（2.4kbps）通讯。<br /><font color=#ff0000>BGAN<br /></font>　　便携和车载用户终端，人员随身携带或安装于车辆上工作，在Inmarsat第四代卫星网络下，实现在全球范围内宽频数据和语音同时在线功能。一部终端即可满足多种信息通讯需求，如话音、短讯、文件传输、传真、视像会议等。支持最高432kbps共享数据频宽和384kbps独享数据频宽。<br />SB<br />　　机载用户终端，安装于飞机上，工作在Inmarsat第四代卫星网络下，提供全球范围的空中宽频数据和语音同时在线功能。最高支持432kbps共享数据频宽和224kbps独享数据频宽，支持捆绑操作，获得更高数据频宽。</p>\r\n<p><strong>最佳方案</strong></p>\r\n<p>“870卡”<br />“一号通”<br />BGAN-GIS<br />访问控制<br />网络互联<br />IP地址规划<br />“流量预警”</p>',1395371882,0,10,0,1,0,'0','gif','news/pics/20140321/1395371882.jpg',1395371882,'管理员','','0','',0,'安全、可靠、便捷的MCN卫星通讯解决方案提供紧急时刻的高质素通讯，可以使军队随时随地与指挥中心保持联繫，在现场作出快速反应。','','','','','','','','','','','','','','','','','','','','','http://','http://',0,'',0,0,'',1,0);
/*!40000 ALTER TABLE `pwn_news_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_config`
--

DROP TABLE IF EXISTS `pwn_news_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_config`
--

LOCK TABLES `pwn_news_config` WRITE;
/*!40000 ALTER TABLE `pwn_news_config` DISABLE KEYS */;
INSERT INTO `pwn_news_config` VALUES (5,'文章主题图片上传尺寸限制(Byte)','input','30','PicSizeLimit','256000','会员发布文章上传主题图片时,单个图片尺寸的限制'),(6,'文章编辑器图片上传限制(Byte)','input','30','EditPicLimit','512000','会员发布文章时,在编辑器内上传图片,单个图片的尺寸限制'),(1,'模块频道名称','input','30','ChannelName','新闻动态','本模块对应的频道名称，如“新闻中心”；用于显示在网页标题、当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','0','是否在当前位置提示条显示模块频道名称'),(7,'附件上传大小限制','input','30','FileSizeLimit','1024000','会员发布文章上传附件时,允许上传附件的文件大小;但最高设置不能超过2M '),(8,'会员发布文章关键词过滤','textarea','30','KeywordDeny','法轮功,麻醉,兴奋剂','会员发布文章时禁止的词语，多个以逗号分割'),(8,'允许发布文章的域名','input','30','AllowPostUrl','','设置允许发布文章的域名，可防止模拟会员登录的群发器。一般填写自己网站的域名，如test.com，不要带www；如不填，则不限制。');
/*!40000 ALTER TABLE `pwn_news_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_downlog`
--

DROP TABLE IF EXISTS `pwn_news_downlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_downlog` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `newsid` int(12) NOT NULL DEFAULT '0',
  `memberid` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_downlog`
--

LOCK TABLES `pwn_news_downlog` WRITE;
/*!40000 ALTER TABLE `pwn_news_downlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_news_downlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_pages`
--

DROP TABLE IF EXISTS `pwn_news_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_pages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `newsid` int(12) NOT NULL DEFAULT '0',
  `body` mediumtext,
  `xuhao` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_pages`
--

LOCK TABLES `pwn_news_pages` WRITE;
/*!40000 ALTER TABLE `pwn_news_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_news_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_pcat`
--

DROP TABLE IF EXISTS `pwn_news_pcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_pcat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_pcat`
--

LOCK TABLES `pwn_news_pcat` WRITE;
/*!40000 ALTER TABLE `pwn_news_pcat` DISABLE KEYS */;
INSERT INTO `pwn_news_pcat` VALUES (2,150,0,'新增分类',1,'');
/*!40000 ALTER TABLE `pwn_news_pcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_proj`
--

DROP TABLE IF EXISTS `pwn_news_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_proj` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `folder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_proj`
--

LOCK TABLES `pwn_news_proj` WRITE;
/*!40000 ALTER TABLE `pwn_news_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_news_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_news_prop`
--

DROP TABLE IF EXISTS `pwn_news_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_news_prop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catid` int(20) NOT NULL DEFAULT '0',
  `propname` char(30) DEFAULT NULL,
  `xuhao` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xuhao` (`xuhao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_news_prop`
--

LOCK TABLES `pwn_news_prop` WRITE;
/*!40000 ALTER TABLE `pwn_news_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_news_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_page`
--

DROP TABLE IF EXISTS `pwn_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_page` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `groupid` int(6) NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `xuhao` int(4) NOT NULL DEFAULT '0',
  `src` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `memo` text NOT NULL,
  `pagefolder` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_page`
--

LOCK TABLES `pwn_page` WRITE;
/*!40000 ALTER TABLE `pwn_page` DISABLE KEYS */;
INSERT INTO `pwn_page` VALUES (1,1,'公司简介','<div align=center><img alt=\"\" src=\"[ROOTPATH]page/pics/20140321/201403211395373472093.jpg\" border=0 /></div>\r\n<p>　　中国交通通信信息中心（<a href=\"http://www.cttic.cn\">http://www.cttic.cn</a>&nbsp; Transport Telecommunications &amp; Information Center ，英文缩写CTTIC，以下简称通信信息中心），作爲中华人民共和国交通运输部直属事业单位，受交通运输部委托拟订并组织实施交通运输行业通信、导航、无线电和信息化管理的技术政策、技术标淮、规章制度；代交通运输部行使交通运输部无线电行政许可和行政审批职责；承担行业信息化网络的建设、运维、整合、保障等工作；代表国家参与国际电信联盟（ITU）、国际海事组织（IMO）的有关活动，负责中国国际海事卫星、中国搜救卫星系统的建设、运维和管理工作，并承担国内外相关应急安全公益性通信职责；承担行业及国家、社会经济发展需要的通信、导航、无线电和信息化的技术研发、应用和咨询等工作；承担中国民用卫星导航系统的相关工作。<br />&nbsp;<br />　　中国交通通信信息中心以北京船舶通信导航公司名义（<a href=\"http://www.bjmcn.com\">http://www.bjmcn.com</a>&nbsp; Beijing Marine Communication &amp; Navigation&nbsp; Company，英文缩写MCN）对外运营,北京船舶通信导航公司（BJMCN）隶属于中华人民共和国交通运输部中国交通通信信息中心（CTTIC）。1979年经由国务院批淮成立,中交通信（香港）有限公司（China Cttic hk Co Ltd），于2011年由中华人民共和国交通运输部批淮成立，爲中国交通通信信息中心北京船舶通信导航公司全资子公司，2011年11月26日上午，中国交通通信信息中心北京船舶通信导航公司在香港举行了所属中交通信（香港）有限公司成立揭牌仪式。中华人民共和国交通运输部徐祖远副部长、水运科学研究院张宝晨院长、交通运输部水运局李宏印副局长、公司丘建华书记出席揭牌仪式，公司殷林副主任主持揭牌仪式。中远集团、中海集团、招商集团、中外运集团、中国船级社等在港中资机构领导，凤凰卫视、TVB、亚视、香港有线、NowTV、中新社（香港分社）等多家香港媒体及众多海上、陆地业务应用单位参加了揭牌仪式。</p>\r\n<p>　　徐祖远副部长爲中交通信（香港）有限公司揭牌(相关新闻)，对公司的成立表示了祝贺，提出三点希望：一是要求新公司尽快熟悉并严格遵守香港的法律体系和市场规则；二是要求新公司加强管理，既要积极走出去，还要稳健走进去，更要成功的走回来；三是希望在港中资交通企业加强协作配合，支持新公司成长发展并诚信经营、共赢市场。还爲新公司题字“联通全球，誉满天下”，寄予了殷切希望。</p>\r\n<p>　　中交通信（香港）有限公司的成立(<a href=\"http://www.cttic.hk\">http://www.cttic.hk</a>) ，标志著北京船舶通信导航公司向国际化方向发展迈出了实质性的步伐。将通过服务窗口向海外前移、服务本地化，实现服务的方便与快捷，实现与国际业务需求接轨，将北京船舶通信导航公司网络资源优势、技术进步积累和优质服务能力，转化爲支撑业务全球化发展所需要的海外信息通信保障基地。中交通信（香港）有限公司的成立，将促进北京船舶通信导航公司进一步开放视野，加快吸收国际先进应用産品与自身技术体系的融合，推进技术进步，加快国际化发展战略的实施。 (相关新闻)</p>\r\n<p>&nbsp;</p>',1,'','','','company'),(2,1,'联系我们','<p>地址：安徽省宣城市锦城北路丽晶国际中心A1604<br />电话：0086-563-2825976<br />传真：0086-563-2824976<br />邮箱：zhongyutx2012@yahoo.cn</p>\r\n<p align=center><iframe style=\"WIDTH: 652px; HEIGHT: 472px\" src=\"{#RP#}tools/templates/map.htm\" frameBorder=0 scrolling=no></iframe></p>',10,'','','','contact'),(13,2,'FIT手机使用帮助','<div><b>FIT天地通手机使用说明：</b></div><div><br /></div><div>　　1、 FIT天地通智能手机通讯软件（下称FIT天地通）是由中国交通通信开发的以拔打海事卫星电话爲核心,并可拔打全球国际电话的通信软件,植入由中国交通通信授权的指定机型中使用。本软件根据指定机型进行特定开发,非指定机型下使用会引起某些功能无法正常使用。购买时请认定中国交通通信及其授权的经销商。</div><div><br /></div><div>　　2、首次使用，必须把您的手机号码注册到FIT天地通系统中,启动软件时会有注册提示,您只需按提示步骤操作即可完成注册。本FIT天地通智能手机软件目前只适用于中国大陆的手机号码,如果你需要在国外使用,可以选择FIT天地通网关,具体介绍请参阅官方网站www.fit-inmarsat.com 。&nbsp;</div><div><br /></div><div>　　3、完成注册后,您必须进行充值后才能开始使用,充值可在FIT天地通软件的“购卡”栏目中进行,按提示步骤进行操作即可,也可以直接向中国交通通信及其授权的经销商处购买“FIT天地通充值卡”,然后在“充值”栏目进行充值。</div><div style=\"text-align: center;\"><img src=\"../../page/pics/20140320/201403201395307368032.jpg\" border=\"0\" alt=\"\" /></div><div><br /></div><div><b>FIT天地通的拔号规则：</b></div><div><br /></div><div>　　1、FIT天地通是面向全球的通信软件， 拔号规则采用标淮的国际长途直拔规则， 方法是国家区号+电话号码， 下面举两个例子作为说明：</div><div><br /></div><div>　　例1： 如果您要拔打中国的手机号码 ： 13988889999， 使用天地通拔号的规则为： 13988889999， 如果您要拔打中国北京的固定电话 01066667777，使用天地通拔号的规则为01066667777，拔打深圳号码为0755+电话号码，拔打规则跟拔打国内固话长途相同。&nbsp;</div><div><br /></div><div>　　例2： 如果您要拔打香港的号码0085295868899， 直接拔打0085295868899 就行， 拔打新加坡号码006586112388，直接拔打006586112388，拔打其他国家的国际长途以此类推， 全部使用国际长途直拔标淮： 拔打手机号码为\"国家区号+手机号码\"， 拔打固话为\"固话的地方区号前面的0用国家区号代替\"。</div><div><br /></div><div><b>FIT天地通使用条件说明：</b></div><div><br /></div><div>　　1、FIT天地通软件是通过互联网跟中国交通通信系统相连的,您使用FIT天地通软件时,您的手机必须能连接上互联网,GPRS、3G或WIFI任何一种都可以胜任。FIT天地通拔打电话对网络的要求极低,所需流量极小,只是在发起呼叫时,向系统提交一个呼叫请求,系统收到呼叫请求后,把主叫和被叫用落地线路连通,从而形成通话,整个通话过程不再需要任何流量（这也是FIT天地通跟传统的网络电话的本质区别之一:通话过程不受网络的影响,从而保证高清晰度的通话质量,理论上跟您家里或办公室的固定电话的通话质量相同）,1M的流量可以完成5000次以上的呼叫,所以您完全不用担心使用FIT天地通造成的流量费用。但需要提醒的是,您用来拔打电话的流量是非常小的,几乎可以忽略不计,而您通过FIT软件进行的浏览“最新消息”、“最新公告”,查询余额,查询费率等,都需要消耗流量,这些流量是被您用来浏览这些网页内容所消耗的,并非是在拔打电话时所用的流量。</div><div style=\"text-align: center;\"><img src=\"../../page/pics/20140320/201403201395307461220.jpg\" border=\"0\" alt=\"\" /></div><div><br /></div><div>　　2、如上所述,FIT天地通的通话过程是通过中国交通通信系统把主叫和被叫相连通而形成,所以您用来使用FIT天地通的手机号码必须是接听免费的,否则,通话过程会令您的手机号码産生接听费用。需要注意的是,目前有些运营商的手机卡在当地使用时接听是免费的,但当您离开本地,处于漫游状态时,接听会産生漫游费用,如果您在这种情况下使用FIT天地通,也会産生除FIT天地通话费之外的漫游费用。强烈建议用户使用那些在全国范围内都是接听免费的手机卡或套餐,这样您在任何时候使用FIT天地通都不用担心会産生FIT天地通话费之外的其他费用了。</div>\r\n\r\n\r\n\r\n',1,'','','','mobilehelp'),(14,2,'FIT网关使用帮助','<div><b>&nbsp;FIT天地通网关（下称F201)使用方法</b></div><div><br /></div><div>　　1、首先确保正确接线,把局域网网线接到FIT装置的LAN口，话机接到LAN口旁边的电话线接口上，您平时使用的电讯电话线接到电源线接口旁边的line口上。</div><div><br /></div><div>　　2、F201採用国际直拨的拨号方式： 国家区号+地区区号+电话号码+#</div><div>　　例如：</div><div>　　拨打中国的手机：13812345678 这样拨打： OO8613812345678#</div><div>　　拨打北京的固网电话：01088123456 这样拨打： OO861088123456#</div><div>　　拨打其他国际长途以此类推</div><div><br /></div><div>　　3、拨打F201内网号码，直接拨打内网号加#即可。例如您要拨打内网号：66888，在话机上拨：66888#。</div><div><br /></div><div>　　4、F201装置设有电讯电话线接口（电源线接口旁边的line口），如果您不想使用F201线路，您可以在拨9后再正常拨号，就会使用您line口上的电讯电话线路。</div><div><br /></div><div>　　5、在line口上接上电讯的电话线后，接在FIT装置上的电话机可以正常接听呼入您的电讯号码的来电，而且如果接在F201上的电源断电，仅仅令您的F201失去功能，您的电讯电话线仍可正常打入打出，完全不受FIT装置断电的影响。</div><div><br /></div><div><b>FIT天地通网关使用固定IP地址的设置方法</b></div><div>&nbsp;</div><div>FIT天地通网关配置固定IP方法如下:</div><div>&nbsp;</div><div>　　首先需要由网络管理员分配一个固定的内网IP, 下面假设分配给FIT天地通网关的固定IP爲: 192.168.1.188, 掩码爲:255.255.255.0, 路由器网关IP爲: 192.168.1.1 (这三个参数:FIT天地通网关IP, 掩码, 路由器网关IP由路由器的管理员分配,若使用者不熟悉,可向路由器管理员索取这三个参数),然后接好FIT天地通网关,在FIT天地通网关的话机上进行如下操作 :</div><div>　　1、进入配置模式 ： 摘机，拔号“ *150*1# ”，听到“设置成功”的语音提示后挂机。(这一步表示爲设置FIT天地通网关进入固定IP地址的配置模式）</div><div>&nbsp;</div><div>　　2、配置IP地址 ：摘机，拔号“ *152*192*168*1*188# ”，听到“设置成功”的语音提示后挂机。（这一步表示设置FIT天地通网关的IP地址爲：192.168.1.188)</div><div>&nbsp;</div><div>　　3、配置掩码 ： 摘机，拔号“ *153*255*255*255*0# ”，听到“设置成功”的语音提示后挂机。（这一步表示设置FIT天地通网关的掩码爲：255.255.255.0)</div><div>&nbsp;</div><div>　　4、配置路由器网关IP ：摘机，拔号“ *156*192*168*1*1# ”， 听到“设置成功”的语音提示后挂机。（这一步表示设置FIT天地通网关所在内网的路由器网关IP地址爲：192.168.1.1)</div><div>&nbsp;</div><div>　　5、完成以上操作后，等待大约10秒，之后关闭FIT天地通网关的电源，再重新开啓电源，然后拔打“ *158# ”听语音提示，听语音报出来的FIT天地通网关IP是否爲刚才设定的“192.168.1.188”，若是，则设置已经成功，可以开始使用。若不是，请重複设置一次。</div><div>&nbsp;</div><div><b>FIT天地通使用动态IP的设置方法</b></div><div>&nbsp;</div><div>　　FIT天地通网关的默认设置爲使用动态IP的设置模式，用户如果是使用动态IP的话，不需要作任何操作，即插即用。如果设置爲固定IP后需要转爲动态IP模式，在话机上拔号 “ *150*2# ”，听到“设置成功”的语音提示后把FIT天地通网关断电重啓即可。</div><div>&nbsp;</div><div>　　FIT天地通在防火牆后面使用的设置</div><div><br /></div><div>　　如果用户需要把FIT天地通网关置防火牆后面使用，建议针对FIT天地通网关的MAC地址，开放所有权限。FIT天地通网关采用独立的嵌入式系统，具有极高的安全性，开放权限不会影响其内部的安全性。</div>\r\n\r\n\r\n\r\n',2,'','','','nethelp'),(15,2,'解决方案','<p><strong><font color=#ff0000>业务特点：</font></strong></p>\r\n<p>1、每个F201装置具备一个内网号，在全球范围内互打免费，内网採用私有协议，通话极其清晰。<br />2、无初装费、无最低消费、无月租；无迁装费,全球有网络的地方均可使用；外形精緻小巧，仅一盒香烟大小，极易携带。<br />3、语音清晰、费用低廉：电讯级线路，网络正常的情况下与普通电话通话音质一样。国内国际通话费用相对电讯营运商来说更具有很大的价格优势。<br />4、採用国际直拨的拨号规则，简单快捷，跟平常的国际拨号方式相同。</p>\r\n<p><strong><font color=#ff0000>通用对象：</font></strong></p>\r\n<p>有关FIT天地通服务的最新价格资料，请点击FIT天地通网关价格表 (2013年7月1日起生效，以美元计)，以及FIT天地通手机价格表 (以人民币计)。</p>\r\n<p><strong><font color=#ff0000>通用产品：</font></strong></p>\r\n<p>F201天地通拨打电话方法：<br />1、首先确保正确接线,把局域网网线接到FIT装置的LAN口，话机接到LAN口旁边的电话线接口上，您平时使用的电讯电话线接到电源线接口旁边的line口上。<br />2、F201採用国际直拨的拨号方式： 国家区号+地区区号+电话号码+#<br />例如：<br /> 拨打中国的手机：13812345678 这样拨打： 008613812345678#<br /> 拨打北京的固网电话：01088123456 这样拨打： 00861088123456#<br />拨打其他国际长途以此类推<br />3、拨打F201内网号码，直接拨打内网号加#即可。例如您要拨打内网号：66888，在话机上拨：66888#。<br />4、F201装置设有电讯电话线接口（见图中电源线接口旁边的line口），如果您不想使用F201线路，您可以在拨9后再正常拨号，就会使用您line口上的电讯电话线路。<br />5、在line口上接上电讯的电话线后，接在FIT装置上的电话机可以正常接听呼入您的电讯号码的来电，而且如果接在F201上的电源断电，仅仅令您的F201失去功能，您的电讯电话线仍可正常打入打出，完全不受FIT装置断电的影响。</p>',3,'','','','solution'),(16,1,'新闻动态','',2,'','','','news');
/*!40000 ALTER TABLE `pwn_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_page_group`
--

DROP TABLE IF EXISTS `pwn_page_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_page_group` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '1',
  `folder` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_page_group`
--

LOCK TABLES `pwn_page_group` WRITE;
/*!40000 ALTER TABLE `pwn_page_group` DISABLE KEYS */;
INSERT INTO `pwn_page_group` VALUES (1,'企业介绍',1,0,'html'),(2,'FIT天地通',1,1,'fit');
/*!40000 ALTER TABLE `pwn_page_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_cat`
--

DROP TABLE IF EXISTS `pwn_photo_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) DEFAULT NULL,
  `cat` char(100) DEFAULT NULL,
  `xuhao` int(12) DEFAULT NULL,
  `catpath` char(255) DEFAULT NULL,
  `nums` int(20) DEFAULT NULL,
  `tj` int(1) NOT NULL DEFAULT '0',
  `ifchannel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_cat`
--

LOCK TABLES `pwn_photo_cat` WRITE;
/*!40000 ALTER TABLE `pwn_photo_cat` DISABLE KEYS */;
INSERT INTO `pwn_photo_cat` VALUES (1,0,'企业全貌',1,'0001:',0,0,0),(2,0,'办公环境',2,'0002:',0,0,0),(3,0,'公司活动',3,'0003:',0,0,0);
/*!40000 ALTER TABLE `pwn_photo_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_con`
--

DROP TABLE IF EXISTS `pwn_photo_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_con` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(12) NOT NULL DEFAULT '0',
  `catpath` varchar(255) NOT NULL DEFAULT '',
  `pcatid` int(12) NOT NULL DEFAULT '0',
  `contype` varchar(20) NOT NULL DEFAULT 'photo',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` text,
  `dtime` int(11) DEFAULT '0',
  `xuhao` int(5) DEFAULT '0',
  `cl` int(20) DEFAULT NULL,
  `tj` int(1) DEFAULT NULL,
  `iffb` int(1) DEFAULT '0',
  `ifbold` int(1) DEFAULT '0',
  `ifred` varchar(20) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `src` varchar(150) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `memberid` varchar(100) DEFAULT NULL,
  `proj` varchar(255) NOT NULL DEFAULT '',
  `secure` int(11) NOT NULL DEFAULT '0',
  `memo` text NOT NULL,
  `prop1` char(255) NOT NULL DEFAULT '',
  `prop2` char(255) NOT NULL DEFAULT '',
  `prop3` char(255) NOT NULL DEFAULT '',
  `prop4` char(255) NOT NULL DEFAULT '',
  `prop5` char(255) NOT NULL DEFAULT '',
  `prop6` char(255) NOT NULL DEFAULT '',
  `prop7` char(255) NOT NULL DEFAULT '',
  `prop8` char(255) NOT NULL DEFAULT '',
  `prop9` char(255) NOT NULL DEFAULT '',
  `prop10` char(255) NOT NULL DEFAULT '',
  `prop11` char(255) NOT NULL DEFAULT '',
  `prop12` char(255) NOT NULL DEFAULT '',
  `prop13` char(255) NOT NULL DEFAULT '',
  `prop14` char(255) NOT NULL DEFAULT '',
  `prop15` char(255) NOT NULL DEFAULT '',
  `prop16` char(255) NOT NULL DEFAULT '',
  `prop17` char(255) NOT NULL DEFAULT '',
  `prop18` char(255) NOT NULL DEFAULT '',
  `prop19` char(255) NOT NULL DEFAULT '',
  `prop20` char(255) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL,
  `zhichi` int(5) NOT NULL DEFAULT '0',
  `fandui` int(5) NOT NULL DEFAULT '0',
  `tplog` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_con`
--

LOCK TABLES `pwn_photo_con` WRITE;
/*!40000 ALTER TABLE `pwn_photo_con` DISABLE KEYS */;
INSERT INTO `pwn_photo_con` VALUES (1,2,'0002:',0,'photo','企业图片','',1238862719,0,7,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,''),(2,2,'0002:',0,'photo','企业图片','',1238862719,0,13,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,''),(3,2,'0002:',0,'photo','企业图片','',1238862719,0,0,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,''),(4,2,'0002:',0,'photo','企业图片','',1238862719,0,3,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,''),(5,2,'0002:',0,'photo','企业图片','',1238862719,0,1,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,''),(6,2,'0002:',0,'photo','企业图片','',1238862719,0,0,0,1,0,'0','gif','photo/pics/20090405/1238862719.jpg',1238862737,'系统管理员','','0','',0,'会客区','','','','','','','','','','','','','','','','','','','','','',0,0,'');
/*!40000 ALTER TABLE `pwn_photo_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_config`
--

DROP TABLE IF EXISTS `pwn_photo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_config`
--

LOCK TABLES `pwn_photo_config` WRITE;
/*!40000 ALTER TABLE `pwn_photo_config` DISABLE KEYS */;
INSERT INTO `pwn_photo_config` VALUES (1,'模块频道名称','input','30','ChannelName','企业图库','本模块对应的频道名称，如“图片展示”；用于显示在网页标题、当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','1','是否在当前位置提示条显示模块频道名称'),(5,'会员上传图片尺寸限制(Byte)','input','30','PicSizeLimit','256000','会员上传图片时,单个图片尺寸的限制');
/*!40000 ALTER TABLE `pwn_photo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_pages`
--

DROP TABLE IF EXISTS `pwn_photo_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_pages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `photoid` int(12) NOT NULL DEFAULT '0',
  `src` varchar(150) NOT NULL DEFAULT '',
  `xuhao` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_pages`
--

LOCK TABLES `pwn_photo_pages` WRITE;
/*!40000 ALTER TABLE `pwn_photo_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_photo_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_pcat`
--

DROP TABLE IF EXISTS `pwn_photo_pcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_pcat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_pcat`
--

LOCK TABLES `pwn_photo_pcat` WRITE;
/*!40000 ALTER TABLE `pwn_photo_pcat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_photo_pcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_proj`
--

DROP TABLE IF EXISTS `pwn_photo_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_proj` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `folder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_proj`
--

LOCK TABLES `pwn_photo_proj` WRITE;
/*!40000 ALTER TABLE `pwn_photo_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_photo_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_photo_prop`
--

DROP TABLE IF EXISTS `pwn_photo_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_photo_prop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catid` int(20) NOT NULL DEFAULT '0',
  `propname` char(30) DEFAULT NULL,
  `xuhao` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xuhao` (`xuhao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_photo_prop`
--

LOCK TABLES `pwn_photo_prop` WRITE;
/*!40000 ALTER TABLE `pwn_photo_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_photo_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_cat`
--

DROP TABLE IF EXISTS `pwn_product_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_cat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `pid` int(12) DEFAULT NULL,
  `cat` char(100) DEFAULT NULL,
  `xuhao` int(12) DEFAULT NULL,
  `catpath` char(255) DEFAULT NULL,
  `nums` int(20) DEFAULT NULL,
  `tj` int(1) NOT NULL DEFAULT '0',
  `ifchannel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_cat`
--

LOCK TABLES `pwn_product_cat` WRITE;
/*!40000 ALTER TABLE `pwn_product_cat` DISABLE KEYS */;
INSERT INTO `pwn_product_cat` VALUES (47,0,'FIT天地通',1,'0047:',0,0,0);
/*!40000 ALTER TABLE `pwn_product_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_con`
--

DROP TABLE IF EXISTS `pwn_product_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_con` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(12) NOT NULL DEFAULT '0',
  `catpath` varchar(255) NOT NULL DEFAULT '',
  `pcatid` int(12) NOT NULL DEFAULT '0',
  `contype` varchar(20) NOT NULL DEFAULT 'product',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext,
  `dtime` int(11) DEFAULT '0',
  `xuhao` int(5) DEFAULT '0',
  `cl` int(20) DEFAULT NULL,
  `tj` int(1) DEFAULT NULL,
  `iffb` int(1) DEFAULT '0',
  `ifbold` int(1) DEFAULT '0',
  `ifred` varchar(20) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `src` varchar(150) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `memberid` varchar(100) DEFAULT NULL,
  `proj` varchar(255) NOT NULL DEFAULT '',
  `secure` int(11) NOT NULL DEFAULT '0',
  `memo` text NOT NULL,
  `prop1` char(255) NOT NULL DEFAULT '',
  `prop2` char(255) NOT NULL DEFAULT '',
  `prop3` char(255) NOT NULL DEFAULT '',
  `prop4` char(255) NOT NULL DEFAULT '',
  `prop5` char(255) NOT NULL DEFAULT '',
  `prop6` char(255) NOT NULL DEFAULT '',
  `prop7` char(255) NOT NULL DEFAULT '',
  `prop8` char(255) NOT NULL DEFAULT '',
  `prop9` char(255) NOT NULL DEFAULT '',
  `prop10` char(255) NOT NULL DEFAULT '',
  `prop11` char(255) NOT NULL DEFAULT '',
  `prop12` char(255) NOT NULL DEFAULT '',
  `prop13` char(255) NOT NULL DEFAULT '',
  `prop14` char(255) NOT NULL DEFAULT '',
  `prop15` char(255) NOT NULL DEFAULT '',
  `prop16` char(255) NOT NULL DEFAULT '',
  `prop17` char(255) NOT NULL DEFAULT '',
  `prop18` char(255) NOT NULL DEFAULT '',
  `prop19` char(255) NOT NULL DEFAULT '',
  `prop20` char(255) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL,
  `zhichi` int(5) NOT NULL DEFAULT '0',
  `fandui` int(5) NOT NULL DEFAULT '0',
  `tplog` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_con`
--

LOCK TABLES `pwn_product_con` WRITE;
/*!40000 ALTER TABLE `pwn_product_con` DISABLE KEYS */;
INSERT INTO `pwn_product_con` VALUES (45,47,'0047:',0,'product','FIT天地通手机','<div><div><b>FIT天地通简介</b></div><div><br /></div><div>　　FIT天地通是中国交通通信以互联网为通讯媒介开发的新一代通信终端，有基于硬件的FIT天地通网关（产品编号为F201)和基于软件的FIT天地通手机。</div></div><div><br /></div><div><b>FIT天地通手机</b></div><div><br /></div>\n　　FIT天地通智能手机通信软件是由中国交通通信开发的以拔打海事卫星电话爲核心,并可拔打全球国际电话的通信软件,植入由中国交通通信授权的指定机型中使用。FIT天地通智能手机通信软件根据指定机型进行特定开发,非指定机型下使用会引起某些功能无法正常使用。购买时请认定中国交通通信及其授权的经销商。\n\n\n\n\n\n\n',1395304904,0,5,0,1,0,'0','gif','product/pics/20140320/1395304904.jpg',1395304942,'管理员','','0','',0,'以拨打海事卫星电话为核心进行开发的智能手机通信软件，植入指定的机型中使用。在保证高清海事卫星通话的前提下，还可直拨全球200多个国家，费用低廉，语音清晰','','','','','','','','','','','','','','','','','','','','','',0,0,''),(44,47,'0047:',0,'product','FIT天地通网关','<div><b>FIT天地通简介</b></div><div><br /></div><div>　　FIT天地通是中国交通通信以互联网为通讯媒介开发的新一代通信终端，有基于硬件的FIT天地通网关（产品编号为F201)和基于软件的FIT天地通手机。</div><div><br /></div><div><b>FIT天地通网关</b></div><div><br /></div><div>　　FIT天地通网关是由中交通信自主开发具有私有协议的通信终端，其中比较独特的特点之一是在一些封杀网络电话的国家和地区也能顺利使用，基本上可以在全球范围内有互网网接入的地方畅通无阻地使用，其主要特点如下：</div><div><br /></div><div>　　1、每个F201装置具备一个内网号，在全球范围内互打免费，内网採用私有协议，通话极其清晰。</div><div>　　2、无初装费、无最低消费、无月租；无迁装费,全球有网络的地方均可使用；外形精緻小巧，仅一盒香烟大小，极易携带。</div><div>　　3、语音清晰、费用低廉：电讯级线路，网络正常的情况下与普通电话通话音质一样。国内国际通话费用相对电讯营运商来说更具有很大的价格优势。</div><div>　　4、採用国际直拨的拨号规则，简单快捷，跟平常的国际拨号方式相同。</div><div style=\"text-align: center;\"><img src=\"../../product/pics/20140320/201403201395304587517.jpg\" border=\"0\" alt=\"\" /></div>\r\n\r\n\r\n\r\n',1395304592,0,3,0,1,0,'0','gif','product/pics/20140320/1395304592.jpg',1395304592,'管理员','','0','',0,'以拨打海事卫星电话为核心进行开发的网络电话，海事卫星通话高清音质，并可直拨200多个国家，每个FTI网关分配一个内网号，全球范围内网通话免费，防封杀，仅烟盒大小易携带','','','','','','','','','','','','','','','','','','','','','',0,0,''),(46,47,'0047:',0,'product',' 海事卫星手持机','\n<div><div><b>FIT天地通简介</b></div><div><br /></div><div>　　FIT天地通是中国交通通信以互联网为通讯媒介开发的新一代通信终端，有基于硬件的FIT天地通网关（产品编号为F201)和基于软件的FIT天地通手机。</div></div><div><br /></div><div><b>海事卫星手持机</b></div><div><br /></div><div>&nbsp; &nbsp; 北京船舶通信导航公司于2010年6月推出全新的海事卫星手机系列——IsatPhone Pro，该产品特点是设备体积小、话音清晰，实现短讯与电子邮件互通，并开发出GPS显示及定位功能，同时兼具卫星特有的全球覆盖、无盲区通讯的优点，适合在各种複杂环境下通讯使用。</div><div>　　特点和优势：</div><div>　　中文短讯：短讯功能传递文字信息，提供中文输入法，每条短讯可写74个汉字；短讯也可以与电子邮件互通</div><div>　　GPS定位：手机可以随时显示以及发送GPS信息，实现GPS定位和救援指示的功能。</div><div>　　全球通讯：全球覆盖，保证随时随地通讯，确保应急通讯和安全通讯</div><div>　　使用简单：对星简单，部分地区开机即用、无需专门对星</div><div>　　小巧便携：随身携带，总重量仅为279克</div><div>　　话音清晰：採用2.4 kbps最新压缩编码技术，确保通讯质素</div><div>　　支持数据：支持2.4kbps数据业务（2011年上半年开放）</div><div>　　超长待机： 100小时的待机、8小时的通话时长</div>\n\n\n\n\n\n\n',1395305331,0,23,0,1,0,'0','gif','product/pics/20140320/1395305331.jpg',1395305351,'管理员','','0','',0,'100小时待机时长，重量不到300克，可随身携带，防水防尘防震，可在移动中使用，性能强大','','','','','','','','','','','','','','','','','','','','','',0,0,'');
/*!40000 ALTER TABLE `pwn_product_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_config`
--

DROP TABLE IF EXISTS `pwn_product_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_config` (
  `xuhao` int(3) NOT NULL DEFAULT '0',
  `vname` varchar(50) NOT NULL DEFAULT '',
  `settype` varchar(30) NOT NULL DEFAULT 'input',
  `colwidth` varchar(3) NOT NULL DEFAULT '30',
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_config`
--

LOCK TABLES `pwn_product_config` WRITE;
/*!40000 ALTER TABLE `pwn_product_config` DISABLE KEYS */;
INSERT INTO `pwn_product_config` VALUES (1,'模块频道名称','input','30','ChannelName','产品展示','本模块对应的频道名称，如“产品展示”；用于显示在网页标题、当前位置提示条等处'),(2,'是否在当前位置提示条显示模块频道名称','YN','30','ChannelNameInNav','1','是否在当前位置提示条显示模块频道名称'),(5,'会员上传产品图片尺寸限制(Byte)','input','30','PicSizeLimit','256000','会员上传产品图片时,单个图片尺寸的限制'),(6,'产品介绍编辑器图片上传限制(Byte)','input','30','EditPicLimit','512000','会员发布产品时,在编辑器内上传图片,单个图片的尺寸限制');
/*!40000 ALTER TABLE `pwn_product_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_pages`
--

DROP TABLE IF EXISTS `pwn_product_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_pages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `productid` int(12) NOT NULL DEFAULT '0',
  `src` varchar(150) NOT NULL DEFAULT '',
  `xuhao` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_pages`
--

LOCK TABLES `pwn_product_pages` WRITE;
/*!40000 ALTER TABLE `pwn_product_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_product_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_pcat`
--

DROP TABLE IF EXISTS `pwn_product_pcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_pcat` (
  `catid` int(12) NOT NULL AUTO_INCREMENT,
  `memberid` int(12) NOT NULL DEFAULT '0',
  `pid` int(12) NOT NULL DEFAULT '0',
  `cat` char(100) NOT NULL DEFAULT '',
  `xuhao` int(12) NOT NULL DEFAULT '0',
  `catpath` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_pcat`
--

LOCK TABLES `pwn_product_pcat` WRITE;
/*!40000 ALTER TABLE `pwn_product_pcat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_product_pcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_proj`
--

DROP TABLE IF EXISTS `pwn_product_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_proj` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `folder` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_proj`
--

LOCK TABLES `pwn_product_proj` WRITE;
/*!40000 ALTER TABLE `pwn_product_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_product_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_product_prop`
--

DROP TABLE IF EXISTS `pwn_product_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_product_prop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catid` int(20) NOT NULL DEFAULT '0',
  `propname` char(30) DEFAULT NULL,
  `xuhao` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xuhao` (`xuhao`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_product_prop`
--

LOCK TABLES `pwn_product_prop` WRITE;
/*!40000 ALTER TABLE `pwn_product_prop` DISABLE KEYS */;
INSERT INTO `pwn_product_prop` VALUES (1,1,'颜色',1),(80,10,'版本',1),(3,1,'材质',3),(4,1,'尺寸',4),(5,2,'颜色',1),(6,2,'材质',2),(97,13,'价格',4),(8,2,'尺寸',4),(79,9,'价格',4),(70,3,'价格',4),(69,3,'设计',3),(68,3,'版本',1),(78,9,'设计',3),(73,4,'价格',4),(72,4,'设计',3),(71,4,'版本',1),(77,9,'版本',1),(76,5,'价格',4),(75,5,'设计',3),(74,5,'版本',1),(96,13,'设计',2),(106,6,'价格',4),(105,6,'设计',2),(104,6,'版本',1),(95,13,'版本',1),(94,7,'价格',4),(93,7,'设计',2),(92,7,'版本',1),(29,8,'产地',1),(30,8,'规格',2),(31,8,'包装',3),(32,8,'报价',4),(81,10,'设计',3),(67,15,'功率',4),(66,15,'加水容量',2),(65,15,'型号',1),(82,10,'价格',4),(64,14,'功率',4),(63,14,'规格',2),(62,14,'型号',1),(83,11,'版本',1),(84,11,'设计',3),(85,11,'价格',4),(86,18,'颜色',1),(87,18,'材质',2),(88,18,'尺寸',3),(103,34,'价格',4),(102,34,'设计',2),(101,34,'版本',1),(107,19,'版本',1),(108,19,'设计',2),(109,19,'价格',3),(110,22,'版本',1),(111,22,'设计',2),(112,22,'价格',3),(113,20,'版本',1),(114,20,'设计',2),(115,20,'价格',3),(116,35,'颜色',1),(117,35,'材质',2),(118,35,'尺寸',3),(119,36,'颜色',1),(120,36,'材质',2),(121,36,'尺寸',3),(122,37,'颜色',1),(123,37,'材质',3),(124,37,'尺寸',4),(125,38,'颜色',1),(126,38,'材质',3),(127,38,'尺寸',4),(128,39,'颜色',1),(129,39,'材质',3),(130,39,'尺寸',4),(131,40,'颜色',1),(132,40,'材质',2),(133,40,'尺寸',4),(134,41,'颜色',1),(135,41,'材质',2),(136,41,'尺寸',4),(137,42,'颜色',1),(138,42,'材质',2),(139,42,'尺寸',4),(140,43,'颜色',1),(141,43,'材质',2),(142,43,'尺寸',3),(143,44,'颜色',1),(144,44,'材质',2),(145,44,'尺寸',3),(146,45,'颜色',1),(147,45,'材质',2),(148,45,'尺寸',3),(149,46,'颜色',1),(150,46,'材质',3),(151,46,'尺寸',4),(157,49,'品牌',1),(158,49,'型号',2),(159,49,'尺寸',3),(160,49,'毛重',4),(161,49,'净重',5),(162,50,'品牌',1),(163,50,'型号',2),(164,50,'尺寸',3),(165,50,'毛重',4),(166,50,'净重',5),(167,51,'品牌',1),(168,51,'型号',2),(169,51,'尺寸',3),(170,51,'毛重',4),(171,51,'净重',5),(172,52,'品牌',1),(173,52,'型号',2),(174,52,'尺寸',3),(175,52,'毛重',4),(176,52,'净重',5),(177,53,'品牌',1),(178,53,'型号',2),(179,53,'尺寸',3),(180,53,'毛重',4),(181,53,'净重',5),(182,54,'品牌',1),(183,54,'型号',2),(184,54,'尺寸',3),(185,54,'毛重',4),(186,54,'净重',5),(187,55,'品牌',1),(188,55,'型号',2),(189,55,'尺寸',3),(190,55,'毛重',4),(191,55,'净重',5),(192,56,'品牌',1),(193,56,'型号',2),(194,56,'尺寸',3),(195,56,'毛重',4),(196,56,'净重',5),(197,62,'品牌',1),(198,62,'型号',2),(199,62,'尺寸',3),(200,62,'毛重',4),(201,62,'净重',5),(202,63,'品牌',1),(203,63,'型号',2),(204,63,'尺寸',3),(205,63,'毛重',4),(206,63,'净重',5),(207,64,'品牌',1),(208,64,'型号',2),(209,64,'尺寸',3),(210,64,'毛重',4),(211,64,'净重',5),(212,65,'品牌',1),(213,65,'型号',2),(214,65,'尺寸',3),(215,65,'毛重',4),(216,65,'净重',5),(217,66,'品牌',1),(218,66,'型号',2),(219,66,'尺寸',3),(220,66,'毛重',4),(221,66,'净重',5),(222,67,'品牌',1),(223,67,'型号',2),(224,67,'尺寸',3),(225,67,'毛重',4),(226,67,'净重',5),(227,68,'品牌',1),(228,68,'型号',2),(229,68,'尺寸',3),(230,68,'毛重',4),(231,68,'净重',5),(232,69,'品牌',1),(233,69,'型号',2),(234,69,'尺寸',3),(235,69,'毛重',4),(236,69,'净重',5),(237,70,'品牌',1),(238,70,'型号',2),(239,70,'尺寸',3),(240,70,'毛重',4),(241,70,'净重',5),(242,71,'品牌',1),(243,71,'型号',2),(244,71,'尺寸',3),(245,71,'毛重',4),(246,71,'净重',5);
/*!40000 ALTER TABLE `pwn_product_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_service`
--

DROP TABLE IF EXISTS `pwn_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_service` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupid` int(5) NOT NULL DEFAULT '0',
  `field_caption` varchar(200) NOT NULL DEFAULT '',
  `field_type` int(1) NOT NULL DEFAULT '0',
  `field_size` int(5) NOT NULL DEFAULT '0',
  `field_name` varchar(200) NOT NULL DEFAULT '',
  `field_value` varchar(255) NOT NULL DEFAULT '',
  `field_null` int(1) NOT NULL DEFAULT '0',
  `value_repeat` int(1) NOT NULL DEFAULT '0',
  `field_intro` varchar(255) NOT NULL DEFAULT '',
  `use_field` int(1) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '0',
  `xuhao` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1542 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_service`
--

LOCK TABLES `pwn_service` WRITE;
/*!40000 ALTER TABLE `pwn_service` DISABLE KEYS */;
INSERT INTO `pwn_service` VALUES (1,0,'留言标题',1,399,'title','',1,1,'',1,1,1),(2,0,'留言内容',2,399,'content','',0,1,'',1,0,2),(3,0,'您的姓名',1,399,'name','',0,1,'',0,0,3),(5,0,'联系电话',1,399,'tel','',0,1,'',0,0,5),(6,0,'联系地址',1,399,'address','',0,1,'',0,0,6),(7,0,'电子邮件',1,399,'email','',0,1,'',0,0,7),(8,0,'网址URL',1,399,'url','',0,1,'',0,0,8),(9,0,'QQ号码',1,399,'qq','',0,1,'',0,0,9),(10,0,'公司名称',1,399,'company','',0,1,'',0,0,10),(11,0,'公司地址',1,399,'company_address','',0,1,'',0,0,11),(4,0,'性　　别',5,399,'sex','男;女',0,1,'',0,0,4),(12,0,'邮政编码',1,399,'zip','',0,1,'',0,0,12),(13,0,'传真号码',1,399,'fax','',0,1,'',0,0,13),(14,0,'产品编号',1,399,'products_id','',0,1,'',0,0,14),(15,0,'产品名称',1,399,'products_name','',0,1,'',0,0,15),(16,0,'订购数量',1,399,'products_num','',0,1,'',0,0,16),(19,0,'自定义一',5,399,'custom1','100;200;300;400;500',0,1,'',0,0,17),(18,0,'自定义二',5,399,'custom2','100;200;300;400;500',0,1,'',0,0,18),(17,0,'自定义三',5,399,'custom3','100;200;300;400;500',0,1,'',0,0,19),(20,0,'自定义四',1,399,'custom4','',0,1,'',0,0,20),(21,0,'自定义五',1,399,'custom5','',0,1,'',0,0,21),(22,0,'自定义六',1,399,'custom6','',0,1,'',0,0,22),(23,0,'自定义七',1,399,'custom7','',0,1,'',0,0,23),(1145,1,'自定义二',5,399,'custom2','100;200;300;400;500',0,1,'',0,0,18),(1146,1,'自定义三',5,399,'custom3','100;200;300;400;500',0,1,'',0,0,19),(1147,1,'自定义四',1,399,'custom4','',0,1,'',0,0,20),(1148,1,'自定义五',1,399,'custom5','',0,1,'',0,0,21),(1149,1,'自定义六',1,399,'custom6','',0,1,'',0,0,22),(1150,1,'自定义七',1,399,'custom7','',0,1,'',0,0,23),(1143,1,'订购数量',1,399,'products_num','',0,1,'',0,0,16),(1144,1,'自定义一',5,399,'custom1','100;200;300;400;500',0,1,'',0,0,17),(1142,1,'产品名称',1,399,'products_name','',0,1,'',0,0,15),(1141,1,'产品编号',1,399,'products_id','',0,1,'',0,0,14),(1140,1,'传真号码',1,399,'fax','',0,1,'',0,0,13),(1139,1,'邮政编码',1,399,'zip','',0,1,'',0,0,12),(1138,1,'性别称谓',5,399,'sex','先生;女士',0,1,'',0,0,9),(1136,1,'客户名称',1,399,'company','',1,1,'',1,0,3),(1137,1,'公司地址',1,399,'company_address','',0,1,'',0,0,11),(1135,1,'QQ/MSN',1,399,'qq','',0,1,'',1,0,9),(1134,1,'网址URL',1,399,'url','',0,1,'',0,0,8),(1133,1,'电子邮件',1,399,'email','',0,1,'',0,0,7),(1132,1,'联系地址',1,399,'address','',0,1,'',0,0,6),(1131,1,'联系电话',1,399,'tel','',1,1,'',1,0,5),(1130,1,'联 系 人',1,399,'name','',0,1,'',1,0,4),(1129,1,'咨询内容',2,399,'content','',1,1,'',1,0,2),(1128,1,'咨询主题',1,399,'title','',1,1,'',1,1,1),(1496,16,'产品名称',1,399,'title','',1,1,'',1,1,1),(1497,16,'您的要求',2,399,'content','',0,1,'',1,0,10),(1498,16,'联 系 人',1,399,'name','',1,1,'',1,0,5),(1499,16,'联系电话',1,399,'tel','',1,1,'',1,0,7),(1500,16,'联系地址',1,399,'address','',0,1,'',0,0,12),(1501,16,'电子邮件',1,399,'email','',0,1,'',1,0,8),(1502,16,'网址URL',1,399,'url','',0,1,'',0,0,10),(1503,16,'QQ号码',1,399,'qq','',0,1,'',1,0,9),(1504,16,'客户名称',1,399,'company','',1,1,'',1,0,3),(1505,16,'公司地址',1,399,'company_address','',0,1,'',0,0,11),(1506,16,'性　　别',5,399,'sex','男;女',0,1,'',0,0,13),(1507,16,'邮政编码',1,399,'zip','',0,1,'',0,0,12),(1508,16,'传真号码',1,399,'fax','',0,1,'',0,0,13),(1509,16,'产品编号',1,399,'products_id','',0,1,'',0,0,14),(1510,16,'产品名称',1,399,'products_name','',0,1,'',0,0,15),(1511,16,'订购数量',1,399,'products_num','',1,1,'',1,0,2),(1512,16,'自定义一',5,399,'custom1','100;200;300;400;500',0,1,'',0,0,17),(1513,16,'自定义二',5,399,'custom2','100;200;300;400;500',0,1,'',0,0,18),(1514,16,'自定义三',5,399,'custom3','100;200;300;400;500',0,1,'',0,0,19),(1515,16,'自定义四',1,399,'custom4','',0,1,'',0,0,20),(1516,16,'自定义五',1,399,'custom5','',0,1,'',0,0,21),(1517,16,'自定义六',1,399,'custom6','',0,1,'',0,0,22),(1518,16,'自定义七',1,399,'custom7','',0,1,'',0,0,23),(1519,17,'投诉主题',1,399,'title','',1,1,'',1,1,1),(1520,17,'投诉内容',2,399,'content','',1,1,'',1,0,2),(1521,17,'您的姓名',1,399,'name','',1,1,'',1,0,3),(1522,17,'固定电话',1,399,'tel','',1,1,'',1,0,5),(1523,17,'联系地址',1,399,'address','',0,1,'',0,0,16),(1524,17,'电子邮件',1,399,'email','',0,1,'',1,0,8),(1525,17,'网址URL',1,399,'url','',0,1,'',0,0,8),(1526,17,'QQ号码',1,399,'qq','',0,1,'',1,0,9),(1527,17,'公司名称',1,399,'company','',0,1,'',0,0,10),(1528,17,'公司地址',1,399,'company_address','',0,1,'',0,0,11),(1529,17,'性　　别',5,399,'sex','男;女',0,1,'',0,0,13),(1530,17,'邮政编码',1,399,'zip','',0,1,'',0,0,12),(1531,17,'移动电话',1,399,'fax','',1,1,'',1,0,7),(1532,17,'产品编号',1,399,'products_id','',0,1,'',0,0,14),(1533,17,'产品名称',1,399,'products_name','',0,1,'',0,0,15),(1534,17,'订购数量',1,399,'products_num','',0,1,'',0,0,16),(1535,17,'自定义一',5,399,'custom1','100;200;300;400;500',0,1,'',0,0,17),(1536,17,'自定义二',5,399,'custom2','100;200;300;400;500',0,1,'',0,0,18),(1537,17,'自定义三',5,399,'custom3','100;200;300;400;500',0,1,'',0,0,19),(1538,17,'自定义四',1,399,'custom4','',0,1,'',0,0,20),(1539,17,'自定义五',1,399,'custom5','',0,1,'',0,0,21),(1540,17,'自定义六',1,399,'custom6','',0,1,'',0,0,22),(1541,17,'自定义七',1,399,'custom7','',0,1,'',0,0,23);
/*!40000 ALTER TABLE `pwn_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_service_chang`
--

DROP TABLE IF EXISTS `pwn_service_chang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_service_chang` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_service_chang`
--

LOCK TABLES `pwn_service_chang` WRITE;
/*!40000 ALTER TABLE `pwn_service_chang` DISABLE KEYS */;
INSERT INTO `pwn_service_chang` VALUES (1,'问题处理中','您提交的问题正在处理中,请稍等...'),(2,'问题需要协同处理','您提交的问题需要协同处理,可能需要较长的时间,请耐心等待,我们争取在工作日内处理完成...'),(3,'请电话联系','您提出的问题,需要电话联系,请直接拨打技术热线:010-10101010。\r\n感谢您的配合!\r\n\r\n某某网站\r\nhttp://'),(4,'处理完成','您提交的问题已经处理完成，请验收！\r\n如果您觉得还有问题，可继续回复');
/*!40000 ALTER TABLE `pwn_service_chang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_service_chat`
--

DROP TABLE IF EXISTS `pwn_service_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_service_chat` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `rid` int(12) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dtime` int(11) NOT NULL DEFAULT '0',
  `memberid` int(12) NOT NULL DEFAULT '0',
  `adminid` int(5) NOT NULL DEFAULT '0',
  `fromname` varchar(30) NOT NULL,
  `fromtype` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_service_chat`
--

LOCK TABLES `pwn_service_chat` WRITE;
/*!40000 ALTER TABLE `pwn_service_chat` DISABLE KEYS */;
INSERT INTO `pwn_service_chat` VALUES (1,170,'dffd',1238898136,150,0,'测试会员','member');
/*!40000 ALTER TABLE `pwn_service_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_service_feedback`
--

DROP TABLE IF EXISTS `pwn_service_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_service_feedback` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `groupid` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `sex` varchar(10) NOT NULL DEFAULT '',
  `tel` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `company_address` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(6) NOT NULL DEFAULT '',
  `fax` varchar(20) NOT NULL DEFAULT '',
  `products_id` varchar(100) NOT NULL DEFAULT '',
  `products_name` varchar(200) NOT NULL DEFAULT '',
  `products_num` varchar(9) NOT NULL DEFAULT '',
  `custom1` text NOT NULL,
  `custom2` text NOT NULL,
  `custom3` text NOT NULL,
  `custom4` text NOT NULL,
  `custom5` text NOT NULL,
  `custom6` text NOT NULL,
  `custom7` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `uptime` int(11) NOT NULL DEFAULT '0',
  `memberid` int(12) NOT NULL DEFAULT '0',
  `stat` int(2) NOT NULL DEFAULT '0',
  `adminid` int(5) NOT NULL DEFAULT '0',
  `coadminid` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_service_feedback`
--

LOCK TABLES `pwn_service_feedback` WRITE;
/*!40000 ALTER TABLE `pwn_service_feedback` DISABLE KEYS */;
INSERT INTO `pwn_service_feedback` VALUES (170,1,'ew','weeeeee','eeeeeee','','222222','','','','','we','','','','','','','','','','','','','','127.0.0.1',1238898090,1238898136,150,1,3,0);
/*!40000 ALTER TABLE `pwn_service_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_service_group`
--

DROP TABLE IF EXISTS `pwn_service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_service_group` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `xuhao` int(5) NOT NULL DEFAULT '0',
  `moveable` int(1) NOT NULL DEFAULT '1',
  `ifano` int(11) NOT NULL DEFAULT '0',
  `allowmembertype` varchar(255) NOT NULL,
  `allowservice` char(255) NOT NULL,
  `intro` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_service_group`
--

LOCK TABLES `pwn_service_group` WRITE;
/*!40000 ALTER TABLE `pwn_service_group` DISABLE KEYS */;
INSERT INTO `pwn_service_group` VALUES (1,'客服咨询',1,0,1,'|26|','|3|','欢迎咨询'),(16,'产品订购',5,1,1,'|26|','|3|','欢迎提交在线产品订购，我们会尽快和您联系'),(17,'用户投诉',3,1,1,'|26|','|3|','您对我们的产品或服务有何意见建议和投诉，请在这里提交，将由专人受理您的投诉');
/*!40000 ALTER TABLE `pwn_service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_code`
--

DROP TABLE IF EXISTS `pwn_tools_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat` varchar(100) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `groupname` varchar(100) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `xuhao` int(11) NOT NULL DEFAULT '0',
  `iffb` int(1) NOT NULL DEFAULT '1',
  `tj` int(1) NOT NULL DEFAULT '0',
  `dtime` int(11) NOT NULL DEFAULT '0',
  `uptime` int(11) NOT NULL DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_code`
--

LOCK TABLES `pwn_tools_code` WRITE;
/*!40000 ALTER TABLE `pwn_tools_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_tools_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_photopolldata`
--

DROP TABLE IF EXISTS `pwn_tools_photopolldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_photopolldata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `body` text,
  `iffb` int(1) NOT NULL DEFAULT '0',
  `tj` int(1) DEFAULT NULL,
  `secure` int(11) NOT NULL DEFAULT '0',
  `dtime` int(11) NOT NULL DEFAULT '0',
  `uptime` int(11) NOT NULL DEFAULT '0',
  `author` varchar(100) DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `src` varchar(150) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '',
  `votes` int(14) NOT NULL DEFAULT '0',
  `votesinfo1` text NOT NULL,
  `votesinfo2` text NOT NULL,
  `votesinfo3` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_photopolldata`
--

LOCK TABLES `pwn_tools_photopolldata` WRITE;
/*!40000 ALTER TABLE `pwn_tools_photopolldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_tools_photopolldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_photopollindex`
--

DROP TABLE IF EXISTS `pwn_tools_photopollindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_photopollindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(12) NOT NULL,
  `catpath` char(255) DEFAULT NULL,
  `cat` varchar(100) NOT NULL,
  `groupname` varchar(100) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `expire` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_photopollindex`
--

LOCK TABLES `pwn_tools_photopollindex` WRITE;
/*!40000 ALTER TABLE `pwn_tools_photopollindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_tools_photopollindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_pollconfig`
--

DROP TABLE IF EXISTS `pwn_tools_pollconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_pollconfig` (
  `config_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `img_height` int(5) NOT NULL DEFAULT '0',
  `img_length` int(5) NOT NULL DEFAULT '0',
  `vodinfo` varchar(225) NOT NULL DEFAULT '0',
  `def_options` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_pollconfig`
--

LOCK TABLES `pwn_tools_pollconfig` WRITE;
/*!40000 ALTER TABLE `pwn_tools_pollconfig` DISABLE KEYS */;
INSERT INTO `pwn_tools_pollconfig` VALUES (1,20,10,'对不起,您已经投过票了',10);
/*!40000 ALTER TABLE `pwn_tools_pollconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_polldata`
--

DROP TABLE IF EXISTS `pwn_tools_polldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_polldata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_text` varchar(200) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `votes` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_polldata`
--

LOCK TABLES `pwn_tools_polldata` WRITE;
/*!40000 ALTER TABLE `pwn_tools_polldata` DISABLE KEYS */;
INSERT INTO `pwn_tools_polldata` VALUES (17,8,5,'喜欢','aqua',0),(16,8,4,'一般','aqua',0),(13,8,1,'很好','aqua',1),(14,8,2,'不好','aqua',0),(15,8,3,'很差','aqua',0);
/*!40000 ALTER TABLE `pwn_tools_polldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_pollindex`
--

DROP TABLE IF EXISTS `pwn_tools_pollindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_pollindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `expire` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_pollindex`
--

LOCK TABLES `pwn_tools_pollindex` WRITE;
/*!40000 ALTER TABLE `pwn_tools_pollindex` DISABLE KEYS */;
INSERT INTO `pwn_tools_pollindex` VALUES (8,'这个软件你感觉怎么样？',1223209351,1,1225801351,0);
/*!40000 ALTER TABLE `pwn_tools_pollindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_statbase`
--

DROP TABLE IF EXISTS `pwn_tools_statbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_statbase` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ShowCountType` int(1) DEFAULT NULL,
  `ShowCountSize` int(1) DEFAULT NULL,
  `ShowCount` int(1) DEFAULT NULL,
  `ShowCountStat` int(1) DEFAULT NULL,
  `starttime` int(11) DEFAULT NULL,
  `CountIpExp` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_statbase`
--

LOCK TABLES `pwn_tools_statbase` WRITE;
/*!40000 ALTER TABLE `pwn_tools_statbase` DISABLE KEYS */;
INSERT INTO `pwn_tools_statbase` VALUES (1,2,8,2,0,1234728185,5);
/*!40000 ALTER TABLE `pwn_tools_statbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_statcome`
--

DROP TABLE IF EXISTS `pwn_tools_statcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_statcome` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `count` int(5) NOT NULL DEFAULT '0',
  `begingtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_statcome`
--

LOCK TABLES `pwn_tools_statcome` WRITE;
/*!40000 ALTER TABLE `pwn_tools_statcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_tools_statcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_statcount`
--

DROP TABLE IF EXISTS `pwn_tools_statcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_statcount` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `ip` varchar(17) NOT NULL DEFAULT '',
  `os` varchar(40) NOT NULL DEFAULT '',
  `browse` varchar(30) NOT NULL DEFAULT '',
  `urlform` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `nowpage` varchar(255) DEFAULT NULL,
  `member` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_statcount`
--

LOCK TABLES `pwn_tools_statcount` WRITE;
/*!40000 ALTER TABLE `pwn_tools_statcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwn_tools_statcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwn_tools_statdate`
--

DROP TABLE IF EXISTS `pwn_tools_statdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwn_tools_statdate` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `1th_day` int(5) NOT NULL DEFAULT '0',
  `2th_day` int(5) NOT NULL DEFAULT '0',
  `3th_day` int(5) NOT NULL DEFAULT '0',
  `4th_day` int(5) NOT NULL DEFAULT '0',
  `5th_day` int(5) NOT NULL DEFAULT '0',
  `6th_day` int(5) NOT NULL DEFAULT '0',
  `7th_day` int(5) NOT NULL DEFAULT '0',
  `8th_day` int(5) NOT NULL DEFAULT '0',
  `9th_day` int(5) NOT NULL DEFAULT '0',
  `10th_day` int(5) NOT NULL DEFAULT '0',
  `11th_day` int(5) NOT NULL DEFAULT '0',
  `12th_day` int(5) NOT NULL DEFAULT '0',
  `13th_day` int(5) NOT NULL DEFAULT '0',
  `14th_day` int(5) NOT NULL DEFAULT '0',
  `15th_day` int(5) NOT NULL DEFAULT '0',
  `16th_day` int(5) NOT NULL DEFAULT '0',
  `17th_day` int(5) NOT NULL DEFAULT '0',
  `18th_day` int(5) NOT NULL DEFAULT '0',
  `19th_day` int(5) NOT NULL DEFAULT '0',
  `20th_day` int(5) NOT NULL DEFAULT '0',
  `21th_day` int(5) NOT NULL DEFAULT '0',
  `22th_day` int(5) NOT NULL DEFAULT '0',
  `23th_day` int(5) NOT NULL DEFAULT '0',
  `24th_day` int(5) NOT NULL DEFAULT '0',
  `25th_day` int(5) NOT NULL DEFAULT '0',
  `26th_day` int(5) NOT NULL DEFAULT '0',
  `27th_day` int(5) NOT NULL DEFAULT '0',
  `28th_day` int(5) NOT NULL DEFAULT '0',
  `29th_day` int(5) NOT NULL DEFAULT '0',
  `30th_day` int(5) NOT NULL DEFAULT '0',
  `31th_day` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwn_tools_statdate`
--

LOCK TABLES `pwn_tools_statdate` WRITE;
/*!40000 ALTER TABLE `pwn_tools_statdate` DISABLE KEYS */;
INSERT INTO `pwn_tools_statdate` VALUES (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `pwn_tools_statdate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-20 18:06:02
