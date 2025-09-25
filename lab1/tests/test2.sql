-- тест 2

select * from users where id = 2;
select * from orders where user_id = 2;

update users set id = 200 where id = 2;

select '------------------------' as '';
select * from users where id in (2, 200);
select * from orders where user_id in (2, 200);

