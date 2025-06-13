# 🕵️‍♂️ Fraud Detection SQL Project

This project showcases an end-to-end SQL-based fraud analysis using a transactional dataset. The goal is to detect patterns in fraudulent transactions and provide key business insights that could help in building fraud detection systems.

## 📌 Project Overview

The dataset includes transaction-level data with attributes like transaction time, card number, merchant, amount, and a fraud label. We performed data exploration and built multiple views to identify trends and anomalies related to fraud.

## 🧰 Tools Used

- PostgreSQL
- SQL (Views, CTEs, Window Functions, Aggregations)
- CSV as data source

## 📊 Key Features and Insights

- ✅ **Total Transactions & Amounts**  
  Summary of transaction count and total value.

- 📅 **Transactions by Day & Weekday**  
  Analyzed daily and weekly trends in transaction volume and value.

- 🚩 **Fraud vs Non-Fraud Summary**  
  Compared counts and totals between fraudulent and legitimate transactions.

- 🌆 **Top 10 Cities with Fraud**  
  Identified hotspots with the highest number of fraud cases.

- 👔 **Jobs Involved in Fraud**  
  Job roles most frequently associated with fraud.

- 🛍 **Top Fraud Merchants**  
  Ranked merchants by number of fraud cases.

- 💸 **High-Value Transactions**  
  Flagged unusually high-value transactions (amt > ₹1000).

- 📈 **Fraud Rate by Job Category**  
  Calculated percentage of fraud within each job role.

- 🧑‍💳 **Users with > 3 Fraud Transactions**  
  Identified users (via `cc_num`) with suspicious behavior.

## 🔍 SQL Techniques Used

- Aggregations (`SUM`, `COUNT`, `AVG`)
- Views
- Common Table Expressions (CTEs)
- Window Functions (`RANK() OVER`)
- Filtering (`WHERE`, `HAVING`)
- Sorting and Limiting results

## 🚀 How to Run

1. Load the `transactions` table using the provided schema and `COPY` command.
2. Run the provided SQL script (`FRAUD_ANALYSIS.sql`) to create views.
3. Query views to analyze patterns and build reports or dashboards.

## 📁 File Structure

- `FRAUD_ANALYSIS.sql` – SQL script containing table creation, data load, and analytical views.
- `README.md` – Project documentation and insights.

## 📬 Contact

For queries or suggestions, reach out via [LinkedIn](https://www.linkedin.com).

