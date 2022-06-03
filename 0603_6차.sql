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


--department_id ���� null���� �Էµ� �� ���� ������ ������ �߻��Ǿ���.
UPDATE departments
SET department_id = null
WHERE department_name = 'Sample_Dept';

--�Ϲ����� ���
DELETE  FROM departments
where department_name = 'Sample_Dept';

--���������� ����� ���
DELETE  FROM departments
where department_id IN 
        (SELECT department_id 
          FROM departments
          WHERE department_name = 'Sample_Dept');
          
commit;

--�⺻Ű ��������
INSERT INTO departments
VALUES(100, 'Sample_Dept', 200, 1700);

--�ܷ�Ű �������� -������ �θ� ���̺��� ������ ���� �ݵ�� ����(�߱������� ���� �޶���ϸ�)
--111�� �θ����̺��� �࿡ �������� �ʴ´�
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(273, 'Sample_Dept', 200, 111);

--����Ű - �ߺ��� ������������� (null�� ��밡��)
--SKING �� �ߺ��Է� �Ǿ� ���� �߻�
INSERT INTO employees ( employee_id, first_name, email,
phone_nember,hire_date, job_id, salary) 
VALUES(207,'first_name', 'last_name', 'SKING', '111.11.11', 
to_date('030617', 'YYMMDD'), 'IT_PROG', 6000);

SELECT
    *
FROM employees;

--NOT NULL : null ���� ������� �ʴ´�.
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(273, null, 200, 700);

--CHECK - ������ ���ǵ� ������ ���� ���
INSERT INTO  employees ( employee_id, first_name, email,
phone_nember,hire_date, job_id, salary) 
VALUES(209,'first_name','last_name','SKING','111.11.11', 
to_date('030617', 'YYMMDD'), 'IT_PROG', 0);

--���̺� ����
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

--������ ���� ���� ũ�⸦ �۰� �����ϸ� ���� �߻���.
ALTER TABLE sample_product modify(product_name VARCHAR(5));

ALTER TABLE sample_product rename column factory to factory_name;

--������
ALTER TABLE sample_product drop column factory_name;

--���븸 ����
TRUNCATE TABLE sample_product;

--���̺� ����
DROP TABLE sample_product;



