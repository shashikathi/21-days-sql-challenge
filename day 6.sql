------------------------------------------------------------
-- DAY 6: GROUP BY Clause — Aggregating by Categories
------------------------------------------------------------
-- Goal: Summarize data per group (for example, service, role)
-- Common aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()
------------------------------------------------------------


------------------------------------------------------------
-- 1. Count number of patients per service
------------------------------------------------------------
SELECT
    service,                        
    COUNT(*) AS patient_count        
FROM patients
GROUP BY service;
-- Each unique service produces one result row with the total number of patients


------------------------------------------------------------
-- 2. Average age of patients per service
------------------------------------------------------------
SELECT
    service,
    AVG(age) AS avg_age              
FROM patients
GROUP BY service;
-- Useful for comparing age profiles across departments


------------------------------------------------------------
-- 3. Total staff count per role
------------------------------------------------------------
SELECT
    role,
    COUNT(*) AS staff_count          
FROM staff
GROUP BY role;
-- Shows how many staff members work in each role


------------------------------------------------------------
-- 4. Multiple aggregates per service
------------------------------------------------------------
SELECT
    service,
    COUNT(*) AS total_patients,      
    AVG(age) AS avg_age,             
    AVG(satisfaction) AS avg_satisfaction
FROM patients
GROUP BY service
ORDER BY total_patients DESC;
-- Displays multiple statistics per service and sorts by total patients


------------------------------------------------------------
-- 5. Group by multiple columns (for example, service and age group)
------------------------------------------------------------
SELECT
    service,
    CASE
        WHEN age >= 65 THEN 'Senior'
        ELSE 'Adult'
    END AS age_group,
    COUNT(*) AS patient_count
FROM patients
GROUP BY service, age_group;
-- Produces a breakdown by both service and age group


-------------------------------------------------
-- 6. Daily Challenge — Admission Statistics per Service

SELECT
    service,

    SUM(CASE WHEN admission_status = 'Admitted' THEN 1 ELSE 0 END) AS total_admitted,
    SUM(CASE WHEN admission_status = 'Refused' THEN 1 ELSE 0 END) AS total_refused,

    ROUND(
        (SUM(CASE WHEN admission_status = 'Admitted' THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*), 2
    ) AS admission_rate

FROM patients
GROUP BY service
ORDER BY admission_rate DESC;
-- Shows which service has the highest or lowest admission efficiency


-- 7. Example: Filtering after aggregation using HAVING
SELECT
    service,
    COUNT(*) AS total_patients
FROM patients
GROUP BY service
HAVING COUNT(*) > 10
ORDER BY total_patients DESC;
-- HAVING filters groups after aggregation is complete


