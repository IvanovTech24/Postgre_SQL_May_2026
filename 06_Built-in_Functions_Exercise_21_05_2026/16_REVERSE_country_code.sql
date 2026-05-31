UPDATE
    countries
SET
    country_code = reverse(lower(country_code));


SELECT
    country_code
FROM
    countries;