CREATE OR REPLACE FUNCTION addSkill(skill TEXT, hero TEXT) RETURNS void AS '
    DECLARE
        skill_id INT;
        hero_id INT;
        integer_var INT;
    begin
        select um_id into skill_id from umiejetnosci where umiejetnosci.nazwa = skill;
        GET DIAGNOSTICS integer_var := ROW_COUNT;
        if (integer_var != 1) then
            return;
        end if;

        select p_id into hero_id from postacie where postacie.imie = hero;
        GET DIAGNOSTICS integer_var := ROW_COUNT;

        if (integer_var != 1) then
            return;
        end if;

        select count(*) into integer_var from um_p where um_id = skill_id AND p_id = hero_id;
        if (integer_var != 0) then
            return;
        end if;

        insert into um_p(um_id, p_id) values (skill_id, hero_id);
end
' language 'plpgsql';