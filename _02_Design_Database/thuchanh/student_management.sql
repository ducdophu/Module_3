CREATE DATABASE `QuanLySinhVien` ;
USE `QuanLySinhVien` ;

CREATE TABLE `QuanLySinhVien`.`Class` (
  `ClassID` INT NOT NULL AUTO_INCREMENT,
  `ClassName` VARCHAR(60) NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `Status` BIT NULL,
  PRIMARY KEY (`ClassID`));
  
CREATE TABLE `QuanLySinhVien`.`Student` (
  `StudentID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `StudentName` VARCHAR(30) NOT NULL,
  `Address` VARCHAR(50) NULL,
  `Phone` VARCHAR(20) NULL,
  `Status` BIT NULL,
  `ClassID` INT NOT NULL,
  FOREIGN KEY (`ClassID`) REFERENCES `Class` (`ClassID`));

CREATE TABLE `QuanLySinhVien`.`Subject` (
  `SubID` INT NOT NULL AUTO_INCREMENT,
  `SubName` VARCHAR(30) NOT NULL,
  `Credit` TINYINT NOT NULL DEFAULT 1  CHECK ( `Credit` >= 1 ),
  `Status` BIT NULL DEFAULT 1,
  PRIMARY KEY (`SubID`));

CREATE TABLE `QuanLySinhVien`.`Mark` (
  `MarkID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `SubID` INT NOT NULL,
  `StudentID` INT NOT NULL,
  `Mark` FLOAT NULL DEFAULT 0 CHECK ( `Mark` BETWEEN 0 AND 100),
  `ExamTimes` TINYINT NULL DEFAULT 1,
  UNIQUE (`SubID`, `StudentID`),
  FOREIGN KEY (`SubID`) REFERENCES `Subject` (`SubID`),
  FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`));

