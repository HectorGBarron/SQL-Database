use AdventureWorks2017




-- simple CTEs
WITH Sales_CTE (SalesPersonID, NumberOfOrders, MaxDate)
AS
(
    SELECT SalesPersonID, COUNT(*), MAX(OrderDate)
    FROM Sales.SalesOrderHeader
    GROUP BY SalesPersonID
)
SELECT E.BusinessEntityId, OS.NumberOfOrders, OS.MaxDate,
    E2.BusinessEntityId, OM.NumberOfOrders, OM.MaxDate
-- great example of MS giving us an unreadable query with FROM clause JOINS :)
-- BUT: also demonstrates the fact you can use the CTE twice in the from clause
FROM HumanResources.Employee E
    JOIN Sales_CTE OS
    ON E.BusinessEntityId = OS.SalesPersonID
    LEFT OUTER JOIN (
        HumanResources.Employee E2 
        JOIN Sales_CTE AS OM
        ON E2.BusinessEntityID = OM.SalesPersonID   
    ) ON E.OrganizationNode.GetAncestor(1) = E2.OrganizationNode
ORDER BY E.BusinessEntityId;
GO


-- Recursive CTE:
-- note I used a column list (column alias is more common, but less recommended)
with AFewNumbers (num) as (
	select 0

	union all

	select num + 1 from AFewNumbers
	where num < 265
)
select * from AFewNumbers
-- the following is needed if the number is more than 100
option (maxrecursion 2000)



-- A tree in SQL... or a graph?
create table mytree (
	nodeid int primary key,
	nodename varchar(max),
	nodeparent int references mytree
)


sp_help [HumanResources.Employee]

select top 5 * from HumanResources.Employee

-- The example uses hierarchyId, we fake it here
drop view HumanResources.OldEmployee
go

-- Hector

select top 6* from HumanResources.EmployeeDepartmentHistory;

select top 50  BusinessEntityID, OrganizationNode, OrganizationNode.GetAncestor(1) from HumanResources.Employee order by BusinessEntityID;
select top 50 hre2.BusinessEntityId ManagerId, hre1.BusinessEntityID, hre1.OrganizationNode.GetAncestor(1), hre2.OrganizationNode
    from HumanResources.Employee hre1 left outer join HumanResources.Employee hre2
    on hre1.OrganizationNode.GetAncestor(1) = hre2.OrganizationNode;

--

create view HumanResources.OldEmployee as
    select top 5 hre2.BusinessEntityId ManagerId, hre1.* 
    from HumanResources.Employee hre1 left outer join HumanResources.Employee hre2
    on hre1.OrganizationNode.GetAncestor(1) = hre2.OrganizationNode

-- peek at it
select BusinessEntityId, ManagerId, JobTitle
from HumanResources.OldEmployee
order by BusinessEntityID asc

-- this is the org chart basis
WITH DirectReports (ManagerID, EmployeeID, Title, DeptID, Level)
AS
(
-- Anchor member definition
    SELECT e.ManagerID, e.BusinessEntityID, e.JobTitle, edh.DepartmentID, 
        0 AS Level
    FROM HumanResources.OldEmployee AS e
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh
        ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    WHERE ManagerID IS NULL

    UNION ALL

-- Recursive member definition
    SELECT e.ManagerID, e.BusinessEntityID, e.JobTitle, edh.DepartmentID,
        Level + 1
    FROM HumanResources.OldEmployee AS e
	    INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh
        ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    INNER JOIN DirectReports AS d
        ON e.ManagerID = d.EmployeeID
)
--select * from DirectReports

-- Statement that executes the CTE, all in R+D
SELECT ManagerID, EmployeeID, Title, Level
FROM DirectReports
INNER JOIN HumanResources.Department AS dp
    ON DirectReports.DeptID = dp.DepartmentID
WHERE dp.GroupName = N'Research and Development';
GO

-- Iztik Ben-Gan gives us this neat (but not particularly implementable) improvement
WITH DirectReports (ManagerID, EmployeeID, Title, DeptID, Level, thePath)
AS
(
-- Anchor member definition
    SELECT e.ManagerID, e.BusinessEntityID, e.JobTitle, edh.DepartmentID, 
        0 AS Level,
        convert(varchar(max), '.0|') + convert(varchar(max), e.BusinessEntityID) thePath
    FROM HumanResources.OldEmployee AS e
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh
        ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    WHERE ManagerID IS NULL
    UNION ALL
-- Recursive member definition
    SELECT e.ManagerID, e.BusinessEntityID, e.JobTitle, edh.DepartmentID,
        Level + 1,
        convert(varchar(max), thePath + '.' + convert(varchar, Level+1) + '|' + convert(varchar, e.BusinessEntityID)) thePath
    FROM HumanResources.OldEmployee AS e
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh
        ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    INNER JOIN DirectReports AS d
        ON e.ManagerID = d.EmployeeID
)
-- Statement that executes the CTE
SELECT replicate('|   ', Level)+ '|---' + Title
FROM DirectReports
order by thePath
GO




-- another interesting tidbit about hierarchy ID
select OrganizationNode, CONVERT(varchar, OrganizationNode) from HumanResources.Employee





select distinct JobTitle
    FROM HumanResources.OldEmployee AS e
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh
	ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
Session 7 Companion.sql

Displaying Session 7 Companion.sql.