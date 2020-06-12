USE vinoteca_db;

CREATE TABLE user (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  email VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  profile_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by INTEGER DEFAULT 0,
  updated DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);