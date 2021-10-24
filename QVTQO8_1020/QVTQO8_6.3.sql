-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbgyak
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dbgyak`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbgyak` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `dbgyak`;

--
-- Table structure for table `alkatresz`
--

DROP TABLE IF EXISTS `alkatresz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alkatresz` (
  `akod` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  PRIMARY KEY (`akod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alkatresz`
--

LOCK TABLES `alkatresz` WRITE;
/*!40000 ALTER TABLE `alkatresz` DISABLE KEYS */;
/*!40000 ALTER TABLE `alkatresz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egysegek`
--

DROP TABLE IF EXISTS `egysegek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egysegek` (
  `aru` int(11) NOT NULL,
  `db` int(11) NOT NULL,
  KEY `aru` (`aru`),
  CONSTRAINT `egysegek_ibfk_1` FOREIGN KEY (`aru`) REFERENCES `termek` (`tkod`),
  CONSTRAINT `db_not_negative` CHECK (`db` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egysegek`
--

LOCK TABLES `egysegek` WRITE;
/*!40000 ALTER TABLE `egysegek` DISABLE KEYS */;
/*!40000 ALTER TABLE `egysegek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyarto`
--

DROP TABLE IF EXISTS `gyarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyarto` (
  `adoszam` int(11) NOT NULL,
  `nev` varchar(30) DEFAULT NULL,
  `telephely` varchar(20) DEFAULT NULL,
  `irsz` varchar(4) DEFAULT NULL,
  `varos` varchar(40) DEFAULT NULL,
  `utca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`adoszam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyarto`
--

LOCK TABLES `gyarto` WRITE;
/*!40000 ALTER TABLE `gyarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gyarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komponens`
--

DROP TABLE IF EXISTS `komponens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komponens` (
  `termek` int(11) NOT NULL,
  `alkatresz` int(11) NOT NULL,
  KEY `termek` (`termek`),
  KEY `alkatresz` (`alkatresz`),
  CONSTRAINT `komponens_ibfk_1` FOREIGN KEY (`termek`) REFERENCES `termek` (`tkod`),
  CONSTRAINT `komponens_ibfk_2` FOREIGN KEY (`alkatresz`) REFERENCES `alkatresz` (`akod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komponens`
--

LOCK TABLES `komponens` WRITE;
/*!40000 ALTER TABLE `komponens` DISABLE KEYS */;
/*!40000 ALTER TABLE `komponens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termek`
--

DROP TABLE IF EXISTS `termek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termek` (
  `tkod` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `ear` int(11) DEFAULT NULL,
  `gyarto` int(11) NOT NULL,
  PRIMARY KEY (`tkod`),
  KEY `gyarto` (`gyarto`),
  CONSTRAINT `termek_ibfk_1` FOREIGN KEY (`gyarto`) REFERENCES `gyarto` (`adoszam`),
  CONSTRAINT `ear_not_negative` CHECK (`ear` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termek`
--

LOCK TABLES `termek` WRITE;
/*!40000 ALTER TABLE `termek` DISABLE KEYS */;
/*!40000 ALTER TABLE `termek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-24 23:32:56
