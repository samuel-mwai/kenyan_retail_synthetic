# Milestone 5: Statistical Analysis

## 1. Project Overview

This milestone uses statistical hypothesis testing to examine whether sales value per record differs between selected groups in the synthetic Kenyan supermarket dataset.

The analysis supports business understanding of payment methods and promotions. The dataset is synthetic and is intended for educational and analytical purposes.

## 2. Research Questions

1. Is the mean sales value per record different between M-Pesa transactions and transactions using other payment methods?
2. Is the mean sales value per record different between transactions with a promotion and transactions without a promotion?

## 3. Statistical Method

Welch's independent-samples t-test was used to compare the mean sales value per record between two independent groups. This test does not require the two groups to have equal variances.

The significance level was set at 0.05.

Sales value per record was calculated as:

`quantity × selling_price_kes`

## 4. Results

| Comparison | Mean difference | p-value | Conclusion at 5% |
|---|---:|---:|---|
| M-Pesa vs. other payment methods | KES 6.93 | 0.0984 | Not statistically significant |
| Promotion vs. no promotion | KES 41.71 | 0.00166 | Statistically significant |

### Test 1: Payment Method

The mean sales value per record was KES 1,395.08 for M-Pesa and KES 1,388.15 for other payment methods.

The p-value was 0.0984, which is greater than 0.05. Therefore, the analysis did not find sufficient evidence of a statistically significant difference in mean sales value between these groups.

### Test 2: Promotion Status

The mean sales value per record was KES 1,433.18 for transactions with a promotion and KES 1,391.47 for transactions without a promotion.

The p-value was 0.00166, which is below 0.05. This indicates a statistically significant difference in mean sales value between the two groups.

However, this result does not establish that promotions caused higher sales values. Other factors may contribute to the observed difference.

## 5. Business Implications

- **Payment methods:** The analysis did not establish a statistically significant difference in mean sales value between M-Pesa and other payment methods.
- **Promotions:** The observed difference suggests that promotion performance deserves further investigation, including comparisons by product, store, discount level, and period.
- **Decision-making:** Statistical significance should be considered alongside business relevance, data quality, and other supporting analyses.

## 6. Limitations

- The dataset contains synthetic rather than real supermarket transactions.
- Sales value per record is not the same as total transaction value, revenue over a period, or profit.
- The distributions of sales values may be right-skewed, which should be considered when interpreting t-test results.
- Statistical association does not establish causation.
- The findings should be validated with appropriate real-world data before being used for operational decisions.

## 7. Conclusion

The payment-method comparison was not statistically significant at the 5% level. The promotion-status comparison showed a statistically significant difference in mean sales value per record. These results illustrate how hypothesis testing can support retail analysis while highlighting the importance of cautious interpretation.

**Data disclaimer:** This project uses synthetic supermarket data for educational and analytical purposes. The findings do not represent verified results from an actual supermarket chain.
