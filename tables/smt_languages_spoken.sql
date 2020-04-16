DROP TABLE IF EXISTS smt_languages_spoken;

CREATE TABLE smt_languages_spoken (
	user_id						INTEGER			NOT NULL,
	language_id					SMALLINT		NOT NULL,
	spoken_proficiency_id		TINYINT			NOT NULL,
	written_proficiency_id		TINYINT			NOT NULL,
	
	PRIMARY KEY ( user_id, language_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE UNIQUE INDEX smt_languages_spoken ON smt_user_login ( username);


SELECT * FROM smt_languages_spoken;
