select
  timestamp as now,
  value as pullrequests
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis
where
  metric = 'pullrequests'
  and type = 'now'
