-- insert employees
INSERT INTO employees (employee_id, first_name,last_name, email, phone_number, hire_date, job_title) 
VALUES (1,'John','Doe','john@njit.edu','973-393-6079','03-1-2023','manager');
VALUES (2,'Jane','Smith','jane@njit.edu','973-393-6079','03-1-2023','ast_manager');
VALUES (1,'Bob','Johnson','john@njit.edu','973-393-6079','03-1-2023','supervisor');

-- insert suppliers
INSERT INTO suppliers (supplier_id,contact_name, phone_number) 
VALUES (1,'ABC Supplier','John Doe','555-555-5555');
VALUES (2,'XYZ supplier','Jane Smith','555-123-4567');
VALUES (3,'123 supplier','Bob Johnson','555-987-6543');

-- insert manufacturers
INSERT INTO manufacturers (manufacturer_id,street_address,city, state, zip, phone) 
VALUES (1, 'hp_laptop', '123 Madeup Road', 'Trenton', 'NJ', '08619', '6095555555');
VALUES (2, 'lenovo', '321 Legit Drive', 'Newark', 'NJ', '07101', '7325555555');
VALUES (3, 'apple_macOS', '1 Buckleberry Ave.', 'Camden', 'NJ', '08030', '1234567890');

-- insert items
INSERT INTO items (item_id,description,manufacturer_id) 
VALUES (1, 'ABC', 'windowsOS','hp_laptop'); 
VALUES (2, 'XYZ', 'LinuxOS','lenovo');
VALUES (3, '123', 'macOS','apple_macOS');

-- insert inventory
INSERT INTO inventory (inventory_id, item_id, quantity, price, supplier_id, record_date) 
VALUES (0, 0, 10, 9.99, 1, NOW()); 
VALUES (1, 1, 20, 99.99, 2, NOW()); 
VALUES (2, 2, 5, 49.99, 0, NOW());

INSERT INTO inventory (item_id, supplier_id, quantity, price, last_restock_date)
VALUES (0, 0, 10, 9.99, 1, NOW());



