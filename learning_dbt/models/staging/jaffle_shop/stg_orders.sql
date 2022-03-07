
SELECT 
	"ID" as order_id,
	"USER_ID" as user_id,
	"ORDER_DATE"::DATE as order_date,
	"STATUS" as status
FROM {{ source("jaffle_shop","jaffle_shop_orders")}}