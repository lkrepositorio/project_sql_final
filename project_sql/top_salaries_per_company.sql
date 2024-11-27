SELECT
    name AS company_name,
    salary_year_avg,
    job_title,
    job_id,
    job_location,
    job_schedule_type,
    job_posted_date
FROM   
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_work_from_home = TRUE AND (job_title_short = 'Data Analyst') AND (salary_year_avg IS NOT NULL)
ORDER BY
    salary_year_avg DESC
LIMIT 10


-- This query show us the top 10 company salaries and the position for Data Analytics