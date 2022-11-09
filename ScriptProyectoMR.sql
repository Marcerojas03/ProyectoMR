USE [master]
GO
/****** Object:  Database [ProyectoMR]    Script Date: 09/11/2022 9:10:59 ******/
CREATE DATABASE [ProyectoMR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoMR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoMR.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoMR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoMR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoMR] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoMR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoMR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoMR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoMR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoMR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoMR] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoMR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoMR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoMR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoMR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoMR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoMR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoMR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoMR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoMR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoMR] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoMR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoMR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoMR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoMR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoMR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoMR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoMR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoMR] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoMR] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoMR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoMR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoMR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoMR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoMR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoMR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoMR', N'ON'
GO
ALTER DATABASE [ProyectoMR] SET QUERY_STORE = OFF
GO
USE [ProyectoMR]
GO
/****** Object:  Table [dbo].[Categorías]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorías](
	[IdCategoria] [float] NOT NULL,
	[Categoría] [nvarchar](255) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categoría] PRIMARY KEY CLUSTERED 
(
	[Categoría] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[DNI] [nvarchar](255) NOT NULL,
	[Nomre] [nvarchar](255) NULL,
	[Apellido] [nvarchar](255) NULL,
	[E-mail] [nvarchar](255) NULL,
	[Telefono] [float] NULL,
 CONSTRAINT [PK_DNI] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[Id] [float] NOT NULL,
	[DNI] [nvarchar](255) NOT NULL,
	[sku] [nvarchar](255) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cantidad] [float] NOT NULL,
	[Importe] [float] NOT NULL,
 CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[SKU] [nvarchar](255) NOT NULL,
	[Categoría] [nvarchar](255) NOT NULL,
	[NIF] [nvarchar](255) NOT NULL,
	[Tipo] [nvarchar](255) NULL,
	[Descripción corta] [nvarchar](255) NULL,
	[Peso (Kg)] [float] NULL,
	[Longitud (cm)] [nvarchar](255) NULL,
	[Anchura (cm)] [float] NULL,
	[Altura (cm)] [float] NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_SKU] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Proveedor] [nvarchar](255) NOT NULL,
	[NIF] [nvarchar](255) NOT NULL,
	[Dirección] [nvarchar](255) NOT NULL,
	[Ciudad] [nvarchar](255) NOT NULL,
	[Producto o Servicio] [nvarchar](255) NOT NULL,
	[Descripción del producto o servicio] [nvarchar](255) NOT NULL,
	[Contrato] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suministros]    Script Date: 09/11/2022 9:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suministros](
	[Idsum] [float] NOT NULL,
	[sku ] [nvarchar](255) NOT NULL,
	[nif] [nvarchar](255) NOT NULL,
	[fecha de compra] [datetime] NOT NULL,
	[categoria] [nvarchar](255) NOT NULL,
	[cantidad] [float] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Idsum] PRIMARY KEY CLUSTERED 
(
	[Idsum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorías] ([IdCategoria], [Categoría], [Descripcion]) VALUES (1, N'Anillados', N'Anillados por cantidad de paginas')
INSERT [dbo].[Categorías] ([IdCategoria], [Categoría], [Descripcion]) VALUES (2, N'Fotocopia', N'Fotocopia por tipo de hoja y color')
INSERT [dbo].[Categorías] ([IdCategoria], [Categoría], [Descripcion]) VALUES (3, N'Librería', N'Articulos de Librería')
INSERT [dbo].[Categorías] ([IdCategoria], [Categoría], [Descripcion]) VALUES (4, N'Plastificados', N'Plastificados por tipo de hoja')
GO
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'00392591G', N'Carlota ', N'Sainz Cotera', N'carlotasainzcotera@gmail.com', 670223290)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'02638670H', N'Carmen', N'Fernandez', N'cfernandezvallina@gmail.com', 622158754)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'04589158Z', N'Andrés ', N'Dávila ', N'tableros@marinodelafuente.es', 602001075)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'05398473M', N'Ana ', N'Mateo Benito ', N'69colon38@gmail.com', 687883525)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'33518629Q', N'Carlos', N'Buenapozada Perez', N'carlos_buenaposada@hotmail.com', 637142656)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'50752268P', N'Almudena ', N'Sainz', N'alsainzcavada@gmail.com', 651727908)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'51401086L', N'Blanca', N'Magro', N'blancalean@gmail.com', 636391900)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'51864609T', N'Andrés ', N'Quintana', N'afquintana.rivera@gmail.com', 631471971)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'60054385V', N'Ali ', N'Moussa', N'ali-moussa92@hotmail.com', 625838241)
INSERT [dbo].[Clientes] ([DNI], [Nomre], [Apellido], [E-mail], [Telefono]) VALUES (N'X0512823S', N'Antonio ', N'Puente Badía', N'puentebadia.arq@gmail.com', 657462137)
GO
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1001, N'50752268P', N'ANI-000-200', CAST(N'2022-10-01T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1002, N'50752268P', N'FA4-BN-FULL', CAST(N'2022-10-02T00:00:00.000' AS DateTime), 1, 0.25)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1003, N'05398473M', N'FA3-BN-LOW', CAST(N'2022-10-02T00:00:00.000' AS DateTime), 3, 0.39)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1004, N'04589158Z', N'FA3-CO-FOT', CAST(N'2022-10-04T00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1005, N'04589158Z', N'FA3-CO-FOT', CAST(N'2022-10-05T00:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1006, N'04589158Z', N'FA2-CO-LOW', CAST(N'2022-10-05T00:00:00.000' AS DateTime), 1, 4)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1007, N'02638670H', N'TIP-CI-PEQ', CAST(N'2022-10-06T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1008, N'51864609T', N'MAR-FA-CAS', CAST(N'2022-10-08T00:00:00.000' AS DateTime), 3, 5.1)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1009, N'51401086L', N'PEG-BA-PEQ', CAST(N'2022-10-09T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1010, N'51401086L', N'BOL-PI-GRI', CAST(N'2022-10-11T00:00:00.000' AS DateTime), 5, 11)
INSERT [dbo].[Compras] ([Id], [DNI], [sku], [fecha], [cantidad], [Importe]) VALUES (1011, N'33518629Q', N'CAL-CA-CIE', CAST(N'2022-10-15T00:00:00.000' AS DateTime), 1, 25)
GO
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'ANI-000-200', N'Anillados', N'B82766452', N'Producto simple', N'Anillado de 0 a 200 pág', NULL, N'21 - 29,7', NULL, NULL, 1.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'ANI-201-300', N'Anillados', N'B82766452', N'Producto simple', N'Anillado de 201 a 300 pág', NULL, N'21 - 29,7', NULL, NULL, 2.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'ANI-301-400', N'Anillados', N'B82766452', N'Producto simple', N'Anillado de 301 a 400 pág', NULL, N'21 - 29,7', NULL, NULL, 5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'ANI-401-500', N'Anillados', N'B82766452', N'Producto simple', N'Anillado de 401 a 500 pág', NULL, N'21 - 29,7', NULL, NULL, 7)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'ANI-501-600', N'Anillados', N'B82766452', N'Producto simple', N'Anillado de 501 a 600 pág', NULL, N'21 - 29,7', NULL, NULL, 10)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'BOL-BI-CRI', N'Librería', N'B81074601', N'Producto variable', N'Bolígrafo Bic', NULL, NULL, NULL, NULL, 0.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'BOL-PI-GRI', N'Librería', N'B39203153', N'Producto variable', N'Bolígrafo Pilot', NULL, NULL, NULL, NULL, 2.2)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'CAL-CA-CIE', N'Librería', N'B39203153', N'Producto variable', N'Calculadora Casio', NULL, NULL, NULL, NULL, 25)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'CAR-CA-COL', N'Librería', N'B39203153', N'Producto variable', N'Carpeta', NULL, NULL, NULL, NULL, 0.6)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'CUA-ES-CUA', N'Librería', N'B39203153', N'Producto variable', N'Cuaderno', NULL, NULL, NULL, NULL, 2.3)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-BN-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 b/n Fotográfico', 0.2, NULL, 59.4, 84.1, 24)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-BN-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 b/n Full', 0.08, NULL, 59.4, 84.1, 8)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-BN-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 b/n Low', 0.08, NULL, 59.4, 84.1, 6)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-CO-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 color Fotográfico', 0.2, NULL, 59.4, 84.1, 34)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-CO-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 color Full', 0.08, NULL, 59.4, 84.1, 12)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA1-CO-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A1 color Low', 0.08, NULL, 59.4, 84.1, 12)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-BN-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 b/n Fotográfico', 0.2, NULL, 42, 59.4, 6)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-BN-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 b/n Full', 0.08, NULL, 42, 59.4, 4)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-BN-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 b/n Low', 0.08, NULL, 42, 59.4, 3)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-CO-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 color Fotográfico', 0.2, NULL, 42, 59.4, 8)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-CO-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 color Full', 0.08, NULL, 42, 59.4, 6)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA2-CO-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A2 color Low', 0.08, NULL, 42, 59.4, 4)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-BN-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 b/n Fotográfico', 0.2, NULL, 29.7, 42, 2.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-BN-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 b/n Full', 0.08, NULL, 29.7, 42, 1)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-BN-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 b/n Low', 0.08, NULL, 29.7, 42, 0.13)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-CO-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 color Fotográfico', 0.2, NULL, 29.7, 42, 3)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-CO-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 color Full', 0.08, NULL, 29.7, 42, 1.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA3-CO-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A3 color Low', 0.08, NULL, 29.7, 42, 0.26)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-BN-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 b/n Fotográfico', 0.2, NULL, 21, 29.7, 1)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-BN-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 b/n Full', 0.08, NULL, 21, 29.7, 0.25)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-BN-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 b/n Low', 0.08, NULL, 21, 29.7, 0.03)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-CO-FOT', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 color Fotográfico', 0.2, NULL, 21, 29.7, 1.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-CO-FULL', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 color Full', 0.08, NULL, 21, 29.7, 0.5)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FA4-CO-LOW', N'Fotocopia', N'A81828410', N'Producto simple', N'Fotocopia A4 color Low', 0.08, NULL, 21, 29.7, 0.07)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'FUN-PL-PRA', N'Librería', N'B39203153', N'Producto variable', N'Funda ', NULL, NULL, NULL, NULL, 0.15)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'GOM-MI-BLA', N'Librería', N'B81074601', N'Producto variable', N'Goma', NULL, NULL, NULL, NULL, 0.35)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'MAR-FA-CAS', N'Librería', N'B81074601', N'Producto variable', N'Marcador', NULL, NULL, NULL, NULL, 1.7)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'PEG-BA-PEQ', N'Librería', N'B39203153', N'Producto variable', N'Pegamento en Barra', 0.01, NULL, NULL, NULL, 1)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'PLA-A2-BRI', N'Plastificados', N'B39203153', N'Producto simple', N'Plastificado A2', NULL, NULL, 42, 59.4, 4)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'PLA-A3-BRI', N'Plastificados', N'B39203153', N'Producto simple', N'Plastificado A3', NULL, NULL, 29.7, 42, 2)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'PLA-A4-BRI', N'Plastificados', N'B39203153', N'Producto simple', N'Plastificado A4', NULL, NULL, 21.6, 29.7, 1)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'PLA-A5-BRI', N'Plastificados', N'B39203153', N'Producto simple', N'Plastificado A5', NULL, NULL, 15.4, 21.6, 0.9)
INSERT [dbo].[Productos] ([SKU], [Categoría], [NIF], [Tipo], [Descripción corta], [Peso (Kg)], [Longitud (cm)], [Anchura (cm)], [Altura (cm)], [Precio]) VALUES (N'TIP-CI-PEQ', N'Librería', N'B81074601', N'Producto variable', N'Tiplex cinta', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'INAPA', N'A81828410', N'CALLE DELCO (PG IND CIUDAD DEL AUTOMOVIL), 1 - 3', N'Madrid', N'Producto', N'Papel', N'NO')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'PAPELNOR', N'B39203153', N'CALLE MIES DE SAN JUAN, S/N', N'Santander', N'Producto', N'Material de oficina y papelería', N'NO')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'GÉNESIS', N'B39281480', N'Calle Fernando de los rios, 69 - BJ', N'Santander', N'Servicio', N'Plotteo e impresión', N'NO')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'LLORENTE', N'B39518279', N'C. María Cristina, 1D', N'Santander', N'Servicio', N'Renting de Maquinaria', N'SI')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'ECHEVARRIA', N'B39561790', N'Avda. de los Castros 53 A-B-C', N'Santander', N'Servicio', N'Plotteo e impresión', N'NO')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'CEDRO', N'B39766332', N'CALLE HERNAN CORTES, 32', N'Santander', N'Servicio', N'Licencias', N'SI')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'IMEDISA', N'B81074601', N'CALLE LOS ALFAREROS (POL IND URTINSA), 20', N'Madrid', N'Producto', N'Material de oficina y papelería', N'NO')
INSERT [dbo].[Proveedores] ([Proveedor], [NIF], [Dirección], [Ciudad], [Producto o Servicio], [Descripción del producto o servicio], [Contrato]) VALUES (N'AB MATERIALES GRUPO MCR', N'B82766452', N'CALLE ROSALIND FRANKLIN, 26 - POL INDUSTRIAL L', N'Madrid', N'Producto', N'Material de oficina y papelería', N'NO')
GO
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (1, N'ANI-000-200', N'B82766452', CAST(N'2022-10-24T00:00:00.000' AS DateTime), N'Anillados', 30, 21)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (2, N'BOL-BI-CRI', N'B81074601', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'Librería', 30, 0.6)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (3, N'GOM-MI-BLA', N'B81074601', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'Librería', 20, 0.24)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (4, N'TIP-CI-PEQ', N'B81074601', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'Librería', 25, 16.25)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (5, N'MAR-FA-CAS', N'B81074601', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'Librería', 10, 9)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (6, N'PEG-BA-PEQ', N'B39203153', CAST(N'2022-10-30T00:00:00.000' AS DateTime), N'Librería', 10, 4.5)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (7, N'BOL-PI-GRI', N'B39203153', CAST(N'2022-10-30T00:00:00.000' AS DateTime), N'Librería', 30, 34.5)
INSERT [dbo].[Suministros] ([Idsum], [sku ], [nif], [fecha de compra], [categoria], [cantidad], [total]) VALUES (8, N'CAL-CA-CIE', N'B39203153', CAST(N'2022-10-30T00:00:00.000' AS DateTime), N'Librería', 10, 125)
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_DNI] FOREIGN KEY([DNI])
REFERENCES [dbo].[Clientes] ([DNI])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_DNI]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_sku2] FOREIGN KEY([sku])
REFERENCES [dbo].[Productos] ([SKU])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_sku2]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Categoría] FOREIGN KEY([Categoría])
REFERENCES [dbo].[Categorías] ([Categoría])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Categoría]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_NIF] FOREIGN KEY([NIF])
REFERENCES [dbo].[Proveedores] ([NIF])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_NIF]
GO
ALTER TABLE [dbo].[Suministros]  WITH CHECK ADD  CONSTRAINT [FK_nifp] FOREIGN KEY([nif])
REFERENCES [dbo].[Proveedores] ([NIF])
GO
ALTER TABLE [dbo].[Suministros] CHECK CONSTRAINT [FK_nifp]
GO
ALTER TABLE [dbo].[Suministros]  WITH CHECK ADD  CONSTRAINT [FK_sku] FOREIGN KEY([sku ])
REFERENCES [dbo].[Productos] ([SKU])
GO
ALTER TABLE [dbo].[Suministros] CHECK CONSTRAINT [FK_sku]
GO
USE [master]
GO
ALTER DATABASE [ProyectoMR] SET  READ_WRITE 
GO
