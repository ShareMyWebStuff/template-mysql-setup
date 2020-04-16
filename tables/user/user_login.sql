DROP TABLE IF EXISTS user_login;

CREATE TABLE user_login (
  user_id		        INT				      NOT NULL AUTO_INCREMENT,
  email			        VARCHAR(254)	  NOT NULL,
  username		      VARCHAR(30)     NOT NULL,
  type			        SMALLINT		    NOT NULL,
  password		      CHAR(60)		    CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  validated         CHAR(1)         DEFAULT 'N',
  validated_email   CHAR(1)         DEFAULT 'N',
  validated_mobile  CHAR(1)         DEFAULT 'N',
  create_date       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY	(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX user_login_username ON user_login ( username);

-- INSERT INTO user_login (email, username, type, password) VALUES ('dave@dave.co.uk', '', 1, 'dgdfhfhdhdhdgdsgs' ); 

SELECT * FROM user_login;

