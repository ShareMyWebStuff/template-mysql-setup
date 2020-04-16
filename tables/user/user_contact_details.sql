DROP TABLE IF EXISTS user_contact_details;

CREATE TABLE user_contact_details (
	user_id					INT				NOT NULL,
    title           		VARCHAR(5)      NOT NULL,
	firstname				VARCHAR(50)		NOT NULL,
	lastname				VARCHAR(50)		NOT NULL,
	gender					CHAR(1)			NOT NULL,
	address1				VARCHAR(80)		NULL,
	address2				VARCHAR(80)		NULL,
	town					VARCHAR(80)		NULL,
	county					VARCHAR(80)		NULL,
	postcode				VARCHAR(11)		NULL,
	country_id      		SMALLINT    	NULL,
	phone					VARCHAR(20)		NULL,
	mobile					VARCHAR(20)		NULL,
	search_location_id		INT				NULL,
	PRIMARY KEY	(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE INDEX user_contact_details ON user_contact_details (location_id);

