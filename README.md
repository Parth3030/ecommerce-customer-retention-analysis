# E-Commerce Customer Retention Analysis

## Project Overview
Analysis of 472,470 real e-commerce transactions to identify customer retention opportunities and quantify revenue impact.

## Problem Statement
Identified 712 high-value at-risk customers representing £169,600 in annual revenue at risk of permanent churn.

## Tools Used
- **Excel** - Data cleaning and initial exploration
- **PostgreSQL** - Database management and SQL analysis
- **Power BI** - Interactive dashboard and visualization

## Key Findings
- 712 at-risk customers with average past spend of £1,443
- Repeat purchase rate: 67% (industry benchmark: 75%+)
- Top 23% of customers generate 68% of revenue
- Total revenue opportunity identified: £1.77M annually

## Methodology
1. Data Cleaning (Excel)
   - Removed 266,899 noise entries including 16,336 cancellation invoices
   - Eliminated operational noise (POSTAGE, MANUAL adjustments, Gifts)
   - Added calculated columns: Revenue, Month, Hour, DayOfWeek, CustomerType

2. SQL Analysis (PostgreSQL)
   - RFM segmentation using NTILE window functions
   - Customer cohort analysis
   - Retention rate calculation

3. Dashboard (Power BI)
   - 4-page interactive dashboard
   - Customer segment visualization
   - Revenue opportunity quantification

## Business Recommendations
|     Recommendation     |        Target           |  Revenue Impact  |  ROI   |
|------------------------|-------------------------|------------------|--------|
| Win-Back Campaign      | 712 At-Risk Customers   | £169,600         | 889%   |
| New Customer Nurturing | 223 New Customers/Month | £331,296         | 1,001% |
| Champion VIP Program   | 1,113 Champions         | £1,271,046       | 950%   |

## Dashboard Screenshots
![Ecommerce_Customer_Retention_Analysis_page-0002](https://github.com/user-attachments/assets/2eebc160-45b3-49b5-ae43-7c1f392a665e)
![Ecommerce_Customer_Retention_Analysis_page-0003](https://github.com/user-attachments/assets/42cbd834-855c-4d52-bef6-3b7b03fb0584)
![Ecommerce_Customer_Retention_Analysis_page-0001](https://github.com/user-attachments/assets/b68d1168-ee3b-4987-9cf4-da78b9ac4964)
![Ecommerce_Customer_Retention_Analysis_page-0004](https://github.com/user-attachments/assets/04af3e30-8f95-48ac-bdd7-c57308ff8146)


## Files
- `data/online_retail.zip` - Cleaned transaction data
- `sql/rfm_analysis.sql` - Full RFM segmentation query
- `sql/First Purchase Month(Cohort Analysis).sql` 
- `sql/Top 20 At-Risk Customers.sql`
- `sql/Product Analysis.sql` 
- `dashboard/` - Power BI screenshots
