SELECT
    v.driver_id,
    v.vehicle_type,
    CONCAT(c.first_name, ' ', c.last_name) AS driver_name
FROM
    vehicles AS v
JOIN
    campers AS c
ON
    v.driver_id = c.id;


-- SELECT
--     v.driver_id,
--     v.vehicle_type,
--     CONCAT_WS(' ', c.first_name, c.last_name) AS driver_name
-- FROM
--     campers AS c
-- JOIN
--     vehicles AS v
-- ON
--     c.id = v.driver_id;

