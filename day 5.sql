-- Day 5: Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
-- Using columns: arrival_date, age, departure_date, satisfaction, name, service, patient_id

-- 1. Basic Counts
SELECT 
    COUNT(*) AS total_patients,
    COUNT(patient_id) AS total_with_id,
    COUNT(DISTINCT service) AS unique_services
FROM patients;

-- 2. Summation and Averages
SELECT 
    SUM(satisfaction) AS total_satisfaction,
    AVG(satisfaction) AS avg_satisfaction,
    ROUND(AVG(satisfaction), 2) AS rounded_avg
FROM patients;

-- 3. Minimum and Maximum
SELECT 
    MIN(age) AS youngest_patient,
    MAX(age) AS oldest_patient
FROM patients;

-- 4. Aggregation with Filter
SELECT 
    COUNT(*) AS cardiology_patients,
    ROUND(AVG(satisfaction), 2) AS cardiology_avg_satisfaction
FROM patients
WHERE service = 'Cardiology';

-- 5. Combined Aggregates
SELECT 
    COUNT(*) AS total_patients,
    AVG(age) AS avg_age,
    MIN(age) AS youngest,
    MAX(age) AS oldest,
    SUM(satisfaction) AS total_satisfaction
FROM patients;

-- 6. Daily Challenge (Adjusted for Your Table)
-- Admitted → arrival_date present
-- Discharged → departure_date present
-- Average satisfaction across all patients
SELECT
    COUNT(CASE WHEN arrival_date IS NOT NULL THEN 1 END) AS total_admitted,
    COUNT(CASE WHEN departure_date IS NOT NULL THEN 1 END) AS total_discharged,
    ROUND(AVG(satisfaction), 2) AS avg_satisfaction
FROM patients;
