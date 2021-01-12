/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba11]
  FROM [SUBD1].[dbo].[Laboratorna11]


CREATE 
TRIGGER викладачі_delete BEFORE DELETE 
ON викладачі FOR EACH ROW 
UPDATE розклад SET Код_викладача=5 
WHERE Код_викладача=OLD.Код_викладача;

DELETE FROM викладачі WHERE Код_викладача=8; 
SELECT * FROM розклад LIMIT 10, 5; 

CREATE 
TRIGGER викладачі2_пароль2 BEFORE INSERT 
ON викладачі2 FOR EACH ROW 
SET NEW.пароль = AES_ENCRYPT(NEW.пароль, 'key-key');

INSERT INTO викладачі2 VALUES

ALTER TABLE Предмети ADD COLUMN Клькість_пар int DEFAULT NULL;
CREATE TRIGGER кількість_пар AFTER INSERT 
ON розклад FOR EACH ROW 
UPDATE предмети 
SET Клькість_пар = (  SELECT x.c FROM (SELECT
Предмети.Код_предмета AS p, COUNT(Розклад.Код_предмета) as c
FROM розклад INNER JOIN предмети
where Розклад.Код_предмета = Предмети.Код_предмета 
GROUP BY Предмети.Назва_предмета) AS x where предмети.Код_предмета = x.p);

INSERT INTO розклад VALUES 
(NULL, '5', '3', '4', '2', '5', '1', '2'),
(NULL, '4', '4', '3', '3', '5', '2', '1'),
(NULL,'3', '5', '2', '4', '5', '3', '3');
SELECT * FROM предмети;

