select
  r.{{range}}::date as {{range}},
  count(distinct c.commit_id) as commits
from
  {{schema}}silver_fact.code_contributions c
inner join
  {{range}}s r
on
  c.created_at <= r.{{range}}
where
  not c.member_is_bot
group by
  {{range}}
order by
  {{range}} asc
