WITH analytics_data AS (
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170101")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170201")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170301")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170401")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170501")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170601")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170701")}})
    UNION ALL
    (SELECT
        *
    FROM
        {{ref("stg_ga__session20170801")}})
)
SELECT
    *
FROM
    analytics_data