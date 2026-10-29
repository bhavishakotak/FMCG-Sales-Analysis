create TABLE DimChannel(
    ChannelKey INT PRIMARY KEY,
    ChannelName VARCHAR(50) NOT NULL,
    ChannelType VARCHAR(50) NOT NULL
);



INSERT INTO DimChannel VALUES
(1,'General Trade','Offline'),
(2,'Modern Trade','Offline'),
(3,'E-Commerce','Online'),
(4,'Wholesale','Offline');

