SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

SELECT
    *
FROM employees A
where a.salary = (SELECT salary
                  from employees
                  where last_name = 'De Haan');
  --위의 코드와 동일한 결과가 출력됨                
SELECT *
FROM employees A
WHERE a.salary = 17000;

--** 다중행
SELECT
    *
FROM employees A
where a.salary IN (SELECT salary
                  from employees
                  where last_name = 'Taylor');
                  
SELECT *
FROM employees A
WHERE a.salary IN( SELECT min(salary) 최저급여
                   FROM employees
                   group by department_id )
ORDER BY a.salary DESC;


SELECT *
FROM employees A
WHERE (a.job_id, a.salary) IN( 
                   SELECT job_id, min(salary) 그룹별_급여
                   FROM employees
                   group by job_id
                   )
ORDER BY a.salary DESC;

SELECT *
FROM employees A,
                 ( SELECT department_id
                   FROM departments
                   WHERE department_name='IT'  
                  )B --B는 가상뷰(인라인뷰라고함)
where A.department_id = b.department_id;   

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES ( 271,'Sample_Dept', 200,1700);

SELECT *
FROM departments
order By department_id desc;

INSERT INTO departments
VALUES ( 272,'Sample_Dept', 200,1700);

commit;

UPDATE departments
set manager_id = 201,
   location_id = 1800
WHERE department_name = 'Sample_Dept' ;

