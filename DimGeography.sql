Create TABLE DimGeography(
    GeographyKey INT PRIMARY KEY,
    Region VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Zone VARCHAR(50) NOT NULL

);


INSERT INTO DimGeography VALUES
(1,'West','Gujarat','Ahmedabad','West'),
(2,'West','Gujarat','Surat','West'),
(3,'West','Gujarat','Vadodara','West'),
(4,'West','Maharashtra','Mumbai','West'),
(5,'West','Maharashtra','Pune','West'),
(6,'West','Maharashtra','Nagpur','West'),
(7,'North','Delhi','New Delhi','North'),
(8,'North','Rajasthan','Jaipur','North'),
(9,'North','Uttar Pradesh','Lucknow','North'),
(10,'North','Uttar Pradesh','Noida','North'),
(11,'South','Karnataka','Bengaluru','South'),
(12,'South','Kerala','Kochi','South'),
(13,'South','Tamil Nadu','Chennai','South'),
(14,'South','Telangana','Hyderabad','South'),
(15,'East','West Bengal','Kolkata','East'),
(16,'East','Odisha','Bhubaneswar','East'),
(17,'East','Bihar','Patna','East'),
(18,'Central','Madhya Pradesh','Indore','Central'),
(19,'Central','Madhya Pradesh','Bhopal','Central'),
(20,'Central','Chhattisgarh','Raipur','Central'),
(21,'North','Punjab','Ludhiana','North'),
(22,'North','Haryana','Gurugram','North'),
(23,'West','Goa','Panaji','West'),
(24,'South','Andhra Pradesh','Vijayawada','South'),
(25,'East','Jharkhand','Ranchi','East');

