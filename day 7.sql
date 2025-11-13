-- 1. Services with more than 100 patients
SELECT
    service,
    COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING COUNT(*) > 100
ORDER BY patient_count DESC;

-- 2. Elderly patients (age >= 65) per service with HAVING
SELECT
    service,
    COUNT(*) AS elderly_count
FROM patients
WHERE age >= 65
GROUP BY service
HAVING COUNT(*) > 20
ORDER BY elderly_count DESC;

-- 3. Multiple HAVING conditions (average satisfaction > 80 and total patients > 50)
SELECT
    service,
    COUNT(*) AS patient_count,
    ROUND(AVG(satisfaction),1) AS avg_satisfaction
FROM patients
GROUP BY service
HAVING AVG(satisfaction) > 80 AND COUNT(*) > 50
ORDER BY avg_satisfaction DESC;

-- 4. Bonus Daily Challenge (simulate "refused" as NULL departure_date)
SELECT
    service,
    COUNT(*) AS total_refused,
    ROUND(AVG(satisfaction),1) AS avg_satisfaction
FROM patients
WHERE departure_date IS NULL
GROUP BY service
HAVING COUNT(*) > 0 AND AVG(satisfaction) < 80
ORDER BY total_refused DESC;
