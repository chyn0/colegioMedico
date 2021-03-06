USE [master]
GO
/****** Object:  Database [Colegio_Medico]    Script Date: 08/09/2014 08:02:17 ******/
CREATE DATABASE [Colegio_Medico] ON  PRIMARY 
( NAME = N'Colegio_Medico', FILENAME = N'H:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Colegio_Medico.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Colegio_Medico_log', FILENAME = N'H:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Colegio_Medico_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Colegio_Medico] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Colegio_Medico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Colegio_Medico] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Colegio_Medico] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Colegio_Medico] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Colegio_Medico] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Colegio_Medico] SET ARITHABORT OFF
GO
ALTER DATABASE [Colegio_Medico] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Colegio_Medico] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Colegio_Medico] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Colegio_Medico] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Colegio_Medico] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Colegio_Medico] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Colegio_Medico] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Colegio_Medico] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Colegio_Medico] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Colegio_Medico] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Colegio_Medico] SET  DISABLE_BROKER
GO
ALTER DATABASE [Colegio_Medico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Colegio_Medico] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Colegio_Medico] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Colegio_Medico] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Colegio_Medico] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Colegio_Medico] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Colegio_Medico] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Colegio_Medico] SET  READ_WRITE
GO
ALTER DATABASE [Colegio_Medico] SET RECOVERY FULL
GO
ALTER DATABASE [Colegio_Medico] SET  MULTI_USER
GO
ALTER DATABASE [Colegio_Medico] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Colegio_Medico] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Colegio_Medico', N'ON'
GO
USE [Colegio_Medico]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 08/09/2014 08:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombreProvincia] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] ON
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (1, N'DISTRITO NACIONAL')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (2, N'SANTIAGO')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (3, N'LA VEGA')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (4, N'SAN CRISTOBAL')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (5, N'SAN PEDRO')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (7, N'wildyn')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (8, N'null')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (9, N'null')
INSERT [dbo].[PROVINCIA] ([idProvincia], [nombreProvincia]) VALUES (10, N'WUILDYN')
SET IDENTITY_INSERT [dbo].[PROVINCIA] OFF
/****** Object:  StoredProcedure [dbo].[getAllProvincia]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllProvincia]
as
SELECT CAST(0 as bit) as [...],* FROM PROVINCIA
GO
/****** Object:  StoredProcedure [dbo].[setProvincia]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[setProvincia]
@nombre varchar(20) = ''
as
if (@nombre <> '' or @nombre =null )
begin
insert PROVINCIA (nombreProvincia)
values (@nombre)
end
else 
begin
return -1
end
GO
/****** Object:  StoredProcedure [dbo].[updateProvincia]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProvincia]
@id INT
,@nombre VARCHAR(20)
AS
BEGIN
if(@id > 0 )
	BEGIN
		IF exists(select * from PROVINCIA where idProvincia = @id)
			BEGIN
				UPDATE PROVINCIA
				SET nombreProvincia = @nombre
				WHERE idProvincia = @id
			END
		ELSE
		BEGIN
			RETURN -2
		END
	END
	ELSE
		BEGIN
			RETURN -1
		END
END
GO
/****** Object:  Table [dbo].[MEDICO]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEDICO](
	[idMedico] [int] IDENTITY(100,1) NOT NULL,
	[nombreMedico] [varchar](20) NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](13) NULL,
	[idProvincia] [int] NULL,
	[fechaIngreso] [date] NULL,
	[estatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [MEDICO_PROVINCIA_FK] ON [dbo].[MEDICO] 
(
	[idProvincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MEDICO] ON
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (100, N'PEDRO LOPEZ', N'N/A', N'8095555555', 1, CAST(0xD1380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (101, N'ROSA GUZMAN', N'N/A', N'8095555555', 4, CAST(0xD1380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (102, N'JUAN LOPEZ', N'N/A', N'8095555555', 2, CAST(0xD1380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (103, N'TERESA PEREZ', N'N/A', N'8095555555', 1, CAST(0xDB380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (104, N'thdfg', N'gdsfg', N'(555)-555-555', 1, CAST(0xDB380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (105, N'gdfgd', N'gsdfg', N'(555)-555-555', 1, CAST(0xDB380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (106, N'fsdaf', N'adsf', N'fasdfa', 1, CAST(0xDB380B00 AS Date), N'fasdfas')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (107, N'WILDYN', N'N/A', N'(555)-555-555', 1, CAST(0xDB380B00 AS Date), N'Activo')
INSERT [dbo].[MEDICO] ([idMedico], [nombreMedico], [direccion], [telefono], [idProvincia], [fechaIngreso], [estatus]) VALUES (108, N'JOSE', N'N/A', N'(555)-555-555', 1, CAST(0xDB380B00 AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[MEDICO] OFF
/****** Object:  StoredProcedure [dbo].[getProvinciaByNombre]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getProvinciaByNombre]
@nombre varchar(20) = ''
as 
select CAST(0 as bit) as [...],* from PROVINCIA
where upper(nombreProvincia) like upper('%'+@nombre+'%')
GO
/****** Object:  StoredProcedure [dbo].[getProvinciaById]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getProvinciaById]
@id int
as 
select CAST(0 as bit) as [...],* from provincia
where idprovincia like @id
GO
/****** Object:  Table [dbo].[CUOTAXMEDICO]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUOTAXMEDICO](
	[idCuota] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[cuotaPagar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCuota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CUOTAXMEDICO_MEDICO_FK] ON [dbo].[CUOTAXMEDICO] 
(
	[idMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CUOTAXMEDICO] ON
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (1, 100, 1500)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (2, 101, 2000)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (3, 102, 1500)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (4, 103, 1500)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (5, 104, 0)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (6, 105, 0)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (7, 106, 18000)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (8, 107, 18000)
INSERT [dbo].[CUOTAXMEDICO] ([idCuota], [idMedico], [cuotaPagar]) VALUES (9, 108, 50000)
SET IDENTITY_INSERT [dbo].[CUOTAXMEDICO] OFF
/****** Object:  Table [dbo].[CUOTA]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUOTA](
	[idCuotaMes] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NULL,
	[mes] [int] NULL,
	[ano] [int] NULL,
	[monto] [int] NULL,
	[estatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCuotaMes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [CUOTA_MEDICO_FK] ON [dbo].[CUOTA] 
(
	[idMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CUOTA] ON
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (12, 100, 1, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (13, 101, 1, 2014, 2000, N'S')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (14, 102, 1, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (15, 103, 1, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (16, 100, 2, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (17, 101, 2, 2014, 2000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (18, 102, 2, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (19, 103, 2, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (20, 100, 3, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (21, 101, 3, 2014, 2000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (22, 102, 3, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (23, 103, 3, 2014, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (84, 100, 1, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (85, 101, 1, 2015, 2000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (86, 102, 1, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (87, 103, 1, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (88, 104, 1, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (89, 105, 1, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (90, 107, 1, 2015, 18000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (91, 108, 1, 2015, 50000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (92, 100, 2, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (93, 101, 2, 2015, 2000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (94, 102, 2, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (95, 103, 2, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (96, 104, 2, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (97, 105, 2, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (98, 107, 2, 2015, 18000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (99, 108, 2, 2015, 50000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (100, 100, 3, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (101, 101, 3, 2015, 2000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (102, 102, 3, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (103, 103, 3, 2015, 1500, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (104, 104, 3, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (105, 105, 3, 2015, 0, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (106, 107, 3, 2015, 18000, N'P')
INSERT [dbo].[CUOTA] ([idCuotaMes], [idMedico], [mes], [ano], [monto], [estatus]) VALUES (107, 108, 3, 2015, 50000, N'P')
SET IDENTITY_INSERT [dbo].[CUOTA] OFF
/****** Object:  StoredProcedure [dbo].[getMedicoByNombre]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getMedicoByNombre]
@nombre varchar(20)
as
begin
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,sum(c.monto) as balance,m.estatus 
from MEDICO m
inner join CUOTA c on (m.idMedico=c.idMedico)
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where c.estatus = 'P'
and upper(m.nombreMedico) like UPPER('%'+@nombre+'%')
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
union
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,0 as balance,m.estatus 
from MEDICO m
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where  upper(m.nombreMedico) like UPPER('%'+@nombre+'%')
and m.idMedico not in (select distinct idMedico from CUOTA)
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
end
GO
/****** Object:  StoredProcedure [dbo].[getMedicoById]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getMedicoById]
@id int
as
begin
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,sum(c.monto) as balance,m.estatus 
from MEDICO m
inner join CUOTA c on (m.idMedico=c.idMedico)
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where m.idMedico = @id
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
union
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,0 as balance,m.estatus 
from MEDICO m
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where  m.idMedico not in (select distinct idMedico from CUOTA)
AND m.idMedico = @id
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
end
GO
/****** Object:  StoredProcedure [dbo].[getCuotaPendienteById]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCuotaPendienteById]
@id int = 0
as
if(@id != 0 or @id != null)
	begin
		SELECT * FROM CUOTA
		WHERE estatus = 'p'
		AND idMedico = @id
	end
else
	begin
		return @id
	end
GO
/****** Object:  StoredProcedure [dbo].[getCuotaById]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCuotaById]
@id int =0
as
SELECT CAST(0 as bit) as [...],* FROM CUOTA	
WHERE idMedico = @id
GO
/****** Object:  StoredProcedure [dbo].[getBalaneByIdMedico]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBalaneByIdMedico]
@id int = 0
as
if (@id <> 0 or @id <> null )
begin 
SELECT M.idMedico,M.nombreMedico,CM.cuotaPagar,P.nombreProvincia, SUM(C.monto) as Balance ,M.estatus
FROM 
MEDICO M
INNER JOIN CUOTA C ON (M.idMedico = C.idMedico)
INNER JOIN CUOTAXMEDICO CM ON (M.idMedico = CM.idMedico)
INNER JOIN PROVINCIA P ON (M.idProvincia = P.idProvincia)
WHERE 
C.estatus = 'P'
AND M.idMedico = @id
GROUP BY M.idMedico,M.nombreMedico,M.estatus,CM.cuotaPagar,P.nombreProvincia
end
else
begin
return -1
end
GO
/****** Object:  StoredProcedure [dbo].[getAllMedico]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllMedico]
as
begin
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,sum(c.monto) as balance,m.estatus 
from MEDICO m
inner join CUOTA c on (m.idMedico=c.idMedico)
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where c.estatus = 'P'
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
union
select CAST(0 as bit) as [...],m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar as cuota,0 as balance,m.estatus 
from MEDICO m
inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
where m.idMedico not in (select distinct idMedico from CUOTA)
group by m.idMedico,m.nombreMedico,m.direccion,m.telefono,m.idProvincia,cm.cuotaPagar,m.estatus 
end
GO
/****** Object:  StoredProcedure [dbo].[getAllCuota]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllCuota]
as
	begin
		SELECT CAST(0 as bit) as [...],* FROM CUOTA	
	end
GO
/****** Object:  StoredProcedure [dbo].[getAllBalance]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllBalance]
as
SELECT M.idMedico,M.nombreMedico,CM.cuotaPagar,P.nombreProvincia, SUM(C.monto) as Balance ,M.estatus
FROM 
MEDICO M
INNER JOIN CUOTA C ON (M.idMedico = C.idMedico)
INNER JOIN CUOTAXMEDICO CM ON (M.idMedico = CM.idMedico)
INNER JOIN PROVINCIA P ON (M.idProvincia = P.idProvincia)
WHERE C.estatus = 'P'
GROUP BY M.idMedico,M.nombreMedico,M.estatus,CM.cuotaPagar,P.nombreProvincia
GO
/****** Object:  StoredProcedure [dbo].[generateCuota]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[generateCuota]
@mes int = 0,
@ano int = 0
AS
IF ((@mes <> 0 and @ano <> 0) or (@mes <> null and @ano <> null))
BEGIN
	IF(@ano >= YEAR(GETDATE()))
	BEGIN	
		if not exists(select distinct mes, ano from CUOTA where mes = @mes and ano=@ano)
			BEGIN
			select 0 as sucess
			SET NOCOUNT OFF
				insert into CUOTA (idMedico,mes,ano,monto,estatus)
				select m.idMedico,@mes as mes,@ano as ano,cm.cuotaPagar as monto , 'P' as [status] from MEDICO m
				inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
				where upper(estatus) = upper('activo')
					SET NOCOUNT ON
				
			END
		else
			BEGIN
				 select -3 as error--cuota creada
			END
	END
	ELSE
		BEGIN	
			 select -2 as error--ano menor al actual
		END
END
ELSE	
BEGIN
	 select -1 as error--datos mal introdusidos
END
GO
/****** Object:  Table [dbo].[PAGO]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGO](
	[idPago] [int] IDENTITY(1000,1) NOT NULL,
	[idCuotaMes] [int] NOT NULL,
	[idMedico] [int] NULL,
	[pago] [int] NULL,
	[fechaPago] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CUOTA_PAGO_FK] ON [dbo].[PAGO] 
(
	[idCuotaMes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PAGO] ON
INSERT [dbo].[PAGO] ([idPago], [idCuotaMes], [idMedico], [pago], [fechaPago]) VALUES (1000, 13, 101, 200, CAST(0xD1380B00 AS Date))
SET IDENTITY_INSERT [dbo].[PAGO] OFF
/****** Object:  StoredProcedure [dbo].[setMedico]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[setMedico]
@nombreMedico varchar(20) = '',
@direccion varchar(255)= '',
@telefono varchar (13)= '',
@idProvincia int = 0,
@estatus varchar(20)= '',
@cuotaPagar int = 0,
@idMedico int = 0
as
if (@nombreMedico <> '' or @nombreMedico <> null or @direccion <> '' or @direccion <> null or @telefono <> '' or @telefono <> null or @idProvincia <> 0 or @idProvincia <> null or @estatus <> '' or @estatus <> null or @cuotaPagar <> 0 or @cuotaPagar <> null )
	begin
		insert into MEDICO (nombreMedico,direccion,telefono,idProvincia,fechaIngreso,estatus)
		values(@nombreMedico,@direccion,@telefono,@idProvincia,GETDATE(),@estatus)
		
		  select @idMedico = idMedico  from MEDICO where nombreMedico = @nombreMedico and direccion =@direccion and telefono = @telefono and idProvincia = @idProvincia and estatus = @estatus
		
		insert into CUOTAXMEDICO (idMedico,cuotaPagar)
		values (@idMedico,@cuotaPagar)
	end
else
	begin
		return -1
	end
GO
/****** Object:  StoredProcedure [dbo].[updateMedico]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateMedico]
@id INT
,@nombre VARCHAR(20)
,@direccion VARCHAR(255)
,@tel VARCHAR(13)
,@idp INT
,@estatus VARCHAR(20)
,@cuota INT
AS
BEGIN
if(@id > 0 )
	BEGIN
		IF EXISTS(SELECT * FROM MEDICO WHERE idMedico = @id)
			BEGIN
				UPDATE MEDICO
				SET nombreMedico = @nombre,direccion = @direccion,telefono = @tel,idProvincia = @idp,estatus = @estatus ,fechaIngreso = GETDATE()
				WHERE idMedico = @id
				
				UPDATE CUOTAXMEDICO
				SET cuotaPagar = @cuota
				WHERE idMedico = @id
			END
		ELSE
		BEGIN
			RETURN -2
		END
	END
	ELSE
		BEGIN
			RETURN -1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[setPago]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[setPago]
@idCuotaMes int = 0,
@idMedico int = 0,
@pago int = 0
as
if(@idCuotaMes <> 0 or @idCuotaMes <> null or @idMedico <> 0 or @idMedico <> null or @pago <>0 or @pago<> null)
	begin
		insert into pago (idCuotaMes,idMedico,pago,fechaPago)
		values (@idCuotaMes,@idMedico,@pago,GETDATE())
		
update CUOTA set estatus = 'S' where idCuotaMes = @idCuotaMes
		
	end
else
	begin
		return -1
	end
GO
/****** Object:  StoredProcedure [dbo].[getAllPago]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllPago]
as
SELECT CAST(0 as bit) as [...],* FROM PAGO
GO
/****** Object:  StoredProcedure [dbo].[getPagoById]    Script Date: 08/09/2014 08:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPagoById]
@id int =0
as
SELECT CAST(0 as bit) as [...],* FROM PAGO	
WHERE idMedico = @id
GO
/****** Object:  ForeignKey [FK__MEDICO__idProvin__0519C6AF]    Script Date: 08/09/2014 08:02:20 ******/
ALTER TABLE [dbo].[MEDICO]  WITH CHECK ADD FOREIGN KEY([idProvincia])
REFERENCES [dbo].[PROVINCIA] ([idProvincia])
GO
/****** Object:  ForeignKey [FK__CUOTAXMED__idMed__0EA330E9]    Script Date: 08/09/2014 08:02:20 ******/
ALTER TABLE [dbo].[CUOTAXMEDICO]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO
/****** Object:  ForeignKey [FK__CUOTA__idMedico__09DE7BCC]    Script Date: 08/09/2014 08:02:20 ******/
ALTER TABLE [dbo].[CUOTA]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO
/****** Object:  ForeignKey [FK__PAGO__idCuotaMes__1367E606]    Script Date: 08/09/2014 08:02:20 ******/
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD FOREIGN KEY([idCuotaMes])
REFERENCES [dbo].[CUOTA] ([idCuotaMes])
GO
