
-- Average Length of Stay by Department
WITH StayDurations AS (
    SELECT 
        d.department_name,
        DATEDIFF(dis.discharge_date, a.admission_date) AS stay_length
    FROM admissions a
    JOIN discharges dis ON a.admission_id = dis.admission_id
    JOIN departments d ON a.department_id = d.department_id
)
SELECT 
    department_name,
    AVG(stay_length) AS avg_length_of_stay,
    MAX(stay_length) AS longest_stay,
    MIN(stay_length) AS shortest_stay
FROM StayDurations
GROUP BY department_name;

-- Admissions Trends over time
WITH MonthlyAdmissions AS (
    SELECT 
        DATE_FORMAT(admission_date, '%Y-%m-01') AS month,
        COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY month
)
SELECT 
    month,
    total_admissions,
    LAG(total_admissions) OVER (ORDER BY month) AS prev_month_admissions,
    ROUND(((total_admissions - LAG(total_admissions) OVER (ORDER BY month)) / 
           NULLIF(LAG(total_admissions) OVER (ORDER BY month), 0)) * 100, 2) AS mom_growth_percent
FROM MonthlyAdmissions
ORDER BY month;

-- Operational Efficiency Metrics
WITH PatientHistory AS (
    SELECT 
        patient_id,
        admission_date,
        LAG(admission_date) OVER (PARTITION BY patient_id ORDER BY admission_date) AS prev_admission_date
    FROM admissions
)
SELECT 
    COUNT(*) AS total_admissions,
    SUM(CASE WHEN DATEDIFF(admission_date, prev_admission_date) <= 30 THEN 1 ELSE 0 END) AS readmissions_30_days,
    ROUND(SUM(CASE WHEN DATEDIFF(admission_date, prev_admission_date) <= 30 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS readmission_rate
FROM PatientHistory;

-- Peak Admission Hour
WITH HourlyVolume AS (
    SELECT 
        HOUR(admission_date) AS admission_hour,
        COUNT(*) AS volume
    FROM admissions
    GROUP BY admission_hour
)
SELECT 
    admission_hour,
    volume,
    CASE 
        WHEN volume > (SELECT AVG(volume) FROM HourlyVolume) THEN 'High Demand'
        ELSE 'Normal Demand'
    END AS staffing_indicator
FROM HourlyVolume
ORDER BY volume DESC;
