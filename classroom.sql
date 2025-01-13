-- CREATE DATABASE temp1;
-- DROP DATABASE temp1;

-- create database temp2;
-- drop database temp2;

-- CREATE DATABASE college;
-- CREATE DATABASE college; -- gives error as this is already being created
-- CREATE DATABASE IF NOT EXISTS college;

-- -- DROP DATABASE company; -- we cant delete a db which doesnt exists
-- -- DROP DATABASE IF EXISTS company;

-- USE college;

-- CREATE TABLE student (
--     id INT PRIMARY KEY,
--     name VARCHAR(50),
--     age INT NOT NULL
-- );

-- INSERT INTO student VALUES(1, "Garima", 21);
-- INSERT INTO student VALUES(2, "Gaurav", 17);

-- SELECT * FROM student;

-- -- SHOW DATABASES;
-- SHOW TABLES;



-- DROP TABLE student;

-- CREATE DATABASE college;
-- USE college;

--  CREATE TABLE student(
--    roll_number INT PRIMARY KEY,
--    name VARCHAR(50)
--  );

-- INSERT INTO student
-- (roll_number, name)
-- VALUES
-- (101, "Garima"),
-- (102, "Gaurav"),
-- (103, "uttam"),
-- (104, "patel");

-- --  to select and view all columns , * denotes all
-- SELECT * FROM student;

-- DROP TABLE student;


-- Practice ques
-- CREATE DATABASE company;
-- USE company;

-- CREATE TABLE employee (
-- 	ID INT PRIMARY KEY,
--     name VARCHAR(50),
--     salary FLOAT8
-- );

-- INSERT INTO employee
-- (id, name, salary)
-- VALUES
-- (1, "ADAM" , 347382),
-- (2, "BOB", 48574.345343),
-- (3, "CASEY", 54343.34);

-- SELECT * FROM employee;

-- DROP DATABASE company;

--  CREATE DATABASE IF NOT EXISTS college;
--  USE college;
--  DROP DATABASE college;

-- CREATE TABLE student(
--     -- roll_number INT UNIQUE,
--     id INT,
--     name VARCHAR(50),
--     -- PRIMARY KEY(id, name) -- the combination of id and name is unique
--     PRIMARY KEY(id) -- we can declare it  after 
--   );

-- INSERT INTO student VALUES(101, "garima");
-- -- INSERT INTO student VALUES(101, "Gaurav"); -- cannot enter duplicate if the given constrait is unique
-- -- --  to select and view all columns , * denotes all

-- -- SELECT * FROM student;


-- CREATE TABLE temp2 (
-- 	num INT,
--     salary INT DEFAULT 2500,
--     age INT,
--     city VARCHAR(50),
--     -- cant adda any row if the constraint is not satisfied
--     CONSTRAINT CHECK (age >= 19 AND city = "DELHI")
--     -- the above statement is same as
--    -- CONSTRAINT elegibility_check CHECK (age >= 19 AND city = "DELHI")
-- );
-- CREATE TABLE newTAB (
-- 	-- also a method to do constaint check 
-- 	age INT CHECK (age >= 18) 
-- );

-- INSERT INTO temp2 (num) VALUES (101);
-- SELECT * FROM temp2;

CREATE DATABASE IF NOT EXISTS college;
USE college;
-- DROP DATABASE college;

CREATE TABLE IF NOT EXISTS studentinfo (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO studentinfo
(rollno, name, marks,grade, city)
VALUES
(101, "Garima", 99, "A", "BANGALORE"),
(102, "BHUMIKA" , 78, "B", "pune"),
(103, "Chetan", 34, "D", "Delhi"),
(104, "BHUMffKA" , 78, "B", "pune"),
(105, "Chgffetan", 34, "D", "Delhi");


-- SELECT name, marks FROM studentinfo;

-- SELECT DISTINCT city FROM studentinfo;


-- Where clauses -- difines the condition
SELECT * FROM studentinfo WHERE marks >60;

-- below is the another method to write where clause
SELECT *
FROM studentinfo
WHERE marks > 80 AND city = "BANGALORE"; 

-- Where clause can also use operators ex 
-- aithmatic operators +, -, *, %,
-- comparision operators = (equal to), != , >, >=, etc
-- logical operators -> AND, OR, IN , ALL 
-- bitwise operators &, | biwise and or 

SELECT *
FROM studentinfo
WHERE marks + 10 > 80 AND city = "BANGALORE"; 

SELECT *
FROM studentinfo
WHERE marks BETWEEN 80 AND 100; -- here 80  and 90 are inclusive 

SELECT *
FROM studentinfo
WHERE city IN ("BANGOLORE", "delhi", "pune","KANPUR"); -- either of the city option are true it returns those rows

SELECT *
FROM studentinfo
WHERE city NOT IN ("BANGOLORE","Delhi"); 

-- limit is used when we want a certain number of rows
SELECT *
FROM studentinfo
WHERe marks > 50
LIMIT 3;

-- to sord in ascending order (ASC) or descending order (DESC)
SELECT *
FROM studentinfo
ORDER BY city ASC;

SELECT *
FROM studentinfo
ORDER BY city DESC
LIMIT 3;

-- aggregate functions
-- COUNT(), AVG(), min()
SELECT marks
FROM studentinfo;


SELECT MAX(marks)
FROM studentinfo;

SELECT AVG(marks)
FROM studentinfo;

SELECT COUNT(marks) -- returns the numbr of entries
FROM studentinfo;

-- GROUP BY clause
SELECT city, name, COUNT(rollno)
FROM studentinfo
GROUP BY city, name;

SELECT city, avg(marks)
FROM studentinfo
GROUP BY city;


-- write the query to find the avg marks in each city in ascemding order
SELECT city, AVG(marks)
FROM studentinfo
GROUP BY city
ORDER BY AVG(marks) DESC; 

-- HAVING clause is used for same as where clause but when we want ot apply condition after grouping 
SELECT count(rollno), city
FROM studentinfo
GROUP BY city
HAVING max(marks) > 80;

-- gerneral order to write the select funtion
-- select cols(s)
-- from tabe_name 
-- WHERE condition
-- GAROUP BY cols
-- HAVING conditon
-- ORDER BY cols ASC;

SELECT city
FROM studentinfo
WHERE grade = "A"
GROUP BY city
HAVING max(marks) > 80;
 
SET SQL_SAFE_UPDATES = 0;

UPDATE studentinfo
SET grade = "O"
WHERE grade = "A";

SELECT * FROM studentinfo;

UPDATE studentinfo
SET marks = marks + 1;

SELECT * FROM studentinfo;

-- DELETE -> used to delete some existing rows

DELETE FROM studentinfo 
WHERE marks < 50;

SELECT * FROM studentinfo;




CREATE DATABASE IF NOT EXISTS college;
USE college;

-- parent table 
CREATE TABLE IF NOT EXISTS dept (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);
INSERT INTO dept
VALUES
(101, "maths"),
(102, "chemistry"),
(103, "physics");

UPDATE dept
SET id = 104
WHERE id = 103;

SELECT * FROM dept;

-- child table -> where we use foreign key
CREATE TABLE IF NOT EXISTS teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) references dept(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
DROP TABLE teacher;
-- cascading in foreign key

INSERT INTO teacher
VALUES
(1, "GARIMA", 101),
(2, "GAURAV", 102),
(3, "NANCY", 103),
(4, "MAMMY", 102),
(5, "PAPA", 103);

SELECT * FROM teacher;



CREATE DATABASE IF NOT EXISTS college;
USE college;
-- DROP DATABASE college;

CREATE TABLE IF NOT EXISTS studentinfo (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
DROP TABLE studentinfo;

INSERT INTO studentinfo
(rollno, name, marks,grade, city)
VALUES
(101, "Garima", 99, "A", "BANGALORE"),
(102, "BHUMIKA" , 87, "B", "pune"),
(103, "Chetan", 40, "D", "Delhi"),
(104, "BHUMffKA" , 84, "B", "pune"),
(105, "Chgffetan", 34, "D", "Delhi");

-- alter - >to change the schema(cols , datatypes, constainsts)
-- following types 

ALTER TABLE studentinfo
RENAME TO student;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student 
CHANGE COLUMN rollno id INT;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

SELECT * FROM student;

-- -------------- DROP -> delelets the entire table , TRUNCATE -> deletes the data of the table only
TRUNCATE TABLE student;
SELECT * FROM student;

ALTER TABLE student
CHANGE name full_name VARCHAR(50);

DELETE FROM student
WHERE marks < 80;

ALTER TABLE student
DROP COLUMN grade;

-- JOINS in SQL -> can combine 2 or more tables based on related columns between them

CREATE DATABASE IF NOT EXISTS collegename;
USE collegename;
-- DROP TABLE student;
 -- DROP TABLE course;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO student
VALUES
(101,"Garima"),
(102,"Gaurav"),
(103,"Mammy"),
(104, "papa");

-- DROP TABLE course;

CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course
VALUES
(101, "English"),
(103, "Maths"),
(104, "Science"),
(107, "Computer");

SELECT * FROM course;

-- for finding the inner join of both the tables -- only the common between both the tables
SELECT *
FROM student as s      -- using of alias s will have the same meaning as the student
INNER JOIN course as c
-- ON student.id = course.id;
ON s.id = c.id;

-- left join - >returns all the recors from the left table and the matched records fromt eh right table
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id;


SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id;

-- when we want all records when there is a match in either left or right table

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
UNION
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id;


-- left exclusive join - data which is only present in only left table
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL;

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id
WHERE s.id IS NULL;


CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
	manager_id INT
);
INSERT INTO employee
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT e.name as manager_name, emp.name
FROM employee as e
JOIN employee as emp
ON e.id = emp.manager_id;

-- UNION -- it removes the duplicates and gets only the unique values
SELECT *
FROM student
UNION
SELECT *
FROM course;

-- UNION ALL -- it gives the duplicates also
SELECT *
FROM student
UNION ALL
SELECT *
FROM course;

-- SQL sub query or Inner query or nested query
-- it involves 2 select statements
-- three ways of writing subquery
-- 1. SELECT cols
-- 2. FROM table_name
-- 3. WHERE col_name operator
-- (subquery); (most used)

-- get the names of all the students who scored more than the class average
CREATE DATABASE IF NOT EXISTS college;
USE college;
-- DROP DATABASE college;

CREATE TABLE IF NOT EXISTS student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
DROP TABLE student;

INSERT INTO student
(rollno, name, marks,grade, city)
VALUES
(101, "Garima", 99, "A", "BANGALORE"),
(102, "BHUMIKA" , 87, "B", "pune"),
(103, "Chetan", 40, "D", "Delhi"),
(104, "BHUMffKA" , 84, "B", "pune"),
(105, "Chgffetan", 34, "D", "Delhi");

-- SELECT AVG(marks)
-- FROM student;

-- SELECT name, marks
-- FROM student
-- WHERE marks > 67.87348;

-- writing with the help of subquery -- in WHERE
-- which have more marks than the avg of the class
SELECT name , marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);

-- which of the follwing have the even roll numbers
SELECT rollno
FROM student
WHERE rollno IN (
	SELECT rollno
    FROM student
    WHERE rollno%2 = 0);


-- FROM subquery
-- find the max marks of studetns of delhi
SELECT max(marks)
FROM (SELECT * FROM student WHERE city = "delhi") AS temp; -- we have to use alis when we use subquey in FROM

-- SELECT subquery is not very useful
SELECT (SELECT MAX(marks) FROM student), name
FROM student;

-- MySQL view -> view is a virtual table
CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT *
FROM view1
WHERE marks > 90;




