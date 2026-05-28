SELECT
    continent_name,
    TRIM(LEADING FROM continent_name)
--     ltrim(continent_name)
FROM
    continents;
