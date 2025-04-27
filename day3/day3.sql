show tables;
SELECT * FROM train;

SELECT * FROM train
WHERE Segment = 'Consumer';

SELECT 'Order ID', Sales
FROM train
ORDER BY Sales DESC
LIMIT 10;

SELECT State, SUM(Sales) AS Total_Sales
FROM train
GROUP BY State;

CREATE TABLE region_managers (
    Region VARCHAR(50),
    Manager_Name VARCHAR(50)
);

INSERT INTO region_managers (Region, Manager_Name)
VALUES 
('West', 'Alice'),
('East', 'Bob'),
('Central', 'Charlie'),
('South', 'David');

SELECT o.`Order ID`, o.Region, r.Manager_Name, o.Sales
FROM train o
INNER JOIN region_managers r ON o.Region = r.Region;

SELECT o.`Order ID`, o.Region, r.Manager_Name, o.Sales
FROM train o
LEFT JOIN region_managers r ON o.Region = r.Region;

SELECT o.`Order ID`, o.Region, r.Manager_Name, o.Sales
FROM train o
RIGHT JOIN region_managers r ON o.Region = r.Region;

SELECT State
FROM train
GROUP BY State
HAVING SUM(Sales) > (
    SELECT AVG(state_sales)
    FROM (
        SELECT SUM(Sales) AS state_sales
        FROM train
        GROUP BY State
    ) AS sales_subquery
);

SELECT SUM(Sales) AS Total_Sales
FROM train;

SELECT AVG(Sales) AS Average_Sales
FROM train;

CREATE VIEW sales_by_region AS
SELECT Region, SUM(Sales) AS Total_Sales
FROM train
GROUP BY Region;
SELECT * FROM sales_by_region;




