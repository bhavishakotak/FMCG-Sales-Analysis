Create TABLE DimProduct(
    ProductKey INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    BrandName VARCHAR(100) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    SubCategory VARCHAR(100) NOT NULL,
    PackSize VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    LaunchDate DATE NOT NULL,
    IsActive Boolean NOT NULL
);


INSERT INTO DimProduct (
    ProductKey,
    ProductName,
    BrandName,
    Category,
    SubCategory,
    PackSize,
    UnitPrice,
    LaunchDate,
    IsActive
)
SELECT
    r.id AS ProductKey,
    'Product ' || LPAD(CAST(r.id AS VARCHAR), 3, '0') AS ProductName,
    'Brand ' || CAST(((r.id - 1) % 10) + 1 AS VARCHAR) AS BrandName,

    CASE ((r.id - 1) % 5)
        WHEN 0 THEN 'Biscuits'
        WHEN 1 THEN 'Snacks'
        WHEN 2 THEN 'Beverages'
        WHEN 3 THEN 'Personal Care'
        ELSE 'Home Care'
    END AS Category,

    CASE ((r.id - 1) % 10)
        WHEN 0 THEN 'Glucose'
        WHEN 1 THEN 'Cream'
        WHEN 2 THEN 'Salty Snacks'
        WHEN 3 THEN 'Namkeen'
        WHEN 4 THEN 'Carbonated'
        WHEN 5 THEN 'Juices'
        WHEN 6 THEN 'Shampoo'
        WHEN 7 THEN 'Soap'
        WHEN 8 THEN 'Detergent'
        ELSE 'Cleaners'
    END AS SubCategory,

    CASE ((r.id - 1) % 4)
        WHEN 0 THEN '50g'
        WHEN 1 THEN '100g'
        WHEN 2 THEN '250g'
        ELSE '500g'
    END AS PackSize,

    CAST(20 + ((r.id * 7) % 181) AS DECIMAL(10,2)) AS UnitPrice,

    DATE '2023-01-01' + CAST(((r.id * 11) % 1000) AS INTEGER) AS LaunchDate,

    TRUE AS IsActive

FROM range(1, 101) AS r(id);
