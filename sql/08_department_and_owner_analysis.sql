/*
=========================================================
Advanced-Level (ongoing training w/ GeeksforGeeks)

Enterprise Risk Register SQL Analysis
File: 08_department_and_owner_analysis.sql

Objective:
Analyse which departments and risk owners carry the
greatest concentration of enterprise risk.
=========================================================
*/

USE enterprise_risk_analysis;

-- Business Question 1
-- Which departments own the highest number of risks?

SELECT
    d.department_name,
    COUNT(r.risk_id) AS total_risks
FROM departments d
LEFT JOIN risks r
    ON d.department_id = r.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_risks DESC;

-- Business Question 2
-- Which departments have the highest cumulative risk score?

SELECT
    d.department_name,
    SUM(r.likelihood * r.impact) AS cumulative_risk_score
FROM departments d
INNER JOIN risks r
    ON d.department_id = r.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY cumulative_risk_score DESC;

-- Business Question 3
-- What is the average risk score by department?

SELECT
    d.department_name,
    ROUND(AVG(r.likelihood * r.impact), 2) AS average_risk_score
FROM departments d
INNER JOIN risks r
    ON d.department_id = r.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY average_risk_score DESC;

-- Business Question 4
-- Which risk owners are responsible for the highest cumulative risk?

SELECT
    o.owner_name,
    o.job_title,
    d.department_name,
    COUNT(r.risk_id) AS total_risks,
    SUM(r.likelihood * r.impact) AS cumulative_risk_score
FROM owners o
INNER JOIN departments d
    ON o.department_id = d.department_id
INNER JOIN risks r
    ON o.owner_id = r.owner_id
GROUP BY
    o.owner_id,
    o.owner_name,
    o.job_title,
    d.department_name
ORDER BY cumulative_risk_score DESC;

-- Business Question 5
-- Rank risk owners by cumulative risk score.

WITH owner_risk_scores AS
(
    SELECT
        o.owner_id,
        o.owner_name,
        o.job_title,
        SUM(r.likelihood * r.impact) AS cumulative_risk_score
    FROM owners o
    INNER JOIN risks r
        ON o.owner_id = r.owner_id
    GROUP BY
        o.owner_id,
        o.owner_name,
        o.job_title
)

SELECT
    owner_name,
    job_title,
    cumulative_risk_score,
    DENSE_RANK() OVER
    (
        ORDER BY cumulative_risk_score DESC
    ) AS owner_risk_rank
FROM owner_risk_scores;
