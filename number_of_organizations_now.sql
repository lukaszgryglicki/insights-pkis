select
  timestamp as now,
  value as organizations
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'organizations'
  and type = 'now'
