/*
=========================================================
Advanced-Level (ongoing training w/ GeeksforGeeks and Copilot)

Enterprise Risk Register SQL Analysis
File: 10_executive_risk_dashboard.sql

Objective:
Create executive-level reports that support strategic
risk oversight and decision-making.
=========================================================
*/

USE enterprise_risk_analysis;

-- Executive Report 1
-- Top 10 highest risks

SELECT
    risk_title,
    risk_category,
    likelihood,
    impact,
    likelihood * impact AS risk_score,
    risk_status
FROM risks
ORDER BY risk_score DESC
LIMIT 10;

-- Executive Report 2
-- Highest risk departments

SELECT
    d.department_name,
    SUM(r.likelihood * r.impact) AS total_risk_score
FROM departments d
INNER JOIN risks r
ON d.department_id = r.department_id
GROUP BY d.department_name
ORDER BY total_risk_score DESC;

-- Executive Report 3
-- Highest risk owners

SELECT
    o.owner_name,
    o.job_title,
    SUM(r.likelihood * r.impact) AS total_risk_score
FROM owners o
INNER JOIN risks r
ON o.owner_id = r.owner_id
GROUP BY
    o.owner_name,
    o.job_title
ORDER BY total_risk_score DESC;

-- Executive Report 4
-- Open risks by category

SELECT
    risk_category,
    COUNT(*) AS total_open_risks
FROM risks
WHERE risk_status = 'Open'
GROUP BY risk_category
ORDER BY total_open_risks DESC;

-- Executive Report 5
-- Controls requiring attention

SELECT
    control_description,
    control_owner,
    control_status,
    due_date
FROM controls
WHERE control_status <> 'Complete'
ORDER BY due_date;
