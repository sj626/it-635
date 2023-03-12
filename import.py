import psycopg2

# connect to the database
conn = psycopg2.connect("postgresql://assure:testing@localhost/assure")
cur = conn.cursor()

# insert employee data
while True:
    print("Please enter employee name")
    emp_name = input()
    print("Please enter hourly rate")
    emp_hourly_rate = input()
    print("PLease enter employee id")
    emp_id = input()
    cur.execute("""
        INSERT INTO employees (employee_id, hourly_rate, employee_name)
        VALUES (%s, %s, %s)
        RETURNING employee_id;
    """, (emp_id, emp_hourly_rate, emp_name))

    emp_id = cur.fetchone()[0]
    print(f"Employee submitted: ID {emp_id}")

    # Ask user if they want to enter another employee
    print("Do you want to enter another employee? (y/n)")
    response = input().lower()
    if response != "y":
        break

# close database connection
cur.close()
conn.close()
