CREATE SCHEMA Analysis
GO
ALTER SCHEMA Analysis TRANSFER Customer_Analysis
GO
ALTER SCHEMA Analysis TRANSFER Order_Item_Analysis
GO
ALTER SCHEMA Analysis TRANSFER Product_Analysis
GO
ALTER SCHEMA Analysis TRANSFER Ecommerce_Transaction
GO

SELECT *
FROM Analysis.Customer_Analysis


SELECT  
	OIA.* , PA.[Product Name] , PA.[Product Category] , PA.[Product Subcategory] , PA.[Product Brand] , PA.Supplier , 
	PA.[Unit Price] , PA.[Unit Cost] , PA.[Product Rating]  
	INTO [MERGED 1]
FROM Analysis.Order_Item_Analysis OIA 
INNER JOIN Analysis.Product_Analysis PA
ON OIA.[Product ID] = PA.[Product ID]

SELECT 
	ET.* , CA.[Customer Name] , CA.[Customer Age] , CA.Gender , CA.[Customer Segment] ,
	CA.[Customer City] , CA.[Customer State] , CA.[Customer Country] , CA.Region , CA.[Customer Acquisition Cost]
	INTO [MERGED 2]
FROM Analysis.Ecommerce_Transaction ET INNER JOIN Analysis.Customer_Analysis CA
ON ET.[Customer ID] = CA.[Customer ID]

SELECT *
FROM [MERGED 1]

SELECT *
FROM [MERGED 2]

SELECT M2.* , M1.[Order Item ID] , M1.[Product ID] , M1.Quantity , M1.[Discount %] , M1.[Tax Amount] , M1.[Shipping Cost] , M1.[Product Name] ,
	M1.[Product Category] , M1.[Product Subcategory] , M1.[Product Brand] , M1.Supplier , M1.[Unit Price] , M1.[Unit Cost] , M1.[Product Rating]
	INTO DATASET
FROM [MERGED 2] M2 INNER JOIN [MERGED 1] M1
ON M2.[Order ID] = M1.[Order ID]
