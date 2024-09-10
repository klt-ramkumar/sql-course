WITH top_paying_skill AS (
select 
job_id,
job_title,
job_country,
salary_year_avg,
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
)
SELECT top_paying_skill.*,
skills
FROM top_paying_skill
INNER JOIN skills_job_dim
ON
top_paying_skill.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON
skills_job_dim.skill_id = skills_dim.skill_id

