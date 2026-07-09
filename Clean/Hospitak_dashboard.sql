
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
SELECT  "Hospital Type",ROUND(AVG("Hospital overall rating")) AS Rating FROM  public.hospital_general_information
WHERE "Hospital overall rating" IS NOT NULL
GROUP BY "Hospital Type"
ORDER BY rating desc;

--	Count hospitals with emergency services.
SELECT COUNT(*) FROM  public.hospital_general_information
WHERE "Emergency Services"='Yes';

--	Count hospitals without emergency services.

SELECT  COUNT(*) FROM  public.hospital_general_information
WHERE "Emergency Services"='No';

--	Find states having more than 100 hospitals.
SELECT "State" ,COUNT("Facility Name") as Number_of_hospital FROM hospital_general_information
GROUP BY "State"
HAVING COUNT("Facility Name") > 100
ORDER BY Number_of_hospital DESC ;

--	Find hospital ownership types with more than 50 hospitals.
SELECT "Hospital Ownership",COUNT("Facility Name") as Number_of_hospital FROM hospital_general_information
GROUP BY "Hospital Ownership"
HAVING COUNT("Facility Name") > 50
ORDER BY Number_of_hospital DESC;


--	Find hospital types with average rating above 3.

SELECT "Hospital Type", AVG("Hospital overall rating") AS Average_Rating
FROM hospital_general_information
GROUP BY "Hospital Type"
HAVING AVG("Hospital overall rating") > 3;




------------------------------------------------------------------------------------------------------------------------------

--- 1. Hospital Rating vs HAC Score
-- Do hospitals with higher quality ratings have lower HAC (Hospital Acquired Condition) scores?
SELECT 
    h."Facility ID", 
    h."Facility Name", 
    h."Hospital overall rating", 
    f."Total HAC Score" 
FROM public.hospital_general_information h
JOIN public.fy_2026_hac_reduction_program_hospital f 
  ON h."Facility ID"::text = f."Facility ID"::text
  WHERE "Hospital overall rating" IS NOT NULL OR "Total HAC Score"  IS NOT NULL;

SELECT * FROM public.hospital_general_information;

SELECT * FROM public.fy_2026_hac_reduction_program_hospital;

SELECT 
    h."Facility ID", 
    h."Facility Name", 
    h."Hospital overall rating", 
    f."Total HAC Score" 
FROM public.hospital_general_information h
JOIN public.fy_2026_hac_reduction_program_hospital f 
  ON h."Facility ID"::text = f."Facility ID"::text
  WHERE "Total HAC Score"  IS NOT NULL AND "Hospital overall rating"=5 ;

SELECT 
    h."Facility ID", 
    h."Facility Name", 
    h."Hospital overall rating", 
    f."Total HAC Score" 
FROM public.hospital_general_information h
JOIN public.fy_2026_hac_reduction_program_hospital f 
  ON h."Facility ID"::text = f."Facility ID"::text
  WHERE "Total HAC Score"  IS NOT NULL AND "Hospital overall rating"=1 ;  

---- Does a higher hospital quality rating correlate with better patient safety outcomes?

SELECT  
    h."Hospital overall rating", 
    AVG(f."Total HAC Score") AS avg_hac_scores 
FROM public.hospital_general_information h
JOIN public.fy_2026_hac_reduction_program_hospital f 
  ON h."Facility ID"::text = f."Facility ID"::text
  WHERE "Total HAC Score"  IS NOT NULL AND  "Hospital overall rating" IS NOT NULL
  
  GROUP BY "Hospital overall rating"
  ORDER BY "Hospital overall rating" asc ;    

----- find the top 10 hospital with lowest HAC score OR Top 10 Best-Performing Hospitals for Patient Safety
SELECT 
   h."Facility Name", 
   f."Total HAC Score"
FROM   public.hospital_general_information h
JOIN public.fy_2026_hac_reduction_program_hospital f 
  ON h."Facility ID"::text = f."Facility ID"::text 
  WHERE f."Total HAC Score"  IS NOT NULL
  ORDER BY f."Total HAC Score" ASC  limit 10 ;

----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------******************** Hospital Rating vs Readmission Ratio ***************-----------------------------------------

SELECT * FROM public.hospital_general_information;
SELECT * FROM public.fy_2026_hospital_readmissions_reduction_program_hospital;

------ Find the hospitals with Readmission Ratio > 1 means These hospitals perform worse than expected.
SELECT    h."Facility Name",
          r."Excess Readmission Ratio",
		  r."Measure Name",
		  h."Hospital overall rating"
FROM 	public.hospital_general_information h
JOIN    public.fy_2026_hospital_readmissions_reduction_program_hospital r
  ON    h."Facility ID"::text = r."Facility ID"::text 
WHERE   r."Excess Readmission Ratio">1  AND r."Excess Readmission Ratio" IS NOT NULL
ORDER BY r."Excess Readmission Ratio" DESC;


-------- Find the hospitals with Readmission Ratio > 1 means These hospitals perform better than expected.
SELECT    h."Facility Name",
          AVG(r."Excess Readmission Ratio") AS "Avg Readmission Ratio",
		  r."Measure Name",
		  h."Hospital overall rating"
FROM 	public.hospital_general_information h
JOIN    public.fy_2026_hospital_readmissions_reduction_program_hospital r
  ON    h."Facility ID"::text = r."Facility ID"::text 
WHERE   r."Excess Readmission Ratio" < 1  AND r."Excess Readmission Ratio" IS NOT NULL
ORDER BY r."Excess Readmission Ratio" asc;



-----Calculate: Average Readmission Ratio for each rating group.
SELECT 
    
	h."Hospital overall rating",
	
    AVG(r."Excess Readmission Ratio") AS "Avg Readmission Ratio"
FROM public.hospital_general_information h
JOIN public.fy_2026_hospital_readmissions_reduction_program_hospital r
  ON h."Facility ID"::text = r."Facility ID"::text 
WHERE r."Excess Readmission Ratio" IS NOT NULL and h."Hospital overall rating" IS NOT NULL
GROUP BY h."Hospital overall rating"
ORDER BY h."Hospital overall rating" DESC;


--- Find Top 10 Hospitals with Lowest Readmission Ratio
SELECT 
        h."Facility Name",
    AVG(r."Excess Readmission Ratio") AS "Avg Readmission Ratio"
FROM public.hospital_general_information h
JOIN public.fy_2026_hospital_readmissions_reduction_program_hospital r
  ON h."Facility ID"::text = r."Facility ID"::text 
WHERE r."Excess Readmission Ratio" IS NOT NULL 
GROUP BY  h."Facility Name"
ORDER BY "Avg Readmission Ratio"  ASC LIMIT 10 ;

---Find Bottom 10 Hospitals with: Highest Readmission Ratio
SELECT 
        h."Facility Name",
    AVG(r."Excess Readmission Ratio") AS "Avg Readmission Ratio"
FROM public.hospital_general_information h
JOIN public.fy_2026_hospital_readmissions_reduction_program_hospital r
  ON h."Facility ID"::text = r."Facility ID"::text 
WHERE r."Excess Readmission Ratio" IS NOT NULL 
GROUP BY  h."Facility Name"
ORDER BY "Avg Readmission Ratio"  desc LIMIT 10 ;


----Find measures with highest readmission ratios. Examples: Heart Failure Pneumonia COPD AMI Hip/Knee Replacement
SELECT "Measure Name" ,AVG("Excess Readmission Ratio") AS avg_ratio   FROM public.fy_2026_hospital_readmissions_reduction_program_hospital
GROUP BY "Measure Name" 
ORDER BY avg_ratio DESC ;

--- Calculate average readmission ratio by state.
SELECT  "State" ,AVG("Excess Readmission Ratio") AS avg_ratio
FROM public.fy_2026_hospital_readmissions_reduction_program_hospital
GROUP BY "State"
ORDER BY avg_ratio DESC;

------------------------------------------****************** Hospital Rating vs Infection Score ******************--------------------------------------------------------------------------


SELECT * FROM public.hospital_general_information;

SELECT * FROM public."healthcare_associated_infections-hospital";

---- Find hospitals performing:Better than National for infection measures.

SELECT "Facility Name","Compared to National" FROM public."healthcare_associated_infections-hospital"
WHERE "Compared to National"='Better than the National Benchmark';

-- Find hospitals performing: Worse than National for infection measures.

SELECT "Facility Name","Compared to National" FROM public."healthcare_associated_infections-hospital"
WHERE "Compared to National"='Worse than the National Benchmark';

--- Calculate: Average Infection Score by Hospital Rating.
SELECT h."Hospital overall rating",AVG(a."Score") FROM  public.hospital_general_information h
JOIN public."healthcare_associated_infections-hospital" a
ON h."Facility ID"=a."Facility ID"
WHERE h."Hospital overall rating" IS NOT NULL
GROUP BY h."Hospital overall rating"
ORDER BY h."Hospital overall rating";

--- Find Top 10 Hospitals with: Lowest Infection Score
SELECT "Facility Name", AVG(CAST("Score" AS NUMERIC)) AS "Avg_Infection_Score"
FROM public."healthcare_associated_infections-hospital"
GROUP BY "Facility Name"
ORDER BY "Avg_Infection_Score" ASC
LIMIT 10;

-- Find Bottom 10 Hospitals with: Highest Infection Score
SELECT "Facility Name", AVG(CAST("Score" AS NUMERIC)) AS "Avg_Infection_Score"
FROM public."healthcare_associated_infections-hospital"
WHERE "Score" IS NOT NULL
GROUP BY "Facility Name"
ORDER BY "Avg_Infection_Score" DESC
LIMIT 10;

--- Count hospitals by infection performance.
SELECT "Compared to National",COUNT("Facility Name") AS number_of_hospital FROM public."healthcare_associated_infections-hospital"
GROUP BY "Compared to National"
ORDER BY number_of_hospital desc;

------------------------------------------------- ****************************** State-Wise Quality Analysis ********************---------------------------------------------------
--- Count hospitals in each state.
SELECT "State",COUNT("Facility Name") AS number_of_hospital FROM public."healthcare_associated_infections-hospital"
GROUP BY "State"
ORDER BY number_of_hospital desc;

---- Find average hospital rating by state.
SELECT "State",avg("Hospital overall rating")  AS AVG_rating  FROM public.hospital_general_information
WHERE  "Hospital overall rating" IS NOT NULL
GROUP BY "State"
ORDER BY AVG_rating desc;

