/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba4]
  FROM [SUBD1].[dbo].[Laboratorna4]


INSERT INTO subd_labs.групи VALUES (1, 1, 'KH-101');

INSERT INTO subd_labs.групи 
VALUES (2, 2, 'KH-101'),
                 (3, 1, 'KH-201'),
                 (4, 2, 'KH-201');


LOAD DATA INFILE 'f:\аудиторії.tbl' 
INTO TABLE subd_labs.аудиторії LINES TERMINATED BY '\r\n';

LOAD DATA INFILE 'f:\дні_тижня.tbl' 
INTO TABLE subd_labs.дні_тижня LINES TERMINATED BY '\r\n';

UPDATE аудиторії SET Номер = 220 WHERE код_аудиторії = 1;
UPDATE аудиторії SET Код_аудиторії = Код_аудиторії + 1 
ORDER BY Код_аудиторії DESC;

DELETE FROM аудиторії WHERE (Місткість = 90 && Код_аудиторії !=2);