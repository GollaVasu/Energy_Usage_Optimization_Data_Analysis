create database project;
use project;
SELECT 
    *
FROM
    project;
ALTER TABLE project 
CHANGE COLUMN `Production_Output (tons)` `Production_Output_in_tons` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Energy_Consumption (kWh)` `Energy_Consumption_kwh` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Furnace_Temperature (°C)` `Furnace_Temperature` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Annealing_Time (hrs)` `Annealing_Time_in_hrs` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Downtime (hrs)` `Downtime_hrs` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Ambient_Temperature (°C)` `Ambient_Temperature` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Recycled_Content (%)` `Recycled_Content` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Glass_Thickness (mm)` `Glass_Thickness_mm` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Production_Target (tons)` `Production_Target_tons` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Defects_Percentage (%)` `Defects_Percentage` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Melting_Time (hrs)` `Melting_Time_hrs` FLOAT;

ALTER TABLE project 
CHANGE COLUMN `Cooling_Energy (kWh)` `Cooling_Energy_kwh` FLOAT;

describe project;

SELECT 
    AVG(Production_Output_in_tons) AS Mean_Output,
    AVG(Energy_Consumption_kwh) AS Mean_enegy_consumption,
    AVG(Furnace_Temperature) AS Mean_Ftemp,
    AVG(Annealing_Time_in_hrs) AS Mean_Annealing_time,
    AVG(Downtime_hrs) AS Mean_downtimetime,
    AVG(Ambient_Temperature) AS Mean_Amcient_temp,
    AVG(Recycled_Content) AS Mean_Recycled_content,
    AVG(Glass_Thickness_mm) AS Mean_thickness,
    AVG(Production_Target_tons) AS Mean_target,
    AVG(Defects_Percentage) AS Mean_defects,
    AVG(Melting_Time_hrs) AS Mean_meltingtime,
    AVG(Cooling_Energy_kwh) AS Mean_cooling_energy
FROM
    project;

SELECT Production_Output_in_tons AS median_Column
FROM (
SELECT Production_Output_in_tons, ROW_NUMBER() OVER (ORDER BY Production_Output_in_tons) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Energy_Consumption_kwh AS median_Column
FROM (
SELECT Energy_Consumption_kwh, ROW_NUMBER() OVER (ORDER BY Energy_Consumption_kwh) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Furnace_Temperature AS median_Column
FROM (
SELECT Furnace_Temperature, ROW_NUMBER() OVER (ORDER BY Furnace_Temperature) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Annealing_Time_in_hrs AS median_Column
FROM (
SELECT Annealing_Time_in_hrs, ROW_NUMBER() OVER (ORDER BY Annealing_Time_in_hrs) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Downtime_hrs AS median_Column
FROM (
SELECT Downtime_hrs, ROW_NUMBER() OVER (ORDER BY Downtime_hrs) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Ambient_Temperature AS median_Column
FROM (
SELECT Ambient_Temperature, ROW_NUMBER() OVER (ORDER BY Ambient_Temperature) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


SELECT Recycled_Content AS median_Column
FROM (
SELECT Recycled_Content, ROW_NUMBER() OVER (ORDER BY Recycled_Content) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Glass_Thickness_mm AS median_Column
FROM (
SELECT Glass_Thickness_mm, ROW_NUMBER() OVER (ORDER BY Glass_Thickness_mm) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Production_Target_tons AS median_Column
FROM (
SELECT Production_Target_tons, ROW_NUMBER() OVER (ORDER BY Production_Target_tons) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Defects_Percentage AS median_Column
FROM (
SELECT Defects_Percentage, ROW_NUMBER() OVER (ORDER BY Defects_Percentage) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Melting_Time_hrs AS median_Column
FROM (
SELECT Melting_Time_hrs, ROW_NUMBER() OVER (ORDER BY Melting_Time_hrs) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

SELECT Cooling_Energy_kwh AS median_Column
FROM (
SELECT Cooling_Energy_kwh, ROW_NUMBER() OVER (ORDER BY Cooling_Energy_kwh) AS row_num,
COUNT(*) OVER () AS total_count
FROM project
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;



# mode
SELECT Production_Output_in_tons AS mode_Column
FROM (
SELECT Production_Output_in_tons, COUNT(*) AS frequency
FROM project
GROUP BY Production_Output_in_tons
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Energy_Consumption_kwh AS mode_Column
FROM (
SELECT Energy_Consumption_kwh, COUNT(*) AS frequency
FROM project
GROUP BY Energy_Consumption_kwh
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Furnace_Temperature AS mode_Column
FROM (
SELECT Furnace_Temperature, COUNT(*) AS frequency
FROM project
GROUP BY Furnace_Temperature
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Annealing_Time_in_hrs AS mode_Column
FROM (
SELECT Annealing_Time_in_hrs, COUNT(*) AS frequency
FROM project
GROUP BY Annealing_Time_in_hrs
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Downtime_hrs AS mode_Column
FROM (
SELECT Downtime_hrs, COUNT(*) AS frequency
FROM project
GROUP BY Downtime_hrs
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Ambient_Temperature AS mode_Column
FROM (
SELECT Ambient_Temperature, COUNT(*) AS frequency
FROM project
GROUP BY Ambient_Temperature
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Recycled_Content AS mode_Column
FROM (
SELECT Recycled_Content, COUNT(*) AS frequency
FROM project
GROUP BY Recycled_Content
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Energy_Rating AS mode_Column
FROM (
SELECT Energy_Rating, COUNT(*) AS frequency
FROM project
GROUP BY Energy_Rating
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Maintenance_Flag AS mode_Column
FROM (
SELECT Maintenance_Flag, COUNT(*) AS frequency
FROM project
GROUP BY Maintenance_Flag
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Fuel_Type AS mode_Column
FROM (
SELECT Fuel_Type, COUNT(*) AS frequency
FROM project
GROUP BY Fuel_Type
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Glass_Thickness_mm AS mode_Column
FROM (
SELECT Glass_Thickness_mm, COUNT(*) AS frequency
FROM project
GROUP BY Glass_Thickness_mm
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Production_Target_tons AS mode_Column
FROM (
SELECT Production_Target_tons, COUNT(*) AS frequency
FROM project
GROUP BY Production_Target_tons
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Defects_Percentage AS mode_Column
FROM (
SELECT Defects_Percentage, COUNT(*) AS frequency
FROM project
GROUP BY Defects_Percentage
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Melting_Time_hrs AS mode_Column
FROM (
SELECT Melting_Time_hrs, COUNT(*) AS frequency
FROM project
GROUP BY Melting_Time_hrs
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT Cooling_Energy_kwh AS mode_Column
FROM (
SELECT Cooling_Energy_kwh, COUNT(*) AS frequency
FROM project
GROUP BY Cooling_Energy_kwh
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Shift AS mode_Column
FROM (
SELECT Shift, COUNT(*) AS frequency
FROM project
GROUP BY Shift
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Furnace_ID AS mode_Column
FROM (
SELECT Furnace_ID, COUNT(*) AS frequency
FROM project
GROUP BY Furnace_ID
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Furnace_Type AS mode_Column
FROM (
SELECT Furnace_Type, COUNT(*) AS frequency
FROM project
GROUP BY Furnace_Type
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

SELECT Batch_Type AS mode_Column
FROM (
SELECT Batch_Type, COUNT(*) AS frequency
FROM project
GROUP BY Batch_Type
ORDER BY frequency DESC
LIMIT 1
) AS subquery;


SELECT
    'Production_Output_in_tons' AS Column_Name,
    VAR_POP(Production_Output_in_tons) AS Variance,
    STDDEV_POP(Production_Output_in_tons) AS Standard_Deviation,
    MAX(Production_Output_in_tons) - MIN(Production_Output_in_tons) AS `Range`
FROM project

UNION ALL

SELECT
    'Energy_Consumption_kwh' AS Column_Name,
    VAR_POP(Energy_Consumption_kwh),
    STDDEV_POP(Energy_Consumption_kwh),
    MAX(Energy_Consumption_kwh) - MIN(Energy_Consumption_kwh) AS `Range`
FROM project

UNION ALL

SELECT
    'Furnace_Temperature' AS Column_Name,
    VAR_POP(Furnace_Temperature),
    STDDEV_POP(Furnace_Temperature),
    MAX(Furnace_Temperature) - MIN(Furnace_Temperature) AS `Range`
FROM project

UNION ALL

SELECT
    'Annealing_Time_in_hrs' AS Column_Name,
    VAR_POP(Annealing_Time_in_hrs),
    STDDEV_POP(Annealing_Time_in_hrs),
    MAX(Annealing_Time_in_hrs) - MIN(Annealing_Time_in_hrs) AS `Range`
FROM project

UNION ALL

SELECT
    'Downtime_hrs' AS Column_Name,
    VAR_POP(Downtime_hrs),
    STDDEV_POP(Downtime_hrs),
    MAX(Downtime_hrs) - MIN(Downtime_hrs) AS `Range`
FROM project

UNION ALL

SELECT
    'Ambient_Temperature' AS Column_Name,
    VAR_POP(Ambient_Temperature),
    STDDEV_POP(Ambient_Temperature),
    MAX(Ambient_Temperature) - MIN(Ambient_Temperature) AS `Range`
FROM project

UNION ALL

SELECT
    'Recycled_Content' AS Column_Name,
    VAR_POP(Recycled_Content),
    STDDEV_POP(Recycled_Content),
    MAX(Recycled_Content) - MIN(Recycled_Content) AS `Range`
FROM project;


SELECT
    'Glass_Thickness_mm' AS Column_Name,
    VAR_POP(Glass_Thickness_mm) AS Variance,
    STDDEV_POP(Glass_Thickness_mm) AS Standard_Deviation,
    MAX(Glass_Thickness_mm) - MIN(Glass_Thickness_mm) AS `Range`
FROM project

UNION ALL

SELECT
    'Production_Target_tons' AS Column_Name,
    VAR_POP(Production_Target_tons),
    STDDEV_POP(Production_Target_tons),
    MAX(Production_Target_tons) - MIN(Production_Target_tons) AS `Range`
FROM project

UNION ALL

SELECT
    'Defects_Percentage' AS Column_Name,
    VAR_POP(Defects_Percentage),
    STDDEV_POP(Defects_Percentage),
    MAX(Defects_Percentage) - MIN(Defects_Percentage) AS `Range`
FROM project

UNION ALL

SELECT
    'Melting_Time_hrs' AS Column_Name,
    VAR_POP(Melting_Time_hrs),
    STDDEV_POP(Melting_Time_hrs),
    MAX(Melting_Time_hrs) - MIN(Melting_Time_hrs) AS `Range`
FROM project

UNION ALL

SELECT
    'Cooling_Energy_kwh' AS Column_Name,
    VAR_POP(Cooling_Energy_kwh),
    STDDEV_POP(Cooling_Energy_kwh),
    MAX(Cooling_Energy_kwh) - MIN(Cooling_Energy_kwh) AS `Range`
FROM project;


#skewness

SELECT 
    'Production_Output_in_tons' AS Column_Name,
    SUM(POWER(Production_Output_in_tons - (SELECT AVG(Production_Output_in_tons) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Production_Output_in_tons) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Energy_Consumption_kwh' AS Column_Name,
    SUM(POWER(Energy_Consumption_kwh - (SELECT AVG(Energy_Consumption_kwh) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Energy_Consumption_kwh) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Furnace_Temperature' AS Column_Name,
    SUM(POWER(Furnace_Temperature - (SELECT AVG(Furnace_Temperature) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Furnace_Temperature) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Annealing_Time_in_hrs' AS Column_Name,
    SUM(POWER(Annealing_Time_in_hrs - (SELECT AVG(Annealing_Time_in_hrs) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Annealing_Time_in_hrs) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Downtime_hrs' AS Column_Name,
    SUM(POWER(Downtime_hrs - (SELECT AVG(Downtime_hrs) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Downtime_hrs) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Ambient_Temperature' AS Column_Name,
    SUM(POWER(Ambient_Temperature - (SELECT AVG(Ambient_Temperature) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Ambient_Temperature) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Recycled_Content' AS Column_Name,
    SUM(POWER(Recycled_Content - (SELECT AVG(Recycled_Content) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Recycled_Content) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Glass_Thickness_mm' AS Column_Name,
    SUM(POWER(Glass_Thickness_mm - (SELECT AVG(Glass_Thickness_mm) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Glass_Thickness_mm) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Production_Target_tons' AS Column_Name,
    SUM(POWER(Production_Target_tons - (SELECT AVG(Production_Target_tons) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Production_Target_tons) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Defects_Percentage' AS Column_Name,
    SUM(POWER(Defects_Percentage - (SELECT AVG(Defects_Percentage) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Defects_Percentage) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Melting_Time_hrs' AS Column_Name,
    SUM(POWER(Melting_Time_hrs - (SELECT AVG(Melting_Time_hrs) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Melting_Time_hrs) FROM project), 3)) AS Skewness
FROM project

UNION ALL

SELECT 
    'Cooling_Energy_kwh' AS Column_Name,
    SUM(POWER(Cooling_Energy_kwh - (SELECT AVG(Cooling_Energy_kwh) FROM project), 3)) /
    (COUNT(*) * POWER((SELECT STDDEV(Cooling_Energy_kwh) FROM project), 3)) AS Skewness
FROM project;


# kurtosis

SELECT
    'Production_Output_in_tons' AS Column_Name,
    (
        (SUM(POWER(Production_Output_in_tons - (SELECT AVG(Production_Output_in_tons) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Production_Output_in_tons) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Energy_Consumption_kwh' AS Column_Name,
    (
        (SUM(POWER(Energy_Consumption_kwh - (SELECT AVG(Energy_Consumption_kwh) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Energy_Consumption_kwh) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Furnace_Temperature' AS Column_Name,
    (
        (SUM(POWER(Furnace_Temperature - (SELECT AVG(Furnace_Temperature) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Furnace_Temperature) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Annealing_Time_in_hrs' AS Column_Name,
    (
        (SUM(POWER(Annealing_Time_in_hrs - (SELECT AVG(Annealing_Time_in_hrs) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Annealing_Time_in_hrs) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Downtime_hrs' AS Column_Name,
    (
        (SUM(POWER(Downtime_hrs - (SELECT AVG(Downtime_hrs) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Downtime_hrs) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Ambient_Temperature' AS Column_Name,
    (
        (SUM(POWER(Ambient_Temperature - (SELECT AVG(Ambient_Temperature) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Ambient_Temperature) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Recycled_Content' AS Column_Name,
    (
        (SUM(POWER(Recycled_Content - (SELECT AVG(Recycled_Content) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Recycled_Content) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Glass_Thickness_mm' AS Column_Name,
    (
        (SUM(POWER(Glass_Thickness_mm - (SELECT AVG(Glass_Thickness_mm) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Glass_Thickness_mm) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Production_Target_tons' AS Column_Name,
    (
        (SUM(POWER(Production_Target_tons - (SELECT AVG(Production_Target_tons) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Production_Target_tons) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Defects_Percentage' AS Column_Name,
    (
        (SUM(POWER(Defects_Percentage - (SELECT AVG(Defects_Percentage) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Defects_Percentage) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Melting_Time_hrs' AS Column_Name,
    (
        (SUM(POWER(Melting_Time_hrs - (SELECT AVG(Melting_Time_hrs) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Melting_Time_hrs) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project

UNION ALL

SELECT
    'Cooling_Energy_kwh' AS Column_Name,
    (
        (SUM(POWER(Cooling_Energy_kwh - (SELECT AVG(Cooling_Energy_kwh) FROM project), 4)) /
        (COUNT(*) * POWER((SELECT STDDEV(Cooling_Energy_kwh) FROM project), 4))) - 3
    ) AS Kurtosis
FROM project;





