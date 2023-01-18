CREATE TABLE Customer(
	CustomerID bigserial Primary Key not null, 
	Name varchar(100),
	Phone varchar(20),
	Email varchar(100),
    CreatedOn timestamp,
    ModifiedOn timestamp
);

CREATE TABLE Notifications(
    NotificationID bigserial Primary Key not null,
	CustomerID bigserial,
    Title varchar(100),
    Message text,
    CreatedOn timestamp,
    ModifiedOn timestamp,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);