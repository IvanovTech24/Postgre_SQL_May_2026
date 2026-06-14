INSERT INTO
    addresses (street, town, country, account_id)
SELECT
    ac.username AS street,
    ac.password AS town,
    ac.ip AS country,
    ac.age AS account_id
FROM
    accounts AS ac
WHERE
    ac.gender = 'F';