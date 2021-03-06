USE [master]
GO
/****** Object:  Database [ManageProduct]    Script Date: 5/3/2019 11:49:09 AM ******/
CREATE DATABASE [ManageProduct]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageProduct', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ManageProduct.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManageProduct_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ManageProduct_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ManageProduct] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageProduct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageProduct] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageProduct] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageProduct] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ManageProduct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageProduct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageProduct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageProduct] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageProduct] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageProduct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageProduct] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageProduct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageProduct] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ManageProduct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageProduct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageProduct] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageProduct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageProduct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageProduct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageProduct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageProduct] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageProduct] SET  MULTI_USER 
GO
ALTER DATABASE [ManageProduct] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageProduct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageProduct] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageProduct] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManageProduct] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManageProduct] SET QUERY_STORE = OFF
GO
USE [ManageProduct]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](2000) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[ContactDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Input]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Input](
	[Id] [nvarchar](128) NOT NULL,
	[DateInput] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputInfo]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputInfo](
	[Id] [nvarchar](128) NOT NULL,
	[IdObject] [nvarchar](128) NOT NULL,
	[IdInput] [nvarchar](128) NOT NULL,
	[Count] [int] NULL,
	[InputPrice] [float] NULL,
	[OutputPrice] [float] NULL,
	[Status] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [nvarchar](128) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[IdUnit] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[QRCode] [nvarchar](max) NULL,
	[BarCode] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[Id] [nvarchar](128) NOT NULL,
	[DateOutput] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutputInfo]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutputInfo](
	[Id] [nvarchar](128) NOT NULL,
	[IdObject] [nvarchar](128) NOT NULL,
	[IdOutput] [nvarchar](128) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[Count] [int] NULL,
	[Status] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](2000) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[ContactDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/3/2019 11:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](2000) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[IdRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (1, N'minh an', N'nam dinh', N'312442', N'minh@gmail.com', N'dsaferqwer', NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (2, N'hoang vua', N'truong trinh', N'2343er24', N'vuhoang@gmail.com', N'hoang vu moreinfo', NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (3, N'hoang vua', N'truong trinh', N'234324', N'vuhoang@gmail.com', N'hoang vu moreinfo', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'1', CAST(N'2018-12-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'2', CAST(N'2019-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'1', N'1', N'1', 50, 200000, 250000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'2', N'2', N'1', 1000, 200, 300, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'1', N'Xi Mănger', 15, 7, N'124erw', N'fgfdsdsg')
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'2', N'Gạch', 3, 1, N'test2', N'bar2')
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'7eb7bdd3-3d4d-4448-91fc-c8b7c9bfef03', N'Xi Măng', 5, 5, N'124', N'fgdsg')
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'a160f0df-616e-4bec-80e3-3a9b3c910286', N'Gạch', 3, 3, N'test2', N'bar2')
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'd82d3cb6-b24a-48e9-a8cf-920db13ccb03', N'Gạch', 3, 3, N'test2', N'bar2')
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'1', CAST(N'2015-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'2', CAST(N'2017-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [Status]) VALUES (N'1', N'1', N'1', 1, 10, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [Status]) VALUES (N'2', N'2', N'1', 1, 200, NULL)
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (1, N'Ban Hang 2 Online', N'116 Trần Đại Nghĩa', N'012rewr345678', N'tiendatvn0x@gmail.com', N'hdfihihih+', CAST(N'2019-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (3, N'Ban Hang Online 2', N'112 Trần Đại Nghĩa', NULL, N'tiendatvn@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (4, N'Ban Hang Online 2', N'112 Trần Đại Nghĩa', NULL, N'tiendatvn@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (5, N'Ban Hang Online 2', N'112 Trần Đại Nghĩa', NULL, N'tiendatvn@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (6, N'Ban Hang Online', N'112 Trần Đại Nghĩa', NULL, N'tiendatvn@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (7, N'Ban Hang Online 2', N'112 Trần Đại Nghĩa', N'324', N'tiendatvn@gmail.com', N'hihihih+', CAST(N'2019-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (8, N'Ban Hang 2 Online', N'112 Trần Đại Nghĩa', N'012rewr345678', N'tiendatvn0x@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (9, N'Ban Hang 2 Online', N'112 Trần Đại Nghĩa', N'012rewr345678', N'tiendatvn0x@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (10, N'Ban Hang 2 Online', N'112 Trần Đại Nghĩa', N'012rewr345678', N'tiendatvn0x@gmail.com', N'hihihih+', NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContactDate]) VALUES (11, N'Ban Hang 2 Online', N'112 Trần Đại Nghĩa', N'012rewr345678', N'tiendatvn0x@gmail.com', N'hihihih+', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (1, N'Kgdsfdfewrvcxz')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (2, N'Thùng fd rew')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (3, N'Bao')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (4, N'fdKg hihi fafsaf faddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (5, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (6, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (7, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (8, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (9, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (10, N'fdKg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (11, N'fds')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (12, N'fdsewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (13, N'ge')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (14, N'đ')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (15, N'Kgfdsaf')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (16, N'Kgfdsaf')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (17, N'Kgfdsaf')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (18, N'Kgfdsaf')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (19, N'Kgfdsaf')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (20, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (21, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (22, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (23, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (24, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (25, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (26, N'Kgdsfdfewr')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (27, NULL)
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (28, NULL)
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (29, N'hehe')
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'Staff')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (6, N'Tien Dat', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (7, N'Minh', N'a', N'7733b38137da5e163c45fe67a4472932', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[InputInfo] ADD  DEFAULT ((0)) FOR [InputPrice]
GO
ALTER TABLE [dbo].[InputInfo] ADD  DEFAULT ((0)) FOR [OutputPrice]
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdInput])
REFERENCES [dbo].[Input] ([Id])
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdOutput])
REFERENCES [dbo].[Output] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ManageProduct] SET  READ_WRITE 
GO
