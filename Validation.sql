SELECT 'DimDate' AS TableName, COUNT(*) AS RowCounts FROM DimDate
UNION ALL SELECT 'DimProduct', COUNT(*) FROM DimProduct
UNION ALL SELECT 'DimRetailer', COUNT(*) FROM DimRetailer
UNION ALL SELECT 'DimGeography', COUNT(*) FROM DimGeography
UNION ALL SELECT 'DimChannel', COUNT(*) FROM DimChannel
UNION ALL SELECT 'FactSales', COUNT(*) FROM Sales;
SELECT MIN(FullDate) AS MinDate, MAX(FullDate) AS MaxDate
FROM DimDate;
SELECT
    COUNT(*) AS TotalRows,
    COUNT(DateKey) AS DateKeys,
    COUNT(ProductKey) AS ProductKeys,
    COUNT(RetailerKey) AS RetailerKeys,
    COUNT(GeographyKey) AS GeographyKeys,
    COUNT(ChannelKey) AS ChannelKeys
FROM Sales;
SELECT
    SUM(UnitsSold) AS TotalUnits,
    SUM(GrossSales) AS GrossSales,
    SUM(DiscountAmount) AS Discounts,
    SUM(NetSales) AS NetSales,
    SUM(CostAmount) AS Cost,
    SUM(GrossMargin) AS GrossMargin,
    ROUND(100.0*SUM(GrossMargin)/NULLIF(SUM(NetSales),0),2)
        AS GrossMarginPct
FROM Sales;
