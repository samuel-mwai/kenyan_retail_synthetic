# Kenyan Retail Customer & Sales Intelligence

Individual Data Science and Analytics capstone using synthetic Kenyan supermarket data to explore sales performance, customer purchasing patterns, promotions, and monthly demand forecasting.

> **Data notice:** All records are synthetic and do not represent actual Kenyan retailers or consumers.

## Dataset
- 8 fictional stores across 5 counties
- 100 illustrative products in 5 categories
- 6,000 synthetic customers
- 24 months of daily coverage: 2024-01-01 to 2025-12-31
- Transaction lines with quantities, prices, discounts, payment method, and optional customer IDs
- Store, product, customer, promotion, and calendar tables
- Small documented data-quality issues for cleaning practice

## Files
- `data/raw/sales_transactions.csv` — simulated transaction lines
- `data/raw/customers.csv` — customer dimension
- `data/raw/products.csv` — product catalogue and illustrative prices/costs
- `data/raw/stores.csv` — fictional stores
- `data/raw/promotions.csv` — simulated promotion schedule
- `data/raw/calendar.csv` — date dimension and simulated holiday flags
- `docs/data_dictionary.csv` — field definitions
- `docs/data_sources.md` — provenance and licence notes

## Next steps
1. Profile and document raw data quality.
2. Create a cleaned dataset without overwriting raw files.
3. Load tables into PostgreSQL.
4. Explore sales trends and customer segments.
5. Aggregate monthly demand by store and product.
6. Compare a forecasting model with a seasonal-naive baseline.
7. Build a Power BI dashboard.

## Limitations
Synthetic data supports technical practice but cannot establish actual Kenyan retail demand, current prices, actual promotion effectiveness, or real consumer behaviour. The holiday calendar is not authoritative.
