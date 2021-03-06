USE [master]
GO
/****** Object:  Database [BrokerageDB]    Script Date: 16.04.2021 17:02:19 ******/
CREATE DATABASE [BrokerageDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrokerageDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BrokerageDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BrokerageDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BrokerageDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BrokerageDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrokerageDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrokerageDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrokerageDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrokerageDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrokerageDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrokerageDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrokerageDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrokerageDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrokerageDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrokerageDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrokerageDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrokerageDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrokerageDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrokerageDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrokerageDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrokerageDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrokerageDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BrokerageDB] SET  MULTI_USER 
GO
ALTER DATABASE [BrokerageDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrokerageDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrokerageDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrokerageDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BrokerageDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BrokerageDB] SET QUERY_STORE = OFF
GO
USE [BrokerageDB]
GO
/****** Object:  Table [dbo].[Broker]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Broker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
 CONSTRAINT [PK_Broker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Contract] [int] NULL,
	[Broker] [int] NULL,
	[Login] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [int] NOT NULL,
	[DateConclusion] [date] NULL,
	[Comission] [float] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Contract] [int] NULL,
	[Sum] [float] NULL,
	[Subject] [int] NULL,
 CONSTRAINT [PK_Deal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DismissedBrokers]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DismissedBrokers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Broker] [int] NULL,
	[DateDismiss] [date] NULL,
 CONSTRAINT [PK_DismissedBrokers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Profit] [float] NULL,
	[Deal] [int] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 16.04.2021 17:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Broker] ON 

INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (1, N'Ирисова', N'Раиса', N'Гариповна')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (2, N'Андропов', N'Иван', N'Васильевич')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (3, N'Мокрушин', N'Павел', N'Викторович')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (4, N'Арапова', N'Олеся', N'Михайловна')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (5, N'Салина', N'Василиса', N'Петровна')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (6, N'Гоголев', N'Владимир', N'Николаевич')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (7, N'Зарипова', N'Алсу', N'Мансуровна')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (8, N'Ахметов', N'Ильсур', N'Рафилевич')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (9, N'Сабирова', N'Рузия', N'Исламовна')
INSERT [dbo].[Broker] ([Id], [FirstName], [LastName], [Patronymic]) VALUES (10, N'Яковлев', N'Павел', N'Борисович')
SET IDENTITY_INSERT [dbo].[Broker] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (1, N'Агапов', N'Павел', N'Валерьянович', 983, 1, N'qwert', N'1234')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (2, N'Ирдов', N'Максим', N'Айратович', 984, 2, N'asdf', N'2341')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (3, N'Лешина ', N'Алина', N'Эдуардовна', 976, 3, N'dsadggh', N'7574')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (4, N'Павлова', N'Алиса', N'Алексеевна', 947, 4, N'dgdbn', N'jhf4686')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (5, N'Хамдеева', N'Дина', N'Ибрагимовна', 938, 5, N'dfgdfe465', N'4353bnng')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (6, N'Лукина', N'Дарья', N'Дмитриевна', 924, 6, N'w423454', N'hfghf')
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [Contract], [Broker], [Login], [Password]) VALUES (7, N'Патрисов', N'Дмитрий', N'Леонидович', 973, 7, N'3', N'3')
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (924, CAST(N'2020-08-18' AS Date), 6)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (938, CAST(N'2020-08-17' AS Date), 5)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (947, CAST(N'2020-08-16' AS Date), 4)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (973, CAST(N'2020-08-19' AS Date), 7)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (976, CAST(N'2020-08-15' AS Date), 3)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (983, CAST(N'2020-08-13' AS Date), 1)
INSERT [dbo].[Contract] ([Id], [DateConclusion], [Comission]) VALUES (984, CAST(N'2020-08-14' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Deal] ON 

INSERT [dbo].[Deal] ([Id], [Date], [Contract], [Sum], [Subject]) VALUES (6, CAST(N'2020-09-09' AS Date), 983, 150000, 1)
INSERT [dbo].[Deal] ([Id], [Date], [Contract], [Sum], [Subject]) VALUES (7, CAST(N'2020-09-10' AS Date), 984, 23400, 2)
INSERT [dbo].[Deal] ([Id], [Date], [Contract], [Sum], [Subject]) VALUES (8, CAST(N'2020-09-11' AS Date), 976, 500000, 3)
INSERT [dbo].[Deal] ([Id], [Date], [Contract], [Sum], [Subject]) VALUES (9, CAST(N'2020-09-12' AS Date), 947, 444444, 3)
INSERT [dbo].[Deal] ([Id], [Date], [Contract], [Sum], [Subject]) VALUES (10, CAST(N'2020-09-13' AS Date), 938, 1000000, 2)
SET IDENTITY_INSERT [dbo].[Deal] OFF
SET IDENTITY_INSERT [dbo].[DismissedBrokers] ON 

INSERT [dbo].[DismissedBrokers] ([Id], [Broker], [DateDismiss]) VALUES (1, 10, CAST(N'2020-09-17' AS Date))
SET IDENTITY_INSERT [dbo].[DismissedBrokers] OFF
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Id], [FirstName], [LastName], [Patronymic], [Login], [Password]) VALUES (1, N'Самигуллин', N'Разиль', N'Рузальевич', N'11', N'11')
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([Id], [Profit], [Deal]) VALUES (21, 148000, 6)
INSERT [dbo].[Report] ([Id], [Profit], [Deal]) VALUES (22, 22000, 7)
INSERT [dbo].[Report] ([Id], [Profit], [Deal]) VALUES (23, 450000, 8)
INSERT [dbo].[Report] ([Id], [Profit], [Deal]) VALUES (24, 420000, 9)
INSERT [dbo].[Report] ([Id], [Profit], [Deal]) VALUES (25, 980000, 10)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Id], [Name]) VALUES (1, N'Акции')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2, N'Облигации')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (3, N'Ценные бумаги')
SET IDENTITY_INSERT [dbo].[Subject] OFF
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Broker] FOREIGN KEY([Broker])
REFERENCES [dbo].[Broker] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Broker]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Contract] FOREIGN KEY([Contract])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Contract]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_Deal_Contract] FOREIGN KEY([Contract])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_Deal_Contract]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_Deal_Subject] FOREIGN KEY([Subject])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_Deal_Subject]
GO
ALTER TABLE [dbo].[DismissedBrokers]  WITH CHECK ADD  CONSTRAINT [FK_DismissedBrokers_Broker] FOREIGN KEY([Broker])
REFERENCES [dbo].[Broker] ([Id])
GO
ALTER TABLE [dbo].[DismissedBrokers] CHECK CONSTRAINT [FK_DismissedBrokers_Broker]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Deal1] FOREIGN KEY([Deal])
REFERENCES [dbo].[Deal] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Deal1]
GO
USE [master]
GO
ALTER DATABASE [BrokerageDB] SET  READ_WRITE 
GO
