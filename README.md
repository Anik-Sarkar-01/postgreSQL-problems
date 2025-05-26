

## 1. What is PostgreSQL ?

PostgreSQL হলো ওপেন সোর্স (OPEN SOURCE) অবজেক্ট-রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (ORDBMS), যা কার্যকরভাবে ডাটাবেজ ম্যানেজ করার কাজে ব্যবহৃত হয় ।
PostgreSQL ব্যবহার করে সহজেই ডাটাবেজ এ ডাটা রিড, রাইট এবং মডিফাই করা যায়। এই ডাটাবেজ সিস্টেমে আমরা রিলেশনাল (SQL) এবং নন রিলেশনাল (JSON), উভয় ধরনের কুয়েরি ব্যবহার করতে পারি ।
সাধারণত PostgreSQL রিলেশনাল টেবিল ফরম্যাট এ ডাটা স্টোর করে থাকে । প্রতিটি টেবিল কিছু ROW এবং COLUMN এর সমন্বয়ে গঠিত হয় এবং একাধিক টেবিল এর মধ্যে সংযোগ স্থাপন করতে KEY ব্যবহার করা হয় । PostgreSQL এর মাধ্যমে আমরা বিভিন্ন ধরনের ডাটা স্টোর করতে পারি। যেমন, সংখ্যা (INTEGER), বুলিয়ান (BOOLEAN), তারিখ (DATE), টেক্সট (TEXT) ইত্যাদি । এমকি আমরা চাইলে PostgreSQL ব্যবহার করে JSON ডাটাও স্টোর করতে পারি, JSON এবং JSONB ডাটা টাইপস ব্যবহার করার মাধ্যমে ।


- ### 📌 PostgreSQL এর বৈশিষ্ট্য -

    - PostgreSQL, ACID (Atomicity, Consistency, Isolation, Durability) বৈশিষ্ট্যগুলো মেনে চলে। এর ফলে ডাটাবেজে ডাটা নির্ভরযোগ্যভাবে সংরক্ষিত হয় ।
    - PostgreSQL ব্যবহার করে বিভিন্ন ধরনের ডাটা সংরক্ষন করা যায় এবং বিভিন্ন ধরনের ফাংশন ব্যবহার করার সুবিধা, ডেভেলপারের কাজকে সহজ করে দেয়।
    - PostgreSQL বড় ডাটাবেজ পরিচালনা এবং জটিল কুয়েরি কার্যকরভাবে ও দ্রুততার সাথে সম্পাদনের জন্য পরিচিত ।
    - PostgreSQL বিভিন্ন ধরনের INDEXING সাপোর্ট করে। যেমন, B-trees, Hash, GiST ইত্যাদি। ফলে ডাটাবেজ থেকে ডাটা খুব দ্রুত পাওয়া যায় ।
    - PostgreSQL ব্যবহার করে কোনো ডাটাবেজ এ role-based access দেওয়া যায়। ফলে ডাটাবেজ এর নিরাপত্তা নিশ্চিত হয় ।
    - PostgreSQL ফ্রি এবং ওপেন সোর্স (OPEN SOURCE) হওয়ার ফলে, এটার উন্নয়ন এবং পরিচালনার জন্য একটা বড় কমিউনিটি কাজ করে ।

----
## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL ?
রিলেশনাল ডাটাবেজ এ Key হলো এমন কিছু গুরুত্বপূর্ণ উপাদান যার মাধ্যমে, ডাটাবেজ এর যেকোনো টেবিলের যেকোনো ডাটাকে খুব সহজেই খুঁজে পাওয়া যায় এবং একাধিক টেবিলের মধ্যে সম্পর্ক স্থাপন করা যায়। Key গুলো সাধারণত UNIQUE হয়ে থাকে।
- ### 📌 Concept of Primary Key -
    - Primary Key হলো কোনো একটা টেবিলের , এমন একটা COLUMN , যেটা সেই টেবিলের প্রতিটা ROW কে অনন্যভাবে (UNIQUELY) শনাক্ত করতে সাহায্য করে । Primary Key অবশ্যই NULL হতে পারে না এবং UNIQUE হয় । নিচের উদাহরনের মাধ্যমে বুঝার চেষ্টা করি -

        **`STUDENTS` Table -**
        ```markdown    
            | student_id      | name             | age       |
            |-----------------|------------------|-----------|
            | 1912001         | Anik Sarkar      | 23        |
            | 1912002         | Md. Rahid        | 24        |
            | 1912003         | Md. Shakil       | 26        |
            | 1912004         | Md. Rahid        | 26        |
        ```

        উপরের টেবিলে কিছু STUDENTS এর ডাটা আছে । এখন আমরা যদি Md. Rahid নাম এর STUDENT টার AGE খুঁজে বের করতে চাই, তাহলে আমরা CONFUSED হয়ে যাবো । কারন টেবিলে ২ জন Md. Rahid আছে । কিন্তু আমরা যদি, student_id যার 1912002, তার AGE খুঁজে বের করতে চাই, তাহলে আমরা কনো CONFUSION ছাড়াই তা খুঁজে বের করতে পারবো । অর্থাৎ আমি কোনো একজন স্টূডেন্টকে UNIQUELY খুঁজে পেতে student_id এর সাহায্য নিতে পারি । তাই student_id COLUMN টাকে উপরের টেবিলের Primary Key হিসেবে নির্ধারণ করা যেতে পারে ।

        কোনো COLUMN কে PRIMARY KEY হিসেবে DECLARE করার নিয়ম -
        ```markdown
            CREATE TABLE STUDENTS (
                student_id SERIAL PRIMARY KEY,
                name VARCHAR(50) NOT NULL,
                age INT NOT NULL
            )
        ```
- ### 📌 Concept of Foreign Key -
    - Foreign Key হলো একটি টেবিলের এমন একটি কলাম, যা অন্য একটি টেবিলের Primary Key-কে নির্দেশ করে। এর মাধ্যমে একাধিক টেবিলের মধ্যে সম্পর্ক (RELATION) তৈরি করা সম্ভব হয়। 
    নিচের উদাহরনের মাধ্যমে বুঝার চেষ্টা করি -

        **`STUDENTS` Table -**
        ```markdown
            | student_id      | name             | age       |
            |-----------------|------------------|-----------|
            | 1912001         | Anik Sarkar      | 23        |
            | 1912002         | Md. Rahid        | 24        |
            | 1912003         | Md. Shakil       | 26        |
            | 1912004         | Md. Rahid        | 26        |
        ```
        **`RESULTS` Table -**
        ```markdown
            |id   | student_id      | grade   |         
            |---- |-----------------|---------|
            |1    | 1912001         | A+      |
            |2    | 1912002         | A       |
            |3    | 1912003         | B       |
            |4    | 1912004         | F       |
        ```

        উপরের STUDENT টেবিল এর student_id , RESULT টেবিল এ FOREIGN KEY হিসেবে ব্যবহৃত হয়েছে । সুতরাং টেবিল দুটোর মধ্যে student_id এর মাধ্যমে সম্পর্ক স্থাপন হয়েছে । শুধুমাত্র student_id জানা থাকলেই টেবিল দুটোর যেকোনো তথ্য বের করার সম্ভব । 

        কোনো COLUMN কে FOREIGN KEY হিসেবে DECLARE করার নিয়ম -

        ```mardown
            CREATE TABLE STUDENTS (
                student_id SERIAL PRIMARY KEY,
                name VARCHAR(50) NOT NULL,
                age INT NOT NULL
            )

            CREATE TABLE RESULTS (
                id SERIAL PRIMARY KEY,
                student_id INT NOT NULL REFERENCES STUDENTS(student_id),
                grade VARCHAR(10) NOT NULL,
            )
        ```
---
## 3. What is the difference between the VARCHAR and CHAR data types ?
PostgreSQL এ VARCHAR এবং CHAR, এই দুটো data types সাধারণত ব্যবহার করা হয় টেক্সট (TEXT) ডাটা স্টোর করতে। তবে এদের মধ্যে কিছু পার্থক্য আছে।
### VARCHAR এবং CHAR এর মধ্যে পার্থক্য -

|বিষয়                     |CHAR                          |VARCHAR                             |
|-------------------------|-------------------------------|-------------------------------------|
|**পূর্ণ রূপ**              |Character                      |Variable Character                  |
|**লেখার ধরণ**           |CHARACTER(N) or CHAR(N)        |VARCHAR(n)                          |
|**ডেটা দৈর্ঘ্য**            |নির্দিষ্ট দৈর্ঘ্যের (FIXED) CHARACTERS স্টোর করে     |পরিবর্তনশীল দৈর্ঘ্যের (UPTO N) CHARACTERS স্টোর করে   |
|**স্টোরেজ**              |নির্ধারিত সাইজ অনুযায়ী জায়গা নেয়, এমনকি যদি FIXED LENGTH এর চেয়ে CHARACTERS কম থাকে বাকি জায়গাগুলোতে SPACE বসে |যতগুলো অক্ষর থাকে, শুধুমাত্র ততটুকুই জায়গা নেয়  |
|**ব্যবহার**               | যখন সকল ডেটা সমান দৈর্ঘ্যের হবে    | যখন ডেটার দৈর্ঘ্য ভিন্ন ভিন্ন হতে পারে  |

**`উদাহরণ` -**
```mardown
CREATE TABLE teachers (
    id serial PRIMARY KEY,
    full_name VARCHAR(50),
    post_code CHAR(6)
);
```
```markdown
INSERT INTO teachers (id, full_name, post_code) VALUES
(1, 'Anik Sarkar', '788100');

```
উপরের টেবিলে full_name এর VALUE হিসেবে সর্বোচ্চ ৫০ CHARACTERS সম্বলিত কোনো TEXT দেওয়া যাবে । ৫০ CHARACTERS এর বেশি কোনো টেক্সট দিলে ERROR দেখাবে ।কিন্তু post_code এর VALUE হিসেবে ৬ CHARACTERS সম্বলিত কোনো TEXT দিতেই হবে । যদি এর কম CHARACTERS সম্বলিত কোনো টেক্সট দেওয়া হয়, তাহলে DEFAULT ভাবে ৬ CHARACTERS পূর্ন না হওয়া পর্যন্ত স্পেস (SPACE) বসে যাবে । ৬ CHARACTERS এর বেশি কোনো টেক্সট দিলে ERROR দেখাবে ।

---

## 4. How can you modify data using UPDATE statements ?
একটা টেবিলের কোনো DATA পরিবর্তন/সংশোধন করতে UPDATE statement ব্যবহার করা হয়।
কিভাবে একটা টেবিলের ডাটাকে Update statement এর সাহায্যে পরিবর্তন/সংশোধন করা হয় তা নিচে উদাহরণসহ ব্যাখ্যা করা হলো -

ধরি, patients নামে একটা টেবিল আছে -
```markdown
CREATE TABLE patients (
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bed_no INT
);
```
 
এবং `patients` টেবিলে কিছু ডাটা আছে -

```markdown
INSERT INTO patients (id, first_name, last_name, bed_no) VALUES
(1, 'Anik', 'Sarkar', 102),
(2, 'Jakir', 'Joy', 222),
(3, 'Shamsul', 'Arefin', 303)
```
### Table `Before Update` -
![Table before update](https://i.ibb.co/r2qWJmFr/image.png "Image of patients table")

এখন যদি id = 3 এর bed_no পরিবর্তন করে, 303 থেকে 220 করতে চাই -
```markdown
UPDATE patients
SET bed_no = 220
WHERE id = 3

SET: COLUMN এর পরিবর্তিত VALUE কি হবে, তা নির্ধারণ করে ।
WHERE: ঠিক কোন ROW তে আপডেট হবে, তা নির্ধারণ করে ।
```
### Table `After Update` -
![Table after update](https://i.ibb.co/kVnrw4v0/image.png "Image of patients table after update")


---

## 5. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
### 📌 JOIN এর গুরুত্ব -
একাধিক টেবিলের মধ্যে সম্পর্কযুক্ত ডেটাগুলো একসাথে নিয়ে কোনো কাজ করার জন্য JOIN Operation ব্যবহৃত হয় । সাধারণত RELATIONAL DATABASE ধারনা হলো বিভিন্ন TABLE এর মধ্যে সম্পর্ক তৈরি করে, DATABASE কে বেশি কার্যকর করে তোলা । এবং JOIN Operations মাধ্যমে আমরা এই ধারনাকে ভালোভাবে কাজে লাগাতে পারি । 

### JOIN কীভাবে কাজ করে -
JOIN Operation সাধারণত ROW MATCHING এর ভিত্তিতে কাজ করে । কোনো টেবিলের PRIMARY KEY যখন অন্য একটি টেবিলের FOREIGN KEY হিসেবে ব্যবহার করা হয় । তখন এই ২ টি টেবিলের মধ্যে JOIN Operation সম্ভব হয় ।

### JOIN Operation এর সময় -
- প্রথমে একাধিক টেবিলের মধ্যে কোন COMMON COLUMN নির্ধারণ করা হয় ।
- তারপর SQL JOIN স্টেটমেন্ট ব্যবহার করে COMMON COLUMN মান মিলিয়ে MATCHING ROW বের করা হয় ।
- সবশেষে একাধিক টেবিল থেকে মিল পাওয়া ROW গুলো নিয়ে একটি নতুন টেবিল তৈরি হয় ।

`উদাহরন` -
### `students` Table
```markdown
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments(id)
)
```
```markdown
INSERT INTO students (id, name, department_id) VALUES
(1, 'Amina Rahman', 101),
(2, 'Bashir Ahmed', 101),
(3, 'Chanchal Roy', 103),
(4, 'Dipto Hasan', 101),
(5, 'Esha Karim', 104)

```
![student table](https://i.ibb.co/wZMM1LS4/image.png "Image of student table")

### `departments` Table

```markdown
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
)
```
```markdown
INSERT INTO departments (id, dept_name) VALUES
(101, 'Computer Science'),
(102, 'Electronics & Communication'),
(103, 'Mechanical Engineering'),
(104, 'Electrical Engineering'),
(105, 'Information Technology')
```
![department table](https://i.ibb.co/bjcck9w9/image.png "Image of department table")

### এখন যদি আমরা শুধুমাত্র প্রতিটা student এর department দেখতে চাই -

```markdown
SELECT students.id, students.name, departments.dept_name  FROM students
JOIN departments ON students.department_id= departments.id
```
![table after join operation](https://i.ibb.co/vvJ8c2sd/image.png "Image after join")