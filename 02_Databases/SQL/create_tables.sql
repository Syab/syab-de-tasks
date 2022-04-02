-- Create Car Manufacturer
CREATE TABLE IF NOT EXISTS CAR_MANUFACTURER (
  manufacturer_id INT NOT NULL,
  manufacturer_name VARCHAR(250) NOT NULL,
  PRIMARY KEY (manufacturer_id)
);

-- Create Car Model
CREATE TABLE IF NOT EXISTS CAR_MODEL (
  model_id INT NOT NULL,
  model_name VARCHAR(250) NOT NULL,
  manufacturer_id INT NOT NULL,
  car_weight FLOAT NOT NULL,
  price FLOAT NOT NULL
  PRIMARY KEY (model_id),
  CONSTRAINT fk_manufacturer 
  FOREIGN KEY(manufacturer_id) 
  REFERENCES CAR_MANUFACTURER(manufacturer_id)
);

-- Create Car
CREATE TABLE IF NOT EXISTS CAR (
  car_id INT NOT NULL,
  model_id VARCHAR(250) NOT NULL,
  manufacturer_no VARCHAR(250) NOT NULL,
  PRIMARY KEY (car_id)
);

-- Create Customer
CREATE TABLE IF NOT EXISTS CUSTOMER (
  customer_id INT NOT NULL,
  customer_name VARCHAR(250) NOT NULL,
  customer_phone_number INT(9) NOT NULL,
  PRIMARY KEY (customer_id)
);

-- Create Salesperson
CREATE TABLE IF NOT EXISTS SALESPERSON (
  salesperson_id INT NOT NULL,
  salesperson_name VARCHAR(250) NOT NULL,
  PRIMARY KEY (salesperson_id)
);

-- Create Car Transaction
CREATE TABLE IF NOT EXISTS CAR_TRANSACTION (
  transaction_id INT NOT NULL,
  serial_no 
  car_id INT NOT NULL,
  customer_id INT NOT NULL,
  salesperson_id INT NOT NULL,
  PRIMARY KEY (transaction_id)
);
