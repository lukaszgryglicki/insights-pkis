select
  current_timestamp()::date as now,
  count(distinct issue_id) as issues
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
