SELECT * FROM employees; 

SELECT employee_id, email FROM employees;

SELECT employee_id, first_name, last_name 
FROM employees order by employee_id desc;

SELECT DISTINCT job_id  FROM employees;

SELECT employee_id as �����ȣ, first_name as �̸�, last_name as �� 
FROM employees;

SELECT employee_id, first_name || last_name 
FROM employees;

SELECT employee_id,  
       first_name ||' '|| last_name ,
       email||'@company.com'
FROM employees;
       
select employee_id, salary,
       salary+500,
       salary-100, 
       (salary*1.1)/2 
from employees;

select employee_id as �����ȣ,
       salary as �޿�, 
       salary+500 as �߰��޿�,
       salary-100 as ���ϱ޿�, 
       (salary*1.1)/2 as �����޿�
from employees;

SELECT * FROM employees where employee_id = 100;

SELECT * FROM employees where first_name = 'David';

SELECT * FROM employees where employee_id > 105 and first_name = 'David';

sELECT * FROM employees where salary BETWEEN 10000 AND 20000 ;

--job_id ���� ad���� 3����
SELECT * FROM employees where job_id like 'ad___';

SELECT * FROM employees where manager_id is NULL;

SELECT * FROM employees where salary >4000
and job_id = 'IT_PROG';

SELECT * FROM employees
where salary >4000
and job_id = 'IT_PROG' 
    or job_id= 'FI_ACCOUNT';
    
   
SELECT * FROM employees
where employee_id <>105;

SELECT * FROM employees
where manager_id is not null;

SELECT last_name,
    lower(last_name) lower����, --as���� ����
    upper(last_name) upper����, --as���� ����
    email,
    initcap(email) initcap����  --as���� ����
FROM employees;

Select job_id, SUBSTR(job_id,1,2) 
from employees ;

Select job_id, replace(job_id,'ACCOUNT','ACCNT')������ 
from employees ;

Select first_name, lpad(first_name, 12, '*') 
from employees ;

select 'start'||trim('   -space-   ')||'end' ���ŵ�_���� from dual;

select salary,
    salary/30 �ϱ�,
    TRUNC(salary/30,0)������1,
    TRUNC(salary/30,1)������2,
    TRUNC(salary/30,-1)������3
from employees;






















