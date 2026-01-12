
-- Average length of stay by department
SELECT d.department_name,
       AVG(DATEDIFF(dis.discharge_date, a.admission_date)) AS avg_length_of_stay
FROM admissions a
JOIN discharges dis ON a.admission_id = dis.admission_id
JOIN departments d ON a.department_id = d.department_id
GROUP BY d.department_name;

-- Admission trends over time
SELECT DATE_FORMAT(admission_date, '%Y-%m-01') AS month,
       COUNT(*) AS admissions
FROM admissions
GROUP BY month
ORDER BY month;
