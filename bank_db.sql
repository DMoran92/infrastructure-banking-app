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
INSERT INTO `account` VALUES (1,1,'Current',13980,'IE01BOGY91332200000001','EUR'),(2,2,'Current',1000,'IE08BOGY91332200000002','EUR'),(8,8,'Current',320,'IE08BOGY91332200000008','EUR'),(9,9,'Current',0,'IE09BOGY91332200000009','EUR'),(10,10,'Current',0,'IE10BOGY91332200000010','EUR'),(11,11,'Current',0,'IE11BOGY91332200000011','EUR'),(12,12,'Current',30,'IE12BOGY91332200000012','EUR'),(14,12,'Savings',49,'IE14BOGY91332200000014','EUR'),(15,13,'Current',100,'IE15BOGY91332200000015','EUR'),(16,14,'Current',0,'IE16BOGY91332200000016','EUR'),(17,15,'Current',0,'IE17BOGY91332200000017','EUR'),(18,16,'Current',100,'IE18BOGY91332200000018','EUR'),(19,17,'Current',0,'IE19BOGY91332200000019','EUR'),(20,18,'Current',0,'IE20BOGY91332200000020','EUR');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Role` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES 
(1,'Joe','Bloggs','joebloggsbog@onmail.com',851234567,1,'1111','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','123 Fake Street','Townsville','Galway','Co. Galway','03/03/2000','Passport','DV2032SDA','user'),
(2,'John','Smith','testsample@test.com',879876543,3,'2222','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','456 Not A Place','Somewhere','Dallas','Texas','04/12/2003','NationalID','DSAD21231','user'),
(3,'TestFirst','TestLast','testemail@mail.com',851234567,0,'3333','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','TestAddr1','TestAddr2','TestCity','Dublin, Ireland','test','TestID','TestNum','user'),
(5,'modal','test','mod@l.com',565565,0,'5555','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','gyugyug','iopipoipo','fgdgfdgf','Dublin, Ireland','1231312','gygyu','78979','user'),
(6,'testAccFirst','testAccLast','ewfgwef@fewfw.com',4568654,0,'6666','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','kojipfwegjio','9j0feqnio','kopfgkop','Dublin, Ireland','123456','iojfwejio','4564632','user'),
(8,'Sally','Collins','jopjpo',45646,0,'8888','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','jiokjio','ioj','ij','Dublin, Ireland','1231','jijio','486469','user'),
(9,'jipof39pjef','pojfeqwpjof','pjofwqopj',123132,0,'9999','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','oijfejioef','iojwefjiofew','oijfewjioef','Dublin, Ireland','12313221','jiowefopjfew','123121','user'),
(10,'gerreg','rggr','rggw',4865,0,'1010','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','gewweg','wegwe','qegqe','Dublin, Ireland','123132','wegweg','789798','user'),
(11,'reherh','herhe','wqegwe',48648,0,'1011','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','gewgw','egweg','wegweg','Dublin, Ireland','121654','wegweg','1231653489','user'),
(12,'feq','qwf','wqf',375345453,0,'1012','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','grereg','rgereg','rewggre','Dublin, Ireland','12312','gwegwer','378123','user'),
(13,'fewfw','wefwef','qeqewq',678678,0,'1013','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','thrthr','qwefqewf','rgerwg','Dublin, Ireland','48373','qwdfqwdf','463738','user'),
(14,'gerwgweg','wegweg','wegweg',637863,0,'1014','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','tehrteh','qegfqewgf','wegwg','Dublin, Ireland','37837','rhgrher','73783','user'),
(15,'wegweg','wegweg','wegweg',15615,0,'1015','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','gger','ergerg','gerge','Dublin, Ireland','45646','erger','45646458','user'),
(16,'fwwfq','wqfqwf','qw',786378,0,'1016','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','3greg','erger','wgfewfg','Dublin, Ireland','37837','egtweg','783783','user'),
(17,'ethnerth','ewrherh','erherh',0,0,'1017','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','regerhg','wegfwe','wegweg','Dublin, Ireland','78378','jrtjrt','78676','user'),
(18,'ewgweg','qegweh','wehjerj',0,0,'1018','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','wegweg','wegw','wegweg','Dublin, Ireland','78373','dtykjdt','378387','user'),
(19,'iuhhiu','hiuoui','iuhuhi@jiodfe.com',486,0,'1019','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','huhui','hyyuig','hiuhuhui','Cavan','2024-12-30','uohjo','7887','user');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/* TransactionId, accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName */
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-01-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-02-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-03-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-04-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-05-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-06-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',5000,'2024-07-01 16:54:52','IE17BOFI900017712181','Personal','Employer Co.');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',67,'2024-03-13 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',71,'2024-02-27 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',142,'2024-02-03 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',36,'2024-06-08 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',55,'2024-01-20 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',95,'2024-04-27 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',108,'2024-05-02 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',24,'2024-03-10 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',71,'2024-04-04 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',130,'2024-04-21 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',32,'2024-02-07 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',50,'2024-06-24 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',134,'2024-05-10 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',75,'2024-01-02 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',24,'2024-02-16 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',8,'2024-02-27 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',71,'2024-06-09 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',44,'2024-01-19 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',52,'2024-02-27 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',1,'2024-03-12 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',22,'2024-02-23 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',110,'2024-04-21 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',62,'2024-05-25 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',36,'2024-04-20 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',145,'2024-02-04 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',89,'2024-03-13 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',147,'2024-05-04 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',87,'2024-02-05 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',114,'2024-03-01 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',84,'2024-01-27 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',61,'2024-03-24 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',3,'2024-03-13 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',25,'2024-06-14 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',92,'2024-01-03 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',132,'2024-06-06 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',100,'2024-02-16 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',38,'2024-06-28 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',94,'2024-04-10 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',139,'2024-06-07 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',62,'2024-04-19 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',35,'2024-04-25 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',38,'2024-05-12 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',71,'2024-05-03 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',68,'2024-06-20 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',32,'2024-03-24 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',37,'2024-01-03 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',95,'2024-05-08 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',71,'2024-03-21 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',31,'2024-03-05 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',46,'2024-02-10 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',69,'2024-01-15 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',20,'2024-03-18 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',1,'2024-04-17 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',32,'2024-01-24 12:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',146,'2024-02-16 14:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',59,'2024-04-02 11:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',114,'2024-06-27 13:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',29,'2024-02-06 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',75,'2024-03-02 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',39,'2024-02-10 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',112,'2024-02-10 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',85,'2024-03-28 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',75,'2024-04-11 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',59,'2024-02-06 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',149,'2024-03-15 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',105,'2024-04-12 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',123,'2024-02-03 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',72,'2024-03-16 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',145,'2024-05-02 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',122,'2024-04-26 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',6,'2024-05-27 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',87,'2024-02-27 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',116,'2024-02-14 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',136,'2024-04-27 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',117,'2024-06-04 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',135,'2024-05-19 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',63,'2024-01-03 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',38,'2024-03-04 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',109,'2024-02-06 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',138,'2024-06-21 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',118,'2024-01-25 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',60,'2024-06-10 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',132,'2024-04-11 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',22,'2024-03-09 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',112,'2024-03-09 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',50,'2024-04-03 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',4,'2024-01-14 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',75,'2024-03-05 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',60,'2024-01-08 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',46,'2024-05-21 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',50,'2024-02-06 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',38,'2024-01-08 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',88,'2024-01-16 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',67,'2024-02-08 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',133,'2024-05-12 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',53,'2024-01-27 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',111,'2024-06-05 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',108,'2024-03-09 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',99,'2024-02-06 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',89,'2024-05-03 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',63,'2024-03-12 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',58,'2024-06-10 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',33,'2024-04-06 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',71,'2024-01-04 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',150,'2024-03-17 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',61,'2024-04-26 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',81,'2024-03-27 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',27,'2024-01-07 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',122,'2024-01-22 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',24,'2024-05-24 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',99,'2024-05-11 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',97,'2024-03-11 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',19,'2024-05-11 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',102,'2024-01-13 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',69,'2024-06-12 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',12,'2024-03-04 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',1,'2024-06-27 10:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',150,'2024-04-13 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',27,'2024-03-15 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',46,'2024-05-23 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',78,'2024-03-09 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',136,'2024-01-10 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',79,'2024-04-27 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',10,'2024-04-17 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',23,'2024-06-23 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',100,'2024-04-08 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',139,'2024-03-19 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',32,'2024-02-18 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',17,'2024-04-17 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',107,'2024-04-19 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',11,'2024-04-01 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',38,'2024-04-05 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',41,'2024-02-08 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',35,'2024-04-05 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',28,'2024-06-04 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',33,'2024-02-03 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',102,'2024-02-23 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',45,'2024-03-19 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',27,'2024-04-12 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',56,'2024-05-08 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',148,'2024-06-11 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',150,'2024-06-13 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',110,'2024-04-11 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',73,'2024-06-23 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',94,'2024-03-21 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',120,'2024-06-03 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',55,'2024-06-09 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',137,'2024-06-03 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',123,'2024-02-13 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',110,'2024-03-21 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',25,'2024-01-01 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',51,'2024-02-27 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',133,'2024-02-08 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',34,'2024-04-18 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',37,'2024-01-06 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',135,'2024-05-26 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',92,'2024-03-07 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',24,'2024-02-07 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',134,'2024-02-02 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',135,'2024-03-03 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',119,'2024-05-19 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',1,'2024-04-05 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',140,'2024-04-24 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',5,'2024-02-12 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',104,'2024-04-23 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',36,'2024-05-27 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',101,'2024-01-12 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',11,'2024-02-21 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',29,'2024-01-19 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',32,'2024-05-18 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',26,'2024-06-02 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',85,'2024-01-16 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',75,'2024-01-03 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',80,'2024-02-19 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',137,'2024-02-14 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',82,'2024-04-20 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',108,'2024-02-05 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',46,'2024-05-19 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',42,'2024-05-28 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',120,'2024-05-05 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',105,'2024-03-01 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',95,'2024-06-15 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',78,'2024-02-22 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',79,'2024-04-01 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',102,'2024-02-27 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',42,'2024-03-23 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',89,'2024-05-02 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',77,'2024-03-20 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',124,'2024-02-08 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',63,'2024-05-27 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',75,'2024-06-11 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',24,'2024-01-19 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',107,'2024-01-22 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',88,'2024-02-15 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',77,'2024-05-24 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',117,'2024-02-01 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',105,'2024-03-05 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',133,'2024-05-28 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',16,'2024-05-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',122,'2024-06-24 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',112,'2024-04-17 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',115,'2024-06-13 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',76,'2024-06-14 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',43,'2024-04-21 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',116,'2024-05-15 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',69,'2024-02-03 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',135,'2024-04-16 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',55,'2024-04-23 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',17,'2024-01-28 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',144,'2024-04-02 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',77,'2024-03-21 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',124,'2024-04-19 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',100,'2024-02-19 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',72,'2024-03-24 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',104,'2024-06-07 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',7,'2024-01-25 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',8,'2024-02-15 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',84,'2024-05-11 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',112,'2024-06-13 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',103,'2024-06-11 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',147,'2024-04-02 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',58,'2024-05-27 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',138,'2024-06-23 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',53,'2024-04-16 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',85,'2024-02-27 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',112,'2024-06-27 09:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',121,'2024-03-17 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',23,'2024-05-15 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',14,'2024-01-18 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',119,'2024-05-23 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',8,'2024-05-03 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',18,'2024-06-11 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',116,'2024-02-22 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',7,'2024-02-01 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',135,'2024-03-27 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',121,'2024-02-06 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',135,'2024-06-19 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',35,'2024-03-18 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',67,'2024-05-16 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',86,'2024-01-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',102,'2024-03-28 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',4,'2024-03-25 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',55,'2024-01-26 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',38,'2024-02-08 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',140,'2024-05-07 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',31,'2024-02-06 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',149,'2024-01-23 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',47,'2024-02-18 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',45,'2024-02-12 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',65,'2024-04-02 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',62,'2024-06-10 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',35,'2024-02-04 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',131,'2024-02-01 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',2,'2024-03-22 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',49,'2024-02-05 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',95,'2024-04-12 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',72,'2024-03-15 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',99,'2024-04-08 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',91,'2024-06-03 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',6,'2024-05-09 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',56,'2024-04-07 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',32,'2024-01-15 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',23,'2024-06-15 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',91,'2024-04-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',22,'2024-02-25 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',26,'2024-06-22 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',57,'2024-05-04 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',77,'2024-01-19 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',108,'2024-01-02 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',77,'2024-02-22 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',99,'2024-01-01 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',35,'2024-04-02 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',86,'2024-05-22 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',108,'2024-06-03 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',75,'2024-02-25 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',71,'2024-05-19 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',99,'2024-04-16 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',129,'2024-05-07 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',99,'2024-04-01 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',137,'2024-06-20 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',128,'2024-03-21 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',57,'2024-05-09 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',146,'2024-02-20 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',16,'2024-04-07 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',100,'2024-03-04 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',95,'2024-05-15 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',87,'2024-02-04 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',108,'2024-04-12 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',8,'2024-02-09 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',32,'2024-03-27 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',23,'2024-06-12 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',84,'2024-05-14 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',77,'2024-04-09 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',144,'2024-04-12 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',82,'2024-06-18 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',32,'2024-03-04 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',27,'2024-02-05 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',141,'2024-04-27 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',21,'2024-02-15 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',9,'2024-03-21 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',78,'2024-03-03 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',138,'2024-04-06 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',38,'2024-01-07 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',121,'2024-05-11 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',101,'2024-06-02 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',42,'2024-05-10 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',122,'2024-03-10 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',141,'2024-01-24 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',96,'2024-02-06 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',141,'2024-01-04 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',100,'2024-03-27 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',60,'2024-01-28 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',39,'2024-03-26 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',25,'2024-06-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',64,'2024-03-03 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',56,'2024-02-26 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',150,'2024-02-10 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',45,'2024-01-03 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',137,'2024-06-13 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',40,'2024-06-14 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',57,'2024-03-20 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',98,'2024-03-07 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',91,'2024-04-10 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',23,'2024-02-05 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',35,'2024-01-24 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',58,'2024-01-04 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',117,'2024-01-02 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',68,'2024-03-25 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',108,'2024-06-28 15:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',80,'2024-03-17 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',89,'2024-06-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',70,'2024-02-09 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',43,'2024-02-03 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',23,'2024-06-20 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',132,'2024-04-27 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',31,'2024-03-21 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',121,'2024-06-20 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',121,'2024-06-27 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',114,'2024-02-06 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',130,'2024-01-16 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',135,'2024-02-09 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',96,'2024-06-05 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',114,'2024-01-14 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',32,'2024-02-12 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',63,'2024-03-25 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',14,'2024-04-16 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',6,'2024-05-07 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',26,'2024-05-15 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',97,'2024-04-26 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',133,'2024-04-10 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',120,'2024-01-01 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',33,'2024-05-28 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',131,'2024-04-15 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',82,'2024-01-07 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',49,'2024-02-14 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',80,'2024-06-23 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',142,'2024-03-04 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',32,'2024-01-04 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',8,'2024-04-21 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Hardware','NL27ABNA7020127145',9,'2024-06-20 16:54:52','IE01BOGY91332200000001','Other','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',106,'2024-01-13 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',100,'2024-01-16 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',70,'2024-01-03 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',64,'2024-02-18 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',139,'2024-02-24 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Plumbers','NL27ABNA7020127148',6,'2024-06-21 16:54:52','IE01BOGY91332200000001','Utilities','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',9,'2024-01-14 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',43,'2024-05-05 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',50,'2024-06-22 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',7,'2024-04-14 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Copper Face Jacks','NL27ABNA7020127142',76,'2024-02-01 16:54:52','IE01BOGY91332200000001','Entertainment','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',1,'2024-03-18 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',77,'2024-06-21 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',36,'2024-05-06 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',36,'2024-02-05 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Cash Withdrawal','IE01BOGY91332200000001',109,'2024-02-28 16:54:52',NULL,'Cash Withdrawal',NULL);
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',80,'2024-04-11 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'TESCO Dundrum','NL27ABNA7020127143',140,'2024-02-18 16:54:52','IE01BOGY91332200000001','Groceries','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',76,'2024-06-08 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',113,'2024-06-26 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',69,'2024-06-21 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',7,'2024-01-01 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',73,'2024-03-14 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',58,'2024-02-28 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',70,'2024-04-16 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Chapter One','NL27ABNA7020127141',19,'2024-04-15 16:54:52','IE01BOGY91332200000001','Dining','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',56,'2024-03-20 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',148,'2024-04-06 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',96,'2024-04-06 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','IE01BOGY91332200000001',139,'2024-04-21 16:54:52','IE08BOGY91332200000001','Cash Deposit','Cash Deposit');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dublin Bus','NL27ABNA7020127147',74,'2024-02-22 16:54:52','IE01BOGY91332200000001','Transport','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Dundrum Clinic','NL27ABNA7020127144',76,'2024-01-08 16:54:52','IE01BOGY91332200000001','Healthcare','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'James Smith','NL27ABNA7020127146',126,'2024-02-25 16:54:52','IE01BOGY91332200000001','Personal','Joe Bloggs');


/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
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

-- Create a table for exchange rates
CREATE TABLE exchange_rates_current (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    base_currency VARCHAR(3) NOT NULL,
    target_currency VARCHAR(3) NOT NULL,
    rate DECIMAL(15,6) NOT NULL,
	previous_rate DECIMAL(15,6) NOT NULL,
    timestamp TIMESTAMP NOT NULL
);


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


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 18:09:39
