-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 15, 2020 at 04:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libheros`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `distance` (`lng1` DECIMAL(10,5), `lat1` DECIMAL(10,5), `lng2` DECIMAL(10,5), `lat2` DECIMAL(10,5)) RETURNS DECIMAL(10,5) BEGIN
	DECLARE x DECIMAL(10,5);
    DECLARE y DECIMAL(10,5);
    DECLARE dist DECIMAL(10,5);
	SET x = (lng1-lng2)*COS((lat1+lat2)/2);
	SET y = (lat1-lat2);
	SET dist = 1825*60*SQRT(x*x+y*y);
	RETURN dist;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `distance2` (`lng1` FLOAT, `lat1` FLOAT, `lng2` FLOAT, `lat2` FLOAT) RETURNS FLOAT BEGIN
	DECLARE x FLOAT;
    DECLARE y FLOAT;
    DECLARE dist FLOAT;
	SET x = (lng1-lng2)*COS((lat1+lat2)/2);
	SET y = (lat1-lat2);
	SET dist = 1825*60*SQRT(x*x+y*y);
	RETURN dist;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `distance3` (`lng1` FLOAT, `lat1` FLOAT, `lng2` FLOAT, `lat2` FLOAT) RETURNS FLOAT BEGIN DECLARE x FLOAT; 
	DECLARE y FLOAT; 
	DECLARE dist FLOAT; 
	SET x = (lng1-lng2)*COS((lat1+lat2)/2); 
	SET y = (lat1-lat2); 
	SET dist = 1.825*60*SQRT(x*x+y*y); 
	RETURN dist; 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `distance6` (`lng1` FLOAT, `lat1` FLOAT, `lng2` FLOAT, `lat2` FLOAT) RETURNS FLOAT BEGIN DECLARE x FLOAT; 
	DECLARE y FLOAT; 
	DECLARE dist FLOAT; 
	SET x = (lng1-lng2)*COS((lat1+lat2)*90/PI); 
	SET y = (lat1-lat2); 
	SET dist = 1.825*60*SQRT(x*x+y*y); 
	RETURN dist; 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `distance7` (`lng1` FLOAT, `lat1` FLOAT, `lng2` FLOAT, `lat2` FLOAT) RETURNS FLOAT BEGIN DECLARE x FLOAT; 
	DECLARE y FLOAT; 
	DECLARE dist FLOAT; 
	SET x = (lng1-lng2)*COS((lat1+lat2)*90/PI()); 
	SET y = (lat1-lat2); 
	SET dist = 1.825*60*SQRT(x*x+y*y); 
	RETURN dist; 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `distanceCoord` (`lng1` FLOAT, `lat1` FLOAT, `lng2` FLOAT, `lat2` FLOAT) RETURNS FLOAT BEGIN DECLARE x FLOAT; 
	DECLARE y FLOAT; 
	DECLARE dist FLOAT; 
	SET x = (lng1-lng2)*COS((lat1+lat2)*90/PI()); 
	SET y = (lat1-lat2); 
	SET dist = 1.825*60*SQRT(x*x+y*y); 
	RETURN dist; 
END$$

CREATE FUNCTION distanceCoord(lng1 FLOAT, lat1 FLOAT, lng2 FLOAT, lat2 FLOAT) RETURNS FLOAT 
BEGIN 
	DECLARE x FLOAT; 
	DECLARE y FLOAT; 
	DECLARE dist FLOAT; 
	SET x = (lng1-lng2)*COS((lat1+lat2)*90/PI()); 
	SET y = (lat1-lat2); 
	SET dist = 1.825*60*SQRT(x*x+y*y); 
	RETURN dist; 
END$$
DELIMITER ;

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accepted_cares`
--

CREATE TABLE `accepted_cares` (
  `idSoignant` int(11) NOT NULL,
  `idSoin` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accepted_cares`
--

INSERT INTO `accepted_cares` (`idSoignant`, `idSoin`, `id`) VALUES
(1, 1, 1),
(1, 4, 2),
(1, 2, 3),
(1, 3, 4),
(5, 1, 5),
(5, 3, 6),
(10, 1, 7),
(9, 1, 8),
(9, 2, 9),
(2, 1, 10),
(2, 2, 11),
(2, 3, 12),
(8, 4, 13),
(8, 4, 14),
(6, 1, 15),
(6, 3, 16),
(6, 4, 17),
(3, 1, 18),
(3, 2, 19),
(4, 1, 20),
(7, 1, 21),
(7, 2, 22),
(7, 4, 23);

-- --------------------------------------------------------

--
-- Table structure for table `soignants`
--

CREATE TABLE `soignants` (
  `id` int(11) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `office_latitude` float NOT NULL,
  `office_longitude` float NOT NULL,
  `radius` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soignants`
--

INSERT INTO `soignants` (`id`, `lastname`, `firstname`, `office_latitude`, `office_longitude`, `radius`) VALUES
(1, 'Cauchy', 'Pierre', 48.8274, 2.31434, 0.5),
(2, 'Germain', 'Sophie', 48.8812, 2.31719, 1),
(3, 'Laplace', 'Pierre-Simon', 43.3236, 5.38485, 2.5),
(4, 'Lovelace', 'Ada', 48.8368, 2.3793, 2),
(5, 'Curie', 'Marie', 48.8548, 2.3793, 2),
(6, 'Hopper', 'Grace', 48.8685, 2.34293, 3),
(7, 'Turing', 'Alan', 47.3892, 0.692637, 2),
(8, 'Hamilton', 'Margaret', 48.899, 2.38864, 1.5),
(9, 'Euler', 'Leonhard', 48.9123, 2.22516, 0.5),
(10, 'Einstein', 'Albert', 48.8702, 2.32833, 5);

-- --------------------------------------------------------

--
-- Table structure for table `soins`
--

CREATE TABLE `soins` (
  `idSoin` int(11) NOT NULL,
  `nom` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soins`
--

INSERT INTO `soins` (`idSoin`, `nom`) VALUES
(1, 'injections'),
(2, 'pansements'),
(3, 'perfusions'),
(4, 'dialyse');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_cares`
--
ALTER TABLE `accepted_cares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSoignant` (`idSoignant`),
  ADD KEY `idSoin` (`idSoin`);

--
-- Indexes for table `soignants`
--
ALTER TABLE `soignants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soins`
--
ALTER TABLE `soins`
  ADD PRIMARY KEY (`idSoin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accepted_cares`
--
ALTER TABLE `accepted_cares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `soignants`
--
ALTER TABLE `soignants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `soins`
--
ALTER TABLE `soins`
  MODIFY `idSoin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accepted_cares`
--
ALTER TABLE `accepted_cares`
  ADD CONSTRAINT `accepted_cares_ibfk_1` FOREIGN KEY (`idSoignant`) REFERENCES `soignants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accepted_cares_ibfk_2` FOREIGN KEY (`idSoin`) REFERENCES `soins` (`idSoin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
