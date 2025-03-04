USE [master]
GO
/****** Object:  Database [СкладскойУчет]    Script Date: 25.02.2025 17:45:17 ******/
CREATE DATABASE [СкладскойУчет]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'СкладскойУчет', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\СкладскойУчет.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'СкладскойУчет_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\СкладскойУчет_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [СкладскойУчет] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [СкладскойУчет].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [СкладскойУчет] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [СкладскойУчет] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [СкладскойУчет] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [СкладскойУчет] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [СкладскойУчет] SET ARITHABORT OFF 
GO
ALTER DATABASE [СкладскойУчет] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [СкладскойУчет] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [СкладскойУчет] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [СкладскойУчет] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [СкладскойУчет] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [СкладскойУчет] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [СкладскойУчет] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [СкладскойУчет] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [СкладскойУчет] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [СкладскойУчет] SET  DISABLE_BROKER 
GO
ALTER DATABASE [СкладскойУчет] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [СкладскойУчет] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [СкладскойУчет] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [СкладскойУчет] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [СкладскойУчет] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [СкладскойУчет] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [СкладскойУчет] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [СкладскойУчет] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [СкладскойУчет] SET  MULTI_USER 
GO
ALTER DATABASE [СкладскойУчет] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [СкладскойУчет] SET DB_CHAINING OFF 
GO
ALTER DATABASE [СкладскойУчет] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [СкладскойУчет] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [СкладскойУчет] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [СкладскойУчет] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [СкладскойУчет] SET QUERY_STORE = OFF
GO
USE [СкладскойУчет]
GO
/****** Object:  Table [dbo].[Инвентаризации]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инвентаризации](
	[инвентаризация_id] [int] IDENTITY(1,1) NOT NULL,
	[дата_проведения] [date] NOT NULL,
	[пользователь_id] [int] NOT NULL,
	[склад_id] [int] NOT NULL,
	[статус] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[инвентаризация_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категории]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категории](
	[категория_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](255) NOT NULL,
	[описание] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[категория_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[клиент_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](255) NOT NULL,
	[ИНН] [varchar](20) NULL,
	[контактная_информация] [varchar](255) NULL,
	[адрес] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[клиент_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ОстаткиТоваров]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ОстаткиТоваров](
	[товар_id] [int] NOT NULL,
	[склад_id] [int] NOT NULL,
	[количество] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[товар_id] ASC,
	[склад_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[пользователь_id] [int] IDENTITY(1,1) NOT NULL,
	[имя_пользователя] [varchar](50) NOT NULL,
	[хэш_пароля] [varchar](255) NOT NULL,
	[имя] [varchar](100) NULL,
	[фамилия] [varchar](100) NULL,
	[email] [varchar](255) NULL,
	[роль_id] [int] NOT NULL,
	[двухфакторная_аутентификация] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[пользователь_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[поставщик_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](255) NOT NULL,
	[ИНН] [varchar](20) NULL,
	[КПП] [varchar](20) NULL,
	[контактная_информация] [varchar](255) NULL,
	[адрес] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[поставщик_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПриходныеНакладные]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПриходныеНакладные](
	[накладная_id] [int] IDENTITY(1,1) NOT NULL,
	[номер_накладной] [varchar](50) NULL,
	[дата_поступления] [date] NOT NULL,
	[поставщик_id] [int] NOT NULL,
	[общая_сумма] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[накладная_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РасходныеНакладные]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РасходныеНакладные](
	[накладная_id] [int] IDENTITY(1,1) NOT NULL,
	[номер_накладной] [varchar](50) NULL,
	[дата_отгрузки] [date] NOT NULL,
	[клиент_id] [int] NOT NULL,
	[общая_сумма] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[накладная_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РезультатыИнвентаризации]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РезультатыИнвентаризации](
	[инвентаризация_id] [int] NOT NULL,
	[товар_id] [int] NOT NULL,
	[ожидаемое_количество] [int] NOT NULL,
	[фактическое_количество] [int] NOT NULL,
	[причина_расхождения] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[инвентаризация_id] ASC,
	[товар_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[роль_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](50) NOT NULL,
	[описание] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[роль_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склады]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склады](
	[склад_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](255) NOT NULL,
	[адрес] [varchar](255) NULL,
	[тип] [varchar](50) NULL,
	[широта] [decimal](10, 8) NULL,
	[долгота] [decimal](11, 8) NULL,
PRIMARY KEY CLUSTERED 
(
	[склад_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СодержимоеПриходнойНакладной]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СодержимоеПриходнойНакладной](
	[накладная_id] [int] NOT NULL,
	[товар_id] [int] NOT NULL,
	[количество] [int] NOT NULL,
	[цена] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[накладная_id] ASC,
	[товар_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СодержимоеРасходнойНакладной]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СодержимоеРасходнойНакладной](
	[накладная_id] [int] NOT NULL,
	[товар_id] [int] NOT NULL,
	[количество] [int] NOT NULL,
	[цена] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[накладная_id] ASC,
	[товар_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 25.02.2025 17:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[товар_id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](255) NOT NULL,
	[артикул] [varchar](50) NULL,
	[штрихкод] [varchar](100) NULL,
	[категория_id] [int] NOT NULL,
	[единица_измерения] [varchar](50) NULL,
	[цена] [decimal](10, 2) NULL,
	[учет_серийных_номеров] [bit] NULL,
	[учет_сроков_годности] [bit] NULL,
	[минимальный_остаток] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[товар_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Инвентаризации] ON 

INSERT [dbo].[Инвентаризации] ([инвентаризация_id], [дата_проведения], [пользователь_id], [склад_id], [статус]) VALUES (1, CAST(N'2024-01-25' AS Date), 1, 1, N'Завершена')
INSERT [dbo].[Инвентаризации] ([инвентаризация_id], [дата_проведения], [пользователь_id], [склад_id], [статус]) VALUES (2, CAST(N'2024-01-28' AS Date), 2, 2, N'В процессе')
SET IDENTITY_INSERT [dbo].[Инвентаризации] OFF
GO
SET IDENTITY_INSERT [dbo].[Категории] ON 

INSERT [dbo].[Категории] ([категория_id], [название], [описание]) VALUES (1, N'Электроника', N'Различные электронные устройства и компоненты')
INSERT [dbo].[Категории] ([категория_id], [название], [описание]) VALUES (2, N'Бытовая техника', N'Техника для дома и кухни')
INSERT [dbo].[Категории] ([категория_id], [название], [описание]) VALUES (3, N'Продукты питания', N'Продукты питания длительного хранения')
INSERT [dbo].[Категории] ([категория_id], [название], [описание]) VALUES (4, N'Одежда', N'Одежда и аксессуары')
SET IDENTITY_INSERT [dbo].[Категории] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([клиент_id], [название], [ИНН], [контактная_информация], [адрес]) VALUES (1, N'ООО "Розница"', N'7707123456', N'info@roznica.ru, +7 (495) 765-43-21', N'Москва, ул. Тверская, 16')
INSERT [dbo].[Клиенты] ([клиент_id], [название], [ИНН], [контактная_информация], [адрес]) VALUES (2, N'ИП Иванов Иван Иванович', N'780212345678', N'ivanov@example.com, +7 (911) 123-45-67', N'Санкт-Петербург, ул. Гороховая, 20')
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
INSERT [dbo].[ОстаткиТоваров] ([товар_id], [склад_id], [количество]) VALUES (1, 1, 25)
INSERT [dbo].[ОстаткиТоваров] ([товар_id], [склад_id], [количество]) VALUES (2, 1, 15)
INSERT [dbo].[ОстаткиТоваров] ([товар_id], [склад_id], [количество]) VALUES (2, 2, 20)
INSERT [dbo].[ОстаткиТоваров] ([товар_id], [склад_id], [количество]) VALUES (3, 3, 1000)
INSERT [dbo].[ОстаткиТоваров] ([товар_id], [склад_id], [количество]) VALUES (4, 2, 50)
GO
SET IDENTITY_INSERT [dbo].[Пользователи] ON 

INSERT [dbo].[Пользователи] ([пользователь_id], [имя_пользователя], [хэш_пароля], [имя], [фамилия], [email], [роль_id], [двухфакторная_аутентификация]) VALUES (1, N'admin', N'password', N'Иван', N'Иванов', N'admin@example.com', 1, 1)
INSERT [dbo].[Пользователи] ([пользователь_id], [имя_пользователя], [хэш_пароля], [имя], [фамилия], [email], [роль_id], [двухфакторная_аутентификация]) VALUES (2, N'kladovshik1', N'password', N'Петр', N'Петров', N'kladovshik1@example.com', 2, 0)
INSERT [dbo].[Пользователи] ([пользователь_id], [имя_пользователя], [хэш_пароля], [имя], [фамилия], [email], [роль_id], [двухфакторная_аутентификация]) VALUES (3, N'manager1', N'password', N'Елена', N'Сидорова', N'manager1@example.com', 3, 0)
INSERT [dbo].[Пользователи] ([пользователь_id], [имя_пользователя], [хэш_пароля], [имя], [фамилия], [email], [роль_id], [двухфакторная_аутентификация]) VALUES (4, N'buhgalter1', N'password', N'Ольга', N'Смирнова', N'buhgalter1@example.com', 4, 0)
SET IDENTITY_INSERT [dbo].[Пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[Поставщики] ON 

INSERT [dbo].[Поставщики] ([поставщик_id], [название], [ИНН], [КПП], [контактная_информация], [адрес]) VALUES (1, N'ООО "Электромир"', N'7710123456', N'771001001', N'info@electromir.ru, +7 (495) 123-45-67', N'Москва, ул. Вавилова, 5')
INSERT [dbo].[Поставщики] ([поставщик_id], [название], [ИНН], [КПП], [контактная_информация], [адрес]) VALUES (2, N'ООО "БытТехника"', N'7801234567', N'780101001', N'sales@byttech.spb.ru, +7 (812) 321-45-67', N'Санкт-Петербург, ул. Садовая, 10')
INSERT [dbo].[Поставщики] ([поставщик_id], [название], [ИНН], [КПП], [контактная_информация], [адрес]) VALUES (3, N'ООО "Продукты"', N'1655123456', N'165501001', N'zakaz@products.kazan.ru, +7 (843) 292-45-67', N'Казань, ул. Пушкина, 15')
SET IDENTITY_INSERT [dbo].[Поставщики] OFF
GO
SET IDENTITY_INSERT [dbo].[ПриходныеНакладные] ON 

INSERT [dbo].[ПриходныеНакладные] ([накладная_id], [номер_накладной], [дата_поступления], [поставщик_id], [общая_сумма]) VALUES (1, N'ПН-001', CAST(N'2024-01-10' AS Date), 1, CAST(500000.00 AS Decimal(12, 2)))
INSERT [dbo].[ПриходныеНакладные] ([накладная_id], [номер_накладной], [дата_поступления], [поставщик_id], [общая_сумма]) VALUES (2, N'ПН-002', CAST(N'2024-01-15' AS Date), 2, CAST(300000.00 AS Decimal(12, 2)))
INSERT [dbo].[ПриходныеНакладные] ([накладная_id], [номер_накладной], [дата_поступления], [поставщик_id], [общая_сумма]) VALUES (3, N'ПН-003', CAST(N'2024-01-20' AS Date), 3, CAST(100000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[ПриходныеНакладные] OFF
GO
SET IDENTITY_INSERT [dbo].[РасходныеНакладные] ON 

INSERT [dbo].[РасходныеНакладные] ([накладная_id], [номер_накладной], [дата_отгрузки], [клиент_id], [общая_сумма]) VALUES (1, N'РН-001', CAST(N'2024-01-12' AS Date), 1, CAST(250000.00 AS Decimal(12, 2)))
INSERT [dbo].[РасходныеНакладные] ([накладная_id], [номер_накладной], [дата_отгрузки], [клиент_id], [общая_сумма]) VALUES (2, N'РН-002', CAST(N'2024-01-18' AS Date), 2, CAST(150000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[РасходныеНакладные] OFF
GO
INSERT [dbo].[РезультатыИнвентаризации] ([инвентаризация_id], [товар_id], [ожидаемое_количество], [фактическое_количество], [причина_расхождения]) VALUES (1, 1, 25, 25, NULL)
INSERT [dbo].[РезультатыИнвентаризации] ([инвентаризация_id], [товар_id], [ожидаемое_количество], [фактическое_количество], [причина_расхождения]) VALUES (1, 2, 15, 14, N'Утерян 1 экземпляр')
INSERT [dbo].[РезультатыИнвентаризации] ([инвентаризация_id], [товар_id], [ожидаемое_количество], [фактическое_количество], [причина_расхождения]) VALUES (2, 4, 50, 50, NULL)
GO
SET IDENTITY_INSERT [dbo].[Роли] ON 

INSERT [dbo].[Роли] ([роль_id], [название], [описание]) VALUES (1, N'Администратор', N'Полный доступ ко всем функциям системы')
INSERT [dbo].[Роли] ([роль_id], [название], [описание]) VALUES (2, N'Кладовщик', N'Приемка и отгрузка товаров, инвентаризация')
INSERT [dbo].[Роли] ([роль_id], [название], [описание]) VALUES (3, N'Менеджер', N'Резервирование товаров, контроль отгрузок')
INSERT [dbo].[Роли] ([роль_id], [название], [описание]) VALUES (4, N'Бухгалтер', N'Учет движения товаров, формирование отчетов')
SET IDENTITY_INSERT [dbo].[Роли] OFF
GO
SET IDENTITY_INSERT [dbo].[Склады] ON 

INSERT [dbo].[Склады] ([склад_id], [название], [адрес], [тип], [широта], [долгота]) VALUES (1, N'Основной склад Москва', N'Москва, ул. Ленина, 1', N'Основной', CAST(55.75580000 AS Decimal(10, 8)), CAST(37.61730000 AS Decimal(11, 8)))
INSERT [dbo].[Склады] ([склад_id], [название], [адрес], [тип], [широта], [долгота]) VALUES (2, N'Склад Санкт-Петербург', N'Санкт-Петербург, Невский проспект, 28', N'Основной', CAST(59.93750000 AS Decimal(10, 8)), CAST(30.30860000 AS Decimal(11, 8)))
INSERT [dbo].[Склады] ([склад_id], [название], [адрес], [тип], [широта], [долгота]) VALUES (3, N'Временный склад Казань', N'Казань, ул. Баумана, 70', N'Временный', CAST(55.79610000 AS Decimal(10, 8)), CAST(49.10640000 AS Decimal(11, 8)))
SET IDENTITY_INSERT [dbo].[Склады] OFF
GO
INSERT [dbo].[СодержимоеПриходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (1, 1, 50, CAST(99990.00 AS Decimal(10, 2)))
INSERT [dbo].[СодержимоеПриходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (1, 2, 30, CAST(65000.00 AS Decimal(10, 2)))
INSERT [dbo].[СодержимоеПриходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (2, 2, 20, CAST(65000.00 AS Decimal(10, 2)))
INSERT [dbo].[СодержимоеПриходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (3, 3, 1000, CAST(90.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[СодержимоеРасходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (1, 1, 25, CAST(99990.00 AS Decimal(10, 2)))
INSERT [dbo].[СодержимоеРасходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (1, 2, 15, CAST(65000.00 AS Decimal(10, 2)))
INSERT [dbo].[СодержимоеРасходнойНакладной] ([накладная_id], [товар_id], [количество], [цена]) VALUES (2, 4, 50, CAST(1500.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Товары] ON 

INSERT [dbo].[Товары] ([товар_id], [название], [артикул], [штрихкод], [категория_id], [единица_измерения], [цена], [учет_серийных_номеров], [учет_сроков_годности], [минимальный_остаток]) VALUES (1, N'Смартфон Samsung Galaxy S23', N'SM-G911B', N'8806094750499', 1, N'шт', CAST(99990.00 AS Decimal(10, 2)), 1, 0, 5)
INSERT [dbo].[Товары] ([товар_id], [название], [артикул], [штрихкод], [категория_id], [единица_измерения], [цена], [учет_серийных_номеров], [учет_сроков_годности], [минимальный_остаток]) VALUES (2, N'Холодильник Bosch KGN39NW1AR', N'KGN39NW1AR', N'4242005220230', 2, N'шт', CAST(65000.00 AS Decimal(10, 2)), 0, 0, 3)
INSERT [dbo].[Товары] ([товар_id], [название], [артикул], [штрихкод], [категория_id], [единица_измерения], [цена], [учет_серийных_номеров], [учет_сроков_годности], [минимальный_остаток]) VALUES (3, N'Макароны Barilla Spaghetti №5', N'0000030324', N'8076809572326', 3, N'кг', CAST(90.00 AS Decimal(10, 2)), 0, 1, 10)
INSERT [dbo].[Товары] ([товар_id], [название], [артикул], [штрихкод], [категория_id], [единица_измерения], [цена], [учет_серийных_номеров], [учет_сроков_годности], [минимальный_остаток]) VALUES (4, N'Футболка мужская Adidas', N'DH5798', N'4060516357028', 4, N'шт', CAST(1500.00 AS Decimal(10, 2)), 0, 0, 20)
SET IDENTITY_INSERT [dbo].[Товары] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Категори__5ED3ECC635738DD0]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Категории] ADD UNIQUE NONCLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Пользова__8CB51F5F48178EFE]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Пользователи] ADD UNIQUE NONCLUSTERED 
(
	[имя_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Пользова__AB6E6164648C7966]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Пользователи] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Приходны__7A4311E12B67B0FE]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[ПриходныеНакладные] ADD UNIQUE NONCLUSTERED 
(
	[номер_накладной] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Расходны__7A4311E1FF9ABCDB]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[РасходныеНакладные] ADD UNIQUE NONCLUSTERED 
(
	[номер_накладной] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Роли__5ED3ECC6B590F740]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Роли] ADD UNIQUE NONCLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Товары__343F836B8BCC461D]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Товары] ADD UNIQUE NONCLUSTERED 
(
	[артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Товары__64456D04B2E7593D]    Script Date: 25.02.2025 17:45:17 ******/
ALTER TABLE [dbo].[Товары] ADD UNIQUE NONCLUSTERED 
(
	[штрихкод] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Пользователи] ADD  DEFAULT ((0)) FOR [двухфакторная_аутентификация]
GO
ALTER TABLE [dbo].[Товары] ADD  DEFAULT ((0)) FOR [учет_серийных_номеров]
GO
ALTER TABLE [dbo].[Товары] ADD  DEFAULT ((0)) FOR [учет_сроков_годности]
GO
ALTER TABLE [dbo].[Инвентаризации]  WITH CHECK ADD FOREIGN KEY([пользователь_id])
REFERENCES [dbo].[Пользователи] ([пользователь_id])
GO
ALTER TABLE [dbo].[Инвентаризации]  WITH CHECK ADD FOREIGN KEY([склад_id])
REFERENCES [dbo].[Склады] ([склад_id])
GO
ALTER TABLE [dbo].[ОстаткиТоваров]  WITH CHECK ADD FOREIGN KEY([склад_id])
REFERENCES [dbo].[Склады] ([склад_id])
GO
ALTER TABLE [dbo].[ОстаткиТоваров]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([товар_id])
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD FOREIGN KEY([роль_id])
REFERENCES [dbo].[Роли] ([роль_id])
GO
ALTER TABLE [dbo].[ПриходныеНакладные]  WITH CHECK ADD FOREIGN KEY([поставщик_id])
REFERENCES [dbo].[Поставщики] ([поставщик_id])
GO
ALTER TABLE [dbo].[РасходныеНакладные]  WITH CHECK ADD FOREIGN KEY([клиент_id])
REFERENCES [dbo].[Клиенты] ([клиент_id])
GO
ALTER TABLE [dbo].[РезультатыИнвентаризации]  WITH CHECK ADD FOREIGN KEY([инвентаризация_id])
REFERENCES [dbo].[Инвентаризации] ([инвентаризация_id])
GO
ALTER TABLE [dbo].[РезультатыИнвентаризации]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([товар_id])
GO
ALTER TABLE [dbo].[СодержимоеПриходнойНакладной]  WITH CHECK ADD FOREIGN KEY([накладная_id])
REFERENCES [dbo].[ПриходныеНакладные] ([накладная_id])
GO
ALTER TABLE [dbo].[СодержимоеПриходнойНакладной]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([товар_id])
GO
ALTER TABLE [dbo].[СодержимоеРасходнойНакладной]  WITH CHECK ADD FOREIGN KEY([накладная_id])
REFERENCES [dbo].[РасходныеНакладные] ([накладная_id])
GO
ALTER TABLE [dbo].[СодержимоеРасходнойНакладной]  WITH CHECK ADD FOREIGN KEY([товар_id])
REFERENCES [dbo].[Товары] ([товар_id])
GO
ALTER TABLE [dbo].[Товары]  WITH CHECK ADD FOREIGN KEY([категория_id])
REFERENCES [dbo].[Категории] ([категория_id])
GO
USE [master]
GO
ALTER DATABASE [СкладскойУчет] SET  READ_WRITE 
GO
