{% set top_n = 5 %}

with
    cop as (select * from {{ ref("customers_orders_payments") }}),
    customer_totals as (
        select
            customer_id,           
            first_name,
            last_name,
            sum(amount) as total_amount
        from cop
        group by customer_id,first_name,last_name
    ),
    ranked_customers as (
        select
            customer_id, first_name,last_name,
            total_amount,
            row_number() over (order by total_amount desc) as rank
        from customer_totals
    )

select
    customer_id, first_name,last_name,
    total_amount
from ranked_customers
where rank <= {{ top_n }}
