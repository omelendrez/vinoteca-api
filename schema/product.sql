USE vinoteca_db;

CREATE TABLE product (
  id INTEGER NOT NULL AUTO_INCREMENT,
  code CHAR(6) NOT NULL,
  barcode CHAR(12) NOT NULL,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(60) DEFAULT '',
  quantity SMALLINT DEFAULT 0,
  minimum SMALLINT DEFAULT 0,
  category_id INTEGER NOT NULL,
  last_purchase_date DATE NOT NULL,
  last_purchase_price DECIMAL(10, 2) DEFAULT 0,
  last_sale_date DATE NOT NULL,
  last_sale_price DECIMAL(10, 2) DEFAULT 0,
  price DECIMAL(10, 2) DEFAULT 0,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by INTEGER DEFAULT 0,
  updated DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);