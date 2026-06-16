UPDATE
    animals
SET
    owner_id = (
        SELECT
            o.id
        FROM
            owners AS o
        WHERE
            o.name = 'Kaloqn Stoqnov'
        )
WHERE
    owner_id IS NULL;



SELECT
    a.id,
    a.name,
    a.birthdate,
    a.owner_id,
    a.animal_type_id
FROM
    animals AS a
LEFT JOIN
    owners AS o
ON
    a.owner_id = o.id;