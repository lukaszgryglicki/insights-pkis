select
  current_timestamp()::date as now,
  count(distinct member_id || platform || github_or_member_username) as identities,
  count(distinct member_id) as contributors
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
