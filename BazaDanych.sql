USE [master]
GO
/****** Object:  Database [BazaDanych]    Script Date: 15.09.2023 06:46:49 ******/
CREATE DATABASE [BazaDanych]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BazaDanych', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BazaDanych.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BazaDanych_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BazaDanych_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BazaDanych] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BazaDanych].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BazaDanych] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BazaDanych] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BazaDanych] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BazaDanych] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BazaDanych] SET ARITHABORT OFF 
GO
ALTER DATABASE [BazaDanych] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BazaDanych] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BazaDanych] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BazaDanych] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BazaDanych] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BazaDanych] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BazaDanych] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BazaDanych] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BazaDanych] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BazaDanych] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BazaDanych] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BazaDanych] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BazaDanych] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BazaDanych] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BazaDanych] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BazaDanych] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BazaDanych] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BazaDanych] SET RECOVERY FULL 
GO
ALTER DATABASE [BazaDanych] SET  MULTI_USER 
GO
ALTER DATABASE [BazaDanych] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BazaDanych] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BazaDanych] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BazaDanych] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BazaDanych] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BazaDanych] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BazaDanych', N'ON'
GO
ALTER DATABASE [BazaDanych] SET QUERY_STORE = ON
GO
ALTER DATABASE [BazaDanych] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BazaDanych]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 15.09.2023 06:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[ID_Klienta] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_Firmy] [nvarchar](30) NOT NULL,
	[Nazwisko_Klienta] [nvarchar](20) NULL,
	[Kontakt] [nvarchar](10) NOT NULL,
	[Adres] [nvarchar](20) NULL,
	[Miasto] [nvarchar](20) NULL,
	[Kraj] [nvarchar](20) NULL,
 CONSTRAINT [PK_Klienta] PRIMARY KEY CLUSTERED 
(
	[ID_Klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15.09.2023 06:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_Order] [int] IDENTITY(1,1) NOT NULL,
	[KlientID] [int] NOT NULL,
	[Pracownik_ID] [int] NOT NULL,
	[Data_order] [date] NOT NULL,
	[Producet] [nvarchar](20) NULL,
	[Adres_Miasto] [nvarchar](20) NOT NULL,
	[Adres_Kraj] [nvarchar](20) NOT NULL,
	[ID_ship] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 15.09.2023 06:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[ID_Pracownika] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](20) NOT NULL,
	[Nazwisko] [nvarchar](20) NOT NULL,
	[Miasto] [nvarchar](20) NULL,
	[Kraj] [nvarchar](20) NULL,
	[Data_Urodzenia] [date] NOT NULL,
	[Data_Zatrudnienia] [date] NOT NULL,
	[Zarobki] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED 
(
	[ID_Pracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statki]    Script Date: 15.09.2023 06:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statki](
	[ID_Statku] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_Firmy] [nvarchar](30) NOT NULL,
	[Kontakt] [nvarchar](10) NULL,
	[Waga] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Statku] PRIMARY KEY CLUSTERED 
(
	[ID_Statku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Firmy], [Nazwisko_Klienta], [Kontakt], [Adres], [Miasto], [Kraj]) VALUES (1, N'OlexyCompany', N'Oleksy', N'589232123', N'ul.Bemowskiego 23', N'Warszawa', N'Polska')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Firmy], [Nazwisko_Klienta], [Kontakt], [Adres], [Miasto], [Kraj]) VALUES (2, N'SkyNet', N'Terminator', N'001002003', N'ul.Detroid 01', N'California', N'USA')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Firmy], [Nazwisko_Klienta], [Kontakt], [Adres], [Miasto], [Kraj]) VALUES (5, N'Wisniowski', N'Graca', N'345623981', N'ul.Wojska 11', N'Krakow', N'Polska')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Firmy], [Nazwisko_Klienta], [Kontakt], [Adres], [Miasto], [Kraj]) VALUES (6, N'OBI', N'Kruger', N'786911233', N'ul.Klacwig 2', N'Klacwig', N'Dania')
SET IDENTITY_INSERT [dbo].[Klienci] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (1, 1, 1, CAST(N'2022-02-02' AS Date), N'SKAWA', N'Warszawa', N'Polska', 2)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (2, 1, 2, CAST(N'2022-02-02' AS Date), N'SKAWA', N'Warszawa', N'Polska', 2)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (3, 2, 3, CAST(N'2022-03-03' AS Date), N'SYTO', N'NewYork', N'USA', 3)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (4, 2, 4, CAST(N'2022-03-03' AS Date), N'SYTO', N'NewYork', N'USA', 3)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (5, 5, 5, CAST(N'2022-03-01' AS Date), N'CaviClain', N'Krakow', N'Polska', 4)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (6, 5, 6, CAST(N'2022-03-01' AS Date), N'CaviClain', N'Krakow', N'Polska', 4)
INSERT [dbo].[Orders] ([ID_Order], [KlientID], [Pracownik_ID], [Data_order], [Producet], [Adres_Miasto], [Adres_Kraj], [ID_ship]) VALUES (7, 5, 7, CAST(N'2022-03-01' AS Date), N'CaviClain', N'Krakow', N'Polska', 4)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pracownicy] ON 

INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (1, N'Zygmunt', N'Czechura', N'Wadowice', N'Polska', CAST(N'2002-09-22' AS Date), CAST(N'2022-09-10' AS Date), CAST(3500.55 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (2, N'Michał', N'Czechura', N'Wadowice', N'Polska', CAST(N'2003-09-30' AS Date), CAST(N'2022-09-20' AS Date), CAST(3500.55 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (3, N'Szymon', N'Czechura', N'Wadowice', N'Polska', CAST(N'2006-02-05' AS Date), CAST(N'2022-09-21' AS Date), CAST(2500.55 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (4, N'Joachim', N'Czechura', N'Wadowice', N'Polska', CAST(N'2007-08-15' AS Date), CAST(N'2022-09-22' AS Date), CAST(1500.55 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (5, N'Dawid', N'Kowalski', N'Wadowice', N'Polska', CAST(N'1981-03-20' AS Date), CAST(N'2001-10-21' AS Date), CAST(6500.00 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (6, N'Kamil', N'Czaja', N'Padew Narodowa', N'Polska', CAST(N'1975-06-10' AS Date), CAST(N'2010-11-30' AS Date), CAST(5500.00 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (7, N'Ola', N'Czaja', N'Mielec', N'Polska', CAST(N'1995-03-01' AS Date), CAST(N'2019-01-01' AS Date), CAST(3500.00 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (8, N'Katarzyna', N'Graca', N'Chocznia', N'Polska', CAST(N'1990-05-05' AS Date), CAST(N'2015-05-14' AS Date), CAST(4600.25 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (9, N'Ewa', N'Graca', N'Chocznia', N'Polska', CAST(N'1995-06-10' AS Date), CAST(N'2015-05-14' AS Date), CAST(3600.05 AS Decimal(10, 2)))
INSERT [dbo].[Pracownicy] ([ID_Pracownika], [Imie], [Nazwisko], [Miasto], [Kraj], [Data_Urodzenia], [Data_Zatrudnienia], [Zarobki]) VALUES (10, N'Piotr', N'Graca', N'Chocznia', N'Niemcy', CAST(N'1995-04-22' AS Date), CAST(N'2005-05-22' AS Date), CAST(5600.05 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Pracownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Statki] ON 

INSERT [dbo].[Statki] ([ID_Statku], [Nazwa_Firmy], [Kontakt], [Waga]) VALUES (2, N'NewSea', N'922911900', CAST(35000.67 AS Decimal(10, 2)))
INSERT [dbo].[Statki] ([ID_Statku], [Nazwa_Firmy], [Kontakt], [Waga]) VALUES (3, N'CollegueShips', N'764531232', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Statki] ([ID_Statku], [Nazwa_Firmy], [Kontakt], [Waga]) VALUES (4, N'FastBaltic', N'567891299', CAST(450000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Statki] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [City]    Script Date: 15.09.2023 06:46:49 ******/
CREATE NONCLUSTERED INDEX [City] ON [dbo].[Klienci]
(
	[Miasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Nazwa_Firmy]    Script Date: 15.09.2023 06:46:49 ******/
CREATE NONCLUSTERED INDEX [Nazwa_Firmy] ON [dbo].[Klienci]
(
	[Nazwa_Firmy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Nazwisko]    Script Date: 15.09.2023 06:46:49 ******/
CREATE NONCLUSTERED INDEX [Nazwisko] ON [dbo].[Pracownicy]
(
	[Nazwisko] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Klienci] FOREIGN KEY([KlientID])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Klienci]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Pracownicy] FOREIGN KEY([Pracownik_ID])
REFERENCES [dbo].[Pracownicy] ([ID_Pracownika])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Pracownicy]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Statki] FOREIGN KEY([ID_ship])
REFERENCES [dbo].[Statki] ([ID_Statku])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Statki]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [CK_Data_Zatrudnienia] CHECK  (([Data_Urodzenia]<getdate()))
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [CK_Data_Zatrudnienia]
GO
USE [master]
GO
ALTER DATABASE [BazaDanych] SET  READ_WRITE 
GO
