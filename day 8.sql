-- 1. Summary stats per service
SELECT
    service,
    COUNT(*) AS total_patients,
    ROUND(AVG(age),1) AS avg_age,
    ROUND(AVG(satisfaction),1) AS avg_satisfaction,
    ROUND(AVG(COALESCE(departure_date - arrival_date,0)),1) AS avg_stay_days
FROM patients
GROUP BY service
ORDER BY total_patients DESC;

-- 2. Services with high average stay (>7 days) and high satisfaction (>80)
SELECT
    service,
    COUNT(*) AS total_patients,
    ROUND(AVG(satisfaction),1) AS avg_satisfaction,
    ROUND(AVG(COALESCE(departure_date - arrival_date,0)),1) AS avg_stay_days
FROM patients
GROUP BY service
HAVING AVG(COALESCE(departure_date - arrival_date,0)) > 7
   AND AVG(satisfaction) > 80
ORDER BY avg_stay_days DESC;

-- 3. Age-based grouping with HAVING (only include groups with >5 patients)
SELECT
    CASE
        WHEN age >= 65 THEN 'Senior'
        ELSE 'Adult'
    END AS age_group,
    service,
    COUNT(*) AS patient_count,
    ROUND(AVG(satisfaction),1) AS avg_satisfaction
FROM patients
GROUP BY service, age_group
HAVING COUNT(*) > 5
ORDER BY service, age_group;
