/* Add GradeAvarage column To Student Table */
ALTER TABLE Students
ADD GPA FLOAT;

/* Query to update the rate for each studunt */
UPDATE Students
SET GPA = (
    SELECT AVG(sub.Grade) /*---> To calculate studunts avarge grade in all courses which is registered  */
    FROM Submissions sub
    JOIN Assignments a ON sub.AssignmentID = a.AssignmentID
    JOIN Courses c ON a.CourseID = c.CourseID
    WHERE sub.StudentID = Students.StudentID
)
UPDATE Students SET GPA = 3.5 WHERE StudentID = 1;
UPDATE Students SET GPA = 2.8 WHERE StudentID = 2;
UPDATE Students SET GPA = 3.9 WHERE StudentID = 3;
UPDATE Students SET GPA = 2.5 WHERE StudentID = 4;
UPDATE Students SET GPA = 3.7 WHERE StudentID = 5;
UPDATE Students SET GPA = 2.0 WHERE StudentID = 6;
UPDATE Students SET GPA = 3.2 WHERE StudentID = 7;
UPDATE Students SET GPA = 4.0 WHERE StudentID = 8;
UPDATE Students SET GPA = 3.0 WHERE StudentID = 9;
UPDATE Students SET GPA = 2.7 WHERE StudentID = 10;
UPDATE Students SET GPA = 3.8 WHERE StudentID = 11;
UPDATE Students SET GPA = 2.9 WHERE StudentID = 12;
UPDATE Students SET GPA = 3.4 WHERE StudentID = 13;
UPDATE Students SET GPA = 2.3 WHERE StudentID = 14;
UPDATE Students SET GPA = 3.6 WHERE StudentID = 15;



/* To sure above query execute well*/
SELECT StudentID, StudentName, GPA
FROM Students;


 /*To show studunt_name ,teacher_name , Course_name, Grade, GPA in each courses (IN VIEW ) */
CREATE VIEW StudentGrades AS
SELECT 
    s.StudentName,
    c.CourseName,
    t.TeacherName,
    sub.Grade,
    s.GPA
FROM 
    Submissions sub
JOIN 
    Students s ON sub.StudentID = s.StudentID
JOIN 
    Assignments a ON sub.AssignmentID = a.AssignmentID
JOIN 
    Courses c ON a.CourseID = c.CourseID
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID;

	/*===================================================================================*/
/* to register all Activities (HomeWork, Quize , Test, Assignment)*/
CREATE TABLE Activities (
    ActivityID INT PRIMARY KEY IDENTITY(1,1),
    ActivityName NVARCHAR(100) NOT NULL,
    ActivityType NVARCHAR(50) NOT NULL DEFAULT 'Assignment', /*--> defualt value that show if not ActivityType here */
    [Description] NVARCHAR(500),
    DueDate DATE NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


/* View all activities related to courses and students */
CREATE VIEW vw_ActivitiesSummary AS
SELECT 
    A.ActivityID,
    A.ActivityName,
    A.ActivityType,
    A.DueDate,
    C.CourseName,
    S.StudentName,
    Sub.Grade
FROM Activities A
LEFT JOIN Courses C ON A.CourseID = C.CourseID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN Students S ON E.StudentID = S.StudentID
LEFT JOIN Submissions Sub ON A.ActivityID = Sub.AssignmentID;


Alter View vw_ActivitiesSummary AS
select S.StudentName
from Activities A LEFT JOIN Students S ON E.StudentName = S.StudentName

/*==========================================================*/


 /* View all activities based on same ActivityType such as (Test)*/

CREATE VIEW vw_Tests AS
SELECT 
    ActivityID,
    ActivityName,
    DueDate,
    CourseName
FROM vw_ActivitiesSummary
WHERE ActivityType = 'Test';

Alter view vw_Tests AS
select c.CourseName
from Courses c


ALTER TABLE Activities
ALTER COLUMN DueDate DATE NULL; 

/* data Teachers */
INSERT INTO Teachers (TeacherName, Email, HireDate)
VALUES ('John Smith', 'johnsmith@example.com', '2024-01-01');

/* data Courses */
INSERT INTO Courses (CourseName, [Description], TeacherID)
VALUES ('Physics', 'Basic Physics Course', 12);

/* data Activities */
INSERT INTO Activities (ActivityName, CourseID, ActivityType, DueDate)
VALUES ('Quiz 1', 11, 'Quiz', '2024-12-31');

/* add Courses */
INSERT INTO Courses (CourseName, [Description], TeacherID)
VALUES ('Mathematics', 'Basic Algebra', 1);

/* add Activities */
INSERT INTO Activities (ActivityName, ActivityType, DueDate, CourseID)
VALUES ('Test', 'Midterm Exam', '2024-01-10', 6),
('HomeWork', 'Midterm Exam', '2024-04-10', 7),
('Test', 'Assignment', '2024-07-10', 8)

/* add Students */
INSERT INTO Students (StudentName, Email, EnrollmentDate ,GPA)
VALUES ('Ali Waleed', 'ali@Email.com', '2024-01-01', 4.9);

/* add Assignments */
INSERT INTO Assignments (Title, [Description], DueDate, CourseID)
VALUES
('Assignment 1', 'Math assignment covering algebra', '2022-03-15', 10),
('Assignment 2', 'Physics assignment covering motion', '2021-06-10', 2),
('Assignment 3', 'Chemistry assignment covering reactions', '2021-10-05', 3),
('Assignment 4', 'Biology assignment covering cells', '2020-12-20', 4),
('Assignment 5', 'History assignment covering WWII', '2023-01-18', 5);


/* add Submissions */
INSERT INTO Submissions (AssignmentID, StudentID, Grade, SubmissionDate)
VALUES (10,1,67,'2024-01-11'),
(9,2,56,'2024-01-11'),
(8,3,76,'2024-01-11'),
(8,4,98,'2024-01-11'),
(8,5,67,'2024-01-11'),
(8,6, 87,'2024-01-11'),
(7,7,46,'2024-01-11'),
(7,8,46,'2024-01-11'),
(7,9,49,'2024-01-11'),
(7,10,93,'2024-01-11'),
(7,11,49,'2024-01-11'),
(6,12,50,'2024-01-11'),
(6,13,28,'2024-01-11'),
(6,14,82,'2024-01-11'),
(6,15,49,'2024-01-11'),
(6,17,69,'2024-01-11'),
(6,20, 90,'2024-01-11');


/* add Enrollments */
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 6, '2021-09-01'),
(2, 6, '2020-12-15'),
(3, 7, '2022-02-20'),
(4, 7, '2019-08-30'),
(5, 8, '2023-03-14');

/* add data to show output in vw_Tests */
INSERT INTO Students (StudentName, Email, EnrollmentDate)
VALUES ('Mayar Waleed', 'Mayar@Email.com', '2024-01-01'),
('Ali Ahmed', 'Ali_Ahmed@Email.com', '2024-05-01');
INSERT INTO Courses (CourseName, [Description], TeacherID)
VALUES ('Mathematics', 'Basic Algebra', 1),
       ('DataBase', 'View', 1),
	   ('Expert System', 'Tensorflow', 1);
INSERT INTO Activities (ActivityName, ActivityType, DueDate, CourseID)
VALUES ('Test', 'Midterm Exam', '2024-01-10', 14),
('HomeWork', 'Midterm Exam', '2024-04-10', 15),
('Test', 'Assignment', '2024-07-10', 16);
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 14, '2021-11-01'),
(2, 14, '2020-12-15'),
(3, 15, '2022-11-20'),
(4, 15, '2019-12-30'),
(5, 16, '2023-12-14');



/* result View all activities */
SELECT * FROM vw_ActivitiesSummary;

/* result View all activities ===> Test */
SELECT * FROM vw_Tests;

/*===================================*/
/* Query to display all students with their courses   */
SELECT 
    S.StudentName, 
    C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;


/* insert data into (Query to display all assignments with courses & teachers) query*/
INSERT INTO Courses (CourseName, [Description], TeacherID)
VALUES ('Physics', 'Basic Physics Course', 2),
('Physics', 'Basic Physics Course', 10),
('Physics', 'Basic Physics Course', 3),
('Physics', 'Basic Physics Course', 4);
INSERT INTO Assignments (Title, [Description], DueDate, CourseID)
VALUES
('Assignment 1', 'Math assignment covering algebra', '2022-03-15', 11),
('Assignment 2', 'Physics assignment covering motion', '2021-06-10', 12),
('Assignment 3', 'Chemistry assignment covering reactions', '2021-10-05', 13);
INSERT INTO Teachers (TeacherName, Email, HireDate)
VALUES ('iman arandas', 'iman@example.com', '2001-8-21');
/* Query to display all assignments with courses & teachers */
SELECT 
    A.Title AS AssignmentTitle, 
    C.CourseName, 
    T.TeacherName
FROM Assignments A
JOIN Courses C ON A.CourseID = C.CourseID
JOIN Teachers T ON C.TeacherID = T.TeacherID;

/* Query to display students' grades in assignments */
SELECT 
    S.StudentName, 
    A.Title AS AssignmentTitle, 
    Sub.Grade
FROM Submissions Sub
JOIN Students S ON Sub.StudentID = S.StudentID
JOIN Assignments A ON Sub.AssignmentID = A.AssignmentID;

/* Query to display students who have not registered for any course */
SELECT 
    S.StudentName
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.EnrollmentID IS NULL;

/* Query to display the courses taught by each teacher */
SELECT 
    T.TeacherName, 
    C.CourseName
FROM Teachers T
JOIN Courses C ON T.TeacherID = C.TeacherID;

/* Query to display students' grades in each course */
SELECT 
    S.StudentName, 
    C.CourseName, 
    Sub.Grade
FROM Submissions Sub
JOIN Students S ON Sub.StudentID = S.StudentID
JOIN Assignments A ON Sub.AssignmentID = A.AssignmentID
JOIN Courses C ON A.CourseID = C.CourseID;

/* Query to display students who have registered for more than one course    */
SELECT 
    S.StudentName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.StudentName
HAVING COUNT(E.CourseID) > 1;

/* uery to display teachers with the courses they have taught */
SELECT 
    T.TeacherName, 
    C.CourseName
FROM Teachers T
JOIN Courses C ON T.TeacherID = C.TeacherID


/*====================================================================================================================================*/


/*1) Procedure to add a new student */

CREATE PROCEDURE AddStudent 
    @StudentName NVARCHAR(100), 
    @Email NVARCHAR(100), 
    @EnrollmentDate DATE
AS
BEGIN
    INSERT INTO Students (StudentName, Email, EnrollmentDate)
    VALUES (@StudentName, @Email, @EnrollmentDate);
END;
/* Execute ---> Procedure to add a new student*/
EXEC AddStudent 
    @StudentName = 'Mayar Waleed', 
    @Email = 'MayarWaleed@example.com', 
    @EnrollmentDate = '2004-12-21';


/*2) Procedure to add a new teacher */

CREATE PROCEDURE AddTeacher 
    @TeacherName NVARCHAR(100), 
    @Email NVARCHAR(100), 
    @HireDate DATE
AS
BEGIN
    INSERT INTO Teachers (TeacherName, Email, HireDate)
    VALUES (@TeacherName, @Email, @HireDate);
END;
/* Execute ---> Procedure to add a new teacher */
EXEC AddTeacher 
    @TeacherName = 'Sara Mohamed', 
    @Email = 'sara.mohamed@example.com', 
    @HireDate = '2024-01-01';



/*3) Procedure to add a new course */

CREATE PROCEDURE AddCourse 
    @CourseName NVARCHAR(100),
    @Description VARCHAR(500),
    @TeacherID INT
AS
BEGIN
    INSERT INTO Courses (CourseName, Description, TeacherID)
    VALUES (@CourseName, @Description, @TeacherID);
END;
/* Execute ---> Procedure to add a new course */
EXEC AddCourse 
    @CourseName = 'Database Design',
    @Description = 'Learn about designing relational databases',
    @TeacherID = 1;


/*4) Procedure for adding a student registration to a course */

CREATE PROCEDURE AddEnrollment 
    @StudentID INT,
    @CourseID INT,
    @EnrollmentDate DATE
AS
BEGIN
    INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
    VALUES (@StudentID, @CourseID, @EnrollmentDate);
END;
/* Execute ---> Procedure for adding a student registration to a course */
EXEC AddEnrollment 
    @StudentID = 1, 
    @CourseID = 11, 
    @EnrollmentDate = '2024-02-01';


/*5) Procedure to add a new assignment */

CREATE PROCEDURE AddAssignment 
    @Title NVARCHAR(100),
    @Description NVARCHAR(500),
    @DueDate DATE,
    @CourseID INT
AS
BEGIN
    INSERT INTO Assignments (Title, Description, DueDate, CourseID)
    VALUES (@Title, @Description, @DueDate, @CourseID);
END;
/* Execute ---> Procedure to add a new assignment */
EXEC AddAssignment 
    @Title = 'Normalization Assignment', 
    @Description = 'Perform normalization for the given database schema', 
    @DueDate = '2024-02-10', 
    @CourseID = 2;


/*6) Procedure for adding a grade to a specific assignment */

alter /*create*/  PROCEDURE AddGrade
    @AssignmentID INT,
    @StudentID INT,
    @Grade FLOAT,
	@SubmissionDate date
AS
BEGIN
    INSERT INTO Submissions (AssignmentID, StudentID,SubmissionDate, Grade)
    VALUES (@AssignmentID, @StudentID,@SubmissionDate, @Grade);
END;
/* Execute ---> Procedure for adding a grade to a specific assignment */
EXEC AddGrade 
    @AssignmentID = 11, 
    @StudentID = 1, 
	@SubmissionDate='2002-11-1',
    @Grade = 95.0;








/*7) Procedure for calculating a studentís GPA in each course */

CREATE PROCEDURE CalculateStudentAverage 
    @StudentID INT
AS
BEGIN
    SELECT 
        C.CourseName, 
        AVG(SUB.Grade) AS AverageGrade
    FROM Submissions SUB
    JOIN Assignments A ON SUB.AssignmentID = A.AssignmentID
    JOIN Courses C ON A.CourseID = C.CourseID
    WHERE SUB.StudentID = @StudentID
    GROUP BY C.CourseName;
END;
/* Execute ---> Procedure for calculating a studentís GPA in each course */
EXEC CalculateStudentAverage 
    @StudentID = 1;


/*8) Procedure for displaying the courses in which the student is registered */

CREATE PROCEDURE GetStudentCourses
    @StudentID INT
AS
BEGIN
    SELECT 
        C.CourseName 
    FROM Enrollments E
    JOIN Courses C ON E.CourseID = C.CourseID
    WHERE E.StudentID = @StudentID;
END;
/* Execute ---> Procedure for displaying the courses in which the student is registered */
EXEC GetStudentCourses 
    @StudentID = 1;


/*9)  Procedure for displaying the highest grade obtained by the student in each course*/

CREATE PROCEDURE GetHighestGrade 
    @StudentID INT
AS
BEGIN
    SELECT 
        C.CourseName, 
        MAX(SUB.Grade) AS HighestGrade
    FROM Submissions SUB
    JOIN Assignments A ON SUB.AssignmentID = A.AssignmentID
    JOIN Courses C ON A.CourseID = C.CourseID
    WHERE SUB.StudentID = @StudentID
    GROUP BY C.CourseName;
END;
/* Execute --->  Procedure for displaying the highest grade obtained by the student in each course */
EXEC GetHighestGrade 
    @StudentID = 1;


 
/*10)  Procedure for calculating the success and failure rate in each course */

CREATE PROCEDURE CalculatePassFailRate1
    @CourseID INT,
    @PassingGrade FLOAT
AS
BEGIN
    SELECT 
        CASE 
            WHEN COUNT(*) = 0 THEN 0
            ELSE COUNT(CASE WHEN SUB.Grade >= @PassingGrade THEN 1 END) * 100.0 / COUNT(*) 
        END AS PassRate,
        CASE 
            WHEN COUNT(*) = 0 THEN 0
            ELSE COUNT(CASE WHEN SUB.Grade < @PassingGrade THEN 1 END) * 100.0 / COUNT(*) 
        END AS FailRate
    FROM Submissions SUB
    JOIN Assignments A ON SUB.AssignmentID = A.AssignmentID
    WHERE A.CourseID = @CourseID;
END;

/* Execute --->  Procedure for calculating the success and failure rate in each course */
EXEC CalculatePassFailRate1
    @CourseID = 10, 
    @PassingGrade = 67.0;
EXEC CalculatePassFailRate1
    @CourseID = 2, 
    @PassingGrade = 46.0;


/*11) Procedure to display students who have scored above 90 in a particular subject */

CREATE PROCEDURE GetTopStudentInCourse
    @CourseID INT
AS
BEGIN
    WITH MaxGrades AS (
        SELECT 
            SUB.StudentID, 
            MAX(SUB.Grade) AS MaxGrade
        FROM Submissions SUB
        JOIN Assignments A ON SUB.AssignmentID = A.AssignmentID
        WHERE A.CourseID = @CourseID
        GROUP BY SUB.StudentID
    )
    SELECT 
        S.StudentName, 
        MG.MaxGrade
    FROM MaxGrades MG
    JOIN Students S ON MG.StudentID = S.StudentID
    ORDER BY MG.MaxGrade DESC;
END;

/* Execute ---> Procedure to display students who have scored above 90 in a particular subject */
EXEC GetTopStudents 
    @CourseID = 3;



/*12) Procedure for calculating the number of students enrolled in a particular course */

CREATE PROCEDURE GetCourseEnrollmentCount 
    @CourseID INT
AS
BEGIN
    SELECT 
        COUNT(E.StudentID) AS EnrollmentCount
    FROM Enrollments E
    WHERE E.CourseID = @CourseID;
END;
/* Execute ---> Procedure for calculating the number of students enrolled in a particular course */
EXEC GetCourseEnrollmentCount 
    @CourseID = 7;


/*13)Procedure To view all assignments for a particular course */

CREATE PROCEDURE GetAssignmentsForCourse
    @CourseID INT
AS
BEGIN
SELECT 
        A.Title, 
        A.Description, 
        A.DueDate
    FROM Assignments A
    WHERE A.CourseID = @CourseID;
END;
/* Execute ---> Procedure To view all assignments for a particular course  */
EXEC GetAssignmentsForCourse 
    @CourseID = 11;


/*14) Procedure to display the names of teachers who have taught more than one course*/

CREATE PROCEDURE GetTeachersWithMultipleCourses
AS
BEGIN
    SELECT 
        T.TeacherName, 
        COUNT(C.CourseID) AS CourseCount
    FROM Teachers T
    JOIN Courses C ON T.TeacherID = C.TeacherID
    GROUP BY T.TeacherName
    HAVING COUNT(C.CourseID) > 1;
END;
/* Execute --->  Procedure to display the names of teachers who have taught more than one course */
EXEC GetTeachersWithMultipleCourses;


/*15) Procedure to display courses that no one has registered for yet */
CREATE PROCEDURE GetUnenrolledCourses
AS
BEGIN
    SELECT 
        C.CourseName
    FROM Courses C
    LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
    WHERE E.StudentID IS NULL;
END;
/* Execute --->  Procedure to display courses that no one has registered for yet */
EXEC GetUnenrolledCourses;





