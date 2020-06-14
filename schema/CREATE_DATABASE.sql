

DROP DATABASE IF EXISTS vinoteca_db;

CREATE DATABASE vinoteca_db;

USE vinoteca_db;

DROP TABLE IF EXISTS category;

CREATE TABLE category (
  id INTEGER NOT NULL AUTO_INCREMENT,
  code CHAR(6) NOT NULL,
  name VARCHAR(30) NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, code)
);

DROP TABLE IF EXISTS company;

CREATE TABLE company (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  contact VARCHAR(60) NOT NULL,
  address VARCHAR(30) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  contact VARCHAR(30) NOT NULL,
  address VARCHAR(30) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id)
);

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  number CHAR(6) NOT NULL,
  date DATE NOT NULL,
  supplier_id INTEGER NOT NULL,
  amount DECIMAL(10, 2) DEFAULT 0,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, number)
);

DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
  id INTEGER NOT NULL AUTO_INCREMENT,
  order_id INTEGER NOT NULL,
  store_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  qty_requested SMALLINT DEFAULT 0,
  qty_received SMALLINT DEFAULT 0,
  price DECIMAL(10, 2) DEFAULT 0,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(order_id)
);

DROP TABLE IF EXISTS product;

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
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, code),
  INDEX(barcode),
  INDEX(company_id)
);

DROP TABLE IF EXISTS stock;

CREATE TABLE stock (
  id INTEGER NOT NULL AUTO_INCREMENT,
  store_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER DEFAULT 0,
  company_id INTEGER NOT NULL,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id, store_id)
);

DROP TABLE IF EXISTS supplier;

CREATE TABLE supplier (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  contact VARCHAR(60) NOT NULL,
  address VARCHAR(30) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX(company_id)
);

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name CHAR(10) NOT NULL,
  email VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  profile_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  status_id TINYINT DEFAULT 1,
  created DATETIME  DEFAULT NULL,
  created_by INTEGER DEFAULT 0,
  updated DATETIME  DEFAULT NULL,
  updated_by INTEGER DEFAULT 0,
  PRIMARY KEY (id),
  INDEX (name),
  INDEX(company_id)
);