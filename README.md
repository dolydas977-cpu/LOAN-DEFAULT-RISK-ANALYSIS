# Loan Default Risk Analysis | Power BI Dashboard

An interactive Power BI dashboard that analyzes loan default risk across **601 loans**. It shows which borrower and loan characteristics are linked to higher default rates, so lenders can make better approval decisions.

<img width="544" height="326" alt="DASHBOARD REVIEW" src="https://github.com/user-attachments/assets/5ac4a613-ee2b-45b8-a615-3cc18b49fb5f" />


---

## Project Objective

To identify the key factors that drive loan defaults and to recommend practical rules (such as a DTI cutoff) that can reduce credit risk.

## Key Metrics

| Metric | Value |
|---|---|
| Total Loans | 601 |
| Total Defaults | 146 |
| Default Rate | 24% |
| Average Credit Score | 704.95 |
| Average Loan Amount | $22.1K |
| Average Annual Income | $64.5K |

## Dashboard Visuals

- **Default Rate by Loan Purpose**
<img width="223" height="209" alt="loan purpose" src="https://github.com/user-attachments/assets/7e623dc6-7a34-4139-96c1-cd73c8d57d9e" />

- **Default Rate by DTI Ratio**
<img width="241" height="88" alt="Screenshot 2026-11-10 142327" src="https://github.com/user-attachments/assets/d576448b-7da0-4965-b6a0-c7e156407c21" />

- **Default Rate by Employment Status**
<img width="245" height="115" alt="Screenshot 2026-11-10 142600" src="https://github.com/user-attachments/assets/0a8dc4c1-ca13-45c3-a220-b3c72ace9e5a" />

- **Default Rate by Credit Score**
<img width="151" height="140" alt="Screenshot 2026-11-10 142647" src="https://github.com/user-attachments/assets/0539c8c8-7f87-4707-b42b-1259c62c1a36" />

- **Default Rate by Employment Tenure**
<img width="181" height="136" alt="Screenshot 2026-11-10 142728" src="https://github.com/user-attachments/assets/651d0f2a-9e86-4bd1-8192-f6fe33280e59" />

- **Default Rate by Loan Amount**
<img width="157" height="139" alt="Screenshot 2026-11-10 142816" src="https://github.com/user-attachments/assets/e1b530c9-c325-4099-af6e-1b2352871a06" />


## Business Insights

1. **Highest-risk credit score bucket:** The 520-599 bucket has the highest default rate.
2. **DTI and default risk:**
   - DTI (Debt-to-Income ratio) has a strong positive relationship with default risk. As DTI rises, defaults rise significantly.
   - The recommended DTI cutoff is **40%**.
3. **Riskiest loan purpose:** Wedding loans have the highest default rate at **32%**.
4. **Loan amount:** The average loan amount is similar for defaulted and non-defaulted borrowers, so loan size is not a key driver.
5. **Employment status:** Part-time borrowers have the highest default rate.

## Recommendations

- Apply stricter approval rules or higher interest rates for borrowers with credit scores below 600.
- Set a DTI cutoff of 40%, or ask for a guarantor above it.
- Review lending standards for wedding, home improvement and auto loans.

## Tools Used

- **SQL Server**: data storage, querying and preparation
- **Power BI Desktop**: data modeling, DAX measures and dashboard design

## How to Use

1. Clone or download this repository.
2. Load `borrower_profiles.csv` and `loan_applications.csv` into **SQL Server** and run `SQLQuery1.sql` to prepare and analyze the data.
3. Open `BANKING PBI.pbix` in **Power BI Desktop**.
4. Explore the visuals and use the slicers and charts to filter the data.

## Repository Structure

```
├── BANKING PBI.pbix
├── DASHBOARD REVIEW.png
├── LICENSE
├── README.md
├── SQLQuery1.sql
├── borrower_profiles.csv
└── loan_applications.csv
```

| File / Folder | Description |
|---|---|
| `BANKING PBI.pbix` | Power BI report file with all visuals |
| `DASHBOARD REVIEW.png` | Screenshot of the final Power BI dashboard |
| `LICENSE` | License terms for using this project |
| `README.md` | Project overview, key metrics and business insights |
| `SQLQuery1.sql` | SQL Server queries used to prepare and analyze the data |
| `borrower_profiles.csv` | Borrower data used in the analysis |
| `loan_applications.csv` | Loan application and default data used in the analysis |

## Author

**Doly Das**
Credit risk and Data Analyst professional Connect on 

LinkedIn: www.linkedin.com/in/doly-das-3a95bb129

GitHub: https://github.com/dolydas977-cpu/
