-- =====================================================
-- PROJECT: STUDENT PERFORMANCE ANALYSIS
-- FILE: 02_student_analysis.sql
-- DATABASE: PostgreSQL
-- SCHEMA: analytics
-- TABLE: students
-- =====================================================
-- Check columns information
SELECT
	COLUMN_NAME
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'students'
	AND TABLE_SCHEMA = 'analytics'
  
SELECT
	COUNT(*) AS TOTAL_COLUMNS
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'students'
	AND TABLE_SCHEMA = 'analytics'
  
	 -- Phase 1: Business Understanding
	-- Objective: Understand the business problem, define analysis requirements, and identify the key characteristics of the student population.
  
	-- 1. How many students are registered in the dataset?
SELECT
	COUNT(STUDENT_ID)
FROM
	ANALYTICS.STUDENTS;

-- 2. How many unique academic departments and courses are represented in the dataset?
SELECT
	COUNT(DISTINCT DEPARTMENT) AS TOTAL_DEPARTMENTS
FROM
	ANALYTICS.STUDENTS;

SELECT
	COUNT(DISTINCT COURSE) AS TOTAL_COURSES
FROM
	ANALYTICS.STUDENTS;

-- 3. What is the age distribution of students, including the minimum, maximum, and average age?
SELECT
	MAX(AGE) AS MAX_AGE,
	MIN(AGE) AS MIN_AGE,
	AVG(AGE) AS AVG_AGE
FROM
	ANALYTICS.STUDENTS;

-- Phase 2: Data Collection & Data Understanding
-- Objective: Understand the structure, completeness, and overall characteristics of the collected dataset.

-- 4. What are the first 10 records available in the student dataset?
SELECT
	*
FROM
	ANALYTICS.STUDENTS
LIMIT
	10;

-- 5. What are the different columns and their respective data types in the student dataset?
SELECT
	COLUMN_NAME,
	DATA_TYPE
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'students'
	AND TABLE_SCHEMA = 'analytics'
  
	-- Phase 3: Data Cleaning & Data Quality Assessment
  -- Objective: Identify missing values, duplicate records, invalid entries, and inconsistencies that may affect the accuracy of the analysis.
  
	-- 6. Are there any missing values in the student dataset? If so, which columns contain them?
SELECT
	COUNT(*) FILTER (
		WHERE
			STUDENT_ID IS NULL
	) AS MISSING_STUDENT_ID,
	COUNT(*) FILTER (
		WHERE
			AGE IS NULL
	) AS MISSING_AGE,
	COUNT(*) FILTER (
		WHERE
			GENDER IS NULL
	) AS MISSING_GENDER,
	COUNT(*) FILTER (
		WHERE
			CITY IS NULL
	) AS MISSING_CITY,
	COUNT(*) FILTER (
		WHERE
			DEPARTMENT IS NULL
	) AS MISSING_DEPARTMENTS,
	COUNT(*) FILTER (
		WHERE
			COURSE IS NULL
	) AS MISSING_COURSE,
	COUNT(*) FILTER (
		WHERE
			STUDY_HOURS_PER_DAY IS NULL
	) AS MISSING_STUDY_HOURS,
	COUNT(*) FILTER (
		WHERE
			ATTENDANCE_PERCENTAGE IS NULL
	) AS MISSING_ATTENDENCE_PERCENTAGE,
	COUNT(*) FILTER (
		WHERE
			ASSIGNMENT_SCORE IS NULL
	) AS MISSING_ASSIGNMENT_SCORE,
	COUNT(*) FILTER (
		WHERE
			MIDTERM_SCORE IS NULL
	) AS MISSING_MIDTERM_SCORE,
	COUNT(*) FILTER (
		WHERE
			FINAL_SCORE IS NULL
	) AS MISSING_FINAL_SCORE,
	COUNT(*) FILTER (
		WHERE
			TOTAL_SCORE IS NULL
	) AS MISSING_TOTAL_SCORE,
	COUNT(*) FILTER (
		WHERE
			GRADE IS NULL
	) AS MISSING_GRADE,
	COUNT(*) FILTER (
		WHERE
			EXAM_STATUS IS NULL
	) AS MISSING_EXAM_STATUS,
	COUNT(*) FILTER (
		WHERE
			SCHOLARSHIP IS NULL
	) AS MISSING_SCHOLARSHIP,
	COUNT(*) FILTER (
		WHERE
			INTERNET_ACCESS IS NULL
	) AS MISSING_INTERNET_ACCESS,
	COUNT(*) FILTER (
		WHERE
			EXTRACURRICULAR IS NULL
	) AS MISSING_EXTRACURRICULAR,
	COUNT(*) FILTER (
		WHERE
			PARENT_EDUCATION IS NULL
	) AS MISSING_PARENT_EDUCATION
FROM
	ANALYTICS.STUDENTS;

-- 7. Are there any duplicate student records in the dataset?
SELECT
	STUDENT_ID,
	AGE,
	GENDER,
	CITY,
	DEPARTMENT,
	COURSE,
	STUDY_HOURS_PER_DAY,
	ATTENDANCE_PERCENTAGE,
	ASSIGNMENT_SCORE,
	MIDTERM_SCORE,
	FINAL_SCORE,
	TOTAL_SCORE,
	GRADE,
	EXAM_STATUS,
	SCHOLARSHIP,
	INTERNET_ACCESS,
	EXTRACURRICULAR,
	PARENT_EDUCATION,
	COUNT(*) AS DUPLICATE_COUNT
FROM
	ANALYTICS.STUDENTS
GROUP BY
	STUDENT_ID,
	AGE,
	GENDER,
	CITY,
	DEPARTMENT,
	COURSE,
	STUDY_HOURS_PER_DAY,
	ATTENDANCE_PERCENTAGE,
	ASSIGNMENT_SCORE,
	MIDTERM_SCORE,
	FINAL_SCORE,
	TOTAL_SCORE,
	GRADE,
	EXAM_STATUS,
	SCHOLARSHIP,
	INTERNET_ACCESS,
	EXTRACURRICULAR,
	PARENT_EDUCATION
HAVING
	COUNT(*) > 1;

-- 8. Are there any students with invalid attendance percentages outside the acceptable range of 0–100?
SELECT
	ATTENDANCE_PERCENTAGE
FROM
	ANALYTICS.STUDENTS
WHERE
	ATTENDANCE_PERCENTAGE < 0
	OR ATTENDANCE_PERCENTAGE > 100;

-- 9. Are there any total scores outside the valid range of 0–100?
SELECT
	TOTAL_SCORE
FROM
	ANALYTICS.STUDENTS
WHERE
	TOTAL_SCORE < 0
	OR TOTAL_SCORE > 100;

-- Phase 4: Data Transformation & Preparation
-- Objective: Transform raw student information into meaningful categories and prepare the data for further analysis.
  
-- 10. How can students be categorized into Low, Medium, and High attendance groups?
SELECT
	STUDENT_ID,
	ATTENDANCE_PERCENTAGE,
	CASE
		WHEN ATTENDANCE_PERCENTAGE BETWEEN 0 AND 43  THEN 'Low'
		WHEN ATTENDANCE_PERCENTAGE BETWEEN 44 AND 64  THEN 'Medium'
		ELSE 'High'
	END AS ATTENDANCE_STATUS
FROM
	ANALYTICS.STUDENTS;

-- 11. How can department and course names be displayed in uppercase?
SELECT
	UPPER(DEPARTMENT) AS DEPARTMENTS,
	UPPER(COURSE) AS COURSES
FROM
	ANALYTICS.STUDENTS;

-- Phase 5: Exploratory Data Analysis (EDA)
-- Objective: Explore student demographics, academic distributions, and overall performance patterns to identify meaningful trends.
  
-- 12. What is the distribution of students across different academic departments?
SELECT
	DEPARTMENT,
	COUNT(STUDENT_ID) AS STUDENT_COUNT
FROM
	ANALYTICS.STUDENTS
GROUP BY
	DEPARTMENT;

-- 13. How are students distributed across different academic grades?
SELECT
	GRADE,
	COUNT(STUDENT_ID) AS STUDENT_COUNT
FROM
	ANALYTICS.STUDENTS
GROUP BY
	GRADE
ORDER BY
	GRADE ASC;

-- 14. What is the overall average, minimum, and maximum academic score of students?
SELECT
	MAX(TOTAL_SCORE) AS MAX_SCORE,
	MIN(TOTAL_SCORE) AS MIN_SCORE,
	ROUND(AVG(TOTAL_SCORE)) AS AVG_SCORE
FROM
	ANALYTICS.STUDENTS
  
	-- 15. Which cities have the highest number of enrolled students?
SELECT
	CITY,
	COUNT(STUDENT_ID) AS STUDENT_COUNT
FROM
	ANALYTICS.STUDENTS
GROUP BY
	CITY
ORDER BY
	2 DESC
LIMIT
	1
  
	-- 16. What is the gender distribution of students across the dataset?
SELECT
	GENDER,
	COUNT(STUDENT_ID) AS STUDENT_COUNT
FROM
	ANALYTICS.STUDENTS
GROUP BY
	GENDER;

-- Phase 6: Data Analysis & Performance Evaluation
-- Objective: Analyze academic performance and investigate how different student-related factors are associated with examination outcomes.

-- 17. Which academic departments have an average total score greater than 70?
SELECT
	DEPARTMENT,
	ROUND(AVG(TOTAL_SCORE), 2) AS AVG_TOTAL_SCORE
FROM
	ANALYTICS.STUDENTS
GROUP BY
	DEPARTMENT
HAVING
	AVG(TOTAL_SCORE) > 70;

-- 18. How does academic performance differ between students who receive scholarships and those who do not?
SELECT
	COUNT(STUDENT_ID) AS STUDENT_COUNT,
	ROUND(AVG(TOTAL_SCORE), 2) AS AVG_SCORE,
	SCHOLARSHIP
FROM
	ANALYTICS.STUDENTS
GROUP BY
	SCHOLARSHIP;

-- 19. How does internet availability relate to students' average academic performance?
SELECT
	COUNT(STUDENT_ID) AS STUDENT_COUNT,
	INTERNET_ACCESS,
	ROUND(AVG(TOTAL_SCORE), 2) AS AVG_SCORE
FROM
	ANALYTICS.STUDENTS
GROUP BY
	INTERNET_ACCESS;

-- 20. Who are the top 10 highest-performing students based on their total scores?
SELECT
	STUDENT_ID,
	TOTAL_SCORE
FROM
	ANALYTICS.STUDENTS
ORDER BY
	TOTAL_SCORE DESC
LIMIT
	10
  
	-- 21. Which students rank highest within their respective academic departments?
SELECT
	STUDENT_ID,
	TOTAL_SCORE,
	RANK() OVER (
		PARTITION BY
			DEPARTMENT
		ORDER BY
			TOTAL_SCORE DESC
	) AS STUDENT_RANK
FROM
	ANALYTICS.STUDENTS;

-- Phase 7: Data Visualization, Reporting & Insights
-- Objective: Prepare meaningful analytical summaries, identify students requiring academic support, and generate actionable insights for management.

-- 22. How do student count, average academic score, and average attendance vary across different departments?
SELECT
	DEPARTMENT,
	COUNT(STUDENT_ID) AS STUDENT_COUNT,
	ROUND(AVG(TOTAL_SCORE), 2) AS AVG_SCORE,
	ROUND(AVG(ATTENDANCE_PERCENTAGE), 2) AS AVG_ATTENDANCE
FROM
	ANALYTICS.STUDENTS
GROUP BY
	DEPARTMENT;

-- 23. Which students have both low attendance and low academic scores and may require additional academic support?
SELECT
	STUDENT_ID,
	ATTENDANCE_PERCENTAGE,
	TOTAL_SCORE
FROM
	ANALYTICS.STUDENTS
WHERE
	ATTENDANCE_PERCENTAGE < 40
	AND TOTAL_SCORE < 40;

-- 24. How does each student's academic performance compare with the average performance of their respective department?
SELECT
	STUDENT_ID,
	DEPARTMENT,
	TOTAL_SCORE,
	AVG(TOTAL_SCORE) OVER (
		PARTITION BY
			DEPARTMENT
	) AS AVG_SCORE
FROM
	ANALYTICS.STUDENTS

-- END OF SQL ANALYSIS
