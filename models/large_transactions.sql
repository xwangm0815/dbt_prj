{% set amount_threshold = 2000 %} 

with
    cop as (select * from {{ ref("customers_orders_payments") }}),
    final as (select * from cop where amount >= {{ amount_threshold }})

select *
from final
