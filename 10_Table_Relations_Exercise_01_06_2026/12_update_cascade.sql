ALTER TABLE
    countries_rivers
ADD CONSTRAINT
    countries_rivers_rivers_fkey
FOREIGN KEY
    (river_id)
REFERENCES
    rivers(id)
ON UPDATE CASCADE;

ALTER TABLE
    countries_rivers
ADD CONSTRAINT
    countries_rivers_countries_fkey
FOREIGN KEY
    (country_code)
REFERENCES
    countries(country_code)
ON UPDATE CASCADE;