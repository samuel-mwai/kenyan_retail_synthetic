# Milestone 7: Dashboard and Storytelling

## Project
**Kenyan Supermarket Demand Forecasting Dashboard**

## Overview
This milestone turns the Kenyan supermarket demand-forecasting project into a Power BI dashboard for store managers. It brings together sales KPIs, demand trends, product and store comparisons, and a comparison of forecast performance.

The dashboard uses cleaned synthetic supermarket data covering 1 January 2024 to 31 December 2025. Forecast evaluation visuals cover the held-out test period from 19 October to 31 December 2025.

## Dashboard Contents

### KPI Cards
- **Total Quantity Sold** — total quantity across the sales records.
- **Total Sales Revenue (KES)** — quantity multiplied by the selling price per unit, summed across sales records.
- **Number of Transactions** — count of distinct transaction IDs.
- **Average Daily Demand** — average quantity sold per calendar day, using the calendar table.

### Charts
1. **Daily Demand Trend (2024–2025)** — shows how demand changes over time.
2. **Top 10 Best-Selling Products** — compares products by total quantity sold.
3. **Sales Revenue by Store (KES)** — compares sales revenue across stores.
4. **Average Demand by Day of the Week** — highlights differences in demand across weekdays.
5. **Actual Demand vs Forecast (Oct–Dec 2025)** — compares actual daily demand with the weekly seasonal-naive baseline and Random Forest predictions.
6. **Forecast Accuracy Comparison (MAE)** — compares the models' mean absolute errors.

A text box titled **Forecasting Insight** summarizes the main forecasting result.

## Business Questions Answered
1. How much quantity has been sold?
2. What is the total sales revenue in Kenyan shillings?
3. How many unique transactions occurred?
4. What is the average daily demand?
5. How does demand change over time?
6. Which products sell the most?
7. Which stores generate the most sales revenue?
8. Which days of the week have higher average demand?
9. How closely do forecasts match actual demand?
10. Which forecasting model performed better on the test period?

## Key Forecasting Insight
The weekly seasonal-naive baseline performed better than the initial Random Forest model on the held-out test period.

| Model | MAE | RMSE |
|---|---:|---:|
| Weekly seasonal-naive baseline | 467.47 | 692.09 |
| Random Forest | 1,068.59 | 1,143.11 |

Lower MAE and RMSE indicate smaller forecast errors. These results suggest that using demand from seven days earlier was more effective than the calendar features used by the initial Random Forest model for this test period. The baseline is therefore the preferred model of the two for this evaluation, while forecasts should still be reviewed during unusually high-demand periods.

## Data Model
The Power BI model uses the cleaned sales, products, customers, stores, calendar, and promotions tables, along with the exported `forecast_results.csv` file. Relationships connect sales to the relevant dimension tables using their matching IDs and date fields.

The forecast results CSV contains the test-period dates, actual daily demand, baseline predictions, Random Forest predictions, and absolute forecast errors. It is used for the forecast comparison visuals.

## Evidence for Submission
Include the following items in this milestone folder:

- `Kenyan_Supermarket_Dashboard.pbix` — the Power BI report file.
- Screenshots of the dashboard and key visuals.
- This `README.md` — the dashboard purpose, business questions, and main insight.
- A hosted report link, if the report is published and sharing is permitted.

Suggested screenshots:
1. Dashboard overview with KPI cards and main charts.
2. Demand trend and actual-versus-forecast chart.
3. Top products and store revenue comparison.
4. Forecast MAE comparison and written insight.

## Limitations
- The dataset is synthetic and intended for educational analysis, not a representation of actual supermarket transactions.
- Forecast evaluation covers 19 October to 31 December 2025. These results describe historical test performance and should not be treated as a validated forecast for future dates.
- The initial Random Forest model uses calendar-related features and does not include a complete set of demand-history features.
- The baseline performed better in this evaluation, but future testing and model improvements may change the results.
- Revenue calculations assume `selling_price_kes` is the discounted selling price per unit.

## Reproducibility
The dashboard is built in Power BI Desktop using the cleaned data tables and `forecast_results.csv` exported from the Milestone 6 Jupyter notebook. Keep the source data and export files organized with the project so the report can be refreshed when needed.
