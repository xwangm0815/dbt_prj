with cop as (

    select * from {{ ref('customers_orders_payments') }}

),
final as (

    select
       *

    from cop

    where AMOUNT >= 1000

)

select * from final