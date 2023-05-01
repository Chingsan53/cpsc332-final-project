DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

/* 1. Professor */
DROP TABLE IF EXISTS professors;
CREATE TABLE professors (
  ssn CHAR(9) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code CHAR(5) NOT NULL,
  telephone CHAR(10) NOT NULL,
  sex CHAR(1) NOT NULL,
  title VARCHAR(50) NOT NULL,
  salary FLOAT NOT NULL,
  degrees VARCHAR(200) NOT NULL
);

/* 4. Department */
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  number INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  telephone CHAR(10) NOT NULL,
  office_location VARCHAR(100) NOT NULL,
  chairperson_ssn CHAR(9) NOT NULL,
  FOREIGN KEY (chairperson_ssn) REFERENCES professors(ssn)
);

/* 3. Course */
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  number INT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  textbook VARCHAR(100) NOT NULL,
  units INT NOT NULL,
  department_number INT NOT NULL,
  FOREIGN KEY (department_number) REFERENCES departments(number)
);

/* Prerequisites */
DROP TABLE IF EXISTS prerequisites;
CREATE TABLE prerequisites (
  course_number INT NOT NULL,
  prerequisite_number INT NOT NULL,
  PRIMARY KEY (course_number, prerequisite_number),
  FOREIGN KEY (course_number) REFERENCES courses(number),
  FOREIGN KEY (prerequisite_number) REFERENCES courses(number)
);

/* 4. Section */
DROP TABLE IF EXISTS sections;
CREATE TABLE sections (
  section_number INT PRIMARY KEY,
  classroom VARCHAR(50) NOT NULL,
  seats INT NOT NULL,
  meeting_days VARCHAR(10) NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  course_number INT NOT NULL,
  professor_ssn CHAR(9) NOT NULL,
  FOREIGN KEY (course_number) REFERENCES courses(number),
  FOREIGN KEY (professor_ssn) REFERENCES professors(ssn)
);

/* 5. Student */
DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code CHAR(5) NOT NULL,
  telephone CHAR(10) NOT NULL,
  major_department_number INT NOT NULL,
  FOREIGN KEY (major_department_number) REFERENCES departments(number)
);

/* 6. Student Minor */
DROP TABLE IF EXISTS student_minors;
CREATE TABLE student_minors (
  student_id INT NOT NULL,
  department_number INT NOT NULL,
  PRIMARY KEY (student_id, department_number),
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (department_number) REFERENCES departments(number)
);

/* 7. Enrollment */
DROP TABLE IF EXISTS enrollment;
CREATE TABLE enrollment (
  student_id INT NOT NULL,
  section_number INT NOT NULL,
  grade VARCHAR(2) NOT NULL,
  PRIMARY KEY (student_id, section_number),
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (section_number) REFERENCES sections(section_number)
);

-- Insert professors
INSERT INTO professors VALUES
  ('111111111', 'John Smith', '123 Main St', 'Anytown', 'CA', '12345', '5551234', 'M', 'Professor', 80000.0, 'PhD in Computer Science'),
  ('222222222', 'Jane Doe', '456 Elm St', 'Somewhere', 'NY', '67890', '5555678', 'F', 'Associate Professor', 60000.0, 'MA in History'),
  ('333333333', 'Bob Johnson', '789 Oak St', 'Nowhere', 'TX', '54321', '5559012', 'M', 'Assistant Professor', 40000.0, 'PhD in Mathematics');

-- Insert departments
INSERT INTO departments VALUES
  (1, 'Computer Science', '5551111', 'Science Building', '111111111'),
  (2, 'History', '5552222', 'Arts Building', '222222222');

-- Insert courses
INSERT INTO courses VALUES
  (1, 'Introduction to Programming', 'Programming in C', 4, 1),
  (2, 'Database Systems', 'Database Systems: Design, Implementation, and Management', 4, 1),
  (3, 'American History I', 'The American Pageant', 3, 2),
  (4, 'World History II', 'Patterns of World History', 3, 2);

-- Insert prerequisites
INSERT INTO prerequisites VALUES
  (2, 1),
  (4, 3);

-- Insert sections
INSERT INTO sections VALUES
  (1, 'Room 101', 30, 'MWF', '08:00:00', '08:50:00', 1, '111111111'),
  (2, 'Room 102', 20, 'MWF', '09:00:00', '09:50:00', 1, '111111111'),
  (3, 'Room 103', 25, 'MWF', '10:00:00', '10:50:00', 2, '111111111'),
  (4, 'Room 104', 35, 'TR', '11:00:00', '12:15:00', 3, '222222222'),
  (5, 'Room 105', 30, 'TR', '12:30:00', '13:45:00', 4, '333333333'),
  (6, 'Room 106', 25, 'MWF', '11:00:00', '11:50:00', 4, '333333333');

-- Insert students
INSERT INTO students VALUES
  (1, 'Alice', 'Adams', '123 Main St', 'Anytown', 'CA', '12345', '5551111', 1),
  (2, 'Bob', 'Baker', '456 Elm St', 'Somewhere', 'NY', '67890', '5552222', 2),
  (3, 'Charlie', 'Clark', '789 Oak St', 'Nowhere', 'TX', '54321', '5553333', 1),
  (4, 'David', 'Davis', '123 Broadway', 'Anywhere', 'CA', '98765', '5554444', 2),
  (5, 'Emily', 'Edwards', '456 Main St', 'Somewhere', 'NY', '23456', '5555555', 1),
  (6, 'Frank', 'Franklin', '789 Elm St', 'Anywhere', 'CA', '54321', '5556666', 1),
  (7, 'Grace', 'Garcia', '123 Oak St', 'Nowhere', 'TX', '87654', '5557777', 2),
  (8, 'Henry', 'Hernandez', '456 Broadway', 'Somewhere', 'NY', '76543', '5558888', 1);
  
-- Insert enrollment records
INSERT INTO enrollment VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(1, 3, 'C'),
(2, 1, 'B'),
(2, 4, 'C'),
(3, 1, 'C'),
(3, 2, 'B'),
(4, 4, 'A'),
(5, 2, 'B'),
(5, 3, 'A'),
(5, 4, 'B'),
(6, 1, 'A'),
(6, 4, 'C'),
(7, 2, 'C'),
(7, 3, 'A'),
(8, 1, 'B'),
(8, 2, 'B'),
(8, 3, 'B'),
(8, 4, 'A'),
(8, 5, 'C');
