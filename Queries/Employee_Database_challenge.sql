-- Module 7 Challenge: Deliverable 1
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirees_by_title
FROM titles as t
JOIN employees as e
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO distinct_retiree__by_title
FROM retirees_by_title
ORDER BY emp_no, to_date DESC;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO distinct_retiree__by_title
FROM retirees_by_title
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title
INTO retiring_titles
FROM distinct_retiree__by_title
GROUP BY title
ORDER BY COUNT(title) DESC

-- Module 7 Challenge: Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO employees_eligible
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no	

