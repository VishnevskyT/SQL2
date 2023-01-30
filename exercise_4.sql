CREATE DATABASE HR_depart;				-- Спроектируйте базу данных для системы отдела кадров

USE HR_depart;

DROP TABLE general;

CREATE TABLE general
(
id INT AUTO_INCREMENT NOT NULL,
last_name VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
tel VARCHAR(12) NOT NULL,
PRIMARY KEY(id)
);

SELECT * FROM general;

DROP TABLE salary_payments;


CREATE TABLE salary_payments
(
employee_id INT NOT NULL UNIQUE,
month INT NOT NULL,
salary DOUBLE NOT NULL,
payment_date DATE DEFAULT(CURRENT_DATE),
bonus INT DEFAULT 0,
tax_payment TINYINT DEFAULT 0, 						-- 0 - податки не сплачені, 1 - податки сплачені.
FOREIGN KEY(employee_id) REFERENCES general(id)
);

SELECT * FROM salary_payments;

DROP TABLE full_data;

CREATE TABLE full_data
(
employee_id INT NOT NULL UNIQUE,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
middle_name VARCHAR(50),
passport_data TEXT(200) NOT NULL,
inn VARCHAR(20),
department VARCHAR(20),
position VARCHAR(30) NOT NULL,
since DATE NOT NULL DEFAULT(CURRENT_DATE),
degree VARCHAR(100),
FOREIGN KEY(employee_id) REFERENCES general(id),
PRIMARY KEY (employee_id)
);

SELECT * FROM full_data;


