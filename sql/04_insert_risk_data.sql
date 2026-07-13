USE enterprise_risk_analysis;

INSERT INTO risks
(
    risk_id,
    risk_title,
    risk_category,
    department_id,
    owner_id,
    likelihood,
    impact,
    risk_status,
    identified_date,
    review_due_date
)
VALUES
(1, 'Cyberattack affecting clinical systems', 'Cybersecurity', 1, 1, 4, 5, 'Open', '2026-01-10', '2026-08-15'),
(2, 'Loss of sensitive patient data', 'Data Protection', 6, 9, 3, 5, 'Open', '2026-01-18', '2026-08-20'),
(3, 'Staff shortages affecting service delivery', 'Workforce', 4, 4, 4, 4, 'Open', '2026-02-02', '2026-07-30'),
(4, 'Delayed supplier deliveries', 'Supply Chain', 7, 7, 3, 3, 'Monitoring', '2026-02-12', '2026-09-01'),
(5, 'Incorrect clinical documentation', 'Clinical Governance', 2, 2, 3, 5, 'Open', '2026-02-20', '2026-08-05'),
(6, 'Failure of backup systems', 'Business Continuity', 1, 10, 2, 5, 'Monitoring', '2026-03-01', '2026-09-10'),
(7, 'Fraudulent financial transactions', 'Financial', 3, 3, 2, 5, 'Open', '2026-03-10', '2026-08-25'),
(8, 'Non-compliance with regulatory requirements', 'Compliance', 6, 6, 3, 5, 'Open', '2026-03-18', '2026-07-28'),
(9, 'Building access control failure', 'Facilities', 8, 8, 2, 4, 'Monitoring', '2026-04-01', '2026-09-15'),
(10, 'Extended clinical system downtime', 'Operational', 5, 10, 4, 5, 'Open', '2026-04-12', '2026-08-10'),
(11, 'Inadequate staff data protection training', 'Data Protection', 4, 9, 3, 4, 'Open', '2026-04-25', '2026-08-30'),
(12, 'Treatment delays caused by equipment failure', 'Clinical Operations', 2, 2, 3, 4, 'Monitoring', '2026-05-03', '2026-09-20'),
(13, 'Budget overspend within operational services', 'Financial', 3, 3, 3, 3, 'Open', '2026-05-16', '2026-09-05'),
(14, 'Poor handling of patient complaints', 'Reputational', 5, 5, 3, 4, 'Open', '2026-05-28', '2026-08-18'),
(15, 'Supplier contract not meeting compliance standards', 'Procurement', 7, 7, 2, 4, 'Monitoring', '2026-06-02', '2026-09-25');

SELECT *
FROM risks
ORDER BY risk_id;
