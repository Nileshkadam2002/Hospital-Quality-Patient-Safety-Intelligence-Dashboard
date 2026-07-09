"Compared to National"SELECT * FROM public.cms_psi_6_decimal_file;
SELECT * FROM public."complications_and_deaths-hospital";
SELECT * FROM public.fy_2026_hac_reduction_program_hospital;
SELECT * FROM public.fy_2026_hospital_readmissions_reduction_program_hospital;
SELECT * FROM public."healthcare_associated_infections-hospital";
SELECT * FROM public.hospital_general_information;

---  Hospital Information
--- 1.Count total hospitals
SELECT COUNT("Facility ID") FROM  hospital_general_information;

-- 2.List all hospital names and states.
SELECT "Facility Name","State" FROM hospital_general_information;

-- 3.Find hospitals in California.
SELECT "Facility Name" ,"State" FROM hospital_general_information
WHERE "State"='CA';


-- 4.Find hospitals with Emergency Services = Yes.
SELECT  "Facility Name","Emergency Services" FROM hospital_general_information
WHERE "Emergency Services"='Yes';

-- 5.Count hospitals by state.
SELECT "State",COUNT("Facility Name") AS Number_of_Hospital FROM  hospital_general_information
GROUP BY "State"
ORDER BY Number_of_Hospital DESC;

-- 6.Count hospitals by ownership type
SELECT "Hospital Ownership" ,COUNT("Facility Name") AS Number_of_Hospital
FROM hospital_general_information
GROUP BY "Hospital Ownership" 
ORDER BY Number_of_Hospital DESC;

-- 7.Count hospitals by hospital type.
SELECT "Hospital Type" ,COUNT("Facility Name") AS Number_of_Hospital 
FROM hospital_general_information
GROUP BY "Hospital Type"
ORDER BY Number_of_Hospital DESC;

-- 8.Find hospitals with a 5-star rating.
SELECT "Facility Name","Hospital overall rating" 
FROM hospital_general_information
WHERE "Hospital overall rating"=5;

-- 9.Find hospitals with a rating less than 3.
SELECT "Facility Name","Hospital overall rating" 
FROM hospital_general_information
WHERE "Hospital overall rating"<3;

------------------------------************************* Mortality Analysis **************************---------------------------
-- 10 Count total mortality measures.
SELECT COUNT(DISTINCT "Measure Name") 
FROM public."complications_and_deaths-hospital";

-- 11. List all mortality measure names.
SELECT DISTINCT "Measure Name" FROM public."complications_and_deaths-hospital";

-- 12. Find hospitals performing better than national average.
SELECT "Facility Name","Compared to National" FROM public."complications_and_deaths-hospital"
WHERE "Compared to National"= 'Better Than the National Rate';

SELECT  "Compared to National",COUNT("Measure Name") FROM public."complications_and_deaths-hospital"
GROUP BY  "Compared to National";

-- 13. Find hospitals performing worse than national average.
SELECT "Facility Name","Compared to National" FROM public."complications_and_deaths-hospital"
WHERE "Compared to National"= 'Worse Than the National Rate';

-- 14. Calculate average mortality score.
SELECT AVG("Score") from public."complications_and_deaths-hospital";

SELECT AVG("Score"::numeric)
FROM public."complications_and_deaths-hospital"
WHERE "Score" ~ '^[0-9.]+$';
---              ^: Matches the beginning of the string.

--               [: Starts a character class (a set of allowed characters).

--               0-9: Allows any digit from 0 through 9.

--               .: Allows a decimal point (because mortality scores often contain decimals).

--                ]: Ends the character class.

--                 +: A "quantifier" that means "one or more" of the characters defined above. It ensures the cell isn't empty.

--                 $: Matches the end of the string.

-- 15. Find highest mortality score.
SELECT MAX("Score"::numeric)
FROM public."complications_and_deaths-hospital"
WHERE "Score" ~ '^[0-9.]+$';

-- 16. Find lowest mortality score.
SELECT MIN("Score"::numeric)
FROM public."complications_and_deaths-hospital"
WHERE "Score" ~ '^[0-9.]+$';

-------------------------************************************ Infection Analysis ***********************-----------------------------------------
-- 17.Count total infection records.
SELECT COUNT("Measure Name") FROM public."healthcare_associated_infections-hospital";

SELECT COUNT(*) FROM public."healthcare_associated_infections-hospital";

-- 18.Find average infection score by measure.


SELECT 
    "Measure Name", 
    ROUND(AVG("Score")::numeric, 2) AS AVG_score
FROM public."healthcare_associated_infections-hospital"
GROUP BY "Measure Name";

-- 19. List hospitals with infection performance worse than national average.
SELECT "Facility Name","Compared to National" FROM public."healthcare_associated_infections-hospital"
WHERE "Compared to National"='Worse than the National Benchmark';


---------------------------------*************** miscellaneous Qustions *************--------------------------------------------
-- Count hospitals in each state.
SELECT "State",COUNT("Facility Name")as number_of_hospital FROM public.hospital_general_information
GROUP BY "State"
ORDER BY number_of_hospital desc;

-- Find the top 10 states with the most hospitals.
SELECT "State",COUNT("Facility Name")as number_of_hospital FROM public.hospital_general_information
GROUP BY "State"
ORDER BY number_of_hospital desc LIMIT 10;

-- Find the average hospital rating by state.
SELECT "State",AVG("Hospital overall rating") as rating FROM public.hospital_general_information
WHERE "Hospital overall rating" IS NOT NULL
GROUP BY "State"
ORDER BY rating desc ;


-- Find the average hospital rating by ownership type.
SELECT "Hospital Ownership",ROUND(AVG("Hospital overall rating"),2) as rating FROM public.hospital_general_information
WHERE "Hospital overall rating" IS NOT NULL 
GROUP BY "Hospital Ownership"
ORDER BY rating DESC ;

--	Find the average hospital rating by hospital type.
--	Count hospitals with emergency services.
--	Count hospitals without emergency services.
--	Find states having more than 100 hospitals.
--	Find hospital ownership types with more than 50 hospitals.
--	Find hospital types with average rating above 3.

