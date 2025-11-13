
SELECT * 
FROM patients;


SELECT patient_id, name, age
FROM patients;

SELECT * 
FROM services_weekly
LIMIT 10;

SELECT DISTINCT service
FROM services_weekly
ORDER BY service;

SELECT COUNT(DISTINCT service) AS total_unique_services
FROM services_weekly;
