WITH customers AS(
	SELECT 
		user_id,
		first_name,
		last_name
	FROM {{ ref('stg_customers') }}),
	
	orders AS (
	SELECT 
		order_id,
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
	GROUP BY 1),


	clv as(
	SELECT 
		user_id,
		SUM(amount) as lifetime_value
	FROM {{ ref('fact_orders') }}
	GROUP BY 1)



SELECT 
	c.user_id,
	c.first_name,
	c.last_name,
	cd.first_order_date,
	cd.recent_order_date,
	COALESCE(cd.number_of_orders,0) no_of_orders,
	COALESCE(clv.lifetime_value, 0) lifetime_value
FROM customers c
LEFT JOIN customer_data cd
	ON c.user_id = cd.user_id
LEFT JOIN clv 
	ON c.user_id = clv.user_id
ORDER BY 1