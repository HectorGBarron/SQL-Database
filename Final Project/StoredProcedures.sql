

CREATE OR ALTER PROCEDURE GetBoxPlot
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
;go
CREATE OR ALTER PROCEDURE GetStdDevOrAverage
@option char, --Return either Standar Deviation or Average
@return float output --Return Variable
As
	Set NOCOUNT ON
--Obtain Cycle Time, to calculate Std Dev and Average
		SELECT  ActID ,DATEDIFF(minute, Initial,Finish) as Cycle 
		into #CycleTime 
		from ActivityTracker  				
 if @option ='s'  --Standar Deviation
	Begin 
		--Obtain the Standar Deviation
			select @return= STDEV(Cycle) 
			from #CycleTime 
	End
if @option='a' --Average
	BEGIN
		select @return= AVG(Cycle) 
		from #CycleTime     	
	END
	RETURN
go
CREATE OR ALTER PROCEDURE GetControlLimits  --Statistical Control limits where all the data should be contained within 
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
	select @n=count(*) 
	from ActivityTracker
--Obtain the Bias Correction Factor for the Sample Size
	if (select count(*)
		from BiasCorrectionControlChart 
		where n >@n) =0
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=30  -- 30 is the maxium number at the table
	else	
			select @BiasFactor= c4
			from BiasCorrectionControlChart
			where n=@n
--Obtain the Standar Deviation
	exec GetStdDevOrAverage's' , @stdev output ;
--Obtain the Average
	exec GetStdDevOrAverage'a' , @avg output ;
--Obtain Control Limits
if @option ='l'  --lower Control Limit
	Begin
		select @LCL =(@avg - 3* @stdev /(@BiasFactor * SQRT(@n)))
		select @return=@LCL
	end
if @option ='u'  -- Upper Control Limit
	Begin
		select @UCL =(@avg + 3* @stdev /(@BiasFactor * SQRT(@n)))  --Statistical Calculation
		select @return=@UCL
	end
Go
CREATE OR ALTER PROCEDURE TestValueBeyondLimits 
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
	IF(SELECT COUNT(*) 
	FROM #CycleTime
	WHERE Cycle >@UCL)>0
	Begin
		Select @n=count(*)
		from #CycleTime
		where Cycle >@UCL
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
Go
CREATE OR ALTER PROCEDURE TestStratification  ---Test if there're 4 or more consecutive values either above or below the mean
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
go
CREATE OR ALTER PROCEDURE TestTrends  ---Test if there're 4 or more consecutive values either above or below the mean
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
go

exec TestValueBeyondLimits
exec TestTrends
exec TestStratification
exec GetBoxPlot


