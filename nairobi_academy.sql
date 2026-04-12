------------------------------------------------------------
-- SCHEMA SETUP
------------------------------------------------------------

-- Q1: Create schema and use it
CREATE SCHEMA IF NOT EXISTS nairobi_academy;

SET search_path TO nairobi_academy, public;

------------------------------------------------------------
-- Q2: Create students table
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS students (
    student_id    INTEGER      PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    gender        CHAR(1)      NOT NULL,        -- 'M' or 'F'
    date_of_birth DATE         NOT NULL,
    class         VARCHAR(10)  NOT NULL,        -- e.g. 'Form 1'
    city          VARCHAR(50)  NOT NULL
);

------------------------------------------------------------
-- Q3: Create subjects table
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS subjects (
    subject_id    INTEGER       PRIMARY KEY,
    subject_name  VARCHAR(100)  NOT NULL,
    department    VARCHAR(50)   NOT NULL,
    credits       INTEGER       NOT NULL
);

------------------------------------------------------------
-- Q4: Create exam_results table
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS exam_results (
    result_id   INTEGER    PRIMARY KEY,
    student_id  INTEGER    NOT NULL REFERENCES students(student_id),
    subject_id  INTEGER    NOT NULL REFERENCES subjects(subject_id),
    exam_date   DATE       NOT NULL,
    marks       INTEGER    NOT NULL
);

------------------------------------------------------------
-- Teachers table
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id   INTEGER       PRIMARY KEY,
    teacher_name VARCHAR(100)  NOT NULL,
    subject_id   INTEGER       NOT NULL REFERENCES subjects(subject_id)
);

------------------------------------------------------------
-- Q5: Add phone_number column to students
------------------------------------------------------------
ALTER TABLE students
    ADD COLUMN IF NOT EXISTS phone_number VARCHAR(20);

------------------------------------------------------------
-- Q6: Rename credits to credit_hours in subjects
------------------------------------------------------------
ALTER TABLE subjects
    RENAME COLUMN credits TO credit_hours;

------------------------------------------------------------
-- Q7: Drop phone_number column from students
------------------------------------------------------------
ALTER TABLE students
    DROP COLUMN IF EXISTS phone_number;

------------------------------------------------------------
-- Q8: Insert 10 students (example data)
------------------------------------------------------------
TRUNCATE TABLE exam_results RESTART IDENTITY;
TRUNCATE TABLE teachers RESTART IDENTITY;
TRUNCATE TABLE subjects RESTART IDENTITY;
TRUNCATE TABLE students RESTART IDENTITY;

INSERT INTO students (
    student_id, first_name, last_name, gender,
    date_of_birth, class, city
) VALUES
    (1,  'John',    'Mwangi',   'M', '2008-01-15', 'Form 1', 'Nairobi'),
    (2,  'Alice',   'Njeri',    'F', '2007-05-20', 'Form 2', 'Mombasa'),
    (3,  'Brian',   'Otieno',   'M', '2006-09-03', 'Form 3', 'Kisumu'),
    (4,  'Emily',   'Wambui',   'F', '2005-12-11', 'Form 4', 'Nairobi'),
    (5,  'Esther',  'Akinyi',   'F', '2007-03-08', 'Form 3', 'Nakuru'),   
    (6,  'Peter',   'Kamau',    'M', '2008-07-27', 'Form 2', 'Nairobi'),
    (7,  'Anthony', 'Kariuki',  'M', '2006-02-19', 'Form 4', 'Mombasa'),
    (8,  'Evelyn',  'Chebet',   'F', '2008-11-05', 'Form 1', 'Kisumu'),
    (9,  'Grace',   'Njoki',    'F', '2007-08-30', 'Form 2', 'Nairobi'),
    (10, 'Daniel',  'Odhiambo', 'M', '2005-10-22', 'Form 4', 'Nairobi');

------------------------------------------------------------
-- Q9: Insert 10 subjects
------------------------------------------------------------
INSERT INTO subjects (
    subject_id, subject_name, department, credit_hours
) VALUES
    (1,  'Mathematics',                  'Sciences',   4),
    (2,  'English',                      'Languages',  3),
    (3,  'Kiswahili',                    'Languages',  3),
    (4,  'Biology',                      'Sciences',   4),
    (5,  'Chemistry',                    'Sciences',   4),
    (6,  'Physics',                      'Sciences',   4),
    (7,  'History',                      'Humanities', 3),
    (8,  'Geography',                    'Humanities', 3),
    (9,  'Christian Religious Education','Humanities', 2),
    (10, 'Business Studies',             'Humanities', 3);

------------------------------------------------------------
-- Teachers sample data (for EvenMoreComparison teacher queries)
------------------------------------------------------------
INSERT INTO teachers (teacher_id, teacher_name, subject_id) VALUES
    (1, 'Ms Wanja',   1),
    (2, 'Mr Otieno',  2),
    (3, 'Ms Achieng', 4),
    (4, 'Ms Moraa',   5),
    (5, 'Mr Kimani',  7);

------------------------------------------------------------
-- Q10: Insert 10 exam results
------------------------------------------------------------
INSERT INTO exam_results (
    result_id, student_id, subject_id, exam_date, marks
) VALUES
    (1,  1, 1,  '2024-03-15', 78),
    (2,  2, 2,  '2024-03-15', 65),
    (3,  3, 4,  '2024-03-16', 82),
    (4,  4, 5,  '2024-03-16', 47),
    (5,  5, 1,  '2024-03-17', 49),   
    (6,  6, 3,  '2024-03-17', 72),
    (7,  7, 6,  '2024-03-18', 55),
    (8,  8, 7,  '2024-03-18', 39),
    (9,  9, 10, '2024-03-19', 68),   
    (10, 10, 8, '2024-03-20', 90);

------------------------------------------------------------
-- Q11: Confirm data
------------------------------------------------------------
SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM teachers;
SELECT * FROM exam_results;

------------------------------------------------------------
-- Q12: Update Esther Akinyi's city (student_id = 5)
------------------------------------------------------------
UPDATE students
SET city = 'Nairobi'
WHERE student_id = 5;

------------------------------------------------------------
-- Q13: Correct marks for result_id 5 from 49 to 59
------------------------------------------------------------
UPDATE exam_results
SET marks = 59
WHERE result_id = 5;

------------------------------------------------------------
-- Q14: Delete exam result with result_id 9
------------------------------------------------------------
DELETE FROM exam_results
WHERE result_id = 9;

------------------------------------------------------------
-- FIRST ASSIGNMENT: SECTION C (Q15–Q20)
------------------------------------------------------------

-- Q15: All students in Form 4
SELECT *
FROM students
WHERE class = 'Form 4';

-- Q16: All subjects in the Sciences department
SELECT *
FROM subjects
WHERE department = 'Sciences';

-- Q17: Exam results where marks >= 70
SELECT *
FROM exam_results
WHERE marks >= 70;

-- Q18: All female students (gender = 'F')
SELECT *
FROM students
WHERE gender = 'F';

-- Q19: Students who are in Form 3 AND from Nairobi
SELECT *
FROM students
WHERE class = 'Form 3'
  AND city = 'Nairobi';

-- Q20: Students who are in Form 2 OR Form 4
SELECT *
FROM students
WHERE class = 'Form 2'
   OR class = 'Form 4';

------------------------------------------------------------
-- FIRST ASSIGNMENT: PART 2 (BETWEEN / IN / LIKE / COUNT / CASE)
------------------------------------------------------------

-- PART 2, SECTION A

-- P2-Q1: Exam results where marks are between 50 and 80 (inclusive)
SELECT *
FROM exam_results
WHERE marks BETWEEN 50 AND 80;

-- P2-Q2: Exams between 15th March 2024 and 18th March 2024
SELECT *
FROM exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

-- P2-Q3: Students who live in Nairobi, Mombasa, or Kisumu
SELECT *
FROM students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');

-- P2-Q4: Students NOT in Form 2 or Form 3
SELECT *
FROM students
WHERE class NOT IN ('Form 2', 'Form 3');

-- P2-Q5: Students whose first name starts with 'A' or 'E'
SELECT *
FROM students
WHERE first_name LIKE 'A%'
   OR first_name LIKE 'E%';

-- P2-Q6: Subjects whose name contains 'Studies'
SELECT *
FROM subjects
WHERE subject_name LIKE '%Studies%';

-- PART 2, SECTION B - COUNT

-- P2-Q7: How many students are currently in Form 3?
SELECT COUNT(*) AS form3_students
FROM students
WHERE class = 'Form 3';

-- P2-Q8: How many exam results have a mark of 70 or above?
SELECT COUNT(*) AS results_70_and_above
FROM exam_results
WHERE marks >= 70;

-- PART 2, SECTION C - CASE WHEN

-- P2-Q9: Grade description per exam result
SELECT
    result_id,
    student_id,
    subject_id,
    marks,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM exam_results;

-- P2-Q10: Student level (Senior / Junior)
SELECT
    first_name,
    last_name,
    class,
    CASE
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
    END AS student_level
FROM students;

------------------------------------------------------------
-- SECOND PART (Q1–Q21)
------------------------------------------------------------

-- Q1: Students whose gender is NOT 'M'
SELECT *
FROM students
WHERE gender <> 'M';

-- Q2: Exam results where marks > 60 AND < 90
SELECT *
FROM exam_results
WHERE marks > 60
  AND marks < 90;

-- Q3: Subjects NOT in Sciences department
SELECT *
FROM subjects
WHERE department <> 'Sciences';

-- Q4: Exams between 15th March 2024 and 18th March 2024
SELECT *
FROM exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

-- Q5: Students born between 1st Jan 2008 and 31st Dec 2008
SELECT *
FROM students
WHERE date_of_birth BETWEEN '2008-01-01' AND '2008-12-31';

-- Q6: Subjects in Languages or Humanities using IN
SELECT *
FROM subjects
WHERE department IN ('Languages', 'Humanities');

-- Q7: Students whose last name ends with 'u'
SELECT *
FROM students
WHERE last_name LIKE '%u';

-- Q8: Teachers whose name starts with 'Ms'
SELECT *
FROM teachers
WHERE teacher_name LIKE 'Ms%';

-- Q9: Total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- Q10: Number of subjects in Sciences department
SELECT COUNT(*) AS sciences_subjects
FROM subjects
WHERE department = 'Sciences';

-- Q11: Number of students from Nairobi
SELECT COUNT(*) AS students_from_nairobi
FROM students
WHERE city = 'Nairobi';

-- Q12: CASE WHEN grade for each exam result
SELECT
    result_id,
    student_id,
    subject_id,
    marks,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM exam_results;

-- Q13: CASE WHEN Senior/Junior by class
SELECT
    first_name,
    last_name,
    class,
    CASE
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
    END AS student_level
FROM students;

-- Q14: CASE WHEN STEM / Arts by department
SELECT
    subject_id,
    subject_name,
    department,
    CASE
        WHEN department = 'Sciences' THEN 'STEM'
        WHEN department IN ('Humanities', 'Languages') THEN 'Arts'
    END AS subject_category
FROM subjects;

-- Q15: CASE WHEN full gender text
SELECT
    first_name,
    last_name,
    gender,
    CASE
        WHEN gender = 'F' THEN 'Female'
        WHEN gender = 'M' THEN 'Male'
    END AS gender_full
FROM students;

-- Q16: CASE WHEN mark labels (Excellent/Good/Average/Poor)
SELECT
    result_id,
    student_id,
    subject_id,
    marks,
    CASE
        WHEN marks >= 90 THEN 'Excellent'
        WHEN marks >= 70 THEN 'Good'
        WHEN marks >= 50 THEN 'Average'
        ELSE 'Poor'
    END AS mark_label
FROM exam_results;

-- Q17: Female students in Form 3 from Nairobi
SELECT *
FROM students
WHERE gender = 'F'
  AND class = 'Form 3'
  AND city = 'Nairobi';

-- Q18: Count exam results between 70 and 100
SELECT COUNT(*) AS results_70_to_100
FROM exam_results
WHERE marks BETWEEN 70 AND 100;

-- Q19: Subjects whose teacher's name starts with 'Ms' AND in Sciences
SELECT s.*
FROM subjects  AS s
JOIN teachers  AS t
  ON t.subject_id = s.subject_id
WHERE t.teacher_name LIKE 'Ms%'
  AND s.department = 'Sciences';

-- Q20: Full name, class, and Senior/Junior label
SELECT
    first_name || ' ' || last_name AS full_name,
    class,
    CASE
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        ELSE 'Junior'
    END AS student_level
FROM students;

-- Q21: Students NOT from Nairobi, born after 1st Jan 2008, names in UPPERCASE
SELECT
    UPPER(first_name || ' ' || last_name) AS full_name_upper,
    city,
    date_of_birth
FROM students
WHERE city <> 'Nairobi'
  AND date_of_birth > '2008-01-01';