USE [Colegio_Medico]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CUOTAXMED__idMed__0EA330E9]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUOTAXMEDICO]'))
ALTER TABLE [dbo].[CUOTAXMEDICO] DROP CONSTRAINT [FK__CUOTAXMED__idMed__0EA330E9]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[CUOTAXMEDICO]    Script Date: 07/28/2014 00:21:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUOTAXMEDICO]') AND type in (N'U'))
DROP TABLE [dbo].[CUOTAXMEDICO]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[CUOTAXMEDICO]    Script Date: 07/28/2014 00:21:10 ******/
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

ALTER TABLE [dbo].[CUOTAXMEDICO]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[MEDICO] ([idMedico])
GO


