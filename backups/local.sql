-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vinoteca_db
-- ------------------------------------------------------
-- Server version	8.0.21
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!50503 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `category`
--
DROP TABLE IF EXISTS `category`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `code`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `category`
--
LOCK TABLES `category` WRITE;

/*!40000 ALTER TABLE `category` DISABLE KEYS */
;

INSERT INTO
  `category`
VALUES
  (
    1,
    '001',
    'Cervezas',
    1,
    1,
    '2020-07-26 09:27:07',
    1,
    '2020-07-26 09:52:03',
    1
  ),
(
    2,
    '002',
    'Vinos',
    1,
    1,
    '2020-07-26 09:27:14',
    1,
    '2020-07-26 09:27:14',
    0
  ),
(
    3,
    '003',
    'Whisky',
    1,
    1,
    '2020-07-26 09:27:24',
    1,
    '2020-07-26 09:27:24',
    0
  );

/*!40000 ALTER TABLE `category` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `company`
--
DROP TABLE IF EXISTS `company`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `company`
--
LOCK TABLES `company` WRITE;

/*!40000 ALTER TABLE `company` DISABLE KEYS */
;

INSERT INTO
  `company`
VALUES
  (
    1,
    'SoftDev',
    'Omar',
    'Alberdi 2678',
    '2915754922',
    'omar.melendrez@gmail.com',
    1,
    '2020-07-02 00:00:00',
    1,
    '2020-07-02 07:23:56',
    1
  );

/*!40000 ALTER TABLE `company` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `inventory`
--
DROP TABLE IF EXISTS `inventory`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '0',
  `company_id` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `store_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `inventory`
--
LOCK TABLES `inventory` WRITE;

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */
;

/*!40000 ALTER TABLE `inventory` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `inventory_variation`
--
DROP TABLE IF EXISTS `inventory_variation`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `inventory_variation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '0',
  `variation_type` tinyint NOT NULL,
  `variation_reason_id` int NOT NULL,
  `comments` varchar(100) DEFAULT '',
  `company_id` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `store_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `inventory_variation`
--
LOCK TABLES `inventory_variation` WRITE;

/*!40000 ALTER TABLE `inventory_variation` DISABLE KEYS */
;

/*!40000 ALTER TABLE `inventory_variation` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `inventory_variation_reason`
--
DROP TABLE IF EXISTS `inventory_variation_reason`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `inventory_variation_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `code`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `inventory_variation_reason`
--
LOCK TABLES `inventory_variation_reason` WRITE;

/*!40000 ALTER TABLE `inventory_variation_reason` DISABLE KEYS */
;

INSERT INTO
  `inventory_variation_reason`
VALUES
  (
    3,
    '01',
    'Recuento',
    1,
    1,
    '2020-07-04 03:46:30',
    1,
    '2020-07-12 21:08:38',
    1
  ),
(
    5,
    '02',
    'Regalos',
    1,
    1,
    '2020-07-04 07:19:12',
    1,
    '2020-07-04 07:19:12',
    0
  ),
(
    6,
    '03',
    'Ventas',
    1,
    1,
    '2020-07-04 07:19:25',
    1,
    '2020-07-04 08:17:03',
    1
  );

/*!40000 ALTER TABLE `inventory_variation_reason` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `order`
--
DROP TABLE IF EXISTS `order`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` char(5) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` int NOT NULL,
  `amount` decimal(10, 2) DEFAULT '0.00',
  `store_id` int NOT NULL,
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `number`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `order`
--
LOCK TABLES `order` WRITE;

/*!40000 ALTER TABLE `order` DISABLE KEYS */
;

INSERT INTO
  `order`
VALUES
  (
    1,
    '00001',
    '2020-07-26',
    1,
    0.00,
    2,
    1,
    2,
    '2020-07-26 09:30:52',
    1,
    '2020-07-26 09:53:25',
    1
  );

/*!40000 ALTER TABLE `order` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `order_details`
--
DROP TABLE IF EXISTS `order_details`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty_requested` smallint DEFAULT '0',
  `qty_received` smallint DEFAULT '0',
  `price` decimal(10, 2) DEFAULT '0.00',
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `order_details`
--
LOCK TABLES `order_details` WRITE;

/*!40000 ALTER TABLE `order_details` DISABLE KEYS */
;

INSERT INTO
  `order_details`
VALUES
  (
    1,
    1,
    1,
    200,
    200,
    100.00,
    1,
    '2020-07-26 09:31:08',
    1,
    '2020-07-26 09:51:40',
    1
  ),
(
    2,
    1,
    2,
    80,
    80,
    200.00,
    1,
    '2020-07-26 09:31:17',
    1,
    '2020-07-26 09:52:53',
    1
  ),
(
    3,
    1,
    3,
    40,
    40,
    350.00,
    1,
    '2020-07-26 09:31:24',
    1,
    '2020-07-26 09:53:14',
    1
  ),
(
    4,
    1,
    4,
    200,
    190,
    120.00,
    1,
    '2020-07-26 09:31:31',
    1,
    '2020-07-26 09:31:31',
    0
  );

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `order_tracking`
--
DROP TABLE IF EXISTS `order_tracking`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `order_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `date` date NOT NULL,
  `status_id` tinyint NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `order_tracking`
--
LOCK TABLES `order_tracking` WRITE;

/*!40000 ALTER TABLE `order_tracking` DISABLE KEYS */
;

INSERT INTO
  `order_tracking`
VALUES
  (1, 1, '2020-07-26', 2, '2020-07-26 09:53:25', 1);

/*!40000 ALTER TABLE `order_tracking` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `product`
--
DROP TABLE IF EXISTS `product`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` char(4) NOT NULL,
  `barcode` char(13) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(100) DEFAULT '',
  `quantity` smallint DEFAULT '0',
  `minimum` smallint DEFAULT '0',
  `category_id` int NOT NULL,
  `last_purchase_order` char(5) DEFAULT '',
  `last_purchase_date` date DEFAULT NULL,
  `last_purchase_price` decimal(10, 2) DEFAULT '0.00',
  `last_sale_date` date DEFAULT NULL,
  `last_sale_price` decimal(10, 2) DEFAULT '0.00',
  `price` decimal(10, 2) DEFAULT '0.00',
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `code`),
  KEY `company_id_2` (`company_id`, `barcode`),
  KEY `company_id_3` (`company_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `product`
--
LOCK TABLES `product` WRITE;

/*!40000 ALTER TABLE `product` DISABLE KEYS */
;

INSERT INTO
  `product`
VALUES
  (
    1,
    '0001',
    '',
    'Quilmes ',
    'Lata 650cc',
    0,
    0,
    1,
    '',
    NULL,
    0.00,
    NULL,
    0.00,
    0.00,
    1,
    1,
    '2020-07-26 09:27:54',
    1,
    '2020-07-26 09:35:04',
    1
  ),
(
    2,
    '0002',
    '',
    'Santa Elena Cabernet Sauvignon ',
    '750cc',
    0,
    0,
    2,
    '',
    NULL,
    0.00,
    NULL,
    0.00,
    0.00,
    1,
    1,
    '2020-07-26 09:28:45',
    1,
    '2020-07-26 09:28:45',
    0
  ),
(
    3,
    '0003',
    '',
    'Red Label',
    '750cc',
    0,
    0,
    3,
    '',
    NULL,
    0.00,
    NULL,
    0.00,
    0.00,
    1,
    1,
    '2020-07-26 09:28:57',
    1,
    '2020-07-26 09:28:57',
    0
  ),
(
    4,
    '0004',
    '',
    'Imperial',
    'Lata 550c',
    0,
    0,
    1,
    '',
    NULL,
    0.00,
    NULL,
    0.00,
    0.00,
    1,
    1,
    '2020-07-26 09:29:15',
    1,
    '2020-07-26 09:29:15',
    0
  );

/*!40000 ALTER TABLE `product` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `profile`
--
DROP TABLE IF EXISTS `profile`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `profile`
--
LOCK TABLES `profile` WRITE;

/*!40000 ALTER TABLE `profile` DISABLE KEYS */
;

INSERT INTO
  `profile`
VALUES
  (
    1,
    'ADM',
    'Administradores',
    1,
    '2020-07-02 00:00:00',
    1,
    '2020-07-02 00:00:00',
    0
  ),
(
    2,
    'SUP',
    'Supervisores',
    1,
    '2020-07-02 00:00:00',
    1,
    '2020-07-02 00:00:00',
    0
  ),
(
    3,
    'USR',
    'Usuarios',
    1,
    '2020-07-02 00:00:00',
    1,
    '2020-07-02 00:00:00',
    0
  );

/*!40000 ALTER TABLE `profile` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `store`
--
DROP TABLE IF EXISTS `store`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `store`
--
LOCK TABLES `store` WRITE;

/*!40000 ALTER TABLE `store` DISABLE KEYS */
;

INSERT INTO
  `store`
VALUES
  (
    1,
    'Depósito Alem',
    'Virginia Perez',
    'Alem y Rodriguez',
    '2915465456',
    'deposito.alem@gmail.com',
    1,
    1,
    '2020-06-30 21:57:12',
    1,
    '2020-07-09 16:54:31',
    1
  ),
(
    2,
    'Depósito Principal',
    'Gervasio',
    'Juan Molina y Avellaneda',
    '2915465858',
    'gperez@hotmail.com',
    1,
    1,
    '2020-06-30 22:30:41',
    1,
    '2020-07-04 03:39:32',
    1
  ),
(
    4,
    'Depósito Noroeste',
    'Pepe',
    'Holdich y Pampa Central',
    '2915467878',
    'pepe@gmail.com',
    1,
    1,
    '2020-07-04 03:35:47',
    1,
    '2020-07-04 03:38:40',
    1
  );

/*!40000 ALTER TABLE `store` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `supplier`
--
DROP TABLE IF EXISTS `supplier`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `company_id` int NOT NULL,
  `status_id` tinyint DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `supplier`
--
LOCK TABLES `supplier` WRITE;

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */
;

INSERT INTO
  `supplier`
VALUES
  (
    1,
    'Martinez Fachi',
    'Jorge Martinez Fachi',
    'Yapeyú 2525',
    '2915464656',
    'omar.melendrez@gmail.com',
    1,
    1,
    '2020-06-30 21:56:24',
    1,
    '2020-07-16 19:20:43',
    1
  ),
(
    2,
    'Coca Cola',
    'Jesús',
    'Ruta 229 Grunbein',
    '2916565656',
    'jesus@cocacola.com',
    1,
    1,
    '2020-07-04 07:18:35',
    1,
    '2020-07-04 07:18:35',
    0
  );

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Dumping routines for database 'vinoteca_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2020-07-26  9:55:53