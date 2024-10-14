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