
-- 1. List: employee number, last name, first name, gender, and salary
-- e.emp_no,e.last_name,e.first_name,e.gender,s.salary
-- s.emp_no >- e.emp_no

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e JOIN salaries AS s ON s.emp_no = e.emp_no;

-- 2. List employees who were hired in 1986

SELECT first_name || ' ' || last_name AS "Employee", hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number
-- last name, first name.


SELECT d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
FROM departments AS d 
JOIN dept_manager AS dm ON (dm.dept_no = d.dept_no) 
JOIN employees AS e ON (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e 
JOIN dept_emp AS de ON (de.emp_no = e.emp_no) 
JOIN departments AS d ON (de.dept_no=d.dept_no);

-- 5. List first name, last name, and sex for employees whose first name
-- is "Hercules" and last names begin with "B."
SELECT first_name || ' ' || last_name AS "Employee"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number,
-- last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e 
JOIN dept_emp AS de ON (de.emp_no = e.emp_no) 
JOIN departments AS d ON (de.dept_no=d.dept_no)
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e 
JOIN dept_emp AS de ON (de.emp_no = e.emp_no) 
JOIN departments AS d ON (de.dept_no=d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) as "Number of namesakes"
FROM employees 
Group by last_name
ORDER BY "Number of namesakes" DESC;