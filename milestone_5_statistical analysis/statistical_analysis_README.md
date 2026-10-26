# Statistical Analysis – Kenyan Supermarket Capstone

## 1. Overview

This milestone focuses on using statistical analysis to investigate business questions related to supermarket sales. The analysis uses synthetic transaction data from a fictional Kenyan supermarket chain covering January 2024 to December 2025.

The aim is to identify differences in customer spending and sales performance that could help inform business decisions.

## 2. Objectives

The analysis addresses two main questions:

1. Do sales records paid for using M-Pesa have a higher average sales value than records using other payment methods?
2. Do sales records associated with promotions have a different average sales value from records without promotions?

Hypothesis tests and confidence intervals are used to assess the observed differences.

## 3. Dataset

The analysis uses the cleaned sales dataset containing 555,731 records.

Relevant columns include:

- `transaction_date`: Date of the transaction.
- `quantity`: Quantity sold.
- `selling_price_kes`: Selling price per unit in Kenyan shillings.
- `payment_method`: Payment method used.
- `promotion_id`: Identifier for an associated promotion, where available.
- `discount_rate`: Discount applied to the sale.

Sales value per record is calculated as:

`quantity * selling_price_kes`

## 4. Methodology

Python and pandas were used to prepare and summarise the data. SciPy was used to perform independent-samples Welch's t-tests.

A significance level of 0.05 was used for both tests. The null hypothesis assumes no difference in the population mean sales values between the groups being compared.

### Test 1: M-Pesa vs other payment methods

**Business question:** Do M-Pesa sales records have a higher average sales value than records using other payment methods?

- M-Pesa records: 349,508
- Other payment method records: 206,223
- Mean sales value for M-Pesa: KES 1,395.08
- Mean sales value for other methods: KES 1,388.15
- Difference in means: KES 6.93
- Test statistic: 1.6526
- p-value: 0.0984
- 95% confidence interval for the difference: KES -1.29 to KES 15.15

**Conclusion:** The difference was not statistically significant at the 5% level. There is insufficient evidence to conclude that M-Pesa records have a different average sales value from records using other payment methods.

### Test 2: Promotion vs non-promotion records

**Business question:** Do sales records associated with promotions have a different average sales value from records without promotions?

- Promotion records: 13,899
- Non-promotion records: 541,832
- Mean sales value with promotion: KES 1,433.18
- Mean sales value without promotion: KES 1,391.47
- Difference in means: KES 41.71
- Test statistic: 3.1453
- p-value: 0.00166

**Conclusion:** The difference was statistically significant at the 5% level. Sales records associated with promotions had a higher average sales value by approximately KES 41.71 per record. This association does not prove that promotions caused the increase.

**Note:** Add the promotion test's 95% confidence interval after calculating it.

## 5. Assumption Checks and Limitations

The analysis checked sample sizes, standard deviations, skewness, extreme values, and the presence of repeated customers.

The groups had large sample sizes and relatively similar standard deviations. However, both sales-value distributions were strongly right-skewed, with some high-value records.

The same customers may make multiple purchases, so individual sales records may not be independent. This could affect the reliability of the reported p-values and confidence intervals.

Welch's t-test does not require equal population variances, but it still relies on an appropriate sampling and independence structure. The results should therefore be interpreted cautiously.

The analysis compares sales value per record, not total spending per customer or total sales over time.

## 6. Tools Used

- Python
- pandas
- NumPy
- SciPy
- Jupyter Notebook / VS Code

## 7. Key Findings

- M-Pesa records had a slightly higher average sales value, but the difference was not statistically significant.
- Promotion-associated records had a statistically higher average sales value than non-promotion records.
- Statistical significance does not establish causation.
- Skewness and potentially repeated customer records are important limitations to consider when interpreting the results.

## 8. Reproducibility

The analysis should be run using the cleaned sales dataset and the Python notebook containing the hypothesis tests and assumption checks.

The notebook should include the code for calculating sales value, grouping records, performing tests, checking assumptions, calculating confidence intervals, and producing the conclusions.

## 9. Responsible Interpretation

The dataset is synthetic and represents a fictional supermarket chain. Findings are intended for educational and analytical demonstration and should not be treated as evidence about actual Kenyan supermarket customers.
