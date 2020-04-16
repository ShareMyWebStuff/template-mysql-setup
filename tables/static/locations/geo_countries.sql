DROP TABLE IF EXISTS geo_countries;

CREATE TABLE geo_countries
(
	country_id		SMALLINT		NOT NULL    AUTO_INCREMENT,
    country_code    VARCHAR (50)	NOT NULL,
    country		    VARCHAR (50)	NOT NULL,
    lc_country	    VARCHAR (50)	NOT NULL,
    PRIMARY KEY (country_id)
)CHARACTER SET utf8;
