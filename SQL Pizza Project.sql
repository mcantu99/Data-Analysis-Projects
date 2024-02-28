SELECT * FROM pizza_sales

/* KPI Requirements */
/* Find the total revenue */
SELECT sum(total_price) AS Total_Revenue
FROM pizza_sales

/* Average Value Order */
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Value_Order
FROM pizza_sales

/* Total Pizzas Sold */
SELECT sum(quantity) AS Total_Pizzas_Sold
FROM pizza_sales 

/* Total Orders */
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

/* Average Pizzas Per Order */
SELECT CAST(SUM(quantity) AS decimal(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS Avg_Pizza_Per_Order
FROM pizza_sales

/* Chart Requirements */
/* Find the daily trend for total orders */	
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

/* Find the monthly trend for total orders */
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

/* Percentage of sales by pizza category */
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 
GROUP BY pizza_category

/* Percentage of sales by pizza size */
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT sum(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC

/* Top 5 Best Sellers by revenue */
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/* Top 5 Lowest Sellers by revenue */
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/* Top 5 Best Sellers by quantity */
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC

/* Top 5 Best Sellers by Order */
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

