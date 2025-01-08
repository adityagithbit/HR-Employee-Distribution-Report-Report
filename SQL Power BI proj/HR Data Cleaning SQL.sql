create database projects;

use project;


RENAME TABLE hrrhhr TO hr;
SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN `emp_id` empl_id VARCHAR(20) NULL;

DESCRIBE hr;
SELECT birthdate FROM hr;

SET sql_safe_updates = 0;
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
	ELSE NULL
END;



ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
	ELSE NULL
END;
SELECT hire_date FROM hr;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE; 

DESCRIBE hr;

SELECT hire_date FROM hr;

SELECT termdate FROM hr;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%sUTC'))
WHERE termdate IS NOT NULL AND termdate!='';

 
SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET SESSION sql_mode = '';


SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;






