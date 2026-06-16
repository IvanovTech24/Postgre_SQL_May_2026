DELETE  FROM
    players_coaches AS pc
WHERE
    EXISTS(
        SELECT
            1
        FROM
            players AS p
        WHERE
            p.id = pc.player_id
                AND
            hire_date < '2013-12-13 07:18:46'
);

DELETE FROM
    players
WHERE
    hire_date < '2013-12-13 07:18:46';

