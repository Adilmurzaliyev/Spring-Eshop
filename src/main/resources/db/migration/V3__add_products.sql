insert into products (id, price, title)
values (1, 450.0, 'Apple'),
       (2, 250.0, 'Milk'),
       (3, 180.0, 'Bread'),
       (4, 3500.0, 'Meet'),
       (5, 3000.0, 'Cheese'),
       (6, 750.0, 'Orange');

alter sequence product_seq restart with 7;
