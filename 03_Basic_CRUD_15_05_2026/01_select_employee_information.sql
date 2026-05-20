SELECT
    id,
    first_name || ' ' || last_name AS "Fill Name",
    job_title AS "Job Title"
FROM
    employees
