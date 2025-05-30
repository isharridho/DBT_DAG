SELECT
    line_items.order_item_key,
    line_items.part_key,
    line_items.line_number,
    line_items.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    {{discounted_amount('line_items.extended_price', 'line_items.discount_percetage')}} AS item_discount_amount
FROM
    {{ ref('stg_tpch_orders') }} as orders
JOIN
    {{ ref('stg_tpch_line_items') }} as line_items
        ON orders.order_key = line_items.order_key  
order by
    orders.order_date