DROP TABLE IF EXISTS user_verification_codes;

CREATE TABLE user_verification_codes (
  user_id           INT           NOT NULL,
  media_type        VARCHAR(6)    NOT NULL,
  verification_code	VARCHAR(40)   NOT NULL,
  create_date       TIMESTAMP     NOT NULL  DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX user_verification_codes_code ON user_verification_codes ( verification_code );

SELECT * FROM user_verification_codes;

