select
  -- extract({{range}} from r.{{range}}) as {{range}},
  r.{{range}}::date as {{range}},
  count(distinct c.member_id) as contributors
from
  analytics.silver_fact.code_contributions c
inner join
  {{range}}s r
on
  c.activity_ts <= r.{{range}}
where
  not c.member_is_bot
group by
  {{range}}
order by
  {{range}} asc
