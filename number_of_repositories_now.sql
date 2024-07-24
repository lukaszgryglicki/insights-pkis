select
  timestamp as now,
  value as repositories
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'repositories'
  and type = 'now'
