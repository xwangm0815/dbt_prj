with 
customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }} p

),
final as (

    select 
    first_name, last_name, orderid, order_date, p.id payment_id, paymentmethod, amount,
        o.status order_status,
        p.status as payment_status

    from payments p, orders o, CUSTOMERS c
    where  p.orderid = o.order_id and o.customer_id = c.customer_id


)

select * from final