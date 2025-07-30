
CREATE DATABASE IF NOT EXISTS school_system;
USE school_system;

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    subject_id INT,
    grade FLOAT,
    PRIMARY KEY(student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO classes VALUES
(1, 'First Grade'),
(2, 'Second Grade');

INSERT INTO students VALUES
(1, 'Ali Hassan', 1),
(2, 'Mona Said', 1),
(3, 'Youssef Adel', 2),
(4, 'Nour Ashraf', 2),
(5, 'Hana Tamer', 1);

INSERT INTO subjects VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'History');

INSERT INTO enrollments VALUES
(1, 1, 90),
(2, 1, 88),
(3, 2, 75),
(4, 3, 95),
(5, 2, 80);

SELECT student_name, class_name
FROM students
JOIN classes ON students.class_id = classes.class_id;

SELECT student_name, grade
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN subjects ON enrollments.subject_id = subjects.subject_id
WHERE subject_name = 'Science';

SELECT student_name
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN subjects ON enrollments.subject_id = subjects.subject_id
WHERE subject_name = 'Math';