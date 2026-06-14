CREATE OR REPLACE FUNCTION udf_accounts_photos_count(
    account_username VARCHAR(30)
) RETURNS INT AS
$$
BEGIN
    SELECT
        COUNT(*)
    INTO
        account_username
    FROM
        accounts AS a
    JOIN
        accounts_photos AS ap
    ON
        a.id = ap.account_id
    JOIN
        photos AS p
    ON
        p.id = ap.photo_id
    WHERE
        a.username = account_username;
    RETURN account_username;
END;
$$
LANGUAGE plpgsql;

SELECT udf_accounts_photos_count('ssantryd') AS photos_count;

