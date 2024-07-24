select
  timestamp as now,
  value as repositories
from
  {{schema}}gold_insights.pkis
where
  metric = 'repositories'
  and type = 'now'
