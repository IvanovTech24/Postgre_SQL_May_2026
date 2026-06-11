CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name varchar)
AS
$$
    BEGIN
        UPDATE employees
        SET salary = salary * 1.05
        WHERE department_id = (
            SELECT department_id FROM departments WHERE name = department_name
        );
    end;
$$
LANGUAGE plpgsql;

CALL sp_increase_salaries('Finance');

SELECT
    first_name,
    salary
FROM
    employees
WHERE
    department_id = (
        SELECT department_id FROM departments WHERE name = 'Finance'
        )
ORDER BY
    first_name,
    salary;