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
    price FLOAT NOT NULL,
    PRIMARY KEY (model_id),
    CONSTRAINT fk_manufacturer FOREIGN KEY(manufacturer_id) REFERENCES CAR_MANUFACTURER(manufacturer_id)
);

-- Create Customer
CREATE TABLE IF NOT EXISTS CUSTOMER (
  customer_id INT NOT NULL,
  customer_name VARCHAR(250) NOT NULL,
  customer_phone_number INT NOT NULL,
  PRIMARY KEY (customer_id)
);

-- Create Salesperson
CREATE TABLE IF NOT EXISTS SALESPERSON (
  salesperson_id INT NOT NULL,
  salesperson_name VARCHAR(250) NOT NULL,
  PRIMARY KEY (salesperson_id)
);

-- Create Car
CREATE TABLE IF NOT EXISTS CAR (
    car_id INT NOT NULL,
    model_id INT NOT NULL,
    manufacturer_id INT NOT NULL,
    PRIMARY KEY (car_id),
    CONSTRAINT fk_model FOREIGN KEY(model_id) REFERENCES CAR_MODEL(model_id),
    CONSTRAINT fk_manufacturer FOREIGN KEY(manufacturer_id) REFERENCES CAR_MANUFACTURER(manufacturer_id)
);

-- Create Car Transaction
CREATE TABLE IF NOT EXISTS CAR_TRANSACTION (
   transaction_id INT NOT NULL,
   serial_no INT NOT NULL,
   car_id INT NOT NULL,
   customer_id INT NOT NULL,
   salesperson_id INT NOT NULL,
   PRIMARY KEY (transaction_id),
   CONSTRAINT fk_car FOREIGN KEY(car_id) REFERENCES CAR(car_id),
   CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id),
   CONSTRAINT fk_salesperson FOREIGN KEY(salesperson_id) REFERENCES SALESPERSON(salesperson_id)
);
