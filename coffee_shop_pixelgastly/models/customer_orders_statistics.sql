with

customers as (
    select * from {{ ref('customers') }}
),

median_orders as (
    select
        number_of_orders,
        percentile_cont(number_of_orders, 0.5) over () as median_number_of_orders
    from customers
),

average_orders as (
    select
        median_number_of_orders,
        avg(number_of_orders) as average_number_of_orders
    from median_orders
    group by 1
)

select * from average_orders
