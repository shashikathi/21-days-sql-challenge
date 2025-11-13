SELECT 
    week,
    month,
    service,
    patient_satisfaction,
    patients_admitted
FROM services_weekly
WHERE service = 'surgery'
  AND patient_satisfaction < 70
ORDER BY patient_satisfaction ASC;
