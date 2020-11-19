CREATE DATABASE Photographer_Online
USE Photographer_Online

--1.Table Role
CREATE TABLE tblRole(
	RoleID varchar(10) not null,
	RoleName nvarchar(255) not null
)
--Primary key
ALTER TABLE tblRole
	ADD CONSTRAINT PK_tblRole PRIMARY KEY (RoleID)


--2.Table User
CREATE TABLE tblUser(
	UserID VARCHAR(10) not null,
	UserName varchar(25) not null,
	Password VARCHAR(20) not null,
	FullName NVARCHAR(255) not null,
	Address NVARCHAR(MAX) not null,
	Phone VARCHAR(15) not null,
	RoleID VARCHAR(10) not null
)
--Primary Key
ALTER TABLE tblUser
	ADD CONSTRAINT PK_tblUser PRIMARY KEY (UserID)
--Foreign Key
ALTER TABLE tblUser
	ADD CONSTRAINT FK_tblUser FOREIGN KEY (RoleID) REFERENCES tblRole(RoleID) ON DELETE CASCADE
--Unique
ALTER TABLE tblUser
	ADD CONSTRAINT UQ_tblUser_password UNIQUE (Password)
ALTER TABLE tblUser 
	ADD CONSTRAINT UQ_tblUser_UserName UNIQUE (UserName)

--2.Table Message
CREATE TABLE tblMessage(
	MessageID VARCHAR(10) not null,
	Author NVARCHAR(255) not null,
	TimeSend DATETIME not null,
	Content NVARCHAR(255) not null,
	CustomerID VARCHAR(10) not null,
	PhotographerID VARCHAR(10) not null
)
--Primary key
ALTER TABLE tblMessage
	ADD CONSTRAINT PK_tblMessage PRIMARY KEY (MessageID)
--Foreign Key
ALTER TABLE tblMessage
	ADD CONSTRAINT FK_tblMessage_Customer FOREIGN KEY (CustomerID) REFERENCES tblUser(UserID) ON DELETE CASCADE
ALTER TABLE tblMessage
	ADD CONSTRAINT FK_tblMessage_Trainer FOREIGN KEY (PhotographerID) REFERENCES tblUser(UserID)

--3.Table Service
CREATE TABLE tblService(
	ServiceID VARCHAR(10) not null,
	Category NVARCHAR(255) not null,
	ServiceName NVARCHAR(255) not null
)
--Primary key
ALTER TABLE tblService
	ADD CONSTRAINT PK_tblService PRIMARY KEY (ServiceID)

--4.Table ServicePhotographer
CREATE TABLE tblServicePhotographer(
	STID VARCHAR(10) not null,
	PRICE FLOAT not null,
	ServiceID VARCHAR(10) not null,
	PhotographerID VARCHAR(10) not null
)
--Primary Key
ALTER TABLE tblServicePhotographer
	ADD CONSTRAINT PK_tblServicePhotographer PRIMARY KEY (STID)
--Foreign Key
ALTER TABLE tblServicePhotographer
	ADD CONSTRAINT FK_tblServicePhotographer_Service FOREIGN KEY (ServiceID) REFERENCES tblService(ServiceID) ON DELETE CASCADE
ALTER TABLE tblServicePhotographer
	ADD CONSTRAINT FK_tblServicePhotographer_Trainer FOREIGN KEY (PhotographerID) REFERENCES tblUser(UserID) ON DELETE CASCADE
--Table Photo 
CREATE TABLE tblPhoto(
	PhotoID VARCHAR(10) not null,
	PhotoName VARCHAR(20),
	TimeUpload DATETIME,
	PhotoLink VARCHAR(255),
	STID VARCHAR(10)
)
ALTER TABLE tblPhoto
	ADD CONSTRAINT PK_tblPhoto PRIMARY KEY (PhotoID)
ALTER TABLE tblPhoto
	ADD CONSTRAINT FK_tblPhoto	FOREIGN KEY (STID) REFERENCES tblServicePhotographer(STID)

--5.Table Booking
CREATE TABLE tblBooking(
	BookingID VARCHAR(10) not null,
	ContentBooking NVARCHAR(255) not null,
	TimeBooking DATETIME not null,
	Address	NVARCHAR(MAX) not null,
	StatusBooking NVARCHAR(255) not null,
	ContentReview NVARCHAR(255) null,
	Rate int null,
	TimeReview DATETIME null,
	CustomerID VARCHAR(10) not null,
	STID VARCHAR(10) not null
)
--Primary Key
ALTER TABLE tblBooking
	ADD CONSTRAINT PK_tblBooking PRIMARY KEY (BookingID)
--Foreign Key
ALTER TABLE tblBooking
	ADD CONSTRAINT FK_tblBooking_Customer FOREIGN KEY (CustomerID) REFERENCES tblUser(UserID) ON DELETE CASCADE
ALTER TABLE tblBooking
	ADD CONSTRAINT FK_tblBooking_STID FOREIGN KEY (STID) REFERENCES tblServicePhotographer(STID)
--6.Table TimeTable
CREATE TABLE tblTimeTable(
	TimetableID varchar(10) not null,
	StartTime DATETIME,
	EndTime DATETIME,
	DayOfWeek nvarchar(255) not null,
	StatusOfMeeting nvarchar(255) not null,
	BookingID varchar(10) not null,
	PhotographerID varchar(10) not null
)
ALTER TABLE tblTimeTable
	ADD CONSTRAINT PK_tblTimeTable PRIMARY KEY (TimetableID)
ALTER TABLE tblTimeTable
	ADD CONSTRAINT FK_tblTimeTable_booking FOREIGN KEY (BookingID) REFERENCES tblBooking(BookingID)
ALTER TABLE tblTimeTable
	ADD CONSTRAINT FK_tblTimeTable_Trainer FOREIGN KEY (PhotographerID) REFERENCES tblUser(UserID) on delete cascade

ALTER TABLE tblTimeTable
	ADD CONSTRAINT check_tgian_gapmat CHECK (EndTime > StartTime)
ALTER TABLE tblTimeTable
	ADD CONSTRAINT UNIQUE_tblTimeTalbe UNIQUE (StartTime, EndTime,DayOfWeek)


