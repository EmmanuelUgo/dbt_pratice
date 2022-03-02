WITH customers AS(
	SELECT 
		id,
		first_name,
		last_name
	FROM {{ ref('stg_customers') }}),
	
	orders AS (
	SELECT 
		id,
		user_id,
		order_date,
		status
	FROM {{ ref('stg_orders') }}),
	
	customer_data AS (
	SELECT 
		user_id,
		min(order_date) as first_order_date,
		max(order_date) as recent_order_date,
		count(order_date) as number_of_orders
	FROM orders
	GROUP BY 1)
	
SELECT 
	c.id,
	c.first_name,
	c.last_name,
	cd.first_order_date,
	cd.recent_order_date,
	COALESCE(cd.number_of_orders,0)
FROM customers c
LEFT JOIN customer_data cd
ON c.id = cd.user_id