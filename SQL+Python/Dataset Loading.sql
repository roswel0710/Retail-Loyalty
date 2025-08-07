---------------------------------------------------------------------
--LOADING DATASETS--
---------------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name TEXT,
    email TEXT,
    gender TEXT,
    dob DATE,
    region TEXT,
    join_date DATE,
    loyalty_status TEXT
);

CREATE TABLE loyalty_programs (
    loyalty_program_id INT PRIMARY KEY,
    name TEXT,
    type TEXT,
    enrollment_fee NUMERIC,
    tier_structure TEXT
);

CREATE TABLE customer_loyalty (
    customer_id INT,
    loyalty_program_id INT,
    enrollment_date DATE,
    tier TEXT,
    active_status TEXT,
    churn_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (loyalty_program_id) REFERENCES loyalty_programs(loyalty_program_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category TEXT,
    brand TEXT,
    price TEXT, 
    product_name TEXT
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    location TEXT,
    store_type TEXT,
    open_date DATE
);

CREATE TABLE transactions (
    transaction_id UUID PRIMARY KEY,
    customer_id INT,
    date DATE,
    product_id INT,
    amount TEXT,
    payment_type TEXT,
    store_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

SELECT* FROM customer_loyalty;
SELECT* FROM customers;
SELECT* FROM loyalty_programs;
SELECT* FROM products;
SELECT* FROM stores;
SELECT* FROM transactions;