CREATE DATABASE Hospital;

USE Hospital;

-- Table for User Accounts
CREATE TABLE UserAccount (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    role VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Doctors
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    address VARCHAR(255),
    date_of_joining DATE,
    designation VARCHAR(255),
    specialty VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Patients
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    dob DATE,
    age INT,
    marital_status VARCHAR(20),
    gender VARCHAR(10),
    state VARCHAR(255),
    city VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(20) UNIQUE,
    email VARCHAR(255) UNIQUE,
    next_of_kin VARCHAR(255),
    next_of_kin_number VARCHAR(20),
    time_of_admission DATETIME,
    admin VARCHAR(255),
    aadhar_number VARCHAR(20) UNIQUE
);

-- Table for Tests
CREATE TABLE Test (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(255),
    description VARCHAR(255)
);

-- Table for Lab Scientists
CREATE TABLE LabScientist (
    lab_scientist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Nurses
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Appointments
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(50),
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Medical Records
CREATE TABLE MedicalRecord (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    details TEXT,
    record_date DATETIME,
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Billing
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10, 2),
    bill_date DATETIME,
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Patient Tests
CREATE TABLE PatientTest (
    patient_test_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    test_id INT,
    lab_scientist_id INT,
    doctor_id INT,
    date_time DATETIME,
    result VARCHAR(255),
    comment VARCHAR(255),
    fee DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (test_id) REFERENCES Test(test_id),
    FOREIGN KEY (lab_scientist_id) REFERENCES LabScientist(lab_scientist_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Patient Triage
CREATE TABLE PatientTriage (
    patient_triage_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    nurse_id INT,
    blood_pressure DECIMAL(5, 2),
    heart_rate INT,
    sugar_level DECIMAL(5, 2),
    height DECIMAL(5, 2),
    weight DECIMAL(5, 2),
    comment VARCHAR(255),
    fee DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- Table for Patient Bills
CREATE TABLE PatientBill (
    patient_bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    triage_fee DECIMAL(10, 2),
    bed_fee DECIMAL(10, 2),
    operation_fee DECIMAL(10, 2),
    number_of_days INT,
    nursing_fee DECIMAL(10, 2),
    total_bill DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);
