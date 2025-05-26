CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments(id)
)

INSERT INTO students (id, name, department_id) VALUES
(1, 'Amina Rahman', 101),
(2, 'Bashir Ahmed', 101),
(3, 'Chanchal Roy', 103),
(4, 'Dipto Hasan', 101),
(5, 'Esha Karim', 104)

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
)

INSERT INTO departments (id, dept_name) VALUES
(101, 'Computer Science'),
(102, 'Electronics & Communication'),
(103, 'Mechanical Engineering'),
(104, 'Electrical Engineering'),
(105, 'Information Technology')

SELECT students.id, students.name, departments.dept_name  FROM students
JOIN departments ON students.department_id= departments.id

SELECT * FROM students;
SELECT * FROM departments;

drop Table departments;
DROP Table students;