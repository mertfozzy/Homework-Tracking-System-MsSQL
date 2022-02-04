INSERT INTO workers
	SELECT BusinessEntityID, FirstName, LastName FROM Person.Person
	WHERE Suffix IS NOT NULL

Select W_ID, W_FirstName, W_LastName from workers
UNION ALL
Select BusinessEntityID, FirstName, LastName from Person.Person --Union iki tabledaki verileri birle�tirir ayn� olan�
																	--bir kere yazd�r�r. ALL da hepsini yazd�r�r


Select BusinessEntityID, FirstName, LastName from Person.Person
INTERSECT
Select W_ID, W_FirstName, W_LastName from workers --Kesi�imlerini al�r


Select BusinessEntityID, FirstName, LastName from Person.Person
EXCEPT
Select W_ID, W_FirstName, W_LastName from workers --Hepsini al, kesi�imi ��kar


Select BusinessEntityID, FirstName, LastName from Person.Person
UNION
Select W_ID, W_FirstName, W_LastName AS LN from workers
UNION
Select SalesReasonID, Name, ReasonType from Sales.SalesReason


Select BusinessEntityID, FirstName, LastName from Person.Person
INTERSECT
Select W_ID, W_FirstName, W_LastName AS LN from workers
 -- A�a��daki �sttekinin ayn�s�
Select BusinessEntityID, FirstName, LastName from Person.Person
Where BusinessEntityID IN
	(Select W_ID from workers)


Select BusinessEntityID, FirstName, LastName from Person.Person
Except
Select W_ID, W_FirstName, W_LastName AS LN from workers
-- �stteki alttakinin ayn�s�
Select BusinessEntityID, FirstName, LastName from Person.Person
Where BusinessEntityID NOT IN
	(Select W_ID from workers)

update workers set W_ID += (select MAX(SalesReasonID) from Sales.SalesReason)
	where W_ID IN (Select BusinessEntityID FROM Person.Person) -- W_ID + SalesReason(MAX) if worker is in Person.Person


SELECT W_ID, W_FirstName, W_LastName, GETDATE() AS NaNe from workers --SERVER tarihini bast�r

SELECT year(OrderDate) from Sales.SalesOrderHeader --month aylar� bast�r�r


Select month(OrderDate) as MonthOfTheYear, count(*) as Total
	from Sales.SalesOrderHeader 
	GROUP BY month(OrderDate)
	order by count(*) DESC


Select OrderDate, DATEADD(month, 3, OrderDate) AS DueDate from Sales.SalesOrderHeader -- orderdate i 3 ay arrt�r�yorsun
																						--month day de olabilir



select DateDiff( month, '2000-08-22', Getdate()) -- eleman�n ka� ayl�k oldu�nu yazd�r�r (month yerinde day de olur)




Select OrderDate, DATEADD(day,3800, OrderDate) AS DueDate,
	datediff (day,OrderDate,getdate()) as DaysPassed
	from Sales.SalesOrderHeader -- due date'ten bu yana ka� g�n ge�ti�ini g�rd�k

