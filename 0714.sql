SELECT LENGTH('한글'), LENGTH('한글')
from dual;

SELECT LENGTH(convert('한글', 'ko16mswin949')) as lengthb_1,
       LENGTH(convert('한글 hangul', 'ko16mswin949')) as lengthb_2
FROM dual;

select sysdate,
       to_char(sysdate, 'mm')as MM,
       to_char(sysdate, 'mon', 'nls_date_language=korean')as MON_KOR,
       to_char(sysdate, 'mon', 'nls_date_language=japanese')as MON_JPN,
       to_char(sysdate, 'mon', 'nls_date_language=english')as MON_ENG,
       to_char(sysdate, 'month', 'nls_date_language=korean')as MONTH_KOREA,
       to_char(sysdate, 'month', 'nls_date_language=japanese')as MONTH_JAPANESE,
       to_char(sysdate, 'month', 'nls_date_language=english')as MONTH_ENGLISH
from dual;


SELECT sal,
    to_char(sal, '$999,999') as sal_$,
    to_char(sal, 'L999,999') as sal_L,
    to_char(sal, '999,999.00') as sal_1,
    to_char(sal, '000,999,999') as sal_2,
    to_char(sal, '999,999,00') as sal_3
from emp;

SELECT  * 
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'yyyy/mm/dd');


--nvl1
select empno, ename, sal, comm, sal+comm,
       nvl(comm, 0),
       sal+nvl(comm, 0)
from emp;

--nvl2
select empno, ename, comm,
       nvl2(comm, 'o', 'x'),
       nvl2(comm, sal*12+comm, sal*12)as annsal
from emp;

--decode 함수
select empno, ename, job, sal,
    decode(job, 'manager', sal*1.1, 
                'salesman', sal*1.05, 
                'analyst', sal, sal*1.03)as upsal
from emp;

select * from emp;

--다중행
select sal from emp;

select sum(sal)from emp;

SELECT count(emp) FROM emp;

--부서 번호가 30인 직원수 
select count(*)
from emp
where deptno = 30;

select count(comm)
from emp;

SELECT
    HIREDATE
FROM emp
where deptno=20;

select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno,job;

select deptno, job, avg(sal)
from emp
where sal <= 3000
group by deptno, job
having avg(sal) >= 2000
order by deptno,job;

--pivot함수 사용
select * from(select deptno, job, sal from emp)
    pivot(max(sal)
        for deptno in(10, 20, 30))
order by job;

--join
select e.empno, e.ename, d.deptno, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno
    order by d.deptno, e.empno;
        
        
--서브쿼리로 jones의 급여보다 높은 급여를 받는 사원 정보 출력
SELECT
    *
FROM emp
where sal > (select sal 
                    from emp where ename='JONES'); 
                    
select e.empno, e.ename, d.deptno, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno
        and e.deptno = 20
        and e.sal > (select avg(sal)
                            from emp);