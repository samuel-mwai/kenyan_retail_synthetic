# Milestone 2: Data Cleaning and Preparation

## Project Overview

This milestone prepares synthetic Kenyan supermarket sales data for
demand forecasting. The dataset covers transactions from **1 January
2024 to 31 December 2025**.

The goal is to inspect data quality, validate sales records, and create
reliable datasets for forecasting.

## Objectives

-   Inspect missing values and duplicate records.
-   Standardize column names, data types, and text values where needed.
-   Identify invalid sales records and validate essential fields.
-   Aggregate sales into daily demand datasets.
-   Prepare a baseline forecast and evaluation metrics.

## Data Quality Checks and Preparation

The work included checks for:

-   Missing customer and promotion IDs.
-   Exact duplicate sales rows and repeated transaction IDs.
-   Invalid quantities and unit prices.
-   Transaction dates and essential sales fields.
-   Consistency between recorded prices and calculated selling prices.

Missing customer or promotion IDs are not automatically treated as
invalid sales records; decisions should depend on the meaning of the
fields. Calendar records with no holiday name may represent ordinary
days rather than missing essential data.

The validated sales dataset contained **555,731 rows**, with dates
ranging from **2024-01-01 to 2025-12-31**, and no missing values in the
checked essential fields.

## Forecasting Preparation

Daily demand was aggregated by transaction date. Time-related features
and calendar information were also prepared for later forecasting work.

Expected processed outputs, when generated, include:

-   `sales_validated.csv` --- validated sales records.
-   `daily_total.csv` --- total demand aggregated by date.
-   `daily_demand.csv` --- demand aggregated by date, store, and
    product.
-   `demand_features.csv` --- demand data with time-related features.
-   `baseline_forecast_results.csv` --- actual versus predicted demand
    for baseline evaluation.
-   `baseline_forecast_metrics.csv` --- baseline MAE and RMSE metrics.

Only include output files in the repository if they have actually been
generated and are intended to be tracked.

## Baseline Evaluation

The initial benchmark uses a weekly seasonal-naive forecast: demand from
the previous week is used as the prediction. Performance is assessed
using:

-   **MAE (Mean Absolute Error):** average absolute difference between
    actual and predicted demand.
-   **RMSE (Root Mean Squared Error):** prediction error metric that
    penalizes larger errors more heavily.

The baseline provides a benchmark for comparison with more advanced
models, such as Random Forest regression. The evaluation should use a
time-ordered test period and confirm that dates are continuous before
interpreting a seven-row lag as seven calendar days.

## Tools

-   Python
-   Pandas and NumPy
-   Scikit-learn
-   Jupyter Notebook
-   Git and GitHub

## Next Steps

1.  Review the baseline forecast metrics.
2.  Train a more advanced forecasting model using a time-aware
    train/test split.
3.  Compare models using the same evaluation period and metrics.
4.  Document findings and limitations.
