/*
SELECT sf_geo_location_nearest_location_id_get( 'Streatham Hight Road', 'Streatham Hill', 'SW16 1HE' ) as location_id;
SELECT sf_geo_location_nearest_location_id_get( 'Knaphill',             'Woking',         'GU21 2NT' ) as location_id;
SELECT sf_geo_location_nearest_location_id_get( 'Knaphill',             'Woking',         'GU21'     ) as location_id;
SELECT sf_geo_location_nearest_location_id_get( 'Knaphill',             'Woking',         'GU21 111'     ) as location_id;
SELECT sf_geo_location_nearest_location_id_get( 'Knaphill',             'Woking',         ''         ) as location_id;


SELECT * FROM geo_locations where location_id = 7351;
SELECT * FROM geo_locations where location_id = 7564;
SELECT * FROM geo_locations where location_id = 18350;
SELECT * FROM geo_locations where location_id = 18314;
SELECT * FROM geo_locations where location_id = 18512;
*/

/*
	Name:			sf_geo_location_nearest_location_id_get

	Description:	Each user that registers we need to determine a location for them that we store in our database. This location can then be used in order to 
					find tutors / students that are local to them. We want to find a location as specific to the user as possible, hence we check postcode first,
					then partial postcode, then city and finally the address2. 

*/

DROP FUNCTION IF EXISTS sf_geo_location_nearest_location_id_get;

DELIMITER ||  

CREATE FUNCTION sf_geo_location_nearest_location_id_get( p_address2 VARCHAR (80), p_town VARCHAR (80), p_postcode VARCHAR (11) ) RETURNS INTEGER 
BEGIN  
	DECLARE v_location_id INTEGER;
  	DECLARE v_search      VARCHAR (210);
    DECLARE v_rc          INTEGER;

	SET v_location_id = -1;
	
	--
	-- Check the postcode exists
	--
	IF p_postcode != '' THEN

		SELECT location_id
		INTO   v_location_id
		FROM   geo_postcodes
		WHERE  lc_postcode = replace(lower(p_postcode), ' ', '');

		IF (ROW_COUNT() != 1) THEN

			SET v_search = CONCAT(REPLACE(LOWER(p_postcode), ' ', ''), '%');
			SELECT location_id
			INTO   v_location_id
			FROM   geo_postcodes
			WHERE  lc_postcode LIKE v_search;
        END IF;

	END IF;

	--
	-- Check the city exists
	--
	IF v_location_id = -1 AND p_town != '' THEN

		SELECT location_id
		INTO   v_location_id
		FROM   geo_locations
		WHERE  lc_location = LOWER(p_town);

	END IF;

	IF v_location_id = -1 AND p_address2 != '' THEN

		SELECT location_id
		INTO   v_location_id
		FROM   geo_locations
		WHERE  lc_location = LOWER(p_address2);

	END IF;
	
	RETURN v_location_id;
END ||  

DELIMITER ; 

