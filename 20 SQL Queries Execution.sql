-- Retrieve all appointments scheduled after a specific date:
SELECT * FROM appointment WHERE AppointmentDateTime > '2024-03-01';

-- Get details of patients whose age is greater than 30 years:
SELECT * FROM patient WHERE DateOfBirth < DATE_SUB(CURDATE(), INTERVAL 30 YEAR);

-- Find all doctors specializing in Cardiology:
SELECT * FROM doctor WHERE Specialization = 'Cardiologist';

-- Retrieve all prescriptions with a dosage containing 'mg':
SELECT * FROM prescription WHERE Dosage LIKE '%mg%';

-- Get details of appointments with a specific status:
SELECT * FROM appointment WHERE Status = 'Scheduled';

-- Retrieve insurance policies with coverage amount greater than 500,000:
SELECT InsuranceID, InsuranceName, CoverageAmount FROM insurance HAVING CoverageAmount > 500000;

-- Count the number of appointments for each doctor:
SELECT DoctorID, COUNT(*) AS AppointmentCount FROM doctorappointment GROUP BY DoctorID;

-- Calculate the total payment for each patient:
SELECT patient_PatientID, SUM(Amount) AS TotalPayment FROM payment GROUP BY patient_PatientID;

-- Find the number of patients in each age group (e.g., 0-20, 21-40, 41-60, etc.):
SELECT 
  CASE 
    WHEN TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) BETWEEN 0 AND 20 THEN '0-20' 
    WHEN TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) BETWEEN 21 AND 40 THEN '21-40' 
    WHEN TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) BETWEEN 41 AND 60 THEN '41-60' 
    ELSE 'Above 60' 
  END AS AgeGroup,
  COUNT(*) AS PatientCount
FROM patient
GROUP BY AgeGroup;

-- Retrieve the average dosage length for each medication:
SELECT Medication, AVG(CHAR_LENGTH(Dosage)) AS AvgDosageLength FROM prescription GROUP BY Medication;

-- Calculate the total number of appointments for each month:
SELECT MONTH(AppointmentDateTime) AS Month, COUNT(*) AS AppointmentCount FROM appointment GROUP BY Month;

-- Retrieve appointments ordered by appointment datetime in ascending order:
SELECT * FROM appointment ORDER BY AppointmentDateTime ASC;

-- Get patient details ordered by their age in descending order:
SELECT * FROM patient ORDER BY DateOfBirth DESC;

-- Find the top 10 highest-paying insurance policies ordered by coverage amount in descending order:
SELECT * FROM insurance ORDER BY CoverageAmount DESC LIMIT 10;

-- Get patient names ordered alphabetically by their last name:
SELECT * FROM patient ORDER BY LastName;

-- COMMIT
START TRANSACTION;

-- Updating patient information
UPDATE patient
SET Address = '123 Main Street, Mumbai'
WHERE PatientID = 1;

-- Adding a new appointment for the patient
INSERT INTO appointment (AppointmentDateTime, Status, PatientID)
VALUES ('2024-04-15 10:00:00', 'Scheduled', 1);

-- Updating the insurance policy for the patient
UPDATE insurance
SET PolicyNumber = 'HI789012',
    PolicyStartDate = '2024-01-01',
    PolicyEndDate = '2024-12-31',
    CoverageAmount = 600000.00
WHERE InsuranceID = 2;

-- Adding a new medical record entry for the patient
INSERT INTO medicalrecord (RecordID, Date, Diagnosis, Notes)
VALUES (101, '2024-04-15', 'Checkup', 'No issues detected');

COMMIT;

-- ROLLBACK
START TRANSACTION;

-- Update patient information
UPDATE patient
SET Address = '456 Elm Street, Mumbai'
WHERE PatientID = 2;

-- Insert a new appointment for the patient
INSERT INTO appointment (AppointmentDateTime, Status, PatientID)
VALUES ('2024-04-20 11:00:00', 'Scheduled', 2);

-- Rollback the transaction due to an error
ROLLBACK;

-- SAVEPOINT AND ROLLBACK TO SAVEPOINT
START TRANSACTION;

-- Update patient information
UPDATE patient
SET Address = '789 Oak Avenue, Mumbai'
WHERE PatientID = 3;

-- Set a savepoint
SAVEPOINT before_insert;

-- Insert a new appointment for the patient
INSERT INTO appointment (AppointmentDateTime, Status, PatientID)
VALUES ('2024-04-25 12:00:00', 'Scheduled', 3);

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT before_insert;

-- ABORT
START TRANSACTION;

-- Update patient information
UPDATE patient
SET Address = '987 Maple Street, Mumbai'
WHERE PatientID = 4;

-- Retrieve patient details along with their corresponding medical records using a left outer join:
SELECT * FROM patient LEFT OUTER JOIN patientmedicalrecord ON patient.PatientID = patientmedicalrecord.PatientID;

-- Combine appointment details with doctor information using a right outer join:
SELECT * FROM appointment RIGHT OUTER JOIN doctorappointment ON appointment.AppointmentID = doctorappointment.AppointmentID;



