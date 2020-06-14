CREATE TABLE inventory (
  id INTEGER NOT NULL AUTO_INCREMENT,
  store_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER DEFAULT 0,
  company_id INTEGER NOT NULL,
  created DATETIME  DEFAULT NULL  ,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL  ,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, store_id)
);
