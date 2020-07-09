DROP TABLE IF EXISTS order_tracking;

CREATE TABLE order_tracking (
  id INTEGER NOT NULL AUTO_INCREMENT,
  order_id INTEGER NOT NULL,
  date DATE NOT NULL,
  status_id TINYINT NOT NULL,
  created DATETIME DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(order_id)
);