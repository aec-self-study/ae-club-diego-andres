select
  customers.id as customer_id,
  customers.name,
  customers.email,
  min(orders.created_at) as first_order_at,
  count(*) as number_of_orders
from `analytics-engineers-club.coffee_shop.customers` as customers
left join `analytics-engineers-club.coffee_shop.orders` as orders
  on customers.id = orders.customer_id
group by 1,2,3;

