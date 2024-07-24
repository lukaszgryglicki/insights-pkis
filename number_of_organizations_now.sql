select
  timestamp as now,
  value as organizations
from
  {{schema}}gold_insights.pkis
where
  metric = 'organizations'
  and type = 'now'
