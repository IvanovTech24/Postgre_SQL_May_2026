SELECT
    id,
    first_name || ' ' || last_name AS foll_name,
    job_title,
    salary
FROM employees
WHERE salary > 1000