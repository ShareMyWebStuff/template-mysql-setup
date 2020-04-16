DROP TABLE IF EXISTS static_subject_level;

CREATE TABLE IF NOT EXISTS static_subject_level
(
	subject_level_id		            SMALLINT		NOT NULL    AUTO_INCREMENT,
    subject_category_id		            SMALLINT		NOT NULL,
    subject_level                       VARCHAR (25)    NOT NULL,
	PRIMARY KEY ( subject_level_id )
);

INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'Primary(upto 11 years)' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'Secondary(11 to 14 years)' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'GCSE' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'A Level / Highers' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'IB' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'Advanced Highers' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'Degree' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (1, 'Personal Advancements' );

INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (2, 'Beginners' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (2, 'Intermediate' );
INSERT INTO static_subject_level ( subject_category_id, subject_level ) VALUES (2, 'Advanced' );
