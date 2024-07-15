-- Insert User Accounts
INSERT INTO UserAccount (username, password, email, role) VALUES
('jdoe', 'password123', 'jdoe@example.com', 'Doctor_role'),
('asmith', 'password123', 'asmith@example.com', 'Nurse_role'),
('rjones', 'password123', 'rjones@example.com', 'Lab Scientist_role'),
('mpatel', 'password123', 'mpatel@example.com', 'Admin_role'),
('ssmith', 'password123', 'ssmith@example.com', 'Patient_role');

-- Insert Doctors
INSERT INTO Doctor (name, gender, address, date_of_joining, designation, specialty, user_id) VALUES
('Dr. John Doe', 'Male', '123 Main St', '2020-01-15', 'Senior Physician', 'Cardiology', 1),
('Dr. Alice Smith', 'Female', '456 Elm St', '2019-06-20', 'Consultant', 'Neurology', 2);

-- Insert Patients
INSERT INTO Patient (first_name, last_name, dob, age, marital_status, gender, state, city, address, phone_number, email, next_of_kin, next_of_kin_number, time_of_admission, admin, aadhar_number) VALUES
('Sam', 'Smith', '1985-03-10', 39, 'Single', 'Male', 'California', 'Los Angeles', '789 Pine St', '555-0123', 'ssmith@example.com', 'Alice Smith', '555-0456', NOW(), 'mpatel', '123456789012'),
('Emily', 'Johnson', '1990-07-22', 34, 'Married', 'Female', 'California', 'San Francisco', '321 Oak St', '555-0789', 'ejohnson@example.com', 'John Johnson', '555-0987', NOW(), 'mpatel', '987654321012');

-- Insert Tests
INSERT INTO Test (type, description) VALUES
('Blood Test', 'Complete Blood Count'),
('X-Ray', 'Chest X-Ray'),
('MRI', 'Magnetic Resonance Imaging');

-- Insert Lab Scientists
INSERT INTO LabScientist (name, user_id) VALUES
('Lab Scientist R. Jones', 3),
('Lab Scientist M. Brown', 3);

-- Insert Nurses
INSERT INTO Nurse (name, user_id) VALUES
('Nurse A. Smith', 2),
('Nurse B. White', 2);

-- Insert Appointments
INSERT INTO Appointment (patient_id, doctor_id, appointment_date, status, user_id) VALUES
(1, 1, '2024-08-01 10:00:00', 'Scheduled', 5),
(2, 2, '2024-08-02 14:00:00', 'Scheduled', 5);

-- Insert Medical Records
INSERT INTO MedicalRecord (patient_id, doctor_id, details, record_date, user_id) VALUES
(1, 1, 'Patient shows symptoms of chest pain.', NOW(), 1),
(2, 2, 'Patient has a history of migraines.', NOW(), 2);

-- Insert Billing
INSERT INTO Billing (patient_id, amount, bill_date, user_id) VALUES
(1, 1500.00, NOW(), 4),
(2, 2000.00, NOW(), 4);

-- Insert Patient Tests
INSERT INTO PatientTest (patient_id, test_id, lab_scientist_id, doctor_id, date_time, result, comment, fee, user_id) VALUES
(1, 1, 1, 1, NOW(), 'Normal', 'No issues found.', 100.00, 5),
(2, 2, 2, 2, NOW(), 'Pending', 'Awaiting results.', 200.00, 5);

-- Insert Patient Triage
INSERT INTO PatientTriage (patient_id, nurse_id, blood_pressure, heart_rate, sugar_level, height, weight, comment, fee, user_id) VALUES
(1, 1, 120.50, 78, 90.00, 175.0, 70.0, 'Stable condition.', 50.00, 5),
(2, 2, 130.75, 82, 95.00, 160.0, 60.0, 'Under observation.', 50.00, 5);

-- Insert Patient Bills
INSERT INTO PatientBill (patient_id, triage_fee, bed_fee, operation_fee, number_of_days, nursing_fee, total_bill, user_id) VALUES
(1, 50.00, 500.00, 0.00, 3, 200.00, 750.00, 4),
(2, 50.00, 600.00, 0.00, 2, 150.00, 900.00, 4);
