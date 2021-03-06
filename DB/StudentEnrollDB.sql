USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 10/02/2015 15:06:56 ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityDB]
GO
/****** Object:  Table [dbo].[t_course]    Script Date: 10/02/2015 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_code] [varchar](50) NOT NULL,
	[course_title] [varchar](50) NOT NULL,
	[credit] [int] NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_T_Course_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_department]    Script Date: 10/02/2015 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept_code] [varchar](50) NOT NULL,
	[dept_title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_enrollment]    Script Date: 10/02/2015 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_enrollment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[enrollment_date] [datetime] NOT NULL,
 CONSTRAINT [PK_t_enrollment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_student]    Script Date: 10/02/2015 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[std_name] [varchar](50) NOT NULL,
	[contact] [varchar](50) NOT NULL,
	[reg_no] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_T_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[student_department_view]    Script Date: 10/02/2015 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[student_department_view]
AS
SELECT        dbo.t_student.std_name, dbo.t_student.email, dbo.t_department.dept_title
FROM            dbo.t_student INNER JOIN
                         dbo.t_department ON dbo.t_student.dept_id = dbo.t_department.id

GO
SET IDENTITY_INSERT [dbo].[t_course] ON 

INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (1, N'1', N'1', 1, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (2, N'11', N'1', 1, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (3, N'CF', N'Computer Fundamental', 1, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (4, N'DB', N'Database', 1, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (5, N'Java', N'java-1', 1, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (6, N'C#', N'C#-1', 2, 1)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (7, N'Chemistry-205', N'Bio-Chemistry', 2, 4)
INSERT [dbo].[t_course] ([id], [course_code], [course_title], [credit], [dept_id]) VALUES (8, N'math-101', N'Math-E', 1, 2)
SET IDENTITY_INSERT [dbo].[t_course] OFF
SET IDENTITY_INSERT [dbo].[t_department] ON 

INSERT [dbo].[t_department] ([id], [dept_code], [dept_title]) VALUES (1, N'101', N'CSE')
INSERT [dbo].[t_department] ([id], [dept_code], [dept_title]) VALUES (2, N'102', N'EEE')
INSERT [dbo].[t_department] ([id], [dept_code], [dept_title]) VALUES (3, N'cs', N'CS')
INSERT [dbo].[t_department] ([id], [dept_code], [dept_title]) VALUES (4, N'Chemistry-1', N'CHEMISTRY')
SET IDENTITY_INSERT [dbo].[t_department] OFF
SET IDENTITY_INSERT [dbo].[t_enrollment] ON 

INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (8, 1, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (9, 3, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (10, 4, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (12, 3, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (13, 3, 16, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (15, 3, 1, CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (16, 4, 9, CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (17, 1, 1, CAST(0x0000A41E00000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (18, 1, 1, CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (20, 1, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (21, 1, 8, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (22, 3, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (23, 4, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (24, 1, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (25, 2, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (26, 2, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (27, 2, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (28, 2, 2, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (29, 1, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (30, 3, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (31, 4, 1, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (32, 5, 20, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (33, 6, 20, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (34, 3, 20, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (35, 4, 20, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (36, 1, 18, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (37, 3, 18, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (38, 6, 18, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (39, 3, 16, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (40, 4, 16, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (41, 6, 8, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (42, 6, 8, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (49, 1, 9, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (50, 1, 9, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (51, 1, 19, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (52, 1, 19, CAST(0x0000A41E00000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (53, 3, 19, CAST(0x0000A42100000000 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (54, 1, 21, CAST(0x0000A421017E9950 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (55, 1, 21, CAST(0x0000A4AA017F25F0 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (56, 4, 21, CAST(0x0000A421017FF8E0 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (57, 3, 22, CAST(0x0000A4210183D140 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (58, 5, 22, CAST(0x0000A4210183D140 AS DateTime))
INSERT [dbo].[t_enrollment] ([id], [course_id], [student_id], [enrollment_date]) VALUES (59, 1, 22, CAST(0x0000A42200057E40 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_enrollment] OFF
SET IDENTITY_INSERT [dbo].[t_student] ON 

INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (1, N'Amena', N'09876543', N'cse-1', N'a@gmail.com', N'Dhaka', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (2, N'Samiul', N'8907567', N'eee-1', N's@yahoo.com', N'Lalbagh', 2)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (8, N'w', N'w', N'cse-2', N'w', N'w', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (9, N'w', N'w', N'cse-3', N'wr', N'w', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (16, N'Limon', N'09876556', N'eee-2', N'l@gmail.com', N'Dhaka', 2)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (17, N'1', N'1', N'1', N'1', N'1', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (18, N'2', N'2', N'2', N'2', N'2', 2)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (19, N'2', N'2', N'3', N'23', N'2', 2)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (20, N'Bristy', N'01676552138', N'20CSE090500', N'bristy@yahoo.com', N'Dhaka', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (21, N'era', N'345678', N'123', N'e', N'dhaka', 1)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (22, N'Sima', N'0987654', N'111', N's@gmail.com', N'Dhaka', 2)
INSERT [dbo].[t_student] ([id], [std_name], [contact], [reg_no], [email], [address], [dept_id]) VALUES (23, N'Bristy', N'01676552138', N'Bristy-CSE-101', N'bristy@gmail.com', N'Lalbagh,Dhaka-1211', 1)
SET IDENTITY_INSERT [dbo].[t_student] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_T_Course]    Script Date: 10/02/2015 15:06:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_T_Course] ON [dbo].[t_course]
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Student]    Script Date: 10/02/2015 15:06:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Student] ON [dbo].[t_student]
(
	[reg_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Student_1]    Script Date: 10/02/2015 15:06:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Student_1] ON [dbo].[t_student]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_course]  WITH CHECK ADD  CONSTRAINT [FK_t_course_t_department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[t_department] ([id])
GO
ALTER TABLE [dbo].[t_course] CHECK CONSTRAINT [FK_t_course_t_department]
GO
ALTER TABLE [dbo].[t_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_t_enrollment_t_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[t_course] ([id])
GO
ALTER TABLE [dbo].[t_enrollment] CHECK CONSTRAINT [FK_t_enrollment_t_course]
GO
ALTER TABLE [dbo].[t_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_t_enrollment_t_student1] FOREIGN KEY([student_id])
REFERENCES [dbo].[t_student] ([id])
GO
ALTER TABLE [dbo].[t_enrollment] CHECK CONSTRAINT [FK_t_enrollment_t_student1]
GO
ALTER TABLE [dbo].[t_student]  WITH CHECK ADD  CONSTRAINT [FK_t_student_t_department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[t_department] ([id])
GO
ALTER TABLE [dbo].[t_student] CHECK CONSTRAINT [FK_t_student_t_department]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t_student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "t_department"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'student_department_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'student_department_view'
GO
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
