USE enterprise_risk_analysis;

INSERT INTO departments
(department_id,
department_name)
VALUES
(1, 'Information Technology'),
(2, 'Clinical Services'),
(3, 'Finance'),
(4, 'Human Resources'),
(5, 'Operations'),
(6, 'Compliance and Governance'),
(7, 'Procurement'),
(8, 'Facilities');

INSERT INTO owners
(owner_id,
owner_name,
job_title,
department_id)
VALUES
(1, 'Sarah Mitchell', 'IT Security Manager', 1),
(2, 'David Clarke', 'Clinical Operations Manager', 2),
(3, 'Emma Walsh', 'Finance Manager', 3),
(4, 'Michael Byrne', 'HR Manager', 4),
(5, 'Laura Kelly', 'Operations Manager', 5),
(6, 'James Murphy', 'Governance and Compliance Lead', 6),
(7, 'Aisha Khan', 'Procurement Manager', 7),
(8, 'Daniel Hughes', 'Facilities Manager', 8),
(9, 'Rachel O''Connor', 'Data Protection Officer', 6),
(10, 'Thomas Reid', 'Business Continuity Manager', 5);

SELECT *
FROM departments;

SELECT *
FROM owners;
