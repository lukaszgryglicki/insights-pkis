select
  timestamp as now,
  value as platforms
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'platforms'
  and type = 'now'
