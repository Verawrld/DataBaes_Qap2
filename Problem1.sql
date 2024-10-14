-- Create student table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    school_enrollment_date DATE NOT NULL
);

-- create professors table
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- create courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

-- create enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Insert students
INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('John', 'Doe', 'john.doe@example.com', '2021-09-01'),
('Jane', 'Smith', 'jane.smith@example.com', '2021-09-01'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2021-09-01'),
('Bob', 'Brown', 'bob.brown@example.com', '2021-09-01'),
('Charlie', 'Davis', 'charlie.davis@example.com', '2021-09-01');

-- Insert professors
INSERT INTO professors (first_name, last_name, department) VALUES
('Dr. Emily', 'White', 'Computer Science'),
('Dr. Michael', 'Green', 'Mathematics'),
('Dr. Sarah', 'Black', 'Physics'),
('Dr. David', 'Blue', 'Chemistry');

-- Insert courses
INSERT INTO courses (course_name, course_description, professor_id) VALUES
('Introduction to Computer Science', 'Basic concepts of computer science', 1),
('Calculus I', 'Introduction to calculus', 2),
('General Physics', 'Fundamentals of physics', 3);

-- Insert enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2021-09-02'),
(2, 1, '2021-09-02'),
(3, 2, '2021-09-02'),
(4, 3, '2021-09-02'),
(5, 3, '2021-09-02'),
(1, 2, '2021-09-02'),
(2, 3, '2021-09-02');

-- Retrieve the full names of all students enrolled in "Physics 101"
SELECT s.first_name || ' ' || s.last_name AS full_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Physics 101';

-- Retrieve a list of all courses along with the professor’s full name who teaches each course
SELECT c.course_name, p.first_name || ' ' || p.last_name AS professor_full_name
FROM courses c
JOIN professors p ON c.professor_id = p.id;

-- Retrieve all courses that have students enrolled in them
SELECT DISTINCT c.course_name
FROM courses c
JOIN enrollments e ON c.id = e.course_id;

-- Update the email of the student with id 1
UPDATE students
SET email = 'new.email@example.com'
WHERE id = 1;

-- Remove the student with id 1 from the course with id 2
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 2;