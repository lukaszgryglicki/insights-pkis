select
  timestamp as now,
  value as pullrequests
from
  {{schema}}gold_insights.pkis
where
  metric = 'pullrequests'
  and type = 'now'
