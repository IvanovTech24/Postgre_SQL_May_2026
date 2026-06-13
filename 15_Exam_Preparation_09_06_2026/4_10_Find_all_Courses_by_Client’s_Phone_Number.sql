CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
) RETURNS INT AS
$$
DECLARE
    num_of_courses INT;
BEGIN
    SELECT
        COUNT(*)
    INTO
        num_of_courses
    FROM
        clients AS cl
    JOIN
        courses AS co
    ON
        cl.id = co.client_id
    WHERE
        cl.phone_number = phone_num;
    RETURN num_of_courses;
END;
$$
LANGUAGE plpgsql;

SELECT fn_courses_by_client('(803) 6386812');