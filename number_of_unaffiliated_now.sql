with data as (
  select
    current_timestamp()::date as now,
    count(distinct member_id) as all_contributors,
    count(distinct contribution_id) as all_contributions,
    count(distinct case when organization_id is null then member_id end) as unaffiliated_contributors,
    count(distinct case when organization_id is null then contribution_id end) as unaffiliated_contributions
  from
    {{schema}}silver_fact.code_contributions
  where
    not member_is_bot
)
select
  *,
  100.0* (unaffiliated_contributors / all_contributors) as percent_unaffiliated_contributors,
  100.0* (unaffiliated_contributions / all_contributions) as percent_unaffiliated_contributions
from
  data
