/*

CALL sp_static_exam_qualification_ins ( 'CEA', 'GCSE','Science Double Award', 'Academic','Biology, Chemistry, Physics','2017-09-01',NULL);

*/

DROP PROCEDURE IF EXISTS sp_static_exam_qualification_ins;

DELIMITER $$

CREATE PROCEDURE sp_static_exam_qualification_ins
				(
					IN	p_exam_board				VARCHAR (10),
					IN	p_exam_level           		VARCHAR (25),
					IN	p_qualification				VARCHAR (80),
					IN	p_subject_category			VARCHAR (50),
					IN	p_subject				    VARCHAR (30),
					IN	p_valid_from				DATE,
					IN	p_valid_to			    	DATE
				)
BEGIN

    DECLARE v_rc                    INTEGER;
    DECLARE v_exam_board_id 		SMALLINT;
    DECLARE v_exam_level_id 		SMALLINT;
    DECLARE v_subject_id 			SMALLINT;
    DECLARE v_subject_category_id 	SMALLINT;
    DECLARE v_qualification_id      MEDIUMINT;
    DECLARE v_exit_loop             BOOLEAN;
    DECLARE v_subject			    VARCHAR(30);
    DECLARE v_subject_start         INTEGER;
    DECLARE v_subject_end           INTEGER;
    DECLARE v_next_comma            INTEGER;
    

    -- Declare eror handlers for begin block
--    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN

		-- Check the qualification is atleast 3 characters long
        IF ( p_qualification IS NULL OR LENGTH(p_qualification) < 3) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Exam qualification must be at least 3 characters long.';
        END IF;

		-- Check the subject is atleast 3 characters long
        IF ( p_subject IS NULL OR LENGTH(p_subject) < 3) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Exam subject must be at least 3 characters long.';
        END IF;


        -- Retrieve the exam board
        SELECT  exam_board_id
        INTO    v_exam_board_id
        FROM    static_exam_boards
        WHERE   exam_board = p_exam_board;

		IF (ROW_COUNT() != 1) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Exam board does not exist.';
        END IF;

		-- Retrieve the exam level
        SELECT	exam_level_id
        INTO	v_exam_level_id
        FROM	static_exam_levels
        WHERE	exam_level	= p_exam_level;
        
		IF (ROW_COUNT() != 1) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Exam level does not exist.';
        END IF;
        
        -- Retrieve the exam subject category
        SELECT	subject_category_id
        INTO	v_subject_category_id
        FROM	static_subject_categories
        WHERE	subject_category	= p_subject_category;
        
		IF (ROW_COUNT() != 1) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Exam Subject Category does not exist.';
        END IF;

        -- 
        SELECT  qualification_id
        INTO    v_qualification_id
        FROM    static_exam_qualifications
        WHERE   exam_board_id   = v_exam_board_id
        AND     exam_level_id   = v_exam_level_id
        AND     qualification   = p_qualification;

		IF (ROW_COUNT() = 0) THEN
            INSERT INTO static_exam_qualifications ( exam_board_id, exam_level_id, qualification, valid_from, valid_to ) VALUES ( v_exam_board_id, v_exam_level_id, p_qualification, p_valid_from, p_valid_to );
            SET v_qualification_id = LAST_INSERT_ID();
        END IF;

		-- Loop through each of the subjects. for example 'Biology, Chemistry, Physics'
		SET v_subject_start = 0;
		SET v_next_comma = 0;
        SET v_exit_loop = false;

        loop_subjects: LOOP

            -- Get the next subject if there is one
    		SET v_subject_start = v_next_comma + 1;
	    	SET v_next_comma  = LOCATE(',', p_subject, v_subject_start);
            IF (v_next_comma = 0 ) THEN
		    	SET v_next_comma  = LENGTH(p_subject);
	    		SET v_subject_end = v_next_comma + 1;
                SET v_exit_loop = true;
    		ELSE
		    	SET v_subject_end = v_next_comma;
	    	END IF;
    		SET v_subject = TRIM(SUBSTRING(p_subject, v_subject_start, v_subject_end - v_subject_start) );

            -- Check subject exists
            SELECT	subject_id
            INTO	v_subject_id
            FROM	static_subjects
            WHERE	subject	= v_subject
            AND     subject_category_id = v_subject_category_id;

            IF (ROW_COUNT() = 0) THEN
                INSERT INTO static_subjects ( subject_category_id, subject ) VALUES ( v_subject_category_id, v_subject );
                SET v_subject_id = LAST_INSERT_ID();
            END IF;

            -- Create the subject to qualification link
            SELECT  COUNT(*)
            INTO    v_rc
            FROM    static_exam_subject_qual_link
            WHERE   subject_id          = v_subject_id
            AND     qualification_id    = v_qualification_id;

            IF (v_rc = 0) THEN
                INSERT INTO static_exam_subject_qual_link ( subject_id, qualification_id ) VALUES ( v_subject_id, v_qualification_id );
            END IF;

            IF (v_exit_loop) THEN
                LEAVE loop_subjects;
            END IF;

        END LOOP;
        
       
    END;

	
END $$
DELIMITER ;


