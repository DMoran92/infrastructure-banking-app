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
(1,'Joe','Bloggs','sample@test.com',851234567,1,'1111','$2a$10$ga7vy9yHkzmRiELdXx2hfu23GV91pLbeEM5FQ4N0ONReDkLG9lAfy','123 Fake Street','Townsville','Galway','Co. Galway','03/03/2000','Passport','DV2032SDA','user'),
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
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName)   VALUES (1,'John Smith','IE01BOGY91332200000002',524,'2024-03-22 16:54:52','IE08BOGY91332200000001','Transfer','Joe Bloggs');
INSERT INTO transaction (accountId, RecipientName, RecipientIBAN,amount,Timestamp,SenderIBAN,Category,SenderName) VALUES (1,'Joe Bloggs','',925,'2024-05-11 16:54:52','','Other','');

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 18:09:39
