USE [master]
GO
/****** Object:  Database [Login_Logout]    Script Date: 11/29/2021 10:00:09 AM ******/
CREATE DATABASE [Login_Logout]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Login_Logout', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Login_Logout.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Login_Logout_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Login_Logout_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Login_Logout] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Login_Logout].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Login_Logout] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Login_Logout] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Login_Logout] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Login_Logout] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Login_Logout] SET ARITHABORT OFF 
GO
ALTER DATABASE [Login_Logout] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Login_Logout] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Login_Logout] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Login_Logout] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Login_Logout] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Login_Logout] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Login_Logout] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Login_Logout] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Login_Logout] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Login_Logout] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Login_Logout] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Login_Logout] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Login_Logout] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Login_Logout] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Login_Logout] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Login_Logout] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Login_Logout] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Login_Logout] SET RECOVERY FULL 
GO
ALTER DATABASE [Login_Logout] SET  MULTI_USER 
GO
ALTER DATABASE [Login_Logout] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Login_Logout] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Login_Logout] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Login_Logout] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Login_Logout] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Login_Logout', N'ON'
GO
ALTER DATABASE [Login_Logout] SET QUERY_STORE = OFF
GO
USE [Login_Logout]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Login_Logout]
GO
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 11/29/2021 10:00:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 11/29/2021 10:00:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NULL,
	[Salary] [decimal](10, 2) NULL,
	[Gender] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 11/29/2021 10:00:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Department] ON 

INSERT [dbo].[tbl_Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'Cse')
INSERT [dbo].[tbl_Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'Civil')
INSERT [dbo].[tbl_Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'Math')
SET IDENTITY_INSERT [dbo].[tbl_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON 

INSERT [dbo].[tbl_Employee] ([EmployeeId], [EmployeeName], [Salary], [Gender], [DepartmentId]) VALUES (1, N'Md. Shakirul Mamun', CAST(10000.00 AS Decimal(10, 2)), N'Male', 1)
INSERT [dbo].[tbl_Employee] ([EmployeeId], [EmployeeName], [Salary], [Gender], [DepartmentId]) VALUES (2, N'Sawon', CAST(30000.00 AS Decimal(10, 2)), N'Male', 2)
INSERT [dbo].[tbl_Employee] ([EmployeeId], [EmployeeName], [Salary], [Gender], [DepartmentId]) VALUES (3, N'Mukta', CAST(3000.00 AS Decimal(10, 2)), N'Female', 3)
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([UserId], [UserName], [Password], [Role]) VALUES (1, N'mamun', N'123', N'Admin')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Password], [Role]) VALUES (2, N'sawon', N'123', N'View')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Password], [Role]) VALUES (3, N'mukta', N'123', N'General')
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employee_tbl_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tbl_Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[tbl_Employee] CHECK CONSTRAINT [FK_tbl_Employee_tbl_Department]
GO
USE [master]
GO
ALTER DATABASE [Login_Logout] SET  READ_WRITE 
GO
