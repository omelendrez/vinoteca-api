DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id INTEGER NOT NULL AUTO_INCREMENT,
  code CHAR(4) NOT NULL,
  barcode CHAR(13) NOT NULL,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(100) DEFAULT '',
  quantity SMALLINT DEFAULT 0,
  minimum SMALLINT DEFAULT 0,
  category_id INTEGER NOT NULL,
  last_purchase_date DATE,
  last_purchase_price DECIMAL(10, 2) DEFAULT 0,
  last_sale_date DATE,
  last_sale_price DECIMAL(10, 2) DEFAULT 0,
  price DECIMAL(10, 2) DEFAULT 0,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, code),
  INDEX(company_id, barcode),
  INDEX(company_id)
);