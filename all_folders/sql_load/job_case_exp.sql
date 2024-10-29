SELECT 

  
    count(job_id) as number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'remote'
        WHEN job_location = 'New York' THEN 'local'
        ELSE 'other'
    END AS location_cat
FROM job_postings_fact
GROUP BY location_cat;
SELECT 
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg > 100000 THEN 'High'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC;
