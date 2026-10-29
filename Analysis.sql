-- Brand wise Sales
SELECT p.BrandName, SUM(f.NetSales) AS NetSales
FROM Sales f
JOIN DimProduct p ON f.ProductKey=p.ProductKey
GROUP BY p.BrandName
ORDER BY NetSales DESC;

-- Region/channel performance
SELECT g.Region,c.ChannelName,SUM(f.NetSales) AS NetSales
FROM Sales f
JOIN DimGeography g ON f.GeographyKey=g.GeographyKey
JOIN DimChannel c ON f.ChannelKey=c.ChannelKey
GROUP BY g.Region,c.ChannelName
ORDER BY g.Region,NetSales DESC;


-- Monthly trend
SELECT d.YearNumber,d.MonthNumber,d.MonthName,SUM(f.NetSales) AS NetSales
FROM Sales f
JOIN DimDate d ON f.DateKey=d.DateKey
GROUP BY d.YearNumber,d.MonthNumber,d.MonthName
ORDER BY d.YearNumber,d.MonthNumber;

--Market Sales and Market Share
WITH TotalSales as (
  Select sum(NetSales) as TotalSales
  from Sales
),
RetailerSales AS (
  Select RetailerKey, Sum(NetSales) as RetailerSales
  from Sales 
  Group by RetailerKey
)
Select Retailerkey,RetailerSales, TotalSales-RetailerSales as MarketSales, RetailerSales/(TotalSales-RetailerSales)*100 as MarketShare
from RetailerSales,TotalSales;

-- Category share Within Retailer
WITH CategorySales AS (   SELECT p.Category, SUM(f.NetSales) AS Sales
  FROM Sales f
  JOIN DimProduct p ON f.ProductKey=p.ProductKey   GROUP BY p.Category
)
SELECT Category, Sales,ROUND(100.0*Sales/SUM(Sales) OVER(),2) AS CategorySharePct
FROM CategorySales
ORDER by CategorySharePct DESC;



-- Brand rank within category
WITH BrandSales AS (   SELECT p.Category,p.BrandName,SUM(f.NetSales) AS Sales
FROM Sales f   JOIN DimProduct p ON f.ProductKey=p.ProductKey
GROUP BY p.Category,p.BrandName
)
SELECT Category,BrandName,Sales,
       RANK() OVER(PARTITION BY Category ORDER BY Sales DESC) AS BrandRank
FROM BrandSales;



--Yearly sales by Retailer
WITH Yearly_Sales as (
  select DimRetailer.retailerName,
  DimDate.YearNumber,
  sum(Sales.NetSales) as TotalSales
  from Sales 
  join DimRetailer on DimRetailer.retailerKey = Sales.retailerKey
  join DimDate on Sales.datekey = DimDate.datekey
  group by DimRetailer.retailerName, DimDate.YearNumber
  order BY totalSales desc

)
select * from Yearly_Sales;


--YOY Sales Variance
WITH Current_Period AS (
  Select ProductKey, Sum(NetSales) as CurrentSales
  From Sales
  Where DateKey Between 20261001 and 20261231
  GROUP BY ProductKey
),
Previous_Period As (
  Select  Productkey, Sum(NetSales) As PreviousSales
  from Sales
  Where DateKey Between 20251001 and 20251231
  GROUP BY ProductKey
)
Select Current_Period.ProductKey, CurrentSales, PreviousSales, CurrentSales-PreviousSales as Variance, (CurrentSales-PreviousSales)/PreviousSales*100 as YOY
from Current_Period, Previous_Period
where Current_Period.ProductKey = Previous_Period.ProductKey
order by YOY desc;