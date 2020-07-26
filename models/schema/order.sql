DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  number CHAR(5) NOT NULL,
  date DATE NOT NULL,
  supplier_id INTEGER NOT NULL,
  amount DECIMAL(10, 2) DEFAULT 0,
  store_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, number)
);