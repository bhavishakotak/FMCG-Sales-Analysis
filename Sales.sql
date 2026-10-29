CREATE table Sales(
    SaleKey INT Primary Key,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    RetailerKey INT NOT NULL,
    GeographyKey INT NOT NULL,
    ChannelKey INT NOT NULL,
    UnitsSold INT NOT NULL,
    GrossSales DECIMAL(10,2) NOT NULL,
    DiscountAmount DECIMAL(10,2) NOT NULL,
    NetSales DECIMAL(10,2) NOT NULL,
    CostAmount DECIMAL(10,2) NOT NULL,
    GrossMargin DECIMAL(10,2) NOT NULL,
    constraint FK_Date FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    constraint FK_Product FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    constraint FK_Retailer FOREIGN KEY (RetailerKey) REFERENCES DimRetailer(RetailerKey),
    constraint FK_Geography FOREIGN KEY (GeographyKey) REFERENCES DimGeography(GeographyKey),
    constraint FK_Channel FOREIGN KEY (ChannelKey) REFERENCES DimChannel(ChannelKey)
);

INSERT INTO Sales (
    SaleKey,
    DateKey,
    ProductKey,
    RetailerKey,
    GeographyKey,
    ChannelKey,
    UnitsSold,
    GrossSales,
    DiscountAmount,
    NetSales,
    CostAmount,
    GrossMargin
)
SELECT
    i AS SaleKey,

  CAST(
    strftime(
        '%Y%m%d',
        DATE '2024-01-01' + CAST(((i - 1) % 1096) AS INTEGER)
    ) AS INTEGER
) AS DateKey,

    1 + ((i * 17) % 100) AS ProductKey,
    1 + ((i * 7) % 15) AS RetailerKey,
    1 + ((i * 13) % 25) AS GeographyKey,
    1 + ((i * 5) % 4) AS ChannelKey,

    10 + ((i * 31) % 150) AS UnitsSold,

    CAST(
        (10 + ((i * 31) % 150)) *
        (20 + ((i * 7) % 181))
        AS DECIMAL(14,2)
    ) AS GrossSales,

    CAST(
        (10 + ((i * 31) % 150)) *
        (20 + ((i * 7) % 181)) *
        (((i * 11) % 16) / 100.0)
        AS DECIMAL(14,2)
    ) AS DiscountAmount,

    CAST(
        (10 + ((i * 31) % 150)) *
        (20 + ((i * 7) % 181)) *
        (1 - (((i * 11) % 16) / 100.0))
        AS DECIMAL(14,2)
    ) AS NetSales,

    CAST(
        (10 + ((i * 31) % 150)) *
        (20 + ((i * 7) % 181)) *
        (1 - (((i * 11) % 16) / 100.0)) *
        (0.55 + (((i * 19) % 21) / 100.0))
        AS DECIMAL(14,2)
    ) AS CostAmount,

    CAST(
        (10 + ((i * 31) % 150)) *
        (20 + ((i * 7) % 181)) *
        (1 - (((i * 11) % 16) / 100.0)) *
        (1 - (0.55 + (((i * 19) % 21) / 100.0)))
        AS DECIMAL(14,2)
    ) AS GrossMargin

FROM range(1, 500001) AS r(i);