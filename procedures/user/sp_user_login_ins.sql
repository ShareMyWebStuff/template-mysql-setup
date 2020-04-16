/*
CALL sp_user_login_ins( 'dave@somewhere.co.uk', 'DaveFromSurrey', 1, '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N');
select * from user_login;
 */

DROP PROCEDURE IF EXISTS sp_user_login_ins;

DELIMITER $$

CREATE PROCEDURE sp_user_login_ins
				(
					IN	p_email            		VARCHAR (254),
					IN	p_username				VARCHAR (30),
					IN	p_user_type				SMALLINT,
					IN	p_pwd	              	CHAR (60),
					IN	p_validated				CHAR (1),
					IN	p_validated_email		CHAR (1),
					IN	p_validated_mobile		CHAR (1)
				)
BEGIN

	DECLARE v_user_id INTEGER;
    DECLARE v_affected_rows INTEGER;
    DECLARE v_changed_rows INTEGER;

	SELECT user_id INTO v_user_id FROM user_login WHERE username = p_username;

    IF ( v_user_id IS NULL) THEN
		INSERT INTO user_login (email, username, type, password, validated, validated_email, validated_mobile) VALUES (p_email, p_username, p_user_type, p_pwd, p_validated, p_validated_email, p_validated_mobile);
        SET v_user_id = LAST_INSERT_ID(), v_affected_rows = row_count(), v_changed_rows = 0;
	ELSE
		UPDATE	user_login 
		SET		email = p_email, 
				type = p_user_type, 
				password = p_pwd, 
				validated = p_validated,
				validated_email = p_validated_email, 
				validated_mobile = p_validated_mobile 
		WHERE	user_id = v_user_id;
        SET v_affected_rows = 0, v_changed_rows = row_count();
    END IF;

 	SELECT v_user_id as inserted_id, v_affected_rows as affectedRows, v_changed_rows as changedRows;

END $$
DELIMITER ;

