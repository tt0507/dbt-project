SELECT 
  date,
  operatingsystem,
  devicecategory,
  browser,
  COUNT(*) agg_count
FROM {{ref("int_ga__union_all_data")}}
GROUP BY date, operatingsystem, devicecategory, browser
ORDER BY date