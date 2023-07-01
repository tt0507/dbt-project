with
    source as (
        select * from {{ source("google_analytics_sample", "ga_sessions_20170601") }}
    )
select
    visitorid,
    visitnumber,
    visitid,
    visitstarttime,
    date,
    totals.visits,
    totals.hits,
    totals.pageviews,
    totals.timeonsite,
    trafficsource.source,
    trafficsource.medium,
    device.browser,
    device.operatingsystem,
    device.devicecategory,
    geonetwork.continent,
    geonetwork.subcontinent,
    geonetwork.country,
    fullvisitorid,
    socialengagementtype
from source
