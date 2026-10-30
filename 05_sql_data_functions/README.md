Module 04: Date Functions — PostgreSQL
Dataset: sales_pipeline

Important columns:
- engage_date
- close_date
- opportunity_id
- deal_stage
- close_value
Part A: CURRENT_DATE
1. Display the current date.
SELECT CURRENT_DATE AS today;


Explanation: CURRENT_DATE returns the current date according to the database session's time zone.
2. Calculate how many days have passed since each opportunity was engaged.
SELECT opportunity_id,
       engage_date,
       CURRENT_DATE - engage_date AS days_since_engagement
FROM sales_pipeline;


Explanation: Subtracts the engagement date from today's date to calculate the number of elapsed days.
Part B: CURRENT_TIMESTAMP
3. Display the current date and time.
SELECT CURRENT_TIMESTAMP AS current_date_time;


Explanation: CURRENT_TIMESTAMP returns the current date and time, including time-zone information.
4. Display opportunities along with the current timestamp.
SELECT opportunity_id,
       sales_agent,
       deal_stage,
       CURRENT_TIMESTAMP AS query_time
FROM sales_pipeline
LIMIT 10;


Explanation: Adds the current timestamp to each returned opportunity record.
Part C: EXTRACT()
5. Extract the year from the closing date.
SELECT opportunity_id,
       close_date,
       EXTRACT(YEAR FROM close_date) AS close_year
FROM sales_pipeline
WHERE close_date IS NOT NULL;


Explanation: EXTRACT() retrieves a specific date component, such as the year.
6. Extract the month from the closing date.
SELECT opportunity_id,
       close_date,
       EXTRACT(MONTH FROM close_date) AS close_month
FROM sales_pipeline
WHERE close_date IS NOT NULL;


Explanation: Extracts the month as a number from 1 to 12.
Part D: DATE_PART()
7. Extract the year from the engagement date.
SELECT opportunity_id,
       engage_date,
       DATE_PART('year', engage_date) AS engage_year
FROM sales_pipeline;


Explanation: DATE_PART() retrieves a selected component of a date or timestamp.
8. Extract the month from the closing date.
SELECT opportunity_id,
       close_date,
       DATE_PART('month', close_date) AS close_month
FROM sales_pipeline
WHERE close_date IS NOT NULL;


Explanation: Extracts the month number from the closing date.
Part E: AGE()
9. Calculate the duration between engagement and closing dates.
SELECT opportunity_id,
       engage_date,
       close_date,
       AGE(close_date, engage_date) AS closing_duration
FROM sales_pipeline
WHERE close_date IS NOT NULL;


Explanation: AGE() calculates the difference between two dates and returns an interval in years, months, and days.
10. Calculate how long open opportunities have been active.
SELECT opportunity_id,
       engage_date,
       AGE(CURRENT_DATE, engage_date) AS active_duration
FROM sales_pipeline
WHERE close_date IS NULL;


Explanation: Calculates the duration from the engagement date until today for opportunities that have not been closed.
Part F: Date Subtraction
11. Calculate the number of days taken to close each opportunity.
SELECT opportunity_id,
       engage_date,
       close_date,
       close_date - engage_date AS days_to_close
FROM sales_pipeline
WHERE close_date IS NOT NULL;


Explanation: Subtracting one date from another returns the number of days between them.
12. Find opportunities that took more than 30 days to close.
SELECT opportunity_id,
       engage_date,
       close_date,
       close_date - engage_date AS days_to_close
FROM sales_pipeline
WHERE close_date IS NOT NULL
  AND close_date - engage_date > 30;


Explanation: Filters opportunities that required more than 30 days to close.
Part G: BETWEEN
13. Find opportunities engaged during 2017.
SELECT opportunity_id,
       sales_agent,
       engage_date
FROM sales_pipeline
WHERE engage_date BETWEEN DATE '2017-01-01'
                      AND DATE '2017-12-31';


Explanation: BETWEEN selects dates within the specified range, including both endpoints.
14. Find opportunities closed during the first quarter of 2017.
SELECT opportunity_id,
       close_date,
       deal_stage,
       close_value
FROM sales_pipeline
WHERE close_date BETWEEN DATE '2017-01-01'
                     AND DATE '2017-03-31';
