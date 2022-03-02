
SELECT 
	index as index,
	"ID" as id,
	"ORDERID" as order_id,
	"PAYMENTMETHOD" as payment_method,
	"STATUS" as status,
	"AMOUNT" as amount,
	"CREATED"::DATE as created
FROM {{ source("sources", "stripe_payments") }}