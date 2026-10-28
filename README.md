# 🏦 Bank Loan Analytics Using SQL & Python

## 📌 Project Overview
The **Bank Loan Analytics Project** focuses on analyzing financial loan data using MySQL and Python. The goal is to understand loan distribution, repayment activity, borrower characteristics, and credit-related patterns through SQL queries.

## 🎯 Project Objectives
- Analyze year-wise loan amounts.
- Examine revolving balances across loan grades and sub-grades.
- Compare total payments for verified and non-verified borrowers.
- Analyze loan status across states and credit pull dates.
- Explore home ownership and last payment date statistics.

## 🛠️ Technologies Used
- **MySQL** – Database management and SQL analysis
- **SQL** – Data integration, JOINs, views, aggregations, and filtering
- **Python** – Data processing and database import
- **Pandas** – Dataset handling
- **SQLAlchemy** – Connecting Python with MySQL
- **Excel & CSV** – Data sources

## 📂 Project Structure
```text
Bank-Loan-Analytics-SQL/
│
├── Bank Analytics.sql
├── Dataset.py
├── README.md
└── dataset/
    ├── Finance_1.csv
    └── Finance_2.xlsx
```

## 📊 Project Workflow
1. Load the financial datasets into MySQL.
2. Combine relevant information from `finance_1` and `finance_2`.
3. Prepare a merged dataset for analysis.
4. Execute SQL queries to calculate financial metrics.
5. Analyze loan and repayment patterns.

## 📈 Key Analysis
1. **Year-wise Loan Amount:** Analyze the total loan amount issued each year.
2. **Grade and Sub-grade Analysis:** Examine revolving balances by borrower grade and sub-grade.
3. **Verification Status:** Compare total payments for verified and non-verified borrowers.
4. **State-wise Loan Status:** Explore loan status across states and last credit pull dates.
5. **Home Ownership Analysis:** Examine home ownership against last payment date statistics.

## 💡 Skills Demonstrated
- SQL Joins and Views
- Aggregate Functions
- GROUP BY and ORDER BY
- Date Functions
- Financial Data Analysis
- Python Database Connectivity
- Data Integration and Reporting

## 🚀 How to Run
1. Install MySQL and Python.
2. Install the required Python packages:
   ```bash
   pip install pandas sqlalchemy pymysql openpyxl
   ```
3. Create the `BankLoanAnalysis` database in MySQL.
4. Configure the database credentials securely in `Dataset.py`.
5. Update the dataset file paths to match your system.
6. Run `Dataset.py` to import the datasets.
7. Execute the SQL queries in `Bank Analytics.sql` using MySQL Workbench.

## 👨‍💻 Author
**Ashwini Shinde**

Aspiring Data Analyst | SQL | Python | MySQL | Data Analytics

---

⭐ If you find this project useful, feel free to explore the repository and share your feedback.
