\i delete_data.sql

INSERT INTO departments (sifer, department_name) VALUES
(NEXTVAL('department_sifer_gen'), 'Отдел разработки'),
(NEXTVAL('department_sifer_gen'), 'Отдел маркетинга'),
(NEXTVAL('department_sifer_gen'), 'Отдел кадров');

INSERT INTO positions (name, salary) VALUES
('Разработчик', 500000),
('Старший разработчик', 700000),
('Менеджер по маркетингу', 450000),
('HR-специалист', 400000),
('Директор', 1000000);

-- тест 1: tr_verify_employee

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Иванов Иван Иванович', '123456789012', 'м', '1990-05-15', 1, 'Разработчик', '2020-03-10', 3),
(NEXTVAL('employee_personnel_number_gen'), 'Петрова Анна Сергеевна', '234567890123', 'ж', '1985-08-20', 2, 'Менеджер по маркетингу', '2019-07-15', 5);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Некорректный ИИН', '12345678901A', 'м', '1990-01-01', 1, 'Разработчик', '2020-01-01', 0);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Короткий ИИН', '12345678901', 'м', '1990-01-01', 1, 'Разработчик', '2020-01-01', 0);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Молодой Сотрудник', '345678901234', 'м', CURRENT_DATE - INTERVAL '15 years', 1, 'Разработчик', CURRENT_DATE, 0);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Будущий Сотрудник', '456789012345', 'ж', '1990-01-01', 1, 'Разработчик', CURRENT_DATE + INTERVAL '10 days', 2);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Отрицательный Опыт', '567890123456', 'м', '1990-01-01', 1, 'Разработчик', '2020-01-01', -1);

INSERT INTO employees (personnel_number, full_name, IIN, gender, birthday_date, department, position, date_of_receipt, previous_experience) VALUES
(NEXTVAL('employee_personnel_number_gen'), 'Без Даты Приема', '678901234567', 'ж', '1990-01-01', 1, 'Разработчик', NULL, 2);

SELECT personnel_number, full_name, iin, birthday_date, date_of_receipt FROM employees;

-- тест 2: tr_record_position

UPDATE employees 
SET position = 'Старший разработчик'
WHERE full_name = 'Иванов Иван Иванович';

UPDATE employees 
SET position = 'HR-специалист'
WHERE full_name = 'Петрова Анна Сергеевна';

UPDATE employees 
SET position = 'Директор'
WHERE full_name = 'Петрова Анна Сергеевна';

UPDATE employees 
SET position = 'Старший разработчик'
WHERE full_name = 'Иванов Иван Иванович';

SELECT personnel_number, full_name, position FROM employees;
SELECT * FROM working_book;
