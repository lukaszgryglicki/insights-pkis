,data as (
  select
    r.{{range}}::date as {{range}},
    count(distinct c.member_id) as all_contributors,
    count(distinct c.contribution_id) as all_contributions,
    count(distinct case when c.organization_id is null then c.member_id end) as unaffiliated_contributors,
    count(distinct case when c.organization_id is null then c.contribution_id end) as unaffiliated_contributions
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
)

select
  *,
  100.0* (unaffiliated_contributors / all_contributors) as percent_unaffiliated_contributors,
  100.0* (unaffiliated_contributions / all_contributions) as percent_unaffiliated_contributions
from
  data
