# Milestone 5: Statistical Analysis

## 1. Project Overview

This milestone uses statistical hypothesis testing to examine whether sales value per record differs between selected groups in the synthetic Kenyan supermarket dataset.

The analysis focuses on two business questions involving payment methods and promotions. Python, pandas, NumPy, SciPy, and Matplotlib were used to conduct the analysis, examine spending distributions, and evaluate the statistical results.

The dataset is synthetic and is intended for educational and analytical purposes.

## 2. Research Questions

1. Is the mean sales value per record different between M-Pesa transactions and transactions using other payment methods?
2. Is the mean sales value per record different between transactions with a promotion ID and transactions without a promotion ID?

## 3. Statistical Methods

Sales value per record was calculated as:

`quantity × selling_price_kes`

The following statistical methods were applied:

- **Welch's independent-samples t-test:** Used to compare the mean sales values between two groups without assuming equal variances.
- **95% confidence intervals:** Used to estimate the range of plausible values for the difference in group means.
- **Histograms and skewness:** Used to examine the distributions of sales values and identify departures from normality.
- **Mann–Whitney U test:** Used as a non-parametric robustness check to compare the distributions of the two groups.
- **Cohen's d:** Used to measure the standardized difference between group means and assess practical significance.

The significance level was set at 0.05.

## 4. Results

### 4.1 Welch's t-test results

| Comparison | Mean difference | p-value | 95% confidence interval | Conclusion |
|---|---:|---:|---:|---|
| M-Pesa vs. other payment methods | KES 6.93 | 0.098412 | KES -1.29 to 15.15 | Not statistically significant |
| Promotion ID present vs. missing | KES 41.72 | 0.001663 | KES 15.72 to 67.72 | Statistically significant |

### Test 1: Payment Method

The mean sales value per record was KES 1,395.08 for M-Pesa and KES 1,388.15 for other payment methods.

The mean difference was KES 6.93, with a p-value of 0.098412. Since this is greater than 0.05, the analysis did not find sufficient evidence of a statistically significant difference in mean sales value between the groups.

The 95% confidence interval ranged from KES -1.29 to KES 15.15, including zero.

### Test 2: Promotion Status

The mean sales value per record was KES 1,433.18 for transactions with a promotion ID and KES 1,391.47 for transactions without a promotion ID.

The mean difference was approximately KES 41.72, with a p-value of 0.001663. Since this is below 0.05, the analysis found a statistically significant difference in mean sales value between the groups.

The 95% confidence interval ranged from KES 15.72 to KES 67.72, excluding zero.

However, this result does not establish that promotions caused higher sales values.

## 5. Distribution and Assumption Checks

Histograms were generated for:

- M-Pesa spending.
- Spending through other payment methods.
- Spending records with promotion IDs.
- Spending records without promotion IDs.

The histograms showed strongly right-skewed distributions across all four groups. Most spending observations were concentrated at lower values, with a smaller number of observations extending towards higher values.

This indicates that the spending distributions were not normally distributed and supports the use of an additional non-parametric test.

## 6. Mann–Whitney U Test Results

The Mann–Whitney U test was conducted as a robustness check.

| Comparison | U-statistic | p-value | Conclusion |
|---|---:|---:|---|
| M-Pesa vs. other payment methods | 36,096,174,227.50 | 0.316430 | Not statistically significant |
| Promotion ID present vs. missing | 3,831,909,570.50 | 0.000374 | Statistically significant |

The payment-method comparison remained statistically insignificant, supporting the conclusion from Welch's t-test.

The promotion-status comparison remained statistically significant, supporting the finding that the spending distributions differed between the two groups.

The Mann–Whitney test compares group distributions using ranks rather than directly testing differences in means.

## 7. Effect Size Analysis

Cohen's d was calculated to assess the magnitude of the differences between group means.

| Comparison | Cohen's d | Interpretation |
|---|---:|---|
| M-Pesa vs. other payment methods | 0.0046 | Negligible effect |
| Promotion ID present vs. missing | 0.0276 | Negligible effect |

Both effect sizes were very close to zero, indicating negligible standardized differences between the groups.

Although the promotion comparison was statistically significant, its effect size was very small. This demonstrates that statistical significance does not necessarily indicate practical or business importance, particularly when working with a large dataset.

## 8. Business Implications

- **Payment methods:** The analysis did not establish a statistically significant difference in mean sales value between M-Pesa and other payment methods.
- **Promotions:** The observed difference in sales values deserves further investigation, including comparisons by product, store, discount level, and period.
- **Business relevance:** The negligible effect size suggests that the observed promotion-related difference should not automatically be treated as a meaningful business impact.
- **Decision-making:** Statistical significance should be considered alongside effect sizes, data quality, and other supporting analyses.

## 9. Limitations

- The dataset contains synthetic rather than real supermarket transactions.
- Sales value per record is not the same as total transaction value, revenue over a period, or profit.
- All four spending distributions showed strong right skewness.
- Some customers may have made multiple purchases during the study period. Therefore, observations from the same customer may not be fully independent.
- The statistical tests did not explicitly adjust for repeated customer-level observations.
- The Mann–Whitney U test provides a comparison of distributions, not a direct test of differences in means.
- Statistical association does not establish causation.
- The findings should be validated using appropriate real-world data before being used for operational decisions.

## 10. Conclusion

The statistical analysis found no statistically significant difference in mean sales value per record between M-Pesa and other payment methods.

The promotion-status comparison showed a statistically significant difference in mean sales value. This result was also supported by the Mann–Whitney U test.

However, Cohen's d indicated negligible effect sizes for both comparisons. Therefore, the statistically significant promotion-related difference should be interpreted cautiously and not automatically considered a meaningful business impact.

Overall, the milestone demonstrates how hypothesis testing, confidence intervals, distribution analysis, robustness checks, and effect sizes can be combined to support evidence-based retail analysis.


**Data disclaimer:** This project uses synthetic supermarket data for educational and analytical purposes. The findings do not represent verified results from an actual supermarket chain.
