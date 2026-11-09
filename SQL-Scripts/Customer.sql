SELECT *
FROM Customer

ALTER TABLE Customer 
Add CONSTRAINT PRIMARY_KEY_CUSTOMER 
PRIMARY KEY (customer_id) ;

SELECT customer_id,COUNT(customer_id) One_Customer
FROM Customer
GROUP BY customer_id
ORDER BY One_Customer DESC

SELECT 
	customer_name
FROM Customer
WHERE customer_name IS NULL

SELECT 
	customer_age
FROM Customer
WHERE customer_age IS NULL

SELECT 
	MAX(customer_age) AS Max_Age , 
	MIN(customer_age) AS MIN_Age , 
	AVG(customer_age) AS AVG_Age
FROM Customer

SELECT 
	gender
FROM Customer
WHERE gender IS NULL

SELECT 
	DISTINCT(gender) AS Gender
FROM Customer

SELECT 
	customer_segment
FROM Customer
WHERE customer_segment IS NULL

SELECT 
	DISTINCT(customer_segment) AS Customer_Segment
FROM Customer

SELECT 
	customer_city
FROM Customer
WHERE customer_city IS NULL

SELECT 
	customer_state
FROM Customer
WHERE customer_state IS NULL

SELECT 
	DISTINCT(customer_state)
FROM Customer

SELECT 
	region
FROM Customer
WHERE region IS NULL

SELECT 
	DISTINCT(region)
FROM Customer

SELECT 
	customer_postal_code
FROM Customer
WHERE customer_postal_code IS NULL

SELECT 
	MAX(customer_acquisition_cost) MAX_Cost , 
	MIN(customer_acquisition_cost) MIN_Cost , 
	AVG(customer_acquisition_cost) AVG_Cost
FROM Customer

SELECT customer_acquisition_cost
FROM Customer
WHERE customer_acquisition_cost IS NULL

CREATE TABLE Customer_Analysis
(
	[Customer ID] VARCHAR(50) PRIMARY KEY ,
	[Customer Name] VARCHAR(50) ,
	[Customer Age] INT ,
	[Gender] VARCHAR(50) ,
	[Customer Segment] VARCHAR(50) ,
	[Customer City] VARCHAR(50) ,
	[Customer State] VARCHAR(50) ,
	[Customer Country] VARCHAR(50) ,
	[Region] VARCHAR(50) ,
	[Customer Acquisition Cost] DEC(10,1)
) ;
GO

INSERT INTO Customer_Analysis
SELECT 
	customer_id , 
	customer_name , 
	customer_age , 
	gender , 
	customer_segment , 
	customer_city , 
	customer_state , 
	customer_country , 
	region , 
	customer_acquisition_cost
FROM Customer

SELECT *
FROM Customer_Analysis