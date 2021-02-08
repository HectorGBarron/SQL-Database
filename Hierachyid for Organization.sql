use AdventureWorks2017;
WITH DirectReports (ManagerID, EmployeeID, Title, DeptID, Level, thePath)
AS
(
-- Anchor member definition
    SELECT 
			e.ManagerID, 
			e.BusinessEntityID, 
			e.JobTitle, 
			edh.DepartmentID, 
			0 AS Level,
			convert(varchar(max), '.0|') + convert(varchar(max), e.BusinessEntityID) thePath
    FROM 
			HumanResources.OldEmployee AS e
    INNER JOIN
			HumanResources.EmployeeDepartmentHistory AS edh
	ON 
			e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    WHERE 
			ManagerID IS NULL
    UNION 
			ALL
-- Recursive member definition
    SELECT 
			e.ManagerID,
			e.BusinessEntityID,
			e.JobTitle, 
			edh.DepartmentID,
			Level + 1,
			convert(varchar(max), d.thePath + '.' + convert(varchar, Level+1) + '|' + convert(varchar, e.BusinessEntityID)) thePath
    FROM 
			HumanResources.OldEmployee AS e
    INNER JOIN 
			HumanResources.EmployeeDepartmentHistory AS edh
        ON 
			e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
    INNER JOIN 
			DirectReports AS d
        ON 
			e.ManagerID = d.EmployeeID

)



-- Statement that executes the CTE
SELECT  replicate('|   ', Level)+ '|---' + Title
FROM DirectReports
order by level, thePath;
GO




