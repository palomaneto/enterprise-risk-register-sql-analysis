USE enterprise_risk_analysis;

INSERT INTO controls
(
    control_id,
    risk_id,
    control_description,
    control_status,
    control_owner,
    due_date
)
VALUES
(1,1,'Multi-factor authentication implemented','Complete','Sarah Mitchell','2026-07-20'),
(2,2,'Encrypt patient records','In Progress','Rachel O''Connor','2026-08-01'),
(3,3,'Recruit additional clinical staff','In Progress','Michael Byrne','2026-08-15'),
(4,4,'Identify alternative suppliers','Complete','Aisha Khan','2026-07-25'),
(5,5,'Clinical documentation audit','In Progress','David Clarke','2026-08-05'),
(6,6,'Monthly backup testing','Complete','Thomas Reid','2026-07-30'),
(7,7,'Quarterly financial audits','Complete','Emma Walsh','2026-08-10'),
(8,8,'Compliance training programme','In Progress','James Murphy','2026-08-20'),
(9,9,'Upgrade access control system','Planned','Daniel Hughes','2026-09-01'),
(10,10,'Disaster recovery testing','In Progress','Thomas Reid','2026-08-12'),
(11,11,'Mandatory GDPR refresher','Planned','Rachel O''Connor','2026-08-25'),
(12,12,'Preventive equipment maintenance','Complete','David Clarke','2026-08-18'),
(13,13,'Monthly budget monitoring','In Progress','Emma Walsh','2026-08-22'),
(14,14,'Improve complaints escalation process','Planned','Laura Kelly','2026-08-28'),
(15,15,'Annual supplier compliance review','Complete','Aisha Khan','2026-09-05');

SELECT *
FROM controls;
