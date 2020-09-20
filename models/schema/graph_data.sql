DROP TABLE IF EXISTS graph_data;

CREATE TABLE graph_data (
  id INTEGER NOT NULL AUTO_INCREMENT,
  period CHAR(6) NOT NULL,
  period_name CHAR(7) NOT NULL,
  purchases DECIMAL(12, 2) DEFAULT(0),
  sales DECIMAL(12, 2) DEFAULT(0),
  company_id INTEGER NOT NULL,
  PRIMARY KEY (id),
  INDEX(company_id, period)
);