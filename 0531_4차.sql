SELECT COUNT(salary)
FROM employees;

SELECT sum(salary)합계,avg(salary)평균, sum(salary)/COUNT(salary)계산된_평균  
FROM employees;

SELECT max(salary)최댓값,min(salary)최솟값, max(first_name)최대문자값,min(first_name)최소문자값 
FROM employees;

SELECT job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
FROM employees
where employee_id >= 10
group by job_id
order by 직무별_총급여 desc, 직무별_평균급여;

select job_id job_id_대그룹,
        manager_id manager_id_중그룹,
        sum(salary) 그룹핑_총급여,
        avg(salary) 그룹핑_평균급여
        FROM employees
where employee_id >= 10
group by job_id,manager_id
order by 그룹핑_총급여 desc,그룹핑_평균급여;

SELECT job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
FROM employees
where employee_id >= 10
group by job_id
having sum(salary) > 30000
order by 직무별_총급여 desc, 직무별_평균급여;

SELECT a.first_name, a.last_name, b.*
From employees A, job_history B
WHERE a.employee_id = b.employee_id
and  a.employee_id = 101;


SELECT
    *
FROM employees a, departments b
where a.department_id = b.department_id;


SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city
FROM employees a, departments b, locations c
where a.department_id = b.department_id
and  b.location_id = c.location_id;

SELECT count(*)조인된건수
FROM employees a, departments b
where a.department_id = b.department_id;

SELECT count(*)
from employees;


SELECT a.department_id, a.first_name, a.last_name, b.department_id, b.department_name
FROM employees a, departments b
where a.department_id = b.department_id(+)
order by a.employee_id;


SELECT a.department_id, a.first_name, a.last_name, b.department_id, b.department_name
FROM employees a, departments b
where a.department_id(+) = b.department_id
order by a.employee_id;

SELECT a.department_id, a.first_name, a.last_name, b.department_id, b.department_name
FROM employees a, departments b
where a.department_id(+) = b.department_id
order by a.employee_id;

