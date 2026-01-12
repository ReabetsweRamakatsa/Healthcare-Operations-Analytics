
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    gender VARCHAR(10),
    date_of_birth DATE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    department_id INT,
    admission_date DATE
);

CREATE TABLE discharges (
    discharge_id INT PRIMARY KEY,
    admission_id INT,
    discharge_date DATE
);
