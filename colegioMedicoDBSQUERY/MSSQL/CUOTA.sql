USE [Colegio_Medico]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CUOTA__idMedico__09DE7BCC]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUOTA]'))
ALTER TABLE [dbo].[CUOTA] DROP CONSTRAINT [FK__CUOTA__idMedico__09DE7BCC]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[CUOTA]    Script Date: 07/28/2014 00:21:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUOTA]') AND type in (N'U'))
DROP TABLE [dbo].[CUOTA]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[CUOTA]    Script Date: 07/28/2014 00:21:02 ******/
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

ALTER TABLE [dbo].[CUOTA]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO


