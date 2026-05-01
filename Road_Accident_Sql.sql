create database Road_Accident;

use Road_Accident;
show tables;

Select * from Accident_Data;
Select * from Accident_Data order by Accident_Index Desc limit 5;

select count(Accident_Index) from Accident_Data;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Accident_Data
CHANGE COLUMN `Local_Authority_(District)` Local_Authority varchar(50);

UPDATE Accident_Data
SET `Accident Date` = STR_TO_DATE(`Accident Date`, '%d-%m-%Y');

UPDATE Accident_Data
SET `Accident Date` = STR_TO_DATE(`Accident Date`, '%d-%m-%Y')
WHERE `Accident Date` IS NOT NULL;

	-- Current year Casualities
	Select count(Number_of_Casualties) AS PY_Casualities 
	From Accident_Data ;

-- Count of Current Year Accidents
Select count(distinct Accident_Index) As CY_Accidents
from Accident_Data
where Year(Accident_Date)= '2022';

-- Total number of fatal Casualties
Select sum(Number_Of_Casualties) As Fatal_Casualties
from Accident_Data
Where Year(Accident_Date)='2022' And Accident_Severity = 'Fatal';

-- Total number of Serious Casualties
Select sum(Number_Of_Casualties) As Fatal_Casualties
from Accident_Data
Where Year(Accident_Date)='2022' And Accident_Severity = 'Serious';

-- Total number of Slight Casualties
Select sum(Number_Of_Casualties) As Fatal_Casualties
from Accident_Data
Where Year(Accident_Date)='2022' And Accident_Severity = 'Slight';

-- Percentage of Serious Casualties in Year 2022
SELECT SUM(Number_Of_Casualties) * 100 /
       (SELECT SUM(Number_Of_Casualties)
        FROM Accident_Data
        WHERE YEAR(Accident_Date) = 2022) AS Slight_Percentage_2022
FROM Accident_Data
WHERE YEAR(Accident_Date) = 2022
  AND Accident_Severity = 'Serious';
  
-- Percentage of Fatal Casualties in Year 2022
SELECT SUM(Number_Of_Casualties) * 100 /
       (SELECT SUM(Number_Of_Casualties)
        FROM Accident_Data
        WHERE YEAR(Accident_Date) = 2022) AS Slight_Percentage_2022
FROM Accident_Data
WHERE YEAR(Accident_Date) = 2022
  AND Accident_Severity = 'Fatal';
  
  -- Percentage of Slight Casualties
SELECT SUM(Number_Of_Casualties) * 100 /
       (SELECT SUM(Number_Of_Casualties)
        FROM Accident_Data
        WHERE YEAR(Accident_Date) = 2022) AS Slight_Percentage_2022
FROM Accident_Data
WHERE YEAR(Accident_Date) = 2022
  AND Accident_Severity = 'Slight';
  
  -- percentage of Slight Casualties
  SELECT SUM(Number_Of_Casualties) * 100 /
(SELECT SUM(Number_Of_Casualties) FROM Accident_Data) AS Slight_Percentage
FROM Accident_Data
WHERE Accident_Severity = 'Slight';

-- percentage of Fatal Casualties
SELECT SUM(Number_Of_Casualties) * 100 /
(SELECT SUM(Number_Of_Casualties) FROM Accident_Data) AS Fatal_Percentage
FROM Accident_Data
WHERE Accident_Severity = 'Fatal';

-- percentage of Serious Casualties
SELECT SUM(Number_Of_Casualties) * 100 /
(SELECT SUM(Number_Of_Casualties) FROM Accident_Data) AS Serious_Percentage
FROM Accident_Data
WHERE Accident_Severity = 'Serious';

select distinct Vehicle_Type as vehicles From Accident_Data;

-- Group Vehicl type
Select 
Case
when Vehicle_Type IN ('Agricultural Vehicle') Then 'Agricultural'
when Vehicle_Type IN ('Car' , 'Taxi/Private hire car') Then 'Cars'
when Vehicle_Type IN ('Motorcycle over 500cc', 'Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc') Then 'Bike'
when Vehicle_Type IN ('Goods 7.5 tonnes mgw and over' , 'Van / Goods 3.5 tonnes mgw or under', 'Goods over 3.5t. and under 7.5t', '') Then 'Van'
when Vehicle_Type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
Else 'Other'
End As Vehicle_group,
sum(Number_of_Casualties) as Cy_Casualties
from Accident_Data
Group By 
Case
when Vehicle_Type IN ('Agricultural Vehicle') Then 'Agricultural'
when Vehicle_Type IN ('Car' , 'Taxi/Private hire car') Then 'Cars'
when Vehicle_Type IN ('Motorcycle over 500cc', 'Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc') Then 'Bike'
when Vehicle_Type IN ('Goods 7.5 tonnes mgw and over' , 'Van / Goods 3.5 tonnes mgw or under', 'Goods over 3.5t. and under 7.5t', '') Then 'Van'
when Vehicle_Type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
Else 'Other'
End;

 -- Csualties in months of 2022
SELECT 
MONTHNAME(Accident_Date) AS Month_name,
SUM(Number_of_Casualties) AS Total_Casualties
FROM Accident_Data
WHERE YEAR(Accident_Date) = 2022
GROUP BY MONTHNAME(Accident_Date);

-- Casulties followed by Road type
Select Road_Type,sum(Number_of_Casualties) 
from Accident_Data
where year(Accident_Date)='2022'
group by Road_Type;

-- Casualties by Area
Select Urban_or_Rural_Area, sum(Number_of_Casualties) 
from Accident_Data
where year(Accident_Date)='2022'
group by Urban_or_Rural_Area;

-- Casualties by lighnning

-- casualties in locations 
select Local_Authority, sum(Number_of_casualties) as total_Casualties
from Accident_Data
group by Local_Authority
order BY total_casualties Desc limit 10;

select distinct Light_Conditions from Accident_Data;
Select 
Case
when Light_Conditions IN ('Daylight') Then 'Day'
when Light_Conditions IN ('Darkness - lights lit' , 'Darkness - lighting unknown', 'Darkness - lights unlit', 'Darkness - no lighting') Then 'Night'
End As Day_Night,
sum(Number_of_Casualties) as Cy_Casualties
from Accident_Data
Group By 
Case
when Light_Conditions IN ('Daylight') Then 'Day'
when Light_Conditions IN ('Darkness - lights lit' , 'Darkness - lighting unknown', 'Darkness - lights unlit', 'Darkness - no lighting') Then 'Night'
End;