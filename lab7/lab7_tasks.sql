-- 1 --
CREATE OR REPLACE FUNCTION handler_func() RETURNS trigger AS '
    DECLARE
    counter INT;
    begin
        SELECT COUNT(*) INTO counter FROM ocena 
        WHERE student_id = new.student_id and przedmiot_id = new.przedmiot_id; 
        IF(counter < 3) THEN
            RAISE NOTICE ''Sukces'';
            RETURN NEW;
        ELSE
            RAISE NOTICE ''Niepowodzenie - czwarte podejscie'';
            RETURN NULL;
        END IF;
end
' language 'plpgsql';

 
CREATE TRIGGER egzaminator AFTER INSERT OR UPDATE ON ocena
FOR EACH ROW EXECUTE PROCEDURE handler_func();


-- 2 --
CREATE TABLE Srednia(
    srednia REAL,
    student_ID INT,
    przedmiot_ID INT,
    FOREIGN KEY (przedmiot_ID) REFERENCES Przedmiot(Nr_P),
    FOREIGN KEY (student_ID) REFERENCES Student(Nr_S)
);

 
CREATE OR REPLACE FUNCTION handle_average() RETURNS trigger AS '
    DECLARE
    counter REAL;
    srednia RECORD;
    BEGIN
    IF (new.ocena >= 3) THEN
        select AVG(ocena) INTO counter FROM ocena
            WHERE student_id = new.student_id AND przedmiot_id = new.przedmiot_id;
        RAISE NOTICE ''srednia: %'', counter;

        select * INTO srednia FROM Srednia
            WHERE student_id = new.student_id AND przedmiot_id = new.przedmiot_id;
        IF NOT FOUND THEN
            INSERT INTO srednia values(counter, new.student_id, new.przedmiot_id);
        ELSE
            UPDATE Srednia SET srednia=counter
            WHERE student_id = new.student_id AND przedmiot_id = new.przedmiot_id;
        END IF;
    end if;
    return NULL;
    end
' language 'plpgsql';


CREATE TRIGGER srednia AFTER INSERT ON ocena
FOR EACH ROW EXECUTE PROCEDURE handle_average();

 
-- 3 --

CREATE TABLE logi(
    operation_log TEXT;
);


CREATE OR REPLACE FUNCTION log_operations() RETURNS trigger AS '
    BEGIN
        INSERT INTO logi VALUES (TG_OP);
    END
' language 'plpgsql';

 
CREATE TRIGGER operations AFTER INSERT OR UPDATE OR DELETE
ON ocena FOR EACH ROW EXECUTE PROCEDURE log_operations();