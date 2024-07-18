select
  r.{{range}}::date as {{range}},
  count(distinct c.organization_id) as contributors
from
  {{schema}}silver_fact.code_contributions c
inner join
  {{schema}}bronze_fivetran_crowd_dev.organizations o
on
  c.organization_id = o.organization_id
inner join
  {{range}}s r
on
  o.created_at <= r.{{range}}
where
  not c.member_is_bot
group by
  {{range}}
order by
  {{range}} asc
