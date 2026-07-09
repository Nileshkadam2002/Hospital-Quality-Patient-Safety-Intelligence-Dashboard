<div align="center">
![Header](https://capsule-render.vercel.app/api?type=waving&color=0:0d1117,50:1a1b27,100:00d9ff&height=200&section=header&text=Data%20Science%20Notes&fontSize=50&fontColor=ffffff&animation=fadeIn&fontAlignY=35&desc=Interactive%20classroom-quality%20Jupyter%20Notebooks%20for%20Machine%20Learning&descSize=18&descAlignY=55&descColor=58a6ff)
# 🏥 Hospital Quality & Patient Safety Intelligence Dashboard

### Healthcare Analytics | SQL • Python • Power BI • CMS Open Data

<img src="https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python">
<img src="https://img.shields.io/badge/PostgreSQL-SQL-blue?style=for-the-badge&logo=postgresql">
<img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi">
<img src="https://img.shields.io/badge/Healthcare-Analytics-red?style=for-the-badge">
<img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge">

### 📊 Transforming U.S. Hospital Quality Data into Actionable Business Intelligence

</div>

---

## 📌 Project Overview

Healthcare organizations generate enormous amounts of quality and patient safety data. However, identifying hospitals with poor outcomes, understanding readmission trends, infection risks, and patient safety performance requires advanced analytics.

This project builds an **end-to-end Healthcare Analytics solution** using CMS hospital datasets to evaluate:

- ⭐ Hospital Quality Ratings
- 🦠 Healthcare-Associated Infections
- ❤️ Readmission Performance
- 🏥 Mortality Measures
- ⚠️ Hospital Acquired Conditions (HAC)
- 📍 State-wise Healthcare Performance

The final outcome is a **professional Power BI dashboard** designed for healthcare executives, analysts, and policy makers.

---

# 🎯 Business Problem

Healthcare administrators need answers to questions like:

- Which hospitals provide the best quality care?
- Which states have the highest-performing hospitals?
- Do higher-rated hospitals actually have lower infection rates?
- Which hospitals struggle with readmissions?
- What factors contribute to patient safety issues?
- Which quality measures require immediate improvement?

Traditional spreadsheets cannot answer these efficiently.

This dashboard solves these problems using data analytics.

---

# 🛠 Tech Stack

| Tool | Purpose |
|------|----------|
| 🐍 Python | Data Cleaning & EDA |
| PostgreSQL | SQL Analysis |
| Power BI | Dashboard Development |
| Excel | Initial Data Validation |
| Pandas | Data Processing |
| Matplotlib | Visualization |
| Git & GitHub | Version Control |

---

# 📂 Dataset

CMS (Centers for Medicare & Medicaid Services)

Datasets Used:

- Hospital General Information
- Complications & Deaths
- Healthcare Associated Infections
- Hospital Readmission Reduction Program
- HAC Reduction Program

---

# 🗂 Project Architecture

```text
               CMS Healthcare Data
                       │
                       ▼
              Excel Data Validation
                       │
                       ▼
          PostgreSQL Data Warehouse
                       │
                       ▼
          SQL Business Analysis
                       │
                       ▼
         Python Data Cleaning & EDA
                       │
                       ▼
             Power BI Dashboard
                       │
                       ▼
           Business Insights & KPIs
```

---

# 📊 Dashboard Pages

## 1️⃣ Executive Dashboard

✔ Total Hospitals

✔ Average Rating

✔ Average Readmission Ratio

✔ Average HAC Score

✔ Infection Performance

✔ Mortality Performance

---

## 2️⃣ Patient Safety Dashboard

Includes:

- HAC Analysis
- Hospital Rating vs HAC Score
- Top Safe Hospitals
- Lowest Performing Hospitals

---

## 3️⃣ Readmission Dashboard

Visualizations:

- Readmission Ratio
- Top 10 Hospitals
- Bottom 10 Hospitals
- Readmission by Disease
- Rating vs Readmission

---

## 4️⃣ Infection Dashboard

Shows:

- Infection Score
- National Benchmark Comparison
- Better vs Worse Hospitals
- Infection Trend

---

## 5️⃣ State Analysis Dashboard

- Average Rating
- Hospital Count
- Geographic Distribution
- State Rankings

---

# 📈 KPIs

✔ Total Hospitals

✔ Average Hospital Rating

✔ Average Mortality Score

✔ Average Infection Score

✔ Average Readmission Ratio

✔ Average HAC Score

✔ Better than National %

✔ Worse than National %

---

# 🔍 SQL Analysis

More than **60+ Business SQL Queries** were written.

Examples include:

### Hospital Analysis

- Hospital Count
- Hospital Ownership
- Hospital Types
- Emergency Services

### Mortality Analysis

- Average Mortality Score
- Highest Mortality
- Better than National

### Infection Analysis

- Average Infection Score
- Worst Infection Hospitals
- Infection Benchmark Comparison

### Readmission Analysis

- Average Readmission Ratio
- Disease-wise Readmission
- Top Hospitals
- Bottom Hospitals

### HAC Analysis

- HAC Score
- Rating vs HAC
- Patient Safety Ranking

### State Analysis

- Average Rating
- Hospital Distribution
- State Rankings

---

# 📊 Exploratory Data Analysis

Performed using Python.

## Data Cleaning

- Missing Values
- Duplicate Removal
- Data Type Conversion
- Numeric Conversion
- Invalid Score Removal

---

## Feature Engineering

- Hospital Performance Categories
- Rating Groups
- National Benchmark Flags
- Average Scores
- KPI Measures

---

# 📈 Power BI Features

✅ Interactive Slicers

✅ Drill Through

✅ Dynamic Cards

✅ DAX Measures

✅ KPI Cards

✅ Maps

✅ Conditional Formatting

✅ Custom Tooltips

✅ Bookmark Navigation

---

# 📸 Dashboard Preview

> Replace these placeholders with screenshots after uploading.

```
images/

├── executive_dashboard.png

├── patient_safety.png

├── readmission_dashboard.png

├── infection_dashboard.png

└── state_analysis.png
```

Example:

```markdown
## Executive Dashboard

![Executive Dashboard](images/executive_dashboard.png)

---

## Patient Safety Dashboard

![Patient Safety](images/patient_safety.png)
```

---

# 📁 Project Structure

```
Hospital-Quality-Analytics/

│

├── Dataset/

│      Hospital_General_Information.csv

│      Complications.csv

│      Infections.csv

│      HAC.csv

│      Readmissions.csv

│

├── SQL/

│      Hospital_Analysis.sql

│      Readmission.sql

│      Infection.sql

│

├── Python/

│      Data_Cleaning.ipynb

│      EDA.ipynb

│

├── PowerBI/

│      Hospital Dashboard.pbix

│

├── Dashboard Images/

│

├── README.md

│

└── LICENSE
```

---

# 💡 Key Business Insights

📌 Higher-rated hospitals generally exhibit lower readmission ratios.

📌 Several hospitals outperform national infection benchmarks.

📌 Patient safety scores vary significantly across states.

📌 Certain disease categories consistently show higher readmission ratios.

📌 Hospital quality ratings correlate with overall patient safety performance.

---

# 🚀 Future Improvements

- Machine Learning Risk Prediction
- Hospital Recommendation System
- Time-Series Trend Analysis
- Predictive Readmission Model
- Real-Time Data Integration
- Azure Data Factory Pipeline
- Healthcare KPI Alerts

---

# 📚 Skills Demonstrated

- SQL
- PostgreSQL
- Python
- Pandas
- Data Cleaning
- Data Wrangling
- Exploratory Data Analysis
- Power BI
- DAX
- Data Visualization
- Business Intelligence
- Healthcare Analytics
- Dashboard Design
- KPI Development

---

# ⭐ Repository Highlights

✔ End-to-End Analytics Project

✔ Real Healthcare Dataset

✔ Business-Focused SQL

✔ Executive Dashboard

✔ Interactive Power BI Reports

✔ Recruiter-Friendly Portfolio Project

---

# 👨‍💻 Author

**Nilesh Kadam**

📧 Email: your-email@example.com

💼 LinkedIn: https://linkedin.com/in/your-profile

📂 Portfolio: https://yourportfolio.com

⭐ If you found this project useful, don't forget to **Star** the repository!

---

<div align="center">

### ⭐ Thanks for visiting!

Made with ❤️ using Python, SQL & Power BI

</div>
