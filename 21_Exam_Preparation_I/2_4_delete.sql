DELETE FROM
    volunteers
WHERE
    department_id = (
        SELECT
            vd.id
        FROM
            volunteers_departments AS vd
        WHERE
            vd.department_name = 'Education program assistant'
        );

DELETE FROM
    volunteers_departments
WHERE
    department_name = 'Education program assistant';
