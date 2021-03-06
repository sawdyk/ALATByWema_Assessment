USE [master]
GO
/****** Object:  Database [customerDB]    Script Date: 6/27/2022 12:56:41 AM ******/
CREATE DATABASE [customerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'customerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\customerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'customerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\customerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [customerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [customerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [customerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [customerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [customerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [customerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [customerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [customerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [customerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [customerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [customerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [customerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [customerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [customerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [customerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [customerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [customerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [customerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [customerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [customerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [customerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [customerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [customerDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [customerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [customerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [customerDB] SET  MULTI_USER 
GO
ALTER DATABASE [customerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [customerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [customerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [customerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [customerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [customerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'customerDB', N'ON'
GO
ALTER DATABASE [customerDB] SET QUERY_STORE = OFF
GO
USE [customerDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/27/2022 12:56:41 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 6/27/2022 12:56:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[StateId] [int] NOT NULL,
	[LgaId] [int] NOT NULL,
	[isVerified] [bit] NOT NULL,
	[DateVerified] [datetime2](7) NULL,
	[DateCreated] [datetime2](7) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lga]    Script Date: 6/27/2022 12:56:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lga](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[localId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[lgaName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lga] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtpGenerated]    Script Date: 6/27/2022 12:56:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtpGenerated](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerPhoneNo] [nvarchar](max) NULL,
	[OTP] [nvarchar](max) NULL,
	[DateGenerated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OtpGenerated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 6/27/2022 12:56:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220626214559_InitialMigrations', N'6.0.6')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [PhoneNumber], [EmailAddress], [Salt], [PasswordHash], [StateId], [LgaId], [isVerified], [DateVerified], [DateCreated]) VALUES (1, N'07065903222', N'user1@gmail.com', N'b2c1cc44c6625654cfd32ac4f0458d17', N'c57ef1fb8c8964e6107ec31cc92b2544bcd9bdc50310f919cb756e55f270608b', 1, 1, 0, NULL, CAST(N'2022-06-26T23:32:34.4546685' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [PhoneNumber], [EmailAddress], [Salt], [PasswordHash], [StateId], [LgaId], [isVerified], [DateVerified], [DateCreated]) VALUES (2, N'09087909888', N'user2@gmail.com', N'4f843bf1553dd5310f95932a287f6f5c', N'a1d2cf5d2fa107ec6156dc326bc5ace2e6a5d114c60e5b538e2b5b766183c4a5', 1, 1, 0, NULL, CAST(N'2022-06-27T00:08:39.7322895' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [PhoneNumber], [EmailAddress], [Salt], [PasswordHash], [StateId], [LgaId], [isVerified], [DateVerified], [DateCreated]) VALUES (3, N'07144332271', N'user@example.com', N'e4b5d676d2e6e58006cc23eb6156439c', N'f597e7e5f6582138a3d08ee6b2f9b58e2979f0bf2a28dd57bfae2fedfb413b18', 2, 17, 1, CAST(N'2022-06-27T00:18:40.6929271' AS DateTime2), CAST(N'2022-06-27T00:14:16.9681405' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [PhoneNumber], [EmailAddress], [Salt], [PasswordHash], [StateId], [LgaId], [isVerified], [DateVerified], [DateCreated]) VALUES (4, N'08038193553', N'user233@example.com', N'72889e430c586c6dd3cd427dbece067d', N'9393ff00e5e5ffce1d185d4dba27fcaaabd77d8a80cdafd1d68b732a8d3ba8fa', 3, 63, 1, CAST(N'2022-06-27T00:52:30.5125083' AS DateTime2), CAST(N'2022-06-27T00:51:45.0796235' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Lga] ON 

INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (1, 1, 1, N'Aba South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (2, 2, 1, N'Arochukwu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (3, 3, 1, N'Bende')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (4, 4, 1, N'Ikwuano')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (5, 5, 1, N'Isiala Ngwa North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (6, 6, 1, N'Isiala Ngwa South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (7, 7, 1, N'Isuikwuato')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (8, 8, 1, N'Obi Ngwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (9, 9, 1, N'Ohafia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (10, 10, 1, N'Osisioma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (11, 11, 1, N'Ugwunagbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (12, 12, 1, N'Ukwa East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (13, 13, 1, N'Ukwa West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (14, 14, 1, N'Umuahia North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (15, 15, 1, N'Umuahia South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (16, 16, 1, N'Umu Nneochi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (17, 17, 2, N'Fufure')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (18, 18, 2, N'Ganye')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (19, 19, 2, N'Gayuk')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (20, 20, 2, N'Gombi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (21, 21, 2, N'Grie')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (22, 22, 2, N'Hong')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (23, 23, 2, N'Jada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (24, 24, 2, N'Lamurde')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (25, 25, 2, N'Madagali')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (26, 26, 2, N'Maiha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (27, 27, 2, N'Mayo Belwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (28, 28, 2, N'Michika')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (29, 29, 2, N'Mubi North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (30, 30, 2, N'Mubi South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (31, 31, 2, N'Numan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (32, 32, 2, N'Shelleng')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (33, 33, 2, N'Song')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (34, 34, 2, N'Toungo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (35, 35, 2, N'Yola North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (36, 36, 2, N'Yola South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (37, 37, 3, N'Eastern Obolo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (38, 38, 3, N'Eket')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (39, 39, 3, N'Esit Eket')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (40, 40, 3, N'Essien Udim')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (41, 41, 3, N'Etim Ekpo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (42, 42, 3, N'Etinan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (43, 43, 3, N'Ibeno')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (44, 44, 3, N'Ibesikpo Asutan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (45, 45, 3, N'Ibiono-Ibom')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (46, 46, 3, N'Ika')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (47, 47, 3, N'Ikono')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (48, 48, 3, N'Ikot Abasi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (49, 49, 3, N'Ikot Ekpene')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (50, 50, 3, N'Ini')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (51, 51, 3, N'Itu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (52, 52, 3, N'Mbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (53, 53, 3, N'Mkpat-Enin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (54, 54, 3, N'Nsit-Atai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (55, 55, 3, N'Nsit-Ibom')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (56, 56, 3, N'Nsit-Ubium')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (57, 57, 3, N'Obot Akara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (58, 58, 3, N'Okobo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (59, 59, 3, N'Onna')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (60, 60, 3, N'Oron')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (61, 61, 3, N'Oruk Anam')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (62, 62, 3, N'Udung-Uko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (63, 63, 3, N'Ukanafun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (64, 64, 3, N'Uruan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (65, 65, 3, N'Urue-Offong/Oruko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (66, 66, 3, N'Uyo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (67, 67, 4, N'Anambra East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (68, 68, 4, N'Anambra West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (69, 69, 4, N'Anaocha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (70, 70, 4, N'Awka North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (71, 71, 4, N'Awka South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (72, 72, 4, N'Ayamelum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (73, 73, 4, N'Dunukofia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (74, 74, 4, N'Ekwusigo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (75, 75, 4, N'Idemili North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (76, 76, 4, N'Idemili South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (77, 77, 4, N'Ihiala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (78, 78, 4, N'Njikoka')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (79, 79, 4, N'Nnewi North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (80, 80, 4, N'Nnewi South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (81, 81, 4, N'Ogbaru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (82, 82, 4, N'Onitsha North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (83, 83, 4, N'Onitsha South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (84, 84, 4, N'Orumba North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (85, 85, 4, N'Orumba South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (86, 86, 4, N'Oyi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (87, 87, 5, N'Bauchi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (88, 88, 5, N'Bogoro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (89, 89, 5, N'Damban')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (90, 90, 5, N'Darazo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (91, 91, 5, N'Dass')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (92, 92, 5, N'Gamawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (93, 93, 5, N'Ganjuwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (94, 94, 5, N'Giade')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (95, 95, 5, N'Itas/Gadau')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (96, 96, 5, N'Jama''are')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (97, 97, 5, N'Katagum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (98, 98, 5, N'Kirfi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (99, 99, 5, N'Misau')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (100, 100, 5, N'Ningi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (101, 101, 5, N'Shira')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (102, 102, 5, N'Tafawa Balewa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (103, 103, 5, N'Toro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (104, 104, 5, N'Warji')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (105, 105, 5, N'Zaki')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (106, 106, 6, N'Ekeremor')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (107, 107, 6, N'Kolokuma/Opokuma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (108, 108, 6, N'Nembe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (109, 109, 6, N'Ogbia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (110, 110, 6, N'Sagbama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (111, 111, 6, N'Southern Ijaw')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (112, 112, 6, N'Yenagoa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (113, 113, 7, N'Apa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (114, 114, 7, N'Ado')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (115, 115, 7, N'Buruku')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (116, 116, 7, N'Gboko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (117, 117, 7, N'Guma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (118, 118, 7, N'Gwer East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (119, 119, 7, N'Gwer West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (120, 120, 7, N'Katsina-Ala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (121, 121, 7, N'Konshisha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (122, 122, 7, N'Kwande')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (123, 123, 7, N'Logo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (124, 124, 7, N'Makurdi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (125, 125, 7, N'Obi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (126, 126, 7, N'Ogbadibo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (127, 127, 7, N'Ohimini')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (128, 128, 7, N'Oju')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (129, 129, 7, N'Okpokwu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (130, 130, 7, N'Oturkpo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (131, 131, 7, N'Tarka')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (132, 132, 7, N'Ukum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (133, 133, 7, N'Ushongo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (134, 134, 7, N'Vandeikya')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (135, 135, 8, N'Askira/Uba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (136, 136, 8, N'Bama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (137, 137, 8, N'Bayo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (138, 138, 8, N'Biu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (139, 139, 8, N'Chibok')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (140, 140, 8, N'Damboa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (141, 141, 8, N'Dikwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (142, 142, 8, N'Gubio')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (143, 143, 8, N'Guzamala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (144, 144, 8, N'Gwoza')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (145, 145, 8, N'Hawul')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (146, 146, 8, N'Jere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (147, 147, 8, N'Kaga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (148, 148, 8, N'Kala/Balge')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (149, 149, 8, N'Konduga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (150, 150, 8, N'Kukawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (151, 151, 8, N'Kwaya Kusar')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (152, 152, 8, N'Mafa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (153, 153, 8, N'Magumeri')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (154, 154, 8, N'Maiduguri')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (155, 155, 8, N'Marte')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (156, 156, 8, N'Mobbar')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (157, 157, 8, N'Monguno')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (158, 158, 8, N'Ngala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (159, 159, 8, N'Nganzai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (160, 160, 8, N'Shani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (161, 161, 9, N'Akamkpa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (162, 162, 9, N'Akpabuyo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (163, 163, 9, N'Bakassi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (164, 164, 9, N'Bekwarra')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (165, 165, 9, N'Biase')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (166, 166, 9, N'Boki')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (167, 167, 9, N'Calabar Municipal')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (168, 168, 9, N'Calabar South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (169, 169, 9, N'Etung')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (170, 170, 9, N'Ikom')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (171, 171, 9, N'Obanliku')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (172, 172, 9, N'Obubra')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (173, 173, 9, N'Obudu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (174, 174, 9, N'Odukpani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (175, 175, 9, N'Ogoja')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (176, 176, 9, N'Yakuur')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (177, 177, 9, N'Yala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (178, 178, 10, N'Aniocha South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (179, 179, 10, N'Bomadi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (180, 180, 10, N'Burutu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (181, 181, 10, N'Ethiope East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (182, 182, 10, N'Ethiope West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (183, 183, 10, N'Ika North East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (184, 184, 10, N'Ika South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (185, 185, 10, N'Isoko North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (186, 186, 10, N'Isoko South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (187, 187, 10, N'Ndokwa East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (188, 188, 10, N'Ndokwa West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (189, 189, 10, N'Okpe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (190, 190, 10, N'Oshimili North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (191, 191, 10, N'Oshimili South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (192, 192, 10, N'Patani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (193, 193, 10, N'Sapele')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (194, 194, 10, N'Udu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (195, 195, 10, N'Ughelli North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (196, 196, 10, N'Ughelli South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (197, 197, 10, N'Ukwuani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (198, 198, 10, N'Uvwie')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (199, 199, 10, N'Warri North')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (200, 200, 10, N'Warri South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (201, 201, 10, N'Warri South West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (202, 202, 11, N'Afikpo North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (203, 203, 11, N'Afikpo South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (204, 204, 11, N'Ebonyi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (205, 205, 11, N'Ezza North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (206, 206, 11, N'Ezza South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (207, 207, 11, N'Ikwo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (208, 208, 11, N'Ishielu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (209, 209, 11, N'Ivo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (210, 210, 11, N'Izzi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (211, 211, 11, N'Ohaozara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (212, 212, 11, N'Ohaukwu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (213, 213, 11, N'Onicha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (214, 214, 12, N'Egor')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (215, 215, 12, N'Esan Central')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (216, 216, 12, N'Esan North-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (217, 217, 12, N'Esan South-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (218, 218, 12, N'Esan West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (219, 219, 12, N'Etsako Central')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (220, 220, 12, N'Etsako East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (221, 221, 12, N'Etsako West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (222, 222, 12, N'Igueben')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (223, 223, 12, N'Ikpoba Okha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (224, 224, 12, N'Orhionmwon')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (225, 225, 12, N'Oredo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (226, 226, 12, N'Ovia North-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (227, 227, 12, N'Ovia South-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (228, 228, 12, N'Owan East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (229, 229, 12, N'Owan West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (230, 230, 12, N'Uhunmwonde')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (231, 231, 13, N'Efon')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (232, 232, 13, N'Ekiti East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (233, 233, 13, N'Ekiti South-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (234, 234, 13, N'Ekiti West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (235, 235, 13, N'Emure')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (236, 236, 13, N'Gbonyin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (237, 237, 13, N'Ido Osi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (238, 238, 13, N'Ijero')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (239, 239, 13, N'Ikere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (240, 240, 13, N'Ikole')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (241, 241, 13, N'Ilejemeje')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (242, 242, 13, N'Irepodun/Ifelodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (243, 243, 13, N'Ise/Orun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (244, 244, 13, N'Moba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (245, 245, 13, N'Oye')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (246, 246, 14, N'Awgu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (247, 247, 14, N'Enugu East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (248, 248, 14, N'Enugu North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (249, 249, 14, N'Enugu South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (250, 250, 14, N'Ezeagu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (251, 251, 14, N'Igbo Etiti')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (252, 252, 14, N'Igbo Eze North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (253, 253, 14, N'Igbo Eze South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (254, 254, 14, N'Isi Uzo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (255, 255, 14, N'Nkanu East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (256, 256, 14, N'Nkanu West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (257, 257, 14, N'Nsukka')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (258, 258, 14, N'Oji River')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (259, 259, 14, N'Udenu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (260, 260, 14, N'Udi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (261, 261, 14, N'Uzo Uwani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (262, 262, 15, N'Bwari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (263, 263, 15, N'Gwagwalada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (264, 264, 15, N'Kuje')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (265, 265, 15, N'Kwali')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (266, 266, 15, N'Municipal Area Council')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (267, 267, 16, N'Balanga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (268, 268, 16, N'Billiri')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (269, 269, 16, N'Dukku')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (270, 270, 16, N'Funakaye')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (271, 271, 16, N'Gombe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (272, 272, 16, N'Kaltungo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (273, 273, 16, N'Kwami')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (274, 274, 16, N'Nafada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (275, 275, 16, N'Shongom')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (276, 276, 16, N'Yamaltu/Deba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (277, 277, 17, N'Ahiazu Mbaise')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (278, 278, 17, N'Ehime Mbano')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (279, 279, 17, N'Ezinihitte')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (280, 280, 17, N'Ideato North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (281, 281, 17, N'Ideato South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (282, 282, 17, N'Ihitte/Uboma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (283, 283, 17, N'Ikeduru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (284, 284, 17, N'Isiala Mbano')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (285, 285, 17, N'Isu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (286, 286, 17, N'Mbaitoli')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (287, 287, 17, N'Ngor Okpala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (288, 288, 17, N'Njaba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (289, 289, 17, N'Nkwerre')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (290, 290, 17, N'Nwangele')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (291, 291, 17, N'Obowo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (292, 292, 17, N'Oguta')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (293, 293, 17, N'Ohaji/Egbema')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (294, 294, 17, N'Okigwe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (295, 295, 17, N'Orlu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (296, 296, 17, N'Orsu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (297, 297, 17, N'Oru East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (298, 298, 17, N'Oru West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (299, 299, 17, N'Owerri Municipal')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (300, 300, 17, N'Owerri North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (301, 301, 17, N'Owerri West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (302, 302, 17, N'Unuimo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (303, 303, 18, N'Babura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (304, 304, 18, N'Biriniwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (305, 305, 18, N'Birnin Kudu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (306, 306, 18, N'Buji')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (307, 307, 18, N'Dutse')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (308, 308, 18, N'Gagarawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (309, 309, 18, N'Garki')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (310, 310, 18, N'Gumel')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (311, 311, 18, N'Guri')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (312, 312, 18, N'Gwaram')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (313, 313, 18, N'Gwiwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (314, 314, 18, N'Hadejia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (315, 315, 18, N'Jahun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (316, 316, 18, N'Kafin Hausa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (317, 317, 18, N'Kazaure')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (318, 318, 18, N'Kiri Kasama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (319, 319, 18, N'Kiyawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (320, 320, 18, N'Kaugama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (321, 321, 18, N'Maigatari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (322, 322, 18, N'Malam Madori')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (323, 323, 18, N'Miga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (324, 324, 18, N'Ringim')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (325, 325, 18, N'Roni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (326, 326, 18, N'Sule Tankarkar')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (327, 327, 18, N'Taura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (328, 328, 18, N'Yankwashi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (329, 329, 19, N'Chikun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (330, 330, 19, N'Giwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (331, 331, 19, N'Igabi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (332, 332, 19, N'Ikara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (333, 333, 19, N'Jaba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (334, 334, 19, N'Jema''a')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (335, 335, 19, N'Kachia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (336, 336, 19, N'Kaduna North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (337, 337, 19, N'Kaduna South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (338, 338, 19, N'Kagarko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (339, 339, 19, N'Kajuru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (340, 340, 19, N'Kaura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (341, 341, 19, N'Kauru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (342, 342, 19, N'Kubau')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (343, 343, 19, N'Kudan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (344, 344, 19, N'Lere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (345, 345, 19, N'Makarfi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (346, 346, 19, N'Sabon Gari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (347, 347, 19, N'Sanga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (348, 348, 19, N'Soba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (349, 349, 19, N'Zangon Kataf')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (350, 350, 19, N'Zaria')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (351, 351, 20, N'Albasu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (352, 352, 20, N'Bagwai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (353, 353, 20, N'Bebeji')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (354, 354, 20, N'Bichi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (355, 355, 20, N'Bunkure')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (356, 356, 20, N'Dala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (357, 357, 20, N'Dambatta')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (358, 358, 20, N'Dawakin Kudu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (359, 359, 20, N'Dawakin Tofa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (360, 360, 20, N'Doguwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (361, 361, 20, N'Fagge')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (362, 362, 20, N'Gabasawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (363, 363, 20, N'Garko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (364, 364, 20, N'Garun Mallam')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (365, 365, 20, N'Gaya')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (366, 366, 20, N'Gezawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (367, 367, 20, N'Gwale')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (368, 368, 20, N'Gwarzo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (369, 369, 20, N'Kabo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (370, 370, 20, N'Kano Municipal')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (371, 371, 20, N'Karaye')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (372, 372, 20, N'Kibiya')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (373, 373, 20, N'Kiru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (374, 374, 20, N'Kumbotso')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (375, 375, 20, N'Kunchi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (376, 376, 20, N'Kura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (377, 377, 20, N'Madobi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (378, 378, 20, N'Makoda')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (379, 379, 20, N'Minjibir')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (380, 380, 20, N'Nasarawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (381, 381, 20, N'Rano')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (382, 382, 20, N'Rimin Gado')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (383, 383, 20, N'Rogo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (384, 384, 20, N'Shanono')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (385, 385, 20, N'Sumaila')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (386, 386, 20, N'Takai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (387, 387, 20, N'Tarauni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (388, 388, 20, N'Tofa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (389, 389, 20, N'Tsanyawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (390, 390, 20, N'Tudun Wada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (391, 391, 20, N'Ungogo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (392, 392, 20, N'Warawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (393, 393, 20, N'Wudil')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (394, 394, 21, N'Batagarawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (395, 395, 21, N'Batsari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (396, 396, 21, N'Baure')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (397, 397, 21, N'Bindawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (398, 398, 21, N'Charanchi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (399, 399, 21, N'Dandume')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (400, 400, 21, N'Danja')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (401, 401, 21, N'Dan Musa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (402, 402, 21, N'Daura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (403, 403, 21, N'Dutsi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (404, 404, 21, N'Dutsin Ma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (405, 405, 21, N'Faskari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (406, 406, 21, N'Funtua')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (407, 407, 21, N'Ingawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (408, 408, 21, N'Jibia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (409, 409, 21, N'Kafur')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (410, 410, 21, N'Kaita')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (411, 411, 21, N'Kankara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (412, 412, 21, N'Kankia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (413, 413, 21, N'Katsina')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (414, 414, 21, N'Kurfi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (415, 415, 21, N'Kusada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (416, 416, 21, N'Mai''Adua')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (417, 417, 21, N'Malumfashi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (418, 418, 21, N'Mani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (419, 419, 21, N'Mashi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (420, 420, 21, N'Matazu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (421, 421, 21, N'Musawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (422, 422, 21, N'Rimi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (423, 423, 21, N'Sabuwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (424, 424, 21, N'Safana')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (425, 425, 21, N'Sandamu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (426, 426, 21, N'Zango')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (427, 427, 22, N'Arewa Dandi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (428, 428, 22, N'Argungu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (429, 429, 22, N'Augie')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (430, 430, 22, N'Bagudo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (431, 431, 22, N'Birnin Kebbi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (432, 432, 22, N'Bunza')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (433, 433, 22, N'Dandi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (434, 434, 22, N'Fakai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (435, 435, 22, N'Gwandu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (436, 436, 22, N'Jega')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (437, 437, 22, N'Kalgo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (438, 438, 22, N'Koko/Besse')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (439, 439, 22, N'Maiyama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (440, 440, 22, N'Ngaski')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (441, 441, 22, N'Sakaba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (442, 442, 22, N'Shanga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (443, 443, 22, N'Suru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (444, 444, 22, N'Wasagu/Danko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (445, 445, 22, N'Yauri')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (446, 446, 22, N'Zuru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (447, 447, 23, N'Ajaokuta')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (448, 448, 23, N'Ankpa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (449, 449, 23, N'Bassa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (450, 450, 23, N'Dekina')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (451, 451, 23, N'Ibaji')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (452, 452, 23, N'Idah')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (453, 453, 23, N'Igalamela Odolu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (454, 454, 23, N'Ijumu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (455, 455, 23, N'Kabba/Bunu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (456, 456, 23, N'Kogi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (457, 457, 23, N'Lokoja')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (458, 458, 23, N'Mopa Muro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (459, 459, 23, N'Ofu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (460, 460, 23, N'Ogori/Magongo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (461, 461, 23, N'Okehi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (462, 462, 23, N'Okene')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (463, 463, 23, N'Olamaboro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (464, 464, 23, N'Omala')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (465, 465, 23, N'Yagba East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (466, 466, 23, N'Yagba West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (467, 467, 24, N'Baruten')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (468, 468, 24, N'Edu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (469, 469, 24, N'Ekiti')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (470, 470, 24, N'Ifelodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (471, 471, 24, N'Ilorin East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (472, 472, 24, N'Ilorin South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (473, 473, 24, N'Ilorin West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (474, 474, 24, N'Irepodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (475, 475, 24, N'Isin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (476, 476, 24, N'Kaiama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (477, 477, 24, N'Moro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (478, 478, 24, N'Offa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (479, 479, 24, N'Oke Ero')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (480, 480, 24, N'Oyun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (481, 481, 24, N'Pategi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (482, 482, 25, N'Ajeromi-Ifelodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (483, 483, 25, N'Alimosho')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (484, 484, 25, N'Amuwo-Odofin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (485, 485, 25, N'Apapa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (486, 486, 25, N'Badagry')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (487, 487, 25, N'Epe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (488, 488, 25, N'Eti Osa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (489, 489, 25, N'Ibeju-Lekki')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (490, 490, 25, N'Ifako-Ijaiye')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (491, 491, 25, N'Ikeja')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (492, 492, 25, N'Ikorodu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (493, 493, 25, N'Kosofe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (494, 494, 25, N'Lagos Island')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (495, 495, 25, N'Lagos Mainland')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (496, 496, 25, N'Mushin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (497, 497, 25, N'Ojo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (498, 498, 25, N'Oshodi-Isolo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (499, 499, 25, N'Shomolu')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (500, 500, 25, N'Surulere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (501, 501, 26, N'Awe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (502, 502, 26, N'Doma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (503, 503, 26, N'Karu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (504, 504, 26, N'Keana')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (505, 505, 26, N'Keffi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (506, 506, 26, N'Kokona')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (507, 507, 26, N'Lafia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (508, 508, 26, N'Nasarawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (509, 509, 26, N'Nasarawa Egon')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (510, 510, 26, N'Obi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (511, 511, 26, N'Toto')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (512, 512, 26, N'Wamba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (513, 513, 27, N'Agwara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (514, 514, 27, N'Bida')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (515, 515, 27, N'Borgu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (516, 516, 27, N'Bosso')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (517, 517, 27, N'Chanchaga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (518, 518, 27, N'Edati')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (519, 519, 27, N'Gbako')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (520, 520, 27, N'Gurara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (521, 521, 27, N'Katcha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (522, 522, 27, N'Kontagora')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (523, 523, 27, N'Lapai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (524, 524, 27, N'Lavun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (525, 525, 27, N'Magama')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (526, 526, 27, N'Mariga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (527, 527, 27, N'Mashegu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (528, 528, 27, N'Mokwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (529, 529, 27, N'Moya')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (530, 530, 27, N'Paikoro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (531, 531, 27, N'Rafi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (532, 532, 27, N'Rijau')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (533, 533, 27, N'Shiroro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (534, 534, 27, N'Suleja')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (535, 535, 27, N'Tafa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (536, 536, 27, N'Wushishi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (537, 537, 28, N'Abeokuta South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (538, 538, 28, N'Ado-Odo/Ota')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (539, 539, 28, N'Egbado North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (540, 540, 28, N'Egbado South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (541, 541, 28, N'Ewekoro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (542, 542, 28, N'Ifo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (543, 543, 28, N'Ijebu East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (544, 544, 28, N'Ijebu North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (545, 545, 28, N'Ijebu North East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (546, 546, 28, N'Ijebu Ode')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (547, 547, 28, N'Ikenne')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (548, 548, 28, N'Imeko Afon')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (549, 549, 28, N'Ipokia')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (550, 550, 28, N'Obafemi Owode')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (551, 551, 28, N'Odeda')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (552, 552, 28, N'Odogbolu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (553, 553, 28, N'Ogun Waterside')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (554, 554, 28, N'Remo North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (555, 555, 28, N'Shagamu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (556, 556, 29, N'Akoko North-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (557, 557, 29, N'Akoko South-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (558, 558, 29, N'Akoko South-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (559, 559, 29, N'Akure North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (560, 560, 29, N'Akure South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (561, 561, 29, N'Ese Odo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (562, 562, 29, N'Idanre')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (563, 563, 29, N'Ifedore')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (564, 564, 29, N'Ilaje')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (565, 565, 29, N'Ile Oluji/Okeigbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (566, 566, 29, N'Irele')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (567, 567, 29, N'Odigbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (568, 568, 29, N'Okitipupa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (569, 569, 29, N'Ondo East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (570, 570, 29, N'Ondo West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (571, 571, 29, N'Ose')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (572, 572, 29, N'Owo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (573, 573, 30, N'Atakunmosa West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (574, 574, 30, N'Aiyedaade')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (575, 575, 30, N'Aiyedire')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (576, 576, 30, N'Boluwaduro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (577, 577, 30, N'Boripe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (578, 578, 30, N'Ede North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (579, 579, 30, N'Ede South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (580, 580, 30, N'Ife Central')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (581, 581, 30, N'Ife East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (582, 582, 30, N'Ife North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (583, 583, 30, N'Ife South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (584, 584, 30, N'Egbedore')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (585, 585, 30, N'Ejigbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (586, 586, 30, N'Ifedayo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (587, 587, 30, N'Ifelodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (588, 588, 30, N'Ila')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (589, 589, 30, N'Ilesa East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (590, 590, 30, N'Ilesa West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (591, 591, 30, N'Irepodun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (592, 592, 30, N'Irewole')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (593, 593, 30, N'Isokan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (594, 594, 30, N'Iwo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (595, 595, 30, N'Obokun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (596, 596, 30, N'Odo Otin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (597, 597, 30, N'Ola Oluwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (598, 598, 30, N'Olorunda')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (599, 599, 30, N'Oriade')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (600, 600, 30, N'Orolu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (601, 601, 30, N'Osogbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (602, 602, 31, N'Akinyele')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (603, 603, 31, N'Atiba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (604, 604, 31, N'Atisbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (605, 605, 31, N'Egbeda')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (606, 606, 31, N'Ibadan North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (607, 607, 31, N'Ibadan North-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (608, 608, 31, N'Ibadan North-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (609, 609, 31, N'Ibadan South-East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (610, 610, 31, N'Ibadan South-West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (611, 611, 31, N'Ibarapa Central')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (612, 612, 31, N'Ibarapa East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (613, 613, 31, N'Ibarapa North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (614, 614, 31, N'Ido')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (615, 615, 31, N'Irepo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (616, 616, 31, N'Iseyin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (617, 617, 31, N'Itesiwaju')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (618, 618, 31, N'Iwajowa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (619, 619, 31, N'Kajola')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (620, 620, 31, N'Lagelu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (621, 621, 31, N'Ogbomosho North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (622, 622, 31, N'Ogbomosho South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (623, 623, 31, N'Ogo Oluwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (624, 624, 31, N'Olorunsogo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (625, 625, 31, N'Oluyole')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (626, 626, 31, N'Ona Ara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (627, 627, 31, N'Orelope')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (628, 628, 31, N'Ori Ire')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (629, 629, 31, N'Oyo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (630, 630, 31, N'Oyo East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (631, 631, 31, N'Saki East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (632, 632, 31, N'Saki West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (633, 633, 31, N'Surulere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (634, 634, 32, N'Barkin Ladi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (635, 635, 32, N'Bassa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (636, 636, 32, N'Jos East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (637, 637, 32, N'Jos North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (638, 638, 32, N'Jos South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (639, 639, 32, N'Kanam')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (640, 640, 32, N'Kanke')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (641, 641, 32, N'Langtang South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (642, 642, 32, N'Langtang North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (643, 643, 32, N'Mangu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (644, 644, 32, N'Mikang')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (645, 645, 32, N'Pankshin')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (646, 646, 32, N'Qua''an Pan')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (647, 647, 32, N'Riyom')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (648, 648, 32, N'Shendam')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (649, 649, 32, N'Wase')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (650, 650, 33, N'Ahoada East')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (651, 651, 33, N'Ahoada West')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (652, 652, 33, N'Akuku-Toru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (653, 653, 33, N'Andoni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (654, 654, 33, N'Asari-Toru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (655, 655, 33, N'Bonny')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (656, 656, 33, N'Degema')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (657, 657, 33, N'Eleme')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (658, 658, 33, N'Emuoha')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (659, 659, 33, N'Etche')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (660, 660, 33, N'Gokana')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (661, 661, 33, N'Ikwerre')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (662, 662, 33, N'Khana')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (663, 663, 33, N'Obio/Akpor')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (664, 664, 33, N'Ogba/Egbema/Ndoni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (665, 665, 33, N'Ogu/Bolo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (666, 666, 33, N'Okrika')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (667, 667, 33, N'Omuma')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (668, 668, 33, N'Opobo/Nkoro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (669, 669, 33, N'Oyigbo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (670, 670, 33, N'Port Harcourt')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (671, 671, 33, N'Tai')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (672, 672, 34, N'Bodinga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (673, 673, 34, N'Dange Shuni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (674, 674, 34, N'Gada')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (675, 675, 34, N'Goronyo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (676, 676, 34, N'Gudu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (677, 677, 34, N'Gwadabawa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (678, 678, 34, N'Illela')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (679, 679, 34, N'Isa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (680, 680, 34, N'Kebbe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (681, 681, 34, N'Kware')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (682, 682, 34, N'Rabah')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (683, 683, 34, N'Sabon Birni')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (684, 684, 34, N'Shagari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (685, 685, 34, N'Silame')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (686, 686, 34, N'Sokoto North')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (687, 687, 34, N'Sokoto South')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (688, 688, 34, N'Tambuwal')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (689, 689, 34, N'Tangaza')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (690, 690, 34, N'Tureta')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (691, 691, 34, N'Wamako')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (692, 692, 34, N'Wurno')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (693, 693, 34, N'Yabo')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (694, 694, 35, N'Bali')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (695, 695, 35, N'Donga')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (696, 696, 35, N'Gashaka')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (697, 697, 35, N'Gassol')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (698, 698, 35, N'Ibi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (699, 699, 35, N'Jalingo')
GO
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (700, 700, 35, N'Karim Lamido')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (701, 701, 35, N'Kumi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (702, 702, 35, N'Lau')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (703, 703, 35, N'Sardauna')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (704, 704, 35, N'Takum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (705, 705, 35, N'Ussa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (706, 706, 35, N'Wukari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (707, 707, 35, N'Yorro')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (708, 708, 35, N'Zing')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (709, 709, 36, N'Bursari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (710, 710, 36, N'Damaturu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (711, 711, 36, N'Fika')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (712, 712, 36, N'Fune')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (713, 713, 36, N'Geidam')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (714, 714, 36, N'Gujba')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (715, 715, 36, N'Gulani')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (716, 716, 36, N'Jakusko')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (717, 717, 36, N'Karasuwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (718, 718, 36, N'Machina')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (719, 719, 36, N'Nangere')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (720, 720, 36, N'Nguru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (721, 721, 36, N'Potiskum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (722, 722, 36, N'Tarmuwa')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (723, 723, 36, N'Yunusari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (724, 724, 36, N'Yusufari')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (725, 725, 37, N'Bakura')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (726, 726, 37, N'Birnin Magaji/Kiyaw')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (727, 727, 37, N'Bukkuyum')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (728, 728, 37, N'Bungudu')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (729, 729, 37, N'Gummi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (730, 730, 37, N'Gusau')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (731, 731, 37, N'Kaura Namoda')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (732, 732, 37, N'Maradun')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (733, 733, 37, N'Maru')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (734, 734, 37, N'Shinkafi')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (735, 735, 37, N'Talata Mafara')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (736, 736, 37, N'Chafe')
INSERT [dbo].[Lga] ([Id], [localId], [StateId], [lgaName]) VALUES (737, 737, 37, N'Zurmi')
SET IDENTITY_INSERT [dbo].[Lga] OFF
GO
SET IDENTITY_INSERT [dbo].[OtpGenerated] ON 

INSERT [dbo].[OtpGenerated] ([Id], [CustomerPhoneNo], [OTP], [DateGenerated]) VALUES (1, N'07065903222', N'423644', CAST(N'2022-06-26T23:33:37.8552416' AS DateTime2))
INSERT [dbo].[OtpGenerated] ([Id], [CustomerPhoneNo], [OTP], [DateGenerated]) VALUES (2, N'09087909888', N'137352', CAST(N'2022-06-27T00:09:01.6991827' AS DateTime2))
INSERT [dbo].[OtpGenerated] ([Id], [CustomerPhoneNo], [OTP], [DateGenerated]) VALUES (3, N'07144332271', N'211082', CAST(N'2022-06-27T00:14:19.0018980' AS DateTime2))
INSERT [dbo].[OtpGenerated] ([Id], [CustomerPhoneNo], [OTP], [DateGenerated]) VALUES (4, N'08038193553', N'873459', CAST(N'2022-06-27T00:51:50.0062021' AS DateTime2))
SET IDENTITY_INSERT [dbo].[OtpGenerated] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName]) VALUES (1, N'Abia State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (2, N'Adamawa State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (3, N'Akwa Ibom State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (4, N'Anambra State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (5, N'Bauchi State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (6, N'Bayelsa State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (7, N'Benue State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (8, N'Borno State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (9, N'Cross River State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (10, N'Delta State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (11, N'Ebonyi State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (12, N'Edo State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (13, N'Ekiti State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (14, N'Enugu State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (15, N'FCT')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (16, N'Gombe State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (17, N'Imo State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (18, N'Jigawa State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (19, N'Kaduna State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (20, N'Kano State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (21, N'Katsina State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (22, N'Kebbi State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (23, N'Kogi State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (24, N'Kwara State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (25, N'Lagos State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (26, N'Nasarawa State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (27, N'Niger State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (28, N'Ogun State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (29, N'Ondo State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (30, N'Osun State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (31, N'Oyo State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (32, N'Plateau State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (33, N'Rivers State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (34, N'Sokoto State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (35, N'Taraba State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (36, N'Yobe State')
INSERT [dbo].[State] ([Id], [StateName]) VALUES (37, N'Zamfara State')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
/****** Object:  Index [IX_Customers_LgaId]    Script Date: 6/27/2022 12:56:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customers_LgaId] ON [dbo].[Customers]
(
	[LgaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customers_StateId]    Script Date: 6/27/2022 12:56:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customers_StateId] ON [dbo].[Customers]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lga_StateId]    Script Date: 6/27/2022 12:56:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Lga_StateId] ON [dbo].[Lga]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Lga_LgaId] FOREIGN KEY([LgaId])
REFERENCES [dbo].[Lga] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Lga_LgaId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_State_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_State_StateId]
GO
ALTER TABLE [dbo].[Lga]  WITH CHECK ADD  CONSTRAINT [FK_Lga_State_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Lga] CHECK CONSTRAINT [FK_Lga_State_StateId]
GO
USE [master]
GO
ALTER DATABASE [customerDB] SET  READ_WRITE 
GO
