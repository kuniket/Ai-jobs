CREATE DATABASE JOBS;
use jobs;
-- count total number of records
select count(*) as total_records
from aijobs;

-- unique values in each column
select 
count(distinct job_title) as unique_job_title,
count(distinct industry) as unique_industry,
count(distinct company_size) as unique_company_size,
count(distinct location) as unique_location,
count(distinct ai_adoption_level) as unique_ai_adoption_level,
count(distinct automation_risk) as unique_automation_risk,
count(distinct required_skills) as unique_required_skills,
count(distinct salary_usd) as unique_salary_usd,
count(distinct remote_friendly) as unique_remote_friendly,
count(distinct job_growth_projection) as unique_job_growth_projection
from aijobs;


-- check duplicate Entries
select* from aijobs
group by job_title,industry,company_size,location,location,ai_adoption_level,required_skills,automation_risk,salary_usd,
remote_friendly,job_growth_projection
having count(*)>1;

 -- Calculate the location with the highest average salary
 SELECT Location,
AVG(Salary_USD) AS Average_Salary
FROM aijobs
GROUP BY Location
ORDER BY Average_Salary DESC
LIMIT 5;



-- which required skills are high demand across different job titles
select required_skills, count(*) as demand
from aijobs
group by required_skills
 order by demand desc;
 
 -- do remote friendly job pay more or less on average
 select remote_friendly, round(avg(salary_usd),2) as avg_salary
 from aijobs
 group by remote_friendly
 order by avg_salary desc;

-- How many industry and job titles are counted as High Risk
SELECT Industry, Job_Title, 
COUNT(*) AS High_Risk_Count
FROM aijobs
WHERE Automation_Risk = 'High'
GROUP BY Industry, Job_Title;

-- Total number of null values in every column
select
sum(case when job_title is null then 1 else 0 end) as missing_jobt_itle,
sum(case when industry is null then 1 else 0 end) as missing_industry,
sum(case when company_size is null then 1 else 0 end) as missing_company_size,
sum(case when location is null then 1 else 0 end) as missing_location,
sum(case when ai_adoption_level is null then 1 else 0 end) as missing_adoption_level,
sum(case when automation_risk is null then 1 else 0 end) as missing_automation_risk,
sum(case when required_skills is null then 1 else 0 end) as missing_required_skill ,
sum(case when salary_usd is null then 1 else 0 end) as missing_salary_usd,
sum(case when remote_friendly is null then 1 else 0 end) as missing_remote_friendly,
sum(case when job_growth_projection is null then 1 else 0 end) as missing_job_growth_projection
from aijobs;

-- calculate the location with the highest average salary
select location,
avg(salary_usd) as Average_Salary
From aijobs
group by location
order by Average_Salary Desc
Limit 5;

-- List of Industries with thier required skills
select required_skills,industry,
count(*) as number_of_jobs
from aijobs
group by industry,required_skills
order by industry,number_of_jobs desc;

-- average salary as per company size
select company_size,avg(salary_usd)
from aijobs
group by company_size
limit 3;

-- number of job titles in dubai
select job_title
from aijobs
where location = 'dubai';