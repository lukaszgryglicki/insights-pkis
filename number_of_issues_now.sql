select
  timestamp as now,
  value as issues
from
  {{schema}}gold_insights.pkis
where
  metric = 'issues'
  and type = 'now'
