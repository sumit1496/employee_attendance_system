--SELECT CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(GETDATE())-1),GETDATE()),103) AS [Date]
--UNION
--SELECT CONVERT(VARCHAR(10),GETDATE(),103) AS Date_Value from tblAttendanceDetails



--SELECT CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(DATEADD(mm,-1,GETDATE()))-1),DATEADD(mm,-1,GETDATE())),103) AS [Date]
--UNION
--SELECT CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(GETDATE())),GETDATE()),103) AS [Date]


--SELECT YEAR(LoginDate) AS [Year],MONTH(LoginDate) AS [Month],day(Logintime) as [Emp] from tblAttendanceDetails Group By YEAR(LoginDate),MONTH(LoginDate)
--declare @t time(3)='09:20:00.000'
--SELECT Count(Logintime) as present  FROM tblAttendanceDetails where Logintime
Select convert(varchar(8),Logintime,108) from tblAttendanceDetails 