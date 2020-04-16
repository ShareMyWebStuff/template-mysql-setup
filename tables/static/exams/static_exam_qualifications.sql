DROP TABLE IF EXISTS static_exam_qualifications;

CREATE TABLE IF NOT EXISTS static_exam_qualifications
(
	qualification_id	            MEDIUMINT		NOT NULL    AUTO_INCREMENT,
    exam_board_id                   SMALLINT        NOT NULL,
    exam_level_id                   SMALLINT        NOT NULL,
    qualification                   VARCHAR (80)    NOT NULL,
    valid_from                      DATE            NOT NULL,
    valid_to                        DATE            NULL,
	PRIMARY KEY ( qualification_id )
);

