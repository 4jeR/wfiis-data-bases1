CREATE TABLE bonus(
    ename VARCHAR(10),
    job VARCHAR(9),
    sal NUMERIC,
    comm NUMERIC
);
 

CREATE TABLE salgrade(
    grade NUMERIC,
    losal NUMERIC,
    hisal NUMERIC
);


CREATE TABLE dept(
    deptno NUMERIC(2,0) NOT NULL PRIMARY KEY,
    dname VARCHAR(14),
    loc VARCHAR(13)
);


CREATE TABLE emp (
    empno NUMERIC(4,0) NOT NULL PRIMARY KEY,
    ename VARCHAR(10) NOT NULL,
    job VARCHAR(9) NOT NULL,
    mgr NUMERIC(4,0),
    hiredate DATE,
    sal NUMERIC(7,2) NOT NULL,
    comm NUMERIC(7,2) ,
    deptno NUMERIC(2,0) NOT NULL REFERENCES dept(deptno)
);