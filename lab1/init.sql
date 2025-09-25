pragma foreign_keys = on;

create table delivery_service (
    id integer not null,
    name varchar(255) not null,
    price numeric not null,
    delivery_time numeric not null,
    primary key (id),
    check (price >= 0),
    check (delivery_time >= 0)
);

create table products (
    id integer not null,
    name varchar(255) not null,
    description varchar(255) default null,
    price numeric not null,
    category varchar(255) not null,
    manufacturer varchar(255) not null,
    rating integer not null,
    primary key (id),
    check (price >= 0),
    check (rating between 1 and 5)
);

create table users (
    id integer not null,
    name varchar(255) not null,
    surname varchar(255) default null,
    address varchar(255) default null,
    phone_number varchar(255) default null unique,
    email varchar(255) not null unique,
    sign_up_date date not null,
    access_level integer not null,
    primary key (id),
    check (email like '%@%.%'),
    check (access_level > 0)
);

create table orders (
    id integer not null,
    user_id integer not null,
    delivery_service_id integer not null,
    order_date date not null,
    status varchar(255) not null,
    total_price numeric not null,
    primary key (id),
    constraint orders_user_id_users_id_foreign foreign key (user_id) references users (id)
        on update cascade
        on delete cascade,
    constraint orders_delivery_service_id_delivery_service_id_foreign foreign key (delivery_service_id) references delivery_service (id)
        on update cascade
        on delete cascade,
    check (total_price >= 0),
    check (status in ('обрабатывается', 'в пути', 'доставлен'))
);

create table product_images (
    product_id integer not null,
    image_url varchar(255) not null,
    primary key (product_id),
    constraint product_images_product_id_products_id_foreign foreign key (product_id) references products (id)
        on update cascade
        on delete cascade
);

create table ordered_products (
    product_id integer not null,
    order_id integer not null,
    amount integer not null,
    total_price numeric not null,
    primary key (product_id, order_id),
    constraint ordered_products_product_id_products_id_foreign foreign key (product_id) references products (id)
        on update cascade
        on delete cascade,
    constraint ordered_products_order_id_orders_id_foreign foreign key (order_id) references orders (id)
        on update cascade
        on delete cascade,
    check (amount > 0 and total_price >= 0)
);
