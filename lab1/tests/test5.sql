-- тест 5

select * from products where id in (4, 5);
select * from product_images where product_id in (4, 5);
select * from ordered_products where product_id in (4, 5);

delete from products where id = 4;

select '------------------------' as '';
select * from product_images where product_id in (4, 5);
select * from ordered_products where product_id in (4, 5);

