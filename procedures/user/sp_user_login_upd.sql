/*
CALL sp_insert_login_details( 'dave@somewhere.co.uk', 'DaveFromSurrey10', 1, '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N');

CALL sp_user_login_upd( 1, 'dave@somewhere.co.uk', 'DaveFromSurrey11', 1,    '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N'  );
CALL sp_user_login_upd( 1, null,                   'DaveFromSurrey11', 1,    '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N'  );
CALL sp_user_login_upd( 1, 'dave@somewhere.co.uk', null,               1,    '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N'  );
CALL sp_user_login_upd( 1, 'dave@somewhere.co.uk', 'DaveFromSurrey11', null, '123456789012345678901234567890123456789012345678901234567890', 'N', 'N', 'N'  );
CALL sp_user_login_upd( 1, 'dave@somewhere.co.uk', 'DaveFromSurrey11', 1,    null,                                                           'N', 'N', 'N'  );
CALL sp_user_login_upd( 1, 'dave@somewhere.co.uk', 'DaveFromSurrey11', 1,    '123456789012345678901234567890123456789012345678901234567890', null, 'N', 'N' );
CALL sp_user_login_upd( 1, null, null, null, null, null, null, null);
select * from smt_user_login;
 */

DROP PROCEDURE IF EXISTS sp_user_login_upd;

DELIMITER $$

CREATE PROCEDURE sp_user_login_upd
				(
					IN  p_user_id				INTEGER,
					IN	p_email            		VARCHAR (254),
					IN	p_username				VARCHAR (30),
					IN	p_user_type				SMALLINT,
					IN	p_pwd	              	CHAR (60),
					IN	p_validated				CHAR (1),
					IN	p_validated_email		CHAR (1),
					IN	p_validated_mobile		CHAR (1)
				)
BEGIN

	DECLARE v_rc INTEGER;
    DECLARE v_affected_rows INTEGER;
    DECLARE v_changed_rows INTEGER;
    DECLARE v_update_statement VARCHAR (600);
    

	SELECT COUNT(*) INTO v_rc FROM smt_user_login WHERE user_id = p_user_id;

	IF ( v_rc = 1) THEN
    
		SET v_update_statement = '';

		IF ( p_email IS NOT NULL) THEN 
			SET v_update_statement = CONCAT(v_update_statement, "email = '", p_email, "'");
        END IF;

		IF ( p_username IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", username = '", p_username, "'");
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "username = '", p_username, "'");
                END IF;
        END IF;
    
		IF ( p_user_type IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", type = ", p_user_type);
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "type = ", p_user_type);
                END IF;
        END IF;
    
		IF ( p_pwd IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", password = '", p_pwd, "'");
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "password = '", p_pwd, "'");
                END IF;
        END IF;

		IF ( p_validated IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", validated = '", p_validated, "'");
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "validated = '", p_validated, "'");
                END IF;
        END IF;

		IF ( p_validated_email IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", validated_email = '", p_validated_email, "'");
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "validated_email = '", p_validated_email, "'");
                END IF;
        END IF;

		IF ( p_validated_mobile IS NOT NULL ) THEN
				IF ( LENGTH(v_update_statement) > 0 ) THEN 
					SET v_update_statement = CONCAT(v_update_statement, ", validated_mobile = '", p_validated_mobile, "'");
                ELSE
					SET v_update_statement = CONCAT(v_update_statement, "validated_mobile = '", p_validated_mobile, "'");
                END IF;
        END IF;

		IF (LENGTH(v_update_statement) > 0) THEN
			SET @update_statement = CONCAT('UPDATE user_login SET ', v_update_statement, " WHERE user_id = ", p_user_id );
  
			PREPARE user_update FROM @update_statement;

			EXECUTE user_update;    
			SET v_affected_rows = 0, v_changed_rows = row_count();
		ELSE
			SET v_affected_rows = 0, v_changed_rows = 0;
        END IF;

		UPDATE	smt_user_login
		SET		validated = CASE WHEN validated_email = 'Y' OR validated_mobile = 'Y' THEN 'Y' ELSE 'N' END
		WHERE	user_id = p_user_id;

    END IF;

 	SELECT p_user_id as inserted_id, IFNULL(v_affected_rows, 0) as affectedRows, IFNULL(v_changed_rows, 0) as changedRows;

END $$
DELIMITER ;

