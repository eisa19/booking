-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2021 at 07:52 PM
-- Server version: 8.0.25
-- PHP Version: 7.3.29-to-be-removed-in-future-macOS

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BookClub`
--
CREATE DATABASE IF NOT EXISTS `BookClub` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BookClub`;

-- --------------------------------------------------------

--
-- Table structure for table `BookReviews`
--

DROP TABLE IF EXISTS `BookReviews`;
CREATE TABLE `BookReviews` (
  `reviewID` int NOT NULL,
  `reviewComments` varchar(1024) DEFAULT NULL,
  `commentDateTime` datetime DEFAULT NULL,
  `Books_bookID` int DEFAULT NULL,
  `Members_memberID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `BookReviews`
--

INSERT INTO `BookReviews` (`reviewID`, `reviewComments`, `commentDateTime`, `Books_bookID`, `Members_memberID`) VALUES
(1, 'Book was short! Needs more context ', '2021-11-26 19:34:24', 456, 123),
(2, 'Book was great! Short stories with no endings', '2021-11-26 19:34:24', 456, 124);

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
  `bookID` int NOT NULL,
  `bookTitle` varchar(128) DEFAULT NULL,
  `authorFirstname` varchar(20) DEFAULT NULL,
  `authorLastname` varchar(45) DEFAULT NULL,
  `publishedYear` int DEFAULT NULL,
  `Members_memberID` int NOT NULL,
  `bookBorrowed` tinyint DEFAULT NULL,
  `bookCoverImage` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`bookID`, `bookTitle`, `authorFirstname`, `authorLastname`, `publishedYear`, `Members_memberID`, `bookBorrowed`, `bookCoverImage`) VALUES
(1, 'Learning PHP, MySQL & JavaScript: With jQuery, CSS & HTML5 (Learning PHP, MYSQL, Javascript, CSS & HTML5) 5th Edition', 'Robert', 'Nixon', 2015, 1, 0, 'newImage'),
(2, 'The Wonderful Things You Will Be', 'Emily', 'Winfield-Martin', 2015, 2, 0, 'No Image'),
(3, 'If Animals Kissed Good Night', 'Ann', 'Paul', 2014, 3, 0, 'Another No Image '),
(4, 'The Very Hungry Caterpillar', 'Eric', 'Carle', 1994, 4, 1, 'Image of a Caterpillar');

-- --------------------------------------------------------

--
-- Table structure for table `BooksBorrowed`
--

DROP TABLE IF EXISTS `BooksBorrowed`;
CREATE TABLE `BooksBorrowed` (
  `borrowID` int NOT NULL,
  `borrowedDate` date DEFAULT NULL,
  `returnedDate` date DEFAULT NULL,
  `borrowedDays` int DEFAULT NULL,
  `Books_bookID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `BooksBorrowed`
--

INSERT INTO `BooksBorrowed` (`borrowID`, `borrowedDate`, `returnedDate`, `borrowedDays`, `Books_bookID`) VALUES
(4, '2021-10-10', '2021-10-19', 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `MemberCredentials`
--

DROP TABLE IF EXISTS `MemberCredentials`;
CREATE TABLE `MemberCredentials` (
  `email` varchar(64) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `Members_memberID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `MemberCredentials`
--

INSERT INTO `MemberCredentials` (`email`, `password`, `Members_memberID`) VALUES
('test2@gmail.com', 'Password', 124),
('test@gmail.com', 'Password', 123);

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
CREATE TABLE `Members` (
  `memberID` int NOT NULL,
  `firstname` varchar(20) DEFAULT NULL COMMENT 'La',
  `lastname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Members`
--

INSERT INTO `Members` (`memberID`, `firstname`, `lastname`) VALUES
(123, 'John', 'Smith'),
(124, 'Jane', 'Dough');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BookReviews`
--
ALTER TABLE `BookReviews`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `fk_BookReviews_Books_idx_idx` (`Books_bookID`),
  ADD KEY `fk_BookReviews_Member_idx_idx` (`Members_memberID`);

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`bookID`,`Members_memberID`),
  ADD KEY `fk_Books_Members1_idx` (`Members_memberID`);

--
-- Indexes for table `BooksBorrowed`
--
ALTER TABLE `BooksBorrowed`
  ADD PRIMARY KEY (`borrowID`),
  ADD KEY `fk_BooksBorrowed_Books_idx_idx` (`Books_bookID`);

--
-- Indexes for table `MemberCredentials`
--
ALTER TABLE `MemberCredentials`
  ADD PRIMARY KEY (`email`,`Members_memberID`),
  ADD KEY `fk_MemberCredentials_Members_idx` (`Members_memberID`);

--
-- Indexes for table `Members`
--
ALTER TABLE `Members`
  ADD PRIMARY KEY (`memberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BookReviews`
--
ALTER TABLE `BookReviews`
  MODIFY `reviewID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Books`
--
ALTER TABLE `Books`
  MODIFY `bookID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `BooksBorrowed`
--
ALTER TABLE `BooksBorrowed`
  MODIFY `borrowID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Members`
--
ALTER TABLE `Members`
  MODIFY `memberID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookReviews`
--
ALTER TABLE `BookReviews`
  ADD CONSTRAINT `fk_BookReviews_Books_idx` FOREIGN KEY (`Books_bookID`) REFERENCES `Books` (`bookID`),
  ADD CONSTRAINT `fk_BookReviews_Member_idx` FOREIGN KEY (`Members_memberID`) REFERENCES `Members` (`memberID`);

--
-- Constraints for table `Books`
--
ALTER TABLE `Books`
  ADD CONSTRAINT `fk_Books_Members1` FOREIGN KEY (`Members_memberID`) REFERENCES `Members` (`memberID`);

--
-- Constraints for table `BooksBorrowed`
--
ALTER TABLE `BooksBorrowed`
  ADD CONSTRAINT `fk_BooksBorrowed_Books_idx` FOREIGN KEY (`Books_bookID`) REFERENCES `Books` (`bookID`);

--
-- Constraints for table `MemberCredentials`
--
ALTER TABLE `MemberCredentials`
  ADD CONSTRAINT `fk_MemberCredentials_Members` FOREIGN KEY (`Members_memberID`) REFERENCES `Members` (`memberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
