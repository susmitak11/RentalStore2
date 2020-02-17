USE [master]
GO
/****** Object:  Database [RentingStore]    Script Date: 18/02/2020 10:50:32 AM ******/
CREATE DATABASE [RentingStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentingStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RentingStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentingStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RentingStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentingStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentingStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentingStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentingStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentingStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentingStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentingStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentingStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentingStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentingStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentingStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentingStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentingStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentingStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentingStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentingStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentingStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentingStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentingStore] SET RECOVERY FULL 
GO
ALTER DATABASE [RentingStore] SET  MULTI_USER 
GO
ALTER DATABASE [RentingStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentingStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentingStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentingStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentingStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentingStore] SET QUERY_STORE = OFF
GO
USE [RentingStore]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18/02/2020 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [text] NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 18/02/2020 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [varchar](100) NOT NULL,
	[MovieReleaseDate] [datetime] NOT NULL,
	[MovieRatings] [int] NOT NULL,
	[MovieCopies] [int] NOT NULL,
	[MovieRentingCost] [varchar](50) NOT NULL,
	[MovieGenre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rented]    Script Date: 18/02/2020 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rented](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[RentFrom] [datetime] NOT NULL,
	[RentTill] [datetime] NOT NULL,
 CONSTRAINT [PK_Rented] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Customers]
GO
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Movies]
GO
USE [master]
GO
ALTER DATABASE [RentingStore] SET  READ_WRITE 
GO
