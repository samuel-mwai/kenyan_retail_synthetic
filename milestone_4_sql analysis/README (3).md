# SQL Business Analysis --- Kenyan Retail Capstone

## Objective

Use PostgreSQL to analyze synthetic supermarket sales data and answer
business questions related to revenue, product performance, store
performance, customer behavior, and monthly sales trends.

## Tables Used

-   `sales_validated`
-   `products_cleaned`
-   `customers_cleaned`
-   `stores_cleaned`
-   `promotions_cleaned`
-   `calendar_cleaned`

## Business Questions and Findings

### 1. Revenue by Product Category

Staples generated the highest revenue at approximately KES 254.57
million, followed by Dairy & Eggs at KES 197.84 million. Household
generated the lowest revenue among the reported categories.

### 2. Top 10 Products by Revenue

Milk Powder 400g was the highest-revenue product at approximately KES
27.57 million. Staples products featured prominently among the top 10
products.

### 3. Revenue by Store

Nairobi Central generated the highest revenue at approximately KES
127.44 million. Naivasha Fresh generated the lowest revenue among the
eight stores, at approximately KES 73.51 million.

### 4. Sales by Payment Method

M-Pesa accounted for the largest number of sales records and the highest
recorded revenue, approximately KES 487.59 million.

### 5. Product Ranking Within Categories

The `RANK()` window function ranked products by revenue within each
category. The leading products were:

-   **Dairy & Eggs:** Milk Powder 400g --- KES 27.57 million
-   **Fresh Produce:** Mangoes 1kg --- KES 19.29 million
-   **Household:** Laundry Detergent 1kg --- KES 9.33 million
-   **Personal Care:** Baby Diapers 20pk --- KES 11.86 million
-   **Staples:** Sugar 2kg --- KES 27.28 million

### 6. Customer Cohort Analysis

Customers were grouped by registration month and analyzed by their
monthly purchasing activity. Sales records cover January 2024 through
December 2025, limiting observed purchasing activity to that period. The
analysis reports active customer counts by cohort and activity month; it
does not calculate retention percentages.

### 7. RFM Customer Segmentation

Customers were segmented using recency, frequency, and monetary value.
The preliminary segment counts were:

-   Regular: 2,508
-   At Risk: 1,747
-   High Value: 1,276
-   Loyal: 470

**Validation note:** These counts total 6,001, while `customers_cleaned`
contains 6,000 customer records. Verify this discrepancy before treating
the segment counts as final.

### 8. Monthly Revenue Trends

Monthly revenue peaked at approximately KES 46.44 million in December
2025. Revenue increased by 23.40% from November to December 2025 and
fell by 26.95% from December 2024 to January 2025.

## SQL Techniques Demonstrated

-   `JOIN`
-   `GROUP BY` and aggregate functions
-   Common table expressions (`WITH`)
-   Window functions: `RANK()`, `LAG()`, and `NTILE()`
-   Customer cohort analysis
-   RFM segmentation

## Limitations

-   The data is synthetic and represents an educational scenario.
-   Revenue is not the same as profit.
-   Customer segments depend on the chosen scoring and classification
    rules.
-   Monthly revenue changes require further investigation before
    assigning causes.
-   The RFM customer-count discrepancy must be resolved before final
    reporting.

## Tools

PostgreSQL and DBeaver.
