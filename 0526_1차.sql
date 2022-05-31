SELECT * FROM employees; 

SELECT employee_id, email FROM employees;

SELECT employee_id, first_name, last_name 
FROM employees order by employee_id desc;

SELECT DISTINCT job_id  FROM employees;

SELECT employee_id as 사원번호, first_name as 이름, last_name as 성 
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

select employee_id as 사원번호,
       salary as 급여, 
       salary+500 as 추가급여,
       salary-100 as 인하급여, 
       (salary*1.1)/2 as 조정급여
from employees;

SELECT * FROM employees where employee_id = 100;

SELECT * FROM employees where first_name = 'David';

SELECT * FROM employees where employee_id > 105 and first_name = 'David';

sELECT * FROM employees where salary BETWEEN 10000 AND 20000 ;

--job_id 에서 ad이후 3글자
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
    lower(last_name) lower적용, --as생략 가능
    upper(last_name) upper적용, --as생략 가능
    email,
    initcap(email) initcap적용  --as생략 가능
FROM employees;

Select job_id, SUBSTR(job_id,1,2) 
from employees ;

Select job_id, replace(job_id,'ACCOUNT','ACCNT')적용결과 
from employees ;

Select first_name, lpad(first_name, 12, '*') 
from employees ;

select 'start'||trim('   -space-   ')||'end' 제거된_공백 from dual;

select salary,
    salary/30 일급,
    TRUNC(salary/30,0)적용결과1,
    TRUNC(salary/30,1)적용결과2,
    TRUNC(salary/30,-1)적용결과3
from employees;






















