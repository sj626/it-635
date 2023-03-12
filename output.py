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
cur.execute("SELECT * FROM assure.employees")
employees = cur.fetchall()

cur.execute("SELECT * FROM assure.inventory")
inventory = cur.fetchall()

cur.execute("SELECT * FROM assure.funds")
funds = cur.fetchall()

cur.execute("SELECT * FROM assure.time_records")
time_records = cur.fetchall()

# Print the results
print("Employees:")
for employee in employees:
    print(employee)

print("Inventory:")
for item in inventory:
    print(item)

print("Funds:")
for fund in funds:
    print(fund)

print("Time Records:")
for record in time_records:
    print(record)

# Convert the data to a Pandas DataFrame
df_employees = pd.DataFrame(employees, columns=['employee_id', 'hourly_rate', 'employee_name'])
df_inventory = pd.DataFrame(inventory, columns=['inventory_id', 'item_name', 'quantity', 'price'])
df_funds = pd.DataFrame(funds, columns=['funds_id', 'amount'])
df_time_records = pd.DataFrame(time_records, columns=['record_id', 'employee_id', 'start_time', 'end_time'])

# Write the data to an Excel file
with pd.ExcelWriter('assure_data.xlsx') as writer:
    df_employees.to_excel(writer, sheet_name='employees', index=False)
    df_inventory.to_excel(writer, sheet_name='inventory', index=False)
    df_funds.to_excel(writer, sheet_name='funds', index=False)
    df_time_records.to_excel(writer, sheet_name='time_records', index=False)

# Close the cursor and database connection
cur.close()
conn.close()
   
