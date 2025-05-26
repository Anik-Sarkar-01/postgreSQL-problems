CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id)
)

INSERT INTO
    "User" (username)
VALUES ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi')

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoying a sunny day with Akash',
        2
    ),
    (
        'Batash jest shared an amazing recipe',
        1
    ),
    (
        'Exploring adventures with Sagar',
        4
    ),
    (
        'Nodi''s wisdom always leaves inspired',
        4
    )

SELECT * FROM "User"

SELECT * FROM post

-- Insertion constraint on INSERT post (behavior during insertion)
-- Attempting to insert a post with a user ID that does not exist,
-- Inserting a post with a valid user id,
-- Attempting to insert a post without specifying a user ID

-- Deletion constraint on DELETE user (behavior during deletion)

-- Restrict Deletion --> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
DELETE FROM "User" WHERE id = 4;

-- Cascading Deletion --> ON DELETE CASCADE (ON DELETE CASCADE deletes  the foreign key from the tables. ON DELETE CASCADE should be used when creating the table column)
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id) ON DELETE CASCADE
)

-- Setting NULL --> ON DELETE SET NULL (ON DELETE SET NULL deletes the foreign key and set NULL as new value)
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id) ON DELETE SET NULL
)

-- Set Default value --> ON DELETE SET DEFAULT (ON DELETE SET NULL deletes the foreign key and set default value (value which was given at the time of table creation as default) as new value)
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "User" (id) ON DELETE SET DEFAULT DEFAULT 2
)