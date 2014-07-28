USE [master]
GO

/****** Object:  Database [Colegio_Medico]    Script Date: 07/28/2014 00:20:31 ******/
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

