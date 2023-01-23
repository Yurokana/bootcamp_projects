-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with


--fact order for whole month
CREATE TABLE orders (
  order_id INT primary key,
  order_date date,
  order_menu INT,
  order_customer INT,
  order_serve INT,
  order_payby INT,
  foreign key (order_menu) references menu (menu_id),
  foreign key (order_customer) references customers (customer_id),
  foreign key (order_serve) references employees(employee_id),
  foreign key (order_payby) references payby(payby_id)
);

INSERT INTO orders VALUES 
  (1, '2022-08-01',1,2,3,1),
  (2, '2022-08-02',12,5,5,2),
  (3, '2022-08-03',31,1,1,3),
  (4, '2022-08-04',5,3,2,1),
  (5, '2022-08-05',16,7,3,3),
  (6, '2022-08-06',27,8,2,2),
  (7, '2022-08-07',16,2,3,1),
  (8, '2022-08-08',33,4,2,2),
  (9, '2022-08-09',24,5,3,1),
  (10, '2022-08-10',28,7,1,2),
  (11, '2022-08-11',38,6,5,2),
  (12, '2022-08-12',17,7,3,1),
  (13, '2022-08-13',19,1,5,1),
  (14, '2022-08-14',6,7,3,3),
  (15, '2022-08-15',7,8,2,3),
  (16, '2022-08-16',14,4,1,1),
  (17, '2022-08-17',31,8,5,3),
  (18, '2022-08-18',21,3,5,2)
;

--dim1 employees
CREATE TABLE employees (
  employee_id INT primary key,
  employee_name text,
  employee_position text,
  employee_salary real
);

INSERT INTO employees VALUES 
  (1, 'Nine', 'Waiter', 12000),
  (2, 'Earth', 'Waiter', 11000),
  (3, 'Benze', 'Cashier and supreme waitress', 50000),
  (4, 'James', 'Chef', 24000),
  (5, 'Saeth', 'Super waiter',22000),
  (6, 'Boss', 'Manager',30000);

--dim2 menu
CREATE TABLE menu (
  menu_id INT primary key,
  menu_name text,
  menu_type int,
  menu_price real,
  foreign key (menu_type) references menutype (menutype_id)
);

insert into menu values
  (1, 'Salad', 1, 30),
  (2, 'French fries', 1, 25),
  (3, 'Mushroom soup', 1, 35),
  (4, 'Baked Spinach & Cheese', 1, 35),
  (5, 'Nachos', 1, 30),
  (6, 'Buffalo wing', 1, 35),
  (7, 'Jajangmyeon', 2, 40),
  (8, 'Hainanese Chicken Rice', 2, 50),
  (9, 'Spaghetti carbonara', 2, 50),
  (10, 'Angrybird sushi', 2, 40),
  (11, 'Tom yum kung', 2, 60),
  (12, 'Chicken biryani', 2, 60),
  (13, 'Pizza Margherita', 2, 70),
  (14, 'Macaroni with Spicy Mixed Seafood', 2, 50),
  (15, 'Miso Ramen', 2, 50),
  (16, 'Chashu-men', 2, 55),
  (17, 'Wagyu A7', 2, 100),
  (18, 'Rib-eye Steak', 2, 90),
  (19, 'Sirloin steak', 2, 90),
  (20, 'Lamb steak', 2, 75),
  (21, 'Khao soi', 2, 50),
  (22, 'Grass Jelly', 3, 15),
  (23, 'Cendol', 3, 15),
  (24, 'Random ice cream', 3, 10),
  (25, 'Honey toast', 3, 20),
  (26, 'Tiramisu', 3, 20),
  (27, 'Honey toast', 3, 20),
  (28, 'Douhua', 3, 15),
  (29, 'Bualoy', 3, 20),
  (30, 'Espresso', 4, 20),
  (31, 'Latte', 4, 20),
  (32, 'Mocha', 4, 20),
  (33, 'Hot Chocolate', 4, 20),
  (34, 'Caramel Macchiato', 4, 25),
  (35, 'Cappuccino', 4, 20),
  (36, 'Lime Juice', 5, 15),
  (37, 'Orange Juice', 5, 15),
  (38, 'Coconut Water', 5, 15),
  (39, 'Apple Juice', 5, 15),
  (40, 'Bubble tea', 5, 15)
  ;

--dim3 menutype
CREATE TABLE menutype (
  menutype_id INT primary key,
  menutype_name text
);

INSERT INTO menutype VALUES
  (1,'Appetizer'),
  (2,'Main dish'),
  (3,'Dessert'),
  (4,'Hot Drink'),
  (5,'Cold Drink')
  ;
  
--dim4 customer
CREATE TABLE customers (
  customer_id INT primary key,
  customer_name TEXT,
  customer_gender TEXT,
  customer_type TEXT
);

INSERT INTO customers VALUES 
  (1,'Wang','Male','Regular'),
  (2,'Pupe','Female','Regular'),
  (3,'Saitama','Male','Regular'),
  (4,'Dahyeon','Female','Silver'),
  (5,'Naruto','Male','Silver'),
  (6,'Miru','Female','Silver'),
  (7,'Son Heung-min','Male','Gold'),
  (8,'Jisoo','Female','Gold')
  ;

--dim5 payby
CREATE TABLE payby (
  payby_id INT primary key,
  payby_currency TEXT,
  payby_network TEXT
);

INSERT INTO payby VALUES 
  (1,'THB','Hand'),
  (2,'THB','Online Banking'),
  (3,'THB','Blockchain')
  ;
  
-- sqlite command
.mode markdown
.header on 


with sub as (
  select *
  from orders
  join employees on orders.order_serve = employees.employee_id
  join menu on orders.order_menu = menu.menu_id
  join customers on orders.order_customer = customers.customer_id
  join payby on orders.order_payby = payby_id
  join menutype on menutype.menutype_id = menu.menu_type
)



--How much and avg.female customer pay for our shop
select sum(menu_price) as total_female_pay, avg(menu_price) as avg_female_pay
from sub
where customer_gender = 'Female'


/*
--top 7 most expensive main dish
select distinct menu_name, menutype_name, menu_price
  from menu
  join menutype on menutype.menutype_id = menu.menu_type
  where menutype_name = 'Main dish'
  order by menu_price desc
  limit 7;
*/

/*
--  populay food type
select  count(*),menutype_name
from sub
group by menutype_name
order by count(*) desc
*/

/*
--pay by each payment method before 2022-08-10
select payby_network, sum(menu_price)
  from sub
  where order_date < '2022-08-10'
  group by payby_network
*/

/*
--who in start with J
with name2 as (select customer_name as name from customers),
name1 as (select employee_name as name from employees)
  
select name from name2
where name like 'J%'
union all
select name from name1
where name like 'J%';

select customer_name as name from customers
where name like 'J%'
union all
select employee_name as name from employees
where name like 'J%';
*/
