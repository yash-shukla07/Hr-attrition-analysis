📊 HR Attrition Analytics Dashboard

A complete end-to-end data analytics project analyzing employee attrition patterns using Python, MySQL, and Power BI.


📁 Project Structure

HR-Attrition-Analytics/
│
├── HR_DATA.csv                  # Raw dataset (IBM HR Analytics)
├── hr_data_cleaning.py          # Python data cleaning + EDA script
├── hr_analysis.sql              # SQL analysis queries
└── README.md                    # Project documentation


🎯 Problem Statement

Employee attrition is a major cost for organizations — hiring, training, and knowledge loss add up significantly. This project analyzes 1,470 employee records to identify:


Which factors drive employees to leave
Which departments, roles, and demographics are at highest risk
Key actionable insights for HR teams to improve retention



🛠️ Tools & Technologies

ToolPurposePython (Pandas, NumPy, Matplotlib)Data cleaning, EDA, visualizationsMySQLData storage + SQL-based analysisPower BIInteractive dashboard creationSQLAlchemyPython to MySQL connection


📦 Dataset


Source: IBM HR Analytics Employee Attrition Dataset
Records: 1,470 employees
Features: 35 columns (demographic, job-related, satisfaction scores)
Target Variable: Attrition (Yes/No)



🧹 Data Cleaning (Python)

File: hr_data_cleaning.py

Steps performed:


Loaded raw CSV data and inspected shape, dtypes, null values, duplicates
Standardized column names to lowercase snake_case
Dropped constant/useless columns — StandardHours, EmployeeCount, Over18 (same value for all rows — no analytical value)
Checked unique values and value counts for all categorical columns
Created new feature — age_group (Young / Mid-Age / Senior Employees)
Calculated attrition percentage (Stayed: 83.88%, Left: 16.12%)
Generated basic EDA visualizations using Matplotlib
Exported cleaned data to MySQL (hr_db.hr_attrition table)


EDA Visualizations generated:


Attrition Count (Bar Chart)
Age Distribution (Histogram)
Employee Count by Department (Bar Chart)
Monthly Income Distribution (Histogram)
Employee Count by Gender (Bar Chart)
Employee Count by Age Group (Bar Chart)



🗃️ SQL Analysis

File: hr_analysis.sql
Database: hr_db
Table: hr_attrition

Queries covered:

AnalysisDescriptionOverall Attrition Rate16.12% overall attritionDepartment-wise AttritionSales highest (21%), R&D lowest (14%)Overtime ImpactOvertime employees attrite at 31% vs 8%Experience/Tenure Analysis0-2 year employees have highest attrition (30%)Distance from HomeEmployees 20-25km away have highest attrition (27%)Marital StatusSingle employees attrite most (25%)Job Role AnalysisSales Representatives highest (40%)Salary Hike ImpactLower hike % employees more likely to leaveBusiness Travel + Education FieldCombined factor analysis

Core SQL technique used throughout:

sqlROUND(SUM(CASE WHEN attrition="Yes" THEN 1 ELSE 0 END) * 100 / COUNT(*), 2)

This calculates attrition rate per group without needing subqueries.


📊 Power BI Dashboard

2-page interactive dashboard built on cleaned MySQL data.

Page 1 — Overview


KPI Cards: Total Employees, Employees Left, Employees Stayed, Attrition Rate
Attrition Rate by Department (Donut Chart)
Attrition Rate by Age Group (Bar Chart)
Impact of Overtime on Attrition (Line Chart)
Attrition Rate by Experience (Line Chart)
Slicers: Age Group, Department
Key Insights panel


Page 2 — Detailed Factors


KPI Cards: Total Job Roles, Avg Experience, Attrition Rate, Avg Monthly Income
Attrition Rate by Job Role (Horizontal Bar Chart)
Attrition Rate vs Distance from Home (Bar Chart)
Attrition Rate by Income Group (Line Chart)
Attrition Rate by Marital Status (Donut Chart)
Attrition Rate by Education Field (Pie Chart)
Slicers: Job Roles, Education Field
Key Insights panel



🔍 Key Findings


Income is the strongest driver — Employees earning ₹1,000–5,000/month attrite at 21.76%, nearly 6x the rate of those earning ₹15,000+ (3.76%)
Overtime significantly increases attrition risk — Overtime employees attrite at 31%, vs 8% for those without overtime (3x more likely to leave)
New employees are most at risk — Employees with 0–2 years tenure have the highest attrition (30%), dropping sharply to 8% beyond 10 years
Sales Representatives have the highest job-role attrition rate at 40%
Single employees are more likely to leave (25%) compared to married (12%) and divorced (10%)
R&D department is the most stable (14% attrition vs Sales 21%)



💡 Business Recommendations


Review compensation for entry-level/low-salary employees — income is the #1 attrition driver
Implement overtime management policies — overtime employees are 3x more likely to leave
Focus retention efforts on employees in their first 2 years (highest risk window)
Design targeted retention programs for Sales Representatives (40% attrition)
Consider remote/flexible work options for employees commuting 20+ km
