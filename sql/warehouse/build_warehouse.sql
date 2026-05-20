-- =========================================
-- RETAIL DATA WAREHOUSE - STAR SCHEMA
-- OLIST BRAZILIAN E-COMMERCE DATASET
-- =========================================

-- Create schema
CREATE SCHEMA IF NOT EXISTS warehouse;

-- =========================================
-- FACT TABLE
-- =========================================
DROP TABLE IF EXISTS warehouse.fact_orders;

CREATE TABLE warehouse.fact_orders AS
SELECT
    o.order_id,
    oi.order_item_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,

    o.order_purchase_timestamp AS order_date,

    oi.price,
    oi.freight_value,

    (oi.price + oi.freight_value) AS total_value

FROM public.stg_orders o
JOIN public.stg_order_items oi
    ON o.order_id = oi.order_id;


-- =========================================
-- DIMENSION: CUSTOMERS
-- =========================================
DROP TABLE IF EXISTS warehouse.dim_customers;

CREATE TABLE warehouse.dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM public.stg_customers;


-- =========================================
-- DIMENSION: PRODUCTS
-- =========================================
DROP TABLE IF EXISTS warehouse.dim_products;

CREATE TABLE warehouse.dim_products AS
SELECT DISTINCT
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM public.stg_products;


-- =========================================
-- DIMENSION: SELLERS
-- =========================================
DROP TABLE IF EXISTS warehouse.dim_sellers;

CREATE TABLE warehouse.dim_sellers AS
SELECT DISTINCT
    seller_id,
    seller_city,
    seller_state
FROM public.stg_sellers;


-- =========================================
-- DIMENSION: DATE (FIXED TYPE ISSUE)
-- =========================================
DROP TABLE IF EXISTS warehouse.dim_date;

CREATE TABLE warehouse.dim_date AS
SELECT DISTINCT
    DATE(order_purchase_timestamp::timestamp) AS date,

    EXTRACT(YEAR FROM order_purchase_timestamp::timestamp) AS year,
    EXTRACT(MONTH FROM order_purchase_timestamp::timestamp) AS month,
    EXTRACT(DAY FROM order_purchase_timestamp::timestamp) AS day,

    TO_CHAR(order_purchase_timestamp::timestamp, 'Day') AS weekday

FROM public.stg_orders;