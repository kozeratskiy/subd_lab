/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba11]
  FROM [SUBD1].[dbo].[Laboratorna11]


START TRANSACTION; 
INSERT INTO розклад 
    VALUE (NULL, 8, 4, 4, 2, 3, 2, 4);
INSERT INTO розклад 
    VALUE (NULL, 8, 3, 1, 5, 1, 1, 2); 
INSERT INTO розклад
    VALUE (NULL, 8, 1, 2, 4, 2, 4, 1); 
INSERT INTO розклад
    VALUE (NULL, 8, 2, 3, 1, 4, 5, 3);
COMMIT;

INSERT INTO викладачі 
VALUES 
(NULL, 'Осійчук', 'Сергій', 'Владиславович', 'mail_7@gmail.com', 961233324, '1979-04-12'),
(NULL, 'Лазарець', 'Олександр', 'Ігорович', 'mail_8@gmail.com', 961233982, '1950-09-22');
START TRANSACTION; 
INSERT INTO розклад 
    VALUE (NULL, 8, 4, 4, 2, 3, 2, 4);
INSERT INTO розклад 
    VALUE (NULL, 8, 3, 1, 5, 1, 1, 2); 
INSERT INTO розклад
    VALUE (NULL, 8, 1, 2, 4, 2, 4, 1); 
INSERT INTO розклад
    VALUE (NULL, 8, 2, 3, 1, 4, 5, 3);
COMMIT;

SELECT * FROM розклад LIMIT 10, 4;
