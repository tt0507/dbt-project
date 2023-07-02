select
    date,
    sum(visits) sum_visits,
    sum(hits) sum_hits,
    sum(pageviews) sum_pageviews,
    sum(timeonsite) sum_timeonsite
from `fleet-garage-391004.gloud_google_analytics.int_ga__union_all_data`
group by date
order by date
