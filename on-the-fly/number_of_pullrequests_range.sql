select
  r.{{range}}::date as {{range}},
  count(distinct c.pull_request_id) as pull_requests
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
