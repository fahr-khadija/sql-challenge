# SQL-challenge

  ## Background
It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). 
Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s.
All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. 
That is, you’ll perform data modeling, data engineering, and data analysis, respectively.
Instructions
This Challenge is divided into three parts: data modeling, data engineering, and data analysis.

## Data Modeling
After Inspecting  the 6 CSV files, I sketch an Entity Relationship Diagram of the tables.by using a  QuickDBDLinks tool .
```
Employees as E
-
emp_no PK int
emp_title string FK >- T.title_id
birth_date string
first_name  string INDEX
last_name  string INDEX
sex  string
hire_date string 

Dept_manager as DM
-
dept_no PK string
emp_no int FK >- E.emp_no  FK >- S.emp_no FK >- DE.emp_no

Dept_emp as DE
-
emp_no PK int
dept_no string  FK >- DM.dept_no  FK >- D.dept_no

Departement as D
-
dept_no   PK string
dept_name string 

Title as T
-
title_id  PK string
title  string

Salaries as S
-
emp_no PK int
salary  money
```

![QuickDBD-Free Diagram (1)](https://github.com/fahr-khadija/sql-challenge/assets/100168693/249c88a1-6b99-457e-adee-37f0cdd3a97c)


## Data Engineering
### Create a table schema for each of the six CSV files. Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.
```
DROP TABLE employees;
DROP TABLE deptmanager;
DROP TABLE deptemployee;
DROP TABLE departments;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE titles
(
	title_id  VARCHAR(20) PRIMARY KEY,
	title  VARCHAR(40)
);
SELECT* 
FROM titles;

CREATE TABLE salaries
(
	emp_no INT NOT NULL PRIMARY KEY,
	salary DEC
);
SELECT* 
FROM salaries;

CREATE TABLE employees
(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR(20),
	birth_date VARCHAR(15),
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	sex VARCHAR(10),
	hire_date VARCHAR(15),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);
SELECT* 
FROM employees;

CREATE TABLE departments
(
	dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(40)
);
SELECT* 
FROM departments;

CREATE TABLE deptmanager
(
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT* 
FROM deptmanager;
CREATE TABLE deptemployee
(
	emp_no INT NOT NULL,
	dept_no VARCHAR(20)NOT NULL ,
        PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * 
FROM deptemployee;
```
### Import each CSV file into its corresponding SQL table.
under the SQL Db already create , in the each table , right clic on it and clic on Import/export , specify the link of the CSV file and add header  and click ok  to import this CSV file in the corresponding SQL table 


## Data Analysis
List the employee number, last name, first name, sex, and salary of each employee.
```
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees AS e
JOIN salaries AS s
ON e.emp_no=s.emp_no
```
List the first name, last name, and hire date for the employees who were hired in 1986.
```
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE hire_date LIKE '%1986'
```
List the manager of each department along with their department number, department name, employee number, last name, and first name.
```
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM departments AS d
JOIN deptmanager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
```
List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
```
 SELECT d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN deptemployee AS de
ON d.dept_no = de.dept_no
JOIN employees AS e
On de.emp_no = e.emp_no

```
List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
```
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
```
List each employee in the Sales department, including their employee number, last name, and first name.
```
SELECT de.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN deptemployee AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
```
List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
```
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN deptemployee AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
```
List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
```
SELECT last_name, COUNT(last_name) AS total 
FROM employees
GROUP BY last_name 
ORDER BY "total" DESC
```
