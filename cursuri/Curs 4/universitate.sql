-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema universitate
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`adresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adresa` (
  `idadresa` INT NOT NULL AUTO_INCREMENT,
  `strada` VARCHAR(255) NOT NULL,
  `numar` INT NULL,
  `zip` VARCHAR(6) NULL,
  PRIMARY KEY (`idadresa`),
  UNIQUE INDEX `strada_UNIQUE` (`strada` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cladire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cladire` (
  `idcladire` INT NOT NULL AUTO_INCREMENT,
  `etaje` INT NOT NULL,
  `denumire` VARCHAR(45) NULL,
  `adresa_idadresa` INT NOT NULL,
  PRIMARY KEY (`idcladire`),
  UNIQUE INDEX `denumire_UNIQUE` (`denumire` ASC) VISIBLE,
  INDEX `fk_cladire_adresa_idx` (`adresa_idadresa` ASC) VISIBLE,
  CONSTRAINT `fk_cladire_adresa`
    FOREIGN KEY (`adresa_idadresa`)
    REFERENCES `mydb`.`adresa` (`idadresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`profesor` (
  `idprofesor` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `data_nasterii` DATE NOT NULL,
  `grad` ENUM("I", "II", "III") NOT NULL DEFAULT 'I',
  `adresa_idadresa` INT NOT NULL,
  PRIMARY KEY (`idprofesor`, `adresa_idadresa`),
  INDEX `fk_profesor_adresa1_idx` (`adresa_idadresa` ASC) VISIBLE,
  CONSTRAINT `fk_profesor_adresa1`
    FOREIGN KEY (`adresa_idadresa`)
    REFERENCES `mydb`.`adresa` (`idadresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `gen` ENUM("feminin", "masculin") NOT NULL,
  `an` INT NOT NULL,
  `grupa` INT NOT NULL,
  `bursa` INT NULL,
  `status` ENUM("restantier", "bursier", "admis") NOT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curs` (
  `idcurs` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `an` INT NULL,
  `semestru` ENUM('I', 'II') NULL,
  `credite` INT NULL,
  PRIMARY KEY (`idcurs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`predare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`predare` (
  `profesor_idprofesor` INT NOT NULL,
  `profesor_adresa_idadresa` INT NOT NULL,
  `curs_idcurs` INT NOT NULL,
  PRIMARY KEY (`profesor_idprofesor`, `profesor_adresa_idadresa`, `curs_idcurs`),
  INDEX `fk_predare_profesor1_idx` (`profesor_idprofesor` ASC, `profesor_adresa_idadresa` ASC) VISIBLE,
  INDEX `fk_predare_curs1_idx` (`curs_idcurs` ASC) VISIBLE,
  CONSTRAINT `fk_predare_profesor1`
    FOREIGN KEY (`profesor_idprofesor` , `profesor_adresa_idadresa`)
    REFERENCES `mydb`.`profesor` (`idprofesor` , `adresa_idadresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_predare_curs1`
    FOREIGN KEY (`curs_idcurs`)
    REFERENCES `mydb`.`curs` (`idcurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`note` (
  `idnote` INT NOT NULL AUTO_INCREMENT,
  `student_idstudent` INT NOT NULL,
  `curs_idcurs` INT NOT NULL,
  `valoare` INT NOT NULL,
  `data_notare` DATE NOT NULL,
  PRIMARY KEY (`idnote`, `student_idstudent`, `curs_idcurs`),
  INDEX `fk_note_student1_idx` (`student_idstudent` ASC) VISIBLE,
  INDEX `fk_note_curs1_idx` (`curs_idcurs` ASC) VISIBLE,
  CONSTRAINT `fk_note_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `mydb`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_curs1`
    FOREIGN KEY (`curs_idcurs`)
    REFERENCES `mydb`.`curs` (`idcurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
