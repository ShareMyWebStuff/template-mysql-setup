/*

CALL sp_static_subjects_get (  );

*/

DROP PROCEDURE IF EXISTS sp_static_subjects_get;

DELIMITER $$

CREATE PROCEDURE sp_static_subjects_get ( )
BEGIN

    DECLARE v_rc                    INTEGER;

    BEGIN
        SELECT  subject_category_id, subject_category
        FROM    static_subject_categories;

        SELECT	sl.subject_level_id, sl.subject_level, sc.subject_category
        FROM    static_subject_level sl
                INNER JOIN static_subject_categories sc	ON ( sl.subject_category_id		= sc.subject_category_id );

        SELECT	s.subject_id, s.subject_category_id, s.subject, sc.subject_category
        FROM	static_subjects s
                INNER JOIN static_subject_categories sc	ON ( s.subject_category_id		= sc.subject_category_id )
        ORDER BY s.subject;

    END;
	
END $$
DELIMITER ;


