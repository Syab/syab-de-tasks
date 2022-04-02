#!/usr/bin/python
import psycopg2
import os

# Dictionary of DBs and mock data file source
db_files = {
    'car_manufacturer' : './DATA/manufacturers.csv',
    'car_model' : './DATA/models.csv',
    'salesperson' : './DATA/salespersons.csv',
    'customer' : './DATA/customers.csv',
    'car_transaction' : './DATA/transactions.csv',
}

# Connect to DB
conn = psycopg2.connect(
   database="postgres", 
   user='postgres', 
   password='postgrespw', 
   host='127.0.0.1', 
   port= '5432'
)

conn.autocommit = True
cursor = conn.cursor()

for i in db_files:
    print(i, db_files[i])
    with open(db_files[i], 'r') as f :
        next(f)
        cursor.copy_from(f, i, sep=',')


#Fetching 1st row from the table
# result = cursor.fetchall();
# print(result)

#Closing the connection
conn.close()