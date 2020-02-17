-- 1 --
CREATE OR REPLACE FUNCTION vectorLen(real, real)
RETURNS REAL
LANGUAGE plpgsql AS '
    BEGIN
        RETURN sqrt($1 * $1 + $2 * $2);
    END;
';

-- 2 --
CREATE TYPE point AS (
    x real,
    y real
);

CREATE OR REPLACE FUNCTION zad2func(REAL, REAL, REAL)
RETURNS setof point
LANGUAGE plpgsql AS '
    DECLARE
    r point%rowtype;
    A CONSTANT REAL := $1;
    B CONSTANT REAL := $2;
    C CONSTANT REAL := $3;
    BEGIN
        FOR x in 1 .. 100
        LOOP
            r.x = x;
            r.y = A * x * x + B * x + C;
            return NEXT(r.x, r.y);
        END LOOP;
        RETURN;
    END
';


-- 3 --
CREATE OR REPLACE FUNCTION celsToFahr()
RETURNS setof point 
LANGUAGE plpgsql AS '
    DECLARE
    r point%rowtype;
    BEGIN
        FOR x in 10 .. 1000 
        LOOP
            r.x = x / 10.0;
            r.y = (r.x * 9.0 / 5.0) + 32.0;
            RETURN NEXT (r.x, r.y);
        END LOOP;
        RETURN;
    END
';

-- 4 --
CREATE FUNCTION liczba_studentow()
RETURNS INT
LANGUAGE plpgsql AS '
    DECLARE
    result INT;
    BEGIN
        SELECT COUNT(*) INTO result FROM Student;
        return result;
    END;

';

-- 5 --
CREATE FUNCTION liczba_studentow_1(TEXT)
RETURNS INT
LANGUAGE plpgsql AS '
    DECLARE
    result INT;
    BEGIN
        SELECT COUNT(*) INTO result FROM Student
        WHERE Student.grupa = $1;
        return result;
    END;
';

-- 6 --
CREATE FUNCTION srednia(surname text)
RETURNS real
LANGUAGE plpgsql AS'
    DECLARE
    result REAL;
    BEGIN
        SELECT AVG(ocena) INTO result 
        FROM Ocena, Student
        WHERE Ocena.student_id = Student.nr_s
        AND Student.nazwisko = surname;
        RETURN result;
    END;
';

-- 7 --
CREATE TYPE dane AS (imie text, nazwisko text);

CREATE FUNCTION genLogin()
RETURNS setof TEXT
LANGUAGE plpgsql AS '
    DECLARE
    t dane%rowtype;
    login TEXT;
    BEGIN
        for t in select imie, nazwisko FROM Student
        LOOP
			login = t.imie || substring(t.nazwisko, 1, 1);
			return next lower(login);
		END LOOP;
        RETURN;
    END;
';


-- 8 -- 
CREATE TYPE averageStud AS (imie TEXT, SREDNIA real
);

CREATE OR REPLACE FUNCTION zad8func(INTEGER)
RETURNS averageStud
LANGUAGE plpgsql AS '
	declare
	result averageStud;
    id INT;
	begin
		SELECT nazwisko INTO result.imie FROM Student where indeks=$1;
		SELECT nr_s INTO id FROM Student where indeks=$1;
		SELECT avg(ocena) INTO result.srednia FROM ocena where student_id=id;
		return result; 
	end
';