CREATE OR REPLACE FUNCTION is_pensioner(gender char(1), birthday_date date)
    RETURNS VARCHAR(10) AS $$
DECLARE
    pension_age INTEGER;
    current_age INTEGER;
BEGIN

    current_age := EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthday_date));

    IF gender = 'м' THEN
        pension_age := 60;
    ELSE 
        pension_age := 55;
    END IF;

    IF current_age >= pension_age THEN
        RETURN 'пенсионер';
    ELSE
        RETURN '';
    END IF;

END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION calc_bonuses(base_salary INTEGER)
    RETURNS VOID AS $$
DECLARE
    employee RECORD;
    bonus_mult DECIMAL;
    bonus_size INTEGER;
    experience INTEGER;
BEGIN

    DELETE FROM bonuses;

    FOR employee IN
        SELECT
            e.full_name,
            e.gender,
            e.birthday_date,
            e.date_of_receipt,
            e.previous_experience,
            p.salary
        FROM employees AS e
        JOIN positions AS p on e.position = p.name
    LOOP

        experience := EXTRACT(YEAR FROM age(CURRENT_DATE, employee.date_of_receipt));

        CONTINUE WHEN experience < 1;

        IF experience > 30 THEN
            bonus_mult := 1.0;
        ELSIF experience >= 20 THEN
            bonus_mult := 0.5;
        ELSIF experience >= 10 THEN
            bonus_mult := 0.3;
        ELSIF experience >= 5 THEN
            bonus_mult := 0.2;
        ELSIF experience >= 1 THEN
            bonus_mult := 0.1;
        ELSE
            bonus_mult := 0.0;
        END IF;

        bonus_size := base_salary * bonus_mult * employee.salary;

        IF is_pensioner(employee.gender, employee.birthday_date) = 'пенсионер' THEN
            bonus_size := bonus_size / 2;
        END IF;

        INSERT INTO bonuses (full_name, experience, bonus_size, accrual_date)
            VALUES (employee.full_name, experience + employee.previous_experience, bonus_size, CURRENT_DATE);

    END LOOP;

END;
$$ LANGUAGE plpgsql;
