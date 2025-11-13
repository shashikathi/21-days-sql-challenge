SELECT
    patient_id,
    name,
    age,
    satisfaction
FROM patients
WHERE service ILIKE 'surgery'
  AND satisfaction < 70
ORDER BY satisfaction ASC;
