
-- Create Retirement_Titles Table based on BirthDate
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


-- Select Unique_Titles from Retirement_Titles
SELECT DISTINCT ON (emp_no)
          emp_no,
		            first_name,
					last_name,
			title,		
     from_date,
     to_date
INTO unique_titles
FROM retirement_titles
Order By emp_no, to_date desc;

-- Count Titles up for Retirement
SELECT COUNT(title) as title_count, title 
INTO retiring_titles 
FROM unique_titles 
GROUP BY title
ORDER BY title_count DESC;


-- Create Mentorship Table based on BirthDate, Dept to date(current employees only)
SELECT 
DISTINCT ON (employees.emp_no)
          employees.emp_no,
		            employees.first_name,
					employees.last_name,
					employees.birth_date,		
     dept_emp.from_date,
     dept_emp.to_date,
	 titles.title
INTO Mentorship_eligibility
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
INNER JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date = '9999-01-01' and employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
-- Order by Titles.To_date to get the most recent job title displaying
Order By employees.emp_no, titles.to_date desc;

