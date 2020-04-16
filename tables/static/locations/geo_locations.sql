DROP TABLE IF EXISTS geo_locations;

CREATE TABLE geo_locations
(
	location_id		INT				NOT NULL,
    country_id		SMALLINT		NOT NULL,
    location		VARCHAR (100)	NOT NULL,
    lc_location		VARCHAR (100)	NOT NULL,
    region_id		MEDIUMINT		NOT NULL,
    PRIMARY KEY (location_id)
)CHARACTER SET utf8;

CREATE INDEX lc_location		ON geo_locations ( lc_location );
CREATE INDEX country_loc		ON geo_locations ( country_id, lc_location );
