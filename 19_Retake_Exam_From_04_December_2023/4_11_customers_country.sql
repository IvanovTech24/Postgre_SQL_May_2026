CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
) AS
$$
BEGIN
    SELECT
        co.name
    INTO
        country_name
    FROM
        customers AS cu
    JOIN
        countries AS co
    ON
        cu.country_id = co.id
    WHERE
        CONCAT(cu.first_name, ' ', cu.last_name) = customer_full_name;
END;
$$
LANGUAGE plpgsql;

CALL sp_customer_country_name('''Betty Wallace', '');