DROP TABLE IF EXISTS static_exam_subject_qual_link;

CREATE TABLE IF NOT EXISTS static_exam_subject_qual_link
(
    subject_id		                SMALLINT		NOT NULL,
    qualification_id	            MEDIUMINT		NOT NULL,
	PRIMARY KEY ( subject_id, qualification_id )
);

