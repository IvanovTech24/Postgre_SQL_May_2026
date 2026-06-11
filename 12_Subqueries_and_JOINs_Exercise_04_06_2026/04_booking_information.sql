SELECT
    b.booking_id,
    a.name AS apartments_owner,
    a.apartment_id,
    CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name
FROM
    apartments AS a
FULL JOIN
    bookings AS b
USING
    (apartment_id)
FULL JOIN
    customers AS c
USING
    (customer_id)
ORDER BY
    b.booking_id,
    apartments_owner,
    customer_name;
