# 📊 Olist Sales & Order Funnel Analysis

An end-to-end data analytics project built on Olist's real Brazilian e-commerce dataset (100K+ orders, 2017–2018) — covering the full pipeline from raw, messy multi-table data to a fully designed, interactive Power BI dashboard.

![Dashboard Preview](dashboard.png)

---

## 📌 Project Overview

This project simulates a real business analytics workflow, end to end:

1. **SQL** — Loaded 8 raw CSV tables into a MySQL database and joined them to build a clean master dataset
2. **Python** — Cleaned the data and engineered features (delivery delay, satisfaction labels, monthly revenue, customer funnel stages)
3. **Power BI** — Designed an interactive, branded dashboard with KPIs, a conversion funnel, revenue trends, delivery performance, and category insights

**Goal:** Identify where customers drop off in the order journey, track revenue trends, and measure delivery performance to support data-driven operational decisions.

---

## 🛠️ Tech Stack

| Layer | Tools |
|---|---|
| Database | MySQL, MySQL Workbench |
| Data Processing | Python (Pandas, NumPy, SQLAlchemy) — Jupyter Notebook |
| Visualization | Power BI, Power Query, DAX |
| Version Control | Git, GitHub |

---

## 📂 Repository Structure

```
├── sql/
│   └── queries.sql                  # Table joins, funnel stage query, data exploration
├── python/
│   ├── 01_setup.ipynb               # Load CSVs into MySQL
│   └── 02_cleaning_analysis.ipynb   # Cleaning, feature engineering, funnel calc
├── data/
│   ├── cleaned_master.csv           # Final cleaned dataset (98,815 rows)
│   └── funnel_data.csv              # Funnel stage summary
├── screenshots/
│   └── dashboard_overview.png
├── Olist_Ecommerce_Analytics_Dashboard.pbix
└── README.md
```

---

## 🔍 Process

### 1. Data Loading & SQL (MySQL)
- Loaded 8 raw tables (orders, customers, payments, reviews, items, products, sellers, category translation) into MySQL
- Joined 6 tables to build a master dataset — **118,390 rows** after filtering canceled orders and null payments
- Wrote a funnel-stage query tracking orders from placement through review

### 2. Data Cleaning & Feature Engineering (Python)
- Removed duplicates, handled nulls, fixed data types → **98,815 clean rows**
- Engineered features:
  - `delivery_delay_days` — actual vs. estimated delivery
  - `delivery_status` — On Time / Late / Unknown
  - `satisfaction` — derived from review scores
  - `total_order_value`, `purchase_month_year`

### 3. Dashboard Design (Power BI)
- 4 KPI cards: Total Revenue, Total Orders, Avg Order Value, On-Time Delivery %
- 5-stage customer order funnel (gradient navy color scale)
- Monthly revenue trend line chart
- Delivery performance donut chart
- Top 10 product categories by revenue
- Sidebar filters: Payment Type, Customer State, Year

---

## 📊 Key Insights

- Generated **$15.61M** in total revenue across **98K+ orders**
- Achieved an **on-time delivery rate of 91%**
- **Health & Beauty** is the top-revenue category at **$1.42M**
- Revenue showed consistent month-over-month growth from 2017 into early 2018
- A **9% drop-off** occurs between order placement and customer review — a potential area to investigate for engagement improvement

---

## 🚀 Skills Demonstrated

- SQL joins and querying across real-world relational tables
- Data cleaning and feature engineering on messy, real e-commerce data in Python
- Data modeling and DAX measures in Power BI
- Designing a recruiter-ready, branded BI dashboard (not default Power BI styling)
- End-to-end analytical thinking: raw data → analysis → business insight

---

## 📚 Dataset

This project uses the **Olist Brazilian E-Commerce Public Dataset**, containing customer orders, payments, products, reviews, and delivery information from Brazil's largest online marketplace.

---

## 👩‍💻 Author

**Hebah**

If you found this project interesting, feel free to ⭐ this repository or reach out to discuss the approach.
