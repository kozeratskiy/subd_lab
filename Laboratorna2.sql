CREATE TABLE Викладачі(
Код_викладача INTEGER NOT NULL,
Прізвище CHAR(20) NOT NULL,
[Ім'я] CHAR(20) NOT NULL,
[Ім'я_по_батькові] CHAR(20) NOT NULL, 
Електронна_пошта CHAR(20) NOT NULL, 
Номер_телефону INT NOT NULL,
Дата_народження DATE NOT NULL,
PRIMARY KEY (Код_викладача));

CREATE TABLE Аудиторії(
Код_аудиторії INTEGER NOT NULL,
Номер INT NOT NULL,
Корпус INT NOT NULL,
Поверх INT NOT NULL, 
Місткість INT NOT NULL, 
Тип CHAR(20) NOT NULL,
PRIMARY KEY (Код_аудиторії));

CREATE TABLE Групи(
Код_групи INTEGER NOT NULL,
Назва_групи CHAR(8) NOT NULL,
PRIMARY KEY (Код_групи));

CREATE TABLE Пари(
Код_пари INTEGER NOT NULL,
Початок_пари TIME NOT NULL,
Кінець_пари TIME NOT NULL,
PRIMARY KEY (Код_пари));

CREATE TABLE Предмети(
Код_предмета INTEGER NOT NULL,
Назва_предмета CHAR(40) NOT NULL,
PRIMARY KEY (Код_предмета));

CREATE TABLE Дні_тижня(
Код_дня_тижня INTEGER NOT NULL,
День_тижня CHAR(10) NOT NULL,
PRIMARY KEY (Код_дня_тижня));

CREATE TABLE Види_занять(
Код_виду_занять INTEGER NOT NULL,
Вид_занять CHAR(20) NOT NULL,
PRIMARY KEY (Код_виду_занять));

CREATE TABLE Семестри(
Код_семестру INTEGER NOT NULL,
Назва_семестру CHAR(20) NOT NULL,
Навчальний_рік YEAR NOT NULL,
PRIMARY KEY (Код_семестру));


CREATE TABLE Розклад(
Код_розкладу INTEGER NOT NULL,
Код_викладача INT NOT NULL,
Код_аудиторії INT NOT NULL,
Код_групи INT NOT NULL,
Код_пари INT NOT NULL,
Код_предмета INT NOT NULL,
Код_дня_тижня INT NOT NULL,
Код_виду_занять INT NOT NULL,
Код_семестру INT NOT NULL,
PRIMARY KEY (Код_розкладу),
CONSTRAINT ФКвикладач
FOREIGN KEY (Код_викладача) 
REFERENCES   Викладачі
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКаудиторія 
FOREIGN KEY (Код_аудиторії) 
REFERENCES   Аудиторії
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКгрупа
FOREIGN KEY (Код_групи) 
REFERENCES   Групи
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКпара
FOREIGN KEY (Код_пари) 
REFERENCES   Пари
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКпредмет
FOREIGN KEY (Код_предмета) 
REFERENCES   Предмети
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКдень_тижня
FOREIGN KEY (Код_дня_тижня) 
REFERENCES   Дні_тижня
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ФКвид_занять
FOREIGN KEY (Код_виду_занять) 
REFERENCES   Види_занять
ON DELETE CASCADE ON UPDATE CASCADE),
CONSTRAINT ФКсеместр
FOREIGN KEY (Код_семестру) 
REFERENCES   Семестри
ON DELETE CASCADE ON UPDATE CASCADE);
