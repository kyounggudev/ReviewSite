CREATE TABLE REVIEW(
	reviewID INT,
	userID VARCHAR(20),
	gameID VARCHAR(20),
	reviewDate DATETIME,
	reviewContent VARCHAR(2048),
	reviewAvailable INT,
	reviewRec VARCHAR(10),
	PRIMARY KEY(reviewID)
) DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

select * from review;