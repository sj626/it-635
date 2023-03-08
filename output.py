import psycopg2
import pandas as pd

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host="localhost",
    port="5432",
    dbname="assure",
    user="assure",
    password="testing"
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a SELECT statement to retrieve the data
cur.execute("SELECT * FROM employees")
employees = cur.fetchall()

cur.execute("SELECT * FROM suppliers")
suppliers = cur.fetchall()

cur.execute("SELECT * FROM manufacturers")
manufacturers = cur.fetchall()

#cur.execute("SELECT * FROM items")
#items = cur.fetchall()

cur.execute("SELECT * FROM inventory")
inventory = cur.fetchall()

# Print the results
print("Employees:")
for employee in employees:
    print(employee)

print("Suppliers:")
for supplier in suppliers:
    print(supplier)

print("Manufacturers:")
for manufacturer in manufacturers:
    print(manufacturer)

#print("Items:")
#for item in items:
 #   print(item)

print("Inventory:")
for item in inventory:
    print(item)

# Convert the data to a Pandas DataFrame
df_employees = pd.DataFrame(employees, columns=['employee_id', 'first_name', 'last_name', 'email', 'phone_number', 'street_address', 'city', 'state', 'zip_code', 'hire_date'])
df_suppliers = pd.DataFrame(suppliers, columns=['supplier_id', 'name', 'street_address', 'city', 'state', 'contact_name', 'phone_number'])
df_manufacturers = pd.DataFrame(manufacturers, columns=['manufacturer_id', 'name', 'street_address', 'city', 'state', 'zip', 'phone'])
#df_items = pd.DataFrame(items, columns=['item_id', 'name', 'description', 'manufacturer_id'])
df_inventory = pd.DataFrame(inventory, columns=['inventory_id', 'item_id', 'quantity', 'price', 'supplier_id', 'date_added'])

# Write the data to an Excel file
with pd.ExcelWriter('assure_data.xlsx') as writer:
    df_employees.to_excel(writer, sheet_name='employees', index=False)
    df_suppliers.to_excel(writer, sheet_name='suppliers', index=False)
    df_manufacturers.to_excel(writer, sheet_name='manufacturers', index=False)
    #df_items.to_excel(writer, sheet_name='items', index=False)
    df_inventory.to_excel(writer, sheet_name='inventory', index=False)

# Close the cursor and database connection
cur.close()
conn.close()
                                                       
