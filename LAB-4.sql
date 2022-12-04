 CREATE  TABLE PERSON
 (
	 WORKERID INT,
	 FIRSTNAME VARCHAR(100),
	 LASTNAME VARCHAR(100),
	 SALARY DECIMAL(8,2),
	 JOININGDATE DATETIME,
	 DEPARTMENT INT,
	 DESIGNATIONID INT
 )

 CREATE TABLE DEPARTMENT
 (
	DEPARTMENTID INT,
	DEPARTMENTNAME VARCHAR(100)
 )

 CREATE TABLE DESIGNATION
 (
	DESIGNATIONID INT,
	DESIGNATIONNAME VARCHAR(100)
 )

 INSERT INTO PERSON VALUES (101,'RAHUL','ANSHU',56000,'1990-01-01',1,12)
 INSERT INTO  PERSON VALUES (102,'HARDIK','HINSU',18000,'1990-09-25',2,11)
 INSERT INTO PERSON VALUES (103,'BHAVIN','KAMANI',25000,'1991-05-14',NULL,11)
 INSERT INTO PERSON VALUES ( 104,'BHOOMI','PATEL',39000,'2014-02-20',1,13)
 INSERT INTO PERSON VALUES (105,'ROHIT','RAJGOR',17000,'1990-07-23',2,15)
 INSERT INTO PERSON VALUES ( 106,'PRIYA','MEHTA',25000,'1990-10-18',2,NULL)
 INSERT INTO PERSON VALUES (107,'NEHA','TRIVEDI',18000,'2014-02-20',3,15)
 SELECT * FROM PERSON  

 INSERT INTO DEPARTMENT VALUES (1,'ADMIN')
 INSERT INTO DEPARTMENT VALUES(2,'IT')
 INSERT INTO DEPARTMENT VALUES(3,'HR')
 INSERT INTO DEPARTMENT VALUES(4,'ACCOUNT')
 SELECT * FROM DEPARTMENT

 INSERT INTO DESIGNATION VALUES (11,'JOBBER')
 INSERT INTO DESIGNATION VALUES (12,'WELDER')
 INSERT INTO DESIGNATION VALUES (13,'CLERK')
 INSERT INTO DESIGNATION VALUES (14,'MANAGER')
 INSERT INTO DESIGNATION VALUES (15,'CEO')
 SELECT * FROM  DESIGNATION

 1. All tables Insert, Update & Delete  

	1.1. Insert into Department table 
	CREATE PROCEDURE PR_Department_Insert 
	@DepartmentID  int, 
	@DepartmentName  varchar(100)
	AS 
	BEGIN 
	INSERT INTO Department 
	(  
	DepartmentID,  
	DepartmentName  
	) 
	VALUES  
	(   
	@DepartmentID,  
	@DepartmentName 
	)
	END 

	1.2. Insert into Designation table
	CREATE PROCEDURE PR_Designation_Insert  
	@DesignationID  int,  
	@DesignationName  varchar(100) 
	AS 
	BEGIN 
	INSERT INTO Designation 
	(   
	DesignationID, 
	DesignationName 
	) 
	VALUES
	( 
	@DesignationID,  
	@DesignationName 
	)
	END
	
	1.3. Insert into Person table
	CREATE PROCEDURE PR_PERSON_Insert
	@FirstName  varchar(50),
	@LastName  varchar(50), 
	@Salary  decimal(8,2),
	@JoiningDate   datetime,  
	@DepartmentID  int,  
	@DesignationID  int 
	AS BEGIN 
	INSERT INTO Person  (   FirstName,   LastName,   Salary,   JoiningDate,   DepartmentID,   DesignationID   )
	VALUES  (   @FirstName,   @LastName,   @Salary ,   @JoiningDate ,   @DepartmentID ,   @DesignationID   ) 
	END 

	1.4. Update Department table 
	CREATE PROCEDURE PR_Department_Update 
	@DepartmentID  int,  
	@DepartmentName  varchar(100)
	AS  BEGIN 
	UPDATE Department 
	SET   DepartmentID = @DepartmentID,   
	DepartmentName = @DepartmentName 
	WHERE DepartmentID = @DepartmentID 
	END 

	1.5. Update Designation table 
	CREATE PROCEDURE PR_Designation_Update 
	@DesignationID  int, 
	@DesignationName  varchar(100)
	AS
	BEGIN
	UPDATE Designation 
	SET   DesignationID = @DesignationID,   
	DesignationName = @DesignationName 
	WHERE DesignationID = @DesignationID 
	END
	
	1.6. Update Person table
	CREATE PROCEDURE PR_Person_Update  
	@WorkerID   int,  @FirstName   varchar(100),  @LastName   varchar(100),  @Salary   decimal(8,2),  @JoiningDate   datetime,  @DepartmentID  int,  @DesignationID  int
	AS
	BEGIN 
	UPDATE Person
	SET  FirstName = @FirstName,   LastName = @LastName,   Salary = @Salary,   JoiningDate = @JoiningDate,   DepartmentID = @DepartmentID,   DesignationID = @DesignationID 
	WHERE WorkerID = @WorkerID
	END 
 
 1.7. Delete from Department table
 CREATE PROCEDURE PR_Department_Delete 
 @DepartmentID  int
 AS  BEGIN
 DELETE FROM Department 
 WHERE DepartmentID = @DepartmentID
 END
 
 1.8. Delete from Designation table
 CREATE PROCEDURE PR_Designation_Delete 
 @DesignationID  int 
 AS
 BEGIN 
 DELETE FROM Designation  
 WHERE DesignationID = @DesignationID 
 END

 1.9. Delete from Person table CREATE PROCEDURE PR_Person_Delete @WorkerID  int AS  BEGIN  DELETE FROM Person  WHERE WorkerID = @WorkerID END 
 
 2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)  
 
	2.1. Select from Department table CREATE PROCEDURE PR_Department_SelectAll AS BEGIN  SELECT DepartmentID, DepartmentName   FROM Department END 
	2.2. Select from Designation table CREATE PROCEDURE PR_Designation_SelectAll AS BEGIN  SELECT DesignationID, DesignationName   FROM Designation END 
	2.3. Select from Person table
	CREATE PROCEDURE PR_Person_SelectAll 
	AS BEGIN 
	SELECT    Person.WorkerID,   Person.FirstName,   Person.LastName,   Person.Salary,   Person.JoiningDate,   Department.DepartmentName,   Designation.DesignationName  FROM Person   LEFT OUTER JOIN Department   
	ON Person.DepartmentID=Department.DepartmentID 
	LEFT OUTER JOIN Designation  ON Person.DesignationID=Designation.DesignationID END 
	
3. All tables SelectPK  

	3.1. Select from Department table by Primary key CREATE PROCEDURE PR_Department_SelectPK @DepartmentID  int AS  BEGIN SELECT   DepartmentID,   DepartmentName FROM Department WHERE DepartmentID = @DepartmentID END 
	3.2. Select from Designation table by Primary key CREATE PROCEDURE PR_Designation_SelectPK  @DesignationID  int AS  BEGIN  SELECT   DesignationID,   DesignationName  FROM Designation  WHERE DesignationID = @DesignationID END 
	3.3. Select from Person table by Primary key
	CREATE PROCEDURE PR_Person_SelectPK  @WorkerID  int
	AS  BEGIN 
	SELECT   WorkerID,   FirstName,   LastName,   Salary,   JoiningDate,   DepartmentID,   DesignationID FROM Person
	WHERE WorkerID = @WorkerID 
	END

4. Create Procedure that takes Department Name & Designation Name as Input and Returns a table with Worker’s First Name, Salary, Joining Date & Department Name.  

	CREATE PROCEDURE PR_Person_SelectByDesignationNameDepartmentName @DepartmentName  varchar(200),   @DesignationName  varchar(250) AS BEGIN SELECT     Person.FirstName,    Person.Salary,   Person.JoiningDate,   Department.DepartmentName,   FROM Person  LEFT OUTER JOIN Department ON Department.DepartmentID = Person.DepartmentID LEFT OUTER JOIN Designation ON Designation.DesignationID = Person.DesignationID WHERE DesignationName = @DesignationName AND DepartmentName = @DepartmentName END 
 
5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of the worker with their department & designation name.
	
	CREATE PROCEDURE PR_Person_SelectByFirstName @FirstName  varchar(200) 
	AS BEGIN
	SELECT     Person.WorkerID,    Person.FirstName,    Person.LastName,    Person.Salary,    Person.JoiningDate,    Department.DepartmentName,    Designation.DesignationName FROM Person  LEFT OUTER JOIN Department ON Department.DepartmentID = Person.DepartmentID LEFT OUTER JOIN Designation ON Designation.DesignationID = Person.DesignationID WHERE FirstName = @FirstName END 

 6. Create Procedure which displays department wise maximum, minimum & total salaries.  CREATE PROCEDURE PR_Person_MaxMinTotalSalary_DepartmentWise AS BEGIN SELECT    Department.DepartmentName,    MAX(Person.salary) as MaxSalary,    MIN(Person.salary) as MinSalary, SUM(Person.salary) as TotalSalary FROM Person  INNER JOIN Department ON Department.DepartmentID = Person.DepartmentID GROUP BY Department.DepartmentName END 
 
Views.....

1. Create a view that display first 100 workers details.  CREATE VIEW First100_Worker_Detail AS SELECT TOP 100   WorkerID,   FirstName,   LastName,   Salary,   JoiningDate,   DepartmentID,   DesignationID   FROM Person 

2. Create a view that displays designation wise maximum, minimum & total salaries.  CREATE VIEW DesignationWiseMinMaxTotalSalary AS  SELECT    Designation.DesignationName,   MAX(Person.Salary) AS MaxSalary,   MIN(Person.Salary) AS MinSalary,   SUM(Person.Salary) AS TotalSalary FROM Person INNER JOIN Designation ON Designation.DesignationID = Person.DesignationID GROUP BY Designation.DesignationName 
 
3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays duration column which is difference of joining date with respect to current date.  CREATE VIEW PersonDataWithJobDuration AS SELECT    FirstName,   Salary,   JoiningDate,   DATEDIFF(YEAR, Joiningdate, GETDATE()) as Duration FROM Person 
 
4. Create a view which shows department & designation wise total number of workers.  CREATE VIEW DeptartmentDesignationWiseTotal AS SELECT  Department.DepartmentName,  Designation.DesignationName,  COUNT(Person.WorkerID) AS TotalPerson  FROM Person  LEFT OUTER JOIN Department  ON Department.DepartmentID = Person.DepartmentID  LEFT OUTER JOIN Designation  ON Designation.DesignationID = Person.DesignationID GROUP BY Department.DepartmentName,Designation.DesignationName 

5. Create a view that displays worker names who don’t have either in any department or designation.  CREATE VIEW DonthaveDeptDesignation AS SELECT    FirstName,Lastname FROM Person WHERE DepartmentID IS NULL OR    DesignationID IS NULL 

User Defined Functions-----

1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker table based on DepartmentID.  CREATE FUNCTION fnWorkerIDbyDepartmentID(@DepartmentID int) RETURNS TABLE AS BEGIN  RETURN (SELECT WorkerID FROM Person  WHERE DepartmentID = @DepartmentID) 
 END 

2. Create a table valued function which returns a table with unique First names from Person table. CREATE FUNCTION fnDistinct() Returns Table AS   Return (SELECT DISTINCT FirstName From Person) 

3. Create a scalar valued function which accepts two parameters start date & end date, and returns a date difference in days.  CREATE FUNCTION fnDateDifferance(@StartDate Datetime, @EndDate Datetime) RETURNS varchar(150) AS  BEGIN  RETURN (SELECT Convert(varchar(150),Datediff(Day,@StartDate,@EndDate))) END 
 
4. Create a scalar valued function which accepts two parameters year in integer & month in integer and returns total days in passed month & year.  CREATE FUNCTION fnDaysInMonthcount (@year INT, @Month INT) RETURNS INT  AS BEGIN DECLARE @Date DATE = CAST( CAST(@Year AS CHAR(4))                              + RIGHT('0' + CAST(@Month AS VARCHAR(2)), 2)                             + '01' AS DATE); 
 
RETURN DATEDIFF(DAY,                DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date), 0),               DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date) + 1, 0)); END 
