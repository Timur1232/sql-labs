select '------------------------' as '';
select '' as '';
select * from products where id in (4, 5);
select '' as '';
select * from product_images where product_id in (4, 5);
select '' as '';
select * from ordered_products where product_id in (4, 5);

delete from products where id = 4;

select '' as '';
select '------------------------' as '';
select * from product_images where product_id in (4, 5);
select '' as '';
select * from ordered_products where product_id in (4, 5);

select '------------------------' as '';
-- тест 6


select * from products where id = 5;
select * from product_images where product_id = 5;
select * from ordered_products where product_id = 5;

update products set id = 500 where id = 5;

select * from products where id in (5, 500);
select * from product_images where product_id in (5, 500);
select * from ordered_products where product_id in (5, 500);

