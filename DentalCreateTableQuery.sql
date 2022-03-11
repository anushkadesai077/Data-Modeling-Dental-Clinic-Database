/*  MindYourOwnMolars.SQL - Creates the DENTAL CLINIC MANAGEMENT database	*/ 
/*	Group 12 Final Project - Data Management and Database Design Fall 2021 	*/
/*	All Rights Reserved.	*/

USE master

raiserror('BEGINNING MindYourOwnMolars.SQL...',1,1) with nowait
GO

if exists (select * from sysdatabases where name='MindYourOwnMolars')
begin
  raiserror('DROPPING EXISTING MindYourOwnMolars DATABSE...',0,1)
  DROP database MindYourOwnMolars
end
GO

CHECKPOINT
GO

raiserror('CREATING MindYourOwnMolars DATABASE...',0,1)
GO

CREATE DATABASE MindYourOwnMolars
GO

USE MindYourOwnMolars
GO

if db_name() <> 'MindYourOwnMolars'
   raiserror('ERROR IN MindYourOwnMolars.SQL, ''USE MindYourOwnMolars'' FAILED!!  KILLING THE SPID NOW.',22,127) with log
GO

raiserror('STARTING TABLE CREATION...',0,1)
GO

------XXXXX-----XXXXX-----XXXXX-----XXXXX-----XXXXX------

create table MasterZipCodes(
	ZipCode char(5) NOT NULL PRIMARY KEY,
	City varchar(20),
	State char(2) NOT NULL	
);

----------------------------------------PROVIDER CLUSTER-------------------------------------------------------

create table EmployeeTypes(
	EmployeeTypeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Job_Title varchar(15) NOT NULL,
	CONSTRAINT CHK_EmplType CHECK (Job_Title='Dentist' OR Job_Title='Hygienist')
);

create table Employees(
	EmployeeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EmployeeTypeId int NOT NULL,
	NPID Char(10) UNIQUE NOT NULL,
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	AddressFirstLine varchar(50) NOT NULL,
	ZipCode char(5) NOT NULL,
	PhoneNo varchar(15) NOT NULL,
	Email varchar(25) NOT NULL,
	DOB Date NOT NULL,
	Gender Char(10) NOT NULL,
	isWorking Bit DEFAULT 0,
	FOREIGN KEY (EmployeeTypeId) REFERENCES EmployeeTypes(EmployeeTypeId),
	FOREIGN KEY (ZipCode) REFERENCES MasterZipCodes(ZipCode)
);

create table EmployeeSpecializations(
	SID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EmployeeId int NOT NULL,
	Specializations varchar(20) NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

----------------------------------------PATIENT CLUSTER-------------------------------------------------------

create table Patient(
	PatientId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PrimaryDentistId int NOT NULL,
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	PhoneNo varchar(15) NOT NULL,
	Email varchar(25) NOT NULL,
	DOB Date NOT NULL,
	Gender Char(10) NOT NULL,
	FOREIGN KEY (PrimaryDentistId) REFERENCES Employees(EmployeeId)
);

create table PatientInfo(
	PatientId int NOT NULL,
	AddressFirstLine varchar(50) NOT NULL,
	ZipCode char(5) NOT NULL,
	EmergencyFirstName varchar(25) NOT NULL,
	EmergencyLastName varchar(25),
	EmergencyPhoneNo varchar(15) NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	FOREIGN KEY (ZipCode) REFERENCES MasterZipCodes(ZipCode),
	CONSTRAINT UC_PatientID UNIQUE (PatientId)
);

create table CompanionInfo(
	PatientId int NOT NULL,
	CompanionFirstName varchar(25) NOT NULL,
	CompanionLastName varchar(25),
	CompanionPhoneNo varchar(15) NOT NULL,
	Relationship varchar(15) NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	CONSTRAINT UC_PatientIDCompanion UNIQUE (PatientId)
);

create table Consent(
	PatientId int NOT NULL,
	Signed Bit NOT NULL,
	Date Date NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	CONSTRAINT UC_PatientIDConsent UNIQUE (PatientId)
);

create table MedicalHistory(
	PatientId int NOT NULL,
	[Covid-19] Bit NOT NULL,
	Diabetes Bit NOT NULL,
	Chemotherapy Bit NOT NULL,
	HIV Bit NOT NULL,
	HighCholestrol Bit NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	CONSTRAINT UC_PatientIDMedHis UNIQUE (PatientId)
);

create table OtherMedications(
	PatientId int NOT NULL,
	Medicine varchar(25) NOT NULL,
	Purpose varchar(25),
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	PRIMARY KEY (PatientId, Medicine)
);

create table DentalHistory(
	PatientId int NOT NULL,
	TopicalFluorideApplication Bit,
	Fluoridated_Water  Bit,
	Fluoride_Supplement_Diet Bit,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	CONSTRAINT UC_PatientIDDenHis UNIQUE (PatientId)
);


----------------------------------------OFFICE CLUSTER-------------------------------------------------------


create table Drug(
	DrugId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DrugName varchar(20) NOT NULL,
	Usage varchar(50),
	Price Money NOT NULL
);

create table DrugStore(
	DrugStoreId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DrugId int NOT NULL,
	Quantity int NOT NULL,
	FOREIGN KEY (DrugId) REFERENCES Drug(DrugId)
);

create table RoomTypes(
	RoomTypeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	RoomName varchar(20),
	CONSTRAINT CHK_RoomName CHECK (RoomName='General' OR RoomName='Hygienist' OR RoomName='Endodontic' OR RoomName='Orthodontic')
);

create table OfficeLocation(
	OfficeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PhoneNo varchar(15) NOT NULL,
	AddressFirstLine varchar(50),
	ZipCode char(5) NOT NULL,
	DrugStoreId int,
	NoOfRooms int,
	FOREIGN KEY (ZipCode) REFERENCES MasterZipCodes(ZipCode),
	FOREIGN KEY (DrugStoreId) REFERENCES DrugStore(DrugStoreId)
);

create table Rooms(
	RoomId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	RoomTypeId int NOT NULL,
	OfficeId int NOT NULL,	
	FOREIGN KEY (RoomTypeId) REFERENCES RoomTypes(RoomTypeId),
	FOREIGN KEY (OfficeId) REFERENCES OfficeLocation(OfficeId)
);

create table Equipment(
	EquipmentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EquipmentName varchar(20) NOT NULL,
	RoomId int NOT NULL,
	FOREIGN KEY (RoomId) REFERENCES Rooms(RoomId)
);

create table Appointments(
	AppointmentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	AppointmentTypeName varchar(20) NOT NULL,
	PatientId int NOT NULL,	
	EmployeeId int NOT NULL,
	OfficeId int NOT NULL,
	RoomId int NOT NULL,
	StartTime DateTime NOT NULL,
	EndTime DateTime NOT NULL,
	isCancelled Bit DEFAULT 1,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	FOREIGN KEY (OfficeId) REFERENCES OfficeLocation(OfficeId),
	FOREIGN KEY (RoomId) REFERENCES Rooms(RoomId),
	CONSTRAINT CHK_ApptTypeName CHECK (AppointmentTypeName='Emergency' OR AppointmentTypeName='General' OR AppointmentTypeName='Follow-up' OR AppointmentTypeName='Routine')
);


----------------------------------------RECORDS CLUSTER-------------------------------------------------------

create table InsuranceInfo(
	InsuranceId varchar(25) NOT NULL,
	PatientId int NOT NULL,
	HolderFirstName varchar(25) NOT NULL,
	HolderLastName varchar(25) NOT NULL,
	InsuranceCompany varchar(20) NOT NULL,
	MaxCoverage Date,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	PRIMARY KEY (PatientId, InsuranceId)
);
/*
ALTER TABLE Allergies
ADD Others varchar(50);
*/

create table Allergies(
	PatientId int NOT NULL,
	CheckinDate Date DEFAULT GETDATE() NOT NULL,
	Antibiotic Bit NOT NULL,
	Aspirin Bit NOT NULL,
	Codeine Bit NOT NULL,
	Darvon Bit NOT NULL,
	Local_Anesthetic Bit NOT NULL,
	Nitrous_Oxide Bit NOT NULL,
	Others varchar(50),
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	PRIMARY KEY (PatientId, CheckinDate)
);

create table DentalRecords(
	PatientId int NOT NULL,
	AppointmentId int NOT NULL,
	Findings varchar(255),
	Comments varchar(255),
	ProcedureRequired Bit NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId),
	PRIMARY KEY (PatientId, AppointmentId)
);

create table Procedures(
	ProcedureId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PatientId int NOT NULL,
	AppointmentId int NOT NULL,
	ProcedurePerformed varchar(50) NOT NULL,
	ProcedureComments varchar(255),
	ToothAssociated int,
	FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
	FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId)
);

create table Prescriptions(
	PrescriptionId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	AppointmentId int NOT NULL,
	DrugId int NOT NULL,
	FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId),
	FOREIGN KEY (DrugId) REFERENCES Drug(DrugId)
);