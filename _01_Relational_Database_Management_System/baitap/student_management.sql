create database `student_management`;
use `student_management`;

CREATE TABLE `student_management`.`Class` (
  `idClass` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idClass`));
  
  CREATE TABLE `student_management`.`Teacher` (
  `idTeacher` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `conutry` VARCHAR(45) NULL,
  PRIMARY KEY (`idTeacher`));


CREATE TABLE `student_management`.`Student` (
  `idStudent` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `conutry` VARCHAR(45) NULL,
  PRIMARY KEY (`idStudent`));


