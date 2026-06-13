CREATE OR REPLACE FUNCTION udf_classification_items_count(
    classification_name VARCHAR(30)
)RETURNS TEXT AS
$$
DECLARE
    items_count INT;
BEGIN
    SELECT
        COUNT(i.id)
    INTO
        items_count
    FROM
        items AS i
    JOIN
        classifications AS c
    ON
        i.classification_id = c.id
    WHERE
        c.name = classification_name;

    IF (items_count > 0) THEN
        RETURN 'Found ' || items_count || ' items.';
    ELSE
        RETURN 'No items found.';
    END IF;
END;
$$
LANGUAGE plpgsql;

SELECT udf_classification_items_count('Nonexistent') AS message_text;