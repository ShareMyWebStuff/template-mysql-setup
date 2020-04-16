DROP TABLE IF EXISTS smt_subjects_taught;

CREATE TABLE IF NOT EXISTS smt_subjects_taught
(
	user_id						INTEGER			NOT NULL,
	subject_id					SMALLINT		NOT NULL,
	rate_1						DECIMAL (5, 2 )	NULL,
	rate_2						DECIMAL (5, 2 )	NULL,
	rate_3						DECIMAL (5, 2 )	NULL,
	rate_4						DECIMAL (5, 2 )	NULL,
	rate_5						DECIMAL (5, 2 )	NULL,
	rate_6						DECIMAL (5, 2 )	NULL,
	
	PRIMARY KEY ( user_id, subject_id )
);

CREATE INDEX subject_order ON smt_subjects_taught ( subject_id);


