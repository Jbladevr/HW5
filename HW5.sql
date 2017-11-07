CREATE TABLE Phone (Primary_phone VARCHAR(13) PRIMARY KEY, Secondary_phone VARCHAR(13));

CREATE TABLE Mailing_address (Street VARCHAR(33), City VARCHAR(17), Province_state VARCHAR (20),
                              Postal_code VARCHAR(6), Country VARCHAR(20), PRIMARY KEY (Street, City) );

CREATE TABLE Airport (Airport_ID INT PRIMARY KEY, City VARCHAR(17), Country VARCHAR(20), Province_state VARCHAR(20));

CREATE TABLE Carrier (Airline_ID INT PRIMARY KEY, Carrier_Name VARCHAR(80), Country VARCHAR (20));

CREATE TABLE Flight (Unique_flight_number INT PRIMARY KEY, Origin_ID INT REFERENCES Airport,
                     Destination_ID INT REFERENCES Airport, Airline_ID INT REFERENCES Carrier,
                     Date_time_departure VARCHAR(16), Date_time_arrival VARCHAR(16), Time_of_flight VARCHAR(5) );

CREATE TABLE Customer (First_name VARCHAR(20), Last_name VARCHAR(20), Mailing_address_street VARCHAR(33), Mailing_address_city VARCHAR(17),
                       Primary_phone VARCHAR(13) REFERENCES Phone, Email VARCHAR(40), PRIMARY KEY (First_name, Last_name),
                       FOREIGN KEY(Mailing_address_street,Mailing_address_city) REFERENCES Mailing_address (Street,City) );

CREATE TABLE Booking (Booking_number INT PRIMARY KEY, Code_city_booked INT, Date_booked VARCHAR(10),
                      First_name_payment VARCHAR(15), Last_name_payment VARCHAR(15), First_name_ticket VARCHAR(15),
                      Last_name_ticket VARCHAR(15), Unique_flight_number INT REFERENCES Flight, 
                      FOREIGN KEY (First_name_payment,Last_name_payment) REFERENCES Customer (First_name,Last_name),
                      FOREIGN KEY (First_name_ticket,Last_name_ticket) REFERENCES Customer (First_name,Last_name));