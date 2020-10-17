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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'001','Vinos',11,1,'2020-09-01 10:05:33',1,'2020-09-01 10:05:33',0),(11,'002','Cervezas',11,1,'2020-09-01 10:05:42',1,'2020-09-01 10:05:42',0),(21,'003','Aperitivos',11,1,'2020-09-01 10:05:57',1,'2020-09-01 10:05:57',0),(31,'004','Gaseosas',11,1,'2020-09-01 10:06:04',1,'2020-09-01 10:06:04',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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

-- Dump completed on 2020-10-01  0:05:50
