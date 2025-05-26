-- update something on the table
UPDATE students
    SET email = 'default@gmail.com'
    WHERE email IS NULL

UPDATE students
    SET email = '58@gmail.com', grade = 'F'
    WHERE student_id = 58;

CREATE TABLE patients (
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bed_no INT
);

INSERT INTO patients (id, first_name, last_name, bed_no) VALUES
(1, 'Anik', 'Sarkar', 102),
(2, 'Jakir', 'Joy', 222),
(3, 'Shamsul', 'Arefin', 303)

UPDATE patients
SET bed_no = 220
WHERE id = 3


SELECT * FROM patients

drop table patients

