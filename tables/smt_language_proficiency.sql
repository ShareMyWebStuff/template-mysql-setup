DROP TABLE IF EXISTS smt_language_proficiency;

CREATE TABLE IF NOT EXISTS smt_language_proficiency
(
	proficiency_id					TINYINT			NOT NULL,
	proficiency						VARCHAR (50)    NOT NULL,
	
	PRIMARY KEY ( proficiency_id )
);

INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 1, 'Beginner' );
INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 2, 'Elementary' );
INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 3, 'Intermediate' );
INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 4, 'Upper Intermediate' );
INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 5, 'Advanced' );
INSERT INTO smt_language_proficiency ( proficiency_id, proficiency ) VALUES ( 6, 'Master' );