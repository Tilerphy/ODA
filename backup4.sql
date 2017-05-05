-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oda
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` varchar(64) NOT NULL,
  `aId` varchar(64) DEFAULT NULL,
  `bId` varchar(64) DEFAULT NULL,
  `aScore` int(11) DEFAULT NULL,
  `bScore` int(11) DEFAULT NULL,
  `winnerId` varchar(64) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `icon` text,
  PRIMARY KEY (`id`),
  KEY `game_index` (`id`,`aId`,`bId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('cb2f7414-308f-11e7-a757-00155d3c2f9e','36739bd5-306d-11e7-a757-00155d3c2f9e','605f4a18-306d-11e7-a757-00155d3c2f9e',0,0,'',1311644894906,NULL);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new` (
  `id` varchar(64) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `addressUrl` varchar(255) DEFAULT NULL,
  `contact` text,
  `teams` text,
  `date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `new_index` (`id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
INSERT INTO `new` VALUES ('61d0e0f7-30a6-11e7-a757-00155d3c2f9e','长春创联青少年体育俱乐部','http://j.map.baidu.com/VuPZH','王成尧 18088632227,孙宗宝 18686405707','鲸鱼队，躁动队，神马队',1495342800000);
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `id` varchar(64) NOT NULL,
  `gameId` varchar(64) DEFAULT NULL,
  `playerId` varchar(64) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `rebound` int(11) DEFAULT NULL,
  `assist` int(11) DEFAULT NULL,
  `steal` int(11) DEFAULT NULL,
  `blockShoot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_index` (`id`,`gameId`,`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `teamId` varchar(64) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `position` varchar(12) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_index` (`id`,`name`,`teamId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('00fc6bc3-306f-11e7-a757-00155d3c2f9e','孙承盼','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('071fb79f-306e-11e7-a757-00155d3c2f9e','张朋渤','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('0b2e55cc-306f-11e7-a757-00155d3c2f9e','孙宗宝','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SF,PF',NULL),('0edf42f0-306e-11e7-a757-00155d3c2f9e','徐林林','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('12b0f4b6-306e-11e7-a757-00155d3c2f9e','王卓','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('1ac99a2a-306f-11e7-a757-00155d3c2f9e','蒋宇志','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'PF,C',NULL),('2071866e-306e-11e7-a757-00155d3c2f9e','李亮','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'PF',NULL),('21ab0982-306f-11e7-a757-00155d3c2f9e','任殿超','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'C',NULL),('2b3ab3db-306e-11e7-a757-00155d3c2f9e','王成尧','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SG,SF,PF',NULL),('425600db-306e-11e7-a757-00155d3c2f9e','王野Ian','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'C',NULL),('45cea1ed-3171-11e7-8c55-56000054c258','王法平','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'PG,SG,SF',NULL),('5344b8cb-306e-11e7-a757-00155d3c2f9e','王育卜','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SG,PF,C',NULL),('5eacf6db-309c-11e7-a757-00155d3c2f9e','曲铁军','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PG',''),('6a725f4f-3170-11e7-8c55-56000054c258','郭峰','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('6f92caad-306e-11e7-a757-00155d3c2f9e','郭金满','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PG',NULL),('738def44-306e-11e7-a757-00155d3c2f9e','梁林','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PG',NULL),('7b86e831-306e-11e7-a757-00155d3c2f9e','梁耀武','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('7f09676a-306e-11e7-a757-00155d3c2f9e','孙大海','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('8999251e-306e-11e7-a757-00155d3c2f9e','王东哲','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'SG,PG',NULL),('94f37ed3-306e-11e7-a757-00155d3c2f9e','李辉','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PG,SF',NULL),('96e39825-3171-11e7-8c55-56000054c258','王晓光','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL),('9a25f996-316a-11e7-8c55-56000054c258','罗光耀','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PF,C',NULL),('9ee61fd4-306d-11e7-a757-00155d3c2f9e','贲佳林','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'PG',NULL),('9f416aea-306e-11e7-a757-00155d3c2f9e','赵航','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'SF,PF',NULL),('a827538e-306e-11e7-a757-00155d3c2f9e','李超','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'PF,C',NULL),('adacf039-3155-11e7-8c55-56000054c258','张耘溪','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'PG',NULL),('b1b7ff6b-306e-11e7-a757-00155d3c2f9e','刘立佳','68b3e558-306d-11e7-a757-00155d3c2f9e',0,'C',NULL),('d8cde6bc-306e-11e7-a757-00155d3c2f9e','刘海峰','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'PG',NULL),('e1299844-306e-11e7-a757-00155d3c2f9e','潘登','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('e6f9cde3-306e-11e7-a757-00155d3c2f9e','季凤翔','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('e7171c80-306d-11e7-a757-00155d3c2f9e','李广东','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('eaf14f87-306e-11e7-a757-00155d3c2f9e','康志强','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SG',NULL),('f7f12400-306d-11e7-a757-00155d3c2f9e','颜亮','36739bd5-306d-11e7-a757-00155d3c2f9e',0,'SG,SF',NULL),('f85500b4-306e-11e7-a757-00155d3c2f9e','弓宝健','605f4a18-306d-11e7-a757-00155d3c2f9e',0,'SF',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `lose` int(11) DEFAULT NULL,
  `draw` int(11) DEFAULT NULL,
  `finalWin` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('36739bd5-306d-11e7-a757-00155d3c2f9e','躁动队',0,0,0,0,'/img/lighting.jpg'),('605f4a18-306d-11e7-a757-00155d3c2f9e','神马队',0,0,0,0,'/img/horse.jpg'),('68b3e558-306d-11e7-a757-00155d3c2f9e','鲸鱼队',0,0,0,0,'/img/lighthouse.jpg');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05  9:26:58
