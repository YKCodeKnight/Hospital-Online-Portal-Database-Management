CREATE DATABASE IF NOT EXISTS hospital_online_portal;
USE `hospital_online_portal` ;

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`insurance` (
  `InsuranceID` INT NOT NULL,
  `InsuranceName` VARCHAR(100) NULL DEFAULT NULL,
  `PolicyNumber` VARCHAR(50) NULL DEFAULT NULL,
  `PolicyHolderName` VARCHAR(100) NULL DEFAULT NULL,
  `PolicyHolderDOB` DATE NULL DEFAULT NULL,
  `PolicyStartDate` DATE NULL DEFAULT NULL,
  `PolicyEndDate` DATE NULL DEFAULT NULL,
  `CoverageAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `ContactNumber` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`patient` (
  `PatientID` INT NOT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Phone` VARCHAR(20) NULL DEFAULT NULL,
  `DateOfBirth` DATE NULL DEFAULT NULL,
  `InsuranceID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `InsuranceID` (`InsuranceID` ASC) VISIBLE,
  CONSTRAINT `patient_ibfk_1`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `hospital_online_portal`.`insurance` (`InsuranceID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`department` (
  `DepartmentID` INT NOT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`doctor` (
  `DoctorID` INT NOT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Specialization` VARCHAR(100) NULL DEFAULT NULL,
  `Phone` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `department_DepartmentID` INT NOT NULL,
  PRIMARY KEY (`DoctorID`),
  INDEX `fk_doctor_department1_idx` (`department_DepartmentID` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_department1`
    FOREIGN KEY (`department_DepartmentID`)
    REFERENCES `hospital_online_portal`.`department` (`DepartmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`appointment` (
  `AppointmentID` INT NOT NULL,
  `PatientID` INT NULL DEFAULT NULL,
  `DoctorID` INT NULL DEFAULT NULL,
  `AppointmentDateTime` DATETIME NULL DEFAULT NULL,
  `Status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `DoctorID` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `appointment_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal`.`patient` (`PatientID`),
  CONSTRAINT `appointment_ibfk_2`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `hospital_online_portal`.`doctor` (`DoctorID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`medicalrecord` (
  `RecordID` INT NOT NULL,
  `PatientID` INT NULL DEFAULT NULL,
  `DoctorID` INT NULL DEFAULT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Diagnosis` TEXT NULL DEFAULT NULL,
  `Notes` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `DoctorID` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `medicalrecord_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal`.`patient` (`PatientID`),
  CONSTRAINT `medicalrecord_ibfk_2`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `hospital_online_portal`.`doctor` (`DoctorID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`payment` (
  `PaymentID` INT NOT NULL,
  `PatientID` INT NULL DEFAULT NULL,
  `Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Method` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal`.`patient` (`PatientID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal`.`prescription` (
  `PrescriptionID` INT NOT NULL,
  `PatientID` INT NULL DEFAULT NULL,
  `DoctorID` INT NULL DEFAULT NULL,
  `Medication` VARCHAR(100) NULL DEFAULT NULL,
  `Dosage` VARCHAR(50) NULL DEFAULT NULL,
  `Instructions` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `DoctorID` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `prescription_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal`.`patient` (`PatientID`),
  CONSTRAINT `prescription_ibfk_2`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `hospital_online_portal`.`doctor` (`DoctorID`));