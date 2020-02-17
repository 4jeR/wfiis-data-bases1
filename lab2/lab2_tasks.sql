CREATE TABLE emp(
    empno NUMERIC (4,0) NOT NULL PRIMARY KEY,
    ename VARCHAR(10) NOT NULL,
    job VARCHAR(10) NOT NULL,
    mgr NUMERIC(7, 2),
    sal NUMERIC(7,2) NOT NULL,
    comm NUMERIC(7, 2),
    deptno INT NOT NULL
);
 

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7369, 'Smith', 'Clerk', 7902, 800.00, 20);

INSERT INTO emp(empno, ename, job, mgr, sal, comm, deptno)
VALUES(7499, 'Allen', 'Salesman', 7698, 1600.00,300.00, 30);

INSERT INTO emp(empno, ename, job, mgr, sal, comm, deptno)
VALUES(7521, 'Ward', 'Salesman', 7698, 1250.00, 500.00, 30);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7566, 'Jones', 'Manager', 7839, 2975.00, 20);

INSERT INTO emp(empno, ename, job, mgr, sal, comm, deptno)
VALUES(7654, 'Martin', 'Salesman', 7698, 1250.00, 1400.00, 30);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7698, 'Blake', 'Manager', 7839, 2850.00, 30);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7782, 'Clark', 'Manager', 7839, 2450.00, 10);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7788, 'Scott', 'Analyst', 7566, 3000.00, 20);

INSERT INTO emp(empno, ename, job, sal, deptno)
VALUES(7839, 'King', 'President', 5000.00, 10);
 
INSERT INTO emp(empno, ename, job, mgr, sal, comm, deptno)
VALUES(7844, 'Turner', 'Salesman', 7698, 1500.00, 0.00 ,30);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7876, 'Adams', 'Clerk', 7788, 1100.00, 20);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7900, 'James', 'Clerk', 7698, 950.00, 30);

INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7902, 'Ford', 'Analyst', 7566, 3000.00, 20);
 
INSERT INTO emp(empno, ename, job, mgr, sal, deptno)
VALUES(7934, 'Miller', 'Clerk', 7782, 1300.00, 10);



SELECT deptno, ename, mgr FROM emp;
SELECT (sal+250)*12 FROM emp;
SELECT DISTINCT deptno FROM emp;
SELECT * FROM emp WHERE job LIKE 'CLERK';
SELECT * FROM emp WHERE comm > sal;
SELECT * FROM emp WHERE sal BETWEEN 1000 AND 2000;
SELECT * FROM emp WHERE ename LIKE 'S%';
SELECT * FROM emp WHERE ename LIKE '____';
SELECT * FROM emp WHERE mgr IS NULL;
SELECT * FROM emp WHERE ename NOT LIKE 'M%';
 