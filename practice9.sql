CREATE TABLE students3 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments2(id),
    last_login DATE
)

INSERT INTO students3 (id, name, department_id, last_login) VALUES
(1, 'Alice Johnson', 101, '2025-05-01'),
(2, 'Brian Lee', 102, '2025-04-28'),
(3, 'Clara Singh', 103, '2025-05-15'),
(4, 'David Kim', 101, '2024-03-10'),
(5, 'Emily Zhao', 104, '2025-05-20'),
(6, 'Farhan Malik', 102, '2025-04-05'),
(7, 'Grace Chen', 105, '2025-02-25'),
(8, 'Hassan Ali', 103, '2025-01-30'),
(9, 'Ivy Thompson', 101, '2025-05-22'),
(10, 'Jack Brown', 104, '2023-03-17');


CREATE TABLE departments2 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO departments2 (id, name) VALUES
(101, 'CSE'),
(102, 'ECE'),
(103, 'ME'),
(104, 'EEE'),
(105, 'IT');


CREATE TABLE courses2 (
    id SERIAL PRIMARY KEY,
    title TEXT
)

INSERT INTO courses2 (title) VALUES
('Data Structures'),
('Digital Logic Design'),
('Thermodynamics'),
('Linear Algebra'),
('Operating Systems'),
('Microprocessors'),
('Database Systems'),
('Software Engineering'),
('Machine Learning'),
('Computer Networks');


--1. Retrieve students who have logged in within the last 30 days.
SELECT * FROM students3
WHERE last_login > CURRENT_DATE - INTERVAL '1 month';

--2. Extract the login month from the last_login and group students by month.
SELECT extract(month from last_login) as login_month from students3
GROUP BY login_month

SELECT to_char(last_login, 'Month') as login_month, extract(month from last_login) as login_month_in_number from students3
GROUP BY login_month, login_month_in_number

--3. Count how many students logged in per month and show only those months where login count is more than 3.
SELECT to_char(last_login, 'Month') as login_month, count(*) from students3
GROUP BY login_month
HAVING count(*) > 3

--4. Create a foreign key constraint on department_id in the students table referencing departments(id).
CREATE TABLE students3 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments2(id),
    last_login DATE
)

-- 5. Try inserting a student with a department_id that doesn’t exist and observe the behavior.
INSERT INTO students3 (id, name, department_id, last_login) VALUES
(11, 'Anamika Rani', 102, '2024-10-10')

-- 6. Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.
DELETE FROM departments2 WHERE id = 103;
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id) ON DELETE CASCADE
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id) ON DELETE SET NULL
)

--7. Join students and departments using INNER JOIN to display each student's department name.
SELECT department_id, departments2.name  FROM students3
JOIN departments2 ON students3.department_id = departments2.id

--8. Use a LEFT JOIN to show all students including those without a department
INSERT INTO students3 (id, name, department_id, last_login) VALUES
(12, 'Shakil', NULL, '2025-05-23'),
(13, 'Alamin', NULL, '2024-05-23')

SELECT * FROM students3
LEFT JOIN departments2 ON students3.department_id = departments2.id

--9. Use a RIGHT JOIN to show all departments including those without students.
INSERT INTO departments2 (id, name) VALUES
(106, 'Aeronautical');
INSERT INTO departments2 (id, name) VALUES
(107, 'Nuclear');
SELECT * FROM students3
RIGHT JOIN departments2 ON students3.department_id = departments2.id

--10. Perform a FULL JOIN to get all records from both students and departments.
SELECT * FROM students3
FULL JOIN departments2 ON students3.department_id = departments2.id

--11. Create a cross-product of all students and courses using CROSS JOIN.
SELECT * FROM students3
CROSS JOIN courses2

--12. Use NATURAL JOIN between tables that have a shared column like department_id

 SELECT * FROM students3
 NATURAL JOIN departments2
-- (this won't work properly as there is not any shared column)

SELECT * FROM students3;
SELECT * FROM departments2;
SELECT * FROM courses2;

