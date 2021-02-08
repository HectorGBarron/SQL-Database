USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 12/16/2020 8:31:48 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\FinalProject.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 991232KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = OFF
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[ActivityTracker]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTracker](
	[ActID] [int] IDENTITY(1,1) NOT NULL,
	[EmpRoleID] [int] NOT NULL,
	[MfgRoleActID] [int] NOT NULL,
	[Initial] [datetime] NOT NULL,
	[Finish] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BiasCorrectionControlChart]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiasCorrectionControlChart](
	[n] [int] NOT NULL,
	[d2] [float] NULL,
	[c4] [float] NULL,
	[d3] [float] NULL,
	[d4] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[GenderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLogHR]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLogHR](
	[EmpLog] [int] IDENTITY(1,1) NOT NULL,
	[EmployeID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[RecordDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[EmpRoleID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[MfgStgRoleID] [int] NOT NULL,
	[RecordDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeStatusHR]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatusHR](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufacturingStage]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturingStage](
	[MfgStgID] [int] IDENTITY(1,1) NOT NULL,
	[MfgStg] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MfgStgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MfgStgActivity]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MfgStgActivity](
	[MfgRoleActID] [int] IDENTITY(1,1) NOT NULL,
	[MfgStgID] [int] NOT NULL,
	[MfgRoleActivity] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MfgRoleActID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MfgStgRole]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MfgStgRole](
	[MfgStgRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MfgStgID] [int] NOT NULL,
	[MfgStgRole] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MfgStgRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutControlLimitsLog]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutControlLimitsLog](
	[MfgRoleActivity] [varchar](255) NOT NULL,
	[EventDate] [varchar](38) NOT NULL,
	[Cycle] [int] NULL,
	[ActID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestStratificationReport]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestStratificationReport](
	[ActID] [int] NULL,
	[Cycle] [int] NULL,
	[above] [int] NULL,
	[below] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTrendResults]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTrendResults](
	[ActID] [int] NULL,
	[Cycle] [int] NULL,
	[above] [int] NULL,
	[below] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityTracker]  WITH CHECK ADD FOREIGN KEY([EmpRoleID])
REFERENCES [dbo].[EmployeeRole] ([EmpRoleID])
GO
ALTER TABLE [dbo].[ActivityTracker]  WITH CHECK ADD FOREIGN KEY([MfgRoleActID])
REFERENCES [dbo].[MfgStgActivity] ([MfgRoleActID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[EmployeeLogHR]  WITH CHECK ADD FOREIGN KEY([EmployeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeLogHR]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[EmployeeStatusHR] ([StatusID])
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD FOREIGN KEY([MfgStgRoleID])
REFERENCES [dbo].[MfgStgRole] ([MfgStgRoleId])
GO
ALTER TABLE [dbo].[MfgStgActivity]  WITH CHECK ADD FOREIGN KEY([MfgStgID])
REFERENCES [dbo].[ManufacturingStage] ([MfgStgID])
GO
ALTER TABLE [dbo].[MfgStgRole]  WITH CHECK ADD FOREIGN KEY([MfgStgID])
REFERENCES [dbo].[ManufacturingStage] ([MfgStgID])
GO
/****** Object:  StoredProcedure [dbo].[GetBoxPlot]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetBoxPlot]
AS
	SET NOCOUNT ON
	DECLARE @LowerQuartile float(24);
	DECLARE @Median float(24);
	DECLARE @UpperQuartile float(24);
	DECLARE @BottomOutlier float(24);
	DECLARE @TopOutlier float(24);
	DECLARE @MaxVal float (24);
	DECLARE @MinVal float(24);
	declare @space1 int;
	declare @space2 int;
	declare @space3 int;
	declare @space4 int;
--	Calculate the activity Cycle
SELECT   DATEDIFF(minute, Initial,Finish) as Cycle 
into #CycleTime 
from ActivityTracker 
-- Calculate the Median
	SELECT @MEDIAN=CAST(
						(SELECT MAX(Cycle) 
						FROM 
							(select top 50 percent Cycle 
							 FROM #CycleTime 
							 ORDER BY Cycle) AS BottomHalf)
						+
						(SELECT MIN(Cycle)
						FROM
							(SELECT TOP 50 percent Cycle 
							FROM #CycleTime 
							ORDER BY Cycle DESC) AS TopHalf)
					 as float)  /2    
-- Calculate Lower Quartile
			SELECT TOP 50 percent Cycle INTO #LowerQuatile 
			FROM #CycleTime   
			WHERE Cycle< @Median 
			ORDER BY Cycle 
			SELECT @LowerQuartile=CAST(
						(SELECT MAX(Cycle) 
						FROM 
							(select top 50 percent Cycle 
							FROM #LowerQuatile 
							ORDER BY Cycle) AS BottomHalf)
						+
						(SELECT MIN(Cycle)
						FROM
							(SELECT TOP 50 percent Cycle
							FROM #LowerQuatile
							ORDER BY Cycle DESC) AS TopHalf)
					 as float)  /2    			
-- Calculate Upper Quartile
			SELECT TOP 50 percent Cycle INTO #UpperQuatile FROM #CycleTime   WHERE Cycle> @Median ORDER BY Cycle DESC
			SELECT @UpperQuartile=CAST(
						(SELECT MIN(Cycle) 
						FROM 
							(select top 50 percent Cycle FROM #UpperQuatile ORDER BY Cycle) AS BottomHalf)
						+
						(SELECT MIN(Cycle)
						FROM
							(SELECT TOP 50 percent Cycle FROM #UpperQuatile ORDER BY Cycle DESC) AS TopHalf)
					 as float)  /2    		
-- Calculate top and bottom Outlier
			 Select @BottomOutlier = @LowerQuartile - 1.5*(@UpperQuartile - @LowerQuartile)
			Select @TopOutlier = @UpperQuartile + 1.5*(@UpperQuartile - @LowerQuartile)
--Get the min value
	Select @MinVal= min(Cycle) 
	from #CycleTime
--Get the max value
	Select @MaxVal=max(Cycle) 
	from #CycleTime
	
	
	Select @space1=ceiling(((@LowerQuartile - @MinVal)/@MaxVal)*10)*9;
	Select @space2=ceiling(((@Median-@LowerQuartile)/@MaxVal)*10)*9;
	Select @space3=ceiling(((@UpperQuartile-@Median)/@MaxVal)*10)*9;

	select CONCAT_WS('|','Min',replicate ('-',@space1),'LQ',replicate ('-',@space2),'Med',replicate ('-',@space3),'UQ',replicate ('-',@space3),'MX')
	union all
	select CONCAT_WS('|',@MinVal,replicate ('-',@space1),@LowerQuartile,replicate ('-',@space2),@Median,replicate ('-',@space3),@UpperQuartile,replicate ('-',@space3),@MaxVal)
;
GO
/****** Object:  StoredProcedure [dbo].[GetControlLimits]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetControlLimits] 
@option char, --U for Upper Control Limit, L for Lower Control Limit
@return float output
AS 
	SET NOCOUNT ON	
	declare @LCL float(24);
	declare @UCL float(24);
	declare @BiasFactor float(24);
	declare @avg float (24);
	declare @stdev float(24);
	declare @n int;
-- Obtain the Sample size
	select @n=count(*) from ActivityTracker
--Obtain the Bias Correction Factor for the Sample Size
	if (select count(*)
		from BiasCorrectionControlChart 
		where n >@n) =0
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=30
	else	
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=@n
--Obtain the Standar Deviation
	exec GetStdDevOrAverage's' , @stdev output ;
--Obtain the Average
	exec GetStdDevOrAverage'a' , @avg output ;


--Obtain Control Limits
if @option ='l' 
	Begin
		select @LCL =(@avg - 3* @stdev /(@BiasFactor * SQRT(@n)))
		select @return=@LCL
	end
if @option ='u'
	Begin
		select @UCL =(@avg + 3* @stdev /(@BiasFactor * SQRT(@n)))
		select @return=@UCL
	end
GO
/****** Object:  StoredProcedure [dbo].[GetStdDevOrAverage]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetStdDevOrAverage]
@option char,
@return float output
As
	Set NOCOUNT ON
--Obtain Cycle Time, to calculate Std Dev and Average
		SELECT  ActID ,DATEDIFF(minute, Initial,Finish) as Cycle into #CycleTime from ActivityTracker  				

 if @option ='s'
	Begin 
		
		--Obtain the Standar Deviation
			select @return= STDEV(Cycle) from #CycleTime 
	End
if @option='a'
	BEGIN
		select @return= AVG(Cycle) from #CycleTime     	
	END
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[TestStratification]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TestStratification]  ---Test if there're 4 or more consecutive values either above or below the mean
as
	SET NOCOUNT ON	
	declare @avg float;
	declare @stop int;
	declare @below int;
	declare @above int;
	exec GetStdDevOrAverage 'a', @avg output; --Calls the procedure to calculate the average
	select @stop =count(*) from ActivityTracker --This is the stop for a Common table Expression (below)
	--Initial table for a recurs
	SELECT  ActID ,DATEDIFF(minute, Initial,Finish) as Cycle, ROW_NUMBER() over(order by ActId) ind, 1 accum , 0 above, 0 below 
	into #CTimeTestStratification --- The table will be used in a CTE below
	from ActivityTracker ;
	--Common table expression to evaluate each case compared to the mean and accumulate consecutive cases above or below the mean
	WITH TestStratification AS(
			SELECT 
					ActID,
					Cycle,
					ind,
					CASE  -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN cycle >@avg then above+1 
						Else  above - above
						End as above,
					CASE -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN cycle <@avg then below+1 
						Else  below - below
						End as below,
					accum +1 accum
			from 
					#CTimeTestStratification
			where ind = accum 
			union all
			Select		
					t1.ActID,
					t1.Cycle,
					t1.ind,
					CASE -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN t1.cycle >@avg then t2.above+1 
						Else  t2.above - t2.above
						End as Above,
					CASE -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN t1.cycle <@avg then t2.below+1 
						Else  t2.below - t2.below
						End as Above,
					t2.accum +1 accum
			from 
				#CTimeTestStratification t1, 
				TestStratification t2
			where 
			t2.accum =t1.ind and t2.ind<@stop
		 )
   --Retrieve all the cases where there rule is broken either above or below the mean
	Select * into #TestStratification from TestStratification t1
	where	t1.above>3 or t1.below>3
	OPTION (MAXRECURSION 1000)	
 --Count the number of cases that the rule below the mean is broken
 Select @below=count(*)
 from #TestStratification t2
 where t2.below >3
 --Count the number of cases that the rule above the mean is broken
 Select @above=count(*)
 from #TestStratification t2
 where t2.above >3
 print 'There are ' + cast(@below as varchar) + ' infractions at the rule below average'
 print 'There are ' + cast(@above as varchar) + ' infractions at the rule above average'
 Delete from TestStratificationReport;	
 insert into TestStratificationReport (ActID,Cycle,above,below)
 select t3.ActID,t3.Cycle,t3.above,t3.below from #TestStratification t3
 Print 'Detail Stored in table TestStratificationReport'
GO
/****** Object:  StoredProcedure [dbo].[TestTrends]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TestTrends]  ---Test if there're 4 or more consecutive values either above or below the mean
as
	SET NOCOUNT ON	
	declare @avg float;
	declare @stop int;
	declare @below int;
	declare @above int;
	exec GetStdDevOrAverage 'a', @avg output; --Calls the procedure to calculate the average
	select @stop =count(*) from ActivityTracker --This is the stop for a Common table Expression (below)
	--Initial table for Common table expression
	SELECT  ActID ,DATEDIFF(minute, Initial,Finish) as Cycle, ROW_NUMBER() over(order by ActId) ind, 1 accum , 0 above, 0 below 
	into #CTimeTestTrends --- The table will be used in a CTE below
	from ActivityTracker ;
	--Common table expression to evaluate each case compared to the mean and accumulate consecutive cases above or below the mean
	WITH TestTrends AS(
			SELECT 
					ActID,
					Cycle,
					ind,
					above,
					below,
					accum +1 accum
			from 
					#CTimeTestTrends 
			where ind = accum 
			union all
			Select		
					t1.ActID,
					t1.Cycle,
					t1.ind,
					CASE -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN t1.cycle >t2.Cycle then t2.above+1 
						Else  t2.Cycle - t2.Cycle
						End as Above,
					CASE -- Will compare the current value against the mean and either accumulate or reset the counter
						WHEN t1.cycle <t2.Cycle then t2.below+1 
						Else  t2.Cycle - t2.Cycle
						End as Above,
					t2.accum +1 accum
			from 
				#CTimeTestTrends t1, 
				TestTrends t2
			where 
			t2.accum =t1.ind and t2.ind<100
		 )
   --Retrieve all the cases where there rule is broken 
	Select * into #TestTrendResult from TestTrends t1
	where	t1.above>3 or t1.below>3
	OPTION (MAXRECURSION 1000)	
 --Count the number of cases that the rule trend  is broken
 Select @below=count(*)
 from #TestTrendResult t2
 where t2.below >3
 --Count the number of cases that the rule rule trend  is broken
 Select @above=count(*)
 from #TestTrendResult t2
 where t2.above >3
 print 'There are ' + cast(@below as varchar) + ' infractions at the rule trend downwards'
 print 'There are ' + cast(@above as varchar) + ' infractions at the rule trend upwards'
 
 Delete from TestTrendResults;	
 insert into TestTrendResults (ActID,Cycle,above,below)
 select t3.ActID,t3.Cycle,t3.above,t3.below from #TestTrendResult t3
 
 Print 'Detail Stored in table TestTrendResults'
GO
/****** Object:  StoredProcedure [dbo].[TestValueBeyondLimits]    Script Date: 12/16/2020 8:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TestValueBeyondLimits] 
AS 
	SET NOCOUNT ON	
	declare @LCL float(24);
	declare @UCL float(24);
	declare @BiasFactor float(24);
	declare @avg float (24);
	declare @stdev float(24);
	declare @n int;
-- Obtain the Sample size
	select @n=count(*) from ActivityTracker
--Obtain the Bias Correction Factor for the Sample Size
	if (select count(*)
		from BiasCorrectionControlChart 
		where n >@n) =0
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=30
	else	
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=@n
--Obtain the Standar Deviation
	exec GetStdDevOrAverage's' , @stdev output ;
--Obtain the Average
	exec GetStdDevOrAverage'a' , @avg output ;
--Obtain Control Limits
exec GetControlLimits 'u', @UCL output
exec GetControlLimits 'l', @LCL output

-- Testing values above or Below Control Limits 
SELECT  MfgStgActivity.MfgRoleActivity, CONCAT_WS('-',DATEPART(yyyy,initial),DATEPART(Month,initial),DATEPART(Day,initial)) EventDate ,DATEDIFF(minute, Initial,Finish) as Cycle, ActID into #CycleTime  from ActivityTracker, MfgStgActivity where ActivityTracker.MfgRoleActID=MfgStgActivity.MfgRoleActID   
	IF(SELECT COUNT(*) FROM #CycleTime WHERE Cycle >@UCL)>0
	Begin
		Select @n=count(*) from #CycleTime where Cycle >@UCL
		
			PRINT 'There are ' + CAST(@n as Varchar) + ' events out of the Control Limits'
			PRINT 'The events where added to the table OutControlLimitsLog'		
			INSERT INTO OutControlLimitsLog
			Select 
					t1.MfgRoleActivity,
					t1.EventDate,
					t1.Cycle,
					t1.ActID
			from 
					#CycleTime t1
			where 
					t1.Cycle >@UCL 
	End
Else
	PRINT 'There are no events out of the Control Limits'

GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
