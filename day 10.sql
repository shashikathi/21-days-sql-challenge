-- Simple CASE: categorize satisfaction levels
SELECT
    name,
    satisfaction,
    CASE 
        WHEN satisfaction >= 90 THEN 'Excellent'
        WHEN satisfaction >= 75 THEN 'Good'
        WHEN satisfaction >= 60 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS satisfaction_category
FROM patients;

-- Classify patients by age group
SELECT
    name,
    age,
    CASE
        WHEN age < 18 THEN 'Pediatric'
        WHEN age BETWEEN 18 AND 40 THEN 'Adult'
        WHEN age BETWEEN 41 AND 65 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group
FROM patients;

-- Conditional aggregation: count high/low satisfaction
SELECT
    service,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN satisfaction >= 80 THEN 1 ELSE 0 END) AS high_satisfaction_count,
    SUM(CASE WHEN satisfaction < 60 THEN 1 ELSE 0 END)  AS low_satisfaction_count
FROM patients
GROUP BY service;

-- Using CASE in ORDER BY for custom sort
SELECT
    service,
    COUNT(*) AS total_patients
FROM patients
GROUP BY service
ORDER BY CASE
    WHEN service = 'Emergency' THEN 1
    WHEN service = 'ICU' THEN 2
    ELSE 3
END;

-- Challenge: service performance report
SELECT
    service,
    COUNT(*) AS total_patients,
    ROUND(AVG(satisfaction), 1) AS avg_satisfaction,
    CASE
        WHEN AVG(satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(satisfaction) >= 75 THEN 'Good'
        WHEN AVG(satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM patients
GROUP BY service
ORDER BY avg_satisfaction DESC;
