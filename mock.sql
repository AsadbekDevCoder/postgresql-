
insert into categories (name) values ('Milliy Taomlar'), ('Yevropa taomlar'), ('Turk taomlari');

insert into types (name) values ('Quyuq ovqatlar'), ('Suyuq ovqatlar'), ('Ichimliklar'), ('Shirinliklar'), ('Salatlar');

insert into type_register (category_id, type_id) values (1, 1), (1, 2), (1, 3), (1, 5);

insert into type_register (category_id, type_id) values (2, 4);
insert into type_register (category_id, type_id) values (3, 3);
insert into type_register (category_id, type_id) values (3, 4);

select
    t.name
from 
    type_register as r
natural join 
    types as t
where 
    r.category_id = 3
;


insert into products (name, price, type_register_id) values ('Osh', 18000, 1), ('Lag''mon', 12000, 1), ('Dimlama', 20000, 1);
insert into products (name, price, type_register_id) values ('Osh', 18000, 1), ('Lag''mon', 12000, 1), ('Dimlama', 20000, 1);

-- Product Name

select
    p.name
from 
    type_register as r
natural join
    products as p
where
    r.type_register_id = 1 and r.category_id = 1
;

insert into components (name) values ('Sabzi'), ('Guruch'), ('Kartoshka'), ('Go''sht'), ('Piyoz'), ('Karam');

insert into ingredients (product_id, component_id, weight) values (1, 1, 1000), 
(1, 2, 1300), 
(1, 4, 400), 
(2, 1, 700),
(2, 6, 1000),
(2, 5, 300),
(3, 3, 2000),
(3, 4, 1000),
(3, 5, 900),
(3, 6, 850);

-- Components Name

select
    c.name
from
    ingredients as i
natural join
    components as c
where
    i.product_id = 1
;


insert into tables (number) values (1), (2), (3);

insert into orders (table_id) values (2), (1), (3);

insert into order_details (quantity, order_id, product_id) values (2, 3, 1);
insert into order_details (order_id, product_id) values (3, 3);
insert into order_details (quantity, order_id, product_id) values (3, 1, 2);


update 
orders 
set closed_at = current_timestamp
where order_id = 2;


-- Max

select 
    count(o.quantity) as quantity,
    p.name
from
    order_details as o
natural join
    products as p
group by
    p.name
order by
    quantity desc
;

