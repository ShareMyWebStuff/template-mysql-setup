/*

CALL sp_static_subject_ins ( 'Languages','Albanian' );

*/

DROP PROCEDURE IF EXISTS sp_static_subject_ins;

DELIMITER $$

CREATE PROCEDURE sp_static_subject_ins
				(
					IN	p_subject_category			VARCHAR (50),
					IN	p_subject				    VARCHAR (30)
				)
BEGIN

    DECLARE v_rc                    INTEGER;
    DECLARE v_subject_id 			SMALLINT;
    DECLARE v_subject_category_id 	SMALLINT;
    DECLARE v_exit_loop             BOOLEAN;
    DECLARE v_subject			    VARCHAR(30);
    DECLARE v_subject_start         INTEGER;
    DECLARE v_subject_end           INTEGER;
    DECLARE v_next_comma            INTEGER;
    

--    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN

		-- Check the qualification is atleast 3 characters long
		-- Check the subject is atleast 3 characters long
        IF ( p_subject IS NULL OR LENGTH(p_subject) < 3) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Subject must be at least 3 characters long.';
        END IF;

        -- Retrieve the exam subject category
        SELECT	subject_category_id
        INTO	v_subject_category_id
        FROM	static_subject_categories
        WHERE	subject_category	= p_subject_category;
        
		IF (ROW_COUNT() != 1) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Subject Category does not exist.';
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

            IF (v_exit_loop) THEN
                LEAVE loop_subjects;
            END IF;

        END LOOP;
        
    END;
	
END $$
DELIMITER ;


