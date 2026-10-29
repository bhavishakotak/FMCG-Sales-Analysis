CREATE TABLE Dimdate(
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    YearNumber INT NOT NULL,
    Quarter INT NOT NULL,
    MonthNumber INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    WeekNumber INT NOT NULL,
    DayOfMonth INT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    IsWeekend BIT NOT NULL
);

INSERT INTO DimDate (
    DateKey,
    FullDate,
    YearNumber,
    Quarter,
    MonthNumber,
    MonthName,
    WeekNumber,
    DayOfMonth,
    DayName,
    IsWeekend
)
SELECT
    CAST(strftime(d, '%Y%m%d') AS INTEGER) AS DateKey,
    CAST(d AS DATE) AS FullDate,
    year(d) AS YearNumber,
    quarter(d) AS Quarter,
    month(d) AS MonthNumber,
    monthname(d) AS MonthName,
    week(d) AS WeekNumber,
    day(d) AS DayOfMonth,
    dayname(d) AS DayName,
    CASE
        WHEN isodow(d) IN (6, 7) THEN CAST(1 AS bit)
        ELSE CAST(0 AS bit)
    END AS IsWeekend
FROM generate_series(
    DATE '2024-01-01',
    DATE '2026-12-31',
    INTERVAL 1 DAY
) AS date_series(d);
