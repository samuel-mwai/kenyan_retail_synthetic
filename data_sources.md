
# Data Sources and Acquisition

## 1. Synthetic Retail Data

**Source:** Project-provided synthetic dataset.

**Location:** `data/raw/`

**Files:**
- `sales_transactions.csv`
- `customers.csv`
- `products.csv`
- `stores.csv`
- `promotions.csv`
- `calendar.csv`

**Purpose:** To investigate retail sales patterns and develop a demand forecasting project.

## 2. County Population Data

**Source:** Kenya Population and Housing Census 2019 figures.

**File:** `data/external/kenya_county_population_2019.csv`

**Counties:** Nairobi City, Kiambu, Nakuru, Mombasa, and Kisumu.

**Purpose:** To provide county-level population context for the stores.

**Limitation:** These are 2019 population figures.

## 3. Inflation Data

**Source:** Kenya National Bureau of Statistics (KNBS).

**Source page:** https://www.knbs.or.ke/reports_category/cpi-and-inflation-rates/

**Files:**
- `data/external/Kenya-Consumer-Price-Indices-and-Inflation-Rates-December-2024.pdf`
- `data/external/Kenya-Consumer-Price-Indices-and-Inflation-Rates-December-2025.pdf`
- `data/external/kenya_monthly_inflation.csv`

**Period intended:** January 2024 to December 2025.

**Variable:** `annual_inflation_rate_pct`

**Purpose:** To provide economic context when investigating changes in retail sales.

**Limitation:** The monthly values transcribed from the 2025 report graph still require verification.

## 4. Current Project Status



## 4. Kenyan Public Holiday Data

**Source:** Kenya Public Holidays Act and Kenya Gazette notices.

**Files:**
- `data/external/kenya_public_holidays.csv`

**Columns:**
- `date`
- `holiday_name`

**Period covered:** 2024–2025.

**Purpose:** To investigate whether public holidays are associated with changes in supermarket sales and demand.

**Limitations:** Movable holidays and substitute holidays must be checked against official notices. The CSV is provisional until all dates have been verified.





## 5. Source References

### Population
- Publisher: Kenya National Bureau of Statistics (KNBS).
- Publication: 2019 Kenya Population and Housing Census, Volume I: Population by County and Sub-County.
- URL: https://www.knbs.or.ke/reports/kenya-census-2019/
- Local file: `data/external/kenya_county_population_2019.csv`
- Reference year: 2019.

### Inflation
- Publisher: Kenya National Bureau of Statistics (KNBS).
- Publications: Consumer Price Indices and Inflation Rates, December 2024 and December 2025.
- December 2024 URL: https://www.knbs.or.ke/reports/consumer-price-indices-and-inflation-rates-december-2024/
- December 2025 URL: https://www.knbs.or.ke/reports/consumer-price-indices-and-inflation-rates-december-2025/
- Local file: `data/external/kenya_monthly_inflation.csv`
- Period intended: January 2024 to December 2025.

### Public Holidays
- Publisher: Government of Kenya / Kenya Law.
- Source: Public Holidays Act and relevant Kenya Gazette notices.
- Public Holidays Act URL: https://new.kenyalaw.org/akn/ke/act/1912/21/eng%402022-12-31/source
- Example Gazette notice: https://new.kenyalaw.org/akn/ke/officialGazette/gazette/2024-06-14/84/eng%402024-06-14/source
- Local file: `data/external/kenya_public_holidays.csv`
- Period intended: 2024–2025.
- Note: Verify each holiday date against the applicable official notice before final analysis.


**Milestone:** 1 — Problem Framing and Data Acquisition.


