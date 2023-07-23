USE [master]
GO
/****** Object:  Database [BazaDanych]    Script Date: 23.07.2023 10:43:27 ******/
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
/****** Object:  Table [dbo].[Klienci]    Script Date: 23.07.2023 10:43:28 ******/
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
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 23.07.2023 10:43:28 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [City]    Script Date: 23.07.2023 10:43:28 ******/
CREATE NONCLUSTERED INDEX [City] ON [dbo].[Klienci]
(
	[Miasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Nazwa_Firmy]    Script Date: 23.07.2023 10:43:28 ******/
CREATE NONCLUSTERED INDEX [Nazwa_Firmy] ON [dbo].[Klienci]
(
	[Nazwa_Firmy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Nazwisko]    Script Date: 23.07.2023 10:43:28 ******/
CREATE NONCLUSTERED INDEX [Nazwisko] ON [dbo].[Pracownicy]
(
	[Nazwisko] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [CK_Data_Zatrudnienia] CHECK  (([Data_Urodzenia]<getdate()))
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [CK_Data_Zatrudnienia]
GO
USE [master]
GO
ALTER DATABASE [BazaDanych] SET  READ_WRITE 
GO
