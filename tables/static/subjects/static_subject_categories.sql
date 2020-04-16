DROP TABLE IF EXISTS static_subject_categories;

CREATE TABLE IF NOT EXISTS static_subject_categories
(
	subject_category_id		            SMALLINT		NOT NULL    AUTO_INCREMENT,
    subject_category                    VARCHAR (25)    NOT NULL,
	PRIMARY KEY ( subject_category_id )
);

INSERT INTO static_subject_categories ( subject_category ) VALUES ('Academic' );
INSERT INTO static_subject_categories ( subject_category ) VALUES ('Languages' );
