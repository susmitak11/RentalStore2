USE [master]
GO
/****** Object:  Database [RentingStore]    Script Date: 21/02/2020 9:36:21 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 21/02/2020 9:36:21 AM ******/
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
/****** Object:  Table [dbo].[Movies]    Script Date: 21/02/2020 9:36:21 AM ******/
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
/****** Object:  Table [dbo].[Rented]    Script Date: 21/02/2020 9:36:21 AM ******/
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
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (5, N'Susmita', N'Kumari', N'papatoetoe', N'12345678')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (12, N'Raman', N'Cheema', N'papatoetoe', N'32456987')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (13, N'Randeep', N'Kaur', N'Papatoetoe', N'21456874')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (14, N'Pranshu', N'Kashyap', N'Papakura', N'35879645')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (15, N'Sima', N'singh', N'Manukau', N'54789652')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (16, N'Raju', N'Singh', N'Manurewa', N'45879621')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (17, N'Nikhil', N'Brar', N'manurewa', N'24667632')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (18, N'Simmi ', N'Kaur', N'Mount Eden', N'54798426')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (19, N'Pinky', N'Patel', N'Takanini', N'55463231')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (1, N'Supna', CAST(N'2019-07-12T00:00:00.000' AS DateTime), 8, 10000, N'20', N'abc')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (4, N'mubarak', CAST(N'2019-08-14T00:00:00.000' AS DateTime), 3, 20000, N'60', N'def')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (5, N'notebook', CAST(N'2017-08-02T00:00:00.000' AS DateTime), 4, 30000, N'35', N'klm')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (6, N'Beautiful', CAST(N'2018-07-04T00:00:00.000' AS DateTime), 6, 12000, N'20', N'tyu')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (7, N'Easy Things', CAST(N'2018-05-09T00:00:00.000' AS DateTime), 5, 60000, N'45', N'dfg')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (8, N'Little things', CAST(N'2019-07-05T00:00:00.000' AS DateTime), 7, 5000, N'36', N'mkl')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (9, N'Jumanji', CAST(N'2017-07-12T00:00:00.000' AS DateTime), 8, 20000, N'67', N'rtu')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (10, N'Monster', CAST(N'2018-06-03T00:00:00.000' AS DateTime), 7, 15000, N'20', N'lkj')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (11, N'The Last Date', CAST(N'2019-12-03T00:00:00.000' AS DateTime), 6, 14000, N'13', N'pli')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Rented] ON 

INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (3, 5, 1, CAST(N'2017-06-03T00:00:00.000' AS DateTime), CAST(N'2017-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (12, 12, 4, CAST(N'2017-03-14T00:00:00.000' AS DateTime), CAST(N'2017-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (14, 13, 5, CAST(N'2018-04-13T00:00:00.000' AS DateTime), CAST(N'2018-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (15, 14, 6, CAST(N'2017-04-05T00:00:00.000' AS DateTime), CAST(N'2017-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (16, 15, 7, CAST(N'2018-06-17T00:00:00.000' AS DateTime), CAST(N'2018-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (17, 16, 8, CAST(N'2018-12-08T00:00:00.000' AS DateTime), CAST(N'2018-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (18, 17, 9, CAST(N'2019-03-10T00:00:00.000' AS DateTime), CAST(N'2019-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (19, 18, 10, CAST(N'2019-08-12T00:00:00.000' AS DateTime), CAST(N'2019-09-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rented] OFF
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
