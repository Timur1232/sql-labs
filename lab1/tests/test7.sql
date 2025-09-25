-- тест 7

select * from orders where id in (3, 6);
select * from ordered_products where order_id in (3, 6);

delete from orders where id = 3;

select '------------------------' as '';
select * from orders where id in (3, 6);
select * from ordered_products where order_id in (3, 6);

