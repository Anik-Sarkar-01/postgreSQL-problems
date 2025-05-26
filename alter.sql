-- Active: 1747931679226@@127.0.0.1@5432@ph
SELECT * FROM person3;

-- add column
ALTER TABLE person3 
    ADD COLUMN email VARCHAR(25) DEFAULT 'sarkaranik29@gmail.com' NOT NULL;

INSERT INTO person3 VALUES(7, 'Kalam', 45, 'kalam@gmail.com')

INSERT INTO person3 VALUES(8, 'Kalam', 45)

-- delete column
ALTER TABLE person3
    DROP COLUMN  email;

-- rename a column
ALTER TABLE person3
    RENAME COLUMN age to user_age;

-- modify datatype of a column
ALTER TABLE person3
    ALTER COLUMN user_name TYPE VARCHAR(100);

-- add constraint on a column (only works for not null and default value because not null and default value works only with a individual column)
ALTER TABLE person3
    ALTER COLUMN user_age set NOT NULL

-- delete constraint on a column (only works for not null and default value because not null and default value works only with a individual column)
ALTER TABLE person3
    ALTER COLUMN user_age DROP NOT NULL

-- add constrain like UNIQUE and PRIMARY KEY
ALTER TABLE person3
    ADD CONSTRAINT unique_person3_user_age UNIQUE(user_age);

-- drop constrain like unique and primary key (no need to mention the column name)
ALTER TABLE person3
    DROP CONSTRAINT unique_person3_user_age;
