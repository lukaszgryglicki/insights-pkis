select
  timestamp as {{range}},
  value as pullrequests,
from
  {{schema}}gold_insights.pkis
where
  metric = 'pullrequests'
  and type in ('{{range}}', 'now')
order by
  timestamp asc
