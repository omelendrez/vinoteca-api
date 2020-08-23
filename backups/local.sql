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
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    '2020-08-22 10:14:40',
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
    'Omar Melendrez',
    'Alberdi 2678',
    '291 5754922',
    'omar.melendrez@gmail.com',
    1,
    '2020-07-02 00:00:00',
    1,
    '2020-08-10 19:08:16',
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `inventory`
--
LOCK TABLES `inventory` WRITE;

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */
;

INSERT INTO
  `inventory`
VALUES
  (1, 2, 1, 500, 1, '2020-08-06 20:13:51', 1),
(2, 2, 2, 200, 1, '2020-08-06 20:13:51', 1),
(3, 2, 3, 80, 1, '2020-08-06 20:13:51', 1),
(4, 2, 4, 600, 1, '2020-08-06 20:13:51', 1),
(8, 2, 5, 3000, 1, '2020-08-06 20:29:31', 1);

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
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`, `store_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `inventory_variation`
--
LOCK TABLES `inventory_variation` WRITE;

/*!40000 ALTER TABLE `inventory_variation` DISABLE KEYS */
;

INSERT INTO
  `inventory_variation`
VALUES
  (1, 2, 5, 3000, 1, 3, '', 1, '2020-08-06 20:29:31', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    3,
    '2020-07-26 01:28:22',
    1,
    '2020-08-06 20:13:02',
    1
  ),
(
    3,
    '00002',
    '2020-07-30',
    2,
    0.00,
    2,
    1,
    1,
    '2020-07-30 06:59:29',
    1,
    '2020-07-30 19:12:36',
    1
  ),
(
    4,
    '00003',
    '2020-07-30',
    1,
    0.00,
    2,
    1,
    1,
    '2020-07-30 07:45:56',
    1,
    '2020-07-30 07:45:56',
    0
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    500,
    500,
    65.00,
    1,
    '2020-07-26 01:28:36',
    1,
    '2020-08-06 20:13:14',
    1
  ),
(
    2,
    1,
    2,
    200,
    200,
    198.00,
    1,
    '2020-07-26 01:28:44',
    1,
    '2020-08-06 20:13:24',
    1
  ),
(
    3,
    1,
    3,
    80,
    80,
    1499.00,
    1,
    '2020-07-26 01:28:50',
    1,
    '2020-08-06 20:13:33',
    1
  ),
(
    4,
    1,
    4,
    600,
    600,
    60.00,
    1,
    '2020-07-26 01:28:59',
    1,
    '2020-08-06 20:13:47',
    1
  ),
(
    10,
    3,
    1,
    800,
    0,
    0.00,
    1,
    '2020-07-30 06:59:48',
    1,
    '2020-08-05 19:43:18',
    1
  ),
(
    11,
    3,
    2,
    500,
    0,
    0.00,
    1,
    '2020-07-30 07:01:00',
    1,
    '2020-07-30 19:34:30',
    1
  ),
(
    13,
    3,
    4,
    700,
    0,
    0.00,
    1,
    '2020-07-30 07:01:38',
    1,
    '2020-07-30 19:44:37',
    1
  ),
(
    14,
    4,
    1,
    400,
    0,
    0.00,
    1,
    '2020-07-30 07:46:09',
    1,
    '2020-07-30 19:46:24',
    1
  ),
(
    15,
    4,
    2,
    350,
    0,
    0.00,
    1,
    '2020-07-30 07:46:17',
    1,
    '2020-07-30 19:46:31',
    1
  ),
(
    16,
    3,
    5,
    10,
    0,
    0.00,
    1,
    '2020-08-22 10:16:49',
    1,
    '2020-08-22 10:16:49',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  (1, 1, '2020-08-06', 2, '2020-08-06 08:13:02', 1),
(2, 1, '2020-08-06', 3, '2020-08-06 20:13:51', 1);

/*!40000 ALTER TABLE `order_tracking` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `price`
--
DROP TABLE IF EXISTS `price`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `price` decimal(10, 2) DEFAULT '0.00',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`, `supplier_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `price`
--
LOCK TABLES `price` WRITE;

/*!40000 ALTER TABLE `price` DISABLE KEYS */
;

INSERT INTO
  `price`
VALUES
  (
    1,
    1,
    1,
    68.00,
    '2020-08-23 11:31:19',
    1,
    '2020-08-23 11:31:19',
    0
  ),
(
    2,
    1,
    2,
    64.50,
    '2020-08-23 11:31:32',
    1,
    '2020-08-23 11:31:32',
    0
  ),
(
    3,
    2,
    1,
    200.00,
    '2020-08-23 11:31:54',
    1,
    '2020-08-23 11:31:54',
    0
  ),
(
    4,
    2,
    2,
    210.00,
    '2020-08-23 11:32:04',
    1,
    '2020-08-23 11:32:04',
    0
  ),
(
    5,
    3,
    1,
    1510.00,
    '2020-08-23 11:32:34',
    1,
    '2020-08-23 11:32:34',
    0
  ),
(
    6,
    3,
    1,
    1499.00,
    '2020-08-23 11:32:44',
    1,
    '2020-08-23 11:32:44',
    0
  ),
(
    7,
    4,
    1,
    60.00,
    '2020-08-23 11:33:07',
    1,
    '2020-08-23 11:33:07',
    0
  ),
(
    8,
    4,
    2,
    62.00,
    '2020-08-23 11:33:13',
    1,
    '2020-08-23 11:33:13',
    0
  ),
(
    9,
    5,
    1,
    7020.00,
    '2020-08-23 11:33:49',
    1,
    '2020-08-23 11:33:49',
    0
  ),
(
    10,
    5,
    1,
    7100.00,
    '2020-08-23 11:33:54',
    1,
    '2020-08-23 11:33:54',
    0
  );

/*!40000 ALTER TABLE `price` ENABLE KEYS */
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
  `barcode` char(13) DEFAULT '',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    '1234',
    'Imperial Lata 650cc',
    '',
    1269,
    10,
    1,
    '00001',
    '2020-07-26',
    65.00,
    NULL,
    0.00,
    70.00,
    1,
    1,
    '2020-07-26 09:27:54',
    1,
    '2020-08-16 21:03:12',
    1
  ),
(
    2,
    '0002',
    '2345',
    'Luiggi Bosca 750cc',
    '',
    705,
    20,
    2,
    '00001',
    '2020-07-26',
    198.00,
    NULL,
    0.00,
    266.00,
    1,
    1,
    '2020-07-26 09:28:45',
    1,
    '2020-08-16 20:59:57',
    1
  ),
(
    3,
    '0003',
    '3456',
    'Black Label 750cc',
    '',
    280,
    10,
    3,
    '00001',
    '2020-07-26',
    1499.00,
    NULL,
    0.00,
    1685.00,
    1,
    1,
    '2020-07-26 09:28:57',
    1,
    '2020-08-16 21:00:11',
    1
  ),
(
    4,
    '0004',
    '4567',
    'Imperial Lata 550c',
    '',
    1939,
    0,
    1,
    '00001',
    '2020-07-26',
    60.00,
    NULL,
    0.00,
    1500.00,
    1,
    1,
    '2020-07-26 09:29:15',
    1,
    '2020-08-16 20:55:43',
    1
  ),
(
    5,
    '0005',
    '5678',
    'Jack Daniels 650cc',
    'Estamos agregando descripción',
    3100,
    7000,
    3,
    '',
    NULL,
    0.00,
    NULL,
    0.00,
    6999.00,
    1,
    1,
    '2020-07-30 07:50:08',
    1,
    '2020-07-30 19:50:41',
    1
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    'omar.melendrez@gmail.com',
    1,
    1,
    '2020-07-04 07:18:35',
    1,
    '2020-07-26 12:26:53',
    1
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

-- Dump completed on 2020-08-23 11:39:39