--Users
create sequence user_seq start 1 increment 1;

create table users (
                        id int8 not null,
                        archive boolean not null,
                        email varchar(255),
                        name varchar(255),
                        password varchar(255),
                        role varchar(255),
--                         bucket_id int8,
                        primary key (id)
                   );

-- alter table if exists users
--     add constraint users_fk_buckets
--         foreign key (bucket_id) references buckets;

--Bucket
create sequence bucket_seq start 1 increment 1;

create table buckets (
                        id int8 not null,
                        user_id int8,
                        primary key (id)
                     );

--Link between bucket and user
alter table if exists buckets
    add constraint buckets_fk_user
    foreign key (user_id) references users;

--Category
create sequence category_seq start 1 increment 1;

create table categories (
                        id int8 not null,
                        title varchar(255),
                        primary key (id)
                        );

--Products
create sequence product_seq start 1 increment 1;

create table products (
                        id int8 not null,
                        price numeric(19, 2),
                        title varchar(255),
                        primary key (id)
                      );

--Category and products
create table products_categories (
                        product_id int8 not null,
                        category_id int8 not null
                                 );

alter table if exists products_categories
    add constraint products_categories_fk_category
        foreign key (category_id) references categories;

alter table if exists products_categories
    add constraint products_categories_fk_product
        foreign key (product_id) references products;

--Products in bucket
create table buckets_products (
                        bucket_id int8 not null,
                        product_id int8 not null
                              );

alter table if exists buckets_products
    add constraint bucket_products_fk_product
        foreign key (product_id) references products;

alter table if exists buckets_products
    add constraint bucket_products_fk_bucket
        foreign key (bucket_id) references buckets;

--Orders
create sequence order_seq start 1 increment 1;

create table orders (
                        id int8 not null,
                        address varchar(255),
                        created timestamp,
                        status varchar(255),
                        sum numeric(19, 2),
                        updated timestamp,
                        user_id int8,
                        primary key (id)
--                         id int8 not null,
--                         address varchar(255),
--                         changed timestamp,
--                         created timestamp,
--                         status varchar(255),
--                         sum numeric(19, 2),
--                         user_id int8,
--                         primary key (id)
                    );

alter table if exists orders
    add constraint orders_fk_user
        foreign key (user_id) references users;

--Details of order
create sequence order_details_seq start 1 increment 1;

create table orders_details (
                        id int8 not null,
                        amount numeric(19, 2),
                        price numeric(19, 2),
                        order_id int8,
                        product_id int8,
                        details_id int8 not null,
                        primary key (id)
--                         id int8 not null,
--                         order_id int8 not null,
--                         product_id int8 not null,
--                         amount numeric(19, 2),
--                         price numeric(19, 2),
--                         primary key (id)
                            );

-- alter table if exists orders_details
--     add constraint order_details_fk
--         unique (details_id);

alter table if exists orders_details
    add constraint orders_details_fk_order
        foreign key (order_id) references orders;

alter table if exists orders_details
    add constraint orders_details_fk_product
        foreign key (product_id) references products;

-- alter table if exists orders_details
--     add constraint orders_details_fk_orders_details
--         foreign key (details_id) references orders_details;
