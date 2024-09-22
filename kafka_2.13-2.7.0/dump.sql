-- MySQL dump 10.13  Distrib 8.3.0, for macos12.6 (arm64)
--
-- Host: localhost    Database: 배달
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_name` varchar(50) DEFAULT NULL,
  `request` varchar(50) DEFAULT NULL,
  `area_password` varchar(50) DEFAULT NULL,
  `instruction` varchar(50) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`address_id`,`user_id`),
  KEY `FK_user_TO_address_1` (`user_id`),
  CONSTRAINT `FK_user_TO_address_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'광진구',NULL,NULL,NULL,11,11,'active','2024-05-07 07:39:07','2024-05-07 07:39:07'),(2,1,'광진구123',NULL,NULL,NULL,11,11,'active','2024-05-07 07:40:59','2024-05-07 07:40:59'),(3,1,'광진구12345',NULL,NULL,NULL,11,11,'active','2024-05-07 07:41:07','2024-05-07 07:41:07');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `order_quantity` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'일식','active','2024-05-07 09:36:58','2024-05-07 09:36:58',0),(2,'고기•구이','active','2024-05-07 10:21:35','2024-05-07 10:21:35',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `store_id` int NOT NULL,
  `menu_name` varchar(40) NOT NULL,
  `price` int NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`menu_id`,`store_id`),
  KEY `FK_store_TO_menu_1` (`store_id`),
  CONSTRAINT `FK_store_TO_menu_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'왕돈까스',10000,'active','2024-05-07 09:42:37','2024-05-07 09:42:37'),(2,1,'치즈돈까스',12000,'active','2024-05-07 09:49:28','2024-05-07 09:49:28'),(3,2,'맛있는 돈까스',10000,'active','2024-05-07 09:51:31','2024-05-07 09:51:31');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `option_id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `fk_menu_id` (`menu_id`),
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'양많이',1000,1),(2,'양많이',1000,2);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menu`
--

DROP TABLE IF EXISTS `order_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_menu` (
  `option_menu_id` int NOT NULL,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `option_id` int NOT NULL,
  PRIMARY KEY (`option_menu_id`,`order_id`,`menu_id`),
  KEY `FK_order_TO_order_menu_1` (`order_id`),
  KEY `FK_menu_TO_order_menu_1` (`menu_id`),
  KEY `order_menu_FK` (`option_id`),
  CONSTRAINT `FK_menu_TO_order_menu_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `FK_order_TO_order_menu_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_menu_FK` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu`
--

LOCK TABLES `order_menu` WRITE;
/*!40000 ALTER TABLE `order_menu` DISABLE KEYS */;
INSERT INTO `order_menu` VALUES (1,1,1,10000,10,1),(1,2,2,20000,50,2);
/*!40000 ALTER TABLE `order_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` int NOT NULL,
  `request` varchar(40) DEFAULT NULL,
  `transport` varchar(40) NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`order_id`,`user_id`,`store_id`),
  KEY `FK_user_TO_order_1` (`user_id`),
  KEY `FK_store_TO_order_1` (`store_id`),
  CONSTRAINT `FK_store_TO_order_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `FK_user_TO_order_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,100000,NULL,'car','active','2024-05-07 10:04:02','2024-05-07 10:04:02'),(2,1,1,100000,NULL,'car','active','2024-05-07 10:04:02','2024-05-07 10:04:02'),(3,1,2,100000,NULL,'car','active','2024-05-07 10:04:02','2024-05-07 10:04:02'),(4,1,7,100000,NULL,'car','active','2024-05-07 10:26:43','2024-05-07 10:26:43'),(5,1,6,100000,NULL,'car','active','2024-05-07 10:35:53','2024-05-07 10:35:53'),(6,1,8,100000,NULL,'car','active','2024-05-07 10:36:01','2024-05-07 10:36:01'),(9,1,9,100000,NULL,'car','active','2024-05-07 10:36:09','2024-05-07 10:36:09'),(10,1,9,100000,NULL,'car','active','2024-05-07 10:36:30','2024-05-07 10:36:30'),(11,1,10,100000,NULL,'car','active','2024-05-07 10:36:35','2024-05-07 10:36:35');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL,
  `store_name` varchar(40) NOT NULL,
  `address_name` varchar(40) NOT NULL,
  `working_time` varchar(100) NOT NULL,
  `holiday` varchar(100) NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `min_price` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `store_FK` (`category_id`),
  CONSTRAINT `store_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'왕가네 돈까스','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 09:34:28','2024-05-07 09:34:28',10000,1),(2,'돈조은날','광진구 긴고랑로','화 20 ~ 21','수요일','active','2024-05-07 09:50:16','2024-05-07 09:50:16',9000,1),(3,'돈까스는 왕가네','광진구 긴고랑로','수 20 ~ 21','수요일','active','2024-05-07 09:50:42','2024-05-07 09:50:42',10000,1),(4,'꼬기1','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',9000,2),(5,'꼬기2','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',10000,2),(6,'꼬기3','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',11000,2),(7,'꼬기4','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',12000,2),(8,'꼬기5','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',13000,2),(9,'꼬기6','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',14000,2),(10,'꼬기7','광진구 긴고랑로','화 20 ~ 21','화요일','active','2024-05-07 10:25:24','2024-05-07 10:25:24',15000,2);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `phone_number` int NOT NULL,
  `nickname` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `profile_image` text,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1064145920,'kamothi','김광일','rhkddlf7911@naver.com','주소','active','2024-05-07 07:35:35','2024-05-07 07:35:35');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 15:59:21
