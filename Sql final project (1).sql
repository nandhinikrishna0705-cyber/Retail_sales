create database final;
select * from final.categories;
select * from final.customers;
select * from final.order_items;
select * from final.orders;
select * from final.products;
select * from final.staffs;
select * from final.stocks;
select * from final.stores;
select * from final.order_items;

#task3
select * from orders as A
inner join order_items as B
on A.order_id=B.order_id
inner join products as C
on B.product_id=C.product_id;

#task4
select * from final.stores;
select A.store_id,C.store_name,sum(B.total_price) as total_sales
from orders as A
inner join order_items as B on A.order_id=B.order_id
inner join stores as C on A.store_id=c.store_id
group by A.store_id,C.store_name
order by total_sales desc;

#task5
select B.product_id,B.product_name, count(a.quantity) as total_sold
from order_items as A
inner join products as B 
on A.product_id=B.product_id
group by B.product_id,B.product_name
order by total_sold desc 
limit 5;

#task6
select A.customer_id,A.first_name, count(B.order_id) as total_orders,
sum(C.quantity) as total_items, sum(C.total_price) as total_revenue
from customers as A
inner join orders as B on A.customer_id=B.customer_id
inner join order_items as C on b.order_id=C.order_id
group by A.customer_id,A.first_name
order by total_revenue desc;

#task7
select A.customer_id,A.first_name, sum(C.total_price) as total_spent,
case
when sum(C.total_price) < 500 then "low"
when sum(c.total_price) < 200 then "medium"
else "high"
end as segment
from customers as A
inner join orders as b on A.customer_id=B.customer_id
inner join order_items as C on B.order_id=C.order_id
group by A.customer_id,A.first_name
order by total_spent;

#Task8
select A.staff_id,A.first_name,
sum(C.total_price) as total_revenue
from staffs as A
inner join orders as B on A.staff_id=B.staff_id
inner join order_items as C on B.order_id=C.order_id
group by A.staff_id,A.first_name
order by total_revenue;

#Task 9
select A.product_id,A.product_name,B.quantity from products as A
inner join stocks as B on A.product_id=B.product_id
where B.quantity < 10
order by B.quantity desc;

#task10
create table customer_segments
(segment_id int primary key,
customer_id int,
total_spent varchar(50),
total_orders int,
total_items int,
segment varchar(50));

select * from finalproject;