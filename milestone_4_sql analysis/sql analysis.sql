CREATE SCHEMA kenya_retail_synthetic;
set search_path to kenya_retail_synthetic;
show search_path;

CREATE table sales_validated (
    transaction_id TEXT,
    transaction_date DATE,
    store_id TEXT,
    product_id TEXT,
    customer_id TEXT,
    quantity INTEGER,
    unit_price_kes NUMERIC(12,2),
    discount_rate NUMERIC(5,2),
    selling_price_kes NUMERIC(12,2),
    payment_method TEXT,
    promotion_id TEXT
);

SELECT *
FROM sales_validated;

CREATE TABLE products_cleaned (
    product_id TEXT,
    product_name TEXT,
    category TEXT,
    regular_price_kes NUMERIC(12,2),
    unit_cost_kes NUMERIC(12,2)
);

select * from products_cleaned;

create table customers_cleaned (
    customer_id TEXT,
    registration_date DATE,
    county TEXT,
    customer_segment TEXT,
    loyalty_member TEXT
);

select * from customers_cleaned;

create table stores_cleaned (
    store_id TEXT,
    store_name TEXT,
    county TEXT,
    location_type TEXT,
    opening_date TEXT
);

select *from stores_cleaned;

create table promotions_cleaned (
    promotion_id TEXT,
    store_id TEXT,
    product_id TEXT,
    start_date DATE,
    end_date DATE,
    discount_rate NUMERIC(12,2)
);

select *from promotions_cleaned;

CREATE table calendar_cleaned (
    date DATE,
    year INTEGER,
    month INTEGER,
    month_name TEXT,
    quarter INTEGER,
    day_of_week TEXT,
    is_weekend BOOLEAN,
    is_public_holiday_simulated BOOLEAN,
    holiday_name_simulated TEXT
);

select *from calendar_cleaned;

---Finding which product category generates the highest revenue
SELECT
    p.category,
    SUM(s.quantity * s.selling_price_kes) AS total_revenue_kes
FROM sales_validated AS s
JOIN products_cleaned AS p
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue_kes DESC;

--staples generates the highest revenue, at approximately KES 254.6 million, while Household generates the lowest, at approximately KES 71.8 million.
--Business implication: The supermarket could prioritize monitoring stock availability for Staples because of its high revenue contribution.

---finding which product generates the highest revenue

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(s.quantity * s.selling_price_kes) AS total_revenue_kes
FROM sales_validated AS s
JOIN products_cleaned AS p
    ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_revenue_kes DESC
LIMIT 10;
--Milk Powder 400g is the highest-revenue product, generating approximately KES 27.57 million. Staples accounts for six of the top ten products.
--Business implication: The supermarket could closely monitor the availability of these high-revenue products to reduce the risk of lost sales. Further analysis of profit margins and stock levels would help determine inventory priorities.

---Which stores generate the highest revenue?

SELECT
    st.store_id,
    st.store_name,
    st.county,
    SUM(s.quantity * s.selling_price_kes) AS total_revenue_kes
FROM sales_validated AS s
JOIN stores_cleaned AS st
    ON s.store_id = st.store_id
GROUP BY
    st.store_id,
    st.store_name,
    st.county
ORDER BY total_revenue_kes DESC;
--Nairobi Central generates the highest revenue, approximately KES 127.44 million.
--Westlands Market is second, at approximately KES 116.94 million.
--Naivasha Fresh generates the lowest revenue, approximately KES 73.51 million.

---Which payment methods are used most frequently, and how much revenue does each generate?
SELECT
    payment_method,
    COUNT(*) AS number_of_sales,
    SUM(quantity * selling_price_kes) AS total_revenue_kes
FROM sales_validated
GROUP BY payment_method
ORDER BY number_of_sales DESC;
--M-Pesa dominates: It accounts for approximately 62.9% of all sales records and generates about KES 487.59 million in revenue.
--Cash is second: It generates approximately KES 170.04 million.
--Other payment methods have the fewest sales records, at 16,783.

---Which customers generate the highest total revenue?

---Rank products within each category
SELECT
    p.category,
    p.product_id,
    p.product_name,
    SUM(s.quantity * s.selling_price_kes) AS total_revenue_kes,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(s.quantity * s.selling_price_kes) DESC
    ) AS category_rank
FROM sales_validated AS s
JOIN products_cleaned AS p
    ON s.product_id = p.product_id
GROUP BY
    p.category,
    p.product_id,
    p.product_name
ORDER BY
    p.category,
    category_rank;
--dairy and eggs are the highest ranking category

---Customer cohort analysis
SELECT *
FROM customers_cleaned
LIMIT 5;


WITH customer_cohorts AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', registration_date)::date AS cohort_month
    FROM customers_cleaned
    WHERE registration_date IS NOT NULL
),
customer_activity AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', transaction_date)::date AS activity_month
    FROM sales_validated
    WHERE customer_id IS NOT NULL
    GROUP BY
        customer_id,
        DATE_TRUNC('month', transaction_date)::date
)
SELECT
    cc.cohort_month,
    ca.activity_month,
    COUNT(DISTINCT cc.customer_id) AS active_customers
FROM customer_cohorts AS cc
JOIN customer_activity AS ca
    ON cc.customer_id = ca.customer_id
WHERE ca.activity_month >= cc.cohort_month
GROUP BY
    cc.cohort_month,
    ca.activity_month
ORDER BY
    cc.cohort_month,
    ca.activity_month;

---RFM customer segmentation
WITH customer_rfm AS (
    SELECT
        customer_id,
        MAX(transaction_date) AS last_purchase_date,
        CURRENT_DATE - MAX(transaction_date) AS recency_days,
        COUNT(*) AS frequency,
        SUM(quantity * selling_price_kes) AS monetary_value
    FROM sales_validated
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT
    customer_id,
    last_purchase_date,
    recency_days,
    frequency,
    ROUND(monetary_value, 2) AS monetary_value
FROM customer_rfm
ORDER BY monetary_value DESC
LIMIT 10;



---How are customers distributed across RFM segments?
WITH reference_date AS (
    SELECT MAX(transaction_date) AS analysis_date
    FROM sales_validated
),
customer_rfm AS (
    SELECT
        s.customer_id,
        rd.analysis_date - MAX(s.transaction_date) AS recency_days,
        COUNT(*) AS frequency,
        SUM(s.quantity * s.selling_price_kes) AS monetary_value
    FROM sales_validated AS s
    CROSS JOIN reference_date AS rd
    WHERE s.customer_id IS NOT NULL
    GROUP BY s.customer_id, rd.analysis_date
),
rfm_scores AS (
    SELECT
        *,
        NTILE(4) OVER (ORDER BY recency_days DESC) AS recency_score,
        NTILE(4) OVER (ORDER BY frequency ASC) AS frequency_score,
        NTILE(4) OVER (ORDER BY monetary_value ASC) AS monetary_score
    FROM customer_rfm
),
segmented_customers AS (
    SELECT
        CASE
            WHEN recency_score >= 3
                 AND frequency_score >= 3
                 AND monetary_score >= 3
                THEN 'High Value'
            WHEN recency_score >= 3
                 AND frequency_score >= 3
                THEN 'Loyal'
            WHEN recency_score <= 2
                 AND frequency_score <= 2
                THEN 'At Risk'
            ELSE 'Regular'
        END AS customer_segment
    FROM rfm_scores
)
SELECT
    customer_segment,
    COUNT(*) AS number_of_customers
FROM segmented_customers
GROUP BY customer_segment
ORDER BY number_of_customers DESC;

SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS rows_with_customer_id,
    COUNT(*) - COUNT(customer_id) AS rows_without_customer_id
FROM sales_validated;

SELECT
    COUNT(DISTINCT s.customer_id) AS unique_sales_customers,
    COUNT(DISTINCT c.customer_id) AS matched_customers,
    COUNT(DISTINCT s.customer_id)
      - COUNT(DISTINCT c.customer_id) AS unmatched_customers
FROM sales_validated AS s
LEFT JOIN customers_cleaned AS c
    ON s.customer_id = c.customer_id;

SELECT DISTINCT s.customer_id
FROM sales_validated AS s
LEFT JOIN customers_cleaned AS c
    ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT
    'sales_validated' AS source_table,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM sales_validated

UNION ALL

SELECT
    'customers_cleaned' AS source_table,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customers_cleaned;

---How does monthly revenue change over time?

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', transaction_date)::date AS sales_month,
        SUM(quantity * selling_price_kes) AS revenue_kes
    FROM sales_validated
    GROUP BY DATE_TRUNC('month', transaction_date)::date
),
revenue_comparison AS (
    SELECT
        sales_month,
        revenue_kes,
        LAG(revenue_kes) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT
    sales_month,
    ROUND(revenue_kes, 2) AS revenue_kes,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(
        100.0 * (revenue_kes - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS month_on_month_change_pct
FROM revenue_comparison
ORDER BY sales_month;
--Highest monthly revenue: December 2025, at KES 46.44 million.
--Largest monthly increase shown: December 2025, up 23.40% from November.
--Largest monthly decrease shown: January 2025, down 26.95% from December 2024.
--Growth across the two Decembers: Revenue rose from KES 40.67 million in December 2024 to KES 46.44 million in December 2025 — an increase of approximately 14.2%.



