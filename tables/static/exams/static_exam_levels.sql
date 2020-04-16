DROP TABLE IF EXISTS static_exam_levels;

CREATE TABLE IF NOT EXISTS static_exam_levels
(
	exam_level_id		            SMALLINT		NOT NULL	AUTO_INCREMENT,
    exam_level                      VARCHAR (25)    NOT NULL,
	PRIMARY KEY ( exam_level_id )
);

INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'O Level'               );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'GCSE'                  );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'IGCSE'                 );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'National'              );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'AS Level'              );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'A Level'               );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'GCE'                   );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'Higher'                );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'Advanced Highers'      );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'BTEC Nationals'        );
INSERT INTO static_exam_levels ( exam_level ) VALUES ( 'BTEC Higher Nationals' );
