USE employee_attrition;

CREATE TABLE employees (
    Age INT,
    Department VARCHAR(100),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(100),
    EnvironmentSatisfaction INT,
    JobSatisfaction INT,
    MaritalStatus VARCHAR(50),
    MonthlyIncome INT,
    NumCompaniesWorked INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    Attrition VARCHAR(10)
);

describe employees;

SELECT 
    COUNT(*) - COUNT(Attrition) AS null_Attrition,
    COUNT(*) - COUNT(Department) AS null_Department,
    COUNT(*) - COUNT(JobSatisfaction) AS null_JobSatisfaction,
    COUNT(*) - COUNT(MonthlyIncome) AS null_MonthlyIncome,
    COUNT(*) - COUNT(WorkLifeBalance) AS null_WorkLifeBalance
FROM employees;

select count(*) as total_karyawan
from employees;

select count(*) as total_attrition
from employees
where attrition = 'YES';

SELECT 
    ROUND(
        100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 
        2
    ) AS attrition_rate_persen
FROM employees;

SELECT 
    COUNT(*) - COUNT(Age) AS null_Age,
    COUNT(*) - COUNT(Department) AS null_Department,
    COUNT(*) - COUNT(DistanceFromHome) AS null_DistanceFromHome,
    COUNT(*) - COUNT(Education) AS null_Education,
    COUNT(*) - COUNT(EducationField) AS null_EducationField,
    COUNT(*) - COUNT(EnvironmentSatisfaction) AS null_EnvironmentSatisfaction,
    COUNT(*) - COUNT(JobSatisfaction) AS null_JobSatisfaction,
    COUNT(*) - COUNT(MaritalStatus) AS null_MaritalStatus,
    COUNT(*) - COUNT(MonthlyIncome) AS null_MonthlyIncome,
    COUNT(*) - COUNT(NumCompaniesWorked) AS null_NumCompaniesWorked,
    COUNT(*) - COUNT(WorkLifeBalance) AS null_WorkLifeBalance,
    COUNT(*) - COUNT(YearsAtCompany) AS null_YearsAtCompany,
    COUNT(*) - COUNT(Attrition) AS null_Attrition
FROM employees;

SELECT COUNT(*) AS total_duplikat
FROM (
    SELECT *, COUNT(*) AS duplicate_count
    FROM employees
    GROUP BY Age, Department, DistanceFromHome, Education, EducationField,
             EnvironmentSatisfaction, JobSatisfaction, MaritalStatus,
             MonthlyIncome, NumCompaniesWorked, WorkLifeBalance,
             YearsAtCompany, Attrition
    HAVING duplicate_count > 1
) AS duplicates; # melihat jumlah duplicate

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(
        Age, Department, DistanceFromHome, Education, EducationField,
        EnvironmentSatisfaction, JobSatisfaction, MaritalStatus,
        MonthlyIncome, NumCompaniesWorked, WorkLifeBalance,
        YearsAtCompany, Attrition
    )) AS unique_rows
FROM employees; # cara 2 = membandingkan total rows dan total unique rows

-- Cek Department
SELECT DISTINCT Department FROM employees;

-- Cek MaritalStatus
SELECT DISTINCT MaritalStatus FROM employees;

-- Cek EducationField
SELECT DISTINCT EducationField FROM employees;

-- Cek Attrition
SELECT DISTINCT Attrition FROM employees;

SELECT 
    Department,
    COUNT(*) AS total_karyawan,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

SELECT 
    JobSatisfaction,
    COUNT(*) AS total_karyawan,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT 
    WorkLifeBalance,
    COUNT(*) AS total_karyawan,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

SELECT 
    CASE 
        WHEN Age <= 25 THEN '18-25'
        WHEN Age <= 35 THEN '26-35'
        WHEN Age <= 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    COUNT(*) AS total_karyawan,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY 
    CASE age_group
        WHEN '18-25' THEN 1
        WHEN '26-35' THEN 2
        WHEN '36-45' THEN 3
        WHEN '46+' THEN 4
    END;
    
SELECT 
    CASE 
        WHEN MonthlyIncome <= 3000 THEN 'Low (<=3k)'
        WHEN MonthlyIncome <= 6000 THEN 'Medium (3k-6k)'
        WHEN MonthlyIncome <= 10000 THEN 'High (6k-10k)'
        ELSE 'Very High (>10k)'
    END AS salary_group,
    COUNT(*) AS total_karyawan,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY salary_group
ORDER BY attrition_rate DESC;    

SELECT 
    Department,
    ROUND(AVG(JobSatisfaction), 2) AS avg_js,
    COUNT(*) AS total
FROM employees
GROUP BY Department
ORDER BY avg_js DESC;

SELECT 
    Department,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_wlb,
    COUNT(*) AS total
FROM employees
GROUP BY Department
ORDER BY avg_wlb DESC;

-- Cek NumCompaniesWorked
SELECT 
    NumCompaniesWorked,
    COUNT(*) AS total,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked;

-- Cek YearsAtCompany
SELECT 
    CASE 
        WHEN YearsAtCompany <= 1 THEN '< 1 tahun'
        WHEN YearsAtCompany <= 3 THEN '1-3 tahun'
        WHEN YearsAtCompany <= 5 THEN '3-5 tahun'
        ELSE '> 5 tahun'
    END AS masa_kerja,
    COUNT(*) AS total,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS resign,
    ROUND(100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY masa_kerja
ORDER BY 
    CASE masa_kerja
        WHEN '< 1 tahun' THEN 1
        WHEN '1-3 tahun' THEN 2
        WHEN '3-5 tahun' THEN 3
        WHEN '> 5 tahun' THEN 4
    END;