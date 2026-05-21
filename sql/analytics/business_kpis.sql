-- =========================================
-- BUSINESS KPI LAYER
-- =========================================

CREATE SCHEMA IF NOT EXISTS analytics;

-- =========================================
-- MONTHLY REVENUE TREND
-- =========================================
DROP VIEW IF EXISTS analytics.monthly_revenue;

CREATE VIEW analytics.monthly_revenue AS
SELECT
    DATE_TRUNC('month', order_date::timestamp) AS month,
    ROUND(SUM(total_value)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM warehouse.fact_orders
GROUP BY 1
ORDER BY 1;


-- =========================================
-- TOP PRODUCTS BY REVENUE
-- =========================================
DROP VIEW IF EXISTS analytics.top_products;

CREATE VIEW analytics.top_products AS
SELECT
    p.product_category_name,
    ROUND(SUM(f.total_value)::numeric, 2) AS revenue,
    COUNT(*) AS total_sales
FROM warehouse.fact_orders f
JOIN warehouse.dim_products p
    ON f.product_id = p.product_id
GROUP BY 1
ORDER BY revenue DESC;


-- =========================================
-- TOP SELLERS
-- =========================================
DROP VIEW IF EXISTS analytics.top_sellers;

CREATE VIEW analytics.top_sellers AS
SELECT
    s.seller_city,
    s.seller_state,
    ROUND(SUM(f.total_value)::numeric, 2) AS revenue,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM warehouse.fact_orders f
JOIN warehouse.dim_sellers s
    ON f.seller_id = s.seller_id
GROUP BY 1,2
ORDER BY revenue DESC;


-- =========================================
-- CUSTOMER LIFETIME VALUE
-- =========================================
DROP VIEW IF EXISTS analytics.customer_ltv;

CREATE VIEW analytics.customer_ltv AS
SELECT
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    ROUND(SUM(f.total_value)::numeric, 2) AS lifetime_value,

    COUNT(DISTINCT f.order_id) AS total_orders

FROM warehouse.fact_orders f
JOIN warehouse.dim_customers c
    ON f.customer_id = c.customer_id

GROUP BY 1,2,3
ORDER BY lifetime_value DESC;


-- =========================================
-- REPEAT CUSTOMERS
-- =========================================
DROP VIEW IF EXISTS analytics.repeat_customers;

CREATE VIEW analytics.repeat_customers AS
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM warehouse.fact_orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;