-- Current date
SELECT CURRENT_DATE AS today;

-- Add or subtract days
SELECT 
    CURRENT_DATE + INTERVAL '7 days'  AS next_week,
    CURRENT_DATE - INTERVAL '30 days' AS last_month;

-- Difference in days between two dates
SELECT 
    DATE '2025-11-13' - DATE '2025-11-01' AS days_diff;

-- Extract year, month, and day from a date column
SELECT 
    patient_id,
    EXTRACT(YEAR FROM arrival_date)  AS arrival_year,
    EXTRACT(MONTH FROM arrival_date) AS arrival_month,
    EXTRACT(DAY FROM arrival_date)   AS arrival_day
FROM patients;

-- Calculate length of stay in days
SELECT
    patient_id,
    name,
    arrival_date,
    departure_date,
    (departure_date - arrival_date) AS stay_days
FROM patients;

-- Challenge: Average stay duration per service where average stay > 7 days
SELECT
    service,
    COUNT(*) AS total_patients,
    ROUND(AVG(departure_date - arrival_date), 1) AS avg_stay_days
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY avg_stay_days DESC;
