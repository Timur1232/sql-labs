-- тест 4

select * from delivery_service where id = 2;
select * from orders where delivery_service_id = 2;

update delivery_service set id = 300 where id = 2;

select '------------------------' as '';
select * from delivery_service where id in (2, 300);
select * from orders where delivery_service_id in (2, 300);

