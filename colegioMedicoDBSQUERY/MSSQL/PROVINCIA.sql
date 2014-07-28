USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 07/28/2014 00:21:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROVINCIA]') AND type in (N'U'))
DROP TABLE [dbo].[PROVINCIA]
GO

USE [Colegio_Medico]
GO

/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 07/28/2014 00:21:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROVINCIA](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


