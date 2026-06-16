-- Solution with table`s returning
CREATE OR REPLACE FUNCTION fn_stadium_team_name(
    stadium_name VARCHAR(30)
) RETURNS TABLE (
    team_name VARCHAR(45)
    )
AS
$$
BEGIN
    RETURN QUERY
    SELECT
        t.name AS team_name
    FROM
        teams AS t
    JOIN
        stadiums AS s
    ON
        t.stadium_id = s.id
    WHERE
        s.name = stadium_name
    ORDER BY
        t.name;
END;
$$
LANGUAGE plpgsql;

SELECT fn_stadium_team_name('Jaxworks');




-- Solution with STRING_AGG() function
CREATE OR REPLACE FUNCTION fn_stadium_team_name(
    stadium_name VARCHAR(30)
) RETURNS VARCHAR(255)
AS
$$
DECLARE
    team_name VARCHAR(255);
BEGIN
    SELECT
        STRING_AGG(t.name, ', ' ORDER BY t.name)
    INTO
        team_name
    FROM
        teams AS t
    JOIN
        stadiums AS s
    ON
        t.stadium_id = s.id
    WHERE
        s.name = stadium_name
    GROUP BY
        s.name;
    RETURN team_name;
END;
$$
LANGUAGE plpgsql;

SELECT fn_stadium_team_name('Quaxo');


DROP FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30));

