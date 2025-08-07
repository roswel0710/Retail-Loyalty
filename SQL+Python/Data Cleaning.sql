---------------------------------------------------------------------
--DATA CLEANING AND VALIDATION--
---------------------------------------------------------------------
SELECT* FROM customer_loyalty;
SELECT* FROM customers;
SELECT* FROM loyalty_programs;
SELECT* FROM products;
SELECT* FROM stores;
SELECT* FROM transactions;

--Customer_loyalty table
SELECT customer_id, loyalty_program_id, enrollment_date, tier, active_status, churn_date,
COUNT(*) As count
FROM customer_loyalty
GROUP BY 1,2,3,4,5,6
HAVING COUNT(*) >1

--Handling Null or Missing Values
SELECT * FROM customers WHERE loyalty_status IS NULL;

UPDATE customers
SET loyalty_status = 'Inactive'
WHERE loyalty_status IS NULL

SELECT COUNT(*) FROM products WHERE price IS NULL;

--Cast Column types
SELECT* FROM products;
SELECT* FROM transactions; 

ALTER TABLE products
ALTER COLUMN price TYPE NUMERIC USING price::NUMERIC;

ALTER TABLE transactions
ALTER COLUMN amount TYPE NUMERIC USING amount::NUMERIC;

--Detect Imvalid Formats
SELECT* FROM customers
WHERE email !~* '^[A-Z0-9._%+]+@[A-Z0-9.-]+\.[A-Z]{2,}$'

--Normalize text values
UPDATE customers
SET region = INITCAP(TRIM(region))

UPDATE customers
SET gender = 'Other'
WHERE gender NOT IN ('Male','Female','Other');

--Identify and Validate Outliers
SELECT *
FROM products
WHERE price <0 OR price >10000

-- Check dates
SELECT* FROM customer_loyalty cl
JOIN customers c 
ON cl.customer_id = c.customer_id
WHERE cl.churn_date < c.join_date

--Deleting rows with invalid churn dates
DELETE FROM customer_loyalty cl
USING customers c
WHERE cl.customer_id = c.customer_id
	AND cl.churn_date IS NOT NULL
	AND cl.churn_date < c.join_date
