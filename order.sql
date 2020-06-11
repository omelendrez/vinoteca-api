USE vinoteca_db;

CREATE TABLE `order` (
  id INTEGER NOT NULL AUTO_INCREMENT,

number INTEGER NOT NULL,
date DATE NOT NULL,
supplier_id INTEGER NOT NULL,
amount DECIMAL(10,2) DEFAULT 0,
company_id INTEGER NOT NULL,

status_id TINYINT DEFAULT 1,
created DATETIME DEFAULT CURRENT_TIMESTAMP,
created_by INTEGER DEFAULT 0,
updated DATETIME ON UPDATE CURRENT_TIMESTAMP,
updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);