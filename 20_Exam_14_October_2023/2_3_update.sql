UPDATE coaches
SET salary = salary * coach_level
WHERE EXISTS(
    SELECT 1
    FROM
        players_coaches
    WHERE
        coaches.id = coach_id
)
AND
    first_name LIKE 'C%';
