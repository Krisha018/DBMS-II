CREATE TABLE STUDENT_INFO
(
	STUID INT,
	NAME VARCHAR(100),
	ENROLLMENTNO VARCHAR(12),
	DIVISION VARCHAR(50),
	SEM INT,
	BIRTHDATE DATETIME,
	EMAIL VARCHAR(100),
	CONTACTNO VARCHAR(50)

)

INSERT INTO STUDENT_INFO
VALUES(101,' Naimish Patel', 090200107051,' BCX-3', 3,' 1992-12-06',' naimishp49@gmail.com', 8866205253)

SELECT * FROM STUDENT_INFO

1.
	SELECT  NAME FROM STUDENT_INFO
	WHERE SEM=3 
	OR SEM=5

	SELECT  NAME FROM STUDENT_INFO
	WHERE SEM IN(3,5)

2.
	SELECT  NAME,ENROLLMENTNO FROM STUDENT_INFO
	WHERE STUID BETWEEN 103 AND 105

3.
	SELECT  NAME,ENROLLMENTNO,EMAIL FROM STUDENT_INFO
	WHERE SEM=5

4.
	SELECT  TOP (3) * FROM STUDENT_INFO

5.
	SELECT TOP 30 PERCENT NAME,ENROLLMENTNO FROM STUDENT_INFO
	WHERE CONTACTNO LIKE '%7'

6.
	SELECT DISTINCT SEM FROM STUDENT_INFO

7.
	SELECT * FROM STUDENT_INFO
	WHERE ENROLLMENTNO IS NULL

8.
	SELECT *FROM STUDENT_INFO
	WHERE NAME NOT LIKE 'V%'

9.
	SELECT * FROM STUDENT_INFO
	WHERE EMAIL  LIKE '%3@G%'
	AND EMAIL LIKE '______'

10.
	SELECT*FROM STUDENT_INFO
	WHERE NAME LIKE 'F_R%'

11.
	SELECT * FROM STUDENT_INFO
	WHERE CONTACTNO LIKE '%877%'

12.
	SELECT NAME FROM STUDENT_INFO
	WHERE SEM=3
	AND CONTACTNO NOT LIKE '%[8,9]%'

13.
	SELECT *FROM STUDENT_INFO
	WHERE BIRTHDATE > '1990-01-01'

14.
	 UPDATE STUDENT_INFO
	 SET DIVISION='BCX-5', SEM=5
	 WHERE STUID=102
	 
	 SELECT * FROM STUDENT_INFO

15.
	UPDATE STUDENT_INFO SET NAME='FIROZ SHERASIYA'
	WHERE EMAIL='FIROZ.ME@GMAIL.COM' AND CONTACTNO=8885999922

	SELECT * FROM STUDENT_INFO

16.
	ALTER TABLE STUDENT_INFO ADD CITY VARCHAR(50)

17.
	DELETE FROM STUDENT_INFO
	WHERE DIVISION='BCX=3'

18.
	SP_RENAME 'STUDENT_INFO.EMAIL','EMAILADDRESS'

19.
	SELECT * INTO STUDENT_NEW FROM STUDENT_INFO

20.
	TRUNCATE TABLE STUDENT_INFO
	


	


	
	
	
		

	 




