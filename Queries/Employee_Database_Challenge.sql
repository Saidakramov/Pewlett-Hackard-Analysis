-- retrieving employee number, name and las name from employees table
SELECT emp_no, first_name, last_name FROM employees;

-- retrieving title , from and to dates from title table
SELECT title, from_date, to_date FROM titles;

-- creating a new retirement_titles table
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title
--INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

-- number of titles
SELECT COUNT(title) FROM unique_titles;

-- create a retiring table 
SELECT COUNT(title), title 
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- Retrieveing info from employees table
SELECT emp_no,
		first_name,
		last_name,
		birth_date
FROM employees;

-- retrieving info from dept_emp table
SELECT from_date, to_date FROM dept_emp;

-- retrieving title from titles table
SELECT title FROM titles;

-- creating mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
				e.first_name,
				e.last_name,
				e.birth_date,
				de.from_date,
				de.to_date,
				ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
SELECT * FROM mentorship_eligibility;

-- Aditional queries
--counting eligible total number
SELECT COUNT (title) FROM mentorship_eligibility;

-- counting eligible titles number
SELECT COUNT(title), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;


