USE [master]
GO
/****** Object:  Database [Nm_PersonnelFiles]    Script Date: 2019/9/29 11:58:24 ******/
CREATE DATABASE [Nm_PersonnelFiles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_PersonnelFiles', FILENAME = N'D:\Database\SqlServer\Nm_PersonnelFiles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_PersonnelFiles_log', FILENAME = N'D:\Database\SqlServer\Nm_PersonnelFiles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_PersonnelFiles] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_PersonnelFiles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_PersonnelFiles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_PersonnelFiles] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_PersonnelFiles', N'ON'
GO
ALTER DATABASE [Nm_PersonnelFiles] SET QUERY_STORE = OFF
GO
USE [Nm_PersonnelFiles]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[Leader] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[JobNo] [int] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sex] [smallint] NOT NULL,
	[Native] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Nation] [nvarchar](50) NULL,
	[Education] [nvarchar](50) NULL,
	[Picture] [uniqueidentifier] NULL,
	[IdCardNo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Contact]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[QQ] [nvarchar](20) NOT NULL,
	[Wechat] [nvarchar](50) NOT NULL,
	[DingDing] [nvarchar](50) NOT NULL,
	[ProvinceCode] [nvarchar](12) NOT NULL,
	[ProvinceName] [nvarchar](50) NOT NULL,
	[CityCode] [nvarchar](12) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[AreaCode] [nvarchar](12) NOT NULL,
	[AreaName] [nvarchar](50) NOT NULL,
	[TownCode] [nvarchar](12) NOT NULL,
	[TownName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Education_History]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Education_History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[SchoolName] [nvarchar](100) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Profession] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Work_History]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Work_History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EnterpriseName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[DimissionReason] [nvarchar](300) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetailsModel]    Script Date: 2019/9/29 11:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetailsModel](
	[Id] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[JobNo] [int] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sex] [smallint] NOT NULL,
	[Native] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Nation] [nvarchar](50) NULL,
	[Education] [nvarchar](50) NULL,
	[Picture] [uniqueidentifier] NULL,
	[IdCardNo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Position] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Position] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [JobNo]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Sex]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[User_Education_History] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[User_Education_History] ADD  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[User_Education_History] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[User_Education_History] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[User_Work_History] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[User_Work_History] ADD  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[User_Work_History] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[User_Work_History] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT ((0)) FOR [JobNo]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT ((0)) FOR [Sex]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[UserDetailsModel] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
USE [master]
GO
ALTER DATABASE [Nm_PersonnelFiles] SET  READ_WRITE 
GO
