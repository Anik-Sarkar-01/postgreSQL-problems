CREATE TABLE students2(
    student_id SERIAL PRIMARY KEY,
    roll INTEGER UNIQUE NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    age INTEGER,
    department VARCHAR(100),
    score INTEGER,
    student_status VARCHAR(50),
    last_login DATE
)

CREATE TABLE courses (
    course_id SERIAL,
    courser_name VARCHAR(50)
)
--1. Add a column email (VARCHAR) to the existing students table.
ALTER table students2
    ADD COLUMN email VARCHAR(50)

--2. Rename the column email to student_email.
ALTER TABLE students2 
    RENAME COLUMN email to student_email;

--3. Add a UNIQUE constraint to student_email.
ALTER TABLE students2
    ADD CONSTRAINT unique_students2_student_email UNIQUE(student_email)

--4. Add a PRIMARY KEY to a new table named courses.
ALTER TABLE courses
    ADD CONSTRAINT pk_courses_course_id PRIMARY KEY(course_id);

--5. Drop a column from any existing table.
ALTER TABLE courses
    DROP COLUMN courser_name

INSERT INTO students2 (student_id, roll, student_name, age, department, score, student_status, last_login, student_email) 
VALUES
    (1, 111, 'Mr.K', 25, 'CSE', 84, 'passed', '2020-02-15', 'k@gmail.com'),
    (2, 112, 'Ms.L', 24, 'ECE', 79, 'passed', '2021-06-10', 'l@gmail.com'),
    (3, 113, 'Mr.M', 33, 'ME', 68, 'failed', '2022-03-25', 'm@gmail.com'),
    (4, 114, 'Ms.N', 23, 'EEE', NULL, 'passed', '2023-01-05', 'n@gmail.com'),
    (5, 115, 'Mr.O', 19, 'IT', 58, 'failed', '2024-04-17', 'o@gmail.com'),
    (6, 116, 'Ms.P', 15, 'CE', NULL, 'passed', '2020-08-21', 'p@gmail.com'),
    (7, 117, 'Mr.Q', 36, 'CSE', 77, 'passed', '2022-11-11', 'q@gmail.com'),
    (8, 118, 'Ms.R', 14, 'ECE', 66, 'failed', '2021-09-30', 'r@gmail.com'),
    (9, 119, 'Mr.S', 24, 'ME', 82, 'passed', '2023-06-14', 's@gmail.com'),
    (10, 120, 'Ms.T', 18, 'EEE', 74, 'passed', '2024-12-09', 't@gmail.com')

SELECT * FROM students2

-- 6. Write a query to find all students who have a score greater than 80 and not null.
SELECT *  FROM students2
 WHERE score > 80 AND score IS NOT NULL

-- 7. Use the NOT operator to exclude students from a specific department.
SELECT * FROM students2
WHERE NOT department = 'ECE';

-- 8. Fetch students whose names start with ‘M’ using LIKE and ILIKE.
SELECT * FROM students2
WHERE student_name LIKE '___M%'

SELECT * FROM students2
WHERE student_name ILIKE '___m%'

--9. Select all students whose age is between 18 and 25.
SELECT * FROM students2
    WHERE age BETWEEN 18 AND 25 ORDER BY age ASC

--10. Retrieve rows using IN for a specific set of roll numbers.
SELECT * FROM students2
    WHERE roll IN(111, 113, 120)

--11. Count how many students exist in the students table.
SELECT count(*) FROM students2

--12. Find the average score of students in a specific department.
SELECT avg(score) from students2
    WHERE department = 'CSE'

--13. Get the maximum and minimum age of all students.
SELECT max(age) as "Maximum Age" FROM students2;
SELECT min(age) as "Minimum Age" FROM students2;

--14. Update the status of students who scored less than 75 to 'failed'
UPDATE students2
    SET student_status = 'failed'
    WHERE score < 75

--15. Delete students who have not logged in since 2022.
DELETE FROM students2
    WHERE last_login <= '2022-12-31'

--16. Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM students2 LIMIT 5 OFFSET 5 * 1;


 TRUNCATE TABLE students2


 CREATE TABLE teachers (
    id serial PRIMARY KEY,
    full_name VARCHAR(50),
    post_code CHAR(6)
);

INSERT INTO teachers (id, full_name, post_code) 
VALUES
(1, 'Anik Sarkar', '122');

SELECT * FROM teachers;