CREATE TABLE Phone (
  Primary_phone_ID INT PRIMARY KEY,
  Country_Code INT NOT NULL,
  Area_Code INT NOT NULL,
  Local_Number VARCHAR(8) NOT NULL
);

CREATE TABLE Mailing_address (
  Address_ID INT NOT NULL PRIMARY KEY,
  Street VARCHAR(33) NOT NULL,
  City VARCHAR(17) NOT NULL, 
  Province_state VARCHAR (20) NOT NULL,
  Postal_code VARCHAR(6) NOT NULL, 
  Country VARCHAR(20) NOT NULL 
);

CREATE TABLE Airport (
  Airport_ID INT PRIMARY KEY,
  City VARCHAR(17),
  Country VARCHAR(20),
  Province_state VARCHAR(20)
);

CREATE TABLE Carrier (
  Airline_ID INT PRIMARY KEY,
  Carrier_Name VARCHAR(80),
  Country VARCHAR (20)
);

CREATE TABLE Flight (
  Unique_flight_number INT PRIMARY KEY,
  Origin_ID INT REFERENCES Airport,
  Destination_ID INT REFERENCES Airport,
  Airline_ID INT REFERENCES Carrier,
  Date_time_departure VARCHAR(16),
  Date_time_arrival VARCHAR(16),
  Time_of_flight VARCHAR(5) 
);

CREATE TABLE Customer (
  First_name VARCHAR(20) NOT NULL,
  Last_name VARCHAR(20) NOT NULL,
  Mailing_Address_ID INT NOT NULL REFERENCES Mailing_address,
  Primary_phone_ID INT REFERENCES Phone,
  Email VARCHAR(40),
  PRIMARY KEY (First_name, Last_name)
);

CREATE TABLE Booking (
  Booking_number INT PRIMARY KEY,
  city_booked VARCHAR(17),
  Date_booked VARCHAR(10),
  First_name_payment VARCHAR(15),
  Last_name_payment VARCHAR(15),
  First_name_ticket VARCHAR(15),
  Last_name_ticket VARCHAR(15),
  Unique_flight_number INT REFERENCES Flight,
  FOREIGN KEY (First_name_payment,Last_name_payment) 
  REFERENCES Customer (First_name,Last_name),
  FOREIGN KEY (First_name_ticket,Last_name_ticket)
  REFERENCES Customer (First_name,Last_name)
);
