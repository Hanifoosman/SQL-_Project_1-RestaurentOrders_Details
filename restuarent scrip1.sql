
use restaurant_db;
show tables;


/* 1 find the number of items on the menu */
SELECT 
count(*) from menu_items;

/* 2 a) what are the least and the most expensive items on the menu */
SELECT 
item_name,   min(price) as leastItems 
from menu_items
 group by item_name
 order by 2 asc;
 /* 2 a) what are the least and the most expensive items on the menu */
 SELECT 
 item_name,
 category,
 price
 from menu_items 
 order by 3 asc;
 
/* 3) 
what are the least most expenisvive most expensive italian dishes on menu  */
 select 
 item_name,
 max(price) as mostEXPENSIVE
 from menu_items
 where category='Italian'
 group by item_name
 order by max(price) desc
 limit 1;
 
 
 /* 4) how many dishes are each category */
 
    select 
    category,
    count(*)
   from menu_items
  group by category;
   
   /* 5 what is the average dish price in each categegory */
    
     select 
     category,
     avg(price) as average_dishprice from menu_items 
     group by category;
     
	select * from  menu_items;
    /* 7 view order_details table*/
   select * from  order_details;
   
  /* 8) what is the date range of the table */
   select min(order_date ) , max(order_date) from order_details ;
   
   /* 9) how many orders were made within these date */
     select 
     count(  DISTINCT order_id) 
     from order_details;
      
 /*  10 ) which order had the most number of  items */
 
 select 
 order_id,
 count(item_id) as NumberofItems
 from order_details
  group by order_id
 order by 2 desc;
 
  /*  10 ) how many orders had more 12  items */
               
 select 
 order_id,
count(item_id) as NumberofItems
from order_details
 group by order_id
having  NumberofItems >12;
 
 
 /*  1) combine the menu_items and order_details into single table*/
   
    select 
    *
    from menu_items a  inner join 
     order_details  b  on a.menu_item_id=b.item_id;
 
 /* 2) what were the least and most ordered items ? what categories were they in */
     
     select * from order_details;
     select 
     item_name, 
     category,
 count(order_id) as number_ofpurchased
  from order_details od left join 
  menu_items mi on 
  od.item_id=mi.menu_item_id
  group by  item_name , category
  order by   number_ofpurchased desc;
 
 /* 3) what are the top 5 orders that spent most money */
select 
order_id,
sum(price)
from order_details od inner join  menu_items mi  on od.item_id =mi.menu_item_id
group by order_id 
order by sum(price) DESC
limit 5;
 
 
 /*  4 ) view the detailas of highest spend order  . what insights */
 
     select 
    *
    from menu_items a  inner join 
     order_details  b  on a.menu_item_id=b.item_id
     where order_id=440;
 
 
 