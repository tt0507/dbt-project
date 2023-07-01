WITH source AS (
    SELECT
        *
    FROM
        {{source('pypi', 'distribution_metadata')}}
)