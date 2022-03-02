

SELECT 
	index as index,
	"ID" as id,
	"FIRST_NAME" as first_name,
	"LAST_NAME" as last_name
FROM {{ source("sources","jaffle_shop_customers") }}
