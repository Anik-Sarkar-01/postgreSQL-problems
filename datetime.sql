-- Active: 1747931679226@@127.0.0.1@5432@ph
-- to see the timezone
SHOW Timezone;

-- to see the timestamp 
-- (timestamp is a encoded information identifying when exactly a certain event occurred. combination of date, time and timezone)
SELECT now();

-- there are two types of timestamp
    -- 1. timestamp with timezone
    -- 2. timestamp without timezone

CREATE TABLE timeZ(timeWithZone TIMESTAMP with time zone, timeWithoutZone TIMESTAMP without time zone);
INSERT INTO timeZ VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00')

SELECT * FROM timeZ;
-- to see the current date only
SELECT CURRENT_DATE;

-- above using the another technique (casting)
-- here we can converting the entire timestamp to date and time
SELECT now()::date;
SELECT now()::time;

-- date formatting
-- to get the date in a your desired format
-- see more formats on - https://www.postgresql.org/docs/current/functions-formatting.html
SELECT to_char(now(), 'dd/mm/yyyy')

-- calculate time interval
-- see more on https://www.datacamp.com/doc/postgresql/interval

-- to go to the past from the current date (-)
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';
-- to go to the future from the current date (+)
SELECT CURRENT_DATE + INTERVAL '1 year 2 month';

-- to calculate the age (age function)
SELECT age(CURRENT_DATE, '1999-01-21')

-- calculating age when dob is given
SELECT *, age(CURRENT_DATE, dob) as "STUDENT_AGE" FROM STUDENTS

-- extract --> extracting something from from the given date
SELECT extract(year from '2024-01-25'::date)

SELECT extract(month from '2025-12-06'::date)