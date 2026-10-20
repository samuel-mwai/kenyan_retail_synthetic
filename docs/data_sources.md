# Data Sources and Licensing

## Synthetic retail data
All transaction, customer, product, store, price, cost, promotion, and payment records are generated for this educational project. They do not represent real Kenyan businesses or consumers.

- Generation method: Python, pandas, NumPy
- Random seed for the initial snapshot: `42`
- Coverage: 2024-01-01 to 2025-12-31
- Licence: intended for release under MIT, provided a matching `LICENSE` file is added to the repository.
- Product prices and costs are illustrative, not verified market prices.
- A small number of missing customer IDs, duplicate rows, zero quantities, and negative prices are intentionally included for data-cleaning practice.
- Discounted transaction lines have matching one-day synthetic promotion records in `promotions.csv`.

## Calendar
The holiday list is simulated for practice, not an authoritative Kenyan public-holiday calendar. Verify dates with an authoritative source before real-world use.

## External context
No external datasets are included in this initial version. If KNBS CPI or another external dataset is added, document the exact URL, reporting period, access date, and applicable licence/terms.
