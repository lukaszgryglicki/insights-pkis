select
  timestamp as now,
  value as issues
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'issues'
  and type = 'now'
