SELECT
    DATE_TRUNC('month', order_date::timestamp) AS month,
    SUM(total_value) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('fact_orders') }}
GROUP BY 1
ORDER BY 1