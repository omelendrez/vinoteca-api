DROP TABLE IF EXISTS company;
CREATE TABLE company (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  contact VARCHAR(60) NOT NULL,
  address VARCHAR(30) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);