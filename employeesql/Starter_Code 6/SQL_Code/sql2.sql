
SELECT ei.employee_number, ei.last_name, ei.first_name, ei.sex, es.salary
FROM employee_information ei
INNER JOIN employee_salaries es ON ei.employee_number = es.employ_number;


SELECT first_name, last_name, hire_date
FROM employee_information
WHERE hire_date LIKE '%1986';


SELECT dm.department_num, d.department_name, ei.employee_number, ei.last_name, ei.first_name
FROM department_managers dm
INNER JOIN departments d ON dm.department_num = d.depart_number
INNER JOIN department_employees de ON d.depart_number = de.department_number
INNER JOIN employee_information ei ON de.emp_number = ei.employee_number
WHERE ei.employee_number IN (
    '110022', '110039', '110085', '110114', '110183', '110228', '110303', '110344',
    '110386', '110420', '110511', '110567', '110725', '110765', '110800', '110854',
    '111035', '111133', '111400', '111534', '111692', '111784', '111877', '111939'
)
ORDER BY dm.department_num ASC;


SELECT de.department_number, ei.employee_number, ei.last_name, ei.first_name, d.department_name
FROM employee_information ei
INNER JOIN department_employees de ON de.emp_number = ei.employee_number
INNER JOIN departments d ON d.depart_number = de.department_number;


SELECT first_name, last_name, sex
FROM employee_information
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


SELECT d.department_name, ei.employee_number, ei.last_name, ei.first_name
FROM employee_information ei
INNER JOIN department_employees de ON de.emp_number = ei.employee_number
INNER JOIN departments d ON d.depart_number = de.department_number
WHERE d.department_name = 'Sales';


SELECT d.department_name, ei.employee_number, ei.last_name, ei.first_name
FROM employee_information ei
INNER JOIN department_employees de ON de.emp_number = ei.employee_number
INNER JOIN departments d ON d.depart_number = de.department_number
WHERE d.department_name IN ('Sales', 'Development');


SELECT last_name, COUNT(last_name) AS frequency_count
FROM employee_information
GROUP BY last_name
ORDER BY frequency_count DESC;
