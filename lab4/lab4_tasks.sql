-- 1 --
SELECT ename FROM emp WHERE
sal = (SELECT MAX(sal) FROM emp);


-- 2 --
SELECT ename FROM emp
WHERE job = (
    SELECT job FROM emp 
    WHERE empno = 7369
    AND sal > (
        SELECT sal FROM EMP
        WHERE empno = 7876
    )
);
 

-- 3 --
SELECT DISTINCT dname FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- 4 --
SELECT ename, job, sal FROM emp
WHERE sal IN(
    SELECT max(sal) FROM emp
    GROUP BY job
);


-- 5 --
SELECT dname FROM dept WHERE
deptno NOT IN (
    SELECT deptno from EMP
);


-- 6 --
SELECT ename, dname FROM emp JOIN dept
ON emp.deptno = dept.deptno;


-- 7 --
SELECT SUM(sal), deptno FROM emp
GROUP BY deptno;


-- 8 --
SELECT ename, dname FROM emp
JOIN dept
ON emp.deptno = dept.deptno;

-- 9 --

-- 10 --

-- 11 --
SELECT DISTINCT ename FROM emp WHERE
comm IS NULL;