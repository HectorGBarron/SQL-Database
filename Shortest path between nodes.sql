/*

SW 505 - Midterm Examination
Due: 11/6/2020 @ 23:59:59

This is a programming project.  It must be done in Microsoft SQL Server Transact-SQL, 
version 2017+, and will be graded based on operation in that  environment.  The project 
must be submitted by email to tom.galasso@gmail.com by the due date or no credit will be given. 
Please submit a single file with a .SQL extension.  THIS file.

This is an individual programming project.  In the course of working on this program,
you may consult any textbook, personal notes, or internet reference that is STATIC.  You 
may not communicate with any human being in any way regarding the solution to this test.
This includes asynchronous communications like emails, posts, texts, and tweets, in addition
to verbal, phone, Skype or other synchronous communications.  If I suspect collaboration 
has occurred, I will mark the work of all suspected collaborators as 0 points, which will 
result in failing the course.  Please, please, don't take risks; do your own work by yourself.

PROBLEM DESCRIPTION: The Fairfield University Mars Automated Rover (FUMAR) is a 
motorized robot that sits on a flat plane on the surface of Mars and takes 4 soil samples 
every day.  The four locations are determined at random, but are all within 100 meters on
the X and Y axis of the point where the probe came to rest the previous day.  The software 
you are writing will determine the shortest path that the probe can possibly take to reach 
all four points.

The FUMAR always travels in a straight line between sites.  There are no obstructions on
the Martian plane for it to avoid.

Consider the following diagram:
                                                  
                                                  |+100  
                                                  |
                                                  |  X <-- Site 4 (4, 90)
                                                  |
                                                  |+80
                                                  |
     X <-- Site 3 (-92, 70)                       |
                                                  |
                                                  |+60
                                                  |
                                                  |
                                                  |
                                                  |+40
                                                  |                 X <-- Site 2 (36, 34)
                                                  |
                                                  |
                                                  |+20
                                                  | 
-100     -80       -60       -40       -20        |        +20       +40       +60       +80	  +100 
|---------|---------|---------|---------|---------O---------|---------|---------|---------|---------|
                                                 /|
                                                / |
                                               /  |
                  Original FUMAR Location (0,0)   |-20      X <-- Site 1 (20, -20)
                                                  |
                                                  |
                                                  |
                                                  |-40
                                                  |
                                                  |
                                                  |
                                                  |-60
                                                  |
                                                  |
                                                  |
                                                  |-80
                                                  |
                                                  |
                                                  |
                                                  |-100

The FUMAR must move from the origin to all 4 sites in the order that makes for the overall shortest path.
The FUMAR *will not* neccessarily move from Site 1, to Site 2, etc.
The FUMAR comes to rest at the last point reached, it does not return to the origin.

This is a variation of a travelling salesman problem.  The expected solution will use brute force, which
is appropriate in this case (the number of points are very small, and the cost of making the FUMAR travel
an imperfect path is very expensive).  A brute force solution calculates all possible paths, and picks
the shortest one.  Numerous other potential solutions exist.

There are two parts to this solution.

First, construct the view FUMAR_PATHS which represents all vertices in a connected graph; that is to say,
a straight line vertex between every site and every other site.  
HINT: All the math required for this is at http://www.mathopenref.com/coorddist.html

Second, construct the stored procedure GET_SHORTEST_FUMAR_PATH which will output (select) a result set 
as follows:
	Distance                                ThePath
	--------------------------------------- --------------------------------------------------------------------------------------------------------------
	247.16                                  Original Position (0, 0) --> Site 1 (20, -20) --> Site 2 (36, 34) --> Site 4 (4, 90) --> Site 3 (-92, 70)
    (1 row(s) affected)
HINT: This is the correct solution given the points shown in the example...

You *MAY NOT* alter the table structures, procedures, or views I have put in this file except where comments 
indicate you should.

The test will be graded as follows:
* 20 points for correctly constructing the FUMAR_PATHS view.
* 20 points for getting the correct answer, by any means, on 2 random sets of sites 
  (generated by the provided "GENERATE_FUMAR_SITES" procedure)

The testing procedure will be as follows:
* I will execute GENERATE_FUMAR_SITES
* I will look at your view FUMAR_PATHS, and determine if it contains correct data.
* I will execute your procedure GET_SHORTEST_FUMAR_PATHS and see what happens.
* If I get bad results in either of theose, I will determine if partial credit should be awarded.
   * In doing this, your comments will be very important.
* I will try the same thing on a different set of random coordinates.

EXTRA CREDIT - attempt only AFTER you have completed the main problem
* 2 points - make a procedure "GENERATE_N_FUMAR_SITES (@siteCount int)" which creates @siteCount 
  sites in the underlying table instead of 4
* 5 points - validate that GET_SHORTEST_FUMAR_PATHS works for @siteCount sites, instead of 4
* 3 points - (as text in this file) record how long it takes for GET_SHORTEST_FUMAR_PATHS to 
  run on a variety of site of counts.  Are the results as you expected?  Why or why not?

OVERALL:
* Partial credit will be awared to solutions that are valid SQL, execute, 
  but have errors in logic that cause the answer to be wrong.
* Partial credit will be given for solutions that do not execute only if the programmer explains the problems
  and what he or she did to try and fix them.
* NO CREDIT will be given to a solution that does not run and does not have any description of what was 
  done.

GOOD LUCK.  My advice to you is to start early.  If you aren't halfway done by Sunday, you will probably not succeed.

*/

-- DO NOT ALTER THIS TABLE.  It is set up to allow you to solve the problem easily
drop table FUMAR_SITES
go

create table FUMAR_SITES (
    SiteNumber int primary key nonclustered,
    SiteName nvarchar(100),
    XCoordinate int check (XCoordinate between -100 and 100),
    YCoordinate int check (YCoordinate between -100 and 100)
)
go

-- DO NOT ALTER THIS PROCEDURE.  It builds your data set for testing.
drop procedure GENERATE_FUMAR_SITES
go

create procedure GENERATE_FUMAR_SITES
as begin
    delete from FUMAR_SITES

    insert into FUMAR_SITES select 0, 'Original Position', 0, 0

    declare @siteNumber int
    set @siteNumber = 1

    while @siteNumber <= 4 begin
        insert into FUMAR_SITES 
        select @siteNumber, 'Site #' + convert(nvarchar, @siteNumber),
               100 - floor(rand()*200), 100 - floor(rand()*200)
		
        set @siteNumber = @siteNumber + 1
    end
end
go

exec GENERATE_FUMAR_SITES
go



-- HERE'S YOUR STUFF.  You should only put stuff where the comments are.

drop view FUMAR_PATHS
go


create view FUMAR_PATHS (StartSite, EndSite, Distance) as
    -- *** PART 1:
    -- Write this view such that every combination of sites
    -- Appear as (StartSite, EndSite, Distance), including the Original
    -- Position.  There should be 20! (not 24!) Distance is the length
    -- of a line segment between the two points on a plane.
    	
	select 
			--ss.SiteNumber StartSite,
			'('+CONCAT_WS(',',ss.XCoordinate,ss.YCoordinate)+')' StartSite, -- Concatenating X and Y coordenates and adding ( ) and the middle comma
			--es.SiteNumber EndSite,
			'('+CONCAT_WS(',',es.XCoordinate,es.YCoordinate)+')' EndSite,  -- Concatenating X and Y coordenates and adding ( ) and the middle comma
			sqrt(square(ss.XCoordinate-es.XCoordinate)+square(ss.YCoordinate-es.YCoordinate)) Distance	-- Math function to calculate hypotenuse (distance between nodes) 		
	from 
			FUMAR_SITES SS,
			FUMAR_SITES ES
	where 
			ss.SiteNumber != es.SiteNumber
	
go


-- *** PART 2:

drop procedure GET_SHORTEST_FUMAR_PATH

go

-- =============================================
-- Author:		<Author,Hector Gonzalez Barron>
-- Create date: <Create Date,11/01/2020>
-- Description:	<Procedure to Obtain the shortest path from the original position to all nodes (but not back)
-- =============================================
create or alter procedure GET_SHORTEST_FUMAR_PATH
as begin
    

/*
Extra Credits
* 5 points - validate that GET_SHORTEST_FUMAR_PATHS works for @siteCount sites, instead of 4
Extra Points, this is to be able to use the procedure based on the nodes at the table 
	>>>	declare @sitecount int = (select count(*) from FUMAR_SITES) ;	<<<

	>>> note  I ran it , the exec is below the procedure "GENERATE_N_FUMAR_SITES (@siteCount int)" <<<
*/

declare @sitecount int = (select count(*) from FUMAR_SITES) ;	
declare @lenchar int=1;
-- StarSite could have been hard coded below, but I choosed a variable incase the starting node wanted to be changed in the future
declare @startSite varchar(20) = (select '('+CONCAT_WS(',',XCoordinate,YCoordinate)+')' from FUMAR_SITES where SiteName='Original Position')	;

	with ShortestFumarPathCTE
		as
			(
			select 
					STARTSITE,
					ENDSITE,
					DISTANCE,
					2 SiteCount,-- Begins with two because the first iteration takes two nodes, this  will be used to validate that all the nodes have been visited
					convert(varchar(max),concat_ws(' -> ',StartSite,EndSite)) thePath
			from
					FUMAR_PATHS T
			where 
					StartSite=@startSite
			union all
			select	
					CTE.STARTSITE,
					FP.ENDSITE,
					CTE.Distance+FP.Distance DISTANCE,
					cte.SiteCount+1,
					concat_ws(' -> ',thePath,fp.EndSite) thePath
			from
					FUMAR_PATHS FP,
					ShortestFumarPathCTE CTE
			where
					fp.StartSite=cte.EndSite
		
			
			and
					cast(cte.thePath as nvarchar(max)) not like '%'+fp.EndSite+'%'
		)

			select
					'Original Position '+thePath ThePath, 
					Distance
			from
					ShortestFumarPathCTE
			where 
					SiteCount=@sitecount 
			and
					Distance = (select min(distance) from ShortestFumarPathCTE where SiteCount=@sitecount )
end
go

exec GET_SHORTEST_FUMAR_PATH
go

/*
Extra Credits
* 2 points - make a procedure "GENERATE_N_FUMAR_SITES (@siteCount int)" which creates @siteCount 
*/

-- =============================================
-- Author:		<Author,Hector Gonzalez Barron>
-- Create date: <Create Date,11/01/2020>
-- Description:	<Procedure to generate N sites (based on user input) that will be stored at the table FUMAR_SITES>
-- =============================================
create or alter procedure GENERATE_N_FUMAR_SITES (@siteCount int)
as begin

    delete from FUMAR_SITES

    insert into FUMAR_SITES select 0, 'Original Position', 0, 0

    declare @siteNumber int
    set @siteNumber = 1

    while @siteNumber <= @siteCount begin  -- this one 
        insert into FUMAR_SITES 
        select @siteNumber, 'Site #' + convert(nvarchar, @siteNumber),
               100 - floor(rand()*200), 100 - floor(rand()*200)
		
        set @siteNumber = @siteNumber + 1
    end




end






exec GENERATE_N_FUMAR_SITES  4
exec GET_SHORTEST_FUMAR_PATH

/*
Extra Credits
3 points - (as text in this file) record how long it takes for GET_SHORTEST_FUMAR_PATHS to 
  run on a variety of site of counts.  Are the results as you expected?  Why or why not?

>>Below are a summary of times. The result is what I expected 10 Nodes = (1.31682E+12 transactions  * 1.038867192967722e-8 seconds per transaction)
>> Further below is a table with the Permutations per iteration 
Nodes:    Excecution Time
4			Basically no time
5			Basically no time
6		    Basically no time
7			Basically no time
8				00:15 
9				2:32
10				>17:00  (I stopped it)

		              Iterations
		---------------------------------			  
Nodes	1	2	3	4	5	6	7	8	9	Total Transactions
10		90	72	56	42	30	20	12	6	2	1.31682E+12
9		72	56	42	30	20	12	6	2	1	14,631,321,600
8		56	42	30	20	12	6	2	1	1	203,212,800
7		42	30	20	12	6	2	1	1	1	3,628,800
6		30	20	12	6	2	1	1	1	1	86,400
5		20	12	6	2	1	1	1	1	1	2,880
4		12	6	2	1	1	1	1	1	1	144
3		6	2	1	1	1	1	1	1	1	12
2		2	1	1	1	1	1	1	1	1	2

9 Nodes =14,631,321,600  & 2:32 or 152 seconds

10 Nodes =1.31682E+12
10 Nodes = (1.31682E+12 * 152) / 14,631,321,600
10 Nodes = 13680 seconds, equivalent to 228 min, equivalent to 3.8 hours
*/