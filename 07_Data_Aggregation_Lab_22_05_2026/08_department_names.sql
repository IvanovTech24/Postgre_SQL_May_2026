SELECT
    id,
    first_name,
    last_name,
    CAST(salary AS NUMERIC(10, 2)) AS salary,
    department_id,
    CASE department_id
        WHEN 1 THEN 'Management'
        WHEN 2 THEN 'Kitchen Staff'
        WHEN 3 THEN 'Service Staff'
        ELSE 'Other'
    END AS department_name
FROM
    employees
ORDER BY
    id;