---------------------------------------------------------------------
--Exploratory Data Analysis--
---------------------------------------------------------------------

SELECT* FROM customer_loyalty;
SELECT* FROM customers;
SELECT* FROM loyalty_programs;
SELECT* FROM products;
SELECT* FROM stores;
SELECT* FROM transactions;


-- 1. Loyalty enrolment trend over time
SELECT EXTRACT(YEAR FROM enrollment_date) as Year,
	COUNT(*) AS new_enrollments
FROM customer_loyalty
GROUP BY 1
ORDER BY 1

-- 2. Customer Retention trends
SELECT EXTRACT(YEAR FROM enrollment_date) as join_year,
	COUNT(*) FILTER (WHERE active_status = 'Yes') AS still_active,
	COUNT(*) AS total_joined,
	ROUND(COUNT(*) FILTER (WHERE active_status = 'Yes')*100.0/COUNT(*),2) AS retention_rate
FROM customer_loyalty
GROUP BY 1
ORDER BY 1

--3. Compare Loyalty vs Non-Lotalty Behavior
SELECT 'Loyalty' AS group_type,
	COUNT(DISTINCT t.customer_id) AS num_customers,
	ROUND(AVG(t.amount::numeric),2) AS avg_order_value,
	ROUND(COUNT(*) *1.0 /COUNT(DISTINCT t.customer_id),2) AS avg_order_per_customer
FROM transactions t
JOIN customer_loyalty cl
ON t.customer_id = cl.customer_id
UNION ALL
SELECT 'Non-Loyalty',
	COUNT(DISTINCT t.customer_id),
	ROUND(AVG(t.amount::NUMERIC), 2),
	ROUND(COUNT(*) *1.0 /COUNT(DISTINCT t.customer_id),2)
FROM transactions t
WHERE t.customer_id NOT IN (SELECT customer_id FROM customer_loyalty)

--4. Customer Lifetime Value by tier
SELECT cl.tier,	
	ROUND(SUM(t.amount),2) AS total_sale,
	ROUND(AVG(t.amount),2) AS avg_sale,
	ROUND(SUM(t.amount)/ COUNT(DISTINCT t.customer_id),2) as AVG_sales
FROM transactions t
JOIN customer_loyalty cl
ON t.customer_id = cl.customer_id
GROUP BY 1
ORDER BY 4 DESC

--5. Regional Loyalty Penetration
SELECT c.region,
	COUNT(cl.customer_id) AS no_of_customers,
	COUNT(*) as total_customers,
	ROUND(COUNT(cl.customer_id)*100.0/COUNT(*),2) AS percent_penetration
FROM customers c
LEFT JOIN customer_loyalty cl
ON c.customer_id=cl.customer_id
GROUP BY 1

--6. Seasonality of Loyalty Orders
SELECT DATE_TRUNC('month', t.date) as Month,
SUM(t.Amount) as Total_purchase,
COUNT(*) AS total_orders
FROM transactions t
JOIN customer_loyalty cl
ON t.customer_id=cl.customer_id
GROUP BY 1
ORDER BY 1