SELECT
    i.name AS ingredient_name,
    p.name AS product_name,
    d.name AS distributor_name
FROM
    products AS p
JOIN
    products_ingredients AS pi
ON
    p.id = pi.product_id
JOIN
    ingredients AS i
ON
    i.id = pi.ingredient_id
JOIN
    distributors AS d
ON
    i.distributor_id = d.id
WHERE
    i.name ILIKE '%mustard%'
        AND
    d.country_id = 16
ORDER BY
    p.name