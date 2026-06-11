CREATE OR REPLACE FUNCTION fn_get_initials(first_name varchar, last_name varchar)
RETURNS varchar(5) AS
$$
    DECLARE
        tmp_var int;
    BEGIN
        tmp_var := 20;
        RETURN concat(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.');
    END
$$
LANGUAGE plpgsql;

SELECT fn_get_initials('Ivan', 'Ivanov');
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_get_full_name(first_name varchar, last_name varchar)
RETURNS varchar AS
$$
    DECLARE
        full_name varchar;
    BEGIN
        IF first_name IS NULL AND last_name IS NULL THEN
            full_name := NULL;
        ELSIF first_name IS NULL THEN
            full_name := last_name;
        ELSIF last_name IS NULL THEN
            full_name := first_name;
        ELSE
            full_name := CONCAT_WS(' ', first_name, last_name);
        END IF;
        RETURN full_name;
    END;
$$
LANGUAGE plpgsql;

SELECT fn_get_full_name('Ivan', NULL);
-------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION fn_get_country_id(country varchar)
RETURNS INT AS
$$
    DECLARE
    country_id INT;
    BEGIN
        SELECT id FROM countries WHERE name = country INTO country_id;
        RETURN country_id;
    end;
$$
LANGUAGE plpgsql;
--------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_get_country_id(IN country varchar, OUT c_id INT, OUT status INT)
AS
$$
    BEGIN
        SELECT id FROM countries WHERE name = country INTO c_id;
        IF c_id IS NOT NULL THEN
            status := 0;
        ELSE status := 100;
        END IF;
    end;
$$
LANGUAGE plpgsql;
-----------------------------------------------------


CREATE OR REPLACE FUNCTION fn_add_country(c_name varchar, c_id int)
RETURNS bool AS
$$
    BEGIN
        INSERT INTO countries (id, name)
        VALUES (c_id, c_name);
        RETURN TRUE;
        EXCEPTION
            WHEN UNIQUE_VIOLATION THEN RETURN FALSE;
    end;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------


CREATE OR REPLACE FUNCTION fn_get_persons()
RETURNS TABLE (id int, full_name text, email varchar(40))
AS
$$
    BEGIN
        RETURN QUERY (
            SELECT p.id,
                   concat_ws(' ', first_name, last_name),
                   p.email
            FROM persons AS p
        );
    end
$$
LANGUAGE plpgsql;

SELECT * FROM fn_get_persons();
---------------------------------------


CREATE OR REPLACE FUNCTION fn_show_msg(msg varchar)
RETURNS bool AS
$$
    BEGIN
        RAISE NOTICE 'Very important notice: %', msg;
        RETURN TRUE;
    end;
$$
LANGUAGE plpgsql;

SELECT fn_show_msg('Hello Mama');
---------------------------------------------------

CREATE OR REPLACE PROCEDURE sp_add_country(IN c_name varchar, IN c_id int, OUT status bool)
AS
$$
    BEGIN
        INSERT INTO countries (id, name)
        VALUES (c_id, c_name);
            status := TRUE;
        EXCEPTION
            WHEN UNIQUE_VIOLATION THEN status := FALSE;
            RAISE NOTICE 'error: %', SQLERRM;
    end;
$$
LANGUAGE plpgsql;

CALL sp_add_country('Greece', 22, TRUE);
---------------------------------------------------------

CREATE OR REPLACE PROCEDURE sp_transfer_money(
    IN sender_id int,
    IN receiver_id int,
    IN transfer_amount int,
    OUT status varchar(50)
)
AS
$$
    DECLARE
        sender_amount int;
        receiver_amount int;
        temp_val int;
    BEGIN
        SELECT bgn FROM bank WHERE id = sender_id INTO sender_amount;
        IF sender_amount < transfer_amount THEN
            status := 'The sender does not have enough money';
            RETURN;
        end if;
        SELECT bgn FROM bank WHERE id = receiver_id INTO receiver_amount;

        UPDATE bank SET bgn = bgn - transfer_amount WHERE id = sender_id;

        UPDATE bank SET bgn = bgn + transfer_amount WHERE id = receiver_id;

        SELECT bgn FROM bank WHERE id = sender_id INTO temp_val;
        IF sender_amount - transfer_amount <> temp_val THEN
            status := 'Error when transfers from sender';
            ROLLBACK;
            RETURN;
        end if;

        SELECT bgn FROM bank WHERE id = receiver_id INTO temp_val;
        IF receiver_amount + transfer_amount <> temp_val THEN
            status := 'Error when transfer to receiver';
            ROLLBACK;
            RETURN;
        end if;

        status := 'Success';
        COMMIT;
    end;
$$
LANGUAGE plpgsql;

CALL sp_transfer_money(1, 2, 50, '');
CALL sp_transfer_money(2, 1, 550, '');

SELECT * FROM bank;

------------------------------------------------------
CREATE OR REPLACE FUNCTION log_items()
RETURNS TRIGGER
AS
$$
    BEGIN
        INSERT INTO items_log(id, status, created)
        VALUES (new.id, new.status, new.created);
        RETURN new;
    end;
$$
LANGUAGE plpgsql;

CREATE TRIGGER log_items_trigger
AFTER INSERT ON items
FOR EACH ROW EXECUTE PROCEDURE log_items();

INSERT INTO items(id, status)
VALUES
    (1, floor(random() * 100)),
    (2, floor(random() * 100)),
    (3, floor(random() * 100)),
    (4, floor(random() * 100)),
    (5, floor(random() * 100)),
    (6, floor(random() * 100)),
    (7, floor(random() * 100)),
    (8, floor(random() * 100)),
    (9, floor(random() * 100)),
    (10, floor(random() * 100));

SELECT * FROM items_log;
----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_delete_last_items_log()
RETURNS TRIGGER
AS
$$
    BEGIN
        WHILE (SELECT COUNT(*) FROM items_log) > 20 LOOP
            DELETE FROM items_log WHERE id = (SELECT MIN(id) FROM items_log);
        end loop;
        RETURN NEW;
    end;
$$
LANGUAGE plpgsql;

CREATE TRIGGER clear_items_log_trigger
AFTER INSERT ON items_log
FOR EACH STATEMENT EXECUTE PROCEDURE fn_delete_last_items_log();

INSERT INTO items (id, status)
VALUES
    (21, floor(random() * 100)),
    (22, floor(random() * 100)),
    (23, floor(random() * 100)),
    (24, floor(random() * 100)),
    (25, floor(random() * 100)),
    (26, floor(random() * 100)),
    (27, floor(random() * 100)),
    (28, floor(random() * 100)),
    (29, floor(random() * 100)),
    (30, floor(random() * 100)),
    (31, floor(random() * 100));

SELECT count(*) FROM items_log;

INSERT INTO items (id, status)
VALUES
    (32, floor(random() * 100)),
    (33, floor(random() * 100)),
    (34, floor(random() * 100)),
    (35, floor(random() * 100)),
    (36, floor(random() * 100)),
    (37, floor(random() * 100)),
    (38, floor(random() * 100)),
    (39, floor(random() * 100)),
    (40, floor(random() * 100)),
    (41, floor(random() * 100));