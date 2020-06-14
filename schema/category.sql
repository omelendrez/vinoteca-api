CREATE TABLE category (
  id INTEGER NOT NULL AUTO_INCREMENT,
  code CHAR(6) NOT NULL,
  name VARCHAR(30) NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL  ,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL  ,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, code)
);
