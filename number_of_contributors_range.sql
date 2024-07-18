select
  r.{{range}}::date as {{range}},
  count(distinct c.member_id) as contributors
from
  {{schema}}silver_fact.code_contributions c
inner join
  {{schema}}bronze_fivetran_crowd_dev.members m
on
  c.member_id = m.member_id
inner join
  {{range}}s r
on
  m.created_at <= r.{{range}}
where
  not c.member_is_bot
group by
  {{range}}
order by
  {{range}} asc
