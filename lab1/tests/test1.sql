-- тест 1

select * from users where id in (1, 2);
select * from orders where user_id in (1, 2);
select * from ordered_products where order_id in (select id from orders where user_id in (1, 2));

delete from users where id = 1;

select '------------------------' as '';
select * from users where id in (1, 2);
select * from orders where user_id in (1, 2);
select * from ordered_products where order_id in (select id from orders where user_id in (1, 2));

