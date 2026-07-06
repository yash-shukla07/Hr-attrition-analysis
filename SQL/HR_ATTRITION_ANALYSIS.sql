use hr_db;
 

-- HR ATTRITION ANALYSIS
-- Database : hr_db
-- Table    : hr_attrition

 
SELECT * from hr_attrition;
show columns in hr_attrition;
 

-- TOTAL NO OF EMPLOYEES
select count(*) as total_employees 
from hr_attrition;
 
-- TOTAL EMPLOYEES LEFT
select count(*) as employees_left 
from hr_attrition
where attrition = "yes";
 
-- EMPLOYEES STAYED
select count(*) as employees_stayed
from hr_attrition
where attrition = "no";
 
-- ATTRITION RATE
select 
round(
sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2)
as attrition_rate
from hr_attrition;
 

 -- DEPARTMENT WISE ATTRITION RATE
select 
department,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by department
order by attrition_rate desc;
 

 -- IMPACT OF OVERTIME ON ATTRITION RATE
select 
overtime,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by overtime
order by attrition_rate desc;
 

-- IMPACT OF BUSINESS TRAVEL AND EDUCATION FIELD ON ATTRITION RATE
select 
businesstravel,
educationfield,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by businesstravel, educationfield
order by attrition_rate desc;
 

 -- IMPACT OF EXPERIENCE ON ATTRITION RATE
select
case
     when yearsatcompany <= 2 then "0-2 years"
     when yearsatcompany > 2 and yearsatcompany <= 5 then "2-5 years"
     when yearsatcompany > 5 and yearsatcompany <= 10 then "5-10 years"
     else "10+ years"
end as tenure_group,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by tenure_group
order by attrition_rate desc;
 

 -- IMPACT OF PERCENT SALARY HIKE ON ATTRITION RATE
select
case
     when percentsalaryhike <= 15 then "11-15%"
     when percentsalaryhike <= 20 then "16-20%"
     else "21%+"
end as hike_group,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by hike_group
order by attrition_rate desc;
 
 
-- IMPACT OF DISTANCE FROM HOME ON ATTRITION RATE
select
case
     when distancefromhome <= 5 then "0-5 km"
     when distancefromhome > 5 and distancefromhome <= 10 then "5-10 km"
     when distancefromhome > 10 and distancefromhome <= 15 then "10-15 km"
     when distancefromhome > 15 and distancefromhome <= 20 then "15-20 km"
     when distancefromhome > 20 and distancefromhome <= 25 then "20-25 km"
     when distancefromhome > 25 and distancefromhome <= 30 then "25-30 km"
     else "30+ km"
end as distance_group,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by distance_group
order by attrition_rate desc;
 

 
-- MARITAL STATUS VS ATTRITION RATE
select 
maritalstatus,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by maritalstatus
order by attrition_rate desc;
 

-- JOB ROLE VS ATTRITION RATE
select 
jobrole,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by jobrole
order by attrition_rate desc;
 

-- IMPACT OF MONTHLY INCOME ON ATTRITION RATE
select
case
     when monthlyincome <= 5000 then "1000-5000"
     when monthlyincome > 5000 and monthlyincome <= 10000 then "5000-10000"
     when monthlyincome > 10000 and monthlyincome <= 15000 then "10000-15000"
     else "15000+"
end as income_group,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by income_group
order by attrition_rate desc;
 

 -- AGE GROUP VS ATTRITION RATE
select 
age_group,
count(*) as total_employees,
sum(case when attrition = "yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition = "yes" then 1 else 0 end) * 100 / count(*), 2) as attrition_rate
from hr_attrition
group by age_group
order by attrition_rate desc;
 





















 
   
   
   
   
   
   