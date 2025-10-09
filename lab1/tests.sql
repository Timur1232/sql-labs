.header on
.mode column
pragma foreign_keys = on;

-- тест 1
.read test-data.sql

select '============[тест 1]============' as '';
select * from users where id in (1, 2);
select '' as '';
select * from orders where user_id in (1, 2);
select '' as '';
select * from ordered_products where order_id in (select id from orders where user_id in (1, 2));

delete from users where id = 1;
select '============[после]============' as '';

select '' as '';
select * from users where id in (1, 2);
select '' as '';
select * from orders where user_id in (1, 2);
select '' as '';
select * from ordered_products where order_id in (select id from orders where user_id in (1, 2));

-- тест 2
.read test-data.sql

select '============[тест 2]============' as '';
select * from users where id = 2;
select '' as '';
select * from orders where user_id = 2;

update users set id = 200 where id = 2;
select '============[после]============' as '';

select '' as '';
select * from users where id in (2, 200);
select '' as '';
select * from orders where user_id in (2, 200);

-- тест 3
.read test-data.sql

select '============[тест 3]============' as '';
select * from delivery_service where id in (1, 2);
select '' as '';
select * from orders where delivery_service_id in (1, 2);

delete from delivery_service where id = 1;
select '============[после]============' as '';

select '' as '';
select * from delivery_service where id in (1, 2);
select '' as '';
select * from orders where delivery_service_id in (1, 2);

-- тест 4
.read test-data.sql

select '============[тест 4]============' as '';
select * from delivery_service where id = 2;
select '' as '';
select * from orders where delivery_service_id = 2;

update delivery_service set id = 300 where id = 2;
select '============[после]============' as '';

select '' as '';
select * from delivery_service where id in (2, 300);
select '' as '';
select * from orders where delivery_service_id in (2, 300);

-- тест 5
.read test-data.sql

select '============[тест 5]============' as '';
select * from products where id in (4, 5);
select '' as '';
select * from product_images where product_id in (4, 5);
select '' as '';
select * from ordered_products where product_id in (4, 5);

delete from products where id = 4;
select '============[после]============' as '';

select '' as '';
select * from product_images where product_id in (4, 5);
select '' as '';
select * from ordered_products where product_id in (4, 5);

-- тест 6
.read test-data.sql

select '============[тест 6]============' as '';
select * from products where id = 5;
select '' as '';
select * from product_images where product_id = 5;
select '' as '';
select * from ordered_products where product_id = 5;

update products set id = 500 where id = 5;
select '============[после]============' as '';

select '' as '';
select * from products where id in (5, 500);
select '' as '';
select * from product_images where product_id in (5, 500);
select '' as '';
select * from ordered_products where product_id in (5, 500);

-- тест 7
.read test-data.sql

select '============[тест 7]============' as '';
select * from orders where id in (3, 6);
select '' as '';
select * from ordered_products where order_id in (3, 6);

delete from orders where id = 3;
select '============[после]============' as '';

select '' as '';
select * from orders where id in (3, 6);
select '' as '';
select * from ordered_products where order_id in (3, 6);

-- тест 8
.read test-data.sql

select '============[тест 8]============' as '';
select * from orders where id = 6;
select '' as '';
select * from ordered_products where order_id = 6;

update orders set id = 600 where id = 6;
select '============[после]============' as '';

select '' as '';
select * from orders where id in (6, 600);
select '' as '';
select * from ordered_products where order_id in (6, 600);
