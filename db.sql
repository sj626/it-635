-- Create the database
CREATE DATABASE assure;

-- Use the database
USE assure;

-- Create the user 'assure' with password 'testing'
CREATE USER 'assure'@'localhost' IDENTIFIED BY 'testing';

-- Grant all privileges to the user 'assure'
GRANT ALL PRIVILEGES ON assure.* TO 'assure'@'localhost';
CREATE SCHEMA assure;

-- Create the 'inventory' table in the 'assure' schema
CREATE TABLE assure.inventory (
  inventory_id INT NOT NULL,
  item_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (inventory_id)
);

-- Create the sequence for the 'inventory_id' column in the 'assure' schema
CREATE SEQUENCE assure.inventory_id_seq START WITH 1 INCREMENT BY 1;
-- Set the default value for the 'inventory_id' column to the next value in the sequence
ALTER TABLE assure.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('assure.inventory_id_seq');

-- Create the 'employees' table in the 'assure' schema
CREATE TABLE assure.employees (
  employee_id INT NOT NULL,
  employee_name VARCHAR(50) NOT NULL,
  hourly_rate DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (employee_id)
);

-- Create a sequence for the 'employee_id' column
CREATE SEQUENCE assure.employee_id_seq START WITH 1 INCREMENT BY 1;
-- Set the default value for the 'employee_id' column to the next value in the sequence
ALTER TABLE assure.employees ALTER COLUMN employee_id SET DEFAULT nextval('assure.employee_id_seq');

-- Create the 'time_records' table in the 'assure' schema
CREATE TABLE assure.time_records (
  time_record_id INT NOT NULL,
  employee_id INT NOT NULL,
  date DATE NOT NULL,
  hours_worked DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (time_record_id),
  FOREIGN KEY (employee_id) REFERENCES assure.employees(employee_id)
);

-- Create a sequence for the 'time_record_id' column
CREATE SEQUENCE assure.time_record_id_seq START WITH 1 INCREMENT BY 1;
-- Set the default value for the 'time_record_id' column to the next value in the sequence
ALTER TABLE assure.time_records ALTER COLUMN time_record_id SET DEFAULT nextval('assure.time_record_id_seq');

-- Create the 'funds' table in the 'assure' schema
CREATE TABLE assure.funds (
  fund_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (fund_id)
);

-- Create a sequence for the 'fund_id' column
CREATE SEQUENCE assure.fund_id_seq START WITH 1 INCREMENT BY 1;
-- Set the default value for the 'fund_id' column to the next value in the sequence
ALTER TABLE assure.funds ALTER COLUMN fund_id SET DEFAULT nextval('assure.fund_id_seq');

GRANT ALL PRIVILEGES ON TABLE assure.inventory TO assure;
GRANT ALL PRIVILEGES ON TABLE assure.funds TO assure;
GRANT ALL PRIVILEGES ON TABLE assure.time_records TO assure;
GRANT ALL PRIVILEGES ON TABLE assure.employees TO assure;

