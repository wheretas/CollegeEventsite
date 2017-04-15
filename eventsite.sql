-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2017 at 04:47 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventsite`
--
CREATE DATABASE IF NOT EXISTS `eventsite` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `eventsite`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `admin`:
--   `email`
--       `users` -> `email`
--

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`) VALUES
('blackmamba@ucf.edu'),
('cevins@ucf.edu'),
('leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `adminaffiliated`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `adminaffiliated`;
CREATE TABLE `adminaffiliated` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `adminaffiliated`:
--   `email`
--       `admin` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `admincreateprivate`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `admincreateprivate`;
CREATE TABLE `admincreateprivate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `admincreateprivate`:
--   `name`
--       `admincreatesevent` -> `name`
--   `email`
--       `admin` -> `email`
--   `email`
--       `superadmin` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `admincreatepublic`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `admincreatepublic`;
CREATE TABLE `admincreatepublic` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `admincreatepublic`:
--   `name`
--       `admincreatesevent` -> `name`
--   `email`
--       `admin` -> `email`
--   `email`
--       `superadmin` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `admincreatesevent`
--
-- Creation: Apr 14, 2017 at 11:04 PM
--

DROP TABLE IF EXISTS `admincreatesevent`;
CREATE TABLE `admincreatesevent` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` enum('Sports','Food','Fundraiser','Tech Talks','Tailgate','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('Public','Private','RSO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `contactEmail` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactPhone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locationName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `eventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- RELATIONS FOR TABLE `admincreatesevent`:
--   `email`
--       `admin` -> `email`
--   `eventID`
--       `eventlocation` -> `eventID`
--

--
-- Dumping data for table `admincreatesevent`
--

INSERT INTO `admincreatesevent` (`name`, `email`, `category`, `type`, `date`, `time`, `contactEmail`, `contactPhone`, `description`, `locationName`, `eventID`) VALUES
('fafa', 'blackmamba@ucf.edu', 'Fundraiser', 'Private', NULL, NULL, 'leo10@ucf.edu', '9549931325', 'fafaf', 'faf', 5);

-- --------------------------------------------------------

--
-- Table structure for table `eventlocation`
--
-- Creation: Apr 14, 2017 at 10:47 PM
--

DROP TABLE IF EXISTS `eventlocation`;
CREATE TABLE `eventlocation` (
  `eventID` int(11) NOT NULL,
  `locationName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `eventlocation`:
--

--
-- Dumping data for table `eventlocation`
--

INSERT INTO `eventlocation` (`eventID`, `locationName`, `latitude`, `longitude`) VALUES
(1, 'jungle', 1.000000, 2.000000),
(2, 'faf', 1.000000, 2.000000),
(3, 'faf', 1.000000, 2.000000),
(4, 'faf', 1.000000, 2.000000),
(5, 'faf', 1.000000, 2.000000);

-- --------------------------------------------------------

--
-- Table structure for table `rso`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `rso`;
CREATE TABLE `rso` (
  `rsoNAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `rso`:
--   `email`
--       `admin` -> `email`
--

--
-- Dumping data for table `rso`
--

INSERT INTO `rso` (`rsoNAME`, `email`) VALUES
('Christmas Charity Event', 'blackmamba@ucf.edu'),
('Culture Parade', 'cevins@ucf.edu'),
('Cancer Fundraiser 2k17', 'leo10@ucf.edu'),
('Sports Meeting', 'leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `rsocreatedrsoevent`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `rsocreatedrsoevent`;
CREATE TABLE `rsocreatedrsoevent` (
  `rsoName` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `rsocreatedrsoevent`:
--   `rsoName`
--       `rso` -> `rsoNAME`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `student`:
--   `email`
--       `users` -> `email`
--

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`email`) VALUES
('aober@ucf.edu'),
('blackmamba@ucf.edu'),
('cevins@ucf.edu'),
('elamont@ucf.edu'),
('jpattee@ucf.edu'),
('Kriskross@ucf.edu'),
('lbog@ucf.edu'),
('leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `studentcomments`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `studentcomments`;
CREATE TABLE `studentcomments` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `studentcomments`:
--   `email`
--       `student` -> `email`
--   `name`
--       `admincreatesevent` -> `name`
--

-- --------------------------------------------------------

--
-- Table structure for table `studentjoinsrso`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `studentjoinsrso`;
CREATE TABLE `studentjoinsrso` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `studentjoinsrso`:
--   `email`
--       `student` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `studentmakesrso`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `studentmakesrso`;
CREATE TABLE `studentmakesrso` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `studentmakesrso`:
--   `email`
--       `student` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `superadmin`;
CREATE TABLE `superadmin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `superadmin`:
--   `email`
--       `users` -> `email`
--

--
-- Dumping data for table `superadmin`
--

INSERT INTO `superadmin` (`email`) VALUES
('amerryman@ucf.edu'),
('James10@ucf.edu'),
('mcohrs@ucf.edu'),
('mroush@ucf.edu'),
('sbirm@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `superadmincreate`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `superadmincreate`;
CREATE TABLE `superadmincreate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numStudents` int(11) DEFAULT NULL,
  `type` enum('Public','Private') COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `superadmincreate`:
--   `email`
--       `superadmin` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Apr 04, 2017 at 09:00 PM
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(NULL, 'Ara', 'Merryman', 'amerryman@ucf.edu', 'passcode4'),
(NULL, 'Arron ', 'Ober', 'aober@ucf.edu', 'password6'),
(NULL, 'Kobe', 'Bryant', 'blackmamba@ucf.edu', 'lakers'),
(NULL, 'Cherie ', 'Evans', 'cevins@ucf.edu', 'password2'),
(NULL, 'Estella ', 'Lamont', 'elamont@ucf.edu', 'password1'),
(NULL, 'James', 'Rodruiguez', 'James10@ucf.edu', 'colombia'),
(NULL, 'Janeen', 'Pattee', 'jpattee@ucf.edu', 'password5'),
(NULL, 'Lebron', 'James', 'kingjames@knights.ucf.edu', 'heatcavs'),
(NULL, 'Kristofer', 'Lover', 'Kriskross@ucf.edu', 'password4'),
(NULL, 'Lorette ', 'Boggess', 'lbog@ucf.edu', 'password3'),
(NULL, 'Lionel', 'Messi', 'leo10@ucf.edu', 'soccer'),
(NULL, 'Marlon', 'Cohrs', 'mcohrs@ucf.edu', 'passcode2'),
(NULL, 'Marielle', 'Roush', 'mroush@ucf.edu', 'passcode1'),
(NULL, 'Steve', 'Birmingham', 'sbirm@ucf.edu', 'passcode3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `adminaffiliated`
--
ALTER TABLE `adminaffiliated`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `admincreateprivate`
--
ALTER TABLE `admincreateprivate`
  ADD PRIMARY KEY (`name`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `admincreatepublic`
--
ALTER TABLE `admincreatepublic`
  ADD PRIMARY KEY (`name`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `admincreatesevent`
--
ALTER TABLE `admincreatesevent`
  ADD PRIMARY KEY (`name`,`eventID`),
  ADD KEY `email` (`email`),
  ADD KEY `eventID` (`eventID`);

--
-- Indexes for table `eventlocation`
--
ALTER TABLE `eventlocation`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `rso`
--
ALTER TABLE `rso`
  ADD PRIMARY KEY (`rsoNAME`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `rsocreatedrsoevent`
--
ALTER TABLE `rsocreatedrsoevent`
  ADD PRIMARY KEY (`rsoName`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `studentcomments`
--
ALTER TABLE `studentcomments`
  ADD PRIMARY KEY (`email`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `studentjoinsrso`
--
ALTER TABLE `studentjoinsrso`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `studentmakesrso`
--
ALTER TABLE `studentmakesrso`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `superadmincreate`
--
ALTER TABLE `superadmincreate`
  ADD PRIMARY KEY (`name`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eventlocation`
--
ALTER TABLE `eventlocation`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `adminaffiliated`
--
ALTER TABLE `adminaffiliated`
  ADD CONSTRAINT `adminaffiliated_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`);

--
-- Constraints for table `admincreateprivate`
--
ALTER TABLE `admincreateprivate`
  ADD CONSTRAINT `admincreateprivate_ibfk_1` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`),
  ADD CONSTRAINT `admincreateprivate_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`),
  ADD CONSTRAINT `admincreateprivate_ibfk_3` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`);

--
-- Constraints for table `admincreatepublic`
--
ALTER TABLE `admincreatepublic`
  ADD CONSTRAINT `admincreatepublic_ibfk_1` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`),
  ADD CONSTRAINT `admincreatepublic_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`),
  ADD CONSTRAINT `admincreatepublic_ibfk_3` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`);

--
-- Constraints for table `admincreatesevent`
--
ALTER TABLE `admincreatesevent`
  ADD CONSTRAINT `admincreatesevent_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admincreatesevent_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `eventlocation` (`eventID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rso`
--
ALTER TABLE `rso`
  ADD CONSTRAINT `rso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`);

--
-- Constraints for table `rsocreatedrsoevent`
--
ALTER TABLE `rsocreatedrsoevent`
  ADD CONSTRAINT `rsocreatedrsoevent_ibfk_1` FOREIGN KEY (`rsoName`) REFERENCES `rso` (`rsoNAME`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `studentcomments`
--
ALTER TABLE `studentcomments`
  ADD CONSTRAINT `studentcomments_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`),
  ADD CONSTRAINT `studentcomments_ibfk_2` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`);

--
-- Constraints for table `studentjoinsrso`
--
ALTER TABLE `studentjoinsrso`
  ADD CONSTRAINT `studentjoinsrso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`);

--
-- Constraints for table `studentmakesrso`
--
ALTER TABLE `studentmakesrso`
  ADD CONSTRAINT `studentmakesrso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`);

--
-- Constraints for table `superadmin`
--
ALTER TABLE `superadmin`
  ADD CONSTRAINT `superadmin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `superadmincreate`
--
ALTER TABLE `superadmincreate`
  ADD CONSTRAINT `superadmincreate_ibfk_1` FOREIGN KEY (`email`) REFERENCES `superadmin` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
