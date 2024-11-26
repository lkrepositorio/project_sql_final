WITH top_salary_comp AS (
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM   
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_work_from_home = TRUE AND (job_title_short = 'Data Analyst') AND (salary_year_avg IS NOT NULL)
)

SELECT
    tsc.job_id,
    tsc.company_name,
    tsc.job_title,
    tsc.salary_year_avg,
    sd.skills AS skills

FROM top_salary_comp AS tsc

LEFT JOIN skills_job_dim AS sjd ON sjd.job_id = tsc.job_id
LEFT JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE
    sd.skills IS NOT NULL 
--- ESTE WHERE ANULA LA COMPANIA CON MAYOR SALARIO YA QUE NO CONTIENE UN SKILL ID 
ORDER BY
    salary_year_avg DESC
LIMIT 40;


--- FOR TESTING --- 
SELECT * FROM skills_dim LIMIT 20
SELECT * FROM job_postings_fact LIMIT 20
SELECT * FROM skills_job_dim LIMIT 20