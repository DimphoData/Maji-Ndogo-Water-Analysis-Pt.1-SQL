/* Exploratory Data Analysis (EDA)
Purpose: Determining where the biggest delays and shortages are occurring.
*/

-- 1. Average queue times per water source type
-- Helps identify which infrastructure is over-capacity.
SELECT 
    type_of_water_source, 
    ROUND(AVG(time_in_queue), 0) AS avg_wait_time
FROM visits AS v
JOIN water_source AS ws ON v.source_id = ws.source_id
GROUP BY type_of_water_source
ORDER BY avg_wait_time DESC;

-- 2. Regional breakdown of source types
-- Which provinces rely most on unprotected sources (like rivers)?
SELECT 
    l.province_name, 
    ws.type_of_water_source, 
    COUNT(ws.source_id) AS number_of_sources
FROM location AS l
JOIN visits AS v ON l.location_id = v.location_id
JOIN water_source AS ws ON v.source_id = ws.source_id
GROUP BY l.province_name, ws.type_of_water_source
ORDER BY l.province_name, number_of_sources DESC;
