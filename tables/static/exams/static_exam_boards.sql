DROP TABLE IF EXISTS static_exam_boards;

CREATE TABLE IF NOT EXISTS static_exam_boards
(
	exam_board_id		            SMALLINT		NOT NULL	AUTO_INCREMENT,
    parent_board                    VARCHAR (10)    NOT NULL,
	parent_board_desc  				VARCHAR (60)	NOT NULL,
	exam_board      				VARCHAR (10)	NOT NULL,
	PRIMARY KEY ( exam_board_id )
);

INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'AQA',     'AQA',     'Assessment AND Qualifications Alliance'               );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'CEA',     'CEA',     'Council for the Curriculum, Examination & Assessment' );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'Edexcel', 'Edexcel', 'Educational and Examination Body (Pearsons)'          );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'CIE',     'CIE',     'Cambridge Assessment International Education'         );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'OCR',     'OCR',     'Oxford, Cambridge and RSA Examinations'               );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'WJEC',    'WJEC',    'Welsh Joint Education Committee'                      );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'WJEC',    'Educas',  'Welsh Joint Education Committee'                      );
INSERT INTO static_exam_boards (parent_board, exam_board, parent_board_desc) VALUES ( 'SQA',     'SQA',     'Scottish Qualifications Authority'                    );

