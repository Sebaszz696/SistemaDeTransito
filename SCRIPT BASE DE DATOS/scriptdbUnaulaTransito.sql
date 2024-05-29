USE [master]
GO
/****** Object:  Database [dbUnaulaTransito]    Script Date: 29/05/2024 5:33:38 a. m. ******/
CREATE DATABASE [dbUnaulaTransito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbUnaulaTransito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbUnaulaTransito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbUnaulaTransito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbUnaulaTransito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbUnaulaTransito] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbUnaulaTransito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbUnaulaTransito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbUnaulaTransito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbUnaulaTransito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbUnaulaTransito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbUnaulaTransito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET RECOVERY FULL 
GO
ALTER DATABASE [dbUnaulaTransito] SET  MULTI_USER 
GO
ALTER DATABASE [dbUnaulaTransito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbUnaulaTransito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbUnaulaTransito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbUnaulaTransito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbUnaulaTransito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbUnaulaTransito] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbUnaulaTransito', N'ON'
GO
ALTER DATABASE [dbUnaulaTransito] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbUnaulaTransito] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbUnaulaTransito]
GO
/****** Object:  User [MicrosoftAccount\sebaszz26@hotmail.com]    Script Date: 29/05/2024 5:33:39 a. m. ******/
CREATE USER [MicrosoftAccount\sebaszz26@hotmail.com] FOR LOGIN [MicrosoftAccount\sebaszz26@hotmail.com] WITH DEFAULT_SCHEMA=[MicrosoftAccount\sebaszz26@hotmail.com]
GO
ALTER ROLE [db_owner] ADD MEMBER [MicrosoftAccount\sebaszz26@hotmail.com]
GO
/****** Object:  Schema [MicrosoftAccount\sebaszz26@hotmail.com]    Script Date: 29/05/2024 5:33:39 a. m. ******/
CREATE SCHEMA [MicrosoftAccount\sebaszz26@hotmail.com]
GO
/****** Object:  Table [dbo].[AgenteTransito]    Script Date: 29/05/2024 5:33:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgenteTransito](
	[IdAgente] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Rango] [varchar](50) NULL,
	[Contraseña] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAgente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadisticaMultas]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadisticaMultas](
	[IdTipoMulta] [varchar](100) NOT NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoMulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenciaConduccion]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenciaConduccion](
	[IdLicencia] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NULL,
	[Categoria] [varchar](50) NULL,
	[FechaExpedicion] [date] NULL,
	[FechaVencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLicencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Multa]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multa](
	[IdMulta] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](50) NULL,
	[Cedula] [int] NULL,
	[IdAgente] [int] NULL,
	[IdTipoMulta] [int] NULL,
	[FechaMulta] [date] NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoMulta](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdMulta] [int] NULL,
	[FechaPago] [date] NULL,
	[MontoPagado] [decimal](10, 2) NULL,
	[MetodoPago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroVehicular]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroVehicular](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](50) NULL,
	[Cedula] [int] NULL,
	[FechaRegistro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMulta](
	[IdTipoMulta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Monto] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoMulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVehiculo]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVehiculo](
	[IdTipoVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AgenteTransito] ON 

INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (1, 123456, N'Agente 1', N'Oficial', NULL)
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (2, 654321, N'Agente 2', N'Suboficial', NULL)
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (3, 789012, N'Agente 3', N'Sargento', NULL)
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (4, 123456789, N'Agente 1', N'Rango 1', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (5, 987654321, N'Agente 2', N'Rango 2', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (6, 456789123, N'Agente 3', N'Rango 3', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
INSERT [dbo].[AgenteTransito] ([IdAgente], [Cedula], [Nombre], [Rango], [Contraseña]) VALUES (7, 1234567, N'Agente Cesar', N'Oficial', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
SET IDENTITY_INSERT [dbo].[AgenteTransito] OFF
GO
INSERT [dbo].[EstadisticaMultas] ([IdTipoMulta], [Cantidad]) VALUES (N'1', 3)
INSERT [dbo].[EstadisticaMultas] ([IdTipoMulta], [Cantidad]) VALUES (N'2', 3)
INSERT [dbo].[EstadisticaMultas] ([IdTipoMulta], [Cantidad]) VALUES (N'3', 1)
GO
SET IDENTITY_INSERT [dbo].[LicenciaConduccion] ON 

INSERT [dbo].[LicenciaConduccion] ([IdLicencia], [Cedula], [Categoria], [FechaExpedicion], [FechaVencimiento]) VALUES (1, 12345678, N'B', CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date))
INSERT [dbo].[LicenciaConduccion] ([IdLicencia], [Cedula], [Categoria], [FechaExpedicion], [FechaVencimiento]) VALUES (2, 87654321, N'A', CAST(N'2019-06-15' AS Date), CAST(N'2024-06-15' AS Date))
INSERT [dbo].[LicenciaConduccion] ([IdLicencia], [Cedula], [Categoria], [FechaExpedicion], [FechaVencimiento]) VALUES (3, 12348765, N'C', CAST(N'2018-08-20' AS Date), CAST(N'2023-08-20' AS Date))
SET IDENTITY_INSERT [dbo].[LicenciaConduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Multa] ON 

INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (2, N'XYZ789', 87654321, 4, 2, CAST(N'2024-05-29' AS Date), N'PAGADO')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (15, N'ABC123', 12345678, 4, 1, CAST(N'2024-05-29' AS Date), N'PAGADO')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (18, N'ABC123', 12345678, 1, 1, CAST(N'2024-01-15' AS Date), N'Pendiente')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (20, N'MNO456', 12348765, 4, 3, CAST(N'2024-05-29' AS Date), N'PAGADO')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (22, N'POH12A', 1456, 4, 2, CAST(N'2024-05-29' AS Date), N'PAGADO')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (23, N'LLLLL', 1111, 4, 2, CAST(N'2024-05-30' AS Date), N'PAGADO')
INSERT [dbo].[Multa] ([IdMulta], [Placa], [Cedula], [IdAgente], [IdTipoMulta], [FechaMulta], [Estado]) VALUES (24, N'JJJ123', 123, 4, 1, CAST(N'2024-05-30' AS Date), N'NO PAGADO')
SET IDENTITY_INSERT [dbo].[Multa] OFF
GO
SET IDENTITY_INSERT [dbo].[PagoMulta] ON 

INSERT [dbo].[PagoMulta] ([IdPago], [IdMulta], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (1, 2, CAST(N'2024-03-01' AS Date), CAST(75.00 AS Decimal(10, 2)), N'Tarjeta de crédito')
INSERT [dbo].[PagoMulta] ([IdPago], [IdMulta], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (2, 2, CAST(N'2024-03-01' AS Date), CAST(75.00 AS Decimal(10, 2)), N'Tarjeta de crédito')
INSERT [dbo].[PagoMulta] ([IdPago], [IdMulta], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (5, 15, CAST(N'2024-03-01' AS Date), CAST(75.00 AS Decimal(10, 2)), N'Tarjeta de crédito')
SET IDENTITY_INSERT [dbo].[PagoMulta] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistroVehicular] ON 

INSERT [dbo].[RegistroVehicular] ([IdRegistro], [Placa], [Cedula], [FechaRegistro]) VALUES (1, N'ABC123', 12345678, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[RegistroVehicular] ([IdRegistro], [Placa], [Cedula], [FechaRegistro]) VALUES (2, N'XYZ789', 87654321, CAST(N'2024-02-01' AS Date))
INSERT [dbo].[RegistroVehicular] ([IdRegistro], [Placa], [Cedula], [FechaRegistro]) VALUES (3, N'MNO456', 12348765, CAST(N'2024-03-01' AS Date))
SET IDENTITY_INSERT [dbo].[RegistroVehicular] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMulta] ON 

INSERT [dbo].[TipoMulta] ([IdTipoMulta], [Descripcion], [Monto]) VALUES (1, N'Exceso de velocidad', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMulta] ([IdTipoMulta], [Descripcion], [Monto]) VALUES (2, N'Estacionamiento prohibido', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMulta] ([IdTipoMulta], [Descripcion], [Monto]) VALUES (3, N'Conducir sin licencia', CAST(200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[TipoMulta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoVehiculo] ON 

INSERT [dbo].[TipoVehiculo] ([IdTipoVehiculo], [Descripcion]) VALUES (1, N'Carro')
INSERT [dbo].[TipoVehiculo] ([IdTipoVehiculo], [Descripcion]) VALUES (2, N'Moto')
INSERT [dbo].[TipoVehiculo] ([IdTipoVehiculo], [Descripcion]) VALUES (3, N'Bicicleta')
SET IDENTITY_INSERT [dbo].[TipoVehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (6, 123, N'Cesar Profesor', N'cesar@gmail.com', N'578bfc33d127e864cf010d2fdda8c66c018757829b7e349653760ce5e36c59c6')
INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (5, 1111, N'Sebastian', N'sebaszz696@gmail.com', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (4, 1456, N'Cesar', N'velasquez@gmail.com', N'70bd8714a2d856538c68cb92919d6573f4c690959e148dc133f6f043c0e41199')
INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (1, 12345678, N'Juan Perez', N'juan.perez@example.com', N'clave123')
INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (3, 12348765, N'Carlos Ruiz', N'carlos.ruiz@example.com', N'clave789')
INSERT [dbo].[USUARIO] ([IdUsuario], [Cedula], [Nombre], [Correo], [Clave]) VALUES (2, 87654321, N'Maria Gomez', N'maria.gomez@example.com', N'clave456')
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
/****** Object:  Index [UQ__AgenteTr__B4ADFE382964F69D]    Script Date: 29/05/2024 5:33:40 a. m. ******/
ALTER TABLE [dbo].[AgenteTransito] ADD UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USUARIO__60695A19E6DD1EFB]    Script Date: 29/05/2024 5:33:40 a. m. ******/
ALTER TABLE [dbo].[USUARIO] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LicenciaConduccion]  WITH CHECK ADD FOREIGN KEY([Cedula])
REFERENCES [dbo].[USUARIO] ([Cedula])
GO
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD FOREIGN KEY([IdAgente])
REFERENCES [dbo].[AgenteTransito] ([IdAgente])
GO
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD FOREIGN KEY([IdTipoMulta])
REFERENCES [dbo].[TipoMulta] ([IdTipoMulta])
GO
ALTER TABLE [dbo].[PagoMulta]  WITH CHECK ADD FOREIGN KEY([IdMulta])
REFERENCES [dbo].[Multa] ([IdMulta])
GO
ALTER TABLE [dbo].[RegistroVehicular]  WITH CHECK ADD FOREIGN KEY([Cedula])
REFERENCES [dbo].[USUARIO] ([Cedula])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadisticaMultas]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActualizarEstadisticaMultas]
AS
BEGIN
    DECLARE @TipoACount INT;
    DECLARE @TipoBCount INT;
	DECLARE @TipoCCount INT;

    -- Contar las multas Tipo A
    SELECT @TipoACount = COUNT(*)
    FROM Multa
    WHERE IdTipoMulta = '1'; 

    -- Contar las multas Tipo B
    SELECT @TipoBCount = COUNT(*)
    FROM Multa
    WHERE IdTipoMulta = '2'; 

	-- Contar las multas complejas
    SELECT @TipoCCount = COUNT(*)
    FROM Multa
    WHERE IdTipoMulta = '3'; 

    -- Verificar si existen registros en la tabla EstadisticaMultas
    DECLARE @TipoAExists INT;
	DECLARE @TipoBExists INT;
	DECLARE @TipoCExists INT;


    SELECT @TipoAExists  = COUNT(*)
    FROM EstadisticaMultas
    WHERE IdTipoMulta = '1';

    SELECT @TipoBExists  = COUNT(*)
    FROM EstadisticaMultas
    WHERE IdTipoMulta = '2';

	SELECT @TipoCExists  = COUNT(*)
    FROM EstadisticaMultas
    WHERE IdTipoMulta = '3';

    -- Actualizar los valores en la tabla EstadisticaMultas si existen, de lo contrario, insertar nuevos registros
    IF @TipoAExists > 0
    BEGIN
        UPDATE EstadisticaMultas
        SET Cantidad = @TipoACount
        WHERE IdTipoMulta = '1';
    END
    ELSE
    BEGIN
        INSERT INTO EstadisticaMultas (IdTipoMulta, Cantidad)
        VALUES ('1', @TipoACount);
    END

	  IF @TipoBExists > 0
    BEGIN
        UPDATE EstadisticaMultas
        SET Cantidad = @TipoBCount
        WHERE IdTipoMulta = '2';
    END
    ELSE
    BEGIN
        INSERT INTO EstadisticaMultas (IdTipoMulta, Cantidad)
        VALUES ('2', @TipoBCount);
    END

	  IF @TipoCExists > 0
    BEGIN
        UPDATE EstadisticaMultas
        SET Cantidad = @TipoCCount
        WHERE IdTipoMulta = '3';
    END
    ELSE
    BEGIN
        INSERT INTO EstadisticaMultas (idTipoMulta, Cantidad)
        VALUES ('3', @TipoBCount);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMultas]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMultas]
AS
BEGIN
    SELECT * FROM Multa;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMultasPorCedula]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMultasPorCedula](
    @Cedula INT
)
AS
BEGIN
    SELECT * FROM Multa
    WHERE Cedula = @Cedula;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ActualizarMulta](
    @IdMulta INT,
    @Placa VARCHAR(50),
    @Cedula INT,
    @IdAgente INT,
    @IdTipoMulta INT,
    @FechaMulta DATE,
    @Estado VARCHAR(50)
)
AS
BEGIN
    UPDATE Multa
    SET Placa = @Placa,
        Cedula = @Cedula,
        IdAgente = @IdAgente,
        IdTipoMulta = @IdTipoMulta,
        FechaMulta = @FechaMulta,
        Estado = @Estado
    WHERE IdMulta = @IdMulta;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarMulta](
    @IdMulta INT
)
AS
BEGIN
    DELETE FROM Multa
    WHERE IdMulta = @IdMulta;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerEstadisticasMultas]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ObtenerEstadisticasMultas]
AS
BEGIN
    SELECT IdTipoMulta, Cantidad
    FROM EstadisticaMultas;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerMultaPorId]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerMultaPorId](
    @IdMulta INT
)
AS
BEGIN
    SELECT IdMulta, Placa, Cedula, IdAgente, IdTipoMulta, FechaMulta, Estado
    FROM Multa
    WHERE IdMulta = @IdMulta;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_PagarMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PagarMulta](
    @IdMulta INT,
    @FechaPago DATE,
    @MontoPagado DECIMAL(10, 2),
    @MetodoPago VARCHAR(50)
)
AS
BEGIN
    -- Insertar el pago en la tabla PagoMulta
    INSERT INTO PagoMulta (IdMulta, FechaPago, MontoPagado, MetodoPago)
    VALUES (@IdMulta, @FechaPago, @MontoPagado, @MetodoPago);
    
    -- Actualizar el estado de la multa a 'PAGADA'
    UPDATE Multa
    SET Estado = 'PAGADA'
    WHERE IdMulta = @IdMulta;
END;

/* Procedimientos almacenados para la tabla EstadisticaMultas */
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMulta]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarMulta](
    @Placa VARCHAR(50),
    @Cedula INT,
    @IdAgente INT,
    @IdTipoMulta INT,
    @FechaMulta DATE,
    @Estado VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Multa (Placa, Cedula, IdAgente, IdTipoMulta, FechaMulta, Estado)
    VALUES (@Placa, @Cedula, @IdAgente, @IdTipoMulta, @FechaMulta, @Estado);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarUsuario](
    @Cedula INT,
    @Nombre VARCHAR(100),
    @Correo VARCHAR(100),
    @Clave VARCHAR(500),
    @Registrado BIT OUTPUT,
    @Mensaje VARCHAR(100) OUTPUT
)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
    BEGIN
        INSERT INTO USUARIO (Cedula, Nombre, Correo, Clave)
        VALUES (@Cedula, @Nombre, @Correo, @Clave);
        SET @Registrado = 1;
        SET @Mensaje = 'Usuario registrado correctamente';
    END
    ELSE
    BEGIN
        SET @Registrado = 0;
        SET @Mensaje = 'El correo electrónico ya está registrado';
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarAgente]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarAgente](
    @Cedula VARCHAR(100),
    @Contraseña VARCHAR(500)
)
AS
BEGIN
    IF EXISTS (SELECT * FROM AgenteTransito WHERE Cedula = @Cedula AND Contraseña = @Contraseña)
    BEGIN
        SELECT IdAgente, Cedula FROM AgenteTransito WHERE Cedula = @Cedula AND Contraseña = @Contraseña;
    END
    ELSE
    BEGIN
        SELECT 0 AS IdAgente, NULL AS Cedula;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarUsuario](
    @Correo VARCHAR(100),
    @Clave VARCHAR(500)
)
AS
BEGIN
    IF EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo AND Clave = @Clave)
    BEGIN
        SELECT IdUsuario, Cedula FROM USUARIO WHERE Correo = @Correo AND Clave = @Clave;
    END
    ELSE
    BEGIN
        SELECT 0 AS IdUsuario, NULL AS Cedula;
    END
END;

/* Procedimientos almacenados para la tabla Multa */
GO
/****** Object:  Trigger [dbo].[tgr_ActualizarEstadisticas]    Script Date: 29/05/2024 5:33:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tgr_ActualizarEstadisticas]
ON [dbo].[Multa]
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    EXEC ActualizarEstadisticaMultas;
END;
GO
ALTER TABLE [dbo].[Multa] ENABLE TRIGGER [tgr_ActualizarEstadisticas]
GO
USE [master]
GO
ALTER DATABASE [dbUnaulaTransito] SET  READ_WRITE 
GO
