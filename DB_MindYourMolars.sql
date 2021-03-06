USE [master]
GO
/****** Object:  Database [MindYourOwnMolars]    Script Date: 15-12-2021 18:20:36 ******/
CREATE DATABASE [MindYourOwnMolars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MindYourOwnMolars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MindYourOwnMolars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MindYourOwnMolars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MindYourOwnMolars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MindYourOwnMolars] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MindYourOwnMolars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MindYourOwnMolars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET ARITHABORT OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MindYourOwnMolars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MindYourOwnMolars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MindYourOwnMolars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MindYourOwnMolars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET RECOVERY FULL 
GO
ALTER DATABASE [MindYourOwnMolars] SET  MULTI_USER 
GO
ALTER DATABASE [MindYourOwnMolars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MindYourOwnMolars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MindYourOwnMolars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MindYourOwnMolars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MindYourOwnMolars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MindYourOwnMolars] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MindYourOwnMolars', N'ON'
GO
ALTER DATABASE [MindYourOwnMolars] SET QUERY_STORE = OFF
GO
USE [MindYourOwnMolars]
GO
/****** Object:  Table [dbo].[Allergies]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergies](
	[PatientId] [int] NOT NULL,
	[CheckinDate] [date] NOT NULL,
	[Antibiotic] [bit] NOT NULL,
	[Aspirin] [bit] NOT NULL,
	[Codeine] [bit] NOT NULL,
	[Darvon] [bit] NOT NULL,
	[Local_Anesthetic] [bit] NOT NULL,
	[Nitrous_Oxide] [bit] NOT NULL,
	[Others] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[CheckinDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentTypeName] [varchar](20) NOT NULL,
	[PatientId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[OfficeId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[isCancelled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanionInfo]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanionInfo](
	[PatientId] [int] NOT NULL,
	[CompanionFirstName] [varchar](25) NOT NULL,
	[CompanionLastName] [varchar](25) NULL,
	[CompanionPhoneNo] [varchar](15) NOT NULL,
	[Relationship] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consent]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consent](
	[PatientId] [int] NOT NULL,
	[Signed] [bit] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DentalHistory]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DentalHistory](
	[PatientId] [int] NOT NULL,
	[TopicalFluorideApplication] [bit] NULL,
	[Fluoridated_Water] [bit] NULL,
	[Fluoride_Supplement_Diet] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DentalRecords]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DentalRecords](
	[PatientId] [int] NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[Findings] [varchar](255) NULL,
	[Comments] [varchar](255) NULL,
	[ProcedureRequired] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drug]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drug](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](20) NOT NULL,
	[Usage] [varchar](50) NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugStore]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugStore](
	[DrugStoreId] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrugStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeId] [int] NOT NULL,
	[NPID] [char](10) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[AddressFirstLine] [varchar](50) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](10) NOT NULL,
	[isWorking] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSpecializations]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSpecializations](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Specializations] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTypes]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTypes](
	[EmployeeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Job_Title] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [varchar](20) NOT NULL,
	[RoomId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceInfo]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceInfo](
	[InsuranceId] [varchar](25) NOT NULL,
	[PatientId] [int] NOT NULL,
	[HolderFirstName] [varchar](25) NOT NULL,
	[HolderLastName] [varchar](25) NOT NULL,
	[InsuranceCompany] [varchar](20) NOT NULL,
	[MaxCoverage] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterZipCodes]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterZipCodes](
	[ZipCode] [char](5) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalHistory]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistory](
	[PatientId] [int] NOT NULL,
	[Covid-19] [bit] NOT NULL,
	[Diabetes] [bit] NOT NULL,
	[Chemotherapy] [bit] NOT NULL,
	[HIV] [bit] NOT NULL,
	[HighCholestrol] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeLocation]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeLocation](
	[OfficeId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[AddressFirstLine] [varchar](50) NULL,
	[ZipCode] [char](5) NOT NULL,
	[DrugStoreId] [int] NULL,
	[NoOfRooms] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherMedications]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherMedications](
	[PatientId] [int] NOT NULL,
	[Medicine] [varchar](25) NOT NULL,
	[Purpose] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[Medicine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PrimaryDentistId] [int] NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientInfo]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientInfo](
	[PatientId] [int] NOT NULL,
	[AddressFirstLine] [varchar](50) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[EmergencyFirstName] [varchar](25) NOT NULL,
	[EmergencyLastName] [varchar](25) NULL,
	[EmergencyPhoneNo] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[DrugId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedures]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedures](
	[ProcedureId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[ProcedurePerformed] [varchar](50) NOT NULL,
	[ProcedureComments] [varchar](255) NULL,
	[ToothAssociated] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcedureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[OfficeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 15-12-2021 18:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (1, CAST(N'2021-10-12' AS Date), 0, 0, 0, 1, 0, 0, N'Kiwi')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (2, CAST(N'2021-08-01' AS Date), 0, 0, 0, 1, 0, 1, N'Peaches, celery')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (3, CAST(N'2021-11-23' AS Date), 1, 0, 0, 0, 0, 1, N'sesame')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (4, CAST(N'2021-11-15' AS Date), 1, 0, 0, 1, 1, 0, N'Kiwi')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (5, CAST(N'2021-10-25' AS Date), 0, 1, 1, 0, 1, 1, N'Peanuts, milk')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (6, CAST(N'2021-07-19' AS Date), 1, 0, 0, 0, 0, 1, N'Peanuts ')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (7, CAST(N'2021-10-31' AS Date), 1, 1, 1, 0, 0, 1, N'soybeans')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (8, CAST(N'2021-12-12' AS Date), 0, 1, 1, 0, 0, 0, N'Peaches')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (9, CAST(N'2020-12-30' AS Date), 0, 1, 1, 0, 0, 0, N'Wheat')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (10, CAST(N'2021-10-12' AS Date), 0, 0, 0, 0, 1, 0, N'milk')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (11, CAST(N'2021-12-01' AS Date), 0, 0, 0, 1, 1, 0, N'Peanuts ')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (12, CAST(N'2021-12-01' AS Date), 0, 1, 1, 1, 1, 0, N'celery')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (13, CAST(N'2021-12-12' AS Date), 0, 1, 1, 1, 1, 0, N'Peanuts, eggs')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (14, CAST(N'2021-11-23' AS Date), 0, 0, 0, 1, 0, 0, N'Peaches')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (15, CAST(N'2021-12-01' AS Date), 0, 0, 0, 1, 0, 1, N'Eggs')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (16, CAST(N'2021-10-12' AS Date), 1, 0, 0, 0, 1, 1, N'milk')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (17, CAST(N'2021-09-18' AS Date), 0, 1, 1, 1, 1, 0, N'mustard')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (18, CAST(N'2021-12-01' AS Date), 1, 1, 1, 0, 1, 1, N'oysters')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (19, CAST(N'2021-11-17' AS Date), 1, 0, 0, 0, 0, 0, N'Kiwi')
INSERT [dbo].[Allergies] ([PatientId], [CheckinDate], [Antibiotic], [Aspirin], [Codeine], [Darvon], [Local_Anesthetic], [Nitrous_Oxide], [Others]) VALUES (20, CAST(N'2021-12-01' AS Date), 0, 0, 0, 0, 0, 0, N'Mustard')
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (1, N'Emergency', 1, 1, 1, 2, CAST(N'2021-12-18T09:00:00.000' AS DateTime), CAST(N'2021-12-18T10:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (2, N'General', 2, 2, 2, 16, CAST(N'2021-12-18T10:00:00.000' AS DateTime), CAST(N'2021-12-18T11:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (3, N'Follow-up', 4, 3, 3, 1, CAST(N'2021-12-18T11:00:01.000' AS DateTime), CAST(N'2021-12-18T12:00:01.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (4, N'Routine', 5, 2, 4, 15, CAST(N'2021-12-18T12:00:00.000' AS DateTime), CAST(N'2021-12-18T12:30:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (5, N'General', 6, 3, 2, 2, CAST(N'2021-12-18T13:00:00.000' AS DateTime), CAST(N'2021-12-18T13:45:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (6, N'Follow-up', 7, 4, 5, 1, CAST(N'2021-12-18T14:00:00.000' AS DateTime), CAST(N'2021-12-18T15:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (7, N'Emergency', 14, 4, 6, 1, CAST(N'2021-12-21T11:00:01.000' AS DateTime), CAST(N'2021-12-21T11:30:01.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (8, N'General', 17, 5, 7, 4, CAST(N'2021-12-18T11:00:01.000' AS DateTime), CAST(N'2021-12-18T12:00:01.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (9, N'Follow-up', 1, 2, 10, 1, CAST(N'2021-12-19T09:00:00.000' AS DateTime), CAST(N'2021-12-19T09:30:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (10, N'General', 4, 6, 1, 15, CAST(N'2021-12-18T11:00:01.000' AS DateTime), CAST(N'2021-12-18T11:45:01.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (11, N'Follow-up', 6, 7, 9, 17, CAST(N'2021-12-18T13:00:00.000' AS DateTime), CAST(N'2021-12-18T13:30:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (12, N'Follow-up', 3, 8, 3, 1, CAST(N'2021-12-20T09:45:01.000' AS DateTime), CAST(N'2021-12-20T10:15:01.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (13, N'Routine', 10, 9, 8, 16, CAST(N'2021-12-18T13:00:00.000' AS DateTime), CAST(N'2021-12-18T14:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (14, N'General', 2, 2, 1, 18, CAST(N'2021-12-18T14:00:00.000' AS DateTime), CAST(N'2021-12-18T15:00:00.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (15, N'Follow-up', 6, 10, 15, 2, CAST(N'2021-12-20T09:45:01.000' AS DateTime), CAST(N'2021-12-20T10:45:01.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (16, N'Emergency', 9, 11, 19, 6, CAST(N'2021-12-18T14:00:00.000' AS DateTime), CAST(N'2021-12-18T15:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (19, N'Follow-up', 11, 14, 15, 4, CAST(N'2021-12-20T09:45:01.000' AS DateTime), CAST(N'2021-12-20T10:30:01.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (20, N'Routine', 16, 16, 18, 12, CAST(N'2021-12-21T11:00:00.000' AS DateTime), CAST(N'2021-12-21T11:30:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (21, N'General', 1, 3, 2, 7, CAST(N'2021-12-18T15:00:00.000' AS DateTime), CAST(N'2021-12-18T16:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentTypeName], [PatientId], [EmployeeId], [OfficeId], [RoomId], [StartTime], [EndTime], [isCancelled]) VALUES (22, N'Follow-up', 19, 12, 4, 8, CAST(N'2021-12-21T11:00:00.000' AS DateTime), CAST(N'2021-12-21T11:30:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
INSERT [dbo].[CompanionInfo] ([PatientId], [CompanionFirstName], [CompanionLastName], [CompanionPhoneNo], [Relationship]) VALUES (1, N'Martin', N'Smith', N'6676696969', N'Father')
INSERT [dbo].[CompanionInfo] ([PatientId], [CompanionFirstName], [CompanionLastName], [CompanionPhoneNo], [Relationship]) VALUES (7, N'Phoebe', N'Taylor', N'6676696975', N'Mother')
INSERT [dbo].[CompanionInfo] ([PatientId], [CompanionFirstName], [CompanionLastName], [CompanionPhoneNo], [Relationship]) VALUES (15, N'Gloria', N'Campbell', N'6676696983', N'Mother')
INSERT [dbo].[CompanionInfo] ([PatientId], [CompanionFirstName], [CompanionLastName], [CompanionPhoneNo], [Relationship]) VALUES (23, N'Bina', N'Patel', N'6676696991', N'Mother')
INSERT [dbo].[CompanionInfo] ([PatientId], [CompanionFirstName], [CompanionLastName], [CompanionPhoneNo], [Relationship]) VALUES (11, N'Jason', N'Scott', N'6676696979', N'Father')
GO
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (1, 0, CAST(N'2021-09-19' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (2, 1, CAST(N'2021-09-20' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (3, 1, CAST(N'2021-09-21' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (4, 1, CAST(N'2021-09-22' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (5, 1, CAST(N'2021-09-23' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (6, 1, CAST(N'2021-09-24' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (7, 1, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (10, 1, CAST(N'2021-09-26' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (12, 1, CAST(N'2021-09-26' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (17, 1, CAST(N'2021-09-26' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (23, 1, CAST(N'2021-09-26' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (16, 1, CAST(N'2021-10-02' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (14, 1, CAST(N'2021-10-02' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (11, 1, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (9, 1, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (18, 1, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (8, 0, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (24, 1, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (13, 1, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Consent] ([PatientId], [Signed], [Date]) VALUES (15, 1, CAST(N'2021-10-03' AS Date))
GO
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (1, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (2, 0, 1, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (3, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (4, 0, 1, 1)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (5, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (6, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (7, 1, 1, 1)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (8, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (9, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (10, 1, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (11, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (12, 1, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (13, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (14, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (15, 1, 0, 1)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (16, 0, 0, 1)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (17, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (18, 1, 0, 1)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (19, 0, 0, 0)
INSERT [dbo].[DentalHistory] ([PatientId], [TopicalFluorideApplication], [Fluoridated_Water], [Fluoride_Supplement_Diet]) VALUES (20, 0, 0, 0)
GO
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (1, 1, N'Rot on Left incisor ', N'Conduct removal on the tooth', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (1, 9, N'Infection on central incisor ', N'Performed cleaning, root canal in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (1, 21, N'Infection on first  premolar', N'Root canal to be performed in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (2, 2, N'Rot on maxillary first molar tooth', N'Perform dental filling in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (2, 14, N'Rot on left canine', N'Perform dental filling in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (3, 12, N'Infection on maxillary third molar', N'Root canal to be performed in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (4, 3, N'Bleeding on left gum due to wisdom tooth', N'Check if pain persists in next appointment ', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (4, 10, N'Bleeding on right gum due to wisdom tooth', N'Check if pain persists in next appointment ', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (5, 4, N'Rot on maxillary second molar', N'Perform a root canal treatment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (6, 5, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (6, 11, N'Rot on Left incisor ', N'Perform dental filling in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (6, 15, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (7, 6, N'Bleeding on left incisor', N'Perform dental filling in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (9, 16, N'Rot on left canine tooth', N'Perform dental filling in next appointment', 1)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (10, 13, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (11, 19, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (14, 7, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (16, 20, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (17, 8, N'No cavity found', N'Performed general cleaning', 0)
INSERT [dbo].[DentalRecords] ([PatientId], [AppointmentId], [Findings], [Comments], [ProcedureRequired]) VALUES (19, 22, N'Rot on Left incisor ', N'Perform dental filling in next appointment', 1)
GO
SET IDENTITY_INSERT [dbo].[Drug] ON 

INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (1, N'Motrin', N'Treatment of fever and pain.', 10.9900)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (2, N'Tylenol', N'Treat mild to moderate pain', 12.4900)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (3, N'Anbesol', N'Dental/Gum Pain/Cold Sores', 17.8100)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (4, N'Orajel', N'Anesthetic for oral mucosa.', 16.5400)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (5, N'Peridex', N'Oral rinse to treat Gingivitis', 6.1400)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (6, N'PerioChip', N'An agent used to treat periodontitis', 355.5000)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (7, N'PerioGard', N'Chlorhexidine gluconate oral rinse', 3.9800)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (8, N'Minocycline', N'Antibiotic for bacterial infection', 25.7200)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (9, N'Triclosan', N'Bacterial Infections and Mycoses', 97.0000)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (10, N'Orabase', N'Used for anti-inflammatory, antiallergic action', 8.6900)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (11, N'Oracort', N'Reduces the swelling, pain of mouth sores', 22.6900)
INSERT [dbo].[Drug] ([DrugId], [DrugName], [Usage], [Price]) VALUES (12, N'Oralone', N'Used for relief of symptoms of oral ulcers', 35.0000)
SET IDENTITY_INSERT [dbo].[Drug] OFF
GO
SET IDENTITY_INSERT [dbo].[DrugStore] ON 

INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (1, 8, 10)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (2, 9, 20)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (3, 10, 30)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (4, 1, 10)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (5, 2, 23)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (6, 3, 45)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (7, 4, 65)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (8, 5, 88)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (9, 6, 54)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (10, 7, 23)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (11, 1, 12)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (12, 11, 55)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (13, 8, 98)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (14, 9, 33)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (15, 10, 21)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (16, 9, 23)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (17, 12, 78)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (18, 4, 65)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (19, 5, 19)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (20, 6, 20)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (21, 3, 25)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (22, 4, 15)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (23, 5, 28)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (24, 6, 44)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (25, 7, 13)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (26, 1, 62)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (27, 11, 75)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (28, 8, 58)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (29, 9, 83)
INSERT [dbo].[DrugStore] ([DrugStoreId], [DrugId], [Quantity]) VALUES (30, 10, 91)
SET IDENTITY_INSERT [dbo].[DrugStore] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (1, 1, N'9572508368', N'Molly', N'Weasley', N'107 Cactus Rd', N'02115', N'6676461305', N'm.weasley@gmail.com', CAST(N'1992-09-29' AS Date), N'Female    ', 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (2, 1, N'2659463693', N'Amy', N'Dunne', N'43 Marchall St', N'36104', N'6676461306', N'amydone@yahoo.com', CAST(N'1980-08-29' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (3, 1, N'9344345839', N'Claire', N'Smith', N'8919 4th St', N'99801', N'6676461307', N'claire.s@gmail.com', CAST(N'1975-07-29' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (4, 1, N'2694866251', N'Madeline', N'James', N'1185 Boylston St', N'85001', N'6676461308', N'mjms@gmail.com', CAST(N'1969-06-25' AS Date), N'Female    ', 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (5, 1, N'3704480461', N'Kateline', N'Williams', N'81 Ann Dr.', N'78701', N'6676461309', N'k.williams@gmail.com', CAST(N'1969-06-26' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (6, 1, N'6245940951', N'Emma', N'Miller', N'25 Allied Dr.', N'95814', N'6676461310', N'emmam@gmail.com', CAST(N'1969-06-27' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (7, 1, N'6247318855', N'Jada', N'Hawthorne', N'13 Green St', N'29217', N'6676461311', N'jadah@gmail.com', CAST(N'1969-06-28' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (8, 1, N'5774154611', N'Ang ', N'Lee', N'83 NW', N'06103', N'6676461312', N'anglee@gmail.com', CAST(N'1969-06-29' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (9, 1, N'5269224769', N'Willow', N'Smith', N'1 West Saxon St', N'65101', N'6676461313', N'smithw@gmail.com', CAST(N'1969-06-30' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (10, 1, N'7145978215', N'Jake', N'Lowe', N'533 Penn Drive', N'59623', N'6676461314', N'jlowe@gmail.com', CAST(N'1969-07-01' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (11, 1, N'9773763805', N'Connor', N'Bridges', N'96 Hanover Ave', N'68502', N'6676461315', N'connb@gmail.com', CAST(N'1969-07-02' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (12, 1, N'6719313914', N'Wyatt', N'Roy', N'312 Colonial St', N'96813', N'6676461316', N'roy.w@gmail.com', CAST(N'1969-07-03' AS Date), N'Male      ', 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (13, 1, N'3987222630', N'Cody', N'Waldorf', N'8 Rockaway Ave', N'08608', N'6676461317', N'waldrof@gmail.com', CAST(N'1969-07-04' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (14, 1, N'8191392298', N'Edward ', N'Yang', N'2 Corona Lane', N'87501', N'6676461318', N'yang.ew@gmail.com', CAST(N'1969-07-05' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (15, 1, N'6788408207', N'Andrew', N'Lau', N'72 Arlington Ave', N'12207', N'6676461319', N'andy.lau@gmail.com', CAST(N'1969-07-06' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (16, 1, N'4742583976', N'Wong-Kar', N'Wai', N'369 Sunset Ave', N'27601', N'6676461320', N'wkwai@gmail.com', CAST(N'1969-07-07' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (17, 1, N'6100056248', N'Agnes', N'Varda', N'1 Surrey Dr.', N'72201', N'6676461321', N'agnesv@gmail.com', CAST(N'1969-07-08' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (18, 1, N'5095895478', N'Jean-Luc', N'Godard', N'8 Princeton Ave', N'80202', N'6676461322', N'jlgod@gmail.com', CAST(N'1969-07-09' AS Date), N'Male      ', 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (19, 1, N'6138904402', N'Xavier', N'Dolan', N'17 Sherwood Court', N'19901', N'6676461323', N'xavierdolan@gmail.com', CAST(N'1969-07-10' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (21, 1, N'7550178404', N'Martin', N'Scorcese', N'176 Bonney Lake', N'32301', N'6676461325', N'm.scorcese@gmail.com', CAST(N'1969-07-12' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (22, 2, N'6237684945', N'Ridley', N'Scott', N'19 Schilling Dr.', N'30303', N'6676461326', N'ridles@gmail.com', CAST(N'1969-07-13' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (23, 1, N'336394431 ', N'Greta', N'Gerwig', N'2017 Bates Ave', N'40601', N'6676461327', N'gerwig.greta@yahoo.com', CAST(N'1969-07-14' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (24, 2, N'7978978404', N'Sofia', N'Coppola', N'201 Monroe Road', N'70802', N'6676461328', N'sofia.coppola@gmail.com', CAST(N'1969-07-15' AS Date), N'Female    ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (25, 1, N'6476201477', N'Wes', N'Anderson', N'2 E Smythe Rd', N'04330', N'6676461329', N'anderson.w@gmail.com', CAST(N'1969-07-16' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (26, 2, N'8476208477', N'Ingmar', N'Bergman', N'724 Alder St', N'21401', N'6676461330', N'bergmanin@gmail.com', CAST(N'1969-07-17' AS Date), N'Male      ', 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeTypeId], [NPID], [FirstName], [LastName], [AddressFirstLine], [ZipCode], [PhoneNo], [Email], [DOB], [Gender], [isWorking]) VALUES (27, 1, N'5476201745', N'Eric', N'Rohmer', N'6100 Carillon Pt', N'17101', N'6676461331', N'eric.rohmer@gmail.com', CAST(N'1969-07-18' AS Date), N'Male      ', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeSpecializations] ON 

INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (1, 1, N'Endodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (2, 1, N'Orthodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (4, 3, N'Pedodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (5, 3, N'Orthodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (8, 8, N'Periodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (9, 9, N'Orthodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (10, 10, N'Orthodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (11, 10, N'Prosthodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (12, 11, N'Endodontist')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (13, 1, N'Oral Surgeon')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (14, 7, N'Oral Surgeon')
INSERT [dbo].[EmployeeSpecializations] ([SID], [EmployeeId], [Specializations]) VALUES (16, 7, N'Anesthisiologists')
SET IDENTITY_INSERT [dbo].[EmployeeSpecializations] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeTypes] ON 

INSERT [dbo].[EmployeeTypes] ([EmployeeTypeId], [Job_Title]) VALUES (1, N'Dentist')
INSERT [dbo].[EmployeeTypes] ([EmployeeTypeId], [Job_Title]) VALUES (2, N'Hygienist')
SET IDENTITY_INSERT [dbo].[EmployeeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (1, N'Dental PC', 1)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (2, N'Dental Syringe', 2)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (3, N'Mouth Mirror', 3)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (4, N'Explorers', 4)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (5, N'Cotton Forceps', 5)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (6, N'Periodontal Probe', 6)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (7, N'Ultrasonic Scaler', 7)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (8, N'Extracting Forceps', 8)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (9, N'Dental Elevator', 9)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (10, N'Air Water Syringe', 10)
INSERT [dbo].[Equipment] ([EquipmentId], [EquipmentName], [RoomId]) VALUES (11, N'Saliva Ejector', 11)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'5509 6995-D', 1, N'Mark', N'Smith', N'AllState', CAST(N'2022-10-21' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'9709 6965-D', 2, N'Anthony', N'Rodriguez', N'Nationwide', CAST(N'2025-01-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'7709 6885-A', 3, N'Donald', N'Brown', N'Progressive', CAST(N'2022-01-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'0119 3645-B', 4, N'Steve', N'Davis', N'Amica Insurance ', CAST(N'2022-11-30' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'0009 0945-B', 5, N'Andrew', N'Wilson', N'Nationwide', CAST(N'2022-09-11' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'6609 4590-C', 6, N'Joshua', N'Thomas', N'AllState', CAST(N'2020-05-20' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'2088 6190-A', 7, N'George', N'Taylor', N'Progressive', CAST(N'2022-01-15' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'2009 1191-A', 8, N'Edward', N'Lee', N'MaxxHealth ', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'4449 4490-B', 9, N'Jason', N'Thompson', N'AllState', CAST(N'2024-04-15' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'2709 6945-D', 10, N'Ryan', N'White', N'Amica Insurance ', CAST(N'2022-01-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'2909 2245-D', 11, N'Jacob', N'Scott', N'Amica Insurance ', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'6758 7654-A', 12, N'Gary', N'Nguyen', N'MaxxHealth', CAST(N'2025-12-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'3458 7154-A', 13, N'Mary', N'Baker', N'MaxxHealth ', CAST(N'2022-01-31' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'9958 7100-C', 14, N'Susan', N'Hall', N'MaxxHealth ', CAST(N'2023-03-31' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'2009 1190-B', 15, N'Lisa', N'Campbell', N'AllState', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'6909 1191-B', 16, N'Ashley', N'Turner', N'Amica Insurance ', CAST(N'2022-03-01' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'0709 6885-C', 17, N'Laura', N'Parker', N'Progressive', CAST(N'2022-05-24' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'5709 6885-C', 17, N'Laura', N'Parker', N'Progressive', CAST(N'2022-05-24' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'8809 0085-A', 18, N'Amy', N'Collins', N'Aetna', CAST(N'2022-08-14' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'9709 0005-B', 19, N'Shirley', N'Stewart', N'Cigna', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[InsuranceInfo] ([InsuranceId], [PatientId], [HolderFirstName], [HolderLastName], [InsuranceCompany], [MaxCoverage]) VALUES (N'1709 3335-D', 20, N'Debra', N'Cooper', N'Aetna', CAST(N'2022-07-10' AS Date))
GO
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'02115', N'Boston', N'MA')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'02903', N'Providence', N'RI')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'04330', N'Augusta', N'ME')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'06103', N'Hartford', N'CT')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'08608', N'Trenton', N'NJ')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'12207', N'Albany', N'NY')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'17101', N'Harrisburg', N'PA')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'19901', N'Dover', N'DE')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'21401', N'Annapolis', N'MD')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'27601', N'Raleigh', N'NC')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'29217', N'Columbia', N'SC')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'30303', N'Atlanta', N'GA')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'32301', N'Tallahassee', N'FL')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'36104', N'Montgomery', N'AL')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'37219', N'Nashville', N'TN')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'40601', N'Frankfort', N'KY')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'57501', N'Pierre', N'SD')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'59623', N'Helena', N'MT')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'65101', N'Jefferson City', N'MO')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'68502', N'Lincoln', N'NE')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'70802', N'Baton Rouge', N'LA')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'72201', N'Little Rock', N'AR')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'73102', N'Oklahoma City', N'OK')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'78701', N'Austin', N'TX')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'80202', N'Denver', N'CO')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'85001', N'Phoenix', N'AZ')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'87501', N'Santa Fe', N'NM')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'95814', N'Sacramento', N'CA')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'96813', N'Honolulu', N'HI')
INSERT [dbo].[MasterZipCodes] ([ZipCode], [City], [State]) VALUES (N'99801', N'Juneau', N'AK')
GO
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (1, 0, 1, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (2, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (3, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (4, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (5, 1, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (6, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (7, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (8, 0, 0, 0, 0, 1)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (9, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (10, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (11, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (12, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (13, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (14, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (15, 1, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (16, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (17, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (18, 0, 0, 0, 0, 1)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (19, 0, 0, 0, 0, 0)
INSERT [dbo].[MedicalHistory] ([PatientId], [Covid-19], [Diabetes], [Chemotherapy], [HIV], [HighCholestrol]) VALUES (20, 1, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[OfficeLocation] ON 

INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (1, N'6676676767', N'10, Huntington Ave', N'02115', 1, 4)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (2, N'6676676768', N'283 Fusce Rd.', N'36104', 2, 5)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (3, N'6676676769', N'606 Ullamcorper. Street', N'99801', 3, 6)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (4, N'6676676770', N'Ap #867  Sit Rd.', N'85001', 4, 7)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (5, N'6676676771', N'7292 Dictum Av.', N'78701', 5, 8)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (6, N'6676676772', N'Ap #651-8679 Sodales Av.', N'95814', 6, 9)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (7, N'6676676773', N'5037 Diam Rd.', N'29217', 7, 10)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (8, N'6676676774', N'191-103 Integer Rd.', N'06103', 8, 11)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (9, N'6676676775', N'P.O. Box 887 2508 Dolor. Av.', N'65101', 9, 12)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (10, N'6676676777', N'935-9940 Tortor. Street', N'68502', 11, 14)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (11, N'6676676778', N'4189 Nunc Road', N'96813', 12, 4)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (12, N'6676676779', N'5587 Nunc. Avenue', N'08608', 13, 5)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (13, N'6676676780', N'3279 Viverra. Avenue', N'87501', 14, 6)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (14, N'6676676781', N'1599 Curabitur Rd.', N'12207', 15, 7)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (15, N'6676676782', N'7666 Iaculis St.', N'27601', 16, 8)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (16, N'6676676783', N'366 Lacinia Avenue', N'72201', 17, 9)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (17, N'6676676784', N'2546 Sociosqu Rd.', N'80202', 18, 10)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (18, N'6676676785', N'313 Pellentesque Ave', N'19901', 19, 22)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (19, N'6676676786', N'3476 Aliquet. Ave', N'32301', 20, 23)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (30, N'6676676787', N'3472 Ullamcorper Street', N'30303', 21, 24)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (31, N'6676676788', N'336 Ullamcorper. Street', N'40601', 22, 25)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (32, N'6676676789', N'574-8633 Arcu Street', N'70802', 23, 26)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (33, N'6676676790', N'291 Proin Road', N'04330', 24, 4)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (34, N'6676676791', N'Ap #643-7006 Risus St.', N'21401', 25, 5)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (35, N'6676676792', N'737-2580 At Street', N'17101', 26, 6)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (36, N'6676676793', N'1011 Malesuada Road', N'02903', 27, 7)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (37, N'6676676794', N'969-1762 Tincidunt Rd.', N'57501', 28, 8)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (38, N'6676676795', N'6818 Eget St.', N'37219', 29, 9)
INSERT [dbo].[OfficeLocation] ([OfficeId], [PhoneNo], [AddressFirstLine], [ZipCode], [DrugStoreId], [NoOfRooms]) VALUES (39, N'6676676796', N'987-4223 Urna St.', N'73102', 30, 10)
SET IDENTITY_INSERT [dbo].[OfficeLocation] OFF
GO
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (2, N'Allegra', N'Allergies')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (2, N'Ibuprofen', N'Cold')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (2, N'Prozac', N'Anti depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (4, N'Allegra', N'Allergies')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (6, N'Zoloft', N'Anti depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (7, N'Lexapro', N'Anxiety medication')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (8, N'Lexapro', N'Anxiety medication')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (9, N'Loratadine', N'Allergy')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (10, N'Ibuprofen', N'Common Cold')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (10, N'Zoloft', N'Anti Depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (11, N'Lexapro', N'Anxiety medication')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (12, N'Cetirizine', N'Cold')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (12, N'Zoloft', N'Anti Depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (14, N'Zoloft', N'Anti depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (17, N'Cetirizine', N'Cold')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (17, N'Zoloft', N'Anti Depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (18, N'Prozac', N'Anti Depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (23, N'Allegra', N'Allergies')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (23, N'Prozac', N'Anti Depressant')
INSERT [dbo].[OtherMedications] ([PatientId], [Medicine], [Purpose]) VALUES (24, N'Calcimax', N'Calcium Deficiency')
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (1, 1, N'Mark', N'Smith', N'6676696969', N'msmith@gmail.com', CAST(N'2005-09-29' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (2, 2, N'Anthony', N'Rodriguez', N'6676696970', N'arod@gmail.com', CAST(N'1996-09-30' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (3, 1, N'Donald', N'Brown', N'6676696971', N'dbrown@gmail.com', CAST(N'1993-10-01' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (4, 2, N'Steve', N'Davis', N'6676696972', N'daviss@gmail.com', CAST(N'1998-10-02' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (5, 3, N'Andrew', N'Wilson', N'6676696973', N'andywil@gmail.com', CAST(N'1989-10-03' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (6, 4, N'Joshua', N'Thomas', N'6676696974', N'josht@gmail.com', CAST(N'1995-10-04' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (7, 1, N'George', N'Taylor', N'6676696975', N'georgetay@gmail.com', CAST(N'2007-10-05' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (8, 5, N'Edward', N'Lee', N'6676696976', N'lee.ed@gmail.com', CAST(N'1996-10-06' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (9, 1, N'Jason', N'Thompson', N'6676696977', N'jason.thompson@gmail.com', CAST(N'1986-10-07' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (10, 2, N'Ryan', N'White', N'6676696978', N'ryanwhite@gmail.com', CAST(N'1979-10-08' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (11, 5, N'Jacob', N'Scott', N'6676696979', N'jscott@gmail.com', CAST(N'2009-10-09' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (12, 4, N'Gary', N'Nguyen', N'6676696980', N'nguyern.gary@gmail.com', CAST(N'1976-10-10' AS Date), N'Male      ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (13, 6, N'Mary', N'Baker', N'6676696981', N'baker.m@gmail.com', CAST(N'1986-10-11' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (14, 2, N'Susan', N'Hall', N'6676696982', N'susanhall@gmail.com', CAST(N'1983-10-12' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (15, 2, N'Lisa', N'Campbell', N'6676696983', N'lisa.c@gmail.com', CAST(N'2007-10-13' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (16, 1, N'Ashley', N'Turner', N'6676696984', N'turner.ash@gmail.com', CAST(N'1997-10-14' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (17, 3, N'Laura', N'Parker', N'6676696985', N'laurapark@gmail.com', CAST(N'1988-10-15' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (18, 2, N'Amy', N'Collins', N'6676696986', N'collins.amy@gmail.com', CAST(N'1978-10-16' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (19, 3, N'Shirley', N'Stewart', N'6676696987', N'shirley.s@gmail.com', CAST(N'1977-10-17' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (20, 3, N'Debra', N'Cooper', N'6676696988', N'debra.coop@gmail.com', CAST(N'1970-10-18' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (21, 2, N'Leighton', N'Sanders', N'6676696989', N'leightons@gmail.com', CAST(N'1990-10-19' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (22, 2, N'Diane', N'Long', N'6676696990', N'dianelong@gmail.com', CAST(N'1992-10-20' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (23, 1, N'Bella', N'Patel', N'6676696991', N'patel.bella@gmail.com', CAST(N'2007-10-21' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (24, 1, N'Olivia', N'Foster', N'6676696992', N'oliviaf98@gmail.com', CAST(N'1999-10-22' AS Date), N'Female    ')
INSERT [dbo].[Patient] ([PatientId], [PrimaryDentistId], [FirstName], [LastName], [PhoneNo], [Email], [DOB], [Gender]) VALUES (25, 5, N'Whitney', N'Soprano', N'6676696993', N'soprano.whit@gmail.com', CAST(N'2000-10-23' AS Date), N'Female    ')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (1, N'10900 Wilshire Blvd', N'02115', N'Sarah ', N'Marshall', N'889891301')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (2, N'14 Vine St', N'36104', N'Blair', N'Waldorf', N'889891302')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (3, N'815 Woodland St', N'99801', N'Serena', N'Van der Woodsen', N'889891303')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (4, N'33 Lakeshore Drive', N'85001', N'Nate', N'Archibald', N'889891304')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (6, N'3 Chapel St', N'95814', N'Daniel', N'Humphrey', N'889891306')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (7, N'933 Amerige Lane', N'29217', N'Gregory', N'Hirsch', N'889891307')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (8, N'60 W Surrey Isl.', N'06103', N'Tom', N'Wambsgams', N'889891308')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (5, N'93 Garden Dr.', N'78701', N'Charles', N'Bass', N'889891305')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (9, N'66 Vernon St', N'65101', N'Nicholas', N'Murray', N'889891309')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (10, N'8 W. Sugar St', N'59623', N'Monica', N'Scott', N'889891310')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (11, N'76 Greystone Court', N'68502', N'Rachel', N'Nguyen', N'889891311')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (12, N'8 Bedford Ave', N'96813', N'Thomas', N'Baker', N'889891312')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (13, N'14 Gartner Ave', N'08608', N'Kimberly', N'Hall', N'889891313')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (14, N'31 Ivy Cir', N'87501', N'Ashlee', N'Campbell', N'889891314')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (15, N'22 Maple Grove Rd', N'12207', N'Ron', N'Turner', N'889891315')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (16, N'1176 Olive Ave', N'27601', N'Camilla', N'Parker', N'889891316')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (17, N'12 Alder St', N'72201', N'Phil', N'Collins', N'889891317')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (18, N'1 Cheyenne St', N'80202', N'Robert', N'Stewart', N'889891318')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (19, N'44 Greyback Dr', N'19901', N'Nick', N'Cooper', N'889891319')
INSERT [dbo].[PatientInfo] ([PatientId], [AddressFirstLine], [ZipCode], [EmergencyFirstName], [EmergencyLastName], [EmergencyPhoneNo]) VALUES (20, N'77 Alder St', N'32301', N'Jake', N'Sanders', N'889891320')
GO
SET IDENTITY_INSERT [dbo].[Prescriptions] ON 

INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (1, 2, 1)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (2, 5, 8)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (3, 8, 6)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (4, 15, 8)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (5, 1, 5)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (6, 10, 2)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (7, 14, 9)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (8, 9, 6)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (9, 16, 1)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (10, 3, 9)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (11, 11, 7)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (13, 6, 10)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (14, 21, 10)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (15, 4, 7)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (16, 12, 5)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (17, 20, 11)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (18, 19, 4)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (19, 13, 12)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (20, 7, 7)
INSERT [dbo].[Prescriptions] ([PrescriptionId], [AppointmentId], [DrugId]) VALUES (21, 22, 3)
SET IDENTITY_INSERT [dbo].[Prescriptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Procedures] ON 

INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (1, 1, 2, N'Root canal treatment', N'Requires more work next week', 2)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (2, 5, 3, N'Dental cavity filling', N'Second appointment is needed', 1)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (3, 2, 4, N'Tooth extraction', N'X-ray is needed for first appointment', 11)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (4, 4, 7, N'Dental crown procedure', N'Requires more work next week', 10)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (5, 3, 6, N'Dental implants', N'Final appointment is needed ', 6)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (6, 7, 15, N'Braces', N'Requires next appointment', 1)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (8, 10, 19, N'Root canal treatment', N'X-ray is needed for first appointment', 12)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (9, 8, 20, N'Dental implants', N'Requires next appointment', 15)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (10, 11, 15, N'Dental cavity filling', N'Requires next appointment', 4)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (11, 15, 16, N'Root canal treatment', N'Requires more work next week', 5)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (12, 18, 9, N'Dental crown procedure', N'X-ray is needed for first appointment', 19)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (13, 12, 19, N'Dental implants', N'Final appointment is needed ', 17)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (14, 19, 10, N'Braces', N'Requires next appointment', 5)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (15, 13, 1, N'Dental cavity filling', N'Requires more work next week', 1)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (16, 6, 5, N'Dental cavity filling', N'Requires next appointment', 5)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (17, 21, 1, N'Root canal treatment', N'X-ray is needed for first appointment', 9)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (18, 23, 13, N'Dental crown procedure', N'Final appointment is needed ', 15)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (19, 24, 11, N'Dental implants', N'X-ray is needed for first appointment', 2)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (20, 14, 12, N'Braces', N'Requires next appointment', 12)
INSERT [dbo].[Procedures] ([ProcedureId], [PatientId], [AppointmentId], [ProcedurePerformed], [ProcedureComments], [ToothAssociated]) VALUES (21, 9, 21, N'Dental cavity filling', N'Requires more work next week', 5)
SET IDENTITY_INSERT [dbo].[Procedures] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (1, 1, 1)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (2, 1, 5)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (3, 2, 6)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (4, 2, 7)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (5, 3, 8)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (6, 3, 12)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (7, 1, 14)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (8, 2, 19)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (9, 3, 3)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (10, 4, 8)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (11, 4, 12)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (12, 1, 11)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (13, 1, 1)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (14, 2, 14)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (15, 2, 15)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (16, 3, 3)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (17, 4, 13)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (18, 3, 16)
INSERT [dbo].[Rooms] ([RoomId], [RoomTypeId], [OfficeId]) VALUES (19, 3, 19)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([RoomTypeId], [RoomName]) VALUES (1, N'General')
INSERT [dbo].[RoomTypes] ([RoomTypeId], [RoomName]) VALUES (2, N'Hygienist')
INSERT [dbo].[RoomTypes] ([RoomTypeId], [RoomName]) VALUES (3, N'Endodontic')
INSERT [dbo].[RoomTypes] ([RoomTypeId], [RoomName]) VALUES (4, N'Orthodontic')
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
/****** Object:  Index [UC_PatientIDCompanion]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[CompanionInfo] ADD  CONSTRAINT [UC_PatientIDCompanion] UNIQUE NONCLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_PatientIDConsent]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[Consent] ADD  CONSTRAINT [UC_PatientIDConsent] UNIQUE NONCLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_PatientIDDenHis]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[DentalHistory] ADD  CONSTRAINT [UC_PatientIDDenHis] UNIQUE NONCLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__E545E31A7F01E6B9]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[NPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_PatientIDMedHis]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[MedicalHistory] ADD  CONSTRAINT [UC_PatientIDMedHis] UNIQUE NONCLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_PatientID]    Script Date: 15-12-2021 18:20:38 ******/
ALTER TABLE [dbo].[PatientInfo] ADD  CONSTRAINT [UC_PatientID] UNIQUE NONCLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Allergies] ADD  DEFAULT (getdate()) FOR [CheckinDate]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ((1)) FOR [isCancelled]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [isWorking]
GO
ALTER TABLE [dbo].[Allergies]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([OfficeId])
REFERENCES [dbo].[OfficeLocation] ([OfficeId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[CompanionInfo]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Consent]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[DentalHistory]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[DentalRecords]  WITH CHECK ADD FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[DentalRecords]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[DrugStore]  WITH CHECK ADD FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drug] ([DrugId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([EmployeeTypeId])
REFERENCES [dbo].[EmployeeTypes] ([EmployeeTypeId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([ZipCode])
REFERENCES [dbo].[MasterZipCodes] ([ZipCode])
GO
ALTER TABLE [dbo].[EmployeeSpecializations]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[InsuranceInfo]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[MedicalHistory]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[OfficeLocation]  WITH CHECK ADD FOREIGN KEY([DrugStoreId])
REFERENCES [dbo].[DrugStore] ([DrugStoreId])
GO
ALTER TABLE [dbo].[OfficeLocation]  WITH CHECK ADD FOREIGN KEY([ZipCode])
REFERENCES [dbo].[MasterZipCodes] ([ZipCode])
GO
ALTER TABLE [dbo].[OtherMedications]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([PrimaryDentistId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[PatientInfo]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[PatientInfo]  WITH CHECK ADD FOREIGN KEY([ZipCode])
REFERENCES [dbo].[MasterZipCodes] ([ZipCode])
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drug] ([DrugId])
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([AppointmentId])
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([OfficeId])
REFERENCES [dbo].[OfficeLocation] ([OfficeId])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [CHK_ApptTypeName] CHECK  (([AppointmentTypeName]='Emergency' OR [AppointmentTypeName]='General' OR [AppointmentTypeName]='Follow-up' OR [AppointmentTypeName]='Routine'))
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [CHK_ApptTypeName]
GO
ALTER TABLE [dbo].[EmployeeTypes]  WITH CHECK ADD  CONSTRAINT [CHK_EmplType] CHECK  (([Job_Title]='Dentist' OR [Job_Title]='Hygienist'))
GO
ALTER TABLE [dbo].[EmployeeTypes] CHECK CONSTRAINT [CHK_EmplType]
GO
ALTER TABLE [dbo].[RoomTypes]  WITH CHECK ADD  CONSTRAINT [CHK_RoomName] CHECK  (([RoomName]='General' OR [RoomName]='Hygienist' OR [RoomName]='Endodontic' OR [RoomName]='Orthodontic'))
GO
ALTER TABLE [dbo].[RoomTypes] CHECK CONSTRAINT [CHK_RoomName]
GO
USE [master]
GO
ALTER DATABASE [MindYourOwnMolars] SET  READ_WRITE 
GO
