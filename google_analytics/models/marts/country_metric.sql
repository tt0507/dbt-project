SELECT 
  date,
  continent,
  subcontinent,
  country,
  COUNT(*) agg_sum
FROM {{ref("int_ga__union_all_data")}}
GROUP BY date, continent, subcontinent, country
ORDER BY date