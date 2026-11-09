SELECT *
FROM Product

ALTER TABLE Product 
ADD CONSTRAINT PRIMARY_KEY_PRODUCT 
PRIMARY KEY (Product_id)

SELECT 
	COUNT(product_id) AS One_Product , 
	product_id
FROM Product
GROUP BY product_id
ORDER BY One_Product DESC

SELECT 
	product_name
FROM Product
WHERE product_name IS NULL

SELECT 
	product_name
FROM Product
GROUP BY product_name

SELECT 
	product_category
FROM Product
WHERE product_category IS NULL

SELECT 
	product_category
FROM Product
GROUP BY product_category

SELECT 
	product_subcategory
FROM Product
WHERE product_subcategory IS NULL

SELECT 
	product_subcategory
FROM Product
GROUP BY product_subcategory

SELECT 
	brand
FROM Product
WHERE brand IS NULL

SELECT 
	brand
FROM Product
GROUP BY brand

SELECT 
	supplier
FROM Product
WHERE supplier IS NULL

SELECT 
	supplier
FROM Product
GROUP BY supplier

SELECT 
	MAX(unit_price) AS MAX_Price , 
	MIN(unit_price) AS MIN_Price , 
	AVG(unit_price) AS AVG_Price
FROM Product


SELECT 
	MAX(product_cost) AS MAX_Cost ,
	MIN(product_cost) AS MIN_Cost ,
	AVG(Product_cost) AS AVG_Cost
FROM Product

SELECT 
	MAX(product_rating) AS MAX_Rating ,
	MIN(product_rating) AS MIN_Rating ,
	AVG(product_rating) AS AVG_Rating
FROM Product

CREATE TABLE Product_Analysis
(
	[Product ID] VARCHAR(50) PRIMARY KEY ,
	[Product Name] VARCHAR(250) ,
	[Product Category] VARCHAR(50) ,
	[Product Subcategory] VARCHAR(50) ,
	[Brand] VARCHAR(50) ,
	[Subblier] VARCHAR(50) ,
	[Unit Price] DEC(10,1) ,
	[Unit Cost] DEC(10,1) ,
	[Product Rating] DEC(10,1)
) ;
GO

INSERT INTO Product_Analysis
SELECT *
FROM Product

