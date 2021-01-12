/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba9]
  FROM [SUBD1].[dbo].[Laboratorna9]


SELECT Дні_тижня.День_тижня AS День_тижня,
COUNT(Розклад.Код_викладача) AS пари 
FROM (розклад INNER JOIN викладачі) 
INNER JOIN дні_тижня ON Розклад.Код_викладача = Викладачі.Код_викладача 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
GROUP BY Дні_тижня.День_тижня; 

SELECT YEAR(Дата_народження) AS Рік, MONTHNAME(Дата_народження) AS Місяць, COUNT(імя) AS Викладачі 
FROM викладачі GROUP BY Рік, Місяць WITH ROLLUP;

SELECT Прізвище AS user, AVG(CHAR_LENGTH(Прізвище)) AS avgmessage 
FROM Викладачі INNER JOIN Розклад 
ON Викладачі.Код_викладача = Розклад.Код_викладача 
GROUP BY user;

SELECT Прізвище,(COUNT(DISTINCT Розклад.Код_розкладу) *2) AS Рейтинг 
FROM (Розклад INNER JOIN Викладачі) INNER JOIN Дні_тижня 
ON Викладачі.Код_викладача = Розклад.Код_викладача 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
where Розклад.Код_дня_тижня > 2 AND Розклад.Код_дня_тижня < 6
GROUP BY Прізвище ORDER BY Рейтинг DESC LIMIT 1;
