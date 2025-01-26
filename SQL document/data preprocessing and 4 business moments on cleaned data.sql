create database glass_manufacturing_energy_optimization_2;
use  glass_manufacturing_energy_optimization_2;
describe glass_manufacturing_energy_optimization_2;


#Typecasting 
DESCRIBE glass_manufacturing_energy_optimization_2;

SELECT CAST(Date AS datetime) AS column_Date
FROM glass_manufacturing_energy_optimization_2;

SELECT Shift AS column_Shift
FROM glass_manufacturing_energy_optimization_2;

SELECT Furnace_ID AS column_Shift
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Furnace_ID AS CHAR(20)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Furnace_Type AS CHAR(20)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Batch_Type AS CHAR(20)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Energy_Rating AS CHAR(3)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Maintenance_Flag AS CHAR(5)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

SELECT CAST(Fuel_Type AS CHAR(20)) AS column_Furnace_ID
FROM glass_manufacturing_energy_optimization_2;

#Count_Duplicates

SELECT Shift, COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY Shift
HAVING COUNT(*) > 1;

SELECT Furnace_ID, COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY Furnace_ID
HAVING COUNT(*) > 1;

SELECT Furnace_Type, COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY Furnace_Type
HAVING COUNT(*) > 1;

SELECT Batch_Type, COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY Batch_Type
HAVING COUNT(*) > 1;

SELECT 'Production_Output (tons)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Production_Output (tons)'
HAVING COUNT(*) > 1;

SELECT 'Energy_Consumption (kWh)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Energy_Consumption (kWh)'
HAVING COUNT(*) > 1;

SELECT 'Furnace_Temperature (Â°C)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Furnace_Temperature (Â°C)'
HAVING COUNT(*) > 1;

SELECT 'Annealing_Time (hrs)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Annealing_Time (hrs)'
HAVING COUNT(*) > 1;

SELECT 'Downtime (hrs)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Downtime (hrs)'
HAVING COUNT(*) > 1;

SELECT 'Ambient_Temperature (Â°C)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Ambient_Temperature (Â°C)'
HAVING COUNT(*) > 1;

SELECT 'Recycled_Content (%)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Recycled_Content (%)'
HAVING COUNT(*) > 1;

SELECT 'Energy_Rating', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Energy_Rating'
HAVING COUNT(*) > 1;

SELECT 'Maintenance_Flag', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Maintenance_Flag'
HAVING COUNT(*) > 1;

SELECT 'Fuel_Type', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Fuel_Type'
HAVING COUNT(*) > 1;

SELECT 'Glass_Thickness (mm)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Glass_Thickness (mm)'
HAVING COUNT(*) > 1;

SELECT 'Production_Target (tons)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Production_Target (tons)'
HAVING COUNT(*) > 1;

SELECT 'Defects_Percentage (%)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Defects_Percentage (%)'
HAVING COUNT(*) > 1;

SELECT 'Melting_Time (hrs)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Melting_Time (hrs)'
HAVING COUNT(*) > 1;

SELECT 'Cooling_Energy (kWh)', COUNT(*) as duplicate_count
FROM glass_manufacturing_energy_optimization_2
GROUP BY 'Cooling_Energy (kWh)'
HAVING COUNT(*) > 1;

#Outlier Treatment
SET SQL_SAFE_UPDATES = 0;

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Production_Output (tons)`,
        NTILE(4) OVER (ORDER BY `Production_Output (tons)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Production_Output (tons)` = subquery.`Production_Output (tons)`
SET e.`Production_Output (tons)` = (
    SELECT AVG(temp.`Production_Output (tons)`)
    FROM (
        SELECT 
            `Production_Output (tons)`,
            NTILE(4) OVER (ORDER BY `Production_Output (tons)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

#####################################################################################
UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Energy_Consumption (kWh)`,
        NTILE(4) OVER (ORDER BY `Energy_Consumption (kWh)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Energy_Consumption (kWh)` = subquery.`Energy_Consumption (kWh)`
SET e.`Energy_Consumption (kWh)` = (
    SELECT AVG(temp.`Energy_Consumption (kWh)`)
    FROM (
        SELECT 
            `Energy_Consumption (kWh)`,
            NTILE(4) OVER (ORDER BY `Energy_Consumption (kWh)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

###########################################################################################
UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Furnace_Temperature (°C)`,  
        NTILE(4) OVER (ORDER BY `Furnace_Temperature (°C)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Furnace_Temperature (°C)` = subquery.`Furnace_Temperature (°C)`
SET e.`Furnace_Temperature (°C)` = (
    SELECT AVG(temp.`Furnace_Temperature (°C)`)
    FROM (
        SELECT 
            `Furnace_Temperature (°C)`,
            NTILE(4) OVER (ORDER BY `Furnace_Temperature (°C)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

###########################################################################################
UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Annealing_Time (hrs)`,  
        NTILE(4) OVER (ORDER BY `Annealing_Time (hrs)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Annealing_Time (hrs)` = subquery.`Annealing_Time (hrs)`
SET e.`Annealing_Time (hrs)` = (
    SELECT AVG(temp.`Annealing_Time (hrs)`)
    FROM (
        SELECT 
            `Annealing_Time (hrs)`,
            NTILE(4) OVER (ORDER BY `Annealing_Time (hrs)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

########################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Downtime (hrs)`,  
        NTILE(4) OVER (ORDER BY `Downtime (hrs)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Downtime (hrs)` = subquery.`Downtime (hrs)`
SET e.`Downtime (hrs)` = (
    SELECT AVG(temp.`Downtime (hrs)`)
    FROM (
        SELECT 
            `Downtime (hrs)`,
            NTILE(4) OVER (ORDER BY `Downtime (hrs)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

########################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Ambient_Temperature (°C)`,  
        NTILE(4) OVER (ORDER BY `Ambient_Temperature (°C)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Ambient_Temperature (°C)` = subquery.`Ambient_Temperature (°C)`
SET e.`Ambient_Temperature (°C)` = (
    SELECT AVG(temp.`Ambient_Temperature (°C)`)
    FROM (
        SELECT 
            `Ambient_Temperature (°C)`,
            NTILE(4) OVER (ORDER BY `Ambient_Temperature (°C)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

##############################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Recycled_Content (%)`,  
        NTILE(4) OVER (ORDER BY `Recycled_Content (%)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Recycled_Content (%)` = subquery.`Recycled_Content (%)`
SET e.`Recycled_Content (%)` = (
    SELECT AVG(temp.`Recycled_Content (%)`)
    FROM (
        SELECT 
            `Recycled_Content (%)`,
            NTILE(4) OVER (ORDER BY `Recycled_Content (%)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);
###################################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Glass_Thickness (mm)`,  
        NTILE(4) OVER (ORDER BY `Glass_Thickness (mm)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Glass_Thickness (mm)` = subquery.`Glass_Thickness (mm)`
SET e.`Glass_Thickness (mm)` = (
    SELECT AVG(temp.`Glass_Thickness (mm)`)
    FROM (
        SELECT 
            `Glass_Thickness (mm)`,
            NTILE(4) OVER (ORDER BY `Glass_Thickness (mm)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

#####################################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Production_Target (tons)`,  
        NTILE(4) OVER (ORDER BY `Production_Target (tons)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Production_Target (tons)` = subquery.`Production_Target (tons)`
SET e.`Production_Target (tons)` = (
    SELECT AVG(temp.`Production_Target (tons)`)
    FROM (
        SELECT 
            `Production_Target (tons)`,
            NTILE(4) OVER (ORDER BY `Production_Target (tons)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

#################################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Defects_Percentage (%)`,  
        NTILE(4) OVER (ORDER BY `Defects_Percentage (%)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Defects_Percentage (%)` = subquery.`Defects_Percentage (%)`
SET e.`Defects_Percentage (%)` = (
    SELECT AVG(temp.`Defects_Percentage (%)`)
    FROM (
        SELECT 
            `Defects_Percentage (%)`,
            NTILE(4) OVER (ORDER BY `Defects_Percentage (%)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

###############################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Melting_Time (hrs)`,  
        NTILE(4) OVER (ORDER BY `Melting_Time (hrs)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Melting_Time (hrs)` = subquery.`Melting_Time (hrs)`
SET e.`Melting_Time (hrs)` = (
    SELECT AVG(temp.`Melting_Time (hrs)`)
    FROM (
        SELECT 
            `Melting_Time (hrs)`,
            NTILE(4) OVER (ORDER BY `Melting_Time (hrs)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

################################################################################################

UPDATE glass_manufacturing_energy_optimization_2 AS e
JOIN (
    SELECT 
        `Cooling_Energy (kWh)`,  
        NTILE(4) OVER (ORDER BY `Cooling_Energy (kWh)`) AS quartile
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
ON e.`Cooling_Energy (kWh)` = subquery.`Cooling_Energy (kWh)`
SET e.`Cooling_Energy (kWh)` = (
    SELECT AVG(temp.`Cooling_Energy (kWh)`)
    FROM (
        SELECT 
            `Cooling_Energy (kWh)`,
            NTILE(4) OVER (ORDER BY `Cooling_Energy (kWh)`) AS quartile
        FROM glass_manufacturing_energy_optimization_2
    ) AS temp
    WHERE temp.quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);
#######################################################################################

#Zero & near Zero Variance features
SELECT
    VARIANCE(`Production_Output (tons)`) AS `Recycled_Content (%)_variance`,
    VARIANCE(`Energy_Consumption (kWh)`) AS `Glass_Thickness (mm)_variance`,
    VARIANCE(`Furnace_Temperature (°C)`) AS `Production_Target (tons)_variance`,  
    VARIANCE(`Annealing_Time (hrs)`) AS `Defects_Percentage (%)_variance`,
    VARIANCE(`Downtime (hrs)`) AS `Melting_Time (hrs)_variance`,
    VARIANCE(`Ambient_Temperature (°C)`) AS `Cooling_Energy (kWh)_variance`  
FROM glass_manufacturing_energy_optimization_2;

#########################################################################################

#Discretization

SELECT
  'Production_Output (tons)',
  'Energy_Consumption (kWh)',
  'Furnace_Temperature (°C)',
  'Annealing_Time (hrs)',
  'Downtime (hrs)',
  'Ambient_Temperature (°C)',
  'Recycled_Content (%)',
  'Glass_Thickness (mm)',
  'Production_Target (tons)',
  'Defects_Percentage (%)',
  'Melting_Time (hrs)',
  'Cooling_Energy (kWh)',
  CASE
WHEN 'Recycled_Content (%)' < 50000 THEN 'Low'
WHEN 'Recycled_Content (%)' >= 50000 AND 'Recycled_Content (%)' < 100000 THEN 'Medium'
WHEN 'Recycled_Content (%)' >= 100000 THEN 'High'
ELSE 'Unknown'
END AS Column5_group
FROM glass_manufacturing_energy_optimization_2;

################################################################################################

#Missing_value

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Production_Output (tons)` IS NULL THEN 1 ELSE 0 END) AS `Production_Output_missing`
FROM glass_manufacturing_energy_optimization_2;

#########################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Energy_Consumption (kWh)` IS NULL THEN 1 ELSE 0 END) AS `Energy_Consumption (kWh)`
FROM glass_manufacturing_energy_optimization_2;

############################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Furnace_Temperature (°C)` IS NULL THEN 1 ELSE 0 END) AS `Furnace_Temperature (°C)`
FROM glass_manufacturing_energy_optimization_2;

###########################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Annealing_Time (hrs)` IS NULL THEN 1 ELSE 0 END) AS `Annealing_Time (hrs)`
FROM glass_manufacturing_energy_optimization_2;

############################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Downtime (hrs)` IS NULL THEN 1 ELSE 0 END) AS `Downtime (hrs)`
FROM glass_manufacturing_energy_optimization_2;

##########################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Ambient_Temperature (°C)` IS NULL THEN 1 ELSE 0 END) AS `Ambient_Temperature (°C)`
FROM glass_manufacturing_energy_optimization_2;

##########################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Recycled_Content (%)` IS NULL THEN 1 ELSE 0 END) AS `Recycled_Content (%)`
FROM glass_manufacturing_energy_optimization_2;

#######################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Recycled_Content (%)` IS NULL THEN 1 ELSE 0 END) AS `Recycled_Content (%)`
FROM glass_manufacturing_energy_optimization_2;

######################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Glass_Thickness (mm)` IS NULL THEN 1 ELSE 0 END) AS `Glass_Thickness (mm)`
FROM glass_manufacturing_energy_optimization_2;

########################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Production_Target (tons)` IS NULL THEN 1 ELSE 0 END) AS `Production_Target (tons)`
FROM glass_manufacturing_energy_optimization_2;

######################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Defects_Percentage (%)` IS NULL THEN 1 ELSE 0 END) AS `Defects_Percentage (%)`
FROM glass_manufacturing_energy_optimization_2;

###################################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Melting_Time (hrs)` IS NULL THEN 1 ELSE 0 END) AS `Melting_Time (hrs)`
FROM glass_manufacturing_energy_optimization_2;

###############################################################################################

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN `Cooling_Energy (kWh)` IS NULL THEN 1 ELSE 0 END) AS `Cooling_Energy (kWh)`
FROM glass_manufacturing_energy_optimization_2;

###############################################################################################

#missing values treatments

UPDATE glass_manufacturing_energy_optimization_2
SET `Production_Output (tons)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Production_Output (tons)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Production_Output (tons)` IS NULL;
select `Production_Output (tons)` from glass_manufacturing_energy_optimization_2;

################################################################################################33333

UPDATE glass_manufacturing_energy_optimization_2
SET `Energy_Consumption (kWh)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Energy_Consumption (kWh)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Energy_Consumption (kWh)` IS NULL;
select `Energy_Consumption (kWh)` from glass_manufacturing_energy_optimization_2;

########################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Furnace_Temperature (°C)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Furnace_Temperature (°C)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Furnace_Temperature (°C)` IS NULL;
select `Furnace_Temperature (°C)` from glass_manufacturing_energy_optimization_2;

#######################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Annealing_Time (hrs)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Annealing_Time (hrs)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Annealing_Time (hrs)` IS NULL;
select `Annealing_Time (hrs)` from glass_manufacturing_energy_optimization_2;

#########################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Annealing_Time (hrs)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Annealing_Time (hrs)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Annealing_Time (hrs)` IS NULL;
select `Annealing_Time (hrs)` from glass_manufacturing_energy_optimization_2;

########################################################################################################
UPDATE glass_manufacturing_energy_optimization_2
SET `Downtime (hrs)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Downtime (hrs)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Downtime (hrs)` IS NULL;
select `Downtime (hrs)` from glass_manufacturing_energy_optimization_2;

#########################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Downtime (hrs)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Downtime (hrs)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Downtime (hrs)` IS NULL;
select `Downtime (hrs)` from glass_manufacturing_energy_optimization_2;

##########################################################################################################
UPDATE glass_manufacturing_energy_optimization_2
SET `Ambient_Temperature (°C)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Ambient_Temperature (°C)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Ambient_Temperature (°C)` IS NULL;
select `Ambient_Temperature (°C)` from glass_manufacturing_energy_optimization_2;

######################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Recycled_Content (%)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Recycled_Content (%)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Recycled_Content (%)` IS NULL;
select `Recycled_Content (%)` from glass_manufacturing_energy_optimization_2;

######################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Glass_Thickness (mm)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Glass_Thickness (mm)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Glass_Thickness (mm)` IS NULL;
select `Glass_Thickness (mm)` from glass_manufacturing_energy_optimization_2;

####################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Production_Target (tons)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Production_Target (tons)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Production_Target (tons)` IS NULL;
select `Production_Target (tons)` from glass_manufacturing_energy_optimization_2;

######################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Defects_Percentage (%)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Defects_Percentage (%)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Defects_Percentage (%)` IS NULL;
select `Defects_Percentage (%)` from glass_manufacturing_energy_optimization_2;

######################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Melting_Time (hrs)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Melting_Time (hrs)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Melting_Time (hrs)` IS NULL;
select `Melting_Time (hrs)` from glass_manufacturing_energy_optimization_2;

########################################################################################################

UPDATE glass_manufacturing_energy_optimization_2
SET `Cooling_Energy (kWh)` = (
    SELECT avg_value
    FROM (
        SELECT AVG(`Cooling_Energy (kWh)`) AS avg_value
        FROM glass_manufacturing_energy_optimization_2
    ) AS subquery
)
WHERE `Cooling_Energy (kWh)` IS NULL;
select `Cooling_Energy (kWh)` from glass_manufacturing_energy_optimization_2;

select * from glass_manufacturing_energy_optimization_2;
###########################################################################################################
#Dummy Variable Creation


SELECT * 
FROM glass_manufacturing_energy_optimization_2;

SELECT
    Shift,
    CASE WHEN Shift = 'Morning' THEN 1 ELSE 0 END AS is_morning,
    CASE WHEN Shift = 'Afternoon' THEN 1 ELSE 0 END AS is_afternoon,
    CASE WHEN Shift = 'Night' THEN 1 ELSE 0 END AS is_night
FROM glass_manufacturing_energy_optimization_2;

#####################################################################################################################

SELECT
    Furnace_Type,
    CASE WHEN Furnace_Type = 'Electric' THEN 1 ELSE 0 END AS is_Electric,
    CASE WHEN Furnace_Type = 'Hybrid' THEN 1 ELSE 0 END AS is_Hybrid,
    CASE WHEN Furnace_Type = 'Gas' THEN 1 ELSE 0 END AS is_Gas
FROM glass_manufacturing_energy_optimization_2;

########################################################################################################################

SELECT
    Batch_Type,
    CASE WHEN Batch_Type = 'Borosilicate' THEN 1 ELSE 0 END AS is_Borosilicate,
    CASE WHEN Batch_Type = 'Soda-lime' THEN 1 ELSE 0 END AS is_Soda_lime,
    CASE WHEN Batch_Type = 'Lead' THEN 1 ELSE 0 END AS is_Lead
FROM glass_manufacturing_energy_optimization_2;

#########################################################################################################################

SELECT
    Energy_Rating,
    CASE WHEN Energy_Rating = 'A' THEN 1 ELSE 0 END AS is_A,
    CASE WHEN Energy_Rating = 'B' THEN 1 ELSE 0 END AS is_B,
    CASE WHEN Energy_Rating = 'C' THEN 1 ELSE 0 END AS is_C
FROM glass_manufacturing_energy_optimization_2;

########################################################################################################################

SELECT
    Maintenance_Flag,
    CASE WHEN Maintenance_Flag = 'Yes' THEN 1 ELSE 0 END AS is_Yes,
    CASE WHEN Maintenance_Flag = 'No' THEN 1 ELSE 0 END AS is_No
FROM glass_manufacturing_energy_optimization_2;

######################################################################################################################

SELECT
    Fuel_Type,
    CASE WHEN Fuel_Type = 'Natural Gas' THEN 1 ELSE 0 END AS is_Natural_Gas,
    CASE WHEN Fuel_Type = 'Electricity' THEN 1 ELSE 0 END AS is_Electricity
FROM glass_manufacturing_energy_optimization_2;

#######################################################################################################################
#Transformations

SELECT
    `Furnace_Temperature (°C)`,
    LOG(`Furnace_Temperature (°C)`) AS `Furnace_Temperature (°C)_log`,
    SQRT(`Furnace_Temperature (°C)`) AS `Furnace_Temperature (°C)_sqrt`
FROM glass_manufacturing_energy_optimization_2;

SELECT
    `Downtime (hrs)`,
    LOG(`Downtime (hrs)`) AS `Downtime (hrs)_log`,
    SQRT(`Downtime (hrs)`) AS `Downtime (hrs)_sqrt`
FROM glass_manufacturing_energy_optimization_2;

###########################################################################################################################

SELECT AVG(`Production_Output (tons)`) AS `mean_Production_Output (tons)`
FROM glass_manufacturing_energy_optimization_2;

SELECT AVG(`Production_Output (tons)`) AS median_Column5
FROM (
    SELECT 
        `Production_Output (tons)`, 
        ROW_NUMBER() OVER (ORDER BY `Production_Output (tons)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
###########################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean
use glass_manufacturing_energy_optimization_2; 
SELECT AVG(`Production_Output (tons)`) AS `mean_Production_Output (tons)`
FROM glass_manufacturing_energy_optimization_2;

#median

SELECT AVG(`Production_Output (tons)`) AS median_Column
FROM (
    SELECT 
        `Production_Output (tons)`, 
        ROW_NUMBER() OVER (ORDER BY `Production_Output (tons)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    #mode

SELECT `Production_Output (tons)` AS mode_Column3
FROM (
    SELECT `Production_Output (tons)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Production_Output (tons)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment

#Variance

SELECT VARIANCE(`Production_Output (tons)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;

#Standard Deviation

SELECT STDDEV(`Production_Output (tons)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Production_Output (tons)`) - MIN(`Production_Output (tons)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Production_Output (tons)`- (SELECT AVG(`Production_Output (tons)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Production_Output (tons)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Production_Output (tons)`- (SELECT AVG(`Production_Output (tons)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Production_Output (tons)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;

#################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Energy_Consumption (kWh)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Energy_Consumption (kWh)`) AS median_Column5
FROM (
    SELECT 
        `Energy_Consumption (kWh)`, 
        ROW_NUMBER() OVER (ORDER BY `Energy_Consumption (kWh)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
#mode

SELECT `Energy_Consumption (kWh)` AS mode_Column3
FROM (
    SELECT `Energy_Consumption (kWh)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Energy_Consumption (kWh)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Energy_Consumption (kWh)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;

#Standard Deviation

SELECT STDDEV(`Energy_Consumption (kWh)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Energy_Consumption (kWh)`) - MIN(`Energy_Consumption (kWh)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;


#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Energy_Consumption (kWh)`- (SELECT AVG(`Energy_Consumption (kWh)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Energy_Consumption (kWh)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;
#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Energy_Consumption (kWh)`- (SELECT AVG(`Energy_Consumption (kWh)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Energy_Consumption (kWh)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;

#######################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Furnace_Temperature (°C)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Furnace_Temperature (°C)`) AS median_Column5
FROM (
    SELECT 
        `Furnace_Temperature (°C)`, 
        ROW_NUMBER() OVER (ORDER BY `Furnace_Temperature (°C)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Furnace_Temperature (°C)` AS mode_Column3
FROM (
    SELECT `Furnace_Temperature (°C)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Furnace_Temperature (°C)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;
   
 #2nd business moment
#Variance

SELECT VARIANCE(`Furnace_Temperature (°C)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Furnace_Temperature (°C)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Furnace_Temperature (°C)`) - MIN(`Furnace_Temperature (°C)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Furnace_Temperature (°C)`- (SELECT AVG(`Furnace_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Furnace_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;
#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Furnace_Temperature (°C)`- (SELECT AVG(`Furnace_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Furnace_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;

#########################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Annealing_Time (hrs)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Annealing_Time (hrs)`) AS median_Column5
FROM (
    SELECT 
        `Annealing_Time (hrs)`, 
        ROW_NUMBER() OVER (ORDER BY `Annealing_Time (hrs)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Annealing_Time (hrs)` AS mode_Column3
FROM (
    SELECT `Annealing_Time (hrs)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Annealing_Time (hrs)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Annealing_Time (hrs)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Annealing_Time (hrs)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Annealing_Time (hrs)`) - MIN(`Annealing_Time (hrs)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Annealing_Time (hrs)`- (SELECT AVG(`Annealing_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Annealing_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Annealing_Time (hrs)`- (SELECT AVG(`Annealing_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Annealing_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;

###################################################################################################################################
   
#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Downtime (hrs)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Downtime (hrs)`) AS median_Column5
FROM (
    SELECT 
        `Downtime (hrs)`, 
        ROW_NUMBER() OVER (ORDER BY `Downtime (hrs)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);

#mode

SELECT `Downtime (hrs)` AS mode_Column3
FROM (
    SELECT `Downtime (hrs)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Downtime (hrs)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment

#Variance

SELECT VARIANCE(`Downtime (hrs)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;

#Standard Deviation

SELECT STDDEV(`Downtime (hrs)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Downtime (hrs)`) - MIN(`Downtime (hrs)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Downtime (hrs)`- (SELECT AVG(`Downtime (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Downtime (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Downtime (hrs)`- (SELECT AVG(`Downtime (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Downtime (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;

##########################################################################################################################

 #1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Ambient_Temperature (°C)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Ambient_Temperature (°C)`) AS median_Column5
FROM (
    SELECT 
        `Ambient_Temperature (°C)`, 
        ROW_NUMBER() OVER (ORDER BY `Ambient_Temperature (°C)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Ambient_Temperature (°C)` AS mode_Column3
FROM (
    SELECT `Ambient_Temperature (°C)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Ambient_Temperature (°C)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Ambient_Temperature (°C)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Ambient_Temperature (°C)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Ambient_Temperature (°C)`) - MIN(`Ambient_Temperature (°C)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Ambient_Temperature (°C)`- (SELECT AVG(`Ambient_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Ambient_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Ambient_Temperature (°C)`- (SELECT AVG(`Ambient_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Ambient_Temperature (°C)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

###################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Recycled_Content (%)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Recycled_Content (%)`) AS median_Column5
FROM (
    SELECT 
        `Recycled_Content (%)`, 
        ROW_NUMBER() OVER (ORDER BY `Recycled_Content (%)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Recycled_Content (%)` AS mode_Column3
FROM (
    SELECT `Recycled_Content (%)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Recycled_Content (%)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Recycled_Content (%)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Recycled_Content (%)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Recycled_Content (%)`) - MIN(`Recycled_Content (%)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Recycled_Content (%)`- (SELECT AVG(`Recycled_Content (%)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Recycled_Content (%)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Recycled_Content (%)`- (SELECT AVG(`Recycled_Content (%)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Recycled_Content (%)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

###########################################################################################################################
#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Energy_Rating`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Energy_Rating`) AS median_Column5
FROM (
    SELECT 
        `Energy_Rating`, 
        ROW_NUMBER() OVER (ORDER BY `Energy_Rating`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Energy_Rating` AS mode_Column3
FROM (
    SELECT `Energy_Rating`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Energy_Rating`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Energy_Rating`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Energy_Rating`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Energy_Rating`) - MIN(`Energy_Rating`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Energy_Rating`- (SELECT AVG(`Energy_Rating`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Energy_Rating`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Energy_Rating`- (SELECT AVG(`Energy_Rating`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Energy_Rating`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

###############################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Maintenance_Flag`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Maintenance_Flag`) AS median_Column5
FROM (
    SELECT 
        `Maintenance_Flag`, 
        ROW_NUMBER() OVER (ORDER BY `Maintenance_Flag`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Maintenance_Flag` AS mode_Column3
FROM (
    SELECT `Maintenance_Flag`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Maintenance_Flag`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Maintenance_Flag`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Maintenance_Flag`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Maintenance_Flag`) - MIN(`Maintenance_Flag`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Maintenance_Flag`- (SELECT AVG(`Maintenance_Flag`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Maintenance_Flag`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Maintenance_Flag`- (SELECT AVG(`Maintenance_Flag`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Maintenance_Flag`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

###################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Fuel_Type`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Fuel_Type`) AS median_Column5
FROM (
    SELECT 
        `Fuel_Type`, 
        ROW_NUMBER() OVER (ORDER BY `Fuel_Type`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Fuel_Type` AS mode_Column3
FROM (
    SELECT `Fuel_Type`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Fuel_Type`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Fuel_Type`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Fuel_Type`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Fuel_Type`) - MIN(`Fuel_Type`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Fuel_Type`- (SELECT AVG(`Fuel_Type`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Fuel_Type`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Fuel_Type`- (SELECT AVG(`Fuel_Type`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Fuel_Type`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

##############################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Glass_Thickness (mm)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Glass_Thickness (mm)`) AS median_Column5
FROM (
    SELECT 
        `Glass_Thickness (mm)`, 
        ROW_NUMBER() OVER (ORDER BY `Glass_Thickness (mm)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Glass_Thickness (mm)` AS mode_Column3
FROM (
    SELECT `Glass_Thickness (mm)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Glass_Thickness (mm)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Glass_Thickness (mm)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Glass_Thickness (mm)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Glass_Thickness (mm)`) - MIN(`Glass_Thickness (mm)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Glass_Thickness (mm)`- (SELECT AVG(`Glass_Thickness (mm)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Glass_Thickness (mm)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Glass_Thickness (mm)`- (SELECT AVG(`Glass_Thickness (mm)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Glass_Thickness (mm)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

#################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Production_Target (tons)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Production_Target (tons)`) AS median_Column5
FROM (
    SELECT 
        `Production_Target (tons)`, 
        ROW_NUMBER() OVER (ORDER BY `Production_Target (tons)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Production_Target (tons)` AS mode_Column3
FROM (
    SELECT `Production_Target (tons)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Production_Target (tons)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Production_Target (tons)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Production_Target (tons)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Production_Target (tons)`) - MIN(`Production_Target (tons)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Production_Target (tons)`- (SELECT AVG(`Production_Target (tons)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Production_Target (tons)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Production_Target (tons)`- (SELECT AVG(`Production_Target (tons)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Production_Target (tons)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

##########################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Defects_Percentage (%)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Defects_Percentage (%)`) AS median_Column5
FROM (
    SELECT 
        `Defects_Percentage (%)`, 
        ROW_NUMBER() OVER (ORDER BY `Defects_Percentage (%)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Defects_Percentage (%)` AS mode_Column3
FROM (
    SELECT `Defects_Percentage (%)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Defects_Percentage (%)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Defects_Percentage (%)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Defects_Percentage (%)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Defects_Percentage (%)`) - MIN(`Defects_Percentage (%)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Defects_Percentage (%)`- (SELECT AVG(`Defects_Percentage (%)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Defects_Percentage (%)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Defects_Percentage (%)`- (SELECT AVG(`Defects_Percentage (%)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Defects_Percentage (%)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2;   

################################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Melting_Time (hrs)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Melting_Time (hrs)`) AS median_Column5
FROM (
    SELECT 
        `Melting_Time (hrs)`, 
        ROW_NUMBER() OVER (ORDER BY `Melting_Time (hrs)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Melting_Time (hrs)` AS mode_Column3
FROM (
    SELECT `Melting_Time (hrs)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Melting_Time (hrs)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Melting_Time (hrs)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Melting_Time (hrs)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Melting_Time (hrs)`) - MIN(`Melting_Time (hrs)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Melting_Time (hrs)`- (SELECT AVG(`Melting_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Melting_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Melting_Time (hrs)`- (SELECT AVG(`Melting_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Melting_Time (hrs)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2; 

#############################################################################################################################

#1st business moment (Mean/Median/Mode)
#mean

SELECT AVG(`Cooling_Energy (kWh)`) AS mean_column
FROM glass_manufacturing_energy_optimization_2
LIMIT 0, 1000;

#median

SELECT AVG(`Cooling_Energy (kWh)`) AS median_Column5
FROM (
    SELECT 
        `Cooling_Energy (kWh)`, 
        ROW_NUMBER() OVER (ORDER BY `Cooling_Energy (kWh)`) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM glass_manufacturing_energy_optimization_2
) AS subquery
WHERE 
    row_num = FLOOR((total_count + 1) / 2) 
    OR row_num = CEIL((total_count + 1) / 2);
    
    
 #mode

SELECT `Cooling_Energy (kWh)` AS mode_Column3
FROM (
    SELECT `Cooling_Energy (kWh)`, COUNT(*) AS frequency
    FROM glass_manufacturing_energy_optimization_2
    GROUP BY `Cooling_Energy (kWh)`
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

#2nd business moment
#Variance

SELECT VARIANCE(`Cooling_Energy (kWh)`) AS performance_variance
FROM glass_manufacturing_energy_optimization_2;  

#Standard Deviation

SELECT STDDEV(`Cooling_Energy (kWh)`) AS Column4_stddev
FROM glass_manufacturing_energy_optimization_2;

#Range

SELECT MAX(`Cooling_Energy (kWh)`) - MIN(`Cooling_Energy (kWh)`) AS Column5_range
FROM glass_manufacturing_energy_optimization_2;

#3rd business moment

#Skewness

SELECT
(
SUM(POWER(`Cooling_Energy (kWh)`- (SELECT AVG(`Cooling_Energy (kWh)`) FROM glass_manufacturing_energy_optimization_2), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(`Cooling_Energy (kWh)`) FROM glass_manufacturing_energy_optimization_2), 3))
) AS skewness

FROM glass_manufacturing_energy_optimization_2;

#4th business moment
#Kurtosis

SELECT
(
(SUM(POWER(`Cooling_Energy (kWh)`- (SELECT AVG(`Cooling_Energy (kWh)`) FROM glass_manufacturing_energy_optimization_2), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(`Cooling_Energy (kWh)`) FROM glass_manufacturing_energy_optimization_2), 4))) - 3
) AS kurtosis
FROM glass_manufacturing_energy_optimization_2; 

select * from glass_manufacturing_energy_optimization_2;



