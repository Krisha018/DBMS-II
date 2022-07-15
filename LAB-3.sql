CREATE TABLE PERSON
(
	PERSONID INT,
	PERSONNAME VARCHAR(100),
	DEPARTMENTID INT,
	SALARY DECIMAL(8,2),
	JOININGDATE DATETIME,
	CITY VARCHAR(100)
)

CREATE TABLE  DEPARTMENT
(
	DEPARTMENTID INT,
	DEPARTNAME VARCHAR(100),
	DEPARTMENTCODE VARCHAR(50),
	LOCATION VARCHAR(50)
)

INSERT INTO PERSON VALUES (101,'Rahul Tripathi', 2, 56000,' 2000-01-01',' Rajkot')
INSERT INTO PERSON VALUES (102,' Hardik Pandya', 3, 18000,'2001-09-25','Ahmedabad')
INSERT INTO PERSON VALUES (103,' Bhavin Kanani', 4, 25000,' 2000-05-14',' Baroda')
INSERT INTO PERSON VALUES (104,' Bhoomi Vaishnav', 1 ,39000,'2005-02-08',' Rajkot')
INSERT INTO PERSON VALUES (105,' Rohit Topiya', 2, 17000,'2001-07-23',' Jamnagar')
INSERT INTO PERSON VALUES (106,' Priya Menpara', NULL, 9000,'2000-10-18',' Ahmedabad')
INSERT INTO PERSON VALUES (107,' Neha Sharma' ,2, 34000,' 2002-12-25',' Rajkot')
INSERT INTO PERSON VALUES (108,'Nayan Goswami', 3, 25000,'2001-07-01',' Rajkot')
INSERT INTO PERSON VALUES (109,'Mehul Bhundiya', 4, 13500,'2005-01-09',' Baroda')
INSERT INTO PERSON VALUES (110,'Mohit Maru', 5, 14000,' 2000-05-25',' Jamnagar')
SELECT * FROM PERSON


INSERT INTO DEPARTMENT VALUES (1,' Admin',' Adm',' A-Block')
INSERT INTO DEPARTMENT VALUES (2,' Computer',' CE',' C-Block')
INSERT INTO DEPARTMENT VALUES (3,' Civil',' CI',' G-BlocK')
INSERT INTO DEPARTMENT VALUES (4,' Electrical',' EE',' E-Block')
INSERT INTO DEPARTMENT VALUES (5,' Mechanical',' ME',' B-Block')
SELECT * FROM DEPARTMENT



1.
	SELECT PERSON.PERSONNAME,
			DEPARTMENT.DEPARTNAME,
			DEPARTMENT.DEPARTMENTCODE
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID

2.
	SELECT DEPARTMENT.DEPARTNAME,
			MAX(PERSON.SALARY),
			MIN(PERSON.SALARY)
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME

3.
	SELECT DEPARTMENT.DEPARTNAME,
			SUM(PERSON.SALARY)
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME
	HAVING SUM(PERSON.SALARY)>100000

4.
	SELECT PERSON.PERSONNAME,
			PERSON.SALARY,
			DEPARTMENT.DEPARTNAME
	FROM PERSON
	LEFT OUTER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE PERSON.CITY='JAMNAGAR'

5.
	SELECT   PERSON.PERSONNAME
	FROM PERSON
	LEFT OUTER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE DEPARTMENT.DEPARTMENTID IS NULL

6.
	SELECT DEPARTMENT.DEPARTNAME,
			COUNT(DEPARTMENT.DEPARTMENTID)
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME

7.
	SELECT AVG(PERSON.SALARY)
	FROM PERSON
	LEFT OUTER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE PERSON.CITY='AHEMDABAD'
	GROUP BY PERSON.CITY

8.
	SELECT PERSON.PERSONNAME + 'EARNS' + CAST(SALARY AS varchar) + 'FROM DEPARTMENT' + DEPARTMENT.DEPARTNAME + 'monthly'
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID

9.
	SELECT DEPARTMENT.DEPARTNAME
	FROM PERSON
	FULL OUTER JOIN DEPARTMENT
	ON  PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME
	HAVING COUNT(PERSON.DEPARTMENTID)=0

10.
	--(DEPARTMENT WISE)
	SELECT DEPARTMENT.DEPARTNAME,
			SUM(PERSON.SALARY),
			AVG(PERSON.SALARY),
			MAX(PERSON.SALARY)
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME

	--(CITY WISE)
	SELECT  PERSON.CITY,
			SUM(PERSON.SALARY),
			AVG(PERSON.SALARY),
			MAX(PERSON.SALARY)
	FROM PERSON
	GROUP BY CITY

11.
	SELECT DISTINCT CITY FROM PERSON	
	
12.
	SELECT DEPARTMENT.DEPARTNAME,
			COUNT(PERSON.DEPARTMENTID)
	FROM PERSON
	RIGHT OUTER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTNAME
	HAVING COUNT(PERSON.DEPARTMENTID)>2

13.
	SELECT LEFT(PERSONNAME,3) + RIGHT(CITY,3) FROM PERSON

14.
	UPDATE PERSON
	SET SALARY=((SALARY*10)/100) + SALARY
	WHERE DEPARTMENTID=(SELECT DEPARTMENTID FROM DEPARTMENT WHERE DEPARTNAME='COMPUTER')
	
15.
	SELECT PERSONNAME FROM PERSON
	WHERE (GETDATE() - JOININGDATE) > 365

	
