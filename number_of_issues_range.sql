select
  timestamp as {{range}},
  value as issues,
from
  {{schema}}gold_insights.pkis
where
  metric = 'issues'
  and type in ('{{range}}', 'now')
order by
  timestamp asc
