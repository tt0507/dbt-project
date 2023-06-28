WITH

-- Aggregate measures
order_item_measures AS (
	SELECT
		order_id,
		SUM(item_sale_price) AS total_sale_price,
		SUM(product_cost) AS total_product_cost,
		SUM(item_profit) AS total_profit,
		SUM(item_discount) AS total_discount,

		{%- set departments = ['Men', 'Women'] -%}
		{%- for department_name in departments %}
		SUM(IF(product_department = '{{department_name}}', item_sale_price, 0)) AS total_sold_{{department_name.lower()}}swear{% if not loop.last %},{% endif -%}
		{% endfor %}

	FROM {{ ref('int_ecommerce__order_items_products') }}
	GROUP BY 1
)

SELECT
	od.order_id,
	od.created_at AS order_created_at,
	{{ is_weekend('od.created_at') }} AS order_was_created_on_weekend, -- Macro
	od.shipped_at AS order_shipped_at,
	od.delivered_at AS order_delivered_at,
	od.returned_at AS order_returned_at,
	od.status AS order_status,
	od.num_items_ordered,
	om.total_sale_price,
	om.total_product_cost,
	om.total_profit,
	om.total_discount,

FROM {{ ref('stg_ecommerce__orders') }} AS od
LEFT JOIN order_item_measures AS om
	ON od.order_id = om.order_id
LEFT JOIN {{ ref('int_ecommerce__first_order_created') }} AS user_data
	ON od.user_id = user_data.user_id
