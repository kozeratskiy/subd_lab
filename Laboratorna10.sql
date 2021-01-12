/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba10]
  FROM [SUBD1].[dbo].[Laboratorna10]


CREATE FUNCTION pass_encode (пароль CHAR(20)) 
RETURNS TINYBLOB 
RETURN AES_ENCRYPT(пароль , 'key-key');
    
CREATE FUNCTION pass_decode (пароль TINYBLOB) 
RETURNS CHAR(20) 
RETURN AES_DECRYPT(пароль, 'key-key');

DELIMITER //
CREATE PROCEDURE para_count (IN День1 INT, IN День2 INT) 
BEGIN
DECLARE error CHAR; 
SET error = 'Некоректно задані дні тижня '; 
IF (День1<=День2) THEN 
BEGIN
	CREATE TABLE IF NOT EXISTS subd_labs.Статистика_пар (Назва_предмета CHAR(40), Кількісь_пар INT UNSIGNED); 
TRUNCATE subd_labs.Статистика_пар; 
INSERT INTO subd_labs.Статистика_пар 
SELECT Предмети.Назва_предмета AS Предмет,
COUNT(Розклад.Код_предмета) AS Кількість_пар 
FROM (розклад INNER JOIN предмети) 
INNER JOIN дні_тижня ON Розклад.Код_предмета = Предмети.Код_предмета 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
WHERE Розклад.Код_дня_тижня >= День1 AND Розклад.Код_дня_тижня <= День2 
GROUP BY Предмети.Назва_предмета;         
END;
ELSE SELECT error; 
END IF; 
END//
DELIMITER ;

SELECT Прізвище, Імя, pass_decode(Пароль) as Пароль FROM Викладачі2;

CALL para_count( 2, 5 ); 
SELECT * FROM Статистика_пар;

CALL para_count( 4, 1 ); 