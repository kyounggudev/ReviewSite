CREATE TABLE COMMU(
	commuID INT,
	commuTitle VARCHAR(50),
	userID VARCHAR(20),
	commuDate DATETIME,
	commuContent VARCHAR(2048),
	commuAvailable INT,
	PRIMARY KEY(commuID)
) DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
