DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name CHAR(10) NOT NULL,
  email VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  profile_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX (name),
  INDEX(company_id)
);