/*
=========================================================
Advanced-Level (ongoing training w/ GeeksforGeeks)

Enterprise Risk Register SQL Analysis
File: 07_risk_scoring_analysis.sql

Objective:
Calculate, classify and rank enterprise risks using
likelihood and impact scores.
=========================================================
*/
USE enterprise_risk_analysis;

-- Business Question 1
-- Calculate the risk score for every risk.

SELECT
    risk_id,
    risk_title,
    risk_category,
    likelihood,
    impact,
    likelihood * impact AS risk_score
FROM risks
ORDER BY risk_score DESC;

-- Business Question 2
-- Classify risks by severity.

SELECT
    risk_id,
    risk_title,
    risk_category,
    likelihood,
    impact,
    likelihood * impact AS risk_score,
    CASE
        WHEN likelihood * impact >= 16 THEN 'Critical'
        WHEN likelihood * impact >= 10 THEN 'High'
        WHEN likelihood * impact >= 5 THEN 'Medium'
        ELSE 'Low'
    END AS risk_level
FROM risks
ORDER BY risk_score DESC;

-- Business Question 3
-- Count the number of risks in each severity category.

WITH scored_risks AS
(
    SELECT
        risk_id,
        CASE
            WHEN likelihood * impact >= 16 THEN 'Critical'
            WHEN likelihood * impact >= 10 THEN 'High'
            WHEN likelihood * impact >= 5 THEN 'Medium'
            ELSE 'Low'
        END AS risk_level
    FROM risks
)

SELECT
    risk_level,
    COUNT(*) AS total_risks
FROM scored_risks
GROUP BY risk_level
ORDER BY total_risks DESC;

-- Business Question 4
-- Show only the risks requiring immediate attention.

SELECT
    risk_id,
    risk_title,
    risk_category,
    likelihood,
    impact,
    likelihood * impact AS risk_score,
    risk_status,
    review_due_date
FROM risks
WHERE likelihood * impact >= 16
ORDER BY risk_score DESC;

-- Business Question 5
-- Rank all risks from highest to lowest severity.

SELECT
    risk_id,
    risk_title,
    risk_category,
    likelihood,
    impact,
    likelihood * impact AS risk_score,
    DENSE_RANK() OVER
    (
        ORDER BY likelihood * impact DESC
    ) AS severity_rank
FROM risks;
