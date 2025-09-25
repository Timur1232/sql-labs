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
