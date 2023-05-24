-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 08:30 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookreviews`
--

CREATE TABLE `bookreviews` (
  `reviewID` int(11) NOT NULL,
  `reviewComments` varchar(1024) DEFAULT NULL,
  `commentDateTime` datetime DEFAULT NULL,
  `Books_bookID` int(11) DEFAULT NULL,
  `Members_memberID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookreviews`
--

INSERT INTO `bookreviews` (`reviewID`, `reviewComments`, `commentDateTime`, `Books_bookID`, `Members_memberID`) VALUES
(1, '“Two things are infinite: the universe and human stupidity; and Im not sure about the universe.”\r\n― Albert Einstein', '2021-12-08 15:53:23', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookID` int(11) NOT NULL,
  `bookTitle` varchar(128) DEFAULT NULL,
  `authorFirstname` varchar(20) DEFAULT NULL,
  `authorLastname` varchar(45) DEFAULT NULL,
  `publishedYear` int(11) DEFAULT NULL,
  `Members_memberID` int(11) NOT NULL,
  `bookBorrowed` tinyint(4) DEFAULT NULL,
  `bookCoverImage` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `bookTitle`, `authorFirstname`, `authorLastname`, `publishedYear`, `Members_memberID`, `bookBorrowed`, `bookCoverImage`) VALUES
(1, 'The Wonderful Book', 'Bob', 'Bobberson', 1989, 1, 1, 'Image of a Caterpillar'),
(2, 'Learning PHP, MySQL & JavaScript: With jQuery, CSS & HTML5 (Learning PHP, MYSQL, Javascript, CSS & HTML5) 5th Edition', 'Robert', 'Nixon', 2015, 1, 0, 'newImage'),
(3, 'The Wonderful Things You Will Be', 'Emily', 'Winfield-Martin', 2015, 2, 0, 'No Image'),
(4, 'If Animals Kissed Good Night', 'Ann', 'Paul', 2014, 3, 0, 'Another No Image '),
(5, 'The Very Hungry Caterpillar', 'Eric', 'Carle', 1994, 4, 0, 'Image of a Caterpillar'),
(7, 'test', 'razmik', 'a', 2021, 4, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booksborrowed`
--

CREATE TABLE `booksborrowed` (
  `borrowID` int(11) NOT NULL,
  `borrowedDate` date DEFAULT NULL,
  `returnedDate` date DEFAULT NULL,
  `borrowedDays` int(11) DEFAULT NULL,
  `Books_bookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booksborrowed`
--

INSERT INTO `booksborrowed` (`borrowID`, `borrowedDate`, `returnedDate`, `borrowedDays`, `Books_bookID`) VALUES
(1, '2021-12-09', '2021-12-02', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `username`, `password`, `created_at`) VALUES
(1, 'TestAccount', '*7EE969BBE0A3985C8BFF9FA65A06345C67FE434A', '2021-12-07 10:54:44'),
(2, 'TestAccount2', '*7EE969BBE0A3985C8BFF9FA65A06345C67FE434A', '2021-12-07 10:55:12'),
(3, 'TestAccount3', '*7EE969BBE0A3985C8BFF9FA65A06345C67FE434A', '2021-12-07 10:55:20'),
(4, 'tester', '$2y$10$FDlZQ0Y47NOzabBYD9mj8u45D8wBJ97kRk62bwRhf9VTJvZYKyr7C', '2021-12-10 20:05:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookreviews`
--
ALTER TABLE `bookreviews`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `fk_BookReviews_Books_idx_idx` (`Books_bookID`),
  ADD KEY `fk_BookReviews_Member_idx_idx` (`Members_memberID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookID`,`Members_memberID`),
  ADD KEY `fk_Books_Members1_idx` (`Members_memberID`);

--
-- Indexes for table `booksborrowed`
--
ALTER TABLE `booksborrowed`
  ADD PRIMARY KEY (`borrowID`),
  ADD KEY `fk_BooksBorrowed_Books_idx_idx` (`Books_bookID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberID`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookreviews`
--
ALTER TABLE `bookreviews`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booksborrowed`
--
ALTER TABLE `booksborrowed`
  MODIFY `borrowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookreviews`
--
ALTER TABLE `bookreviews`
  ADD CONSTRAINT `fk_BookReviews_Books_idx` FOREIGN KEY (`Books_bookID`) REFERENCES `books` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BookReviews_Member_idx` FOREIGN KEY (`Members_memberID`) REFERENCES `members` (`memberID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

