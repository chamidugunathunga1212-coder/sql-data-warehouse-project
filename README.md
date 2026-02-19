# 📊 Data Warehouse Project — [Project Name]

## 🧠 Overview

This project implements an end-to-end **Data Warehousing solution** that transforms raw operational data into structured analytical data for reporting and decision making.

The pipeline extracts data from source systems, cleans and transforms it using ETL processes, and loads it into a dimensional model (Star Schema) optimized for analytics.

> 🎯 Objective: Convert raw transactional data into meaningful business insights.

---

## 🏗️ Architecture

```
Source Systems → Staging Layer → ETL Transformation → Data Warehouse → BI / Analytics
```

### Data Flow

1. Raw data collected from source systems
2. Loaded into staging tables
3. Cleaned & transformed using ETL logic
4. Loaded into dimensional warehouse tables
5. Queried for reporting & analysis

---

## 🛠️ Tech Stack

| Category        | Tools Used                              |
| --------------- | --------------------------------------- |
| Database        | [SQL Server / Oracle / PostgreSQL]      |
| ETL             | [SSIS / Python / SQL Stored Procedures] |
| Data Modeling   | Star Schema                             |
| Visualization   | [Power BI / Tableau / None]             |
| Language        | SQL, Python                             |
| Version Control | Git & GitHub                            |

---

## 📂 Project Structure

```
data-warehouse-project/
│
├── datasets/              # Raw input data files
├── staging/               # Staging table creation scripts
├── warehouse/             # Fact & Dimension table scripts
├── etl/                   # ETL procedures / pipelines
├── transformations/       # Data cleaning & transformation logic
├── analytics/             # Business queries & reports
├── docs/                  # Architecture & schema diagrams
└── README.md
```

---

## 🗄️ Data Model (Star Schema)

### Fact Tables

* **Fact_Sales**

  * sale_id
  * customer_key
  * product_key
  * date_key
  * quantity
  * total_amount

### Dimension Tables

* **Dim_Customer**
* **Dim_Product**
* **Dim_Date**
* **Dim_Location**

---

## ⚙️ ETL Process

### 1️⃣ Extract

Data extracted from:

* CSV files
* Operational database
* External data sources

### 2️⃣ Transform

Transformations performed:

* Null handling
* Duplicate removal
* Data type standardization
* Surrogate key generation
* Slowly Changing Dimension handling (SCD)

### 3️⃣ Load

Loading order:

1. Dimension tables
2. Fact tables

---

## 📈 Sample Business Queries

```sql
-- Top selling products
SELECT p.product_name, SUM(f.total_amount) AS revenue
FROM Fact_Sales f
JOIN Dim_Product p ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC;
```

---

## 📊 Insights Generated

The warehouse supports analysis such as:

* Monthly revenue trends
* Customer purchase behavior
* Best performing products
* Regional sales performance

---

## 🚀 How to Run the Project

### Step 1 — Create Database

```sql
CREATE DATABASE DataWarehouse;
```

### Step 2 — Execute Scripts

1. Run staging table scripts
2. Run dimension table scripts
3. Run fact table scripts
4. Execute ETL scripts

### Step 3 — Run Analytics Queries

Use queries located in `analytics/queries.sql`

---

## 📌 Concepts Implemented

* Data Cleaning
* Surrogate Keys
* Star Schema Modeling
* Fact & Dimension Tables
* ETL Pipeline
* Aggregations
* Business Intelligence Queries

---

## 🧩 Future Improvements

* Incremental data loading
* Change Data Capture (CDC)
* Automated ETL scheduling
* Dashboard integration

---

## 👨‍💻 Author

**Chamidu Gunathunga**
Aspiring Data Engineer 🚀

