
CRM Sales Analysis — SQL JOINs
Dataset: Kaggle CRM Sales Dataset
Language: PostgreSQL
Topics: Basic to Intermediate JOINs
1. INNER JOIN — Opportunities with matching accounts
Purpose: Retrieve opportunities that have a matching company in the accounts table.
SELECT
    sp.opportunity_id,
    sp.account,
    a.sector,
    sp.deal_stage,
    sp.close_value
FROM sales_pipeline AS sp
INNER JOIN accounts AS a
    ON sp.account = a.account;


2. LEFT JOIN — All opportunities with company details
Purpose: Retrieve all opportunities, including those without a matching account.
SELECT
    sp.opportunity_id,
    sp.account,
    a.sector,
    a.revenue,
    sp.deal_stage
FROM sales_pipeline AS sp
LEFT JOIN accounts AS a
    ON sp.account = a.account;


3. RIGHT JOIN — All accounts with their opportunities
Purpose: Retrieve all companies, including those without matching opportunities.
SELECT
    sp.opportunity_id,
    a.account,
    a.sector,
    sp.deal_stage,
    sp.close_value
FROM sales_pipeline AS sp
RIGHT JOIN accounts AS a
    ON sp.account = a.account;


4. FULL OUTER JOIN — All matching and unmatched records
Purpose: Retrieve all records from both tables, whether they match or not.
SELECT
    sp.opportunity_id,
    sp.account AS pipeline_account,
    a.account AS company_account,
    a.sector,
    sp.deal_stage
FROM sales_pipeline AS sp
FULL OUTER JOIN accounts AS a
    ON sp.account = a.account;


5. MULTIPLE JOINs — Opportunities, companies and sales agents
Purpose: Combine three tables to analyse opportunities, company sectors, sales agents and their managers.
SELECT
    sp.opportunity_id,
    sp.account,
    a.sector,
    sp.sales_agent,
    st.manager,
    st.regional_office,
    sp.close_value
FROM sales_pipeline AS sp
LEFT JOIN accounts AS a
    ON sp.account = a.account
LEFT JOIN sales_teams AS st
    ON sp.sales_agent = st.sales_agent;


6. SELF JOIN — Sales agents under the same manager
Purpose: Identify colleagues who report to the same manager.
SELECT
    a.sales_agent,
    a.manager,
    b.sales_agent AS colleague
FROM sales_teams AS a
JOIN sales_teams AS b
    ON a.manager = b.manager
    AND a.sales_agent <> b.sales_agent
ORDER BY a.manager;


7. CROSS JOIN — Every product with every sales agent
Purpose: Generate all possible product and sales-agent combinations.
SELECT
    p.product,
    st.sales_agent,
    st.regional_office
FROM products AS p
CROSS JOIN sales_teams AS st;


8. ANTI JOIN — Opportunities without matching accounts
Purpose: Identify opportunities whose account does not exist in the accounts table.
SELECT
    sp.opportunity_id,
    sp.account,
    sp.deal_stage,
    sp.close_value
FROM sales_pipeline AS sp
LEFT JOIN accounts AS a
    ON sp.account = a.account
WHERE a.account IS NULL;


9. JOIN + GROUP BY — Sales value by company sector
Purpose: Calculate the number of opportunities and total closing value for each sector.
SELECT
    a.sector,
    COUNT(*) AS opportunity_count,
    SUM(sp.close_value) AS total_close_value
FROM sales_pipeline AS sp
INNER JOIN accounts AS a
    ON sp.account = a.account
GROUP BY a.sector
ORDER BY total_close_value DESC NULLS LAST;


10. JOIN + CASE — Classify opportunities by deal stage
Purpose: Categorise opportunities as successful, unsuccessful or in progress.
SELECT
    sp.opportunity_id,
    sp.account,
    sp.deal_stage,
    sp.close_value,
    CASE
        WHEN sp.deal_stage = 'Won' THEN 'Successful'
        WHEN sp.deal_stage = 'Lost' THEN 'Unsuccessful'
        ELSE 'In Progress'
    END AS deal_status
FROM sales_pipeline AS sp
LEFT JOIN accounts AS a
    ON sp.account = a.account
ORDER BY sp.opportunity_id;
