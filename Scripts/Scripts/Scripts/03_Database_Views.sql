/* Database Engineering
Purpose: Creating a 'Master View' to simplify complex joins for stakeholders.
*/

-- Create a permanent view for the analysis team
CREATE VIEW combined_analysis_table AS
SELECT
    l.province_name,
    l.town_name,
    l.location_type,
    ws.type_of_water_source,
    ws.number_of_people_served,
    v.time_in_queue,
    wp.results AS pollution_status
FROM location AS l
JOIN visits AS v ON l.location_id = v.location_id
JOIN water_source AS ws ON v.source_id = ws.source_id
LEFT JOIN well_pollution AS wp ON ws.source_id = wp.source_id;
