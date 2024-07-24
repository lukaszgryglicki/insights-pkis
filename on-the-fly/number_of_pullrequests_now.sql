select
  current_timestamp()::date as now,
  count(distinct pull_request_id) as pull_requests
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
