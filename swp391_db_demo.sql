USE [master]
GO
/****** Object:  Database [ShoesOnlineShop]    Script Date: 14/08/2025 17:12:59 ******/
CREATE DATABASE [ShoesOnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoesOnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoesOnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoesOnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoesOnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoesOnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesOnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesOnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoesOnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesOnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesOnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoesOnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesOnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoesOnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesOnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesOnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesOnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesOnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoesOnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoesOnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoesOnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoesOnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoesOnlineShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feedback_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[OrderDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[PV_ID] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[Created_At] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NULL,
	[Sale_ID] [int] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
[Gender] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[ImgID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Color] [nvarchar](20) NOT NULL,
	[ImgURL] [nvarchar](255) NOT NULL,
	[isMain] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Variant]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Variant](
	[PV_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Color] [nvarchar](20) NOT NULL,
	[Size] [nvarchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Sale_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sale] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/03/2025 17:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](15) NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (1, N'Athletic')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (2, N'Boots')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (3, N'Fashion Sneakers')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (4, N'Loafers & Slip-Ons')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (5, N'Mules & Clogs')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (6, N'OutDoor')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (7, N'Work & Safety')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([Feedback_ID], [User_ID], [Product_ID], [Rating], [Comment], [Date]) VALUES (2, 5, 1, 5, N'Great quality and comfortable! aassaas', CAST(N'2025-03-26T01:26:25.167' AS DateTime))
GO
INSERT [dbo].[Feedback] ([Feedback_ID], [User_ID], [Product_ID], [Rating], [Comment], [Date]) VALUES (4, 5, 2, 3, N'Average comfort, but good design.', CAST(N'2025-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([Feedback_ID], [User_ID], [Product_ID], [Rating], [Comment], [Date]) VALUES (6, 5, 3, 2, N'Not as expected. The color is different.', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Feedback] ([Feedback_ID], [User_ID], [Product_ID], [Rating], [Comment], [Date]) VALUES (10, 5, 4, 2, N'qqe', CAST(N'2025-03-20T14:48:24.153' AS DateTime))
GO
INSERT [dbo].[Feedback] ([Feedback_ID], [User_ID], [Product_ID], [Rating], [Comment], [Date]) VALUES (18, 5, 5, 4, N'rat tot', CAST(N'2025-03-26T01:04:14.603' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (18, 10, 15, CAST(70.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (19, 10, 16, CAST(33.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (20, 10, 31, CAST(35.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (21, 11, 15, CAST(70.30 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (22, 11, 36, CAST(88.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (23, 11, 40, CAST(120.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (24, 11, 23, CAST(70.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (25, 12, 15, CAST(70.30 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (26, 12, 16, CAST(33.15 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (27, 13, 1, CAST(69.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (28, 13, 15, CAST(70.30 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (29, 13, 31, CAST(35.25 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (30, 14, 1, CAST(69.00 AS Decimal(10, 2)), 10)
GO
INSERT [dbo].[Order_Details] ([OrderDetail_ID], [Order_ID], [PV_ID], [Price], [Quantity]) VALUES (31, 15, 1, CAST(69.00 AS Decimal(10, 2)), 4)
GO
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (1, 5, CAST(523.00 AS Decimal(10, 2)), CAST(N'2025-03-13T07:35:32.000' AS DateTime), N'Cancelled', N'easfadsaf', N'12312113')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (2, 5, CAST(417.00 AS Decimal(10, 2)), CAST(N'2025-03-13T07:36:40.000' AS DateTime), N'Cancelled', N'easfadsaf', N'12312113')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (3, 5, CAST(67.00 AS Decimal(10, 2)), CAST(N'2025-03-13T07:35:32.000' AS DateTime), N'Cancel', N'asadsad', N'456645')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (4, 5, CAST(211.00 AS Decimal(10, 2)), CAST(N'2025-03-13T08:01:09.000' AS DateTime), N'Cancelled', N'asas', N'888888')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (5, 5, CAST(310.00 AS Decimal(10, 2)), CAST(N'2025-03-13T08:06:56.000' AS DateTime), N'Cancelled', N'asas', N'888888')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (6, 5, CAST(103.00 AS Decimal(10, 2)), CAST(N'2025-03-13T08:08:51.000' AS DateTime), N'Pending', N'asas', N'888888')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (7, 5, CAST(102.00 AS Decimal(10, 2)), CAST(N'2025-03-13T08:35:20.000' AS DateTime), N'Pending', N'ádads', N'3232232')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (8, 5, CAST(347.00 AS Decimal(10, 2)), CAST(N'2025-03-13T13:41:32.887' AS DateTime), N'Cancelled', N'ádads', N'3232232')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (9, 5, CAST(69.00 AS Decimal(10, 2)), CAST(N'2025-03-13T13:43:46.247' AS DateTime), N'Cancelled', N'ádads', N'3232232')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (10, 5, CAST(312.00 AS Decimal(10, 2)), CAST(N'2025-03-13T15:19:11.907' AS DateTime), N'Pending', N'ádads', N'3232232')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (11, 5, CAST(954.60 AS Decimal(10, 2)), CAST(N'2025-03-14T00:03:42.200' AS DateTime), N'Pending', N'ádads', N'3232232')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (12, 5, CAST(103.45 AS Decimal(10, 2)), CAST(N'2025-03-17T02:24:26.497' AS DateTime), N'Cancelled', N'', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (13, 5, CAST(174.55 AS Decimal(10, 2)), CAST(N'2025-03-21T08:22:20.553' AS DateTime), N'Pending', N'ádads', N'0323223221')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (14, 5, CAST(690.00 AS Decimal(10, 2)), CAST(N'2025-03-25T01:40:35.977' AS DateTime), N'Cancelled', N'', N'')
GO
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [TotalPrice], [Created_At], [Status], [Address], [Phone]) VALUES (15, 5, CAST(276.00 AS Decimal(10, 2)), CAST(N'2025-03-25T10:20:43.017' AS DateTime), N'Pending', N'ádads', N'32322321123123')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (1, 1, NULL, N'Skechers Men''s Max Cushioning Slip-ins-Athletic Workout Running Walking Shoes with Memory Foam Sneaker', N'MULTI-PURPOSE: add performance comfort to casual occasions; wear indoor, around the house, to and from work, for travel', 69, N'Men', N'https://m.media-amazon.com/images/I/71d7YXSY11L._AC_SX395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (2, 1, 1, N'Adidas Unisex Samba Indoor Sneaker', N'Performance soccer shoes for playing on indoor surfaces', 74, N'Unisex', N'https://m.media-amazon.com/images/I/71xQ8BDE6lL._AC_SX625_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (3, 1, 3, N'Mishansha Womens Sneakers Air Cushion Running Tennis Shoes Women Lightweight Arch Support Walking Shoes', N'Mishansha womens sneakers are suitable for kinds outdoor sports, such as trail running, walking, tennis, gym fitness, weight training, cycling, jogging, garden, lawn, equestrian, basketball, rowing, athletics, volleyball, football, driving and yoga. Daily casual sports athletics shoes which can bring more enjoy to your life', 39, N'Women', N'https://m.media-amazon.com/images/I/71COUwNaY3L._AC_SY395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (4, 1, NULL, N'FitVille Wide Pickleball Shoes for Men Tennis Shoes Sneakers for All Court Racquetball Athletic Shoes for Racquet Sport | Arch Support & Wide Toe Box', N'FitVille shoes are designed for wider feet, more flexibility in the forefoot allows your foot to move more fluidly.', 70, N'Men', N'https://m.media-amazon.com/images/I/61r7In6V3JL._AC_SY395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (5, 1, NULL, N'adidas Men''s Swift Run Sneaker', N'Lightweight EVA midsole; Enjoy the comfort and performance of OrthoLite sockliner', 74, N'Men', N'https://m.media-amazon.com/images/I/71P9hMTgfDL._AC_SX395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (6, 1, 5, N'AUPERF Women Air Running Shoes Athletic Tennis Walking Shoes Lightweight Fashion Sneakers for Gym Sport Jogging', N'Comfortable & Light: Lightweight running walking shoes for women. Super comfy memory foam cushioning, feel like walking on cloud. Good arch support, soft sole like heaven and bend-resistant.', 47, N'Women', N'https://m.media-amazon.com/images/I/71ZyjAi+wPL._AC_SY395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (7, 2, 6, N'Jousen Chelsea Boots Men Lightweight Mens Boots Classic Slip On Boots Casual Boots for Men', N'Classic sneakers with cushioned support.', 47, N'Men', N'https://m.media-amazon.com/images/I/81b1IMDMeHL._AC_SX395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (8, 2, NULL, N'VJH confort Women''s Slip on Ankle Boot, Western Almond Round Toe Low Heel Elastic Chelsea Bootie', N'The soft faux suede insole padded with high-density memory foam can effectively improves the comfort of wearing, slows foot fatigue;The non-slip sole designed in low heel provide', 88, N'Women', N'https://m.media-amazon.com/images/I/61qKvUcAHQL._AC_SY395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (9, 3, NULL, N'Skechers Men''s Stamina at Upper Stitch Sneaker', N'Skechers Memory Foam cushioned comfort insole', 120, N'Men', N'https://m.media-amazon.com/images/I/710U89BdbCL._AC_SX395_.jpg')
GO
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Sale_ID], [ProductName], [Description], [Price], [Gender], [Image]) VALUES (10, 3, NULL, N'RUIDENG Platform Sneakers for Women Walking All Day | Slip Resistant Work Shoes for Women Comfortable | 2 Inch Thick Wedge Rocker Bottom', N'Cushioning: high elastic polyurethane midsole.', 40, N'Women', N'https://m.media-amazon.com/images/I/71ku1iJLulL._AC_SY395_.jpg')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Image] ON 
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (1, 1, N'Black', N'https://m.media-amazon.com/images/I/61FcC6EEf+L._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (2, 1, N'Black', N'https://m.media-amazon.com/images/I/713Z7z9pVGL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (3, 1, N'Black', N'https://m.media-amazon.com/images/I/31dmmGYbgsL._AC_US40_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (4, 1, N'Navy', N'https://m.media-amazon.com/images/I/71pHQ+5wJ2L._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (5, 1, N'Navy', N'https://m.media-amazon.com/images/I/71ESjvMSntL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (6, 1, N'Navy', N'https://m.media-amazon.com/images/I/71zL2o+fLfL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (7, 1, N'White', N'https://m.media-amazon.com/images/I/71qf8td532L._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (8, 1, N'White', N'https://m.media-amazon.com/images/I/61AxX992mVL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (9, 1, N'White', N'https://m.media-amazon.com/images/I/71mgRESBxML._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (10, 2, N'Black', N'https://m.media-amazon.com/images/I/71QMbnDxWUL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (11, 2, N'Black', N'https://m.media-amazon.com/images/I/61vptqAgM1L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (12, 2, N'Black', N'https://m.media-amazon.com/images/I/51vbp6+ZR3L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (13, 2, N'White', N'https://m.media-amazon.com/images/I/71xQ8BDE6lL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (14, 2, N'White', N'https://m.media-amazon.com/images/I/61G4jUmOD0L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (15, 2, N'White', N'https://m.media-amazon.com/images/I/51UelbYrh0L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (16, 3, N'Pink', N'https://m.media-amazon.com/images/I/71BbYFrKR5L._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (17, 3, N'Pink', N'https://m.media-amazon.com/images/I/71cEJD0xoXL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (18, 3, N'Pink', N'https://m.media-amazon.com/images/I/71HjSrwE2yL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (19, 3, N'Purple', N'https://m.media-amazon.com/images/I/71G+OrSrBfL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (20, 3, N'Purple', N'https://m.media-amazon.com/images/I/81lZdWpozqL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (21, 3, N'Purple', N'https://m.media-amazon.com/images/I/81lPpsxSEML._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (22, 4, N'Black', N'https://m.media-amazon.com/images/I/71TFzm0cc3L._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (23, 4, N'Black', N'https://m.media-amazon.com/images/I/611bbBdF7aL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (24, 4, N'Black', N'https://m.media-amazon.com/images/I/61UKvbQDWdL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (25, 4, N'Royal Blue', N'https://m.media-amazon.com/images/I/71mERgRV5TL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (26, 4, N'Royal Blue', N'https://m.media-amazon.com/images/I/613fNrWwxgL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (27, 4, N'Royal Blue', N'https://m.media-amazon.com/images/I/61TV2JTsEYL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (28, 5, N'Black', N'https://m.media-amazon.com/images/I/71ozLnN9+gL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (29, 5, N'Black', N'https://m.media-amazon.com/images/I/41xbVkBXJaL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (30, 5, N'Black', N'https://m.media-amazon.com/images/I/410Eaby43jL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (31, 5, N'White', N'https://m.media-amazon.com/images/I/71P9hMTgfDL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (32, 5, N'White', N'https://m.media-amazon.com/images/I/61FU3Akv0IL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (33, 5, N'White', N'https://m.media-amazon.com/images/I/61J1RQhyJjL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (34, 6, N'Black', N'https://m.media-amazon.com/images/I/71ZyjAi+wPL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (35, 6, N'Black', N'https://m.media-amazon.com/images/I/81y7hSCwqML._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (36, 6, N'Black', N'https://m.media-amazon.com/images/I/71m0I6wV0xL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (37, 6, N'White', N'https://m.media-amazon.com/images/I/71Cc8d6yAWL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (38, 6, N'White', N'https://m.media-amazon.com/images/I/713cGlHqM6L._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (39, 6, N'White', N'https://m.media-amazon.com/images/I/71PrrF-tlKL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (40, 7, N'Black', N'https://m.media-amazon.com/images/I/716cWnc2IpL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (41, 7, N'Black', N'https://m.media-amazon.com/images/I/71AWyYlQl0L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (42, 7, N'Black', N'https://m.media-amazon.com/images/I/81i7vc-xFBL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (43, 7, N'Brown', N'https://m.media-amazon.com/images/I/81b1IMDMeHL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (44, 7, N'Brown', N'https://m.media-amazon.com/images/I/71ljaHdxu4L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (45, 7, N'Brown', N'https://m.media-amazon.com/images/I/81i5pmCBE7L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (46, 8, N'Black', N'https://m.media-amazon.com/images/I/71vgSAbAQ1L._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (47, 8, N'Black', N'https://m.media-amazon.com/images/I/814582PqxlL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (48, 8, N'Black', N'https://m.media-amazon.com/images/I/61SZvX6g+6L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (49, 8, N'Brown', N'https://m.media-amazon.com/images/I/61qKvUcAHQL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (50, 8, N'Brown', N'https://m.media-amazon.com/images/I/81XkJqnB6TL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (51, 8, N'Brown', N'https://m.media-amazon.com/images/I/413myQ0nk3L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (52, 9, N'Black', N'https://m.media-amazon.com/images/I/71fCaRhF-3L._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (53, 9, N'Black', N'https://m.media-amazon.com/images/I/71MlaujuqgL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (54, 9, N'Black', N'https://m.media-amazon.com/images/I/61qNryw2h3L._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (55, 9, N'Grey', N'https://m.media-amazon.com/images/I/710U89BdbCL._AC_SX395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (56, 9, N'Grey', N'https://m.media-amazon.com/images/I/71tD0byqWXL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (57, 9, N'Grey', N'https://m.media-amazon.com/images/I/71rWJYm4gZL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (58, 10, N'Black', N'https://m.media-amazon.com/images/I/71JMOLFJAdL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (59, 10, N'Black', N'https://m.media-amazon.com/images/I/51hxmDiUbkL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (60, 10, N'Black', N'https://m.media-amazon.com/images/I/519EiPKxtoL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (61, 10, N'Grey', N'https://m.media-amazon.com/images/I/71yHziyWnIL._AC_SY395_.jpg', 1)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (62, 10, N'Grey', N'https://m.media-amazon.com/images/I/618u--DYL2L._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (63, 10, N'Grey', N'https://m.media-amazon.com/images/I/51K7Imv2RoL._AC_SY395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (64, 1, N'Black', N'https://m.media-amazon.com/images/I/71pDctqFVRL._AC_SX395_.jpg', 0)
GO
INSERT [dbo].[Product_Image] ([ImgID], [Product_ID], [Color], [ImgURL], [isMain]) VALUES (68, 1, N'Black', N'https://m.media-amazon.com/images/I/81icu5Y5M9L._AC_SX500_.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[Product_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Variant] ON 
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (1, 1, N'Black', N'7', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (2, 1, N'Black', N'7.5', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (3, 1, N'Black', N'8', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (4, 1, N'Black', N'9', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (5, 1, N'Navy', N'8', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (6, 1, N'Navy', N'8.5', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (7, 1, N'Navy', N'9', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (8, 1, N'White', N'9', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (9, 1, N'White', N'9.5', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (10, 1, N'White', N'10', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (11, 1, N'White', N'11', 10)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (12, 2, N'White', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (13, 2, N'White', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (14, 2, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (15, 2, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (16, 3, N'Pink', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (17, 3, N'Pink', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (18, 3, N'Purple', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (19, 3, N'Purple', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (20, 4, N'Black', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (21, 4, N'Black', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (22, 4, N'Royal Blue', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (23, 4, N'Royal Blue', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (24, 5, N'White', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (25, 5, N'White', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (26, 5, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (27, 5, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (28, 6, N'White', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (29, 6, N'White', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (30, 6, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (31, 6, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (32, 7, N'Brown', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (33, 7, N'Brown', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (34, 7, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (35, 7, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (36, 8, N'Brown', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (37, 8, N'Brown', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (38, 8, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (39, 8, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (40, 9, N'Grey', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (41, 9, N'Grey', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (42, 9, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (43, 9, N'Black', N'10', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (44, 10, N'Grey', N'10', 50)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (45, 10, N'Grey', N'10.5', 30)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (46, 10, N'Black', N'9', 40)
GO
INSERT [dbo].[Product_Variant] ([PV_ID], [Product_ID], [Color], [Size], [Quantity]) VALUES (47, 10, N'Black', N'10', 40)
GO
SET IDENTITY_INSERT [dbo].[Product_Variant] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (1, 5)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (2, 10)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (3, 15)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (4, 20)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (5, 25)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (6, 30)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (7, 35)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (8, 40)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (9, 45)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (10, 50)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (11, 55)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (12, 60)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (13, 65)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (14, 70)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (15, 75)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (16, 80)
GO
INSERT [dbo].[Sale] ([Sale_ID], [Sale]) VALUES (17, 85)
GO
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [Email], [Password], [Address], [Phone], [Role]) VALUES (1, N'John Doe', N'johndoe@example.com', N'password123', N'123 Main St, NY', N'1234567890', N'User')
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [Email], [Password], [Address], [Phone], [Role]) VALUES (2, N'admin', N'admin@gmail.com', N'123456', N'456 Elm St, CA', N'0987654321', N'Admin')
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [Email], [Password], [Address], [Phone], [Role]) VALUES (3, N'Alice Johnson', N'alicej@example.com', N'alicepass789', N'789 Oak St, TX', N'1122334455', N'User')
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [Email], [Password], [Address], [Phone], [Role]) VALUES (5, N'ducminh', N'leducminh2934@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'adasda', N'3232232', N'User')
GO
INSERT [dbo].[User] ([User_ID], [User_Name], [Email], [Password], [Address], [Phone], [Role]) VALUES (6, N'admin123', N'minhldhe180598@fpt.edu.vn', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, N'Admin')
GO
INSERT INTO [ShoesOnlineShop].[dbo].[User]
       ([User_Name], [Email], [Password], [Address], [Phone], [Role])
VALUES ('Admin', 
        'admin@example.com', 
        '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 
        'Ha Noi', 
        '0123456789', 
        'Admin');
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534DCC902EC]    Script Date: 26/03/2025 17:12:59 ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([Order_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([PV_ID])
REFERENCES [dbo].[Product_Variant] ([PV_ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Sale_ID])
REFERENCES [dbo].[Sale] ([Sale_ID])
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Variant]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [ShoesOnlineShop] SET  READ_WRITE 
GO