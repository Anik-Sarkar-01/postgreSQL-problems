SELECT country, count(*), avg(age) from students
    GROUP BY country

-- filtering with group by
SELECT country, avg(age) from students
    GROUP BY country
    HAVING avg(age) > 20

-- filter groups using having to Show Only Countries with Average Age above 21
-- Count Students Born in each year
SELECT country as "COUNTRY", avg(age) as "AVG" from students
    GROUP BY country
        HAVING avg(age) > 21

-- Count Students Born in each year
SELECT extract(year from dob) as "YEAR OF BIRTH", count(*) FROM students
    GROUP BY "YEAR OF BIRTH";

SELECT * from students