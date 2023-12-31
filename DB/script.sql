USE [master]
GO
/****** Object:  Database [DemoAPI]    Script Date: 8/27/2023 5:21:54 PM ******/
CREATE DATABASE [DemoAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DemoAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DemoAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DemoAPI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoAPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoAPI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoAPI] SET  MULTI_USER 
GO
ALTER DATABASE [DemoAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoAPI] SET QUERY_STORE = ON
GO
ALTER DATABASE [DemoAPI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DemoAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/27/2023 5:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/27/2023 5:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductCost] [int] NOT NULL,
	[ProductStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLeave]    Script Date: 8/27/2023 5:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLeave](
	[UserLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [datetime2](7) NOT NULL,
	[ToDate] [datetime2](7) NOT NULL,
	[LeaveType] [int] NOT NULL,
	[NatureOfLeave] [int] NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UsersUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLeave] PRIMARY KEY CLUSTERED 
(
	[UserLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLeaveMaster]    Script Date: 8/27/2023 5:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLeaveMaster](
	[UserLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[TotalLeave] [int] NOT NULL,
	[ApprovedLeave] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UsersUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLeaveMaster] PRIMARY KEY CLUSTERED 
(
	[UserLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/27/2023 5:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220625103552_first', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230820093950_login', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826191907_202308061119', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826193026_Users', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826193411_Users', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826193620_Users', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826195055_Users', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826210639_UserLeve', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826212457_UserLeaveMster', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826212538_UserLeaverMaster', N'6.0.6')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductCost], [ProductStock]) VALUES (1, N'Test', N'Test', 2520, 1000)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductCost], [ProductStock]) VALUES (2, N'Test1', N'Test1', 123, 33)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLeave] ON 

INSERT [dbo].[UserLeave] ([UserLeaveId], [FromDate], [ToDate], [LeaveType], [NatureOfLeave], [Reason], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [UsersUserId]) VALUES (1, CAST(N'2023-08-23T00:00:00.0000000' AS DateTime2), CAST(N'2023-08-27T00:00:00.0000000' AS DateTime2), 1, 1, N'Medical Issue', 1, 1, CAST(N'2023-08-27T15:32:52.7241668' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[UserLeave] ([UserLeaveId], [FromDate], [ToDate], [LeaveType], [NatureOfLeave], [Reason], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [UsersUserId]) VALUES (2, CAST(N'2023-08-28T00:00:00.0000000' AS DateTime2), CAST(N'2023-08-29T00:00:00.0000000' AS DateTime2), 1, 1, N'Medical Issue', 0, 1, CAST(N'2023-08-27T15:35:01.7932236' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[UserLeave] ([UserLeaveId], [FromDate], [ToDate], [LeaveType], [NatureOfLeave], [Reason], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [UsersUserId]) VALUES (5, CAST(N'2023-08-23T00:00:00.0000000' AS DateTime2), CAST(N'2023-08-25T00:00:00.0000000' AS DateTime2), 3, 1, N'Study leave', 0, 1, CAST(N'2023-08-27T16:32:38.1912692' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserLeave] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLeaveMaster] ON 

INSERT [dbo].[UserLeaveMaster] ([UserLeaveId], [TotalLeave], [ApprovedLeave], [Year], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [UsersUserId]) VALUES (1, 30, 0, 2023, 1, 1, CAST(N'2023-08-27T01:36:03.5200000' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserLeaveMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Test', N'78tyt34xsboSko0GOEELM37RC0VwfIX7GEiAmkU5ZVs=', 1, 1, CAST(N'2023-08-27T00:29:38.6800000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_UserLeave_UsersUserId]    Script Date: 8/27/2023 5:21:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLeave_UsersUserId] ON [dbo].[UserLeave]
(
	[UsersUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserLeaveMaster_UsersUserId]    Script Date: 8/27/2023 5:21:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLeaveMaster_UsersUserId] ON [dbo].[UserLeaveMaster]
(
	[UsersUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLeave]  WITH CHECK ADD  CONSTRAINT [FK_UserLeave_Users_UsersUserId] FOREIGN KEY([UsersUserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLeave] CHECK CONSTRAINT [FK_UserLeave_Users_UsersUserId]
GO
ALTER TABLE [dbo].[UserLeaveMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserLeaveMaster_Users_UsersUserId] FOREIGN KEY([UsersUserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLeaveMaster] CHECK CONSTRAINT [FK_UserLeaveMaster_Users_UsersUserId]
GO
USE [master]
GO
ALTER DATABASE [DemoAPI] SET  READ_WRITE 
GO
