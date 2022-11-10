DROP TABLE wоrkers, departments;


CREATE TABLE wоrkers (
	ID 						Serial,
    ФИО          		  varchar(80),
    Дата_рождения 			 date,       
    Дата_начала_работы         date,           
    Должность          			  varchar(20),         
    Уровень_сотрудника           varchar(6),
	Уровень_зарплаты			real,
	Идентификатор_отдела		 Integer,
	Наличие_отсутствие_прав		boolean,
	PRIMARY KEY (ID)
	--FOREIGN KEY (Идентификатор_отдела) REFERENCES departments (Id)
);

INSERT INTO wоrkers (
	ФИО, 
	Дата_рождения, 
	Дата_начала_работы, 
	Должность, 
	Уровень_сотрудника,
	Уровень_зарплаты,
	Идентификатор_отдела,
	Наличие_отсутствие_прав) VALUES
    ('Иванов Иван Иванович', '2000-01-02', '2020-01-02', 'программист', 'middle', 51000, 051, False),
    ('Петров Иван Иванович', '1995-10-05', '2015-01-02', 'менеджер', ' lead', 75000, 031, True),
    ('Иванов Петр Иванович', '1999-08-04', '2020-01-02', 'программист', 'middle', 55000, 051, False);
	
CREATE TABLE departments (
	ID Serial PRIMARY KEY,
	Идентификатор_отдела		Integer,
	Название_отдела				varchar(40),
    ФИО_руководителя   		  varchar(80),
	Количество_сотрудников		Integer
	--FOREIGN KEY (Идентификатор_отдела) REFERENCES wоrkers (Идентификатор_отдела)
);	
	
INSERT INTO departments (
	Идентификатор_отдела,
	Название_отдела,
    ФИО_руководителя,
	Количество_сотрудников) VALUES
    (051, 'IT-отдел', 'Сидоров Иван Иванович', 5),
    (031, 'Отдел продаж', 'Сотников Петр Петрович', 7);
	
   	
	--SELECT * FROM wоrkers;
	SELECT * FROM departments;
	--CREATE TABLE grade AS SELECT ID, ФИО FROM wоrkers;
	--ALTER TABLE grade ADD grade_id varchar(1);
	--INSERT INTO grade (grade_id) VALUES ('A'),('C'),('E');
	--UPDATE grade SET grade_id = 'A';
	--SELECT * FROM grade;