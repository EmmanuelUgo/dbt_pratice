WITH payment AS(
    SELECT *
    FROM {{ ref('stg_stripe_payments') }}
)

SELECT *
FROM payment
WHERE created < '2017-01-01'