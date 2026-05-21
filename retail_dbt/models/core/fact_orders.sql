WITH source AS (

    SELECT *
    FROM {{ source('warehouse', 'fact_orders') }}

)

SELECT
    order_id,
    order_item_id,
    customer_id,
    product_id,
    seller_id,
    order_date,
    price,
    freight_value,
    (price + freight_value) AS total_value
FROM source