USE [master]
GO
/****** Object:  Database [Colegio_Medico]    Script Date: 07/28/2014 03:54:23 ******/
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
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 07/28/2014 03:54:23 ******/
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
/****** Object:  StoredProcedure [dbo].[setProvincia]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  Table [dbo].[MEDICO]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  StoredProcedure [dbo].[getProvinciaByNombre]    Script Date: 07/28/2014 03:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getProvinciaByNombre]
@nombre varchar(20) = ''
as 
select * from PROVINCIA
where upper(nombreProvincia) like upper('%'+@nombre+'%')
GO
/****** Object:  StoredProcedure [dbo].[getProvinciaById]    Script Date: 07/28/2014 03:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getProvinciaById]
@id int
as 
select * from provincia
where idprovincia = @id
GO
/****** Object:  Table [dbo].[CUOTAXMEDICO]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  Table [dbo].[CUOTA]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  StoredProcedure [dbo].[setMedico]    Script Date: 07/28/2014 03:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[setMedico]
@nombreMedico varchar(20) = '',
@direccion varchar(255)= '',
@telefono varchar (13)= '',
@idProvincia int = 0,
@estatus varchar(20)= '',
@idMedico int = 0,
@cuotaPagar int = 0
as
if (@nombreMedico <> '' or @nombreMedico <> null or @direccion <> '' or @direccion <> null or @telefono <> '' or @telefono <> null or @idProvincia <> 0 or @idProvincia <> null or @estatus <> '' or @estatus <> null or @cuotaPagar <> 0 or @cuotaPagar <> null or @idMedico <> 0 or @idMedico <> null)
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
/****** Object:  Table [dbo].[PAGO]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  StoredProcedure [dbo].[getBalaneByIdMedico]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  StoredProcedure [dbo].[getAllBalance]    Script Date: 07/28/2014 03:54:24 ******/
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
/****** Object:  StoredProcedure [dbo].[generateCuota]    Script Date: 07/28/2014 03:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[generateCuota]
@mes int = 0,
@ano int = 0
AS
IF ((@mes <> 0 and @ano <> 0) or (@mes <> null and @ano <> null))
BEGIN
	IF(@ano >= YEAR(GETDATE()))
	BEGIN	
		if not exists(select distinct mes, ano from CUOTA where mes = @mes and ano=@ano)
			BEGIN
				insert into CUOTA (idMedico,mes,ano,monto,estatus)
				select m.idMedico,@mes as mes,@ano as ano,cm.cuotaPagar as monto , 'P' as [status] from MEDICO m
				inner join CUOTAXMEDICO cm on (m.idMedico = cm.idMedico)
				where upper(estatus) = upper('activo')
			END
		else
			BEGIN
				RETURN -3--cuota creada
			END
	END
	ELSE
		BEGIN	
			return -2--ano menor al actual
		END
END
ELSE	
BEGIN
	return -1--datos mal introdusidos
END
GO
/****** Object:  ForeignKey [FK__MEDICO__idProvin__0519C6AF]    Script Date: 07/28/2014 03:54:24 ******/
ALTER TABLE [dbo].[MEDICO]  WITH CHECK ADD FOREIGN KEY([idProvincia])
REFERENCES [dbo].[PROVINCIA] ([idProvincia])
GO
/****** Object:  ForeignKey [FK__CUOTAXMED__idMed__0EA330E9]    Script Date: 07/28/2014 03:54:24 ******/
ALTER TABLE [dbo].[CUOTAXMEDICO]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO
/****** Object:  ForeignKey [FK__CUOTA__idMedico__09DE7BCC]    Script Date: 07/28/2014 03:54:24 ******/
ALTER TABLE [dbo].[CUOTA]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO
/****** Object:  ForeignKey [FK__PAGO__idCuotaMes__1367E606]    Script Date: 07/28/2014 03:54:24 ******/
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD FOREIGN KEY([idCuotaMes])
REFERENCES [dbo].[CUOTA] ([idCuotaMes])
GO
