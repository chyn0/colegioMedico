USE [Colegio_Medico]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PAGO__idCuotaMes__1367E606]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAGO]'))
ALTER TABLE [dbo].[PAGO] DROP CONSTRAINT [FK__PAGO__idCuotaMes__1367E606]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[PAGO]    Script Date: 07/28/2014 00:21:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAGO]') AND type in (N'U'))
DROP TABLE [dbo].[PAGO]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[PAGO]    Script Date: 07/28/2014 00:21:25 ******/
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

ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD FOREIGN KEY([idCuotaMes])
REFERENCES [dbo].[CUOTA] ([idCuotaMes])
GO


