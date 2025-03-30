-- CREATING THE DATABASE
CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- CREATING A TABLE FOR PATIENTS
CREATE TABLE IF NOT EXISTS Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- CREATING A TABLE FOR DOCTORS
CREATE TABLE IF NOT EXISTS Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- CREATING A TABLE FOR APPOINTMENTS
CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    INDEX idx_patient (patient_id),
    INDEX idx_doctor (doctor_id)
) ENGINE=InnoDB;

-- INSERTING SAMPLE DATA INTO PATIENTS
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone) VALUES
('John', 'Doe', '1985-06-15', 'Male', '123-456-7890'),
('Emma', 'Wilson', '1992-09-22', 'Female', '987-654-3210');

-- INSERTING SAMPLE DATA INTO DOCTORS
INSERT INTO Doctors (first_name, last_name, specialty, phone) VALUES
('Dr. Alice', 'Brown', 'Cardiology', '555-111-2222'),
('Dr. Mark', 'Smith', 'Neurology', '555-333-4444');

-- INSERTING SAMPLE DATA INTO APPOINTMENTS
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2024-04-10 10:30:00', 'Routine heart check-up'),
(2, 2, '2024-04-12 14:00:00', 'Migraine and headache consultation');

-- RETRIEVING PATIENT APPOINTMENTS
SELECT 
    Patients.first_name, 
    Patients.last_name, 
    Doctors.first_name AS doctor_first_name,
    Doctors.last_name AS doctor_last_name,
    Doctors.specialty,
    Appointments.appointment_date,
    Appointments.reason
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.patient_id
JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id
ORDER BY Appointments.appointment_date;
