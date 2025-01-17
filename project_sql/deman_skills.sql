SELECT 
skills,
COUNT (skills_job_dim.job_id) as Total_count
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short= 'Data Analyst'
-- job_country = 'united kingdom'
GROUP BY 
skills
ORDER BY Total_count DESC
LIMIT 5 