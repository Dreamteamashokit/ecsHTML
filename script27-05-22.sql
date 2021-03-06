USE [master]
GO
/****** Object:  Database [ESHomeCareDB.IND]    Script Date: 27-05-2022 16:00:20 ******/
CREATE DATABASE [ESHomeCareDB.IND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESHomeCareDB.IND', FILENAME = N'D:\rdsdbdata\DATA\ESHomeCareDB.IND.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ESHomeCareDB.IND_log', FILENAME = N'D:\rdsdbdata\DATA\ESHomeCareDB.IND_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ESHomeCareDB.IND] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [ESHomeCareDB.IND] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ESHomeCareDB.IND] SET QUERY_STORE = OFF
GO
USE [ESHomeCareDB.IND]
GO
/****** Object:  User [admin]    Script Date: 27-05-2022 16:00:24 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  UserDefinedTableType [dbo].[tblProvisiontype]    Script Date: 27-05-2022 16:00:24 ******/
CREATE TYPE [dbo].[tblProvisiontype] AS TABLE(
	[ProvisionId] [int] NULL,
	[ProvisionValue] [nvarchar](50) NULL,
	[UserId] [int] NULL
)
GO
/****** Object:  Table [dbo].[tblActivityMaster]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityMaster](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityText] [varchar](100) NULL,
	[ActivityStatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AddressType] [int] NOT NULL,
	[Owner] [varchar](50) NULL,
	[FlatNo] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAvailabilityMaster]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCases]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryItemId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryItemName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClient](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BillTo] [varchar](50) NULL,
	[Nurse] [int] NULL,
	[OfChild] [tinyint] NULL,
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
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblClient] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientCompliance]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientCompliance](
	[ClientComplianceId] [int] IDENTITY(1,1) NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[CompletedOn] [datetime] NOT NULL,
	[Category] [int] NOT NULL,
	[SubCategory] [int] NULL,
	[ScreenDate] [datetime] NULL,
	[SignedDate] [datetime] NULL,
	[MDOrderFDate] [datetime] NULL,
	[MDOrderEDate] [datetime] NULL,
	[IsReceived] [bit] NULL,
	[AttachFIle] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[OfficeUserId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[IsNotifyViaText] [bit] NULL,
	[IsNotifyViaScreen] [bit] NULL,
	[IsNotifyViaEmail] [bit] NULL,
	[Notes] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblClientCompliance] PRIMARY KEY CLUSTERED 
(
	[ClientComplianceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientSatus]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientSatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[ReferralCodeId] [int] NOT NULL,
	[note] [varchar](100) NULL,
	[clientId] [int] NOT NULL,
	[OfficeUserId] [int] NOT NULL,
	[ReferaalUserID] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Createdon] [datetime] NOT NULL,
	[TextCheck] [bit] NULL,
	[ScreenCheck] [bit] NULL,
	[EmailCheck] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblClockInout]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblClockInout](
	[ClockId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ClockInTime] [datetime] NULL,
	[ClockOutTime] [datetime] NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_TblClockInout] PRIMARY KEY CLUSTERED 
(
	[ClockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommunityMaster]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommunityMaster](
	[CommunityId] [int] IDENTITY(1,1) NOT NULL,
	[CommunityName] [varchar](250) NULL,
	[CommunityAddress] [varchar](max) NULL,
	[CommunityFloor] [varchar](250) NULL,
	[County] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Notes] [varchar](500) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblCommunityMaster] PRIMARY KEY CLUSTERED 
(
	[CommunityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompliance]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContact]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactType] [tinyint] NULL,
	[ContactName] [varchar](50) NULL,
	[Relationship] [varchar](50) NULL,
	[ContactPhone] [varchar](50) NULL,
	[ContactEmail] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactLog]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactLog](
	[ContactlogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OfficeUserId] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[Reason] [varchar](150) NOT NULL,
	[CallDateTime] [datetime] NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[FollowUpDate] [datetime] NOT NULL,
	[Issue] [varchar](250) NULL,
	[ActionTaken] [varchar](500) NULL,
	[Notes] [varchar](1000) NULL,
	[IsFollowUp] [bit] NULL,
	[IsSchedule] [bit] NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblContactLog] PRIMARY KEY CLUSTERED 
(
	[ContactlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InternetCode] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiagnosis]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiagnosis](
	[DiagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DxId] [int] NULL,
	[OrderNo] [tinyint] NULL,
	[IsPrimary] [bit] NULL,
	[IsActive] [tinyint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblDiagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiagnosisMaster]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiagnosisMaster](
	[DxId] [int] IDENTITY(1,1) NOT NULL,
	[DxCodes] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblDiagnosisMaster] PRIMARY KEY CLUSTERED 
(
	[DxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpAvailbility]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpAvailbility](
	[EmpId] [int] NOT NULL,
	[AvailbilityId] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpAvailbility] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC,
	[AvailbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpClientMeeting]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclined]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDeclined](
	[DeclinedId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportedDate] [datetime] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[CaseType] [tinyint] NOT NULL,
	[Reason] [varchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[Notes] [varchar](max) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK__tblEmpDe__437174720DBC8829] PRIMARY KEY CLUSTERED 
(
	[DeclinedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclinedCase]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDocument]    Script Date: 27-05-2022 16:00:24 ******/
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
	[UserId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_tblEmpDocument] PRIMARY KEY CLUSTERED 
(
	[Documentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EmpType] [tinyint] NOT NULL,
	[DateOfHire] [datetime] NOT NULL,
	[DateOfFirstCase] [datetime] NULL,
	[Dependents] [int] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[TaxState] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Municipality] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatus]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusMaster]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusScheduling]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpType]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFolderMaster]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncident]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[LocationName] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[BillingName] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[IsBilling] [bit] NULL,
	[Description] [varchar](max) NULL,
	[TaxId] [varchar](50) NULL,
	[LegacyId] [varchar](50) NULL,
	[NPI] [varchar](50) NULL,
	[ISA06] [varchar](50) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblBranch] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaster]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMasterType]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedication]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedication](
	[MedicationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Medication] [varchar](100) NULL,
	[NDC] [varchar](100) NULL,
	[Strength] [varchar](100) NULL,
	[Dosage] [varchar](100) NULL,
	[Frequency] [tinyint] NULL,
	[Route] [varchar](100) NULL,
	[Tabs] [varchar](100) NULL,
	[Prescriber] [varchar](100) NULL,
	[Classification] [varchar](255) NULL,
	[Instructions] [varchar](255) NULL,
	[IsReminders] [bit] NOT NULL,
	[IsInstructionscheck] [bit] NOT NULL,
	[Isadministrationcheck] [bit] NOT NULL,
	[Isselfadministercheck] [bit] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK__tblClien__62EC1ADA5A17F3DD] PRIMARY KEY CLUSTERED 
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeeting]    Script Date: 27-05-2022 16:00:24 ******/
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
	[IsStatus] [tinyint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[EmpId] [int] NULL,
 CONSTRAINT [PK_tblMeeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeeting_log]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeeting_log](
	[LogId] [bigint] NOT NULL,
	[MeetingId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[ActionField] [nvarchar](100) NULL,
	[CurrentData] [nvarchar](max) NULL,
	[NewData] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NOT NULL,
	[LogLable] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblMeeting_log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingLog]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeetingLog](
	[MeetingId] [bigint] NULL,
	[Status] [tinyint] NULL,
	[ChangeBy] [int] NULL,
	[ChangeOn] [datetime] NULL,
	[Text] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingPoint]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotes]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotes](
	[NotesId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NotesTypeId] [int] NULL,
	[Notes] [varchar](max) NOT NULL,
	[OfficeUserId] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[NotifyTypeId] [tinyint] NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblNotes] PRIMARY KEY CLUSTERED 
(
	[NotesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotesType]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotesType](
	[NotesTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblNotesType] PRIMARY KEY CLUSTERED 
(
	[NotesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficeUserMaster]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOthers]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOthers](
	[OtherId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CASA3] [varchar](50) NULL,
	[ContactId] [varchar](50) NULL,
	[InsuranceGrp] [varchar](50) NULL,
	[IsMedications] [bit] NULL,
	[IsDialysis] [bit] NULL,
	[IsOxygen] [bit] NULL,
	[IsAids] [bit] NULL,
	[IsCourtOrdered] [bit] NULL,
	[FlowRate] [varchar](50) NULL,
	[ReunionLocations] [varchar](50) NULL,
	[ShelterName] [varchar](50) NULL,
	[TalCode] [varchar](50) NULL,
	[Shelter] [varchar](150) NULL,
	[Facility] [varchar](50) NULL,
	[Room] [varchar](50) NULL,
	[ServiceRequestDate] [datetime] NULL,
	[CareDate] [datetime] NULL,
	[DischargeDate] [datetime] NULL,
	[Notes] [varchar](max) NULL,
	[Allergies] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblOthers] PRIMARY KEY CLUSTERED 
(
	[OtherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayer]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayer](
	[PayerId] [int] IDENTITY(1,1) NOT NULL,
	[PayerName] [varchar](150) NOT NULL,
	[BillToName] [varchar](150) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[NPI] [varchar](50) NULL,
	[FedId] [varchar](50) NULL,
	[ETIN] [varchar](50) NULL,
	[Taxonomy] [varchar](50) NULL,
	[MedicaidId] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblPayer] PRIMARY KEY CLUSTERED 
(
	[PayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayerRate]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayerRate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[PayerId] [int] NOT NULL,
	[ServiceCode] [varchar](50) NOT NULL,
	[BillCode] [varchar](50) NOT NULL,
	[RevenueCode] [varchar](50) NULL,
	[TaxRate] [decimal](18, 4) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[Hourly] [decimal](18, 0) NULL,
	[LiveIn] [decimal](18, 0) NULL,
	[Visit] [decimal](18, 0) NULL,
	[Notes] [varchar](250) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblPayerRate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayRate]    Script Date: 27-05-2022 16:00:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProvider]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProviderType] [tinyint] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[License] [varchar](50) NULL,
	[LicenseExpires] [datetime] NULL,
	[NPINumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Address] [varchar](50) NOT NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblProvider] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProvisions]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvisions](
	[ProvisionId] [int] NOT NULL,
	[ProvisionValue] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProvisionsMaster]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvisionsMaster](
	[ProvisionId] [int] IDENTITY(1,1) NOT NULL,
	[EntityType] [tinyint] NULL,
	[ProvisionType] [nvarchar](50) NOT NULL,
	[Title] [varchar](250) NULL,
	[Description] [varchar](250) NOT NULL,
	[EmpDescription] [varchar](250) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblProvisions] PRIMARY KEY CLUSTERED 
(
	[ProvisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServiceTask]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceTask](
	[TaskSrvId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[Frequency] [tinyint] NOT NULL,
	[ServiceNote] [varchar](500) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblServiceTask] PRIMARY KEY CLUSTERED 
(
	[TaskSrvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](3) NOT NULL,
	[CountryCode] [nvarchar](3) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStates] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategoryItemId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryItemName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaskMaster]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskMaster](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskCode] [varchar](3) NOT NULL,
	[TaskName] [varchar](50) NOT NULL,
	[TaskDetail] [varchar](500) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblTaskMaster] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserKey] [varchar](50) NULL,
	[UserType] [tinyint] NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[Organization] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[SSN] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[CellPhone] [varchar](50) NULL,
	[HomePhone] [varchar](50) NULL,
	[EmgPhone] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Ethnicity] [tinyint] NULL,
	[SupervisorId] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserCommunity]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserCommunity](
	[CommunityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[MutualId] [int] NULL,
 CONSTRAINT [PK_tblUserCommunity] PRIMARY KEY CLUSTERED 
(
	[CommunityId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 27-05-2022 16:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[UserTypeId] [int] NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUserType_1] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblActivityMaster] ON 

INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (1, N'Admission', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (2, N'Start of Care', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (3, N'Change', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (4, N'Hold', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (5, N'Resume', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (6, N'Re-Admission', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (7, N'Pending', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (8, N'Deferred', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (9, N'Discharge', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (10, N'Hospital', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (11, N'Tour Scheduled', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (12, N'Assessment Scheduled', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (13, N'Declined', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (14, N'Withdrawn', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (15, N'First Contacted', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (16, N'First Billed', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (17, N'Teach and Train', 1)
SET IDENTITY_INSERT [dbo].[tblActivityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAddress] ON 

INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (1, 2, 1, N'Rakesh Kumar ', N'253', N'516 Alexander Rd,USA', N'Bareilly', N'India', N'IL', N'243001', CAST(-104.786190 AS Decimal(18, 6)), CAST(38.840280 AS Decimal(18, 6)), CAST(N'2022-05-22T09:03:12.537' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (2, 9, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-09T08:22:42.117' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (3, 4, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-12T11:43:46.823' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (4, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-12T11:43:46.820' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (5, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-12T11:43:46.913' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (6, 10, 1, N'bhashkar', N'4', N'15fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-12T11:43:54.040' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (14, 13, 1, N'Ashok', N'23', N'New Jersey', N'Asian', N'USA', N'California', N'243001', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-15T15:21:57.080' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (15, 9, 1, N'Ashok12', N'23', N'New Jersey', N'Asian', N'USA', N'California', N'243001', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-15T16:00:33.283' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (16, 15, 1, N'Ashok4554', N'23', N'New Jersey', N'White', N'USA', N'California', N'243001', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-15T16:02:26.217' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (17, 16, 1, N'ashutosh', N'20', N'united state', N'new york21', N'united state12', N'new york', N'210414', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-20T16:25:27.710' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (18, 17, 1, N'Atkins eugene', N'APT 204', N'Slack avenue apt 204 lawrence township,NJ ', N'lawrence township', N'usa', N'NJ', N'08648', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-23T03:14:58.643' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (19, 18, 1, N'Burgess, Mellenie', N'', N'4 Sutton Place', N'East Windsor', N'usa', N'NJ', N'08520', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-23T03:51:35.993' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (20, 20, 1, N'Degazon, Alexand', N'', N'27 Poillon Ct', N'Lawrenceville', N'usa', N'NJ', N'08648', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-23T04:34:40.957' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (21, 21, 1, N'Ashok', N'23', N'New Jersey', N'Asian', N'USA', N'California', N'243001', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-24T11:15:50.430' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (22, 21, 1, N'Ashok', N'23', N'New Jersey', N'Asian', N'USA', N'California', N'243001', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-24T11:15:50.567' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (23, 27, 1, N'Acosta De Osorio, Yolanda', N'3', N'516 Alexander Rd,USA', N'NJ', N'USA', N'NJ', N'08540', CAST(-81.907480 AS Decimal(18, 6)), CAST(28.809340 AS Decimal(18, 6)), CAST(N'2022-05-10T12:32:04.263' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (24, 28, 1, N'Afful, John ', N'APT2', N'173 Nebraska Av', N'Hamilton', N'USA', N'NJ', N'08619', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-27T01:54:45.520' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (25, 29, 1, N'Aime, Nirva Bien', N'', N'645 Brunswick Av', N'NJ', N'USA', N'NJ', N'08638', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-04-27T17:51:36.743' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (26, 37, 1, N'XZx', N'zXz', N'516 Alexander Rd, Princeton, NJ 08540, USA', N'ddd', N'USA', N'ddd', N'POI', CAST(-74.651220 AS Decimal(18, 6)), CAST(40.330450 AS Decimal(18, 6)), CAST(N'2022-05-08T02:08:14.477' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (31, 49, 1, NULL, N'253', N'Testt', N'Bareilly', N'USA', N'AL', N'243001', CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), CAST(N'2022-05-17T13:56:22.623' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (32, 1, 1, NULL, NULL, N'1432 Princeton Ave', N'Trenton', N'USA', N'NJ', N'08638', CAST(-74.752820 AS Decimal(18, 6)), CAST(40.239410 AS Decimal(18, 6)), CAST(N'2022-05-20T12:18:49.323' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (33, 56, 1, NULL, NULL, N'4081 Hadley Rd, Suite A', NULL, N'USA', N'NJ', NULL, CAST(-74.424670 AS Decimal(18, 6)), CAST(40.553670 AS Decimal(18, 6)), CAST(N'2022-05-20T14:13:21.623' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (34, 61, 1, NULL, NULL, N'516 Alexander Rd,USA', NULL, N'USA', N'NJ', NULL, CAST(-104.786190 AS Decimal(18, 6)), CAST(38.840280 AS Decimal(18, 6)), CAST(N'2022-05-22T08:41:57.250' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (35, 39, 1, N'Test', N'12', N'516 Alexander Rd,USA', NULL, N'USA', N'NJ', NULL, CAST(-104.786190 AS Decimal(18, 6)), CAST(38.840280 AS Decimal(18, 6)), CAST(N'2022-05-22T08:47:35.760' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [Longitude], [Latitude], [CreatedOn], [CreatedBy]) VALUES (36, 62, 1, N'chirag', N'404', N'4 Sutton Place', N'East Windsor', N'USA', N'NJ', N'08520', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), CAST(N'2022-05-23T08:47:35.760' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAttendance] ON 

INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, CAST(N'2022-03-15T05:04:28.000' AS DateTime), CAST(N'2022-03-15T05:04:28.000' AS DateTime), N'test', CAST(N'2022-03-29T05:05:05.003' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (2, 4, 1, CAST(N'2022-04-01T12:43:17.000' AS DateTime), CAST(N'2022-04-02T12:43:17.000' AS DateTime), N'fggdrfg', CAST(N'2022-04-03T12:45:07.407' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (3, 10, 3, CAST(N'2022-04-01T08:19:43.000' AS DateTime), CAST(N'2022-04-03T08:19:43.000' AS DateTime), N'dgbjhhgh', CAST(N'2022-04-09T08:20:38.107' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (4, 0, 3, CAST(N'2022-03-02T18:30:00.000' AS DateTime), CAST(N'2022-04-01T16:47:20.000' AS DateTime), N'ffythfgdgfg', CAST(N'2022-04-13T16:50:47.483' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (5, 0, 5, CAST(N'2022-04-01T15:31:52.000' AS DateTime), CAST(N'2022-04-03T15:31:52.000' AS DateTime), N'test bhashkar', CAST(N'2022-04-14T15:49:44.580' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (6, 0, 5, CAST(N'2022-04-01T01:30:04.000' AS DateTime), CAST(N'2022-04-04T01:30:04.000' AS DateTime), N'tet', CAST(N'2022-04-15T01:32:02.373' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (7, 9, 2, CAST(N'2022-04-19T11:34:34.000' AS DateTime), CAST(N'2022-04-12T11:34:34.000' AS DateTime), N'testtt', CAST(N'2022-04-15T17:05:58.207' AS DateTime), 1)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (8, 9, 6, CAST(N'2022-04-01T10:33:33.000' AS DateTime), CAST(N'2022-04-03T10:33:33.000' AS DateTime), N'gbcggcvbg', CAST(N'2022-04-16T10:38:08.120' AS DateTime), 1)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (9, 27, 2, CAST(N'2022-04-01T17:30:59.000' AS DateTime), CAST(N'2022-04-03T17:30:59.000' AS DateTime), N'', CAST(N'2022-04-27T17:52:12.527' AS DateTime), 1)
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
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (1, N'Assessment', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (2, N'Assessment Addendum', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (3, N'Authorization', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (4, N'Case Management', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (5, N'Case Monitoring Visit /CM1', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (6, N'Case Monitoring Visit /CM2', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (7, N'Client Intake', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (8, N'Client Satisfaction Survey', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (9, N'Clinical Notes', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (10, N'Forms', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (11, N'Home Visit', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (12, N'Interim Report', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (13, N'Legal Pack', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (14, N'MD Order', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (15, N'Medical Record', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (16, N'Monthly Call', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (17, N'NOD', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (18, N'Other Client Contact', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (19, N'Overtime Authorization', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (20, N'PA Amendment', 1)
INSERT [dbo].[tblCategory] ([CategoryItemId], [CategoryItemName], [IsActive]) VALUES (21, N'PA Request', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClient] ON 

INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 2, NULL, 4, 1, N'rakesh', N'rakesh1', N'rakesh2', N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 3, NULL, 4, 2, N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-06T18:40:07.697' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 5, NULL, 5, 1, NULL, NULL, NULL, N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-07T16:44:39.473' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 6, NULL, 5, 1, NULL, NULL, NULL, N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-07T16:45:02.720' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 26, NULL, 22, 2, N'345', N'123', N'4343', N'test', N'nbv', N'7777777', N'test', 1, 1, 3, 1, CAST(N'2022-04-26T16:29:51.533' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, 34, NULL, 1, 0, N'561290829', NULL, NULL, N'561290829', N'Case Manager', N'(609) 540-7413', N'Veteran Administration', 1, 1, 1, 1, CAST(N'2022-05-05T16:57:38.507' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 39, NULL, 1, 0, NULL, NULL, NULL, N'112081424901', N'Case Manager', N'(609) 802-5087', NULL, 1, 1, 1, 1, CAST(N'2022-05-10T15:23:33.270' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, 40, NULL, 1, 0, NULL, NULL, NULL, N'112005313201', N'Elizabeth', N'973-856-1434', N'	Wellcare', 1, 1, 0, 1, CAST(N'2022-05-11T01:29:17.357' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 41, NULL, 1, 1, N'137762', NULL, NULL, N'157-40-2469', N'Veteran Administration', N'	(470) 180-4537', N'Veteran Administration', 1, 1, 0, 1, CAST(N'2022-05-11T01:33:47.593' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, 42, NULL, 1, 0, N'143708', NULL, NULL, N'112081636701', N'R. Scott Dingwall', N'(844) 444- 4410', N'Horizon NJ Health', 1, 1, 0, 1, CAST(N'2022-05-11T01:37:53.167' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, 56, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, CAST(N'2022-05-18T11:41:24.577' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, 62, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, CAST(N'2022-05-23T18:10:52.900' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblClient] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClientCompliance] ON 

INSERT [dbo].[tblClientCompliance] ([ClientComplianceId], [DueDate], [CompletedOn], [Category], [SubCategory], [ScreenDate], [SignedDate], [MDOrderFDate], [MDOrderEDate], [IsReceived], [AttachFIle], [EmpId], [OfficeUserId], [ClientId], [IsNotifyViaText], [IsNotifyViaScreen], [IsNotifyViaEmail], [Notes], [Status], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, CAST(N'2022-04-12T13:19:11.000' AS DateTime), CAST(N'2022-04-14T13:19:11.000' AS DateTime), 3, 0, NULL, NULL, NULL, NULL, 0, 21, 1, 23, 16, 1, 1, 0, N'test1', N'Pending', 0, CAST(N'2022-04-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblClientCompliance] ([ClientComplianceId], [DueDate], [CompletedOn], [Category], [SubCategory], [ScreenDate], [SignedDate], [MDOrderFDate], [MDOrderEDate], [IsReceived], [AttachFIle], [EmpId], [OfficeUserId], [ClientId], [IsNotifyViaText], [IsNotifyViaScreen], [IsNotifyViaEmail], [Notes], [Status], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, CAST(N'2022-04-14T14:24:05.000' AS DateTime), CAST(N'2022-04-19T14:24:05.000' AS DateTime), 10, 2, NULL, NULL, NULL, NULL, 0, 27, 1, 22, 16, 0, 1, 1, N'jjjjlkjh', N'Pending', 1, CAST(N'2022-04-27T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblClientCompliance] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClientSatus] ON 

INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (1, 1, CAST(N'2022-04-18T04:45:00.000' AS DateTime), 2, N'test', 2, 4, 4, 0, CAST(N'2022-04-07T10:15:35.447' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (2, 12, CAST(N'2022-04-28T07:57:14.000' AS DateTime), 7, N'test11', 2, 4, 4, 0, CAST(N'2022-04-07T13:28:09.353' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (3, 1, CAST(N'2022-04-01T16:59:24.000' AS DateTime), 3, N'test', 11, 10, 10, 0, CAST(N'2022-04-12T17:07:41.990' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (4, 3, CAST(N'2022-04-01T16:47:20.000' AS DateTime), 3, N'yfvhjfv', 15, 9, 10, 0, CAST(N'2022-04-13T16:54:36.160' AS DateTime), 0, 0, 0)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (5, 1, CAST(N'2022-04-01T15:24:44.000' AS DateTime), 3, N'test1414', 15, 1, 9, 0, CAST(N'2022-04-16T15:27:43.643' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (6, 2, CAST(N'2022-04-01T16:21:55.000' AS DateTime), 5, N'test12', 16, 9, 1, 0, CAST(N'2022-04-20T16:24:21.730' AS DateTime), 1, 1, 0)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (7, 29, CAST(N'2022-05-01T17:48:47.000' AS DateTime), 46, N'', 47, 1, 1, 0, CAST(N'2022-05-12T18:13:42.097' AS DateTime), 0, 0, 0)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (8, 30, CAST(N'2022-05-18T15:27:22.000' AS DateTime), 47, N'ggg', 42, 29, 28, 0, CAST(N'2022-05-26T20:58:17.623' AS DateTime), 0, 0, 0)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (9, 31, CAST(N'2022-05-10T15:28:24.000' AS DateTime), 49, N'bgg', 42, 28, 28, 0, CAST(N'2022-05-26T22:18:22.360' AS DateTime), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[tblClientSatus] OFF
GO
SET IDENTITY_INSERT [dbo].[TblClockInout] ON 

INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (1, 10, CAST(N'2022-05-25T15:55:06.233' AS DateTime), NULL, N'test')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (2, 10, CAST(N'2022-05-25T22:59:23.590' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (3, 10, CAST(N'2022-05-25T23:01:08.957' AS DateTime), NULL, N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (4, 10, CAST(N'2022-05-25T23:05:01.667' AS DateTime), NULL, N'test notes t')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (5, 10, CAST(N'2022-05-25T23:08:34.133' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (6, 10, CAST(N'2022-05-25T23:12:14.323' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (7, 10, CAST(N'2022-05-25T23:30:26.280' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (8, 10, CAST(N'2022-05-25T23:51:02.433' AS DateTime), NULL, N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (9, 10, CAST(N'2022-05-25T23:57:07.337' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (10, 10, CAST(N'2022-05-26T00:00:34.533' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (11, 10, CAST(N'2022-05-26T00:17:17.777' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (12, 10, CAST(N'2022-05-26T00:29:52.233' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (13, 10, CAST(N'2022-05-26T00:38:57.300' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (14, 10, CAST(N'2022-05-26T01:29:28.250' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (15, 10, CAST(N'2022-05-26T01:30:18.467' AS DateTime), NULL, N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (16, 10, CAST(N'2022-05-26T01:30:50.947' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (17, 10, CAST(N'2022-05-26T01:31:21.170' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (18, 10, CAST(N'2022-05-26T01:35:08.000' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (19, 10, CAST(N'2022-05-26T01:36:12.370' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (20, 10, CAST(N'2022-05-26T02:14:17.500' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (21, 10, CAST(N'2022-05-26T02:37:26.447' AS DateTime), CAST(N'2022-05-26T02:37:53.557' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (22, 10, CAST(N'2022-05-26T02:42:38.287' AS DateTime), CAST(N'2022-05-26T02:43:04.730' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (23, 10, CAST(N'2022-05-26T02:45:01.327' AS DateTime), NULL, N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (24, 10, CAST(N'2022-05-26T02:46:07.020' AS DateTime), NULL, N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (25, 10, CAST(N'2022-05-26T02:47:43.557' AS DateTime), NULL, N'dsfgsdfgsdfgdsfg')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (26, 10, CAST(N'2022-05-26T02:49:17.353' AS DateTime), CAST(N'2022-05-26T02:49:36.337' AS DateTime), N'test notes2323')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (27, 10, CAST(N'2022-05-26T02:52:40.280' AS DateTime), CAST(N'2022-05-26T02:52:54.120' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (28, 10, CAST(N'2022-05-26T03:13:17.037' AS DateTime), CAST(N'2022-05-26T03:13:46.883' AS DateTime), N'test notes gfhfh')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (29, 10, CAST(N'2022-05-26T03:15:16.533' AS DateTime), CAST(N'2022-05-26T03:15:21.263' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (30, 10, CAST(N'2022-05-26T03:17:14.337' AS DateTime), CAST(N'2022-05-26T03:17:19.153' AS DateTime), N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (31, 10, CAST(N'2022-05-26T12:19:46.693' AS DateTime), CAST(N'2022-05-26T12:19:52.027' AS DateTime), N'test notes r')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (32, 10, CAST(N'2022-05-26T16:45:25.333' AS DateTime), CAST(N'2022-05-26T16:45:32.287' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (33, 10, CAST(N'2022-05-27T00:17:19.797' AS DateTime), CAST(N'2022-05-27T00:18:54.420' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (34, 10, CAST(N'2022-05-27T00:22:58.493' AS DateTime), CAST(N'2022-05-27T00:23:06.560' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (35, 10, CAST(N'2022-05-27T00:40:44.057' AS DateTime), CAST(N'2022-05-27T00:41:04.097' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (36, 10, CAST(N'2022-05-27T00:49:13.837' AS DateTime), CAST(N'2022-05-27T00:49:19.950' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (37, 10, CAST(N'2022-05-27T00:56:18.567' AS DateTime), CAST(N'2022-05-27T00:56:38.183' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (38, 10, CAST(N'2022-05-27T00:57:01.887' AS DateTime), CAST(N'2022-05-27T00:59:53.823' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (39, 10, CAST(N'2022-05-27T01:07:37.583' AS DateTime), CAST(N'2022-05-27T01:07:48.973' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (40, 10, CAST(N'2022-05-27T10:10:38.557' AS DateTime), NULL, N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (41, 10, CAST(N'2022-05-27T10:33:53.067' AS DateTime), NULL, N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (42, 10, CAST(N'2022-05-27T11:29:37.507' AS DateTime), CAST(N'2022-05-27T11:36:34.927' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (43, 10, CAST(N'2022-05-27T11:37:04.503' AS DateTime), CAST(N'2022-05-27T11:37:31.297' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (44, 10, CAST(N'2022-05-27T11:39:27.633' AS DateTime), CAST(N'2022-05-27T11:42:03.737' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (45, 10, CAST(N'2022-05-27T11:42:59.640' AS DateTime), CAST(N'2022-05-27T11:43:02.770' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (46, 10, CAST(N'2022-05-27T11:54:39.010' AS DateTime), CAST(N'2022-05-27T11:54:48.357' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (47, 10, CAST(N'2022-05-27T11:57:18.307' AS DateTime), CAST(N'2022-05-27T11:57:25.860' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (48, 10, CAST(N'2022-05-27T12:00:02.217' AS DateTime), CAST(N'2022-05-27T12:00:10.883' AS DateTime), N'test notes')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (49, 10, CAST(N'2022-05-27T12:03:59.837' AS DateTime), CAST(N'2022-05-27T12:04:13.000' AS DateTime), N'')
INSERT [dbo].[TblClockInout] ([ClockId], [UserId], [ClockInTime], [ClockOutTime], [Notes]) VALUES (50, 10, CAST(N'2022-05-27T12:11:50.127' AS DateTime), CAST(N'2022-05-27T12:12:36.893' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[TblClockInout] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCommunityMaster] ON 

INSERT [dbo].[tblCommunityMaster] ([CommunityId], [CommunityName], [CommunityAddress], [CommunityFloor], [County], [State], [City], [Contact], [Email], [Notes], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, N'test1', N'test2', N'test3', N'USA', N'US', N'test4', N'8989898', N'test5@g.com', N'test6', 1, 1, CAST(N'2022-04-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblCommunityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompliance] ON 

INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, CAST(N'2022-03-15T05:06:24.000' AS DateTime), CAST(N'2022-03-09T05:06:24.000' AS DateTime), N'Test', N'Test', N'', 4, N'TestTest', CAST(N'2022-03-29T05:06:58.353' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (2, 4, CAST(N'2022-03-24T05:08:14.000' AS DateTime), CAST(N'2022-03-17T05:08:14.000' AS DateTime), N'Test', N'Test', N'Test', 4, N'TestTestTest', CAST(N'2022-03-29T05:08:30.727' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (3, 10, CAST(N'2022-03-02T18:30:00.000' AS DateTime), CAST(N'2022-04-01T11:37:59.000' AS DateTime), N'test', N'123', N'pass', 7, N'jyfcytchgf', CAST(N'2022-04-08T11:52:47.877' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (4, 0, CAST(N'2022-02-28T18:30:00.000' AS DateTime), CAST(N'2022-04-01T15:18:18.000' AS DateTime), N'test', N'123', N'pass', 13, N'kfvvu', CAST(N'2022-04-14T15:24:58.433' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (5, 0, CAST(N'2022-02-28T18:30:00.000' AS DateTime), CAST(N'2022-04-01T15:18:18.000' AS DateTime), N'test 02', N'321', N'test', 13, N'v mhf', CAST(N'2022-04-14T15:30:06.317' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (6, 0, CAST(N'2022-02-28T18:30:00.000' AS DateTime), CAST(N'2022-04-01T15:18:18.000' AS DateTime), N'test 02', N'321', N'test', 13, N'v mhf', CAST(N'2022-04-14T15:30:06.497' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (7, 0, CAST(N'2022-04-03T15:31:52.000' AS DateTime), CAST(N'2022-04-05T15:31:52.000' AS DateTime), N'test 01', N'471', N'test 32', 10, N'zgddfyhtgh', CAST(N'2022-04-14T15:42:19.890' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (8, 0, CAST(N'2022-04-01T01:30:04.000' AS DateTime), CAST(N'2022-04-02T01:30:04.000' AS DateTime), N'test01', N'74', N'test321', 9, N'jfgjvgyjhb', CAST(N'2022-04-15T01:39:16.237' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (9, 9, CAST(N'2022-04-07T17:06:34.000' AS DateTime), CAST(N'2022-04-13T17:06:34.000' AS DateTime), N'test', N'test', N'test', 9, N'tessttt', CAST(N'2022-04-15T17:07:03.750' AS DateTime), 1)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (10, 9, CAST(N'2022-04-01T10:39:32.000' AS DateTime), CAST(N'2022-04-02T10:39:32.000' AS DateTime), N'fcbcgfhg', N'14', N'test', 9, N'thghchgj', CAST(N'2022-04-16T10:43:43.790' AS DateTime), 1)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (11, 28, CAST(N'2022-04-01T17:30:59.000' AS DateTime), CAST(N'2022-04-02T17:30:59.000' AS DateTime), N'test12', N'1405', N'test32', 22, N'gyfbghuih', CAST(N'2022-04-27T17:34:46.627' AS DateTime), 1)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (12, 27, CAST(N'2022-03-02T18:30:00.000' AS DateTime), CAST(N'2022-04-02T01:36:06.000' AS DateTime), N'test01', N'140', N'test78', 28, N'', CAST(N'2022-04-29T01:37:50.360' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblCompliance] OFF
GO
SET IDENTITY_INSERT [dbo].[tblContact] ON 

INSERT [dbo].[tblContact] ([ContactId], [UserId], [ContactType], [ContactName], [Relationship], [ContactPhone], [ContactEmail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (15, 15, 1, N'test123', N'brither', N'9898989898', N'test1', 1, CAST(N'2022-04-14T10:45:02.743' AS DateTime), 1)
INSERT [dbo].[tblContact] ([ContactId], [UserId], [ContactType], [ContactName], [Relationship], [ContactPhone], [ContactEmail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (16, 15, 2, N'sdfsd', N'cv', N'cv', N'teerer', 1, CAST(N'2022-04-14T10:45:07.390' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblContact] OFF
GO
SET IDENTITY_INSERT [dbo].[tblContactLog] ON 

INSERT [dbo].[tblContactLog] ([ContactlogId], [UserId], [OfficeUserId], [EmpId], [Reason], [CallDateTime], [ScheduleDate], [FollowUpDate], [Issue], [ActionTaken], [Notes], [IsFollowUp], [IsSchedule], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 15, 12, 9, N'Test Reason', CAST(N'2022-04-15T15:46:58.000' AS DateTime), CAST(N'2022-04-16T15:46:58.000' AS DateTime), CAST(N'2022-04-21T15:46:58.000' AS DateTime), N'Test Issue', N'Test Access Token', N'Test Notes', 1, 1, 1, CAST(N'2022-04-15T21:18:30.800' AS DateTime), 1)
INSERT [dbo].[tblContactLog] ([ContactlogId], [UserId], [OfficeUserId], [EmpId], [Reason], [CallDateTime], [ScheduleDate], [FollowUpDate], [Issue], [ActionTaken], [Notes], [IsFollowUp], [IsSchedule], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 14, 12, 9, N'Test Reason', CAST(N'2022-04-14T16:04:22.000' AS DateTime), CAST(N'2022-04-15T16:04:22.000' AS DateTime), CAST(N'2022-04-21T16:04:22.000' AS DateTime), N'Issue Test', N'Test Action Token', N'Test Notes', 1, 1, 1, CAST(N'2022-04-15T21:35:18.240' AS DateTime), 1)
INSERT [dbo].[tblContactLog] ([ContactlogId], [UserId], [OfficeUserId], [EmpId], [Reason], [CallDateTime], [ScheduleDate], [FollowUpDate], [Issue], [ActionTaken], [Notes], [IsFollowUp], [IsSchedule], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 15, 12, 1, N'test1', CAST(N'2022-04-16T04:17:24.000' AS DateTime), CAST(N'2022-04-17T04:17:24.000' AS DateTime), CAST(N'2022-04-21T04:17:24.000' AS DateTime), N'test2', N'test4', N'test3', 1, 1, 1, CAST(N'2022-04-16T04:18:49.583' AS DateTime), 1)
INSERT [dbo].[tblContactLog] ([ContactlogId], [UserId], [OfficeUserId], [EmpId], [Reason], [CallDateTime], [ScheduleDate], [FollowUpDate], [Issue], [ActionTaken], [Notes], [IsFollowUp], [IsSchedule], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 15, 12, 1, N'test111', CAST(N'2022-04-15T11:47:24.000' AS DateTime), CAST(N'2022-04-16T11:47:24.000' AS DateTime), CAST(N'2022-04-20T11:47:24.000' AS DateTime), N'test222', N'test444', N'test333', 1, 1, 0, CAST(N'2022-04-16T07:02:38.923' AS DateTime), 1)
INSERT [dbo].[tblContactLog] ([ContactlogId], [UserId], [OfficeUserId], [EmpId], [Reason], [CallDateTime], [ScheduleDate], [FollowUpDate], [Issue], [ActionTaken], [Notes], [IsFollowUp], [IsSchedule], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 15, 9, 1, N'teddd', CAST(N'2022-04-05T16:47:19.000' AS DateTime), CAST(N'2022-04-12T16:47:19.000' AS DateTime), CAST(N'2022-04-20T16:47:19.000' AS DateTime), N'asdsad', N'sadsa', N'asdsa', 1, 1, 1, CAST(N'2022-04-20T16:48:09.720' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblContactLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (1, N'ABW', N'Aruba', N'AW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (2, N'AFG', N'Afghanistan', N'AF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (3, N'AGO', N'Angola', N'AO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (4, N'AIA', N'Anguilla', N'AI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (5, N'ALA', N'Åland Islands', N'AX')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (6, N'ALB', N'Albania', N'AL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (7, N'AND', N'Andorra', N'AD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (8, N'ANT', N'Netherlands Antilles', N'NT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (9, N'ARE', N'United Arab Emirates', N'AE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (10, N'ARG', N'Argentina', N'AR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (11, N'ARM', N'Armenia', N'AM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (12, N'ASM', N'American Samoa', N'AS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (13, N'ATA', N'Antarctica', N'AQ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (14, N'ATF', N'French Southern Territories', N'TF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (15, N'ATG', N'Antigua and Barbuda', N'AG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (16, N'AUS', N'Australia', N'AU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (17, N'AUT', N'Austria', N'AT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (18, N'AZE', N'Azerbaijan', N'AZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (19, N'BDI', N'Burundi', N'BI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (20, N'BEL', N'Belgium', N'BE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (21, N'BEN', N'Benin', N'BJ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (22, N'BES', N'Bonaire Sint Eustatius And Saba', N'BQ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (23, N'BFA', N'Burkina Faso', N'BF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (24, N'BGD', N'Bangladesh', N'BD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (25, N'BGR', N'Bulgaria', N'BG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (26, N'BHR', N'Bahrain', N'BH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (27, N'BHS', N'Bahamas', N'BS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (28, N'BIH', N'Bosnia and Herzegovina', N'BA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (29, N'BLM', N'Saint Barthélemy', N'BL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (30, N'BLR', N'Belarus', N'BY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (31, N'BLZ', N'Belize', N'BZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (32, N'BMU', N'Bermuda', N'BM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (33, N'BOL', N'Bolivia, Plurinational State Of', N'BO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (34, N'BRA', N'Brazil', N'BR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (35, N'BRB', N'Barbados', N'BB')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (36, N'BRN', N'Brunei Darussalam', N'BN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (37, N'BTN', N'Bhutan', N'BT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (38, N'BVT', N'Bouvet Island', N'BV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (39, N'BWA', N'Botswana', N'BW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (40, N'CAF', N'Central African Republic', N'CF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (41, N'CAN', N'Canada', N'CA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (42, N'CCK', N'Cocos (Keeling) Islands', N'CC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (43, N'CHE', N'Switzerland', N'CH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (44, N'CHL', N'Chile', N'CL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (45, N'CHN', N'China', N'CN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (46, N'CIV', N'Côte d''Ivoire', N'CI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (47, N'CMR', N'Cameroon', N'CM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (48, N'COD', N'Congo (the Democratic Republic of the)', N'CD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (49, N'COG', N'Congo', N'CG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (50, N'COK', N'Cook Islands', N'CK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (51, N'COL', N'Colombia', N'CO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (52, N'COM', N'Comoros', N'KM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (53, N'CPV', N'Cabo Verde', N'CV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (54, N'CRI', N'Costa Rica', N'CR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (55, N'CUB', N'Cuba', N'CU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (56, N'CUW', N'Curaçao', N'CW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (57, N'CXR', N'Christmas Island', N'CX')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (58, N'CYM', N'Cayman Islands', N'KY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (59, N'CYP', N'Cyprus', N'CY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (60, N'CZE', N'Czech Republic', N'CZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (61, N'DEU', N'Germany', N'DE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (62, N'DJI', N'Djibouti', N'DJ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (63, N'DMA', N'Dominica', N'DM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (64, N'DNK', N'Denmark', N'DK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (65, N'DOM', N'Dominican Republic', N'DO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (66, N'DZA', N'Algeria', N'DZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (67, N'ECU', N'Ecuador', N'EC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (68, N'EGY', N'Egypt', N'EG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (69, N'ERI', N'Eritrea', N'ER')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (70, N'ESH', N'Western Sahara*', N'EH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (71, N'ESP', N'Spain', N'ES')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (72, N'EST', N'Estonia', N'EE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (73, N'ETH', N'Ethiopia', N'ET')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (74, N'FIN', N'Finland', N'FI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (75, N'FJI', N'Fiji', N'FJ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (76, N'FLK', N'Falkland Islands', N'FK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (77, N'FRA', N'France', N'FR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (78, N'FRO', N'Faroe Islands', N'FO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (79, N'FSM', N'Micronesia (the Federated States of)', N'FM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (80, N'GAB', N'Gabon', N'GA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (81, N'GBR', N'United Kingdom', N'GB')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (82, N'GEO', N'Georgia', N'GE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (83, N'GGY', N'Guernsey', N'GG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (84, N'GHA', N'Ghana', N'GH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (85, N'GIB', N'Gibraltar', N'GI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (86, N'GIN', N'Guinea', N'GN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (87, N'GLP', N'Guadeloupe', N'GP')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (88, N'GMB', N'Gambia', N'GM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (89, N'GNB', N'Guinea-Bissau', N'GW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (90, N'GNQ', N'Equatorial Guinea', N'GQ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (91, N'GRC', N'Greece', N'GR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (92, N'GRD', N'Grenada', N'GD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (93, N'GRL', N'Greenland', N'GL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (94, N'GTM', N'Guatemala', N'GT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (95, N'GUF', N'French Guiana', N'GF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (96, N'GUM', N'Guam', N'GU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (97, N'GUY', N'Guyana', N'GY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (98, N'GZA', N'Gaza Strip', N'GZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (99, N'HKG', N'Hong Kong', N'HK')
GO
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (100, N'HMD', N'Heard Island and McDonald Islands', N'HM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (101, N'HND', N'Honduras', N'HN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (102, N'HRV', N'Croatia', N'HR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (103, N'HTI', N'Haiti', N'HT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (104, N'HUN', N'Hungary', N'HU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (105, N'IDN', N'Indonesia', N'ID')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (106, N'IMN', N'Isle of Man', N'IM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (107, N'IND', N'India', N'IN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (108, N'IOT', N'British Indian Ocean Territory', N'IO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (109, N'IRL', N'Ireland', N'IE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (110, N'IRN', N'Iran (the Islamic Republic of)', N'IR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (111, N'IRQ', N'Iraq', N'IQ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (112, N'ISL', N'Iceland', N'IS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (113, N'ISR', N'Israel', N'IL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (114, N'ITA', N'Italy', N'IT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (115, N'JAM', N'Jamaica', N'JM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (116, N'JEY', N'Jersey', N'JE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (117, N'JOR', N'Jordan', N'JO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (118, N'JPN', N'Japan', N'JP')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (119, N'KAZ', N'Kazakhstan', N'KZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (120, N'KEN', N'Kenya', N'KE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (121, N'KGZ', N'Kyrgyzstan', N'KG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (122, N'KHM', N'Cambodia', N'KH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (123, N'KIR', N'Kiribati', N'KI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (124, N'KNA', N'Saint Kitts and Nevis', N'KN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (125, N'KOR', N'Korea (the Republic of)', N'KR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (126, N'KWT', N'Kuwait', N'KW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (127, N'LAO', N'Lao People''s Democratic Republic (the)', N'LA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (128, N'LBN', N'Lebanon', N'LB')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (129, N'LBR', N'Liberia', N'LR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (130, N'LBY', N'Libya', N'LY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (131, N'LCA', N'Saint Lucia', N'LC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (132, N'LIE', N'Liechtenstein', N'LI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (133, N'LKA', N'Sri Lanka', N'LK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (134, N'LSO', N'Lesotho', N'LS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (135, N'LTU', N'Lithuania', N'LT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (136, N'LUX', N'Luxembourg', N'LU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (137, N'LVA', N'Latvia', N'LV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (138, N'MAC', N'Macao', N'MO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (139, N'MAF', N'Saint Martin (French part)', N'MF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (140, N'MAR', N'Morocco', N'MA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (141, N'MCO', N'Monaco', N'MC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (142, N'MDA', N'Moldova (the Republic of)', N'MD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (143, N'MDG', N'Madagascar', N'MG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (144, N'MDV', N'Maldives', N'MV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (145, N'MEX', N'Mexico', N'MX')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (146, N'MHL', N'Marshall Islands', N'MH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (147, N'MKD', N'Macedonia (the former Yugoslav Republic of)', N'MK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (148, N'MLI', N'Mali', N'ML')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (149, N'MLT', N'Malta', N'MT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (150, N'MMR', N'Myanmar', N'MM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (151, N'MNE', N'Montenegro', N'ME')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (152, N'MNG', N'Mongolia', N'MN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (153, N'MNP', N'Northern Mariana Islands', N'MP')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (154, N'MOZ', N'Mozambique', N'MZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (155, N'MRT', N'Mauritania', N'MR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (156, N'MSR', N'Montserrat', N'MS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (157, N'MTQ', N'Martinique', N'MQ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (158, N'MUS', N'Mauritius', N'MU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (159, N'MWI', N'Malawi', N'MW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (160, N'MYS', N'Malaysia', N'MY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (161, N'MYT', N'Mayotte', N'YT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (162, N'NAM', N'Namibia', N'NA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (163, N'NCL', N'New Caledonia', N'NC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (164, N'NER', N'Niger', N'NE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (165, N'NFK', N'Norfolk Island', N'NF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (166, N'NGA', N'Nigeria', N'NG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (167, N'NIC', N'Nicaragua', N'NI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (168, N'NIU', N'Niue', N'NU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (169, N'NLD', N'Netherlands', N'NL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (170, N'NOR', N'Norway', N'NO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (171, N'NPL', N'Nepal', N'NP')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (172, N'NRU', N'Nauru', N'NR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (173, N'NZL', N'New Zealand', N'NZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (174, N'OMN', N'Oman', N'OM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (175, N'PAK', N'Pakistan', N'PK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (176, N'PAN', N'Panama', N'PA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (177, N'PCN', N'Pitcairn', N'PN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (178, N'PER', N'Peru', N'PE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (179, N'PHL', N'Philippines', N'PH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (180, N'PLW', N'Palau', N'PW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (181, N'PNG', N'Papua New Guinea', N'PG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (182, N'POL', N'Poland', N'PL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (183, N'PRI', N'Puerto Rico', N'PR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (184, N'PRK', N'Korea (the Democratic People''s Republic of)', N'KP')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (185, N'PRT', N'Portugal', N'PT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (186, N'PRY', N'Paraguay', N'PY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (187, N'PSE', N'Palestine, State Of', N'PS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (188, N'PYF', N'French Polynesia', N'PF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (189, N'QAT', N'Qatar', N'QA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (190, N'REU', N'Réunion', N'RE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (191, N'ROU', N'Romania', N'RO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (192, N'RUS', N'Russian Federation', N'RU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (193, N'RWA', N'Rwanda', N'RW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (194, N'SAU', N'Saudi Arabia', N'SA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (195, N'SDN', N'Sudan', N'SD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (196, N'SEN', N'Senegal', N'SN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (197, N'SGP', N'Singapore', N'SG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (198, N'SGS', N'South Georgia and the South Sandwich Islands', N'GS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (199, N'SHN', N'Saint Helena Ascension And Tristan Da Cunha', N'SH')
GO
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (200, N'SJM', N'Svalbard and Jan Mayen', N'SJ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (201, N'SLB', N'Solomon Islands', N'SB')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (202, N'SLE', N'Sierra Leone', N'SL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (203, N'SLV', N'El Salvador', N'SV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (204, N'SMR', N'San Marino', N'SM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (205, N'SOM', N'Somalia', N'SO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (206, N'SPM', N'Saint Pierre and Miquelon', N'PM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (207, N'SRB', N'Serbia', N'RS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (208, N'SSD', N'South Sudan ', N'SS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (209, N'STP', N'Sao Tome and Principe', N'ST')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (210, N'SUR', N'Suriname', N'SR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (211, N'SVK', N'Slovakia', N'SK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (212, N'SVN', N'Slovenia', N'SI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (213, N'SWE', N'Sweden', N'SE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (214, N'SWZ', N'Swaziland', N'SZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (215, N'SXM', N'Sint Maarten (Dutch part)', N'SX')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (216, N'SYC', N'Seychelles', N'SC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (217, N'SYR', N'Syrian Arab Republic', N'SY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (218, N'TCA', N'Turks and Caicos Islands', N'TC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (219, N'TCD', N'Chad', N'TD')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (220, N'TGO', N'Togo', N'TG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (221, N'THA', N'Thailand', N'TH')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (222, N'TJK', N'Tajikistan', N'TJ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (223, N'TKL', N'Tokelau', N'TK')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (224, N'TKM', N'Turkmenistan', N'TM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (225, N'TLS', N'Timor-Leste', N'TL')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (226, N'TON', N'Tonga', N'TO')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (227, N'TTO', N'Trinidad and Tobago', N'TT')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (228, N'TUN', N'Tunisia', N'TN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (229, N'TUR', N'Turkey', N'TR')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (230, N'TUV', N'Tuvalu', N'TV')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (231, N'TWN', N'Taiwan (Province of China)', N'TW')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (232, N'TZA', N'Tanzania, United Republic Of', N'TZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (233, N'UGA', N'Uganda', N'UG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (234, N'UKR', N'Ukraine', N'UA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (235, N'UMI', N'United States Minor Outlying Islands', N'UM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (236, N'URY', N'Uruguay', N'UY')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (237, N'USA', N'United States', N'US')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (238, N'UZB', N'Uzbekistan', N'UZ')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (239, N'VAT', N'Holy See', N'VA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (240, N'VCT', N'Saint Vincent and the Grenadines', N'VC')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (241, N'VEN', N'Venezuela, Bolivarian Republic Of', N'VE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (242, N'VGB', N'Virgin Islands (British)', N'VG')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (243, N'VIR', N'Virgin Islands (U.S.)', N'VI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (244, N'VNM', N'Viet Nam', N'VN')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (245, N'VUT', N'Vanuatu', N'VU')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (246, N'WLF', N'Wallis and Futuna', N'WF')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (247, N'WSM', N'Samoa', N'WS')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (248, N'YEM', N'Yemen', N'YE')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (249, N'YUG', N'Yugoslavia', N'YI')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (250, N'ZAF', N'South Africa', N'ZA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (251, N'ZMB', N'Zambia', N'ZM')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (252, N'ZWB', N'Zambia', N'ZA')
INSERT [dbo].[tblCountry] ([CountryId], [Code], [Name], [InternetCode]) VALUES (253, N'ZWE', N'Zimbabwe', N'ZW')
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDiagnosis] ON 

INSERT [dbo].[tblDiagnosis] ([DiagnosisId], [UserId], [DxId], [OrderNo], [IsPrimary], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, 15, 1, 0, 1, 1, 1, CAST(N'2022-04-18T14:04:25.260' AS DateTime))
INSERT [dbo].[tblDiagnosis] ([DiagnosisId], [UserId], [DxId], [OrderNo], [IsPrimary], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2, 15, 1, 1, 1, 0, 1, CAST(N'2022-04-18T14:05:02.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDiagnosis] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDiagnosisMaster] ON 

INSERT [dbo].[tblDiagnosisMaster] ([DxId], [DxCodes], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, N'f0023', N'tesrytghghhgbhg', 1, 1, CAST(N'2022-04-17T14:40:43.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDiagnosisMaster] OFF
GO
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (1, 3)
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (1, 5)
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (4, 1)
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (4, 2)
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (9, 2)
INSERT [dbo].[tblEmpAvailbility] ([EmpId], [AvailbilityId]) VALUES (13, 1)
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (1, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (2, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (3, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (4, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (5, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (6, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (7, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (8, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (9, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (10, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (12, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (15, 9)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (16, 13)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (17, 9)
GO
SET IDENTITY_INSERT [dbo].[tblEmpDeclined] ON 

INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 11, 8, 2, N'test', CAST(N'2022-04-12' AS Date), N'hkh', 1, CAST(N'2022-04-13T11:31:12.427' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, CAST(N'2022-04-21T00:00:00.000' AS DateTime), 11, 8, 2, N'test', CAST(N'2022-12-04' AS Date), N'hkhuyuuy', 0, CAST(N'2022-04-13T11:32:08.683' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, CAST(N'2022-04-20T00:00:00.000' AS DateTime), 11, 4, 1, N'test', CAST(N'2022-04-04' AS Date), N'Test', 1, CAST(N'2022-04-13T12:21:20.757' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, CAST(N'2022-04-21T12:16:58.000' AS DateTime), 11, 4, 1, N'test', CAST(N'2022-03-16' AS Date), N'Test', 1, CAST(N'2022-04-13T12:30:20.383' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, CAST(N'2022-04-01T20:54:44.000' AS DateTime), 15, 12, 1, N'test14', CAST(N'2022-04-07' AS Date), N'jbgvjhgvf', 1, CAST(N'2022-04-16T15:32:27.827' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, CAST(N'2022-04-01T21:51:55.000' AS DateTime), 16, 12, 1, N'test321', CAST(N'2022-04-04' AS Date), N'fhtfvtftfvtf', 1, CAST(N'2022-04-20T16:29:13.600' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpDeclined] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] ON 

INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (1, CAST(N'2022-03-11' AS Date), 1, 1, N'test', CAST(N'2022-03-08' AS Date), 1, 2, N'trrtrt', CAST(N'2022-03-29T05:05:37.403' AS DateTime), 0, 4)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (2, CAST(N'2022-03-29' AS Date), 1, 1, N'no', CAST(N'2022-03-08' AS Date), 3, 4, N'hfgffgg', CAST(N'2022-04-03T12:46:42.973' AS DateTime), 0, 4)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (3, CAST(N'2022-03-02' AS Date), 2, 1, N'test', CAST(N'2022-02-28' AS Date), 1, 3, N'jhhcvhfvkjb35623@', CAST(N'2022-04-08T11:56:52.933' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (4, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:50.707' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (5, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:50.883' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (6, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:51.063' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (7, CAST(N'2022-03-06' AS Date), 2, 1, N'test', CAST(N'2022-03-30' AS Date), 4, 1, N'fvcfdffgfgfgfg', CAST(N'2022-04-09T08:19:42.040' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (8, CAST(N'2022-04-01' AS Date), 3, 2, N'test21', CAST(N'2022-04-05' AS Date), 7, 2, N'test4', CAST(N'2022-04-15T01:37:42.627' AS DateTime), 0, 0)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (9, CAST(N'2022-04-20' AS Date), 3, 1, N'test', CAST(N'2022-04-13' AS Date), 3, 2, N'test', CAST(N'2022-04-15T17:07:39.513' AS DateTime), 1, 0)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (10, CAST(N'2022-04-06' AS Date), 2, 1, N'test', CAST(N'2022-04-06' AS Date), 1, 1, N'fgfgggf', CAST(N'2022-04-15T17:16:10.330' AS DateTime), 1, 0)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (11, CAST(N'2022-04-19' AS Date), 2, 1, N'test', CAST(N'2022-04-13' AS Date), 2, 3, N'test', CAST(N'2022-04-15T17:16:56.813' AS DateTime), 1, 9)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (12, CAST(N'2022-04-01' AS Date), 6, 1, N'test12', CAST(N'2022-04-07' AS Date), 3, 1, N'fghghg', CAST(N'2022-04-16T10:43:03.460' AS DateTime), 1, 9)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (13, CAST(N'2022-03-01' AS Date), 2, 1, N'test', CAST(N'2022-04-01' AS Date), 3, 1, N'', CAST(N'2022-04-27T17:33:19.490' AS DateTime), 1, 28)
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpDocument] ON 

INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (8, 20, N'Test.jpg', N'Test.jpg', N'Test', N'Test', N'Test', NULL, CAST(N'2022-04-26T17:02:01.563' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (9, 21, N'Test1.jpg', N'Test1.jpg', N'Test', N'Test', N'Test', NULL, CAST(N'2022-04-26T17:02:37.163' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (10, 27, N'Test2.jpg', N'Test2.jpg', N'Test', N'Test', N'Test', NULL, CAST(N'2022-04-26T17:02:50.320' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (11, 45, N'ecs.1may.issue.pdf', N'', N'Test', N'Test', N'', 1, CAST(N'2022-05-11T16:38:18.663' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (12, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T15:59:47.397' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (13, 45, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:00:04.593' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (14, 51, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:07:06.957' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (15, 59, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:19.377' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (16, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:21.773' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (17, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:21.923' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (18, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:22.093' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (19, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:22.310' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (20, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:24.487' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (21, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:24.700' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (22, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:30.900' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (23, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:31.473' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (24, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:31.613' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (25, 0, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:31.837' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (26, 59, N'download.txt', N'', N'', N'', N'', 1, CAST(N'2022-05-11T16:59:35.707' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (27, 59, N'download.txt', N'', N'Medical', N'Medical', N'', 1, CAST(N'2022-05-11T16:59:54.810' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (28, 56, N'Compliance Requirements.pdf', N'', N'Test', N'Test', N'', 1, CAST(N'2022-05-11T17:00:50.040' AS DateTime), 1)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (29, 56, N'Compliance Requirements.pdf', N'', N'Test', N'Test', N'', 27, CAST(N'2022-05-11T17:10:00.657' AS DateTime), 27)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (30, 60, N'file.pdf', N'', N'Medical', N'Medical', N'', 28, CAST(N'2022-05-11T17:11:32.643' AS DateTime), 28)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (31, 61, N'Compliance Requirements.pdf', N'', N'Test', N'Test', N'', 29, CAST(N'2022-05-11T17:39:02.410' AS DateTime), 29)
INSERT [dbo].[tblEmpDocument] ([Documentid], [FolderId], [FileName], [FilePath], [Title], [SeachTag], [Description], [UserId], [CreatedOn], [CreatedBy]) VALUES (32, 0, N'Compliance Requirements.pdf', N'', N'', N'', N'', 29, CAST(N'2022-05-11T17:39:03.353' AS DateTime), 29)
SET IDENTITY_INSERT [dbo].[tblEmpDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 1, 1, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, N'Test', 1, CAST(N'2022-03-23T13:29:34.847' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 4, 2, CAST(N'2022-04-20T10:23:42.000' AS DateTime), CAST(N'2022-04-14T10:23:42.000' AS DateTime), 2, N'Delhi', N'USA', N'US', N'243001', NULL, N'9027972157902797215790279721579027972157', 0, CAST(N'2022-04-07T15:58:12.543' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, 7, 1, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, NULL, 0, CAST(N'2022-04-07T22:37:44.580' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 8, 2, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, N'Test', 0, CAST(N'2022-04-07T17:22:35.137' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, 9, 2, CAST(N'2021-12-01T11:37:59.000' AS DateTime), CAST(N'2022-01-03T18:30:00.000' AS DateTime), 7, N'new york', N'USA', N'US', N'273207', NULL, N'tfghghgh', 0, CAST(N'2022-04-08T11:41:21.770' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 10, 2, CAST(N'2021-12-01T11:37:59.000' AS DateTime), CAST(N'2022-01-03T18:30:00.000' AS DateTime), 7, N'new york', N'USA', N'US', N'273207', NULL, N'tfghghgh', 0, CAST(N'2022-04-08T11:41:27.773' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, 12, 2, CAST(N'2022-03-01T18:30:00.000' AS DateTime), CAST(N'2022-04-01T13:52:50.000' AS DateTime), 10, N'new york', N'USA', N'US', N'87542', NULL, N'Nddh he bdjid jsjnsns', 0, CAST(N'2022-04-13T13:56:42.140' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, 13, 2, CAST(N'2022-03-01T18:30:00.000' AS DateTime), CAST(N'2022-04-01T13:52:50.000' AS DateTime), 10, N'California', N'USA', N'US', N'87542', NULL, N'Nddh he bdjid jsjnsns', 0, CAST(N'2022-04-13T13:57:21.653' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, 14, 2, CAST(N'2022-03-01T18:30:00.000' AS DateTime), CAST(N'2022-04-01T13:52:50.000' AS DateTime), 10, N'California', N'USA', N'US', N'87542', NULL, N'Nddh he bdjid jsjnsns', 0, CAST(N'2022-04-13T13:57:24.320' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (13, 15, 2, CAST(N'2022-03-01T18:30:00.000' AS DateTime), CAST(N'2022-04-01T13:52:50.000' AS DateTime), 10, N'California', N'USA', N'US', N'87542', NULL, N'Nddh he bdjid jsjnsns', 0, CAST(N'2022-04-13T13:57:30.460' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (14, 22, 2, CAST(N'2022-04-11T18:30:00.000' AS DateTime), CAST(N'2022-04-26T18:30:00.000' AS DateTime), 1, N'tese', N'GBR', N'GB', N'282004', NULL, NULL, 0, CAST(N'2022-04-26T10:21:47.073' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (15, 23, 2, CAST(N'2022-04-12T05:56:44.000' AS DateTime), CAST(N'2022-04-27T05:56:44.000' AS DateTime), 1, N'tesrt', N'AUS', N'AU', N'282004', NULL, N'yutyuy', 0, CAST(N'2022-04-26T11:29:23.470' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (16, 27, 1, CAST(N'2022-03-10T18:30:00.000' AS DateTime), CAST(N'2022-03-10T18:30:00.000' AS DateTime), 2, N'NJ', N'GBR', N'GB', N'	08540', NULL, NULL, 1, CAST(N'2022-04-27T01:00:54.437' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (17, 28, 1, CAST(N'2022-01-04T18:30:00.000' AS DateTime), CAST(N'2022-01-04T18:30:00.000' AS DateTime), 2, N'NJ', N'USA', N'US', N'08619', NULL, NULL, 1, CAST(N'2022-04-27T01:48:47.207' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (18, 29, 2, CAST(N'2021-08-23T18:30:00.000' AS DateTime), CAST(N'2021-08-18T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'	08638', NULL, NULL, 1, CAST(N'2022-04-27T17:49:03.000' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (19, 30, 2, CAST(N'2022-03-06T18:30:00.000' AS DateTime), CAST(N'2022-04-06T18:30:00.000' AS DateTime), 2, N'NJ', N'USA', N'US', N'08609', NULL, NULL, 1, CAST(N'2022-04-30T01:43:38.340' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (20, 31, 1, CAST(N'2022-02-21T18:30:00.000' AS DateTime), CAST(N'2022-02-21T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08629', NULL, NULL, 1, CAST(N'2022-04-30T01:57:26.743' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (23, 35, 2, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 5, N'White', N'USA', N'US', N'243001', NULL, N'hhghghhg', 0, CAST(N'2022-05-05T23:00:05.980' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (24, 36, 2, CAST(N'2022-04-03T18:30:00.000' AS DateTime), CAST(N'2022-04-03T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08618', NULL, NULL, 1, CAST(N'2022-05-05T17:52:44.363' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (25, 37, 2, CAST(N'2022-04-03T18:30:00.000' AS DateTime), CAST(N'2022-04-03T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08618', NULL, NULL, 0, CAST(N'2022-05-05T17:52:52.037' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (27, 43, 2, CAST(N'2022-03-16T18:30:00.000' AS DateTime), CAST(N'2022-03-16T18:30:00.000' AS DateTime), 0, N'NJ ', N'USA', N'US', N'08016', NULL, NULL, 1, CAST(N'2022-05-11T01:44:58.517' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (28, 44, 2, CAST(N'2014-08-14T18:30:00.000' AS DateTime), CAST(N'2014-08-14T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08618', NULL, NULL, 1, CAST(N'2022-05-11T01:54:43.487' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (29, 45, 2, CAST(N'2019-11-20T18:30:00.000' AS DateTime), CAST(N'2019-11-20T18:30:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08618', NULL, NULL, 1, CAST(N'2022-05-11T01:59:07.737' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (30, 46, 2, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'	08610', NULL, NULL, 1, CAST(N'2022-05-11T16:12:11.887' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (31, 47, 1, CAST(N'2016-04-01T00:00:00.000' AS DateTime), CAST(N'2016-04-01T00:00:00.000' AS DateTime), 0, N'NJ', N'USA', N'US', N'08638', NULL, NULL, 1, CAST(N'2022-05-11T16:16:26.010' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (33, 52, 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 0, NULL, N'', N'', NULL, NULL, NULL, 1, CAST(N'2022-05-18T10:55:23.820' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (34, 53, 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 0, NULL, N'', N'', NULL, NULL, NULL, 1, CAST(N'2022-05-18T10:55:52.627' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (35, 55, 2, CAST(N'2022-05-20T00:00:00.000' AS DateTime), NULL, 0, NULL, N'', N'', NULL, NULL, NULL, 1, CAST(N'2022-05-18T11:19:12.463' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (40, 61, 2, CAST(N'2022-05-20T00:00:00.000' AS DateTime), NULL, 6000, NULL, N'', N'', NULL, NULL, NULL, 1, CAST(N'2022-05-20T10:38:58.477' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpStatus] ON 

INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, 0, 4, N'Test', 1, 1, 1, 0, 1, N'2022-03-16T05:34:13.000Z', N'2022-03-08T05:34:13.000Z', CAST(N'2022-03-29T05:34:33.220' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (2, 4, 1, 0, 4, N'Test', 1, 1, 0, 0, 0, N'2022-03-15T06:53:39.000Z', N'2022-03-15T06:53:39.000Z', CAST(N'2022-03-29T06:55:56.273' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (3, 4, 1, 0, 4, N'test', 1, 1, 0, 0, 0, N'2022-03-16T13:35:42.000Z', N'2022-03-19T13:35:42.000Z', CAST(N'2022-03-29T13:40:00.853' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (4, 4, 6, 0, 4, N'zxczx', 1, 0, 0, 0, 0, N'2022-03-24T15:28:31.000Z', N'2022-03-26T15:28:31.000Z', CAST(N'2022-03-29T15:29:21.530' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (5, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.473' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (6, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.843' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (7, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.857' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (8, 10, 6, 0, 10, N'test321', 1, 0, 0, 0, 0, N'2022-04-01T15:30:10.000Z', N'2022-04-05T15:30:10.000Z', CAST(N'2022-04-14T15:31:37.717' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (9, 13, 4, 0, 13, N'test10', 0, 0, 0, 0, 0, N'2022-04-01T15:31:52.000Z', N'2022-04-06T15:31:52.000Z', CAST(N'2022-04-14T15:48:18.250' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (10, 9, 1, 0, 9, N'fgfgggf', 1, 1, 1, 1, 1, N'2022-04-06T11:34:34.000Z', N'2022-04-12T11:34:34.000Z', CAST(N'2022-04-15T17:05:39.173' AS DateTime), 1)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (11, 9, 1, 0, 9, N'ggyy', 1, 1, 0, 0, 0, N'2022-04-12T11:52:29.000Z', N'2022-04-12T11:52:29.000Z', CAST(N'2022-04-15T17:25:17.643' AS DateTime), 1)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (12, 1, 1, 0, 9, N'tyryrtytryt', 1, 0, 1, 0, 0, N'2022-04-01T10:33:33.000Z', N'2022-04-04T10:33:33.000Z', CAST(N'2022-04-16T10:36:16.017' AS DateTime), 1)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (13, 1, 1, 0, 9, N'tyryrtytryt', 1, 0, 1, 0, 0, N'2022-04-01T10:33:33.000Z', N'2022-04-04T10:33:33.000Z', CAST(N'2022-04-16T10:36:35.407' AS DateTime), 1)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (14, 1, 5, 0, 9, N'tyryrtytryt', 1, 1, 1, 0, 0, N'2022-04-01T10:33:33.000Z', N'2022-04-02T10:33:33.000Z', CAST(N'2022-04-16T10:37:07.687' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpType] ON 

INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Applicant HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'HHA, PCA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Nurses Aide', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, N'RN', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, N'Office', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFolderMaster] ON 

INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (4, 4, N'test nav', CAST(N'2022-04-05T21:44:57.823' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (5, 4, N'', CAST(N'2022-04-08T04:38:37.077' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (6, 4, N'', CAST(N'2022-04-08T04:38:37.097' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (7, 4, N'', CAST(N'2022-04-08T04:39:03.877' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (8, 4, N'', CAST(N'2022-04-08T04:39:04.010' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (9, 4, N'', CAST(N'2022-04-08T04:39:04.053' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (10, 10, N'ecs1', CAST(N'2022-04-08T11:55:04.773' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (11, 10, N'ecs1', CAST(N'2022-04-08T11:55:04.850' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (12, 10, N'ecs1', CAST(N'2022-04-08T11:55:08.393' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (13, 10, N'ecs1', CAST(N'2022-04-08T11:55:10.413' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (14, 9, N'', CAST(N'2022-04-15T22:11:38.197' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (15, 9, N'Test', CAST(N'2022-04-15T22:11:41.493' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (16, 9, N'Test', CAST(N'2022-04-15T22:11:45.183' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (17, 9, N'', CAST(N'2022-04-16T10:43:50.337' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (18, 9, N'', CAST(N'2022-04-16T10:43:53.820' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (19, 15, N'Test', CAST(N'2022-04-17T15:55:28.127' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (20, 16, N'asdsa', CAST(N'2022-04-20T17:50:12.450' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (21, 16, N'Clinical Notes', CAST(N'2022-04-20T17:50:27.173' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (22, 16, N'', CAST(N'2022-04-20T18:25:01.833' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (23, 16, N'', CAST(N'2022-04-21T12:15:41.793' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (24, 16, N'', CAST(N'2022-04-21T12:15:42.643' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (25, 16, N'', CAST(N'2022-04-21T12:24:46.150' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (26, 16, N'', CAST(N'2022-04-21T12:30:08.093' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (27, 16, N'absa', CAST(N'2022-04-21T17:23:36.543' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (28, 16, N'', CAST(N'2022-04-21T17:27:46.527' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (29, 16, N'', CAST(N'2022-04-21T17:27:49.703' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (30, 16, N'', CAST(N'2022-04-21T17:27:57.697' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (31, 16, N'', CAST(N'2022-04-22T15:43:01.377' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (32, 16, N'', CAST(N'2022-04-22T15:43:06.117' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (33, 16, N'', CAST(N'2022-04-22T15:43:06.997' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (34, 16, N'', CAST(N'2022-04-22T15:43:07.210' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (35, 17, N'', CAST(N'2022-04-24T15:39:08.810' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (36, 17, N'', CAST(N'2022-04-24T15:39:09.507' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (37, 27, N'', CAST(N'2022-04-27T01:16:10.457' AS DateTime), 0)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (45, 1, N'Medical', CAST(N'2022-05-11T16:37:22.823' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (46, 1, N'', CAST(N'2022-05-11T15:58:50.903' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (47, 1, N'', CAST(N'2022-05-11T15:59:23.057' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (48, 1, N'Medical', CAST(N'2022-05-11T16:03:22.590' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (49, 1, N'', CAST(N'2022-05-11T16:05:33.857' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (50, 1, N'Medi', CAST(N'2022-05-11T16:05:50.777' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (51, 1, N'Medi', CAST(N'2022-05-11T16:06:54.157' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (52, 1, N'', CAST(N'2022-05-11T16:08:22.467' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (53, 1, N'', CAST(N'2022-05-11T16:08:57.467' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (54, 1, N'', CAST(N'2022-05-11T16:19:49.920' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (55, 27, N'', CAST(N'2022-05-11T16:41:21.133' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (56, 27, N'Medical', CAST(N'2022-05-11T16:41:56.307' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (57, 28, N'', CAST(N'2022-05-11T16:57:11.067' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (58, 28, N'', CAST(N'2022-05-11T16:57:13.080' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (59, 46, N'Medical', CAST(N'2022-05-11T16:57:32.443' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (60, 28, N'Medical', CAST(N'2022-05-11T17:11:03.177' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (61, 29, N'Medical', CAST(N'2022-05-11T17:38:45.283' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (62, 1, N'', CAST(N'2022-05-18T00:06:48.760' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (63, 1, N'', CAST(N'2022-05-18T00:06:50.860' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblFolderMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIncident] ON 

INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (1, 4, N'Mar 16 2022  5:04AM', 1, N'rttrt', CAST(N'2022-03-29T05:05:46.590' AS DateTime), 0)
INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (2, 10, N'Mar  3 2022  6:30PM', 3, N'uchtdcgfyc416', CAST(N'2022-04-08T11:53:05.500' AS DateTime), 0)
INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (3, 9, N'Apr 19 2022  5:06PM', 3, N'testtt', CAST(N'2022-04-15T17:06:29.373' AS DateTime), 0)
INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (4, 9, N'Apr  1 2022 10:39AM', 3, N'gfgchgf', CAST(N'2022-04-16T10:43:16.390' AS DateTime), 0)
INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (5, 28, N'Apr  1 2022  5:30PM', 5, N'test', CAST(N'2022-04-27T17:34:13.603' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblIncident] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLocation] ON 

INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (2, 0, N'E&S Home Care Solutions', N'1 Gateway Center, Suite 2600', N'USA', N'NJ', N'Newark', N'07102', CAST(-74.169640 AS Decimal(18, 6)), CAST(40.735280 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:31:11.950' AS DateTime), 1, CAST(N'2022-04-26T12:31:11.950' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (3, 0, N'E&S Home Care Solutions', N'140 E Ridgewood Ave', N'USA', N'NJ', N'Paramus', N'07652', CAST(-74.068870 AS Decimal(18, 6)), CAST(40.964540 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:32:00.727' AS DateTime), 1, CAST(N'2022-04-26T12:32:00.727' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (4, 0, N'E&S Home Care Solutions', N'2001 Route 46, Waterview Plaza, Suite 310', N'USA', N'NJ', N'Parsippany', N'07054', CAST(-74.430220 AS Decimal(18, 6)), CAST(40.873750 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:32:57.677' AS DateTime), 1, CAST(N'2022-04-26T12:32:57.677' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (5, 0, N'E&S Home Care Solutions', N'999 Riverview Drive, 2nd Floor', N'USA', N'NJ', N'Totowa', N'07512', CAST(-74.201070 AS Decimal(18, 6)), CAST(40.904260 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:33:35.687' AS DateTime), 1, CAST(N'2022-04-26T12:33:35.687' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (6, 0, N'E&S Home Care Solutions', N'4400 Route 9 South', N'USA', N'NJ', N'Freehold', N'07728', CAST(-74.273910 AS Decimal(18, 6)), CAST(40.259700 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:34:06.030' AS DateTime), 1, CAST(N'2022-04-26T12:34:06.030' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (7, 0, N'E&S Home Care Solutions', N'3600 Route 66 Suite 150', N'USA', N'NJ', N' Neptune', N' 07753', CAST(-74.088190 AS Decimal(18, 6)), CAST(40.221290 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(888) 288-8826', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:34:38.917' AS DateTime), 1, CAST(N'2022-04-26T12:34:38.917' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (8, 0, N'E&S Home Care Solutions', N'40 Parker Rd', N'USA', N'NJ', N'Elizabeth', N' 07208', CAST(-74.216130 AS Decimal(18, 6)), CAST(40.674010 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(973) 842-2488', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:35:12.990' AS DateTime), 1, CAST(N'2022-04-26T12:35:12.990' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (9, 0, N'E&S Home Care Solutions', N'684 Whitehead Rd', N'USA', N'NJ', N'Lawrenceville', N' 08648', CAST(-74.732590 AS Decimal(18, 6)), CAST(40.252120 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(609) 225-5788', N'732-343-6878', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-26T12:35:40.177' AS DateTime), 1, CAST(N'2022-04-26T12:35:40.177' AS DateTime))
INSERT [dbo].[tblLocation] ([LocationId], [CompanyId], [LocationName], [Address], [Country], [State], [City], [ZipCode], [Longitude], [Latitude], [BillingName], [Contact], [Email], [Phone], [Fax], [IsBilling], [Description], [TaxId], [LegacyId], [NPI], [ISA06], [ModifiedBy], [ModifiedOn], [CreatedBy], [CreatedOn]) VALUES (10, 0, N'E&S Home Care Solutions', N'4081 Hadley Rd, Suite A', N'USA', N'NJ', N'South Plainfield', N'07080', CAST(-74.424670 AS Decimal(18, 6)), CAST(40.553670 AS Decimal(18, 6)), NULL, NULL, N'info@eshcs.com', N'(908) 222- 8494', N'732-343-6878', 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-11T04:54:20.883' AS DateTime), 1, CAST(N'2022-05-11T04:54:20.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (1, 1, CAST(N'2022-03-28T15:54:53.660' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (2, 1, CAST(N'2022-03-28T16:06:39.623' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (3, 1, CAST(N'2022-03-28T16:21:43.603' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (4, 1, CAST(N'2022-03-29T02:31:08.473' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (5, 1, CAST(N'2022-03-29T02:31:35.607' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (6, 1, CAST(N'2022-03-29T02:35:46.167' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (7, 1, CAST(N'2022-03-29T02:42:36.703' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (8, 1, CAST(N'2022-03-29T04:39:48.867' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (9, 1, CAST(N'2022-03-29T04:40:47.270' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (10, 1, CAST(N'2022-03-29T04:41:41.297' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (11, 1, CAST(N'2022-03-29T05:17:10.377' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (12, 1, CAST(N'2022-03-29T05:38:38.353' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (13, 1, CAST(N'2022-03-29T05:41:07.167' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (14, 1, CAST(N'2022-03-29T06:01:10.030' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (15, 1, CAST(N'2022-03-29T06:46:16.753' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (16, 1, CAST(N'2022-03-29T06:55:00.277' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (17, 1, CAST(N'2022-03-29T07:11:52.040' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (18, 1, CAST(N'2022-03-29T08:41:27.153' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (19, 1, CAST(N'2022-03-29T08:42:46.103' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (20, 1, CAST(N'2022-03-29T08:44:37.640' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (21, 1, CAST(N'2022-03-29T08:46:14.033' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (22, 1, CAST(N'2022-03-29T08:46:30.697' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (23, 1, CAST(N'2022-03-29T09:52:42.810' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (24, 1, CAST(N'2022-03-29T09:53:24.090' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (25, 1, CAST(N'2022-03-29T09:56:10.300' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (26, 1, CAST(N'2022-03-29T09:59:14.900' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (27, 1, CAST(N'2022-03-29T10:12:04.300' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (28, 1, CAST(N'2022-03-29T11:46:04.953' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (29, 1, CAST(N'2022-03-29T12:20:25.503' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (30, 1, CAST(N'2022-03-29T12:30:38.967' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (31, 1, CAST(N'2022-03-29T12:39:23.943' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (32, 1, CAST(N'2022-03-29T12:39:29.207' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (33, 1, CAST(N'2022-03-29T18:45:23.767' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (34, 1, CAST(N'2022-03-29T13:23:30.607' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (35, 1, CAST(N'2022-03-29T13:29:04.493' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (36, 1, CAST(N'2022-03-29T13:29:56.107' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (37, 1, CAST(N'2022-03-29T19:35:59.123' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (38, 1, CAST(N'2022-03-29T19:40:42.207' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (39, 1, CAST(N'2022-03-29T19:47:55.913' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (40, 1, CAST(N'2022-03-29T19:53:49.343' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (41, 1, CAST(N'2022-03-29T19:55:41.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (42, 1, CAST(N'2022-03-29T19:57:12.470' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (43, 1, CAST(N'2022-03-29T15:16:50.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (44, 1, CAST(N'2022-03-29T15:28:40.363' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (45, 1, CAST(N'2022-03-29T15:29:43.617' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (46, 1, CAST(N'2022-03-29T17:32:39.543' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (47, 1, CAST(N'2022-03-29T22:44:37.393' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (48, 1, CAST(N'2022-03-30T10:47:48.913' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (49, 1, CAST(N'2022-03-30T12:31:35.333' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (50, 1, CAST(N'2022-03-30T14:14:44.483' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (51, 1, CAST(N'2022-03-31T11:41:04.343' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (52, 1, CAST(N'2022-03-31T17:11:27.537' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (53, 1, CAST(N'2022-03-31T17:17:47.957' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (54, 1, CAST(N'2022-03-31T18:06:09.303' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (55, 1, CAST(N'2022-03-31T13:23:18.823' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (56, 1, CAST(N'2022-03-31T13:24:55.277' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (57, 1, CAST(N'2022-03-31T13:57:21.427' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (58, 1, CAST(N'2022-03-31T14:14:11.457' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (59, 1, CAST(N'2022-03-31T14:47:08.137' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (60, 1, CAST(N'2022-03-31T15:36:50.533' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (61, 1, CAST(N'2022-03-31T16:35:08.707' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (62, 1, CAST(N'2022-04-02T02:09:25.687' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (63, 1, CAST(N'2022-04-02T14:42:24.080' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (64, 1, CAST(N'2022-04-02T15:01:20.050' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (65, 1, CAST(N'2022-04-02T15:09:31.537' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (66, 1, CAST(N'2022-04-02T15:26:57.277' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (67, 1, CAST(N'2022-04-02T15:31:26.080' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (68, 1, CAST(N'2022-04-02T10:23:14.303' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (69, 1, CAST(N'2022-04-03T03:51:43.957' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (70, 1, CAST(N'2022-04-03T05:25:06.377' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (71, 1, CAST(N'2022-04-03T05:27:50.163' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (72, 1, CAST(N'2022-04-03T05:28:20.953' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (73, 1, CAST(N'2022-04-03T05:37:33.350' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (74, 1, CAST(N'2022-04-03T05:40:59.297' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (75, 1, CAST(N'2022-04-03T05:41:18.150' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (76, 1, CAST(N'2022-04-03T05:46:07.647' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (77, 1, CAST(N'2022-04-03T05:46:24.570' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (78, 1, CAST(N'2022-04-03T05:52:59.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (79, 1, CAST(N'2022-04-03T05:57:15.600' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (80, 1, CAST(N'2022-04-03T11:53:46.110' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (81, 1, CAST(N'2022-04-03T11:58:29.057' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (82, 1, CAST(N'2022-04-03T11:58:29.727' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (83, 1, CAST(N'2022-04-03T12:05:54.420' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (84, 1, CAST(N'2022-04-03T12:09:15.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (85, 1, CAST(N'2022-04-03T12:21:40.603' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (86, 1, CAST(N'2022-04-03T13:26:13.790' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (87, 1, CAST(N'2022-04-03T13:53:20.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (88, 1, CAST(N'2022-04-03T15:04:39.187' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (89, 1, CAST(N'2022-04-03T12:43:58.400' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (90, 1, CAST(N'2022-04-03T19:10:04.817' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (91, 1, CAST(N'2022-04-03T19:14:47.887' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (92, 1, CAST(N'2022-04-03T19:23:28.737' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (93, 1, CAST(N'2022-04-03T16:16:21.687' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (94, 1, CAST(N'2022-04-04T05:41:28.743' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (95, 1, CAST(N'2022-04-04T11:29:31.587' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (96, 1, CAST(N'2022-04-04T13:04:35.470' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (97, 1, CAST(N'2022-04-04T13:04:36.497' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (98, 1, CAST(N'2022-04-04T13:15:08.690' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (99, 1, CAST(N'2022-04-04T09:55:56.907' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (100, 1, CAST(N'2022-04-04T16:51:26.093' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (101, 1, CAST(N'2022-04-04T17:02:54.977' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (102, 1, CAST(N'2022-04-04T12:11:22.303' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (103, 1, CAST(N'2022-04-04T16:13:21.550' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (104, 1, CAST(N'2022-04-04T16:30:39.960' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (105, 1, CAST(N'2022-04-04T17:10:53.403' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (106, 1, CAST(N'2022-04-04T17:35:08.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (107, 1, CAST(N'2022-04-05T15:34:20.917' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (108, 1, CAST(N'2022-04-05T21:35:14.803' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (109, 1, CAST(N'2022-04-05T21:46:47.897' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (110, 1, CAST(N'2022-04-05T23:21:31.623' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (111, 1, CAST(N'2022-04-05T23:23:33.420' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (112, 1, CAST(N'2022-04-05T23:25:06.273' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (113, 1, CAST(N'2022-04-06T05:04:13.650' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (114, 1, CAST(N'2022-04-06T05:35:05.903' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (115, 1, CAST(N'2022-04-06T05:51:51.070' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (116, 1, CAST(N'2022-04-06T12:35:16.187' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (117, 1, CAST(N'2022-04-06T11:23:45.127' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (118, 1, CAST(N'2022-04-06T18:09:41.623' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (119, 1, CAST(N'2022-04-06T13:50:16.033' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (120, 1, CAST(N'2022-04-06T22:18:27.010' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (121, 1, CAST(N'2022-04-06T22:33:06.030' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (122, 1, CAST(N'2022-04-06T23:22:35.433' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (123, 1, CAST(N'2022-04-06T23:26:17.217' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (124, 1, CAST(N'2022-04-07T09:20:45.900' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (125, 1, CAST(N'2022-04-07T09:20:46.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (126, 1, CAST(N'2022-04-07T09:48:21.967' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (127, 1, CAST(N'2022-04-07T09:53:40.273' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (128, 1, CAST(N'2022-04-07T10:02:00.520' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (129, 1, CAST(N'2022-04-07T10:15:08.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (130, 1, CAST(N'2022-04-07T10:24:02.227' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (131, 1, CAST(N'2022-04-07T10:27:13.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (132, 1, CAST(N'2022-04-07T10:29:57.073' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (133, 1, CAST(N'2022-04-07T10:31:54.560' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (134, 1, CAST(N'2022-04-07T11:11:59.677' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (135, 1, CAST(N'2022-04-07T06:36:12.650' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (136, 1, CAST(N'2022-04-07T13:26:19.720' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (137, 1, CAST(N'2022-04-07T13:27:25.367' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (138, 1, CAST(N'2022-04-07T08:32:58.200' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (139, 1, CAST(N'2022-04-07T09:02:53.750' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (140, 1, CAST(N'2022-04-07T09:13:23.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (141, 1, CAST(N'2022-04-07T09:32:20.543' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (142, 1, CAST(N'2022-04-07T09:32:20.750' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (143, 1, CAST(N'2022-04-07T15:55:07.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (144, 1, CAST(N'2022-04-07T15:55:07.847' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (145, 1, CAST(N'2022-04-07T17:31:45.440' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (146, 1, CAST(N'2022-04-07T14:58:50.387' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (147, 1, CAST(N'2022-04-07T15:06:22.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (148, 1, CAST(N'2022-04-07T16:11:10.780' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (149, 1, CAST(N'2022-04-07T16:39:12.593' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (150, 1, CAST(N'2022-04-07T16:50:49.370' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (151, 1, CAST(N'2022-04-07T17:21:23.553' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (152, 1, CAST(N'2022-04-07T17:21:58.130' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (153, 1, CAST(N'2022-04-07T17:33:40.693' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (154, 1, CAST(N'2022-04-08T03:57:09.840' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (155, 1, CAST(N'2022-04-08T14:04:32.970' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (156, 1, CAST(N'2022-04-08T14:04:44.910' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (157, 1, CAST(N'2022-04-08T15:08:20.117' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (158, 1, CAST(N'2022-04-08T15:46:45.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (159, 1, CAST(N'2022-04-08T16:18:54.120' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (160, 1, CAST(N'2022-04-08T10:57:41.347' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (161, 1, CAST(N'2022-04-08T11:38:20.780' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (162, 1, CAST(N'2022-04-08T11:55:20.073' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (163, 1, CAST(N'2022-04-08T11:59:05.890' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (164, 1, CAST(N'2022-04-09T08:16:01.500' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (165, 1, CAST(N'2022-04-09T17:15:58.117' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (166, 1, CAST(N'2022-04-10T08:17:09.783' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (167, 1, CAST(N'2022-04-10T12:19:26.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (168, 1, CAST(N'2022-04-10T12:36:39.213' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (169, 1, CAST(N'2022-04-10T13:36:55.880' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (170, 1, CAST(N'2022-04-10T14:39:09.453' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (171, 1, CAST(N'2022-04-11T01:30:28.637' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (172, 1, CAST(N'2022-04-11T07:48:38.110' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (173, 1, CAST(N'2022-04-11T13:56:48.827' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (174, 1, CAST(N'2022-04-11T14:05:51.680' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (175, 1, CAST(N'2022-04-11T14:15:39.093' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (176, 1, CAST(N'2022-04-11T14:15:39.397' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (177, 1, CAST(N'2022-04-11T10:49:18.247' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (178, 1, CAST(N'2022-04-11T19:22:28.060' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (179, 1, CAST(N'2022-04-11T21:28:33.573' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (180, 1, CAST(N'2022-04-11T22:08:41.873' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (181, 1, CAST(N'2022-04-11T22:12:35.547' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (182, 1, CAST(N'2022-04-11T22:17:22.323' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (183, 1, CAST(N'2022-04-11T22:19:17.853' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (184, 1, CAST(N'2022-04-11T22:21:11.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (185, 1, CAST(N'2022-04-11T22:27:46.843' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (186, 1, CAST(N'2022-04-11T22:34:57.660' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (187, 1, CAST(N'2022-04-11T22:38:39.190' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (188, 1, CAST(N'2022-04-11T22:45:02.410' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (189, 1, CAST(N'2022-04-11T22:46:07.213' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (190, 1, CAST(N'2022-04-11T22:55:51.423' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (191, 1, CAST(N'2022-04-11T23:02:49.533' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (192, 1, CAST(N'2022-04-11T23:05:22.777' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (193, 1, CAST(N'2022-04-12T10:00:01.190' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (194, 1, CAST(N'2022-04-12T04:57:25.120' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (195, 1, CAST(N'2022-04-12T05:02:18.567' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (196, 1, CAST(N'2022-04-12T05:08:07.803' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (197, 1, CAST(N'2022-04-12T06:52:29.667' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (198, 1, CAST(N'2022-04-12T07:10:52.360' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (199, 1, CAST(N'2022-04-12T12:46:24.100' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (200, 1, CAST(N'2022-04-12T07:52:04.143' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (201, 1, CAST(N'2022-04-12T07:58:29.887' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (202, 1, CAST(N'2022-04-12T13:47:14.410' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (203, 1, CAST(N'2022-04-12T14:00:37.147' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (204, 1, CAST(N'2022-04-12T14:02:32.240' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (205, 1, CAST(N'2022-04-12T14:08:57.447' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (206, 1, CAST(N'2022-04-12T08:45:06.190' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (207, 1, CAST(N'2022-04-12T14:34:25.660' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (208, 1, CAST(N'2022-04-12T09:11:07.553' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (209, 1, CAST(N'2022-04-12T14:43:04.597' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (210, 1, CAST(N'2022-04-12T10:20:33.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (211, 1, CAST(N'2022-04-12T10:41:55.237' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (212, 1, CAST(N'2022-04-12T11:22:45.063' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (213, 1, CAST(N'2022-04-12T11:59:00.610' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (214, 1, CAST(N'2022-04-12T12:09:40.700' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (215, 1, CAST(N'2022-04-12T14:07:17.747' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (216, 1, CAST(N'2022-04-12T14:10:38.503' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (217, 1, CAST(N'2022-04-12T14:38:21.197' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (218, 1, CAST(N'2022-04-12T14:38:55.270' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (219, 1, CAST(N'2022-04-12T14:38:55.270' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (220, 1, CAST(N'2022-04-12T21:53:47.743' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (221, 1, CAST(N'2022-04-12T22:02:00.727' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (222, 1, CAST(N'2022-04-12T22:04:48.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (223, 1, CAST(N'2022-04-12T22:06:39.087' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (224, 1, CAST(N'2022-04-12T22:08:02.563' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (225, 1, CAST(N'2022-04-12T22:10:07.867' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (226, 1, CAST(N'2022-04-12T22:11:47.457' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (227, 1, CAST(N'2022-04-12T16:53:14.150' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (228, 1, CAST(N'2022-04-12T22:35:01.320' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (229, 1, CAST(N'2022-04-13T01:03:47.940' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (230, 1, CAST(N'2022-04-13T07:38:35.910' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (231, 1, CAST(N'2022-04-13T08:07:08.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (232, 1, CAST(N'2022-04-13T08:09:55.187' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (233, 1, CAST(N'2022-04-13T11:04:02.830' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (234, 1, CAST(N'2022-04-13T11:04:03.820' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (235, 1, CAST(N'2022-04-13T11:51:38.070' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (236, 1, CAST(N'2022-04-13T07:24:44.333' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (237, 1, CAST(N'2022-04-13T08:48:01.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (238, 1, CAST(N'2022-04-13T09:26:47.473' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (239, 1, CAST(N'2022-04-13T09:26:47.483' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (240, 1, CAST(N'2022-04-13T09:26:47.483' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (241, 1, CAST(N'2022-04-13T09:26:47.537' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (242, 1, CAST(N'2022-04-13T09:26:47.653' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (243, 1, CAST(N'2022-04-13T09:33:28.690' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (244, 1, CAST(N'2022-04-13T09:36:56.550' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (245, 1, CAST(N'2022-04-13T09:44:03.887' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (246, 1, CAST(N'2022-04-13T10:53:21.440' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (247, 1, CAST(N'2022-04-13T13:53:00.097' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (248, 1, CAST(N'2022-04-13T15:00:15.220' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (249, 1, CAST(N'2022-04-13T15:01:55.913' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (250, 1, CAST(N'2022-04-13T15:30:14.810' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (251, 1, CAST(N'2022-04-13T16:47:48.817' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (252, 1, CAST(N'2022-04-13T17:02:04.640' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (253, 1, CAST(N'2022-04-13T17:08:27.867' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (254, 1, CAST(N'2022-04-14T09:03:48.180' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (255, 1, CAST(N'2022-04-14T09:39:31.897' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (256, 1, CAST(N'2022-04-14T15:24:58.687' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (257, 1, CAST(N'2022-04-14T15:33:47.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (258, 1, CAST(N'2022-04-14T15:35:19.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (259, 1, CAST(N'2022-04-14T15:36:49.097' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (260, 1, CAST(N'2022-04-14T15:40:32.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (261, 1, CAST(N'2022-04-14T15:54:02.107' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (262, 1, CAST(N'2022-04-14T16:04:07.080' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (263, 1, CAST(N'2022-04-14T16:07:11.777' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (264, 1, CAST(N'2022-04-14T16:10:42.727' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (265, 1, CAST(N'2022-04-14T16:17:31.800' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (266, 1, CAST(N'2022-04-14T16:21:14.163' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (267, 1, CAST(N'2022-04-14T16:39:46.210' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (268, 1, CAST(N'2022-04-14T17:59:40.563' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (269, 1, CAST(N'2022-04-14T18:26:12.323' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (270, 1, CAST(N'2022-04-14T15:18:47.580' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (271, 1, CAST(N'2022-04-14T15:57:41.120' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (272, 1, CAST(N'2022-04-14T16:28:13.090' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (273, 1, CAST(N'2022-04-15T01:30:32.180' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (274, 1, CAST(N'2022-04-15T10:24:14.737' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (275, 1, CAST(N'2022-04-15T11:26:52.017' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (276, 1, CAST(N'2022-04-15T11:35:08.447' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (277, 1, CAST(N'2022-04-15T11:57:16.373' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (278, 1, CAST(N'2022-04-15T08:33:20.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (279, 1, CAST(N'2022-04-15T14:58:26.610' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (280, 1, CAST(N'2022-04-15T09:48:15.757' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (281, 1, CAST(N'2022-04-15T10:16:35.120' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (282, 1, CAST(N'2022-04-15T12:33:27.407' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (283, 1, CAST(N'2022-04-15T13:13:43.710' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (284, 1, CAST(N'2022-04-15T13:39:48.720' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (285, 1, CAST(N'2022-04-15T19:10:47.607' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (286, 1, CAST(N'2022-04-15T14:20:46.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (287, 1, CAST(N'2022-04-15T14:56:07.193' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (288, 1, CAST(N'2022-04-15T16:04:33.307' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (289, 1, CAST(N'2022-04-15T22:02:20.377' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (290, 1, CAST(N'2022-04-15T22:26:29.530' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (291, 1, CAST(N'2022-04-15T22:27:28.433' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (292, 1, CAST(N'2022-04-15T18:10:50.273' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (293, 1, CAST(N'2022-04-15T18:14:31.793' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (294, 1, CAST(N'2022-04-15T18:22:38.807' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (295, 1, CAST(N'2022-04-15T18:25:30.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (296, 1, CAST(N'2022-04-15T18:31:06.537' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (297, 1, CAST(N'2022-04-15T18:33:22.573' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (298, 1, CAST(N'2022-04-15T20:23:00.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (299, 1, CAST(N'2022-04-15T20:30:51.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (300, 1, CAST(N'2022-04-16T04:04:37.297' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (301, 1, CAST(N'2022-04-16T04:12:01.757' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (302, 1, CAST(N'2022-04-16T04:25:41.433' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (303, 1, CAST(N'2022-04-16T06:10:39.773' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (304, 1, CAST(N'2022-04-16T06:13:20.190' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (305, 1, CAST(N'2022-04-16T06:34:33.827' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (306, 1, CAST(N'2022-04-16T03:35:24.480' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (307, 1, CAST(N'2022-04-16T07:12:28.803' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (308, 1, CAST(N'2022-04-16T07:47:44.707' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (309, 1, CAST(N'2022-04-16T10:34:04.210' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (310, 1, CAST(N'2022-04-16T10:40:03.387' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (311, 1, CAST(N'2022-04-16T16:49:16.400' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (312, 1, CAST(N'2022-04-16T18:49:45.800' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (313, 1, CAST(N'2022-04-16T19:00:16.297' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (314, 1, CAST(N'2022-04-16T19:04:11.797' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (315, 1, CAST(N'2022-04-16T19:14:19.173' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (316, 1, CAST(N'2022-04-16T19:51:41.723' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (317, 1, CAST(N'2022-04-16T20:08:43.613' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (318, 1, CAST(N'2022-04-16T20:39:30.090' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (319, 1, CAST(N'2022-04-16T20:41:25.450' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (320, 1, CAST(N'2022-04-16T20:54:03.513' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (321, 1, CAST(N'2022-04-16T15:25:12.763' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (322, 1, CAST(N'2022-04-16T20:58:14.740' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (323, 1, CAST(N'2022-04-16T15:39:07.227' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (324, 1, CAST(N'2022-04-16T21:48:13.763' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (325, 1, CAST(N'2022-04-16T17:35:01.433' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (326, 1, CAST(N'2022-04-17T08:57:04.247' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (327, 1, CAST(N'2022-04-17T09:00:39.683' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (328, 1, CAST(N'2022-04-17T09:04:06.253' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (329, 1, CAST(N'2022-04-17T09:08:53.570' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (330, 1, CAST(N'2022-04-17T09:15:27.473' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (331, 1, CAST(N'2022-04-17T09:29:29.543' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (332, 1, CAST(N'2022-04-17T04:35:40.217' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (333, 1, CAST(N'2022-04-17T05:33:15.087' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (334, 1, CAST(N'2022-04-17T14:35:34.567' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (335, 1, CAST(N'2022-04-17T15:54:56.817' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (336, 1, CAST(N'2022-04-17T16:08:39.647' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (337, 1, CAST(N'2022-04-17T16:09:52.240' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (338, 1, CAST(N'2022-04-17T16:11:26.767' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (339, 1, CAST(N'2022-04-17T16:34:19.580' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (340, 1, CAST(N'2022-04-17T16:38:16.043' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (341, 1, CAST(N'2022-04-17T16:41:32.333' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (342, 1, CAST(N'2022-04-17T16:47:16.343' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (343, 1, CAST(N'2022-04-17T18:07:07.270' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (344, 1, CAST(N'2022-04-17T23:23:53.597' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (345, 1, CAST(N'2022-04-18T04:18:34.700' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (346, 1, CAST(N'2022-04-18T13:53:18.217' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (347, 1, CAST(N'2022-04-18T15:35:07.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (348, 1, CAST(N'2022-04-18T10:52:40.283' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (349, 1, CAST(N'2022-04-18T11:20:59.047' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (350, 1, CAST(N'2022-04-18T17:25:36.130' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (351, 1, CAST(N'2022-04-18T12:39:15.037' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (352, 1, CAST(N'2022-04-18T13:03:43.333' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (353, 1, CAST(N'2022-04-18T14:00:26.237' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (354, 1, CAST(N'2022-04-18T15:15:11.043' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (355, 1, CAST(N'2022-04-18T15:21:41.073' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (356, 1, CAST(N'2022-04-18T16:47:17.307' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (357, 1, CAST(N'2022-04-18T18:48:54.923' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (358, 1, CAST(N'2022-04-19T11:28:16.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (359, 1, CAST(N'2022-04-19T11:44:47.513' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (360, 1, CAST(N'2022-04-19T11:45:57.420' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (361, 1, CAST(N'2022-04-19T17:25:49.293' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (362, 1, CAST(N'2022-04-19T17:30:22.527' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (363, 1, CAST(N'2022-04-19T17:31:19.520' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (364, 1, CAST(N'2022-04-19T17:43:31.643' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (365, 1, CAST(N'2022-04-19T17:46:35.843' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (366, 1, CAST(N'2022-04-19T15:04:22.643' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (367, 1, CAST(N'2022-04-20T09:18:18.343' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (368, 1, CAST(N'2022-04-20T11:08:05.327' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (369, 1, CAST(N'2022-04-20T13:17:30.257' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (370, 1, CAST(N'2022-04-20T16:43:28.480' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (371, 1, CAST(N'2022-04-20T12:43:06.603' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (372, 1, CAST(N'2022-04-20T14:19:18.980' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (373, 1, CAST(N'2022-04-20T15:35:01.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (374, 1, CAST(N'2022-04-20T15:52:29.443' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (375, 1, CAST(N'2022-04-20T16:14:56.993' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (376, 1, CAST(N'2022-04-20T16:22:30.033' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (377, 1, CAST(N'2022-04-20T22:02:16.177' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (378, 1, CAST(N'2022-04-20T22:06:32.120' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (379, 1, CAST(N'2022-04-20T22:08:04.853' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (380, 1, CAST(N'2022-04-20T22:10:41.923' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (381, 1, CAST(N'2022-04-20T22:17:18.493' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (382, 1, CAST(N'2022-04-20T16:47:28.180' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (383, 1, CAST(N'2022-04-20T22:22:51.747' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (384, 1, CAST(N'2022-04-20T16:57:18.567' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (385, 1, CAST(N'2022-04-20T17:03:06.287' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (386, 1, CAST(N'2022-04-20T17:03:39.717' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (387, 1, CAST(N'2022-04-20T17:19:43.400' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (388, 1, CAST(N'2022-04-20T17:30:05.223' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (389, 1, CAST(N'2022-04-20T17:35:51.093' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (390, 1, CAST(N'2022-04-20T17:50:00.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (391, 1, CAST(N'2022-04-20T17:53:04.990' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (392, 1, CAST(N'2022-04-20T18:20:51.807' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (393, 1, CAST(N'2022-04-20T18:54:52.530' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (394, 1, CAST(N'2022-04-20T21:04:40.643' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (395, 1, CAST(N'2022-04-20T21:04:47.867' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (396, 1, CAST(N'2022-04-21T12:07:16.287' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (397, 1, CAST(N'2022-04-21T11:47:21.307' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (398, 1, CAST(N'2022-04-21T11:52:34.507' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (399, 1, CAST(N'2022-04-21T12:54:45.253' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (400, 1, CAST(N'2022-04-21T13:06:11.703' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (401, 1, CAST(N'2022-04-21T13:21:27.410' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (402, 1, CAST(N'2022-04-21T15:30:05.863' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (403, 1, CAST(N'2022-04-21T15:33:45.007' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (404, 1, CAST(N'2022-04-21T15:51:39.293' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (405, 1, CAST(N'2022-04-21T16:22:03.223' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (406, 1, CAST(N'2022-04-21T17:25:40.710' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (407, 1, CAST(N'2022-04-22T00:36:12.153' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (408, 1, CAST(N'2022-04-22T03:57:08.663' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (409, 1, CAST(N'2022-04-22T05:53:36.053' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (410, 1, CAST(N'2022-04-22T12:16:51.827' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (411, 1, CAST(N'2022-04-22T12:23:03.580' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (412, 1, CAST(N'2022-04-22T07:37:30.347' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (413, 1, CAST(N'2022-04-22T07:59:16.253' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (414, 1, CAST(N'2022-04-22T08:32:27.017' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (415, 1, CAST(N'2022-04-22T13:24:08.793' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (416, 1, CAST(N'2022-04-22T15:16:51.777' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (417, 1, CAST(N'2022-04-22T15:51:55.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (418, 1, CAST(N'2022-04-22T15:53:15.363' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (419, 1, CAST(N'2022-04-22T16:03:06.947' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (420, 1, CAST(N'2022-04-22T16:27:59.480' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (421, 1, CAST(N'2022-04-22T16:31:31.177' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (422, 1, CAST(N'2022-04-23T02:37:28.280' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (423, 1, CAST(N'2022-04-23T05:45:17.230' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (424, 1, CAST(N'2022-04-23T13:49:46.287' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (425, 1, CAST(N'2022-04-23T13:59:59.523' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (426, 1, CAST(N'2022-04-24T11:14:54.597' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (427, 21, CAST(N'2022-04-24T12:05:33.467' AS DateTime), CAST(N'2022-05-02T15:32:43.233' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (428, 1, CAST(N'2022-04-24T15:30:13.677' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (429, 21, CAST(N'2022-04-24T21:54:05.880' AS DateTime), CAST(N'2022-05-02T15:32:43.233' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (430, 1, CAST(N'2022-04-24T16:35:22.790' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (431, 1, CAST(N'2022-04-24T16:43:38.793' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (432, 1, CAST(N'2022-04-24T16:56:16.690' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (433, 1, CAST(N'2022-04-25T05:54:59.977' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (434, 1, CAST(N'2022-04-25T11:38:38.087' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (435, 1, CAST(N'2022-04-25T17:23:28.990' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (436, 1, CAST(N'2022-04-25T17:23:32.007' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (437, 1, CAST(N'2022-04-25T12:09:17.823' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (438, 1, CAST(N'2022-04-25T17:48:42.590' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (439, 1, CAST(N'2022-04-25T20:53:28.283' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (440, 1, CAST(N'2022-04-26T04:26:15.647' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (441, 1, CAST(N'2022-04-26T10:27:12.367' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (442, 1, CAST(N'2022-04-26T05:02:00.263' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (443, 1, CAST(N'2022-04-26T11:26:58.033' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (444, 1, CAST(N'2022-04-26T16:08:45.423' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (445, 1, CAST(N'2022-04-26T10:42:11.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (446, 1, CAST(N'2022-04-26T11:40:20.233' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (447, 1, CAST(N'2022-04-26T12:28:14.447' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (448, 1, CAST(N'2022-04-26T14:47:56.840' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (449, 1, CAST(N'2022-04-26T15:35:25.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (450, 1, CAST(N'2022-04-26T16:17:33.840' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (451, 1, CAST(N'2022-04-26T18:49:17.807' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (452, 1, CAST(N'2022-04-27T00:49:05.737' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (453, 1, CAST(N'2022-04-27T09:41:07.053' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (454, 1, CAST(N'2022-04-27T09:57:14.923' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (455, 1, CAST(N'2022-04-27T11:25:07.380' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (456, 1, CAST(N'2022-04-27T11:27:33.150' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (457, 1, CAST(N'2022-04-27T16:10:10.170' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (458, 1, CAST(N'2022-04-27T16:15:59.333' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (459, 1, CAST(N'2022-04-27T16:43:09.987' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (460, 1, CAST(N'2022-04-27T18:08:06.617' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (461, 1, CAST(N'2022-04-27T19:25:48.423' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (462, 1, CAST(N'2022-04-27T19:50:39.027' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (463, 1, CAST(N'2022-04-28T05:31:43.950' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (464, 1, CAST(N'2022-04-28T13:58:20.507' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (465, 1, CAST(N'2022-04-28T09:13:56.373' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (466, 1, CAST(N'2022-04-28T12:41:53.653' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (467, 1, CAST(N'2022-04-28T14:14:29.340' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (468, 1, CAST(N'2022-04-28T14:52:32.110' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (469, 1, CAST(N'2022-04-28T22:03:21.100' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (470, 1, CAST(N'2022-04-28T19:38:00.390' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (471, 1, CAST(N'2022-04-29T04:10:48.473' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (472, 1, CAST(N'2022-04-29T06:27:01.653' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (473, 1, CAST(N'2022-04-29T13:13:43.037' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (474, 1, CAST(N'2022-04-29T13:16:54.530' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (475, 1, CAST(N'2022-04-29T14:27:48.680' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (476, 1, CAST(N'2022-04-29T19:56:39.673' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (477, 1, CAST(N'2022-04-29T19:58:13.423' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (478, 1, CAST(N'2022-04-30T02:28:30.517' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (479, 1, CAST(N'2022-04-30T08:42:37.300' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (480, 5, CAST(N'2022-04-30T18:07:59.000' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (481, 1, CAST(N'2022-04-30T16:12:50.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (482, 1, CAST(N'2022-05-01T14:56:33.477' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (483, 1, CAST(N'2022-05-01T20:41:25.913' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (484, 1, CAST(N'2022-05-02T12:37:24.307' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (485, 1, CAST(N'2022-05-02T12:50:08.750' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (486, 21, CAST(N'2022-05-02T15:32:29.907' AS DateTime), CAST(N'2022-05-02T15:32:43.233' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (487, 1, CAST(N'2022-05-02T15:32:55.193' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (488, 1, CAST(N'2022-05-02T15:59:17.760' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (489, 1, CAST(N'2022-05-02T22:11:45.260' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (490, 1, CAST(N'2022-05-03T02:03:22.040' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (491, 1, CAST(N'2022-05-03T21:50:15.037' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (492, 1, CAST(N'2022-05-03T17:54:30.880' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (493, 1, CAST(N'2022-05-03T18:44:42.960' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (494, 1, CAST(N'2022-05-03T18:49:09.410' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (495, 1, CAST(N'2022-05-04T10:05:16.540' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (496, 1, CAST(N'2022-05-04T16:12:41.737' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (497, 1, CAST(N'2022-05-04T18:33:24.877' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (498, 1, CAST(N'2022-05-05T01:04:43.130' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (499, 1, CAST(N'2022-05-05T13:12:28.750' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (500, 1, CAST(N'2022-05-05T15:49:37.483' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (501, 1, CAST(N'2022-05-05T16:18:44.373' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (502, 1, CAST(N'2022-05-05T16:47:11.770' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (503, 1, CAST(N'2022-05-05T18:09:10.213' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (504, 1, CAST(N'2022-05-05T18:59:56.233' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (505, 1, CAST(N'2022-05-06T04:21:28.037' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (506, 1, CAST(N'2022-05-06T04:35:40.070' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (507, 1, CAST(N'2022-05-06T04:41:42.840' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (508, 1, CAST(N'2022-05-06T15:19:14.117' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (509, 1, CAST(N'2022-05-06T10:09:59.953' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (510, 1, CAST(N'2022-05-06T10:15:24.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (511, 1, CAST(N'2022-05-06T10:17:53.617' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (512, 1, CAST(N'2022-05-06T10:23:46.383' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (513, 1, CAST(N'2022-05-06T10:43:07.373' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (514, 1, CAST(N'2022-05-06T10:51:10.950' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (515, 1, CAST(N'2022-05-06T11:54:39.677' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (516, 1, CAST(N'2022-05-06T12:07:43.643' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (517, 1, CAST(N'2022-05-06T12:20:05.853' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (518, 1, CAST(N'2022-05-06T13:47:57.967' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (519, 1, CAST(N'2022-05-06T17:12:37.587' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (520, 1, CAST(N'2022-05-06T18:39:57.390' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (521, 1, CAST(N'2022-05-07T02:11:43.853' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (522, 1, CAST(N'2022-05-07T06:39:01.683' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (523, 1, CAST(N'2022-05-07T09:30:40.103' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (524, 1, CAST(N'2022-05-07T15:03:20.380' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (525, 1, CAST(N'2022-05-07T15:34:23.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (526, 1, CAST(N'2022-05-07T15:45:59.300' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (527, 1, CAST(N'2022-05-07T16:09:34.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (528, 1, CAST(N'2022-05-07T17:13:07.357' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (529, 1, CAST(N'2022-05-08T00:49:06.727' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (530, 1, CAST(N'2022-05-08T06:22:19.993' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (531, 1, CAST(N'2022-05-08T06:40:40.027' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (532, 1, CAST(N'2022-05-08T07:22:54.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (533, 1, CAST(N'2022-05-08T08:24:33.940' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (534, 1, CAST(N'2022-05-08T14:43:36.447' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (535, 1, CAST(N'2022-05-08T15:39:37.733' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (536, 1, CAST(N'2022-05-08T16:14:08.647' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (537, 1, CAST(N'2022-05-08T16:42:08.327' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (538, 1, CAST(N'2022-05-09T00:41:22.977' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (539, 1, CAST(N'2022-05-09T13:36:57.810' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (540, 1, CAST(N'2022-05-09T19:06:19.067' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (541, 1, CAST(N'2022-05-10T00:58:44.450' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (542, 1, CAST(N'2022-05-10T05:58:55.837' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (543, 1, CAST(N'2022-05-10T13:41:07.533' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (544, 1, CAST(N'2022-05-10T13:54:34.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (545, 1, CAST(N'2022-05-10T09:02:36.180' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (546, 1, CAST(N'2022-05-10T09:21:55.833' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (547, 1, CAST(N'2022-05-10T11:12:56.937' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (548, 1, CAST(N'2022-05-10T13:21:40.620' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (549, 1, CAST(N'2022-05-10T15:23:21.780' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (550, 1, CAST(N'2022-05-11T04:49:00.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (551, 1, CAST(N'2022-05-11T05:16:56.310' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (552, 1, CAST(N'2022-05-11T11:07:11.547' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (553, 1, CAST(N'2022-05-11T13:45:19.573' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (554, 1, CAST(N'2022-05-11T16:21:41.997' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (555, 1, CAST(N'2022-05-11T16:25:40.047' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (556, 1, CAST(N'2022-05-11T11:24:48.137' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (557, 1, CAST(N'2022-05-11T11:34:13.583' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (558, 1, CAST(N'2022-05-11T12:30:15.873' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (559, 1, CAST(N'2022-05-11T12:58:03.523' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (560, 1, CAST(N'2022-05-11T13:04:56.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (561, 1, CAST(N'2022-05-11T13:12:55.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (562, 1, CAST(N'2022-05-11T13:13:03.230' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (563, 1, CAST(N'2022-05-11T14:03:41.490' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (564, 1, CAST(N'2022-05-11T15:41:14.473' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (565, 1, CAST(N'2022-05-11T16:02:14.980' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (566, 1, CAST(N'2022-05-11T16:02:36.977' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (567, 1, CAST(N'2022-05-11T16:21:51.370' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (568, 1, CAST(N'2022-05-11T16:40:58.273' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (569, 1, CAST(N'2022-05-11T16:51:53.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (570, 1, CAST(N'2022-05-11T16:55:43.370' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (571, 1, CAST(N'2022-05-11T17:00:15.267' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (572, 1, CAST(N'2022-05-11T17:31:40.227' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (573, 1, CAST(N'2022-05-11T17:52:02.937' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (574, 1, CAST(N'2022-05-11T17:56:34.310' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (575, 1, CAST(N'2022-05-12T06:15:03.380' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (576, 1, CAST(N'2022-05-12T08:53:57.540' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (577, 1, CAST(N'2022-05-12T09:16:18.090' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (578, 1, CAST(N'2022-05-12T10:37:22.093' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (579, 1, CAST(N'2022-05-12T11:54:39.603' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (580, 1, CAST(N'2022-05-12T15:54:32.667' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (581, 1, CAST(N'2022-05-12T16:50:19.553' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (582, 1, CAST(N'2022-05-12T17:39:49.567' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (583, 1, CAST(N'2022-05-12T17:48:53.913' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (584, 1, CAST(N'2022-05-13T07:53:46.860' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (585, 1, CAST(N'2022-05-13T15:19:26.457' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (586, 1, CAST(N'2022-05-13T15:21:02.337' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (587, 1, CAST(N'2022-05-13T16:35:07.013' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (588, 1, CAST(N'2022-05-13T16:48:12.837' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (589, 1, CAST(N'2022-05-13T17:08:17.480' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (590, 1, CAST(N'2022-05-13T17:40:45.887' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (591, 1, CAST(N'2022-05-13T17:44:57.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (592, 1, CAST(N'2022-05-13T18:20:38.753' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (593, 1, CAST(N'2022-05-14T04:35:33.527' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (594, 1, CAST(N'2022-05-14T13:12:24.380' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (595, 1, CAST(N'2022-05-14T16:18:42.220' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (596, 1, CAST(N'2022-05-14T17:34:43.973' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (597, 1, CAST(N'2022-05-15T12:42:46.077' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (598, 1, CAST(N'2022-05-15T14:10:43.643' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (599, 1, CAST(N'2022-05-15T18:02:23.163' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (600, 1, CAST(N'2022-05-16T04:37:45.310' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (601, 1, CAST(N'2022-05-16T10:12:34.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (602, 1, CAST(N'2022-05-16T10:59:36.790' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (603, 1, CAST(N'2022-05-16T15:10:27.137' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (604, 1, CAST(N'2022-05-16T18:17:42.113' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (605, 1, CAST(N'2022-05-16T22:20:29.963' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (606, 1, CAST(N'2022-05-17T10:03:49.613' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (607, 1, CAST(N'2022-05-17T10:04:07.277' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (608, 1, CAST(N'2022-05-17T10:04:20.353' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (609, 1, CAST(N'2022-05-17T10:05:57.787' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (610, 1, CAST(N'2022-05-17T10:43:50.833' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (611, 1, CAST(N'2022-05-17T11:34:23.050' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (612, 1, CAST(N'2022-05-17T12:11:19.090' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (613, 1, CAST(N'2022-05-17T15:55:00.633' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (614, 1, CAST(N'2022-05-17T21:28:38.797' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (615, 1, CAST(N'2022-05-17T21:29:04.487' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (616, 1, CAST(N'2022-05-18T09:44:16.163' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (617, 1, CAST(N'2022-05-18T13:24:24.593' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (618, 1, CAST(N'2022-05-18T15:03:52.347' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (619, 1, CAST(N'2022-05-18T20:34:20.740' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (620, 1, CAST(N'2022-05-19T09:52:32.047' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (621, 1, CAST(N'2022-05-19T11:27:40.707' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (622, 1, CAST(N'2022-05-19T11:54:45.083' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (623, 1, CAST(N'2022-05-19T12:02:19.950' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (624, 1, CAST(N'2022-05-19T14:09:36.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (625, 1, CAST(N'2022-05-19T16:09:22.160' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (626, 1, CAST(N'2022-05-19T13:44:07.727' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (627, 1, CAST(N'2022-05-19T15:16:43.147' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (628, 1, CAST(N'2022-05-19T15:20:25.367' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (629, 1, CAST(N'2022-05-19T15:22:07.970' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (630, 1, CAST(N'2022-05-19T15:28:09.660' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (631, 1, CAST(N'2022-05-19T15:29:01.500' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (632, 1, CAST(N'2022-05-19T15:31:04.463' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (633, 1, CAST(N'2022-05-20T00:03:49.133' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (634, 1, CAST(N'2022-05-20T06:08:33.580' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (635, 1, CAST(N'2022-05-20T06:52:09.223' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (636, 1, CAST(N'2022-05-20T10:11:48.517' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (637, 1, CAST(N'2022-05-20T10:31:28.497' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (638, 1, CAST(N'2022-05-20T11:39:35.803' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (639, 1, CAST(N'2022-05-20T12:12:16.310' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (640, 1, CAST(N'2022-05-20T14:25:58.900' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (641, 1, CAST(N'2022-05-20T14:34:53.417' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (642, 1, CAST(N'2022-05-20T16:00:33.970' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (643, 1, CAST(N'2022-05-20T16:47:07.160' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (644, 1, CAST(N'2022-05-20T16:51:23.173' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (645, 1, CAST(N'2022-05-20T17:01:47.307' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (646, 1, CAST(N'2022-05-21T11:37:13.767' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (647, 1, CAST(N'2022-05-21T15:39:37.217' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (648, 1, CAST(N'2022-05-21T16:03:17.313' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (649, 1, CAST(N'2022-05-22T08:06:28.403' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (650, 1, CAST(N'2022-05-22T08:39:57.910' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (651, 1, CAST(N'2022-05-22T08:49:39.287' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (652, 1, CAST(N'2022-05-22T09:04:05.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (653, 1, CAST(N'2022-05-22T09:57:37.520' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (654, 1, CAST(N'2022-05-22T10:53:06.680' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (655, 1, CAST(N'2022-05-22T10:53:10.097' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (656, 1, CAST(N'2022-05-22T13:44:48.690' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (657, 1, CAST(N'2022-05-22T14:28:14.723' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (658, 1, CAST(N'2022-05-22T14:29:55.187' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (659, 1, CAST(N'2022-05-22T15:32:33.957' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (660, 1, CAST(N'2022-05-22T16:02:07.070' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (661, 1, CAST(N'2022-05-22T17:55:24.097' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (662, 1, CAST(N'2022-05-22T18:04:49.963' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (663, 1, CAST(N'2022-05-22T19:21:38.553' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (664, 1, CAST(N'2022-05-22T19:34:41.577' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (665, 1, CAST(N'2022-05-22T19:48:34.127' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (666, 1, CAST(N'2022-05-22T21:27:41.737' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (667, 1, CAST(N'2022-05-22T21:28:35.677' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (668, 1, CAST(N'2022-05-23T10:01:31.980' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (669, 1, CAST(N'2022-05-23T12:40:36.203' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (670, 1, CAST(N'2022-05-23T18:06:46.233' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (671, 1, CAST(N'2022-05-23T18:33:23.883' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (672, 1, CAST(N'2022-05-23T18:46:36.350' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (673, 1, CAST(N'2022-05-23T18:48:55.063' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (674, 1, CAST(N'2022-05-23T21:08:44.123' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (675, 1, CAST(N'2022-05-23T22:34:15.437' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (676, 1, CAST(N'2022-05-23T22:58:42.973' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (677, 1, CAST(N'2022-05-24T21:13:24.890' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (678, 1, CAST(N'2022-05-25T11:09:36.583' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (679, 1, CAST(N'2022-05-25T11:27:27.653' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (680, 1, CAST(N'2022-05-25T11:36:59.717' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (681, 1, CAST(N'2022-05-25T11:47:18.823' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (682, 1, CAST(N'2022-05-25T11:58:42.800' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (683, 1, CAST(N'2022-05-25T17:54:26.863' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (684, 1, CAST(N'2022-05-25T18:00:55.717' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (685, 1, CAST(N'2022-05-25T21:23:52.767' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (686, 1, CAST(N'2022-05-25T22:10:55.100' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (687, 1, CAST(N'2022-05-25T22:53:47.310' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (688, 1, CAST(N'2022-05-25T23:07:48.543' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (689, 1, CAST(N'2022-05-25T23:30:08.430' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (690, 1, CAST(N'2022-05-25T23:50:41.533' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (691, 1, CAST(N'2022-05-25T23:56:48.480' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (692, 1, CAST(N'2022-05-26T00:00:11.230' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (693, 1, CAST(N'2022-05-26T00:17:01.030' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (694, 1, CAST(N'2022-05-26T00:29:31.927' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (695, 1, CAST(N'2022-05-26T00:34:42.377' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (696, 1, CAST(N'2022-05-26T00:35:42.240' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (697, 1, CAST(N'2022-05-26T01:29:08.503' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (698, 1, CAST(N'2022-05-26T01:34:38.667' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (699, 1, CAST(N'2022-05-26T01:43:12.637' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (700, 1, CAST(N'2022-05-26T01:46:11.840' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (701, 1, CAST(N'2022-05-26T02:35:52.893' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (702, 1, CAST(N'2022-05-26T10:55:03.300' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (703, 1, CAST(N'2022-05-26T11:08:55.827' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (704, 1, CAST(N'2022-05-26T12:05:14.067' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (705, 1, CAST(N'2022-05-26T14:21:46.833' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (706, 1, CAST(N'2022-05-26T16:43:59.517' AS DateTime), CAST(N'2022-05-26T16:51:36.807' AS DateTime))
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (707, 1, CAST(N'2022-05-26T16:53:16.937' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (708, 1, CAST(N'2022-05-26T20:57:31.183' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (709, 1, CAST(N'2022-05-26T21:22:00.187' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (710, 1, CAST(N'2022-05-26T23:55:46.623' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (711, 1, CAST(N'2022-05-27T00:15:59.620' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (712, 1, CAST(N'2022-05-27T00:39:52.353' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (713, 1, CAST(N'2022-05-27T00:55:46.157' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (714, 1, CAST(N'2022-05-27T09:56:34.973' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (715, 1, CAST(N'2022-05-27T10:33:23.797' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (716, 1, CAST(N'2022-05-27T11:29:16.627' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (717, 1, CAST(N'2022-05-27T12:11:10.483' AS DateTime), NULL)
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
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (28, 6, 1, N'Admission', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (29, 6, 2, N'Start of Care', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (30, 6, 3, N'Hold', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (31, 6, 4, N'Change', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (32, 6, 5, N'Resume', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (33, 6, 6, N'Re-Admission', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (34, 6, 7, N'Pending', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (35, 6, 8, N'Deferred', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (36, 6, 9, N'Discharge', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (37, 6, 10, N'Hospital', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (38, 6, 11, N'Tour Scheduled', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (39, 6, 12, N'Assessment Scheduled', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (40, 6, 13, N'Declined', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (41, 6, 14, N'Withdrawn', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (42, 6, 15, N'First Contacted', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (43, 6, 16, N'First Billed', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (44, 6, 15, N'Teach and Train', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (45, 7, 1, N'CASA/DSS/HRA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (46, 7, 2, N'CDPAP', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (47, 7, 3, N'CHHA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (48, 7, 4, N'Death', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (49, 7, 5, N'Hospital', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (50, 7, 6, N'Long Term HHCP', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (51, 7, 7, N'Other Comm. Agency', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (52, 7, 8, N'Other Institution', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (53, 7, 9, N'PCA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (54, 7, 10, N'Physician', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (55, 7, 11, N'Residential Care Facility', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (56, 7, 12, N'Self/Family/Friend', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (57, 7, 13, N'Veteran Administration', 1)
SET IDENTITY_INSERT [dbo].[tblMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMasterType] ON 

INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (1, N'EmployeeStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (2, N'MaritalStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (3, N'Gender')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (4, N'Ethnicity')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (5, N'EmpStatusType')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (6, N'ClientStatusActivity')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (7, N'ClientStatusReferralCode')
SET IDENTITY_INSERT [dbo].[tblMasterType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMedication] ON 

INSERT [dbo].[tblMedication] ([MedicationId], [UserId], [StartDate], [EndDate], [Medication], [NDC], [Strength], [Dosage], [Frequency], [Route], [Tabs], [Prescriber], [Classification], [Instructions], [IsReminders], [IsInstructionscheck], [Isadministrationcheck], [Isselfadministercheck], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 11, CAST(N'2022-04-03T00:00:00.000' AS DateTime), CAST(N'2022-04-28T00:00:00.000' AS DateTime), N'dfsdf', N'sdfds', N'sdfsd', N'sdfsdf', 34, N'sdfg', N'dsfds', N'dfgdf', N'fdgdf', N'1', 1, 1, 1, 1, 0, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblMedication] ([MedicationId], [UserId], [StartDate], [EndDate], [Medication], [NDC], [Strength], [Dosage], [Frequency], [Route], [Tabs], [Prescriber], [Classification], [Instructions], [IsReminders], [IsInstructionscheck], [Isadministrationcheck], [Isselfadministercheck], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 16, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-16T00:00:00.000' AS DateTime), N'test', N'dfsd', N'sdf', N'dsf', 3, N'dsfsd', N'dsfsd', N'sdf', N'dsf', N'1', 1, 1, 1, 1, 0, CAST(N'2022-04-22T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblMedication] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMeeting] ON 

INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (1, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:56:00' AS Time), 1, CAST(N'2022-03-26T16:03:50.947' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (2, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'09:09:00' AS Time), CAST(N'11:19:00' AS Time), 1, CAST(N'2022-03-27T11:10:31.897' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (3, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'08:10:00' AS Time), CAST(N'10:10:00' AS Time), 1, CAST(N'2022-03-27T11:12:57.953' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (4, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'10:15:00' AS Time), CAST(N'11:25:00' AS Time), 1, CAST(N'2022-03-27T11:29:10.650' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (5, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'11:30:00' AS Time), CAST(N'12:30:00' AS Time), 1, CAST(N'2022-03-27T11:31:08.587' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (6, 1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'21:47:00' AS Time), CAST(N'22:52:00' AS Time), 2, CAST(N'2022-03-28T21:48:16.520' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (7, 1, CAST(N'2022-04-04T00:00:00.000' AS DateTime), CAST(N'13:05:00' AS Time), CAST(N'16:20:00' AS Time), 1, CAST(N'2022-04-04T13:05:43.090' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (8, 1, CAST(N'2022-03-30T00:00:00.000' AS DateTime), CAST(N'13:08:00' AS Time), CAST(N'14:13:00' AS Time), 1, CAST(N'2022-04-04T13:09:05.607' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (9, 1, CAST(N'2022-03-30T00:00:00.000' AS DateTime), CAST(N'13:10:00' AS Time), CAST(N'16:10:00' AS Time), 0, CAST(N'2022-04-04T13:11:12.673' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (10, 1, CAST(N'2022-03-31T00:00:00.000' AS DateTime), CAST(N'13:15:00' AS Time), CAST(N'16:40:00' AS Time), 1, CAST(N'2022-04-04T13:15:32.933' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (11, 1, CAST(N'2022-04-05T07:27:04.863' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:51:00' AS Time), 1, CAST(N'2022-04-05T07:27:04.863' AS DateTime), 1, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (12, 1, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(N'16:56:00' AS Time), CAST(N'19:56:00' AS Time), 1, CAST(N'2022-04-06T11:26:37.680' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (13, -1, CAST(N'2022-03-29T00:00:00.000' AS DateTime), CAST(N'17:27:00' AS Time), CAST(N'23:52:00' AS Time), 1, CAST(N'2022-04-08T11:58:20.357' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (14, -1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'21:17:00' AS Time), CAST(N'23:37:00' AS Time), 1, CAST(N'2022-04-12T14:48:28.427' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (15, 15, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'22:12:00' AS Time), CAST(N'23:17:00' AS Time), 1, CAST(N'2022-04-13T16:42:54.237' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (16, 3, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'22:27:00' AS Time), CAST(N'22:52:00' AS Time), 1, CAST(N'2022-04-13T16:57:55.670' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (17, -1, CAST(N'2022-03-29T00:00:00.000' AS DateTime), CAST(N'16:19:00' AS Time), CAST(N'22:39:00' AS Time), 1, CAST(N'2022-04-16T10:50:40.503' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (18, 5, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'04:52:00' AS Time), CAST(N'23:57:00' AS Time), 1, CAST(N'2022-04-20T16:23:17.767' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (19, -1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'23:19:00' AS Time), CAST(N'23:59:00' AS Time), 1, CAST(N'2022-04-27T17:49:35.570' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (20, 32, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'22:25:00' AS Time), CAST(N'23:55:00' AS Time), 1, CAST(N'2022-05-04T16:55:34.627' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (21, 56, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'09:58:00' AS Time), CAST(N'13:08:00' AS Time), 1, CAST(N'2022-05-19T09:59:16.467' AS DateTime), 0, 10)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (23, 56, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'10:36:00' AS Time), CAST(N'12:41:00' AS Time), 1, CAST(N'2022-05-19T10:36:12.513' AS DateTime), 1, 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (24, 62, CAST(N'2022-05-28T00:00:00.000' AS DateTime), CAST(N'17:34:00' AS Time), CAST(N'19:34:00' AS Time), 1, CAST(N'2022-05-23T19:35:23.973' AS DateTime), 0, 39)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (25, -1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'22:27:00' AS Time), CAST(N'22:27:00' AS Time), 1, CAST(N'2022-05-24T22:27:13.393' AS DateTime), 1, 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (26, 2, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'22:35:00' AS Time), CAST(N'22:35:00' AS Time), 1, CAST(N'2022-05-24T22:35:14.060' AS DateTime), 1, 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (27, 42, CAST(N'2022-05-27T00:00:00.000' AS DateTime), CAST(N'22:37:00' AS Time), CAST(N'22:37:00' AS Time), 1, CAST(N'2022-05-24T22:37:39.913' AS DateTime), 1, 28)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (28, 42, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'22:40:00' AS Time), CAST(N'22:40:00' AS Time), 1, CAST(N'2022-05-24T22:40:45.383' AS DateTime), 1, 28)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (29, 42, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'11:02:00' AS Time), CAST(N'11:02:00' AS Time), 1, CAST(N'2022-05-25T11:02:30.830' AS DateTime), 0, -1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (30, 62, CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'21:24:00' AS Time), CAST(N'23:39:00' AS Time), 1, CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1, 61)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (31, 62, CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'21:24:00' AS Time), CAST(N'23:39:00' AS Time), 1, CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1, 61)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (32, 62, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'21:24:00' AS Time), CAST(N'23:39:00' AS Time), 1, CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1, 61)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (33, 62, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'21:24:00' AS Time), CAST(N'23:39:00' AS Time), 1, CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1, 61)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (34, 42, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'21:40:00' AS Time), CAST(N'23:45:00' AS Time), 1, CAST(N'2022-05-25T21:40:53.197' AS DateTime), 1, 28)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (35, 42, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'21:40:00' AS Time), CAST(N'23:45:00' AS Time), 1, CAST(N'2022-05-25T21:40:53.197' AS DateTime), 1, 28)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (36, 41, CAST(N'2022-04-27T00:00:00.000' AS DateTime), CAST(N'14:27:00' AS Time), CAST(N'17:42:00' AS Time), 1, CAST(N'2022-05-26T14:27:45.140' AS DateTime), 1, 28)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (37, 41, CAST(N'2022-04-27T00:00:00.000' AS DateTime), CAST(N'14:28:00' AS Time), CAST(N'18:43:00' AS Time), 1, CAST(N'2022-05-26T14:28:58.533' AS DateTime), 1, 29)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (38, 34, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'14:32:00' AS Time), CAST(N'15:37:00' AS Time), 1, CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1, 29)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (39, 34, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'14:32:00' AS Time), CAST(N'15:37:00' AS Time), 1, CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1, 29)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (40, 34, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'14:32:00' AS Time), CAST(N'15:37:00' AS Time), 1, CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1, 29)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy], [EmpId]) VALUES (41, 34, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'14:32:00' AS Time), CAST(N'15:37:00' AS Time), 1, CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1, 29)
SET IDENTITY_INSERT [dbo].[tblMeeting] OFF
GO
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (11, 1, 1, CAST(N'2022-04-05T07:27:04.867' AS DateTime), NULL)
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (12, 1, 0, CAST(N'2022-04-06T11:26:37.690' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (13, 1, 0, CAST(N'2022-04-08T11:58:20.360' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (14, 1, 0, CAST(N'2022-04-12T14:48:28.447' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (15, 1, 0, CAST(N'2022-04-13T16:42:54.237' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (16, 1, 0, CAST(N'2022-04-13T16:57:55.667' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (17, 1, 0, CAST(N'2022-04-16T10:50:40.540' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (18, 1, 0, CAST(N'2022-04-20T16:23:17.777' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (19, 1, 0, CAST(N'2022-04-27T17:49:35.577' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (20, 1, 0, CAST(N'2022-05-04T16:55:34.637' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (21, 1, 0, CAST(N'2022-05-19T04:29:16.603' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (23, 1, 1, CAST(N'2022-05-19T05:06:16.543' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (24, 1, 0, CAST(N'2022-05-23T14:05:23.053' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (25, 1, 1, CAST(N'2022-05-24T16:57:13.897' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (26, 1, 1, CAST(N'2022-05-24T17:05:14.557' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (27, 1, 1, CAST(N'2022-05-24T17:07:40.430' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (28, 1, 1, CAST(N'2022-05-24T17:10:45.893' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (29, 1, 0, CAST(N'2022-05-25T05:39:32.550' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (30, NULL, 1, CAST(N'2022-05-25T16:01:16.227' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (34, 1, 1, CAST(N'2022-05-25T16:10:56.113' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (37, 1, 1, CAST(N'2022-05-26T08:58:58.890' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (38, 1, 1, CAST(N'2022-05-26T09:02:44.123' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (30, 1, 1, CAST(N'2022-05-25T16:05:34.330' AS DateTime), N'Update The Record')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (36, 1, 1, CAST(N'2022-05-26T08:57:45.513' AS DateTime), N'Record Inserted')
GO
SET IDENTITY_INSERT [dbo].[tblMeetingPoint] ON 

INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (1, 6, N'testtt', CAST(N'2022-04-04T12:17:14.080' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (2, 6, N'testtt454', CAST(N'2022-04-04T12:17:44.003' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (3, 6, N'test', CAST(N'2022-04-04T12:53:32.353' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (4, 6, N'gerttt', CAST(N'2022-04-04T12:56:39.037' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (5, 10, N'testing', CAST(N'2022-04-04T13:15:32.933' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (7, 6, N'gfhgghggh', CAST(N'2022-04-04T13:53:11.390' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (8, 8, N'testttssss', CAST(N'2022-04-04T14:47:23.780' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (9, 8, N'errereer', CAST(N'2022-04-04T14:47:27.760' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (10, 8, N'rerere', CAST(N'2022-04-04T14:47:30.513' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (11, 10, N'Test', CAST(N'2022-04-04T09:56:59.137' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (12, 12, N'188', CAST(N'2022-04-06T11:26:37.680' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (13, 15, N'Test', CAST(N'2022-04-13T16:42:54.237' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (14, 16, N'tesrr', CAST(N'2022-04-13T16:57:55.670' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (15, 15, N'testfddf', CAST(N'2022-04-13T17:01:06.220' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (16, 15, N'', CAST(N'2022-04-13T17:01:07.100' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (17, 15, N'dddf', CAST(N'2022-04-13T17:01:10.520' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (18, 15, N'ghghgh', CAST(N'2022-04-14T09:04:50.180' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (25, 17, N'test123', CAST(N'2022-04-16T10:50:40.503' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (27, 23, N'uiop;;kl;klk;lk;;lkl;090980980', CAST(N'2022-05-19T10:36:12.513' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (28, 23, N'fgdggfggffg', CAST(N'2022-05-19T14:11:21.197' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (29, 27, N'testing', CAST(N'2022-05-24T22:37:39.913' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (30, 28, N'testing', CAST(N'2022-05-24T22:40:45.383' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (31, 30, N'Testing', CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (32, 31, N'Testing', CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (33, 32, N'Testing', CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (34, 33, N'Testing', CAST(N'2022-05-25T21:27:22.470' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (35, 34, N'testing56', CAST(N'2022-05-25T21:40:53.197' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (36, 35, N'testing56', CAST(N'2022-05-25T21:40:53.197' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (37, 36, N'Testing', CAST(N'2022-05-26T14:27:45.140' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (38, 37, N'test', CAST(N'2022-05-26T14:28:58.533' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (39, 38, N'Testing', CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (40, 39, N'Testing', CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (41, 40, N'Testing', CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (42, 41, N'Testing', CAST(N'2022-05-26T14:32:43.940' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblMeetingPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNotes] ON 

INSERT [dbo].[tblNotes] ([NotesId], [UserId], [NotesTypeId], [Notes], [OfficeUserId], [EmpId], [NotifyTypeId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 15, 1, N'test555', 1, 12, 1, 1, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblNotes] ([NotesId], [UserId], [NotesTypeId], [Notes], [OfficeUserId], [EmpId], [NotifyTypeId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 15, 2, N'test278', 9, 12, 1, 0, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblNotes] ([NotesId], [UserId], [NotesTypeId], [Notes], [OfficeUserId], [EmpId], [NotifyTypeId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 15, 3, N'test', 12, 1, 1, 1, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblNotes] ([NotesId], [UserId], [NotesTypeId], [Notes], [OfficeUserId], [EmpId], [NotifyTypeId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 15, 5, N'dgfdgdfgdf', 9, 1, 1, 0, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNotesType] ON 

INSERT [dbo].[tblNotesType] ([NotesTypeId], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, N'Notetype1', 1, 1, CAST(N'2022-04-16T16:03:00.800' AS DateTime))
INSERT [dbo].[tblNotesType] ([NotesTypeId], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2, N'Notetype2', 1, 1, CAST(N'2022-04-16T16:03:07.723' AS DateTime))
INSERT [dbo].[tblNotesType] ([NotesTypeId], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (3, N'Notetype3', 1, 1, CAST(N'2022-04-16T16:03:13.367' AS DateTime))
INSERT [dbo].[tblNotesType] ([NotesTypeId], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (4, N'Notetype4', 1, 1, CAST(N'2022-04-16T16:03:19.057' AS DateTime))
INSERT [dbo].[tblNotesType] ([NotesTypeId], [Description], [IsActive], [CreatedBy], [CreatedOn]) VALUES (5, N'Notetype5', 1, 1, CAST(N'2022-04-16T16:03:24.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblNotesType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOthers] ON 

INSERT [dbo].[tblOthers] ([OtherId], [UserId], [CASA3], [ContactId], [InsuranceGrp], [IsMedications], [IsDialysis], [IsOxygen], [IsAids], [IsCourtOrdered], [FlowRate], [ReunionLocations], [ShelterName], [TalCode], [Shelter], [Facility], [Room], [ServiceRequestDate], [CareDate], [DischargeDate], [Notes], [Allergies], [CreatedBy], [CreatedOn]) VALUES (1, 15, N'Test', N'Test', N'Test', 1, 1, 1, 0, 0, NULL, NULL, N'dssd', N'sdsd', N'sdsd', N'sdsdds', N'dsdsd', CAST(N'2022-04-20T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-04-20T00:00:00.000' AS DateTime), N'fgfgfgfgfgfg ghghgh', N'Test,sdsd', 1, CAST(N'2022-04-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOthers] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayer] ON 

INSERT [dbo].[tblPayer] ([PayerId], [PayerName], [BillToName], [Email], [Phone], [Fax], [NPI], [FedId], [ETIN], [Taxonomy], [MedicaidId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'Adult Protective Services', N'Adult Protective Services', N'rmelvin@mcboss.org', N'(609) 989-4320', N'(609) 989-4552', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-11T01:37:53.167' AS DateTime), 1)
INSERT [dbo].[tblPayer] ([PayerId], [PayerName], [BillToName], [Email], [Phone], [Fax], [NPI], [FedId], [ETIN], [Taxonomy], [MedicaidId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'Aetna', N'Aetna Better Health Of New Jersey', NULL, N'(855) 232-3596', N'(844) 797-7601', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-11T01:37:53.167' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblPayer] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayRate] ON 

INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (1, 0, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-14' AS Date), 1, N'', N'Test', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2022-03-29T06:46:59.423' AS DateTime), 0)
INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (2, 0, CAST(N'2022-03-22' AS Date), CAST(N'2022-03-23' AS Date), 1, N'', N'kk', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-03-29T06:55:22.637' AS DateTime), 0)
INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (3, 0, CAST(N'2022-03-09' AS Date), CAST(N'2022-03-16' AS Date), 1, N'jrtrdg', N'dhfhgcbfh', CAST(6 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(N'2022-04-03T12:46:01.053' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblPayRate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProvider] ON 

INSERT [dbo].[tblProvider] ([ProviderId], [UserId], [ProviderType], [Title], [FirstName], [LastName], [License], [LicenseExpires], [NPINumber], [Email], [Phone], [Fax], [Address], [State], [City], [ZipCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 15, 3, N'Mr', N'Navneet', N'Upadhyay', N'L1', CAST(N'2014-02-18T00:00:00.000' AS DateTime), N'', N'nav@gmail.com', N'123654', N'test', N'Sikandra', N'UP', NULL, N'282007', 0, CAST(N'2022-04-16T00:42:01.973' AS DateTime), 1)
INSERT [dbo].[tblProvider] ([ProviderId], [UserId], [ProviderType], [Title], [FirstName], [LastName], [License], [LicenseExpires], [NPINumber], [Email], [Phone], [Fax], [Address], [State], [City], [ZipCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, 15, 4, N'Mr', N'Navneet', N'Upadhyay', N'L1', CAST(N'2014-02-18T00:00:00.000' AS DateTime), N'123654', N'nav@gmail.com', N'123654', N'test', N'Sikandra', N'UP', N'Agra', N'282007', 0, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblProvider] ([ProviderId], [UserId], [ProviderType], [Title], [FirstName], [LastName], [License], [LicenseExpires], [NPINumber], [Email], [Phone], [Fax], [Address], [State], [City], [ZipCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (13, 16, 4, N'gupta', N'nancy', N'gupta', N'cxvf', CAST(N'2022-04-20T00:00:00.000' AS DateTime), N'', N'cxvxcv', N'cxvx', N'xcv', N'cxvcx', N'cxcx', NULL, N'kfjsjgdjg', 0, CAST(N'2022-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblProvider] ([ProviderId], [UserId], [ProviderType], [Title], [FirstName], [LastName], [License], [LicenseExpires], [NPINumber], [Email], [Phone], [Fax], [Address], [State], [City], [ZipCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (14, 47, 4, N'F', N'F', N'F', N'F', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'F', N'F', N'F', NULL, N'F', N'F', N'F', N'F', 0, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblProvider] OFF
GO
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (1, N'True', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (2, N'True', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (3, N'True', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (4, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (5, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (6, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (7, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (8, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (9, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (10, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (11, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (12, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (13, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (14, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (15, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (16, N'fghgfhfgh', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (17, N'', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (18, N'', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (19, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (20, N'False', 16)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (1, N'True', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (2, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (3, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (4, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (5, N'True', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (6, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (7, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (8, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (9, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (10, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (11, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (12, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (13, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (14, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (15, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (16, N'', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (17, N'', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (18, N'', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (19, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (20, N'False', 56)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (1, N'True', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (2, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (3, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (4, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (5, N'True', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (6, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (7, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (8, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (9, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (10, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (11, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (12, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (13, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (14, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (15, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (16, N'English', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (17, N'', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (18, N'', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (19, N'False', 1)
INSERT [dbo].[tblProvisions] ([ProvisionId], [ProvisionValue], [UserId]) VALUES (20, N'False', 1)
GO
SET IDENTITY_INSERT [dbo].[tblProvisionsMaster] ON 

INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, 1, N'1', N'Children', N'Require work with children', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.910' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2, 1, N'1', N'Smokers ', N'Smokers in household', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.910' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (3, 1, N'1', N'Pets', N'Require work with pets', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.910' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (4, 1, N'1', N'Cats', N'Cats in household', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.913' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (5, 1, N'1', N'Dogs', N'Dogs in household', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.913' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (6, 1, N'1', N' alt weekends', N'Require work alt weekends', NULL, 1, 1, CAST(N'2022-04-18T12:28:31.913' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (7, 1, N'1', N'Kosher Kitchen', N'Require work w Kosher Kitchen', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.903' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (8, 1, N'1', N'Hoyer Lift', N'Require experience with Hoyer Lift', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.907' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (9, 1, N'1', N'weekends only', N'Require work weekends only', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.907' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (10, 1, N'1', N' live-in', N'Require work live-in', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.907' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (11, 1, N'1', N'nights', N'Require work nights', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.910' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (12, 1, N'1', N'afternoons', N'Require work afternoons', NULL, 1, 1, CAST(N'2022-04-18T12:31:01.910' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (13, 1, N'1', N'Light Duty', N'Require work Light Duty', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.207' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (14, 1, N'1', N'Car', N'Car required', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.210' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (15, 1, N'1', N'English', N'Requires English', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.213' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (16, 1, N'2', N'Primary Language', N'Primary Language', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.217' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (17, 1, N'2', N'Second Language', N'Second Language', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.220' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (18, 1, N'2', N'Third Language', N'Third Language', NULL, 1, 1, CAST(N'2022-04-18T12:32:04.220' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (19, 1, N'1', N'mornings', N'Require work mornings', NULL, 1, 1, CAST(N'2022-04-18T12:32:37.970' AS DateTime))
INSERT [dbo].[tblProvisionsMaster] ([ProvisionId], [EntityType], [ProvisionType], [Title], [Description], [EmpDescription], [IsActive], [CreatedBy], [CreatedOn]) VALUES (20, 1, N'1', N' live-in on weekends', N'Require work live-in on weekends', NULL, 1, 1, CAST(N'2022-04-18T12:32:37.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblProvisionsMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServiceTask] ON 

INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 10, 1, 10, N'Test1', 1, CAST(N'2022-04-12T13:05:15.067' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T13:05:15.070' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 10, 3, 12, N'Test3', 1, CAST(N'2022-04-12T13:05:15.070' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (13, 11, 1, 12, N'Test12', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (14, 11, 2, 12, N'Test2', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (15, 11, 3, 25, N'Test35', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (16, 15, 1, 5, N'test 1', 1, CAST(N'2022-04-13T16:57:47.743' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (17, 15, 2, 6, N'test22', 1, CAST(N'2022-04-13T16:57:55.727' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (18, 15, 3, 12, NULL, 1, CAST(N'2022-04-13T16:58:05.797' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (19, 16, 1, 5, N'test21', 1, CAST(N'2022-04-20T16:25:48.563' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (20, 47, 6, 0, NULL, 0, CAST(N'2022-05-12T18:03:05.227' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblServiceTask] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStates] ON 

INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (1, N'AU', N'AUS', N'Australian Antarctic Territory')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (2, N'AU', N'AUS', N'Australian Capital Territory')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (3, N'AU', N'AUS', N'Christmas Island')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (4, N'AU', N'AUS', N'Cocos (Keeling) Islands')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (5, N'AU', N'AUS', N'Coral Sea Islands')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (6, N'AU', N'AUS', N'Heard Island and McDonald Islands')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (7, N'AU', N'AUS', N'Jervis Bay Territory')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (8, N'AU', N'AUS', N'New South Wales')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (9, N'AU', N'AUS', N'Norfolk Island')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (10, N'AU', N'AUS', N'Northern Territory')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (11, N'AU', N'AUS', N'Queensland')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (12, N'AU', N'AUS', N'South Australia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (13, N'AU', N'AUS', N'Tasmania')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (14, N'AU', N'AUS', N'Victoria')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (15, N'AU', N'AUS', N'Western Australia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (16, N'AL', N'USA', N'Alabama')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (17, N'AK', N'USA', N'Alaska')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (18, N'AZ', N'USA', N'Arizona')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (19, N'AR', N'USA', N'Arkansas')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (20, N'CA', N'USA', N'California')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (21, N'CO', N'USA', N'Colorado')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (22, N'CT', N'USA', N'Connecticut')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (23, N'DE', N'USA', N'Delaware')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (24, N'FL', N'USA', N'Florida')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (25, N'GA', N'USA', N'Georgia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (26, N'HI', N'USA', N'Hawaii')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (27, N'ID', N'USA', N'Idaho')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (28, N'IL', N'USA', N'Illinois')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (29, N'IN', N'USA', N'Indiana')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (30, N'IA', N'USA', N'Iowa')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (31, N'KS', N'USA', N'Kansas')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (32, N'KY', N'USA', N'Kentucky')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (33, N'LA', N'USA', N'Louisiana')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (34, N'ME', N'USA', N'Maine')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (35, N'MD', N'USA', N'Maryland')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (36, N'MA', N'USA', N'Massachusetts')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (37, N'MI', N'USA', N'Michigan')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (38, N'MN', N'USA', N'Minnesota')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (39, N'MS', N'USA', N'Mississippi')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (40, N'MO', N'USA', N'Missouri')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (41, N'MT', N'USA', N'Montana')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (42, N'NE', N'USA', N'Nebraska')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (43, N'NV', N'USA', N'Nevada')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (44, N'NH', N'USA', N'New Hampshire')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (45, N'NJ', N'USA', N'New Jersey')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (46, N'NM', N'USA', N'New Mexico')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (47, N'NY', N'USA', N'New York')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (48, N'NC', N'USA', N'North Carolina')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (49, N'ND', N'USA', N'North Dakota')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (50, N'OH', N'USA', N'Ohio')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (51, N'OK', N'USA', N'Oklahoma')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (52, N'OR', N'USA', N'Oregon')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (53, N'PA', N'USA', N'Pennsylvania')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (54, N'RI', N'USA', N'Rhode Island')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (55, N'SC', N'USA', N'South Carolina')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (56, N'SD', N'USA', N'South Dakota')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (57, N'TN', N'USA', N'Tennessee')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (58, N'TX', N'USA', N'Texas')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (59, N'UT', N'USA', N'Utah')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (60, N'VT', N'USA', N'Vermont')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (61, N'VA', N'USA', N'Virginia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (62, N'WA', N'USA', N'Washington')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (63, N'WV', N'USA', N'West Virginia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (64, N'WI', N'USA', N'Wisconsin')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (65, N'WY', N'USA', N'Wyoming')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (66, N'NZ', N'NZL', N'Auckland')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (67, N'NZ', N'NZL', N'New Plymouth')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (68, N'NZ', N'NZL', N'Wellington')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (69, N'NZ', N'NZL', N'Nelson')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (70, N'NZ', N'NZL', N'Marlborough')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (71, N'NZ', N'NZL', N'Westland')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (72, N'NZ', N'NZL', N'Canterbury')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (73, N'NZ', N'NZL', N'Otago')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (74, N'NZ', N'NZL', N'Southland')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (75, N'IE', N'IRL', N'Carlow')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (76, N'IE', N'IRL', N'Cavan')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (77, N'IE', N'IRL', N'Clare')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (78, N'IE', N'IRL', N'Cork')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (79, N'IE', N'IRL', N'Donegal')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (80, N'IE', N'IRL', N'Dublin')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (81, N'IE', N'IRL', N'Galway')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (82, N'IE', N'IRL', N'Kerry')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (83, N'IE', N'IRL', N'Kildare')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (84, N'IE', N'IRL', N'Kilkenny')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (85, N'IE', N'IRL', N'Laois')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (86, N'IE', N'IRL', N'Leitrim')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (87, N'IE', N'IRL', N'Limerick')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (88, N'IE', N'IRL', N'Longford')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (89, N'IE', N'IRL', N'Louth')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (90, N'IE', N'IRL', N'Mayo')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (91, N'IE', N'IRL', N'Meath')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (92, N'IE', N'IRL', N'Monaghan')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (93, N'IE', N'IRL', N'Offaly')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (94, N'IE', N'IRL', N'Roscommon')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (95, N'IE', N'IRL', N'Sligo')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (96, N'IE', N'IRL', N'Tipperary NR')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (97, N'IE', N'IRL', N'Tipperary SR')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (98, N'IE', N'IRL', N'Waterford')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (99, N'IE', N'IRL', N'Westmeath')
GO
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (100, N'IE', N'IRL', N'Wexford')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (101, N'IE', N'IRL', N'Wicklow')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (102, N'Us', N'USA', N'Columbia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (103, N'DC', N'USA', N'District of Columbia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (104, N'CA', N'CAN', N'Alberta')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (105, N'CA', N'CAN', N'British Columbia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (106, N'CA', N'CAN', N'Manitoba')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (107, N'CA', N'CAN', N'New Brunswick')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (108, N'CA', N'CAN', N'Newfoundland and Labrador')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (109, N'CA', N'CAN', N'Nova Scotia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (110, N'CA', N'CAN', N'Ontario')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (111, N'CA', N'CAN', N'Prince Edward Island')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (112, N'CA', N'CAN', N'Quebec')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (113, N'CA', N'CAN', N'Saskatchewan')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (114, N'PT', N'PRT', N'Lisbon')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (115, N'KR', N'KOR', N'Seoul')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (116, N'KR', N'KOR', N'North Chungcheong')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (117, N'KR', N'KOR', N'South Chungcheong')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (118, N'KR', N'KOR', N'Gangwon')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (119, N'KR', N'KOR', N'Gyeonggi')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (120, N'KR', N'KOR', N'North Gyeongsang')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (121, N'KR', N'KOR', N'South Gyeongsang')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (122, N'KR', N'KOR', N'North Jeolla')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (123, N'KR', N'KOR', N'South Jeolla')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (124, N'KR', N'KOR', N'Jeju')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (125, N'KR', N'KOR', N'Ulsan')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (126, N'SE', N'SWE', N'Angermannia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (127, N'SE', N'SWE', N'Bahusia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (128, N'SE', N'SWE', N'Blechingia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (129, N'SE', N'SWE', N'Dalecarlia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (130, N'SE', N'SWE', N'Dalia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (131, N'SE', N'SWE', N'Gestricia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (132, N'SE', N'SWE', N'Gotlandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (133, N'SE', N'SWE', N'Hallandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (134, N'SE', N'SWE', N'Helsingia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (135, N'SE', N'SWE', N'Herdalia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (136, N'SE', N'SWE', N'Jemtia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (137, N'SE', N'SWE', N'Lapponia Suecana')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (138, N'SE', N'SWE', N'Medelpadia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (139, N'SE', N'SWE', N'Nericia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (140, N'SE', N'SWE', N'Norbothnia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (141, N'SE', N'SWE', N'Olandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (142, N'SE', N'SWE', N'Ostrogothia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (143, N'SE', N'SWE', N'Scania')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (144, N'SE', N'SWE', N'Smolandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (145, N'SE', N'SWE', N'Sudermannia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (146, N'SE', N'SWE', N'Uplandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (147, N'SE', N'SWE', N'Wermlandia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (148, N'SE', N'SWE', N'Westmannia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (149, N'SE', N'SWE', N'Westrobothnia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (150, N'SE', N'SWE', N'Westrogothia')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (151, N'GB', N'GBR', N'Surrey')
INSERT [dbo].[tblStates] ([StateId], [StateCode], [CountryCode], [StateName]) VALUES (152, N'GB', N'GBR', N'Cornwall')
SET IDENTITY_INSERT [dbo].[tblStates] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubCategory] ON 

INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (1, N'CSP', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (2, N'DMAS 100', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (3, N'DMAS 225', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (4, N'DMAS 7', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (5, N'DMAS 97A/B', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (6, N'DMAS 98', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (7, N'Form 7A', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (8, N'Client Satisfaction Survey', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (9, N'Clinical Notes', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (10, N'Forms', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (11, N'Home Visit', 1)
INSERT [dbo].[tblSubCategory] ([SubCategoryItemId], [SubCategoryItemName], [IsActive]) VALUES (12, N'Other', 1)
SET IDENTITY_INSERT [dbo].[tblSubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTaskMaster] ON 

INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'10', N'Bed Bath', N'0', 1, CAST(N'2022-04-12T10:21:19.097' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'12', N'Shower', N'0', 1, CAST(N'2022-04-12T10:22:15.453' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'13', N'Sponge Bath', N'0', 1, CAST(N'2022-04-12T10:23:52.727' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, N'', N'', N'0', 1, CAST(N'2022-05-12T17:59:06.377' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, N'', N'', N'0', 1, CAST(N'2022-05-12T17:59:07.953' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, N'', N'', N'0', 1, CAST(N'2022-05-12T17:59:08.257' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, N'', N'', N'0', 1, CAST(N'2022-05-12T18:00:20.980' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, N'', N'', N'0', 1, CAST(N'2022-05-12T18:00:22.043' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblTaskMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, NULL, 1, N'admin', N'admin', NULL, NULL, NULL, N'ESC', NULL, N'Admin', NULL, NULL, N'9027972157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, NULL, 1, N'ashokkumarupbly81@gmail.com', N'TEST0023', NULL, NULL, N'TEST0023', N'Rajeev', N'Kumar', N'Patel', CAST(N'2022-04-14T13:06:33.000' AS DateTime), N'ashokkumarupbly81@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-06T18:37:47.283' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, NULL, 1, N'ashokkumarupbly81@gmail.com', N'Rakesh', NULL, NULL, N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', CAST(N'2022-04-06T13:09:23.000' AS DateTime), N'ashokkumarupbly81@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-06T18:40:07.697' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, NULL, 1, NULL, NULL, NULL, NULL, N'Rawat', N'Mayank', N'Kumar', N'Rawat', CAST(N'2022-04-06T10:23:42.000' AS DateTime), N'rakesh.gangwar@ardanuy.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 0, CAST(N'2022-04-07T15:58:12.543' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, NULL, 1, N'rakesh@gmail.com', N'TEST10023', NULL, NULL, N'TEST10023', N'Rakesh4555', N'kumar', N'Gangwar', CAST(N'2022-04-11T16:43:11.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T16:44:39.473' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, NULL, 1, N'rakesh@gmail.com', N'TEST10023', NULL, NULL, N'TEST10023', N'Rakesh4555455', N'kumar', N'Gangwar', CAST(N'2022-04-11T16:43:11.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T16:45:02.720' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, NULL, 1, NULL, NULL, NULL, NULL, N'TEST10023', N'Rakesh', N'kumar', N'Gangwar', CAST(N'1921-12-31T18:30:00.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 0, CAST(N'2022-04-07T22:37:44.580' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, NULL, 1, NULL, NULL, NULL, NULL, N'TEST100244', N'Rajeev', N'kumar', N'Gangwar', CAST(N'1921-12-31T18:30:00.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 0, CAST(N'2022-04-07T17:22:35.137' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, NULL, 1, NULL, NULL, NULL, NULL, N'test', N'bhashkar', NULL, N'pandey', CAST(N'2015-02-01T11:37:59.000' AS DateTime), N'bhashkar12@gmail.com', N'8726945902', N'9999999999', N'9595959595', N'78787878787', N'1', 1, 0, 7, 0, CAST(N'2022-04-08T11:41:21.770' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, NULL, 1, NULL, NULL, NULL, NULL, N'test', N'bhashkar', NULL, N'pandey', CAST(N'2015-02-01T11:37:59.000' AS DateTime), N'bhashkar12@gmail.com', N'8726945902', N'9999999999', N'9595959595', N'78787878787', N'1', 1, 0, 7, 1, CAST(N'2022-04-08T11:41:27.773' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, NULL, 1, N'sachinpandey123@gmail.com', N'test23', NULL, NULL, N'test23', N'sachin', NULL, N'pandey', CAST(N'2017-02-01T14:38:33.000' AS DateTime), N'sachinpandey123@gmail.com', N'9027972157', NULL, NULL, N'7894561233', N'3', 2, 3, 10, 1, CAST(N'2022-04-12T15:13:39.840' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, NULL, 1, NULL, NULL, NULL, NULL, N'Test1', N'Sachin', NULL, N'pandey', CAST(N'2015-01-31T18:30:00.000' AS DateTime), N'Sachinpandey12@gmail.com', N'0852963741', N'8888888800', N'0897458129', N'0852473698', N'1', 2, 0, 8, 0, CAST(N'2022-04-13T13:56:42.140' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (13, NULL, 1, NULL, NULL, NULL, NULL, N'Test1', N'Sachin', NULL, N'Kumar', CAST(N'2015-01-31T18:30:00.000' AS DateTime), N'Sachinpandey12@gmail.com', N'0852963741', N'8888888800', N'0897458129', N'0852473698', N'1', 2, 0, 8, 0, CAST(N'2022-04-13T13:57:21.653' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (14, NULL, 1, NULL, NULL, NULL, NULL, N'Test1', N'Sachin', NULL, N'Kumar', CAST(N'2015-01-31T18:30:00.000' AS DateTime), N'Sachinpandey12@gmail.com', N'0852963741', N'8888888800', N'0897458129', N'0852473698', N'1', 2, 0, 8, 0, CAST(N'2022-04-13T13:57:24.320' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (15, NULL, 1, NULL, NULL, NULL, NULL, N'Test1', N'Sachin', NULL, N'Kumar', CAST(N'2015-01-31T18:30:00.000' AS DateTime), N'Sachinpandey12@gmail.com', N'0852963741', N'8888888800', N'0897458129', N'0852473698', N'1', 2, 0, 8, 0, CAST(N'2022-04-13T13:57:30.460' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (16, NULL, 1, N'ashutoshpandey123@gmail.com', N'test123', NULL, NULL, N'test123', N'ashutosh', NULL, N'pandey', CAST(N'2017-03-02T16:14:18.000' AS DateTime), N'ashutoshpandey123@gmail.com', N'9027972157', NULL, NULL, N'8726955902', N'1', 2, 3, 9, 1, CAST(N'2022-04-20T16:19:26.383' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (17, NULL, 1, N'bettieatkins87@gmail.com', N'149422769', NULL, NULL, N'149422769', N'Atkins', NULL, N'Eugene', CAST(N'1951-07-06T18:30:00.000' AS DateTime), N'bettieatkins87@gmail.com', N'9027972157', NULL, NULL, N'(252)3825137', N'1', 2, 1, 1, 1, CAST(N'2022-04-23T02:36:50.583' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (18, NULL, 1, N'marceline.harrison@gracehcs.com', N'444974', NULL, NULL, N'444974', N'Burgess', NULL, N'Mellenie', CAST(N'2022-03-24T03:10:57.000' AS DateTime), N'marceline.harrison@gracehcs.com', N'9027972157', NULL, NULL, N'(225) 410-0150', N'2', 1, 1, 9, 1, CAST(N'2022-04-23T03:48:25.850' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (19, NULL, 1, N'bhashkar124gmail.com', N'5545', NULL, NULL, N'5545', N'Butler', NULL, N'Patricia', CAST(N'1936-04-04T18:30:00.000' AS DateTime), N'bhashkar124gmail.com', N'9027972157', NULL, NULL, N'(609) 610-8838', N'2', 1, 1, 12, 1, CAST(N'2022-04-23T04:05:35.403' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (20, NULL, 1, N'bhashkar102@gmail.com', N'545521', NULL, NULL, N'545521', N'Degazon', NULL, N'Alexand ', CAST(N'1937-03-25T18:30:00.000' AS DateTime), N'bhashkar102@gmail.com', N'9027972157', NULL, NULL, N'(516) 852-0875', N'1', 1, 8, 9, 1, CAST(N'2022-04-23T04:32:04.250' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (21, NULL, 1, N'bhashkar012@gmail.com', N'94154', NULL, NULL, N'94154', N'Diston', NULL, N'Vinnie', CAST(N'1931-10-13T18:30:00.000' AS DateTime), N'bhashkar012@gmail.com', N'9027972157', NULL, NULL, N'(609) 815-5485', N'2', 1, 8, 9, 1, CAST(N'2022-04-23T04:40:52.077' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (22, NULL, 1, NULL, NULL, NULL, NULL, N'888-0-2525', N'Navneet', NULL, N'Upadhyay', CAST(N'2022-08-16T18:30:00.000' AS DateTime), N'test@gmail.com', N'999999999', N'9871453', N'000000000', N'78965423', N'1', 1, 0, 1, 0, CAST(N'2022-04-26T10:21:47.073' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (23, NULL, 2, NULL, NULL, NULL, NULL, N'111-00-9876', N'Rahul', NULL, N'sharma', CAST(N'2022-04-28T05:56:44.000' AS DateTime), N't@gmail.com', N'999999999', N'33333333', N'99999999999999999999', N'999999999999', N'1', 1, 0, 22, 0, CAST(N'2022-04-26T11:29:23.470' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (24, NULL, 3, N't1@gmail.com', N'000-00-0000', NULL, NULL, N'000-00-0000', N'Neha', NULL, N'Sharma', CAST(N'2022-04-10T07:05:57.000' AS DateTime), N't1@gmail.com', N'9027972157', NULL, NULL, N'999999999999', N'1', 1, 1, 22, 1, CAST(N'2022-04-26T12:37:56.840' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (25, NULL, 3, N't2@gmail.com', N'000-00-0000', NULL, NULL, N'000-00-0000', N'rakha', NULL, N'Sharma', CAST(N'2022-04-22T10:46:51.000' AS DateTime), N't2@gmail.com', N'9027972157', NULL, NULL, N'999999999999', N'1', 1, 1, 22, 1, CAST(N'2022-04-26T16:26:11.007' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (26, NULL, 3, N't2@gmail.com', N'000-00-0000', NULL, NULL, N'000-00-0000', N'rakha', NULL, N'Sharma', CAST(N'2022-04-22T10:46:51.000' AS DateTime), N't2@gmail.com', N'9027972157', NULL, NULL, N'999999999999', N'1', 1, 1, 22, 1, CAST(N'2022-04-26T16:29:51.533' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (27, NULL, 2, NULL, NULL, NULL, NULL, N'599-42-9229', N'Yolanda', NULL, N'Acosta De Osorio', CAST(N'1960-12-29T18:30:00.000' AS DateTime), N'acostaemb@gmail.com', N'(609) 328-2365', N'(609) 328-2365', N'(609) 328-2365', N'(609) 328-2365', N'2', 1, 0, 1, 1, CAST(N'2022-04-27T01:00:54.437' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (28, NULL, 2, NULL, NULL, NULL, NULL, N'291-15-9616', N'Afful', NULL, N'John ', CAST(N'1966-06-05T18:30:00.000' AS DateTime), N'AffulJohn12@gmail.com', N'(614) 515-8990', N'(614) 515-8990', N'(614) 515-8990', N'(614) 515-8990', N'1', 2, 0, 27, 1, CAST(N'2022-04-27T01:48:47.207' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (29, NULL, 2, NULL, NULL, NULL, NULL, N'594-46-4738', N'Nirva Bien', NULL, N'Aime', CAST(N'2021-08-30T17:30:59.000' AS DateTime), N'nirvabien64@yahoo.com', N'(609) 551-5333', N'(609) 551-5333', N'(609) 551-5333', N'(609) 551-5333', N'1', 1, 0, 1, 1, CAST(N'2022-04-27T17:49:03.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (30, NULL, 2, NULL, NULL, NULL, NULL, N'846-53-2233', N'	Judette Chery', NULL, N'Alfred-Saintima', CAST(N'1983-12-15T18:30:00.000' AS DateTime), N'judanie83@gmail.com', N'(267) 333-9186', N'(267) 333-9186', N'(267) 333-9186', N'(267) 333-9186', N'9', 6, 0, 1, 1, CAST(N'2022-04-30T01:43:38.340' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (31, NULL, 2, NULL, NULL, NULL, NULL, N'448-45-8043', N'Celine', NULL, N'Amenig', CAST(N'1973-03-13T18:30:00.000' AS DateTime), N'bumsdlu131@outlook.com', N'(609) 216-8822', N'(609) 216-8822', N'(609) 216-8822', N'(609) 216-8822', N'9', 6, 0, 1, 1, CAST(N'2022-04-30T01:57:26.743' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (32, NULL, 2, NULL, NULL, NULL, NULL, N'153-98-1429', N'Mentee ', NULL, N'Awie', CAST(N'1978-03-24T18:30:00.000' AS DateTime), N'awiementee1978@gmail.com', N'(609) 575-2009', N'(609) 575-2009', N'(609) 575-2009', N'(609) 575-2009', N'9', 5, 0, 1, 1, CAST(N'2022-05-02T12:09:15.567' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (33, NULL, 2, NULL, NULL, NULL, NULL, N'153-98-1429', N'Mentee ', NULL, N'Awie', CAST(N'1978-03-24T18:30:00.000' AS DateTime), N'awiementee1978@gmail.com', N'(609) 575-2009', N'(609) 575-2009', N'(609) 575-2009', N'(609) 575-2009', N'9', 1, 0, 1, 1, CAST(N'2022-05-05T16:42:06.960' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (34, NULL, 3, N'desiree1@apatternplus.com', N'152-68-0303', NULL, NULL, N'152-68-0303', N'Tracey', NULL, N'Jenkins', CAST(N'1965-02-27T18:30:00.000' AS DateTime), N'desiree1@apatternplus.com', N'9027972157', NULL, NULL, N'(609) 540-7413', N'9', 5, 18, 1, 1, CAST(N'2022-05-05T16:57:38.507' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (35, NULL, 2, NULL, NULL, NULL, NULL, N'TEST10023', N'Rakesh', N'kumar', N'Gangwar', CAST(N'2022-05-16T17:28:50.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', N'9027972157', N'9027972157', N'9027972157', N'9', 5, 0, 28, 0, CAST(N'2022-05-05T23:00:05.980' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (36, NULL, 2, NULL, NULL, NULL, NULL, N'138-80-9360', N'Deja', NULL, N'Boggs', CAST(N'1986-03-11T18:30:00.000' AS DateTime), N'dejalboggsinc@gmail.com', N'(609) 376-1780', N'(609) 376-1780', N'(609) 376-1780', N'(609) 376-1780', N'9', 5, 0, 1, 1, CAST(N'2022-05-05T17:52:44.363' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (37, NULL, 2, NULL, NULL, NULL, NULL, N'138-80-9360', N'Deja', NULL, N'Boggs', CAST(N'1986-03-11T18:30:00.000' AS DateTime), N'dejalboggsinc@gmail.com', N'(609) 376-1780', N'(609) 376-1780', N'(609) 376-1780', N'(609) 376-1780', N'9', 5, 0, 1, 0, CAST(N'2022-05-05T17:52:52.037' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (39, NULL, 3, N'scott@horizonblue.com', N'2523452', NULL, NULL, N'2523452', N'Tyrus', NULL, N'Jones', CAST(N'1964-10-13T18:30:00.000' AS DateTime), N'scott@horizonblue.com', N'9027972157', NULL, NULL, N'(609) 802-5087', N'8', 5, 18, 1, 1, CAST(N'2022-05-10T15:23:33.270' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (40, NULL, 3, N'Elizabeth@gmail.com', N'48549694', NULL, NULL, N'48549694', N'Elizabeth', NULL, N'Wilson', CAST(N'1953-10-13T18:30:00.000' AS DateTime), N'Elizabeth@gmail.com', N'9027972157', NULL, NULL, N'973-856-1434', N'9', 5, 18, 1, 1, CAST(N'2022-05-11T01:29:17.357' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (41, NULL, 3, N'Lance123@.com', N'157-40-2469', NULL, NULL, N'157-40-2469', N'Lance', NULL, N'	White', CAST(N'1949-01-19T18:30:00.000' AS DateTime), N'Lance123@.com', N'9027972157', NULL, NULL, N'	(470) 180-4537', N'8', 5, 18, 1, 1, CAST(N'2022-05-11T01:33:47.593' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (42, NULL, 3, N'RScott Dingwall142@gmail.com', N'541621', NULL, NULL, N'541621', N'Norman', NULL, N'	Hartig', CAST(N'1955-06-22T18:30:00.000' AS DateTime), N'RScott Dingwall142@gmail.com', N'9027972157', NULL, NULL, N'(844) 444- 4410', N'8', 5, 18, 1, 1, CAST(N'2022-05-11T01:37:53.167' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (43, NULL, 2, NULL, NULL, NULL, NULL, N'193-52-3259', N'Madelyn', NULL, N'Dixon', CAST(N'1960-12-03T18:30:00.000' AS DateTime), N'rabvz60@gmail.com', N'(609) 647-7374', N'(609) 647-7374', N'(609) 647-7374', N'(609) 647-7374', N'9', 5, 0, 1, 1, CAST(N'2022-05-11T01:44:58.517' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (44, NULL, 2, NULL, NULL, NULL, NULL, N'137-25-6643', N'	Jametta ', NULL, N'Bush', CAST(N'1945-06-25T17:30:00.000' AS DateTime), N'lightgirl002004@yahoo.com', N'(267) 622-0801', N'(267) 622-0801', N'(267) 622-0801', N'(267) 622-0801', N'8', 6, 0, 1, 1, CAST(N'2022-05-11T01:54:43.487' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (45, NULL, 2, NULL, NULL, NULL, NULL, N'642-91-8255', N'Frances', NULL, N'Barber', CAST(N'1978-05-29T18:30:00.000' AS DateTime), N'francesbarber650@gmail.com', N'(609) 456-8370', N'(609) 456-8370', N'(609) 456-8370', N'(609) 456-8370', N'9', 6, 0, 1, 1, CAST(N'2022-05-11T01:59:07.737' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (46, NULL, 2, NULL, NULL, NULL, NULL, N'015-02-4402', N'	Desane', NULL, N'Jean ', CAST(N'2029-12-01T00:00:00.000' AS DateTime), N'paulwilfortcanes@gmail.com', N'(609) 331-7702', N'(609) 331-7702', N'(609) 331-7702', N'(609) 331-7702', N'9', 5, 0, 1, 1, CAST(N'2022-05-11T16:12:11.887' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (47, NULL, 2, NULL, NULL, NULL, NULL, N'895-37-2366', N'Davis', NULL, N'Rosalie ', CAST(N'2030-07-01T00:00:00.000' AS DateTime), N'rosaliehosang@gmail.com', N'(609) 331-0219', N'(609) 331-0219', N'(609) 331-0219', N'(609) 331-0219', N'9', 5, 0, 1, 1, CAST(N'2022-05-11T16:16:26.010' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (49, NULL, 3, N'ashokkumarupbly81@gmail.com', NULL, N'Test', N'Mr', NULL, N'Rakesh', NULL, N'Gangwar', NULL, N'ashokkumarupbly81@gmail.com', N'9027972157', N'9027972157', NULL, NULL, N'0', 0, 0, 0, 1, CAST(N'2022-05-17T13:56:22.623' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (52, NULL, 8, NULL, NULL, NULL, NULL, N'Rakesh', N'Rakesh', NULL, N'Gangwar', CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'9027972157', NULL, NULL, NULL, N'8', 0, 0, 0, 1, CAST(N'2022-05-18T10:55:23.820' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (53, NULL, 8, NULL, NULL, NULL, NULL, N'Rakesh', N'Rakesh', NULL, N'Gangwar', CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'9027972157', NULL, NULL, NULL, N'8', 0, 0, 0, 1, CAST(N'2022-05-18T10:55:52.627' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (55, NULL, 8, NULL, NULL, NULL, NULL, N'Rakesh', N'Rakesh', N'Rakesh', N'Gangwar', CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'9027972157', NULL, NULL, NULL, N'8', 0, 0, NULL, 1, CAST(N'2022-05-18T11:19:12.463' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (56, NULL, 9, NULL, NULL, NULL, NULL, NULL, N'Rakesh', NULL, N'Gangwar', CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'9027972157', NULL, NULL, NULL, N'8', 1, 1, 24, 1, CAST(N'2022-05-18T11:41:24.577' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (61, N'Test', 8, NULL, NULL, NULL, NULL, N'Rakesh', N'Rakesh', NULL, N'Gangwar', CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'9027972157', NULL, NULL, NULL, N'8', 0, 0, NULL, 1, CAST(N'2022-05-20T10:38:58.477' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [Organization], [Title], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (62, NULL, 9, N'chirag200493@gmail.com', N'876-87-1234', NULL, NULL, N'876-87-1234', N'chirag', N'M', N'Parmar', CAST(N'1993-04-20T00:00:00.000' AS DateTime), N'chirag200493@gmail.com', NULL, NULL, NULL, NULL, N'8', 6, 17, 24, 1, CAST(N'2022-05-23T18:10:52.900' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
INSERT [dbo].[tblUserCommunity] ([CommunityId], [UserId], [MutualId]) VALUES (1, 15, NULL)
GO
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'SuperAdmin', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'Administrators', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'Coordinators', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Human Resources', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, N'Nursing Supervisors', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, N'Office Staff', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, N'Billing', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, N'Employee', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [Description], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, N'Client', NULL, 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
ALTER TABLE [dbo].[tblCategory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMaster] ADD  CONSTRAINT [DF_tblMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsReminders]  DEFAULT ((0)) FOR [IsReminders]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsInstructionscheck]  DEFAULT ((0)) FOR [IsInstructionscheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_Isadministrationcheck]  DEFAULT ((0)) FOR [Isadministrationcheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_Isselfadministercheck]  DEFAULT ((0)) FOR [Isselfadministercheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblMeeting] ADD  CONSTRAINT [DF_tblMeeting_IsStatus]  DEFAULT ((1)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[tblSubCategory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblContact]  WITH CHECK ADD  CONSTRAINT [FK_tblContact_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblContact] CHECK CONSTRAINT [FK_tblContact_tblUser]
GO
ALTER TABLE [dbo].[tblDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_tblDiagnosis_tblDiagnosisMaster] FOREIGN KEY([DxId])
REFERENCES [dbo].[tblDiagnosisMaster] ([DxId])
GO
ALTER TABLE [dbo].[tblDiagnosis] CHECK CONSTRAINT [FK_tblDiagnosis_tblDiagnosisMaster]
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
ALTER TABLE [dbo].[tblMedication]  WITH CHECK ADD  CONSTRAINT [FK_tblClientMedication_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblMedication] CHECK CONSTRAINT [FK_tblClientMedication_tblUser]
GO
ALTER TABLE [dbo].[tblMeetingPoint]  WITH CHECK ADD  CONSTRAINT [FK_tblMeetingPoint_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblMeetingPoint] CHECK CONSTRAINT [FK_tblMeetingPoint_tblMeeting]
GO
ALTER TABLE [dbo].[tblNotes]  WITH CHECK ADD  CONSTRAINT [FK_tblNotes_tblNotesType] FOREIGN KEY([NotesTypeId])
REFERENCES [dbo].[tblNotesType] ([NotesTypeId])
GO
ALTER TABLE [dbo].[tblNotes] CHECK CONSTRAINT [FK_tblNotes_tblNotesType]
GO
ALTER TABLE [dbo].[tblPayerRate]  WITH CHECK ADD  CONSTRAINT [FK_tblPayerRate_tblPayer] FOREIGN KEY([PayerId])
REFERENCES [dbo].[tblPayer] ([PayerId])
GO
ALTER TABLE [dbo].[tblPayerRate] CHECK CONSTRAINT [FK_tblPayerRate_tblPayer]
GO
ALTER TABLE [dbo].[tblProvider]  WITH CHECK ADD  CONSTRAINT [FK_tblProvider_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblProvider] CHECK CONSTRAINT [FK_tblProvider_tblUser]
GO
ALTER TABLE [dbo].[tblServiceTask]  WITH CHECK ADD  CONSTRAINT [FK_tblServiceTask_tblTaskMaster] FOREIGN KEY([TaskId])
REFERENCES [dbo].[tblTaskMaster] ([TaskId])
GO
ALTER TABLE [dbo].[tblServiceTask] CHECK CONSTRAINT [FK_tblServiceTask_tblTaskMaster]
GO
/****** Object:  StoredProcedure [dbo].[AddHHAClockInOutDetails]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec AddHHAClockInOutDetails 10,'2022-05-25 15:55:06.233','test'
CREATE PROCEDURE [dbo].[AddHHAClockInOutDetails]

@UserId bigint,
@ClockInTime Datetime = Null,
@ClockOutTime  Datetime = Null,
@Notes Varchar(Max),
@Type int

AS
BEGIN

	SET NOCOUNT ON;
	IF (EXISTS(select UserId from TblEmployee where UserId = @UserId AND EmpType = (select TypeId from tblEmpType where TypeName = 'HHA')))
	BEGIN
		
		IF @Type = 1
		BEGIN

			INSERT INTO TblClockInOut
			(
				UserId,
				ClockInTime,
				Notes
			)
			Values
			(
				@UserId,
				@ClockInTime,
				@Notes
			)

		END
		ELSE
		BEGIN

			Declare @ClockId  INT = (SELECT TOP 1 ClockId FROM TblClockInOut order by 1 desc)
			UPDATE TblClockInOut SET ClockOutTime = @ClockOutTime,Notes = @Notes where ClockId = @ClockId
		END

	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[AvailbilityProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailbilityProc]      
@FromDate date=null,      
@ToDate date=null,      
@StartTime time=null,      
@Endtime time=null,      
@EmpType int=null,      
@CaseId int=null,      
@ProvisionList varchar(50)=null      
    
AS     
    
    
BEGIN    
     
IF (@EmpType =0)     
BEGIN      
Select @EmpType=NULL    
END    
    
IF @ProvisionList Is NULL OR  @ProvisionList=''    
BEGIN      
Select @ProvisionList=STRING_AGG(AvailabilityId, ',') FROM tblAvailabilityMaster     
END  
  
  
--select (ISNULL(xy.FirstName,'') + ' ' +   ISNULL(xy.MiddleName,'') + ' ' + ISNULL(xy.LastName,'') ) as EName,      
--xy.CellPhone,xz.Address,xz.Latitude,xz.Longitude,zx.EmpType,yz.AvailbilityId,  
--xy.UserId as EmpId,0 MeetingId, 0 ClientId ,getDate() as MeetingDate,null StartTime,null EndTime,0 as IsStatus,  
--null CreatedOn,0 CreatedBy,null CName Into #temp  
--from tblUser as xy Left join tblEmpClientMeeting y on xy.UserId=y.EmpId and xy.IsActive=1  and y.EmpId is null  
--Left join tblAddress  xz on xy.UserId =xz.UserId      
--inner join tblEmployee zx on xy.UserId=zx.UserId     
--inner join tblEmpAvailbility yz on xy.UserId=yz.EmpId AND yz.AvailbilityId IN  (select value FROM STRING_SPLIT(@ProvisionList,','))       
--Where zx.EmpType=CASE WHEN @EmpType IS NULL THEN zx.EmpType ELSE @EmpType END     
  
  
  
--select * from #Temp  
      
 IF @FromDate Is NULL      
 BEGIN      
      
 --Select (ISNULL(xy.FirstName,'') + ' ' +   ISNULL(xy.MiddleName,'') + ' ' + ISNULL(xy.LastName,'') ) as EName,      
 --xy.CellPhone,xz.Address,xz.Latitude,xz.Longitude,zx.EmpType,yz.AvailbilityId,yx.*   
   
   
 --from tblUser xy inner join    
 --(    
 --SELECT x.EmpId,y.*,(ISNULL(xx.FirstName,'') + ' ' +   ISNULL(xx.MiddleName,'') + ' ' + ISNULL(xx.LastName,'') ) as CName from  tblEmpClientMeeting x inner join    
 --(--meetingList start    
    
 --SELECT * from tblMeeting Where ((CAST(StartTime AS time) not between CAST(@StartTime AS time)  and CAST(@Endtime AS time)) and (CAST(EndTime AS time) not between       
 --CAST(@StartTime AS time)  and CAST(@Endtime AS time)))    
    
 ----meetingList end    
 --)y on x.Meetingid=y.MeetingId    
 --inner join tblUser as xx on y.ClientId=xx.UserId    
 --) as yx on xy.UserId=yx.EmpId    
 --Left join tblAddress  xz on xy.UserId =xz.UserId      
 --inner join tblEmployee zx on xy.UserId=zx.UserId     
 --inner join tblEmpAvailbility yz on xy.UserId=yz.EmpId AND  yz.AvailbilityId IN  (select value FROM STRING_SPLIT(@ProvisionList,','))       
 --Where zx.EmpType=CASE WHEN @EmpType IS NULL THEN zx.EmpType ELSE @EmpType END      
   
Select x.UserId,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) as EName,       
x.CellPhone,z.Address,z.ZipCode,z.Latitude,z.Longitude,y.EmpType,
(ISNULL(q.FirstName,'') + ' ' +   ISNULL(q.MiddleName,'') + ' ' + ISNULL(q.LastName,'') ) as CName,p.*,
IsNULL(r.AvailbilityId,0)  as AvailbilityId 
from tblUser x inner join tblEmployee y on x.UserId=y.UserId  
Left join tblAddress  z on y.UserId =z.UserId
Left join tblMeeting p on y.UserId=p.EmpId 
Left join tblUser q on p.ClientId=q.UserId 
Left join tblEmpAvailbility r on x.UserId=r.EmpId 
Where
(((CAST(p.StartTime AS time) not between CAST(@StartTime AS time)  and CAST(@Endtime AS time)) and 
(CAST(p.EndTime AS time) not between   CAST(@StartTime AS time)  and CAST(@Endtime AS time))) OR p.MeetingId is null)
AND (r.AvailbilityId is null or r.AvailbilityId IN  (select value FROM STRING_SPLIT(@ProvisionList,','))) AND 
y.EmpType=(CASE WHEN @EmpType IS NULL THEN y.EmpType ELSE @EmpType END) and z.Latitude is Not null 
  
END       
      
ELSE      
      
BEGIN      
     
    
--Select (ISNULL(xy.FirstName,'') + ' ' +   ISNULL(xy.MiddleName,'') + ' ' + ISNULL(xy.LastName,'') ) as EName,      
--xy.CellPhone,xz.Address,xz.Latitude,xz.Longitude,zx.EmpType,yz.AvailbilityId,yx.*    
  
--from tblUser xy inner join    
--(    
--SELECT x.EmpId,y.*,(ISNULL(xx.FirstName,'') + ' ' +   ISNULL(xx.MiddleName,'') + ' ' + ISNULL(xx.LastName,'') ) as CName from  tblEmpClientMeeting x inner join    
--(--meetingList start    
--SELECT * from tblMeeting Where CAST(MeetingDate AS DATE) not between CAST(@FromDate AS DATE)  and CAST(@ToDate AS DATE)       
--union       
--SELECT * from tblMeeting x Where (CAST(x.MeetingDate AS DATE) between CAST(@ToDate AS DATE)  and CAST(@ToDate AS DATE))   AND       
--((CAST(x.StartTime AS time) not between CAST(@StartTime AS time)  and CAST(@Endtime AS time)) and (CAST(EndTime AS time) not between   CAST(@StartTime AS time)  and CAST(@Endtime AS time)))    
----meetingList end    
--)y on x.Meetingid=y.MeetingId    
--inner join tblUser as xx on y.ClientId=xx.UserId    
--) as yx on xy.UserId=yx.EmpId    
--Left join tblAddress  xz on xy.UserId =xz.UserId      
--inner join tblEmployee zx on xy.UserId=zx.UserId     
--inner join tblEmpAvailbility yz on xy.UserId=yz.EmpId AND  yz.AvailbilityId IN  (select value FROM STRING_SPLIT(@ProvisionList,','))       
--Where zx.EmpType=CASE WHEN @EmpType IS NULL THEN zx.EmpType ELSE @EmpType END   


Select x.UserId,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) as EName,       
x.CellPhone,z.Address,z.ZipCode,z.Latitude,z.Longitude,y.EmpType,
(ISNULL(q.FirstName,'') + ' ' +   ISNULL(q.MiddleName,'') + ' ' + ISNULL(q.LastName,'') ) as CName,p.*,
IsNULL(r.AvailbilityId,0)  as AvailbilityId 
from tblUser x inner join tblEmployee y on x.UserId=y.UserId  
Left join tblAddress  z on y.UserId =z.UserId
Left join tblMeeting p on y.UserId=p.EmpId 
Left join tblUser q on p.ClientId=q.UserId 
Left join tblEmpAvailbility r on x.UserId=r.EmpId 
Where
(((CAST(p.MeetingDate AS DATE) not between CAST(@FromDate AS DATE)  and CAST(@ToDate AS DATE))   AND       
(CAST(p.StartTime AS time) not between CAST(@StartTime AS time)  and CAST(@Endtime AS time)) and 
(CAST(p.EndTime AS time) not between   CAST(@StartTime AS time)  and CAST(@Endtime AS time))) OR p.MeetingId is null)
AND (r.AvailbilityId is null or r.AvailbilityId IN  (select value FROM STRING_SPLIT(@ProvisionList,','))) AND 
y.EmpType=(CASE WHEN @EmpType IS NULL THEN y.EmpType ELSE @EmpType END)  and z.Latitude is Not null







      
END       
      
      
  
  
  
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[ClientProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
          
CREATE PROCEDURE [dbo].[ClientProc]            
(            
@flag int=null,            
@SupervisorId int=NULL,            
@State varchar(50)=NULL,            
@ClientId int=NULL,      
@IsActive int=NULL,       
@CreatedOn datetime=NULL,            
@CreatedBy int=NULL            
)            
AS            
            
BEGIN            
Declare @currentDate datetime=GetDate()        
IF @flag=1            
BEGIN         
      
Select x.UserId as ClientId,x.FirstName,x.MiddleName,x.LastName,x.CellPhone,        
IsNUll(y.MeetingId,0) as MeetingId,y.MeetingDate,y.StartTime,y.EndTime,             
y.EmpId,p.FirstName +' ' + ISNULL(p.MiddleName,' ')+' ' + p.LastName as EmpName        
from tblUser x inner join tblClient xx on x.UserId=xx.UserId        
Left Join tblMeeting y on xx.UserId=y.ClientId and y.IsStatus<>0            
Left join tblUser p on y.EmpId=p.UserId            
Left join tblAddress xy on x.UserId=xy.UserId             
Where x.SupervisorId=(CASE WHEN @SupervisorId =0            
THEN x.SupervisorId ELSE @SupervisorId END)            
AND x.IsActive=(CASE WHEN @IsActive =0 THEN x.IsActive ELSE @IsActive END)            
AND          
ISNULL(xy.State,'')=(CASE WHEN (@State IS NULL OR @State ='') THEN ISNULL(xy.State,'') ELSE @State END) 
ORDER BY TRIM(x.LastName)
      
--Select x.UserId as ClientId,x.FirstName,x.MiddleName,x.LastName,x.CellPhone,        
--IsNUll(y.MeetingId,0) as MeetingId,y.MeetingDate,y.StartTime,y.EndTime,             
--IsNUll(z.EmpId,0) as EmpId,p.FirstName +' ' + ISNULL(p.MiddleName,' ')+' ' + p.LastName as EmpName        
--from tblUser x inner join tblClient xx on x.UserId=xx.UserId        
--Left Join tblMeeting y on xx.UserId=y.ClientId and y.IsStatus<>0 Left join tblEmpClientMeeting z             
--on y.MeetingId=z.MeetingId Left join tblUser p on z.EmpId=p.UserId            
--Left join tblAddress xy on x.UserId=xy.UserId             
--Where           
--x.SupervisorId=(CASE WHEN @SupervisorId =0            
--THEN x.SupervisorId ELSE @SupervisorId END)            
--AND            
--x.IsActive=(CASE WHEN @IsActive =0 THEN x.IsActive ELSE @IsActive END)            
--AND          
--ISNULL(xy.State,'')=(CASE WHEN (@State IS NULL OR @State ='') THEN ISNULL(xy.State,'') ELSE @State END)            
            
            
END            
     
 /****************************************************************************************/    
    
IF @flag=2           
BEGIN       
    
Select x.*,y.LastName ELastName,y.FirstName EFirstName,y.CellPhone ECellPhone,z.EmpType,p.TypeName     
from  tblMeeting x inner join tblUser y on x.EmpId=y.UserId inner join tblEmployee z on y.UserId=z.UserId     
inner join tblEmpType p on z.EmpType=p.TypeId where CAST(x.MeetingDate AS DATE) >= CAST(@currentDate AS DATE) and x.ClientId=@ClientId    
  
    
END    
    
    
            
            
END
GO
/****** Object:  StoredProcedure [dbo].[EmergencyInfoProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmergencyInfoProc]    
(    
@type int=NULL,
@UserId int=NULL,
@FirstName varchar(50)=NULL,
@LastName varchar(50)=NULL,
@Relationship varchar(50)=NULL,
@Phone varchar(50)=NULL,
@Email varchar(50)=NULL,
@Title varchar(50)=NULL,
@License varchar(50)=NULL,
@LicenseEx datetime=NULL,
@NPI varchar(50)=NULL,
@Fax varchar(50)=NULL,
@address varchar(255)=NULL,
@State varchar(50)=NULL,
@city  varchar(50)=NULL,
@ZipCode  varchar(50)=NULL,
@IsActive tinyint=NULL,
@CreatedOn datetime=NULL,
@CreatedBy int=NULL,
@ID int
)  
AS  
  Begin

BEGIN TRY

  BEGIN TRANSACTION SCHEDUL
  if(@type<>0)
  begin
  
   if not Exists(select * from dbo.tblContact where UserId=@UserId and ContactType=@type)
   begin
    if(@type<3)
   begin
   insert into dbo.tblContact(UserId,ContactType,ContactName,Relationship,ContactPhone,ContactEmail
      ,IsActive,CreatedOn,CreatedBy) values (@UserId,@type,@FirstName,@Relationship,@Phone
	  ,@Email,@IsActive,@CreatedOn,@CreatedBy)
	  end
   end

   if not Exists(select * from dbo.tblProvider where UserId=@UserId and  ProviderType=@type)
   begin
   if(@type>2)
   begin
   insert into dbo.tblProvider(UserId,ProviderType,Title,FirstName,LastName,License,LicenseExpires,NPINumber
      ,Email,Phone,Fax,Address,State,City,ZipCode,IsActive,CreatedOn,CreatedBy) values 
	  (@UserId,@type,@Title,@FirstName,@LastName,@License,@LicenseEx,@NPI,@Email,@Phone,@Fax,@address,@State,@city
	  ,@ZipCode,@IsActive,@CreatedOn,@CreatedBy)
	  end
   end

    if Exists(select * from dbo.tblContact where ContactId=@ID)
   begin   
	  update dbo.tblContact set ContactName=@FirstName,Relationship=@Relationship,ContactPhone=@Phone,
	  ContactEmail=@Email,IsActive=@IsActive where ContactId=@ID and UserId=@UserId
   end

   if  Exists(select * from dbo.tblProvider where ProviderId=@ID)
   begin   
	   update dbo.tblProvider set Title=@Title,FirstName=@FirstName,LastName=@LastName,
	  License=@License,LicenseExpires=@LicenseEx,NPINumber=@NPI,Email=@Email,Phone=@Phone,Fax=@Fax,
	  Address=@address,State=@State,City=@city,ZipCode=@ZipCode,IsActive=@IsActive where ProviderId=@ID and UserId=@UserId
   end
   
   END  
  
    COMMIT TRANSACTION SCHEDUL
  
END TRY

BEGIN CATCH 
  IF (@@TRANCOUNT > 0)
   BEGIN
      ROLLBACK TRANSACTION SCHEDUL
      PRINT ''
   END 
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH
  select ContactId as Id,UserId,ContactType as type,ContactName as FirstName,Relationship,ContactPhone as Phone,'' as Title,
   '' as LastName,'' as License,null as LicenseExpires,'' as NPINumber,ContactEmail as Email,'' as Fax,
   '' as Address,'' as State,'' as City,'' as ZipCode,IsActive from dbo.tblContact where UserId=@UserId

   Union All

   select ProviderId as Id,UserId,ProviderType as type,FirstName,'' as Relationship,Phone,Title as Title,LastName,License,LicenseExpires,NPINumber
      ,Email,Fax,Address,State,City,ZipCode,IsActive from dbo.tblProvider where UserId=@UserId
	
end
GO
/****** Object:  StoredProcedure [dbo].[EmpProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpProc]    
    
(    
@flag INT=NULL,    
@UserId INT=NULL,  
@TypeId tinyint=NULL,
@IsActive tinyint=NULL,
@SupervisorId int=NULL,            
@State varchar(50)=NULL,     
@CreatedOn datetime=NULL,            
@CreatedBy int=NULL          
)    
AS    
    
BEGIN    
    
if @flag=1    
BEGIN    
Select x.UserId as EmpId,x.UserKey as EmpKey,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) EmpName,
p.TypeId,p.TypeName as EmpType,x.CellPhone,x.SSN,y.TaxState,x.IsActive,(Case When x.Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,
z.UserId as ManagerId,(ISNULL(z.FirstName,'') + ' ' +   ISNULL(z.MiddleName,'') + ' ' + ISNULL(z.LastName,'') ) Coordinator,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where  UPPER(yx.FolderName) IN (UPPER('MEDICAL')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as Medical,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where UPPER(yx.FolderName)IN (UPPER('INSERVICE')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as InService,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where  UPPER(yx.FolderName) IN (UPPER('I-9/DOB')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as  HasDOB
From tblUser x inner join tblEmployee y on x.UserId=y.UserId    
 left join tblUser z on x.SupervisorId=z.UserId    
 left join tblEmpType p on y.EmpType=p.TypeId 
 where x.IsActive=@IsActive ;    
    
END    
    
    
if @flag=2    
BEGIN    
BEGIN TRANSACTION;    
Update tblUser SET IsActive = @IsActive Where UserId = @UserId    
Update tblEmployee SET IsActive = @IsActive Where UserId = @UserId    
COMMIT;    
END


if @flag=3   
BEGIN    
Select x.UserId as EmpId,x.UserKey as EmpKey,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) EmpName,
p.TypeId,p.TypeName as EmpType,x.CellPhone,x.SSN,y.TaxState,x.IsActive,(Case When x.Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,
z.UserId as ManagerId,(ISNULL(z.FirstName,'') + ' ' +   ISNULL(z.MiddleName,'') + ' ' + ISNULL(z.LastName,'') ) Coordinator,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where  UPPER(yx.FolderName) IN (UPPER('MEDICAL')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as Medical,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where UPPER(yx.FolderName)IN (UPPER('INSERVICE')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as InService,
(Case When (select count(yx.FolderId) from tblEmpDocument xy inner join tblFolderMaster yx on  xy.FolderId=yx.FolderId
where  UPPER(yx.FolderName) IN (UPPER('I-9/DOB')) and xy.CreatedBy=x.UserId
) > 0 Then 1 ELSE 0 END) as  HasDOB
From tblUser x inner join tblEmployee y on x.UserId=y.UserId    
 left join tblUser z on x.SupervisorId=z.UserId    
 left join tblEmpType p on y.EmpType=p.TypeId 
 Left join tblAddress xy on x.UserId=xy.UserId   

 Where x.SupervisorId=(CASE WHEN @SupervisorId =0            
THEN x.SupervisorId ELSE @SupervisorId END)            
AND x.IsActive=(CASE WHEN @IsActive =0 THEN x.IsActive ELSE @IsActive END)   
AND y.EmpType=(CASE WHEN @TypeId =0 THEN y.EmpType ELSE @TypeId END)            

AND          
ISNULL(xy.State,'')=(CASE WHEN (@State IS NULL OR @State ='') THEN ISNULL(xy.State,'') ELSE @State END) 
ORDER BY TRIM(x.LastName)
    
END  
    
    
END 








GO
/****** Object:  StoredProcedure [dbo].[ExternalLoginBySSNORMobile]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec ExternalLoginBySSNORMobile '111-00-9876',''
CREATE PROCEDURE [dbo].[ExternalLoginBySSNORMobile] 

@SSN Varchar(15)

AS
BEGIN
	SET NOCOUNT ON;

	
		SELECT 
			TU.userId,
			TU.userType as userTypeId,
			TU.userName,
			TU.firstName,
			TU.lastName,
			TU.middleName,
			TU.email,
			TA.longitude,
			TA.latitude
		FROM TblUser TU
		INNER JOIN TblAddress TA ON TU.UserId = TA.UserId
		WHERE (Lower(TU.SSN) = Lower(@SSN) OR TU.Cellphone = @SSN) AND TU.IsActive = 1 


END
GO
/****** Object:  StoredProcedure [dbo].[GetCaregiverDetails]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCaregiverDetails]

@UserId Int = 0

AS
BEGIN
	SET NOCOUNT ON;

    SELECT Distinct top 1 
		TE.UserId,
		TP.NPINumber as npi,
		TU.SSN,
		TU.DOB as dateOfBirth,
		TU.FirstName,
		TU.LastName,
		TU.Gender,
		TU.Email,
		TU.CellPhone as phoneNumber,
		TE.DateOfHire as hireDate 
	FROM TblEmployee TE
	INNER JOIN 
		TblUser TU ON TE.UserId = TU.UserId
	INNER JOIN 
		TblProvider TP ON TE.UserId = TP.UserId
	WHERE TE.UserId = @UserId

	SELECT 
		TA.FlatNo as addressLine1,
		TA.Address,
		TA.City,
		TA.Country,
		TA.State,
		TA.ZipCode 
	FROM TblAddress TA
	INNER JOIN 
		TblUser TU ON TA.UserId = TU.UserId
	INNER JOIN 
		TblProvider TP ON TA.UserId = TU.UserId
	WHERE TA.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCLientDetailsByUserId]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec GetCLientDetailsByUserId 39
CREATE PROCEDURE [dbo].[GetCLientDetailsByUserId]

@empId int 

AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		TM.ClientId,
		TM.EmpId as UserId,
		TU.FirstName,
		TU.MiddleName,
		TU.LastName,
		TM.MeetingDate,
		TM.StartTime,
		TM.EndTime,
		TA.FlatNo,
		TA.[Address],
		TA.City,
		TA.Country,
		TA.[State],
		TA.ZipCode,
		Convert(varchar,TA.Longitude) as Longitude,
		Convert(varchar,TA.Latitude) as Latitude 
	FROM tblClient TC
	INNER JOIN TblMeeting TM ON TC.UserId = TM.ClientId
	INNER JOIN tblUser TU ON TC.UserId = TU.UserId
	LEFT JOIN tblAddress TA ON TC.USERID = TA.UserId
	WHERE TM.EmpId = @empId AND TU.IsActive = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetHHAClockInOutDetails]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHHAClockInOutDetails]

@UserId bigint

AS
BEGIN

	SET NOCOUNT ON;

	SELECT top 1 * FROM TblClockInout WHERE UserId = @UserId order by clockId desc

END
GO
/****** Object:  StoredProcedure [dbo].[MeetingProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
            
CREATE PROCEDURE [dbo].[MeetingProc]              
(              
@flag int=null,              
@ClientId bigint=NULL,   
@EmpId int=NULL,  
@IsStatus tinyint=NULL,    
@FromDate datetime=NULL,    
@ToDate datetime=NULL,  
@MeetingDate datetime=NULL,   
@StartTime time=NULL,   
@EndTime time=NULL,  
@MeetingPoint nvarchar(max)=NULL,  
@CreatedOn datetime=NULL,              
@CreatedBy int=NULL              
)              
AS              
BEGIN   
Declare @currentDate datetime=GetDate()          
IF @flag=1              
BEGIN  
  
BEGIN TRAN  
  
BEGIN TRY 

IF (@FromDate IS NOT NULL AND @ToDate IS NOT NULL)     
BEGIN  
  
DECLARE @output TABLE (MeetingId bigint)  
--DECLARE @flag int=null,              
--@ClientId int=2,   
--@EmpId int=1,  
--@IsStatus int=1,    
--@FromDate datetime='2015-01-01',    
--@ToDate datetime='2015-01-12',  
--@MeetingDate datetime='2015-01-01',    
--@StartTime time='09:09:00.0000000',  
--@EndTime time='11:19:00.0000000',  
--@CreatedOn datetime=NULL,              
--@CreatedBy int=NULL,  
;WITH DateRange(DateData) AS   
(  
SELECT @FromDate as Date  
UNION ALL  
SELECT DATEADD(d,1,DateData)  
FROM DateRange   
WHERE DateData < @ToDate  
)  
Insert Into tblMeeting (ClientId,MeetingDate,StartTime,EndTime,IsStatus,CreatedOn,CreatedBy,EmpId)  
OUTPUT INSERTED.MeetingId INTO @output  
SELECT   
@ClientId as ClientId,DateData as MeetingDate,@StartTime as StartTime,@EndTime as EndTime,@IsStatus as IsStatus,@CreatedOn as CreatedOn,@CreatedBy as CreatedBy,@EmpId as EmpId  
FROM DateRange  
OPTION (MAXRECURSION 0)  

IF @MeetingPoint IS NOT NULL
BEGIN
INSERT INTO tblMeetingPoint (MeetingId,MeetingPoint,CreatedOn,CreatedBy)  
SELECT MeetingId,@MeetingPoint as MeetingPoint,@CreatedOn as CreatedOn,@CreatedBy as CreatedBy FROM @output  

END 
   
   
END 
COMMIT TRAN  
  
END TRY  
BEGIN CATCH  
  
ROLLBACK TRAN  
  
END CATCH  

END  
  
END
GO
/****** Object:  StoredProcedure [dbo].[ProvisionInfoProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProvisionInfoProc]    
(    
 @Provision tblProvisiontype READONLY,
 @UserId int
)  
AS  
  Begin

BEGIN TRY

  BEGIN TRANSACTION SCHEDUL
 
  


 if ((select count(*) from @Provision)>1)
 begin
  delete from dbo.tblProvisions where  UserId=@UserId
  insert into dbo.tblProvisions(ProvisionId,ProvisionValue,UserId) 
   SELECT ProvisionId, ProvisionValue, UserId FROM @Provision	
 end

  
   --if not Exists(select * from dbo.tblProvisions where UserId=@UserId and ProvisionId=@ProvisionId)
   --begin    
   --insert into dbo.tblProvisions(ProvisionId,ProvisionValue,UserId) 
   --SELECT ProvisionId, ProvisionValue, UserId FROM @Provision	  
   --end 
   -- if Exists(select * from dbo.tblProvisions where UserId=@UserId and ProvisionId=@ProvisionId)
   --begin   
	  --update dbo.tblProvisions set ProvisionValue=p.ProvisionValue from dbo.tblProvisions tp
	  --inner join @Provision p on tp.ProvisionId=p.ProvisionId 
   --end
    COMMIT TRANSACTION SCHEDUL
  
END TRY

BEGIN CATCH 
  IF (@@TRANCOUNT > 0)
   BEGIN
      ROLLBACK TRANSACTION SCHEDUL
      PRINT ''
   END 
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH

;with Provision(ProvisionId,UserId,ProvisionValue) as  
   (  
     SELECT  ProvisionId,UserId,ProvisionValue from tblProvisions where UserId=@UserId

    ) 
	
	select tpm.ProvisionId,tp.ProvisionValue,Description,ProvisionType,
	tp.UserId from Provision tp right join tblProvisionsMaster tpm on
  tpm.ProvisionId=tp.ProvisionId where tpm.EntityType=1

	
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ClientCommunityOperation]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClientCommunityOperation] 
	-- Add the parameters for the stored procedure here
	@flag int,  
	@UserId int=NULL,	
	@CommunityName nvarchar(260)=null,
	@CommunityAddress nvarchar(260)=null,
	@CommunityFloor nvarchar(260)=null,
    @County nvarchar(60)=null,
	@State nvarchar(60)=null,
	@City nvarchar(60)=null,
	@Contact nvarchar(60)=null,
	@Email nvarchar(60)=null,
	@Notes nvarchar(550)=null,
	@IsActive tinyint=NULL,
	@CreatedOn datetime=NULL,
	@CreatedBy int=NULL,
	@CommunityId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @genCommunityId int = 0
    -- Insert statements for procedure here
	IF(@flag =1)
	BEGIN
	INSERT INTO tblCommunityMaster
	(	  
		CommunityName  ,
		CommunityAddress,
		CommunityFloor,
		County,
		State,
		City ,
		Contact  ,
		Email,
		Notes ,
		IsActive ,
		CreatedBy,
		CreatedOn
	)
	VALUES
	(	       
		@CommunityName  ,
		@CommunityAddress,
		@CommunityFloor,
		@County,
		@State,
		@City ,
		@Contact  ,
		@Email,
		@Notes ,
		@IsActive ,
		@CreatedBy,
		@CreatedOn
	)	
	set @genCommunityId = (select top 1 communityId from tblcommunityMaster(nolock) order by CreatedOn desc)
	INSERT INTO tblUserCommunity
	(
		CommunityId,
		UserId
	)
	values
	(
		@genCommunityId,
		@UserId
	)
	END

	SELECT 
	    CommunityId,
	    CommunityName  ,
		CommunityAddress,
		CommunityFloor,
		County,
		State,
		City ,
		Contact  ,
		Email,
		Notes ,
		IsActive ,
		CreatedBy,
		CreatedOn from tblCommunityMaster(nolock)
		where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ClientComplianceOperation]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nikhil Mohapatra>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClientComplianceOperation] 
	-- Add the parameters for the stored procedure here
	@flag int,  
	@DueDate datetime =null,
	@CompletedOn datetime =null,
	@Category int=null,
	@ScreenDate datetime =null,
	@SubCategory int =null,
	@SignedDate datetime =null,
	@MDOrderFdate datetime =null,
	@MDOrderEDate datetime =null,
	@IsReceived bit=null, 
	@AttachFile int=null,
	@EmpId int=null,
	@OfficeUserId int =null,
	@ClientId int =null,
	@IsNotifyViaText bit =null,
	@IsNotifyViaScreen bit =null,
	@IsNotifyViaEmail bit =null,
	@Notes nvarchar(max)=null,
	@Status nvarchar(50)=null,
	@IsActive tinyint=null,
	@CreatedOn datetime=null,
	@CreatedBy int=null,
	@ClientComplianceId int=null
	
AS
BEGIN  
  
if (@flag=1)  
BEGIN    
  
INSERT INTO [dbo].[tblClientCompliance]
(	
	DueDate,
	CompletedOn,
	Category,
	ScreenDate,
	SubCategory,
	SignedDate,
	MDOrderFdate,
	MDOrderEDate,
	IsReceived,
	AttachFile,
	EmpId,
	OfficeUserId,
	ClientId,
	IsNotifyViaText,
	IsNotifyViaScreen,
	IsNotifyViaEmail,
	Notes,
	Status,
	IsActive,
	CreatedOn,
	CreatedBy
)
values(
	@DueDate,
	@CompletedOn,
	@Category,
	@ScreenDate,
	@SubCategory,
	@SignedDate,
	@MDOrderFdate,
	@MDOrderEDate,
	@IsReceived,
	@AttachFile,
	@EmpId,
	@OfficeUserId,
	@ClientId,
	@IsNotifyViaText,
	@IsNotifyViaScreen,
	@IsNotifyViaEmail,
	@Notes,
	@Status,
	@IsActive,
	@CreatedOn,
	@CreatedBy
)
  
END  

/*************************************************************/

if (@flag=2)  
BEGIN 
  
UPDATE [dbo].[tblClientCompliance] 
      set   DueDate =@DueDate,
			CompletedOn=@CompletedOn,
			Category=@Category,
			ScreenDate=@ScreenDate,
			SubCategory=@SubCategory,
			SignedDate=@SignedDate,
			MDOrderFdate=@MDOrderFdate,
			MDOrderEDate=@MDOrderEDate,
			IsReceived=@IsReceived,
			AttachFile=@AttachFile,
			EmpId=@EmpId,
			OfficeUserId=@OfficeUserId,
			IsNotifyViaText=@IsNotifyViaText,
			IsNotifyViaScreen=@IsNotifyViaScreen,
			IsNotifyViaEmail=@IsNotifyViaEmail,
			Notes=@Notes,
			Status=@Status
		  where ClientComplianceId=@ClientComplianceId
  
END  


if (@flag=3)  
BEGIN  
UPDATE  [dbo].[tblClientCompliance] 
             set IsActive=0
        where ClientComplianceId=@ClientComplianceId
END 
  
if (@flag=5)  
BEGIN  
SELECT  ClientComplianceId,
        ClientId,
        DueDate,
		CompletedOn,
		Category,
		ScreenDate,
		SubCategory,
		SignedDate,
		MDOrderFdate,
		MDOrderEDate,
		IsReceived,
		AttachFile,
		EmpId,
		OfficeUserId,
		ClientId,
		IsNotifyViaText,
		IsNotifyViaScreen,
		IsNotifyViaEmail,
		Notes,
		Status,
		IsActive,
		CreatedOn,
		CreatedBy 
		from [dbo].[tblClientCompliance](nolock)  
 where  IsActive=1 and ClientComplianceId=@ClientComplianceId  
END

SELECT  ClientComplianceId, 
        ClientId,
        DueDate,
		CompletedOn,
		Category,
		ScreenDate,
		SubCategory,
		SignedDate,
		MDOrderFdate,
		MDOrderEDate,
		IsReceived,
		AttachFile,
		EmpId,
		OfficeUserId,
		ClientId,
		IsNotifyViaText,
		IsNotifyViaScreen,
		IsNotifyViaEmail,
		Notes,
		Status,
		IsActive,
		CreatedOn,
		CreatedBy  
		from [dbo].[tblClientCompliance](nolock)  
 where ClientId=@ClientId  and IsActive=1
 END 
GO
/****** Object:  StoredProcedure [dbo].[SP_ClientNotesOperation]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nikhil Mohapatra>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClientNotesOperation] 
	-- Add the parameters for the stored procedure here
	@flag int,  
	@UserId int=NULL,
	@NotesTypeId int=NULL,
	@Notes nvarchar(max)=null,
	@OfficeUserId int=NULL,
	@EmpId int=NULL,
    @NotifyTypeId tinyint=NULL,
	@IsActive tinyint=NULL,
	@CreatedOn datetime=NULL,
	@CreatedBy int=NULL,
	@NotesId int
AS
BEGIN  
  
if (@flag=1)  
BEGIN    
  
INSERT INTO [dbo].[tblNotes]
(	
	UserId,
	NotesTypeId,
	Notes,
	OfficeUserId,
	EmpId,
	NotifyTypeId,
	IsActive,
	CreatedOn,
	CreatedBy
)
values(
	@UserId,
	@NotesTypeId,
	@Notes,
	@OfficeUserId,
	@EmpId,
	@NotifyTypeId,
	@IsActive,
	@CreatedOn,
	@CreatedBy
)
  
END  

/*************************************************************/


if (@flag=2)  
BEGIN 
  
UPDATE [dbo].[tblNotes] 
      set NotesTypeId=@NotesTypeId,
	      Notes=@Notes,
	      OfficeUserId=@OfficeUserId,
	      EmpId=@EmpId,
	      NotifyTypeId=@NotifyTypeId
		  where NotesId=@NotesId  
  
END  


if (@flag=3)  
BEGIN  
UPDATE  [dbo].[tblNotes] 
             set IsActive=0
        where NotesId=@NotesId  
END 
  
if (@flag=5)  
BEGIN  
SELECT NotesId,
		UserId,
		NotesTypeId,
		Notes,
		OfficeUserId,
		EmpId,
		NotifyTypeId,
		IsActive,
		CreatedOn,
		CreatedBy 
		from [dbo].[tblNotes](nolock)  
 where  IsActive=1 and NotesId=@NotesId  
END

SELECT NotesId,
		UserId,
		NotesTypeId,
		Notes,
		OfficeUserId,
		EmpId,
		NotifyTypeId,
		IsActive,
		CreatedOn,
		CreatedBy 
		from [dbo].[tblNotes](nolock)  
 where UserId=@UserId  and IsActive=1
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_DocumentProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
CREATE   PROCEDURE [dbo].[SP_DocumentProc]      
(      
@DocumentId bigint,@FolderId bigint,@EmpId bigint    
)      
AS      
BEGIN      
       
BEGIN TRANSACTION;      
      
BEGIN TRY      
if(@DocumentId<>0)    
begin    
delete from dbo.tblEmpDocument where DocumentId=@DocumentId    
end    
else if(@FolderId<>0)    
begin    
delete from dbo.tblEmpDocument where FolderId=@FolderId      
--delete from dbo.tblFolderMaster where FolderId=@FolderId and EmpId=@EmpId    
End     
select x.FolderId,x.FolderName,y.Documentid,y.FileName,y.FilePath,y.Title,y.Description    
,y.SeachTag, y.createdon as CreatedOn,e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName as CreatedByName from     
tblFoldermaster x left join tblEmpDocument y on x.FolderId = y.FolderId left join tblUser e on y.CreatedBy=e.UserId where x.EmpId = @EmpId     
END TRY     
    
    
BEGIN CATCH      
SELECT       
ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState      
,ERROR_PROCEDURE() AS ErrorProcedure,ERROR_LINE() AS ErrorLine,ERROR_MESSAGE() AS ErrorMessage;      
      
IF @@TRANCOUNT > 0      
ROLLBACK TRANSACTION;      
END CATCH;      
      
IF @@TRANCOUNT > 0      
COMMIT TRANSACTION;      
    
    
       
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeclinedCaseProc]    Script Date: 27-05-2022 16:01:29 ******/
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
  tblEmpDeclinedCase tedc left join tblUser tc on tedc.ClientId=tc.UserId      
  where  tedc.EmpId= @EmpId   
        
 --where empId= @EmployeeId or Clientid=@ClientID      
END   
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayRateProc]    Script Date: 27-05-2022 16:01:29 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_SaveClientMedication]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_SaveClientMedication]  
  
(  
@flag int,  
@UserId int=NULL,
@StartDate datetime=NULL,
@EndDate datetime=NULL,
@Medication varchar(100)=NULL,
@NDC varchar(100)=NULL,
@Strength varchar(100)=NULL,
@Dosage varchar(100)=NULL,
@Frequency tinyint=NULL,
@Route varchar(100)=NULL,
@Tabs varchar(100)=NULL,
@Prescriber varchar(100)=NULL,
@Classification varchar(255)=NULL,
@Instructions varchar(255)=NULL,
@IsReminders bit=NULL,
@IsInstructionscheck bit=NULL,
@Isadministrationcheck bit=NULL,
@Isselfadministercheck bit=NULL,
@IsActive tinyint=NULL,
@CreatedOn datetime=NULL,
@CreatedBy int=NULL,
@MedicationID int
)  
AS  
  
BEGIN  
  
if (@flag=1)  
BEGIN  
  
  
INSERT INTO [dbo].[tblMedication]
(UserId,StartDate,EndDate,Medication,NDC,Strength,Dosage,Frequency,[Route],Tabs,Prescriber,[Classification],Instructions,IsReminders,IsInstructionscheck
,Isadministrationcheck,Isselfadministercheck,IsActive,CreatedOn,CreatedBy)
values(@UserId,@StartDate,@EndDate,@Medication,@NDC,@Strength,@Dosage,@Frequency,@Route,@Tabs,@Prescriber,@Classification,@Instructions,@IsReminders,@IsInstructionscheck
,@Isadministrationcheck,@Isselfadministercheck,@IsActive,@CreatedOn,@CreatedBy)
  
END  

/*************************************************************/


if (@flag=2)  
BEGIN  
  
  
update tblMedication set StartDate=@StartDate,EndDate=@EndDate,Medication=@Medication  
    ,NDC=@NDC,Strength=@Strength,Dosage=@Dosage,  
 Frequency=@Frequency,Route=@Route,Tabs=@Tabs,Prescriber=@Prescriber  
 ,Classification=@Classification,Instructions=@Instructions,  
 IsReminders=@IsReminders,IsInstructionscheck=@IsInstructionscheck,Isadministrationcheck=@Isadministrationcheck  
 ,Isselfadministercheck=@Isselfadministercheck,CreatedOn=@CreatedOn,CreatedBy=@CreatedBy,IsActive=@IsActive where MedicationId=@MedicationID  
  
END  


if (@flag=3)  
BEGIN  
delete tblMedication where MedicationID=@MedicationID 
END  


  
  
select MedicationId,StartDate,EndDate,Medication,NDC,Strength,Dosage,  
 Frequency,Route,Tabs,Prescriber,Classification,Instructions,  
 IsReminders,IsInstructionscheck,Isadministrationcheck,Isselfadministercheck from tblMedication  
 where UserId=@UserId  
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpDeclinedCaseProc]    Script Date: 27-05-2022 16:01:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpPayRateProc]    Script Date: 27-05-2022 16:01:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UserProc]    Script Date: 27-05-2022 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UserProc]

(
@flag INT=null
,@SSN varchar(50)
,@FirstName varchar(50)
,@MiddleName varchar(50)
,@LastName varchar(50)
,@DOB datetime
,@Email varchar(50)
,@Gender varchar(50)
,@MaritalStatus tinyint
,@EmgContact varchar(50)
,@UserName varchar(50)
,@UserPassword varchar(50)
,@IsActive int
,@CreatedOn datetime
,@CreatedBy int
)
AS

BEGIN

IF @flag=1
BEGIN

IF NOT EXISTS (SELECT 0 FROM tblUser 
WHERE Email=@Email)
BEGIN
INSERT INTO tblUser
(SSN,FirstName,MiddleName,LastName,DOB,Email,Gender,MaritalStatus,EmgContact,UserName,UserPassword,IsActive,CreatedOn,CreatedBy)
VALUES (@SSN,@FirstName,@MiddleName,@LastName,@DOB,@Email,@Gender,@MaritalStatus,@EmgContact,@UserName,@UserPassword,@IsActive,@CreatedOn,@CreatedBy)

END




END



END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used for both client and employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvisionsMaster', @level2type=N'COLUMN',@level2name=N'EntityType'
GO
USE [master]
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  READ_WRITE 
GO
