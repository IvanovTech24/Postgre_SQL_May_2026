SELECT
    population,
    length(cast(population AS VARCHAR))
--    length(population::text)

FROM
    countries;