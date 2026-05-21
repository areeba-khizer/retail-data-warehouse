SELECT
    customer_id,
    SUM(total_value) AS lifetime_value,
    COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('fact_orders') }}
GROUP BY customer_id
ORDER BY lifetime_value DESC