SELECT
    i.name AS item_name,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(r.customer_id) AS total_reviews,
    b.name AS brand_name,
    cl.name AS classification_name
FROM
    items AS i
JOIN
    brands AS b
ON
    i.brand_id = b.id
JOIN
    classifications AS cl
ON
    i.classification_id = cl.id
JOIN
    reviews AS r
ON
    r.item_id = i.id
GROUP BY
    i.id,
    i.name,
    b.name,
    cl.name
HAVING
    COUNT(r.customer_id) >= 3
ORDER BY
    average_rating DESC,
    i.name ASC
LIMIT 3;