/* Project Implementation Report
Purpose: Generating the final engineering plan. 
This script maps specific water issues to technical solutions.
*/

CREATE TABLE Project_Implementation_Report AS
SELECT
    province_name,
    town_name,
    type_of_water_source,
    pollution_status,
    CASE
        WHEN pollution_status = 'Contaminated: Biological' THEN 'Install UV Filter'
        WHEN pollution_status = 'Contaminated: Chemical' THEN 'Install RO Filter'
        WHEN type_of_water_source = 'tap_in_home_broken' THEN 'Replace Infrastructure'
        WHEN type_of_water_source = 'river' THEN 'Drill New Well'
        WHEN type_of_water_source = 'shared_tap' AND time_in_queue >= 30 THEN 'Install Additional Tap'
        ELSE 'General Maintenance'
    END AS technical_solution
FROM combined_analysis_table
WHERE province_name IS NOT NULL;

-- Final count of required units for the budget report
SELECT 
    technical_solution,
    COUNT(*) AS units_required
FROM Project_Implementation_Report
GROUP BY technical_solution;
