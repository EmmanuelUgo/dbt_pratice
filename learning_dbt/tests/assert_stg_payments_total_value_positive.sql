
WITH payments AS(

    SELECT *
    FROM {{ ref('stg_stripe_payments') }}
)

SELECT 
	order_id,
	sum(amount) as total_amount
FROM payments
group by 1
having sum(amount) < 0