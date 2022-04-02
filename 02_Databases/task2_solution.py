#!/usr/bin/python
import psycopg2
import os
import time

start = time.time()
# Dictionary of DBs and mock data file source
db_files = {
    'car_manufacturers' : './DATA/manufacturers.csv',
    'car_models' : './DATA/models.csv',
    'salespersons' : './DATA/salespersons.csv',
    'customers' : './DATA/customers.csv',
    'car_transactions' : './DATA/transactions.csv',
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

try:
    # Populate mock data into tables
    for i in db_files:
        # print(i, db_files[i])
        try:
            with open(db_files[i], 'r') as f :
                next(f)
                cursor.copy_from(f, i, sep=',')
        except (Exception, psycopg2.Error) as error:
            print("Error whole loading data: ", error)

    cursor.execute(
        '''
        select c.customer_id,
        c.customer_name,
        sum(cm.price) as total_spend
        from car_transactions
            inner join customers c on c.customer_id = car_transactions.customer_id
            inner join car_models cm on cm.model_id = car_transactions.model_id
        group by c.customer_id, c.customer_name
        order by total_spend desc;
        '''
    )

    query1_results = cursor.fetchall()
    print("\n")
    print("RESULTS FOR QUERY 1 (FROM HIGHEST SPENDER):")
    for row in query1_results:
        print("customer_id: ", row[0], "| customer_name: ", row[1], "| total_expenditure: ", row[2], "\n")

    cursor.execute(
        '''
        select date_part('month', transaction_date) AS "Month",
        manufacturer_name,
        cm.manufacturer_id,
        count(cm.model_id)
        from car_transactions
        inner join car_models cm on cm.model_id = car_transactions.model_id
        join car_manufacturers c on c.manufacturer_id = cm.manufacturer_id
        where (SELECT date_part('month', transaction_date) AS "Month")
                =
            (SELECT date_part('month', (SELECT current_timestamp)))
        group by "Month", cm.manufacturer_id, manufacturer_name, cm.model_id
        order by count(cm.model_id) desc
        limit 3;
        '''
    )

    query2_results = cursor.fetchall()
    print("RESULTS FOR QUERY 2 (FROM HIGHEST SPENDER):")
    for row in query2_results:
        print("Month: ", row[0], "| model_name: ", row[1], "| model_id: ", row[2], "| count: ", row[3],"\n")

except (Exception, psycopg2.Error) as error:
    print("Some Error: ", error)

finally:
    # closing database connection.
    if conn:
        cursor.close()
        conn.close()
        print("connection closed. End.")

print("Total execution time {0:0.3f} seconds".format(time.time() - start))   