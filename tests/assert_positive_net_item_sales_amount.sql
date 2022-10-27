-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.

select
    order_key,
    sum(net_item_sales_amount) as net_item_sales_sum
from {{ ref('fct_orders') }}
group by order_key
having not(net_item_sales_sum>= 0)