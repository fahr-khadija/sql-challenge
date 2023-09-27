--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees AS e
JOIN salaries AS s
ON e.emp_no=s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE hire_date LIKE '%1986'

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM departments AS d
JOIN deptmanager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no

--List the department number for each employee along with that employee’s
--employee number, last name, first name, and department name.
SELECT d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN deptemployee AS de
ON d.dept_no = de.dept_no
JOIN employees AS e
On de.emp_no = e.emp_no

--List first name, last name, and sex of each employee whose
--first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN deptemployee AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN deptemployee AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
--List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, COUNT(last_name) AS total 
FROM employees
GROUP BY last_name 
ORDER BY "total" DESC



