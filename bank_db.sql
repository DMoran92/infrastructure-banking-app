-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `CountryId` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  `Currency` char(3) NOT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Rep. of Ireland','EUR'),(2,'United Kingdom','GBP'),(3,'United States','USD'),(4,'France','EUR'),(5,'Germany','EUR'),(6,'Austria','EUR'),(7,'Belgium','EUR'),(8,'Finland','EUR'),(9,'Italy','EUR'),(10,'Netherlands','EUR'),(11,'Portugal','EUR'),(12,'Spain','EUR'),(13,'Australia','AUD'),(14,'Canada','CAD'),(15,'Poland','PLN');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerId` int unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `CountryId` int NOT NULL,
  `Username` varchar(10) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `AddrLine1` varchar(255) NOT NULL,
  `AddrLine2` varchar(255) NOT NULL,
  `TownCity` varchar(50) NOT NULL,
  `CountyState` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `idType` varchar(50) NOT NULL,
  `idNumber` varchar(50) NOT NULL,
  `Role` varchar(255) DEFAULT 'ROSE_USER',
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (CustomerId, Username, Password, Role) VALUES (0, 'admin', '$2a$10$evhnc8S226./hNRgNa4P8O4g57IxuxjB4ZkwyyGRbxXZYwuFgHto2', 'ROLE_ADMIN');

INSERT INTO `customer` VALUES 
(1,'Joe','Bloggs','joebloggsbog@onmail.com',851234567,1,'1111','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','123 Fake Street','Townsville','Galway','Co. Galway','03/03/2000','Passport','DV2032SDA','ROLE_USER'),
(2,'John','Smith','johnsmithbog@onmail.com',879876543,3,'2222','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','21 Foxfield ','Raheny','Dublin','Ireland','04/12/2003','NationalID','DSAD21231','ROLE_USER');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountId` int unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int unsigned DEFAULT NULL,
  `AccountType` varchar(30) NOT NULL,
  `Balance` double DEFAULT NULL,
  `IBAN` varchar(22) DEFAULT NULL,
  `Currency` VARCHAR(3) DEFAULT 'EUR',
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES 
(1,1,'Current',13980,'IE01BOGY91332200000001','EUR'),
(2,2,'Current',1000,'IE08BOGY91332200000002','EUR');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionId` int unsigned NOT NULL AUTO_INCREMENT,
  `AccountId` int unsigned DEFAULT NULL,
  `RecipientName` varchar(50) DEFAULT NULL,
  `RecipientIBAN` varchar(22) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `SenderIBAN` varchar(22) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `SenderName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

/*LOCK TABLES `transaction` WRITE; */
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/* TransactionId, accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName */
DELETE FROM TRANSACTION WHERE ACCOUNTID IN (1,2);

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-01-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-02-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-03-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-04-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-05-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-06-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-07-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',95,'2024-05-11 09:41:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',97,'2024-01-25 14:28:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',13,'2024-06-01 11:34:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',18,'2024-02-07 11:44:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',89,'2024-04-07 07:15:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',127,'2024-01-16 12:15:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',10,'2024-01-13 21:48:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',49,'2024-07-13 21:50:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',96,'2024-01-28 07:57:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',96,'2024-01-28 07:57:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',138,'2024-07-08 14:59:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',72,'2024-02-26 01:50:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',109,'2024-02-12 01:42:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',53,'2024-07-19 18:06:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',53,'2024-05-23 01:06:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',146,'2024-05-09 03:27:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',146,'2024-05-09 03:27:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',56,'2024-01-02 05:40:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',35,'2024-03-18 16:09:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',130,'2024-06-12 20:57:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',132,'2024-01-27 13:49:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',83,'2024-01-18 12:53:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',94,'2024-06-03 09:16:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',100,'2024-05-21 04:10:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',86,'2024-06-13 18:17:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',127,'2024-04-16 07:36:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',1,'2024-05-27 16:48:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',1,'2024-05-27 16:48:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',86,'2024-03-26 13:20:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',59,'2024-07-16 20:02:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',49,'2024-04-02 09:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',68,'2024-06-14 09:01:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',17,'2024-04-08 07:22:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',136,'2024-07-11 17:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',124,'2024-04-11 09:22:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',139,'2024-02-04 15:39:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',115,'2024-04-24 04:22:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',112,'2024-01-18 03:41:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',7,'2024-07-05 17:28:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',99,'2024-03-08 04:07:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',2,'2024-01-23 08:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',127,'2024-01-27 07:06:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',28,'2024-02-12 17:32:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',73,'2024-04-20 22:55:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',9,'2024-07-13 11:50:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',34,'2024-05-13 10:07:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',31,'2024-07-20 02:57:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',139,'2024-02-07 23:51:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',55,'2024-04-01 14:36:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',95,'2024-04-13 05:46:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',57,'2024-06-05 05:55:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',57,'2024-06-05 05:55:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',6,'2024-02-20 01:13:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',6,'2024-02-20 01:13:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',103,'2024-03-15 20:27:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',43,'2024-03-02 19:33:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',131,'2024-05-07 16:07:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',32,'2024-05-28 12:49:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',143,'2024-04-20 07:49:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',113,'2024-05-21 18:09:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',97,'2024-04-22 19:26:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',100,'2024-02-02 15:22:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',31,'2024-05-04 23:08:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',130,'2024-03-24 17:03:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',60,'2024-04-13 11:16:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',58,'2024-03-15 21:01:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',48,'2024-06-08 02:14:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',11,'2024-02-27 03:01:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',18,'2024-03-18 12:52:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',54,'2024-07-10 21:51:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',72,'2024-03-23 08:24:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',41,'2024-04-06 18:23:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',10,'2024-05-15 18:51:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',114,'2024-01-06 10:25:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',114,'2024-01-06 10:25:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',104,'2024-01-18 09:22:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',74,'2024-05-24 18:29:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',132,'2024-05-12 19:24:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',96,'2024-05-16 07:26:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',50,'2024-04-28 01:28:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',79,'2024-04-12 23:12:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',3,'2024-07-02 03:17:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',21,'2024-05-17 10:16:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',77,'2024-04-18 21:45:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',130,'2024-03-25 11:22:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',80,'2024-02-12 03:58:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',80,'2024-02-12 03:58:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',101,'2024-04-26 19:21:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',12,'2024-01-12 19:31:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',57,'2024-07-10 10:43:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',51,'2024-02-16 12:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',100,'2024-01-01 14:58:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',135,'2024-03-20 03:02:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',85,'2024-02-28 06:39:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',4,'2024-05-01 10:44:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',72,'2024-05-02 14:29:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',13,'2024-06-28 17:42:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',115,'2024-06-10 07:49:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',95,'2024-03-07 12:55:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',148,'2024-02-18 19:07:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',143,'2024-03-10 19:02:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',94,'2024-01-24 22:27:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',87,'2024-05-28 10:07:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',147,'2024-01-09 18:01:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',43,'2024-01-03 20:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',66,'2024-05-21 08:35:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',31,'2024-03-26 05:17:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',35,'2024-02-09 22:33:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',12,'2024-04-24 13:47:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',51,'2024-01-11 09:21:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',6,'2024-06-16 19:25:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',38,'2024-01-22 11:06:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',63,'2024-07-14 11:51:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',39,'2024-06-08 20:16:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',81,'2024-05-06 11:30:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',57,'2024-01-21 07:20:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',117,'2024-02-03 10:43:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',59,'2024-05-08 03:03:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',63,'2024-03-17 07:21:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',5,'2024-06-04 15:58:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',39,'2024-03-11 20:41:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',120,'2024-03-16 04:38:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',113,'2024-04-19 15:50:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',84,'2024-01-06 09:57:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',71,'2024-03-10 12:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',150,'2024-01-23 06:23:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',3,'2024-05-19 04:16:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',120,'2024-06-21 15:12:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',60,'2024-02-10 06:40:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',147,'2024-07-09 13:53:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',147,'2024-06-13 03:30:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',97,'2024-02-09 11:24:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',57,'2024-07-07 10:32:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',122,'2024-01-10 10:02:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',120,'2024-06-03 09:06:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',93,'2024-07-18 13:20:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',30,'2024-01-25 15:36:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',30,'2024-01-25 15:36:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',81,'2024-05-23 20:35:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',44,'2024-05-27 12:30:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',40,'2024-03-06 15:17:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',78,'2024-06-22 15:13:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',122,'2024-03-13 11:44:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',56,'2024-05-26 01:55:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',146,'2024-05-15 07:56:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',100,'2024-07-06 07:53:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',10,'2024-03-02 18:57:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',31,'2024-02-02 15:05:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',57,'2024-06-22 20:41:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',88,'2024-06-14 16:39:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',88,'2024-06-14 16:39:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',126,'2024-01-10 02:50:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',128,'2024-02-24 09:45:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',86,'2024-03-17 21:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',42,'2024-07-03 01:51:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',142,'2024-07-16 14:43:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',19,'2024-06-27 13:50:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',36,'2024-06-01 23:24:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',41,'2024-06-18 01:19:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',41,'2024-06-18 01:19:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',57,'2024-03-16 08:44:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',138,'2024-07-03 22:49:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',73,'2024-01-27 19:31:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',7,'2024-06-20 02:43:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',66,'2024-07-22 16:01:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',55,'2024-07-20 05:32:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',12,'2024-02-24 02:49:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',139,'2024-04-24 11:45:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',16,'2024-07-21 07:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',64,'2024-04-03 15:33:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',14,'2024-02-10 02:42:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',69,'2024-04-01 21:25:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',136,'2024-07-01 09:41:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',144,'2024-03-04 02:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',19,'2024-06-07 19:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',120,'2024-01-05 10:14:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',141,'2024-06-03 23:15:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',7,'2024-03-23 18:18:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',83,'2024-02-10 07:08:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',108,'2024-05-16 06:30:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',129,'2024-01-16 22:45:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',129,'2024-01-16 22:45:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',34,'2024-02-01 05:23:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',104,'2024-06-24 08:52:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',107,'2024-07-08 21:32:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',73,'2024-01-08 05:39:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',77,'2024-07-15 11:14:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',69,'2024-07-01 06:57:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',78,'2024-07-17 09:57:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',123,'2024-01-21 07:44:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',101,'2024-06-25 06:08:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',16,'2024-07-12 06:47:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',16,'2024-07-12 06:47:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',39,'2024-01-05 13:03:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',145,'2024-01-07 17:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',84,'2024-04-01 05:55:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',55,'2024-01-10 21:33:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',146,'2024-01-22 16:41:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',145,'2024-01-07 14:10:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',58,'2024-06-19 18:20:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',80,'2024-03-10 11:22:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',24,'2024-03-28 18:47:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',102,'2024-06-03 06:05:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',67,'2024-01-11 22:06:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',138,'2024-02-06 11:19:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',104,'2024-04-15 23:59:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',107,'2024-03-12 08:53:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',86,'2024-04-21 09:20:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',18,'2024-04-16 05:49:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',139,'2024-07-04 08:59:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',50,'2024-01-12 04:48:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',7,'2024-06-27 18:45:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',57,'2024-02-10 11:33:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',9,'2024-01-09 17:21:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',87,'2024-07-22 12:03:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',70,'2024-04-01 16:01:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',35,'2024-06-26 20:06:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',24,'2024-07-20 09:50:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',92,'2024-02-20 02:29:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',92,'2024-02-20 02:29:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',94,'2024-01-02 05:30:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',93,'2024-01-07 20:40:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',55,'2024-02-11 03:23:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',123,'2024-04-01 04:14:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',31,'2024-02-28 04:25:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',109,'2024-03-19 17:41:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',7,'2024-01-05 01:36:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',142,'2024-01-07 20:01:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',142,'2024-01-07 20:01:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',68,'2024-07-10 09:11:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',140,'2024-01-02 17:27:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',137,'2024-02-24 19:51:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',26,'2024-05-15 22:52:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',47,'2024-02-22 04:28:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',111,'2024-01-14 07:47:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',15,'2024-05-09 19:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',123,'2024-02-03 08:43:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',123,'2024-02-03 08:43:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',139,'2024-02-15 12:55:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5,'2024-05-12 12:08:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',47,'2024-03-15 12:44:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',9,'2024-02-22 01:10:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',3,'2024-05-08 21:32:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',150,'2024-05-13 10:24:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',49,'2024-05-24 16:53:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',49,'2024-01-01 04:12:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',24,'2024-02-23 03:06:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',28,'2024-05-09 03:49:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',28,'2024-01-25 02:43:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',80,'2024-07-14 05:34:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',80,'2024-07-14 05:34:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',32,'2024-07-18 15:25:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',110,'2024-05-24 17:29:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',31,'2024-03-20 19:17:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',94,'2024-03-07 14:22:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',6,'2024-03-04 15:53:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',23,'2024-07-22 08:35:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',84,'2024-06-22 02:21:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',46,'2024-03-22 02:57:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',133,'2024-02-27 03:20:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',72,'2024-03-24 03:28:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',23,'2024-04-11 04:15:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',121,'2024-01-05 20:34:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',61,'2024-06-04 20:39:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',115,'2024-07-11 11:47:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',100,'2024-01-12 08:58:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',50,'2024-06-26 11:26:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',41,'2024-04-14 08:34:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',127,'2024-02-04 08:58:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',139,'2024-06-02 03:56:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',98,'2024-06-17 09:38:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',19,'2024-06-12 11:58:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',115,'2024-07-15 11:39:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',101,'2024-04-05 21:01:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',54,'2024-05-06 07:25:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',150,'2024-06-12 15:43:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',140,'2024-06-06 11:37:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',126,'2024-04-03 06:14:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',132,'2024-06-18 15:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',78,'2024-02-20 21:36:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',112,'2024-03-25 11:59:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',85,'2024-01-26 03:01:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',136,'2024-07-22 12:47:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',102,'2024-06-09 02:49:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',80,'2024-05-27 12:20:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',14,'2024-05-16 19:42:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',46,'2024-03-25 21:44:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',17,'2024-02-02 08:07:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',90,'2024-03-17 03:21:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',31,'2024-06-17 13:30:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',70,'2024-04-19 15:23:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',47,'2024-07-05 22:48:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',67,'2024-03-13 08:04:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',80,'2024-05-16 02:36:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',1,'2024-04-17 23:39:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',30,'2024-03-09 18:22:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',81,'2024-03-05 04:43:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',33,'2024-01-04 05:02:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',131,'2024-06-18 13:45:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',132,'2024-06-14 04:17:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',132,'2024-06-14 04:17:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',6,'2024-05-21 18:48:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',125,'2024-03-10 14:57:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',10,'2024-02-03 04:03:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',149,'2024-04-13 07:36:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',91,'2024-01-19 03:53:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',124,'2024-03-28 04:35:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',91,'2024-02-17 22:35:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',134,'2024-03-07 13:16:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',12,'2024-07-03 21:31:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',100,'2024-07-17 02:20:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',76,'2024-06-25 12:18:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',27,'2024-03-08 17:49:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',58,'2024-02-27 02:43:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',11,'2024-05-23 14:28:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',82,'2024-04-19 20:40:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',139,'2024-01-24 21:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',24,'2024-05-20 08:20:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',66,'2024-05-15 01:02:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',80,'2024-01-01 20:47:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',32,'2024-05-22 16:32:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',64,'2024-03-24 21:34:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',64,'2024-03-24 21:34:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',146,'2024-03-16 17:38:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',63,'2024-07-09 15:06:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',63,'2024-03-27 04:33:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',81,'2024-04-10 22:58:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',55,'2024-01-01 08:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',117,'2024-02-08 01:10:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',137,'2024-04-22 17:32:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',52,'2024-02-10 18:30:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',95,'2024-03-11 05:37:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',90,'2024-06-28 05:24:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',146,'2024-07-01 23:23:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',109,'2024-04-10 13:26:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',111,'2024-06-19 06:07:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',22,'2024-02-07 07:13:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',61,'2024-01-18 18:55:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',132,'2024-01-07 15:12:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',148,'2024-06-09 21:39:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',22,'2024-05-08 10:24:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',110,'2024-07-12 07:13:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',11,'2024-01-10 19:02:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',131,'2024-07-20 03:39:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',95,'2024-02-13 15:14:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',3,'2024-07-17 14:38:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',39,'2024-04-28 10:09:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',68,'2024-06-08 13:52:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',20,'2024-05-28 20:21:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',57,'2024-07-07 01:47:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',121,'2024-04-04 13:47:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',21,'2024-03-19 13:52:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',5,'2024-07-04 19:25:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',148,'2024-02-20 08:48:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',80,'2024-04-21 14:32:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',101,'2024-03-22 15:37:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',61,'2024-07-09 23:39:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',61,'2024-07-09 23:39:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',19,'2024-04-05 19:16:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',101,'2024-06-24 01:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',101,'2024-06-24 01:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',94,'2024-07-04 23:37:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',26,'2024-07-13 13:31:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',86,'2024-03-19 08:53:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',133,'2024-06-05 18:18:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',115,'2024-01-19 18:24:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',66,'2024-04-05 04:56:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',13,'2024-05-08 03:56:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',121,'2024-01-10 03:55:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',93,'2024-04-15 05:05:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',148,'2024-07-17 12:47:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',67,'2024-06-12 20:11:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',36,'2024-06-21 20:25:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',115,'2024-04-25 18:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',109,'2024-01-23 19:13:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',1,'2024-06-09 08:53:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',97,'2024-03-16 02:58:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',141,'2024-07-06 19:08:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',54,'2024-07-07 11:09:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',20,'2024-01-09 10:03:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',29,'2024-03-28 02:47:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',102,'2024-07-09 22:34:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',88,'2024-04-13 15:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',120,'2024-01-11 05:13:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',19,'2024-01-21 01:50:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',14,'2024-05-04 22:25:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',135,'2024-05-01 14:58:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',128,'2024-07-05 10:10:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',93,'2024-03-21 05:40:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',96,'2024-02-07 12:15:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',136,'2024-01-11 02:25:52',NULL,'Cash Withdrawal',NULL);

/*
running total outgoing 25000
running total income 38124
final balance 13124
Sent to Joe Bloggs 1576
*/

UPDATE ACCOUNT SET BALANCE = (13124 + 1576) WHERE ACCOUNTID = 1;


INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-01-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-02-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-03-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-04-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-05-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-06-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-07-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',58,'2024-04-17 19:36:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',13,'2024-06-26 21:48:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',91,'2024-04-17 16:57:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',141,'2024-03-26 14:30:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',34,'2024-05-14 17:59:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',29,'2024-07-14 04:09:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',29,'2024-07-14 04:09:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',34,'2024-01-22 23:34:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',47,'2024-05-04 03:49:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',61,'2024-05-08 02:49:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',39,'2024-01-11 05:59:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',52,'2024-05-05 07:04:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',72,'2024-04-25 10:14:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',89,'2024-05-12 04:26:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',58,'2024-01-21 06:14:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',36,'2024-02-10 21:27:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',45,'2024-02-07 10:31:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',124,'2024-06-28 14:11:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',139,'2024-05-04 09:29:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',83,'2024-01-23 07:10:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',94,'2024-07-16 21:31:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',92,'2024-02-17 15:19:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',22,'2024-06-03 05:22:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',26,'2024-05-19 23:27:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',139,'2024-05-03 10:25:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',68,'2024-02-27 09:45:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',91,'2024-01-08 15:53:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',145,'2024-03-12 17:52:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',145,'2024-02-23 23:48:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',12,'2024-07-21 13:29:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',109,'2024-07-18 20:43:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',113,'2024-04-06 17:48:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',43,'2024-02-19 12:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',148,'2024-04-21 02:41:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',129,'2024-06-28 06:22:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',69,'2024-04-18 06:48:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',60,'2024-07-21 07:54:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',149,'2024-04-11 01:07:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',4,'2024-06-22 17:33:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',63,'2024-02-03 13:22:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',86,'2024-07-13 04:50:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',83,'2024-04-12 10:48:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',45,'2024-02-23 14:33:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',143,'2024-05-08 16:51:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',138,'2024-01-06 23:45:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',31,'2024-02-20 09:11:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',124,'2024-01-28 18:49:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',8,'2024-07-19 15:18:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',8,'2024-07-19 15:18:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',20,'2024-04-03 08:57:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',68,'2024-07-16 15:28:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',50,'2024-02-17 06:04:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',149,'2024-02-10 06:15:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',62,'2024-05-22 21:19:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',126,'2024-05-06 21:23:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',79,'2024-06-25 07:14:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',76,'2024-05-20 04:51:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',35,'2024-04-21 10:55:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',31,'2024-06-23 01:37:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',117,'2024-01-26 23:50:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',30,'2024-07-07 20:33:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',148,'2024-04-20 16:35:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',30,'2024-03-08 22:08:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',53,'2024-04-08 12:05:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',112,'2024-05-12 09:11:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',145,'2024-07-03 14:37:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',47,'2024-03-02 16:45:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',28,'2024-05-20 06:36:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',94,'2024-07-07 03:47:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',31,'2024-01-13 04:42:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',5,'2024-01-27 13:25:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',60,'2024-06-28 01:24:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',118,'2024-07-15 12:56:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',118,'2024-07-15 12:56:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',54,'2024-01-01 03:48:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',18,'2024-05-10 01:15:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',21,'2024-05-24 17:01:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',89,'2024-05-16 18:27:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',126,'2024-07-22 06:09:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',110,'2024-02-28 16:42:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',13,'2024-01-10 21:18:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',115,'2024-06-13 23:13:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',71,'2024-02-15 21:24:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',71,'2024-07-18 10:02:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',126,'2024-06-19 14:53:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',84,'2024-05-04 21:48:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',63,'2024-07-17 09:28:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',56,'2024-04-26 22:46:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',36,'2024-03-10 02:55:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',5,'2024-06-25 05:48:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',124,'2024-06-25 01:55:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',21,'2024-04-28 02:56:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',23,'2024-03-27 14:55:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',77,'2024-02-28 12:27:52','IE08BOGY91332200000002','Entertainment','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',126,'2024-03-12 01:46:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',126,'2024-03-12 01:46:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',60,'2024-04-20 12:18:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',10,'2024-06-22 01:23:52',NULL,'Cash Withdrawal',NULL);

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',113,'2024-01-12 10:17:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',135,'2024-06-09 08:36:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',88,'2024-05-06 01:28:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',88,'2024-05-06 01:28:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',58,'2024-05-06 04:34:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',127,'2024-02-20 20:14:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',127,'2024-02-20 20:14:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',4,'2024-07-10 23:48:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',7,'2024-07-21 14:11:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',7,'2024-07-21 14:11:52','IE08BOGY91332200000002','Personal','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',62,'2024-02-16 10:36:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',98,'2024-02-09 08:20:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',84,'2024-05-28 05:07:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',7,'2024-05-18 19:34:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',25,'2024-03-22 23:53:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',25,'2024-03-22 23:53:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',94,'2024-02-09 22:12:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',60,'2024-02-19 08:11:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',143,'2024-01-11 11:28:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',57,'2024-04-27 01:05:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',100,'2024-04-18 15:19:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',100,'2024-03-07 09:49:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',113,'2024-03-22 20:36:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',16,'2024-05-20 16:56:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',127,'2024-06-11 08:50:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',149,'2024-02-08 02:39:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',24,'2024-05-05 12:18:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',142,'2024-01-28 02:05:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',42,'2024-07-20 05:01:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',64,'2024-01-14 04:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',64,'2024-01-14 04:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',147,'2024-03-02 19:30:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',40,'2024-07-22 15:20:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',41,'2024-06-01 10:43:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',112,'2024-04-23 12:19:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',101,'2024-06-19 09:25:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',16,'2024-06-15 21:56:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',46,'2024-02-15 01:14:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',16,'2024-02-27 05:56:52','IE08BOGY91332200000002','Entertainment','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',111,'2024-03-19 22:30:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',58,'2024-01-10 18:42:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',32,'2024-05-05 21:39:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',140,'2024-03-16 07:08:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',41,'2024-04-20 02:31:52','IE08BOGY91332200000002','Other','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',139,'2024-01-14 22:43:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',116,'2024-01-03 18:50:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',93,'2024-01-25 13:17:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',10,'2024-03-18 20:26:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',99,'2024-06-08 01:10:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',141,'2024-02-22 05:11:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',68,'2024-01-16 22:04:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',125,'2024-05-15 21:48:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',119,'2024-07-18 17:24:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',48,'2024-07-21 17:01:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',30,'2024-07-13 16:53:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',45,'2024-07-05 05:08:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',132,'2024-02-22 12:14:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',132,'2024-02-22 12:14:52','IE08BOGY91332200000002','Personal','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',145,'2024-01-12 19:50:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',133,'2024-03-15 02:55:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',31,'2024-06-07 21:23:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',13,'2024-04-09 22:37:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',132,'2024-03-22 04:58:52','IE08BOGY91332200000002','Transport','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',2,'2024-03-14 10:26:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',52,'2024-04-04 11:25:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',83,'2024-02-11 06:29:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',141,'2024-01-14 18:36:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',82,'2024-06-07 15:05:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',106,'2024-05-27 02:23:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',115,'2024-05-01 16:43:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',74,'2024-07-13 20:29:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',60,'2024-03-22 07:11:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',19,'2024-05-02 07:43:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',138,'2024-01-03 17:26:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',102,'2024-05-06 02:06:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',108,'2024-02-23 08:57:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',108,'2024-02-23 08:57:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',70,'2024-04-04 07:34:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',63,'2024-02-16 19:42:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',146,'2024-04-10 16:05:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',109,'2024-07-20 08:30:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',125,'2024-02-27 16:13:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',40,'2024-01-16 09:46:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',66,'2024-06-01 15:42:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',5,'2024-07-07 14:27:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',149,'2024-06-09 01:13:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',83,'2024-02-26 07:59:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',83,'2024-05-20 09:40:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',97,'2024-01-24 01:55:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',83,'2024-04-21 13:13:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',115,'2024-07-21 22:02:52',NULL,'Cash Withdrawal',NULL);

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',26,'2024-04-22 02:48:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',54,'2024-05-07 06:40:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',45,'2024-04-15 03:38:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',11,'2024-04-01 22:18:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',23,'2024-04-23 16:46:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',14,'2024-07-16 01:54:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',67,'2024-06-09 03:16:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',67,'2024-06-09 03:16:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',66,'2024-06-02 09:18:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',2,'2024-01-08 13:38:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',109,'2024-03-20 23:38:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',89,'2024-05-26 11:10:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',88,'2024-01-05 22:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',26,'2024-04-19 19:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',26,'2024-04-19 19:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',116,'2024-04-08 03:31:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',41,'2024-05-10 16:25:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',83,'2024-03-07 13:46:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',9,'2024-04-24 15:12:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',9,'2024-04-24 15:12:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',41,'2024-05-28 16:44:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',138,'2024-04-21 07:49:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',138,'2024-04-21 07:49:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',51,'2024-06-13 21:38:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',119,'2024-01-26 18:05:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',52,'2024-02-20 20:43:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',121,'2024-01-26 21:40:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',135,'2024-06-07 07:09:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',18,'2024-02-12 23:18:52','IE08BOGY91332200000002','Groceries','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',133,'2024-06-13 05:30:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',43,'2024-07-08 11:32:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',82,'2024-03-20 17:58:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',24,'2024-07-14 13:14:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',74,'2024-06-09 09:06:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',82,'2024-01-19 16:30:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',107,'2024-05-16 04:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',49,'2024-01-10 10:44:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',15,'2024-02-10 01:39:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',102,'2024-06-10 09:06:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',11,'2024-02-23 15:17:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',11,'2024-02-23 15:17:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',150,'2024-01-03 23:41:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',56,'2024-07-21 13:40:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',76,'2024-03-15 19:57:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',121,'2024-03-05 02:21:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',84,'2024-02-26 15:48:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',146,'2024-02-22 17:29:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',92,'2024-06-19 18:04:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',109,'2024-04-24 20:34:52','IE08BOGY91332200000002','Utilities','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',102,'2024-01-07 13:42:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',57,'2024-02-22 09:18:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',27,'2024-04-28 04:59:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',20,'2024-02-04 22:52:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',92,'2024-04-13 17:20:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',68,'2024-04-20 04:07:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',82,'2024-07-05 23:13:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',13,'2024-04-24 19:24:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',60,'2024-05-16 06:36:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',60,'2024-05-16 06:36:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',73,'2024-01-05 06:07:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',121,'2024-05-20 10:28:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',128,'2024-02-27 15:18:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',18,'2024-01-16 23:34:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',105,'2024-02-11 19:22:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',30,'2024-05-13 02:06:52','IE08BOGY91332200000002','Groceries','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',131,'2024-05-02 02:24:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',131,'2024-05-02 02:24:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',124,'2024-02-01 05:41:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',66,'2024-06-10 10:56:52','IE08BOGY91332200000002','Other','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',122,'2024-06-12 14:47:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',122,'2024-06-12 14:47:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',66,'2024-01-16 12:29:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',24,'2024-05-12 03:45:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',136,'2024-04-08 11:17:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',103,'2024-01-14 09:55:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',3,'2024-05-02 13:10:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',104,'2024-01-19 02:08:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',95,'2024-07-09 04:46:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',1,'2024-02-24 18:03:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',97,'2024-04-03 11:18:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',142,'2024-05-09 01:40:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',134,'2024-02-27 16:06:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',101,'2024-04-10 07:04:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',65,'2024-01-12 09:42:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',95,'2024-06-28 19:45:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',11,'2024-06-14 01:54:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',127,'2024-03-12 03:04:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',102,'2024-05-25 08:38:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',97,'2024-03-23 17:15:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',14,'2024-04-12 09:40:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',110,'2024-07-04 06:04:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',18,'2024-06-22 13:08:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',107,'2024-07-09 08:02:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',129,'2024-04-10 08:35:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',67,'2024-01-18 04:10:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',122,'2024-04-05 01:10:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',67,'2024-02-26 05:11:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',25,'2024-01-27 03:05:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',34,'2024-01-07 23:09:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',10,'2024-04-22 10:22:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',116,'2024-06-27 23:30:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',4,'2024-04-25 22:46:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',90,'2024-06-03 05:11:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',54,'2024-07-22 22:21:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',137,'2024-01-07 15:19:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',137,'2024-01-07 15:19:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',128,'2024-02-22 16:10:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',138,'2024-05-28 12:09:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',98,'2024-07-11 07:25:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',20,'2024-02-22 18:07:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',8,'2024-06-17 17:27:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',42,'2024-04-20 17:37:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',64,'2024-04-19 15:15:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',121,'2024-03-17 22:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',131,'2024-03-10 09:43:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',103,'2024-05-19 18:06:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',119,'2024-04-24 23:47:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',147,'2024-04-13 05:22:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',43,'2024-04-21 08:39:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',79,'2024-02-18 19:39:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',35,'2024-07-12 21:51:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',4,'2024-04-15 19:30:52','IE08BOGY91332200000002','Transport','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',122,'2024-04-04 19:35:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',80,'2024-07-11 11:42:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',90,'2024-07-16 10:34:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',150,'2024-01-25 15:16:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',102,'2024-01-26 15:07:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',6,'2024-02-20 08:24:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',141,'2024-05-27 02:08:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',147,'2024-02-10 06:36:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',45,'2024-01-18 22:16:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',118,'2024-01-12 22:46:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',49,'2024-03-13 21:01:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',23,'2024-06-08 14:06:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',18,'2024-07-13 17:29:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',144,'2024-07-04 09:20:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',143,'2024-05-21 23:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',145,'2024-06-20 06:45:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',74,'2024-03-21 20:44:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',69,'2024-02-18 04:51:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',108,'2024-04-10 14:09:52','IE08BOGY91332200000002','Entertainment','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',75,'2024-07-22 08:12:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',28,'2024-06-13 04:12:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',74,'2024-02-18 16:20:52','IE08BOGY91332200000002','Healthcare','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',84,'2024-01-04 16:04:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',70,'2024-01-22 07:03:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',139,'2024-02-02 09:12:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',136,'2024-03-18 05:23:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',23,'2024-05-03 09:07:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',55,'2024-03-12 05:55:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',74,'2024-07-17 16:43:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',25,'2024-05-12 20:32:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',96,'2024-03-28 02:37:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',71,'2024-07-13 21:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',93,'2024-06-04 07:23:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',87,'2024-04-24 18:05:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',143,'2024-02-03 05:51:52','IE08BOGY91332200000002','Other','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',34,'2024-01-25 15:01:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',119,'2024-04-08 15:42:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',29,'2024-06-14 22:41:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',52,'2024-07-02 04:09:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',27,'2024-05-02 13:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',116,'2024-07-17 04:57:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',43,'2024-02-03 09:17:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',50,'2024-04-26 07:56:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',143,'2024-01-05 08:53:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',19,'2024-05-03 04:28:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',59,'2024-01-15 07:24:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',58,'2024-01-18 22:33:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',142,'2024-06-25 07:30:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',39,'2024-07-19 20:35:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',86,'2024-01-24 21:33:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',142,'2024-05-19 08:40:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',24,'2024-06-01 17:37:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',24,'2024-06-01 17:37:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',18,'2024-01-21 11:32:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',131,'2024-03-04 18:21:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',26,'2024-07-08 13:34:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',95,'2024-03-09 13:13:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',49,'2024-06-07 05:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',11,'2024-03-19 01:29:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',47,'2024-07-03 19:26:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',47,'2024-06-21 15:18:52','IE08BOGY91332200000002','Groceries','John Smith');

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',124,'2024-03-05 11:04:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',134,'2024-03-18 22:24:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',47,'2024-02-26 19:54:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',129,'2024-02-16 21:27:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',83,'2024-05-18 21:10:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',4,'2024-03-18 16:34:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',19,'2024-04-23 22:02:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',19,'2024-04-23 22:02:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',81,'2024-05-06 23:10:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',134,'2024-04-21 21:59:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',133,'2024-03-03 06:46:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',12,'2024-02-06 22:20:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',36,'2024-01-26 14:01:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',127,'2024-04-05 12:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',20,'2024-03-22 17:49:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',142,'2024-06-14 17:03:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',133,'2024-07-01 15:59:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',41,'2024-07-16 20:24:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',109,'2024-01-14 22:17:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',148,'2024-02-01 18:35:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',64,'2024-01-15 19:16:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',87,'2024-07-01 13:41:52','IE08BOGY91332200000002','Groceries','John Smith');

/*
running total outgoing 25485
running total income 38113
final balance 12628
total transferred to john smith 1599
*/

UPDATE ACCOUNT SET BALANCE = (12628 + 1599) WHERE ACCOUNTID = 2;




/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
/*UNLOCK TABLES;*/
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `paymentcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentcard` (
    `card_id` int unsigned NOT NULL AUTO_INCREMENT,
    `account_id` int unsigned NOT NULL,
    `card_number` varchar(16) NOT NULL,
    `expiry_date` varchar(7) NOT NULL,  -- Format: MM/YYYY
    `status` varchar(20) NOT NULL DEFAULT 'Active',  -- Default to 'Active'
    PRIMARY KEY (`card_id`),
    FOREIGN KEY (`account_id`) REFERENCES `account`(`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Insert dummy data into paymentcard table
INSERT INTO `paymentcard` (account_id, card_number, expiry_date, status) VALUES 
(1, '1234567812345678', '12/2025', 'Active'),
(2, '8765432187654321', '06/2024', 'Frozen');


DROP TABLE IF EXISTS `favouritepayees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- Create FavouritePayees table
CREATE TABLE `favouritepayees` (
    `id` int unsigned AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `iban` VARCHAR(34) NOT NULL,
    `customer_id` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES customer(`CustomerId`)
);

-- Insert dummy data into FavouritePayees table
INSERT INTO `favouritepayees` (name, iban, customer_id) VALUES 
('John Doe', 'DE89370400440532013000', 1),
('Jane Smith', 'FR1420041010050500013M02606', 1),
('Alice Johnson', 'GB33BUKB20201555555555', 2),
('Bob Brown', 'NL91ABNA0417164300', 2);

DROP TABLE IF EXISTS `savings_transactions`;

-- Create a table for savings transactions
CREATE TABLE savings_transactions (
    `transaction_id` INT AUTO_INCREMENT PRIMARY KEY,
    `AccountId` int unsigned DEFAULT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `interest_rate` DECIMAL(15,2) NOT NULL,
    `amount` DECIMAL(15,2) NOT NULL,
    `start_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `end_date` TIMESTAMP,
    `status` VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS `exchange_rates_current`;

-- Create a table for exchange rates
CREATE TABLE exchange_rates_current (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `base_currency` VARCHAR(3) NOT NULL,
    `target_currency` VARCHAR(3) NOT NULL,
    `rate` DECIMAL(15,6) NOT NULL,
	`previous_rate` DECIMAL(15,6) NOT NULL,
    `timestamp` TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS `two_factor_auth`;

-- Create FavouritePayees table
CREATE TABLE `two_factor_auth` (
    `id` int unsigned AUTO_INCREMENT NOT NULL,
    `last_known_browser` VARCHAR(255),
    `two_fa_code` VARCHAR(5),
	`two_fa_code_expiry` TIMESTAMP,
    `customer_id` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES customer(`CustomerId`)
);

DROP TABLE IF EXISTS `password_reset_tokens`;


-- Create password recovery table --
CREATE TABLE password_reset_tokens (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `token` VARCHAR(255) NOT NULL,
    `customer_id` int unsigned NOT NULL,
    `expiry_date` TIMESTAMP NOT NULL,
    FOREIGN KEY (`customer_id`) REFERENCES customer(`CustomerId`)
);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 18:09:39
