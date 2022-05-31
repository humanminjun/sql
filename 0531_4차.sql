SELECT COUNT(salary)
FROM employees;

SELECT sum(salary)�հ�,avg(salary)���, sum(salary)/COUNT(salary)����_���  
FROM employees;

SELECT max(salary)�ִ�,min(salary)�ּڰ�, max(first_name)�ִ빮�ڰ�,min(first_name)�ּҹ��ڰ� 
FROM employees;

SELECT job_id ����, sum(salary) ������_�ѱ޿�, avg(salary) ������_��ձ޿�
FROM employees
where employee_id >= 10
group by job_id
order by ������_�ѱ޿� desc, ������_��ձ޿�;

select job_id job_id_��׷�,
        manager_id manager_id_�߱׷�,
        sum(salary) �׷���_�ѱ޿�,
        avg(salary) �׷���_��ձ޿�
        FROM employees
where employee_id >= 10
group by job_id,manager_id
order by �׷���_�ѱ޿� desc,�׷���_��ձ޿�;

SELECT job_id ����, sum(salary) ������_�ѱ޿�, avg(salary) ������_��ձ޿�
FROM employees
where employee_id >= 10
group by job_id
having sum(salary) > 30000
order by ������_�ѱ޿� desc, ������_��ձ޿�;

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

SELECT count(*)���εȰǼ�
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

