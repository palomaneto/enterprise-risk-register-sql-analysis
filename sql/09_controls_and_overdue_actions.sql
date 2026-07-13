/*
=========================================================
Advanced-Level (ongoing training w/ GeeksforGeeks and Copilot)

Enterprise Risk Register SQL Analysis
File: 09_controls_and_overdue_actions.sql

Objective:
Assess control status, identify overdue actions and
highlight risks with incomplete mitigation measures.
=========================================================
*/

USE enterprise_risk_analysis;

-- Business Question 1
-- How many controls fall under each status?

SELECT
    control_status,
    COUNT(*) AS total_controls
FROM controls
GROUP BY control_status
ORDER BY total_controls DESC;

-- Business Question 2
-- Which controls are overdue?

SELECT
    control_id,
    risk_id,
    control_description,
    control_status,
    control_owner,
    due_date
FROM controls
WHERE due_date < CURDATE()
  AND control_status <> 'Complete'
ORDER BY due_date;

-- Business Question 3
-- Which risks have incomplete controls?

SELECT
    r.risk_id,
    r.risk_title,
    r.risk_category,
    c.control_description,
    c.control_status,
    c.control_owner,
    c.due_date
FROM risks r
INNER JOIN controls c
    ON r.risk_id = c.risk_id
WHERE c.control_status <> 'Complete'
ORDER BY c.due_date;

-- Business Question 4
-- Which high-severity risks still have incomplete controls?

SELECT
    r.risk_id,
    r.risk_title,
    r.likelihood * r.impact AS risk_score,
    c.control_description,
    c.control_status,
    c.due_date
FROM risks r
INNER JOIN controls c
    ON r.risk_id = c.risk_id
WHERE r.likelihood * r.impact >= 10
  AND c.control_status <> 'Complete'
ORDER BY risk_score DESC, c.due_date;

-- Business Question 5
-- Summarise control completion by risk category.

SELECT
    r.risk_category,
    COUNT(c.control_id) AS total_controls,
    SUM(CASE WHEN c.control_status = 'Complete' THEN 1 ELSE 0 END) AS completed_controls,
    SUM(CASE WHEN c.control_status <> 'Complete' THEN 1 ELSE 0 END) AS incomplete_controls
FROM risks r
INNER JOIN controls c
    ON r.risk_id = c.risk_id
GROUP BY r.risk_category
ORDER BY incomplete_controls DESC;
