SELECT
    now() AS full_date,
    extract('year' FROM now()) AS year,
    extract('month' FROM now()) AS month,
    extract('day' FROM now()) AS day,
    extract('hour' FROM now()) AS hour,
    extract('minute' FROM now()) AS minute,
    extract('second' FROM now()) AS second;


SELECT
    extract('year' FROM age(now(), date'2023-01-02')) AS year,
    extract('day' FROM now() - date'2023-01-02') AS days;


SELECT
    now() AS time_now,
    now() + INTERVAL '1 hour' AS time_plus_hour;


SELECT
    concat_ws(' ', first_name, last_name),
    age(died, born) AS life_span
FROM
    authors;

SELECT
    CURRENT_DATE;

SELECT
    CURRENT_TIMESTAMP;

SELECT
    to_char(now(), 'YYYY') AS year,
    to_char(now(), 'month') AS month,
    to_char(now(), 'W') AS week_of_month,
    to_char(now(), 'WW') AS week_of_year,
    to_char(now(), 'DDD') AS day_of_year,
    to_char(now(), 'day') AS day;


SELECT
    *
FROM
    authors
WHERE
    discount_info LIKE '%50!%%' ESCAPE '!';