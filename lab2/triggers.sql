-- 1. Проверка значений всех полей отношения «Сотрудники», для которых могут быть
-- определены домены (в т.ч., ИНН может содержать только цифры, а дата поступления на работу
-- должна быть не больше текущей даты). Если при вводе данных дата поступления не указана,
-- устанавливать текущую дату.

CREATE OR REPLACE FUNCTION verify_employee()
    RETURNS TRIGGER AS $$
BEGIN

    IF NEW.IIN !~ '^[0-9]{12}$' THEN
        RAISE NOTICE 'ИИН должен содержать только 12 цифр: %', NEW.IIN;
        RETURN NULL;
    END IF;

    IF EXTRACT(YEAR FROM AGE(CURRENT_DATE, NEW.birthday_date)) < 16 THEN
        RAISE NOTICE 'сотрудник должен быть старше 16 лет: %', NEW.birthday_date;
        RETURN NULL;
    END IF;

    IF NEW.previous_experience < 0 THEN
        RAISE NOTICE 'стаж на предыдущих позициях должен быть положительным: %', NEW.previous_experience;
        RETURN NULL;
    END IF;

    IF NEW.date_of_receipt > CURRENT_DATE THEN
        RAISE NOTICE 'дата подачи заявления должна быть меньше текущей: %', NEW.date_of_receipt;
        RETURN NULL;
    END IF;

    IF NEW.date_of_receipt IS NULL THEN
        RAISE NOTICE 'отсутствует дата подачи заявления - вставляется текущая дата: %', CURRENT_DATE;
        NEW.date_of_receipt := CURRENT_DATE;
    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_verify_employee
    BEFORE INSERT ON employees
    FOR EACH ROW
    EXECUTE PROCEDURE verify_employee();


-- 2. Формирование таблицы «Трудовая книжка»: при изменении занимаемой должности в
-- таблице «Сотрудники», предыдущая должность добавляется в таблицу «Трудовая книжка» с
-- указанием даты начала работы в этой должности (старое значение даты вступления в должность
-- из таблицы «Сотрудники»).

CREATE OR REPLACE FUNCTION record_position()
    RETURNS TRIGGER AS $$
BEGIN

    IF NEW.position = OLD.position THEN
        RAISE NOTICE 'должность должна отличаться: new = %, old = %', NEW.position, OLD.position;
        RETURN NULL;
    END IF;

    INSERT INTO working_book (
        employee,
        department,
        position,
        date_of_receipt
    ) VALUES (
        OLD.personnel_number,
        OLD.department,
        OLD.position,
        OLD.date_of_receipt
    );

    NEW.date_of_receipt := CURRENT_DATE;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_record_position
    BEFORE UPDATE ON employees
    FOR EACH ROW
    EXECUTE PROCEDURE record_position();
