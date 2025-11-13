-- 21 Days SQL Challenge – Day 4

-- 1️ Display the first 5 patients
SELECT *
FROM patients
LIMIT 5;

-- 2️ Show patients 11–20 using OFFSET
SELECT *
FROM patients
LIMIT 10 OFFSET 10;

-- 3️ Get the 10 most recent patient admissions based on arrival_date
SELECT *
FROM patients
ORDER BY arrival_date DESC
LIMIT 10;

--  Daily Challenge:
-- Find the 3rd to 7th highest patient satisfaction scores,
-- showing patient_id, name, service, and satisfaction
SELECT
    patient_id,
    name,
    service,
    satisfaction
FROM patients
ORDER BY satisfaction DESC
LIMIT 5 OFFSET 2;
