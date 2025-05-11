{% macro discounted_amount(extended_price, discount_percetage, scale=2) %}
    -- ({{ column_name }} / 100)::numeric(16, {{ scale }})
    (-1 * {{ extended_price }} * {{ discount_percetage }})::decimal(16, {{ scale }})
{% endmacro %}
