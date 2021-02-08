use AdventureWorks2017


create table CITIES
	(
		NAME varchar(30) primary key
	);

create table ROUTES
	(
		FROM_CITY varchar(30) references CITIES,
		TO_CITY varchar(30) references CITIES,
		MILES int not null,
		primary key (from_city, to_city)
	)


insert into cities values ('New York')
insert into cities values ('Washington')
insert into cities values ('Miami')
insert into cities values ('Chicago')
insert into cities values ('St. Louis')
insert into cities values ('Dallas')
insert into cities values ('Denver')
insert into cities values ('Phoenix')
insert into cities values ('Los Angeles')
insert into cities values ('San Francisco')
insert into cities values ('Seattle')

insert into routes values ('New York', 'Washington', 200)
insert into routes values ('New York', 'Chicago', 700)
insert into routes values ('Miami', 'Washington', 900)
insert into routes values ('St. Louis', 'Washington', 700)
insert into routes values ('St. Louis', 'Miami', 1050)
insert into routes values ('St. Louis', 'Chicago', 250)
insert into routes values ('St. Louis', 'Dallas', 550)
insert into routes values ('St. Louis', 'Denver', 800)
insert into routes values ('Chicago', 'Denver', 900)
insert into routes values ('Seattle', 'Denver', 1000)
insert into routes values ('San Francisco', 'Denver', 950)
insert into routes values ('San Francisco', 'Seattle', 700)
insert into routes values ('San Francisco', 'Los Angeles', 350)
insert into routes values ('Phoenix', 'Los Angeles', 350)
insert into routes values ('Phoenix', 'Dallas', 900)
insert into routes values ('Miami', 'Dallas', 1100);
go


create or alter  view ALL_ROUTES (FROM_CITY, TO_CITY, MILES) as

select
		FROM_CITY,
		TO_CITY,
		MILES
from
		ROUTES
UNION
select
		TO_CITY,
		FROM_CITY,
		MILES
from
		ROUTES
;



-- =============================================
-- Author:		<Author,Hector Gonzalez Barron>
-- Create date: <Create Date,10/23/2020>
-- Description:	<Procedure to Obtain the fewest hopes, the mileage and the path, between two Cities. This solution is optimized to avoid goint twice on the same node >
-- =============================================
GO
CREATE  OR ALTER PROCEDURE FEWEST_STOPS
	
		@fromCity varchar(30),
		@toCity varchar(30)
AS
	SET NOCOUNT ON
 
	
--Initial Data Validation
	if not exists 
			(select * from CITIES where NAME = @fromCity)
			begin
				print 'No service is offered from ' + @fromCity + '.' +char(10)
				return
			end

	if not exists 
			(select * from CITIES where NAME = @toCity)
			begin
				print 'No service is offered to ' + @toCity + '.' +char(10)
				return
			end

	if @fromCity=@toCity 
			
			begin
				print 'You can pretty much walk from ' + @fromCity + ' to '+ @toCity + '.'  +char(10)
				return
			end

--Conclude initial data validation
--Obtain the shortest route and its details (begin)

	declare @CityCount int = (select count(*) from CITIES)  --Control Variable
	declare @shortestPath varchar(max)  --Build the full path and its mileage
	declare @minHops int; -- Min Quantity of hops
	
--Anonymous view with recursion
	with ReachableCities as 
	(
		select 
				TO_CITY, 
				FROM_CITY FCriteria, -- This will be used as filter at the recursion
				1 HOPS,
				MILES,
				
				convert(varchar(max),@fromCity+'=>') Shortest_Path  --Stores the departure city
		from 
				ALL_ROUTES
		where
				FROM_CITY=@fromCity

		union all
		
		select 
				A.TO_CITY, 
				A.FROM_CITY FCriteria, --This is used to avoid a loop when the recursion is executing, below at the union this is an exception in criteria
				R.HOPS + 1,
				A.MILES + r.MILES,
				convert(varchar(max),CONCAT(R.Shortest_Path, '=>',A.TO_CITY)) Shortest_Path --Appends the new paths
		from 
				ALL_ROUTES A, 
				ReachableCities R
		where
				A.FROM_CITY = R.TO_CITY	
		and
				r.HOPS < @CityCount
		and 
				a.TO_CITY != r.FCriteria --FCriteria is the city origin city at the previous iteration, we dont want to go twice on the same iteration

	)

--Temporal table to store the results of the anonymous View "ReachableCities" , A query will be runned twice and this will reduce the recursion time
	select *
	into #tempTable
	from ReachableCities
	where TO_CITY=@toCity


--Obtaining the Shortest Path and the mileage for the min Hops	
	
	select @ShortestPath=concat(miles,', ',Shortest_Path), @minHops=HOPS
	from #tempTable
	where MILES = (select min(miles) from #tempTable)

--Obtain the shortest route and its details (end)
--Print results
	if @minHops is not null
		print 'You must make ' + convert(varchar, @minHops-1) + ' transfers between ' + 
              @fromCity + ' and ' + @toCity + '.'  +char(10) + 'The shortest path is ' + @shortestPath +char(10)
		
		
    else
        -- this should never happen!
        print 'No trains exists from ' + @fromCity + ' to ' + @toCity + '.' 
GO



exec FEWEST_STOPS 'New York', 'New York'
exec FEWEST_STOPS 'New York', 'Los Angeles'
exec FEWEST_STOPS 'New York', 'Toledo'
exec FEWEST_STOPS 'New York', 'Miami'
exec FEWEST_STOPS 'Miami', 'New York'
exec FEWEST_STOPS 'Seattle', 'Dallas'
