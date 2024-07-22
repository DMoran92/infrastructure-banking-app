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
  `Phone` int NOT NULL,
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
DELETE from transaction where accountid in (1,2);

COMMIT;

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-01-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-02-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-03-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-04-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-05-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-06-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-07-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',68,'2024-07-10 19:17:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',146,'2024-07-19 08:56:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',132,'2024-06-07 08:37:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',85,'2024-01-22 12:14:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',45,'2024-01-02 18:32:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',144,'2024-06-27 11:29:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',112,'2024-04-23 21:29:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',143,'2024-07-16 15:56:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',116,'2024-05-13 18:16:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',56,'2024-02-12 10:12:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',12,'2024-05-21 03:20:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',83,'2024-01-01 18:29:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',69,'2024-01-03 19:13:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',103,'2024-03-17 20:07:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',36,'2024-07-14 21:43:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',143,'2024-07-08 20:19:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',123,'2024-04-02 05:22:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',44,'2024-02-25 18:09:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',83,'2024-05-17 11:37:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',61,'2024-03-21 08:14:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',54,'2024-03-09 09:13:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',111,'2024-01-28 12:45:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',105,'2024-04-27 12:04:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',126,'2024-02-19 05:34:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',116,'2024-05-26 05:46:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',58,'2024-01-22 23:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',11,'2024-03-13 22:22:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',102,'2024-04-14 12:56:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',73,'2024-01-02 10:52:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',38,'2024-04-18 15:04:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',12,'2024-02-13 18:23:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',56,'2024-05-26 15:22:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',29,'2024-04-23 23:43:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',3,'2024-07-17 21:41:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',3,'2024-02-21 12:43:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',31,'2024-01-16 01:45:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',150,'2024-01-01 18:58:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',24,'2024-07-16 12:15:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',14,'2024-03-25 05:56:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',89,'2024-03-21 20:55:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',23,'2024-04-07 04:47:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',136,'2024-02-26 05:43:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',113,'2024-05-07 16:05:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',113,'2024-06-10 07:02:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',134,'2024-06-22 22:11:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',78,'2024-06-22 08:16:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',78,'2024-05-12 21:53:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',72,'2024-03-08 08:57:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',118,'2024-06-11 16:18:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',101,'2024-06-07 02:03:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',27,'2024-05-14 16:13:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',20,'2024-01-12 17:45:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',76,'2024-02-21 20:11:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',72,'2024-01-08 10:08:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',149,'2024-04-04 08:46:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',149,'2024-03-25 15:31:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',16,'2024-04-09 08:22:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',102,'2024-06-26 05:21:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',58,'2024-02-01 02:43:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',115,'2024-06-27 07:28:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',148,'2024-07-17 03:29:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',121,'2024-01-10 08:18:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',150,'2024-06-05 22:07:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',40,'2024-06-16 05:32:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',49,'2024-07-03 13:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',148,'2024-07-02 02:36:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',149,'2024-04-19 14:01:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',8,'2024-03-07 01:10:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',8,'2024-01-16 18:47:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',101,'2024-04-22 08:16:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',47,'2024-06-12 17:11:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',139,'2024-02-18 06:53:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',139,'2024-05-26 20:25:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',1,'2024-03-03 07:53:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',73,'2024-03-27 22:42:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',23,'2024-03-16 05:26:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',109,'2024-07-11 12:49:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',144,'2024-07-17 20:40:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',32,'2024-05-02 04:33:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',98,'2024-04-23 20:58:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',51,'2024-03-19 02:26:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',1,'2024-05-05 09:59:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',57,'2024-06-28 14:59:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',16,'2024-04-19 22:19:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',8,'2024-03-14 12:19:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',145,'2024-02-05 08:43:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',145,'2024-02-19 02:05:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',33,'2024-07-20 07:32:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',60,'2024-03-19 09:49:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',74,'2024-05-15 09:11:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',112,'2024-07-18 19:52:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',39,'2024-06-28 01:34:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',17,'2024-03-24 04:58:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',116,'2024-04-13 12:30:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',114,'2024-04-04 01:51:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',59,'2024-02-05 03:48:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',13,'2024-02-26 10:05:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',19,'2024-02-07 01:27:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',98,'2024-01-06 03:37:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',98,'2024-05-26 17:03:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',37,'2024-07-06 04:12:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',22,'2024-01-13 23:51:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',92,'2024-07-05 17:31:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',110,'2024-03-25 09:49:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',26,'2024-06-13 20:43:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',67,'2024-06-19 15:32:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',16,'2024-04-24 20:03:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',37,'2024-02-25 03:56:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',19,'2024-04-03 04:37:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',8,'2024-06-17 10:45:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',126,'2024-03-14 23:41:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',111,'2024-05-07 17:09:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',118,'2024-03-01 04:27:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',4,'2024-02-10 19:02:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',77,'2024-02-10 18:06:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',74,'2024-07-04 14:55:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',138,'2024-07-21 15:59:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',103,'2024-07-12 18:52:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',87,'2024-06-06 06:15:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',140,'2024-04-09 19:43:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',139,'2024-07-15 07:59:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',104,'2024-03-23 20:33:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',141,'2024-03-06 04:30:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',141,'2024-03-12 19:43:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',113,'2024-07-20 21:28:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',32,'2024-05-08 21:03:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',32,'2024-06-18 18:16:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',70,'2024-06-26 19:16:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',9,'2024-05-19 12:10:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',9,'2024-06-20 22:32:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',74,'2024-05-19 22:36:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',18,'2024-03-14 06:10:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',73,'2024-03-11 08:15:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',107,'2024-02-22 17:48:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',128,'2024-01-28 06:46:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',33,'2024-07-19 04:05:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',146,'2024-07-07 03:53:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',134,'2024-02-06 09:01:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',124,'2024-07-07 17:42:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',50,'2024-03-21 19:42:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',146,'2024-07-21 19:19:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',142,'2024-02-13 09:13:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',101,'2024-01-01 17:18:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',117,'2024-02-11 08:52:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',141,'2024-02-21 01:39:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',89,'2024-03-11 17:25:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',89,'2024-04-08 21:47:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',90,'2024-07-14 17:04:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',111,'2024-01-09 08:42:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',80,'2024-05-11 15:02:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',132,'2024-07-21 09:32:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',116,'2024-07-21 12:43:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',32,'2024-07-22 05:03:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',57,'2024-06-17 16:17:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',37,'2024-04-02 12:51:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',145,'2024-01-19 22:43:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',28,'2024-02-26 17:41:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',128,'2024-06-26 19:48:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',77,'2024-07-20 19:20:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',66,'2024-03-04 23:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',145,'2024-04-20 13:21:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',133,'2024-07-13 18:37:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',136,'2024-02-22 16:42:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',19,'2024-07-13 03:10:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',133,'2024-01-11 08:05:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',49,'2024-06-03 15:27:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',77,'2024-02-25 13:24:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',34,'2024-03-07 09:11:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',33,'2024-03-27 23:55:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',47,'2024-06-07 11:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',2,'2024-01-04 06:40:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',45,'2024-02-11 06:57:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',98,'2024-04-06 09:16:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',71,'2024-02-21 20:17:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',130,'2024-04-11 18:17:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',133,'2024-04-02 05:51:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',12,'2024-07-12 13:59:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',123,'2024-03-02 20:20:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',1,'2024-03-21 20:21:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',52,'2024-06-27 18:05:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',91,'2024-01-21 19:39:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',61,'2024-06-22 13:37:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',92,'2024-05-17 11:30:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',54,'2024-07-21 07:56:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',54,'2024-06-03 07:14:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',19,'2024-03-23 12:31:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',5,'2024-02-11 19:03:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',42,'2024-02-08 13:03:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',20,'2024-03-28 08:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',30,'2024-07-03 23:33:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',12,'2024-06-20 18:07:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',38,'2024-01-12 22:48:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',62,'2024-07-02 17:45:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',62,'2024-06-07 19:11:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',22,'2024-06-15 15:24:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',24,'2024-01-28 06:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',148,'2024-03-16 04:52:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',140,'2024-05-27 18:58:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',88,'2024-04-16 10:57:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',45,'2024-05-12 15:12:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',16,'2024-03-12 02:55:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',103,'2024-06-20 15:42:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',17,'2024-04-14 21:07:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',90,'2024-07-12 09:33:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',90,'2024-07-03 20:15:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',147,'2024-01-17 09:10:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',9,'2024-04-15 10:24:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',50,'2024-01-18 05:38:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',42,'2024-04-15 20:19:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',47,'2024-04-25 23:05:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',96,'2024-06-25 13:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',15,'2024-05-24 23:08:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',113,'2024-06-12 05:38:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',95,'2024-06-03 02:50:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',121,'2024-07-15 20:52:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',99,'2024-07-20 23:13:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',68,'2024-05-01 20:38:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',49,'2024-01-27 08:31:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',49,'2024-07-21 08:56:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',71,'2024-04-09 11:06:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',51,'2024-05-02 21:18:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',141,'2024-05-21 18:25:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',21,'2024-04-27 06:30:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',93,'2024-04-21 22:48:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',80,'2024-04-02 02:21:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',29,'2024-02-13 09:10:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',58,'2024-01-21 03:48:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',77,'2024-06-09 04:20:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',61,'2024-07-10 02:28:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',95,'2024-07-07 22:20:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',34,'2024-07-15 11:31:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',1,'2024-07-20 06:15:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',116,'2024-06-28 03:01:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',116,'2024-04-20 20:48:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',85,'2024-04-08 13:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',88,'2024-06-03 19:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',88,'2024-05-17 23:55:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',40,'2024-03-06 07:58:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',141,'2024-04-25 16:59:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',68,'2024-05-24 07:05:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',118,'2024-01-01 13:04:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',14,'2024-01-16 22:27:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',25,'2024-03-08 02:52:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',102,'2024-01-04 02:58:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',102,'2024-05-23 07:42:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',41,'2024-04-10 12:29:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',62,'2024-04-26 19:21:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',75,'2024-03-21 21:14:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',53,'2024-03-26 18:45:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',138,'2024-01-16 07:37:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',128,'2024-01-04 22:48:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',58,'2024-03-11 02:19:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',11,'2024-06-16 15:25:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',41,'2024-05-04 22:11:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',9,'2024-02-04 09:48:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',103,'2024-03-03 15:35:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',66,'2024-01-20 07:38:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',25,'2024-07-09 02:32:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',56,'2024-07-07 05:05:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',106,'2024-07-03 19:33:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',64,'2024-01-26 07:05:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',131,'2024-01-22 19:55:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',57,'2024-04-20 19:30:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',83,'2024-06-19 16:39:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',35,'2024-07-11 05:29:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',77,'2024-06-18 09:24:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',77,'2024-03-09 19:45:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',58,'2024-02-09 18:35:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',124,'2024-06-02 01:29:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',14,'2024-06-13 23:26:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',28,'2024-01-19 19:56:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',58,'2024-03-08 11:37:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',94,'2024-01-08 20:39:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',113,'2024-06-21 23:57:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',92,'2024-05-19 11:59:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',5,'2024-04-25 01:17:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',36,'2024-07-21 19:30:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',44,'2024-03-17 18:51:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',52,'2024-01-08 15:55:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',2,'2024-07-13 20:31:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',11,'2024-04-20 01:30:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',11,'2024-01-07 13:15:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',102,'2024-03-17 15:27:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',103,'2024-03-05 17:43:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',121,'2024-07-22 15:10:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',95,'2024-06-14 22:11:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',77,'2024-02-17 09:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',5,'2024-07-11 21:36:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',8,'2024-04-23 14:02:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',100,'2024-06-23 13:52:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',64,'2024-04-19 05:47:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',73,'2024-03-09 22:14:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',43,'2024-04-24 11:46:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',100,'2024-01-04 21:35:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',99,'2024-03-19 19:22:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',94,'2024-04-10 23:29:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',9,'2024-04-02 01:03:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',29,'2024-03-10 06:05:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',77,'2024-02-09 08:47:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',77,'2024-07-18 21:20:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',116,'2024-06-19 13:14:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',109,'2024-01-08 08:08:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',98,'2024-04-21 14:36:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',61,'2024-05-15 20:45:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',83,'2024-01-20 08:38:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',121,'2024-07-21 11:21:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',127,'2024-06-12 05:21:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',22,'2024-04-27 17:25:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',89,'2024-02-09 12:15:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',150,'2024-06-19 01:50:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',125,'2024-03-05 09:12:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',21,'2024-07-09 18:55:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',94,'2024-04-14 17:40:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',100,'2024-01-16 11:07:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',142,'2024-05-04 20:28:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',92,'2024-03-11 04:50:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',4,'2024-04-05 03:52:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',27,'2024-06-05 11:36:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',55,'2024-07-10 06:15:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',55,'2024-01-16 09:24:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',140,'2024-05-18 19:36:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',85,'2024-03-28 12:50:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',116,'2024-02-01 10:29:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',94,'2024-04-04 23:44:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',23,'2024-07-19 06:50:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',82,'2024-07-18 06:14:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',122,'2024-04-27 07:45:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',60,'2024-07-09 09:16:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',1,'2024-05-28 18:23:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',77,'2024-01-27 16:51:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',63,'2024-06-15 06:04:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',74,'2024-07-22 14:31:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',43,'2024-07-20 15:53:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',131,'2024-04-03 18:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',51,'2024-03-23 06:29:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',48,'2024-07-20 17:39:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',21,'2024-06-05 20:37:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',94,'2024-04-03 04:03:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',149,'2024-02-03 21:35:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',51,'2024-04-16 03:06:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',27,'2024-01-13 19:30:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',38,'2024-01-02 05:50:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',50,'2024-06-08 23:38:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',49,'2024-07-15 06:28:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',26,'2024-01-23 11:12:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',73,'2024-03-23 20:02:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',22,'2024-06-19 19:47:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',120,'2024-06-15 06:25:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',21,'2024-04-28 02:44:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',127,'2024-05-18 07:45:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',28,'2024-06-22 17:32:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',84,'2024-05-26 20:45:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',121,'2024-02-09 01:15:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',121,'2024-03-21 23:26:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',15,'2024-01-04 09:56:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',74,'2024-03-27 15:19:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',74,'2024-06-25 20:59:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',105,'2024-02-21 04:20:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',80,'2024-02-08 01:31:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',150,'2024-04-18 21:52:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',110,'2024-02-26 09:34:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',110,'2024-04-20 20:13:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',149,'2024-04-25 19:10:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',146,'2024-02-12 14:43:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',43,'2024-06-21 22:11:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',17,'2024-07-01 12:23:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',53,'2024-05-13 02:59:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',50,'2024-07-22 15:18:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',147,'2024-04-08 13:48:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',3,'2024-05-18 18:36:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',146,'2024-05-12 07:33:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',130,'2024-05-23 21:23:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',92,'2024-01-14 09:58:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',101,'2024-03-02 04:39:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',88,'2024-04-06 20:40:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',109,'2024-01-26 11:45:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',118,'2024-02-10 01:31:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',69,'2024-05-26 07:10:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',133,'2024-04-25 19:25:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',120,'2024-02-04 10:02:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',17,'2024-01-03 05:14:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',150,'2024-04-20 14:46:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',150,'2024-07-03 03:48:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',119,'2024-02-18 14:27:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',34,'2024-07-05 20:48:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',34,'2024-04-26 21:10:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',144,'2024-05-13 01:33:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',131,'2024-03-01 16:03:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',141,'2024-05-17 11:21:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',107,'2024-01-24 22:33:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',99,'2024-03-15 09:21:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',29,'2024-06-21 17:27:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',7,'2024-05-21 16:29:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',132,'2024-07-21 13:28:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',127,'2024-01-23 03:26:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',66,'2024-06-12 13:37:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',134,'2024-03-20 23:18:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',53,'2024-04-23 07:10:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',114,'2024-01-15 10:14:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',141,'2024-07-19 04:51:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',71,'2024-07-02 03:26:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'John Smith','IE08BOGY91332200000002',7,'2024-03-20 16:49:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',7,'2024-06-11 08:28:52','IE01BOGY91332200000001','Personal','Joe Bloggs');

/*
running total outgoing 25513
running total income 38021
final balance 12508
Transferred from John Smith to Joe Bloggs 1325
*/

UPDATE account set balance = (12508 + 1325) where accountid = 1;

COMMIT;

INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-01-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-02-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-03-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-04-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-05-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-06-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',4000,'2024-07-01 16:54:52','IE17BOFI90001779876','Personal','An Post Payroll');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',94,'2024-07-22 01:37:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',12,'2024-03-10 04:40:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',27,'2024-02-08 05:49:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',130,'2024-02-13 22:19:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',95,'2024-06-14 11:30:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',81,'2024-03-28 20:02:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',60,'2024-06-16 15:55:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',37,'2024-03-14 16:10:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',37,'2024-07-18 02:04:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',25,'2024-01-07 11:21:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',104,'2024-07-14 10:05:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',90,'2024-01-12 08:44:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',132,'2024-04-10 16:29:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',127,'2024-01-20 02:46:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',61,'2024-07-02 19:09:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',135,'2024-02-23 17:36:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',57,'2024-03-22 02:04:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',128,'2024-06-27 23:20:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',50,'2024-05-20 12:37:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',55,'2024-02-16 12:53:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',99,'2024-04-02 21:52:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',79,'2024-05-28 06:19:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',66,'2024-04-12 14:52:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',80,'2024-05-01 03:05:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',18,'2024-01-17 21:03:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',102,'2024-03-25 07:09:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',102,'2024-03-06 09:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',128,'2024-03-19 18:06:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',97,'2024-04-26 09:54:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',97,'2024-05-04 17:03:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',46,'2024-05-03 09:26:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',91,'2024-04-26 07:22:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',86,'2024-01-10 16:23:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',46,'2024-06-05 23:25:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',46,'2024-03-04 20:51:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',104,'2024-01-11 21:17:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',147,'2024-05-26 09:38:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',18,'2024-07-18 22:07:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',120,'2024-03-20 14:34:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',120,'2024-04-06 03:39:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',113,'2024-05-15 06:04:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',113,'2024-03-26 23:13:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',111,'2024-03-27 12:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',42,'2024-07-21 20:07:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',53,'2024-05-27 13:16:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',46,'2024-03-09 03:32:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',96,'2024-04-09 05:46:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',147,'2024-02-11 01:35:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',147,'2024-05-17 20:21:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',92,'2024-01-04 05:01:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',91,'2024-02-14 19:33:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',8,'2024-03-28 13:41:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',147,'2024-04-03 10:50:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',31,'2024-01-18 01:01:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',69,'2024-01-17 14:32:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',97,'2024-07-08 04:47:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',8,'2024-05-17 05:10:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',90,'2024-03-24 23:25:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',96,'2024-05-19 07:22:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',43,'2024-05-11 23:10:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',96,'2024-06-06 15:45:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',35,'2024-03-23 11:13:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',8,'2024-01-27 10:26:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',62,'2024-02-05 11:20:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',105,'2024-05-17 03:13:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',51,'2024-03-20 10:23:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',49,'2024-02-11 07:41:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',38,'2024-04-26 17:51:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',142,'2024-05-02 02:08:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',127,'2024-06-14 11:39:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',136,'2024-03-15 06:16:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',105,'2024-06-21 04:14:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',51,'2024-03-23 11:25:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',59,'2024-05-09 08:58:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',104,'2024-05-27 07:12:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',131,'2024-07-06 09:53:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',26,'2024-06-10 19:37:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',5,'2024-05-20 14:09:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',34,'2024-06-03 14:56:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',43,'2024-07-18 16:24:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',43,'2024-06-20 21:24:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',121,'2024-05-15 13:54:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',94,'2024-06-24 10:16:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',32,'2024-04-14 22:39:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',12,'2024-02-28 07:38:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',29,'2024-05-21 07:21:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',19,'2024-07-12 16:38:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',18,'2024-06-28 20:52:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',150,'2024-07-10 02:11:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',3,'2024-03-22 22:27:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',21,'2024-05-23 16:53:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',96,'2024-01-15 08:47:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',74,'2024-02-02 23:46:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',74,'2024-02-09 06:03:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',34,'2024-04-22 08:07:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',81,'2024-01-14 18:08:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',137,'2024-05-19 04:41:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',122,'2024-07-08 07:27:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',96,'2024-01-16 05:12:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',33,'2024-07-14 09:24:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',50,'2024-06-20 12:21:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',124,'2024-01-28 12:01:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',9,'2024-06-06 06:19:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',80,'2024-05-10 13:09:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',31,'2024-02-12 03:09:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',97,'2024-05-21 18:05:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',21,'2024-06-09 14:35:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',113,'2024-06-12 13:04:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',37,'2024-03-09 04:01:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',121,'2024-01-10 06:12:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',74,'2024-02-22 11:03:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',16,'2024-05-21 02:57:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',15,'2024-02-14 16:07:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',77,'2024-01-21 07:32:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',26,'2024-03-16 07:56:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',58,'2024-01-28 05:12:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',43,'2024-06-27 15:42:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',129,'2024-03-11 12:02:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',105,'2024-05-22 18:51:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',38,'2024-02-01 05:10:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',112,'2024-02-10 15:17:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',75,'2024-04-24 01:23:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',75,'2024-03-18 21:48:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',24,'2024-06-10 06:39:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',102,'2024-07-03 19:49:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',74,'2024-03-05 07:58:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',137,'2024-01-05 03:32:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',24,'2024-02-11 12:11:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',133,'2024-06-19 20:44:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',91,'2024-05-08 02:27:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',88,'2024-02-27 17:28:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',92,'2024-05-07 14:37:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',59,'2024-04-04 13:18:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',139,'2024-03-26 16:47:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',26,'2024-05-27 03:52:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',8,'2024-07-17 02:18:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',16,'2024-05-22 04:21:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',59,'2024-03-02 22:11:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',127,'2024-05-01 05:12:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',129,'2024-07-11 23:19:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',78,'2024-07-11 16:51:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',110,'2024-02-13 14:28:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',134,'2024-03-09 10:08:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',15,'2024-03-03 22:53:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',55,'2024-05-12 04:43:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',126,'2024-02-08 15:09:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',100,'2024-06-19 23:12:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',95,'2024-01-26 03:17:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',36,'2024-07-20 08:23:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',18,'2024-01-03 01:50:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',70,'2024-03-12 08:12:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',4,'2024-02-06 22:11:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',140,'2024-06-28 23:57:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',21,'2024-05-28 06:29:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',114,'2024-02-14 14:59:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',150,'2024-02-26 02:56:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',133,'2024-04-21 09:34:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',66,'2024-02-24 01:38:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',149,'2024-04-04 11:38:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',68,'2024-02-15 18:16:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',81,'2024-02-15 19:57:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',38,'2024-05-23 03:44:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',42,'2024-07-05 09:34:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',12,'2024-07-11 06:16:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',19,'2024-03-02 01:34:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',28,'2024-02-27 06:45:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',142,'2024-07-02 19:24:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',25,'2024-02-07 14:48:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',134,'2024-04-01 18:51:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',56,'2024-06-13 08:38:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',5,'2024-02-08 07:25:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',50,'2024-02-18 01:03:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',115,'2024-01-10 06:22:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',106,'2024-05-22 14:40:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',135,'2024-02-27 07:48:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',138,'2024-06-24 10:35:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',36,'2024-07-17 05:36:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',149,'2024-01-22 14:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',105,'2024-02-04 09:07:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',43,'2024-06-19 17:38:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',129,'2024-03-22 20:13:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',147,'2024-05-16 21:08:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',123,'2024-05-05 02:46:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',4,'2024-03-05 02:31:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',4,'2024-03-08 21:03:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',74,'2024-06-28 09:13:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',92,'2024-07-06 17:56:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',20,'2024-01-18 11:10:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',20,'2024-06-01 01:10:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',74,'2024-07-16 09:11:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',56,'2024-06-20 16:23:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',9,'2024-02-15 14:53:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',94,'2024-03-12 07:53:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',60,'2024-01-14 02:01:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',46,'2024-01-07 20:03:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',102,'2024-07-13 12:34:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',108,'2024-05-16 13:22:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',30,'2024-06-24 03:44:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',56,'2024-04-23 19:55:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',75,'2024-01-15 18:35:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',17,'2024-01-12 20:43:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',115,'2024-02-14 17:15:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',43,'2024-03-24 05:15:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',18,'2024-06-20 11:19:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',43,'2024-01-13 05:40:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',79,'2024-02-28 13:14:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',39,'2024-01-17 08:21:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',92,'2024-06-25 07:59:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',122,'2024-02-01 23:39:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',86,'2024-07-02 17:09:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',117,'2024-02-24 20:16:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',99,'2024-07-21 20:09:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',50,'2024-05-24 03:14:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',92,'2024-01-26 08:41:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',27,'2024-06-03 12:56:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',83,'2024-07-15 02:59:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',64,'2024-04-18 03:22:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',77,'2024-03-09 18:38:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',82,'2024-02-14 11:56:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',114,'2024-06-04 18:47:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',46,'2024-01-19 04:25:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',20,'2024-04-22 08:55:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',111,'2024-07-02 07:50:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',101,'2024-03-17 17:31:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',79,'2024-05-07 18:13:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',99,'2024-07-13 01:36:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',98,'2024-04-20 14:23:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',134,'2024-01-22 04:37:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',20,'2024-03-05 15:53:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',148,'2024-07-22 12:27:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',102,'2024-03-18 13:17:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',115,'2024-01-10 13:45:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',115,'2024-07-11 23:25:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',142,'2024-02-25 04:34:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',71,'2024-07-21 01:10:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',123,'2024-04-15 01:17:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',44,'2024-02-13 15:04:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',128,'2024-01-06 11:11:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',87,'2024-04-28 15:15:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',130,'2024-04-23 11:18:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',132,'2024-03-12 03:52:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',3,'2024-06-12 21:53:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',65,'2024-03-07 12:50:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',28,'2024-07-08 21:23:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',28,'2024-05-27 04:52:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',41,'2024-04-21 23:17:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',13,'2024-05-22 16:44:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',117,'2024-01-14 17:01:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',102,'2024-05-12 13:22:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',21,'2024-03-06 05:13:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',68,'2024-06-18 06:48:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',60,'2024-01-03 21:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',84,'2024-02-06 02:38:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',53,'2024-07-06 17:18:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',80,'2024-04-05 15:51:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',120,'2024-04-03 19:26:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',44,'2024-03-16 10:27:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',71,'2024-07-22 10:09:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',32,'2024-03-19 09:34:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',143,'2024-03-12 22:54:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',79,'2024-04-20 20:23:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',140,'2024-05-08 06:26:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',140,'2024-03-05 16:53:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',137,'2024-04-11 08:53:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',14,'2024-01-03 20:48:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',66,'2024-03-13 17:54:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',82,'2024-02-25 09:48:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',64,'2024-03-21 20:44:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',86,'2024-02-11 01:11:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',35,'2024-05-27 15:02:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',128,'2024-07-15 11:53:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',115,'2024-01-11 20:09:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',32,'2024-06-07 05:05:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',12,'2024-04-16 10:10:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',96,'2024-03-22 08:37:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',95,'2024-03-04 02:32:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',89,'2024-06-27 18:43:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',4,'2024-06-04 04:04:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',4,'2024-01-07 04:30:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',44,'2024-03-14 23:13:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',124,'2024-04-25 15:14:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',133,'2024-01-18 08:11:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',19,'2024-02-13 14:33:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',19,'2024-04-26 13:54:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',87,'2024-01-23 12:24:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',123,'2024-02-25 13:30:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',123,'2024-04-11 09:20:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',118,'2024-04-21 20:42:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',15,'2024-07-20 22:24:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',103,'2024-06-06 18:38:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',26,'2024-02-24 22:33:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',131,'2024-06-02 23:16:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',32,'2024-01-27 13:16:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',8,'2024-01-19 18:58:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',146,'2024-04-04 23:07:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',129,'2024-02-26 11:47:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',14,'2024-07-14 04:36:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',117,'2024-01-07 06:45:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',103,'2024-07-02 03:25:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',115,'2024-05-09 03:46:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',90,'2024-05-07 04:42:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',24,'2024-04-05 21:24:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',65,'2024-01-13 12:35:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',1,'2024-03-09 07:15:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',131,'2024-05-03 08:33:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',146,'2024-05-21 01:20:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',65,'2024-04-27 13:27:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',102,'2024-03-06 17:50:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',148,'2024-02-09 19:09:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',30,'2024-07-20 02:03:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',119,'2024-07-22 06:01:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',119,'2024-01-16 17:07:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',131,'2024-02-12 10:37:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',9,'2024-07-06 08:23:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',113,'2024-06-23 17:48:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',55,'2024-06-20 13:52:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',132,'2024-02-27 22:29:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',111,'2024-07-15 01:32:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',138,'2024-06-11 03:16:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',2,'2024-07-09 20:53:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',18,'2024-01-19 19:27:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',75,'2024-03-09 20:47:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',33,'2024-04-03 07:17:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',39,'2024-01-10 09:27:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',48,'2024-01-21 20:08:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',78,'2024-03-01 23:20:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',117,'2024-02-28 19:28:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',85,'2024-06-02 03:04:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',3,'2024-05-08 10:30:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',46,'2024-02-19 02:19:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',103,'2024-07-20 15:07:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',56,'2024-01-13 05:51:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',55,'2024-04-09 01:01:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',148,'2024-04-25 12:10:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',26,'2024-04-26 06:36:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',75,'2024-07-13 18:31:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',112,'2024-01-14 21:37:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',140,'2024-02-01 14:55:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',66,'2024-02-03 04:19:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',14,'2024-01-20 02:04:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',139,'2024-07-04 10:07:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',88,'2024-04-17 11:44:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',114,'2024-07-21 02:52:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',5,'2024-05-26 18:49:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',39,'2024-01-28 19:03:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',130,'2024-07-05 08:35:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',23,'2024-01-06 16:08:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',4,'2024-02-08 06:53:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',56,'2024-05-15 18:56:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',22,'2024-06-07 09:52:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',141,'2024-04-17 19:49:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',14,'2024-05-19 21:02:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',114,'2024-05-05 04:08:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',70,'2024-03-22 04:59:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',66,'2024-06-25 23:26:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',110,'2024-02-24 12:25:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',104,'2024-02-27 22:19:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Joe Bloggs','IE01BOGY91332200000001',16,'2024-02-11 02:55:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',16,'2024-03-23 12:40:52','IE08BOGY91332200000002','Personal','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',1,'2024-07-10 21:24:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',126,'2024-01-19 09:47:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',132,'2024-04-25 05:13:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',101,'2024-04-08 06:01:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',77,'2024-04-27 11:35:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',6,'2024-07-05 19:59:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',100,'2024-07-02 04:19:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Electricians','NL27ABNA7020127156',4,'2024-05-08 02:59:52','IE08BOGY91332200000002','Utilities','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',144,'2024-07-10 16:08:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',30,'2024-02-06 08:36:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'John Smith','IE08BOGY91332200000002',101,'2024-06-07 16:19:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',44,'2024-05-10 23:21:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',146,'2024-05-22 01:10:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',10,'2024-01-25 18:25:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Raheny Hardware','NL27ABNA7020127153',137,'2024-01-08 01:37:52','IE08BOGY91332200000002','Other','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',119,'2024-03-28 13:46:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Cash Withdrawal','IE08BOGY91332200000002',148,'2024-05-25 04:58:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',132,'2024-07-17 15:33:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Rustic Stone','NL27ABNA7020127149',70,'2024-01-05 17:34:52','IE08BOGY91332200000002','Dining','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',103,'2024-04-17 13:03:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',56,'2024-03-19 19:13:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',136,'2024-04-01 12:49:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',13,'2024-02-17 03:49:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',20,'2024-03-06 18:46:52','IE08BOGY91332200000002','Transport','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'LIDL Raheny','NL27ABNA7020127151',127,'2024-02-25 05:38:52','IE08BOGY91332200000002','Groceries','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',112,'2024-01-25 02:01:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Bruxelles','NL27ABNA7020127150',88,'2024-06-07 15:51:52','IE08BOGY91332200000002','Entertainment','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Swords Clinic','NL27ABNA7020127152',10,'2024-01-03 04:04:52','IE08BOGY91332200000002','Healthcare','John Smith');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (2,'Irish Rail','NL27ABNA7020127155',53,'2024-07-20 15:43:52','IE08BOGY91332200000002','Transport','John Smith');

/*
running total outgoing 25222
running total income 37845
final balance 12623
Transferred from Joe Bloggs to John Smith 2136
*/

UPDATE account set balance = (12623 + 2136) where accountid = 2;

COMMIT;



/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
/*UNLOCK TABLES;*/
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `paymentcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentcard` (
	`card_id` int unsigned NOT NULL AUTO_INCREMENT,
	`customer_id` int unsigned NOT NULL,
	`card_number` varchar(16) NOT NULL,
	`expiry_date` varchar(7) NOT NULL,  -- Format: MM/YYYY
	`status` varchar(20) NOT NULL DEFAULT 'Active',  -- Default to 'Active'
	PRIMARY KEY (`card_id`),
	FOREIGN KEY (`customer_id`) REFERENCES `customer`(`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Insert dummy data into paymentcard table
INSERT INTO `paymentcard` (customer_id, card_number, expiry_date, status) VALUES 
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
