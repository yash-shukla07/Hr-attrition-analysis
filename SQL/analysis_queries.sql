-- HR Attrition Analysis Queries

-- 1. Overall Attrition Rate
SELECT 
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) as Attrition_Count,
    COUNT(*) as Total_Employees,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) as Attrition_Rate
FROM hr_data;

-- 2. Attrition by Department
SELECT 
    Department,
    COUNT(*) as Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) as Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) as Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- 3. Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) as Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) as Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) as Attrition_Rate
FROM hr_data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

-- 4. Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN '18-30'
        WHEN Age >= 30 AND Age < 40 THEN '30-40'
        WHEN Age >= 40 AND Age < 50 THEN '40-50'
        ELSE '50+'
    END as Age_Group,
    COUNT(*) as Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) as Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) as Attrition_Rate
FROM hr_data
GROUP BY Age_Group
ORDER BY Age_Group;

-- 5. Attrition by Tenure
SELECT 
    YearsAtCompany,
    COUNT(*) as Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) as Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) as Attrition_Rate
FROM hr_data
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
