/* Data Cleaning & Integrity
Project: Maji Ndogo Water Crisis Analysis
Purpose: To identify and correct discrepancies between field reports and lab results.
I found 'False Cleans' where biological contaminants were present despite being marked safe.
*/

-- 1. Identify the 'False Cleans'
-- These are records where the field worker recorded 'Clean' but lab results show high bacteria.
SELECT *
FROM well_pollution
WHERE results = 'Clean' 
AND biological > 0.01;

-- 2. Updated records to reflect scientific reality
-- This ensures our final analysis doesn't recommend 'Clean' water that is actually toxic.
UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE results = 'Clean'
AND biological > 0.01;

-- 3. Standardize Chemical labels
-- Finding any inorganic contaminants to ensure consistency in reporting.
SELECT *
FROM well_pollution
WHERE description LIKE 'Inorganic%';
