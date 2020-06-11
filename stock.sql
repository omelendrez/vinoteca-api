USE vinoteca_db;

CREATE TABLE stock (
  id INTEGER NOT NULL AUTO_INCREMENT,

store_id INTEGER NOT NULL,
product_id INTEGER NOT NULL,
quantity INTEGER DEFAULT 0,

created DATETIME DEFAULT CURRENT_TIMESTAMP,
created_by INTEGER DEFAULT 0,
updated DATETIME ON UPDATE CURRENT_TIMESTAMP,
updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);