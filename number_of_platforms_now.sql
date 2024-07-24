select
  timestamp as now,
  value as platforms
from
  {{schema}}gold_insights.pkis
where
  metric = 'platforms'
  and type = 'now'
