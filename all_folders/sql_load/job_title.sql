select job_title_short as title,
  job_location as location,
  job_posted_date at time zone 'UTC' at time zone 'EST' as date
from job_postings_fact
LIMIT 5;
select job_title_short as title,
  job_location as location,
  EXTRACT(
    MONTH
    from job_posted_date
  ) as col_month
from job_postings_fact
limit 10;
SELECT job_schedule_type,
  AVG(salary_year_avg) AS avg_salary_year,
  AVG(salary_hour_avg) AS avg_salary_hour
FROM job_postings_fact
WHERE EXTRACT(
    MONTH
    FROM job_posted_date
  ) >= 7
GROUP BY job_schedule_type;
SELECT DATE_TRUNC(
    'month',
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
  ) AS month,
  COUNT(*) AS job_posting_count
FROM job_postings_fact
WHERE EXTRACT(
    YEAR
    FROM job_posted_date
  ) = 2023
GROUP BY month
ORDER BY month;
SELECT company_dim.name
FROM job_postings_fact
  INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE EXTRACT(
    QUARTER
    FROM job_postings_fact.job_posted_date
  ) = 2
  AND EXTRACT(
    YEAR
    FROM job_postings_fact.job_posted_date
  ) = 2023
  AND job_postings_fact.job_health_insurance = true
GROUP BY company_dim.name;
create table january_dates as
select *
from job_postings_fact
where EXTRACT (
    month
    from job_posted_date
  ) = 1;
select *
from january_dates;