/*
my role = data analyst -> where job_name = "data analyst"
in demand skills -> Count (data analyst role ) group by skills 

*/

WITH top_salary_comp AS (
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_title_short
FROM   
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_work_from_home = TRUE AND (job_title_short = 'Data Analyst') AND (salary_year_avg IS NOT NULL)
)

SELECT
    sd.skills AS skills,
    COUNT(tsc.job_title_short) AS count_da

FROM top_salary_comp AS tsc

LEFT JOIN skills_job_dim AS sjd ON sjd.job_id = tsc.job_id
LEFT JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE
    sd.skills IS NOT NULL 

GROUP BY
    skills 
ORDER BY
    count_da DESC
LIMIT 10;


-- This query shows the top 10 skills demanded for Data Analist role, and the result show us that the most demanded skills are SQL, Excel and Python