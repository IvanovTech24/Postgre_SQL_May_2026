SELECT
    replace(title, 'The', '***') AS title
FROM
    books
WHERE
    left(title, 3) = 'The';