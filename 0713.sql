/*

    사원 Table 삭제

*/

-- DROP TABLE EMP; 

/*

    부서 Table 삭제

*/

-- DROP TABLE DEPT;

​

/* 

    Create DEPT table which will be the parent table of the EMP table. 

*/

create table dept(  

  deptno     number(2,0),  

  dname      varchar2(14),  

  loc        varchar2(13),  

  constraint pk_dept primary key (deptno)  

);

/*

    Create the EMP table which has a foreign key reference to the DEPT table. 

    The foreign key will require that the DEPTNO in the EMP table exist in the DEPTNO column in the DEPT table. 

*/

create table emp(  

  empno    number(4,0),  

  ename    varchar2(10),  

  job      varchar2(9),  

  mgr      number(4,0),  

  hiredate date,  

  sal      number(7,2),  

  comm     number(7,2),  

  deptno   number(2,0),  

  constraint pk_emp primary key (empno),  

  constraint fk_deptno foreign key (deptno) references dept (deptno)  

);

/*

    Insert row into DEPT table using named columns. 

*/

insert into DEPT (DEPTNO, DNAME, LOC)

values(10, 'ACCOUNTING', 'NEW YORK');

/*

    Insert a row into DEPT table by column position. 

*/

insert into dept  

values(20, 'RESEARCH', 'DALLAS');

insert into dept  

values(30, 'SALES', 'CHICAGO');

insert into dept  

values(40, 'OPERATIONS', 'BOSTON');

/*

    Insert EMP row, using TO_DATE function to cast string literal into an oracle DATE format.

*/

insert into emp  

values(  

 7839, 'KING', 'PRESIDENT', null,  

 to_date('17-11-1981','dd-mm-yyyy'),  

 5000, null, 10  

);

insert into emp  

values(  

 7698, 'BLAKE', 'MANAGER', 7839,  

 to_date('1-5-1981','dd-mm-yyyy'),  

 2850, null, 30  

);

insert into emp  

values(  

 7782, 'CLARK', 'MANAGER', 7839,  

 to_date('9-6-1981','dd-mm-yyyy'),  

 2450, null, 10  

);

insert into emp  

values(  

 7566, 'JONES', 'MANAGER', 7839,  

 to_date('2-4-1981','dd-mm-yyyy'),  

 2975, null, 20  

);

insert into emp  

values(  

 7788, 'SCOTT', 'ANALYST', 7566,  

 to_date('13-07-1987','dd-mm-yyyy') - 85,  

 3000, null, 20  

);

insert into emp  

values(  

 7902, 'FORD', 'ANALYST', 7566,  

 to_date('3-12-1981','dd-mm-yyyy'),  

 3000, null, 20  

);

insert into emp  

values(  

 7369, 'SMITH', 'CLERK', 7902,  

 to_date('17-12-1980','dd-mm-yyyy'),  

 800, null, 20  

);

insert into emp  

values(  

 7499, 'ALLEN', 'SALESMAN', 7698,  

 to_date('20-2-1981','dd-mm-yyyy'),  

 1600, 300, 30  

);

insert into emp  

values(  

 7521, 'WARD', 'SALESMAN', 7698,  

 to_date('22-2-1981','dd-mm-yyyy'),  

 1250, 500, 30  

);

insert into emp  

values(  

 7654, 'MARTIN', 'SALESMAN', 7698,  

 to_date('28-9-1981','dd-mm-yyyy'),  

 1250, 1400, 30  

);

insert into emp  

values(  

 7844, 'TURNER', 'SALESMAN', 7698,  

 to_date('8-9-1981','dd-mm-yyyy'),  

 1500, 0, 30  

);

insert into emp  

values(  

 7876, 'ADAMS', 'CLERK', 7788,  

 to_date('13-07-87', 'dd-mm-yyyy') - 51,  

 1100, null, 20  

);

insert into emp  

values(  

 7900, 'JAMES', 'CLERK', 7698,  

 to_date('3-12-1981','dd-mm-yyyy'),  

 950, null, 30  

);

insert into emp  

values(  

 7934, 'MILLER', 'CLERK', 7782,  

 to_date('23-1-1982','dd-mm-yyyy'),  

 1300, null, 10  

);

/*

   부서, 사원 테이블을 조인하여 사원별 부서 정보를 조회 

*/

select ename, dname, job, empno, hiredate, loc  

from emp, dept  

where emp.deptno = dept.deptno  

order by ename;

/*

   부서별 사원수 조회를 조회하여

   사원이 많은 부서별로 정렬한다.

*/

select dname, count(*) count_of_employees

from dept, emp

where dept.deptno = emp.deptno

group by DNAME

order by 2 desc; 


commit;

SELECT
    *
FROM emp where ename LIKE 'F%'; --F로 시작하는 내용 출력

--사원 이름에 scott 단어가 같은 데이터 출력
SELECT *
    FROM emp
    WHERE UPPER(ename) = UPPER('scott');

--사원 이름에 scott 단어가 포함된 데이터 출력
SELECT *
    FROM emp
    where upper(ename) LIKE UPPER('%scott%');
    
--사원의 이름 길이가 5 이상인 경우만 출력
SELECT
    ename, length(ename)
FROM emp
    where length(ename) >= 5;
    
select length('한글'), lengthb('한글')
from dual;

--이름 글자에서 일부만 추출
select substr(ename, 1, 2), substr(ename, 3, 2), substr(ename, 5)
from emp;

--특정 문자열 찾기
SELECT instr('HELLO ORACLE!', 'L')as instr_1,
       instr('HELLO ORACLE!', 'L', 5)as instr_2,
       instr('HELLO ORACLE!', 'L', 2, 2)as instr_3
FROM dual;

--특정 문자열 바꾸기
SELECT
    '010-1234-5678' as replace_before,
    replace('010-1234-5678', '-', ' ')as replace_1,
    replace('010-1234-5678', '-')as replace_2
FROM dual;

--특정 문자열 채우기
select
    rpad('971225-', 14, '*')as rpad_jmno,
    rpad('010-1234-', 13, '*')as rpad_jmno
from dual;

--두 열 사이에 : 넣고 연결
select concat(empno, ename),
       concat(empno, concat(' : ', ename))
from emp
where ename = 'SCOTT';

--TRIM 함수로 공백 제거     
select '[' ||  trim ('  _oracle_  ') || ']' as trim,
       '[' || ltrim ('  _oracle_  ') || ']' as ltrim,
       '[' || ltrim ('  <_oracle_  ', '_<') || ']' as ltrim2,
       '[' || rtrim ('  _oracle_  ') || ']' as rtrim,
       '[' || rtrim ('  <_oracle_>  ', '>_') || ']' as rtrim2
from dual;

select round(1234.5678) as round,
       round(1234.5678, 0) as round_0,
       round(1234.5678, 1) as round_1,
       round(1234.5678, 2) as round_2,
       round(1234.5678, -1) as round_minus1,
       round(1234.5678, -2) as round_minus2
from dual;

--날짜
select sysdate,
    add_months(sysdate, 3)
from dual;

--입사 10주년이 되는 사원들의 시점을 출력
SELECT
    empno, ename, hiredate, add_months(hiredate, 120)as work10year
FROM emp;

--현재의 날짜와 시간을 출력
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss')
from dual;

--월과 요일의 다양한 형식
select sysdate,
        to_char(sysdate, 'mm')as MM,
        to_char(sysdate, 'mon')as MON,
        to_char(sysdate, 'month')as MONTH,
        to_char(sysdate, 'dd')as DD,
        to_char(sysdate, 'dy')as DY,
        to_char(sysdate, 'day')as DAY
from dual;

commit;





