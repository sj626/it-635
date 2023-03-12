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

# Query the database and create a Pandas DataFrame
df = pd.read_sql_query("SELECT * FROM inventory", conn)

# Write the DataFrame to an Excel file
df.to_excel("/path/to/Desktop/assure.xlsx", index=False)

# Close the database connection
conn.close()
                  
