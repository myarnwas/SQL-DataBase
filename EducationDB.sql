/* This is My Name DataBase */
CREATE DATABASE EducationDB;
/* To Sure We Use EducationDB We Write This*/
USE EducationDB;
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1), 
    TeacherName NVARCHAR(100) NOT NULL,            
    Email NVARCHAR(100) NOT NULL UNIQUE,    
    HireDate DATE NOT NULL                  
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1), 
    CourseName NVARCHAR(100) NOT NULL,     
	[Description] varchar(500) 
 );
ALTER TABLE Courses
ADD TeacherID INT;

ALTER TABLE Courses
ADD CONSTRAINT FK_Courses_Teachers
FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1), 
    StudentName NVARCHAR(100) NOT NULL,            
    Email NVARCHAR(100) NOT NULL UNIQUE,    
    EnrollmentDate DATE NOT NULL            
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1), 
    StudentID INT NOT NULL, 
    CourseID INT NOT NULL,  
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1), 
    Title NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(500),
    DueDate DATE NOT NULL,
    CourseID INT NOT NULL, 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY IDENTITY(1,1), 
    AssignmentID INT NOT NULL, 
    StudentID INT NOT NULL,   
    SubmissionDate DATE NOT NULL,
    Grade FLOAT CHECK (Grade BETWEEN 0 AND 100), 
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
SET IDENTITY_INSERT Teachers ON;

/* To Insert Data For Teachers Table */
INSERT INTO Teachers (TeacherID, TeacherName, Email, HireDate)
VALUES
(1, 'Ali Ahmed', 'ali@Teacher.com', '2015-08-20'),
(2, 'Sara Khaled', 'sara@Teacher.com', '2017-01-15'),
(3, 'Omar Salah', 'omar@Teacher.com', '2016-05-10'),
(4, 'Laila Mohammed', 'laila@Teacher.com', '2019-03-22'),
(5, 'Youssef Adel', 'youssef@Teacher.com', '2020-09-11'),
(6, 'Nadia Saeed', 'nadia@Teacher.com', '2021-07-25'),
(7, 'Hassan Ibrahim', 'hassan@Teacher.com', '2018-12-05'),
(8, 'Mona Ali', 'mona@Teacher.com', '2023-02-18'),
(9, 'Karim Ahmed', 'karim@Teacher.com', '2014-06-07'),
(10, 'Dina Hisham', 'dina@Teacher.com', '2022-11-30'),
(11, 'Amr Tarek', 'amr@Teacher.com', '2021-04-15'),
(12, 'Nourhan Samy', 'nourhan@Teacher.com', '2020-02-12'),
(13, 'Ahmed Zaki', 'ahmed@Teacher.com', '2016-09-01'),
(14, 'Farah Osama', 'farah@Teacher.com', '2023-05-21'),
(15, 'Salma Ibrahim', 'salma@Teacher.com', '2022-08-18');
SET IDENTITY_INSERT Teachers Off;


/* To Insert Data For Students Table */
INSERT INTO Students (StudentName, Email, EnrollmentDate)
VALUES
('Mohammed Adel', 'mohammed@student.com', '2024-01-01'),
('Hana Ali', 'hana@student.com', '2024-01-02'),
('Yara Hossam', 'yara@student.com', '2024-01-03'),
('Ahmed Yassin', 'ahmedy@student.com', '2024-01-04'),
('Sara Nour', 'saran@student.com', '2024-01-05'),
('Tarek Hassan', 'tarek@student.com', '2024-01-06'),
('Layla Farid', 'laylaf@student.com', '2024-01-07'),
('Omar Ahmed', 'omar@student.com', '2024-01-08'),
('Dalia Sami', 'dalia@student.com', '2024-01-09'),
('Amira Khaled', 'amira@student.com', '2024-01-10'),
('Hisham Fouad', 'hisham@student.com', '2024-01-11'),
('Noor Hossam', 'noor@student.com', '2024-01-12'),
('Mariam Tamer', 'mariam@student.com', '2024-01-13'),
('Khaled Omar', 'khaled@student.com', '2024-01-14'),
('Nada Youssef', 'nada@student.com', '2024-01-15');

/* To Insert Data For Students Table 
INSERT INTO Courses (CourseName, TeacherID)
VALUES
('Database Systems', 1),
('Operating Systems', 2),
('Web Development', 3),
('Artificial Intelligence', 4),
('Machine Learning', 5),
('Software Engineering', 6),
('Data Science', 7),
('Cloud Computing', 8),
('Cybersecurity', 9),
('Networks', 10),
('Mobile Development', 11),
('Programming in C++', 12),
('Programming in Java', 13),
('Discrete Mathematics', 14),
('Algorithms and Data Structures', 15);*/


/* إدخال بيانات جديدة لجدول Courses بدون الإشارة إلى رقم المعلم */
/* إدخال بيانات جديدة لجدول Courses */
INSERT INTO Courses (CourseName,TeacherID, [Description])
VALUES
('Database Systems 101', 1, 'Introduction to database concepts and SQL'),
('Operating Systems 202', 2, 'Understanding operating systems and their components'),
('Web Development 303', 3, 'Building modern web applications using HTML, CSS, and JavaScript'),
('Artificial Intelligence 404', 4, 'Basics of AI, neural networks, and machine learning algorithms'),
('Machine Learning 505', 5, 'Advanced machine learning techniques and their applications'),
('Software Engineering 606', 6, 'Principles and practices of software engineering'),
('Data Science 707', 7, 'Data analysis, visualization, and predictive modeling'),
('Cloud Computing 808', 8, 'Fundamentals of cloud platforms and services'),
('Cybersecurity 909', 9, 'Protecting systems against cyber threats'),
('Networks 1010', 10, 'Computer networking principles and protocols'),
('Mobile Development 1111', 11, 'Creating mobile apps for Android and iOS platforms'),
('Programming in C++ 1212', 12, 'Object-oriented programming and data structures in C++'),
('Programming in Java 1313', 13, 'Java programming concepts and development techniques'),
('Discrete Mathematics 1414', 14, 'Mathematics for computer science and logic'),
('Algorithms and Data Structures 1515', 15, 'Design and analysis of algorithms and data structures');



/* To Insert Data For Assignments Table */

INSERT INTO Assignments (Title, [Description], DueDate, CourseID)
VALUES
('SQL Basics', 'Complete basic SQL queries.', '2024-12-20', 1),
('ERD Design', 'Design an ERD for a library system.', '2024-12-22', 1),
('Normalization', 'Normalize the given database.', '2024-12-25', 1),
('Linux Basics', 'Learn basic Linux commands.', '2024-12-20', 2),
('File Systems', 'Analyze different file systems.', '2024-12-22', 2),
('HTML and CSS', 'Build a responsive webpage.', '2024-12-25', 3),
('Python Basics', 'Write a basic Python script.', '2024-12-27', 4),
('AI Concepts', 'Discuss AI ethics.', '2024-12-30', 4),
('ML Models', 'Build a regression model.', '2024-12-31', 5),
('SE Models', 'Draw UML diagrams.', '2024-12-21', 5)



CREATE PROCEDURE GetStudentsByCourse
    @CourseID INT
AS
BEGIN
    SELECT 
        S.StudentName, S.Email, E.EnrollmentDate
    FROM Students S
    INNER JOIN Enrollments E ON S.StudentID = E.StudentID
    WHERE E.CourseID = @CourseID;
END;

CREATE VIEW CourseStudentView AS
SELECT 
    C.CourseName,
    T.TeacherName,
    S.StudentName,
    E.EnrollmentDate
FROM Courses C
INNER JOIN Teachers T ON C.TeacherID = T.TeacherID
INNER JOIN Enrollments E ON C.CourseID = E.CourseID
INNER JOIN Students S ON S.StudentID = E.StudentID;

/* الطلاب لكل دورة
*/SELECT 
    C.CourseName, COUNT(E.StudentID) AS StudentCount
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

/* الدرجات لكل طالب
*/
SELECT 
    S.StudentName, A.Title, Sub.Grade
FROM Students S
INNER JOIN Submissions Sub ON S.StudentID = Sub.StudentID
INNER JOIN Assignments A ON Sub.AssignmentID = A.AssignmentID;

