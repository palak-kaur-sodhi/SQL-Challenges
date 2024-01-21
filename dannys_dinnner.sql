# 1. What is the total amount each customer spent at the restaurant?
select customer_id, 
sum(price) as total_amount_spent
from sales s inner join menu m on s.product_id=m.product_id 
group by customer_id
order by customer_id;

# 2. How many days has each customer visited the restaurant?
select customer_id, 
count(distinct(order_date)) no_of_days
from sales
group by customer_id;

-- Other way to solve problem 2
with cte as 
(select customer_id, 
row_number() over(partition by customer_id) as rn
from sales s
group by customer_id, order_date)

select customer_id,
max(rn) no_of_days
from cte
group by customer_id;

# 3. What was the first item from the menu purchased by each customer?
with cte as
(select s.customer_id,
s.order_date,
group_concat(distinct m.product_name separator ", ") as items_ordered,
row_number() over(partition by customer_id order by order_date) as rn
from sales s inner join menu m on s.product_id=m.product_id
group by s.customer_id, s.order_date)

select customer_id,
items_ordered 
from cte
where rn=1;

-- Other way to solve problem 3
with cte_2 as
(select s.customer_id,
s.order_date,
m.product_name,
rank() over(partition by customer_id order by order_date) as rn
from sales s inner join menu m on s.product_id=m.product_id
group by s.customer_id, s.order_date, m.product_name)

select customer_id,
order_date,
product_name
from cte_2
where rn=1;

# 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select m.product_name, 
count(s.product_id) as item_count
from sales s inner join menu m on s.product_id=m.product_id
group by m.product_name 
order by item_count desc
limit 1;

# 5. Which item was the most popular for each customer?
with cte as
(select s.customer_id,
m.product_name,
count(s.product_id) as item_count,
rank() over(partition by customer_id order by count(s.product_id) desc) rnk
from sales s inner join menu m on s.product_id=m.product_id
group by s.customer_id, m.product_name)

select customer_id,
group_concat(product_name separator ", ") as most_popular_items,
item_count
from cte
where rnk=1
group by customer_id, item_count;

# 6. Which item was purchased first by the customer after they became a member?
with cte as 
(select s.customer_id,
s.order_date,
m1.join_date,
m2.product_name,
rank() over (partition by s.customer_id order by s.order_date) as rnk
from sales s 
inner join members m1 on s.customer_id=m1.customer_id
inner join menu m2 on s.product_id=m2.product_id
where s.order_date>=m1.join_date)

select customer_id,
product_name as items_purchased, 
order_date,
join_date as membership_date
from cte
where rnk=1;

# 7. Which item was purchased just before the customer became a member?
with cte as 
(select s.customer_id,
s.order_date,
m1.join_date,
m2.product_name,
rank() over (partition by s.customer_id order by s.order_date desc) as rnk
from sales s 
inner join members m1 on s.customer_id=m1.customer_id
inner join menu m2 on s.product_id=m2.product_id
where s.order_date<m1.join_date)

select customer_id,
group_concat(product_name separator ", ") as items_purchased, 
order_date,
join_date as membership_date
from cte
where rnk=1 group by customer_id,order_date, membership_date;

# 8. What is the total items and amount spent for each member before they became a member?

select s.customer_id,
count(m2.product_name) as items_purchased,
sum(m2.price) as amount_spent
from sales s 
inner join members m1 on s.customer_id=m1.customer_id
inner join menu m2 on s.product_id=m2.product_id
where s.order_date<m1.join_date
group by customer_id
order by customer_id;

# 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select s.customer_id,
sum(case
when m.product_name="sushi"
then 2*10 * m.price
else
10 * m.price
end)
as points_collected
from sales s inner join menu m on s.product_id=m.product_id
group by s.customer_id;


