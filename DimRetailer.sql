
Create Table DimRetailer(
    RetailerKey INT PRIMARY KEY,
    RetailerName VARCHAR(100) NOT NULL,
    RetailerType VARCHAR(50) NOT NULL,
    RetailerGroup VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL
);

INSERT INTO DimRetailer VALUES
(1,'Retailer 01','Modern Trade','National Chain','Mumbai','Maharashtra'),
(2,'Retailer 02','Modern Trade','National Chain','Delhi','Delhi'),
(3,'Retailer 03','Modern Trade','National Chain','Bengaluru','Karnataka'), (4,'Retailer 04','Modern Trade','Regional Chain','Ahmedabad','Gujarat'),
(5,'Retailer 05','Modern Trade','Regional Chain','Pune','Maharashtra'),
(6,'Retailer 06','General Trade','Independent','Surat','Gujarat'),
(7,'Retailer 07','General Trade','Independent','Vadodara','Gujarat'),
(8,'Retailer 08','General Trade','Independent','Jaipur','Rajasthan'),
(9,'Retailer 09','General Trade','Independent','Lucknow','Uttar Pradesh'),
(10,'Retailer 10','General Trade','Independent','Kochi','Kerala'),
(11,'Retailer 11','E-Commerce','Online','Mumbai','Maharashtra'),
(12,'Retailer 12','E-Commerce','Online','Delhi','Delhi'),
(13,'Retailer 13','E-Commerce','Online','Bengaluru','Karnataka'),
(14,'Retailer 14','Wholesale','Distributor','Indore','Madhya Pradesh'),
(15,'Retailer 15','Wholesale','Distributor','Nagpur','Maharashtra');
