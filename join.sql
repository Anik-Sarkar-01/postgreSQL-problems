-- join

-- inner join
SELECT title, username
FROM post
    JOIN "User" on post.user_id = "User".id;

SELECT * FROM post JOIN "User" on post.user_id = "User".id;

SELECT post.id FROM post JOIN "User" on post.user_id = "User".id;

-- table name aliasing
-- way 01
SELECT * FROM post p JOIN "User" u on p.user_id = u.id;

-- way 02 (better way. using as . more readable)
SELECT * FROM post as p JOIN "User" as u on p.user_id = u.id;

INSERT INTO post (title, user_id) VALUES ('this is test title', NULL)

-- LEFT JOIN (all value from left table , from right table only corresponding value (which meet the condition), others will be null)
-- we can mention left join as left outer join
SELECT * FROM post as p LEFT JOIN "User" as u on p.user_id = u.id;

-- RIGHT JOIN (all value from right table , from left table only corresponding value (which meet the condition), others will be null)
-- we can mention right join as right outer join
SELECT * FROM post as p RIGHT JOIN "User" as u on p.user_id = u.id;

-- FULL JOIN (all value from right table and left table , if condition is not met then use NULL

SELECT * FROM post as p FULL JOIN "User" as u on p.user_id = u.id;

SELECT * FROM post;

SELECT * FROM "User";

-- understanding cross join and natural join
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
)

CREATE TABLE departments (
    dept_id INT,
    dopt_name VARCHAR(50)
)

INSERT INTO employees VALUES (1, 'John Doe', 101);
INSERT INTO employees VALUES (2, 'Jane Smith', 102);
INSERT INTO departments VALUES (101, 'Human Resources');
INSERT INTO departments VALUES (102,'Marketing');

SELECT * FROM employees;
SELECT * FROM departments;

-- cross join
SELECT * FROM employees
CROSS JOIN departments;

-- natural join
-- NB: to perform the natural join there must be one common column in the tables
-- and in postgres if there is no common column in the tables , then natural join won't be 
-- performed properly and cross join will be performed.

SELECT * FROM employees
NATURAL JOIN departments;