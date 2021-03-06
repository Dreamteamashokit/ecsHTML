USE [master]
GO
/****** Object:  Database [ESHomeCareDB.IND]    Script Date: 01-04-2022 17:59:38 ******/
CREATE DATABASE [ESHomeCareDB.IND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESHomeCareDB.IND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ESHomeCareDB.IND.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ESHomeCareDB.IND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ESHomeCareDB.IND_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESHomeCareDB.IND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET RECOVERY FULL 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  MULTI_USER 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ESHomeCareDB.IND]
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[AddressType] [int] NOT NULL,
	[Owner] [varchar](50) NULL,
	[FlatNo] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[Reason] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Notes] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAvailabilityMaster]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAvailabilityMaster](
	[AvailabilityId] [int] IDENTITY(1,1) NOT NULL,
	[AvailabilityName] [varchar](max) NULL,
 CONSTRAINT [PK_tblAvailabilityMaster] PRIMARY KEY CLUSTERED 
(
	[AvailabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCases]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCases](
	[CaseId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[ReprtedDate] [datetime] NOT NULL,
	[AssignedOn] [datetime] NOT NULL,
	[ClientId] [int] NULL,
	[CaseType] [varchar](50) NULL,
	[Result] [varchar](max) NULL,
	[DeclineReason] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[HoursPerShift] [int] NULL,
	[DaysPerWeek] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblCases] PRIMARY KEY CLUSTERED 
(
	[CaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClient](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[BillTo] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[Ethnicity] [tinyint] NULL,
	[Gender] [tinyint] NULL,
	[Coordinator] [int] NOT NULL,
	[Nurse] [int] NULL,
	[MaritalStatus] [tinyint] NULL,
	[OfChild] [tinyint] NULL,
	[SSN] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[AltId] [varchar](10) NULL,
	[ID2] [varchar](10) NULL,
	[ID3] [varchar](10) NULL,
	[InsuranceID] [varchar](100) NULL,
	[WorkerName] [varchar](50) NULL,
	[WorkerContact] [varchar](50) NULL,
	[ReferredBy] [varchar](50) NULL,
	[IsHourly] [bit] NOT NULL,
	[TimeSlip] [bit] NOT NULL,
	[PriorityCode] [tinyint] NULL,
	[ClientStatus] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblClient] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompliance]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompliance](
	[ComplianceId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[CompletedOn] [datetime] NOT NULL,
	[Category] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Result] [varchar](max) NULL,
	[Nurse] [int] NULL,
	[Notes] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblCompliance] PRIMARY KEY CLUSTERED 
(
	[ComplianceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[Code] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InternetCode] [nvarchar](3) NOT NULL,
	[NumericCode] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpClientMeeting]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpClientMeeting](
	[MeetingId] [bigint] NOT NULL,
	[EmpId] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpClientMeeting_1] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC,
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclinedCase]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDeclinedCase](
	[DeclinedCaseId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportedDate] [date] NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[CaseId] [bigint] NOT NULL,
	[DeclinedReason] [varchar](max) NOT NULL,
	[AssignmentStartDate] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeclinedCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDocument]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDocument](
	[Documentid] [bigint] IDENTITY(1,1) NOT NULL,
	[FolderId] [bigint] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[FilePath] [varchar](100) NULL,
	[Title] [varchar](50) NOT NULL,
	[SeachTag] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreateOn] [bigint] NOT NULL,
 CONSTRAINT [PK_tblEmpDocument] PRIMARY KEY CLUSTERED 
(
	[Documentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpKey] [varchar](50) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[EmpType] [tinyint] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CellPhone] [varchar](50) NOT NULL,
	[DateOfHire] [datetime] NOT NULL,
	[HomePhone] [varchar](50) NULL,
	[DateOfFirstCase] [datetime] NULL,
	[Gender] [varchar](50) NULL,
	[HRSupervisor] [int] NULL,
	[Enthnicity] [tinyint] NULL,
	[MaritalStatus] [tinyint] NULL,
	[Dependents] [tinyint] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[TaxState] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[EmgPhone] [varchar](50) NULL,
	[Municipality] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[EmpStatus] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatus]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatus](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
	[OfficeUserId] [bigint] NOT NULL,
	[Note] [varchar](250) NOT NULL,
	[OKResume] [bit] NOT NULL,
	[ReHire] [bit] NOT NULL,
	[TextCheck] [bit] NOT NULL,
	[ScreenCheck] [bit] NOT NULL,
	[EmailCheck] [bit] NOT NULL,
	[EffectiveDate] [varchar](50) NOT NULL,
	[ReturnDate] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK__tblEmpSt__C8EE2063425FBB1E] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusMaster]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatusMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusScheduling]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatusScheduling](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpType]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFolderMaster]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFolderMaster](
	[FolderId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[FolderName] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreateBy] [bigint] NOT NULL,
 CONSTRAINT [PK_tblFolderMaster] PRIMARY KEY CLUSTERED 
(
	[FolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncident]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIncident](
	[IncidentId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[IncidentDate] [varchar](50) NULL,
	[ClientId] [int] NULL,
	[IncidentDetail] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblIncident] PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblBranch] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LogIn] [datetime] NOT NULL,
	[LogOut] [datetime] NULL,
 CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaster]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaster](
	[MasterId] [int] IDENTITY(1,1) NOT NULL,
	[MasterType] [tinyint] NOT NULL,
	[ItemId] [tinyint] NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMasterType]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterType](
	[MasterITyped] [tinyint] IDENTITY(1,1) NOT NULL,
	[MasterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterType] PRIMARY KEY CLUSTERED 
(
	[MasterITyped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeeting]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeeting](
	[MeetingId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[MeetingDate] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[MeetingNote] [nvarchar](500) NULL,
	[IsStatus] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingPoint]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeetingPoint](
	[PointId] [bigint] IDENTITY(1,1) NOT NULL,
	[MeetingId] [bigint] NOT NULL,
	[MeetingPoint] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeetingPoint] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingStatus]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeetingStatus](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[MeetingId] [bigint] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeetingStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficeUserMaster]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOfficeUserMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayRate]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayRate](
	[RateId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ClientId] [bigint] NULL,
	[Description] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[Hourly] [decimal](18, 0) NULL,
	[LiveIn] [decimal](18, 0) NULL,
	[Visit] [decimal](18, 0) NULL,
	[OverHourly] [decimal](18, 0) NULL,
	[OverLiveIn] [decimal](18, 0) NULL,
	[OverVisit] [decimal](18, 0) NULL,
	[IncludedHour] [decimal](18, 0) NULL,
	[AdditionalHour] [decimal](18, 0) NULL,
	[Mileage] [decimal](18, 0) NULL,
	[TravelTime] [decimal](18, 0) NULL,
	[Gas] [decimal](18, 0) NULL,
	[Extra] [decimal](18, 0) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_tblPayRate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[CountryCode] [nvarchar](3) NOT NULL,
	[InternetCountryCode] [nvarchar](3) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NULL,
	[IsActive] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 01-04-2022 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAddress] ON 

INSERT [dbo].[tblAddress] ([AddressId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, N'Rakesh Kumar ', N'253', N'Testt', N'Bareilly', N'India', N'UP', N'243001', CAST(N'2022-03-29T04:44:28.070' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAttendance] ON 

INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, CAST(N'2022-03-15T05:04:28.000' AS DateTime), CAST(N'2022-03-15T05:04:28.000' AS DateTime), N'test', CAST(N'2022-03-29T05:05:05.003' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblAttendance] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAvailabilityMaster] ON 

INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (1, N'Will work with children')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (2, N'Will work with smokers')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (3, N'Will work with pets')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (4, N'Will work with cats')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (5, N'Will work with dogs')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (6, N'Will work alt weekends')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (7, N'Will work with Kosher kitchen')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (8, N'Experience with Hoyer Lift')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (9, N'Will work weekends only')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (10, N'Will work mornings')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (11, N'Will work live-in')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (12, N'Will work nights')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (13, N'Will work afternoons')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (14, N'Will work Light Duty')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (15, N'Has car')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (16, N'Speaks English')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (17, N'Primary Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (18, N'Second Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (19, N'Third Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (20, N'Seeking Employment')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (21, N'As of Date')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (22, N'Will work live-in on weekends')
SET IDENTITY_INSERT [dbo].[tblAvailabilityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClient] ON 

INSERT [dbo].[tblClient] ([ClientId], [BillTo], [FirstName], [MiddleName], [LastName], [Email], [Contact], [EmgContact], [Ethnicity], [Gender], [Coordinator], [Nurse], [MaritalStatus], [OfChild], [SSN], [DOB], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [ClientStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (1, NULL, N'Rakesh', N'kumar', N'Gangwar', N'rakesh@gmail.com', N'9027972157', N'9027972157', 3, 1, 4, 4, 2, 1, N'TEST10023', CAST(N'1922-01-24T18:30:00.000' AS DateTime), N'rakesh', N'rakesh1', N'rakesh2', N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, 0, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblClient] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompliance] ON 

INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, CAST(N'2022-03-15T05:06:24.000' AS DateTime), CAST(N'2022-03-09T05:06:24.000' AS DateTime), N'Test', N'Test', N'', 4, N'TestTest', CAST(N'2022-03-29T05:06:58.353' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (2, 4, CAST(N'2022-03-24T05:08:14.000' AS DateTime), CAST(N'2022-03-17T05:08:14.000' AS DateTime), N'Test', N'Test', N'Test', 4, N'TestTestTest', CAST(N'2022-03-29T05:08:30.727' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblCompliance] OFF
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ABW', N'Aruba', N'AW', N'533')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AFG', N'Afghanistan', N'AF', N'4  ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AGO', N'Angola', N'AO', N'24 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AIA', N'Anguilla', N'AI', N'660')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALA', N'Åland Islands', N'AX', N'248')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALB', N'Albania', N'AL', N'8  ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AND', N'Andorra', N'AD', N'20 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ANT', N'Netherlands Antilles', N'NT', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARE', N'United Arab Emirates', N'AE', N'784')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARG', N'Argentina', N'AR', N'32 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARM', N'Armenia', N'AM', N'51 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ASM', N'American Samoa', N'AS', N'16 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATA', N'Antarctica', N'AQ', N'10 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATF', N'French Southern Territories', N'TF', N'260')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATG', N'Antigua and Barbuda', N'AG', N'28 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUS', N'Australia', N'AU', N'36 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUT', N'Austria', N'AT', N'40 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AZE', N'Azerbaijan', N'AZ', N'31 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BDI', N'Burundi', N'BI', N'108')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEL', N'Belgium', N'BE', N'56 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEN', N'Benin', N'BJ', N'204')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BES', N'Bonaire Sint Eustatius And Saba', N'BQ', N'535')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BFA', N'Burkina Faso', N'BF', N'854')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGD', N'Bangladesh', N'BD', N'50 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGR', N'Bulgaria', N'BG', N'100')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHR', N'Bahrain', N'BH', N'48 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHS', N'Bahamas', N'BS', N'44 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BIH', N'Bosnia and Herzegovina', N'BA', N'70 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLM', N'Saint Barthélemy', N'BL', N'652')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLR', N'Belarus', N'BY', N'112')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLZ', N'Belize', N'BZ', N'84 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BMU', N'Bermuda', N'BM', N'60 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BOL', N'Bolivia, Plurinational State Of', N'BO', N'68 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRA', N'Brazil', N'BR', N'76 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRB', N'Barbados', N'BB', N'52 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRN', N'Brunei Darussalam', N'BN', N'96 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BTN', N'Bhutan', N'BT', N'64 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BVT', N'Bouvet Island', N'BV', N'74 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BWA', N'Botswana', N'BW', N'72 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAF', N'Central African Republic', N'CF', N'140')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAN', N'Canada', N'CA', N'124')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CCK', N'Cocos (Keeling) Islands', N'CC', N'166')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHE', N'Switzerland', N'CH', N'756')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHL', N'Chile', N'CL', N'152')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHN', N'China', N'CN', N'156')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CIV', N'Côte d''Ivoire', N'CI', N'384')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CMR', N'Cameroon', N'CM', N'120')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COD', N'Congo (the Democratic Republic of the)', N'CD', N'180')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COG', N'Congo', N'CG', N'178')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COK', N'Cook Islands', N'CK', N'184')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COL', N'Colombia', N'CO', N'170')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COM', N'Comoros', N'KM', N'174')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CPV', N'Cabo Verde', N'CV', N'132')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CRI', N'Costa Rica', N'CR', N'188')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUB', N'Cuba', N'CU', N'192')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUW', N'Curaçao', N'CW', N'531')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CXR', N'Christmas Island', N'CX', N'162')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYM', N'Cayman Islands', N'KY', N'136')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYP', N'Cyprus', N'CY', N'196')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CZE', N'Czech Republic', N'CZ', N'203')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DEU', N'Germany', N'DE', N'276')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DJI', N'Djibouti', N'DJ', N'262')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DMA', N'Dominica', N'DM', N'212')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DNK', N'Denmark', N'DK', N'208')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DOM', N'Dominican Republic', N'DO', N'214')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DZA', N'Algeria', N'DZ', N'12 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ECU', N'Ecuador', N'EC', N'218')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EGY', N'Egypt', N'EG', N'818')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ERI', N'Eritrea', N'ER', N'232')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESH', N'Western Sahara*', N'EH', N'732')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESP', N'Spain', N'ES', N'724')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EST', N'Estonia', N'EE', N'233')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ETH', N'Ethiopia', N'ET', N'231')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FIN', N'Finland', N'FI', N'246')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FJI', N'Fiji', N'FJ', N'242')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FLK', N'Falkland Islands', N'FK', N'238')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRA', N'France', N'FR', N'250')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRO', N'Faroe Islands', N'FO', N'234')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FSM', N'Micronesia (the Federated States of)', N'FM', N'583')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GAB', N'Gabon', N'GA', N'266')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GBR', N'United Kingdom', N'GB', N'826')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GEO', N'Georgia', N'GE', N'268')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GGY', N'Guernsey', N'GG', N'831')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GHA', N'Ghana', N'GH', N'288')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIB', N'Gibraltar', N'GI', N'292')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIN', N'Guinea', N'GN', N'324')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GLP', N'Guadeloupe', N'GP', N'312')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GMB', N'Gambia', N'GM', N'270')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNB', N'Guinea-Bissau', N'GW', N'624')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNQ', N'Equatorial Guinea', N'GQ', N'226')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRC', N'Greece', N'GR', N'300')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRD', N'Grenada', N'GD', N'308')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRL', N'Greenland', N'GL', N'304')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GTM', N'Guatemala', N'GT', N'320')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUF', N'French Guiana', N'GF', N'254')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUM', N'Guam', N'GU', N'316')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUY', N'Guyana', N'GY', N'328')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GZA', N'Gaza Strip', N'GZ', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HKG', N'Hong Kong', N'HK', N'344')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HMD', N'Heard Island and McDonald Islands', N'HM', N'334')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HND', N'Honduras', N'HN', N'340')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HRV', N'Croatia', N'HR', N'191')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HTI', N'Haiti', N'HT', N'332')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HUN', N'Hungary', N'HU', N'348')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IDN', N'Indonesia', N'ID', N'360')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IMN', N'Isle of Man', N'IM', N'833')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IND', N'India', N'IN', N'356')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IOT', N'British Indian Ocean Territory', N'IO', N'86 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRL', N'Ireland', N'IE', N'372')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRN', N'Iran (the Islamic Republic of)', N'IR', N'364')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRQ', N'Iraq', N'IQ', N'368')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISL', N'Iceland', N'IS', N'352')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISR', N'Israel', N'IL', N'376')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ITA', N'Italy', N'IT', N'380')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JAM', N'Jamaica', N'JM', N'388')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JEY', N'Jersey', N'JE', N'832')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JOR', N'Jordan', N'JO', N'400')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JPN', N'Japan', N'JP', N'392')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KAZ', N'Kazakhstan', N'KZ', N'398')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KEN', N'Kenya', N'KE', N'404')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KGZ', N'Kyrgyzstan', N'KG', N'417')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KHM', N'Cambodia', N'KH', N'116')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KIR', N'Kiribati', N'KI', N'296')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KNA', N'Saint Kitts and Nevis', N'KN', N'659')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KOR', N'Korea (the Republic of)', N'KR', N'410')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KWT', N'Kuwait', N'KW', N'414')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LAO', N'Lao People''s Democratic Republic (the)', N'LA', N'418')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBN', N'Lebanon', N'LB', N'422')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBR', N'Liberia', N'LR', N'430')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBY', N'Libya', N'LY', N'434')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LCA', N'Saint Lucia', N'LC', N'662')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LIE', N'Liechtenstein', N'LI', N'438')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LKA', N'Sri Lanka', N'LK', N'144')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LSO', N'Lesotho', N'LS', N'426')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LTU', N'Lithuania', N'LT', N'440')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LUX', N'Luxembourg', N'LU', N'442')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LVA', N'Latvia', N'LV', N'428')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAC', N'Macao', N'MO', N'446')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAF', N'Saint Martin (French part)', N'MF', N'663')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAR', N'Morocco', N'MA', N'504')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MCO', N'Monaco', N'MC', N'492')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDA', N'Moldova (the Republic of)', N'MD', N'498')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDG', N'Madagascar', N'MG', N'450')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDV', N'Maldives', N'MV', N'462')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MEX', N'Mexico', N'MX', N'484')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MHL', N'Marshall Islands', N'MH', N'584')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MKD', N'Macedonia (the former Yugoslav Republic of)', N'MK', N'807')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLI', N'Mali', N'ML', N'466')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLT', N'Malta', N'MT', N'470')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MMR', N'Myanmar', N'MM', N'104')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNE', N'Montenegro', N'ME', N'499')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNG', N'Mongolia', N'MN', N'496')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNP', N'Northern Mariana Islands', N'MP', N'580')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MOZ', N'Mozambique', N'MZ', N'508')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MRT', N'Mauritania', N'MR', N'478')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MSR', N'Montserrat', N'MS', N'500')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MTQ', N'Martinique', N'MQ', N'474')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MUS', N'Mauritius', N'MU', N'480')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MWI', N'Malawi', N'MW', N'454')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYS', N'Malaysia', N'MY', N'458')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYT', N'Mayotte', N'YT', N'175')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NAM', N'Namibia', N'NA', N'516')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NCL', N'New Caledonia', N'NC', N'540')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NER', N'Niger', N'NE', N'562')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NFK', N'Norfolk Island', N'NF', N'574')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NGA', N'Nigeria', N'NG', N'566')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIC', N'Nicaragua', N'NI', N'558')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIU', N'Niue', N'NU', N'570')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NLD', N'Netherlands', N'NL', N'528')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NOR', N'Norway', N'NO', N'578')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NPL', N'Nepal', N'NP', N'524')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NRU', N'Nauru', N'NR', N'520')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NZL', N'New Zealand', N'NZ', N'554')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'OMN', N'Oman', N'OM', N'512')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAK', N'Pakistan', N'PK', N'586')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAN', N'Panama', N'PA', N'591')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PCN', N'Pitcairn', N'PN', N'612')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PER', N'Peru', N'PE', N'604')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PHL', N'Philippines', N'PH', N'608')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PLW', N'Palau', N'PW', N'585')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PNG', N'Papua New Guinea', N'PG', N'598')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'POL', N'Poland', N'PL', N'616')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRI', N'Puerto Rico', N'PR', N'630')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRK', N'Korea (the Democratic People''s Republic of)', N'KP', N'408')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRT', N'Portugal', N'PT', N'620')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRY', N'Paraguay', N'PY', N'600')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PSE', N'Palestine, State Of', N'PS', N'275')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PYF', N'French Polynesia', N'PF', N'258')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'QAT', N'Qatar', N'QA', N'634')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'REU', N'Réunion', N'RE', N'638')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ROU', N'Romania', N'RO', N'642')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RUS', N'Russian Federation', N'RU', N'643')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RWA', N'Rwanda', N'RW', N'646')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SAU', N'Saudi Arabia', N'SA', N'682')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SDN', N'Sudan', N'SD', N'729')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SEN', N'Senegal', N'SN', N'686')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGP', N'Singapore', N'SG', N'702')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGS', N'South Georgia and the South Sandwich Islands', N'GS', N'239')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SHN', N'Saint Helena Ascension And Tristan Da Cunha', N'SH', N'654')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SJM', N'Svalbard and Jan Mayen', N'SJ', N'744')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLB', N'Solomon Islands', N'SB', N'90 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLE', N'Sierra Leone', N'SL', N'694')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLV', N'El Salvador', N'SV', N'222')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SMR', N'San Marino', N'SM', N'674')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SOM', N'Somalia', N'SO', N'706')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SPM', N'Saint Pierre and Miquelon', N'PM', N'666')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SRB', N'Serbia', N'RS', N'688')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SSD', N'South Sudan ', N'SS', N'728')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'STP', N'Sao Tome and Principe', N'ST', N'678')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SUR', N'Suriname', N'SR', N'740')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVK', N'Slovakia', N'SK', N'703')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVN', N'Slovenia', N'SI', N'705')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWE', N'Sweden', N'SE', N'752')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWZ', N'Swaziland', N'SZ', N'748')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SXM', N'Sint Maarten (Dutch part)', N'SX', N'534')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYC', N'Seychelles', N'SC', N'690')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYR', N'Syrian Arab Republic', N'SY', N'760')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCA', N'Turks and Caicos Islands', N'TC', N'796')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCD', N'Chad', N'TD', N'148')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TGO', N'Togo', N'TG', N'768')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'THA', N'Thailand', N'TH', N'764')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TJK', N'Tajikistan', N'TJ', N'762')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKL', N'Tokelau', N'TK', N'772')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKM', N'Turkmenistan', N'TM', N'795')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TLS', N'Timor-Leste', N'TL', N'626')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TON', N'Tonga', N'TO', N'776')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TTO', N'Trinidad and Tobago', N'TT', N'780')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUN', N'Tunisia', N'TN', N'788')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUR', N'Turkey', N'TR', N'792')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUV', N'Tuvalu', N'TV', N'798')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TWN', N'Taiwan (Province of China)', N'TW', N'158')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TZA', N'Tanzania, United Republic Of', N'TZ', N'834')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UGA', N'Uganda', N'UG', N'800')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UKR', N'Ukraine', N'UA', N'804')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UMI', N'United States Minor Outlying Islands', N'UM', N'581')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'URY', N'Uruguay', N'UY', N'858')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'USA', N'United States', N'US', N'840')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UZB', N'Uzbekistan', N'UZ', N'860')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VAT', N'Holy See', N'VA', N'336')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VCT', N'Saint Vincent and the Grenadines', N'VC', N'670')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VEN', N'Venezuela, Bolivarian Republic Of', N'VE', N'862')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VGB', N'Virgin Islands (British)', N'VG', N'92 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VIR', N'Virgin Islands (U.S.)', N'VI', N'850')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VNM', N'Viet Nam', N'VN', N'704')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VUT', N'Vanuatu', N'VU', N'548')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WLF', N'Wallis and Futuna', N'WF', N'876')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WSM', N'Samoa', N'WS', N'882')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YEM', N'Yemen', N'YE', N'887')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YUG', N'Yugoslavia', N'YI', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZAF', N'South Africa', N'ZA', N'710')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZMB', N'Zambia', N'ZM', N'894')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWB', N'Zambia', N'ZA', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWE', N'Zimbabwe', N'ZW', N'716')
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (1, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (2, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (3, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (4, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (5, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (6, 4)
GO
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] ON 

INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (1, CAST(N'2022-03-11' AS Date), 1, 1, N'test', CAST(N'2022-03-08' AS Date), 1, 2, N'trrtrt', CAST(N'2022-03-29T05:05:37.403' AS DateTime), 0, 4)
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpDocument] ON 

INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (1, 1, N'Invoice_UP80DB3945.pdf', NULL, N'test1', N'sadasd', N'dfgdfsgsdf', CAST(N'2022-03-29T12:48:10.730' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (2, 1, N'holy-child-public school- Oct-Dec.docx', NULL, N'test1', N'sadasd', N'dfgdfsgsdf', CAST(N'2022-03-29T12:48:29.173' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (3, 2, N'holy-child-public school- JAN-Mar.docx', NULL, N'test1', N'sadasd', N'dfgdfsgsdf', CAST(N'2022-03-29T12:49:03.343' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (4, 2, N'Invoice_UP80DB3945.pdf', NULL, N'test1', N'sadasd', N'dfgdfsgsdf', CAST(N'2022-03-29T12:49:26.610' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (5, 3, N'Invoice_UP80DB3945.pdf', NULL, N'test1', N'sadasd', N'dfgdfsgsdf', CAST(N'2022-03-29T12:49:43.677' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (6, 3, N'holy-child-public school- Oct-Dec.docx', N'', N'tttt', N'ttttt', N'rewrwer', CAST(N'2022-03-29T13:35:38.170' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [CreatedOn], [CreateOn]) VALUES (7, 3, N'ecs note pad.txt', N'', N'test', N'search', N'dcr f dtdfyt hf', CAST(N'2022-03-30T14:16:22.057' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmpId], [EmpKey], [SSN], [EmpType], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [DateOfHire], [HomePhone], [DateOfFirstCase], [Gender], [HRSupervisor], [Enthnicity], [MaritalStatus], [Dependents], [City], [Country], [TaxState], [ZipCode], [EmgContact], [EmgPhone], [Municipality], [Notes], [EmpStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (4, N'TEST10023', N'TEST10023', 1, N'Rakesh', NULL, N'Gangwar', CAST(N'2022-03-07T07:58:41.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', CAST(N'2022-03-07T18:30:00.000' AS DateTime), N'9027972157', CAST(N'2022-03-15T18:30:00.000' AS DateTime), N'1', NULL, 3, 1, 1, N'Asian', N'USA', N'US', N'243001', N'9027972157', N'9027972157', NULL, N'Test', 1, 0, CAST(N'2022-03-23T13:29:34.847' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpStatus] ON 

INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, 0, 4, N'Test', 1, 1, 1, 0, 1, N'2022-03-16T05:34:13.000Z', N'2022-03-08T05:34:13.000Z', CAST(N'2022-03-29T05:34:33.220' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (2, 4, 1, 0, 4, N'Test', 1, 1, 0, 0, 0, N'2022-03-15T06:53:39.000Z', N'2022-03-15T06:53:39.000Z', CAST(N'2022-03-29T06:55:56.273' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (3, 4, 1, 0, 4, N'test', 1, 1, 0, 0, 0, N'2022-03-16T13:35:42.000Z', N'2022-03-19T13:35:42.000Z', CAST(N'2022-03-29T13:40:00.853' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (4, 4, 6, 0, 4, N'zxczx', 1, 0, 0, 0, 0, N'2022-03-24T15:28:31.000Z', N'2022-03-26T15:28:31.000Z', CAST(N'2022-03-29T15:29:21.530' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblEmpStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpType] ON 

INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Applicant HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'HHA, PCA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Nurses Aide', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, N'RN', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFolderMaster] ON 

INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (1, 4, N'test folder', CAST(N'2022-03-29T12:39:00.493' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (2, 4, N'test navneet', CAST(N'2022-03-29T12:39:00.497' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (3, 4, N'kavin test', CAST(N'2022-03-29T12:39:00.497' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblFolderMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIncident] ON 

INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (1, 4, N'Mar 16 2022  5:04AM', 1, N'rttrt', CAST(N'2022-03-29T05:05:46.590' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblIncident] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (1, 1, CAST(N'2022-03-28T15:54:53.660' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (2, 1, CAST(N'2022-03-28T16:06:39.623' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (3, 1, CAST(N'2022-03-28T16:21:43.603' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (4, 1, CAST(N'2022-03-29T02:31:08.473' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (5, 1, CAST(N'2022-03-29T02:31:35.607' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (6, 1, CAST(N'2022-03-29T02:35:46.167' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (7, 1, CAST(N'2022-03-29T02:42:36.703' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (8, 1, CAST(N'2022-03-29T04:39:48.867' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (9, 1, CAST(N'2022-03-29T04:40:47.270' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (10, 1, CAST(N'2022-03-29T04:41:41.297' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (11, 1, CAST(N'2022-03-29T05:17:10.377' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (12, 1, CAST(N'2022-03-29T05:38:38.353' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (13, 1, CAST(N'2022-03-29T05:41:07.167' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (14, 1, CAST(N'2022-03-29T06:01:10.030' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (15, 1, CAST(N'2022-03-29T06:46:16.753' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (16, 1, CAST(N'2022-03-29T06:55:00.277' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (17, 1, CAST(N'2022-03-29T07:11:52.040' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (18, 1, CAST(N'2022-03-29T08:41:27.153' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (19, 1, CAST(N'2022-03-29T08:42:46.103' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (20, 1, CAST(N'2022-03-29T08:44:37.640' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (21, 1, CAST(N'2022-03-29T08:46:14.033' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (22, 1, CAST(N'2022-03-29T08:46:30.697' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (23, 1, CAST(N'2022-03-29T09:52:42.810' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (24, 1, CAST(N'2022-03-29T09:53:24.090' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (25, 1, CAST(N'2022-03-29T09:56:10.300' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (26, 1, CAST(N'2022-03-29T09:59:14.900' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (27, 1, CAST(N'2022-03-29T10:12:04.300' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (28, 1, CAST(N'2022-03-29T11:46:04.953' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (29, 1, CAST(N'2022-03-29T12:20:25.503' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (30, 1, CAST(N'2022-03-29T12:30:38.967' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (31, 1, CAST(N'2022-03-29T12:39:23.943' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (32, 1, CAST(N'2022-03-29T12:39:29.207' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (33, 1, CAST(N'2022-03-29T18:45:23.767' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (34, 1, CAST(N'2022-03-29T13:23:30.607' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (35, 1, CAST(N'2022-03-29T13:29:04.493' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (36, 1, CAST(N'2022-03-29T13:29:56.107' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (37, 1, CAST(N'2022-03-29T19:35:59.123' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (38, 1, CAST(N'2022-03-29T19:40:42.207' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (39, 1, CAST(N'2022-03-29T19:47:55.913' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (40, 1, CAST(N'2022-03-29T19:53:49.343' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (41, 1, CAST(N'2022-03-29T19:55:41.443' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (42, 1, CAST(N'2022-03-29T19:57:12.470' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (43, 1, CAST(N'2022-03-29T15:16:50.860' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (44, 1, CAST(N'2022-03-29T15:28:40.363' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (45, 1, CAST(N'2022-03-29T15:29:43.617' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (46, 1, CAST(N'2022-03-29T17:32:39.543' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (47, 1, CAST(N'2022-03-29T22:44:37.393' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (48, 1, CAST(N'2022-03-30T10:47:48.913' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (49, 1, CAST(N'2022-03-30T12:31:35.333' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (50, 1, CAST(N'2022-03-30T14:14:44.483' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaster] ON 

INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (1, 1, 1, N'Active', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (2, 1, 2, N'Deferred', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (3, 1, 3, N'Pending', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (4, 1, 4, N'Inactive', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (5, 2, 1, N'Single', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (6, 2, 2, N'Married', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (7, 2, 3, N'Widow', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (8, 3, 1, N'Male', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (9, 3, 2, N'Female', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (10, 3, 3, N'Other', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (11, 4, 1, N'White', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (12, 4, 2, N'Hispanic', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (13, 4, 3, N'Asian', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (14, 4, 4, N'Black', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (15, 4, 5, N'Native American', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (16, 4, 6, N'Pacific Islander', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (17, 4, 7, N'Other', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (18, 4, 8, N'I do not wish to disclose', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (19, 5, 1, N'Start-Stand By', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (20, 5, 2, N'Start-Start', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (21, 5, 3, N'Restart-Reactivate', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (22, 5, 4, N'Restart-Rehire', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (23, 5, 5, N'Leave-Disability', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (24, 5, 6, N'Leave-FML', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (25, 5, 7, N'Leave-Personal', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (26, 5, 8, N'Leave-Vacation', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (27, 5, 9, N'Leave-Workers Comp', 1)
SET IDENTITY_INSERT [dbo].[tblMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMasterType] ON 

INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (1, N'EmployeeStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (2, N'MaritalStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (3, N'Gender')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (4, N'Ethnicity')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (5, N'EmpStatusType')
SET IDENTITY_INSERT [dbo].[tblMasterType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMeeting] ON 

INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (1, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:56:00' AS Time), N'Testing', 1, 0, CAST(N'2022-03-26T16:03:50.947' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (2, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'09:09:00' AS Time), CAST(N'11:19:00' AS Time), N'hellloo', 1, 0, CAST(N'2022-03-27T11:10:31.897' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (3, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'08:10:00' AS Time), CAST(N'10:10:00' AS Time), N'gffggf', 1, 0, CAST(N'2022-03-27T11:12:57.953' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (4, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'10:15:00' AS Time), CAST(N'11:25:00' AS Time), N'dfddf', 1, 0, CAST(N'2022-03-27T11:29:10.650' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (5, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'11:30:00' AS Time), CAST(N'12:30:00' AS Time), N'fgfg', 1, 0, CAST(N'2022-03-27T11:31:08.587' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [IsStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (6, 1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'21:47:00' AS Time), CAST(N'22:52:00' AS Time), N'testt', 1, 0, CAST(N'2022-03-28T21:48:16.520' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblMeeting] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayRate] ON 

INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (1, 0, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-14' AS Date), 1, N'', N'Test', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2022-03-29T06:46:59.423' AS DateTime), 0)
INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (2, 0, CAST(N'2022-03-22' AS Date), CAST(N'2022-03-23' AS Date), 1, N'', N'kk', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-03-29T06:55:22.637' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblPayRate] OFF
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Antarctic Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Capital Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Christmas Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Cocos (Keeling) Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Coral Sea Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Heard Island and McDonald Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Jervis Bay Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'New South Wales')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Norfolk Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Northern Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Queensland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'South Australia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Tasmania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Victoria')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Western Australia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alabama')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alaska')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arizona')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arkansas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'California')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Colorado')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Connecticut')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Delaware')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Florida')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Georgia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Hawaii')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Idaho')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Illinois')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Indiana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Iowa')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kansas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kentucky')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Louisiana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maine')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maryland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Massachusetts')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Michigan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Minnesota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Mississippi')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Missouri')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Montana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nebraska')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nevada')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Hampshire')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Jersey')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Mexico')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New York')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Carolina')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Dakota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Ohio')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oklahoma')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oregon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Pennsylvania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Rhode Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Carolina')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Dakota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Tennessee')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Texas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Utah')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Vermont')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Virginia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Washington')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'West Virginia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wisconsin')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wyoming')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Auckland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'New Plymouth')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Wellington')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Nelson')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Marlborough')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Westland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Canterbury')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Otago')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Southland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Carlow')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cavan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Clare')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cork')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Donegal')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Dublin')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Galway')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kerry')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kildare')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kilkenny')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Laois')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Leitrim')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Limerick')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Longford')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Louth')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Mayo')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Meath')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Monaghan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Offaly')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Roscommon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Sligo')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary NR')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary SR')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Waterford')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Westmeath')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wexford')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wicklow')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'District of Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Alberta')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'British Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Manitoba')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'New Brunswick')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Newfoundland and Labrador')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Nova Scotia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Ontario')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Prince Edward Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Quebec')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Saskatchewan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'PRT', N'PT', N'Lisbon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Seoul')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Chungcheong')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Chungcheong')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gangwon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gyeonggi')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Gyeongsang')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Gyeongsang')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Jeolla')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Jeolla')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Jeju')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Ulsan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Angermannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Bahusia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Blechingia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalecarlia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gestricia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gotlandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Hallandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Helsingia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Herdalia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Jemtia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Lapponia Suecana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Medelpadia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Nericia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Norbothnia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Olandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Ostrogothia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Scania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Smolandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Sudermannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Uplandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Wermlandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westmannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrobothnia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrogothia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Surrey')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Cornwall')
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [UserName], [UserPassword], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'admin', N'admin', 1, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblMaster] ADD  CONSTRAINT [DF_tblMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMeeting] ADD  CONSTRAINT [DF_tblMeeting_IsDeleted1]  DEFAULT ((1)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[tblMeeting] ADD  CONSTRAINT [DF_tblMeeting_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblEmpClientMeeting]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpClientMeeting_tblEmployee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployee] ([EmpId])
GO
ALTER TABLE [dbo].[tblEmpClientMeeting] CHECK CONSTRAINT [FK_tblEmpClientMeeting_tblEmployee]
GO
ALTER TABLE [dbo].[tblEmpClientMeeting]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpClientMeeting_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblEmpClientMeeting] CHECK CONSTRAINT [FK_tblEmpClientMeeting_tblMeeting]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblEmployee] FOREIGN KEY([HRSupervisor])
REFERENCES [dbo].[tblEmployee] ([EmpId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblEmployee]
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [FK_tblLogin_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [FK_tblLogin_tblUser]
GO
ALTER TABLE [dbo].[tblMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblMaster_tblMasterType] FOREIGN KEY([MasterType])
REFERENCES [dbo].[tblMasterType] ([MasterITyped])
GO
ALTER TABLE [dbo].[tblMaster] CHECK CONSTRAINT [FK_tblMaster_tblMasterType]
GO
ALTER TABLE [dbo].[tblMeetingPoint]  WITH CHECK ADD  CONSTRAINT [FK_tblMeetingPoint_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblMeetingPoint] CHECK CONSTRAINT [FK_tblMeetingPoint_tblMeeting]
GO
ALTER TABLE [dbo].[tblMeetingStatus]  WITH CHECK ADD  CONSTRAINT [FK_tblMeetingStatus_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblMeetingStatus] CHECK CONSTRAINT [FK_tblMeetingStatus_tblMeeting]
GO
/****** Object:  StoredProcedure [dbo].[EmpProc]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpProc]

(
@flag INT=null
)
AS

BEGIN

if @flag=1
BEGIN

SELECT x.EmpId,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) EmpName,z.TypeId,z.TypeName as EmpType, 
x.CellPhone,x.SSN,x.TaxState,x.EmpKey,x.EmpStatus,
(Case When x.Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,  
(Case When x.DOB IS NOT NULL Then 1 ELSE 0 END) HasDOB,y.EmpId as ManagerId,
(ISNULL(y.FirstName,'') + ' ' +   ISNULL(y.MiddleName,'') + ' ' + ISNULL(y.LastName,'') ) Coordinator
From tblEmployee x left join tblEmployee y on x.HRSupervisor=y.EmpId
left join tblEmpType z on x.EmpType=z.TypeId
where x.IsDeleted=0;


END



END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_EMPLOYEE]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_EMPLOYEE]
(
@EMPID INT
)
AS
BEGIN

	Update tblEmployee SET IsDeleted = 1 Where EmpId = @EMPID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EmployeeInfoByID]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_GET_EmployeeInfoByID]
(
@EID INT
)
AS
BEGIN
	
	Select 
		EmpId,
		Email,
		FirstName,
		MiddleName,
		LastName,
		CellPhone,
		HomePhone,
		DateOfHire,
		DateOfFirstCase,
		DOB,
		SSN,
	
		Gender,
		City,
		Country,
	
		ZipCode,
		EmgContact,
		EmgPhone
	From tblEmployee
	Where EmpId = @EID
	;


END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EMPLOYEES]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_EMPLOYEES]
AS
BEGIN

SELECT
	EmpId,
	(ISNULL(FirstName,'') + ' ' +   ISNULL(MiddleName,'') + ' ' + ISNULL(LastName,'') ) EmpName,  
	CellPhone,
	(Case When Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,  
	(Case When DOB IS NOT NULL Then 1 ELSE 0 END) HasDOB
	
From tblEmployee
WHERE IsDeleted = 0
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_STUDENTINFO]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_STUDENTINFO]
AS
BEGIN

SELECT
	*
	FROM STUDENT S INNER JOIN COURSE C
	ON (S.CID = C.CID)
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeclinedCaseProc]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetDeclinedCaseProc]    
(    
@EmpId int = 0    
  
)    
AS    
BEGIN    
 select (cast(format(ReportedDate, 'd', 'en-US') as varchar)) as ReportedDate,DeclinedReason,    
 cast(format(AssignmentStartDate, 'd', 'en-US') as varchar) as AssignmentStartDate,Day,Week,Note,    
 (tc.FirstName+' '+tc.MiddleName+' '+tc.LastName) as Name,'' as CaseType from    
  tblEmpDeclinedCase tedc left join tblClient tc on tedc.ClientId=tc.ClientId    
  where  tedc.EmpId= @EmpId  
      
 --where empId= @EmployeeId or Clientid=@ClientID    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayRateProc]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[SP_GetPayRateProc]
(
@EmployeeId bigint = 0,
@ClientID bigint = 0
)
AS
BEGIN
	select (cast(format(EffectiveDate, 'd', 'en-US') as varchar)+'-'+CAST(format(EndDate, 'd', 'en-US') as varchar)) as EffectiveDate,(cast(Hourly as varchar)+'-'+cast(liveIn as varchar)+'-'+cast(Visit as varchar)) as Regulartime
	,(CAST(OverHourly as varchar)+'-'+CAST(OverLiveIn as varchar)+'-'+CAST(OverVisit as varchar)) as OverTime,Description from tblPayRate 
	--where empId= @EmployeeId or Clientid=@ClientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpDeclinedCaseProc]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE   PROCEDURE [dbo].[SP_SaveEmpDeclinedCaseProc]  
(  
@ReportedDate date,@ClientID bigint,@caseid bigint,@DeclinedReason varchar(max),@AssignmentStartDate date,@Day int,@Week int,
@EmpId int,  
@Note varchar(max),@CreatedOn datetime,  
@createdBy int--,@Casetype varchar(50),@Result varchar(max)  
  
)  
AS  
BEGIN  
   
   
 insert into tblEmpDeclinedCase(EmpId,ReportedDate,ClientId,CaseId,DeclinedReason,AssignmentStartDate,Day,Week,Note,  
 CreatedOn,CreatedBy)  
 values(@EmpId,@ReportedDate,@ClientID,@caseid,@DeclinedReason,@AssignmentStartDate,@Day,@Week,@Note,@CreatedOn,@createdBy)  
  
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpPayRateProc]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_SaveEmpPayRateProc]
(
@EmployeeId bigint = 0,@ClientID bigint = 0,@EffectiveDate datetime,@EndDate datetime,@Description varchar(max),
@Note varchar(max),@Hourly decimal,@LiveIn decimal,@Visit decimal,@OverHourly decimal,@OverLiveIn decimal,@OverVisit decimal,
@IncludedHour decimal,@AdditionalHour decimal,@Mileage decimal,@TravelTime decimal,@Gas decimal,@Extra decimal,@CreatedOn datetime,
@createdBy int--,@Casetype varchar(50),@Result varchar(max)

)
AS
BEGIN
	
	
	insert into tblPayRate(EmpId,EffectiveDate,EndDate,ClientId,Description,Notes,Hourly,LiveIn,Visit,
	OverHourly,OverLiveIn,OverVisit,IncludedHour,AdditionalHour,Mileage,TravelTime,Gas,Extra,CreatedOn,CreatedBy)
	values(@EmployeeId,@EffectiveDate,@EndDate,@ClientID,@Description,@Note,@Hourly,@LiveIn,@Visit,
	@OverHourly,@OverLiveIn,@OverVisit,@IncludedHour,@AdditionalHour,@Mileage,@TravelTime,@Gas,@Extra,@CreatedOn,@createdBy)



END




GO
/****** Object:  StoredProcedure [dbo].[SP_SCHEDULE_CLIENT_MEETING]    Script Date: 01-04-2022 17:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_SCHEDULE_CLIENT_MEETING]
(
@MeetingNote NVARCHAR(500),
@MeetingDate DATETIME,
@MeetingStartHrsTime INT,
@MeetingStartMinsTime INT,
@MeetingEndHrsTime INT,
@MeetingEndMinsTime INT,
@TotalMeetingHrs INT,
@TotalMeetingMins INT,
@ClientID INT,
@StartTimeType CHAR(2),
@EndTimeType CHAR(2)
)
AS
BEGIN
	
	Insert Into tblClientMeeting
	(
		MeetingNote , MeetingDate ,MeetingStartHrsTime,MeetingStartMinsTime,MeetingEndHrsTime ,MeetingEndMinsTime,TotalMeetingHrs ,
		TotalMeetingMins, ClientID,StartTimeType, EndTimeType, EnteredDate
	) 
	values
	(
	@MeetingNote, @MeetingDate, @MeetingStartHrsTime, @MeetingStartMinsTime, @MeetingEndHrsTime, @MeetingEndMinsTime, @TotalMeetingHrs,
		@TotalMeetingMins, @ClientID, @StartTimeType, @EndTimeType, GETDATE()
	);

END

GO
USE [master]
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  READ_WRITE 
GO
