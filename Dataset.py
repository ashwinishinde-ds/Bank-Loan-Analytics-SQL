import pandas as pd
from sqlalchemy import create_engine, text
from urllib.parse import quote_plus

username = "root"
password = quote_plus("rani")  # Replace with your actual MySQL password
host = "localhost"
port = 3306
database = "BankLoanAnalysis"

engine = create_engine(
    f"mysql+pymysql://{username}:{password}"
    f"@{host}:{port}/{database}"
)

print("MySQL connection engine created successfully!")


# Read your two original files
df1 = pd.read_csv(r"D:\ExcleR\Projects\SQL\Project 2 Bank Analytics\dataset\Finance_1.csv", low_memory=False)
df2 = pd.read_excel(r"D:\ExcleR\Projects\SQL\Project 2 Bank Analytics\dataset\Finance_2.xlsx", engine="openpyxl")

# Check source row counts
print("Finance_1 CSV rows:", len(df1))
print("Finance_2 Excel rows:", len(df2))

# Import both files into MySQL
df1.to_sql(
    "finance_1", engine,
    if_exists="replace", index=False, chunksize=1000
)

df2.to_sql(
    "finance_2", engine,
    if_exists="replace", index=False, chunksize=1000
)

# Verify imported row counts
with engine.connect() as conn:
    for table in ["finance_1", "finance_2"]:
        count = conn.execute(
            text(f"SELECT COUNT(*) FROM `{table}`")
        ).scalar()
        print(f"{table} imported rows:", count)

engine.dispose()
