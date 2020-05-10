/*
CALL sp_user_contact_dets_ins( 1, 'Mr', 'David', 'Ferguson', 'M', '6 Mint Walk', 'Knaphill', 'Woking', 'Surrey', 'GU21 2NT', 'United Kingdom', '01483 755899', '' );

CALL sp_user_contact_dets_ins( 1, 'Mr', 'David', 'Ferguson', 'M', '6 Mint Walk', 'Knaphill', 'Woking', 'Surrey', 'GU21', 'United Kingdom', '01483 755899', '' );



 */

DROP PROCEDURE IF EXISTS sp_user_contact_dets_ins;

DELIMITER $$

CREATE PROCEDURE sp_user_contact_dets_ins
				(
					IN	p_user_id				INT,
					IN	p_title           		VARCHAR (5),
					IN	p_firstname				VARCHAR (50),
					IN	p_lastname				VARCHAR (50),
					IN	p_gender				CHAR (1),
					IN	p_address1				VARCHAR (80),
					IN	p_address2				VARCHAR (80),
					IN	p_town					VARCHAR (80),
					IN	p_county				VARCHAR (80),
					IN	p_postcode				VARCHAR (11),
					IN	p_country				VARCHAR (80),
					IN	p_phone					VARCHAR (20),
					IN	p_mobile				VARCHAR (20)
				)
BEGIN

    DECLARE v_affected_rows INTEGER;
    DECLARE v_changed_rows  INTEGER;
	DECLARE v_location_id   INTEGER;
	DECLARE v_country_id    MEDIUMINT;
	DECLARE v_rc            INT;

	SELECT country_id
	INTO   v_country_id
	FROM   geo_countries
	WHERE  country = p_country;
	
	SET    v_location_id = sf_geo_location_nearest_location_id_get( p_address2, p_town, p_county, p_postcode );
	
	SELECT COUNT(*)
	INTO   v_rc
	FROM   user_contact_details
	WHERE  user_id = p_user_id;

	IF v_rc = 0 THEN
		INSERT INTO user_contact_details ( user_id, title, firstname, lastname, gender, search_location_id, address1, address2, town, county, postcode, country_id, phone, mobile )
		VALUES (p_user_id, p_title, p_firstname, p_lastname, p_gender, v_location_id, p_address1, p_address2, p_town, p_county, p_postcode, v_country_id, p_phone, p_mobile );
        SET v_affected_rows = row_count(), v_changed_rows = 0;

	ELSE
		UPDATE	user_contact_details
		SET		title         		= p_title, 
				firstname     		= p_firstname, 
				lastname      		= p_lastname, 
				gender        		= p_gender, 
				search_location_id  = v_location_id, 
				address1      		= p_address1, 
				address2      		= p_address2, 
				town          		= p_town, 
				county        		= p_county, 
				postcode      		= p_postcode, 
				country_id    		= v_country_id, 
				phone         		= p_phone, 
				mobile        		= p_mobile
		WHERE	user_id 			= p_user_id;
        SET v_affected_rows = 0, v_changed_rows = row_count();
	END IF;

 	SELECT p_user_id as inserted_id, v_affected_rows as affectedRows, v_changed_rows as changedRows;

END $$
DELIMITER ;

