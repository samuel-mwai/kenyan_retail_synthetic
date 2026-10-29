# Kenyan Retail Customer & Sales Intelligence

**Individual Data Science and Analytics Capstone Project**

This project uses synthetic Kenyan supermarket data to explore sales performance, customer purchasing patterns, promotions, and demand forecasting. The work is organized into milestones covering data preparation, analysis, SQL, modelling, and dashboard storytelling.

> **Data notice:** The transaction, customer, product, store, and promotion records are synthetic and were created for educational purposes. Public contextual datasets are documented separately.

## Project objectives

- Understand sales and demand patterns across stores, products, and time.
- Investigate product/category performance and promotional activity.
- Prepare and validate sales data for analysis.
- Explore the data using Python and SQL.
- Build and evaluate a demand-forecasting approach.
- Communicate findings through a Power BI dashboard and recommendations.

## Repository and milestone links

Use these links to open the project work on GitHub.

| Milestone | Deliverable |
|---|---|
| **Milestone 1 — Problem framing and data acquisition** | [Project repository and source files](https://github.com/samuel-mwai/kenyan_retail_synthetic) |
| **Milestone 2 — Data cleaning and preparation** | [Open Milestone 2](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_2) |
| **Milestone 3 — Exploratory data analysis (EDA)** | [Open Milestone 3](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_3_EDA) |
| **Milestone 4 — SQL analysis** | [Open Milestone 4](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_4_sql%20analysis) |
| **Milestone 5 — Statistical analysis** | [Open Milestone 5](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_5_statistical%20analysis) |
| **Milestone 6 — Predictive modelling** | [Open Milestone 6](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_6_Predictive%20model) |
| **Milestone 7 — Dashboard and storytelling** | [Open Milestone 7](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling) |
| **Dashboard screenshots** | [View dashboard screenshots](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling/screenshots) |

## Dataset overview

The synthetic dataset is designed to represent a fictional Kenyan supermarket chain and includes:

- Eight fictional stores across five Kenyan counties.
- One hundred products across five categories.
- Six thousand synthetic customers.
- Daily transaction coverage from **1 January 2024 to 31 December 2025**.
- Sales, customers, products, stores, promotions, and calendar tables.

Sales records include fields such as transaction date, store, product, quantity, prices, discount rate, payment method, and optional customer and promotion identifiers. Missing customer or promotion identifiers can occur in the synthetic data and should be interpreted according to the analysis requirements rather than automatically treated as invalid records.

## Data sources and documentation

- [`data_sources.md`](data_sources.md) — repository-level data source notes, if maintained here.
- [`docs/data_sources.md`](docs/data_sources.md) — source documentation.
- [`docs/data_dictionary.csv`](docs/data_dictionary.csv) — data dictionary.
- [`data/external/`](data/external/) — public contextual files, including Kenyan county population, monthly inflation, public holidays, and source PDFs.

The public contextual data is intended to provide background for analysis. Consult the source notes and relevant milestone notebooks to understand how each external dataset is used.

## Repository structure

The principal project files are organized approximately as follows:

```text
kenyan_retail_synthetic/
├── data/
│   ├── raw/                 # Original synthetic tables
│   ├── processed/           # Validated and analysis-ready outputs
│   └── external/            # Public contextual data and source files
├── docs/                    # Data dictionary and source notes
├── milestone_2/             # Data cleaning and preparation
├── milestone_3_EDA/         # Exploratory data analysis
├── milestone_4_sql analysis/ # SQL analysis
├── milestone_5_statistical analysis/ # Statistical analysis
├── milestone_6_Predictive model/     # Predictive modelling
├── milestone_7_Dashboard Storytelling/ # Power BI dashboard and screenshots
├── reports/                 # Quality and analysis reports
├── src/                     # Supporting source code and notes
├── README.md
└── requirements.txt         # Python dependencies (add/verify before publishing)
```

Folder names in the repository may contain spaces. Use the exact folder names when opening files or running commands.

## Tools and technologies

The project uses Python and pandas for data handling, Jupyter notebooks for analysis, SQL for querying, and Power BI for dashboarding. The exact Python dependencies should be listed in `requirements.txt` and verified against the notebooks before claiming that the full project runs from a fresh environment.

## How to get the project

Clone the repository:

```bash
git clone https://github.com/samuel-mwai/kenyan_retail_synthetic.git
cd kenyan_retail_synthetic
```

### Set up Python

On Windows PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

If `requirements.txt` has not yet been added to the repository, install the dependencies used by the relevant notebook only after checking its imports. Do not treat the setup as complete until the dependency file is committed.

Start Jupyter:

```bash
jupyter notebook
```

Open the milestone notebooks from the repository and run them in their documented order. Some later notebooks may rely on processed files produced by earlier milestones. The exact run order and required inputs should be checked against the notebooks before treating the project as fully reproducible.

## Suggested analysis workflow

1. **Review the problem and sources:** begin with the repository and data-source documentation.
2. **Prepare the data:** open [Milestone 2](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_2) to review validation and cleaning.
3. **Explore patterns:** use [Milestone 3](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_3_EDA) for exploratory analysis.
4. **Run SQL analysis:** review [Milestone 4](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_4_sql%20analysis).
5. **Review statistical analysis:** see [Milestone 5](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_5_statistical%20analysis).
6. **Review predictive modelling:** see [Milestone 6](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_6_Predictive%20model).
7. **Review the business-facing dashboard:** open [Milestone 7](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling) and its [screenshots](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling/screenshots).

## Data preparation notes

The cleaning workflow retains rows with missing customer or promotion identifiers when those fields are not essential to the analysis. Essential sales fields are validated, exact duplicate rows are removed, relevant types are converted, and invalid non-positive quantities or prices are filtered in the validated sales output.

The latest reported validation output contained **555,731 sales rows**, with transaction dates from **1 January 2024 to 31 December 2025** and no missing values in the selected essential fields. Confirm this count against the committed processed CSV and cleaning notebook before using it as a final reported result, since earlier notebook runs may have produced slightly different counts.

## Findings and recommendations

Add only findings that have been verified in the completed analysis notebooks and dashboard. Suitable topics to summarize include:

- Products and categories with the highest sales or demand.
- Differences in store performance and location.
- Changes in demand over time and any relevant seasonal patterns.
- Promotional or discount patterns supported by the data.
- Forecast evaluation results, including the test period and the selected error metrics.
- Dashboard insights that can inform inventory planning.

Potential business recommendations to evaluate include adjusting replenishment for high-demand products, reviewing stock levels for slow-moving items, planning inventory around observed demand patterns, and assessing promotion performance. These are recommendations to consider, not claims that a measured improvement has already occurred.

## Limitations

- Core retail records are synthetic and may not represent actual Kenyan supermarket operations.
- Some customer and promotion identifiers are missing by design or within the simulated records.
- Forecast performance depends on the selected target, aggregation level, validation period, and baseline/model choices.
- Historical patterns and model results should be validated on real operational data before being used for real purchasing or inventory decisions.
- Public contextual data may have a different geographic or temporal granularity from the synthetic transactions.

## Key deliverables

- Data preparation notebook and validated data: [Milestone 2](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_2)
- EDA notebook and analysis: [Milestone 3](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_3_EDA)
- SQL queries and analysis: [Milestone 4](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_4_sql%20analysis)
- Statistical analysis: [Milestone 5](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_5_statistical%20analysis)
- Predictive model: [Milestone 6](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_6_Predictive%20model)
- Power BI dashboard and storytelling: [Milestone 7](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling)
- Dashboard images: [Screenshots](https://github.com/samuel-mwai/kenyan_retail_synthetic/tree/main/milestone_7_Dashboard%20Storytelling/screenshots)

**Milestone 8 — Documentation and presentation:** the final submission should include this README, a verified `requirements.txt`, and a presentation deck summarizing the project and its evidence. Add links to the final presentation and any published outputs here after they have been created and committed.
