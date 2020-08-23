DROP TABLE IF EXISTS `price`;

CREATE TABLE `price` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  product_id INTEGER NOT NULL,
  supplier_id INTEGER NOT NULL,
  price DECIMAL(10, 2) DEFAULT 0,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(product_id, supplier_id)
);