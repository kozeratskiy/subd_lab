/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Laba3]
  FROM [SUBD1].[dbo].[Laboratorna3]


ALTER TABLE subd_labs.розклад
    DROP FOREIGN KEY ФКвид_занять,
    DROP INDEX ФКвид_занять;

SHOW INDEX FROM РОЗКЛАД, та SHOW CREATE TABLE РОЗКЛАД.

ALTER TABLE subd_labs.розклад
    DROP COLUMN Код_пари,
    MODIFY COLUMN Код_виду_занять INT(22) NULL;

ALTER TABLE subd_labs.аудиторії
    MODIFY COLUMN Поверх CHAR(60) NULL;

ALTER TABLE subd_labs.групи
    MODIFY Код_групи INT(32) UNSIGNED NOT NULL, 
    ADD COLUMN Код_підгрупи TINYINT(8) UNSIGNED NOT NULL AFTER Код_групи, 
	ADD CONSTRAINT UNIQUE Обєн_код_групи (Код_групи, Код_підгрупи);

ALTER TABLE subd_labs.розклад
    DROP FOREIGN KEY ФКпара, 
    ADD CONSTRAINT ФКпараа FOREIGN KEY (Код_пари) 
    REFERENCES subd_labs.пари (Код_пари) ON DELETE CASCADE

SHOW CREATE TABLE РОЗКЛАД







