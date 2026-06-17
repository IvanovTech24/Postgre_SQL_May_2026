SELECT
    CONCAT_WS(' - ' ,o.name, a.name) AS "owners-animals",
    o.phone_number,
    c.id AS cage_id
FROM
    owners AS o
JOIN
    animals AS a
ON
    o.id = a.owner_id
JOIN
    animals_cages AS ac
ON
    a.id = ac.animal_id
JOIN
    cages AS c
ON
    c.id = ac.cage_id
JOIN
    animal_types AS at
ON
    a.animal_type_id = at.id
WHERE
    at.animal_type = 'Mammals'
GROUP BY
    o.name,
    a.name,
    o.phone_number,
    c.id
ORDER BY
    o.name,
    a.name DESC;