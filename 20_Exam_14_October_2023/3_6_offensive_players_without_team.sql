SELECT
    p.id,
    CONCAT_WS(' ', first_name, last_name) AS full_name,
    p.age,
    p.position,
    p.salary,
    sd.pace,
    sd.shooting
FROM
    players AS p
JOIN
    skills_data AS sd
ON
    p.skills_data_id = sd.id
LEFT JOIN
    teams AS t
ON
    p.team_id = t.id
WHERE
    (sd.pace + sd.shooting) > 130
        AND
    t.name IS NULL
        AND
    t.established IS NULL
        AND
    p.position = 'A';
