USE enterprise_risk_analysis;

INSERT INTO risk_reviews
(
    review_id,
    risk_id,
    review_date,
    likelihood,
    impact,
    review_notes
)
VALUES
(1,1,'2026-06-15',4,5,'Risk remains high due to increasing cyber threats'),
(2,2,'2026-06-18',3,5,'Encryption project progressing'),
(3,3,'2026-06-22',4,4,'Recruitment campaign underway'),
(4,4,'2026-06-25',3,3,'Alternative suppliers identified'),
(5,5,'2026-06-28',3,5,'Audit scheduled'),
(6,6,'2026-07-01',2,5,'Backups successfully tested'),
(7,7,'2026-07-05',2,5,'No irregularities detected'),
(8,8,'2026-07-08',3,5,'Training rollout delayed'),
(9,9,'2026-07-10',2,4,'Upgrade approved'),
(10,10,'2026-07-12',4,5,'Recovery testing planned'),
(11,11,'2026-07-15',3,4,'Training materials prepared'),
(12,12,'2026-07-18',3,4,'Maintenance contract renewed'),
(13,13,'2026-07-20',3,3,'Budget within acceptable limits'),
(14,14,'2026-07-22',3,4,'Complaint process under review'),
(15,15,'2026-07-25',2,4,'Supplier review completed');

SELECT *
FROM risk_reviews;
