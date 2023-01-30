CREATE DATABASE warehouse;			-- Спроектируйте базу данных для оптового склада, у которого есть поставщики товаров, персонал, постоянные заказчики. Поля таблиц продумать самостоятельно.

USE warehouse;

DROP TABLE suppliers;

CREATE TABLE suppliers
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (100) NOT NULL,
contact_person VARCHAR (100) NOT NULL,
email VARCHAR (40) NOT NULL UNIQUE,
phone VARCHAR (15) NOT NULL UNIQUE,
products VARCHAR(100) NOT NULL,
bank_details TEXT (500) NOT NULL,
payments_history TEXT,
since DATE DEFAULT(CURRENT_DATE),
notes TEXT (1000)
);

SELECT * FROM suppliers;

INSERT INTO suppliers
(name, contact_person, email, phone, products, bank_details, payments_history, since, notes)
VALUES
('ТОВ "ІМПОРТЕР ЛТД"', 'Відьма Лариса Петрівна', 'pink_rabbit666@gmail.com', '(099)001-00-22', 'vines, cheese, etc', 'НАДРА БАНК, IBAN 0043354543525435b3454 (можна на карту Привата', 'ще не платили', CURRENT_DATE(), 'Писати у Viber. !!!Лише по передплаті!!!'),
('ТОВ "КОДЕР ІНК."', 'Денис (директор)', 'den_den@ukr.туе', '(066)333-13-13', 'PC, devices', 'ПРИВАТ БАНК, IBAN 0043354543543543454', 'боргів немає', CURRENT_DATE(), '');

UPDATE suppliers
SET notes = 'Направити акти за грудень 2022'
WHERE name = 'ТОВ "КОДЕР ІНК."';

DROP TABLE staff;

CREATE TABLE staff
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
contacts TEXT(1000) NOT NULL,
position VARCHAR(70) NOT NULL,
birthday DATE,
salary INT DEFAULT 0,
vacation TINYINT DEFAULT 0					-- 0 - в обоймі; 	1 - у відпусці;
);

INSERT INTO staff
(name, contacts, position, birthday, salary, vacation)
VALUES
('Вася', '050-006-66-66 ( + Viber), Kyiv', 'вантажник', '1988-01-02', 6000, 0),
('Микита Петрович', '060-713-21-85, mykyta_petya@ukr.net, з Миронівки', 'охоронець', '1978-09-30', 7000, 0),
('Макс', '063-713-21-85, maximum@gmail.net, Kyiv', 'менеджер', '1992-08-14', 17000, 0),
('Мін', '097-713-21-85, minimum@mail.net, Lviv', 'топ-менеджер', '1991-07-08', 18000, 0);

SELECT * FROM staff;

DROP TABLE clients;

CREATE TABLE clients
(
id INT AUTO_INCREMENT NOT NULL,
manager_id INT NOT NULL,
name VARCHAR (100) NOT NULL, 
email VARCHAR (40) NOT NULL,
phone VARCHAR (15) NOT NULL,
discounts TINYINT DEFAULT 0,
notes TEXT (1000),
FOREIGN KEY(manager_id) REFERENCES staff(id),
PRIMARY KEY(id)
);

INSERT INTO clients
(manager_id, name, email, phone, discounts, notes)
VALUES
('3', 'Rozetka', 'info@rozetka.com.ua', '044-505-00-55', 15, ''),
('4', 'AUCHAN', 'sales@auchan.ua', '044-135-11-11', 10, 'Слава Україні'),
('4', 'METRO', 'sales@metro.ua', '044-111-11-11', 10, 'Зустріч о 15:00');


SELECT * FROM clients;
