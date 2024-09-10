select 
job_id,
job_title,
job_country,
job_schedule_type,
salary_year_avg,
job_posted_date,
NAME AS company_name
from job_postings_fact
left JOIN company_dim 
ON 
job_postings_fact.company_id = company_dim.company_id
WHERE job_country = 'United Kingdom' AND
      job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
select 
count (job_id) as total_job
FROM job_postings_fact
WHERE job_country = 'United Kingdom' AND
      job_title_short = 'Data Analyst' 
/*