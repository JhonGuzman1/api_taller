USE [master]
GO
/****** Object:  Database [dbTaller]    Script Date: 5/6/2022 20:03:42 ******/
CREATE DATABASE [dbTaller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbTaller', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbTaller.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbTaller_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbTaller_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbTaller] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbTaller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbTaller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbTaller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbTaller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbTaller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbTaller] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbTaller] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbTaller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbTaller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbTaller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbTaller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbTaller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbTaller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbTaller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbTaller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbTaller] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbTaller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbTaller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbTaller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbTaller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbTaller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbTaller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbTaller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbTaller] SET RECOVERY FULL 
GO
ALTER DATABASE [dbTaller] SET  MULTI_USER 
GO
ALTER DATABASE [dbTaller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbTaller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbTaller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbTaller] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbTaller] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbTaller', N'ON'
GO
ALTER DATABASE [dbTaller] SET QUERY_STORE = OFF
GO
USE [dbTaller]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 5/6/2022 20:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Descripcion] [varchar](256) NOT NULL,
	[Estado] [int] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IdTaller] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 5/6/2022 20:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
	[Apellido] [varchar](256) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taller]    Script Date: 5/6/2022 20:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taller](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (3, CAST(N'2022-06-05' AS Date), CAST(N'16:04:00' AS Time), N'prueba 123', 1, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (4, CAST(N'2022-06-05' AS Date), CAST(N'18:06:00' AS Time), N'Prueba de cita', 2, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (5, CAST(N'2022-06-05' AS Date), CAST(N'19:06:00' AS Time), N'Prueba de cita', 0, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (6, CAST(N'2022-06-05' AS Date), CAST(N'19:06:00' AS Time), N'Prueba de cita', 1, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (7, CAST(N'2022-06-05' AS Date), CAST(N'19:06:00' AS Time), N'Prueba de cita', 2, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (8, CAST(N'2022-06-05' AS Date), CAST(N'19:00:00' AS Time), N'Prueba de cita', 0, 2, 1)
INSERT [dbo].[Cita] ([Id], [Fecha], [Hora], [Descripcion], [Estado], [IdCliente], [IdTaller]) VALUES (9, CAST(N'2022-06-05' AS Date), CAST(N'19:06:00' AS Time), N'Prueba de cita', 0, 2, 1)
SET IDENTITY_INSERT [dbo].[Cita] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Direccion]) VALUES (2, N'Jhon', N'Guzman', CAST(N'2001-01-06' AS Date), N'av. abc')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Taller] ON 

INSERT [dbo].[Taller] ([Id], [Nombre]) VALUES (1, N'Taller 1')
SET IDENTITY_INSERT [dbo].[Taller] OFF
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD FOREIGN KEY([IdTaller])
REFERENCES [dbo].[Taller] ([Id])
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD FOREIGN KEY([IdTaller])
REFERENCES [dbo].[Taller] ([Id])
GO
USE [master]
GO
ALTER DATABASE [dbTaller] SET  READ_WRITE 
GO
