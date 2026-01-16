/* Advanced Aggregations
Purpose: Calculating the percentage of population served using CTEs.
This demonstrates the ability to perform multi-layer calculations.
*/

WITH province_totals AS (
    SELECT
        province_name,
        SUM(number_of_people_served) AS total_ppl
    FROM combined_analysis_table
    GROUP BY province_name
)
SELECT
    ct.province_name,
    ct.type_of_water_source,
    ROUND((SUM(ct.number_of_people_served) / pt.total_ppl) * 100, 2) AS percentage_served
FROM combined_analysis_table AS ct
JOIN province_totals AS pt ON ct.province_name = pt.province_name
GROUP BY ct.province_name, ct.type_of_water_source, pt.total_ppl
ORDER BY ct.province_name, percentage_served DESC;
