DROP TABLE IF EXISTS user_password_reset_codes;

CREATE TABLE user_password_reset_codes (
  user_id           INT           NOT NULL,
  reset_code	    VARCHAR(40)   NOT NULL,
  create_date       TIMESTAMP     NOT NULL  DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX user_password_reset_codes_code ON user_password_reset_codes ( reset_code );

SELECT * FROM user_password_reset_codes;

