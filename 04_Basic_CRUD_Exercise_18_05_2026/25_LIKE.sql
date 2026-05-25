SELECT
    name,
    start_date
FROM
    projects
WHERE
    name LIKE 'MOUN%'
ORDER BY
    id ASC;