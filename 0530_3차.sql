SELECT
    *
FROM employees
order by commission_pct;

SELECT
    salary * commission_pct
FROM employees
ORDER BY commission_pct;

SELECT
   salary * NVL(commission_pct, 1)
FROM employees
order by commission_pct;      

SELECT first_name, last_name, department_id,
     salary �����޿�,
     decode(department_id,  60 , salary *1.1, salary) �����ȱ޿�,
     decode(department_id,  60 , '10%�λ�', '���λ�') �λ󿩺�
FROM employees ;

SELECT employee_id, first_name, last_name, salary,
    case
     when salary > = 9000 then '�����޿�'
     when salary BETWEEN 6000 AND 8999 then '�����޿�'
     else '�����޿�'
    end as �޿����
FROM employees 
where job_id = 'IT_PROG';

SELECT employee_id,
    salary,
   RANK() OVER(ORDER BY salary DESC)rank_�޿�,
    DENSE_RANK() OVER(ORDER BY salary DESC)dense_rank_�޿�,
   row_nUmber()OVER(ORDER BY salary DESC)row_number_�޿�
FROM employees ;

SELECT
   A.employee_id,
--   A.department_id,
--   B.department_name,
--   salary,
--   RANK() OVER(PARTITION BY a.department_id ORDER BY salaryDESC)rank_�޿�,
--   DENSE_RANK() OVER(PARTITION BY a.department_id ORDER BY salaryDESC)dense_rank_�޿�,
--   row_nUmber() OVER(PARTITION BY a.department_id ORDER BY salaryDESC)row_number_�޿�
FROM employees A, departments B;
--where A.department_id = B.department_id
--ORDER BY B.department_id, A.salary DESC;
