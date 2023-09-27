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


