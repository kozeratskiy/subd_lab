/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba13]
  FROM [SUBD1].[dbo].[Laboratorna13]


SHOW INDEX FROM Розклад;

CREATE INDEX викладачіINDX3 ON викладачі (Код_викладача, Прізвище, Імя); 
SHOW INDEX FROM Викладачі

CREATE UNIQUE INDEX аудиторії_indx ON аудиторії (Код_аудиторії, Номер, Корпус); 
SHOW INDEX FROM аудиторії;

EXPLAIN SELECT Предмети.Назва_предмета AS Предмет,
COUNT(Розклад.Код_предмета) AS Кількість_пар 
FROM (розклад INNER JOIN предмети) 
INNER JOIN дні_тижня ON Розклад.Код_предмета = Предмети.Код_предмета 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
WHERE Розклад.Код_дня_тижня >= 2 AND Розклад.Код_дня_тижня <= 5 
GROUP BY Предмети.Назва_предмета;  

EXPLAIN SELECT STRAIGHT_JOIN Предмети.Назва_предмета AS Предмет,
COUNT(Розклад.Код_предмета) AS Кількість_пар 
FROM (розклад INNER JOIN предмети) 
INNER JOIN дні_тижня ON Розклад.Код_предмета = Предмети.Код_предмета 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
WHERE Розклад.Код_дня_тижня >= 2 AND Розклад.Код_дня_тижня <= 5 
GROUP BY Предмети.Назва_предмета; 