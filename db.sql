CREATE DATABASE assure;

CREATE USER assure WITH encrypted PASSWORD 'testing';

GRANT ALL PRIVILEGES ON DATABASE assure TO assure;

CREATE TABLE employees (
  employee_id     INTEGER NOT NULL,
  first_name      VARCHAR(128) NOT NULL,
  last_name       VARCHAR(128) NOT NULL,
  email           VARCHAR(256) NOT NULL,
  phone_number    VARCHAR(16) NOT NULL,
  hire_date       DATE NOT NULL,
  job_title       VARCHAR(128) NOT NULL,
  salary          NUMERIC(10, 2) NOT NULL,
  department      VARCHAR(128) NOT NULL,
  PRIMARY KEY ( employee_id )
);

CREATE TABLE manufacturers (
  manufacturer_id INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  street_address  VARCHAR(256) NOT NULL,
  city            VARCHAR(64) NOT NULL,
  state           VARCHAR(32) NOT NULL,
  zip             VARCHAR(16) NOT NULL,
  phone           VARCHAR(16) NOT NULL,
  PRIMARY KEY     ( manufacturer_id )
);

CREATE TABLE suppliers (
  supplier_id     INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  street_address  VARCHAR(256) NOT NULL,
  city            VARCHAR(64) NOT NULL,
  state           VARCHAR(32) NOT NULL,
  zip             VARCHAR(16) NOT NULL,
  phone           VARCHAR(16) NOT NULL,
  PRIMARY KEY     ( supplier_id )
);

CREATE TABLE inventory (
  product_id      INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  description     TEXT NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  supplier_id     INTEGER NOT NULL,
  quantity        INTEGER NOT NULL,
  price           NUMERIC(10, 2) NOT NULL,
  PRIMARY KEY ( product_id ),
  CONSTRAINT fk_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id),
  CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

GRANT ALL PRIVILEGES ON employees, manufacturers, suppliers, inventory TO assure;
