DROP TABLE IF EXISTS static_subjects;

CREATE TABLE IF NOT EXISTS static_subjects
(
	subject_id		            		SMALLINT		NOT NULL	AUTO_INCREMENT,
	subject_category_id		            SMALLINT		NOT NULL,
    subject                    			VARCHAR (30)    NOT NULL,
	PRIMARY KEY ( subject_id )
);



