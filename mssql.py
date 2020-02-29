import pyodbc
from pyodbc import Error

for driver in pyodbc.drivers():
    print(driver)

server = 'localhost\\SQLEXPRESS'
database = 'psi'
username = 'psi'
password = 'psi'
try:
    conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+password)
    cursor = conn.cursor()

    insert_query = """insert into base(base_name, founded) 
                      values(?, ?);"""
    values = ('Pirate Bay', '2043-04-01')
    cursor.execute(insert_query, values)
    conn.commit()

    row = cursor.execute("SELECT * from base;")
    for row in cursor:
        print(row[1])

    
except Error as err:
    print(err)
else:
    conn.close()
finally:
    print('finally...')
