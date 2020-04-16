DROP TABLE IF EXISTS geo_regions;

CREATE TABLE geo_regions
(
	region_id		MEDIUMINT		NOT NULL,
    region			VARCHAR (100)	NOT NULL,
    lc_region		VARCHAR (100)	NOT NULL,
    PRIMARY KEY (region_id)
)CHARACTER SET utf8;

CREATE INDEX lc_region		ON geo_regions ( lc_region );
