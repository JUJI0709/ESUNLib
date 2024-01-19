CREATE DATABASE  IF NOT EXISTS `esunlib` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esunlib`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: esunlib
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `isbn` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `introduction` mediumtext,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('9789863127727','施威銘研究室','最強 AI 投資分析：打造自己的股市顧問機器人，股票趨勢分析×年報解讀×選股推薦×風險管理','在這數位資訊的創新時代, AI 與大型語言模型 LLM 已經徹底改變了投資業界的遊戲規則。過往需要仰賴投資團隊花費大量時間來解讀各種財務報表、進行分析的複雜工作, 現在只需要一個人、一台電腦就能完成。對於小散戶而言, AI 能幫助我們自動化分析, 挖掘出報表中隱藏的關鍵資訊, 成為對抗市場主力的重要武器！本書將帶您：'),('9789863127765','Magnus Ekman','跟 NVIDIA 學深度學習！從基本神經網路到 CNN‧RNN‧LSTM‧seq2seq‧Transformer‧GPT‧BERT...，紮穩機器視覺與大型語言模型 (LLM) 的建模基礎','近年來，在 NVIDIA (輝達) GPU、CUDA 技術的推波助瀾下，深度學習 (Deep Learning) 領域有著爆炸性的成長，例如最為人知的 ChatGPT 正是運用深度學習技術開發出來的當紅應用。');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bookinventory`
--

DROP TABLE IF EXISTS `bookinventory`;
/*!50001 DROP VIEW IF EXISTS `bookinventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookinventory` AS SELECT 
 1 AS `inventory_id`,
 1 AS `isbn`,
 1 AS `author`,
 1 AS `book_name`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrowing_record`
--

DROP TABLE IF EXISTS `borrowing_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowing_record` (
  `userId` char(16) NOT NULL,
  `inventoryId` int NOT NULL,
  `borrowingTime` datetime NOT NULL,
  `returnTime` datetime DEFAULT NULL,
  KEY `borrowing_idx` (`userId`,`inventoryId`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing_record`
--

LOCK TABLES `borrowing_record` WRITE;
/*!40000 ALTER TABLE `borrowing_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowing_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventoryId` int NOT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `storeTime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`inventoryId`),
  KEY `isbn_idx` (`ISBN`),
  CONSTRAINT `isbn` FOREIGN KEY (`ISBN`) REFERENCES `book` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'9789863127727','2024-01-19 20:42:36','可借閱'),(2,'9789863127765','2024-01-19 20:42:36','可借閱');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` char(16) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `phoneNumber` char(10) NOT NULL,
  `password` char(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `registeationTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `Phone_Number_UNIQUE` (`phoneNumber`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bookinventory`
--

/*!50001 DROP VIEW IF EXISTS `bookinventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `bookinventory` AS select `inventory`.`inventoryId` AS `inventory_id`,`inventory`.`ISBN` AS `isbn`,`book`.`author` AS `author`,`book`.`bookName` AS `book_name`,`inventory`.`status` AS `status` from (`inventory` join `book` on((`inventory`.`ISBN` = `book`.`isbn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-19 22:43:05
