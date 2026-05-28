SELECT
    capital,
    translate(capital, 'áãåçéíñóú', 'aaaceinou') AS translated_name
FROM
    countries;