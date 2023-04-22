USE [master]
GO
/****** Object:  Database [esencialVerde]    Script Date: 22/04/2023 14:07:03 ******/
CREATE DATABASE [esencialVerde]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'esencialVerde', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\esencialVerde.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'esencialVerde_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\esencialVerde_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [esencialVerde] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [esencialVerde].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [esencialVerde] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [esencialVerde] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [esencialVerde] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [esencialVerde] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [esencialVerde] SET ARITHABORT OFF 
GO
ALTER DATABASE [esencialVerde] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [esencialVerde] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [esencialVerde] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [esencialVerde] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [esencialVerde] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [esencialVerde] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [esencialVerde] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [esencialVerde] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [esencialVerde] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [esencialVerde] SET  DISABLE_BROKER 
GO
ALTER DATABASE [esencialVerde] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [esencialVerde] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [esencialVerde] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [esencialVerde] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [esencialVerde] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [esencialVerde] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [esencialVerde] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [esencialVerde] SET RECOVERY FULL 
GO
ALTER DATABASE [esencialVerde] SET  MULTI_USER 
GO
ALTER DATABASE [esencialVerde] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [esencialVerde] SET DB_CHAINING OFF 
GO
ALTER DATABASE [esencialVerde] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [esencialVerde] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [esencialVerde] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [esencialVerde] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'esencialVerde', N'ON'
GO
ALTER DATABASE [esencialVerde] SET QUERY_STORE = ON
GO
ALTER DATABASE [esencialVerde] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [esencialVerde]
GO
/****** Object:  User [whiit]    Script Date: 22/04/2023 14:07:03 ******/
CREATE USER [whiit] FOR LOGIN [whiit] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [whiit]
GO
/****** Object:  Table [dbo].[actores]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actores](
	[actorID] [int] IDENTITY(1,1) NOT NULL,
	[referenceID] [int] NULL,
	[objectTypeID] [int] NULL,
	[freeName] [nvarchar](50) NULL,
	[cuenta] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_actores] PRIMARY KEY CLUSTERED 
(
	[actorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[ciudadID] [int] NOT NULL,
	[zipcode] [nchar](9) NOT NULL,
	[location] [geography] NOT NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificaciones]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificaciones](
	[certificacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[durationY] [smallint] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_certificaciones] PRIMARY KEY CLUSTERED 
(
	[certificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certiXempresa]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certiXempresa](
	[certificacionID] [int] NOT NULL,
	[empresaID] [bigint] NOT NULL,
	[expiration] [datetime] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[enable] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudad](
	[ciudadID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[estadoID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[ciudadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[claseDxProdu]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claseDxProdu](
	[productoID] [int] NOT NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[cantidad] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasesDesecho]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasesDesecho](
	[claseDesechoID] [smallint] IDENTITY(1,1) NOT NULL,
	[recyclable] [bit] NOT NULL,
	[description] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_cClasses] PRIMARY KEY CLUSTERED 
(
	[claseDesechoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comisiones]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comisiones](
	[comisionID] [uniqueidentifier] NOT NULL,
	[porcentaje] [decimal](3, 2) NOT NULL,
	[actorID] [int] NOT NULL,
 CONSTRAINT [PK_comisiones] PRIMARY KEY CLUSTERED 
(
	[comisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXempresa]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXempresa](
	[empresaID] [bigint] NOT NULL,
	[contactValueID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXplanta]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXplanta](
	[plantaID] [bigint] NOT NULL,
	[contactValueID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXprodu]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXprodu](
	[sedeProduID] [bigint] NOT NULL,
	[contactValueID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXreco]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXreco](
	[sedeRecoID] [bigint] NOT NULL,
	[contactValueID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactTypes](
	[contactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_contactTypes] PRIMARY KEY CLUSTERED 
(
	[contactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactValues]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactValues](
	[contactValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[contactTypeID] [int] NOT NULL,
	[value] [nvarchar](100) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_contactValues] PRIMARY KEY CLUSTERED 
(
	[contactValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containers]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containers](
	[containerID] [bigint] IDENTITY(1,1) NOT NULL,
	[durability] [decimal](5, 2) NOT NULL,
	[containerTypeID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
 CONSTRAINT [PK_containers] PRIMARY KEY CLUSTERED 
(
	[containerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containersXmovL]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containersXmovL](
	[movementLogID] [bigint] NOT NULL,
	[containerID] [bigint] NOT NULL,
	[durability] [decimal](5, 2) NOT NULL,
	[tweight] [smallint] NOT NULL,
	[statusContainerID] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containerTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containerTypes](
	[containerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[modeloID] [int] NOT NULL,
	[weight] [smallint] NOT NULL,
	[capacity] [smallint] NOT NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[description] [nvarchar](25) NOT NULL,
	[cantInUse] [int] NULL,
	[cantNotInUse] [int] NULL,
	[cantOnRepair] [int] NULL,
	[cantAvailable] [int] NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_containerTypes] PRIMARY KEY CLUSTERED 
(
	[containerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratos]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratos](
	[contratoID] [bigint] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[recoType] [bit] NOT NULL,
	[sedeProduID] [bigint] NULL,
	[sedeRecoID] [bigint] NULL,
	[reqGroupID] [uniqueidentifier] NOT NULL,
	[comisionID] [uniqueidentifier] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
	[empresaID] [bigint] NOT NULL,
 CONSTRAINT [PK_contratos] PRIMARY KEY CLUSTERED 
(
	[contratoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosGroup]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosGroup](
	[contratoGroupID] [uniqueidentifier] NOT NULL,
	[contratoID] [bigint] NOT NULL,
	[porcentaje] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_contratosGroup] PRIMARY KEY CLUSTERED 
(
	[contratoGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechos]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechos](
	[desechoID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_desecho] PRIMARY KEY CLUSTERED 
(
	[desechoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas](
	[empresaID] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](45) NOT NULL,
	[type] [smallint] NOT NULL,
	[addressID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED 
(
	[empresaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[paisID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventLogs]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventLogs](
	[eventID] [int] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[computer] [nvarchar](20) NOT NULL,
	[username] [nvarchar](25) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[description] [nvarchar](80) NOT NULL,
	[reference1] [nvarchar](50) NOT NULL,
	[reference2] [nvarchar](50) NULL,
	[value1] [bigint] NOT NULL,
	[value2] [bigint] NULL,
	[enable] [bit] NOT NULL,
	[sourceID] [int] NOT NULL,
	[levelID] [int] NOT NULL,
	[eventTID] [int] NOT NULL,
	[objectTypeID] [int] NOT NULL,
 CONSTRAINT [PK_eventLogs] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventTypes](
	[eventTID] [int] IDENTITY(1,1) NOT NULL,
	[enable] [bit] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_eventTypes] PRIMARY KEY CLUSTERED 
(
	[eventTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flyway_schema_history](
	[installed_rank] [int] NOT NULL,
	[version] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
	[type] [nvarchar](20) NOT NULL,
	[script] [nvarchar](1000) NOT NULL,
	[checksum] [int] NULL,
	[installed_by] [nvarchar](100) NOT NULL,
	[installed_on] [datetime] NOT NULL,
	[execution_time] [int] NOT NULL,
	[success] [bit] NOT NULL,
 CONSTRAINT [flyway_schema_history_pk] PRIMARY KEY CLUSTERED 
(
	[installed_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horario]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horario](
	[horarioID] [uniqueidentifier] NOT NULL,
	[dia] [smallint] NOT NULL,
	[startHour] [time](0) NOT NULL,
	[endHour] [time](0) NOT NULL,
	[enable] [bit] NOT NULL,
	[weekLapse] [smallint] NOT NULL,
 CONSTRAINT [PK_horario] PRIMARY KEY CLUSTERED 
(
	[horarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[industriaTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[industriaTypes](
	[industriaTypeID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_industriaTypes] PRIMARY KEY CLUSTERED 
(
	[industriaTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[lenguageID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](25) NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[lenguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[levelID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelos]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelos](
	[modeloID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[brandID] [int] NOT NULL,
	[year] [smallint] NOT NULL,
 CONSTRAINT [PK_modelos] PRIMARY KEY CLUSTERED 
(
	[modeloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedas]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedas](
	[monedaID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[simbolo] [nchar](10) NOT NULL,
	[acronimo] [nchar](3) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[monedaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movementLogs]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movementLogs](
	[movementLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[movementTypeID] [smallint] NOT NULL,
	[referenceID] [int] NULL,
	[entrega] [varbinary](50) NOT NULL,
	[recibe] [varbinary](50) NOT NULL,
	[plantaID] [bigint] NULL,
	[sedeRecoID] [bigint] NULL,
	[sedeProduID] [bigint] NULL,
	[contratoID] [bigint] NOT NULL,
	[desechoID] [int] NULL,
 CONSTRAINT [PK_containerLogs] PRIMARY KEY CLUSTERED 
(
	[movementLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movementTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movementTypes](
	[movementTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_movementTypes] PRIMARY KEY CLUSTERED 
(
	[movementTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivelContaminante]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivelContaminante](
	[sedeProduID] [bigint] NOT NULL,
	[nivel] [smallint] NOT NULL,
	[endDate] [datetime] NULL,
	[startDate] [datetime] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[enable] [bit] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objectTypes](
	[objectTypeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_objectTypes] PRIMARY KEY CLUSTERED 
(
	[objectTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagosProcesamiento]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagosProcesamiento](
	[pagoProcesamientoID] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[plantaID] [bigint] NOT NULL,
	[contratoID] [bigint] NOT NULL,
	[desechoID] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[monedaID] [int] NOT NULL,
 CONSTRAINT [PK_pagosProcesamiento] PRIMARY KEY CLUSTERED 
(
	[pagoProcesamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[paisID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED 
(
	[paisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantaLogs]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantaLogs](
	[plantaLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[plantaID] [bigint] NOT NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[quantity] [int] NOT NULL,
	[costo] [money] NOT NULL,
	[sedeProduID] [bigint] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
 CONSTRAINT [PK_plantaLogs] PRIMARY KEY CLUSTERED 
(
	[plantaLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantas]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantas](
	[plantaID] [bigint] IDENTITY(1,1) NOT NULL,
	[addressID] [int] NOT NULL,
	[description] [nvarchar](25) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_plantas] PRIMARY KEY CLUSTERED 
(
	[plantaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preciosProce]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosProce](
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[precio] [money] NOT NULL,
	[regionID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
	[desecho] [nchar](10) NULL,
	[procesoID] [int] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preciosProdu]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosProdu](
	[productoID] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[regionID] [int] NOT NULL,
	[precioProduccion] [money] NOT NULL,
	[precioVenta] [money] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[enable] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[procesos]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procesos](
	[procesoID] [int] IDENTITY(1,1) NOT NULL,
	[desechoID] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_procesos] PRIMARY KEY CLUSTERED 
(
	[procesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[productoID] [int] IDENTITY(1,1) NOT NULL,
	[enable] [bit] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[productoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productosGroup]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productosGroup](
	[productosGroupID] [uniqueidentifier] NOT NULL,
	[productoID] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[contratoGroupID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_pedidoID] PRIMARY KEY CLUSTERED 
(
	[productosGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produSponsors]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produSponsors](
	[produSponsorID] [bigint] NOT NULL,
	[sedeProduID] [bigint] NOT NULL,
	[ciudadID] [int] NULL,
	[estadoID] [int] NULL,
	[regionID] [int] NULL,
	[claseDesechoID] [smallint] NULL,
	[sedeProduID2] [bigint] NULL,
	[industriaTypeID] [int] NULL,
	[porcentaje] [decimal](3, 2) NOT NULL,
	[contratoID] [bigint] NOT NULL,
 CONSTRAINT [PK_produSponsors] PRIMARY KEY CLUSTERED 
(
	[produSponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regionAreas]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regionAreas](
	[regionID] [int] NOT NULL,
	[ciudadID] [int] NULL,
	[estadoID] [int] NULL,
	[paisID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[regionID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_regiones] PRIMARY KEY CLUSTERED 
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reqGroups]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reqGroups](
	[reqGroupID] [uniqueidentifier] NOT NULL,
	[claseDesechoID] [smallint] NOT NULL,
	[cantidad] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[enable] [bit] NOT NULL,
	[horarioID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_reqGroups] PRIMARY KEY CLUSTERED 
(
	[reqGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sedesProdu]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sedesProdu](
	[sedeProduID] [bigint] IDENTITY(1,1) NOT NULL,
	[empresaID] [bigint] NOT NULL,
	[addressID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
	[balance] [money] NOT NULL,
	[industriaTypeID] [int] NOT NULL,
 CONSTRAINT [PK_sedesProdu] PRIMARY KEY CLUSTERED 
(
	[sedeProduID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sedesReco]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sedesReco](
	[sedeRecoID] [bigint] IDENTITY(1,1) NOT NULL,
	[empresaID] [bigint] NOT NULL,
	[addressID] [int] NOT NULL,
	[enable] [bit] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sedesReco] PRIMARY KEY CLUSTERED 
(
	[sedeRecoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sources]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sources](
	[sourceID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_sources] PRIMARY KEY CLUSTERED 
(
	[sourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusContainers]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusContainers](
	[statusContainerID] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_statusContainers] PRIMARY KEY CLUSTERED 
(
	[statusContainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusLogs]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusLogs](
	[statusLogID] [int] IDENTITY(1,1) NOT NULL,
	[containerID] [bigint] NOT NULL,
	[statusContainerID] [smallint] NOT NULL,
	[durability] [decimal](5, 2) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[desechoID] [int] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
 CONSTRAINT [PK_containersLogs] PRIMARY KEY CLUSTERED 
(
	[statusLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposCambio]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposCambio](
	[tipoCambioID] [int] IDENTITY(1,1) NOT NULL,
	[monedaID] [int] NOT NULL,
	[cambio] [money] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[enddate] [datetime] NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[enable] [bit] NULL,
 CONSTRAINT [PK_tiposCambio] PRIMARY KEY CLUSTERED 
(
	[tipoCambioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionLogs]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionLogs](
	[transactionLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[transactionTypeID] [smallint] NOT NULL,
	[referenceID] [bigint] NOT NULL,
	[monto] [money] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[actorID] [int] NOT NULL,
	[discount] [money] NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[monedaID] [int] NOT NULL,
 CONSTRAINT [PK_transactionLogs] PRIMARY KEY CLUSTERED 
(
	[transactionLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionType]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionType](
	[transactionTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_transactionType] PRIMARY KEY CLUSTERED 
(
	[transactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[translations]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[translations](
	[translationID] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](100) NOT NULL,
	[refenceID] [bigint] NOT NULL,
	[lenguageID] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[objectTypeID] [int] NOT NULL,
 CONSTRAINT [PK_translations] PRIMARY KEY CLUSTERED 
(
	[translationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventasProdu]    Script Date: 22/04/2023 14:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasProdu](
	[ventaProduID] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[pedidoID] [uniqueidentifier] NOT NULL,
	[plantaID] [bigint] NOT NULL,
	[checksum] [varbinary](150) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[monedaID] [int] NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[ventaProduID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [flyway_schema_history_s_idx]    Script Date: 22/04/2023 14:07:03 ******/
CREATE NONCLUSTERED INDEX [flyway_schema_history_s_idx] ON [dbo].[flyway_schema_history]
(
	[success] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[certificaciones] ADD  CONSTRAINT [DF_certificaciones_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[certiXempresa] ADD  CONSTRAINT [DF_certiXempresa_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[ciudad] ADD  CONSTRAINT [DF_ciudad_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[contactValues] ADD  CONSTRAINT [DF_contactValues_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[containers] ADD  CONSTRAINT [DF_containers_durability_1]  DEFAULT ((100.00)) FOR [durability]
GO
ALTER TABLE [dbo].[containers] ADD  CONSTRAINT [DF_containers_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[containersXmovL] ADD  CONSTRAINT [DF_containersXmovL_durability]  DEFAULT ((100.00)) FOR [durability]
GO
ALTER TABLE [dbo].[containerTypes] ADD  CONSTRAINT [DF_containerTypes_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[desechos] ADD  CONSTRAINT [DF_desecho_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_enable_1]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[estado] ADD  CONSTRAINT [DF_estado_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[eventLogs] ADD  CONSTRAINT [DF_eventLogs_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[eventTypes] ADD  CONSTRAINT [DF_eventTypes_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[flyway_schema_history] ADD  DEFAULT (getdate()) FOR [installed_on]
GO
ALTER TABLE [dbo].[horario] ADD  CONSTRAINT [DF_horario_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[horario] ADD  CONSTRAINT [DF_horario_weekLapse]  DEFAULT ((1)) FOR [weekLapse]
GO
ALTER TABLE [dbo].[industriaTypes] ADD  CONSTRAINT [DF_industriaTypes_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[languages] ADD  CONSTRAINT [DF_languages_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[levels] ADD  CONSTRAINT [DF_levels_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[marcas] ADD  CONSTRAINT [DF_marcas_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[monedas] ADD  CONSTRAINT [DF_monedas_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[movementTypes] ADD  CONSTRAINT [DF_movementTypes_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[nivelContaminante] ADD  CONSTRAINT [DF_nivelContaminante_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[objectTypes] ADD  CONSTRAINT [DF_objectTypes_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[pais] ADD  CONSTRAINT [DF_pais_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[plantas] ADD  CONSTRAINT [DF_plantas_enable_1]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[preciosProce] ADD  CONSTRAINT [DF_preciosProceRegional_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[preciosProdu] ADD  CONSTRAINT [DF_preciosProduRegional_enable1]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[procesos] ADD  CONSTRAINT [DF_procesos_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[producto] ADD  CONSTRAINT [DF_producto_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[regiones] ADD  CONSTRAINT [DF_regiones_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[reqGroups] ADD  CONSTRAINT [DF_reqGroups_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[sedesProdu] ADD  CONSTRAINT [DF_sedesProdu_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[sedesProdu] ADD  CONSTRAINT [DF_sedesProdu_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[sedesReco] ADD  CONSTRAINT [DF_sedesReco_empresaID]  DEFAULT ((1)) FOR [empresaID]
GO
ALTER TABLE [dbo].[sedesReco] ADD  CONSTRAINT [DF_sedesReco_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[sources] ADD  CONSTRAINT [DF_sources_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[statusContainers] ADD  CONSTRAINT [DF_statusContainers_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[tiposCambio] ADD  CONSTRAINT [DF_tiposCambio_enable]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[transactionType] ADD  CONSTRAINT [DF_transactionType_enable_1]  DEFAULT ((1)) FOR [enable]
GO
ALTER TABLE [dbo].[actores]  WITH CHECK ADD  CONSTRAINT [FK_actores_objectTypes] FOREIGN KEY([objectTypeID])
REFERENCES [dbo].[objectTypes] ([objectTypeID])
GO
ALTER TABLE [dbo].[actores] CHECK CONSTRAINT [FK_actores_objectTypes]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_ciudad] FOREIGN KEY([ciudadID])
REFERENCES [dbo].[ciudad] ([ciudadID])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_ciudad]
GO
ALTER TABLE [dbo].[certificaciones]  WITH CHECK ADD  CONSTRAINT [FK_certificaciones_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[certificaciones] CHECK CONSTRAINT [FK_certificaciones_clasesDesecho]
GO
ALTER TABLE [dbo].[certiXempresa]  WITH CHECK ADD  CONSTRAINT [FK_certiXempresa_certificaciones] FOREIGN KEY([certificacionID])
REFERENCES [dbo].[certificaciones] ([certificacionID])
GO
ALTER TABLE [dbo].[certiXempresa] CHECK CONSTRAINT [FK_certiXempresa_certificaciones]
GO
ALTER TABLE [dbo].[certiXempresa]  WITH CHECK ADD  CONSTRAINT [FK_certiXempresa_empresas] FOREIGN KEY([empresaID])
REFERENCES [dbo].[empresas] ([empresaID])
GO
ALTER TABLE [dbo].[certiXempresa] CHECK CONSTRAINT [FK_certiXempresa_empresas]
GO
ALTER TABLE [dbo].[ciudad]  WITH CHECK ADD  CONSTRAINT [FK_ciudad_estado] FOREIGN KEY([estadoID])
REFERENCES [dbo].[estado] ([estadoID])
GO
ALTER TABLE [dbo].[ciudad] CHECK CONSTRAINT [FK_ciudad_estado]
GO
ALTER TABLE [dbo].[claseDxProdu]  WITH CHECK ADD  CONSTRAINT [FK_claseDxProdu_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[claseDxProdu] CHECK CONSTRAINT [FK_claseDxProdu_clasesDesecho]
GO
ALTER TABLE [dbo].[claseDxProdu]  WITH CHECK ADD  CONSTRAINT [FK_claseDxProdu_producto] FOREIGN KEY([productoID])
REFERENCES [dbo].[producto] ([productoID])
GO
ALTER TABLE [dbo].[claseDxProdu] CHECK CONSTRAINT [FK_claseDxProdu_producto]
GO
ALTER TABLE [dbo].[comisiones]  WITH CHECK ADD  CONSTRAINT [FK_comisiones_actores] FOREIGN KEY([actorID])
REFERENCES [dbo].[actores] ([actorID])
GO
ALTER TABLE [dbo].[comisiones] CHECK CONSTRAINT [FK_comisiones_actores]
GO
ALTER TABLE [dbo].[contactoXempresa]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresa_contactValues] FOREIGN KEY([contactValueID])
REFERENCES [dbo].[contactValues] ([contactValueID])
GO
ALTER TABLE [dbo].[contactoXempresa] CHECK CONSTRAINT [FK_contactoXempresa_contactValues]
GO
ALTER TABLE [dbo].[contactoXempresa]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresa_empresas] FOREIGN KEY([empresaID])
REFERENCES [dbo].[empresas] ([empresaID])
GO
ALTER TABLE [dbo].[contactoXempresa] CHECK CONSTRAINT [FK_contactoXempresa_empresas]
GO
ALTER TABLE [dbo].[contactoXplanta]  WITH CHECK ADD  CONSTRAINT [FK_contactoXplanta_contactValues] FOREIGN KEY([contactValueID])
REFERENCES [dbo].[contactValues] ([contactValueID])
GO
ALTER TABLE [dbo].[contactoXplanta] CHECK CONSTRAINT [FK_contactoXplanta_contactValues]
GO
ALTER TABLE [dbo].[contactoXplanta]  WITH CHECK ADD  CONSTRAINT [FK_contactoXplanta_plantas] FOREIGN KEY([plantaID])
REFERENCES [dbo].[plantas] ([plantaID])
GO
ALTER TABLE [dbo].[contactoXplanta] CHECK CONSTRAINT [FK_contactoXplanta_plantas]
GO
ALTER TABLE [dbo].[contactoXprodu]  WITH CHECK ADD  CONSTRAINT [FK_contactoXprodu_contactValues] FOREIGN KEY([contactValueID])
REFERENCES [dbo].[contactValues] ([contactValueID])
GO
ALTER TABLE [dbo].[contactoXprodu] CHECK CONSTRAINT [FK_contactoXprodu_contactValues]
GO
ALTER TABLE [dbo].[contactoXprodu]  WITH CHECK ADD  CONSTRAINT [FK_contactoXprodu_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[contactoXprodu] CHECK CONSTRAINT [FK_contactoXprodu_sedesProdu]
GO
ALTER TABLE [dbo].[contactoXreco]  WITH CHECK ADD  CONSTRAINT [FK_contactoXreco_contactValues] FOREIGN KEY([contactValueID])
REFERENCES [dbo].[contactValues] ([contactValueID])
GO
ALTER TABLE [dbo].[contactoXreco] CHECK CONSTRAINT [FK_contactoXreco_contactValues]
GO
ALTER TABLE [dbo].[contactoXreco]  WITH CHECK ADD  CONSTRAINT [FK_contactoXreco_sedesReco] FOREIGN KEY([sedeRecoID])
REFERENCES [dbo].[sedesReco] ([sedeRecoID])
GO
ALTER TABLE [dbo].[contactoXreco] CHECK CONSTRAINT [FK_contactoXreco_sedesReco]
GO
ALTER TABLE [dbo].[contactValues]  WITH CHECK ADD  CONSTRAINT [FK_contactValues_contactTypes] FOREIGN KEY([contactTypeID])
REFERENCES [dbo].[contactTypes] ([contactTypeID])
GO
ALTER TABLE [dbo].[contactValues] CHECK CONSTRAINT [FK_contactValues_contactTypes]
GO
ALTER TABLE [dbo].[containers]  WITH CHECK ADD  CONSTRAINT [FK_containers_containerTypes] FOREIGN KEY([containerTypeID])
REFERENCES [dbo].[containerTypes] ([containerTypeID])
GO
ALTER TABLE [dbo].[containers] CHECK CONSTRAINT [FK_containers_containerTypes]
GO
ALTER TABLE [dbo].[containersXmovL]  WITH CHECK ADD  CONSTRAINT [FK_containersXmovL_containers] FOREIGN KEY([containerID])
REFERENCES [dbo].[containers] ([containerID])
GO
ALTER TABLE [dbo].[containersXmovL] CHECK CONSTRAINT [FK_containersXmovL_containers]
GO
ALTER TABLE [dbo].[containersXmovL]  WITH CHECK ADD  CONSTRAINT [FK_containersXmovL_movementLogs] FOREIGN KEY([movementLogID])
REFERENCES [dbo].[movementLogs] ([movementLogID])
GO
ALTER TABLE [dbo].[containersXmovL] CHECK CONSTRAINT [FK_containersXmovL_movementLogs]
GO
ALTER TABLE [dbo].[containersXmovL]  WITH CHECK ADD  CONSTRAINT [FK_containersXmovL_statusContainers] FOREIGN KEY([statusContainerID])
REFERENCES [dbo].[statusContainers] ([statusContainerID])
GO
ALTER TABLE [dbo].[containersXmovL] CHECK CONSTRAINT [FK_containersXmovL_statusContainers]
GO
ALTER TABLE [dbo].[containerTypes]  WITH CHECK ADD  CONSTRAINT [FK_containerTypes_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[containerTypes] CHECK CONSTRAINT [FK_containerTypes_clasesDesecho]
GO
ALTER TABLE [dbo].[containerTypes]  WITH CHECK ADD  CONSTRAINT [FK_containerTypes_modelos] FOREIGN KEY([modeloID])
REFERENCES [dbo].[modelos] ([modeloID])
GO
ALTER TABLE [dbo].[containerTypes] CHECK CONSTRAINT [FK_containerTypes_modelos]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_comisiones] FOREIGN KEY([comisionID])
REFERENCES [dbo].[comisiones] ([comisionID])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_comisiones]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_empresas] FOREIGN KEY([empresaID])
REFERENCES [dbo].[empresas] ([empresaID])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_empresas]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_reqGroups] FOREIGN KEY([reqGroupID])
REFERENCES [dbo].[reqGroups] ([reqGroupID])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_reqGroups]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_sedesProdu]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_sedesReco] FOREIGN KEY([sedeRecoID])
REFERENCES [dbo].[sedesReco] ([sedeRecoID])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_sedesReco]
GO
ALTER TABLE [dbo].[contratosGroup]  WITH CHECK ADD  CONSTRAINT [FK_contratosGroup_contratos] FOREIGN KEY([contratoID])
REFERENCES [dbo].[contratos] ([contratoID])
GO
ALTER TABLE [dbo].[contratosGroup] CHECK CONSTRAINT [FK_contratosGroup_contratos]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desecho_clasesDesecho]
GO
ALTER TABLE [dbo].[estado]  WITH CHECK ADD  CONSTRAINT [FK_estado_pais] FOREIGN KEY([paisID])
REFERENCES [dbo].[pais] ([paisID])
GO
ALTER TABLE [dbo].[estado] CHECK CONSTRAINT [FK_estado_pais]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_eventTypes] FOREIGN KEY([eventTID])
REFERENCES [dbo].[eventTypes] ([eventTID])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_eventTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_levels] FOREIGN KEY([levelID])
REFERENCES [dbo].[levels] ([levelID])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_levels]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes] FOREIGN KEY([objectTypeID])
REFERENCES [dbo].[objectTypes] ([objectTypeID])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_sources] FOREIGN KEY([sourceID])
REFERENCES [dbo].[sources] ([sourceID])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_sources]
GO
ALTER TABLE [dbo].[modelos]  WITH CHECK ADD  CONSTRAINT [FK_modelos_marcas] FOREIGN KEY([brandID])
REFERENCES [dbo].[marcas] ([brandID])
GO
ALTER TABLE [dbo].[modelos] CHECK CONSTRAINT [FK_modelos_marcas]
GO
ALTER TABLE [dbo].[movementLogs]  WITH CHECK ADD  CONSTRAINT [FK_movementLogs_contratos] FOREIGN KEY([contratoID])
REFERENCES [dbo].[contratos] ([contratoID])
GO
ALTER TABLE [dbo].[movementLogs] CHECK CONSTRAINT [FK_movementLogs_contratos]
GO
ALTER TABLE [dbo].[movementLogs]  WITH CHECK ADD  CONSTRAINT [FK_movementLogs_movementTypes] FOREIGN KEY([movementTypeID])
REFERENCES [dbo].[movementTypes] ([movementTypeID])
GO
ALTER TABLE [dbo].[movementLogs] CHECK CONSTRAINT [FK_movementLogs_movementTypes]
GO
ALTER TABLE [dbo].[movementLogs]  WITH CHECK ADD  CONSTRAINT [FK_movementLogs_plantas] FOREIGN KEY([plantaID])
REFERENCES [dbo].[plantas] ([plantaID])
GO
ALTER TABLE [dbo].[movementLogs] CHECK CONSTRAINT [FK_movementLogs_plantas]
GO
ALTER TABLE [dbo].[movementLogs]  WITH CHECK ADD  CONSTRAINT [FK_movementLogs_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[movementLogs] CHECK CONSTRAINT [FK_movementLogs_sedesProdu]
GO
ALTER TABLE [dbo].[movementLogs]  WITH CHECK ADD  CONSTRAINT [FK_movementLogs_sedesReco] FOREIGN KEY([sedeRecoID])
REFERENCES [dbo].[sedesReco] ([sedeRecoID])
GO
ALTER TABLE [dbo].[movementLogs] CHECK CONSTRAINT [FK_movementLogs_sedesReco]
GO
ALTER TABLE [dbo].[nivelContaminante]  WITH CHECK ADD  CONSTRAINT [FK_nivelContaminante_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[nivelContaminante] CHECK CONSTRAINT [FK_nivelContaminante_sedesProdu]
GO
ALTER TABLE [dbo].[pagosProcesamiento]  WITH CHECK ADD  CONSTRAINT [FK_pagosProcesamiento_contratos] FOREIGN KEY([contratoID])
REFERENCES [dbo].[contratos] ([contratoID])
GO
ALTER TABLE [dbo].[pagosProcesamiento] CHECK CONSTRAINT [FK_pagosProcesamiento_contratos]
GO
ALTER TABLE [dbo].[pagosProcesamiento]  WITH CHECK ADD  CONSTRAINT [FK_pagosProcesamiento_desecho] FOREIGN KEY([desechoID])
REFERENCES [dbo].[desechos] ([desechoID])
GO
ALTER TABLE [dbo].[pagosProcesamiento] CHECK CONSTRAINT [FK_pagosProcesamiento_desecho]
GO
ALTER TABLE [dbo].[pagosProcesamiento]  WITH CHECK ADD  CONSTRAINT [FK_pagosProcesamiento_monedas] FOREIGN KEY([monedaID])
REFERENCES [dbo].[monedas] ([monedaID])
GO
ALTER TABLE [dbo].[pagosProcesamiento] CHECK CONSTRAINT [FK_pagosProcesamiento_monedas]
GO
ALTER TABLE [dbo].[pagosProcesamiento]  WITH CHECK ADD  CONSTRAINT [FK_pagosProcesamiento_plantas] FOREIGN KEY([plantaID])
REFERENCES [dbo].[plantas] ([plantaID])
GO
ALTER TABLE [dbo].[pagosProcesamiento] CHECK CONSTRAINT [FK_pagosProcesamiento_plantas]
GO
ALTER TABLE [dbo].[plantaLogs]  WITH CHECK ADD  CONSTRAINT [FK_plantaLogs_dClasses] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[plantaLogs] CHECK CONSTRAINT [FK_plantaLogs_dClasses]
GO
ALTER TABLE [dbo].[plantaLogs]  WITH CHECK ADD  CONSTRAINT [FK_plantaLogs_plantas] FOREIGN KEY([plantaID])
REFERENCES [dbo].[plantas] ([plantaID])
GO
ALTER TABLE [dbo].[plantaLogs] CHECK CONSTRAINT [FK_plantaLogs_plantas]
GO
ALTER TABLE [dbo].[plantaLogs]  WITH CHECK ADD  CONSTRAINT [FK_plantaLogs_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[plantaLogs] CHECK CONSTRAINT [FK_plantaLogs_sedesProdu]
GO
ALTER TABLE [dbo].[plantas]  WITH CHECK ADD  CONSTRAINT [FK_plantas_addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[addresses] ([addressID])
GO
ALTER TABLE [dbo].[plantas] CHECK CONSTRAINT [FK_plantas_addresses]
GO
ALTER TABLE [dbo].[preciosProce]  WITH CHECK ADD  CONSTRAINT [FK_preciosProceRegional_procesos] FOREIGN KEY([procesoID])
REFERENCES [dbo].[procesos] ([procesoID])
GO
ALTER TABLE [dbo].[preciosProce] CHECK CONSTRAINT [FK_preciosProceRegional_procesos]
GO
ALTER TABLE [dbo].[preciosProce]  WITH CHECK ADD  CONSTRAINT [FK_preciosProceRegional_regiones] FOREIGN KEY([regionID])
REFERENCES [dbo].[regiones] ([regionID])
GO
ALTER TABLE [dbo].[preciosProce] CHECK CONSTRAINT [FK_preciosProceRegional_regiones]
GO
ALTER TABLE [dbo].[preciosProdu]  WITH CHECK ADD  CONSTRAINT [FK_preciosProduRegional_producto] FOREIGN KEY([productoID])
REFERENCES [dbo].[producto] ([productoID])
GO
ALTER TABLE [dbo].[preciosProdu] CHECK CONSTRAINT [FK_preciosProduRegional_producto]
GO
ALTER TABLE [dbo].[preciosProdu]  WITH CHECK ADD  CONSTRAINT [FK_preciosProduRegional_regiones] FOREIGN KEY([regionID])
REFERENCES [dbo].[regiones] ([regionID])
GO
ALTER TABLE [dbo].[preciosProdu] CHECK CONSTRAINT [FK_preciosProduRegional_regiones]
GO
ALTER TABLE [dbo].[procesos]  WITH CHECK ADD  CONSTRAINT [FK_procesos_desecho] FOREIGN KEY([desechoID])
REFERENCES [dbo].[desechos] ([desechoID])
GO
ALTER TABLE [dbo].[procesos] CHECK CONSTRAINT [FK_procesos_desecho]
GO
ALTER TABLE [dbo].[productosGroup]  WITH CHECK ADD  CONSTRAINT [FK_pedidoID_producto] FOREIGN KEY([productoID])
REFERENCES [dbo].[producto] ([productoID])
GO
ALTER TABLE [dbo].[productosGroup] CHECK CONSTRAINT [FK_pedidoID_producto]
GO
ALTER TABLE [dbo].[productosGroup]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_contratosGroup] FOREIGN KEY([contratoGroupID])
REFERENCES [dbo].[contratosGroup] ([contratoGroupID])
GO
ALTER TABLE [dbo].[productosGroup] CHECK CONSTRAINT [FK_pedidos_contratosGroup]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_ciudad] FOREIGN KEY([ciudadID])
REFERENCES [dbo].[ciudad] ([ciudadID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_ciudad]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_clasesDesecho]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_contratos] FOREIGN KEY([contratoID])
REFERENCES [dbo].[contratos] ([contratoID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_contratos]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_estado] FOREIGN KEY([estadoID])
REFERENCES [dbo].[estado] ([estadoID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_estado]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_industriaTypes] FOREIGN KEY([industriaTypeID])
REFERENCES [dbo].[industriaTypes] ([industriaTypeID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_industriaTypes]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_regiones] FOREIGN KEY([regionID])
REFERENCES [dbo].[regiones] ([regionID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_regiones]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_sedesProdu] FOREIGN KEY([sedeProduID])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_sedesProdu]
GO
ALTER TABLE [dbo].[produSponsors]  WITH CHECK ADD  CONSTRAINT [FK_produSponsors_sedesProdu1] FOREIGN KEY([sedeProduID2])
REFERENCES [dbo].[sedesProdu] ([sedeProduID])
GO
ALTER TABLE [dbo].[produSponsors] CHECK CONSTRAINT [FK_produSponsors_sedesProdu1]
GO
ALTER TABLE [dbo].[regionAreas]  WITH CHECK ADD  CONSTRAINT [FK_regionAreas_ciudad] FOREIGN KEY([ciudadID])
REFERENCES [dbo].[ciudad] ([ciudadID])
GO
ALTER TABLE [dbo].[regionAreas] CHECK CONSTRAINT [FK_regionAreas_ciudad]
GO
ALTER TABLE [dbo].[regionAreas]  WITH CHECK ADD  CONSTRAINT [FK_regionAreas_estado] FOREIGN KEY([estadoID])
REFERENCES [dbo].[estado] ([estadoID])
GO
ALTER TABLE [dbo].[regionAreas] CHECK CONSTRAINT [FK_regionAreas_estado]
GO
ALTER TABLE [dbo].[regionAreas]  WITH CHECK ADD  CONSTRAINT [FK_regionAreas_pais] FOREIGN KEY([paisID])
REFERENCES [dbo].[pais] ([paisID])
GO
ALTER TABLE [dbo].[regionAreas] CHECK CONSTRAINT [FK_regionAreas_pais]
GO
ALTER TABLE [dbo].[regionAreas]  WITH CHECK ADD  CONSTRAINT [FK_regionAreas_regiones] FOREIGN KEY([regionID])
REFERENCES [dbo].[regiones] ([regionID])
GO
ALTER TABLE [dbo].[regionAreas] CHECK CONSTRAINT [FK_regionAreas_regiones]
GO
ALTER TABLE [dbo].[reqGroups]  WITH CHECK ADD  CONSTRAINT [FK_reqGroups_clasesDesecho] FOREIGN KEY([claseDesechoID])
REFERENCES [dbo].[clasesDesecho] ([claseDesechoID])
GO
ALTER TABLE [dbo].[reqGroups] CHECK CONSTRAINT [FK_reqGroups_clasesDesecho]
GO
ALTER TABLE [dbo].[reqGroups]  WITH CHECK ADD  CONSTRAINT [FK_reqGroups_horario] FOREIGN KEY([horarioID])
REFERENCES [dbo].[horario] ([horarioID])
GO
ALTER TABLE [dbo].[reqGroups] CHECK CONSTRAINT [FK_reqGroups_horario]
GO
ALTER TABLE [dbo].[sedesProdu]  WITH CHECK ADD  CONSTRAINT [FK_sedesProdu_addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[addresses] ([addressID])
GO
ALTER TABLE [dbo].[sedesProdu] CHECK CONSTRAINT [FK_sedesProdu_addresses]
GO
ALTER TABLE [dbo].[sedesProdu]  WITH CHECK ADD  CONSTRAINT [FK_sedesProdu_empresas] FOREIGN KEY([empresaID])
REFERENCES [dbo].[empresas] ([empresaID])
GO
ALTER TABLE [dbo].[sedesProdu] CHECK CONSTRAINT [FK_sedesProdu_empresas]
GO
ALTER TABLE [dbo].[sedesProdu]  WITH CHECK ADD  CONSTRAINT [FK_sedesProdu_industriaTypes] FOREIGN KEY([industriaTypeID])
REFERENCES [dbo].[industriaTypes] ([industriaTypeID])
GO
ALTER TABLE [dbo].[sedesProdu] CHECK CONSTRAINT [FK_sedesProdu_industriaTypes]
GO
ALTER TABLE [dbo].[sedesReco]  WITH CHECK ADD  CONSTRAINT [FK_sedesReco_addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[addresses] ([addressID])
GO
ALTER TABLE [dbo].[sedesReco] CHECK CONSTRAINT [FK_sedesReco_addresses]
GO
ALTER TABLE [dbo].[sedesReco]  WITH CHECK ADD  CONSTRAINT [FK_sedesReco_empresas] FOREIGN KEY([empresaID])
REFERENCES [dbo].[empresas] ([empresaID])
GO
ALTER TABLE [dbo].[sedesReco] CHECK CONSTRAINT [FK_sedesReco_empresas]
GO
ALTER TABLE [dbo].[statusLogs]  WITH CHECK ADD  CONSTRAINT [FK_containersLogs_containers] FOREIGN KEY([containerID])
REFERENCES [dbo].[containers] ([containerID])
GO
ALTER TABLE [dbo].[statusLogs] CHECK CONSTRAINT [FK_containersLogs_containers]
GO
ALTER TABLE [dbo].[statusLogs]  WITH CHECK ADD  CONSTRAINT [FK_containersLogs_desecho] FOREIGN KEY([desechoID])
REFERENCES [dbo].[desechos] ([desechoID])
GO
ALTER TABLE [dbo].[statusLogs] CHECK CONSTRAINT [FK_containersLogs_desecho]
GO
ALTER TABLE [dbo].[statusLogs]  WITH CHECK ADD  CONSTRAINT [FK_containersLogs_statusContainers] FOREIGN KEY([statusContainerID])
REFERENCES [dbo].[statusContainers] ([statusContainerID])
GO
ALTER TABLE [dbo].[statusLogs] CHECK CONSTRAINT [FK_containersLogs_statusContainers]
GO
ALTER TABLE [dbo].[tiposCambio]  WITH CHECK ADD  CONSTRAINT [FK_tiposCambio_monedas] FOREIGN KEY([monedaID])
REFERENCES [dbo].[monedas] ([monedaID])
GO
ALTER TABLE [dbo].[tiposCambio] CHECK CONSTRAINT [FK_tiposCambio_monedas]
GO
ALTER TABLE [dbo].[transactionLogs]  WITH CHECK ADD  CONSTRAINT [FK_transactionLogs_actores] FOREIGN KEY([actorID])
REFERENCES [dbo].[actores] ([actorID])
GO
ALTER TABLE [dbo].[transactionLogs] CHECK CONSTRAINT [FK_transactionLogs_actores]
GO
ALTER TABLE [dbo].[transactionLogs]  WITH CHECK ADD  CONSTRAINT [FK_transactionLogs_monedas] FOREIGN KEY([monedaID])
REFERENCES [dbo].[monedas] ([monedaID])
GO
ALTER TABLE [dbo].[transactionLogs] CHECK CONSTRAINT [FK_transactionLogs_monedas]
GO
ALTER TABLE [dbo].[transactionLogs]  WITH CHECK ADD  CONSTRAINT [FK_transactionLogs_transactionType] FOREIGN KEY([transactionTypeID])
REFERENCES [dbo].[transactionType] ([transactionTypeID])
GO
ALTER TABLE [dbo].[transactionLogs] CHECK CONSTRAINT [FK_transactionLogs_transactionType]
GO
ALTER TABLE [dbo].[translations]  WITH CHECK ADD  CONSTRAINT [FK_translations_languages] FOREIGN KEY([lenguageID])
REFERENCES [dbo].[languages] ([lenguageID])
GO
ALTER TABLE [dbo].[translations] CHECK CONSTRAINT [FK_translations_languages]
GO
ALTER TABLE [dbo].[translations]  WITH CHECK ADD  CONSTRAINT [FK_translations_objectTypes] FOREIGN KEY([objectTypeID])
REFERENCES [dbo].[objectTypes] ([objectTypeID])
GO
ALTER TABLE [dbo].[translations] CHECK CONSTRAINT [FK_translations_objectTypes]
GO
ALTER TABLE [dbo].[ventasProdu]  WITH CHECK ADD  CONSTRAINT [FK_venta_plantas] FOREIGN KEY([plantaID])
REFERENCES [dbo].[plantas] ([plantaID])
GO
ALTER TABLE [dbo].[ventasProdu] CHECK CONSTRAINT [FK_venta_plantas]
GO
ALTER TABLE [dbo].[ventasProdu]  WITH CHECK ADD  CONSTRAINT [FK_ventas_pedidoID] FOREIGN KEY([pedidoID])
REFERENCES [dbo].[productosGroup] ([productosGroupID])
GO
ALTER TABLE [dbo].[ventasProdu] CHECK CONSTRAINT [FK_ventas_pedidoID]
GO
ALTER TABLE [dbo].[ventasProdu]  WITH CHECK ADD  CONSTRAINT [FK_ventasProdu_monedas] FOREIGN KEY([monedaID])
REFERENCES [dbo].[monedas] ([monedaID])
GO
ALTER TABLE [dbo].[ventasProdu] CHECK CONSTRAINT [FK_ventasProdu_monedas]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'clasesDesecho', @level2type=N'COLUMN',@level2name=N'recyclable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = autorecolect
1 = normal recolect

' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos', @level2type=N'COLUMN',@level2name=N'recoType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = in EV
1 = out EV
2 = in SP
3 = out SP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'movementLogs', @level2type=N'COLUMN',@level2name=N'movementTypeID'
GO
USE [master]
GO
ALTER DATABASE [esencialVerde] SET  READ_WRITE 
GO
