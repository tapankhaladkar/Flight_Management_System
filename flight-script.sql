Show databases;
Create database FLight_Management_System;

use FLight_Management_System;

CREATE TABLE CITY
(CNAME VARCHAR(15) NOT NULL,
STATE VARCHAR(15), 
ALIAS VARCHAR(30),
PRIMARY KEY(CNAME));

INSERT INTO CITY (CNAME, STATE, ALIAS) VALUES 
('Mumbai', 'Maharashtra', 'MUM'),
('Chandigarh', 'Chandigarh', 'India'),
('Delhi', 'Delhi', 'DEL'),
('Bangalore', 'Karnataka', 'BAN'),
('Hyderabad', 'Telangana', 'HYD'),
('Ahmedabad', 'Gujarat', 'AHM'),
('Chennai', 'Tamil Nadu', 'CHN'),
('Kolkata', 'West Bengal', 'KOL'),
('Surat', 'Gujarat', 'SUR'),
('Jaipur', 'Rajasthan', 'JAI'),
('Pune', 'Maharashtra', 'PUN'),
('Lucknow', 'Uttar Pradesh', 'LCK'),
('Indore', 'Madhya Pradesh', 'IND'),
('Imphal', 'Manipur', 'IMP'),
('Nagpur', 'Maharashtra', 'NGP'),
('Goa', 'Goa', 'Goa');


SELECT * FROM CITY;

CREATE TABLE AIRPORT
(AIRPORT_NAME VARCHAR(100) NOT NULL,
STATE VARCHAR(15), 
ALIAS VARCHAR(30),
CNAME VARCHAR(15),
PRIMARY KEY(AIRPORT_NAME),
FOREIGN KEY(CNAME) REFERENCES CITY(CNAME) ON DELETE CASCADE);

INSERT INTO AIRPORT (AIRPORT_NAME, STATE, ALIAS, CNAME) VALUES
('Chhatrapati Shivaji Maharaj International Airport', 'Maharashtra', 'MUM', 'Mumbai'),
('Shaheed Bhagat Singh International Airport', 'Chandigarh', 'CHD', 'Chandigarh'),
('Indira Gandhi International Airport', 'Delhi', 'DEL', 'Delhi'),
('Kempegowda International Airport', 'Karnataka', 'BAN', 'Bangalore'),
('Rajiv Gandhi International Airport', 'Telangana', 'HYD', 'Hyderabad'),
('Sardar Vallabhbhai Patel International Airport', 'Gujarat', 'AHM', 'Ahmedabad'),
('Chennai International Airport', 'Tamil Nadu', 'CHN', 'Chennai'),
('Netaji Subhas Chandra Bose International Airport', 'West Bengal', 'KOL', 'Kolkata'),
('Surat International Airport', 'Gujarat', 'SUR', 'Surat'),
('Jaipur International Airport', 'Rajasthan', 'JAI', 'Jaipur'),
('Pune International Airport', 'Maharashtra', 'PUN', 'Pune'),
('Chaudhary Charan Singh International Airport', 'Uttar Pradesh', 'LCK', 'Lucknow'),
('Dr. Babasaheb Ambedkar International Airport', 'Maharashtra', 'NGP', 'Nagpur'),
('Devi Ahilya Bai Holkar Airport', 'Madhya Pradesh', 'IND', 'Indore'),
('Bir Tikendrajit International Airport', 'Manipur', 'IMP', 'Imphal'),
('Goa International Airport', 'Goa', 'GOA', 'Goa');


select * from AIRPORT;

CREATE TABLE AIRLINE
(AL_ID VARCHAR(7) NOT NULL,
AIRLINE_NAME VARCHAR(50),
AL_CODE VARCHAR(3),
PRIMARY KEY(AL_ID));

INSERT INTO AIRLINE (AL_ID, AIRLINE_NAME, AL_CODE) VALUES
('AI', 'Air India', 'AI'),
('IN', 'IndiGo', '6E'),
('SP', 'SpiceJet', 'SG'),
('GO', 'GoAir', 'G8'),
('VT', 'Vistara', 'UK'),
('AJ', 'AirAsia India', 'I5'),
('AL', 'Alliance Air', '9I'),
('JT', 'TruJet', '2T');


Select * from AIRLINE;

CREATE TABLE CONSISTS_OF
(AL_ID VARCHAR(3) NOT NULL,
AIRPORT_NAME VARCHAR(100) NOT NULL,
PRIMARY KEY(AL_ID, AIRPORT_NAME),
FOREIGN KEY(AL_ID) REFERENCES AIRLINE(AL_ID) ON DELETE CASCADE,
FOREIGN KEY(AIRPORT_NAME) REFERENCES AIRPORT(AIRPORT_NAME) ON DELETE CASCADE);

INSERT INTO CONSISTS_OF (AL_ID, AIRPORT_NAME) VALUES
('IN','Indira Gandhi International Airport'),
('IN','Chhatrapati Shivaji Maharaj International Airport'),
('IN','Rajiv Gandhi International Airport'),
('IN','Kempegowda International Airport'),
('IN','Netaji Subhas Chandra Bose International Airport');

SELECT * FROM CONSISTS_OF;

INSERT INTO CONSISTS_OF (AL_ID, AIRPORT_NAME) VALUES
('AI','Shaheed Bhagat Singh International Airport'),
('AI','Netaji Subhas Chandra Bose International Airport'),
('AI','Indira Gandhi International Airport'),
('AI','Chhatrapati Shivaji Maharaj International Airport'),
('AI','Rajiv Gandhi International Airport');

INSERT INTO CONSISTS_OF (AL_ID, AIRPORT_NAME) VALUES
('SP','Chhatrapati Shivaji Maharaj International Airport'),
('SP','Sardar Vallabhbhai Patel International Airport'),
('SP','Chennai International Airport'),
('SP','Pune International Airport'),
('SP','Jaipur International Airport');

INSERT INTO CONSISTS_OF (AL_ID, AIRPORT_NAME) VALUES
('GO','Sardar Vallabhbhai Patel International Airport'),
('GO','Chhatrapati Shivaji Maharaj International Airport'),
('GO','Shaheed Bhagat Singh International Airport'),
('GO','Kempegowda International Airport'),
('GO','Rajiv Gandhi International Airport');

INSERT INTO CONSISTS_OF (AL_ID, AIRPORT_NAME) VALUES
('VT','Chhatrapati Shivaji Maharaj International Airport'),
('VT','Pune International Airport'),
('VT','Chennai International Airport'),
('VT','Kempegowda International Airport'),
('VT','Sardar Vallabhbhai Patel International Airport');

select * from CONSISTS_OF;
DROP table FLIGHT;
CREATE TABLE FLIGHT
(
    F_Code VARCHAR(10) NOT NULL,
    source_city VARCHAR(155),
    destination_city VARCHAR(155),
    arrival_time VARCHAR(10),
    departure_time VARCHAR(10),
    status VARCHAR(10),
    duration VARCHAR(30),
    class VARCHAR(10),
    AL_ID VARCHAR(13),
    PRIMARY KEY(F_Code),
    FOREIGN KEY(AL_ID) REFERENCES AIRLINE(AL_ID) ON DELETE CASCADE
);

INSERT INTO FLIGHT (F_Code, source_city, destination_city, arrival_time, departure_time, status, duration, class, AL_ID)
VALUES
('AI2014', 'Delhi', 'Mumbai', '02:10', '04:25', 'On-time', '2.15', 'Non-stop', 'AI'),
('IN2305', 'Bangalore', 'Delhi', '13:00', '15:50', 'Delayed', '2.50', 'Connecting', 'IN'),
('SG134', 'Chennai', 'Visakhapatnam', '19:20', '21:35', 'Cancelled', '2.15', 'Non-Stop', 'SP'),
('G8016', 'Rajahmundry', 'Sri Venkateswara', '05:50', '06:35', 'On-time', '1.45', 'Non-stop', 'GO'),
('UK169', 'Port Blair', 'Bhatinda', '10:20', '15:45', 'On-time', '7.25', 'Connecting', 'VT'),
('I5367', 'Jeypore', 'Kochi', '18:10', '19:40', 'Delayed', '1.30', 'Non-stop', 'AJ'),
('9I70', 'Kandla', 'Goa', '22:00', '28:50', 'On-time', '6.45', 'Connecting', 'AL'),
('6E056', 'Cuttack', 'Nagapattinam', '02:15', '04:15', 'On-time', '2.00', 'Connecting', 'IN'),
('AI356', 'Coimbatore', 'Chennai', '18:50', '21:05', 'On-time', '2.15', 'Non-stop', 'AI'),
('AJ223', 'Goa', 'Sri Venkateswara', '23:00', '03:00', 'On-time', '4.00', 'Direct', 'AJ');

SELECT * FROM FLIGHT;


CREATE TABLE PASSENGER1
(PID INT NOT NULL,
PassPort_No VARCHAR(10) NOT NULL,
PRIMARY KEY(PID, PassPort_No));


INSERT INTO PASSENGER1 VALUES
(1, 'A1234568'),
(2, 'B9876541'),
(3, 'C2345698'),
(4, 'D1002004'),
(5, 'X9324666'),
(6, 'B8765430'),
(7, 'J9801235'),
(8, 'A1122334'),
(9, 'Q1243567'),
(10, 'S1243269'),
(11, 'E3277889'),
(12, 'K3212322'),
(13, 'P3452390'),
(14, 'W7543336'),
(15, 'R8990566');

SELECT * FROM PASSENGER1;


CREATE TABLE PASSENGER2
(PassPort_No VARCHAR(10) NOT NULL,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
ADDRESS VARCHAR(100),
PHONE VARCHAR(10),
AGE INT,
SEX VARCHAR(1),
PRIMARY KEY(PassPort_No));

INSERT INTO PASSENGER2 VALUES
('A1234568', 'ROHAN', 'SHARMA', '2230 BANDRA WEST, APT 11, MUMBAI, MH', 8080367290, 30, 'M'),
('B9876541', 'ANKITA', 'AHIR', '3456 VIKAS APTS, APT 102, DELHI, DEL', 8080367280, 26, 'F'),
('C2345698', 'KHYATI', 'MISHRA', '7820 KORMANGLA, APT 234, BANGALORE, KN', 8082267280, 30, 'F'),
('D1002004', 'VIVEK', 'PATEL', '7720 BANJARA HILLS, APT 1082, HYDERABAD, TL', 9080367266, 23, 'M'),
('X9324666', 'ARUN', 'PANDIT', '9082 T NAGAR, CHENNAI, TN', 9004360125, 28, 'M'),
('B8765430', 'LAKSHMI', 'SHARMA', '1110 PALI HILL, APT 903, MUMBAI, MH', 7666190505, 30, 'F'),
('J9801235', 'AKHILESH', 'JOSHI', '345 SALT LAKE, APT 678, KOLKATA, WB', 9080369290, 29, 'M'),
('A1122334', 'MANAN', 'LAKHANI', '5589 GOMTI NAGAR, APT 349 LUCKNOW, UP', 9004335126, 25, 'F'),
('Q1243567', 'KARAN', 'MOTANI', '4444 PANAJI CITY, APT 77, PANAJI, GA', 9727626643, 22, 'M'),
('S1243269', 'AARUSH', 'SOLANKI', '7720 SWAROOP NAGAR, APT 2087, KANPUR, UP', 9004568903, 60, 'M'),
('E3277889', 'JITESH', 'GANDHI', '1234 GANDHI APTS, APT 59, SURAT, GJ', 9724569986, 10, 'M'),
('K3212322', 'SOHA', 'TRIVEDI', '6785 GANGA GHAT, APT 34, LUCKNOW, UP', 9024569226, 15, 'F'),
('P3452390', 'ALIA', 'BHAT', '548 KOREGAON PARK, PUNE, MH', 9734567800, 10, 'F'),
('W7543336', 'NIKHIL', 'JAIN', '6666 ADAJAN, APT 2902, SURAT, GJ', 4624569986, 55, 'M'),
('R8990566', 'RIA', 'GUPTA', '3355 CIVIL LINES, APT 2065, NAGPUR, MH', 4724512343, 10, 'F');


Select * from PASSENGER2;
DROP TABLE PASSENGER3;
CREATE TABLE PASSENGER3
(PID INT NOT NULL,
F_Code VARCHAR(10),
PRIMARY KEY(PID),
FOREIGN KEY(F_Code) REFERENCES FLIGHT(F_Code) ON DELETE CASCADE);

INSERT INTO PASSENGER3 VALUES
(1, 'AI2014'),
(2, 'IN2305'),
(3, 'SG134'),
(4, 'G8016'),
(5, 'UK169'),
(6, 'I5367'),
(7, '9I70'),
(8, '6E056'),
(9, 'AI356'),
(10, 'AJ223');

SELECT * FROM PASSENGER3;


CREATE TABLE EMPLOYEE1
(SSN INT NOT NULL,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
ADDRESS VARCHAR(100),
PHONE VARCHAR(10),
AGE INT,
SEX VARCHAR(1),
Emp_Type VARCHAR(30),
AType VARCHAR(30),
ETYPE VARCHAR(30),
SHIFT VARCHAR(20),
POSITION VARCHAR(30),
AIRPORT_NAME VARCHAR(100),
PRIMARY KEY(SSN),
FOREIGN KEY(AIRPORT_NAME) REFERENCES AIRPORT(AIRPORT_NAME) ON DELETE CASCADE);

INSERT INTO EMPLOYEE1 VALUES
(123456789, 'RHEA', 'SHARMA', '731 PALI HILL, MUMBAI, MH', 4356789345, 35, 'F', 'ADMINISTRATION', 'RECEPTIONIST', '', 'DAY', '', 'Chhatrapati Shivaji Maharaj International Airport'),
(333445555, 'PAURAS', 'GHAG', '638 SAHITYA SAHAVAS, MUMBAI, MH', 9834561995, 40, 'M', 'ADMINISTRATION', 'SECRETARY', '', 'NIGHT', '', 'Chhatrapati Shivaji Maharaj International Airport'),
(999887777, 'PARTH', 'PAWAR', '3321 CANNAUGHT PLACE, DELHI, DL', 9834666995, 50, 'M', 'TECHNICIAN', 'RADIO Techinician', '', 'DAY', '', 'Indira Gandhi International Airport'),
(987654321, 'SHUBHAM', 'KUNDU', '123 WHITE FIELDS, BANGALORE, KN', 8089654321, 47, 'M', 'FLIGHT MONITOR', '', '', 'DAY', '', 'Kempegowda International Airport'),
(666884444, 'KSHTIJ', 'KAMAT', '345 GOKULDHAM, AHEMDABAD, GJ', 1254678903, 55, 'M', 'FLIGHT MONITOR', '', '', 'NIGHT', '',  'Sardar Vallabhbhai Patel International Airport'),
(453453453, 'RAJ', 'SHARMA', '345 R NAGAR, CHENNAI, TL', 4326789031, 35, 'M', 'AIRPORT AUTHORITY', 'MANAGER', '', 'DAY', '',  'Chennai International Airport'),
(987987987, 'NIKITA', 'PAUL', '110 HOWRAH BRIDGE, KOLKATA, WB', 5678904325, 33, 'F', 'TECHNICIAN', 'AIRPORT CIVIL Techinician', '', 'NIGHT', '',  'Netaji Subhas Chandra Bose International Airport'),
(888665555, 'PRIYA', 'GUPTA', '567 CHANDANI CHOWK, DELHI, DL', 8566778890, 39, 'F', 'ADMINISTRATION', 'DATA ENTRY WORKER', '', 'NIGHT', '',  'Indira Gandhi International Airport'),
(125478909, 'PRATIK', 'DEKHMUKH', '334 VRUNDAVAN PARK, PUNE, MH', 4444678903, 56, 'M', 'FLIGHT MONITOR', '', '', 'DAY', '',  'Pune International Airport'),
(324567897, 'ADIT', 'DESAI', '987 SOMNATH, INDORE, MP', 2244658909, 36, 'M', 'FLIGHT MONITOR', '', '', 'DAY', '',  'Devi Ahilya Bai Holkar Airport');

SELECT * FROM EMPLOYEE1;

CREATE TABLE EMPLOYEE2
(Emp_Type VARCHAR(30) NOT NULL,
SALARY INT,
PRIMARY KEY(Emp_Type));

INSERT INTO EMPLOYEE2 VALUES
('ADMINISTRATION', 50000),
('TECHNICIAN', 70000),
('FLIGHT MONITOR', 80000),
('AP AUTHORITY', 90000);


SELECT * FROM EMPLOYEE2;

CREATE TABLE SERVES
(SSN INT NOT NULL,
PID INT NOT NULL,
PassPort_No VARCHAR(10) NOT NULL,
PRIMARY KEY(SSN, PID, PassPort_No),
FOREIGN KEY(SSN) REFERENCES EMPLOYEE1(SSN) ON DELETE CASCADE,
FOREIGN KEY(PID, PassPort_No) REFERENCES PASSENGER1(PID, PassPort_No) ON DELETE CASCADE);


INSERT INTO SERVES VALUES
(123456789, 1, 'A1234568'),
(123456789, 15, 'R8990566'),
(123456789, 9, 'Q1243567'),
(888665555, 4, 'D1002004'),
(888665555, 13, 'P3452390'),
(333445555, 10, 'S1243269'),
(333445555, 12, 'K3212322'),
(888665555, 12, 'K3212322'),
(123456789, 7, 'J9801235'),
(888665555, 7, 'J9801235');

SELECT * FROM SERVES;

DROP TABLE TICKET1;
CREATE TABLE TICKET1
(Ticket_No VARCHAR(15) NOT NULL,
source_city VARCHAR(155),
destination_city VARCHAR(155),
Booking_Date VARCHAR(25),
DATE_OF_TRAVEL VARCHAR(25),
Seat_Number VARCHAR(5),
class  VARCHAR(15),
DATE_OF_CANCELLATION VARCHAR(25),
PID INT,
PassPort_No VARCHAR(10),
FOREIGN KEY(PID, PassPort_No) REFERENCES PASSENGER1(PID, PassPort_No) ON DELETE CASCADE);


INSERT INTO TICKET1 VALUES
('0011234111122', 'Mumbai', 'Indore', '2023-03-11', '2023-11-05', '32A', 'ECONOMY', '', 1, 'A1234568'),
('0984567222299', 'Chennai', 'Kolkata', '2023-04-01', '2023-08-20', '45D', 'ECONOMY', '2023-08-12', 2, 'B9876541'),
('1768901333273', 'Kolkata', 'Mumbai', '2021-02-22', '2022-10-25', '1A', 'BUSINESS', '', 3, 'C2345698'),
('5890987441464', 'Port Blair', 'Nasik', '2021-09-01', '2022-01-12', '20C', 'FIRST-CLASS', '', 4, 'D1002004'),
('1577654664266', 'Mumbai', 'Goa', '2023-07-13', '2023-11-17', '54E', 'ECONOMY', '', 5, 'X9324666'),
('2206543545545', 'Indore', 'Chandigarh', '2022-11-05', '2023-02-12', '43B', 'ECONOMY', '', 6, 'B8765430'),
('7064321779737', 'Chandigarh', 'Mumbai', '2023-11-15', '2023-12-25', '27B', 'FIRST-CLASS', '', 7, 'J9801235'),
('1571357215116', 'Goa', 'Port Blair', '2021-10-15', '2021-10-18', '34E', 'ECONOMY', '', 8, 'A1122334'),
('1570864987655', 'Mumbai', 'Nagpur', '2023-11-12', '2023-12-31', '54C', 'ECONOMY', '', 9, 'Q1243567'),
('1579283997799', 'Mumbai', 'Chennai', '2023-01-22', '2023-04-15', '38A', 'ECONOMY', '', 10, 'S1243269'),
('1255701876107', 'Chennai', 'Chandigarh', '2023-10-19', '2023-12-31', '57F', 'ECONOMY', '', 11, 'E3277889'),
('1251334499699', 'Nasik', 'Mumbai', '2023-04-21', '2023-06-12', '45D', 'ECONOMY', '', 12, 'K3212322'),
('1258776199490', 'Goa', 'Mumbai', '2022-05-13', '2023-12-15', '37C', 'ECONOMY', '2022-05-25', 13, 'P3452390'),
('5891155114477', 'Mumbai', 'Port Blair', '2022-12-26', '2023-07-23', '55C', 'ECONOMY', '', 14, 'W7543336'),
('5893069766787', 'Port Blair', 'Jaipur', '2023-11-12', '2023-12-06', '33F', 'ECONOMY', '', 15, 'R8990566');



SELECT * FROM TICKET1;

Drop TABLE TICKET2;
CREATE TABLE TICKET2
(Booking_Date DATE NOT NULL,
source_city VARCHAR(155) NOT NULL,
destination_city VARCHAR(155) NOT NULL,
class VARCHAR(15) NOT NULL,
price INT,
PRIMARY KEY(Booking_Date, source_city, destination_city, class));


INSERT INTO TICKET2(Booking_Date, source_city, destination_city, class, price) VALUES
('2023-03-11', 'Mumbai', 'Indore', 'ECONOMY', 95000),
('2023-03-11', 'Chennai', 'Kolkata', 'ECONOMY', 100000),
('2023-02-21', 'Kolkata', 'Mumbai', 'BUSINESS', 200000),
('2021-09-01', 'Port Blair', 'Nasik', 'FIRST-CLASS', 150000),
('2023-07-13', 'Indore', 'Goa', 'ECONOMY', 98000),
('2022-11-05', 'Mumbai', 'Chandigarh', 'ECONOMY', 125000),
('2023-11-15', 'SSCL', 'Indore', 'FIRST-CLASS', 195000),
('2021-10-15', 'Goa', 'Port Blair', 'ECONOMY', 170000),
('2023-11-12', 'Singapore', 'Bhopal', 'ECONOMY', 140000),
('2023-10-19', 'Chennai', 'Rajasthan', 'ECONOMY', 45000),
('2023-04-21', 'Nasik', 'Singapore', 'ECONOMY', 100000),
('2022-05-13', 'Guwahati', 'Sri Lanka', 'ECONOMY', 65000),
('2023-07-23', 'Saudi Arabia', 'Rajasthan', 'ECONOMY', 80000),
('2021-12-22', 'Port Blair', 'Jaipur', 'ECONOMY', 98000);

SELECT * FROM TICKET2;


CREATE TABLE TICKET3
(DATE_OF_CANCELLATION DATE NOT NULL,
SURCHARGE INT,
PRIMARY KEY(DATE_OF_CANCELLATION));


INSERT INTO TICKET3(DATE_OF_CANCELLATION, SURCHARGE) VALUES
('2023-08-10', 75000),
('2023-05-25', 25000);

SELECT * FROM TICKET3;











