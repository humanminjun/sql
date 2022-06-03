UPDATE departments
set (manager_id, location_id) = (SELECT manager_id, location_id
                                 from departments
                                 where department_id = 40)
where department_name = 'Sample_Dept';

SELECT manager_id, location_id
FROM departments
where department_id = 40;

select *
from departments
where department_name = 'Sample_Dept';


--department_id 에는 null값이 입력될 수 없기 때문에 오류가 발생되었다.
UPDATE departments
SET department_id = null
WHERE department_name = 'Sample_Dept';

--일반적인 방법
DELETE  FROM departments
where department_name = 'Sample_Dept';

--서브쿼리를 사용한 방법
DELETE  FROM departments
where department_id IN 
        (SELECT department_id 
          FROM departments
          WHERE department_name = 'Sample_Dept');
          
commit;

--기본키 제약조건
INSERT INTO departments
VALUES(100, 'Sample_Dept', 200, 1700);

--외래키 제약조건 -열값이 부모 테이블의 참조열 값을 반드시 참조(중국집가서 피자 달라고하면)
--111은 부모테이블의 행에 존재하지 않는다
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(273, 'Sample_Dept', 200, 111);

--유일키 - 중복은 허락하지않지만 (null값 허용가능)
--SKING 이 중복입력 되어 오류 발생
INSERT INTO employees ( employee_id, first_name, email,
phone_nember,hire_date, job_id, salary) 
VALUES(207,'first_name', 'last_name', 'SKING', '111.11.11', 
to_date('030617', 'YYMMDD'), 'IT_PROG', 6000);

SELECT
    *
FROM employees;

--NOT NULL : null 값을 허용하지 않는다.
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(273, null, 200, 700);

--CHECK - 범위나 조건등 지정된 값만 허용
INSERT INTO  employees ( employee_id, first_name, email,
phone_nember,hire_date, job_id, salary) 
VALUES(209,'first_name','last_name','SKING','111.11.11', 
to_date('030617', 'YYMMDD'), 'IT_PROG', 0);

--테이블 생성
CREATE TABLE sample_product
            (product_id number,
             product_name VARCHAR2(30),
             manu_date date
             );

INSERT INTO sample_product 
values(1,'telecision', to_date('140101', 'YYMMDD'));

INSERT INTO sample_product 
values(2,'washer', to_date('150101', 'YYMMDD'));

INSERT INTO sample_product 
values(3,'cleaner', to_date('160101', 'YYMMDD'));

SELECT
    *
FROM sample_product;

ALTER TABLE sample_product add(factory VARCHAR(10));


ALTER TABLE sample_product modify(factory CHAR(8));

--데이터 보다 열의 크기를 작게 변경하면 오류 발생함.
ALTER TABLE sample_product modify(product_name VARCHAR(5));

ALTER TABLE sample_product rename column factory to factory_name;

--열삭제
ALTER TABLE sample_product drop column factory_name;

--내용만 삭제
TRUNCATE TABLE sample_product;

--테이블 삭제
DROP TABLE sample_product;



