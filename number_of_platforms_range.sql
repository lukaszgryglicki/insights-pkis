select
  timestamp as {{range}},
  value as platforms,
from
  {{schema}}gold_insights.pkis
where
  metric = 'platforms'
  and type in ('{{range}}', 'now')
order by
  timestamp asc
