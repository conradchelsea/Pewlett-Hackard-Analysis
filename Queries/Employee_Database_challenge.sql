
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

1
select emp_no, first_name, last_name from employees
2
select  title, from_date, to_date from titles
3 & 4
-- Joining departments and dept_manager tables
-- SELECT 
--           employees.emp_no,
-- 		            employees.first_name,
-- 					employees.last_name,
-- 			titles.title,		
--      titles.from_date,
--      titles.to_date
-- -- 	 INTO current_employees
-- FROM employees
-- INNER JOIN titles
-- ON employees.emp_no = titles.emp_no;

SELECT 
          employees.emp_no,
		            employees.first_name,
					employees.last_name,
			titles.title,		
     titles.from_date,
     titles.to_date
-- 	 INTO current_employees
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order By employees.emp_no, titles.from_date desc;

DROP TABLE current_employees

SELECT 
          employees.emp_no,
		            employees.first_name,
					employees.last_name,
			titles.title,		
     titles.from_date,
     titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order By employees.emp_no, titles.from_date desc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

SELECT DISTINCT ON (employees.emp_no)
          employees.emp_no,
		            employees.first_name,
					employees.last_name,
			titles.title,		
     titles.from_date,
     titles.to_date
INTO unique_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order By employees.emp_no, titles.to_date desc;

SELECT COUNT(title) as title_count, title FROM unique_titles GROUP BY title
ORDER BY title_count DESC;
