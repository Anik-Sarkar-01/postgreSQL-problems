CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A', 'Canada'),
('Alice', 'Johnson', 19, 'A', 'Physics', 'alice.johnson@example.com', '2005-11-08', 'B', 'UK'),
('Bob', 'Millians', 22, 'C', 'Chemistry', 'bob.millians@example.com', '2001-07-03', 'A', 'Australia'),
('Charlie', 'Brown', 20, 'B', 'English', NULL, '2004-03-30', 'A', 'New Zealand'),
('Emma', 'Jones', 25, NULL, 'Biology', 'emma.jones@example.com', '2000-09-12', 'A', 'USA'),
('Michael', 'Johnson', 22, 'C', 'Physics', 'michael.johnson@example.com', '2002-06-05', 'O-', 'Canada'),
('Olivia', 'Davis', 21, NULL, 'Math', 'olivia.davis@example.com', '2003-12-18', 'B+', 'New Zealand'),
('Sophia', 'Brown', 24, 'A', 'English', 'sophia.brown@example.com', '1999-06-23', 'AB+', 'New Zealand'),
('William', 'Taylor', 20, 'B', 'Chemistry', NULL, '2004-05-04', 'A', 'Australia'),
('Liam', 'Miller', 19, 'C', 'History', 'liam.miller@example.com', '2005-02-19', 'A', 'USA'),
('Ava', 'Anderson', 22, NULL, 'Biology', 'ava.anderson@example.com', '2003-11-15', 'B', 'Canada'),
('Leah', 'Martinez', 21, 'A', 'Physics', NULL, '2001-06-28', 'O', 'New Zealand'),
('Isabella', 'Clark', 20, 'C', 'Chemistry', 'isabella.clark@example.com', '2005-10-05', 'A', 'Australia'),
('Ethan', 'Garcia', 25, NULL, 'Math', 'ethan.garcia@example.com', '2000-07-22', 'O+', 'New Zealand'),
('Sophie', 'Moore', 22, 'A', 'English', 'sophie.moore@example.com', '2002-12-05', 'A', 'USA'),
('Mia', 'Hernandez', 20, 'C', 'History', 'mia.hernandez@example.com', '2004-05-18', 'AB', 'Canada'),
('James', 'Young', 21, 'B', 'Biology', 'james.young@example.com', '2003-02-08', 'O', 'New Zealand'),
('Liam', 'Wright', 18, 'C', 'Math', 'liam.wright@example.com', '2006-06-14', 'A', 'New Zealand');

-- to see every column from a table
SELECT * FROM students

-- to see specific column from a table
SELECT first_name, last_name FROM students;

-- column aliasing
SELECT email as "Student Email", age as student_age FROM students;

-- show data in ascending order (on a specific column)
SELECT * FROM students ORDER BY first_name ASC;
SELECT country FROM students ORDER BY country ASC;

-- show data in descending order (on a specific column)
SELECT * FROM students ORDER BY first_name DESC;


-- to see only the unique/distinct values inside a column
SELECT DISTINCT country FROM students;


-- data filtering
-- Select students from the USA
-- Select students with "A" grade in Physics
-- Select students with a specific blood group ("O+")
-- Select students from the USA or from Australia
-- Select students from the USA or from Australia and the age is 20
-- Select students with a grade of 'A' or 'B' in Math or Physics
-- Select students older than 20

-- Select students from the USA
SELECT * FROM students
    WHERE country = 'USA'

-- Select students with "A" grade in Physics
SELECT * FROM students
    WHERE grade = 'A' AND course = 'Physics'

-- Select students with a specific blood group ("O+")
SELECT * FROM students
    WHERE blood_group = 'O+'

-- Select students from the USA or from Australia
SELECT * FROM students
    WHERE country = 'USA' OR country = 'Australia';

-- Select students from the USA or from Australia and the age is 20
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia') AND age = 20; 

-- Select students with a grade of 'A' or 'B' in Math or Physics.
SELECT * FROM students
    WHERE (grade = 'A' OR grade = 'B') AND (course = 'Math' OR course = 'Physics');

-- Select students whose age is less than 20
SELECT * FROM students
    WHERE age < 20;

-- Select students whose age is greater than or equal 20 with the course History
SELECT * FROM students
    WHERE age >= 20 AND course = 'History'

-- Select students whose age is not 20
-- nb: we can write the not equal sign in this way too - (<>)
SELECT * FROM students
    WHERE age != 20;

-- above can be written like  this
SELECT * FROM students
    WHERE not country = 'USA'

-- function in postgreSQL
-- scalar function
-- UPPER() CONVERTS A STRING TO UPPERCASE
-- LOWER() CONVERTS A STRING TO LOWERCASE
-- CONCAT() CONCATENATES TWO OR MORE STRINGS
-- LENGTH() RETURNS THE NUMBER OF CHARACTERS IN A STRING

-- AGGREGATE FUNCTIONS
-- AVG() CALCULATE THE AVERAGE OF A SET OF VALUES
-- MAX() RETURNS THE MAX VALUE IN A SET
-- MIN() RETURNS THE MINIMUM VALUE IN A SET
-- SUM CALCULATES THE SUM OF VALUES IN A SET
-- COUNT() COUNTS THE NUMBER OF ROWS IN A SET

SELECT upper(first_name) as first_name_in_upper from students;
SELECT concat(first_name,' ', last_name, ' ', age) from students;

SELECT avg(age) FROM STUDENTS;
SELECT max(age) FROM STUDENTS;
SELECT min(age) FROM STUDENTS;
SELECT count(*) FROM students;

-- combination of scalar and aggregate function
SELECT max(length(first_name)) from students;

-- handling NULL (we can not handle null in a conventional way. because any mathematical operation with null is null. but we need something to be true or false to get any result from the table)
SELECT * FROM students
    WHERE email is NULL;

SELECT * FROM students
    WHERE email is NOT NULL;

-- null coalescing operator (If NULL is there, take the second value)
SELECT COALESCE(email, 'Email Not Provided!') as "Email", blood_group, first_name FROM students;

-- IN Operator (alternative of OR operator. advantage is we don't need to repeat same thing again and again)
-- only rows containing usa and uk
SELECT * FROM students 
    WHERE country IN('USA', 'UK')

-- only rows without usa and uk
SELECT * FROM students 
    WHERE country NOT IN('USA', 'UK')

SELECT * FROM students 
    WHERE age >= 20 AND age <= 23

-- the same above thing can be achieved like this
SELECT * FROM students
    WHERE age BETWEEN 20 AND 23

SELECT * FROM students
  WHERE dob BETWEEN '2001-01-01' AND '2005-01-01' ORDER BY dob DESC;

-- LIKE operator
-- suppose I want the rows where the first_name ends with 'am'
SELECT * FROM students
    WHERE first_name LIKE '%am'

-- suppose I want the rows where the first_name starts with 'A'
SELECT * FROM students
    WHERE first_name LIKE 'A%'

-- suppose I want the rows where the first_name starts with two any characters 
-- then there will be 'a' and then anything will be there (one (_) means one random character)
SELECT * FROM students
    WHERE first_name LIKE '__a%'

-- LIKE operator is case sensitive
-- therefor ILIKE operator can be use incase of case insensitivity
SELECT * FROM students
    WHERE first_name ILIKE 'a%'

-- LIMIT AND OFFSET
-- LIMIT --> setting the limit of rows
SELECT * FROM students LIMIT 5;

-- OFFSET --> from the beginning how many rows should be ignored
SELECT * FROM students LIMIT 5 OFFSET 2;

-- using limit and offset we can handle pagination
SELECT * FROM students LIMIT 5 OFFSET 5*0;
SELECT * FROM students LIMIT 5 OFFSET 5*1;
SELECT * FROM students LIMIT 5 OFFSET 5*2;



SELECT * FROM students;