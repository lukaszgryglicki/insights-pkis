select
  current_timestamp()::date as now,
  count(distinct commit_id) as commits
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
