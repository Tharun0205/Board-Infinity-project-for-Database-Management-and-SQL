 ##Question_1
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;
##Question_2
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
##Question_3
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';
##Question_4
SELECT e.employee_id, e.last_name AS employee_last_name, e.manager_id, m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
##Question_5
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees j ON j.last_name = 'Jones'
WHERE e.hire_date > j.hire_date;
##Question_6
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
##Question_7
SELECT d.department_name, e.first_name, e.last_name, e.hire_date, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NULL
AND DATEDIFF(CURDATE(), e.hire_date) / 365 > 15;
##Question_8
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees b ON b.last_name = 'Bull'
WHERE e.salary > b.salary;
##Question_9
SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT';
##Question_10
SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE e.manager_id IS NOT NULL AND c.country_name = 'United States of America';
##Question_11
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);
##Question_12
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = j.min_salary;
##Question_13
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
AND d.department_name LIKE '%IT%';
##Question_14
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT MIN(salary) FROM employees);
##Question_15
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY e.salary ASC;








 