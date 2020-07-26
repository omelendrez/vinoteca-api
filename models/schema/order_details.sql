DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
  id INTEGER NOT NULL AUTO_INCREMENT,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  qty_requested SMALLINT DEFAULT 0,
  qty_received SMALLINT DEFAULT 0,
  price DECIMAL(10, 2) DEFAULT 0,
  status_id TINYINT DEFAULT 1,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(order_id)
);