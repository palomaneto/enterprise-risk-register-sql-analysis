USE enterprise_risk_analysis;

CREATE TABLE departments
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE owners
(
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE risks
(
    risk_id INT PRIMARY KEY,
    risk_title VARCHAR(200) NOT NULL,
    risk_category VARCHAR(100),
    department_id INT,
    owner_id INT,
    likelihood INT,
    impact INT,
    risk_status VARCHAR(50),
    identified_date DATE,
    review_due_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    FOREIGN KEY (owner_id)
        REFERENCES owners(owner_id)
);

CREATE TABLE controls
(
    control_id INT PRIMARY KEY,
    risk_id INT,
    control_description VARCHAR(255),
    control_status VARCHAR(50),
    control_owner VARCHAR(100),
    due_date DATE,
    FOREIGN KEY (risk_id)
        REFERENCES risks(risk_id)
);

CREATE TABLE risk_reviews
(
    review_id INT PRIMARY KEY,
    risk_id INT,
    review_date DATE,
    likelihood INT,
    impact INT,
    review_notes VARCHAR(255),
    FOREIGN KEY (risk_id)
        REFERENCES risks(risk_id)
);

SHOW TABLES;
