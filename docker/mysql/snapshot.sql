-- MySQL dump 10.16  Distrib 10.2.15-MariaDB, for Linux (x86_64)
--
-- Host: symlex-mysql    Database: web
-- ------------------------------------------------------
-- Server version	5.7.24

USE web;

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
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('20170205075928');
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(127) NOT NULL,
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `userPasswordResetToken` varchar(128) DEFAULT NULL,
  `userVerificationToken` varchar(128) DEFAULT NULL,
  `userFirstName` varchar(64) NOT NULL DEFAULT '',
  `userLastName` varchar(64) NOT NULL DEFAULT '',
  `userRole` varchar(64) NOT NULL DEFAULT 'user',
  `userNewsletter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userEmail` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@example.com','$6$5ygXjBO2gNbW$p1eaS7isBLD1JfN6PaQzrGKJHf9UGmUOBCZiqq3VnhDSPhdbIzOnu3kbKO2mcKEFiD11jFoPE5YSyvA7cYbbK1',NULL,NULL,'Admin','Example','admin',0,'2014-08-04 06:51:35','2014-08-04 06:51:35'),(2,'user@example.com','$6$5ygXjBO2gNbW$p1eaS7isBLD1JfN6PaQzrGKJHf9UGmUOBCZiqq3VnhDSPhdbIzOnu3kbKO2mcKEFiD11jFoPE5YSyvA7cYbbK1','4wai87E67cuDCe9','tkkqEUTj1P13ucm','User','Example','user',0,'2014-08-04 06:51:35','2014-08-04 06:51:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`web`@`%`*/ /*!50003 TRIGGER `trigger_users_update` AFTER UPDATE ON `users`
            FOR EACH ROW
            BEGIN
                INSERT INTO `usersArchive` 
                (userId, userEmail, userPassword, userPasswordResetToken, userVerificationToken, userFirstName, userLastName, userRole, userNewsletter, created, updated) 
                VALUES
                (OLD.userId, OLD.userEmail, OLD.userPassword, OLD.userPasswordResetToken, OLD.userVerificationToken, OLD.userFirstName, OLD.userLastName, OLD.userRole, OLD.userNewsletter, OLD.created, OLD.updated);
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`web`@`%`*/ /*!50003 TRIGGER `trigger_users_delete` AFTER DELETE ON `users`
            FOR EACH ROW
            BEGIN
                INSERT INTO `usersArchive` 
                (userId, userEmail, userPassword, userPasswordResetToken, userVerificationToken, userFirstName, userLastName, userRole, userNewsletter, created, updated) 
                VALUES
                (OLD.userId, OLD.userEmail, OLD.userPassword, OLD.userPasswordResetToken, OLD.userVerificationToken, OLD.userFirstName, OLD.userLastName, OLD.userRole, OLD.userNewsletter, OLD.created, OLD.updated);
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usersArchive`
--

DROP TABLE IF EXISTS `usersArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersArchive` (
  `archiveId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `userEmail` varchar(127) NOT NULL,
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `userPasswordResetToken` varchar(128) DEFAULT NULL,
  `userVerificationToken` varchar(128) DEFAULT NULL,
  `userFirstName` varchar(64) NOT NULL DEFAULT '',
  `userLastName` varchar(64) NOT NULL DEFAULT '',
  `userRole` varchar(64) NOT NULL DEFAULT 'user',
  `userNewsletter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`archiveId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersArchive`
--

LOCK TABLES `usersArchive` WRITE;
/*!40000 ALTER TABLE `usersArchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersArchive` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-02 21:18:37
