SELECT
    product_id,
    SUM(total_value) AS revenue,
    COUNT(*) AS sales_count
FROM {{ ref('fact_orders') }}
GROUP BY product_id
ORDER BY revenue DESC