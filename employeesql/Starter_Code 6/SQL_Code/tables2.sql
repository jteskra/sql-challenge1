-- Create the Departments table
CREATE TABLE Departments (
    depart_number varchar(255) PRIMARY KEY,
    department_name varchar(255)
);

-- Create the employee_information table
CREATE TABLE employee_information (
    employee_number integer PRIMARY KEY,
    empl_title_id varchar(255),
    dob varchar(15),
    first_name text,
    last_name text,
    sex text,
    hire_date varchar(15)
);

-- Create the employee_titles table
CREATE TABLE employee_titles (
    title_id varchar(255) NOT NULL PRIMARY KEY,
    title text NOT NULL
);

-- Add foreign key constraint to employee_information table
ALTER TABLE employee_information
ADD CONSTRAINT employee_join
FOREIGN KEY (empl_title_id) REFERENCES employee_titles(title_id);

-- Create the employee_salaries table
CREATE TABLE employee_salaries (
    employ_number integer NOT NULL,
    salary money NOT NULL,
    FOREIGN KEY (employ_number) REFERENCES employee_information(employee_number)
);

-- Perform an inner join between employee_salaries and employee_information
SELECT * FROM employee_salaries es
INNER JOIN employee_information ei ON es.employ_number = ei.employee_number;

-- Create the Department_Employees table
CREATE TABLE Department_Employees (
    emp_number integer NOT NULL,
    department_number varchar(255) NOT NULL,
    FOREIGN KEY (emp_number) REFERENCES employee_information(employee_number),
    FOREIGN KEY (department_number) REFERENCES Departments(depart_number)
);

-- Display the contents of the Department_Employees table
SELECT * FROM Department_Employees;

-- Create the department_managers table with a primary key
CREATE TABLE department_managers (
    department_num varchar(255),
    manager_employ_number integer,
    PRIMARY KEY (department_num, manager_employ_number),
    FOREIGN KEY (department_num) REFERENCES Departments(depart_number)
);

-- Display the contents of the department_managers table
SELECT * FROM department_managers;
