USE [master]
GO
/****** Object:  Database [dem]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
CREATE DATABASE [dem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dem', FILENAME = N'C:\Database\dem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dem_log', FILENAME = N'C:\Database\dem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dem] SET ARITHABORT OFF 
GO
ALTER DATABASE [dem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dem] SET  MULTI_USER 
GO
ALTER DATABASE [dem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dem] SET QUERY_STORE = OFF
GO
USE [dem]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentID] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[masterID] [int] NOT NULL,
	[requestID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problems]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[idProblem] [int] NOT NULL,
	[problemDescryption] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Problems] PRIMARY KEY CLUSTERED 
(
	[idProblem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[requestID] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[idTechType] [int] NOT NULL,
	[orgTechModel] [nvarchar](max) NOT NULL,
	[idProblem] [int] NOT NULL,
	[idStatus] [int] NOT NULL,
	[completionDate] [date] NULL,
	[repairParts] [nvarchar](max) NULL,
	[masterID] [int] NULL,
	[clientID] [int] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[idStatus] [int] NOT NULL,
	[requestStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[idType] [int] NOT NULL,
	[type] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[idType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTechs]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTechs](
	[idType] [int] NOT NULL,
	[orgTechType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TypeTechs] PRIMARY KEY CLUSTERED 
(
	[idType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04.06.2024 17:08:32 Ахметова ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[fio] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[login] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[idType] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Comments] ([commentID], [message], [masterID], [requestID]) VALUES (1, N'Интересно...', 2, 1)
INSERT [dbo].[Comments] ([commentID], [message], [masterID], [requestID]) VALUES (2, N'Будем разбираться!', 3, 2)
INSERT [dbo].[Comments] ([commentID], [message], [masterID], [requestID]) VALUES (3, N'Сделаем всё на высшем уровне!', 3, 3)
GO
INSERT [dbo].[Problems] ([idProblem], [problemDescryption]) VALUES (1, N'Выключается')
INSERT [dbo].[Problems] ([idProblem], [problemDescryption]) VALUES (2, N'Перестал работать')
INSERT [dbo].[Problems] ([idProblem], [problemDescryption]) VALUES (3, N'Перестала включаться')
GO
INSERT [dbo].[Requests] ([requestID], [startDate], [idTechType], [orgTechModel], [idProblem], [idStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (1, CAST(N'2023-06-06' AS Date), 1, N'DEXP Aquilon O286', 2, 1, NULL, NULL, 2, 7)
INSERT [dbo].[Requests] ([requestID], [startDate], [idTechType], [orgTechModel], [idProblem], [idStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (2, CAST(N'2023-05-05' AS Date), 1, N'DEXP Atlas H388', 2, 1, NULL, NULL, 3, 8)
INSERT [dbo].[Requests] ([requestID], [startDate], [idTechType], [orgTechModel], [idProblem], [idStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (3, CAST(N'2022-07-07' AS Date), 2, N'MSI GF76 Katana 11UC-879XRU черный', 1, 2, CAST(N'2023-01-01' AS Date), NULL, 3, 9)
INSERT [dbo].[Requests] ([requestID], [startDate], [idTechType], [orgTechModel], [idProblem], [idStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (4, CAST(N'2023-08-02' AS Date), 2, N'MSI Modern 15 B12M-211RU черный', 1, 3, NULL, NULL, NULL, 8)
INSERT [dbo].[Requests] ([requestID], [startDate], [idTechType], [orgTechModel], [idProblem], [idStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (5, CAST(N'2023-08-02' AS Date), 3, N'HP LaserJet Pro M404dn', 3, 3, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[Statuses] ([idStatus], [requestStatus]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[Statuses] ([idStatus], [requestStatus]) VALUES (2, N'Готова к выдаче')
INSERT [dbo].[Statuses] ([idStatus], [requestStatus]) VALUES (3, N'Новая заявка')
GO
INSERT [dbo].[Types] ([idType], [type]) VALUES (1, N'Заказчик')
INSERT [dbo].[Types] ([idType], [type]) VALUES (2, N'Мастер')
INSERT [dbo].[Types] ([idType], [type]) VALUES (3, N'Менеджер')
INSERT [dbo].[Types] ([idType], [type]) VALUES (4, N'Оператор')
GO
INSERT [dbo].[TypeTechs] ([idType], [orgTechType]) VALUES (1, N'Компьютер')
INSERT [dbo].[TypeTechs] ([idType], [orgTechType]) VALUES (2, N'Ноутбук')
INSERT [dbo].[TypeTechs] ([idType], [orgTechType]) VALUES (3, N'Принтер')
GO
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (1, N'Носов Иван Михайлович', N'89210563128', N'login1', N'pass1', 3)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (2, N'Ильин Александр Андреевич', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (3, N'Никифоров Иван Дмитриевич', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (4, N'Елисеев Артём Леонидович', N'89990563748', N'login4', N'pass4', 4)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (5, N'Титов Сергей Кириллович', N'89994563847', N'login5', N'pass5', 4)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (6, N'Григорьев Семён Викторович', N'89219567849', N'login11', N'pass11', 1)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (7, N'Сорокин Дмитрий Ильич', N'89219567841', N'login12', N'pass12', 1)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (8, N'Белоусов Егор Ярославович', N'89219567842', N'login13', N'pass13', 1)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (9, N'Суслов Михаил Александрович', N'89219567843', N'login14', N'pass14', 1)
INSERT [dbo].[Users] ([userID], [fio], [phone], [login], [password], [idType]) VALUES (10, N'Васильев Вячеслав Александрович', N'89219567844', N'login15', N'pass15', 2)
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([requestID])
REFERENCES [dbo].[Requests] ([requestID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([masterID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Problems] FOREIGN KEY([idProblem])
REFERENCES [dbo].[Problems] ([idProblem])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Problems]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Statuses] FOREIGN KEY([idStatus])
REFERENCES [dbo].[Statuses] ([idStatus])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Statuses]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_TypeTechs] FOREIGN KEY([idTechType])
REFERENCES [dbo].[TypeTechs] ([idType])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_TypeTechs]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([masterID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([clientID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Types] FOREIGN KEY([idType])
REFERENCES [dbo].[Types] ([idType])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Types]
GO
USE [master]
GO
ALTER DATABASE [dem] SET  READ_WRITE 
GO
