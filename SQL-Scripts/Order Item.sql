SELECT *
FROM order_items

SELECT 
	order_id , 
	COUNT(order_id) AS One_Order 
FROM order_items
GROUP BY order_id
ORDER BY One_Order DESC

SELECT 
	order_id
FROM order_items
WHERE order_id IS NULL

SELECT 
	product_id
FROM order_items
WHERE product_id IS NULL
 
ALTER TABLE order_items 
ADD Order_Item_ID INT IDENTITY(1,1) PRIMARY KEY

SELECT 
	MAX(quantity) AS MAX_Quantity , 
	MIN(quantity) AS MIN_Quantity , 
	AVG(quantity) AS AVG_Quantity
FROM order_items

SELECT 
	MAX(discount_percentage) AS MAX_Discount , 
	MIN(discount_percentage) AS MIN_Discount , 
	AVG(discount_percentage) AS AVG_Discount
FROM order_items


SELECT 
	MAX(tax_amount) AS MAX_Tax , 
	MIN(tax_amount) AS MIN_Tax , 
	AVG(tax_amount) AS AVG_Tax
FROM order_items

SELECT 
	MAX(shipping_cost) AS MAX_Shipping_Cost , 
	MIN(shipping_cost) AS MIN_Shipping_Cost , 
	AVG(shipping_cost) AS AVG_Shipping_Cost 
FROM order_items

CREATE TABLE Order_Item_Analysis
(
	[Order Item ID] INT PRIMARY KEY ,
	[Order ID] VARCHAR(50) ,
	[Product ID] VARCHAR(50) ,
	[Quantity] INT ,
	[Discount %] DEC(10,3) ,
	[Tax Amount] DEC(10,1) ,
	[Shipping Cost] DEC(10,1) ,
) ;
GO

INSERT INTO Order_Item_Analysis
SELECT 
	Order_Item_ID , 
	order_id ,
	product_id ,
	quantity ,
	discount_percentage ,
	tax_amount ,
	shipping_cost
FROM order_items