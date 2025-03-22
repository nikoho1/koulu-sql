
CREATE TABLE Teachers (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);



CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    birth_year INT CHECK (birth_year BETWEEN 1900 AND 2025)
);



CREATE TABLE Classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    class_id INT REFERENCES Classes(class_id) ON DELETE CASCADE
);



CREATE TABLE Grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    teacher_id INT REFERENCES Teachers(teacher_id) ON DELETE SET NULL,
    subject VARCHAR(100) NOT NULL,
    grade DECIMAL(3,1) CHECK (grade BETWEEN 0.0 AND 10.0),
    graded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Teachers (name) VALUES ('Sara Hämäläinen'), ('Lauri Kivistö'), ('Antti Salonen');

INSERT INTO Students (name, birth_year) VALUES ('Elias Niemi', 2001), ('Sofia Mäkelä', 2005), ('Noora Lahtinen', 2008);

INSERT INTO Classes (class_name) VALUES ('9A'), ('9B'), ('10A');

INSERT INTO Enrollments (student_id, class_id) VALUES (1, 1), (2, 1), (3, 2);

INSERT INTO Grades (student_id, teacher_id, subject, grade) VALUES
(1, 1, 'Matematiikka', 8.5),
(2, 1, 'Matematiikka', 6.0),
(3, 2, 'Historia', 9.0),
(1, 3, 'Fysiikka', 7.5),
(2, 2, 'Historia', 5.5);