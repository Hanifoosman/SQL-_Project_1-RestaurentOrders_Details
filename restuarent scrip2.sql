use restaurant_db;
select * from order_details;

select 
order_id,
sum(price)
from order_details o inner join 
menu_items m on o.item_id =m.menu_item_id
group by order_id
order by sum(price) desc
limit 5;

select 
order_id,
item_name,
category,
(price)
from order_details  o inner join menu_items m on o.item_id =m.menu_item_id
where order_id =440




