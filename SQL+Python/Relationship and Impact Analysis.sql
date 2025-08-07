---------------------------------------------------------------------
--Relationship and Impact Analysis--
---------------------------------------------------------------------
SELECT* FROM customer_loyalty;
SELECT* FROM customers;
SELECT* FROM loyalty_programs;
SELECT* FROM products;
SELECT* FROM stores;
SELECT* FROM transactions;

--Loyalty Members Vs Non-Members Business value
SELECT 'Loyalty' AS customer_type,
	COUNT(DISTINCT t.customer_id) AS no_of_customers,
	ROUND(SUM(t.amount),2) AS num_customers,
	ROUND(SUM(t.amount)/COUNT(DISTINCT t.customer_id),2) AS Avg_order_value,
	ROUND(COUNT(*) *1.0/COUNT(DISTINCT t.customer_id),2) AS avg_orders
FROM transactions t
JOIN customer_loyalty cl
ON t.customer_id = cl.customer_id
UNION ALL
SELECT 'Non-Loyalty',
	COUNT(DISTINCT t.customer_id),
	ROUND(SUM(t.amount),2),
	ROUND(SUM(t.amount)/COUNT(DISTINCT t.customer_id),2),
	ROUND(COUNT(*) *1.0/COUNT(DISTINCT t.customer_id),2)
FROM transactions t
WHERE t.customer_id NOT IN (SELECT customer_id FROM customer_loyalty)

-- Tier-Wise Customer Behavior
SELECT cl.tier,
	COUNT(DISTINCT t.customer_id) AS no_of_customers,
	ROUND(SUM(t.amount),2) AS total_spend,
	ROUND(SUM(t.amount)/COUNT(DISTINCT t.customer_id),2) AS avg_spend,
	ROUND(COUNT(*) FILTER (WHERE cl.active_status = 'No') *100.0/COUNT(*),2) AS churn_rate
FROM customer_loyalty cl
JOIN transactions t
ON cl.customer_id = t.customer_id
GROUP BY 1
ORDER BY 4 DESC

--Loyalty Duration VS spend
SELECT
	CASE WHEN AGE(NOW(), cl.enrollment_date) < INTERVAL '1 year' THEN '0-1 Year'
	WHEN AGE(NOW(), cl.enrollment_date) < INTERVAL '3 years' THEN '1-3 Years'
	WHEN AGE(NOW(), cl.enrollment_date) < INTERVAL '5 years' THEN '3-5 Years'
	ELSE '5+ Years'
	END AS duration_group,
	COUNT(DISTINCT cl.customer_id) AS customers,
	ROUND(SUM(t.amount)/COUNT(DISTINCT cl.customer_id),2) AS avg_clv
FROM customer_loyalty cl
JOIN transactions t
ON cl.customer_id=t.customer_id
GROUP BY 1
ORDER BY 1

--Churn Detection
SELECT tier,
	COUNT(*) AS churned_customers,
	ROUND(AVG(churn_date - enrollment_date),0) AS avg_days_until_churn
FROM customer_loyalty
WHERE active_status = 'No'
GROUP BY tier
ORDER BY 2 DESC