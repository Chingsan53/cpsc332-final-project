DROP DATABASE IF EXISTS classReport;
CREATE DATABASE classReport;
USE classReport;

/* 1. Professor */
DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (
	PSSN int NOT NULL PRIMARY KEY,
    Professor_firstname varchar(20),
    Professor_lastname varchar(20),
    Phone_Area int,
    Phone_Digit int,
    Sex varchar(1),
    Street_Name varchar(20),
    Street_Number varchar(20),
    City varchar(20),
    State varchar(2),
    Zip_Code int,
    Title varchar(10),
    Salary int,
    Degree varchar (20)
);

/* 4. Department */
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  DNum int NOT NULL PRIMARY KEY,
  DName varchar(50),
  DPhone int(10), 
  DLocation varchar(50),
  Chair varchar(20) /* chair person is a professor */
);

/* 3. Course */
DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
  Course_number varchar(20) PRIMARY KEY,
  Course_title varchar(50),
  Textbook varchar(50),
  Credit_hours int(2),
  Prerequisite varchar(20), /* course is a prerequisite of other course */
  DNum int
);

/* 4. Section */
DROP TABLE IF EXISTS Section;
CREATE TABLE Section (
  Section_number int NOT NULL PRIMARY KEY,
  Course_number varchar(20),
  Num_seat int,
  Meeting_date DATE,
  Beg_Time TIME,
  End_Time TIME,
  Semester varchar(50),
  Year int(4),
  Instructor varchar(50) /* Each section is taught by a professor */
);

/* 5. Student Record */
DROP TABLE IF EXISTS Grade_report;
CREATE TABLE Grade_report (
  CWID int,
  SName varchar(50),
  Address varchar(50),
  Phone_number int,
  Section_identifier int, /* Each student majors in one department and minor in several Dept */
  Student_number int, /* Name includes first name and last name */
  Grade varchar(1)
);

/* 6. Enrollment Record */
DROP TABLE IF EXISTS Grade_report;
CREATE TABLE Grade_report (
   CWID int, 
   Course_Num int, 
   Grade varchar(2)
);

DROP TABLE IF EXISTS Prerequisite;
CREATE TABLE Prerequisite (
  Course_number varchar(20),
  Prerequisite_number varchar(50)
);



/* 8 Students, 2 Departments, 3 Professors, 4 Courses, 6 Sections, 20 Enrollment Records */

INSERT INTO Student VALUES
(17, 'Smith', 1, 'CS');
INSERT INTO Student VALUES
(8, 'Brown', 2, 'CS');

INSERT INTO Course VALUES
('CS1310', 'Intro to Computer Science', 4, 'CS');
INSERT INTO Course VALUES
('CS3320', 'Data Science', 4, 'CS');
INSERT INTO Course VALUES
('MATH2410', 'Discrete Mathematics', 3, 'MATH');
INSERT INTO Course VALUES
('CS3380', 'Database', 3, 'CS');

INSERT INTO Section VALUES
(85, 'MATH2410', 'Fall', 07, 'King');
INSERT INTO Section VALUES
(92, 'CS1310', 'Fall', 07, 'Anderson');
INSERT INTO Section VALUES
(102, 'CS3320', 'Spring', 08, 'Knuth');
INSERT INTO Section VALUES
(112, 'MATH2410', 'Fall', 08, 'Chang');
INSERT INTO Section VALUES
(119, 'CS1310', 'Fall', 08, 'Anderson');

INSERT INTO Grade_report VALUES
(112, 17, 'B');
INSERT INTO Grade_report VALUES
(119, 17, 'C');
INSERT INTO Grade_report VALUES
(85, 8, 'A');
INSERT INTO Grade_report VALUES
(92, 8, 'A');
INSERT INTO Grade_report VALUES
(102, 8, 'B');
INSERT INTO Grade_report VALUES
(135, 8, 'A');

INSERT INTO Prerequisite VALUES
('CS3380', 'CS3320');
INSERT INTO Prerequisite VALUES
('CS3380', 'MATH2410');
INSERT INTO Prerequisite VALUES
('CS3320', 'CS1310');