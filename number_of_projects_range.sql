select
  timestamp as {{range}},
  value as projects,
from
  {{schema}}gold_insights.pkis
where
  metric = 'projects'
  and type in ('{{range}}', 'now')
order by
  timestamp asc
