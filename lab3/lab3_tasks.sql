/*1*/
SELECT ename, dname FROM emp, dept ORDER BY ename, dname;

/*2*/
SELECT ename FROM emp WHERE deptno = 20;

/*3*/
SELECT ename, sal, grade FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;

/*4*/
SELECT ename, sal, grade FROM (
    SELECT ename, sal, grade FROM emp, salgrade 
    WHERE sal BETWEEN losal AND hisal
) AS dane
WHERE grade = 3;

/*5*/


/*6*/
SELECT DISTINCT job FROM emp
WHERE deptno = 10 OR deptno = 30;

/*7*/
SELECT AVG(sal) FROM emp;
 

/*8*/
SELECT sal FROM emp WHERE job LIKE 'CLERK'
ORDER BY sal ASC LIMIT 1;


/*9*/
SELECT COUNT(ename) FROM emp WHERE deptno = 20;

/*10*/
SELECT job, AVG(sal) AS average_salary FROM emp
GROUP BY job;

/*11*/
SELECT job, MAX(sal) AS max_salary FROM emp
GROUP BY job ORDER BY max_salary DESC;


/*12*/
SELECT deptno, AVG(sal) FROM emp
GROUP BY deptno
HAVING COUNT(deptno) > 3;

 
/*13*/
SELECT MAX(sal) - MIN (sal) FROM emp;

 
/*14*/ 

/*15*/
SELECT grade, AVG(sal) FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal
GROUP BY grade;
 

/*16*/
SELECT grade, COUNT(sal)
FROM emp, salgrade
GROUP BY grade;

/*17*/
SELECT ename, sal FROM emp
WHERE sal =
(
    SELECT min(sal) from emp
);

/*18*/
-- v1 --
SELECT dname FROM emp, dept
WHERE job LIKE 'CLERK'
AND emp.deptno = dept.deptno;

-- v2 -- 
SELECT dname FROM emp JOIN dept
ON job LIKE 'CLERK'
AND emp.deptno = dept.deptno;
