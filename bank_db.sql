-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 17, 2024 at 10:02 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountId` int(10) UNSIGNED NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `AccountType` varchar(30) NOT NULL,
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountId`, `CustomerId`, `AccountType`, `Balance`) VALUES
(1, 1, 'Current', 500);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryId` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Currency` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`CountryId`, `CountryName`, `Currency`) VALUES
(1, 'Rep. of Ireland', 'EUR'),
(2, 'United Kingdom', 'GBP'),
(3, 'United States', 'USD'),
(4, 'France', 'EUR'),
(5, 'Germany', 'EUR'),
(6, 'Austria', 'EUR'),
(7, 'Belgium', 'EUR'),
(8, 'Finland', 'EUR'),
(9, 'Italy', 'EUR'),
(10, 'Netherlands', 'EUR'),
(11, 'Portugal', 'EUR'),
(12, 'Spain', 'EUR'),
(13, 'Australia', 'AUD'),
(14, 'Canada', 'CAD'),
(15, 'Poland', 'PLN');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(10) AUTO_INCREMENT PRIMARY KEY,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` int(11) NOT NULL,
  `CountryId` int(11) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `AddrLine1` varchar(255) NOT NULL,
  `AddrLine2` varchar(255) NOT NULL,
  `TownCity` varchar(50) NOT NULL,
  `CountyState` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `idType` varchar(50) NOT NULL,
  `idNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`FirstName`, `LastName`, `Email`, `Phone`, `CountryId`, `Password`, `AddrLine1`, `AddrLine2`, `TownCity`, `CountyState`, `dob`, `idType` , `idNumber`) VALUES
('Joe', 'Bloggs', 'sample@test.com', 851234567, 1, 'aNuNeNcRyPtEdPaSsWoRd', '123 Fake Street', 'Townsville', 'Galway', 'Co. Galway', '03/03/2000', 'Passport', 'DV2032SDA'),
('John', 'Smith', 'testsample@test.com', 879876543, 3, 'Pass123!', '456 Not A Place', 'Somewhere', 'Dallas', 'Texas', '04/12/2003', 'NationalID', 'DSAD21231');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `RecipientId` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `AccountId`, `RecipientId`, `Amount`, `Timestamp`) VALUES
(1, 1, 2, 20, '2024-04-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountId`),
  ADD UNIQUE KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryId`);


--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`),
  ADD UNIQUE KEY `AccountId` (`AccountId`,`RecipientId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `AccountId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `CountryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
