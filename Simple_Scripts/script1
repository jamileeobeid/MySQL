-- CREATING THE DATABASE
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- CREATING A TABLE FOR STUDENTS
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

-- CREATING A TABLE FOR COURSES
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    credits INT NOT NULL
);

-- CREATING A TABLE FOR ENROLLMENTS (Many-to-Many relationship)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- INSERTING SAMPLE DATA INTO STUDENTS
INSERT INTO Students (first_name, last_name, email, enrollment_date) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '2024-01-15'),
('Bob', 'Smith', 'bob.smith@example.com', '2024-02-10');

-- INSERTING SAMPLE DATA INTO COURSES
INSERT INTO Courses (course_name, course_code, credits) VALUES
('Database Systems', 'DB101', 3),
('Web Development', 'WD202', 4);

-- INSERTING SAMPLE DATA INTO ENROLLMENTS
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-03-01'),
(1, 2, '2024-03-02'),
(2, 1, '2024-03-03');

-- RETRIEVING STUDENT ENROLLMENTS
SELECT 
    Students.first_name, 
    Students.last_name, 
    Courses.course_name, 
    Enrollments.enrollment_date
FROM Enrollments
JOIN Students ON Enrollments.student_id = Students.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;
