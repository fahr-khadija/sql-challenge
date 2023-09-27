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


### Import each CSV file into its corresponding SQL table.
under the SQL Db already create , in the each table , right clic on it and clic on Import/export , specify the link of the CSV file and add header  and click ok  to import this CSV file in the corresponding SQL table 
make this for all 6 tables already creat it .


## Data Analysis
List the employee number, last name, first name, sex, and salary of each employee.

List the first name, last name, and hire date for the employees who were hired in 1986.

List the manager of each department along with their department number, department name, employee number, last name, and first name.

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

List each employee in the Sales department, including their employee number, last name, and first name.

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.
