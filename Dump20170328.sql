CREATE DATABASE  IF NOT EXISTS `eventsite` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `eventsite`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eventsite
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminaffiliated`
--

DROP TABLE IF EXISTS `adminaffiliated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminaffiliated` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `adminaffiliated_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminaffiliated`
--

LOCK TABLES `adminaffiliated` WRITE;
/*!40000 ALTER TABLE `adminaffiliated` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminaffiliated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincreateprivate`
--

DROP TABLE IF EXISTS `admincreateprivate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admincreateprivate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `email` (`email`),
  CONSTRAINT `admincreateprivate_ibfk_1` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`),
  CONSTRAINT `admincreateprivate_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`),
  CONSTRAINT `admincreateprivate_ibfk_3` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincreateprivate`
--

LOCK TABLES `admincreateprivate` WRITE;
/*!40000 ALTER TABLE `admincreateprivate` DISABLE KEYS */;
/*!40000 ALTER TABLE `admincreateprivate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincreatepublic`
--

DROP TABLE IF EXISTS `admincreatepublic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admincreatepublic` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `email` (`email`),
  CONSTRAINT `admincreatepublic_ibfk_1` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`),
  CONSTRAINT `admincreatepublic_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`),
  CONSTRAINT `admincreatepublic_ibfk_3` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincreatepublic`
--

LOCK TABLES `admincreatepublic` WRITE;
/*!40000 ALTER TABLE `admincreatepublic` DISABLE KEYS */;
/*!40000 ALTER TABLE `admincreatepublic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincreatesevent`
--

DROP TABLE IF EXISTS `admincreatesevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admincreatesevent` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` enum('Sports','Food','Fundraiser','Tech Talks','Tailgate','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('Public','Private','RSO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateNtime` datetime DEFAULT NULL,
  `contactEmail` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locationName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`,`locationName`),
  KEY `email` (`email`),
  KEY `locationName_idx` (`locationName`),
  CONSTRAINT `admincreatesevent_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`),
  CONSTRAINT `locationName` FOREIGN KEY (`locationName`) REFERENCES `eventlocation` (`locationName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincreatesevent`
--

LOCK TABLES `admincreatesevent` WRITE;
/*!40000 ALTER TABLE `admincreatesevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `admincreatesevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventlocation`
--

DROP TABLE IF EXISTS `eventlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventlocation` (
  `locationName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`locationName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlocation`
--

LOCK TABLES `eventlocation` WRITE;
/*!40000 ALTER TABLE `eventlocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rso`
--

DROP TABLE IF EXISTS `rso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rso` (
  `rsoNAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rsoNAME`),
  KEY `email` (`email`),
  CONSTRAINT `rso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rso`
--

LOCK TABLES `rso` WRITE;
/*!40000 ALTER TABLE `rso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsocreatedrsoevent`
--

DROP TABLE IF EXISTS `rsocreatedrsoevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rsocreatedrsoevent` (
  `rsoName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rsoName`),
  CONSTRAINT `rsocreatedrsoevent_ibfk_1` FOREIGN KEY (`rsoName`) REFERENCES `rso` (`rsoNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsocreatedrsoevent`
--

LOCK TABLES `rsocreatedrsoevent` WRITE;
/*!40000 ALTER TABLE `rsocreatedrsoevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rsocreatedrsoevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcomments`
--

DROP TABLE IF EXISTS `studentcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentcomments` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email`,`name`),
  KEY `name` (`name`),
  CONSTRAINT `studentcomments_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`),
  CONSTRAINT `studentcomments_ibfk_2` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcomments`
--

LOCK TABLES `studentcomments` WRITE;
/*!40000 ALTER TABLE `studentcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentjoinsrso`
--

DROP TABLE IF EXISTS `studentjoinsrso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentjoinsrso` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `studentjoinsrso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentjoinsrso`
--

LOCK TABLES `studentjoinsrso` WRITE;
/*!40000 ALTER TABLE `studentjoinsrso` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentjoinsrso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentmakesrso`
--

DROP TABLE IF EXISTS `studentmakesrso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentmakesrso` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `studentmakesrso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentmakesrso`
--

LOCK TABLES `studentmakesrso` WRITE;
/*!40000 ALTER TABLE `studentmakesrso` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentmakesrso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin`
--

DROP TABLE IF EXISTS `superadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `superadmin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin`
--

LOCK TABLES `superadmin` WRITE;
/*!40000 ALTER TABLE `superadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmincreate`
--

DROP TABLE IF EXISTS `superadmincreate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmincreate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numStudents` int(11) DEFAULT NULL,
  `type` enum('Public','Private') COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `email` (`email`),
  CONSTRAINT `superadmincreate_ibfk_1` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmincreate`
--

LOCK TABLES `superadmincreate` WRITE;
/*!40000 ALTER TABLE `superadmincreate` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmincreate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-28 18:24:00
