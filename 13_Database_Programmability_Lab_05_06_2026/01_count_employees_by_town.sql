CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS INT AS
$$
    DECLARE
        town_employees int;
    BEGIN
        SELECT COUNT(*)
        FROM employees AS e
        JOIN addresses AS a
        USING (address_id)
        JOIN towns AS t
        USING (town_id)
        WHERE t.name = town_name INTO town_employees;
        RETURN town_employees;
    end;
$$
LANGUAGE plpgsql;

SELECT fn_count_employees_by_town('Sofia');

