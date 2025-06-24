
-- Create the students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    math_grade INTEGER
);


INSERT INTO students (first_name, last_name, birth_date)
VALUES 
('Marc', 'Benichou', '1998-11-02'),
('Yoan', 'Cohen', '2010-12-03'),
('Lea', 'Benichou', '1987-07-27'),
('Amelia', 'Dux', '1996-04-07'),
('David', 'Grez', '2003-06-14'),
('Omer', 'Simpson', '1980-10-03');

-- 1. 
UPDATE students
SET birth_date = '1998-11-02'
WHERE (first_name = 'Lea' OR first_name = 'Marc') AND last_name = 'Benichou';

-- 2.
UPDATE students
SET last_name = 'Guez'
WHERE first_name = 'David' AND last_name = 'Grez';

-- 3.
DELETE FROM students
WHERE first_name = 'Lea' AND last_name = 'Benichou';

-- 4.
SELECT COUNT(*) FROM students;

-- 5.
SELECT COUNT(*) FROM students
WHERE birth_date > '2000-01-01';

-- 6. Add math_grade column (already added in table creation)
ALTER TABLE students ADD COLUMN math_grade INTEGER;(if not already created)

-- 7. 
UPDATE students SET math_grade = 80 WHERE id = 1;
UPDATE students SET math_grade = 90 WHERE id IN (2, 4);
UPDATE students SET math_grade = 40 WHERE id = 6;

-- 8.
SELECT COUNT(*) FROM students
WHERE math_grade > 83;

-- 9. 
INSERT INTO students (first_name, last_name, birth_date, math_grade)
VALUES ('Omer', 'Simpson', (SELECT birth_date FROM students WHERE first_name = 'Omer' AND last_name = 'Simpson' LIMIT 1), 70);

-- 10. 
SELECT first_name, last_name, COUNT(math_grade) AS total_grade
FROM students
GROUP BY first_name, last_name;

-- 11. 
SELECT SUM(math_grade) AS total_sum_of_grades FROM students;
