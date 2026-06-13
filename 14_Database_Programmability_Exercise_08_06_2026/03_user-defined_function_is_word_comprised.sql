-- Solution with TRIM()
CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
) RETURNS BOOLEAN
AS
$$
BEGIN
    RETURN TRIM(LOWER(word), LOWER(set_of_letters)) = '';
end;
$$
LANGUAGE plpgsql;

SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
------------------------------------------------------------------------

-- Solution with FOR or WHILE LOOPS
CREATE OR REPLACE FUNCTION fn_is_word_comprised (
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
) RETURNS BOOLEAN
AS
$$
DECLARE
    i int;
    letter CHAR(1);
BEGIN
    FOR i IN 1..LENGTH(word) LOOP
        letter := SUBSTRING(LOWER(word), i, 1); -- word[i].lower()

        IF POSITION(letter IN LOWER(set_of_letters)) = 0 THEN
            RETURN FALSE;
        end if;
    end loop;

    RETURN TRUE;
end;
$$
LANGUAGE plpgsql;

SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
