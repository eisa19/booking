-- MySQL Script generated by MySQL Workbench
-- Tue Dec  7 08:45:10 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BookClub
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BookClub` ;

-- -----------------------------------------------------
-- Schema BookClub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BookClub` DEFAULT CHARACTER SET utf8 ;
USE `BookClub` ;

-- -----------------------------------------------------
-- Table `BookClub`.`Members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookClub`.`Members` ;

CREATE TABLE IF NOT EXISTS `BookClub`.`Members` (
  `memberID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL COMMENT 'La',
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`memberID`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookClub`.`Books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookClub`.`Books` ;

CREATE TABLE IF NOT EXISTS `BookClub`.`Books` (
  `bookID` INT NOT NULL AUTO_INCREMENT,
  `bookTitle` VARCHAR(128) NULL,
  `authorFirstname` VARCHAR(20) NULL,
  `authorLastname` VARCHAR(45) NULL,
  `publishedYear` INT NULL,
  `Members_memberID` INT NOT NULL,
  `bookBorrowed` TINYINT NULL,
  `bookCoverImage` VARCHAR(64) NULL,
  PRIMARY KEY (`bookID`, `Members_memberID`),
  INDEX `fk_Books_Members1_idx` (`Members_memberID` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Members1`
    FOREIGN KEY (`Members_memberID`)
    REFERENCES `BookClub`.`Members` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`
bookID`,
`bookTitle
`, `authorFirstname`, `authorLastname`, `publishedYear`, `Members_memberID`, `bookBorrowed`, `bookCoverImage`) VALUES
(1, 'Learning PHP, MySQL & JavaScript: With jQuery, CSS & HTML5 (Learning PHP, MYSQL, Javascript, CSS & HTML5) 5th Edition', 'Robert', 'Nixon', 2015, 1, 0, 'newImage'),
(2, 'The Wonderful Things You Will Be', 'Emily', 'Winfield-Martin', 2015, 2, 0, 'No Image'),
(3, 'If Animals Kissed Good Night', 'Ann', 'Paul', 2014, 3, 0, 'Another No Image '),
(4, 'The Very Hungry Caterpillar', 'Eric', 'Carle', 1994, 4, 1, 'Image of a Caterpillar');


-- -----------------------------------------------------
-- Table `BookClub`.`BooksBorrowed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookClub`.`BooksBorrowed` ;

CREATE TABLE IF NOT EXISTS `BookClub`.`BooksBorrowed` (
  `borrowID` INT NOT NULL AUTO_INCREMENT,
  `borrowedDate` DATE NULL,
  `returnedDate` DATE NULL,
  `borrowedDays` INT NULL,
  `Books_bookID` INT NULL,
  PRIMARY KEY (`borrowID`),
  INDEX `fk_BooksBorrowed_Books_idx_idx` (`Books_bookID` ASC) VISIBLE,
  CONSTRAINT `fk_BooksBorrowed_Books_idx`
    FOREIGN KEY (`Books_bookID`)
    REFERENCES `BookClub`.`Books` (`bookID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookClub`.`BookReviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookClub`.`BookReviews` ;

CREATE TABLE IF NOT EXISTS `BookClub`.`BookReviews` (
  `reviewID` INT NOT NULL AUTO_INCREMENT,
  `reviewComments` VARCHAR(1024) NULL,
  `commentDateTime` DATETIME NULL,
  `Books_bookID` INT NULL,
  `Members_memberID` INT NULL,
  PRIMARY KEY (`reviewID`),
  INDEX `fk_BookReviews_Books_idx_idx` (`Books_bookID` ASC) VISIBLE,
  INDEX `fk_BookReviews_Member_idx_idx` (`Members_memberID` ASC) VISIBLE,
  CONSTRAINT `fk_BookReviews_Books_idx`
    FOREIGN KEY (`Books_bookID`)
    REFERENCES `BookClub`.`Books` (`bookID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookReviews_Member_idx`
    FOREIGN KEY (`Members_memberID`)
    REFERENCES `BookClub`.`Members` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
