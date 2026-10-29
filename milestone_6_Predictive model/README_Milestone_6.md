# Milestone 6: Demand Forecasting and Model Evaluation

## Project Overview
This milestone evaluates daily demand forecasting for a fictional Kenyan supermarket chain using synthetic sales data covering **1 January 2024 to 31 December 2025**. The objective is to compare a simple forecasting baseline with a machine-learning model and identify where forecasts make errors.

## Data Preparation
The cleaned sales data was grouped by transaction date, and quantities were summed to create a daily demand dataset with two main columns:

- `transaction_date`: the date of sales
- `daily_quantity`: total quantity sold that day

The daily data was sorted chronologically before modelling.

## External Kenyan Data
Three external datasets were inspected for potential use:

- `kenya_county_population_2019.csv` — county population figures for five counties.
- `table4_core_inflation.csv` — monthly core and non-core inflation data.
- `kenya_public_holidays.csv` — Kenyan public holiday dates and names.

A public-holiday indicator was created from the holiday dataset. The available core inflation data began in December 2024, leaving **335 daily rows without an inflation value**. Missing values were not filled with invented figures, and inflation was excluded from the first model so the full demand history could be evaluated. County population was not used in this chain-wide daily model because it is more suitable for a store- or county-level analysis.

## Forecasting Approach

### Baseline: Weekly Seasonal-Naive
The baseline predicts each day's demand using actual demand from **seven days earlier**. This provides a simple benchmark that can capture recurring weekly demand patterns.

### Model: Random Forest Regressor
A Random Forest regression model was trained using four calendar-based features:

- `day_of_week`
- `month`
- `day_of_month`
- `is_public_holiday`

The target variable was `daily_quantity`. The model did not directly use recent demand values as predictors.

## Train-Test Split
The data was split chronologically rather than randomly:

- **Training set:** 657 days, 1 January 2024–18 October 2025
- **Test set:** 74 days, 19 October 2025–31 December 2025

Both models were evaluated on the same 74 test dates.

## Evaluation Results
Lower MAE and RMSE values indicate better predictive accuracy.

| Model | MAE | RMSE |
|---|---:|---:|
| Weekly seasonal-naive baseline | 467.47 | 692.09 |
| Random Forest | 1,068.59 | 1,143.11 |

The weekly seasonal-naive baseline performed better on both metrics. Its MAE was approximately 467 units, compared with approximately 1,069 units for Random Forest.

## Error Analysis
The 10 largest Random Forest absolute errors showed that the model often underestimated high-demand days, especially in November and December 2025. For example, on 26 December 2025, actual demand was 10,855 units and the Random Forest forecast was 8,138.62 units.

The baseline also made errors, including on some high-demand days, but it had a smaller absolute error than Random Forest on each of the 10 dates examined. Monthly error summaries also showed that the baseline had a lower MAE in October, November, and December 2025.

## Conclusion
For this evaluation period, the weekly seasonal-naive baseline was the preferred forecasting approach because it achieved lower MAE and RMSE than Random Forest. The Random Forest model's calendar-only features did not capture demand variation as effectively as the weekly baseline.

Neither approach predicted every day accurately. A possible next experiment is to add lagged demand features, such as demand from the previous day and seven days earlier, and evaluate the improved model using the same time-aware approach. Any improvement should be verified on appropriate validation data before choosing a final model.

## Reproducibility Notes
- Keep the notebook or script containing the data preparation, feature engineering, model training, evaluation, and error analysis.
- Keep the original external datasets unchanged in the project's external-data folder.
- Save evaluation outputs, such as the metrics table, separately if required by the project.
- Record the date range and split strategy when reporting results.

## Limitations
- The sales data is synthetic and represents a fictional supermarket chain.
- The first Random Forest model uses calendar features but no lagged demand features.
- The inflation dataset covers only December 2024–December 2025, so it was excluded from the first full-period model.
- Results describe this specific test period and should not be assumed to generalize to all future periods.

  ## Model Evaluation Results

The weekly seasonal-naive baseline was compared with a Random Forest model using a 74-day test period from 19 October to 31 December 2025.

| Model | MAE | RMSE |
|---|---:|---:|
| Weekly seasonal-naive baseline | 467.47 | 692.09 |
| Random Forest | 1,068.59 | 1,143.11 |

The weekly seasonal-naive baseline achieved lower MAE and RMSE than the Random Forest model. Therefore, it was the better-performing model on this test period. The results suggest that the more complex model did not improve forecasting accuracy in this evaluation.

These results are based on synthetic supermarket data and should not be interpreted as actual performance for a real supermarket chain.

