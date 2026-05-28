SELECT
    continent_name,
    TRIM(TRAILING FROM continent_name)
--     rtrim(continent_name)
FROM
    continents;