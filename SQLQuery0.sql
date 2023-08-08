/************************ CREATE-INSERT ************************/
--Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male'),
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')


--Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

--Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000),
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

--Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Insert into WareHouseEmployeeDemographics VALUES
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')
---------------------------------------------------------------------------------------
/**************** SELECT Statement-TOP-DISTINCT-COUNT-AS-MIN-MAX-AVG ****************/
SELECT *
FROM EmployeeDemographics


SELECT FirstName
FROM EmployeeDemographics


SELECT FirstName, LastName
FROM EmployeeDemographics


--Return top 5
SELECT TOP 5 *
FROM EmployeeDemographics


--Return unique values
SELECT DISTINCT(Gender)
FROM EmployeeDemographics


--Show the count of all the non null values in the column
SELECT COUNT(LastName)
FROM EmployeeDemographics


SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics


SELECT *
FROM EmployeeSalary


--Select Max salary
SELECT MAX(Salary)
FROM EmployeeSalary


--Select Min salary
SELECT MIN(Salary)
FROM EmployeeSalary


--Select Avg salary of all employees
SELECT AVG(Salary)
FROM EmployeeSalary


/*** if we are on the master ***/
SELECT *
FROM Project1.dbo.EmployeeDemographics
----------------------------------------------------------------------------------------
/****** WHERE Statement = , <> , < , > , AND , OR , LIKE , NULL , NOT NULL , IN ******/
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'


SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'


SELECT *
FROM EmployeeDemographics
WHERE Age > 30


SELECT *
FROM EmployeeDemographics
WHERE Age >= 30


SELECT *
FROM EmployeeDemographics
WHERE Age < 32


SELECT *
FROM EmployeeDemographics
WHERE Age <= 32


SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender='Male'


SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender='Male'


--Select anyone whose LastName start with S 
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

--Select anyone where there is an S anywhere in their LastName
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'

--Select anyone whose LastName start with S and there is an O anywhere in their LastName
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%O%'


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%Ott%'


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%Ott%C%'


SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL


SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL


SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael', 'Pam')
-------------------------------------------------------------------------------------------------
/******************************** GROUP BY - ORDER BY ********************************/
/*** GROUP BY: Reduce the number of rows in our output by rolling them up, 
               and then calculating the sum or avg for each group ***/

SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender


SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender


SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age


SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender


SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount


SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC


SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender DESC


SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender ASC


SELECT *
FROM EmployeeDemographics
ORDER BY Age


SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC


SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender


SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender DESC


SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC


SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC
--------------------------------------------------------------------------------------------
/*********************** INNER JOIN - OUTER JOIN (FULL-LEFT-RIGHT) ***********************/
/*** INNER JOIN: Shows everything that is common between the 2 tables ***/
SELECT *
FROM EmployeeDemographics INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*** FULL OUTER JOIN: Shows everything in the 2 tables ***/
SELECT *
FROM EmployeeDemographics FULL OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*** LEFT OUTER JOIN: Shows everything in the left table regardless if it is in the right table ***/
SELECT *
FROM EmployeeDemographics LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*** RIGHT OUTER JOIN: Shows everything in the right table regardless if it is in the left table ***/
SELECT *
FROM EmployeeDemographics RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- Michael want to know who is the highest paid employee
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC


-- Angela Martin(the accountant) want to calculate the average salary of the salesman
SELECT JobTitle, AVG(Salary) AS AvgSalary
FROM EmployeeDemographics INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle
-------------------------------------------------------------------------------------------------
/************* UNION: Select all the data from all tables *************/
/*** UNION: show all distinct values ***/ 
SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics


/*** UNION ALL: show all values ***/ 
SELECT *
FROM EmployeeDemographics
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID


SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID
-----------------------------------------------------------------------------------------------
/*************************** CASE STATEMENT ***************************/
SELECT FirstName, LastName, Age,
CASE
    WHEN Age > 30 THEN 'Old'
	ELSE 'Young'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



SELECT FirstName, LastName, Age,
CASE
    WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



SELECT FirstName, LastName, Age,
CASE
    WHEN Age > 30 THEN 'Old'
	WHEN Age = 38 THEN 'Stanley'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



SELECT FirstName, LastName, Age,
CASE
    WHEN Age = 38 THEN 'Stanley'
    WHEN Age > 30 THEN 'Old'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



SELECT *
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



SELECT FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



-- Calculate Salary after Bonus
SELECT FirstName, LastName, JobTitle, Salary,
CASE
    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.000001)
	ELSE Salary + (Salary * 0.03)
END AS SalaryAfterBonus
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-------------------------------------------------------------------------------------------------
/****************************** HAVING CLAUSE ******************************/
SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle



SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1



SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(Salary)



SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
Having AVG (Salary) > 45000
ORDER BY AVG(Salary)
-----------------------------------------------------------------------------------------
/******************************* UPDATING - DELETING *******************************/
-- Updating
SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE EmployeeDemographics SET Age = 31 , Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'



-- Deleting
DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1005

SELECT *
FROM EmployeeDemographics
-------------------------------------------------------------------------------------------
/******************** Aliasing ********************/
SELECT FirstName AS Fname
FROM EmployeeDemographics


SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics


SELECT AVG(Age) AS AvgAge
FROM EmployeeDemographics


SELECT Demo.EmployeeID, Sal.Salary
FROM EmployeeDemographics AS Demo JOIN EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID


SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM EmployeeDemographics Demo LEFT JOIN EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics Ware
ON Demo.EmployeeID = Ware.EmployeeID


SELECT *
FROM WareHouseEmployeeDemographics
--------------------------------------------------------------------------------------------------
/************************************ Partition By ************************************/
 Partition By: divides the result set into partitions
SELECT *
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID



SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID



SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender
------------------------------------------------------------------------------------------------------------
/******************************** Common Table Expressions (CTE) ********************************/
/*** CTE: named temporary result set which is used to manipulate the complex subqueries data
          CTE isn't stored anywhere ***/
WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER(PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER(PARTITION BY Gender) AS AvgSalary
FROM EmployeeDemographics dem JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000')

SELECT *
FROM CTE_Employee




WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER(PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER(PARTITION BY Gender) AS AvgSalary
FROM EmployeeDemographics dem JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000')

SELECT FirstName, AvgSalary
FROM CTE_Employee
-----------------------------------------------------------------------------------
/********************* TEMPORARY TABLES(Temp) *********************/
CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000')

INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary
------------------------------------------------
CREATE TABLE #Temp_Employee2 (
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics dem JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2
------------------------------------------------------------------
DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics dem JOIN EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2
--------------------------------------------------------------------------------------------------
/********** String Functions- TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER **********/
CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors



/*** Using Trim, LTRIM, RTRIM ***/
Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) AS IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) AS IDLTRIM
FROM EmployeeErrors



/*** Using Replace ***/
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors



/*** Using Substring ***/
SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors


SELECT SUBSTRING(FirstName,3,3)
FROM EmployeeErrors


Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), 
       Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



Select err.FirstName, Substring(err.FirstName,1,3), dem.FirstName, Substring(dem.FirstName,1,3), 
       err.LastName, Substring(err.LastName,1,3), dem.LastName, Substring(dem.LastName,1,3)
FROM EmployeeErrors err JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


/*** Using UPPER and lower ***/
Select firstname, LOWER(firstname)
from EmployeeErrors


Select Firstname, UPPER(FirstName)
from EmployeeErrors
----------------------------------------------------------------------------------------------------------
/********************* Stored Procedures *********************/
/** 
Stored Procedure: a group of SQL Statements that has been created and then stored in the database 
-it can accept input parameters(a single stored procedure can be used over the network by several
 different users and we can all be using different input data)
-it reduce network traffic and increase performance
-if we modify the stored data, everyone who uses that stored procedure in the future will also get that update 
**/

CREATE PROCEDURE Test
AS
SELECT *
FROM EmployeeDemographics
--execute the stored procedure test 
EXEC Test




CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;
---------------------------------------------------------------------------------------------------
/*** Subqueries/innerqueries/nestedqueries (in the Select, From, Where Statement) ***/
SELECT *
FROM EmployeeSalary

--Subquery in Select
Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

--How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID


--Subquery in From
Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID


--Subquery in Where
Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID 
	From EmployeeDemographics
	where Age > 30)
----------------------------------------------------------------------------------------

