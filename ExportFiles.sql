-- Exported the files to parquet format for further analysis in Power Bi
COPY Sales TO 'Sales.parquet' (FORMAT PARQUET);
COPY DimDate TO 'DimDate.parquet' (FORMAT PARQUET);
COPY DimProduct TO 'DimProduct.parquet' (FORMAT PARQUET);
COPY DimGeography TO 'DimGeography.parquet' (FORMAT PARQUET);
COPY DimChannel TO 'DimChannel.parquet' (FORMAT PARQUET); 

-- Can be exported as CSV format as well for further analysis in Power Bi
COPY Sales TO 'Sales.csv' (HEADER, DELIMITER ',');