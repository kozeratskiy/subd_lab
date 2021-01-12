/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba5]
  FROM [SUBD1].[dbo].[Laboratorna5]


SELECT * FROM subd_labs.аудиторії1;
SELECT * FROM subd_labs.аудиторії2;

SELECT * FROM subd_labs.аудиторії1 
    UNION SELECT * FROM subd_labs.аудиторії2

SELECT * FROM subd_labs.аудиторії1 
	WHERE код_аудиторії IN (SELECT код_аудиторії FROM subd_labs.аудиторії2);

SELECT * FROM subd_labs.аудиторії2 
    WHERE код_аудиторії NOT IN 
        (SELECT код_аудиторії FROM subd_labs.аудиторії1);

SELECT * FROM subd_labs.аудиторії1, subd_labs.аудиторії2;