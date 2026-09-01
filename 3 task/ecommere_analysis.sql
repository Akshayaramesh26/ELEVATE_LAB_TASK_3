CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;


SELECT *
FROM ecommerce_sales
LIMIT 10;

-- Check Total Number of Records
SELECT COUNT(*) AS Total_Records
FROM ecommerce_sales;

-- Check the Categories
SELECT DISTINCT Category
FROM ecommerce_sales;


-- Count Orders by Category
SELECT 
    Category,
    COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Orders DESC;

-- Calculate Total Revenue
SELECT 
    SUM(`Final_Price(Rs.)`) AS Total_Revenue
FROM ecommerce_sales;

-- Find average, minimum and maximum purchase value
SELECT 
    AVG(`Final_Price(Rs.)`) AS Average_Purchase_Value,
    MIN(`Final_Price(Rs.)`) AS Minimum_Purchase_Value,
    MAX(`Final_Price(Rs.)`) AS Maximum_Purchase_Value
FROM ecommerce_sales;

-- Category-wise Sales Analysis
SELECT 
    Category,
    COUNT(*) AS Total_Orders,
    SUM(`Final_Price(Rs.)`) AS Total_Revenue,
    ROUND(AVG(`Final_Price(Rs.)`), 2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Category-wise Sales Analysis
SELECT 
    Payment_Method,
    COUNT(*) AS Total_Orders,
    SUM(`Final_Price(Rs.)`) AS Total_Revenue,
    ROUND(AVG(`Final_Price(Rs.)`), 2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC;

-- Payment Method Analysis
SELECT 
    Payment_Method,
    COUNT(*) AS Total_Orders,
    SUM(`Final_Price(Rs.)`) AS Total_Revenue,
    ROUND(AVG(`Final_Price(Rs.)`), 2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC;

-- Discount Analysis
SELECT 
    `Discount (%)` AS Discount_Percentage,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(`Final_Price(Rs.)`), 2) AS Average_Final_Price,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY `Discount (%)`
ORDER BY Discount_Percentage;

-- Find the Top 10 Highest-Value Purchases
SELECT 
    User_ID,
    Product_ID,
    Category,
    `Price (Rs.)`,
    `Discount (%)`,
    `Final_Price(Rs.)`,
    Payment_Method
FROM ecommerce_sales
ORDER BY `Final_Price(Rs.)` DESC
LIMIT 10;

-- Analyze Repeat Customers
SELECT 
    User_ID,
    COUNT(*) AS Number_of_Purchases,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Spent
FROM ecommerce_sales
GROUP BY User_ID
HAVING COUNT(*) > 1
ORDER BY Total_Spent DESC;

-- Monthly Sales Analysis
SELECT
    DATE_FORMAT(STR_TO_DATE(Purchase_Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY Month
ORDER BY Month;

-- Highest Revenue Month
SELECT
    DATE_FORMAT(STR_TO_DATE(Purchase_Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY Month
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Final Customer Analysis
SELECT
    User_ID,
    COUNT(*) AS Total_Purchases,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Spent
FROM ecommerce_sales
GROUP BY User_ID
ORDER BY Total_Spent DESC
LIMIT 10;


-- Find the Most Popular Products
SELECT
    Product_ID,
    COUNT(*) AS Total_Purchases
FROM ecommerce_sales
GROUP BY Product_ID
ORDER BY Total_Purchases DESC
LIMIT 10;

-- Category with the Highest Average Order Value
SELECT
    Category,
    ROUND(AVG(`Final_Price(Rs.)`), 2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY Category
ORDER BY Average_Order_Value DESC
LIMIT 1;

-- High-Value Transactions
SELECT
    User_ID,
    Product_ID,
    Category,
    `Final_Price(Rs.)`,
    Payment_Method
FROM ecommerce_sales
WHERE `Final_Price(Rs.)` > 5000
ORDER BY `Final_Price(Rs.)` DESC;

-- Revenue by Payment Method
SELECT
    Payment_Method,
    ROUND(SUM(`Final_Price(Rs.)`), 2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;