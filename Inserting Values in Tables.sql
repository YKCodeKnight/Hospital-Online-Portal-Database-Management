use hospital_online_portal_normalized;

-- Inserting values into the `appointment` table
INSERT INTO `appointment` (`AppointmentID`, `AppointmentDateTime`, `Status`, `Notes`) 
VALUES 
(1, '2024-04-01 09:00:00', 'Scheduled', 'Regular checkup'),
(2, '2024-04-02 10:30:00', 'Scheduled', 'Follow-up appointment'),
(3, '2024-04-03 11:15:00', 'Scheduled', 'Consultation with specialist'),
(4, '2024-04-04 14:00:00', 'Cancelled', 'Patient called to cancel'),
(5, '2024-04-05 15:45:00', 'Scheduled', NULL),
(6, '2024-04-06 11:00:00', 'Scheduled', 'MRI scan'),
(7, '2024-04-07 14:30:00', 'Scheduled', 'X-ray examination'),
(8, '2024-04-08 10:00:00', 'Scheduled', 'Blood test'),
(9, '2024-04-09 13:45:00', 'Scheduled', 'Physical therapy session'),
(10, '2024-04-10 16:30:00', 'Scheduled', 'Dental checkup');

-- Inserting values into the `department` table
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `Location`) 
VALUES 
(1, 'Cardiology', 'First Floor'),
(2, 'Orthopedics', 'Second Floor'),
(3, 'Pediatrics', 'Third Floor'),
(4, 'Neurology', 'Fourth Floor'),
(5, 'Oncology', 'Fifth Floor'),
(6, 'Dermatology', 'Sixth Floor'),
(7, 'ENT', 'Seventh Floor'),
(8, 'Gynecology', 'Eighth Floor'),
(9, 'Urology', 'Ninth Floor'),
(10, 'Psychiatry', 'Tenth Floor');

-- Inserting values into the `doctor` table
INSERT INTO `doctor` (`DoctorID`, `FirstName`, `LastName`, `DepartmentID`, `Specialization`) 
VALUES 
(1, 'Aditi', 'Desai', 1, 'Cardiologist'),
(2, 'Aarav', 'Joshi', 2, 'Orthopedic Surgeon'),
(3, 'Ishaan', 'Shah', 3, 'Pediatrician'),
(4, 'Ananya', 'Patil', 4, 'Neurologist'),
(5, 'Aryan', 'Sharma', 5, 'Oncologist'),
(6, 'Neha', 'Gupta', 6, 'Dermatologist'),
(7, 'Rohan', 'Malhotra', 7, 'ENT Specialist'),
(8, 'Priya', 'Singh', 8, 'Gynecologist'),
(9, 'Kabir', 'Reddy', 9, 'Urologist'),
(10, 'Riya', 'Choudhury', 10, 'Psychiatrist');

-- Inserting values into the `doctorappointment` table
INSERT INTO `doctorappointment` (`DoctorID`, `AppointmentID`) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting values into the `medicalrecord` table
INSERT INTO `medicalrecord` (`RecordID`, `Date`, `Diagnosis`, `Notes`) 
VALUES 
(1, '2024-03-15', 'Hypertension', 'Patient needs to monitor blood pressure regularly'),
(2, '2024-03-20', 'Fractured leg', 'Placed in a cast for six weeks'),
(3, '2024-03-25', 'Viral infection', 'Prescribed rest and plenty of fluids'),
(4, '2024-03-30', 'Migraine', 'Prescribed pain relievers and advised to avoid triggers'),
(5, '2024-04-05', 'Cancer diagnosis', 'Referral to an oncologist for further treatment'),
(6, '2024-04-10', 'Skin condition', 'Recommended topical ointment'),
(7, '2024-04-15', 'Sinusitis', 'Prescribed antibiotics'),
(8, '2024-04-20', 'Pregnancy checkup', 'Ultrasound scheduled'),
(9, '2024-04-25', 'Kidney stones', 'Advised dietary changes and pain management'),
(10, '2024-04-30', 'Depression', 'Recommended therapy sessions');

-- Inserting values into the `doctormedicalrecord` table
INSERT INTO `doctormedicalrecord` (`DoctorID`, `RecordID`, `DoctorMeicalRecordID`) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Inserting values into the `insurance` table with modified email domains
INSERT INTO `insurance` (`InsuranceID`, `InsuranceName`, `PolicyNumber`, `PolicyHolderName`, `PolicyHolderDob`, `PolicyStartDate`, `PolicyEndDate`, `CoverageAmount`, `PhoneNo`, `Email`) 
VALUES 
(1, 'LifeInsurance', 'LI123456', 'Rajesh Patel', '1990-05-15', '2024-01-01', '2024-12-31', 1000000.00, '9876543210', 'rajesh@gmail.com'),
(2, 'HealthInsurance', 'HI789012', 'Anjali Gupta', '1985-08-20', '2024-01-01', '2024-12-31', 500000.00, '9876543211', 'anjali@gmail.com'),
(3, 'MedicalInsurance', 'MI345678', 'Nitin Singh', '1978-11-10', '2024-01-01', '2024-12-31', 750000.00, '9876543212', 'nitin@gmail.com'),
(4, 'AccidentInsurance', 'AI901234', 'Pooja Sharma', '1995-02-25', '2024-01-01', '2024-12-31', 250000.00, '9876543213', 'pooja@gmail.com'),
(5, 'TravelInsurance', 'TI567890', 'Suresh Verma', '1982-04-30', '2024-01-01', '2024-12-31', 200000.00, '9876543214', 'suresh@gmail.com'),
(6, 'DentalInsurance', 'DI123890', 'Smita Deshmukh', '1993-10-12', '2024-01-01', '2024-12-31', 150000.00, '9876543215', 'smita@gmail.com'),
(7, 'VisionInsurance', 'VI987345', 'Vikram Singhania', '1980-12-05', '2024-01-01', '2024-12-31', 200000.00, '9876543216', 'vikram@gmail.com'),
(8, 'CriticalIllnessInsurance', 'CI567123', 'Manisha Shah', '1987-03-28', '2024-01-01', '2024-12-31', 300000.00, '9876543217', 'manisha@gmail.com'),
(9, 'DisabilityInsurance', 'DI234567', 'Rahul Gupta', '1991-07-15', '2024-01-01', '2024-12-31', 250000.00, '9876543218', 'rahul@gmail.com'),
(10, 'HomeInsurance', 'HI789456', 'Preeti Singh', '1983-05-02', '2024-01-01', '2024-12-31', 400000.00, '9876543219', 'preeti@gmail.com');
	

-- Inserting values into the `rooms` table
INSERT INTO `rooms` (`RoomNo`, `RoomType`, `FloorNumber`, `Features`) 
VALUES 
(101, 'General Ward', 1, 'Shared beds, medical equipment'),
(102, 'General Ward', 1, 'Shared beds, medical equipment'),
(201, 'General Ward', 2, 'Shared beds, medical equipment'),
(202, 'General Ward', 2, 'Shared beds, medical equipment'),
(301, 'Private Room', 3, 'Single bed, medical equipment, attached bathroom'),
(302, 'Private Room', 3, 'Single bed, medical equipment, attached bathroom'),
(401, 'ICU', 4, 'Specialized medical equipment, monitoring devices, dedicated nursing staff'),
(402, 'ICU', 4, 'Specialized medical equipment, monitoring devices, dedicated nursing staff'),
(501, 'Surgical Ward', 5, 'Preparation area, surgical beds, medical equipment'),
(502, 'Surgical Ward', 5, 'Preparation area, surgical beds, medical equipment');


-- Inserting values into the `patient` table
INSERT INTO `patient` (`PatientID`, `FirstName`, `LastName`, `DateOfBirth`, `Address`, `insurance_InsuranceID`, `rooms_RoomNo`) 
VALUES 
(1, 'Anushka', 'Shah', '1990-03-12', '123 Main St, Dadar, Mumbai', 1, 101),
(2, 'Aadi', 'Joshi', '1985-07-25', '456 Park Ave, Bandra, Mumbai', 2, 102),
(3, 'Neha', 'Patil', '2000-01-05', '789 Elm St, Andheri, Mumbai', 3, 201),
(4, 'Kunal', 'Malhotra', '1978-12-18', '321 Oak St, Colaba, Mumbai', 4, 202),
(5, 'Diya', 'Choudhury', '1995-06-30', '567 Pine St, Goregaon, Mumbai', 5, 301),
(6, 'Rohan', 'Deshmukh', '1983-08-15', '789 Hill Rd, Juhu, Mumbai', 6, 302),
(7, 'Sneha', 'Bose', '1992-05-20', '890 Beach Ave, Marine Lines, Mumbai', 7, 401),
(8, 'Sahil', 'Kulkarni', '1986-10-10', '456 Palm St, Versova, Mumbai', 8, 402),
(9, 'Isha', 'Sarin', '1991-09-02', '123 River Rd, Powai, Mumbai', 9, 501),
(10, 'Vedika', 'Nair', '1984-04-15', '890 Skyline Rd, Worli, Mumbai', 10, 502);

-- Inserting values into the `patientappointment` table
INSERT INTO `patientappointment` (`PatientID`, `AppointmentID`) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting values into the `patientmedicalrecord` table
INSERT INTO `patientmedicalrecord` (`PatientMedicalRecordID`, `PatientID`, `RecordID`) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Inserting values into the `prescription` table
INSERT INTO `prescription` (`PrescriptionID`, `Medication`, `Dosage`, `Instructions`) 
VALUES 
(1, 'Aspirin', '100mg', 'Take one tablet daily with food'),
(2, 'Ibuprofen', '200mg', 'Take two tablets every 6 hours as needed for pain'),
(3, 'Amoxicillin', '500mg', 'Take one capsule three times daily for 7 days'),
(4, 'Lisinopril', '10mg', 'Take one tablet daily in the morning'),
(5, 'Metformin', '500mg', 'Take one tablet twice daily with meals'),
(6, 'Cetirizine', '10mg', 'Take one tablet at bedtime'),
(7, 'Propranolol', '40mg', 'Take one tablet three times daily as prescribed'),
(8, 'Atorvastatin', '20mg', 'Take one tablet daily at night'),
(9, 'Omeprazole', '20mg', 'Take one capsule daily before breakfast'),
(10, 'Sertraline', '50mg', 'Take one tablet daily in the morning');

-- Inserting values into the `patientprescription` table
INSERT INTO `patientprescription` (`PatientID`, `PrescriptionID`) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting values into the `payment` table
INSERT INTO `payment` (`PaymentID`, `Amount`, `PaymentDate`, `PaymentMethod`, `patient_PatientID`) 
VALUES 
(1, 1000.00, '2024-04-01', 'Credit Card', 1),
(2, 1500.00, '2024-04-02', 'Cash', 2),
(3, 2000.00, '2024-04-03', 'Debit Card', 3),
(4, 2500.00, '2024-04-04', 'Insurance', 4),
(5, 3000.00, '2024-04-05', 'Cash', 5),
(6, 1200.00, '2024-04-06', 'Credit Card', 6),
(7, 1800.00, '2024-04-07', 'Debit Card', 7),
(8, 2200.00, '2024-04-08', 'Cash', 8),
(9, 2700.00, '2024-04-09', 'Credit Card', 9),
(10, 3200.00, '2024-04-10', 'Debit Card', 10);

