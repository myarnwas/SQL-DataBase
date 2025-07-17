use Assignment_DB;
/* 1. Create the following tables by using create table statement, you should include attributes properties (i.e. PK, FK, data types, domain) in your script. */
/* Create Clients Table */
CREATE TABLE Clients (
    ClientID VARCHAR(5) PRIMARY KEY,
    ClientName VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(15) NOT NULL);
/*Create Owners Table*/
CREATE TABLE Owners (
    OwnerID VARCHAR(5) PRIMARY KEY,
    OwnerName VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(15) NOT NULL);
/* Create Apartments Table*/
CREATE TABLE Apartments (
    ApartmentNo VARCHAR(5) PRIMARY KEY,
    ApartmentAddress VARCHAR(100) NOT NULL,
    RentalPrice float NOT NULL,
    OwnerID VARCHAR(5),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID));
/*Create Rentals Table*/
CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY,
    StartRental DATE NOT NULL,
    EndRental DATE NOT NULL,
    ApartmentNo VARCHAR(5) NOT NULL,
    ClientID VARCHAR(5) ,
    FOREIGN KEY (ApartmentNo) REFERENCES Apartments(ApartmentNo),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID));
/* Insert data into Clients table*/
INSERT INTO Clients (ClientID, ClientName, PhoneNo)
VALUES
('CR76', 'Johan', '2345678'),
('CR56', 'Alina', '2897645');

/* Insert data into Owners table*/
INSERT INTO Owners (OwnerID, OwnerName, PhoneNo)
VALUES
('CO40', 'Tina Murad', '059456435'),
('CO93', 'Tony Kasim', '059765123');

/* Insert data into Apartments table*/
INSERT INTO Apartments (ApartmentNo, ApartmentAddress, RentalPrice, OwnerID)
VALUES
('PG4', '6 Lorong Setia, KL', 350, 'CO40'),
('PG16', '5 Desa Nilam, KL', 450, 'CO93'),
('PG36', '2, Jalan Matahari, KL', 375, 'CO93');

/*Insert data into Rentals table*/
INSERT INTO Rentals (RentalID, StartRental, EndRental, ApartmentNo, ClientID)
VALUES
(1, '2002-07-01', '2004-08-31', 'PG4', 'CR76'),
(2, '2002-09-01', '2004-09-01', 'PG16', 'CR76'),
(3, '2002-09-01', '2004-06-10', 'PG4', 'CR56'),
(4, '2002-10-10', '2005-12-01', 'PG36', 'CR56');

select * from Clients; select * from Apartments;select * from Owners; select * from Rentals


/*2. Add an Address Column to Clients Table*/
ALTER TABLE Clients
ADD Address VARCHAR(100) NULL;

/*3. Change Data Type for Rental Price Column*/
ALTER TABLE Apartments
ALTER COLUMN RentalPrice MONEY;

/*4. Add DEFAULT Constraint to Rental Price Column*/
ALTER TABLE Apartments
ADD CONSTRAINT DF_RentalPrice DEFAULT 50 FOR RentalPrice;

/*5. Add CHECK Constraint for Rental Period*/
ALTER TABLE Rentals
ADD CONSTRAINT CK_RentalPeriod CHECK (DATEDIFF(DAY, StartRental, EndRental) >= 1);