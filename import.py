import psycopg2

# connect to the database
conn = psycopg2.connect("postgresql://assure:testing@localhost/assure")
cur = conn.cursor()

# create tables if they do not exist
cur.execute("""
    CREATE TABLE IF NOT EXISTS employees (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(255)
    )
""")
cur.execute("""
    CREATE TABLE IF NOT EXISTS suppliers (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(255)
    )
""")
cur.execute("""
    CREATE TABLE IF NOT EXISTS manufacturers (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(255)
    )
""")
cur.execute("""
    CREATE TABLE IF NOT EXISTS inventory (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        description TEXT,
        manufacturer_id INTEGER REFERENCES manufacturers(id)
    )
""")

# insert employee data
while True:
    print("Please enter employee first name")
    emp_first_name = input()
    print("Please enter employee last name")
    emp_last_name = input()
    print("Please enter employee email")
    emp_email = input()
    print("Please enter employee phone number")
    emp_phone = input()
    # Assuming there's an "employees" table with an "id" column as primary key
cur.execute("""
    INSERT INTO employees (employee_id, first_name, last_name, email, phone)
    VALUES (%s, %s, %s, %s, %s)
    RETURNING id;
""", (employee_id, first_name, last_name, email, phone))

emp_id = cur.fetchone()[0]
print(f"Employee submitted: ID {emp_id}")

# close database connection
cur.close()
conn.close()
