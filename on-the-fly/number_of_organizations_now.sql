select
  current_timestamp()::date as now,
  count(distinct organization_id) as organizations
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
