# Business Demand & Retail Sales Analytics Project

A comprehensive data analysis repository detailing product performance, customer segmentation, demographic sales distribution, and temporal purchasing patterns across multiple retail dimensions.

## 📊 Visual Analytics & Performance Insights

### 1. Macro Trends: Monthly Total Demand Over Time
The project analyzes historical product demand compiled at a macro monthly tier spanning 2024 through late 2025. 
* **Year-over-Year Growth:** Noticeable upward growth across identical months (e.g., January volume scaling from 151K to 178K units).
* **Seasonal Volatility:** Highlights a repeatable post-holiday contraction in February, followed by mid-year stabilization and an explosive Q4 holiday shopping surge maximizing at **278,000 units**.

### 2. Micro Cycles: Daily Product Demand Over Time
Tracks the raw 24-month granular daily timeline, highlighting operational metrics.
* **Weekly Cyclicality:** Displays a persistent high-frequency zigzag behavior matching consumer spending habits.
* **Holiday Capacity Planning:** Outlines intense supply chain scaling where daily units double from a standard 5,500 baseline up to peak capacities of **11,100 units** in late December.

### 3. Weekly Dynamics: Average Daily Demand by Day of the Week
Isolates average units sold per store-product-day across the calendar week to optimize store operations.
* **Saturdays & Sundays:** Form the peak high-volume revenue window, maximizing at an average of **10.1 units sold**.
* **Tuesdays:** Register the slowest operational baseline of the week at **7.4 units sold**.

### 4. Revenue Distribution by Category & Store Geographical Rankings
Ranks revenue generation performance cross-referenced across inventory types, stores, and regional counties.
* **Category Dominance:** *Staples* serves as the core financial driver (~255M KES), significantly outperforming lower-tier segments like *Household goods* (~72M KES).
* **Geographical Distribution:** *Nairobi County* drives the highest consolidated performance (~244M KES) powered by an increased density of premium locations (*Nairobi Central* and *Westlands Market*).

### 5. Customer Purchasing Clusters & Lifetime Value (LTV) Mapping
Combines scatter plots and bimodal histograms evaluating customer frequency vs. total spending behavior.
* **Segment A (Standard Buyers):** Highly concentrated cluster hovering between **60 and 70 transaction records** generating up to 125,000 KES.
* **Segment B (Power Users):** High-loyalty cluster pacing between **90 and 110 transaction records** maximizing lifetime values past 160,000 KES.

---

## 🛠️ Repository File Structure

* `analysis.ipynb` : Core Jupyter Notebook containing data pipelines, cleansing logic, and visualizations.
* `README.md` : High-level executive overview documentation of project deliverables.

---

## 🚀 Getting Started

### Prerequisites
Ensure you have the following core scientific data stack installed:
```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Execution
1. Clone this repository to your workspace.
2. Launch the Jupyter environment:
   ```bash
   jupyter notebook
   ```
3. Open `analysis.ipynb` and run all code cells to process data records and regenerate active analytical plots.
