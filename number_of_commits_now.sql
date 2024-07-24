select
  timestamp as now,
  value as commits
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'commits'
  and type = 'now'
