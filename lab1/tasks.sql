select '6:' as '';
-- 6
select
    o.id as order_id,
    o.total_price as subtotal,
    ds.price as delivery_cost,
    o.total_price * 0.9 as with_10_percent_discount,
    ds.price * 0.9 as dilivery_with_10_percent_discount,
    o.total_price + ds.price as total_with_delivery,
    (o.total_price + ds.price) * 0.9 as final_price_with_discount
from orders o
join delivery_service ds on o.delivery_service_id = ds.id;

select '7:' as '';
-- 7
select
    category,
    count(*) as product_count,
    avg(price) as avg_price,
    avg(price * 1.1) as avg_price_with_10p_increase
from products;

select '8:' as '';
-- 8
select 
    o.status,
    ds.name as delivery_service,
    avg(o.total_price) as avg_order_value,
    sum(o.total_price) as total_revenue
from orders o
join delivery_service ds on o.delivery_service_id = ds.id
group by o.status;

select '9:' as '';
-- 9
select 
    u.name,
    count(o.id) as order_count,
    sum(o.total_price) as total_spent
from users u
join orders o on u.id = o.user_id
group by u.id, u.name, u.surname
having count(o.id) >= 2 and sum(o.total_price) > 100;

select '11:' as '';
-- 11
select 
    u.name,
    u.address,
    o.id as order_id,
    o.total_price,
    o.status,
    ds.name as delivery_service
from users u
join orders o on u.id = o.user_id
join delivery_service ds on o.delivery_service_id = ds.id
where u.access_level >= 2;

select '12:' as '';
-- 12
select
    u.id as user_id,
    u.name,
    u.surname,
    u.email
from users u
where not exists (
    select 1
    from orders o
    where not exists (
        select 1
        from users ui
        join orders oi on oi.user_id = ui.id
        where ui.id = u.id
        and oi.status = o.status
    )
);

select '13:' as '';
-- 13
select
    u.sign_up_date as date
from users u
where u.access_level >= 2 and u.email like '%@gmail.com'
union
select
    o.order_date as date
from orders o
where o.status = 'доставлен' and o.total_price > 100;

select '14:' as '';
-- 14
select
    u.id as user_id,
    u.name,
    u.surname,
    u.email
from users u
where not exists (
    select 1
    from products p
    where p.category = 'одежда'
    and not exists (
        select 1
        from ordered_products op
        join orders o on op.order_id = o.id
        where o.user_id = u.id
        and op.product_id = p.id
    )
);

select '15:' as '';
-- 15
select
    p.name as product_name,
    p.price as product_price,
    p.category as product_category
from products p
where p.id not in (
    select id
    from products
    where rating < 3 or manufacturer = 'Sony'
);


