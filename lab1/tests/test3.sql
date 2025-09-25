-- тест 3

select * from delivery_service where id in (1, 2);
select * from orders where delivery_service_id in (1, 2);

delete from delivery_service where id = 1;

select '------------------------' as '';
select * from delivery_service where id in (1, 2);
select * from orders where delivery_service_id in (1, 2);

