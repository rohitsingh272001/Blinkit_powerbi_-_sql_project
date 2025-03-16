-- 1. How many unique items are there in the dataset?
SELECT COUNT(DISTINCT `Item Identifier`) AS Unique_Items FROM blinkit;

-- 2. What are the different types of "Outlet Type" in the dataset?
SELECT DISTINCT `Outlet Type` FROM blinkit;

-- 3. Find the total number of sales for each "Outlet Type".
SELECT `Outlet Type`, SUM(Sales) AS Total_Sales FROM blinkit GROUP BY `Outlet Type`;

-- 4. List all "Low Fat" items sold in "Tier 3" locations.
SELECT * FROM blinkit WHERE `Item Fat Content` = 'Low Fat' AND `Outlet Location Type` = 'Tier 3';

-- 5. Find the average sales of all products.
SELECT AVG(Sales) AS Average_Sales FROM blinkit;

-- 6. Find the top 5 best-selling items by total sales.
SELECT `Item Identifier`, SUM(Sales) AS Total_Sales FROM blinkit 
GROUP BY `Item Identifier` ORDER BY Total_Sales DESC LIMIT 5;

-- 7. Find the total sales for each year.
SELECT `Outlet Establishment Year`, SUM(Sales) AS Total_Sales 
FROM blinkit GROUP BY `Outlet Establishment Year`;

-- 8. Which "Outlet Identifier" has the highest sales?
SELECT `Outlet Identifier`, SUM(Sales) AS Total_Sales FROM blinkit 
GROUP BY `Outlet Identifier` ORDER BY Total_Sales DESC LIMIT 1;

-- 9. Find the total number of sales for "Supermarket Type1".
SELECT SUM(Sales) AS Total_Sales FROM blinkit WHERE `Outlet Type` = 'Supermarket Type1';

-- 10. Find the average item weight for "Frozen Foods".
SELECT AVG(`Item Weight`) AS Avg_Weight FROM blinkit WHERE `Item Type` = 'Frozen Foods';

-- 11. Find the number of items sold per "Outlet Size".
SELECT `Outlet Size`, COUNT(*) AS Items_Sold FROM blinkit GROUP BY `Outlet Size`;

-- 12. Find the total sales for each "Item Type" in descending order.
SELECT `Item Type`, SUM(Sales) AS Total_Sales FROM blinkit 
GROUP BY `Item Type` ORDER BY Total_Sales DESC;

-- 13. Find the number of items that have an "Item Visibility" of less than 0.05.
SELECT COUNT(*) AS Items_Low_Visibility FROM blinkit WHERE `Item Visibility` < 0.05;

-- 14. List all outlets with their total sales, ordered from highest to lowest.
SELECT `Outlet Identifier`, SUM(Sales) AS Total_Sales FROM blinkit 
GROUP BY `Outlet Identifier` ORDER BY Total_Sales DESC;

-- 15. Find out which "Item Fat Content" category generates the highest sales.
SELECT `Item Fat Content`, SUM(Sales) AS Total_Sales FROM blinkit 
GROUP BY `Item Fat Content` ORDER BY Total_Sales DESC;

-- 16. Find the percentage contribution of each "Outlet Type" to total sales.
SELECT `Outlet Type`, (SUM(Sales) / (SELECT SUM(Sales) FROM blinkit) * 100) AS Percentage_Contribution 
FROM blinkit GROUP BY `Outlet Type`;

-- 17. Find the top-selling item in each "Outlet Type".
SELECT `Outlet Type`, `Item Identifier`, SUM(Sales) AS Total_Sales 
FROM blinkit 
GROUP BY `Outlet Type`, `Item Identifier` 
ORDER BY `Outlet Type`, Total_Sales DESC;

-- 18. Find the item with the lowest visibility but highest sales.
SELECT `Item Identifier`, `Item Visibility`, Sales 
FROM blinkit 
WHERE `Item Visibility` = (SELECT MIN(`Item Visibility`) FROM blinkit) 
ORDER BY Sales DESC 
LIMIT 1;


-- 19. Find all missing or null values in "Item Weight".
SELECT * FROM blinkit WHERE `Item Weight` IS NULL;
