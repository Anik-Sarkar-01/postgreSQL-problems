-- delete the entire table 
DELETE FROM students;

-- delete something specific (here any operator / method / function can be applied just like select)
DELETE FROM students
    WHERE grade = 'B';