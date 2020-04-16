DROP TABLE IF EXISTS geo_postcodes;

CREATE TABLE geo_postcodes
(
	postcode_id		INT				NOT NULL,
    country_id		SMALLINT		NOT NULL,
    postcode		VARCHAR (8)		NOT NULL,
    lc_postcode		VARCHAR (8)		NOT NULL,
    location_id		INT		        NOT NULL,
    PRIMARY KEY (postcode_id)
)CHARACTER SET utf8;

CREATE INDEX lc_postcode		ON geo_postcodes ( lc_postcode );
CREATE INDEX country_postcode	ON geo_postcodes ( country_id, lc_postcode );
