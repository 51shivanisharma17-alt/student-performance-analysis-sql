# Student Performance Analysis | SQL & Power BI

![Project Status](https://img.shields.io/badge/Project-In%20Progress-orange)
![Database](https://img.shields.io/badge/Database-PostgreSQL-blue)
![Visualization](https://img.shields.io/badge/Visualization-Power%20BI-yellow)

## 1. Project Overview

This project is about analyzing student academic performance using PostgreSQL and Power BI.

I worked with student data to explore academic scores, attendance, study hours, departments, and other factors related to student performance.

The main goal is to use SQL to answer practical questions about the data and present the findings through an interactive Power BI dashboard.

## 2. Project Objectives

- Understand the structure and quality of the student dataset.
- Analyze student demographics and academic performance.
- Explore attendance and daily study-hour patterns.
- Compare student performance across different departments.
- Analyze performance based on scholarship and internet access.
- Identify top-performing students.
- Find students who may need additional academic support.
- Present the analysis through interactive Power BI dashboards.

## 3. Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database management and querying |
| SQL | Data exploration, cleaning, and analysis |
| Power BI | Interactive data visualization |
| GitHub | Project documentation and version control |

## 4. Dataset Description

The project uses a student dataset containing academic, demographic, and other student-related information.

The dataset includes the following fields:

- Student ID, Age, Gender, and City
- Department and Course
- Study Hours and Attendance Percentage
- Assignment, Midterm, and Final Scores
- Total Score and Grade
- Exam Status
- Scholarship and Internet Access
- Extracurricular Activities
- Parent Education

The dataset is stored and analyzed in a PostgreSQL table named `analytics.students`.

## 5. SQL Analysis

I organized the SQL analysis into seven phases to solve different business questions.

### Phase 1: Business Understanding
- Count the total number of students.
- Find the number of unique departments and courses.
- Calculate minimum, maximum, and average student age.

### Phase 2: Data Collection & Understanding
- Retrieve the first 10 records.
- Explore column names and data types.
- Understand the structure of the dataset.

### Phase 3: Data Cleaning & Quality Assessment
- Check for missing values.
- Identify duplicate records.
- Check invalid attendance percentages.
- Check total scores outside the expected range.

### Phase 4: Data Transformation & Preparation
- Categorize attendance into Low, Medium, and High.
- Standardize department and course names.
- Prepare data for further analysis.

### Phase 5: Exploratory Data Analysis (EDA)
- Analyze student distribution by department.
- Explore grade distribution.
- Calculate average, minimum, and maximum scores.
- Find the city with the highest number of students.
- Analyze gender distribution.

### Phase 6: Performance Analysis
- Compare average scores across departments.
- Compare performance based on scholarship.
- Analyze performance based on internet access.
- Identify the top 10 students.
- Rank students within their departments.

### Phase 7: Reporting & Insights
- Calculate department-wise student count and average performance.
- Identify students with low attendance and low scores.
- Compare individual student scores with their department average.

**Total: 24 SQL business questions.**

### SQL Concepts Practiced

- SELECT, WHERE, and ORDER BY
- DISTINCT
- Aggregate Functions
- GROUP BY and HAVING
- CASE Statements
- Subqueries
- Window Functions
- RANK()
- PARTITION BY
- INFORMATION_SCHEMA
- Data Quality Checks

## 6. Power BI Dashboard

**Status: In Progress**

I am developing a two-page interactive dashboard to present the results of the SQL analysis.

### Page 1: Student Performance Overview

Planned visuals:

- Total Students
- Average Academic Score
- Average Attendance
- Average Study Hours
- Student Distribution by Department
- Grade Distribution
- Average Score by Department
- Student Distribution by City

### Page 2: Academic Performance & Insights

Planned visuals:

- Attendance vs Academic Performance
- Scholarship-wise Average Score
- Internet Access vs Average Score
- Top 10 Performing Students
- Students Requiring Academic Support

Dashboard screenshots and the Power BI file will be added after development is complete.

## 7. Project Structure

```text
student-performance-analysis-sql/
│
├── README.md
├── data/
│   └── students.csv
│
├── sql/
│   ├── 01_schema_and_table.sql
│   └── 02_student_analysis.sql
│
├── powerbi/
│   └── Student_Performance_Dashboard.pbix
│
└── images/
    ├── dashboard_page_1.png
    └── dashboard_page_2.png
```

## 8. Key Business Insights

This section will be updated after completing the SQL analysis and Power BI dashboard.

The final insights will highlight important patterns in student attendance, academic scores, department-wise performance, and other factors.

## 9. Project Progress

| Deliverable | Status |
|---|---|
| SQL Schema & Table Creation | Completed |
| SQL Business Analysis | Completed |
| Data Quality Assessment | Completed |
| Exploratory Data Analysis | Completed |
| Power BI Dashboard - Page 1 | In Progress |
| Power BI Dashboard - Page 2 | In Progress |
| Business Insights | Pending |

## 10. Author

**Shivani Sharma**

Aspiring Data Analyst

**Skills:** SQL | PostgreSQL | Power BI | Data Analytics

**GitHub:** [51shivanisharma17-alt](https://github.com/51shivanisharma17-alt)
