SELECT *
FROM ecommerce_sales

SELECT DISTINCT(COUNT(order_id)) AS Unique_ID , COUNT(Order_ID)
FROM ecommerce_sales

ALTER TABLE ecommerce_sales
ADD CONSTRAINT PRIMARY_KEY_ECOMMERCE
PRIMARY KEY (order_id)

SELECT order_date
FROM ecommerce_sales
WHERE order_date IS NULL

SELECT order_date
FROM ecommerce_sales
WHERE order_time IS NULL

SELECT Order_status
FROM ecommerce_sales
WHERE order_status IS NULL

SELECT Order_status
FROM ecommerce_sales
GROUP BY order_status 

SELECT sales_channel
FROM ecommerce_sales
WHERE sales_channel IS NULL


SELECT sales_channel
FROM ecommerce_sales
GROUP BY sales_channel 

SELECT customer_id
FROM ecommerce_sales
WHERE customer_id IS NULL

SELECT customer_type
FROM ecommerce_sales
WHERE customer_type IS NULL

SELECT customer_type
FROM ecommerce_sales
GROUP BY customer_type 

SELECT payment_method
FROM ecommerce_sales
GROUP BY payment_method


SELECT payment_method
FROM ecommerce_sales
WHERE payment_method IS NULL

SELECT payment_status
FROM ecommerce_sales
WHERE payment_status IS NULL

SELECT payment_status
FROM ecommerce_sales
GROUP BY payment_status

SELECT currency
FROM ecommerce_sales
WHERE currency IS NULL

SELECT currency
FROM ecommerce_sales
GROUP BY currency

SELECT shipping_method
FROM ecommerce_sales
WHERE shipping_method IS NULL

SELECT shipping_method
FROM ecommerce_sales
GROUP BY shipping_method

SELECT warehouse
FROM ecommerce_sales
GROUP BY warehouse

SELECT warehouse
FROM ecommerce_sales
WHERE warehouse IS NULL

SELECT delivery_days
FROM ecommerce_sales
GROUP BY delivery_days

SELECT estimated_delivery_days
FROM ecommerce_sales
GROUP BY estimated_delivery_days

SELECT delivery_status
FROM ecommerce_sales
GROUP BY delivery_status

SELECT delivery_status
FROM ecommerce_sales
WHERE delivery_status IS NULL

SELECT return_reason
FROM ecommerce_sales
GROUP BY return_reason

SELECT MAX(customer_rating) MAX_Rating , MIN(customer_rating) MIN_Rating , AVG(customer_rating) AVG_Rating
FROM ecommerce_sales

UPDATE ecommerce_sales
SET customer_rating = (SELECT AVG(customer_rating) FROM ecommerce_sales)
WHERE customer_rating IS NULL

SELECT review_sentiment
FROM ecommerce_sales
GROUP BY review_sentiment

SELECT MAX(customer_rating) , MIN(customer_rating) ,review_sentiment
FROM ecommerce_sales
GROUP BY review_sentiment


UPDATE ecommerce_sales
SET review_sentiment = CASE WHEN customer_rating >= 3.5 THEN 'Positive'
						    WHEN customer_rating >= 2.5 THEN 'Neutral'
							ELSE 'Negative' 
							END
WHERE review_sentiment IS NULL

SELECT review_sentiment , customer_review
FROM ecommerce_sales
WHERE customer_review IS NULL

UPDATE ecommerce_sales
SET customer_review = 'Good product. Works as expected.'
WHERE customer_review IS NULL

SELECT marketing_channel
FROM ecommerce_sales
GROUP BY marketing_channel

SELECT marketing_channel
FROM ecommerce_sales
WHERE marketing_channel IS NULL

SELECT marketing_channel , campaign_name
FROM ecommerce_sales
GROUP BY marketing_channel , campaign_name
ORDER BY 1 DESC

UPDATE ecommerce_sales
SET campaign_name = 'Default_Campaign'
WHERE campaign_name IS NULL

UPDATE ecommerce_sales
SET coupon_code = 'No Code'
WHERE coupon_code IS NULL

SELECT is_repeat_customer
FROM ecommerce_sales
GROUP BY is_repeat_customer

SELECT order_date , DATEADD(DAY,ABS(delivery_days),order_date) Delivery_Date
FROM ecommerce_sales

ALTER TABLE ecommerce_sales
ADD Delivery_Date DATE

UPDATE ecommerce_sales
SET Delivery_Date = DATEADD(DAY,ABS(delivery_days),order_date)

SELECT MAX(loyalty_points_earned)  , MIN(loyalty_points_earned) , AVG(loyalty_points_earned)
FROM ecommerce_sales

SELECT COUNT(loyalty_points_earned) AS Total_Earned , loyalty_points_earned
FROM ecommerce_sales
GROUP BY loyalty_points_earned
ORDER BY 2 DESC

SELECT (loyalty_points_earned - loyalty_points_redeemed) AS Remaining_Points
FROM ecommerce_sales
ORDER BY 1 ASC

UPDATE Ecommerce_Transaction
SET [Return Status] = 'No Returned'
WHERE [Return Status] IS NULL

UPDATE Ecommerce_Transaction
SET [Return Reason] = 'No Reason'
WHERE [Return Reason] IS NULL

CREATE TABLE Ecommerce_Transaction
(
	[Order ID] VARCHAR(50) PRIMARY KEY ,
	[Order Date] DATE ,
	[Delivery Date] DATE ,
	[Order Time] Time ,
	[Order Status] VARCHAR(50) ,
	[Sales Channel] VARCHAR(50) ,
	[Customer ID] VARCHAR(50) ,
	[Customer Type] VARCHAR(50) ,
	[Payment Method] VARCHAR(50) ,
	[Payment Status] VARCHAR(50) ,
	[Currency] VARCHAR(50) ,
	[Shipping Method] VARCHAR(50) ,
	[Warehouse] VARCHAR(50) ,
	[Delivery Days] INT ,
	[Estimated Delivery Days] INT ,
	[Delivery Status] VARCHAR(50) ,
	[Return Status] VARCHAR(50) ,
	[Return Reason] VARCHAR(50) ,
	[Customer Rating] DEC(6,2) ,
	[Review Sentiment] VARCHAR(50) ,
	[Customer Review] VARCHAR(100) ,
	[Marketing Channel] VARCHAR(50) ,
	[Campaign Name] VARCHAR(50) ,
	[Coupon Code] VARCHAR(50) ,
	[Loyalty Point Earned] INT ,
	[Loyalty Point Redeemed] INT ,
	[Is Repeat Customer] BIT
) ;
GO

INSERT INTO Ecommerce_Transaction
SELECT order_id , order_date , Delivery_Date , order_time , order_status , sales_channel , customer_id , customer_type , payment_method , payment_status ,currency ,
shipping_method , warehouse , delivery_days , estimated_delivery_days , delivery_status , return_status , return_reason , customer_rating , review_sentiment , customer_review ,
marketing_channel , campaign_name , coupon_code , loyalty_points_earned , loyalty_points_redeemed , is_repeat_customer
FROM ecommerce_sales
