CREATE DATABASE IF NOT EXISTS `hospital_online_portal_normalized`;
USE `hospital_online_portal_normalized` ;

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`appointment` (
  `AppointmentID` INT NOT NULL,
  `AppointmentDateTime` DATETIME NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  `Notes` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`department` (
  `DepartmentID` INT NOT NULL,
  `DepartmentName` VARCHAR(255) NOT NULL,
  `Location` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`doctor` (
  `DoctorID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `DepartmentID` INT NULL DEFAULT NULL,
  `Specialization` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  INDEX `DepartmentID` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `doctor_ibfk_1`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `hospital_online_portal_normalized`.`department` (`DepartmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`doctorappointment` (
  `DoctorID` INT NOT NULL,
  `AppointmentID` INT NOT NULL,
  PRIMARY KEY (`DoctorID`),
  INDEX `AppointmentID` (`AppointmentID` ASC) VISIBLE,
  CONSTRAINT `doctorappointment_ibfk_1`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `hospital_online_portal_normalized`.`doctor` (`DoctorID`),
  CONSTRAINT `doctorappointment_ibfk_2`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `hospital_online_portal_normalized`.`appointment` (`AppointmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`medicalrecord` (
  `RecordID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Diagnosis` TEXT NULL DEFAULT NULL,
  `Notes` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RecordID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`doctormedicalrecord` (
  `DoctorID` INT NOT NULL,
  `RecordID` INT NOT NULL,
  `DoctorMeicalRecordID` INT NOT NULL,
  INDEX `RecordID` (`RecordID` ASC) VISIBLE,
  PRIMARY KEY (`DoctorMeicalRecordID`),
  CONSTRAINT `doctormedicalrecord_ibfk_1`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `hospital_online_portal_normalized`.`doctor` (`DoctorID`),
  CONSTRAINT `doctormedicalrecord_ibfk_2`
    FOREIGN KEY (`RecordID`)
    REFERENCES `hospital_online_portal_normalized`.`medicalrecord` (`RecordID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`insurance` (
  `InsuranceID` INT NOT NULL,
  `InsuranceName` VARCHAR(100) NOT NULL,
  `PolicyNumber` VARCHAR(50) NOT NULL,
  `PolicyHolderName` VARCHAR(100) NOT NULL,
  `PolicyHolderDob` DATE NOT NULL,
  `PolicyStartDate` DATE NOT NULL,
  `PolicyEndDate` DATE NOT NULL,
  `CoverageAmount` DECIMAL(10,2) NOT NULL,
  `PhoneNo` VARCHAR(10) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`InsuranceID`));
  
CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`rooms` (
  `RoomNo` INT NOT NULL,
  `RoomType` VARCHAR(255) NOT NULL,
  `FloorNumber` INT NULL DEFAULT NULL,
  `Features` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RoomNo`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`patient` (
  `PatientID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `insurance_InsuranceID` INT NOT NULL,
  `rooms_RoomNo` INT NOT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `fk_patient_insurance1_idx` (`insurance_InsuranceID` ASC) VISIBLE,
  INDEX `fk_patient_rooms1_idx` (`rooms_RoomNo` ASC) VISIBLE,
  CONSTRAINT `fk_patient_insurance1`
    FOREIGN KEY (`insurance_InsuranceID`)
    REFERENCES `hospital_online_portal_normalized`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_rooms1`
    FOREIGN KEY (`rooms_RoomNo`)
    REFERENCES `hospital_online_portal_normalized`.`rooms` (`RoomNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`patientappointment` (
  `PatientID` INT NOT NULL,
  `AppointmentID` INT NOT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `AppointmentID` (`AppointmentID` ASC) VISIBLE,
  CONSTRAINT `patientappointment_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal_normalized`.`patient` (`PatientID`),
  CONSTRAINT `patientappointment_ibfk_2`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `hospital_online_portal_normalized`.`appointment` (`AppointmentID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`patientmedicalrecord` (
  `PatientMedicalRecordID` INT NOT NULL,
  `PatientID` INT NOT NULL,
  `RecordID` INT NOT NULL,
  PRIMARY KEY (`PatientMedicalRecordID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `RecordID` (`RecordID` ASC) VISIBLE,
  CONSTRAINT `patientmedicalrecord_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal_normalized`.`patient` (`PatientID`),
  CONSTRAINT `patientmedicalrecord_ibfk_2`
    FOREIGN KEY (`RecordID`)
    REFERENCES `hospital_online_portal_normalized`.`medicalrecord` (`RecordID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`prescription` (
  `PrescriptionID` INT NOT NULL,
  `Medication` VARCHAR(255) NOT NULL,
  `Dosage` VARCHAR(255) NOT NULL,
  `Instructions` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`patientprescription` (
  `PatientID` INT NOT NULL,
  `PrescriptionID` INT NOT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `PrescriptionID` (`PrescriptionID` ASC) VISIBLE,
  CONSTRAINT `patientprescription_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `hospital_online_portal_normalized`.`patient` (`PatientID`),
  CONSTRAINT `patientprescription_ibfk_2`
    FOREIGN KEY (`PrescriptionID`)
    REFERENCES `hospital_online_portal_normalized`.`prescription` (`PrescriptionID`));

CREATE TABLE IF NOT EXISTS `hospital_online_portal_normalized`.`payment` (
  `PaymentID` INT NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `PaymentDate` DATE NOT NULL,
  `PaymentMethod` VARCHAR(255) NULL DEFAULT NULL,
  `patient_PatientID` INT NOT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `fk_payment_patient1_idx` (`patient_PatientID` ASC) VISIBLE,
  CONSTRAINT `fk_payment_patient1`
    FOREIGN KEY (`patient_PatientID`)
    REFERENCES `hospital_online_portal_normalized`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);