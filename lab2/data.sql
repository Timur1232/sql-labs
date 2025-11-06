\i delete_data.sql

INSERT INTO departments (sifer, department_name) VALUES
(NEXTVAL('department_sifer_gen'), 'Отдел разработки'),
(NEXTVAL('department_sifer_gen'), 'Отдел маркетинга'),
(NEXTVAL('department_sifer_gen'), 'Отдел кадров'),
(NEXTVAL('department_sifer_gen'), 'Бухгалтерия');

INSERT INTO positions (name, salary) VALUES
('Разработчик', 500000),
('Старший разработчик', 700000),
('Менеджер по маркетингу', 450000),
('HR-специалист', 400000),
('Бухгалтер', 420000),
('Директор', 1000000);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Иванов Иван Иванович', '123456789012', 'м', '1980-05-15', 1, 'Разработчик', '2015-03-10', 5),
(NEXTVAL('employee_personnel_number_gen'), 'Петрова Анна Сергеевна', '234567890123', 'ж', '1965-08-20', 2, 'Менеджер по маркетингу', '2010-07-15', 15),
(NEXTVAL('employee_personnel_number_gen'), 'Сидоров Петр Васильевич', '345678901234', 'м', '1990-12-03', 1, 'Старший разработчик', '2018-11-01', 3),
(NEXTVAL('employee_personnel_number_gen'), 'Козлова Мария Дмитриевна', '456789012345', 'ж', '1968-03-25', 3, 'HR-специалист', '2005-09-20', 10),
(NEXTVAL('employee_personnel_number_gen'), 'Смирнов Алексей Петрович', '567890123456', 'м', '1985-11-12', 4, 'Бухгалтер', '2020-01-15', 0),
(NEXTVAL('employee_personnel_number_gen'), 'Федорова Елена Викторовна', '678901234567', 'ж', '1958-07-30', 1, 'Директор', '2000-06-01', 20),
(NEXTVAL('employee_personnel_number_gen'), 'Николаев Дмитрий Олегович', '789012345678', 'м', '1995-02-14', 2, 'Менеджер по маркетингу', '2022-12-01', 0),
(NEXTVAL('employee_personnel_number_gen'), 'Васильев Геннадий Петрович', '890123456789', 'м', '1959-01-10', 1, 'Разработчик', '2018-06-15', 25);

INSERT INTO working_book (employee, department, position, date_of_receipt) VALUES
(1, 1, 'Разработчик', '2015-03-10'),
(2, 2, 'Менеджер по маркетингу', '2010-07-15'),
(3, 1, 'Старший разработчик', '2018-11-01'),
(4, 3, 'HR-специалист', '2005-09-20'),
(5, 4, 'Бухгалтер', '2020-01-15'),
(6, 1, 'Директор', '2000-06-01'),
(7, 2, 'Менеджер по маркетингу', '2022-12-01');
