select
  timestamp as now,
  value as projects
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'projects'
  and type = 'now'
