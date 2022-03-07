

SELECT 
	"ID" as user_id,
	"FIRST_NAME" as first_name,
	"LAST_NAME" as last_name
FROM {{ source("jaffle_shop","jaffle_shop_customers") }}
