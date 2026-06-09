SELECT
    e.employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    p.project_id,
    p.name
FROM
    employees AS e
JOIN
    employees_projects AS ep
USING
    (employee_id)
JOIN
    projects AS p
USING
    (project_id)
WHERE
    p.project_id = 1;