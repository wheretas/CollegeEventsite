-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 06:41 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
CREATE DATABASE IF NOT EXISTS 'eventsite' DEFAULT CHARACTER SET utf8 COLLATE
utf8_unicode_ci; 
USE 'eventsite';


CREATE TABLE `admin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`) VALUES
('aober@ucf.edu'),
('blackmamba@ucf.edu'),
('cevins@ucf.edu'),
('leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `adminaffiliated`
--

CREATE TABLE `adminaffiliated` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admincreateprivate`
--

CREATE TABLE `admincreateprivate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admincreateprivate`
--

INSERT INTO `admincreateprivate` (`name`, `email`) VALUES
('Engineering Convention', 'leo10@ucf.edu'),
('Rugby Game Meeting', 'leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `admincreatepublic`
--

CREATE TABLE `admincreatepublic` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admincreatepublic`
--

INSERT INTO `admincreatepublic` (`name`, `email`) VALUES
('dodgeball tourny', 'leo10@ucf.edu'),
('Universal Knights Meeting', 'leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `admincreatesevent`
--

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
-- Dumping data for table `admincreatesevent`
--

INSERT INTO `admincreatesevent` (`name`, `email`, `category`, `type`, `date`, `time`, `contactEmail`, `contactPhone`, `description`, `locationName`, `eventID`) VALUES
('dodgeball tourny', 'leo10@ucf.edu', 'Sports', 'Public', '2017-12-03', '14:30:00', 'leo10@ucf.edu', '123-456-7894', 'do u dodge some balls?', 'Gym', 22),
('Engineering Convention', 'leo10@ucf.edu', 'Sports', 'Private', '2017-07-21', '12:00:00', 'leo10@ucf.edu', '789-456-4562', 'need a job? come and network!', 'CFE Arena', 16),
('Kendrick Lamar Concert', 'leo10@ucf.edu', 'Other', 'Public', '2017-11-14', '21:40:00', 'blackmamba@ucf.edu', '789-456-1341', 'Rapper Kendrick Lamar will be on campus for his yearly tour!', 'CFE Area', 10),
('Resume Critique', 'leo10@ucf.edu', 'Other', 'Public', '2017-07-23', NULL, 'leo10@ucf.edu', '456-789-4132', 'Come and get your resume checked!', 'Library', 7),
('Rugby Game Meeting', 'leo10@ucf.edu', 'Sports', 'Private', '2017-04-30', '09:00:00', 'leo10@ucf.edu', '741-852-8529', 'Review last games tapes', 'Rec and Wellness Center', 15),
('Soccer Clinic', 'leo10@ucf.edu', 'Sports', 'Public', '2017-08-24', NULL, 'leo10@ucf.edu', '789-456-4561', 'Come and practice with the FC Barcelona squad!', 'IM Fields UCF', 8),
('Twitter Speaker ', 'leo10@ucf.edu', 'Tech Talks', 'Public', NULL, NULL, 'leo10@ucf.edu', '461-465-4612', 'Twitter CEO will be on campus talking about opportunities', 'Harris Building', 6),
('Universal Knights Meeting', 'leo10@ucf.edu', 'Other', 'Public', '2017-05-21', '17:00:00', 'leo10@ucf.edu', '963-852-8527', 'Discuss the upcoming field trip!', 'Study Union', 13);

-- --------------------------------------------------------

--
-- Table structure for table `eventlocation`
--

CREATE TABLE `eventlocation` (
  `eventID` int(11) NOT NULL,
  `locationName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eventlocation`
--

INSERT INTO `eventlocation` (`eventID`, `locationName`, `latitude`, `longitude`) VALUES
(6, 'Harris Building', 20.000000, -81.000000),
(7, 'Library', 31.000000, -81.000000),
(8, 'IM Fields UCF', 26.000000, -81.000000),
(9, '', 0.000000, 0.000000),
(10, 'CFE Area', 64.000000, -81.000000),
(11, 'Student Union', 24.000000, -81.000000),
(12, 'Student Union', 24.000000, -81.000000),
(13, 'Study Union', 21.000000, -81.000000),
(15, 'Rec and Wellness Center', 21.000000, -81.000000),
(16, 'CFE Arena', 28.604944, -81.200348),
(17, 'CFE Arena', 28.602571, -81.200111),
(18, 'gym', 28.602571, -81.200111),
(19, 'dad', 28.602571, -81.200111),
(20, 'adad', 28.602571, -81.200111),
(21, 'adad', 28.602571, -81.200111),
(22, 'Gym', 28.602571, -81.200111);

-- --------------------------------------------------------

--
-- Table structure for table `rso`
--

CREATE TABLE `rso` (
  `rsoNAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rso`
--

INSERT INTO `rso` (`rsoNAME`, `email`) VALUES
('ChickFilA Club', 'aober@ucf.edu'),
('Christmas Charity Event', 'blackmamba@ucf.edu'),
('Culture Parade', 'cevins@ucf.edu'),
('Cancer Fundraiser 2k17', 'leo10@ucf.edu'),
('Sports Meeting', 'leo10@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `rsocreatedrsoevent`
--

CREATE TABLE `rsocreatedrsoevent` (
  `rsoName` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('leo10@ucf.edu'),
('lol@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `studentcomments`
--

CREATE TABLE `studentcomments` (
  `id` int(30) NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `studentcomments`
--

INSERT INTO `studentcomments` (`id`, `email`, `comment`, `rating`, `name`) VALUES
(13, 'aober@ucf.edu', 'qfsf', '4', 'dodgeball tourny');

-- --------------------------------------------------------

--
-- Table structure for table `studentjoinsrso`
--

CREATE TABLE `studentjoinsrso` (
  `id` int(30) NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `rsoName` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `studentjoinsrso`
--

INSERT INTO `studentjoinsrso` (`id`, `email`, `rsoName`) VALUES
(11, 'lol@ucf.edu', 'Cancer Fundraiser 2k17'),
(14, 'lol@ucf.edu', 'Christmas Charity Event');

-- --------------------------------------------------------

--
-- Table structure for table `studentmakesrso`
--

CREATE TABLE `studentmakesrso` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--

CREATE TABLE `superadmin` (
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `superadmincreate` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numStudents` int(11) DEFAULT NULL,
  `type` enum('Public','Private') COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `superadmincreate`
--

INSERT INTO `superadmincreate` (`name`, `location`, `numStudents`, `type`, `email`) VALUES
('University of Central Florida', 'Orlando, FL', 60000, 'Public', 'mcohrs@ucf.edu'),
('University of Florida', 'Gainsville, FL', 50000, 'Public', 'mcohrs@ucf.edu');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(NULL, 'Laura', 'Laugh', 'lol@ucf.edu', 'lol'),
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
  ADD KEY `email` (`email`),
  ADD KEY `rsoNAME` (`rsoNAME`),
  ADD KEY `rsoNAME_2` (`rsoNAME`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studentjoinsrso`
--
ALTER TABLE `studentjoinsrso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentjoinsrso_ibfk_1` (`email`),
  ADD KEY `studentjoinsrso_ibfk_2` (`rsoName`);

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
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `studentcomments`
--
ALTER TABLE `studentcomments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `studentjoinsrso`
--
ALTER TABLE `studentjoinsrso`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
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
  ADD CONSTRAINT `admincreateprivate_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`);

--
-- Constraints for table `admincreatepublic`
--
ALTER TABLE `admincreatepublic`
  ADD CONSTRAINT `admincreatepublic_ibfk_1` FOREIGN KEY (`name`) REFERENCES `admincreatesevent` (`name`),
  ADD CONSTRAINT `admincreatepublic_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`);

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
  ADD CONSTRAINT `rso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admin` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `studentjoinsrso`
--
ALTER TABLE `studentjoinsrso`
  ADD CONSTRAINT `studentjoinsrso_ibfk_1` FOREIGN KEY (`email`) REFERENCES `student` (`email`),
  ADD CONSTRAINT `studentjoinsrso_ibfk_2` FOREIGN KEY (`rsoName`) REFERENCES `rso` (`rsoNAME`);

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
