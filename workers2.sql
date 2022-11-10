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
	Идентификатор_отдела_id		Integer,
	Название_отдела				varchar(40),
    ФИО_руководителя   		  varchar(80),
	Количество_сотрудников		Integer
	--FOREIGN KEY (Идентификатор_отдела_id) REFERENCES wоrkers (Идентификатор_отдела)
);	
	
INSERT INTO departments (
	Идентификатор_отдела_id,
	Название_отдела,
    ФИО_руководителя,
	Количество_сотрудников) VALUES
    (051, 'IT-отдел', 'Сидоров Иван Иванович', 3),
    (031, 'Отдел продаж', 'Сотников Петр Петрович', 2);
	
   	
	--SELECT * FROM wоrkers;
	--SELECT * FROM departments;
	--SELECT ФИО, Уровень_зарплаты FROM wоrkers WHERE Уровень_зарплаты > ANY(SELECT avg(Уровень_зарплаты) FROM wоrkers);
	--SELECT ФИО FROM wоrkers ORDER BY ФИО;
	--SELECT ФИО, Название_отдела FROM wоrkers, departments WHERE Идентификатор_отдела=Идентификатор_отдела_id;
	
	SELECT ФИО, Уровень_зарплаты, Название_отдела 
	FROM wоrkers, departments outerr
	WHERE Уровень_зарплаты>
	(SELECT AVG(Уровень_зарплаты) 
	FROM wоrkers, departments 
	WHERE Идентификатор_отдела = outerr.Идентификатор_отдела_id);