-- Create Car Manufacturer
CREATE TABLE IF NOT EXISTS CAR_MANUFACTURERS (
  manufacturer_id INT NOT NULL,
  manufacturer_name VARCHAR(250) NOT NULL,
  PRIMARY KEY (manufacturer_id)
);

-- Create Car Model
CREATE TABLE IF NOT EXISTS CAR_MODELS (
    model_id INT NOT NULL,
    model_name VARCHAR(250) NOT NULL,
    manufacturer_id INT NOT NULL,
    car_weight FLOAT NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (model_id),
    CONSTRAINT fk_manufacturers FOREIGN KEY(manufacturer_id) REFERENCES CAR_MANUFACTURERS(manufacturer_id)
);

-- Create Customer
CREATE TABLE IF NOT EXISTS CUSTOMERS (
  customer_id INT NOT NULL,
  customer_name VARCHAR(250) NOT NULL,
  customer_phone_number INT NOT NULL,
  PRIMARY KEY (customer_id)
);

-- Create Salesperson
CREATE TABLE IF NOT EXISTS SALESPERSONS (
  salesperson_id INT NOT NULL,
  salesperson_name VARCHAR(250) NOT NULL,
  PRIMARY KEY (salesperson_id)
);

-- Create Car
-- CREATE TABLE IF NOT EXISTS CAR (
--     car_id INT NOT NULL,
--     model_id INT NOT NULL,
--     manufacturer_id INT NOT NULL,
--     PRIMARY KEY (car_id),
--     CONSTRAINT fk_model FOREIGN KEY(model_id) REFERENCES CAR_MODEL(model_id),
--     CONSTRAINT fk_manufacturer FOREIGN KEY(manufacturer_id) REFERENCES CAR_MANUFACTURER(manufacturer_id)
-- );

-- Create Car Transaction
CREATE TABLE IF NOT EXISTS CAR_TRANSACTIONS (
   transaction_id BIGINT NOT NULL,
   customer_id INT NOT NULL,
   salesperson_id INT NOT NULL,
   model_id INT NOT NULL,
   serial_no VARCHAR(250) NOT NULL,
   PRIMARY KEY (transaction_id),
   CONSTRAINT fk_models FOREIGN KEY(model_id) REFERENCES CAR_MODELS(model_id),
   CONSTRAINT fk_customers FOREIGN KEY(customer_id) REFERENCES CUSTOMERS(customer_id),
   CONSTRAINT fk_salespersons FOREIGN KEY(salesperson_id) REFERENCES SALESPERSONS(salesperson_id)
);
