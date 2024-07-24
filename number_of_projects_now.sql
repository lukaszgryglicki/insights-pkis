select
  timestamp as now,
  value as projects
from
  {{schema}}gold_insights.pkis
where
  metric = 'projects'
  and type = 'now'
