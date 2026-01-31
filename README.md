# Healthcare Operations & Patient Flow Analytics

This project analyses hospital patient admissions and discharges to support operational decision-making using SQL and Power BI.

## Overview
This project uses **MySQL** to process patient stay data and **Power BI** to visualize hospital throughput, and bed turnover rates.

## Additional Operational Analyses
- Average Length of Stay by Department
- Admissions Trends Over Time
- Operational Efficiency Metrics
- Peak Admission Period Analysis
- Bed Capacity Gap Analysis

## Insights
1. Declining Patient Throughput
The Total Admissions by Month and Patient Growth Percent charts show a concerning downward trend. Admissions peaked early in the year (January and April) but plummeted by 60% in May. This could indicate seasonal fluctuations, a shift in regional healthcare needs, or operational bottlenecks preventing new intakes.

2. High Bed Vacancy Rates
The Avg Empty Bed Days by Department shows that beds are sitting empty for an average of 23 to 24.5 days.

Surgery has the highest vacancy (24.5 days).

In a high-functioning hospital, high vacancy combined with low admissions suggests underutilization of resources. The hospital is maintaining staff and facilities for beds that are not being filled.

3. Length of Stay (LOS) Discrepancy
There is a massive gap between the Shortest Stay (8 days) and the Longest Stay (28 days).

An Average LOS of 16.8 days is quite high for general operations, which may explain why the readmission rate is 0.00. Patients are staying so long that they are likely fully recovered (or being moved to long-term care), but this prevents high patient turnover.

## Strategic Recommendations
Based on these analytics, the following operational adjustments are recommended:

Optimize Bed Utilization
The hospital currently has a high "Average Empty Bed Day" count across all departments.

Recommendation: Investigate if the low admission rate in May is due to a lack of demand or a high "Average Length of Stay" blocking new patients. If demand is low, consider consolidating wards to reduce overhead costs during "dry" months.

Investigate the Admission Drop-off
The -60% growth in May is a critical red flag.

Recommendation: Perform a "Peak Admission Period Analysis" (as mentioned in your goals) to see if this is a recurring seasonal trend. If not, check for external factors such as new competing facilities or changes in insurance provider networks.

Reduce Average Length of Stay (ALOS)
The current ALOS of 16.8 days suggests a slow discharge process.

Recommendation: Implement a "Discharge Planning" protocol that begins within 24 hours of admission. Reducing the ALOS by even 2 days could significantly increase the capacity to take on new patients, improving the "Total Admissions" metric.
