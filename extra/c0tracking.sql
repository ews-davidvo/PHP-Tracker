-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2022 at 04:18 PM
-- Server version: 10.3.32-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c0tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `UrlActivity`
--

CREATE TABLE `UrlActivity` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `country` text NOT NULL,
  `city` text DEFAULT NULL,
  `region` text NOT NULL,
  `continent` text DEFAULT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `timezone` text DEFAULT NULL,
  `useragent` text NOT NULL,
  `urlLocationID` int(11) NOT NULL,
  `projectID` int(10) NOT NULL,
  `dateCreated` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UrlActivity`
--

INSERT INTO `UrlActivity` (`id`, `ip`, `country`, `city`, `region`, `continent`, `latitude`, `longitude`, `timezone`, `useragent`, `urlLocationID`, `projectID`, `dateCreated`) VALUES
(2, '72.38.224.26', 'Canada', 'Leamington', '', 'North America', '42.0545', '-82.6043', 'America/Toronto', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1, 0, '2021-12-28 21:31:04'),
(3, '72.38.224.26', 'Canada', 'Leamington', 'Ontario', 'North America', '42.0545', '-82.6043', 'America/Toronto', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1, 0, '2022-01-04 20:31:21'),
(4, '37.19.211.131', 'Ukraine', '', '', 'Europe', '50.4522', '30.5287', 'Europe/Kiev', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.116 Mobile/15E148 Safari/604.1', 1, 0, '2022-01-04 20:32:06'),
(5, '72.38.224.26', 'Canada', 'Leamington', 'Ontario', 'North America', '42.0545', '-82.6043', 'America/Toronto', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1, 0, '2022-01-04 20:39:21'),
(6, '72.38.224.26', 'Canada', 'Leamington', 'Ontario', 'North America', '42.0545', '-82.6043', 'America/Toronto', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1, 1, '2022-01-04 21:17:10'),
(7, '72.38.224.26', 'Canada', 'Leamington', 'Ontario', 'North America', '42.0545', '-82.6043', 'America/Toronto', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1, 1, '2022-01-04 21:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `UrlDeparments`
--

CREATE TABLE `UrlDeparments` (
  `id` int(11) NOT NULL,
  `departmentName` text NOT NULL,
  `departmentManager` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UrlDeparments`
--

INSERT INTO `UrlDeparments` (`id`, `departmentName`, `departmentManager`) VALUES
(1, 'Marketing', 'David Vo'),
(2, 'Sales', 'Pat O&#39Rourke'),
(3, 'Human Resource', 'Rebecca Vermeulen'),
(4, 'Estimating', 'Daniel Splint'),
(5, 'Purchasing', 'David Khran'),
(6, 'Accounting', 'Tony Vannogerren'),
(7, 'Shipping', 'Vanessa Small'),
(8, 'General Labour', '');

-- --------------------------------------------------------

--
-- Table structure for table `UrlList`
--

CREATE TABLE `UrlList` (
  `id` int(11) NOT NULL,
  `redirectURL` text NOT NULL,
  `hostedLocationID` int(11) NOT NULL,
  `urlProjectID` int(11) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UrlList`
--

INSERT INTO `UrlList` (`id`, `redirectURL`, `hostedLocationID`, `urlProjectID`, `dateCreated`) VALUES
(1, 'https://essexweldsolutions.com/jobs.php', 1, 1, '2021-12-28 18:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `UrlLocations`
--

CREATE TABLE `UrlLocations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UrlLocations`
--

INSERT INTO `UrlLocations` (`id`, `name`, `url`) VALUES
(1, 'LinkedIn', 'https://www.linkedin.com/'),
(2, 'Indeed', 'https://ca.indeed.com/'),
(3, 'Email', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UrlProjects`
--

CREATE TABLE `UrlProjects` (
  `id` int(11) NOT NULL,
  `projectName` text NOT NULL,
  `deparment` int(11) NOT NULL,
  `goalClicks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `UrlActivity`
--
ALTER TABLE `UrlActivity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `urlLocationID_fk` (`urlLocationID`) USING BTREE;

--
-- Indexes for table `UrlDeparments`
--
ALTER TABLE `UrlDeparments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UrlList`
--
ALTER TABLE `UrlList`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostedLocation_fk` (`hostedLocationID`);

--
-- Indexes for table `UrlLocations`
--
ALTER TABLE `UrlLocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UrlProjects`
--
ALTER TABLE `UrlProjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `UrlActivity`
--
ALTER TABLE `UrlActivity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `UrlDeparments`
--
ALTER TABLE `UrlDeparments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `UrlList`
--
ALTER TABLE `UrlList`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UrlLocations`
--
ALTER TABLE `UrlLocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `UrlProjects`
--
ALTER TABLE `UrlProjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `UrlActivity`
--
ALTER TABLE `UrlActivity`
  ADD CONSTRAINT `urlLocationID_fr` FOREIGN KEY (`urlLocationID`) REFERENCES `UrlList` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UrlList`
--
ALTER TABLE `UrlList`
  ADD CONSTRAINT `hostedLocation_fk` FOREIGN KEY (`hostedLocationID`) REFERENCES `UrlLocations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
