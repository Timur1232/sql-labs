SELECT full_name, birthday_date, gender, is_pensioner(gender, birthday_date) as pension_status 
FROM employees;
