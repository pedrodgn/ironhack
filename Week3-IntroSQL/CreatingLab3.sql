CREATE TABLE Car (
    Car_ID varchar(200),
    Manufacturer varchar(200),
    Model varchar(200),
   	Brand varchar(200),
	Car_Year Integer,
	Color varchar(200)
);

CREATE TABLE Invoice (
    Invoice_Number varchar(200),
    Invoice_Date date,
    Car_ID varchar(200),
   	Staff_ID varchar(200),
	Customer_ID varchar(200)
);

CREATE TABLE Salesperson (
    Staff_ID varchar(200),
    Salesperson_Name varchar(200),
    Store varchar(200)
);

CREATE TABLE Customer (
    Customer_ID varchar(200),
    Customer_Name varchar(200),
    Phone varchar(200),
	Email varchar(200),
	Address varchar(200),
	Customer_City varchar(200),
	Customer_State varchar(200),
	Customer_Country varchar(200),
	Customer_ZIP integer
);
