WITH source AS (
	SELECT *

	FROM {{ source('thelook_ecommerce', 'orders') }}
)

SELECT
	order_id,
	user_id,
	created_at,
	returned_at,
	delivered_at,
	shipped_at,
	status,
	num_of_item AS num_items_ordered

	{#- Unused columns:
		- gender
	#}
FROM source
