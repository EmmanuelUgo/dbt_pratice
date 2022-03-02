
SELECT 
	index as index,
	"ID" as id,
	"USER_ID" as user_id,
	"ORDER_DATE"::DATE as order_date,
	"STATUS" as status
FROM {{ source("sources","jaffle_shop_orders")}}