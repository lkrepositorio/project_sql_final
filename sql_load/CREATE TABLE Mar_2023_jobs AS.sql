CREATE TABLE Mar_2023_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT * From Mar_2023_jobs