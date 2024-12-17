use restaurant_db;
select * from order_details;
select * from menu_items;

select 
order_id,
 item_id,
 item_name,
 category,
order_date,
order_time,
price
from order_details o  inner join menu_items m  on o.item_id=m.menu_item_id
where order_id=4;

select
count(item_id),
sum(price),
category
from order_details o  inner join menu_items m  on o.item_id=m.menu_item_id
where order_id=2
group by category;




select
count(item_id),
sum(price),
category
from order_details o  inner join menu_items m  on o.item_id=m.menu_item_id
where order_id in (4305,443,3473, 440,2075,1957,330,2675)
group by category;




select 
order_id,
count(item_id)
from order_details o  inner join menu_items m  on o.item_id=m.menu_item_id
group by order_id
order by count(item_id) desc

