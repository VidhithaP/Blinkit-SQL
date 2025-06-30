use blinkit;

-- Displaying the Table 
select * from `blinkit grocery data`;

-- Total Sales
select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_Sales
from `blinkit grocery data`;

-- Avergae Sales
select cast(avg(Sales) as decimal(10,0)) as Avg_sales
from `blinkit grocery data`;

-- Total Number OF Items
select count(*)  as No_Of_Items from `blinkit grocery data`;

-- Average Rating 
select round(avg(Rating),2) as Avg_Rating from `blinkit grocery data`;

-- Total Sales, Average Sales, Total Number Of  Items,Average Rating By Item Fat Content
select `Item Fat Content`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales,
    cast(avg(Sales) as decimal(10,0)) as Avg_sales,
    count(*)  as No_Of_Item,
    round(avg(Rating),2) as Avg_Rating
from `blinkit grocery data`
group by `Item Fat Content`
order by Total_Sales desc;

-- Total Sales, Average Sales, Total Number Of  Items,Average Rating by Item Type 
select `Item Type`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales,
    cast(avg(Sales) as decimal(10,0)) as Avg_sales,
    count(*)  as No_Of_Item,
    round(avg(Rating),2) as Avg_Rating
from `blinkit grocery data`
group by `Item Type`
order by Total_Sales desc;

-- Total Sales by Outlet Location Type and Item Fat Content
select `Outlet Location Type`, `Item Fat Content`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales
from `blinkit grocery data`
group by `Outlet Location Type`, `Item Fat Content`
order by Total_Sales asc;

-- Fat Content By Outlet Location Type
SELECT 
    `Outlet Location Type`,
    IFNULL(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN Sales ELSE 0 END), 0) AS Low_Fat,
    IFNULL(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN Sales ELSE 0 END), 0) AS Regular
FROM 
    `blinkit grocery data`
GROUP BY 
    `Outlet Location Type`
ORDER BY 
    `Outlet Location Type`;

-- Total Sales By Outlet Establishment Year
select `Outlet Establishment Year`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales
from `blinkit grocery data`
group by `Outlet Establishment Year`
order by `Outlet Establishment Year` asc;

-- Percentage Of Sales By Outlet Size 
select `Outlet Size`,
	cast(sum(Sales) as decimal(10,2)) as Total_Sales,
	cast(sum(Sales)*100.0 /sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage
from `blinkit grocery data`
group by `Outlet Size`
order by Total_Sales desc;

--  Total Sales, Average Sales,Percentage Of Sales, Total Number Of  Items,Average Rating by Outlet Location Type
select `Outlet Location Type`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales,
    cast(avg(Sales) as decimal(10,0)) as Avg_sales,
    cast(sum(Sales)*100.0 /sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage,
    count(*)  as No_Of_Item,
    round(avg(Rating),2) as Avg_Rating
from `blinkit grocery data`
group by `Outlet Location Type`
order by Total_Sales asc;

-- Total Sales, Average Sales,Percentage Of Sales, Total Number Of  Items,Average Rating by Outlet Type
select `Outlet Type`,
    cast(sum(Sales) as decimal(10,2)) as Total_Sales,
    cast(avg(Sales) as decimal(10,0)) as Avg_sales,
    cast(sum(Sales)*100.0 /sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage,
    count(*)  as No_Of_Item,
    round(avg(Rating),2) as Avg_Rating
from `blinkit grocery data`
group by `Outlet Type`
order by Total_Sales asc;






     
    














