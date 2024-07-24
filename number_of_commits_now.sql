select
  timestamp as now,
  value as commits
from
  {{schema}}gold_insights.pkis
where
  metric = 'commits'
  and type = 'now'
