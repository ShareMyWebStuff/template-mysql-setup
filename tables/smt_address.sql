DROP TABLE IF EXISTS smt_address;

CREATE TABLE smt_address (
	user_id						INT				NOT NULL,
	address_1					VARCHAR (80)	NULL,
	address_2					VARCHAR (80)	NULL,
	town						VARCHAR (80)	NULL,
	county						VARCHAR (80)	NULL,
	postcode					VARCHAR (11)	NULL,
	location_id					INTEGER			NULL, -- Our location id for searching distance wise
	PRIMARY KEY ( user_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE UNIQUE INDEX smt_address ON smt_user_login ( username);


SELECT * FROM smt_address;
