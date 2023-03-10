USE [master]
GO
/****** Object:  Database [tallerDB]    Script Date: 14/2/2023 14:00:14 ******/
CREATE DATABASE [tallerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tallerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tallerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tallerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tallerDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tallerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tallerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tallerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tallerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tallerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tallerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tallerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [tallerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tallerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tallerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tallerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tallerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tallerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tallerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tallerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tallerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tallerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tallerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tallerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tallerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tallerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tallerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tallerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tallerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tallerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [tallerDB] SET  MULTI_USER 
GO
ALTER DATABASE [tallerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tallerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tallerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tallerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tallerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tallerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tallerDB', N'ON'
GO
ALTER DATABASE [tallerDB] SET QUERY_STORE = OFF
GO
USE [tallerDB]
GO
/****** Object:  User [java]    Script Date: 14/2/2023 14:00:14 ******/
CREATE USER [java] FOR LOGIN [java] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [java]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [java]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [java]
GO
ALTER ROLE [db_datareader] ADD MEMBER [java]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [java]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 14/2/2023 14:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_cargo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria_reparacion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_reparacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_categoria_reparacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[centro_servicio]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centro_servicio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
 CONSTRAINT [PK_centro_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[centro_servicio_contacto]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centro_servicio_contacto](
	[centro_servicio_id] [bigint] NOT NULL,
	[tipo_contacto_id] [bigint] NOT NULL,
	[contacto] [varchar](35) NOT NULL,
 CONSTRAINT [PK_centro_servicio_contacto] PRIMARY KEY CLUSTERED 
(
	[centro_servicio_id] ASC,
	[tipo_contacto_id] ASC,
	[contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[centro_servicio_direccion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centro_servicio_direccion](
	[centro_servicio_id] [bigint] NOT NULL,
	[direccion_id] [bigint] NOT NULL,
 CONSTRAINT [PK_centro_servicio_direccion] PRIMARY KEY CLUSTERED 
(
	[centro_servicio_id] ASC,
	[direccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direccion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[municipio_id] [bigint] NOT NULL,
	[direccion] [varbinary](255) NOT NULL,
	[tipo_direccion_id] [int] NULL,
 CONSTRAINT [PK_direccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [bigint] NOT NULL,
	[orden_trabajo_id] [bigint] NULL,
	[lote_trabajo_id] [bigint] NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imagen_orden_trabajo_reparacion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imagen_orden_trabajo_reparacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orden_trabajo_reparacion_id] [bigint] NULL,
	[imagen] [varchar](250) NULL,
	[descripcion] [text] NULL,
	[create_at] [date] NULL,
 CONSTRAINT [PK_imagen_orden_trabajo_reparacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote_factura]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote_factura](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[resolucion] [varchar](50) NULL,
	[rango_inicio] [int] NULL,
	[rango_fin] [int] NULL,
	[tipo_factura] [varchar](50) NULL,
 CONSTRAINT [PK_lote_factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo_vehiculo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo_vehiculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[tipo_vehiculo_id] [bigint] NULL,
	[capacidad] [int] NULL,
	[anio] [int] NOT NULL,
 CONSTRAINT [PK_modelo_vehiculo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[departamento_id] [bigint] NULL,
 CONSTRAINT [PK_municipio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_trabajo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_trabajo](
	[id] [bigint] NOT NULL,
	[vehiculo_id] [bigint] NULL,
	[comentario] [text] NULL,
	[create_at] [date] NULL,
	[fecha_finalizacion] [date] NULL,
 CONSTRAINT [PK_orden_trabajo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_trabajo_reparacion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_trabajo_reparacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orden_trabajo_id] [bigint] NOT NULL,
	[reparacion_id] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[comentario] [text] NULL,
	[precio] [float] NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[persona_id] [bigint] NULL,
 CONSTRAINT [PK_orden_trabajo_reparacion_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[dui] [varchar](50) NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona_cargo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona_cargo](
	[persona_id] [bigint] NOT NULL,
	[cargo_id] [bigint] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[salario] [float] NULL,
 CONSTRAINT [PK_persona_cargo] PRIMARY KEY CLUSTERED 
(
	[persona_id] ASC,
	[cargo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona_contacto]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona_contacto](
	[persona_id] [bigint] NOT NULL,
	[tipo_contacto_id] [bigint] NOT NULL,
	[contacto] [varchar](35) NOT NULL,
 CONSTRAINT [PK_persona_contacto] PRIMARY KEY CLUSTERED 
(
	[persona_id] ASC,
	[tipo_contacto_id] ASC,
	[contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona_direccion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona_direccion](
	[direccion_id] [bigint] NOT NULL,
	[persona_id] [bigint] NOT NULL,
 CONSTRAINT [PK_persona_direccion] PRIMARY KEY CLUSTERED 
(
	[direccion_id] ASC,
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona_tipo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona_tipo](
	[persona_id] [bigint] NOT NULL,
	[tipo_persona_id] [bigint] NOT NULL,
 CONSTRAINT [PK_persona_tipo] PRIMARY KEY CLUSTERED 
(
	[persona_id] ASC,
	[tipo_persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reparacion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reparacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[precio] [int] NULL,
	[categoria_id] [bigint] NULL,
 CONSTRAINT [PK_reparacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [bigint] NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_contacto]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_contacto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_contacto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_direccion]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_direccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_direccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_persona]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_persona](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_vehiculo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_vehiculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_vehiculo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [bigint] NOT NULL,
	[persona_id] [bigint] NOT NULL,
	[estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_usuario_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_rol]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_rol](
	[usuario_id] [bigint] NOT NULL,
	[rol_id] [bigint] NOT NULL,
	[create_at] [date] NULL,
 CONSTRAINT [PK_usuario_rol_1] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC,
	[rol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculo]    Script Date: 14/2/2023 14:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[persona_id] [bigint] NOT NULL,
	[modelo_vehiculo_id] [bigint] NOT NULL,
	[create_at] [date] NOT NULL,
	[placa] [varchar](12) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_vehiculo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[centro_servicio_contacto]  WITH CHECK ADD  CONSTRAINT [FK_centro_servicio_contacto_centro_servicio] FOREIGN KEY([centro_servicio_id])
REFERENCES [dbo].[centro_servicio] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[centro_servicio_contacto] CHECK CONSTRAINT [FK_centro_servicio_contacto_centro_servicio]
GO
ALTER TABLE [dbo].[centro_servicio_contacto]  WITH CHECK ADD  CONSTRAINT [FK_centro_servicio_contacto_tipo_contacto] FOREIGN KEY([tipo_contacto_id])
REFERENCES [dbo].[tipo_contacto] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[centro_servicio_contacto] CHECK CONSTRAINT [FK_centro_servicio_contacto_tipo_contacto]
GO
ALTER TABLE [dbo].[centro_servicio_direccion]  WITH CHECK ADD  CONSTRAINT [FK_centro_servicio_direccion_centro_servicio] FOREIGN KEY([centro_servicio_id])
REFERENCES [dbo].[centro_servicio] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[centro_servicio_direccion] CHECK CONSTRAINT [FK_centro_servicio_direccion_centro_servicio]
GO
ALTER TABLE [dbo].[centro_servicio_direccion]  WITH CHECK ADD  CONSTRAINT [FK_centro_servicio_direccion_direccion] FOREIGN KEY([direccion_id])
REFERENCES [dbo].[direccion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[centro_servicio_direccion] CHECK CONSTRAINT [FK_centro_servicio_direccion_direccion]
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD  CONSTRAINT [FK_direccion_municipio] FOREIGN KEY([municipio_id])
REFERENCES [dbo].[municipio] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[direccion] CHECK CONSTRAINT [FK_direccion_municipio]
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD  CONSTRAINT [FK_direccion_tipo_direccion] FOREIGN KEY([tipo_direccion_id])
REFERENCES [dbo].[tipo_direccion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[direccion] CHECK CONSTRAINT [FK_direccion_tipo_direccion]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_lote_factura] FOREIGN KEY([lote_trabajo_id])
REFERENCES [dbo].[lote_factura] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_lote_factura]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_orden_trabajo] FOREIGN KEY([orden_trabajo_id])
REFERENCES [dbo].[orden_trabajo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_orden_trabajo]
GO
ALTER TABLE [dbo].[imagen_orden_trabajo_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_imagen_orden_trabajo_reparacion_orden_trabajo_reparacion] FOREIGN KEY([orden_trabajo_reparacion_id])
REFERENCES [dbo].[orden_trabajo_reparacion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[imagen_orden_trabajo_reparacion] CHECK CONSTRAINT [FK_imagen_orden_trabajo_reparacion_orden_trabajo_reparacion]
GO
ALTER TABLE [dbo].[modelo_vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_modelo_vehiculo_tipo_vehiculo] FOREIGN KEY([tipo_vehiculo_id])
REFERENCES [dbo].[tipo_vehiculo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[modelo_vehiculo] CHECK CONSTRAINT [FK_modelo_vehiculo_tipo_vehiculo]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [FK_municipio_departamento] FOREIGN KEY([departamento_id])
REFERENCES [dbo].[departamento] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [FK_municipio_departamento]
GO
ALTER TABLE [dbo].[orden_trabajo]  WITH CHECK ADD  CONSTRAINT [FK_orden_trabajo_vehiculo] FOREIGN KEY([vehiculo_id])
REFERENCES [dbo].[vehiculo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[orden_trabajo] CHECK CONSTRAINT [FK_orden_trabajo_vehiculo]
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_orden_trabajo_reparacion_orden_trabajo] FOREIGN KEY([orden_trabajo_id])
REFERENCES [dbo].[orden_trabajo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion] CHECK CONSTRAINT [FK_orden_trabajo_reparacion_orden_trabajo]
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_orden_trabajo_reparacion_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion] CHECK CONSTRAINT [FK_orden_trabajo_reparacion_persona]
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_orden_trabajo_reparacion_reparacion] FOREIGN KEY([reparacion_id])
REFERENCES [dbo].[reparacion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[orden_trabajo_reparacion] CHECK CONSTRAINT [FK_orden_trabajo_reparacion_reparacion]
GO
ALTER TABLE [dbo].[persona_cargo]  WITH CHECK ADD  CONSTRAINT [FK_persona_cargo_cargo] FOREIGN KEY([cargo_id])
REFERENCES [dbo].[cargo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_cargo] CHECK CONSTRAINT [FK_persona_cargo_cargo]
GO
ALTER TABLE [dbo].[persona_cargo]  WITH CHECK ADD  CONSTRAINT [FK_persona_cargo_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_cargo] CHECK CONSTRAINT [FK_persona_cargo_persona]
GO
ALTER TABLE [dbo].[persona_contacto]  WITH CHECK ADD  CONSTRAINT [FK_persona_contacto_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_contacto] CHECK CONSTRAINT [FK_persona_contacto_persona]
GO
ALTER TABLE [dbo].[persona_contacto]  WITH CHECK ADD  CONSTRAINT [FK_persona_contacto_tipo_contacto] FOREIGN KEY([tipo_contacto_id])
REFERENCES [dbo].[tipo_contacto] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_contacto] CHECK CONSTRAINT [FK_persona_contacto_tipo_contacto]
GO
ALTER TABLE [dbo].[persona_direccion]  WITH CHECK ADD  CONSTRAINT [FK_persona_direccion_direccion] FOREIGN KEY([direccion_id])
REFERENCES [dbo].[direccion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_direccion] CHECK CONSTRAINT [FK_persona_direccion_direccion]
GO
ALTER TABLE [dbo].[persona_direccion]  WITH CHECK ADD  CONSTRAINT [FK_persona_direccion_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_direccion] CHECK CONSTRAINT [FK_persona_direccion_persona]
GO
ALTER TABLE [dbo].[persona_tipo]  WITH CHECK ADD  CONSTRAINT [FK_persona_tipo_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_tipo] CHECK CONSTRAINT [FK_persona_tipo_persona]
GO
ALTER TABLE [dbo].[persona_tipo]  WITH CHECK ADD  CONSTRAINT [FK_persona_tipo_tipo_persona] FOREIGN KEY([tipo_persona_id])
REFERENCES [dbo].[tipo_persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[persona_tipo] CHECK CONSTRAINT [FK_persona_tipo_tipo_persona]
GO
ALTER TABLE [dbo].[reparacion]  WITH CHECK ADD  CONSTRAINT [FK_reparacion_categoria_reparacion] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categoria_reparacion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[reparacion] CHECK CONSTRAINT [FK_reparacion_categoria_reparacion]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_persona]
GO
ALTER TABLE [dbo].[usuario_rol]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol_rol] FOREIGN KEY([rol_id])
REFERENCES [dbo].[rol] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usuario_rol] CHECK CONSTRAINT [FK_usuario_rol_rol]
GO
ALTER TABLE [dbo].[usuario_rol]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usuario_rol] CHECK CONSTRAINT [FK_usuario_rol_usuario]
GO
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_modelo_vehiculo] FOREIGN KEY([modelo_vehiculo_id])
REFERENCES [dbo].[modelo_vehiculo] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_modelo_vehiculo]
GO
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[persona] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_persona]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena el tipo de contacto: email, telefono movil, telefono de casa, telefono de trabajo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipo_contacto'
GO
USE [master]
GO
ALTER DATABASE [tallerDB] SET  READ_WRITE 
GO
