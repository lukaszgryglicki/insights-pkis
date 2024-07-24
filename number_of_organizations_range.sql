select
  timestamp as {{range}},
  value as organizations,
from
  {{schema}}gold_insights.pkis
where
  metric = 'organizations'
  and type in ('{{range}}', 'now')
order by
  timestamp asc
