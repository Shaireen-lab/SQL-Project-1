use employees;

select * from employees

-- 1. List of employees by department
-- Question: Write a query to list all employees along with their respective department names. Include employee number, frist name, last name, 
-- department number, and department name.

	select  e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name
	from employees as e
	join dept_emp as DE
	ON e.emp_no = DE.emp_no
	join departments as d
	on d.dept_no = DE.dept_n;
    
    -- 2. Current and past salaries of an employee
    -- Question: Write a qquery to retrieve all the salary records of a given employee(by employee number). Include employee_no, salary,
    -- to_date, from_date.
    
    select * from salaries 
    Where emp_no = '10198'
    
    -- 3. Employees with specific titles
    -- Question: Write a query to find all employees who have held a specific title (eg Engineer). Include employee number, first_name, last_name,
    -- and title.
    
    select e.emp_no, e.first_name, e.last_name, t.title from employees as e
    join titles as t
    on t.emp_no = e.emp_no
    where title = 'senior engineer'
    
    -- 4. Department with their manager
    -- Question: Write a query to list all the departments along with their current managers. Include department name, department name, manager's emloyee
    -- number, first_name, last__name
    
    select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
    from departments as d
    join dept_manager as dm 
    on d.dept_no = dm.dept_no
    join employees as e
    on dm.emp_no = e.emp_no
    
    -- 5. Employee count by department
    -- Question: Write a query to count a number of employees in each department. Include department number, department name, manager's
    -- employee number, first_name, last_name.
    
    select d.dept_no, d.dept_name, count(de.emp_no) as emp_count
    from departments as d
    join dept_emp as de
    On d.dept_no = de.dept_no
    GROUP BY dept_no, dept_name
    
    -- 6. Employees Birthdates in a given Year 
    -- Question: Write a query to find all employees born in a specific month (e.g 4) and day (e.g 10). Include employee number, first_name, last_name, 
    -- birth_date.
    
    select * from employees
    where month (birth_date) = 4 AND 
    day (birth_date) = 10
    
    -- 7. Employees hired in last 50 years
    -- Question: Write a query to find all employees hired in the last 30 years. Include employee number, first_name, last_name, and hire_date.
    
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 YEAR);

-- 8. Average salary by department
-- Question: Write a query to calculate the average salary for each department. Include department number, department name, and averae salary.

select d.dept_no, d.dept_name, avg(salary) as avg_salary
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join salaries s
on de.emp_no = s.emp_no
group by dept_name, dept_no

-- 9. Gender Distribution in Each Department 
-- Question: Write a query to find the gender distribution (number of males and females) in each department. Inlude department number,
-- department name, count of males and count of females.

-- can do it like this

Select d.dept_no, d.dept_name, e.gender, count(gender) as gender_count from departments d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no
GROUP BY d.dept_no, d.dept_name, e.gender

-- Or like this. This one is better.

Select d.dept_no, d.dept_name,
sum(case when e.gender = 'M' Then 1 else 0 end) as male_count,
sum(case when e.gender = 'F' Then 1 else 0 end) as female_count
from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
GROUP BY d.dept_no, d.dept_name

-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. Include employee number, first_name, last_name,
-- number of years.

-- Can do it like this

SELECT
    emp_no, first_name,
    last_name,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees 
order by years_worked desc

-- Or like this using CTES

SELECT
    emp_no, first_name,
    last_name,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employees
)



















    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    