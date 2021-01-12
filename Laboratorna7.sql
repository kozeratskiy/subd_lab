/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba8]
  FROM [SUBD1].[dbo].[Laboratorna8]

SELECT Код_викладача, Прізвище, Імя 
FROM Викладачі WHERE Прізвище LIKE '%а%' 
ORDER BY Прізвище ASC;

SELECT Прізвище, Імя, Дата_народження
FROM Викладачі ORDER BY Дата_народження DESC;

SELECT Дні_тижня.День_тижня, Викладачі.Прізвище, Викладачі.Імя 
FROM (розклад INNER JOIN викладачі) 
INNER JOIN дні_тижня ON Розклад.Код_викладача = Викладачі.Код_викладача 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня;

SELECT Дні_тижня.День_тижня, Викладачі.Прізвище, Викладачі.Імя
FROM (розклад INNER JOIN викладачі) 
INNER JOIN дні_тижня ON Розклад.Код_викладача = Викладачі.Код_викладача 
AND Розклад.Код_дня_тижня = Дні_тижня.Код_дня_тижня
GROUP BY Дні_тижня.День_тижня;
