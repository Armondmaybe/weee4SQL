-- 1) This Displays all the employees with a first and last name that begins with P
DELIMITER $$
CREATE PROCEDURE EmployeesWithPNames()
Begin
	SELECT first_name, last_name
	FROM employees
	where first_name LIKE "P%" AND last_name LIKE "P%";
End $$
DELIMITER ;

-- 2) This Procedure displays the number of employees of has a salary of the selected amount
DELIMITER !!
CREATE PROCEDURE CountBySalaryAmount(IN amount INTEGER)
BEGIN
	SELECT count(*)
    FROM salaries WHERE salary = amount;
END !!
DELIMITER ;

-- 3) This Procedure will display the number of employees who were hired on the selected year date
DELIMITER !!
CREATE PROCEDURE numberOfHireDates(IN year_date CHAR(10))
BEGIN
	SELECT count(hire_date) FROM employees WHERE hire_date = year_date;
END !!
DELIMITER ;

-- 4)  This will display the first 50 employees salaries
DELIMITER !!
CREATE PROCEDURE salaryOfEmployees()
Begin
	SELECT e.first_name, e.last_name,s.salary
    FROM employees e
    INNER JOIN salaries s ON s.emp_no =e.emp_no 
    GROUP BY e.first_name, e.last_name, s.salary limit 50;
END !!
DELIMITER ;

-- 5) This procedure Displays the count of employees in each department
DELIMITER !!
CREATE PROCEDURE numberOfEmployeesInDepartment()
BEGIN
	Select  d.dept_name,COUNT(d.dept_name) AS "Number Of employees" FROM departments d
	INNER JOIN dept_emp de ON d.dept_no =de.dept_no
	INNER JOIN employees e ON de.emp_no = e.emp_no
	GROUP BY dept_name;
END!!
DELIMITER ;