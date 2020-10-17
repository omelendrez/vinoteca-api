-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: us-cdbr-east-05.cleardb.net    Database: heroku_68e91ae782abadb
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'001','Vinos',11,1,'2020-09-01 10:05:33',1,'2020-09-01 10:05:33',0),(11,'002','Cervezas',11,1,'2020-09-01 10:05:42',1,'2020-09-01 10:05:42',0),(21,'003','Aperitivos',11,1,'2020-09-01 10:05:57',1,'2020-09-01 10:05:57',0),(31,'004','Gaseosas',11,1,'2020-09-01 10:06:04',1,'2020-09-01 10:06:04',0),(41,'005','COMBO REGALERIA',11,1,'2020-10-01 08:06:14',31,'2020-10-01 08:06:14',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'SoftDev','Omar Melendrez','Alberdi 2678','291 5754922','omar.melendrez@gmail.com',1,'2020-06-23 23:19:49',1,'2020-09-01 22:24:52',1),(11,'Vinoteca La Cava','Emiliano Mancinelli','Juan Molina 1195','291 4472900','mancinellibalanzas@yahoo.com.ar',1,'2020-06-23 23:20:33',1,'2020-09-01 22:24:30',31);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_data`
--

DROP TABLE IF EXISTS `graph_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graph_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` char(6) NOT NULL,
  `period_name` char(7) NOT NULL,
  `purchases` decimal(12,2) DEFAULT '0.00',
  `sales` decimal(12,2) DEFAULT '0.00',
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_data`
--

LOCK TABLES `graph_data` WRITE;
/*!40000 ALTER TABLE `graph_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  `company_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_variation`
--

DROP TABLE IF EXISTS `inventory_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  `variation_type` tinyint(4) NOT NULL,
  `variation_reason_id` int(11) NOT NULL,
  `comments` varchar(100) DEFAULT '',
  `company_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_variation`
--

LOCK TABLES `inventory_variation` WRITE;
/*!40000 ALTER TABLE `inventory_variation` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_variation_reason`
--

DROP TABLE IF EXISTS `inventory_variation_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_variation_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_variation_reason`
--

LOCK TABLES `inventory_variation_reason` WRITE;
/*!40000 ALTER TABLE `inventory_variation_reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_variation_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` char(5) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `store_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty_requested` smallint(6) DEFAULT '0',
  `qty_received` smallint(6) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tracking`
--

DROP TABLE IF EXISTS `order_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tracking`
--

LOCK TABLES `order_tracking` WRITE;
/*!40000 ALTER TABLE `order_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`,`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) NOT NULL,
  `barcode` char(13) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(100) DEFAULT '',
  `quantity` smallint(6) DEFAULT '0',
  `minimum` smallint(6) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `last_purchase_order` char(5) DEFAULT '',
  `last_purchase_date` date DEFAULT NULL,
  `last_purchase_price` decimal(10,2) DEFAULT '0.00',
  `last_sale_date` date DEFAULT NULL,
  `last_sale_price` decimal(10,2) DEFAULT '0.00',
  `price` decimal(10,2) DEFAULT '0.00',
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id_4` (`company_id`,`name`),
  KEY `company_id` (`company_id`,`code`),
  KEY `company_id_2` (`company_id`,`barcode`),
  KEY `company_id_3` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'0001','7790895641237','AQ NARANJA 1.5LT','',0,6,31,'',NULL,0.00,NULL,0.00,88.35,11,1,'2020-10-01 06:16:24',31,'2020-10-01 06:16:24',0),(11,'0002','7790895640483','AQ MANZANA 1.5LT','',0,3,31,'',NULL,0.00,NULL,0.00,88.35,11,1,'2020-10-01 06:18:31',31,'2020-10-01 06:18:31',0),(21,'0003','7790895003875','BONAQUA 1.5LT S/G','',0,6,31,'',NULL,0.00,NULL,0.00,60.30,11,1,'2020-10-01 06:23:16',31,'2020-10-01 06:23:16',0),(31,'0004','7790895641596','CEPITA NARANJA 200ml','',0,3,31,'',NULL,0.00,NULL,0.00,28.50,11,1,'2020-10-01 06:25:22',31,'2020-10-01 06:25:22',0),(41,'0005','7790895641794','CEPITA BOT 300ml','',0,3,31,'',NULL,0.00,NULL,0.00,38.00,11,1,'2020-10-01 06:26:24',31,'2020-10-01 06:26:24',0),(51,'0006','7790895009815','CEPITA HF NARANJA TENTACION 1LT','',0,3,31,'',NULL,0.00,NULL,0.00,72.80,11,1,'2020-10-01 06:42:36',31,'2020-10-01 18:42:47',31),(61,'0007','7790895009846','CEPITA HF DURAZNO TENTACION 1LT','',0,3,31,'',NULL,0.00,NULL,0.00,72.80,11,1,'2020-10-01 06:43:19',31,'2020-10-01 06:43:19',0),(71,'0008','7790895640469','AQ POMELO 500ml ','',0,3,31,'',NULL,0.00,NULL,0.00,48.20,11,1,'2020-10-01 06:45:10',31,'2020-10-01 06:45:10',0),(81,'0009','7790895003868','BONAQUA S/G 500ml ','',0,3,31,'',NULL,0.00,NULL,0.00,37.25,11,1,'2020-10-01 06:47:25',31,'2020-10-01 06:47:25',0),(91,'0010','7790895067532','COCA COLA S/A 500ml','',0,6,31,'',NULL,0.00,NULL,0.00,50.50,11,1,'2020-10-01 07:05:53',31,'2020-10-01 07:05:53',0),(101,'0011','7790895064142','SPRITE S/A 500ml','',0,6,31,'',NULL,0.00,NULL,0.00,50.50,11,1,'2020-10-01 07:08:47',31,'2020-10-01 07:08:47',0),(111,'0012','7790895000829','SPRITE 500ml','',0,6,31,'',NULL,0.00,NULL,0.00,50.50,11,1,'2020-10-01 07:09:42',31,'2020-10-01 07:09:42',0),(121,'0013','7790895640445','AQ PERA 500ml','',0,3,31,'',NULL,0.00,NULL,0.00,48.00,11,1,'2020-10-01 07:11:37',31,'2020-10-01 07:11:37',0),(131,'0014','7790895641541','CEPITA BOT DURAZNO 300ml','',0,3,31,'',NULL,0.00,NULL,0.00,38.25,11,1,'2020-10-01 07:12:45',31,'2020-10-01 07:12:45',0),(141,'0015','7790895642104','COCA COLA S/A LATA 220ml','',0,6,31,'',NULL,0.00,NULL,0.00,30.00,11,1,'2020-10-01 07:13:48',31,'2020-10-01 07:13:48',0),(151,'0016','7790895645730','AQ LIMONADA 0 LATA 310ml','',0,6,31,'',NULL,0.00,NULL,0.00,41.50,11,1,'2020-10-01 07:14:46',31,'2020-10-01 07:14:46',0),(161,'0017','7790895640841','COCA COLA S/A 310ml','',0,3,31,'',NULL,0.00,NULL,0.00,41.00,11,1,'2020-10-01 07:21:18',31,'2020-10-01 07:21:18',0),(171,'0018','7790895000218','COCA COLA RET 2l','',0,6,31,'',NULL,0.00,NULL,0.00,95.00,11,1,'2020-10-01 07:22:34',31,'2020-10-01 07:22:34',0),(181,'0019','7790895000225','SPRITE RET 2l','',0,6,31,'',NULL,0.00,NULL,0.00,95.00,11,1,'2020-10-01 07:23:08',31,'2020-10-01 07:23:08',0),(191,'0020','7790895000430','COCA COLA 1,5l','',0,3,31,'',NULL,0.00,NULL,0.00,92.00,11,1,'2020-10-01 07:24:46',31,'2020-10-01 07:24:46',0),(201,'0021','7790895000447','SPRITE 1,5ml','',0,3,31,'',NULL,0.00,NULL,0.00,88.00,11,1,'2020-10-01 07:26:54',31,'2020-10-01 07:26:54',0),(211,'0022','7790895002304','FANTA S/A 1,5l','',0,3,31,'',NULL,0.00,NULL,0.00,88.00,11,1,'2020-10-01 07:30:22',31,'2020-10-01 07:30:22',0),(221,'0023','7790895010088','SCHWP POMELO S/A 1,5l','',0,3,31,'',NULL,0.00,NULL,0.00,88.00,11,1,'2020-10-01 07:31:45',31,'2020-10-01 07:31:45',0),(231,'0024','7790895000997','COCA COLA 2,25','',0,3,31,'',NULL,0.00,NULL,0.00,140.00,11,1,'2020-10-01 07:38:55',31,'2020-10-01 07:38:55',0),(241,'0025','7790895001000','SPRITE 2,25l','',0,3,31,'',NULL,0.00,NULL,0.00,138.00,11,1,'2020-10-01 07:50:58',31,'2020-10-01 07:50:58',0),(251,'0026','7790895007347','SODA KIN 2,25','',0,3,31,'',NULL,0.00,NULL,0.00,62.00,11,1,'2020-10-01 07:51:44',31,'2020-10-01 07:51:44',0),(261,'0027','7790895006418','COCA COLA 3l','',0,3,31,'',NULL,0.00,NULL,0.00,150.00,11,1,'2020-10-01 07:53:30',31,'2020-10-01 07:53:30',0),(281,'0028','7790895000782','COCA COLA 500ml','',0,6,31,'',NULL,0.00,NULL,0.00,55.00,11,1,'2020-10-01 07:54:40',31,'2020-10-01 07:54:40',0),(291,'0029','7790895643835','ADES MANZANA 1l','',0,4,31,'',NULL,0.00,NULL,0.00,68.00,11,1,'2020-10-01 07:55:40',31,'2020-10-01 07:55:40',0),(301,'0030','7790895064333','CEPITA NARANJA 1l','',0,3,31,'',NULL,0.00,NULL,0.00,60.00,11,1,'2020-10-01 07:56:44',31,'2020-10-01 07:56:44',0),(311,'0031','7790895065217','CEPITA MULTIFRUTA 1l','',0,3,31,'',NULL,0.00,NULL,0.00,60.00,11,1,'2020-10-01 07:57:14',31,'2020-10-01 07:57:14',0),(321,'0032','1007084701235','MONSTER ENERGY GREEN  473ml','',0,3,31,'',NULL,0.00,NULL,0.00,95.00,11,1,'2020-10-01 07:58:25',31,'2020-10-01 07:58:25',0),(331,'0033','','COMBO ANDES COPA+4LATAS','',0,0,41,'',NULL,0.00,NULL,0.00,650.00,11,1,'2020-10-01 08:08:17',31,'2020-10-01 08:08:17',0),(341,'0034','7792799001032','NESTLE 6,30l','',0,4,31,'',NULL,0.00,NULL,0.00,180.00,11,1,'2020-10-01 08:09:56',31,'2020-10-01 08:09:56',0),(351,'0035','7790717153092','NOVEC.RAICES CABERNET SAVIGNON 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,220.00,11,1,'2020-10-01 08:11:13',31,'2020-10-01 20:24:56',31),(361,'0036','7790717153078','NOVEC.RAICES MALBEC 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,220.00,11,1,'2020-10-01 08:12:10',31,'2020-10-01 20:14:24',31),(371,'0037','7790717152019','NOVEC. CABERNET SAVIGNON 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,165.00,11,1,'2020-10-01 08:13:32',31,'2020-10-01 20:24:34',31),(381,'0038','7790717152354','NOVEC.CHARDONAY 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,165.00,11,1,'2020-10-01 08:17:56',31,'2020-10-01 08:17:56',0),(391,'0039','7790717152026','NOVEC.EXTRA BRUT 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,185.00,11,1,'2020-10-01 08:19:01',31,'2020-10-01 08:19:01',0),(401,'0040','7790717001195','NOVEC.EXTRA DULCE 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,195.00,11,1,'2020-10-01 08:19:54',31,'2020-10-01 08:19:54',0),(411,'0041','7792798005888','BRAHMA LATA 473ml','',0,12,11,'',NULL,0.00,NULL,0.00,50.00,11,1,'2020-10-01 08:27:31',31,'2020-10-01 08:27:31',0),(421,'0042','7792798012923','QUILMES LATA 473ml','',0,12,11,'',NULL,0.00,NULL,0.00,45.00,11,1,'2020-10-01 08:28:15',31,'2020-10-01 08:28:15',0),(431,'0043','7790717000778','CAPRICCIO FIORE ESPUMANTE D.NATURAL 750ml','',0,3,1,'',NULL,0.00,NULL,0.00,230.00,11,1,'2020-10-01 08:29:44',31,'2020-10-01 08:29:44',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'ADM','Administradores',1,'2020-06-23 23:17:52',1,'2020-06-23 23:17:52',0),(11,'SUP','Supervisores',1,'2020-06-23 23:18:21',1,'2020-06-23 23:18:21',0),(21,'USR','Usuarios',1,'2020-06-23 23:18:38',1,'2020-06-23 23:18:38',0);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` char(5) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `store_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` smallint(6) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

LOCK TABLES `sale_details` WRITE;
/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Local','Local','Juan Molina 1195','291 4472900','',11,1,'2020-09-01 10:26:10',1,'2020-09-01 10:26:10',0);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Puertas del Sur','Marcelo','Ruta 3 km 696, B8000 Bahía Blanca','291 6455125','vivianaquillito@hotmail.com',11,1,'2020-09-01 10:19:51',1,'2020-09-11 13:17:06',31),(11,'Coca Cola','Carlos Lagos','Ruta 229 Km S/n, Grunbein','291 4137296','mancinellibalanzas@yahoo.com.ar',11,1,'2020-09-01 10:20:25',1,'2020-09-07 18:14:46',31);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status_id` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Omar','omar.melendrez@gmail.com','$2b$10$QEhOifRUy2BMp2F6vOrUy.uWRPI3sweMFsqYMLnMNsmS06owZnioW',1,11,1,'2020-06-23 23:23:08',1,'2020-06-23 23:23:08',0),(11,'Cielo','mcielomelendrez@gmail.com','$2b$10$E6VhKakwAsOQNaHrcZa/ueWphCrK5q.ZpComrfZEcmo8Bj28BagyW',1,1,1,'2020-06-23 23:23:16',1,'2020-06-23 23:23:16',0),(21,'Ema73','emarengo73@gmail.com','$2b$10$pWvdlS0RQ87HsxyMULW3A.0Eb7jZ7jdT40p9ie0sRuXIstEWmPde2',1,11,1,'2020-06-23 23:23:34',1,'2020-06-23 23:23:34',0),(31,'Matias','matiasmancinelli1998@hotmail.com','$2b$10$G17HClYi/pZcX.5H7ihm9ugA6TxIhgNjw.nsqZ./QC9aTa5RKv4C6',1,11,1,'2020-06-23 23:23:53',1,'2020-06-23 23:23:53',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'heroku_68e91ae782abadb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-02  0:05:50
