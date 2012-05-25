USE [master]
GO
/****** Object:  Database [ScrumTime]    Script Date: 05/18/2011 00:14:52 ******/
CREATE DATABASE [ScrumTime] ON  PRIMARY 
( NAME = N'ScrumTime', FILENAME = N'C:\forks\ScrumTime\db\ScrumTime.mdf' , SIZE = 1984KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ScrumTime_log', FILENAME = N'C:\forks\ScrumTime\db\ScrumTime_log.ldf' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ScrumTime] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScrumTime].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScrumTime] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ScrumTime] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ScrumTime] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ScrumTime] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ScrumTime] SET ARITHABORT OFF
GO
ALTER DATABASE [ScrumTime] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ScrumTime] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ScrumTime] SET AUTO_SHRINK ON
GO
ALTER DATABASE [ScrumTime] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ScrumTime] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ScrumTime] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ScrumTime] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ScrumTime] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ScrumTime] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ScrumTime] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ScrumTime] SET  DISABLE_BROKER
GO
ALTER DATABASE [ScrumTime] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ScrumTime] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ScrumTime] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ScrumTime] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ScrumTime] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ScrumTime] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ScrumTime] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ScrumTime] SET  READ_WRITE
GO
ALTER DATABASE [ScrumTime] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ScrumTime] SET  MULTI_USER
GO
ALTER DATABASE [ScrumTime] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ScrumTime] SET DB_CHAINING OFF
GO
USE [ScrumTime]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductId], [Name], [Description]) VALUES (1, N'Sample - Inventory Track', N'A sample product for demonstration purposes.')
INSERT [dbo].[Products] ([ProductId], [Name], [Description]) VALUES (7, N'Android GeoCache', N'A sample product for demonstration purposes.')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[UserSettings]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSettings](
	[UserSettingId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](128) NOT NULL,
	[CurrentProduct] [int] NULL,
	[CurrentSprint] [int] NULL,
	[LastMainTabSelected] [int] NULL,
 CONSTRAINT [PK_UserSettings] PRIMARY KEY CLUSTERED 
(
	[UserSettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserSettings] ON
INSERT [dbo].[UserSettings] ([UserSettingId], [Username], [CurrentProduct], [CurrentSprint], [LastMainTabSelected]) VALUES (2, N'bob', 1, 6, 1)
INSERT [dbo].[UserSettings] ([UserSettingId], [Username], [CurrentProduct], [CurrentSprint], [LastMainTabSelected]) VALUES (4, N'demo', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[UserSettings] OFF
/****** Object:  Table [dbo].[Releases]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Releases](
	[ReleaseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Target] [date] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Releases] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Releases] ON
INSERT [dbo].[Releases] ([ReleaseId], [Name], [Description], [Target], [ProductId]) VALUES (1, N'0.1', N'UI Mock Release', CAST(0x44330B00 AS Date), 1)
INSERT [dbo].[Releases] ([ReleaseId], [Name], [Description], [Target], [ProductId]) VALUES (2, N'0.5', N'Internal testing release.  Offered to customer as Alpha release 0.5', CAST(0xB0330B00 AS Date), 1)
INSERT [dbo].[Releases] ([ReleaseId], [Name], [Description], [Target], [ProductId]) VALUES (3, N'1.0 Beta', N'Full Beta Release', CAST(0xFA330B00 AS Date), 1)
INSERT [dbo].[Releases] ([ReleaseId], [Name], [Description], [Target], [ProductId]) VALUES (4, N'1.0', N'1.0 GA Release', CAST(0x40340B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Releases] OFF
/****** Object:  Table [dbo].[Sprints]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprints](
	[SprintId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[StartDate] [date] NOT NULL,
	[FinishDate] [date] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Sprints] PRIMARY KEY CLUSTERED 
(
	[SprintId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Sprints] ON
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (4, N'Planning', N'Focus on developing a basic product plan.', CAST(0x01330B00 AS Date), CAST(0x1E330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (5, N'UI Mock', N'Mock up a few of the primary UI elements.', CAST(0x28330B00 AS Date), CAST(0x41330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (6, N'Colors', N'Focus on customer look and feel plus connect the db for a few screens.', CAST(0x4B330B00 AS Date), CAST(0x6B330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (7, N'Finch', N'Focus on bug fixing and more ui layout.', CAST(0x6E330B00 AS Date), CAST(0x8E330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (8, N'Osprey', N'Focus on user security.', CAST(0x93330B00 AS Date), CAST(0xAF330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (9, N'Hawk', N'Focus on web service and report writing.', CAST(0xBD330B00 AS Date), CAST(0xD7330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (10, N'Robin', N'Focus on feature complete for 1.0 Beta 1', CAST(0xDE330B00 AS Date), CAST(0xF7330B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (12, N'Gold', N'Documentation and web based tutorial completion.', CAST(0x1F340B00 AS Date), CAST(0x3C340B00 AS Date), 1)
INSERT [dbo].[Sprints] ([SprintId], [Name], [Description], [StartDate], [FinishDate], [ProductId]) VALUES (13, N'Eagle', N'Testing and bug fixing of the 1.0 GA release', CAST(0xFC330B00 AS Date), CAST(0x1A340B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Sprints] OFF
/****** Object:  Table [dbo].[Scrums]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scrums](
	[ScrumId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SprintId] [int] NOT NULL,
	[DateOfScrum] [date] NOT NULL,
 CONSTRAINT [PK_Scrums] PRIMARY KEY CLUSTERED 
(
	[ScrumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Scrums] ON
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (242, 1, 4, CAST(0x01330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (243, 1, 4, CAST(0x05330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (244, 1, 4, CAST(0x07330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (245, 1, 4, CAST(0x09330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (246, 1, 4, CAST(0x15330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (248, 1, 4, CAST(0x1A330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (249, 1, 5, CAST(0x28330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (250, 1, 5, CAST(0x2F330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (252, 1, 5, CAST(0x32330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (253, 1, 5, CAST(0x36330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (254, 1, 5, CAST(0x38330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (257, 1, 5, CAST(0x39330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (258, 1, 5, CAST(0x3A330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (259, 1, 5, CAST(0x3E330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (261, 1, 5, CAST(0x3F330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (262, 1, 5, CAST(0x41330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (263, 1, 6, CAST(0x4B330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (264, 1, 6, CAST(0x4E330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (265, 1, 6, CAST(0x52330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (267, 1, 6, CAST(0x55330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (268, 1, 6, CAST(0x59330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (269, 1, 6, CAST(0x5C330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (270, 1, 6, CAST(0x60330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (271, 1, 6, CAST(0x61330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (273, 1, 6, CAST(0x64330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (274, 1, 6, CAST(0x68330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (275, 1, 6, CAST(0x6B330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (281, 1, 7, CAST(0x6E330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (283, 1, 7, CAST(0x6F330B00 AS Date))
INSERT [dbo].[Scrums] ([ScrumId], [ProductId], [SprintId], [DateOfScrum]) VALUES (284, 1, 7, CAST(0x71330B00 AS Date))
SET IDENTITY_INSERT [dbo].[Scrums] OFF
/****** Object:  Table [dbo].[Stories]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stories](
	[StoryId] [int] IDENTITY(1,1) NOT NULL,
	[Narrative] [nvarchar](1024) NOT NULL,
	[Points] [int] NOT NULL,
	[UserDefinedId] [nvarchar](250) NULL,
	[Priority] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SprintId] [int] NULL,
 CONSTRAINT [PK_Stories] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Stories] ON
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (1, N'As a customer, I want to view my bill online. (complete)', 8, N'online bill (complete)
', 5, 1, 7)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (2, N'As a sales agent, I want to keep track of my customers online.', 13, N'customer list', 7, 1, 10)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (4, N'As a customer, I want to see my most recent purchases.', 8, N'most recent purchases', 8, 1, 10)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (29, N'As a product supplier, I want to be alerted when the inventory for my products drops below a specific threshold.', 8, N'inventory threshold alert', 9, 1, NULL)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (33, N'As a product supplier, I want to be notified when special shipments arrive at the customer site.', 40, N'supplier shipment alert', 10, 1, 8)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (34, N'As the product owner, I want to identify the rough product plan from start to release 1.0.', 20, N'planning', 1, 1, 4)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (35, N'As the product owner, I want to view important aspects of the product UI prior to committing to their completion.', 20, N'ui mock', 2, 1, 5)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (36, N'As a customer, I want to access my bill online. (UI)', 8, N'online bill (ui)', 4, 1, 6)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (37, N'As the product owner, I want to see a framework of the web site before committing to the final colors.', 13, N'site framework', 3, 1, 6)
INSERT [dbo].[Stories] ([StoryId], [Narrative], [Points], [UserDefinedId], [Priority], [ProductId], [SprintId]) VALUES (38, N'As a user, I want to have my information kept separate from other user''s information.', 13, N'user storage', 6, 1, 7)
SET IDENTITY_INSERT [dbo].[Stories] OFF
/****** Object:  Table [dbo].[Tasks]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Hours] [decimal](18, 1) NULL,
	[StoryId] [int] NOT NULL,
	[AssignedTo] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (2, N'Create the bill information table', CAST(10.0 AS Decimal(18, 1)), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (16, N'Create a bill information model object', CAST(10.0 AS Decimal(18, 1)), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (17, N'Create a bill list view', CAST(10.0 AS Decimal(18, 1)), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (18, N'Create a customer table', CAST(4.0 AS Decimal(18, 1)), 2, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (20, N'Create a customer model object', CAST(11.0 AS Decimal(18, 1)), 2, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (22, N'Create a customer list view', CAST(20.0 AS Decimal(18, 1)), 2, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (23, N'Create a purchase table', CAST(4.0 AS Decimal(18, 1)), 4, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (25, N'Create a purchase list view per customer', CAST(16.0 AS Decimal(18, 1)), 4, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (27, N'Create a purchase model', CAST(12.0 AS Decimal(18, 1)), 4, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (39, N'Create a large test dataset', CAST(8.0 AS Decimal(18, 1)), 29, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (40, N'Create a customer view model', CAST(6.0 AS Decimal(18, 1)), 2, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (42, N'Create a product architecture plan.', CAST(16.0 AS Decimal(18, 1)), 34, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (43, N'Evaluate the team member availability for the creation of this product.', CAST(8.0 AS Decimal(18, 1)), 34, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (44, N'Discuss and document the commitments and release schedule with customer.', CAST(16.0 AS Decimal(18, 1)), 34, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (45, N'Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', CAST(16.0 AS Decimal(18, 1)), 34, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (46, N'Allocate resources for the web based tutorial.', CAST(2.0 AS Decimal(18, 1)), 34, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (47, N'Create a spreadsheet containing the online bill mock up.', CAST(4.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (48, N'Create a spreadsheet containing the most recent purchases mock up.', CAST(8.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (49, N'Create a spreadsheet containing the inventory threshold alert mock up.', CAST(8.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (50, N'Create a spreadsheet containing the supplier shipment alert mock up.', CAST(8.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (51, N'Create a spreadsheet containing the sales report mock up.', CAST(8.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (52, N'Create the html layout for the purchase list for the specific customer that is selected.', CAST(8.0 AS Decimal(18, 1)), 36, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (53, N'Create the controller action for displaying this list of purchases.', CAST(8.0 AS Decimal(18, 1)), 36, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (54, N'Create a spreadsheet of the overall website framework.', CAST(16.0 AS Decimal(18, 1)), 35, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (55, N'Create the initial project.', CAST(2.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (56, N'Create the view for the main page.', CAST(8.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (57, N'Create the view model for the dashboard.', CAST(2.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (58, N'Add the logo to the header.', CAST(2.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (59, N'Create style sheet font standards.', CAST(8.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (60, N'Add various images for buttons.', CAST(16.0 AS Decimal(18, 1)), 37, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (61, N'Create user table structure.', CAST(16.0 AS Decimal(18, 1)), 38, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (62, N'Create user model.', CAST(16.0 AS Decimal(18, 1)), 38, NULL)
INSERT [dbo].[Tasks] ([TaskId], [Description], [Hours], [StoryId], [AssignedTo]) VALUES (63, N'Create user roles table structure.', CAST(12.0 AS Decimal(18, 1)), 38, NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
/****** Object:  Table [dbo].[ScrumDetails]    Script Date: 05/18/2011 00:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScrumDetails](
	[ScrumDetailId] [int] IDENTITY(1,1) NOT NULL,
	[StoryTaskDescription] [nvarchar](1024) NOT NULL,
	[AssignedTo] [nvarchar](256) NOT NULL,
	[HoursCompleted] [numeric](18, 1) NOT NULL,
	[HoursRemaining] [numeric](18, 1) NOT NULL,
	[ScrumId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
 CONSTRAINT [PK_ScrumDetails] PRIMARY KEY CLUSTERED 
(
	[ScrumDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ScrumDetails] ON
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1491, N'planning -> Create a product architecture plan.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 242, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1492, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 242, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1493, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 242, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1494, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 242, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1495, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 242, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1496, N'planning -> Create a product architecture plan.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(14.0 AS Numeric(18, 1)), 243, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1497, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(4.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 243, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1498, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 243, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1499, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 243, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1500, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 243, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1501, N'planning -> Create a product architecture plan.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 244, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1502, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(4.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 244, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1503, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 244, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1504, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 244, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1505, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 244, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1506, N'planning -> Create a product architecture plan.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 245, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1507, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 245, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1508, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 245, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1509, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 245, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1510, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 245, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1511, N'planning -> Create a product architecture plan.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 246, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1512, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 246, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1513, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(20.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 246, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1514, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(16.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 246, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1515, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 246, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1521, N'planning -> Create a product architecture plan.', N'bob', CAST(18.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 248, 42)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1522, N'planning -> Evaluate the team member availability for the creation of this product.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 248, 43)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1523, N'planning -> Discuss and document the commitments and release schedule with customer.', N'bob', CAST(20.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 248, 44)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1524, N'planning -> Allow the scrum team to evaluate the overall customer requirements and have them create stories in ScrumTime.', N'bob', CAST(22.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 248, 45)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1525, N'planning -> Allocate resources for the web based tutorial.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 248, 46)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1526, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 249, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1527, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 249, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1528, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 249, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1529, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 249, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1530, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 249, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1531, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 249, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1532, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 250, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1533, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 250, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1534, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 250, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1535, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 250, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1536, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 250, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1537, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 250, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1544, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 252, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1545, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 252, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1546, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 252, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1547, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 252, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1548, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 252, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1549, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 252, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1550, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 253, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1551, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 253, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1552, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 253, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1553, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 253, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1554, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 253, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1555, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 253, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1556, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 254, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1557, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 254, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1558, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 254, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1559, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 254, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1560, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 254, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1561, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 254, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1574, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 257, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1575, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 257, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1576, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 257, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1577, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 257, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1578, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 257, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1579, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(14.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 257, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1580, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 258, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1581, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 258, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1582, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 258, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1583, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(12.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 258, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1584, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 258, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1585, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(18.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 258, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1586, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(4.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 259, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1587, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 259, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1588, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 259, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1589, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(12.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 259, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1590, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 259, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1591, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(18.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 259, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1598, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(4.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 261, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1599, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 261, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1600, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 261, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1601, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(16.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 261, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1602, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 261, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1603, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(18.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 261, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1604, N'ui mock -> Create a spreadsheet containing the online bill mock up.', N'bob', CAST(4.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 47)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1605, N'ui mock -> Create a spreadsheet containing the most recent purchases mock up.', N'bob', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 48)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1606, N'ui mock -> Create a spreadsheet containing the inventory threshold alert mock up.', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 49)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1607, N'ui mock -> Create a spreadsheet containing the supplier shipment alert mock up.', N'bob', CAST(16.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 50)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1608, N'ui mock -> Create a spreadsheet containing the sales report mock up.', N'bob', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 51)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1609, N'ui mock -> Create a spreadsheet of the overall website framework.', N'bob', CAST(18.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 262, 54)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1610, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 263, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1611, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 263, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1612, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 263, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1613, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 263, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1614, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 263, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1615, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 263, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1616, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 263, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1617, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 263, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1618, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 264, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1619, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(12.0 AS Numeric(18, 1)), 264, 53)
GO
print 'Processed 100 total records'
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1620, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 264, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1621, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 264, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1622, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 264, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1623, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 264, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1624, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 264, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1625, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 264, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1626, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 265, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1627, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(4.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 265, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1628, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 265, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1629, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 265, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1630, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 265, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1631, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 265, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1632, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 265, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1633, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 265, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1642, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 267, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1643, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 267, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1644, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 267, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1645, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 267, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1646, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 267, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1647, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 267, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1648, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 267, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1649, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 267, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1650, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(4.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 268, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1651, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 268, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1652, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 268, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1653, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 268, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1654, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 268, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1655, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 268, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1656, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 268, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1657, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 268, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1658, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 269, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1659, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 269, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1660, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 269, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1661, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 269, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1662, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 269, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1663, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(2.0 AS Numeric(18, 1)), 269, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1664, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 269, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1665, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 269, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1666, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1667, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1668, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1669, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1670, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1671, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 270, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1672, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 270, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1673, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 270, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1674, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1675, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1676, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1677, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1678, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1679, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 271, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1680, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 271, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1681, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(4.0 AS Numeric(18, 1)), CAST(12.0 AS Numeric(18, 1)), 271, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1690, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1691, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1692, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1693, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1694, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1695, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 273, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1696, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(0.0 AS Numeric(18, 1)), CAST(8.0 AS Numeric(18, 1)), 273, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1697, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 273, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1698, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1699, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1700, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1701, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1702, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1703, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 274, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1704, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 274, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1705, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(4.0 AS Numeric(18, 1)), 274, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1706, N'online bill (ui) -> Create the html layout for the purchase list for the specific customer that is selected.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 52)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1707, N'online bill (ui) -> Create the controller action for displaying this list of purchases.', N'-Unassigned-', CAST(12.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 53)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1708, N'site framework -> Create the initial project.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 55)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1709, N'site framework -> Create the view for the main page.', N'-Unassigned-', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 56)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1710, N'site framework -> Create the view model for the dashboard.', N'-Unassigned-', CAST(2.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 57)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1711, N'site framework -> Add the logo to the header.', N'-Unassigned-', CAST(6.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 58)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1712, N'site framework -> Create style sheet font standards.', N'-Unassigned-', CAST(8.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 59)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1713, N'site framework -> Add various images for buttons.', N'-Unassigned-', CAST(14.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 275, 60)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1744, N'online bill (complete) -> Create the bill information table', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 281, 2)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1745, N'online bill (complete) -> Create a bill information model object', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 281, 16)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1746, N'online bill (complete) -> Create a bill list view', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 281, 17)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1747, N'user storage -> Create user table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 281, 61)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1748, N'user storage -> Create user model.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 281, 62)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1749, N'user storage -> Create user roles table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(12.0 AS Numeric(18, 1)), 281, 63)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1756, N'online bill (complete) -> Create the bill information table', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 283, 2)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1757, N'online bill (complete) -> Create a bill information model object', N'bob', CAST(2.0 AS Numeric(18, 1)), CAST(6.0 AS Numeric(18, 1)), 283, 16)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1758, N'online bill (complete) -> Create a bill list view', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 283, 17)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1759, N'user storage -> Create user table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 283, 61)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1760, N'user storage -> Create user model.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 283, 62)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1761, N'user storage -> Create user roles table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(12.0 AS Numeric(18, 1)), 283, 63)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1762, N'online bill (complete) -> Create the bill information table', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 284, 2)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1763, N'online bill (complete) -> Create a bill information model object', N'bob', CAST(10.0 AS Numeric(18, 1)), CAST(0.0 AS Numeric(18, 1)), 284, 16)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1764, N'online bill (complete) -> Create a bill list view', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(10.0 AS Numeric(18, 1)), 284, 17)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1765, N'user storage -> Create user table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 284, 61)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1766, N'user storage -> Create user model.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(16.0 AS Numeric(18, 1)), 284, 62)
INSERT [dbo].[ScrumDetails] ([ScrumDetailId], [StoryTaskDescription], [AssignedTo], [HoursCompleted], [HoursRemaining], [ScrumId], [TaskId]) VALUES (1767, N'user storage -> Create user roles table structure.', N'bob', CAST(0.0 AS Numeric(18, 1)), CAST(12.0 AS Numeric(18, 1)), 284, 63)
SET IDENTITY_INSERT [dbo].[ScrumDetails] OFF
/****** Object:  Default [DF_ScrumDetails_HoursCompleted]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[ScrumDetails] ADD  CONSTRAINT [DF_ScrumDetails_HoursCompleted]  DEFAULT ((0)) FOR [HoursCompleted]
GO
/****** Object:  ForeignKey [FK_Releases_Products]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Releases]  WITH CHECK ADD  CONSTRAINT [FK_Releases_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Releases] CHECK CONSTRAINT [FK_Releases_Products]
GO
/****** Object:  ForeignKey [FK_Sprints_Products]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Sprints]  WITH CHECK ADD  CONSTRAINT [FK_Sprints_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Sprints] CHECK CONSTRAINT [FK_Sprints_Products]
GO
/****** Object:  ForeignKey [FK_Scrums_Products]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Scrums]  WITH CHECK ADD  CONSTRAINT [FK_Scrums_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Scrums] CHECK CONSTRAINT [FK_Scrums_Products]
GO
/****** Object:  ForeignKey [FK_Scrums_Sprints]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Scrums]  WITH CHECK ADD  CONSTRAINT [FK_Scrums_Sprints] FOREIGN KEY([SprintId])
REFERENCES [dbo].[Sprints] ([SprintId])
GO
ALTER TABLE [dbo].[Scrums] CHECK CONSTRAINT [FK_Scrums_Sprints]
GO
/****** Object:  ForeignKey [FK_Stories_Products]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD  CONSTRAINT [FK_Stories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Stories] CHECK CONSTRAINT [FK_Stories_Products]
GO
/****** Object:  ForeignKey [FK_Stories_Sprints]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD  CONSTRAINT [FK_Stories_Sprints] FOREIGN KEY([SprintId])
REFERENCES [dbo].[Sprints] ([SprintId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stories] CHECK CONSTRAINT [FK_Stories_Sprints]
GO
/****** Object:  ForeignKey [FK_Tasks_Stories]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Stories] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Stories] ([StoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Stories]
GO
/****** Object:  ForeignKey [FK_ScrumDetails_Scrums]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[ScrumDetails]  WITH CHECK ADD  CONSTRAINT [FK_ScrumDetails_Scrums] FOREIGN KEY([ScrumId])
REFERENCES [dbo].[Scrums] ([ScrumId])
GO
ALTER TABLE [dbo].[ScrumDetails] CHECK CONSTRAINT [FK_ScrumDetails_Scrums]
GO
/****** Object:  ForeignKey [FK_ScrumDetails_Tasks]    Script Date: 05/18/2011 00:14:52 ******/
ALTER TABLE [dbo].[ScrumDetails]  WITH CHECK ADD  CONSTRAINT [FK_ScrumDetails_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([TaskId])
GO
ALTER TABLE [dbo].[ScrumDetails] CHECK CONSTRAINT [FK_ScrumDetails_Tasks]
GO
