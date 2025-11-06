DELETE FROM bonuses;
DELETE FROM working_book;
DELETE FROM employees;
DELETE FROM positions;
DELETE FROM departments;

ALTER SEQUENCE department_sifer_gen RESTART WITH 1;
ALTER SEQUENCE employee_personnel_number_gen RESTART WITH 1;
