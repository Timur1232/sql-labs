-- тест 8

select * from orders where id = 6;
select * from ordered_products where order_id = 6;

update orders set id = 600 where id = 6;

select '------------------------' as '';
select * from orders where id in (6, 600);
select * from ordered_products where order_id in (6, 600);
