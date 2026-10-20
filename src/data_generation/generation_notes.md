# Synthetic Data Generation Notes

The initial dataset snapshot was generated using Python, pandas, and NumPy with random seed `42`.

- 8 fictional stores across Nairobi, Kiambu, Nakuru, Mombasa, and Kisumu.
- 100 illustrative products across 5 categories.
- 6,000 synthetic customers.
- Daily dates from 2024-01-01 through 2025-12-31.
- Sales quantities reflect simulated product demand, store scale, weekday/month seasonality, a mild trend, random noise, and holiday multipliers.
- Discounts and payment methods, including M-Pesa, are simulated.
- Discounted transaction lines have matching one-day records in `promotions.csv`.
- A small number of missing customer IDs, duplicate rows, zero quantities, and negative prices are intentionally included.
- The holiday calendar is simulated, not authoritative.

CSV files in `data/raw/` are the generated snapshot. Preserve a full generator script alongside these files if exact recreation from source code is required.
