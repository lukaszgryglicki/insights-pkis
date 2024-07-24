select
  current_timestamp()::date as now,
  count(distinct platform) as platforms
from
  {{schema}}bronze_fivetran_crowd_dev.activities
where
  platform != 'other'
