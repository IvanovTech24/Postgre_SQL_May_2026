CREATE OR REPLACE PROCEDURE udp_modify_account(
    address_street VARCHAR(30),
    address_town VARCHAR(30)
) AS
$$
BEGIN
    UPDATE accounts AS ac
    SET job_title = CONCAT('(Remote) ', ac.job_title)
    FROM
    addresses AS ad
    WHERE
    ad.account_id = ac.id
        AND
    street = address_street
        AND
    town = address_town
        AND
    job_title NOT LIKE '(Remote)%';
END;
$$
LANGUAGE plpgsql;


CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
SELECT
    a.username,
    a.gender,
    a.job_title
FROM
    accounts AS a
WHERE
    a.job_title ILIKE '(Remote)%';