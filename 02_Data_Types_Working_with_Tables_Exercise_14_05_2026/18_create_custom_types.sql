CREATE TYPE address AS (
    street VARCHAR(100),
    city VARCHAR(20),
    zip_code CHAR(4)
);

CREATE TABLE customers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30),
    customer_address address
);

INSERT INTO
    customers(name, customer_address)
VALUES
    ('Ivan', ('Virginia bul.', 'Plovdiv', 1847));