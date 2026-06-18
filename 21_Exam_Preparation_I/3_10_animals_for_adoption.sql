SELECT
    a.name AS animal,
    EXTRACT(YEAR FROM birthdate) AS birth_year,
    at.animal_type
FROM
    animals AS a
JOIN
    animal_types AS at
ON
    a.animal_type_id = at.id
WHERE
    owner_id IS  NULL
        AND
    EXTRACT(YEAR FROM AGE('01/01/2022', a.birthdate)) < 5
        AND
    a.animal_type_id <> (SELECT at.id FROM animal_types AS at WHERE at.animal_type = 'Birds')
ORDER BY
    a.name;





SELECT
    animal_type_id
FROM
    animals
WHERE
    animal_type_id = (SELECT id FROM animal_types WHERE animal_type = 'Birds');



SELECT
    AGE(birthdate)
FROM
    animals
WHERE
    EXTRACT(YEAR FROM AGE(birthdate)) < 5
        AND
    animal_type_id <> (SELECT id FROM animal_types WHERE animal_type = 'Birds');

SELECT
    EXTRACT(YEAR FROM AGE('01/01/2022', a.birthdate))
FROM
    animals AS a;