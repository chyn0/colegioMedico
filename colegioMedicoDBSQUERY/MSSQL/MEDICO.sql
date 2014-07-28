USE [Colegio_Medico]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MEDICO__idProvin__0519C6AF]') AND parent_object_id = OBJECT_ID(N'[dbo].[MEDICO]'))
ALTER TABLE [dbo].[MEDICO] DROP CONSTRAINT [FK__MEDICO__idProvin__0519C6AF]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[MEDICO]    Script Date: 07/28/2014 00:21:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MEDICO]') AND type in (N'U'))
DROP TABLE [dbo].[MEDICO]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[MEDICO]    Script Date: 07/28/2014 00:21:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MEDICO](
	[idMedico] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](20) NULL,
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

ALTER TABLE [dbo].[MEDICO]  WITH CHECK ADD FOREIGN KEY([idProvincia])
REFERENCES [dbo].[PROVINCIA] ([idProvincia])
GO


